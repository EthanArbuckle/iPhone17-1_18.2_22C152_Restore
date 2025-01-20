@interface CKSendMenuPopoverAnimation
- (CKSendMenuPopoverAnimation)initWithAnimators:(id)a3;
- (NSArray)animators;
- (OS_dispatch_group)group;
- (id)completion;
- (void)setAnimators:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setGroup:(id)a3;
- (void)startAnimation;
@end

@implementation CKSendMenuPopoverAnimation

- (CKSendMenuPopoverAnimation)initWithAnimators:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKSendMenuPopoverAnimation;
  v5 = [(CKSendMenuPopoverAnimation *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    animators = v5->_animators;
    v5->_animators = (NSArray *)v6;

    dispatch_group_t v8 = dispatch_group_create();
    group = v5->_group;
    v5->_group = (OS_dispatch_group *)v8;

    id completion = v5->_completion;
    v5->_id completion = &__block_literal_global_118;
  }
  return v5;
}

- (void)startAnimation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_animators;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        dispatch_group_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        dispatch_group_enter((dispatch_group_t)self->_group);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __44__CKSendMenuPopoverAnimation_startAnimation__block_invoke;
        v11[3] = &unk_1E5622978;
        v11[4] = self;
        [v8 addCompletion:v11];
        [v8 startAnimation];
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  group = self->_group;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__CKSendMenuPopoverAnimation_startAnimation__block_invoke_2;
  v10[3] = &unk_1E5620C40;
  v10[4] = self;
  dispatch_group_notify(group, MEMORY[0x1E4F14428], v10);
}

void __44__CKSendMenuPopoverAnimation_startAnimation__block_invoke(uint64_t a1)
{
}

void __44__CKSendMenuPopoverAnimation_startAnimation__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) completion];
  v1[2]();
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSArray)animators
{
  return self->_animators;
}

- (void)setAnimators:(id)a3
{
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_animators, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end