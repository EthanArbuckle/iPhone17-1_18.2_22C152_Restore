@interface SBFloatyFolderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_currentPageIndexDidChange;
@end

@implementation SBFloatyFolderViewAccessibility

- (void)_currentPageIndexDidChange
{
  v11.receiver = self;
  v11.super_class = (Class)SBFloatyFolderViewAccessibility;
  [(SBFloatyFolderViewAccessibility *)&v11 _currentPageIndexDidChange];
  uint64_t v3 = [(SBFloatyFolderViewAccessibility *)self safeIntegerForKey:@"minimumPageIndex"];
  uint64_t v4 = [(SBFloatyFolderViewAccessibility *)self safeIntegerForKey:@"currentPageIndex"];
  v5 = [(SBFloatyFolderViewAccessibility *)self safeValueForKey:@"_iconListViews"];
  if ([v5 count])
  {
    unint64_t v6 = 0;
    uint64_t v7 = v4 - v3;
    do
    {
      if (v7 == v6)
      {
        v8 = [v5 objectAtIndexedSubscript:v7];
        v9 = v8;
        uint64_t v10 = 0;
      }
      else
      {
        v8 = [v5 objectAtIndexedSubscript:v6];
        v9 = v8;
        uint64_t v10 = 1;
      }
      [v8 setAccessibilityElementsHidden:v10];

      ++v6;
    }
    while ([v5 count] > v6);
  }
}

+ (id)safeCategoryTargetClassName
{
  return @"SBFloatyFolderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBFloatyFolderView" isKindOfClass:@"SBFolderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"currentPageIndex", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFolderView", @"minimumPageIndex", "q", 0);
  [v3 validateClass:@"SBFolderView" hasInstanceVariable:@"_iconListViews" withType:"NSMutableArray"];
}

@end