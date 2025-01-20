@interface HKMultiTouchPressGestureRecognizer
- (CGPoint)locationInView:(id)a3;
- (CGRect)touchableBounds;
- (HKMultiTouchPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (NSArray)orderedTouches;
- (NSSet)touches;
- (double)requiredPressDelay;
- (id)touchAtIndex:(unint64_t)a3;
- (unint64_t)maximumNumberOfTouches;
- (unint64_t)minimumNumberOfTouches;
- (void)reset;
- (void)setMaximumNumberOfTouches:(unint64_t)a3;
- (void)setMinimumNumberOfTouches:(unint64_t)a3;
- (void)setRequiredPressDelay:(double)a3;
- (void)setTouchableBounds:(CGRect)a3;
- (void)touchDelayTimerFired:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation HKMultiTouchPressGestureRecognizer

- (HKMultiTouchPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)HKMultiTouchPressGestureRecognizer;
  result = [(HKMultiTouchPressGestureRecognizer *)&v5 initWithTarget:a3 action:a4];
  if (result)
  {
    result->_minimumNumberOfTouches = 1;
    result->_maximumNumberOfTouches = 1;
  }
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v48 = a4;
  uint64_t v7 = [(HKMultiTouchPressGestureRecognizer *)self delegate];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(HKMultiTouchPressGestureRecognizer *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      v11 = [(HKMultiTouchPressGestureRecognizer *)self delegate];
      [v11 gestureWillBeginWithRecognizer:self];
    }
  }
  if ([v6 count] <= self->_maximumNumberOfTouches)
  {
    uint64_t v12 = [v6 count];
    if ([(NSMutableSet *)self->_touches count] + v12 <= self->_maximumNumberOfTouches
      || !self->_touchDelayTimer)
    {
      id v47 = v6;
      if (CGRectEqualToRect(self->_touchableBounds, *MEMORY[0x1E4F1DB28]))
      {
        v14 = (void *)[v6 mutableCopy];
      }
      else
      {
        uint64_t v46 = 320;
        v14 = [MEMORY[0x1E4F1CA80] set];
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        id v15 = v6;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v53 objects:v58 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v54 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              v21 = [(HKMultiTouchPressGestureRecognizer *)self view];
              [v20 locationInView:v21];
              v60.x = v22;
              v60.y = v23;
              BOOL v24 = CGRectContainsPoint(self->_touchableBounds, v60);

              if (v24) {
                [v14 addObject:v20];
              }
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v53 objects:v58 count:16];
          }
          while (v17);
        }
      }
      touches = self->_touches;
      v13 = v48;
      if (touches)
      {
        if ([(NSMutableSet *)touches count] >= self->_maximumNumberOfTouches) {
          goto LABEL_48;
        }
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        uint64_t v46 = (uint64_t)v14;
        id v26 = v14;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v49 objects:v57 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          char v29 = 0;
          uint64_t v30 = *(void *)v50;
          do
          {
            for (uint64_t j = 0; j != v28; ++j)
            {
              if (*(void *)v50 != v30) {
                objc_enumerationMutation(v26);
              }
              uint64_t v32 = *(void *)(*((void *)&v49 + 1) + 8 * j);
              if ([(NSMutableSet *)self->_touches count] >= self->_maximumNumberOfTouches)
              {
                [(HKMultiTouchPressGestureRecognizer *)self ignoreTouch:v32 forEvent:v48];
              }
              else
              {
                [(NSMutableSet *)self->_touches addObject:v32];
                char v29 = 1;
              }
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v49 objects:v57 count:16];
          }
          while (v28);
        }
        else
        {
          char v29 = 0;
        }

        v14 = (void *)v46;
        if (self->_touchDelayTimer) {
          goto LABEL_48;
        }
        if ([(HKMultiTouchPressGestureRecognizer *)self state]
          || [(NSMutableSet *)self->_touches count] < self->_minimumNumberOfTouches)
        {
          if ((v29 & 1) == 0 || [(HKMultiTouchPressGestureRecognizer *)self state] != 2) {
            goto LABEL_48;
          }
          v44 = self;
          uint64_t v45 = 2;
          goto LABEL_47;
        }
      }
      else
      {
        if ([v14 count] <= self->_maximumNumberOfTouches)
        {
          v38 = v14;
          v34 = self->_touches;
          self->_touches = v38;
        }
        else
        {
          v33 = (void *)MEMORY[0x1E4F1CA80];
          v34 = [v14 allObjects];
          v35 = objc_msgSend(v34, "subarrayWithRange:", 0, self->_maximumNumberOfTouches);
          v36 = [v33 setWithArray:v35];
          v37 = self->_touches;
          self->_touches = v36;
        }
        if ([(NSMutableSet *)self->_touches count] < self->_minimumNumberOfTouches) {
          goto LABEL_48;
        }
        if (self->_requiredPressDelay > 0.0)
        {
          objc_msgSend(MEMORY[0x1E4F1CB00], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_touchDelayTimerFired_, 0, 0);
          v39 = (NSTimer *)objc_claimAutoreleasedReturnValue();
          touchDelayTimer = self->_touchDelayTimer;
          self->_touchDelayTimer = v39;

          v41 = [(HKMultiTouchPressGestureRecognizer *)self view];
          [(HKMultiTouchPressGestureRecognizer *)self locationInView:v41];
          self->_startingPosition.x = v42;
          self->_startingPosition.y = v43;

LABEL_48:
          id v6 = v47;
          goto LABEL_49;
        }
      }
      v44 = self;
      uint64_t v45 = 1;
LABEL_47:
      -[HKMultiTouchPressGestureRecognizer setState:](v44, "setState:", v45, v46);
      goto LABEL_48;
    }
  }
  [(HKMultiTouchPressGestureRecognizer *)self setState:5];
  v13 = v48;
LABEL_49:
}

- (void)touchDelayTimerFired:(id)a3
{
  [(NSTimer *)self->_touchDelayTimer invalidate];
  touchDelayTimer = self->_touchDelayTimer;
  self->_touchDelayTimer = 0;

  [(HKMultiTouchPressGestureRecognizer *)self setState:1];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  objc_super v5 = [(HKMultiTouchPressGestureRecognizer *)self view];
  [(HKMultiTouchPressGestureRecognizer *)self locationInView:v5];
  double v7 = v6;
  double v9 = v8;

  touchDelayTimer = self->_touchDelayTimer;
  if (touchDelayTimer
    && (vabdd_f64(v7, self->_startingPosition.x) > 300.0 || vabdd_f64(v9, self->_startingPosition.y) > 300.0))
  {
    [(NSTimer *)touchDelayTimer invalidate];
    v11 = self->_touchDelayTimer;
    self->_touchDelayTimer = 0;
  }
  if ([(NSMutableSet *)self->_touches intersectsSet:v12]
    && [(HKMultiTouchPressGestureRecognizer *)self state] == 2)
  {
    [(HKMultiTouchPressGestureRecognizer *)self setState:2];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v8 = a3;
  int v5 = [(NSMutableSet *)self->_touches intersectsSet:v8];
  double v6 = v8;
  if (v5)
  {
    [(NSMutableSet *)self->_touches minusSet:v8];
    if ([(NSMutableSet *)self->_touches count] >= self->_minimumNumberOfTouches)
    {
      uint64_t v7 = 2;
    }
    else if (self->_touchDelayTimer)
    {
      uint64_t v7 = 5;
    }
    else
    {
      uint64_t v7 = 3;
    }
    [(HKMultiTouchPressGestureRecognizer *)self setState:v7];
    double v6 = v8;
  }
}

- (void)reset
{
  touches = self->_touches;
  self->_touches = 0;

  [(NSTimer *)self->_touchDelayTimer invalidate];
  touchDelayTimer = self->_touchDelayTimer;
  self->_touchDelayTimer = 0;

  self->_startingPosition = (CGPoint)*MEMORY[0x1E4F1DAD8];
}

- (CGPoint)locationInView:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  int v5 = self->_touches;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v23;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "locationInView:", v4, (void)v22);
        double v10 = v10 + v13;
        double v11 = v11 + v14;
      }
      v8 += v7;
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v7);

    id v15 = [(HKMultiTouchPressGestureRecognizer *)self view];
    UIPointRoundToViewScale();
    double v17 = v16;
    double v19 = v18;
  }
  else
  {

    double v17 = *MEMORY[0x1E4F1DAD8];
    double v19 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }

  double v20 = v17;
  double v21 = v19;
  result.y = v21;
  result.x = v20;
  return result;
}

- (NSArray)orderedTouches
{
  v3 = [(NSMutableSet *)self->_touches allObjects];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__HKMultiTouchPressGestureRecognizer_orderedTouches__block_invoke;
  v6[3] = &unk_1E6D540A8;
  v6[4] = self;
  id v4 = [v3 sortedArrayUsingComparator:v6];

  return (NSArray *)v4;
}

BOOL __52__HKMultiTouchPressGestureRecognizer_orderedTouches__block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = [v5 view];
  [v7 locationInView:v8];
  double v10 = v9;
  double v12 = v11;

  double v13 = [*(id *)(a1 + 32) view];
  [v6 locationInView:v13];
  double v15 = v14;
  double v17 = v16;

  if (v10 == v15) {
    return v12 > v17;
  }
  else {
    return v10 > v15;
  }
}

- (id)touchAtIndex:(unint64_t)a3
{
  id v4 = [(HKMultiTouchPressGestureRecognizer *)self orderedTouches];
  if ([v4 count] <= a3)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = [v4 objectAtIndex:a3];
  }

  return v5;
}

- (NSSet)touches
{
  return &self->_touches->super;
}

- (double)requiredPressDelay
{
  return self->_requiredPressDelay;
}

- (void)setRequiredPressDelay:(double)a3
{
  self->_requiredPressDelay = a3;
}

- (unint64_t)minimumNumberOfTouches
{
  return self->_minimumNumberOfTouches;
}

- (void)setMinimumNumberOfTouches:(unint64_t)a3
{
  self->_minimumNumberOfTouches = a3;
}

- (unint64_t)maximumNumberOfTouches
{
  return self->_maximumNumberOfTouches;
}

- (void)setMaximumNumberOfTouches:(unint64_t)a3
{
  self->_maximumNumberOfTouches = a3;
}

- (CGRect)touchableBounds
{
  double x = self->_touchableBounds.origin.x;
  double y = self->_touchableBounds.origin.y;
  double width = self->_touchableBounds.size.width;
  double height = self->_touchableBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTouchableBounds:(CGRect)a3
{
  self->_touchableBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touches, 0);
  objc_storeStrong((id *)&self->_touchDelayTimer, 0);
}

@end