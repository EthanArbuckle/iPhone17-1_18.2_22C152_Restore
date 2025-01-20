@interface CEKFluidBehaviorUtilities
+ (id)animatablePropertyWithFunctionalCompletion:(id)a3;
+ (id)animatablePropertyWithMilestonePassingTest:(id)a3 passedBlock:(id)a4;
+ (id)animatablePropertyWithProgressMilestones:(id)a3 block:(id)a4;
@end

@implementation CEKFluidBehaviorUtilities

+ (id)animatablePropertyWithProgressMilestones:(id)a3 block:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 count];
  id v8 = 0;
  if (v6 && v7)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    v10 = (void *)[v5 mutableCopy];
    [v9 setValue:0.0];
    objc_initWeak(&location, v9);
    v11 = (void *)MEMORY[0x1E4FB1EB0];
    v25[0] = v9;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __76__CEKFluidBehaviorUtilities_animatablePropertyWithProgressMilestones_block___block_invoke;
    v20 = &unk_1E63CDA48;
    objc_copyWeak(&v23, &location);
    id v13 = v10;
    id v21 = v13;
    v14 = (void (**)(id, double, double))v6;
    v22 = v14;
    [v11 _createTransformerWithInputAnimatableProperties:v12 presentationValueChangedCallback:&v17];

    if (objc_msgSend(v13, "containsObject:", &unk_1F1A0F7E8, v17, v18, v19, v20))
    {
      v14[2](v14, 0.0, 0.0);
      [v13 removeObject:&unk_1F1A0F7E8];
    }
    v15 = v22;
    id v8 = v9;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v8;
}

void __76__CEKFluidBehaviorUtilities_animatablePropertyWithProgressMilestones_block___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && ([WeakRetained isInvalidated] & 1) == 0)
  {
    [v3 presentationValue];
    double v5 = v4;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          [v12 doubleValue];
          double v14 = v13;
          if (BSFloatLessThanOrEqualToFloat())
          {
            (*(void (**)(double, double))(*(void *)(a1 + 40) + 16))(v14, v5);
            if (!v9) {
              id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            }
            [v9 addObject:v12];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(void *)(*((void *)&v20 + 1) + 8 * j), (void)v20);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v17);
    }

    if (![*(id *)(a1 + 32) count]) {
      [v3 invalidate];
    }
  }
}

+ (id)animatablePropertyWithMilestonePassingTest:(id)a3 passedBlock:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  double v5 = (unsigned int (**)(void, double))a3;
  id v6 = (void (**)(void, double))a4;
  uint64_t v7 = v6;
  id v8 = 0;
  if (v5 && v6)
  {
    if (v5[2](v5, 0.0))
    {
      v7[2](v7, 0.0);
      id v8 = 0;
    }
    else
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4FB1ED0]);
      [v9 setValue:0.0];
      objc_initWeak(&location, v9);
      uint64_t v10 = (void *)MEMORY[0x1E4FB1EB0];
      v19[0] = v9;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __84__CEKFluidBehaviorUtilities_animatablePropertyWithMilestonePassingTest_passedBlock___block_invoke;
      v14[3] = &unk_1E63CDA70;
      objc_copyWeak(&v17, &location);
      id v15 = v5;
      uint64_t v16 = v7;
      [v10 _createTransformerWithInputAnimatableProperties:v11 presentationValueChangedCallback:v14];

      v12 = v16;
      id v8 = v9;

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }

  return v8;
}

uint64_t __84__CEKFluidBehaviorUtilities_animatablePropertyWithMilestonePassingTest_passedBlock___block_invoke(uint64_t a1)
{
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = (void *)WeakRetained;
    uint64_t WeakRetained = [(id)WeakRetained isInvalidated];
    uint64_t v3 = (uint64_t)v7;
    if ((WeakRetained & 1) == 0)
    {
      [v7 presentationValue];
      double v5 = v4;
      uint64_t WeakRetained = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
      uint64_t v3 = (uint64_t)v7;
      if (WeakRetained)
      {
        (*(void (**)(double))(*(void *)(a1 + 40) + 16))(v5);
        uint64_t WeakRetained = [v7 invalidate];
        uint64_t v3 = (uint64_t)v7;
      }
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

+ (id)animatablePropertyWithFunctionalCompletion:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4FB1ED0]);
    [v4 setValue:0.0];
    objc_initWeak(&location, v4);
    double v5 = (void *)MEMORY[0x1E4FB1EB0];
    v12[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __72__CEKFluidBehaviorUtilities_animatablePropertyWithFunctionalCompletion___block_invoke;
    v8[3] = &unk_1E63CDA98;
    objc_copyWeak(&v10, &location);
    id v9 = v3;
    [v5 _createTransformerWithInputAnimatableProperties:v6 presentationValueChangedCallback:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

uint64_t __72__CEKFluidBehaviorUtilities_animatablePropertyWithFunctionalCompletion___block_invoke(uint64_t a1)
{
  uint64_t WeakRetained = (uint64_t)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    double v5 = (void *)WeakRetained;
    uint64_t WeakRetained = [(id)WeakRetained isInvalidated];
    uint64_t v3 = (uint64_t)v5;
    if ((WeakRetained & 1) == 0)
    {
      [v5 presentationValue];
      uint64_t WeakRetained = BSFloatLessThanOrEqualToFloat();
      uint64_t v3 = (uint64_t)v5;
      if (WeakRetained)
      {
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
        uint64_t WeakRetained = [v5 invalidate];
        uint64_t v3 = (uint64_t)v5;
      }
    }
  }
  return MEMORY[0x1F41817F8](WeakRetained, v3);
}

@end