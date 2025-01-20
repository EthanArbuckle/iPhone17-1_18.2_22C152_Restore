@interface BCSActionPickerItem(BarcodeScanner)
- (void)performActionInExternalApp;
@end

@implementation BCSActionPickerItem(BarcodeScanner)

- (void)performActionInExternalApp
{
  id v6 = [a1 actionURL];
  v2 = [a1 serviceApplicationBundleIdentifier];
  if (v2)
  {
    v3 = [MEMORY[0x263F01880] defaultWorkspace];
    v4 = _bcs_frontBoardUnlockOptions();
    v5 = [v3 operationToOpenResource:v6 usingApplication:v2 uniqueDocumentIdentifier:0 isContentManaged:0 sourceAuditToken:0 userInfo:0 options:v4 delegate:0];

    [v5 start];
  }
  else
  {
    v5 = [MEMORY[0x263F82438] sharedApplication];
    [v5 openURL:v6 options:MEMORY[0x263EFFA78] completionHandler:0];
  }
}

@end