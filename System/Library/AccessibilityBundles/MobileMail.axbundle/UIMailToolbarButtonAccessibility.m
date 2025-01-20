@interface UIMailToolbarButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation UIMailToolbarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIToolbarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(UIMailToolbarButtonAccessibility *)self accessibilityIdentification];
  v9.receiver = self;
  v9.super_class = (Class)UIMailToolbarButtonAccessibility;
  v4 = [(UIMailToolbarButtonAccessibility *)&v9 accessibilityLabel];
  if ([v3 isEqualToString:@"transferButton"])
  {
    v5 = @"transfer.mail.button";
LABEL_3:
    accessibilityLocalizedString(v5);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"wildcat_trash"]
    || [v4 isEqualToString:@"wildcat_reply"]
    || [v4 isEqualToString:@"wildcat_compose"])
  {
    UIKitAccessibilityLocalizedString();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ([v4 isEqualToString:@"wildcat_getnewmail"])
    {
      v5 = @"new.mail.button";
      goto LABEL_3;
    }
    if ([v4 isEqualToString:@"archive"])
    {
      v5 = @"archive.button";
      goto LABEL_3;
    }
    if ([v4 hasPrefix:@"FilterIcon"])
    {
      v5 = @"filter.button";
      goto LABEL_3;
    }
    if ([v4 hasPrefix:@"FlagIcon"])
    {
      v5 = @"mark.message.button";
      goto LABEL_3;
    }
    id v6 = v4;
  }
LABEL_8:
  v7 = v6;

  return v7;
}

@end