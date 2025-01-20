@interface CKManualUpdater
- (BOOL)needsUpdate;
- (CKManualUpdater)initWithTarget:(id)a3 action:(SEL)a4;
- (SEL)action;
- (id)description;
- (id)target;
- (void)setAction:(SEL)a3;
- (void)setNeedsUpdate;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setTarget:(id)a3;
- (void)updateIfNeeded;
@end

@implementation CKManualUpdater

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CKManualUpdater;
  v4 = [(CKManualUpdater *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@ needsUpdate:%d", v4, -[CKManualUpdater needsUpdate](self, "needsUpdate")];

  return v5;
}

- (CKManualUpdater)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKManualUpdater;
  objc_super v7 = [(CKManualUpdater *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(CKManualUpdater *)v7 setTarget:v6];
    [(CKManualUpdater *)v8 setAction:a4];
  }

  return v8;
}

- (void)setNeedsUpdate
{
  if (![(CKManualUpdater *)self needsUpdate])
  {
    [(CKManualUpdater *)self setNeedsUpdate:1];
  }
}

- (void)updateIfNeeded
{
  if ([(CKManualUpdater *)self needsUpdate])
  {
    [(CKManualUpdater *)self setNeedsUpdate:0];
    id v3 = [(CKManualUpdater *)self target];
    objc_msgSend(v3, "performSelector:", -[CKManualUpdater action](self, "action"));
  }
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (void)setTarget:(id)a3
{
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

- (void)setAction:(SEL)a3
{
  if (a3) {
    id v3 = a3;
  }
  else {
    id v3 = 0;
  }
  self->_action = v3;
}

- (void).cxx_destruct
{
}

@end