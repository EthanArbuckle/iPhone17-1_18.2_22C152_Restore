@interface UITraitCollection
- (id)aceDisplayColorGamut;
- (id)aceDisplayColorScheme;
- (id)aceDisplayContrast;
- (id)aceDynamicTypeSize;
- (id)aceTextLegibilityWeight;
@end

@implementation UITraitCollection

- (id)aceDisplayColorScheme
{
  UIUserInterfaceStyle v2 = [(UITraitCollection *)self userInterfaceStyle];
  if ((unint64_t)v2 <= UIUserInterfaceStyleDark) {
    id v3 = *(id *)*(&off_1001438F0 + v2);
  }

  return v3;
}

- (id)aceDisplayColorGamut
{
  id v2 = [(UITraitCollection *)self displayGamut];
  if ((unint64_t)v2 + 1 <= 2) {
    id v2 = *(id *)*(&off_100143908 + (void)v2 + 1);
  }

  return v2;
}

- (id)aceTextLegibilityWeight
{
  id v2 = [(UITraitCollection *)self legibilityWeight];
  if ((unint64_t)v2 + 1 <= 2) {
    id v2 = *(id *)*(&off_100143920 + (void)v2 + 1);
  }

  return v2;
}

- (id)aceDynamicTypeSize
{
  UIContentSizeCategory v3 = [(UITraitCollection *)self preferredContentSizeCategory];

  v4 = (void **)&SAUIDynamicTypeSizeUnspecifiedValue;
  if (v3 != UIContentSizeCategoryUnspecified)
  {
    UIContentSizeCategory v5 = [(UITraitCollection *)self preferredContentSizeCategory];

    if (v5 == UIContentSizeCategorySmall)
    {
      v4 = (void **)&SAUIDynamicTypeSizeSmallValue;
    }
    else
    {
      UIContentSizeCategory v6 = [(UITraitCollection *)self preferredContentSizeCategory];

      if (v6 == UIContentSizeCategoryMedium)
      {
        v4 = (void **)&SAUIDynamicTypeSizeMediumValue;
      }
      else
      {
        UIContentSizeCategory v7 = [(UITraitCollection *)self preferredContentSizeCategory];

        if (v7 == UIContentSizeCategoryExtraSmall)
        {
          v4 = (void **)&SAUIDynamicTypeSizeExtraSmallValue;
        }
        else
        {
          UIContentSizeCategory v8 = [(UITraitCollection *)self preferredContentSizeCategory];

          if (v8 == UIContentSizeCategoryLarge)
          {
            v4 = (void **)&SAUIDynamicTypeSizeLargeValue;
          }
          else
          {
            UIContentSizeCategory v9 = [(UITraitCollection *)self preferredContentSizeCategory];

            if (v9 == UIContentSizeCategoryExtraLarge)
            {
              v4 = (void **)&SAUIDynamicTypeSizeExtraLargeValue;
            }
            else
            {
              UIContentSizeCategory v10 = [(UITraitCollection *)self preferredContentSizeCategory];

              if (v10 == UIContentSizeCategoryExtraExtraLarge)
              {
                v4 = (void **)&SAUIDynamicTypeSizeExtraExtraLargeValue;
              }
              else
              {
                UIContentSizeCategory v11 = [(UITraitCollection *)self preferredContentSizeCategory];

                if (v11 == UIContentSizeCategoryExtraExtraExtraLarge)
                {
                  v4 = (void **)&SAUIDynamicTypeSizeExtraExtraExtraLargeValue;
                }
                else
                {
                  UIContentSizeCategory v12 = [(UITraitCollection *)self preferredContentSizeCategory];

                  if (v12 == UIContentSizeCategoryAccessibilityMedium)
                  {
                    v4 = (void **)&SAUIDynamicTypeSizeAccessibilityMediumValue;
                  }
                  else
                  {
                    UIContentSizeCategory v13 = [(UITraitCollection *)self preferredContentSizeCategory];

                    if (v13 == UIContentSizeCategoryAccessibilityLarge)
                    {
                      v4 = (void **)&SAUIDynamicTypeSizeAccessibilityLargeValue;
                    }
                    else
                    {
                      UIContentSizeCategory v14 = [(UITraitCollection *)self preferredContentSizeCategory];

                      if (v14 == UIContentSizeCategoryAccessibilityExtraLarge)
                      {
                        v4 = (void **)&SAUIDynamicTypeSizeAccessibilityExtraLargeValue;
                      }
                      else
                      {
                        UIContentSizeCategory v15 = [(UITraitCollection *)self preferredContentSizeCategory];

                        if (v15 == UIContentSizeCategoryAccessibilityExtraExtraLarge)
                        {
                          v4 = (void **)&SAUIDynamicTypeSizeAccessibilityExtraExtraLargeValue;
                        }
                        else
                        {
                          UIContentSizeCategory v16 = [(UITraitCollection *)self preferredContentSizeCategory];

                          if (v16 == UIContentSizeCategoryAccessibilityExtraExtraExtraLarge) {
                            v4 = (void **)&SAUIDynamicTypeSizeAccessibilityExtraExtraExtraLargeValue;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v17 = *v4;

  return v17;
}

- (id)aceDisplayContrast
{
  id v2 = [(UITraitCollection *)self accessibilityContrast];
  if ((unint64_t)v2 + 1 <= 2) {
    id v2 = *(id *)*(&off_100143938 + (void)v2 + 1);
  }

  return v2;
}

@end