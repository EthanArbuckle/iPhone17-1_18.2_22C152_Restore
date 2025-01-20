@interface CalendarMessageUIProxy
+ (Class)CalendarComposeRecipientClass;
+ (Class)ComposeRecipientViewClass;
+ (Class)MFAutocompleteResultsTableViewController;
+ (Class)MFContactsSearchManagerClass;
+ (Class)MFContactsSearchResultsModelClass;
+ (Class)MFMailComposeViewControllerClass;
+ (Class)MFMessageComposeViewControllerClass;
+ (Class)MailComposeRecipientClass;
+ (Class)RecipientTableViewCellClass;
+ (Class)SearchShadowViewClass;
@end

@implementation CalendarMessageUIProxy

+ (Class)CalendarComposeRecipientClass
{
  v2 = (objc_class *)CalendarComposeRecipientClass_class;
  if (!CalendarComposeRecipientClass_class)
  {
    v2 = __MessageUIClassFromString(@"MFCalendarComposeRecipient");
    CalendarComposeRecipientClass_class = (uint64_t)v2;
  }

  return v2;
}

+ (Class)MailComposeRecipientClass
{
  v2 = (objc_class *)MailComposeRecipientClass_class;
  if (!MailComposeRecipientClass_class)
  {
    v2 = __MessageUIClassFromString(@"MailComposeRecipient");
    MailComposeRecipientClass_class = (uint64_t)v2;
  }

  return v2;
}

+ (Class)ComposeRecipientViewClass
{
  v2 = (objc_class *)ComposeRecipientViewClass_class;
  if (!ComposeRecipientViewClass_class)
  {
    v2 = __MessageUIClassFromString(@"MFComposeRecipientTextView");
    ComposeRecipientViewClass_class = (uint64_t)v2;
  }

  return v2;
}

+ (Class)RecipientTableViewCellClass
{
  v2 = (objc_class *)RecipientTableViewCellClass_class;
  if (!RecipientTableViewCellClass_class)
  {
    v2 = __MessageUIClassFromString(@"MFRecipientTableViewCell");
    RecipientTableViewCellClass_class = (uint64_t)v2;
  }

  return v2;
}

+ (Class)SearchShadowViewClass
{
  v2 = (objc_class *)SearchShadowViewClass_class;
  if (!SearchShadowViewClass_class)
  {
    v2 = __MessageUIClassFromString(@"MFSearchShadowView");
    SearchShadowViewClass_class = (uint64_t)v2;
  }

  return v2;
}

+ (Class)MFContactsSearchManagerClass
{
  v2 = (objc_class *)MFContactsSearchManagerClass_class;
  if (!MFContactsSearchManagerClass_class)
  {
    v2 = __MessageUIClassFromString(@"MFContactsSearchManager");
    MFContactsSearchManagerClass_class = (uint64_t)v2;
  }

  return v2;
}

+ (Class)MFContactsSearchResultsModelClass
{
  v2 = (objc_class *)MFContactsSearchResultsModelClass_class;
  if (!MFContactsSearchResultsModelClass_class)
  {
    v2 = __MessageUIClassFromString(@"MFContactsSearchResultsModel");
    MFContactsSearchResultsModelClass_class = (uint64_t)v2;
  }

  return v2;
}

+ (Class)MFMailComposeViewControllerClass
{
  v2 = (objc_class *)MFMailComposeViewControllerClass_class;
  if (!MFMailComposeViewControllerClass_class)
  {
    v2 = __MessageUIClassFromString(@"MFMailComposeViewController");
    MFMailComposeViewControllerClass_class = (uint64_t)v2;
  }

  return v2;
}

+ (Class)MFMessageComposeViewControllerClass
{
  v2 = (objc_class *)MFMessageComposeViewControllerClass_class;
  if (!MFMessageComposeViewControllerClass_class)
  {
    v2 = __MessageUIClassFromString(@"MFMessageComposeViewController");
    MFMessageComposeViewControllerClass_class = (uint64_t)v2;
  }

  return v2;
}

+ (Class)MFAutocompleteResultsTableViewController
{
  v2 = (objc_class *)MFAutocompleteResultsTableViewController_class;
  if (!MFAutocompleteResultsTableViewController_class)
  {
    v2 = __MessageUIClassFromString(@"MFAutocompleteResultsTableViewController");
    MFAutocompleteResultsTableViewController_class = (uint64_t)v2;
  }

  return v2;
}

@end