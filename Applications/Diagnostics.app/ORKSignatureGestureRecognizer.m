@interface ORKSignatureGestureRecognizer
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (DrawingGestureRecognizerDelegate)eventDelegate;
- (void)setEventDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation ORKSignatureGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)[v6 count] <= 1
    && (unint64_t)[(ORKSignatureGestureRecognizer *)self numberOfTouches] < 2)
  {
    [(ORKSignatureGestureRecognizer *)self setState:1];
    v13 = [(ORKSignatureGestureRecognizer *)self eventDelegate];
    [v13 gestureTouchesBegan:v6 withEvent:v7];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          -[ORKSignatureGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v12), v7, (void)v14);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ORKSignatureGestureRecognizer *)self eventDelegate];
  [v8 gestureTouchesMoved:v7 withEvent:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(ORKSignatureGestureRecognizer *)self setState:3];
  id v8 = [(ORKSignatureGestureRecognizer *)self eventDelegate];
  [v8 gestureTouchesEnded:v7 withEvent:v6];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (DrawingGestureRecognizerDelegate)eventDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventDelegate);

  return (DrawingGestureRecognizerDelegate *)WeakRetained;
}

- (void)setEventDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end