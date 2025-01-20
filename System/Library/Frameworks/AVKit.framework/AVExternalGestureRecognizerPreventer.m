@interface AVExternalGestureRecognizerPreventer
- (AVExternalGestureRecognizerPreventer)initWithTarget:(id)a3 action:(SEL)a4;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation AVExternalGestureRecognizerPreventer

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  v4 = [a3 view];
  v5 = [(AVExternalGestureRecognizerPreventer *)self view];
  char v6 = [v4 isDescendantOfView:v5];

  if (v6) {
    return 0;
  }
  v8 = [(AVExternalGestureRecognizerPreventer *)self view];
  [(AVExternalGestureRecognizerPreventer *)self locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  v13 = [(AVExternalGestureRecognizerPreventer *)self view];
  v14 = objc_msgSend(v13, "hitTest:withEvent:", 0, v10, v12);

  if ([v14 conformsToProtocol:&unk_1F0965048])
  {
    v15 = [(AVExternalGestureRecognizerPreventer *)self view];
    objc_msgSend(v15, "convertPoint:toView:", v14, v10, v12);
    char v7 = objc_msgSend(v14, "avkit_shouldPreventExternalGestureRecognizerAtPoint:");
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (AVExternalGestureRecognizerPreventer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVExternalGestureRecognizerPreventer;
  v4 = [(AVExternalGestureRecognizerPreventer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4) {
    [(AVExternalGestureRecognizerPreventer *)v4 setCancelsTouchesInView:0];
  }
  return v5;
}

@end