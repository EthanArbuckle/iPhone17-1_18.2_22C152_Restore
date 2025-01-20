@interface CSForgotDevicePasscodeUnblockViewModel
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

@implementation CSForgotDevicePasscodeUnblockViewModel

- (id)iconName
{
  return @"dots.below.lock.fill";
}

- (id)titleText
{
  return [(CSDeviceUnblockViewModel *)self _localizedStringForKey:@"DASHBOARD_BLOCK_FORGOT_PASSCODE_SCREEN_TITLE"];
}

- (id)bodyTextForTimeout:(id)a3
{
  id v4 = a3;
  v5 = [(CSDeviceUnblockViewModel *)self unblockPolicy];
  char v6 = [v5 canUnblockDevice];

  if ((v6 & 1) == 0)
  {
    id v23 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"No unlock methods found" userInfo:0];
    objc_exception_throw(v23);
  }
  v7 = [MEMORY[0x1E4F74230] sharedConnection];
  v8 = [v7 passcodeCreationDate];

  v9 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int v10 = [v9 isDateInToday:v8];

  if (v10)
  {
    v11 = @"DASHBOARD_BLOCK_FORGOT_PASSCODE_CHANGED_TODAY";
LABEL_6:
    v14 = [(CSDeviceUnblockViewModel *)self _localizedStringForKey:v11];
    goto LABEL_8;
  }
  v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  int v13 = [v12 isDateInYesterday:v8];

  if (v13)
  {
    v11 = @"DASHBOARD_BLOCK_FORGOT_PASSCODE_CHANGED_YESTERDAY";
    goto LABEL_6;
  }
  v15 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v16 = [MEMORY[0x1E4F1C9C8] date];
  v17 = [v15 components:16 fromDate:v8 toDate:v16 options:0];

  uint64_t v18 = [v17 day];
  v19 = NSString;
  v20 = [MEMORY[0x1E4F28B50] mainBundle];
  v21 = [v20 localizedStringForKey:@"DASHBOARD_BLOCK_FORGOT_PASSCODE_CHANGED_DAYS_AGO" value:&stru_1F3020248 table:@"CoverSheetPlurals"];
  v14 = objc_msgSend(v19, "localizedStringWithFormat:", v21, v18);

LABEL_8:

  return v14;
}

- (id)bodySubtitleText
{
  return [(CSDeviceUnblockViewModel *)self _localizedStringForKey:@"DASHBOARD_BLOCK_ERASE_LINK"];
}

- (id)cancelButtonText
{
  return [(CSDeviceUnblockViewModel *)self _localizedStringForKey:@"DASHBOARD_BLOCK_FORGOT_PASSCODE_SCREEN_CANCEL"];
}

- (id)primaryButtonText
{
  v3 = [(CSDeviceUnblockViewModel *)self unblockPolicy];
  int v4 = [v3 canUnblockDeviceUsingRecovery];

  if (v4)
  {
    v5 = [(CSDeviceUnblockViewModel *)self _localizedStringForKey:@"DASHBOARD_BLOCK_FORGOT_PASSCODE_SCREEN_RECOVERY_ACTION"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)secondaryButtonText
{
  v3 = [(CSDeviceUnblockViewModel *)self unblockPolicy];
  int v4 = [v3 canUnblockDeviceUsingErase];

  if (v4)
  {
    v5 = NSString;
    char v6 = [(CSDeviceUnblockViewModel *)self _localizedStringForKey:@"DASHBOARD_BLOCK_FORGOT_PASSCODE_SCREEN_ERASE_ACTION"];
    v7 = [(CSDeviceUnblockViewModel *)self _localizedProductName];
    v8 = objc_msgSend(v5, "stringWithFormat:", v6, v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)primaryButtonAction
{
  id v2 = [(CSDeviceUnblockViewModel *)self blockViewController];
  [v2 deviceUnblockViewModelHandleDidRequestRecovery];
}

- (void)secondaryButtonAction
{
  id v2 = [(CSDeviceUnblockViewModel *)self blockViewController];
  [v2 deviceUnblockViewModelHandleDidRequestErase];
}

- (void)cancelButtonAction
{
  id v2 = [(CSDeviceUnblockViewModel *)self blockViewController];
  [v2 deviceUnblockViewModelHandleDidRequestCancel];
}

@end