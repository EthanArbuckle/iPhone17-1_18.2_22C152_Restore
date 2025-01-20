@interface AVScrubbingPanGestureRecognizer
- (CGPoint)translation;
- (CGPoint)velocity;
- (id)_getPanGestureIncrementForTouches:(id *)a1;
- (void)_debugLogGestureIncrements:(id)a3 withPrefix:(id)a4;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation AVScrubbingPanGestureRecognizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPanGestureIncrement, 0);

  objc_storeStrong((id *)&self->_candidateGestureIncrements, 0);
}

- (void)_debugLogGestureIncrements:(id)a3 withPrefix:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [NSString stringWithFormat:@"%@ {\n", a4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      v13 = v6;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v7);
        }
        v14 = NSString;
        v15 = [*(id *)(*((void *)&v18 + 1) + 8 * v12) debugDescription];
        v16 = [v14 stringWithFormat:@"%ld %@\n", v10 + v12, v15, (void)v18];
        v6 = [v13 stringByAppendingString:v16];

        ++v12;
        v13 = v6;
      }
      while (v9 != v12);
      v10 += v12;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  v17 = [v6 stringByAppendingString:@"}"];

  NSLog(&stru_1F0919548.isa, v17);
}

- (void)reset
{
  candidateGestureIncrements = self->_candidateGestureIncrements;
  self->_candidateGestureIncrements = 0;

  lastPanGestureIncrement = self->_lastPanGestureIncrement;
  self->_lastPanGestureIncrement = 0;
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[AVScrubbingPanGestureRecognizer _getPanGestureIncrementForTouches:]((id *)&self->super.super.isa, a3);
  id v5 = (AVPanGestureIncrement *)objc_claimAutoreleasedReturnValue();
  lastPanGestureIncrement = self->_lastPanGestureIncrement;
  self->_lastPanGestureIncrement = v5;

  if ((unint64_t)([(AVScrubbingPanGestureRecognizer *)self state] - 1) < 2) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 5;
  }

  [(AVScrubbingPanGestureRecognizer *)self setState:v7];
}

- (id)_getPanGestureIncrementForTouches:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    id v3 = a2;
    v4 = [v3 anyObject];
    id v5 = [v2 view];
    [v4 locationInView:v5];
    double v7 = v6;
    double v9 = v8;
    [v4 timestamp];
    double v11 = v10;
    unint64_t v12 = [v3 count];

    BOOL v13 = v12 > 1 || (unint64_t)[v2 numberOfTouches] > 1;
    id v14 = v2[35];
    if (v14)
    {
      [v14 translation];
      double v16 = v15;
      double v18 = v17;
      [v2[35] timestamp];
      double v20 = v11 - v19;
      double v21 = (v7 - v16) / v20;
      double v22 = (v9 - v18) / v20;
    }
    else
    {
      double v21 = *MEMORY[0x1E4F1DAD8];
      double v22 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    +[AVPanGestureIncrement gestureIncrementWithTranslation:velocity:timestamp:hasMultipleTouches:](AVPanGestureIncrement, "gestureIncrementWithTranslation:velocity:timestamp:hasMultipleTouches:", v13, v7, v9, v21, v22, v11);
    v2 = (id *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[AVScrubbingPanGestureRecognizer _getPanGestureIncrementForTouches:]((id *)&self->super.super.isa, a3);
  id v5 = (AVPanGestureIncrement *)objc_claimAutoreleasedReturnValue();
  lastPanGestureIncrement = self->_lastPanGestureIncrement;
  self->_lastPanGestureIncrement = v5;

  if ((unint64_t)([(AVScrubbingPanGestureRecognizer *)self state] - 1) >= 2) {
    uint64_t v7 = 5;
  }
  else {
    uint64_t v7 = 3;
  }

  [(AVScrubbingPanGestureRecognizer *)self setState:v7];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v5 = -[AVScrubbingPanGestureRecognizer _getPanGestureIncrementForTouches:]((id *)&self->super.super.isa, a3);
  objc_storeStrong((id *)&self->_lastPanGestureIncrement, v5);
  if ((unint64_t)([(AVScrubbingPanGestureRecognizer *)self state] - 1) > 1)
  {
    [(NSMutableArray *)self->_candidateGestureIncrements addObject:v5];
    candidateGestureIncrements = self->_candidateGestureIncrements;
    double v9 = [(AVScrubbingPanGestureRecognizer *)self view];
    double v10 = candidateGestureIncrements;
    self;
    if ((unint64_t)[(NSMutableArray *)v10 count] > 1)
    {
      double v11 = [(NSMutableArray *)v10 lastObject];
      unint64_t v12 = [(NSMutableArray *)v10 firstObject];
      [v12 translation];
      double v14 = v13;
      double v16 = v15;
      [v11 translation];
      double v18 = v17 - v14;
      double v20 = v19 - v16;
      *(float *)&double v17 = v17 - v14;
      *(float *)&double v19 = v19 - v16;
      float v21 = hypotf(*(float *)&v17, *(float *)&v19);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      double v10 = v10;
      uint64_t v22 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        v36 = v11;
        v37 = v9;
        uint64_t v24 = 0;
        uint64_t v25 = *(void *)v39;
        while (2)
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v39 != v25) {
              objc_enumerationMutation(v10);
            }
            v27 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            objc_msgSend(v27, "velocity", v36, v37, (void)v38);
            double v29 = v28;
            double v31 = v30;
            if ([v27 hasMultipleTouches])
            {

              double v11 = v36;
              double v9 = v37;
LABEL_22:

              v35 = self->_candidateGestureIncrements;
              self->_candidateGestureIncrements = 0;

              uint64_t v7 = 5;
              goto LABEL_26;
            }
            uint64_t v32 = v31 != 0.0 || v29 != 0.0;
            v24 += v32;
          }
          uint64_t v23 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
          if (v23) {
            continue;
          }
          break;
        }

        BOOL v33 = v24 < 3 || v21 <= 15.0;
        double v11 = v36;
        double v9 = v37;
        if (!v33)
        {
          if (fabs(v18) > fabs(v20))
          {

            v34 = self->_candidateGestureIncrements;
            self->_candidateGestureIncrements = 0;

            uint64_t v7 = 1;
            goto LABEL_26;
          }
          goto LABEL_22;
        }
      }
      else
      {
      }
    }

    uint64_t v7 = 0;
LABEL_26:
    double v6 = self;
  }
  else
  {
    double v6 = self;
    uint64_t v7 = 2;
  }
  [(AVScrubbingPanGestureRecognizer *)v6 setState:v7];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  uint64_t v7 = [v5 array];
  candidateGestureIncrements = self->_candidateGestureIncrements;
  self->_candidateGestureIncrements = v7;

  -[AVScrubbingPanGestureRecognizer _getPanGestureIncrementForTouches:]((id *)&self->super.super.isa, v6);
  double v9 = (AVPanGestureIncrement *)objc_claimAutoreleasedReturnValue();

  lastPanGestureIncrement = self->_lastPanGestureIncrement;
  self->_lastPanGestureIncrement = v9;
  double v11 = v9;

  [(NSMutableArray *)self->_candidateGestureIncrements addObject:v11];
}

- (CGPoint)translation
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (self && (unint64_t)([(AVScrubbingPanGestureRecognizer *)self state] - 1) <= 1)
  {
    [(AVPanGestureIncrement *)self->_lastPanGestureIncrement translation];
    double v2 = v5;
    double v3 = v6;
  }
  double v7 = v2;
  double v8 = v3;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CGPoint)velocity
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (self && (unint64_t)([(AVScrubbingPanGestureRecognizer *)self state] - 1) <= 1)
  {
    [(AVPanGestureIncrement *)self->_lastPanGestureIncrement velocity];
    double v2 = v5;
    double v3 = v6;
  }
  double v7 = v2;
  double v8 = v3;
  result.y = v8;
  result.x = v7;
  return result;
}

@end