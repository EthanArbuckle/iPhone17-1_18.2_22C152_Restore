@interface ACUISDependencyGestureRecognizer
- (ACUISDependencyGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (BOOL)_didExceedHysteresisWithTouches:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)shouldRecognizeTouchForView:(id)a3;
- (CGPoint)_convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4;
- (NSSet)observedControlClasses;
- (double)hysteresis;
- (void)setHysteresis:(double)a3;
- (void)setObservedControlClasses:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation ACUISDependencyGestureRecognizer

- (NSSet)observedControlClasses
{
  observedControlClasses = self->_observedControlClasses;
  if (!observedControlClasses)
  {
    v4 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", objc_opt_class(), 0);
    v5 = self->_observedControlClasses;
    self->_observedControlClasses = v4;

    observedControlClasses = self->_observedControlClasses;
  }
  return observedControlClasses;
}

- (void)setObservedControlClasses:(id)a3
{
  id v5 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_observedControlClasses, a3);
    if ([(ACUISDependencyGestureRecognizer *)self isEnabled])
    {
      [(ACUISDependencyGestureRecognizer *)self setEnabled:0];
      [(ACUISDependencyGestureRecognizer *)self setEnabled:1];
    }
  }
}

- (ACUISDependencyGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ACUISDependencyGestureRecognizer;
  v4 = [(ACUISDependencyGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  id v5 = v4;
  if (v4)
  {
    [(ACUISDependencyGestureRecognizer *)v4 setCancelsTouchesInView:0];
    [(ACUISDependencyGestureRecognizer *)v5 setDelaysTouchesEnded:0];
    [(ACUISDependencyGestureRecognizer *)v5 setDelegate:v5];
    v5->_hysteresis = 9.0;
  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ACUISDependencyGestureRecognizer;
  id v6 = a3;
  [(ACUISDependencyGestureRecognizer *)&v10 touchesBegan:v6 withEvent:a4];
  double v7 = _CentroidOfTouches(v6);
  CGFloat v9 = v8;

  self->_initialSceneReferenceLocation.x = v7;
  self->_initialSceneReferenceLocation.y = v9;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ACUISDependencyGestureRecognizer;
  [(ACUISDependencyGestureRecognizer *)&v23 touchesMoved:v6 withEvent:v7];
  if (![(ACUISDependencyGestureRecognizer *)self state]
    && [(ACUISDependencyGestureRecognizer *)self _didExceedHysteresisWithTouches:v6])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v12), "view", (void)v19);
          if ([(ACUISDependencyGestureRecognizer *)self shouldRecognizeTouchForView:v13])
          {

            uint64_t v18 = 3;
            goto LABEL_18;
          }
          uint64_t v14 = objc_opt_class();
          id v15 = v13;
          if (v14)
          {
            if (objc_opt_isKindOfClass()) {
              v16 = v15;
            }
            else {
              v16 = 0;
            }
          }
          else
          {
            v16 = 0;
          }
          id v17 = v16;

          [v17 cancelTrackingWithEvent:v7];
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    uint64_t v18 = 5;
LABEL_18:

    [(ACUISDependencyGestureRecognizer *)self setState:v18];
  }
}

- (BOOL)shouldRecognizeTouchForView:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v18 = 0u;
      id v7 = [(ACUISDependencyGestureRecognizer *)self observedControlClasses];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            char isKindOfClass = objc_opt_isKindOfClass();
          }
          char v13 = isKindOfClass;
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v9);

        if (v13)
        {
          char v15 = 1;
          goto LABEL_18;
        }
      }
      else
      {
      }
      uint64_t v14 = [v6 superview];

      id v6 = (void *)v14;
      if (!v14)
      {
        char v15 = 0;
        goto LABEL_18;
      }
    }
    char v15 = objc_msgSend(v6, "acuis_wantsPriorityOverTargetOfGestureRecognizer:", self);
LABEL_18:
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (CGPoint)_convertPoint:(CGPoint)a3 fromSceneReferenceCoordinatesToView:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    uint64_t v10 = [(ACUISDependencyGestureRecognizer *)self view];
    id v9 = [v10 window];
  }
  uint64_t v11 = [v9 _window];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "_convertPointFromSceneReferenceSpace:", x, y);
    double x = v13;
    double y = v14;
  }
  objc_msgSend(v9, "convertPoint:fromView:", 0, x, y);
  double v16 = v15;
  double v18 = v17;

  double v19 = v16;
  double v20 = v18;
  result.double y = v20;
  result.double x = v19;
  return result;
}

- (BOOL)_didExceedHysteresisWithTouches:(id)a3
{
  id v4 = a3;
  id v5 = [(ACUISDependencyGestureRecognizer *)self view];
  -[ACUISDependencyGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v5, self->_initialSceneReferenceLocation.x, self->_initialSceneReferenceLocation.y);
  double v7 = v6;
  double v9 = v8;
  double v10 = _CentroidOfTouches(v4);
  double v12 = v11;

  -[ACUISDependencyGestureRecognizer _convertPoint:fromSceneReferenceCoordinatesToView:](self, "_convertPoint:fromSceneReferenceCoordinatesToView:", v5, v10, v12);
  double v14 = v13 - v7;
  double v16 = v15 - v9;
  if (v14 < 0.0) {
    double v14 = -v14;
  }
  double hysteresis = self->_hysteresis;
  BOOL v18 = v14 > hysteresis;
  double v19 = -v16;
  if (v16 >= 0.0) {
    double v19 = v16;
  }
  BOOL v20 = v19 > hysteresis || v18;

  return v20;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_double hysteresis = a3;
}

- (void).cxx_destruct
{
}

@end