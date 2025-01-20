@interface AXSBSideAppCustomAction
- (AXSBSideAppCustomAction)initWithName:(id)a3 gesture:(unint64_t)a4 target:(id)a5 selector:(SEL)a6;
- (unint64_t)gesture;
- (void)setGesture:(unint64_t)a3;
@end

@implementation AXSBSideAppCustomAction

- (AXSBSideAppCustomAction)initWithName:(id)a3 gesture:(unint64_t)a4 target:(id)a5 selector:(SEL)a6
{
  v10.receiver = self;
  v10.super_class = (Class)AXSBSideAppCustomAction;
  v7 = [(AXSBSideAppCustomAction *)&v10 initWithName:a3 target:a5 selector:a6];
  v8 = v7;
  if (v7) {
    [(AXSBSideAppCustomAction *)v7 setGesture:a4];
  }
  return v8;
}

- (unint64_t)gesture
{
  return self->_gesture;
}

- (void)setGesture:(unint64_t)a3
{
  self->_gesture = a3;
}

@end