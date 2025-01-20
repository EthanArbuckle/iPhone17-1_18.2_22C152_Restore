@interface NTKRingsAndDotsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setRingsFillFractions:(id)a3;
@end

@implementation NTKRingsAndDotsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"NTKRingsAndDotsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setRingsFillFractions:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)NTKRingsAndDotsViewAccessibility;
  [(NTKRingsAndDotsViewAccessibility *)&v17 setRingsFillFractions:v4];
  char v16 = 0;
  objc_opt_class();
  v5 = __UIAccessibilityCastAsClass();
  if ([v5 count] == (char *)&dword_0 + 3)
  {
    v6 = [v5 objectAtIndex:0];
    [v6 floatValue];
    double v8 = v7;

    v9 = [v5 objectAtIndex:1];
    [v9 floatValue];
    double v11 = v10;

    v12 = [v5 objectAtIndex:2];
    [v12 floatValue];
    double v14 = v13;

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __58__NTKRingsAndDotsViewAccessibility_setRingsFillFractions___block_invoke;
    v15[3] = &__block_descriptor_56_e15___NSString_8__0l;
    *(double *)&v15[4] = v8;
    *(double *)&v15[5] = v11;
    *(double *)&v15[6] = v14;
    [(NTKRingsAndDotsViewAccessibility *)self _setAccessibilityLabelBlock:v15];
  }
}

id __58__NTKRingsAndDotsViewAccessibility_setRingsFillFractions___block_invoke(double *a1, uint64_t a2)
{
  if (a1[4] >= 0.0 || a1[5] >= 0.0 || a1[6] >= 0.0)
  {
    v3 = UIAXFormatFloatWithPercentage();
    id v4 = UIAXFormatFloatWithPercentage();
    v5 = UIAXFormatFloatWithPercentage();
    v2 = accessibilityWellnessStringUsingUnitNames(v3, v4, v5);
  }
  else
  {
    v2 = accessibilityLocalizedString(@"lifestyle.no.activity.data", a2);
  }

  return v2;
}

@end