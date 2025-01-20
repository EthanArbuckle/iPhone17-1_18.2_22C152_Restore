@interface MUPlaceHeaderButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation MUPlaceHeaderButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUPlaceHeaderButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  char v19 = 0;
  objc_opt_class();
  v3 = __UIAccessibilityCastAsClass();
  v4 = [v3 configuration];
  v5 = v4;
  if (!v4)
  {
    v18.receiver = self;
    v18.super_class = (Class)MUPlaceHeaderButtonAccessibility;
    uint64_t v10 = [(MUPlaceHeaderButtonAccessibility *)&v18 accessibilityLabel];
LABEL_10:
    v12 = (void *)v10;
    goto LABEL_25;
  }
  v6 = [v4 image];
  if (v6)
  {

    goto LABEL_4;
  }
  v11 = [v5 title];

  if (v11)
  {
    uint64_t v10 = [v5 title];
    goto LABEL_10;
  }
LABEL_4:
  v7 = [v5 image];
  v8 = [v7 description];

  if ([v8 containsString:@"menu"])
  {
LABEL_21:
    uint64_t v13 = [v5 title];
    goto LABEL_22;
  }
  if ([v8 containsString:@"car"])
  {
    v9 = @"travel.time.driving";
    goto LABEL_20;
  }
  if ([v8 containsString:@"walk"])
  {
    v9 = @"travel.time.walking";
    goto LABEL_20;
  }
  if ([v8 containsString:@"tram"])
  {
    v9 = @"travel.time.transit";
    goto LABEL_20;
  }
  if ([v8 containsString:@"bicycle"])
  {
    v9 = @"travel.time.bike";
    goto LABEL_20;
  }
  if (![v8 containsString:@"ellipsis"])
  {
    v9 = &stru_26F6F4CD0;
LABEL_20:
    if (![(__CFString *)v9 isEqualToString:&stru_26F6F4CD0])
    {
      v14 = NSString;
      v15 = accessibilityLocalizedString(v9);
      v16 = [v5 title];
      v12 = objc_msgSend(v14, "localizedStringWithFormat:", v15, v16);

      goto LABEL_24;
    }
    goto LABEL_21;
  }
  uint64_t v13 = accessibilityLocalizedString(@"MORE");
LABEL_22:
  v12 = (void *)v13;
LABEL_24:

LABEL_25:

  return v12;
}

@end