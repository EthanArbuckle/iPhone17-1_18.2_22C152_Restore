@interface PSSegmentTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityIgnoreInternalLabels;
- (int64_t)accessibilityContainerType;
@end

@implementation PSSegmentTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSSegmentTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 1;
}

@end