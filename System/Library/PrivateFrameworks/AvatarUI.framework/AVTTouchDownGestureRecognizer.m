@interface AVTTouchDownGestureRecognizer
- (AVTTouchDownGestureRecognizer)init;
- (AVTTouchDownGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (BOOL)allowsTouchesToPassThrough;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (NSHashTable)recognizersRequiredToFail;
- (void)_configure;
- (void)requireGestureRecognizerToFail:(id)a3;
- (void)setAllowsTouchesToPassThrough:(BOOL)a3;
- (void)setRecognizersRequiredToFail:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation AVTTouchDownGestureRecognizer

- (AVTTouchDownGestureRecognizer)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVTTouchDownGestureRecognizer;
  v2 = [(AVTTouchDownGestureRecognizer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AVTTouchDownGestureRecognizer *)v2 _configure];
  }
  return v3;
}

- (AVTTouchDownGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AVTTouchDownGestureRecognizer;
  v4 = [(AVTTouchDownGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  objc_super v5 = v4;
  if (v4) {
    [(AVTTouchDownGestureRecognizer *)v4 _configure];
  }
  return v5;
}

- (void)_configure
{
  [(AVTTouchDownGestureRecognizer *)self setAllowsTouchesToPassThrough:1];
  [(AVTTouchDownGestureRecognizer *)self setDelegate:self];
}

- (void)requireGestureRecognizerToFail:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVTTouchDownGestureRecognizer;
  [(AVTTouchDownGestureRecognizer *)&v8 requireGestureRecognizerToFail:v4];
  recognizersRequiredToFail = self->_recognizersRequiredToFail;
  if (!recognizersRequiredToFail)
  {
    v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    objc_super v7 = self->_recognizersRequiredToFail;
    self->_recognizersRequiredToFail = v6;

    recognizersRequiredToFail = self->_recognizersRequiredToFail;
  }
  [(NSHashTable *)recognizersRequiredToFail addObject:v4];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if ([(AVTTouchDownGestureRecognizer *)self allowsTouchesToPassThrough])
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v6 = self->_recognizersRequiredToFail;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "view", (void)v20);
          [v5 locationInView:v12];
          double v14 = v13;
          double v16 = v15;

          v17 = [v11 view];
          LOBYTE(v12) = objc_msgSend(v17, "pointInside:withEvent:", 0, v14, v16);

          if (v12)
          {

            goto LABEL_12;
          }
        }
        uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    [(AVTTouchDownGestureRecognizer *)self setState:3];
    BOOL v18 = 0;
  }
  else
  {
LABEL_12:
    BOOL v18 = 1;
  }

  return v18;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (![(AVTTouchDownGestureRecognizer *)self state])
  {
    [(AVTTouchDownGestureRecognizer *)self setState:3];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (BOOL)allowsTouchesToPassThrough
{
  return self->_allowsTouchesToPassThrough;
}

- (void)setAllowsTouchesToPassThrough:(BOOL)a3
{
  self->_allowsTouchesToPassThrough = a3;
}

- (NSHashTable)recognizersRequiredToFail
{
  return self->_recognizersRequiredToFail;
}

- (void)setRecognizersRequiredToFail:(id)a3
{
}

- (void).cxx_destruct
{
}

@end