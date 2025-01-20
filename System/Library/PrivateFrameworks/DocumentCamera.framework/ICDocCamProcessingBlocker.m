@interface ICDocCamProcessingBlocker
- (BOOL)blocked;
- (ICDocCamProcessingBlocker)initWithDelegate:(id)a3;
- (ICDocCamProcessingBlockerDelegate)delegate;
- (NSMutableSet)blockerSet;
- (void)addBlockerOfType:(id)a3 clearRectangles:(BOOL)a4 clearQueue:(BOOL)a5;
- (void)removeBlockerOfType:(id)a3;
- (void)setBlockerSet:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation ICDocCamProcessingBlocker

- (ICDocCamProcessingBlocker)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICDocCamProcessingBlocker;
  v5 = [(ICDocCamProcessingBlocker *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    blockerSet = v6->_blockerSet;
    v6->_blockerSet = v7;
  }
  return v6;
}

- (BOOL)blocked
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(ICDocCamProcessingBlocker *)v2 blockerSet];
  BOOL v4 = [v3 count] != 0;

  objc_sync_exit(v2);
  return v4;
}

- (void)addBlockerOfType:(id)a3 clearRectangles:(BOOL)a4 clearQueue:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v12 = a3;
  v8 = self;
  objc_sync_enter(v8);
  v9 = [(ICDocCamProcessingBlocker *)v8 blockerSet];
  [v9 addObject:v12];

  if (v6)
  {
    objc_super v10 = [(ICDocCamProcessingBlocker *)v8 delegate];
    [v10 clearRectangles];
  }
  if (v5)
  {
    v11 = [(ICDocCamProcessingBlocker *)v8 delegate];
    [v11 clearQueue];
  }
  objc_sync_exit(v8);
}

- (void)removeBlockerOfType:(id)a3
{
  id v6 = a3;
  BOOL v4 = self;
  objc_sync_enter(v4);
  BOOL v5 = [(ICDocCamProcessingBlocker *)v4 blockerSet];
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (ICDocCamProcessingBlockerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICDocCamProcessingBlockerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableSet)blockerSet
{
  return self->_blockerSet;
}

- (void)setBlockerSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockerSet, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end