@interface MKTiltGestureRecognizer
- (MKTiltGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)_distanceFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4;
- (id)_activeTouchesForEvent:(id)a3;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation MKTiltGestureRecognizer

- (MKTiltGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MKTiltGestureRecognizer;
  v4 = [(MKTiltGestureRecognizer *)&v8 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(MKTiltGestureRecognizer *)v4 setMinimumNumberOfTouches:2];
    [(MKTiltGestureRecognizer *)v5 setMaximumNumberOfTouches:2];
    [(MKTiltGestureRecognizer *)v5 _setCanPanHorizontally:0];
    v6 = v5;
  }

  return v5;
}

- (id)_activeTouchesForEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = objc_msgSend(v4, "touchesForGestureRecognizer:", self, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    objc_super v8 = 0;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 phase] <= 2)
        {
          if (!v8)
          {
            objc_super v8 = [MEMORY[0x1E4F1CA80] set];
          }
          [v8 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (double)_distanceFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  return sqrt((a4.y - a3.y) * (a4.y - a3.y) + (a4.x - a3.x) * (a4.x - a3.x));
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(MKTiltGestureRecognizer *)self state])
  {
    objc_super v8 = [(MKTiltGestureRecognizer *)self _activeTouchesForEvent:v7];
    uint64_t v9 = [v8 allObjects];
    if ([v8 count])
    {
      if (!self->_touch1)
      {
        v10 = [v9 objectAtIndex:0];
        touch1 = self->_touch1;
        self->_touch1 = v10;

        v12 = self->_touch1;
        [(MKTiltGestureRecognizer *)self view];
        v14 = long long v13 = v9;
        [(UITouch *)v12 locationInView:v14];
        self->_initialTouch1Point.x = v15;
        self->_initialTouch1Point.y = v16;

        uint64_t v9 = v13;
      }
      p_touch2 = &self->_touch2;
      if (!self->_touch2)
      {
        v29 = v9;
        v30 = v8;
        id v31 = v7;
        id v32 = v6;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v18 = v8;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v35;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v35 != v21) {
                objc_enumerationMutation(v18);
              }
              v23 = *(UITouch **)(*((void *)&v34 + 1) + 8 * v22);
              if (v23 != self->_touch1)
              {
                objc_storeStrong((id *)&self->_touch2, v23);
                v24 = *p_touch2;
                v25 = [(MKTiltGestureRecognizer *)self view];
                [(UITouch *)v24 locationInView:v25];
                self->_initialTouch2Point.x = v26;
                self->_initialTouch2Point.y = v27;
              }
              ++v22;
            }
            while (v20 != v22);
            uint64_t v20 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v20);
        }

        id v7 = v31;
        id v6 = v32;
        uint64_t v9 = v29;
        objc_super v8 = v30;
      }
      if (self->_touch1 && *p_touch2)
      {
        -[MKTiltGestureRecognizer _distanceFromPoint:toPoint:](self, "_distanceFromPoint:toPoint:", self->_initialTouch1Point.x, self->_initialTouch1Point.y, self->_initialTouch2Point.x, self->_initialTouch2Point.y);
        self->_initialDistance = v28;
      }
    }
  }
  v33.receiver = self;
  v33.super_class = (Class)MKTiltGestureRecognizer;
  -[MKTiltGestureRecognizer touchesBegan:withEvent:](&v33, sel_touchesBegan_withEvent_, v6, v7, v29, v30, v31, v32);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(MKTiltGestureRecognizer *)self state]) {
    goto LABEL_2;
  }
  objc_super v8 = [(MKTiltGestureRecognizer *)self _activeTouchesForEvent:v7];
  unint64_t v9 = [v8 count];
  if (v9 < [(MKTiltGestureRecognizer *)self minimumNumberOfTouches])
  {
LABEL_17:

    goto LABEL_18;
  }
  if (![v8 containsObject:self->_touch1]
    || ![v8 containsObject:self->_touch2])
  {
    goto LABEL_16;
  }
  touch1 = self->_touch1;
  v11 = [(MKTiltGestureRecognizer *)self view];
  [(UITouch *)touch1 locationInView:v11];
  double v13 = v12;
  double v15 = v14;

  touch2 = self->_touch2;
  v17 = [(MKTiltGestureRecognizer *)self view];
  [(UITouch *)touch2 locationInView:v17];
  double v19 = v18;
  double v21 = v20;

  double v22 = v15 - self->_initialTouch1Point.y;
  double v23 = v21 - self->_initialTouch2Point.y;
  if (v22 >= 0.0 && v23 <= 0.0) {
    goto LABEL_12;
  }
  if (v22 <= 0.0 && v23 >= 0.0)
  {
LABEL_12:
    double v24 = v22 - v23;
    if (v24 < 0.0) {
      double v24 = -v24;
    }
    if (v24 > 18.0) {
      goto LABEL_16;
    }
  }
  -[MKTiltGestureRecognizer _distanceFromPoint:toPoint:](self, "_distanceFromPoint:toPoint:", v13, v15, v19, v21);
  double v26 = v25 - self->_initialDistance;
  if (v26 < 0.0) {
    double v26 = -v26;
  }
  if (v26 > 15.0)
  {
LABEL_16:
    [(MKTiltGestureRecognizer *)self setState:5];
    goto LABEL_17;
  }

LABEL_2:
  v27.receiver = self;
  v27.super_class = (Class)MKTiltGestureRecognizer;
  [(MKTiltGestureRecognizer *)&v27 touchesMoved:v6 withEvent:v7];
LABEL_18:
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)MKTiltGestureRecognizer;
  id v6 = a4;
  [(MKTiltGestureRecognizer *)&v10 touchesEnded:a3 withEvent:v6];
  id v7 = -[MKTiltGestureRecognizer _activeTouchesForEvent:](self, "_activeTouchesForEvent:", v6, v10.receiver, v10.super_class);

  unint64_t v8 = [v7 count];
  if (v8 < [(MKTiltGestureRecognizer *)self minimumNumberOfTouches])
  {
    if ([(MKTiltGestureRecognizer *)self state] == 1)
    {
      uint64_t v9 = 3;
    }
    else if ([(MKTiltGestureRecognizer *)self state] == 2)
    {
      uint64_t v9 = 3;
    }
    else
    {
      uint64_t v9 = 5;
    }
    [(MKTiltGestureRecognizer *)self setState:v9];
  }
}

- (void)reset
{
  touch1 = self->_touch1;
  self->_touch1 = 0;

  touch2 = self->_touch2;
  self->_touch2 = 0;

  v5.receiver = self;
  v5.super_class = (Class)MKTiltGestureRecognizer;
  [(MKTiltGestureRecognizer *)&v5 reset];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touch2, 0);

  objc_storeStrong((id *)&self->_touch1, 0);
}

@end