@interface UIView(QLPUAnimationGroup)
+ (void)_qlpu_animateViews:()QLPUAnimationGroup withAnimationBlock:completionHandler:;
+ (void)qlpu_animateViews:()QLPUAnimationGroup usingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:;
+ (void)qlpu_animateViews:()QLPUAnimationGroup usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:;
+ (void)qlpu_animateViews:()QLPUAnimationGroup withDuration:delay:options:animations:completion:;
+ (void)qlpu_animateViews:()QLPUAnimationGroup withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:;
- (id)_qlpu_animationDictionary;
@end

@implementation UIView(QLPUAnimationGroup)

+ (void)qlpu_animateViews:()QLPUAnimationGroup withDuration:delay:options:animations:completion:
{
  id v14 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __97__UIView_QLPUAnimationGroup__qlpu_animateViews_withDuration_delay_options_animations_completion___block_invoke;
  v16[3] = &unk_2642F6A88;
  double v18 = a2;
  double v19 = a3;
  uint64_t v20 = a6;
  id v17 = v14;
  id v15 = v14;
  objc_msgSend(a1, "_qlpu_animateViews:withAnimationBlock:completionHandler:", a5, v16, a8);
}

+ (void)qlpu_animateViews:()QLPUAnimationGroup withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:
{
  id v18 = a9;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __142__UIView_QLPUAnimationGroup__qlpu_animateViews_withDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion___block_invoke;
  v20[3] = &unk_2642F6AB0;
  double v22 = a2;
  double v23 = a3;
  double v24 = a4;
  double v25 = a5;
  uint64_t v26 = a8;
  id v21 = v18;
  id v19 = v18;
  objc_msgSend(a1, "_qlpu_animateViews:withAnimationBlock:completionHandler:", a7, v20, a10);
}

+ (void)qlpu_animateViews:()QLPUAnimationGroup usingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:
{
  id v14 = a7;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __134__UIView_QLPUAnimationGroup__qlpu_animateViews_usingDefaultDampedSpringWithDelay_initialSpringVelocity_options_animations_completion___block_invoke;
  v16[3] = &unk_2642F6A88;
  double v18 = a2;
  double v19 = a3;
  uint64_t v20 = a6;
  id v17 = v14;
  id v15 = v14;
  objc_msgSend(a1, "_qlpu_animateViews:withAnimationBlock:completionHandler:", a5, v16, a8);
}

+ (void)qlpu_animateViews:()QLPUAnimationGroup usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:
{
  id v22 = a11;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __147__UIView_QLPUAnimationGroup__qlpu_animateViews_usingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_animations_completion___block_invoke;
  v24[3] = &unk_2642F6AD8;
  double v26 = a2;
  double v27 = a3;
  uint64_t v28 = a10;
  double v29 = a4;
  double v30 = a5;
  double v31 = a6;
  double v32 = a7;
  id v25 = v22;
  id v23 = v22;
  objc_msgSend(a1, "_qlpu_animateViews:withAnimationBlock:completionHandler:", a9, v24, a12);
}

+ (void)_qlpu_animateViews:()QLPUAnimationGroup withAnimationBlock:completionHandler:
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v7 = a3;
  v39 = a4;
  id v38 = a5;
  v8 = [v7 firstObject];
  uint64_t v9 = [v8 layer];

  v37 = (void *)v9;
  v36 = [[QLPULayerAnimationGroup alloc] initWithReferenceLayer:v9];
  +[QLPUAnimationGroup pushAnimationGroup:](QLPUAnimationGroup, "pushAnimationGroup:");
  v46 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  obuint64_t j = v7;
  uint64_t v44 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
  if (v44)
  {
    uint64_t v42 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v66 != v42) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        v12 = [v11 layer];
        v13 = [v12 animationKeys];
        if ([v13 count])
        {
          v47 = v11;
          id v14 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v15 = v13;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v71 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v62;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v62 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v61 + 1) + 8 * j);
                id v21 = [v12 animationForKey:v20];
                if (v21) {
                  [v14 setObject:v21 forKeyedSubscript:v20];
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v61 objects:v71 count:16];
            }
            while (v17);
          }

          [v46 setObject:v14 forKey:v47];
        }
      }
      uint64_t v44 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
    }
    while (v44);
  }

  if (v38)
  {
    v59[0] = MEMORY[0x263EF8330];
    v59[1] = 3221225472;
    v59[2] = __86__UIView_QLPUAnimationGroup___qlpu_animateViews_withAnimationBlock_completionHandler___block_invoke;
    v59[3] = &unk_2642F5F28;
    id v60 = v38;
    [(QLPUAnimationGroup *)v36 setCompletionHandler:v59];
  }
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = __86__UIView_QLPUAnimationGroup___qlpu_animateViews_withAnimationBlock_completionHandler___block_invoke_2;
  v57[3] = &unk_2642F5458;
  id v22 = v36;
  v58 = v22;
  v39[2](v39, v57);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obja = obj;
  uint64_t v45 = [obja countByEnumeratingWithState:&v53 objects:v70 count:16];
  if (v45)
  {
    uint64_t v43 = *(void *)v54;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v54 != v43) {
          objc_enumerationMutation(obja);
        }
        uint64_t v48 = v23;
        double v24 = *(void **)(*((void *)&v53 + 1) + 8 * v23);
        id v25 = [v24 layer];
        double v26 = [v46 objectForKey:v24];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        double v27 = [v25 animationKeys];
        uint64_t v28 = [v27 countByEnumeratingWithState:&v49 objects:v69 count:16];
        if (v28)
        {
          uint64_t v29 = v28;
          uint64_t v30 = *(void *)v50;
          do
          {
            for (uint64_t k = 0; k != v29; ++k)
            {
              if (*(void *)v50 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void *)(*((void *)&v49 + 1) + 8 * k);
              v33 = [v26 objectForKeyedSubscript:v32];
              v34 = [v25 animationForKey:v32];
              if (v34 != v33)
              {
                v35 = [[QLPULayerAnimation alloc] initWithLayer:v25 key:v32];
                [(QLPUAnimationGroup *)v22 addSubAnimationGroup:v35];
              }
            }
            uint64_t v29 = [v27 countByEnumeratingWithState:&v49 objects:v69 count:16];
          }
          while (v29);
        }

        uint64_t v23 = v48 + 1;
      }
      while (v48 + 1 != v45);
      uint64_t v45 = [obja countByEnumeratingWithState:&v53 objects:v70 count:16];
    }
    while (v45);
  }

  +[QLPUAnimationGroup popAnimationGroup:v22];
}

- (id)_qlpu_animationDictionary
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v1 = [a1 layer];
  v2 = [v1 animationKeys];
  v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v1, "animationForKey:", v9, (void)v12);
        [v3 setObject:v10 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

@end