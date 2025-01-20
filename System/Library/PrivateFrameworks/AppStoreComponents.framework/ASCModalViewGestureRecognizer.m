@interface ASCModalViewGestureRecognizer
- (ASCModalViewGestureRecognizer)initWithCoder:(id)a3;
- (ASCModalViewGestureRecognizer)initWithTargetView:(id)a3 target:(id)a4 action:(SEL)a5;
- (BOOL)isAnyTouch:(id)a3 fromEvent:(id)a4 outsideView:(id)a5;
- (NSMutableSet)activeTouches;
- (UIView)targetView;
- (void)encodeWithCoder:(id)a3;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation ASCModalViewGestureRecognizer

- (ASCModalViewGestureRecognizer)initWithTargetView:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASCModalViewGestureRecognizer;
  v10 = [(ASCModalViewGestureRecognizer *)&v15 initWithTarget:a4 action:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_targetView, a3);
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeTouches = v11->_activeTouches;
    v11->_activeTouches = v12;
  }
  return v11;
}

- (ASCModalViewGestureRecognizer)initWithCoder:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)reset
{
  v4.receiver = self;
  v4.super_class = (Class)ASCModalViewGestureRecognizer;
  [(ASCModalViewGestureRecognizer *)&v4 reset];
  v3 = [(ASCModalViewGestureRecognizer *)self activeTouches];
  [v3 removeAllObjects];
}

- (BOOL)isAnyTouch:(id)a3 fromEvent:(id)a4 outsideView:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "locationInView:", v9, (void)v15);
        if (!objc_msgSend(v9, "pointInside:withEvent:", v8))
        {
          LOBYTE(v11) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v11;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(ASCModalViewGestureRecognizer *)self activeTouches];
  uint64_t v9 = [v8 count];

  if (v9) {
    goto LABEL_4;
  }
  id v10 = [(ASCModalViewGestureRecognizer *)self targetView];
  BOOL v11 = [(ASCModalViewGestureRecognizer *)self isAnyTouch:v6 fromEvent:v7 outsideView:v10];

  if (v11)
  {
    [(ASCModalViewGestureRecognizer *)self setState:1];
LABEL_4:
    uint64_t v12 = [(ASCModalViewGestureRecognizer *)self activeTouches];
    [v12 unionSet:v6];

    goto LABEL_5;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        -[ASCModalViewGestureRecognizer ignoreTouch:forEvent:](self, "ignoreTouch:forEvent:", *(void *)(*((void *)&v18 + 1) + 8 * v17++), v7, (void)v18);
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v15);
  }

LABEL_5:
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v6 = [(ASCModalViewGestureRecognizer *)self activeTouches];
  [v6 minusSet:v5];

  id v7 = [(ASCModalViewGestureRecognizer *)self activeTouches];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    [(ASCModalViewGestureRecognizer *)self setState:3];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5 = a3;
  id v6 = [(ASCModalViewGestureRecognizer *)self activeTouches];
  [v6 minusSet:v5];

  id v7 = [(ASCModalViewGestureRecognizer *)self activeTouches];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    [(ASCModalViewGestureRecognizer *)self setState:5];
  }
}

- (UIView)targetView
{
  return self->_targetView;
}

- (NSMutableSet)activeTouches
{
  return self->_activeTouches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTouches, 0);

  objc_storeStrong((id *)&self->_targetView, 0);
}

@end