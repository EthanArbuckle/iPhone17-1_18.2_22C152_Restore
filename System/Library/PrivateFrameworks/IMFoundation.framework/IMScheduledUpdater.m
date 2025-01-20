@interface IMScheduledUpdater
- (BOOL)isHoldingUpdates;
- (BOOL)isHoldingUpdatesForKey:(id)a3;
- (IMScheduledUpdater)initWithTarget:(id)a3 action:(SEL)a4;
- (NSCountedSet)holdingUpdatesKeys;
- (id)description;
- (void)beginHoldingUpdatesForKey:(id)a3;
- (void)dealloc;
- (void)endHoldingUpdatesForAllKeys;
- (void)endHoldingUpdatesForKey:(id)a3;
- (void)invalidate;
- (void)setHoldingUpdatesKeys:(id)a3;
- (void)setNeedsUpdate;
- (void)updateIfNeeded;
@end

@implementation IMScheduledUpdater

- (IMScheduledUpdater)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IMScheduledUpdater;
  v7 = [(IMScheduledUpdater *)&v17 init];
  v10 = v7;
  if (v7)
  {
    objc_msgSend_setTarget_(v7, v8, (uint64_t)v6, v9);
    objc_msgSend_setAction_(v10, v11, (uint64_t)a4, v12);
    id v13 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
    objc_msgSend_setHoldingUpdatesKeys_(v10, v14, (uint64_t)v13, v15);
  }
  return v10;
}

- (void)setHoldingUpdatesKeys:(id)a3
{
}

- (void)setNeedsUpdate
{
  if ((objc_msgSend_needsUpdate(self, a2, v2, v3) & 1) == 0)
  {
    objc_msgSend_setNeedsUpdate_(self, v5, 1, v6);
    if ((objc_msgSend_isHoldingUpdates(self, v7, v8, v9) & 1) == 0)
    {
      objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], v10, (uint64_t)self, (uint64_t)sel_updateIfNeeded, 0);
      objc_msgSend_performSelector_withObject_afterDelay_(self, v11, (uint64_t)sel_updateIfNeeded, 0, 0.0);
    }
  }
}

- (void)updateIfNeeded
{
  if ((objc_msgSend_isHoldingUpdates(self, a2, v2, v3) & 1) == 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)IMScheduledUpdater;
    [(IMManualUpdater *)&v5 updateIfNeeded];
  }
}

- (BOOL)isHoldingUpdates
{
  v4 = objc_msgSend_holdingUpdatesKeys(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_count(v4, v5, v6, v7) != 0;

  return v8;
}

- (NSCountedSet)holdingUpdatesKeys
{
  return self->_holdingUpdatesKeys;
}

- (void)dealloc
{
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], a2, (uint64_t)self, (uint64_t)sel_updateIfNeeded, 0);
  objc_msgSend_invalidate(self, v3, v4, v5);
  v6.receiver = self;
  v6.super_class = (Class)IMScheduledUpdater;
  [(IMScheduledUpdater *)&v6 dealloc];
}

- (id)description
{
  uint64_t v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IMScheduledUpdater;
  uint64_t v4 = [(IMManualUpdater *)&v13 description];
  BOOL v8 = objc_msgSend_holdingUpdatesKeys(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ holdingUpdatesKeys:%@", v10, v4, v8);

  return v11;
}

- (void)beginHoldingUpdatesForKey:(id)a3
{
  id v4 = a3;
  objc_msgSend_holdingUpdatesKeys(self, v5, v6, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v10, v8, (uint64_t)v4, v9);
}

- (void)endHoldingUpdatesForKey:(id)a3
{
  id v4 = a3;
  BOOL v8 = objc_msgSend_holdingUpdatesKeys(self, v5, v6, v7);
  objc_msgSend_removeObject_(v8, v9, (uint64_t)v4, v10);

  if ((objc_msgSend_isHoldingUpdates(self, v11, v12, v13) & 1) == 0
    && objc_msgSend_needsUpdate(self, v14, v15, v16))
  {
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], v17, (uint64_t)self, (uint64_t)sel_updateIfNeeded, 0);
    objc_msgSend_performSelector_withObject_afterDelay_(self, v18, (uint64_t)sel_updateIfNeeded, 0, 0.0);
  }
}

- (void)endHoldingUpdatesForAllKeys
{
  uint64_t v5 = objc_msgSend_holdingUpdatesKeys(self, a2, v2, v3);
  objc_msgSend_removeAllObjects(v5, v6, v7, v8);

  if (objc_msgSend_needsUpdate(self, v9, v10, v11))
  {
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], v12, (uint64_t)self, (uint64_t)sel_updateIfNeeded, 0);
    objc_msgSend_performSelector_withObject_afterDelay_(self, v13, (uint64_t)sel_updateIfNeeded, 0, 0.0);
  }
}

- (BOOL)isHoldingUpdatesForKey:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v8 = objc_msgSend_holdingUpdatesKeys(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_countForObject_(v8, v9, (uint64_t)v4, v10);

  BOOL v12 = v11 != 0;
  return v12;
}

- (void)invalidate
{
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], a2, (uint64_t)self, (uint64_t)sel_updateIfNeeded, 0);
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_(MEMORY[0x1E4FBA8A8], v3, (uint64_t)self, v4);
  objc_msgSend_setTarget_(self, v5, 0, v6);
  objc_msgSend_setAction_(self, v7, 0, v8);
}

- (void).cxx_destruct
{
}

@end