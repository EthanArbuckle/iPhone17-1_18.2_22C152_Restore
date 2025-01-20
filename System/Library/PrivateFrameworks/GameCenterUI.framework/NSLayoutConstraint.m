@interface NSLayoutConstraint
@end

@implementation NSLayoutConstraint

void __141__NSLayoutConstraint_GKAdditions___gkConstraintsForViews_contiguouslyLaidOutVertically_overlap_withinView_insets_applyOrthogonalConstraints___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3 attribute:*(void *)(a1 + 56) relatedBy:0 toItem:v4 attribute:*(void *)(a1 + 64) multiplier:1.0 constant:-*(double *)(a1 + 72)];
    [*(id *)(a1 + 32) addObject:v5];
  }
  if (*(unsigned char *)(a1 + 112))
  {
    v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3 attribute:*(void *)(a1 + 80) relatedBy:0 toItem:*(void *)(a1 + 40) attribute:*(void *)(a1 + 80) multiplier:1.0 constant:*(double *)(a1 + 88)];
    [*(id *)(a1 + 32) addObject:v6];
    v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3 attribute:*(void *)(a1 + 96) relatedBy:0 toItem:*(void *)(a1 + 40) attribute:*(void *)(a1 + 96) multiplier:1.0 constant:-*(double *)(a1 + 104)];
    [*(id *)(a1 + 32) addObject:v7];
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void __102__NSLayoutConstraint_GKBaselineLayout___gkBaselineConstraintsForViewsFontsLeadings_superview_options___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v11 doubleValue];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    }
    else
    {
      id v5 = v11;
      [*(id *)(a1 + 32) addObject:v5];
      uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
      uint64_t v7 = *(void *)(v6 + 40);
      if (v7)
      {
        uint64_t v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:v5 attribute:12 relatedBy:0 toItem:v7 attribute:11 multiplier:1.0 constant:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
        if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
        {
          v9 = +[GKConstraintUpdateController sharedController];
          [v9 registerConstraint:v8 leading:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forFontTextStyle:*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
        }
        [*(id *)(a1 + 40) addObject:v8];

        uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8);
      }
      v10 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;
    }
  }
}

void __102__NSLayoutConstraint_GKBaselineLayout___gkBaselineConstraintsForViewsFontsLeadings_superview_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  id v7 = [v3 constraintWithItem:v4 attribute:1 relatedBy:0 toItem:v5 attribute:1 multiplier:1.0 constant:0.0];
  uint64_t v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(a1 + 32) attribute:2 relatedBy:0 toItem:v5 attribute:2 multiplier:1.0 constant:0.0];

  [*(id *)(a1 + 40) addObject:v7];
  [*(id *)(a1 + 40) addObject:v6];
}

@end