@interface CNContact(SuggestedHandler)
- (id)suggestedHandle;
- (void)setSuggestedHandle:()SuggestedHandler;
@end

@implementation CNContact(SuggestedHandler)

- (id)suggestedHandle
{
  return objc_getAssociatedObject(a1, @"GK_CNCONTACT_SUGGESTED_HANDLE_KEY");
}

- (void)setSuggestedHandle:()SuggestedHandler
{
}

@end