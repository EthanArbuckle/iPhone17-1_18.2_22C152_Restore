@interface SKUITracklistLockupCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
@end

@implementation SKUITracklistLockupCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUITracklistLockupCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  v2 = [(SKUITracklistLockupCollectionViewCellAccessibility *)self safeValueForKey:@"contentView"];
  v3 = [v2 safeValueForKey:@"subviews"];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v4 = v3;
  uint64_t v34 = [v4 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (!v34)
  {
    v6 = 0;
    goto LABEL_32;
  }
  uint64_t v5 = 0;
  v6 = 0;
  uint64_t v33 = *(void *)v40;
  id v30 = v4;
  do
  {
    uint64_t v7 = 0;
    uint64_t v29 = v5;
    do
    {
      if (*(void *)v40 != v33) {
        objc_enumerationMutation(v4);
      }
      v8 = *(void **)(*((void *)&v39 + 1) + 8 * v7);
      NSClassFromString(&cfstr_Skuibarratingv_0.isa);
      if (objc_opt_isKindOfClass())
      {
        v9 = accessibilitySKUILocalizedString(@"popularity");
        v27 = [v8 accessibilityValue];
        v28 = @"__AXStringForVariablesSentinel";
        v26 = v9;
        uint64_t v10 = __UIAXStringForVariables();

        v6 = v27;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          goto LABEL_28;
        }
        v9 = [v8 accessibilityLabel];
        if ([v9 rangeOfString:@":"] != 0x7FFFFFFFFFFFFFFFLL && v5 == 5)
        {
          v32 = v6;
          v12 = [v9 componentsSeparatedByString:@":"];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          v31 = v12;
          v13 = [v12 reverseObjectEnumerator];
          v14 = [v13 allObjects];

          uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = 0;
            uint64_t v18 = *(void *)v36;
            double v19 = 0.0;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v36 != v18) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v21 = objc_msgSend(*(id *)(*((void *)&v35 + 1) + 8 * i), "integerValue", v26, v27, v28);
                uint64_t v22 = 3600 * v21;
                uint64_t v23 = 60 * v21;
                if (v17 + i != 1) {
                  uint64_t v23 = v21;
                }
                if (v17 + i != 2) {
                  uint64_t v22 = v23;
                }
                double v19 = v19 + (double)v22;
              }
              v17 += v16;
              uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v16);
          }

          uint64_t v24 = AXDurationStringForDuration();

          v9 = (void *)v24;
          id v4 = v30;
          v6 = v32;
        }
        v26 = v9;
        v27 = @"__AXStringForVariablesSentinel";
        uint64_t v10 = __UIAXStringForVariables();
      }

      v6 = (void *)v10;
LABEL_28:
      ++v5;
      ++v7;
    }
    while (v7 != v34);
    uint64_t v5 = v29 + v34;
    uint64_t v34 = [v4 countByEnumeratingWithState:&v39 objects:v44 count:16];
  }
  while (v34);
LABEL_32:

  return v6;
}

- (id)_accessibilitySupplementaryFooterViews
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v2 = [(SKUITracklistLockupCollectionViewCellAccessibility *)self safeValueForKey:@"contentView"];
  v3 = [v2 safeValueForKey:@"subviews"];

  id v4 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v10, "isAccessibilityElement", (void)v12))
        {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end