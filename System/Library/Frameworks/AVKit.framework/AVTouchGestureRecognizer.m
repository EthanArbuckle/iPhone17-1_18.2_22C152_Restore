@interface AVTouchGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (void)_addCandidateGestureIncrementForTouches:(id *)a1;
- (void)_evaluateCandidateGestureIncrements;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation AVTouchGestureRecognizer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateGestureIncrementsMultiTouchInfo, 0);

  objc_storeStrong((id *)&self->_gestureWarmUpDelayTimer, 0);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (self)
  {
    if ([(AVTouchGestureRecognizer *)self state] == 1) {
      uint64_t v5 = 4;
    }
    else {
      uint64_t v5 = 5;
    }
    [(AVTouchGestureRecognizer *)self setState:v5];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (self)
  {
    if ([(AVTouchGestureRecognizer *)self state] == 1) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 5;
    }
    [(AVTouchGestureRecognizer *)self setState:v5];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[AVTouchGestureRecognizer _addCandidateGestureIncrementForTouches:]((id *)&self->super.super.isa, a3);
  if ([(NSMutableArray *)self->_candidateGestureIncrementsMultiTouchInfo count] == 7)
  {
    -[AVTouchGestureRecognizer _evaluateCandidateGestureIncrements](self);
  }
}

- (void)_addCandidateGestureIncrementForTouches:(id *)a1
{
  id v5 = a2;
  if (a1)
  {
    BOOL v3 = (unint64_t)[a1 numberOfTouches] > 1 || (unint64_t)objc_msgSend(v5, "count") > 1;
    v4 = [NSNumber numberWithBool:v3];
    [a1[35] addObject:v4];
  }
}

- (void)_evaluateCandidateGestureIncrements
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    result = (void *)[result state];
    if (!result)
    {
      v2 = (void *)v1[35];
      if (v2)
      {
        long long v9 = 0u;
        long long v10 = 0u;
        long long v11 = 0u;
        long long v12 = 0u;
        id v3 = v2;
        uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = *(void *)v10;
          uint64_t v7 = 5;
LABEL_7:
          uint64_t v8 = 0;
          while (1)
          {
            if (*(void *)v10 != v6) {
              objc_enumerationMutation(v3);
            }
            if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8), "BOOLValue", (void)v9)) {
              break;
            }
            if (v5 == ++v8)
            {
              uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
              if (v5) {
                goto LABEL_7;
              }
              goto LABEL_13;
            }
          }
        }
        else
        {
LABEL_13:
          uint64_t v7 = 1;
        }

        return (void *)[v1 setState:v7];
      }
    }
  }
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  candidateGestureIncrementsMultiTouchInfo = self->_candidateGestureIncrementsMultiTouchInfo;
  self->_candidateGestureIncrementsMultiTouchInfo = v8;

  -[AVTouchGestureRecognizer _addCandidateGestureIncrementForTouches:]((id *)&self->super.super.isa, v6);
  objc_initWeak(&location, self);
  long long v10 = (void *)MEMORY[0x1E4F1CB00];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__AVTouchGestureRecognizer_touchesBegan_withEvent___block_invoke;
  v13[3] = &unk_1E5FC4480;
  objc_copyWeak(&v14, &location);
  long long v11 = [v10 scheduledTimerWithTimeInterval:0 repeats:v13 block:0.0];
  gestureWarmUpDelayTimer = self->_gestureWarmUpDelayTimer;
  self->_gestureWarmUpDelayTimer = v11;

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __51__AVTouchGestureRecognizer_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AVTouchGestureRecognizer _evaluateCandidateGestureIncrements](WeakRetained);
}

- (void)reset
{
  candidateGestureIncrementsMultiTouchInfo = self->_candidateGestureIncrementsMultiTouchInfo;
  self->_candidateGestureIncrementsMultiTouchInfo = 0;

  [(NSTimer *)self->_gestureWarmUpDelayTimer invalidate];
  gestureWarmUpDelayTimer = self->_gestureWarmUpDelayTimer;
  self->_gestureWarmUpDelayTimer = 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 1;
}

@end