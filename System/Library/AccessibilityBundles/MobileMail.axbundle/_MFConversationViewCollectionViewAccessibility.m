@interface _MFConversationViewCollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityShouldUseFallbackForVisibleContentInset;
- (CGRect)_accessibilityBoundsOfCellsToLoad;
- (int64_t)_axHeightOfCellsToLoad;
- (void)_axSetHeightOfCellsToLoad:(int64_t)a3;
@end

@implementation _MFConversationViewCollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_MFConversationViewCollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)_axHeightOfCellsToLoad
{
  return MEMORY[0x270F09640](self, &___MFConversationViewCollectionViewAccessibility___axHeightOfCellsToLoad);
}

- (void)_axSetHeightOfCellsToLoad:(int64_t)a3
{
}

- (CGRect)_accessibilityBoundsOfCellsToLoad
{
  *(void *)&r2.origin.y = self;
  *(void *)&r2.size.width = _MFConversationViewCollectionViewAccessibility;
  [(CGFloat *)(objc_super *)&r2.origin.y _accessibilityBoundsOfCellsToLoad];
  r2.origin.x = v3;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  [(_MFConversationViewCollectionViewAccessibility *)self contentInset];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(_MFConversationViewCollectionViewAccessibility *)self contentSize];
  double v17 = v16;
  double v19 = v18;
  v23.size.height = v9
                  + (double)[(_MFConversationViewCollectionViewAccessibility *)self _axHeightOfCellsToLoad];
  v21.origin.x = -v13;
  v21.origin.y = -v11;
  v21.size.width = v17 - v15;
  v21.size.height = v19 - v13;
  v23.origin.x = r2.origin.x;
  v23.origin.y = v5;
  v23.size.width = v7;
  return CGRectIntersection(v21, v23);
}

- (BOOL)_accessibilityShouldUseFallbackForVisibleContentInset
{
  return 1;
}

@end