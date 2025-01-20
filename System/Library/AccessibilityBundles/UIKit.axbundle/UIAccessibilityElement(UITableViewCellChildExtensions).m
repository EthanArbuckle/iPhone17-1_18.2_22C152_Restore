@interface UIAccessibilityElement(UITableViewCellChildExtensions)
- (void)setTableCellYOffset:()UITableViewCellChildExtensions;
@end

@implementation UIAccessibilityElement(UITableViewCellChildExtensions)

- (void)setTableCellYOffset:()UITableViewCellChildExtensions
{
  id v9 = a1;
  uint64_t v8 = a2;
  float v7 = a3;
  id v6 = (id)[a1 _accessibilityValueForKey:@"TableViewStorage"];
  if (!v6)
  {
    id v6 = (id)[objc_allocWithZone(MEMORY[0x263EFF9A0]) init];

    [v9 _accessibilitySetRetainedValue:v6 forKey:@"TableViewStorage"];
  }
  *(float *)&double v3 = v7;
  id v5 = (id)objc_msgSend(NSNumber, "numberWithFloat:", v3, v6);
  objc_msgSend(v4, "setObject:forKey:");

  objc_storeStrong(&v6, 0);
}

@end