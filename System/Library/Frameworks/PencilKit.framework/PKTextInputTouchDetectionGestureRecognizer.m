@interface PKTextInputTouchDetectionGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3;
- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3;
- (NSMapTable)_touches;
- (PKTextInputTouchDetectionGestureRecognizer)init;
- (void)recognizeTouch;
- (void)recognizeTouch:(id)a3 afterThreshold:(double)a4;
- (void)reset;
- (void)set_touches:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation PKTextInputTouchDetectionGestureRecognizer

- (PKTextInputTouchDetectionGestureRecognizer)init
{
  v6.receiver = self;
  v6.super_class = (Class)PKTextInputTouchDetectionGestureRecognizer;
  v2 = [(PKTextInputTouchDetectionGestureRecognizer *)&v6 init];
  uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  touches = v2->__touches;
  v2->__touches = (NSMapTable *)v3;

  [(PKTextInputTouchDetectionGestureRecognizer *)v2 setAllowedTouchTypes:&unk_1F200EBC8];
  return v2;
}

- (void)recognizeTouch
{
  id v2 = [(PKTextInputTouchDetectionGestureRecognizer *)self delegate];
  [v2 touchesDetected];
}

- (void)recognizeTouch:(id)a3 afterThreshold:(double)a4
{
  id v6 = a3;
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PKTextInputTouchDetectionGestureRecognizer_recognizeTouch_afterThreshold___block_invoke;
  v9[3] = &unk_1E64C5F60;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_after(v7, MEMORY[0x1E4F14428], v9);
}

void __76__PKTextInputTouchDetectionGestureRecognizer_recognizeTouch_afterThreshold___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _touches];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    [v4 recognizeTouch];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        [v10 locationInView:0];
        double v12 = v11;
        double v14 = v13;
        v15 = [(PKTextInputTouchDetectionGestureRecognizer *)self _touches];
        v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v12, v14);
        [v15 setObject:v16 forKey:v10];

        [(PKTextInputTouchDetectionGestureRecognizer *)self recognizeTouch:v10 afterThreshold:0.1];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v11 = [(PKTextInputTouchDetectionGestureRecognizer *)self _touches];
        double v12 = [v11 objectForKey:v10];
        [v12 CGPointValue];
        double v14 = v13;
        double v16 = v15;

        [v10 locationInView:0];
        if ((v16 - v18) * (v16 - v18) + (v14 - v17) * (v14 - v17) > 100.0) {
          [(PKTextInputTouchDetectionGestureRecognizer *)self recognizeTouch:v10 afterThreshold:0.02];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
        double v11 = [(PKTextInputTouchDetectionGestureRecognizer *)self _touches];
        [v11 removeObjectForKey:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(PKTextInputTouchDetectionGestureRecognizer *)self recognizeTouch];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        long long v12 = [(PKTextInputTouchDetectionGestureRecognizer *)self _touches];
        [v12 removeObjectForKey:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)reset
{
  id v2 = [(PKTextInputTouchDetectionGestureRecognizer *)self _touches];
  [v2 removeAllObjects];
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldRequireFailureOfGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldBeRequiredToFailByGestureRecognizer:(id)a3
{
  return 0;
}

- (NSMapTable)_touches
{
  return self->__touches;
}

- (void)set_touches:(id)a3
{
}

- (void).cxx_destruct
{
}

@end