@interface WKBackForwardListItem(SafariServicesExtras)
- (id)_sf_explicitSuggestedFilename;
- (id)_sf_quickLookDocument;
- (id)_sf_securityInfo;
- (void)_sf_setExplicitSuggestedFilename:()SafariServicesExtras;
- (void)_sf_setQuickLookDocument:()SafariServicesExtras;
- (void)_sf_setSecurityInfo:()SafariServicesExtras;
@end

@implementation WKBackForwardListItem(SafariServicesExtras)

- (id)_sf_quickLookDocument
{
  return objc_getAssociatedObject(a1, (const void *)quickLookDocumentKey);
}

- (void)_sf_setQuickLookDocument:()SafariServicesExtras
{
}

- (id)_sf_securityInfo
{
  return objc_getAssociatedObject(a1, (const void *)securityInfoKey);
}

- (void)_sf_setSecurityInfo:()SafariServicesExtras
{
}

- (id)_sf_explicitSuggestedFilename
{
  return objc_getAssociatedObject(a1, (const void *)explicitSuggestedFilenameKey);
}

- (void)_sf_setExplicitSuggestedFilename:()SafariServicesExtras
{
}

@end