@interface ACUISGestureRecognizer
- (ACUISGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (BOOL)_shouldRecognizeTouchForView:(id)a3;
- (BOOL)_shouldRecognizeTouches:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (NSSet)observedControlClasses;
- (void)setObservedControlClasses:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation ACUISGestureRecognizer

- (NSSet)observedControlClasses
{
  observedControlClasses = self->_observedControlClasses;
  if (!observedControlClasses)
  {
    id v4 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v5 = objc_opt_class();
    v6 = (NSSet *)objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
    v7 = self->_observedControlClasses;
    self->_observedControlClasses = v6;

    observedControlClasses = self->_observedControlClasses;
  }
  return observedControlClasses;
}

- (ACUISGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ACUISGestureRecognizer;
  id v4 = [(ACUISGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    [(ACUISGestureRecognizer *)v4 setCancelsTouchesInView:0];
    [(ACUISGestureRecognizer *)v5 setDelaysTouchesEnded:0];
    [(ACUISGestureRecognizer *)v5 setDelegate:v5];
  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ACUISGestureRecognizer;
  id v6 = a3;
  [(ACUISGestureRecognizer *)&v7 touchesBegan:v6 withEvent:a4];
  LODWORD(a4) = -[ACUISGestureRecognizer _shouldRecognizeTouches:](self, "_shouldRecognizeTouches:", v6, v7.receiver, v7.super_class);

  if (a4) {
    [(ACUISGestureRecognizer *)self setState:1];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ACUISGestureRecognizer;
  id v6 = a3;
  [(ACUISGestureRecognizer *)&v7 touchesMoved:v6 withEvent:a4];
  LODWORD(a4) = -[ACUISGestureRecognizer _shouldRecognizeTouches:](self, "_shouldRecognizeTouches:", v6, v7.receiver, v7.super_class);

  if (a4) {
    [(ACUISGestureRecognizer *)self setState:2];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ACUISGestureRecognizer;
  id v6 = a3;
  [(ACUISGestureRecognizer *)&v7 touchesEnded:v6 withEvent:a4];
  LODWORD(a4) = -[ACUISGestureRecognizer _shouldRecognizeTouches:](self, "_shouldRecognizeTouches:", v6, v7.receiver, v7.super_class);

  if (a4) {
    [(ACUISGestureRecognizer *)self setState:3];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)_shouldRecognizeTouches:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v21 + 1) + 8 * i) view];
        if ([(ACUISGestureRecognizer *)self _shouldRecognizeTouchForView:v9])
        {
LABEL_19:

          BOOL v15 = 1;
          goto LABEL_21;
        }
        long long v19 = 0u;
        long long v20 = 0u;
        long long v18 = 0u;
        v10 = [(ACUISGestureRecognizer *)self observedControlClasses];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          while (2)
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              if (objc_opt_isKindOfClass())
              {

                goto LABEL_19;
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
      BOOL v15 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_21:

  return v15;
}

- (BOOL)_shouldRecognizeTouchForView:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4;
    while ((objc_opt_respondsToSelector() & 1) == 0)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v18 = 0u;
      uint64_t v7 = [(ACUISGestureRecognizer *)self observedControlClasses];
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

      uint64_t v6 = (void *)v14;
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

- (void)setObservedControlClasses:(id)a3
{
}

- (void).cxx_destruct
{
}

@end