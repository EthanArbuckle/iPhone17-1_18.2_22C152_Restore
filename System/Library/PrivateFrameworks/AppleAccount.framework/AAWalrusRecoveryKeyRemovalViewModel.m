@interface AAWalrusRecoveryKeyRemovalViewModel
- (id)initWhenAccountHasRecoveryContact:(BOOL)a3;
@end

@implementation AAWalrusRecoveryKeyRemovalViewModel

- (id)initWhenAccountHasRecoveryContact:(BOOL)a3
{
  BOOL v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AAWalrusRecoveryKeyRemovalViewModel;
  v4 = [(AAAccountContactPromptModel *)&v18 init];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v6 = [v5 localizedStringForKey:@"REMOVE_RECOVERY_KEY_TITLE" value:0 table:@"Localizable-Walrus"];
    [(AAAccountContactPromptModel *)v4 setDetailsLabel:v6];

    v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    v8 = v7;
    if (v3)
    {
      v9 = [v7 localizedStringForKey:@"REMOVE_RECOVERY_KEY_DETAIL_HAS_RC" value:0 table:@"Localizable-Walrus"];
      [(AAAccountContactPromptModel *)v4 setDetailsSubtitle:v9];

      [(AAAccountContactPromptModel *)v4 setSecondaryActionText:0];
      v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v11 = v10;
      v12 = @"REMOVE_RECOVERY_KEY_DONE_BUTTON_DEFAULT";
    }
    else
    {
      v13 = [v7 localizedStringForKey:@"REMOVE_RECOVERY_KEY_DETAIL_NO_RC" value:0 table:@"Localizable-Walrus"];
      [(AAAccountContactPromptModel *)v4 setDetailsSubtitle:v13];

      v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v15 = [v14 localizedStringForKey:@"REMOVE_RECOVERY_KEY_NOT_NOW_BUTTON" value:0 table:@"Localizable-Walrus"];
      [(AAAccountContactPromptModel *)v4 setSecondaryActionText:v15];

      v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
      v11 = v10;
      v12 = @"REMOVE_RECOVERY_KEY_DONE_BUTTON_ADD_RC";
    }
    v16 = [v10 localizedStringForKey:v12 value:0 table:@"Localizable-Walrus"];
    [(AAAccountContactPromptModel *)v4 setPrimaryActionText:v16];

    [(AAAccountContactPromptModel *)v4 setDoneButtonTitle:0];
  }
  return v4;
}

@end