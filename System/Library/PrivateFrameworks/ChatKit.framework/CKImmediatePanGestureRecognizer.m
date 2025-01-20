@interface CKImmediatePanGestureRecognizer
- (void)finishCurrentInteraction;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation CKImmediatePanGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CKImmediatePanGestureRecognizer;
  [(CKImmediatePanGestureRecognizer *)&v5 touchesBegan:a3 withEvent:a4];
  [(CKImmediatePanGestureRecognizer *)self setState:1];
}

- (void)finishCurrentInteraction
{
}

@end