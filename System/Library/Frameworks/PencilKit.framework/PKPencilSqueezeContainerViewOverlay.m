@interface PKPencilSqueezeContainerViewOverlay
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation PKPencilSqueezeContainerViewOverlay

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = v7;
  if (v7
    && objc_msgSend(v7, "PK_isEventFromPencil")
    && [v8 type] != 11
    && (pencilHitTestWithEventHandler = (void (**)(id, void *, double, double))self->_pencilHitTestWithEventHandler) != 0)
  {
    v10 = pencilHitTestWithEventHandler[2](pencilHitTestWithEventHandler, v8, x, y);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)PKPencilSqueezeContainerViewOverlay;
    v11 = -[PKPencilSqueezeContainerViewOverlay hitTest:withEvent:](&v15, sel_hitTest_withEvent_, v8, x, y);
    hitTestHandler = (void (**)(id, void *, void *, double, double))self->_hitTestHandler;
    if (hitTestHandler)
    {
      hitTestHandler[2](hitTestHandler, v11, v8, x, y);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v13 = v11;
    }
    v10 = v13;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pencilHitTestWithEventHandler, 0);

  objc_storeStrong(&self->_hitTestHandler, 0);
}

@end