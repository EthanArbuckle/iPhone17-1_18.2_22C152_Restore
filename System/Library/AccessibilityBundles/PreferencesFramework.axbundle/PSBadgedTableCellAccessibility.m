@interface PSBadgedTableCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityValue;
- (void)badgeWithInteger:(int64_t)a3;
@end

@implementation PSBadgedTableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSBadgedTableCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)badgeWithInteger:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PSBadgedTableCellAccessibility;
  -[PSBadgedTableCellAccessibility badgeWithInteger:](&v6, sel_badgeWithInteger_);
  v5 = [NSNumber numberWithInteger:a3];
  [(PSBadgedTableCellAccessibility *)self _accessibilitySetRetainedValue:v5 forKey:@"AXBadgeNumber"];
}

- (id)accessibilityValue
{
  v3 = [(PSBadgedTableCellAccessibility *)self _accessibilityValueForKey:@"AXBadgeNumber"];
  int v4 = [v3 intValue];
  if (v4 < 1)
  {
    v10.receiver = self;
    v10.super_class = (Class)PSBadgedTableCellAccessibility;
    v8 = [(PSBadgedTableCellAccessibility *)&v10 accessibilityValue];
  }
  else
  {
    uint64_t v5 = v4;
    objc_super v6 = NSString;
    v7 = accessibilityLocalizedString(@"software.update.cell.count");
    v8 = objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
  }

  return v8;
}

@end