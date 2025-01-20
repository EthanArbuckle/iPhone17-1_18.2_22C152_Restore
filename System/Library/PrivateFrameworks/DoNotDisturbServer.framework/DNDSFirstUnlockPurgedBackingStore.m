@interface DNDSFirstUnlockPurgedBackingStore
- (DNDSCachedBackingStoreDelegate)delegate;
- (DNDSFirstUnlockPurgedBackingStore)initWithUnderlyingBackingStore:(id)a3 keybag:(id)a4;
- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6;
- (id)readRecordWithError:(id *)a3;
- (unint64_t)writeRecord:(id)a3 error:(id *)a4;
- (unint64_t)writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5;
- (void)keybagDidUnlockForTheFirstTime:(id)a3;
- (void)purgeCache;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSFirstUnlockPurgedBackingStore

- (id)readRecordWithError:(id *)a3
{
  return (id)[(DNDSCachedBackingStore *)self->_underlyingBackingStore readRecordWithError:a3];
}

- (DNDSFirstUnlockPurgedBackingStore)initWithUnderlyingBackingStore:(id)a3 keybag:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DNDSFirstUnlockPurgedBackingStore;
  v9 = [(DNDSFirstUnlockPurgedBackingStore *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_underlyingBackingStore, a3);
    objc_storeStrong((id *)&v10->_keybag, a4);
    [(DNDSKeybagStateProviding *)v10->_keybag addPriorityObserver:v10];
    [v7 setDelegate:v10];
  }

  return v10;
}

- (unint64_t)writeRecord:(id)a3 error:(id *)a4
{
  return [(DNDSFirstUnlockPurgedBackingStore *)self writeRecord:a3 writePartition:1 error:a4];
}

- (unint64_t)writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5
{
  return [(DNDSCachedBackingStore *)self->_underlyingBackingStore writeRecord:a3 writePartition:a4 error:a5];
}

- (void)purgeCache
{
}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  objc_super v12 = [(DNDSFirstUnlockPurgedBackingStore *)self delegate];
  v13 = [v12 backingStore:v11 migrateDictionaryRepresentation:v10 fromVersionNumber:a5 toVersionNumber:a6];

  return v13;
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  [(DNDSCachedBackingStore *)self->_underlyingBackingStore purgeCache];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained cachedBackingStoreDidPurgeCache:self];
}

- (DNDSCachedBackingStoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSCachedBackingStoreDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_underlyingBackingStore, 0);
}

@end