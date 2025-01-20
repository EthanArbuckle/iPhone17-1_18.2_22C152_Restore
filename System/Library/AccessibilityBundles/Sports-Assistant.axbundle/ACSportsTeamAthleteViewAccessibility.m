@interface ACSportsTeamAthleteViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation ACSportsTeamAthleteViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ACSportsTeamAthleteView";
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
  v3 = [(ACSportsTeamAthleteViewAccessibility *)self safeValueForKey:@"entity"];
  v4 = [(ACSportsTeamAthleteViewAccessibility *)self safeValueForKey:@"_numberLabel"];
  v5 = [v4 accessibilityLabel];

  if (v5)
  {
    v6 = NSString;
    v7 = accessibilityLocalizedString(@"athlete.number");
    uint64_t v8 = objc_msgSend(v6, "stringWithFormat:", v7, v5);
  }
  else
  {
    uint64_t v8 = 0;
  }
  v9 = [(ACSportsTeamAthleteViewAccessibility *)self safeValueForKey:@"_nameLabel"];
  uint64_t v10 = [v9 accessibilityLabel];

  uint64_t v33 = [v3 safeValueForKey:@"position"];
  v11 = [v3 safeValueForKey:@"injured"];
  char v12 = [v11 BOOLValue];

  v13 = [(ACSportsTeamAthleteViewAccessibility *)self safeValueForKey:@"_heightLabel"];
  v14 = [v13 accessibilityLabel];
  v15 = [v14 componentsSeparatedByString:@"-"];

  v34 = v3;
  v16 = (void *)v10;
  v17 = (void *)v8;
  if ([v15 count] == 2)
  {
    v18 = NSString;
    v19 = accessibilityLocalizedString(@"athlete.height.imperial");
    v20 = [v15 objectAtIndex:0];
    v21 = [v15 objectAtIndex:1];
    v22 = objc_msgSend(v18, "stringWithFormat:", v19, v20, v21);
  }
  else
  {
    v22 = 0;
  }
  v23 = NSString;
  v24 = accessibilityLocalizedString(@"athlete.weight.imperial");
  v25 = [(ACSportsTeamAthleteViewAccessibility *)self safeValueForKey:@"_weightLabel"];
  v26 = [v25 accessibilityLabel];
  v27 = objc_msgSend(v23, "stringWithFormat:", v24, v26);

  if (v12)
  {
    v32 = accessibilityLocalizedString(@"athlete.injured");
    v28 = (void *)v33;
    v29 = v17;
    v30 = __UIAXStringForVariables();
  }
  else
  {
    v28 = (void *)v33;
    v29 = v17;
    v30 = __UIAXStringForVariables();
  }

  return v30;
}

@end