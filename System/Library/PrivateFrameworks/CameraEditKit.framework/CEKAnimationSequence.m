@interface CEKAnimationSequence
- (CEKAnimationGenerator)_animationGenerator;
- (CEKAnimationSequence)initWithAnimations:(id)a3 completionHandler:(id)a4;
- (NSMutableArray)_animations;
- (id)_completionHandler;
- (void)_notifyCompletionWithSuccess:(BOOL)a3;
- (void)_startNextAnimation;
- (void)set_animationGenerator:(id)a3;
- (void)set_completionHandler:(id)a3;
- (void)stopAllAnimations;
@end

@implementation CEKAnimationSequence

- (CEKAnimationSequence)initWithAnimations:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CEKAnimationSequence;
  v8 = [(CEKAnimationSequence *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [v6 mutableCopy];
    animations = v8->__animations;
    v8->__animations = (NSMutableArray *)v9;

    uint64_t v11 = [v7 copy];
    id completionHandler = v8->__completionHandler;
    v8->__id completionHandler = (id)v11;

    v13 = objc_alloc_init(CEKAnimationGenerator);
    animationGenerator = v8->__animationGenerator;
    v8->__animationGenerator = v13;

    v15 = v8;
  }

  return v8;
}

- (void)_startNextAnimation
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(CEKAnimationSequence *)self _animations];
  v4 = [v3 firstObject];

  if (v4)
  {
    v5 = [(CEKAnimationSequence *)self _animations];
    [v5 removeObjectAtIndex:0];

    id v6 = os_log_create("com.apple.camera", "CameraEditKit");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 identifier];
      *(_DWORD *)buf = 138543362;
      objc_super v17 = v7;
      _os_log_impl(&dword_1BEE2D000, v6, OS_LOG_TYPE_DEFAULT, "Starting animation %{public}@", buf, 0xCu);
    }
    v8 = [(CEKAnimationSequence *)self _animationGenerator];
    uint64_t v9 = [v4 identifier];
    [v4 duration];
    double v11 = v10;
    v12 = [v4 updateHandler];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__CEKAnimationSequence__startNextAnimation__block_invoke;
    v13[3] = &unk_1E63CD438;
    id v14 = v4;
    v15 = self;
    [v8 startAnimationForIdentifier:v9 duration:v12 updateHandler:v13 completionHandler:v11];
  }
  else
  {
    [(CEKAnimationSequence *)self _notifyCompletionWithSuccess:1];
  }
}

uint64_t __43__CEKAnimationSequence__startNextAnimation__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = os_log_create("com.apple.camera", "CameraEditKit");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [*(id *)(a1 + 32) identifier];
    int v12 = 138543618;
    v13 = v5;
    __int16 v14 = 1024;
    int v15 = a2;
    _os_log_impl(&dword_1BEE2D000, v4, OS_LOG_TYPE_DEFAULT, "Finished animation %{public}@ with completed=%d", (uint8_t *)&v12, 0x12u);
  }
  id v6 = [*(id *)(a1 + 32) completionHandler];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) completionHandler];
    v7[2](v7, a2);
  }
  v8 = *(void **)(a1 + 40);
  if (a2) {
    return [v8 _startNextAnimation];
  }
  double v10 = [v8 _animations];
  [v10 enumerateObjectsUsingBlock:&__block_literal_global];

  double v11 = [*(id *)(a1 + 40) _animations];
  [v11 removeAllObjects];

  objc_msgSend(*(id *)(a1 + 40), "set_animationGenerator:", 0);
  return [*(id *)(a1 + 40) _notifyCompletionWithSuccess:0];
}

void __43__CEKAnimationSequence__startNextAnimation__block_invoke_30(uint64_t a1, void *a2)
{
  id v4 = a2;
  v2 = [v4 completionHandler];

  if (v2)
  {
    v3 = [v4 completionHandler];
    v3[2](v3, 0);
  }
}

- (void)stopAllAnimations
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.camera", "CameraEditKit");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(CEKAnimationSequence *)self _animationGenerator];
    int v5 = [v4 isAnimating];
    id v6 = [(CEKAnimationSequence *)self _animations];
    v9[0] = 67109376;
    v9[1] = v5;
    __int16 v10 = 2048;
    uint64_t v11 = [v6 count];
    _os_log_impl(&dword_1BEE2D000, v3, OS_LOG_TYPE_DEFAULT, "Stopping animations (%d in progress, %ld pending)", (uint8_t *)v9, 0x12u);
  }
  id v7 = [(CEKAnimationSequence *)self _animationGenerator];
  [v7 stopAllAnimations];

  [(CEKAnimationSequence *)self set_animationGenerator:0];
  v8 = [(CEKAnimationSequence *)self _animations];
  [v8 removeAllObjects];
}

- (void)_notifyCompletionWithSuccess:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v5 = [(CEKAnimationSequence *)self _completionHandler];
  [(CEKAnimationSequence *)self set_completionHandler:0];
  if (v5)
  {
    id v6 = os_log_create("com.apple.camera", "CameraEditKit");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_1BEE2D000, v6, OS_LOG_TYPE_DEFAULT, "Animations completed with success=%d", (uint8_t *)v7, 8u);
    }

    v5[2](v5, v3);
  }
}

- (NSMutableArray)_animations
{
  return self->__animations;
}

- (id)_completionHandler
{
  return self->__completionHandler;
}

- (void)set_completionHandler:(id)a3
{
}

- (CEKAnimationGenerator)_animationGenerator
{
  return self->__animationGenerator;
}

- (void)set_animationGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__animationGenerator, 0);
  objc_storeStrong(&self->__completionHandler, 0);
  objc_storeStrong((id *)&self->__animations, 0);
}

@end