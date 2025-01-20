@interface UITextView
@end

@implementation UITextView

uint64_t __89__UITextView_PrintSupport__ck_textKit2_drawVisibleTextInCurrentContextWithContainerView___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = [v3 rangeInElement];
  uint64_t v6 = [v4 containsRange:v5];

  if (v6)
  {
    unsigned int v34 = v6;
    [v3 layoutFragmentFrame];
    CGFloat v37 = v8;
    CGFloat v38 = v7;
    CGFloat v35 = v10;
    CGFloat v36 = v9;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v11 = [v3 textLineFragments];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v43 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          v17 = [*(id *)(a1 + 40) textLayoutManager];
          v18 = [*(id *)(a1 + 32) location];
          v19 = objc_msgSend(v17, "locationFromLocation:withOffset:", v18, objc_msgSend(v16, "characterRange"));

          if ([*(id *)(a1 + 32) containsLocation:v19])
          {
            [v16 typographicBounds];
            CGFloat v21 = v20;
            CGFloat v40 = v22;
            CGFloat v41 = v20;
            CGFloat v23 = v22;
            CGFloat v25 = v24;
            CGFloat v39 = v26;
            double v27 = *(double *)(a1 + 48);
            v48.origin.x = v38;
            v48.origin.y = v37;
            v48.size.width = v36;
            v48.size.height = v35;
            double v28 = v27 + CGRectGetMinX(v48);
            v49.origin.x = v21;
            v49.origin.y = v23;
            v49.size.width = v25;
            v49.size.height = v39;
            double v29 = v28 + CGRectGetMinX(v49);
            double v30 = *(double *)(a1 + 56);
            v50.origin.x = v38;
            v50.origin.y = v37;
            v50.size.width = v36;
            v50.size.height = v35;
            double v31 = v30 + CGRectGetMinY(v50);
            v51.origin.y = v40;
            v51.origin.x = v41;
            v51.size.width = v25;
            v51.size.height = v39;
            double v32 = v31 + CGRectGetMinY(v51);
            objc_msgSend(v16, "drawAtPoint:inContext:", UIGraphicsGetCurrentContext(), v29, v32);
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v13);
    }

    uint64_t v6 = v34;
  }

  return v6;
}

uint64_t __113__UITextView_SupportsDynamicallyTogglingAllowsTextAnimations__ck_supportsDynamicallyTogglingAllowsTextAnimations__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    uint64_t result = [*(id *)(a1 + 32) supportsDynamicallyTogglingAllowsTextAnimations];
  }
  else {
    uint64_t result = 0;
  }
  ck_supportsDynamicallyTogglingAllowsTextAnimations_supportsToggling = result;
  return result;
}

@end