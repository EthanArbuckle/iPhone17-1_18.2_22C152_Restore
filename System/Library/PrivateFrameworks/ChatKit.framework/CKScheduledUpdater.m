@interface CKScheduledUpdater
- (BOOL)isHoldingUpdates;
- (BOOL)isHoldingUpdatesForKey:(id)a3;
- (BOOL)updateSynchronouslyIfPossible;
- (CKScheduledUpdater)initWithTarget:(id)a3 action:(SEL)a4;
- (NSCountedSet)holdingUpdatesKeys;
- (id)description;
- (void)beginHoldingUpdatesForKey:(id)a3;
- (void)dealloc;
- (void)endHoldingAllUpdates;
- (void)endHoldingAllUpdatesForKey:(id)a3;
- (void)endHoldingUpdatesForKey:(id)a3;
- (void)invalidate;
- (void)setHoldingUpdatesKeys:(id)a3;
- (void)setNeedsUpdate;
- (void)setUpdateSynchronouslyIfPossible:(BOOL)a3;
- (void)updateIfNeeded;
@end

@implementation CKScheduledUpdater

- (void)dealloc
{
  [(CKScheduledUpdater *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)CKScheduledUpdater;
  [(CKScheduledUpdater *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)CKScheduledUpdater;
  v4 = [(CKManualUpdater *)&v10 description];
  BOOL v5 = [(CKManualUpdater *)self needsUpdate];
  BOOL v6 = [(CKScheduledUpdater *)self isHoldingUpdates];
  v7 = [(CKScheduledUpdater *)self holdingUpdatesKeys];
  v8 = [v3 stringWithFormat:@"%@ needsUpdate:%d isHoldingUpdates:%d holdingUpdatesKeys:%@", v4, v5, v6, v7];

  return v8;
}

- (CKScheduledUpdater)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKScheduledUpdater;
  v7 = [(CKScheduledUpdater *)&v11 init];
  v8 = v7;
  if (v7)
  {
    [(CKManualUpdater *)v7 setTarget:v6];
    [(CKManualUpdater *)v8 setAction:a4];
    id v9 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    [(CKScheduledUpdater *)v8 setHoldingUpdatesKeys:v9];
  }
  return v8;
}

- (void)setNeedsUpdate
{
  if (![(CKManualUpdater *)self needsUpdate])
  {
    [(CKManualUpdater *)self setNeedsUpdate:1];
    if (![(CKScheduledUpdater *)self isHoldingUpdates])
    {
      if ([(CKScheduledUpdater *)self updateSynchronouslyIfPossible])
      {
        [(CKScheduledUpdater *)self updateIfNeeded];
      }
      else
      {
        [(CKScheduledUpdater *)self performSelector:sel_updateIfNeeded withObject:0 afterDelay:0.0];
      }
    }
  }
}

- (void)beginHoldingUpdatesForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CKScheduledUpdater *)self holdingUpdatesKeys];
  [v5 addObject:v4];
}

- (void)endHoldingUpdatesForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(CKScheduledUpdater *)self holdingUpdatesKeys];
  [v5 removeObject:v4];

  if (![(CKScheduledUpdater *)self isHoldingUpdates]
    && [(CKManualUpdater *)self needsUpdate])
  {
    [(CKScheduledUpdater *)self performSelector:sel_updateIfNeeded withObject:0 afterDelay:0.0];
  }
}

- (BOOL)isHoldingUpdates
{
  v2 = [(CKScheduledUpdater *)self holdingUpdatesKeys];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isHoldingUpdatesForKey:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(CKScheduledUpdater *)self holdingUpdatesKeys];
  uint64_t v6 = [v5 countForObject:v4];

  BOOL v7 = v6 != 0;
  return v7;
}

- (void)updateIfNeeded
{
  if (![(CKScheduledUpdater *)self isHoldingUpdates])
  {
    v3.receiver = self;
    v3.super_class = (Class)CKScheduledUpdater;
    [(CKManualUpdater *)&v3 updateIfNeeded];
  }
}

- (void)invalidate
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  [(CKManualUpdater *)self setTarget:0];

  [(CKManualUpdater *)self setAction:0];
}

- (void)endHoldingAllUpdatesForKey:(id)a3
{
  id v7 = a3;
  id v4 = [(CKScheduledUpdater *)self holdingUpdatesKeys];
  uint64_t v5 = [v4 countForObject:v7];

  for (; v5; --v5)
  {
    uint64_t v6 = [(CKScheduledUpdater *)self holdingUpdatesKeys];
    [v6 removeObject:v7];
  }
  if (![(CKScheduledUpdater *)self isHoldingUpdates]
    && [(CKManualUpdater *)self needsUpdate])
  {
    [(CKScheduledUpdater *)self performSelector:sel_updateIfNeeded withObject:0 afterDelay:0.0];
  }
}

- (void)endHoldingAllUpdates
{
  objc_super v3 = [(CKScheduledUpdater *)self holdingUpdatesKeys];
  [v3 removeAllObjects];

  if (![(CKScheduledUpdater *)self isHoldingUpdates]
    && [(CKManualUpdater *)self needsUpdate])
  {
    [(CKScheduledUpdater *)self performSelector:sel_updateIfNeeded withObject:0 afterDelay:0.0];
  }
}

- (NSCountedSet)holdingUpdatesKeys
{
  return self->_holdingUpdatesKeys;
}

- (void)setHoldingUpdatesKeys:(id)a3
{
}

- (BOOL)updateSynchronouslyIfPossible
{
  return self->_updateSynchronouslyIfPossible;
}

- (void)setUpdateSynchronouslyIfPossible:(BOOL)a3
{
  self->_updateSynchronouslyIfPossible = a3;
}

- (void).cxx_destruct
{
}

@end