@interface CKDetailsShowMoreContactsCell
+ (BOOL)shouldHighlight;
+ (Class)cellClass;
+ (double)preferredHeight;
+ (id)reuseIdentifier;
@end

@implementation CKDetailsShowMoreContactsCell

+ (Class)cellClass
{
  v2 = +[CKUIBehavior sharedBehaviors];
  [v2 isAccessibilityPreferredContentSizeCategory];
  id v3 = (id)objc_opt_class();

  return (Class)v3;
}

+ (id)reuseIdentifier
{
  return @"CKDetailsShowMoreContactsCell_reuseIdentifier";
}

+ (BOOL)shouldHighlight
{
  return 1;
}

+ (double)preferredHeight
{
  return 44.0;
}

@end