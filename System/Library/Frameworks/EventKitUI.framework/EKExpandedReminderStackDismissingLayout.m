@interface EKExpandedReminderStackDismissingLayout
- (EKExpandedReminderStackDismissingLayout)initWithDelegate:(id)a3 completionHandler:(id)a4;
- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
@end

@implementation EKExpandedReminderStackDismissingLayout

- (EKExpandedReminderStackDismissingLayout)initWithDelegate:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EKExpandedReminderStackDismissingLayout;
  v7 = [(EKExpandedReminderStackLayout *)&v13 initWithDelegate:a3];
  if (v7)
  {
    dispatch_group_t v8 = dispatch_group_create();
    animationDispatchGroup = v7->_animationDispatchGroup;
    v7->_animationDispatchGroup = (OS_dispatch_group *)v8;

    v10 = _Block_copy(v6);
    id completionHandler = v7->_completionHandler;
    v7->_id completionHandler = v10;

    v7->_executedCompletionHandler = 0;
  }

  return v7;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EKExpandedReminderStackDismissingLayout;
  id v4 = a3;
  v5 = [(EKExpandedReminderStackDismissingLayout *)&v7 layoutAttributesForItemAtIndexPath:v4];
  -[EKExpandedReminderStackLayout prepareCellAnimationWithLayoutAttributes:indexPath:](self, "prepareCellAnimationWithLayoutAttributes:indexPath:", v5, v4, v7.receiver, v7.super_class);

  return v5;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EKExpandedReminderStackDismissingLayout;
  v5 = [(EKExpandedReminderStackDismissingLayout *)&v7 layoutAttributesForSupplementaryViewOfKind:a3 atIndexPath:a4];
  [(EKExpandedReminderStackLayout *)self prepareHeaderAnimationWithLayoutAttributes:v5];

  return v5;
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke;
  v14[3] = &unk_1E608A358;
  char v17 = isKindOfClass & 1;
  v14[4] = self;
  id v15 = v7;
  id v16 = v8;
  id v10 = v8;
  id v11 = v7;
  v12 = _Block_copy(v14);

  return v12;
}

void __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 528));
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 528);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2;
  block[3] = &unk_1E6087570;
  block[4] = v4;
  dispatch_group_notify(v5, MEMORY[0x1E4F14428], block);
  id v6 = [MEMORY[0x1E4FB1ED8] expandingStackedRemindersSpringAnimator];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3;
  v14[3] = &unk_1E6088358;
  char v17 = *(unsigned char *)(a1 + 56);
  id v15 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 48);
  [v6 addAnimations:v14];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_4;
  id v11 = &unk_1E608A330;
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = v3;
  id v7 = v3;
  [v6 addCompletion:&v8];
  objc_msgSend(v6, "startAnimation", v8, v9, v10, v11, v12);
}

uint64_t __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (!*(unsigned char *)(v1 + 544))
  {
    *(unsigned char *)(v1 + 544) = 1;
    return (*(uint64_t (**)(void))(*(void *)(*(void *)(result + 32) + 536) + 16))();
  }
  return result;
}

uint64_t __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    [v3 frame];
    uint64_t v4 = *(void **)(a1 + 32);
    return objc_msgSend(v4, "setFrame:");
  }
  else
  {
    if (v3)
    {
      [v3 transform];
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v8 = 0u;
    }
    id v6 = *(void **)(a1 + 32);
    v7[0] = v8;
    v7[1] = v9;
    v7[2] = v10;
    [v6 setTransform:v7];
    [*(id *)(a1 + 40) alpha];
    return objc_msgSend(*(id *)(a1 + 32), "setAlpha:");
  }
}

uint64_t __93__EKExpandedReminderStackDismissingLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 528));
  int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_animationDispatchGroup, 0);
}

@end