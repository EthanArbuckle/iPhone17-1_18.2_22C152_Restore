@interface UIDateLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation UIDateLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIDateLabel";
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
  v34 = self;
  SEL v33 = a2;
  id v15 = (id)[(UIDateLabelAccessibility *)self safeValueForKey:@"use24HourTime"];
  char v16 = [v15 BOOLValue];

  char v32 = v16 & 1;
  id v17 = (id)[(UIDateLabelAccessibility *)v34 safeValueForKey:@"timeDesignatorAppearsBeforeTime"];
  char v18 = [v17 BOOLValue];

  char v31 = v18 & 1;
  id v19 = (id)[(UIDateLabelAccessibility *)v34 safeValueForKey:@"timeInterval"];
  [v19 doubleValue];
  double v20 = v2;

  double v30 = v20;
  id v29 = (id)[(UIDateLabelAccessibility *)v34 safeStringForKey:@"text"];
  id v28 = (id)[(UIDateLabelAccessibility *)v34 safeStringForKey:@"timeDesignator"];
  id location = 0;
  if ((v16 & 1) != 0 || !v28)
  {
    objc_storeStrong(&location, v29);
  }
  else if (v29)
  {
    if (v31) {
      id v3 = (id)[NSString stringWithFormat:@"%@ %@", v28, v29];
    }
    else {
      id v3 = (id)[NSString stringWithFormat:@"%@ %@", v29, v28];
    }
    id v4 = location;
    id location = v3;
  }
  else
  {
    objc_storeStrong(&location, v28);
  }
  id v26 = (id)[MEMORY[0x263EFF910] date];
  id v25 = (id)[MEMORY[0x263EFF8F0] currentCalendar];
  id v10 = (id)[v25 timeZone];
  id v24 = (id)objc_msgSend(v25, "componentsInTimeZone:fromDate:");

  objc_msgSend(v24, "setHour:");
  [v24 setMinute:0];
  [v24 setSecond:0];
  id v11 = (id)[v24 date];
  [v11 timeIntervalSinceReferenceDate];
  double v12 = v5;

  double v23 = v12;
  objc_msgSend(v24, "setDay:", objc_msgSend(v24, "day") + 1);
  id v13 = (id)[v24 date];
  [v13 timeIntervalSinceReferenceDate];
  double v14 = v6;

  double v22 = v14;
  id v21 = (id)[MEMORY[0x263F21660] axAttributedStringWithString:location];
  double v7 = v30;
  if (v30 < v12 || (double v7 = v30, v30 >= v22)) {
    objc_msgSend(v21, "setAttribute:forKey:", *MEMORY[0x263EFFB40], *MEMORY[0x263F21718], v7);
  }
  else {
    objc_msgSend(v21, "setAttribute:forKey:", *MEMORY[0x263EFFB40], *MEMORY[0x263F21708], v30);
  }
  id v9 = v21;
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);

  return v9;
}

@end