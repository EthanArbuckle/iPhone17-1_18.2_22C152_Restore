@interface CSEraseDeviceUnblockViewModel
- (id)bodySubtitleText;
- (id)bodyTextForTimeout:(id)a3;
- (id)cancelButtonText;
- (id)iconName;
- (id)primaryButtonText;
- (id)secondaryButtonText;
- (id)titleText;
- (void)cancelButtonAction;
- (void)primaryButtonAction;
- (void)secondaryButtonAction;
@end

@implementation CSEraseDeviceUnblockViewModel

- (id)iconName
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    v4 = @"lock.ipad";
  }
  else {
    v4 = @"lock.iphone";
  }

  return v4;
}

- (id)titleText
{
  uint64_t v3 = NSString;
  v4 = [(CSDeviceUnblockViewModel *)self _localizedStringForKey:@"DASHBOARD_BLOCK_ERASE_TITLE"];
  v5 = [(CSDeviceUnblockViewModel *)self _localizedProductName];
  v6 = objc_msgSend(v3, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)bodyTextForTimeout:(id)a3
{
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E4F42948];
    id v5 = a3;
    v6 = [v4 currentDevice];
    uint64_t v7 = [v6 userInterfaceIdiom];

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      v8 = @"DASHBOARD_BLOCK_ERASE_MESSAGE_PAD";
    }
    else {
      v8 = @"DASHBOARD_BLOCK_ERASE_MESSAGE_PHONE";
    }
    v9 = [(CSDeviceUnblockViewModel *)self _localizedStringForKey:v8];
    objc_msgSend(NSString, "stringWithFormat:", v9, v5);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_1F3020248;
  }

  return v10;
}

- (id)bodySubtitleText
{
  return [(CSDeviceUnblockViewModel *)self _localizedStringForKey:@"DASHBOARD_BLOCK_ERASE_LINK"];
}

- (id)cancelButtonText
{
  return &stru_1F3020248;
}

- (id)primaryButtonText
{
  uint64_t v3 = [(CSDeviceUnblockViewModel *)self unblockPolicy];
  int v4 = [v3 canUnblockDeviceUsingErase];

  if (v4)
  {
    id v5 = NSString;
    v6 = [(CSDeviceUnblockViewModel *)self _localizedStringForKey:@"DASHBOARD_BLOCK_CONFIRM_ERASE_ACTION"];
    uint64_t v7 = [(CSDeviceUnblockViewModel *)self _localizedProductName];
    v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)secondaryButtonText
{
  return [(CSDeviceUnblockViewModel *)self _localizedStringForKey:@"DASHBOARD_BLOCK_CANCEL_BUTTON"];
}

- (void)primaryButtonAction
{
  id v2 = [(CSDeviceUnblockViewModel *)self blockViewController];
  [v2 deviceUnblockViewModelHandleDidRequestErase];
}

- (void)secondaryButtonAction
{
  id v2 = [(CSDeviceUnblockViewModel *)self blockViewController];
  [v2 deviceUnblockViewModelHandleDidRequestCancel];
}

- (void)cancelButtonAction
{
  id v2 = [(CSDeviceUnblockViewModel *)self blockViewController];
  [v2 deviceUnblockViewModelHandleDidRequestCancel];
}

@end