@interface WAUIDimmingViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)passthroughViews;
@end

@implementation WAUIDimmingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIDimmingView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)passthroughViews
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v16.receiver = self;
    v16.super_class = (Class)WAUIDimmingViewAccessibility;
    v3 = [(WAUIDimmingViewAccessibility *)&v16 passthroughViews];
    v4 = [MEMORY[0x263EFF980] array];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
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
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            objc_msgSend(v4, "addObject:", v10, (void)v12);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
      }
      while (v7);
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)WAUIDimmingViewAccessibility;
    v4 = [(WAUIDimmingViewAccessibility *)&v17 passthroughViews];
  }

  return v4;
}

@end