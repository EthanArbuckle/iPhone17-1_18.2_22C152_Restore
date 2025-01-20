@interface _TVStackCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityScrollingEnabled;
- (BOOL)_accessibilitySupportsSemanticContext;
@end

@implementation _TVStackCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVStackCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySupportsSemanticContext
{
  return 0;
}

- (BOOL)_accessibilityScrollingEnabled
{
  NSClassFromString(&cfstr_Tvcarouselview_2.isa);
  char v11 = 0;
  objc_opt_class();
  v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 contentView];
  v5 = [v4 subviews];
  v6 = [v5 firstObject];
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_TVStackCollectionViewCellAccessibility;
    BOOL v8 = [(_TVStackCollectionViewCellAccessibility *)&v10 _accessibilityScrollingEnabled];
  }

  return v8;
}

@end