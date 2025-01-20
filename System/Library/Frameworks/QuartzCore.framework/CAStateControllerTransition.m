@interface CAStateControllerTransition
- (CALayer)layer;
- (CAStateControllerTransition)init;
- (CAStateTransition)transition;
- (double)beginTime;
- (double)duration;
- (float)speed;
- (void)addAnimation:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)dealloc;
- (void)invalidate;
- (void)removeAnimationFromLayer:(id)a3 forKey:(id)a4;
@end

@implementation CAStateControllerTransition

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(CAStateControllerTransition *)self invalidate];

  v3.receiver = self;
  v3.super_class = (Class)CAStateControllerTransition;
  [(CAStateControllerTransition *)&v3 dealloc];
}

- (void)addAnimation:(id)a3
{
  animations = self->_animations;
  if (!animations)
  {
    animations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_animations = animations;
  }

  [(NSMutableArray *)animations addObject:a3];
}

- (CAStateControllerTransition)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)CAStateControllerTransition;
  result = [(CAStateControllerTransition *)&v3 init];
  if (result) {
    result->_speed = 1.0;
  }
  return result;
}

- (void)invalidate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_controller = &self->_controller;
  if (self->_controller)
  {
    if (self->_masterKey)
    {
      -[CAStateControllerTransition removeAnimationFromLayer:forKey:](self, "removeAnimationFromLayer:forKey:", self->_layer);

      self->_masterKey = 0;
    }
    animations = self->_animations;
    if (animations)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      uint64_t v5 = [(NSMutableArray *)animations countByEnumeratingWithState:&v12 objects:v11 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        do
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(animations);
            }
            -[CAStateControllerTransition removeAnimationFromLayer:forKey:](self, "removeAnimationFromLayer:forKey:", [*(id *)(*((void *)&v12 + 1) + 8 * v8) layer], objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v8), "key"));
            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [(NSMutableArray *)animations countByEnumeratingWithState:&v12 objects:v11 count:16];
        }
        while (v6);
      }

      self->_animations = 0;
    }
    controller = self->_controller;
    layer = self->_layer;
    *p_controller = 0;
    p_controller[1] = 0;
    [(CAStateController *)controller _removeTransition:self layer:layer];
  }
}

- (void)removeAnimationFromLayer:(id)a3 forKey:(id)a4
{
  if ((CAStateControllerTransition *)objc_msgSend((id)objc_msgSend(a3, "animationForKey:", a4), "CAStateControllerTransition") == self)
  {
    [a3 removeAnimationForKey:a4];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = [(CAStateController *)self->_controller delegate];
  if (objc_opt_respondsToSelector()) {
    [(CAStateControllerDelegate *)v6 stateController:self->_controller transitionDidStop:self->_transition completed:v4];
  }

  self->_masterKey = 0;

  [(CAStateControllerTransition *)self invalidate];
}

- (float)speed
{
  return self->_speed;
}

- (double)duration
{
  return self->_duration;
}

- (double)beginTime
{
  return self->_beginTime;
}

- (CAStateTransition)transition
{
  return self->_transition;
}

- (CALayer)layer
{
  return self->_layer;
}

@end