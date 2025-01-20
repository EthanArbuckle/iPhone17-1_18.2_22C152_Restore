@interface ARUIRingGroupAnimationState
+ (id)currentAnimationState;
+ (void)currentAnimationState;
+ (void)popAnimationState;
+ (void)pushAnimationState:(id)a3;
- (ARUIRingGroupAnimationState)init;
- (ARUIRingGroupAnimationState)nextAnimationState;
- (CAMediaTimingFunction)timingFunction;
- (NSMutableSet)trackedAnimations;
- (double)duration;
- (id)completion;
- (void)addAnimation:(id)a3;
- (void)animationDidComplete:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDuration:(double)a3;
- (void)setNextAnimationState:(id)a3;
- (void)setTimingFunction:(id)a3;
- (void)setTrackedAnimations:(id)a3;
@end

@implementation ARUIRingGroupAnimationState

+ (id)currentAnimationState
{
  v2 = arui_rings_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    +[ARUIRingGroupAnimationState currentAnimationState]();
  }

  v3 = (void *)__currentRingGroupAnimationState;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackedAnimations, 0);
  objc_storeStrong((id *)&self->_nextAnimationState, 0);
  objc_storeStrong(&self->_completion, 0);

  objc_storeStrong((id *)&self->_timingFunction, 0);
}

- (void)setTimingFunction:(id)a3
{
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void)setCompletion:(id)a3
{
}

- (ARUIRingGroupAnimationState)init
{
  v6.receiver = self;
  v6.super_class = (Class)ARUIRingGroupAnimationState;
  v2 = [(ARUIRingGroupAnimationState *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9C0] set];
    trackedAnimations = v2->_trackedAnimations;
    v2->_trackedAnimations = (NSMutableSet *)v3;
  }
  return v2;
}

+ (void)pushAnimationState:(id)a3
{
  id v3 = a3;
  v4 = arui_rings_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[ARUIRingGroupAnimationState pushAnimationState:]();
  }

  if (__currentRingGroupAnimationState)
  {
    v5 = arui_rings_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      +[ARUIRingGroupAnimationState pushAnimationState:]();
    }

    [v3 setNextAnimationState:__currentRingGroupAnimationState];
  }
  objc_super v6 = arui_rings_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[ARUIRingGroupAnimationState pushAnimationState:]();
  }

  v7 = (void *)__currentRingGroupAnimationState;
  __currentRingGroupAnimationState = (uint64_t)v3;
}

+ (void)popAnimationState
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E162000, v0, v1, "ARUIRingGroupAnimationState popping animationState __currentRingGroupAnimationState is %@", v2, v3, v4, v5, v6);
}

- (NSMutableSet)trackedAnimations
{
  return self->_trackedAnimations;
}

- (ARUIRingGroupAnimationState)nextAnimationState
{
  return self->_nextAnimationState;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (double)duration
{
  return self->_duration;
}

- (void)addAnimation:(id)a3
{
  id v4 = a3;
  [v4 setDelegate:self];
  [(NSMutableSet *)self->_trackedAnimations addObject:v4];
}

- (void)animationDidComplete:(id)a3
{
  [(NSMutableSet *)self->_trackedAnimations removeObject:a3];
  if (![(NSMutableSet *)self->_trackedAnimations count])
  {
    [(id)__trackedAnimationStates removeObject:self];
    if (![(id)__trackedAnimationStates count])
    {
      id v4 = (void *)__trackedAnimationStates;
      __trackedAnimationStates = 0;
    }
    id completion = self->_completion;
    if (completion)
    {
      uint8_t v6 = (void (*)(void))*((void *)completion + 2);
      v6();
    }
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setNextAnimationState:(id)a3
{
}

- (void)setTrackedAnimations:(id)a3
{
}

+ (void)pushAnimationState:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E162000, v0, v1, "ARUIRingGroupAnimationState pushing animationState: %@ setting __currentRingGroupAnimationState", v2, v3, v4, v5, v6);
}

+ (void)pushAnimationState:.cold.2()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_21E162000, v1, OS_LOG_TYPE_DEBUG, "ARUIRingGroupAnimationState pushing animationState: %@, __currentRingGroupAnimationState exists: %@", v2, 0x16u);
}

+ (void)pushAnimationState:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E162000, v0, v1, "ARUIRingGroupAnimationState pushing animationState: %@", v2, v3, v4, v5, v6);
}

+ (void)currentAnimationState
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_21E162000, v0, v1, "ARUIRingGroupAnimationState returning currentAnimationState: %@", v2, v3, v4, v5, v6);
}

@end