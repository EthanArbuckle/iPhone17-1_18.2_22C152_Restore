@interface PBShelfTileAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PBShelfTileAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBShelfTile";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_allocWithZone(MEMORY[0x263EFF980]) init];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v4 = [(PBShelfTileAccessibility *)self safeValueForKeyPath:@"superview.subviews"];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [v3 indexOfObject:self];
  v11 = NSString;
  v12 = axLocalizedString(@"photo.position");
  v13 = MEMORY[0x24565B1E0](v10 + 1);
  v14 = objc_msgSend(v11, "stringWithFormat:", v12, v13);

  return v14;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2 = *MEMORY[0x263F1CF00];
  v3 = [(PBShelfTileAccessibility *)self safeValueForKey:@"isSelected"];
  int v4 = [v3 BOOLValue];

  uint64_t v5 = *MEMORY[0x263F1CF38];
  if (!v4) {
    uint64_t v5 = 0;
  }
  return v5 | v2;
}

@end