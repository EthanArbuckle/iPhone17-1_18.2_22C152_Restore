@interface ARUIRingGroupControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityLocalizedRingDescriptions;
- (id)_accessibilityRingValues;
@end

@implementation ARUIRingGroupControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ARUIRingGroupController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"ARUIRingGroupController" hasInstanceVariable:@"_ringGroup" withType:"ARUIRingGroup"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ARUIRingGroup", @"rings", "@", 0);
  [v3 validateClass:@"ARUIRing"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"ARUIRing", @"percentage", "f", 0);
}

- (id)_accessibilityLocalizedRingDescriptions
{
  objc_opt_class();
  id v3 = [(ARUIRingGroupControllerAccessibility *)self _accessibilityValueForKey:@"AXRingGroupControllerPrefixOverrides"];
  v4 = __UIAccessibilityCastAsClass();

  v5 = [(ARUIRingGroupControllerAccessibility *)self _accessibilityRingValues];
  v6 = (char *)[v4 count];
  v7 = (char *)[v5 count];
  if (!v6)
  {
    if (v7 == (unsigned char *)&dword_0 + 3)
    {
      v13 = [v5 objectAtIndexedSubscript:2];
      [v13 floatValue];

      v14 = [v5 objectAtIndexedSubscript:1];
      [v14 floatValue];

      v15 = [v5 objectAtIndexedSubscript:0];
      [v15 floatValue];

      v26 = accessibilityLocalizedString(@"activity.moving.percentage");
      v25 = AXFormatFloatWithPercentage();
      v24 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v25);
      v27[0] = v24;
      v16 = accessibilityLocalizedString(@"activity.exercising.percentage");
      v17 = AXFormatFloatWithPercentage();
      v18 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v16, v17);
      v27[1] = v18;
      if (_userIsWheelchairUserWithVoiceOverOn()) {
        v19 = @"activity.wheelchair.percentage";
      }
      else {
        v19 = @"activity.standing.percentage";
      }
      v20 = accessibilityLocalizedString(v19);
      v21 = AXFormatFloatWithPercentage();
      v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v21);
      v27[2] = v22;
      v8 = +[NSArray arrayWithObjects:v27 count:3];

      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (v6 != v7)
  {
LABEL_11:
    v8 = &__NSArray0__struct;
    goto LABEL_12;
  }
  v8 = +[NSMutableArray array];
  uint64_t v9 = (uint64_t)(v6 - 1);
  if (v9 >= 0)
  {
    do
    {
      v10 = [v4 objectAtIndexedSubscript:v9];
      [v8 addObject:v10];

      v11 = [v5 objectAtIndexedSubscript:v9];
      [v11 floatValue];
      v12 = AXFormatFloatWithPercentage();
      [v8 addObject:v12];

      --v9;
    }
    while (v9 != -1);
  }
LABEL_12:

  return v8;
}

- (id)_accessibilityRingValues
{
  id v3 = +[NSMutableArray array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(ARUIRingGroupControllerAccessibility *)self safeValueForKey:@"_ringGroup", 0];
  v5 = [v4 safeArrayForKey:@"rings"];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) safeFloatForKey:@"percentage"];
        v10 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
        [v3 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

@end