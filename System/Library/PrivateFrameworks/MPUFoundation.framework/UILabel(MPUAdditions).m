@interface UILabel(MPUAdditions)
- (BOOL)MPU_automaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts;
- (id)MPU_contentSizeUpdater;
- (void)MPU_configureWithTextAttributes:()MPUAdditions;
- (void)MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:()MPUAdditions;
@end

@implementation UILabel(MPUAdditions)

- (void)MPU_configureWithTextAttributes:()MPUAdditions
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F1C238];
  id v14 = v4;
  v6 = [v4 objectForKey:*MEMORY[0x263F1C238]];

  if (v6)
  {
    v7 = [v14 objectForKey:v5];
    [a1 setFont:v7];
  }
  uint64_t v8 = *MEMORY[0x263F1C240];
  v9 = [v14 objectForKey:*MEMORY[0x263F1C240]];

  if (v9)
  {
    v10 = [v14 objectForKey:v8];
    [a1 setTextColor:v10];
  }
  uint64_t v11 = *MEMORY[0x263F1C210];
  v12 = [v14 objectForKey:*MEMORY[0x263F1C210]];

  if (v12)
  {
    v13 = [v14 objectForKey:v11];
    [a1 setBackgroundColor:v13];
  }
}

- (id)MPU_contentSizeUpdater
{
  return objc_getAssociatedObject(a1, &_MPULabelContentSizeUpdaterKey);
}

- (BOOL)MPU_automaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts
{
  v1 = objc_msgSend(a1, "MPU_contentSizeUpdater");
  BOOL v2 = v1 != 0;

  return v2;
}

- (void)MPU_setAutomaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts:()MPUAdditions
{
  if (objc_msgSend(a1, "MPU_automaticallyUpdatesTextStyleFontsToPreferredTextStyleFonts") != a3)
  {
    if (a3)
    {
      value = objc_alloc_init(MPUTextContainerContentSizeUpdater);
      [(MPUTextContainerContentSizeUpdater *)value setTextContainer:a1];
    }
    else
    {
      value = 0;
    }
    objc_setAssociatedObject(a1, &_MPULabelContentSizeUpdaterKey, value, (void *)1);
  }
}

@end