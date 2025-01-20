@interface CCUIAnimationRunner
+ (id)runner;
+ (void)_runC2AnimationsInBatch:(id)a3 animationGroup:(id)a4 completionHandler:(id)a5;
+ (void)_runCAAnimationsInBatch:(id)a3 animationGroup:(id)a4 completionHandler:(id)a5;
- (void)additivelyRunAnimationBatch:(id)a3 withCompletionBlock:(id)a4;
- (void)runAnimationBatch:(id)a3 withCompletionBlock:(id)a4;
@end

@implementation CCUIAnimationRunner

+ (id)runner
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (void)runAnimationBatch:(id)a3 withCompletionBlock:(id)a4
{
  previousAnimationGroup = self->_previousAnimationGroup;
  self->_previousAnimationGroup = 0;
  id v7 = a4;
  id v8 = a3;

  [(CCUIAnimationRunner *)self additivelyRunAnimationBatch:v8 withCompletionBlock:v7];
}

- (void)additivelyRunAnimationBatch:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  int v8 = [MEMORY[0x1E4FB1EB0] areAnimationsEnabled];
  v9 = (void *)*MEMORY[0x1E4F5AD80];
  BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD80], OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v10) {
      -[CCUIAnimationRunner additivelyRunAnimationBatch:withCompletionBlock:](v9, v6);
    }
    v11 = dispatch_group_create();
    v12 = v11;
    if (self->_previousAnimationGroup)
    {
      dispatch_group_enter(v11);
      previousAnimationGroup = self->_previousAnimationGroup;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke;
      block[3] = &unk_1E6A898F8;
      v36 = v12;
      v14 = (void *)MEMORY[0x1E4F14428];
      dispatch_group_notify(previousAnimationGroup, MEMORY[0x1E4F14428], block);
    }
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    char v34 = 1;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    char v32 = 0;
    v15 = objc_opt_class();
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_2;
    v30[3] = &unk_1E6A8A368;
    v30[4] = v33;
    [v15 _runCAAnimationsInBatch:v6 animationGroup:v12 completionHandler:v30];
    v16 = objc_opt_class();
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_3;
    v29[3] = &unk_1E6A8A390;
    v29[4] = v33;
    v29[5] = v31;
    [v16 _runC2AnimationsInBatch:v6 animationGroup:v12 completionHandler:v29];
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_4;
    v21[3] = &unk_1E6A8A3B8;
    id v22 = v6;
    v25 = v33;
    v26 = v31;
    objc_copyWeak(&v27, &location);
    v17 = v12;
    v23 = v17;
    id v24 = v7;
    v18 = (void *)MEMORY[0x1E4F14428];
    dispatch_group_notify(v17, MEMORY[0x1E4F14428], v21);

    v19 = self->_previousAnimationGroup;
    self->_previousAnimationGroup = (OS_dispatch_group *)v17;
    v20 = v17;

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    _Block_object_dispose(v31, 8);
    _Block_object_dispose(v33, 8);
  }
  else
  {
    if (v10) {
      -[CCUIAnimationRunner additivelyRunAnimationBatch:withCompletionBlock:](v9, v6);
    }
    [v6 iterateAnimationsWithBlock:&__block_literal_global_9];
    if (v7) {
      (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
    }
  }
}

void __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke(uint64_t a1)
{
}

uint64_t __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_2(uint64_t result, char a2)
{
  uint64_t v2 = *(void *)(*(void *)(result + 32) + 8);
  if (*(unsigned char *)(v2 + 24)) {
    char v3 = a2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)(v2 + 24) = v3;
  return result;
}

uint64_t __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_3(uint64_t result, char a2, char a3)
{
  uint64_t v3 = *(void *)(*(void *)(result + 32) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    char v4 = a2;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)(v3 + 24) = v4;
  uint64_t v5 = *(void *)(*(void *)(result + 40) + 8);
  if (*(unsigned char *)(v5 + 24)) {
    a3 = 1;
  }
  *(unsigned char *)(v5 + 24) = a3;
  return result;
}

void __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (void *)*MEMORY[0x1E4F5AD80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5AD80], OS_LOG_TYPE_DEBUG)) {
    __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_4_cold_1((void *)a1, v2);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  char v4 = WeakRetained;
  uint64_t v5 = (void *)*((void *)WeakRetained + 1);
  if (v5 == *(void **)(a1 + 40))
  {
    *((void *)WeakRetained + 1) = 0;
  }
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 64) + 8) + 24));
  }
}

void __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_81(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) animations];
        v8[2]();

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

+ (void)_runCAAnimationsInBatch:(id)a3 animationGroup:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke;
  v19[3] = &unk_1E6A8A428;
  id v11 = v7;
  id v20 = v11;
  id v12 = v8;
  id v21 = v12;
  [v9 iterateAnimationsOfType:v10 withBlock:v19];
  uint64_t v13 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_3;
  v16[3] = &unk_1E6A8A428;
  id v17 = v11;
  id v18 = v12;
  id v14 = v12;
  id v15 = v11;
  [v9 iterateAnimationsOfType:v13 withBlock:v16];
}

void __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = a3;
  uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v32;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * v9);
        uint64_t v11 = objc_opt_class();
        id v12 = v5;
        if (v11)
        {
          if (objc_opt_isKindOfClass()) {
            uint64_t v13 = v12;
          }
          else {
            uint64_t v13 = 0;
          }
        }
        else
        {
          uint64_t v13 = 0;
        }
        id v14 = v13;

        id v15 = [CCUICABasicAnimationFactory alloc];
        [v10 speed];
        v16 = -[CCUICABasicAnimationFactory initWithParameters:speed:](v15, "initWithParameters:speed:", v14);

        [(CCUICABasicAnimationFactory *)v16 animationDuration];
        double v18 = v17;
        [MEMORY[0x1E4F4F898] globalSlowDownFactor];
        double v20 = v18 * v19;
        [v10 delay];
        double v22 = v21;
        [MEMORY[0x1E4F4F898] globalSlowDownFactor];
        double v24 = v22 * v23;
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        v25 = (void *)MEMORY[0x1E4FB1EB0];
        v26 = [v10 animations];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_2;
        v28[3] = &unk_1E6A8A400;
        id v30 = *(id *)(a1 + 40);
        id v29 = *(id *)(a1 + 32);
        [v25 _animateWithDuration:393222 delay:v16 options:v26 factory:v28 animations:v20 completion:v24];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v7);
  }
}

void __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v2);
}

void __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v45;
    float v32 = *(float *)(MEMORY[0x1E4F39AF0] + 4);
    float v33 = *MEMORY[0x1E4F39AF0];
    float other = *(float *)(MEMORY[0x1E4F39AF0] + 8);
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v45 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v44 + 1) + 8 * v8);
        uint64_t v10 = objc_opt_class();
        id v11 = v34;
        if (v10)
        {
          if (objc_opt_isKindOfClass()) {
            id v12 = v11;
          }
          else {
            id v12 = 0;
          }
        }
        else
        {
          id v12 = 0;
        }
        id v13 = v12;

        id v14 = [CCUICASpringAnimationFactory alloc];
        [v9 speed];
        id v15 = -[CCUICASpringAnimationFactory initWithParameters:speed:](v14, "initWithParameters:speed:", v13);
        [(CCUICASpringAnimationFactory *)v15 animationDuration];
        double v17 = v16;
        [MEMORY[0x1E4F4F898] globalSlowDownFactor];
        double v19 = v18;
        [v9 delay];
        double v21 = v20;
        [MEMORY[0x1E4F4F898] globalSlowDownFactor];
        double v23 = v22;
        double v24 = [v9 animations];
        [v13 frameRateRange];
        float minimum = v50.minimum;
        float maximum = v50.maximum;
        float preferred = v50.preferred;
        v51.float maximum = v32;
        v51.float minimum = v33;
        v51.float preferred = other;
        if (!CAFrameRateRangeIsEqualToRange(v50, v51))
        {
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_4;
          aBlock[3] = &unk_1E6A8A450;
          float v41 = minimum;
          float v42 = maximum;
          float v43 = preferred;
          id v39 = v13;
          v40 = v9;
          v28 = _Block_copy(aBlock);

          double v24 = v28;
        }
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
        id v29 = (void *)MEMORY[0x1E4FB1EB0];
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_5;
        v35[3] = &unk_1E6A8A400;
        id v37 = *(id *)(a1 + 40);
        id v36 = *(id *)(a1 + 32);
        [v29 _animateWithDuration:393222 delay:v15 options:v24 factory:v35 animations:v17 * v19 completion:v21 * v23];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v6);
  }
}

void __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v3 = [*(id *)(a1 + 32) highFrameRateReason];
  id v7 = [*(id *)(a1 + 40) animations];
  LODWORD(v4) = *(_DWORD *)(a1 + 48);
  LODWORD(v5) = *(_DWORD *)(a1 + 52);
  LODWORD(v6) = *(_DWORD *)(a1 + 56);
  objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v3, v7, v4, v5, v6);
}

void __80__CCUIAnimationRunner__runCAAnimationsInBatch_animationGroup_completionHandler___block_invoke_5(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v2);
}

+ (void)_runC2AnimationsInBatch:(id)a3 animationGroup:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_opt_class();
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke;
  v13[3] = &unk_1E6A8A428;
  id v14 = v7;
  id v15 = v8;
  id v11 = v8;
  id v12 = v7;
  [v9 iterateAnimationsOfType:v10 withBlock:v13];
}

void __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v7 = objc_opt_class();
  id v8 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass()) {
      id v9 = v8;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  id v11 = (void *)MEMORY[0x1E4FB1EB0];
  [v10 tension];
  double v13 = v12;
  [v10 friction];
  double v15 = v14;
  uint64_t v16 = [v10 isInteractive];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke_2;
  v22[3] = &unk_1E6A89968;
  id v23 = v10;
  id v24 = v6;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke_4;
  v19[3] = &unk_1E6A8A478;
  id v21 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 32);
  id v17 = v6;
  id v18 = v10;
  [v11 _animateUsingSpringWithTension:v16 friction:v22 interactive:v19 animations:v13 completion:v15];
}

void __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) frameRateRange];
  float minimum = v24.minimum;
  float maximum = v24.maximum;
  float preferred = v24.preferred;
  if (CAFrameRateRangeIsEqualToRange(v24, *MEMORY[0x1E4F39AF0]))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "animations", (void)v16);
          id v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v10[2]();
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v11 = (void *)MEMORY[0x1E4FB1EB0];
    uint64_t v12 = [*(id *)(a1 + 32) highFrameRateReason];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke_3;
    v20[3] = &unk_1E6A898F8;
    id v21 = *(id *)(a1 + 40);
    *(float *)&double v13 = minimum;
    *(float *)&double v14 = maximum;
    *(float *)&double v15 = preferred;
    objc_msgSend(v11, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", v12, v20, v13, v14, v15);
    id v5 = v21;
  }
}

void __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5), "animations", (void)v7);
        uint64_t v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v6[2]();

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void __80__CCUIAnimationRunner__runC2AnimationsInBatch_animationGroup_completionHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(NSObject **)(a1 + 32);

  dispatch_group_leave(v2);
}

- (void).cxx_destruct
{
}

- (void)additivelyRunAnimationBatch:(void *)a1 withCompletionBlock:(void *)a2 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 UUID];
  OUTLINED_FUNCTION_0_1(&dword_1D7B17000, v5, v6, "[%{public}@] Will animate batch", v7, v8, v9, v10, 2u);
}

- (void)additivelyRunAnimationBatch:(void *)a1 withCompletionBlock:(void *)a2 .cold.2(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 UUID];
  OUTLINED_FUNCTION_0_1(&dword_1D7B17000, v5, v6, "[%{public}@] Will execute batch animation", v7, v8, v9, v10, 2u);
}

void __71__CCUIAnimationRunner_additivelyRunAnimationBatch_withCompletionBlock___block_invoke_4_cold_1(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)a1[4];
  uint64_t v4 = a2;
  uint64_t v5 = [v3 UUID];
  int v6 = *(unsigned __int8 *)(*(void *)(a1[7] + 8) + 24);
  int v7 = *(unsigned __int8 *)(*(void *)(a1[8] + 8) + 24);
  int v8 = 138543874;
  uint64_t v9 = v5;
  __int16 v10 = 1024;
  int v11 = v6;
  __int16 v12 = 1024;
  int v13 = v7;
  _os_log_debug_impl(&dword_1D7B17000, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Animation batch complete: finished=%{BOOL}d, retargeted=%{BOOL}d", (uint8_t *)&v8, 0x18u);
}

@end