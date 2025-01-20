@interface _HKOutsideTapWindowCallbacks
- (BOOL)matchesWindow:(id)a3;
- (NSMutableArray)callbacks;
- (UITapGestureRecognizer)recognizer;
- (UIWindow)window;
- (_HKOutsideTapWindowCallbacks)initWithWindow:(id)a3;
- (void)_handleTap:(id)a3;
- (void)_installTapGestureRecognizerIfNeeded;
- (void)_removeTapGestureRecognizerIfNeeded;
- (void)addCallbackForView:(id)a3 outsideTapBlock:(id)a4;
- (void)removeCallbackForView:(id)a3;
- (void)setCallbacks:(id)a3;
- (void)setRecognizer:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation _HKOutsideTapWindowCallbacks

- (_HKOutsideTapWindowCallbacks)initWithWindow:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_HKOutsideTapWindowCallbacks;
  v5 = [(_HKOutsideTapWindowCallbacks *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_window, v4);
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    callbacks = v6->_callbacks;
    v6->_callbacks = v7;

    recognizer = v6->_recognizer;
    v6->_recognizer = 0;
  }
  return v6;
}

- (BOOL)matchesWindow:(id)a3
{
  id v4 = a3;
  id v5 = [(_HKOutsideTapWindowCallbacks *)self window];

  return v5 == v4;
}

- (void)addCallbackForView:(id)a3 outsideTapBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = [[_HKOutsideTapCallback alloc] initWithView:v7 outsideTapBlock:v6];

  v8 = [(_HKOutsideTapWindowCallbacks *)self callbacks];
  [v8 addObject:v9];

  [(_HKOutsideTapWindowCallbacks *)self _installTapGestureRecognizerIfNeeded];
}

- (void)removeCallbackForView:(id)a3
{
  id v4 = a3;
  id v5 = [(_HKOutsideTapWindowCallbacks *)self callbacks];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54___HKOutsideTapWindowCallbacks_removeCallbackForView___block_invoke;
  v7[3] = &unk_1E6D54080;
  id v8 = v4;
  id v6 = v4;
  objc_msgSend(v5, "hk_removeObjectsPassingTest:", v7);

  [(_HKOutsideTapWindowCallbacks *)self _removeTapGestureRecognizerIfNeeded];
}

- (void)_installTapGestureRecognizerIfNeeded
{
  v3 = [(_HKOutsideTapWindowCallbacks *)self recognizer];

  if (!v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTap_];
    [(_HKOutsideTapWindowCallbacks *)self setRecognizer:v4];

    id v5 = [(_HKOutsideTapWindowCallbacks *)self recognizer];
    [v5 setNumberOfTapsRequired:1];

    id v6 = [(_HKOutsideTapWindowCallbacks *)self recognizer];
    [v6 setNumberOfTouchesRequired:1];

    id v7 = [(_HKOutsideTapWindowCallbacks *)self recognizer];
    [v7 setCancelsTouchesInView:0];

    id v8 = [(_HKOutsideTapWindowCallbacks *)self window];
    [v8 addGestureRecognizer:self->_recognizer];
  }
}

- (void)_removeTapGestureRecognizerIfNeeded
{
  uint64_t v3 = [(_HKOutsideTapWindowCallbacks *)self recognizer];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(_HKOutsideTapWindowCallbacks *)self callbacks];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      id v7 = [(_HKOutsideTapWindowCallbacks *)self window];
      id v8 = [(_HKOutsideTapWindowCallbacks *)self recognizer];
      [v7 removeGestureRecognizer:v8];

      [(_HKOutsideTapWindowCallbacks *)self setRecognizer:0];
    }
  }
}

- (void)_handleTap:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [(_HKOutsideTapWindowCallbacks *)self callbacks];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v12 = [v11 view];

        if (v12)
        {
          v13 = [v11 view];
          [v4 locationInView:v13];
          CGFloat v15 = v14;
          CGFloat v17 = v16;

          v18 = [v11 view];
          [v18 frame];
          v29.x = v15;
          v29.y = v17;
          BOOL v19 = CGRectContainsPoint(v30, v29);

          if (!v19)
          {
            v20 = [v11 outsideTapBlock];
            v21 = [v11 view];
            ((void (**)(void, void *))v20)[2](v20, v21);
          }
        }
        else
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  v22 = [(_HKOutsideTapWindowCallbacks *)self callbacks];
  [v22 removeObjectsInArray:v5];

  [(_HKOutsideTapWindowCallbacks *)self _removeTapGestureRecognizerIfNeeded];
}

- (UITapGestureRecognizer)recognizer
{
  return self->_recognizer;
}

- (void)setRecognizer:(id)a3
{
}

- (UIWindow)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);
  return (UIWindow *)WeakRetained;
}

- (void)setWindow:(id)a3
{
}

- (NSMutableArray)callbacks
{
  return self->_callbacks;
}

- (void)setCallbacks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbacks, 0);
  objc_destroyWeak((id *)&self->_window);
  objc_storeStrong((id *)&self->_recognizer, 0);
}

@end