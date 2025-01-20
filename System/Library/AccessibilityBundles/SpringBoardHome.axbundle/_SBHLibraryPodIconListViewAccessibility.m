@interface _SBHLibraryPodIconListViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)accessibilityScroll:(int64_t)a3;
@end

@implementation _SBHLibraryPodIconListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_SBHLibraryPodIconListView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SBHLibraryPodFolderView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibraryPodFolderView", @"librarySearchControllerScrollViewDelegate", "@", 0);
  [v3 validateClass:@"SBHLibrarySearchController"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBHLibrarySearchController", @"setActive:", "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UIScrollView", @"_minimumContentOffset", "{CGPoint=dd}", 0);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  v5 = [(_SBHLibraryPodIconListViewAccessibility *)self _accessibilityAncestorIsKindOf:objc_opt_class()];
  v6 = v5;
  if (a3 == 3
    && ([v5 contentOffset],
        double v8 = v7,
        [v6 safeCGPointForKey:@"_minimumContentOffset"],
        v8 == v9))
  {
    v10 = [(_SBHLibraryPodIconListViewAccessibility *)self _accessibilityAncestorIsKindOf:NSClassFromString(&cfstr_Sbhlibrarypodf_1.isa)];
    v11 = [v10 safeValueForKey:@"librarySearchControllerScrollViewDelegate"];
    v12 = __UIAccessibilitySafeClass();

    v16 = v12;
    id v13 = v12;
    AXPerformSafeBlock();

    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

@end