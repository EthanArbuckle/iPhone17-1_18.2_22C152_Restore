@interface LALocalizedString
+ (NSString)cancel;
+ (NSString)enterPasscode;
+ (NSString)ok;
+ (NSString)passcodeChangeDone;
+ (NSString)passcodeChangeErrorNewPasscodeMismatchText;
+ (NSString)passcodeChangeErrorNewPasscodeMismatchTitle;
+ (NSString)passcodeChangeErrorPasscodeDoesNotMeetRequirementsText;
+ (NSString)passcodeChangeErrorPasscodeDoesNotMeetRequirementsTitle;
+ (NSString)passcodeChangeErrorPasscodeIsTooEasyText;
+ (NSString)passcodeChangeErrorPasscodeIsTooEasyTitle;
+ (NSString)passcodeChangeFailedTitle;
+ (NSString)passcodeChangeLocalizedReason;
+ (NSString)passcodeChangeNewPasscode;
+ (NSString)passcodeChangeNewPasscodeVerify;
+ (NSString)passcodeChangeNext;
+ (NSString)passcodeChangeNotAvailable;
+ (NSString)passcodeChangeOldPasscode;
+ (NSString)passcodeChangeOptions;
+ (NSString)passcodeChangeRatchetBeginText;
+ (NSString)passcodeChangeRatchetBeginTitle;
+ (NSString)passcodeChangeRatchetCalloutReason;
+ (NSString)passcodeChangeRatchetCountdownText;
+ (NSString)passcodeChangeTitle;
+ (NSString)passcodeChangeUseAnyway;
+ (NSString)passcodeChangeUseDifferentPasscode;
+ (NSString)passcodeRecoveryDisabledTitle;
+ (NSString)passcodeRecoveryEnabledTitle;
+ (NSString)passcodeRecoveryFailedTitle;
+ (NSString)passcodeRecoveryOldPasscode;
+ (NSString)passcodeRecoveryRecoveryDisabled;
+ (NSString)passcodeRecoveryRecoveryEnabled;
+ (NSString)passcodeRecoveryTitle;
+ (NSString)passcodeRemovalFailedTitle;
+ (NSString)passcodeRemovalLocalizedReason;
+ (NSString)passcodeRemovalOldPasscode;
+ (NSString)passcodeRemovalRatchetBeginText;
+ (NSString)passcodeRemovalRatchetBeginTitle;
+ (NSString)passcodeRemovalRatchetCalloutReason;
+ (NSString)passcodeRemovalRatchetCountdownText;
+ (NSString)passcodeRemovalTitle;
+ (NSString)passcodeTypeAlphanumeric;
+ (NSString)passcodeTypeNone;
+ (NSString)passcodeTypeNumericCustomDigits;
+ (NSString)passcodeTypeNumericFourDigits;
+ (NSString)passcodeTypeNumericSixDigits;
+ (NSString)passcodeVerificationPrompt;
+ (NSString)passcodeVerificationTitle;
+ (NSString)tryAgain;
+ (id)_localizedStringWithKey:(uint64_t)a1;
+ (id)_localizedStringWithKey:(void *)a3 tableSuffix:;
+ (id)passcodeChangeBackoffMessage:(int64_t)a3;
+ (id)passcodeChangeErrorInvalidPasscodeWithFailedAttemptsCount:(int64_t)a3;
+ (id)passcodeRemovalNotAllowedText:(id)a3;
+ (id)passcodeRemovalNotAllowedTitle:(id)a3;
@end

@implementation LALocalizedString

+ (NSString)ok
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"OK");
}

+ (id)_localizedStringWithKey:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  v4 = +[LALocalizedString _localizedStringWithKey:tableSuffix:](v3, v2, 0);

  return v4;
}

+ (NSString)cancel
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"CANCEL");
}

+ (NSString)tryAgain
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"TRY_AGAIN");
}

+ (NSString)enterPasscode
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"ENTER_PASSCODE");
}

+ (NSString)passcodeChangeTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_CHANGE_TITLE");
}

+ (NSString)passcodeChangeOldPasscode
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_CHANGE_OLD_PASSCODE");
}

+ (NSString)passcodeRemovalTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_REMOVAL_TITLE");
}

+ (NSString)passcodeRemovalOldPasscode
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_REMOVAL_OLD_PASSCODE");
}

+ (id)passcodeRemovalNotAllowedTitle:(id)a3
{
  uint64_t v3 = NSString;
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"PASSCODE_REMOVAL_NOT_ALLOWED_TITLE" value:&stru_26F31E768 table:@"Localizable"];
  v8 = objc_msgSend(v3, "stringWithFormat:", v7, v5);

  return v8;
}

+ (id)passcodeRemovalNotAllowedText:(id)a3
{
  uint64_t v3 = NSString;
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"PASSCODE_REMOVAL_NOT_ALLOWED_TEXT" value:&stru_26F31E768 table:@"Localizable"];
  v8 = [MEMORY[0x263F52478] marketingDeviceFamilyName];
  v9 = objc_msgSend(v3, "stringWithFormat:", v7, v5, v8);

  return v9;
}

+ (NSString)passcodeRemovalFailedTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_REMOVAL_FAILED_TITLE");
}

+ (NSString)passcodeRecoveryTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_TITLE");
}

+ (NSString)passcodeRecoveryEnabledTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_ENABLED_TITLE");
}

+ (NSString)passcodeRecoveryDisabledTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_DISABLED_TITLE");
}

+ (NSString)passcodeRecoveryOldPasscode
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_OLD_PASSCODE");
}

+ (NSString)passcodeChangeNext
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_NEXT");
}

+ (NSString)passcodeChangeDone
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_DONE");
}

+ (NSString)passcodeChangeNewPasscode
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_NEW_PASSCODE");
}

+ (NSString)passcodeChangeNewPasscodeVerify
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_NEW_PASSCODE_VERIFY");
}

+ (NSString)passcodeRecoveryRecoveryEnabled
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_RECOVERY_ENABLED");
}

+ (NSString)passcodeRecoveryRecoveryDisabled
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_RECOVERY_DISABLED");
}

+ (NSString)passcodeRecoveryFailedTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_FAILED_TITLE");
}

+ (NSString)passcodeChangeOptions
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_RECOVERY_OPTIONS");
}

+ (NSString)passcodeChangeUseDifferentPasscode
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_CHANGE_PASSCODE");
}

+ (NSString)passcodeChangeErrorPasscodeIsTooEasyTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_ERROR_PASSCODE_IS_TOO_EASY_TITLE");
}

+ (NSString)passcodeChangeErrorPasscodeIsTooEasyText
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_CHANGE_ERROR_UNMET_REQUIREMENTS");
}

+ (NSString)passcodeChangeErrorPasscodeDoesNotMeetRequirementsTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_ERROR_PASSCODE_DOES_NOT_MEET_REQUIREMENTS_TITLE");
}

+ (NSString)passcodeChangeErrorPasscodeDoesNotMeetRequirementsText
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_CHANGE_ERROR_UNMET_REQUIREMENTS");
}

+ (NSString)passcodeChangeErrorNewPasscodeMismatchTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_ERROR_NEW_PASSCODE_MISMATCH_TITLE");
}

+ (NSString)passcodeChangeErrorNewPasscodeMismatchText
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_CHANGE_ERROR_UNMET_REQUIREMENTS");
}

+ (NSString)passcodeChangeUseAnyway
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_RECOVERY_USE_ANYWAY");
}

+ (NSString)passcodeTypeNumericFourDigits
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_TYPE_NUMERIC_FOUR_DIGITS");
}

+ (NSString)passcodeTypeNumericSixDigits
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_TYPE_NUMERIC_SIX_DIGITS");
}

+ (NSString)passcodeTypeNumericCustomDigits
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_TYPE_NUMERIC_CUSTOM_DIGITS");
}

+ (NSString)passcodeTypeAlphanumeric
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_TYPE_ALPHANUMERIC");
}

+ (NSString)passcodeTypeNone
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_TYPE_NONE");
}

+ (NSString)passcodeChangeNotAvailable
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_CHANGE_NOT_AVAILABLE");
}

+ (id)passcodeChangeErrorInvalidPasscodeWithFailedAttemptsCount:(int64_t)a3
{
  v4 = NSString;
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"PASSCODE_RECOVERY_ERROR_FAILED_ATTEMPTS" value:&stru_26F31E768 table:@"Localizable"];
  v7 = objc_msgSend(v4, "stringWithFormat:", v6, a3);

  return v7;
}

+ (id)passcodeChangeBackoffMessage:(int64_t)a3
{
  v4 = NSString;
  id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"MINUTES_TO_UNBLOCK" value:&stru_26F31E768 table:@"Localizable"];
  v7 = objc_msgSend(v4, "stringWithFormat:", v6, a3);

  return v7;
}

+ (NSString)passcodeChangeFailedTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_CHANGE_FAILED_TITLE");
}

+ (NSString)passcodeChangeLocalizedReason
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, @"PASSCODE_CHANGE_RATCHET_LOCALIZED_REASON", @"Ratchet");
}

+ (id)_localizedStringWithKey:(void *)a3 tableSuffix:
{
  id v4 = a3;
  id v5 = a2;
  self;
  v6 = @"Localizable";
  if ([v4 length])
  {
    v6 = [NSString stringWithFormat:@"%@-%@", @"Localizable", v4];
  }
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:v5 value:&stru_26F31E768 table:v6];

  return v8;
}

+ (NSString)passcodeChangeRatchetBeginTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, @"PASSCODE_CHANGE_RATCHET_BEGIN_TITLE", @"Ratchet");
}

+ (NSString)passcodeChangeRatchetBeginText
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, @"PASSCODE_CHANGE_RATCHET_BEGIN_TEXT", @"Ratchet");
}

+ (NSString)passcodeChangeRatchetCountdownText
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, @"PASSCODE_CHANGE_RATCHET_COUNTDOWN_TEXT", @"Ratchet");
}

+ (NSString)passcodeChangeRatchetCalloutReason
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, @"PASSCODE_CHANGE_RATCHET_CALLOUT_REASON", @"Ratchet");
}

+ (NSString)passcodeRemovalLocalizedReason
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, @"PASSCODE_REMOVAL_RATCHET_LOCALIZED_REASON", @"Ratchet");
}

+ (NSString)passcodeRemovalRatchetBeginTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, @"PASSCODE_REMOVAL_RATCHET_BEGIN_TITLE", @"Ratchet");
}

+ (NSString)passcodeRemovalRatchetBeginText
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, @"PASSCODE_REMOVAL_RATCHET_BEGIN_TEXT", @"Ratchet");
}

+ (NSString)passcodeRemovalRatchetCountdownText
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, @"PASSCODE_REMOVAL_RATCHET_COUNTDOWN_TEXT", @"Ratchet");
}

+ (NSString)passcodeRemovalRatchetCalloutReason
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:tableSuffix:]((uint64_t)a1, @"PASSCODE_REMOVAL_RATCHET_CALLOUT_REASON", @"Ratchet");
}

+ (NSString)passcodeVerificationTitle
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_VERIFICATION_TITLE");
}

+ (NSString)passcodeVerificationPrompt
{
  return (NSString *)+[LALocalizedString _localizedStringWithKey:]((uint64_t)a1, @"PASSCODE_VERIFICATION_PROMPT");
}

@end