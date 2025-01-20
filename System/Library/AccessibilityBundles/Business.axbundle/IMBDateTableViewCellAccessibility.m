@interface IMBDateTableViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation IMBDateTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Business.IMBDateTableViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Business.IMBDateTableViewCell", @"dateLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Business.IMBDateTableViewCell", @"conflictsLabel", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Business.IMBDateTableViewCell", @"showMoreButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Business.IMBDateTableViewCell", @"viewInCalendarButton", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"Business.IMBDateTableViewCell", @"timeslotContainerView", "@", 0);
}

- (id)accessibilityElements
{
  v12[5] = *MEMORY[0x263EF8340];
  id v3 = [(IMBDateTableViewCellAccessibility *)self safeValueForKey:@"dateLabel"];
  v4 = [(IMBDateTableViewCellAccessibility *)self safeValueForKey:@"conflictsLabel"];
  v5 = [(IMBDateTableViewCellAccessibility *)self safeValueForKey:@"showMoreButton"];
  v6 = [(IMBDateTableViewCellAccessibility *)self safeValueForKey:@"viewInCalendarButton"];
  v7 = [(IMBDateTableViewCellAccessibility *)self safeValueForKey:@"timeslotContainerView"];
  v8 = objc_opt_new();
  v9 = objc_msgSend(v7, "accessibilityElements", v3, v5);
  v12[2] = v9;
  v12[3] = v4;
  v12[4] = v6;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];
  [v8 axSafelyAddObjectsFromArray:v10];

  return v8;
}

@end