@interface HUTouchGestureRecognizer
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation HUTouchGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if ([a3 count] != 1) {
    [(HUTouchGestureRecognizer *)self setState:5];
  }

  [(HUTouchGestureRecognizer *)self setState:1];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

@end