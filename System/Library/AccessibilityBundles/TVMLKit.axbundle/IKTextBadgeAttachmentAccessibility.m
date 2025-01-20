@interface IKTextBadgeAttachmentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation IKTextBadgeAttachmentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"IKTextBadgeAttachment";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  v3 = [(IKTextBadgeAttachmentAccessibility *)self badge];
  v4 = [v3 accessibilityLabel];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13.receiver = self;
      v13.super_class = (Class)IKTextBadgeAttachmentAccessibility;
      v9 = [(IKTextBadgeAttachmentAccessibility *)&v13 accessibilityLabel];
      v10 = v9;
      if (v9)
      {
        id v7 = v9;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = [v3 attributes];
          v12 = [v11 objectForKeyedSubscript:@"src"];
          accessibilityRetrieveLabelForSource(v12);
          id v7 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id v7 = 0;
        }
      }

      goto LABEL_6;
    }
    id v6 = [v3 textContent];
  }
  id v7 = v6;
LABEL_6:

  return v7;
}

@end