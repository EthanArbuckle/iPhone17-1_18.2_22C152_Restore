@interface CalendarMessageUIProxyAccessibility
+ (Class)CalendarComposeRecipientClass;
+ (Class)ComposeRecipientViewClass;
+ (Class)MFContactsSearchManagerClass;
+ (Class)MFContactsSearchResultsModelClass;
+ (Class)MailComposeRecipientClass;
+ (Class)RecipientTableViewCellClass;
+ (Class)SearchShadowViewClass;
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation CalendarMessageUIProxyAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CalendarMessageUIProxy";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CalendarMessageUIProxy", @"CalendarComposeRecipientClass", "#", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CalendarMessageUIProxy", @"MailComposeRecipientClass", "#", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CalendarMessageUIProxy", @"ComposeRecipientViewClass", "#", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CalendarMessageUIProxy", @"RecipientTableViewCellClass", "#", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CalendarMessageUIProxy", @"SearchShadowViewClass", "#", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CalendarMessageUIProxy", @"MFContactsSearchManagerClass", "#", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"CalendarMessageUIProxy", @"MFContactsSearchResultsModelClass", "#", 0);
}

+ (Class)CalendarComposeRecipientClass
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CalendarMessageUIProxyAccessibility;
  id v2 = objc_msgSendSuper2(&v4, sel_CalendarComposeRecipientClass);
  LoadMessageUI();

  return (Class)v2;
}

+ (Class)MailComposeRecipientClass
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CalendarMessageUIProxyAccessibility;
  id v2 = objc_msgSendSuper2(&v4, sel_MailComposeRecipientClass);
  LoadMessageUI();

  return (Class)v2;
}

+ (Class)ComposeRecipientViewClass
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CalendarMessageUIProxyAccessibility;
  id v2 = objc_msgSendSuper2(&v4, sel_ComposeRecipientViewClass);
  LoadMessageUI();

  return (Class)v2;
}

+ (Class)RecipientTableViewCellClass
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CalendarMessageUIProxyAccessibility;
  id v2 = objc_msgSendSuper2(&v4, sel_RecipientTableViewCellClass);
  LoadMessageUI();

  return (Class)v2;
}

+ (Class)SearchShadowViewClass
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CalendarMessageUIProxyAccessibility;
  id v2 = objc_msgSendSuper2(&v4, sel_SearchShadowViewClass);
  LoadMessageUI();

  return (Class)v2;
}

+ (Class)MFContactsSearchManagerClass
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CalendarMessageUIProxyAccessibility;
  id v2 = objc_msgSendSuper2(&v4, sel_MFContactsSearchManagerClass);
  LoadMessageUI();

  return (Class)v2;
}

+ (Class)MFContactsSearchResultsModelClass
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CalendarMessageUIProxyAccessibility;
  id v2 = objc_msgSendSuper2(&v4, sel_MFContactsSearchResultsModelClass);
  LoadMessageUI();

  return (Class)v2;
}

@end