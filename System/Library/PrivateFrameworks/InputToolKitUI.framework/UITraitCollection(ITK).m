@interface UITraitCollection(ITK)
- (BOOL)itk_hasCompactHeight;
- (BOOL)itk_hasCompactWidth;
- (BOOL)itk_hasEqualSizeToTraitCollection:()ITK;
- (BOOL)itk_isCarPlay;
- (BOOL)itk_isDark;
- (BOOL)itk_isOptimizedForMac;
- (BOOL)itk_isRTL;
- (BOOL)itk_isTV;
- (BOOL)itk_isVision;
- (BOOL)itk_isiPad;
- (BOOL)itk_isiPhone;
- (double)itk_contentSizeScaleFactor;
- (id)itk_traitCollectionClampedToNonaccessibilityContentSize;
- (id)itk_traitCollectionWithContentSize:()ITK;
- (uint64_t)itk_hasCompactSize;
@end

@implementation UITraitCollection(ITK)

- (uint64_t)itk_hasCompactSize
{
  if (objc_msgSend(a1, "itk_hasCompactWidth")) {
    return 1;
  }
  return objc_msgSend(a1, "itk_hasCompactHeight");
}

- (BOOL)itk_hasCompactHeight
{
  return [a1 verticalSizeClass] == 1;
}

- (BOOL)itk_hasCompactWidth
{
  return [a1 horizontalSizeClass] == 1;
}

- (BOOL)itk_isiPhone
{
  return [a1 userInterfaceIdiom] == 0;
}

- (BOOL)itk_isiPad
{
  return [a1 userInterfaceIdiom] == 1;
}

- (BOOL)itk_isOptimizedForMac
{
  return [a1 userInterfaceIdiom] == 5;
}

- (BOOL)itk_isVision
{
  return [a1 userInterfaceIdiom] == 6;
}

- (BOOL)itk_isTV
{
  return [a1 userInterfaceIdiom] == 2;
}

- (BOOL)itk_isCarPlay
{
  return [a1 userInterfaceIdiom] == 3;
}

- (BOOL)itk_isDark
{
  return [a1 userInterfaceStyle] == 2;
}

- (BOOL)itk_isRTL
{
  return [a1 layoutDirection] == 1;
}

- (BOOL)itk_hasEqualSizeToTraitCollection:()ITK
{
  id v4 = a3;
  uint64_t v5 = [a1 horizontalSizeClass];
  if (v5 == [v4 horizontalSizeClass])
  {
    uint64_t v6 = [a1 verticalSizeClass];
    BOOL v7 = v6 == [v4 verticalSizeClass];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)itk_traitCollectionClampedToNonaccessibilityContentSize
{
  id v1 = a1;
  v2 = [v1 preferredContentSizeCategory];
  if (([v2 isEqualToString:*MEMORY[0x263F83418]] & 1) != 0
    || ([v2 isEqualToString:*MEMORY[0x263F83410]] & 1) != 0
    || ([v2 isEqualToString:*MEMORY[0x263F83408]] & 1) != 0
    || [v2 isEqualToString:*MEMORY[0x263F83400]])
  {
    uint64_t v3 = [v1 traitCollectionByModifyingTraits:&__block_literal_global_2];

    id v1 = (id)v3;
  }

  return v1;
}

- (id)itk_traitCollectionWithContentSize:()ITK
{
  id v4 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__UITraitCollection_ITK__itk_traitCollectionWithContentSize___block_invoke;
  v8[3] = &unk_26538E2E8;
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = [a1 traitCollectionByModifyingTraits:v8];

  return v6;
}

- (double)itk_contentSizeScaleFactor
{
  id v1 = [a1 preferredContentSizeCategory];
  if (v1 == (void *)*MEMORY[0x263F83458])
  {
    double v2 = 0.8;
  }
  else if (v1 == (void *)*MEMORY[0x263F83488])
  {
    double v2 = 0.85;
  }
  else if (v1 == (void *)*MEMORY[0x263F83470])
  {
    double v2 = 0.9;
  }
  else
  {
    double v2 = 1.0;
    if (v1 != (void *)*MEMORY[0x263F83468] && v1 != (void *)*MEMORY[0x263F83490])
    {
      if (v1 == (void *)*MEMORY[0x263F83450])
      {
        double v2 = 1.1;
      }
      else if (v1 == (void *)*MEMORY[0x263F83440])
      {
        double v2 = 1.2;
      }
      else if (v1 == (void *)*MEMORY[0x263F83430])
      {
        double v2 = 1.35;
      }
      else if (v1 == (void *)*MEMORY[0x263F83420])
      {
        double v2 = 1.6;
      }
      else if (v1 == (void *)*MEMORY[0x263F83418])
      {
        double v2 = 1.9;
      }
      else if (v1 == (void *)*MEMORY[0x263F83410])
      {
        double v2 = 2.35;
      }
      else if (v1 == (void *)*MEMORY[0x263F83408])
      {
        double v2 = 2.75;
      }
      else if (v1 == (void *)*MEMORY[0x263F83400])
      {
        double v2 = 3.1;
      }
      else
      {
        double v2 = 1.0;
      }
    }
  }

  return v2;
}

@end