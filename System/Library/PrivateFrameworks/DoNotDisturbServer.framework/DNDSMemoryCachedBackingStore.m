@interface DNDSMemoryCachedBackingStore
- (DNDSCachedBackingStoreDelegate)delegate;
- (DNDSMemoryCachedBackingStore)initWithUnderlyingBackingStore:(id)a3;
- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6;
- (id)readRecordWithError:(id *)a3;
- (unint64_t)writeRecord:(id)a3 error:(id *)a4;
- (unint64_t)writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5;
- (void)purgeCache;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSMemoryCachedBackingStore

- (id)readRecordWithError:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_cache)
  {
    v6 = [(DNDSBackingStore *)self->_underlyingBackingStore readRecordWithError:a3];
    cache = self->_cache;
    self->_cache = v6;
  }
  os_unfair_lock_unlock(p_lock);
  v8 = self->_cache;
  return v8;
}

- (DNDSMemoryCachedBackingStore)initWithUnderlyingBackingStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSMemoryCachedBackingStore;
  v6 = [(DNDSMemoryCachedBackingStore *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_underlyingBackingStore, a3);
    [v5 setDelegate:v7];
    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (unint64_t)writeRecord:(id)a3 error:(id *)a4
{
  return [(DNDSMemoryCachedBackingStore *)self writeRecord:a3 writePartition:1 error:a4];
}

- (unint64_t)writeRecord:(id)a3 writePartition:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  if ([(DNDSBackingStoreRecord *)self->_cache isEqual:v8])
  {
    unint64_t v9 = 1;
  }
  else
  {
    v10 = (DNDSBackingStoreRecord *)[v8 copyWithZone:0];
    cache = self->_cache;
    self->_cache = v10;

    unint64_t v9 = [(DNDSBackingStore *)self->_underlyingBackingStore writeRecord:v8 writePartition:v6 error:a5];
  }
  os_unfair_lock_unlock(&self->_lock);

  return v9;
}

- (void)purgeCache
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cache = self->_cache;
  self->_cache = 0;

  os_unfair_lock_unlock(p_lock);
}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a3;
  v12 = [(DNDSMemoryCachedBackingStore *)self delegate];
  v13 = [v12 backingStore:v11 migrateDictionaryRepresentation:v10 fromVersionNumber:a5 toVersionNumber:a6];

  return v13;
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
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_underlyingBackingStore, 0);
}

@end