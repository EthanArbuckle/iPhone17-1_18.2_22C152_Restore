@interface CCUIDismissalGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (CCUIDismissalGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)_cancelOtherGestureRecognizersForTouches:(id)a3;
- (void)_tryToCancelTouches;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CCUIDismissalGestureRecognizer

- (CCUIDismissalGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CCUIDismissalGestureRecognizer;
  v4 = [(CCUIDismissalGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4) {
    [(CCUIDismissalGestureRecognizer *)v4 addTarget:v4 action:sel__tryToCancelTouches];
  }
  return v5;
}

- (void)reset
{
  self->_triggered = 0;
  self->_currentTouches = 0;
  MEMORY[0x1F41817F8]();
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 1;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CCUIDismissalGestureRecognizer *)self _activeTouchesForEvent:v6];
  currentTouches = self->_currentTouches;
  self->_currentTouches = v8;

  v10.receiver = self;
  v10.super_class = (Class)CCUIDismissalGestureRecognizer;
  [(CCUIDismissalGestureRecognizer *)&v10 touchesBegan:v7 withEvent:v6];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CCUIDismissalGestureRecognizer *)self _activeTouchesForEvent:v6];
  currentTouches = self->_currentTouches;
  self->_currentTouches = v8;

  v10.receiver = self;
  v10.super_class = (Class)CCUIDismissalGestureRecognizer;
  [(CCUIDismissalGestureRecognizer *)&v10 touchesMoved:v7 withEvent:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(CCUIDismissalGestureRecognizer *)self _activeTouchesForEvent:v6];
  currentTouches = self->_currentTouches;
  self->_currentTouches = v8;

  v10.receiver = self;
  v10.super_class = (Class)CCUIDismissalGestureRecognizer;
  [(CCUIDismissalGestureRecognizer *)&v10 touchesEnded:v7 withEvent:v6];
}

- (void)_tryToCancelTouches
{
  if (!self->_triggered)
  {
    uint64_t v3 = [(CCUIDismissalGestureRecognizer *)self state];
    if ((unint64_t)(v3 - 1) >= 3)
    {
      if ((unint64_t)(v3 - 4) >= 2) {
        return;
      }
      self->_triggered = 1;
      p_currentTouches = &self->_currentTouches;
    }
    else
    {
      self->_triggered = 1;
      p_currentTouches = &self->_currentTouches;
      [(CCUIDismissalGestureRecognizer *)self _cancelOtherGestureRecognizersForTouches:self->_currentTouches];
    }
    v5 = *p_currentTouches;
    *p_currentTouches = 0;
  }
}

- (void)_cancelOtherGestureRecognizersForTouches:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * v8);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        objc_super v10 = objc_msgSend(v9, "gestureRecognizers", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v17;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v17 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(CCUIDismissalGestureRecognizer **)(*((void *)&v16 + 1) + 8 * v14);
              if (v15 != self)
              {
                [*(id *)(*((void *)&v16 + 1) + 8 * v14) setEnabled:0];
                [(CCUIDismissalGestureRecognizer *)v15 setEnabled:1];
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v12);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
}

@end