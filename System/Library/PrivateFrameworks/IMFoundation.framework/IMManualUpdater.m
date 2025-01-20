@interface IMManualUpdater
- (BOOL)needsUpdate;
- (IMManualUpdater)initWithTarget:(id)a3 action:(SEL)a4;
- (SEL)action;
- (id)description;
- (id)target;
- (void)setAction:(SEL)a3;
- (void)setNeedsUpdate;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setTarget:(id)a3;
- (void)updateIfNeeded;
@end

@implementation IMManualUpdater

- (void)setTarget:(id)a3
{
}

- (void)setAction:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_action = v3;
}

- (void)updateIfNeeded
{
  if (objc_msgSend_needsUpdate(self, a2, v2, v3))
  {
    objc_msgSend_setNeedsUpdate_(self, v5, 0, v6);
    objc_msgSend_target(self, v7, v8, v9);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = objc_msgSend_action(self, v10, v11, v12);
    objc_msgSend_performSelector_(v16, v14, v13, v15);
  }
}

- (void)setNeedsUpdate:(BOOL)a3
{
  *((unsigned char *)self + 24) = *((unsigned char *)self + 24) & 0xFE | a3;
}

- (BOOL)needsUpdate
{
  return *((unsigned char *)self + 24) & 1;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (id)description
{
  uint64_t v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IMManualUpdater;
  v4 = [(IMManualUpdater *)&v13 description];
  unsigned int v8 = objc_msgSend_needsUpdate(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ needsUpdate:%d", v10, v4, v8);

  return v11;
}

- (IMManualUpdater)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMManualUpdater;
  uint64_t v7 = [(IMManualUpdater *)&v14 init];
  uint64_t v10 = v7;
  if (v7)
  {
    objc_msgSend_setTarget_(v7, v8, (uint64_t)v6, v9);
    objc_msgSend_setAction_(v10, v11, (uint64_t)a4, v12);
  }

  return v10;
}

- (void)setNeedsUpdate
{
  if ((objc_msgSend_needsUpdate(self, a2, v2, v3) & 1) == 0)
  {
    objc_msgSend_setNeedsUpdate_(self, v5, 1, v6);
  }
}

- (void).cxx_destruct
{
}

@end