@interface _ASPasswordManagerDeleteAlertConfiguration
+ (BOOL)_isKeychainSyncEnabled;
+ (BOOL)_isPermanentlyDeletingSavedAccount:(id)a3;
+ (BOOL)_isPermanentlyDeletingSavedAccounts:(id)a3;
+ (id)_buttonTitleStringForAlertToDeleteNumberOfPasswords:(unint64_t)a3 numberOfPasskeys:(unint64_t)a4 numberOfSiwaAccounts:(unint64_t)a5 isDeletingSharedAccounts:(BOOL)a6;
+ (id)_buttonTitleStringForAlertToStopUsingSignInWithAppleForSavedAccount:(id)a3;
+ (id)_cancelButtonTitleStringForAlertToDeleteAccount;
+ (id)_cancelButtonTitleStringForAlertToStopUsingSignInWithAppleForSavedAccount:(id)a3;
+ (id)_configurationForAlertToDeletePasskeyFromSavedAccount:(id)a3 isUndoable:(BOOL)a4;
+ (id)_configurationForAlertToDeletePasswordAndPasskeyFromSavedAccount:(id)a3;
+ (id)_configurationForAlertToDeletePasswordFromSavedAccount:(id)a3 isUndoable:(BOOL)a4;
+ (id)_configurationForAlertToDeleteVerificationCodeFromSavedAccount:(id)a3 isUndoable:(BOOL)a4;
+ (id)_configurationForAlertToStopUsingSignInWithAppleFromSavedAccount:(id)a3;
+ (id)_credentialDeletionStringForAlertToDeleteNumberOfPasswords:(unint64_t)a3 numberOfPasskeys:(unint64_t)a4 numberOfSiwaAccounts:(unint64_t)a5 isDeletingSharedAccounts:(BOOL)a6 isPermanentlyDeleting:(BOOL)a7;
+ (id)_credentialDeletionStringForAlertToDeleteNumberOfSiwaAccounts:(unint64_t)a3;
+ (id)_deletionStringForAlertToDeleteNumberOfPasswords:(unint64_t)a3 numberOfPasskeys:(unint64_t)a4 isDeletingSharedAccounts:(BOOL)a5 isPermanentlyDeleting:(BOOL)a6;
+ (id)_originalContributorDisplayNameForSavedAccount:(id)a3;
+ (id)_subtitleForDeletingNumberOfPasswordsWithVerificationCodes:(unint64_t)a3;
+ (id)_subtitleStringForAlertToDeleteNumberOfPasswords:(unint64_t)a3 numberOfPasskeys:(unint64_t)a4 numberOfSiwaAccounts:(unint64_t)a5 isDeletingVerificationCodes:(BOOL)a6 isDeletingSharedAccounts:(BOOL)a7 isPermanentlyDeleting:(BOOL)a8;
+ (id)_subtitleStringForAlertToDeletePasskeyFromSavedAccount:(id)a3 isUndoable:(BOOL)a4;
+ (id)_subtitleStringForAlertToDeletePasswordFromSavedAccount:(id)a3 isUndoable:(BOOL)a4;
+ (id)_subtitleStringForAlertToDeleteVerificationCodeFromSavedAccount:(id)a3 isUndoable:(BOOL)a4;
+ (id)_subtitleStringForAlertToPermanentlyDeletePasskeyFromSavedAccount:(id)a3;
+ (id)_subtitleStringForAlertToPermanentlyDeletePasswordFromSavedAccount:(id)a3;
+ (id)_subtitleStringForAlertToSoftDeletePasskeyFromSavedAccount:(id)a3;
+ (id)_subtitleStringForAlertToSoftDeletePasswordFromSavedAccount:(id)a3;
+ (id)_subtitleStringForAlertToStopUsingSignInWithAppleForSavedAccount:(id)a3;
+ (id)_titleStringForAlertToDeleteNumberOfPasswords:(unint64_t)a3 numberOfPasskeys:(unint64_t)a4 numberOfSiwaAccounts:(unint64_t)a5 isDeletingSharedAccounts:(BOOL)a6 isPermanentlyDeleting:(BOOL)a7;
+ (id)_titleStringForAlertToDeletePasskeyFromSavedAccount:(id)a3;
+ (id)_titleStringForAlertToDeletePasswordFromSavedAccount:(id)a3;
+ (id)_titleStringForAlertToDeleteVerificationCodeFromSavedAccount:(id)a3;
+ (id)_titleStringForAlertToStopUsingSignInWithAppleForSavedAccount:(id)a3;
+ (id)configurationForDeleting:(unint64_t)a3 fromSavedAccount:(id)a4;
+ (id)configurationForDeleting:(unint64_t)a3 fromSavedAccount:(id)a4 isUndoable:(BOOL)a5;
+ (id)configurationForDeletingSavedAccounts:(id)a3;
+ (void)_getInformationForSavedAccountsToDelete:(id)a3 numberOfPasswords:(unint64_t *)a4 numberOfPasskeys:(unint64_t *)a5 numberOfSiwaAccounts:(unint64_t *)a6 isDeletingVerificationCodes:(BOOL *)a7 hasSharedAccounts:(BOOL *)a8 areAllAccountsShared:(BOOL *)a9;
- (BOOL)isPermanentlyRemovingFromRecentlyDeleted;
- (NSString)buttonTitle;
- (NSString)cancelButtonTitle;
- (NSString)subtitle;
- (NSString)title;
- (id)_initWithTitle:(id)a3 subtitle:(id)a4 buttonTitle:(id)a5 cancelButtonTitle:(id)a6 isPermanentlyRemovingFromRecentlyDeleted:(BOOL)a7;
@end

@implementation _ASPasswordManagerDeleteAlertConfiguration

+ (id)configurationForDeleting:(unint64_t)a3 fromSavedAccount:(id)a4 isUndoable:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  switch(a3)
  {
    case 0uLL:
      uint64_t v9 = [a1 _configurationForAlertToDeletePasswordFromSavedAccount:v8 isUndoable:v5];
      goto LABEL_8;
    case 1uLL:
      uint64_t v9 = [a1 _configurationForAlertToDeleteVerificationCodeFromSavedAccount:v8 isUndoable:v5];
      goto LABEL_8;
    case 2uLL:
      uint64_t v9 = [a1 _configurationForAlertToDeletePasskeyFromSavedAccount:v8 isUndoable:v5];
      goto LABEL_8;
    case 3uLL:
      uint64_t v9 = [a1 _configurationForAlertToStopUsingSignInWithAppleFromSavedAccount:v8];
      goto LABEL_8;
    case 4uLL:
      uint64_t v9 = [a1 _configurationForAlertToDeletePasswordAndPasskeyFromSavedAccount:v8];
LABEL_8:
      v10 = (void *)v9;
      break;
    default:
      v10 = 0;
      break;
  }

  return v10;
}

+ (id)configurationForDeleting:(unint64_t)a3 fromSavedAccount:(id)a4
{
  return (id)[a1 configurationForDeleting:a3 fromSavedAccount:a4 isUndoable:0];
}

- (id)_initWithTitle:(id)a3 subtitle:(id)a4 buttonTitle:(id)a5 cancelButtonTitle:(id)a6 isPermanentlyRemovingFromRecentlyDeleted:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v27.receiver = self;
  v27.super_class = (Class)_ASPasswordManagerDeleteAlertConfiguration;
  v16 = [(_ASPasswordManagerDeleteAlertConfiguration *)&v27 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    title = v16->_title;
    v16->_title = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    subtitle = v16->_subtitle;
    v16->_subtitle = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    buttonTitle = v16->_buttonTitle;
    v16->_buttonTitle = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    cancelButtonTitle = v16->_cancelButtonTitle;
    v16->_cancelButtonTitle = (NSString *)v23;

    v16->_isPermanentlyRemovingFromRecentlyDeleted = a7;
    v25 = v16;
  }

  return v16;
}

+ (id)_configurationForAlertToDeletePasswordFromSavedAccount:(id)a3 isUndoable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [a1 _titleStringForAlertToDeletePasswordFromSavedAccount:v6];
  id v8 = [a1 _subtitleStringForAlertToDeletePasswordFromSavedAccount:v6 isUndoable:v4];
  uint64_t v9 = _WBSLocalizedString();
  uint64_t v10 = [a1 _isPermanentlyDeletingSavedAccount:v6];

  id v11 = objc_alloc((Class)a1);
  id v12 = [a1 _cancelButtonTitleStringForAlertToDeleteAccount];
  id v13 = (void *)[v11 _initWithTitle:v7 subtitle:v8 buttonTitle:v9 cancelButtonTitle:v12 isPermanentlyRemovingFromRecentlyDeleted:v10];

  return v13;
}

+ (id)_configurationForAlertToDeletePasskeyFromSavedAccount:(id)a3 isUndoable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [a1 _titleStringForAlertToDeletePasskeyFromSavedAccount:v6];
  id v8 = [a1 _subtitleStringForAlertToDeletePasskeyFromSavedAccount:v6 isUndoable:v4];
  uint64_t v9 = _WBSLocalizedString();
  uint64_t v10 = [a1 _isPermanentlyDeletingSavedAccount:v6];

  id v11 = objc_alloc((Class)a1);
  id v12 = [a1 _cancelButtonTitleStringForAlertToDeleteAccount];
  id v13 = (void *)[v11 _initWithTitle:v7 subtitle:v8 buttonTitle:v9 cancelButtonTitle:v12 isPermanentlyRemovingFromRecentlyDeleted:v10];

  return v13;
}

+ (id)_configurationForAlertToDeleteVerificationCodeFromSavedAccount:(id)a3 isUndoable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [a1 _titleStringForAlertToDeleteVerificationCodeFromSavedAccount:v6];
  id v8 = [a1 _subtitleStringForAlertToDeleteVerificationCodeFromSavedAccount:v6 isUndoable:v4];
  uint64_t v9 = _WBSLocalizedString();
  uint64_t v10 = [a1 _isPermanentlyDeletingSavedAccount:v6];

  id v11 = objc_alloc((Class)a1);
  id v12 = [a1 _cancelButtonTitleStringForAlertToDeleteAccount];
  id v13 = (void *)[v11 _initWithTitle:v7 subtitle:v8 buttonTitle:v9 cancelButtonTitle:v12 isPermanentlyRemovingFromRecentlyDeleted:v10];

  return v13;
}

+ (id)_configurationForAlertToStopUsingSignInWithAppleFromSavedAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = [a1 _titleStringForAlertToStopUsingSignInWithAppleForSavedAccount:v4];
  id v6 = [a1 _subtitleStringForAlertToStopUsingSignInWithAppleForSavedAccount:v4];
  v7 = [a1 _buttonTitleStringForAlertToStopUsingSignInWithAppleForSavedAccount:v4];
  id v8 = [a1 _cancelButtonTitleStringForAlertToStopUsingSignInWithAppleForSavedAccount:v4];

  uint64_t v9 = (void *)[objc_alloc((Class)a1) _initWithTitle:v5 subtitle:v6 buttonTitle:v7 cancelButtonTitle:v8 isPermanentlyRemovingFromRecentlyDeleted:1];

  return v9;
}

+ (id)_titleStringForAlertToStopUsingSignInWithAppleForSavedAccount:(id)a3
{
  id v3 = a3;
  if ([v3 isCurrentUserOriginalContributor])
  {
    id v4 = NSString;
    BOOL v5 = _WBSLocalizedString();
    id v6 = [v3 signInWithAppleAccount];
    v7 = [v6 localizedAppName];
    id v8 = objc_msgSend(v4, "stringWithFormat:", v5, v7);
  }
  else
  {
    id v8 = _WBSLocalizedString();
  }

  return v8;
}

+ (id)_subtitleStringForAlertToStopUsingSignInWithAppleForSavedAccount:(id)a3
{
  id v4 = a3;
  if ([v4 isCurrentUserOriginalContributor])
  {
    BOOL v5 = _WBSLocalizedString();
  }
  else
  {
    id v6 = NSString;
    v7 = _WBSLocalizedString();
    id v8 = [a1 _originalContributorDisplayNameForSavedAccount:v4];
    BOOL v5 = objc_msgSend(v6, "stringWithFormat:", v7, v8);
  }

  return v5;
}

+ (id)_originalContributorDisplayNameForSavedAccount:(id)a3
{
  id v3 = a3;
  id v4 = +[_ASAccountSharingGroupMemberDataManager sharedManager];
  BOOL v5 = [v3 originalContributorParticipantID];
  id v6 = [v3 sharedGroupID];

  v7 = [v4 displayNameForOriginalContributorParticipantID:v5 inGroupID:v6];

  return v7;
}

+ (id)_buttonTitleStringForAlertToStopUsingSignInWithAppleForSavedAccount:(id)a3
{
  [a3 isCurrentUserOriginalContributor];
  id v3 = _WBSLocalizedString();

  return v3;
}

+ (id)_cancelButtonTitleStringForAlertToStopUsingSignInWithAppleForSavedAccount:(id)a3
{
  [a3 isCurrentUserOriginalContributor];
  id v3 = _WBSLocalizedString();

  return v3;
}

+ (id)_configurationForAlertToDeletePasswordAndPasskeyFromSavedAccount:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v4 = (void *)MEMORY[0x263EFF8C0];
  id v5 = a3;
  id v6 = [v4 arrayWithObjects:&v9 count:1];

  v7 = objc_msgSend(a1, "configurationForDeletingSavedAccounts:", v6, v9, v10);

  return v7;
}

+ (id)configurationForDeletingSavedAccounts:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  unsigned __int8 v18 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  uint64_t v5 = [a1 _isPermanentlyDeletingSavedAccounts:v4];
  __int16 v15 = 0;
  [a1 _getInformationForSavedAccountsToDelete:v4 numberOfPasswords:&v19 numberOfPasskeys:&v17 numberOfSiwaAccounts:&v16 isDeletingVerificationCodes:&v18 hasSharedAccounts:(char *)&v15 + 1 areAllAccountsShared:&v15];
  if (v16 == 1 && v17 == 0 && v19 == 0)
  {
    id v8 = [v4 objectAtIndexedSubscript:0];
    id v13 = [a1 configurationForDeleting:3 fromSavedAccount:v8];
  }
  else
  {
    id v8 = objc_msgSend(a1, "_titleStringForAlertToDeleteNumberOfPasswords:numberOfPasskeys:numberOfSiwaAccounts:isDeletingSharedAccounts:isPermanentlyDeleting:", v19);
    id v9 = [a1 _subtitleStringForAlertToDeleteNumberOfPasswords:v19 numberOfPasskeys:v17 numberOfSiwaAccounts:v16 isDeletingVerificationCodes:v18 isDeletingSharedAccounts:HIBYTE(v15) isPermanentlyDeleting:v5];
    uint64_t v10 = [a1 _buttonTitleStringForAlertToDeleteNumberOfPasswords:v19 numberOfPasskeys:v17 numberOfSiwaAccounts:v16 isDeletingSharedAccounts:v15];
    id v11 = objc_alloc((Class)a1);
    id v12 = [a1 _cancelButtonTitleStringForAlertToDeleteAccount];
    id v13 = (void *)[v11 _initWithTitle:v8 subtitle:v9 buttonTitle:v10 cancelButtonTitle:v12 isPermanentlyRemovingFromRecentlyDeleted:v5];
  }

  return v13;
}

+ (BOOL)_isPermanentlyDeletingSavedAccounts:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v4, "safari_filterObjectsUsingBlock:", &__block_literal_global_10);
  unint64_t v6 = [v5 count];
  uint64_t v7 = [v4 count];
  if (v6 >= 2 && v6 == v7)
  {
    char v10 = 0;
  }
  else
  {
    id v9 = [v4 firstObject];
    char v10 = [a1 _isPermanentlyDeletingSavedAccount:v9];
  }
  return v10;
}

+ (BOOL)_isPermanentlyDeletingSavedAccount:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isRecentlyDeleted] & 1) != 0
    || ([v3 userIsNeverSaveMarker] & 1) != 0
    || [v3 credentialTypes] == 4;

  return v4;
}

+ (id)_titleStringForAlertToDeletePasswordFromSavedAccount:(id)a3
{
  [a3 isSavedInSharedGroup];
  if ([MEMORY[0x263F29440] isPad])
  {
    id v3 = _WBSLocalizedString();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)_titleStringForAlertToDeleteVerificationCodeFromSavedAccount:(id)a3
{
  [a3 isSavedInSharedGroup];
  if ([MEMORY[0x263F29440] isPad])
  {
    id v3 = _WBSLocalizedString();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)_titleStringForAlertToDeletePasskeyFromSavedAccount:(id)a3
{
  [a3 isSavedInSharedGroup];
  if ([MEMORY[0x263F29440] isPad])
  {
    id v3 = _WBSLocalizedString();
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

+ (id)_subtitleStringForAlertToDeletePasswordFromSavedAccount:(id)a3 isUndoable:(BOOL)a4
{
  id v5 = a3;
  if ([v5 isRecentlyDeleted]) {
    [a1 _subtitleStringForAlertToPermanentlyDeletePasswordFromSavedAccount:v5];
  }
  else {
  unint64_t v6 = [a1 _subtitleStringForAlertToSoftDeletePasswordFromSavedAccount:v5];
  }

  return v6;
}

+ (id)_subtitleStringForAlertToPermanentlyDeletePasswordFromSavedAccount:(id)a3
{
  id v4 = a3;
  if ([a1 _isKeychainSyncEnabled]) {
    [v4 isSavedInSharedGroup];
  }
  id v5 = _WBSLocalizedString();

  return v5;
}

+ (id)_subtitleStringForAlertToSoftDeletePasswordFromSavedAccount:(id)a3
{
  id v4 = a3;
  if ([v4 hasValidWebsite]) {
    [v4 highLevelDomain];
  }
  else {
  id v5 = [v4 effectiveTitle];
  }
  if (([a1 _isKeychainSyncEnabled] & 1) == 0)
  {
    id v9 = [v4 totpGenerators];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      id v8 = NSString;
      goto LABEL_10;
    }
LABEL_9:
    id v11 = _WBSLocalizedString();
    goto LABEL_11;
  }
  [v4 isSavedInSharedGroup];
  unint64_t v6 = [v4 totpGenerators];
  uint64_t v7 = [v6 count];

  if (!v7) {
    goto LABEL_9;
  }
  id v8 = NSString;
LABEL_10:
  id v12 = _WBSLocalizedString();
  id v11 = objc_msgSend(v8, "stringWithFormat:", v12, v5);

LABEL_11:

  return v11;
}

+ (id)_subtitleStringForAlertToDeleteVerificationCodeFromSavedAccount:(id)a3 isUndoable:(BOOL)a4
{
  id v5 = a3;
  unint64_t v6 = [v5 customTitle];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v9 = [v5 serviceName];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v5 highLevelDomain];
    }
    id v8 = v11;
  }
  if ([a1 _isKeychainSyncEnabled]) {
    [v5 isSavedInSharedGroup];
  }
  [v5 hasValidWebsite];
  id v12 = NSString;
  id v13 = _WBSLocalizedString();
  id v14 = objc_msgSend(v12, "stringWithFormat:", v13, v8);

  return v14;
}

+ (id)_subtitleStringForAlertToDeletePasskeyFromSavedAccount:(id)a3 isUndoable:(BOOL)a4
{
  id v5 = a3;
  if ([v5 isRecentlyDeleted]) {
    [a1 _subtitleStringForAlertToPermanentlyDeletePasskeyFromSavedAccount:v5];
  }
  else {
  unint64_t v6 = [a1 _subtitleStringForAlertToSoftDeletePasskeyFromSavedAccount:v5];
  }

  return v6;
}

+ (id)_subtitleStringForAlertToPermanentlyDeletePasskeyFromSavedAccount:(id)a3
{
  id v4 = a3;
  if ([a1 _isKeychainSyncEnabled]) {
    [v4 isSavedInSharedGroup];
  }
  id v5 = _WBSLocalizedString();

  return v5;
}

+ (id)_subtitleStringForAlertToSoftDeletePasskeyFromSavedAccount:(id)a3
{
  return (id)_WBSLocalizedString();
}

+ (id)_cancelButtonTitleStringForAlertToDeleteAccount
{
  return (id)_WBSLocalizedString();
}

+ (id)_titleStringForAlertToDeleteNumberOfPasswords:(unint64_t)a3 numberOfPasskeys:(unint64_t)a4 numberOfSiwaAccounts:(unint64_t)a5 isDeletingSharedAccounts:(BOOL)a6 isPermanentlyDeleting:(BOOL)a7
{
  if (objc_msgSend(MEMORY[0x263F29440], "isPad", a3, a4, a5, a6, a7))
  {
    uint64_t v7 = _WBSLocalizedString();
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)_subtitleStringForAlertToDeleteNumberOfPasswords:(unint64_t)a3 numberOfPasskeys:(unint64_t)a4 numberOfSiwaAccounts:(unint64_t)a5 isDeletingVerificationCodes:(BOOL)a6 isDeletingSharedAccounts:(BOOL)a7 isPermanentlyDeleting:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a6;
  id v12 = [a1 _credentialDeletionStringForAlertToDeleteNumberOfPasswords:a3 numberOfPasskeys:a4 numberOfSiwaAccounts:a5 isDeletingSharedAccounts:a7 isPermanentlyDeleting:a8];
  id v13 = v12;
  if (a3 && v9 && !v8)
  {
    id v14 = NSString;
    __int16 v15 = [a1 _subtitleForDeletingNumberOfPasswordsWithVerificationCodes:a3];
    id v16 = [v14 localizedStringWithFormat:@"%@\n\n%@", v15, v13];
  }
  else
  {
    id v16 = v12;
  }

  return v16;
}

+ (id)_credentialDeletionStringForAlertToDeleteNumberOfPasswords:(unint64_t)a3 numberOfPasskeys:(unint64_t)a4 numberOfSiwaAccounts:(unint64_t)a5 isDeletingSharedAccounts:(BOOL)a6 isPermanentlyDeleting:(BOOL)a7
{
  if (!a5 || a4 | a3)
  {
    uint64_t v10 = [a1 _deletionStringForAlertToDeleteNumberOfPasswords:a3 numberOfPasskeys:a4 isDeletingSharedAccounts:a6 isPermanentlyDeleting:a7];
    id v11 = v10;
    if (a5)
    {
      id v12 = [a1 _credentialDeletionStringForAlertToDeleteNumberOfSiwaAccounts:a5];
      id v9 = [NSString localizedStringWithFormat:@"%@\n\n%@", v11, v12];
    }
    else
    {
      id v9 = v10;
    }
  }
  else
  {
    id v9 = [a1 _credentialDeletionStringForAlertToDeleteNumberOfSiwaAccounts:a5];
  }

  return v9;
}

+ (id)_credentialDeletionStringForAlertToDeleteNumberOfSiwaAccounts:(unint64_t)a3
{
  id v4 = _WBSLocalizedString();
  return v4;
}

+ (id)_deletionStringForAlertToDeleteNumberOfPasswords:(unint64_t)a3 numberOfPasskeys:(unint64_t)a4 isDeletingSharedAccounts:(BOOL)a5 isPermanentlyDeleting:(BOOL)a6
{
  int v8 = [a1 _isKeychainSyncEnabled];
  BOOL v10 = a3 == 1 && a4 == 1;
  if (!v8)
  {
    if (v10) {
      goto LABEL_18;
    }
    if (a3 == 1 && a4)
    {
      id v11 = NSString;
      goto LABEL_25;
    }
    if (a3 && a4 == 1)
    {
      id v13 = NSString;
    }
    else
    {
      if (a3 && a4)
      {
        id v16 = NSString;
        id v14 = _WBSLocalizedString();
        objc_msgSend(v16, "localizedStringWithFormat:", v14, a4, a3);
        goto LABEL_33;
      }
      if (a4 == 1) {
        goto LABEL_18;
      }
      if (a4)
      {
        id v11 = NSString;
        goto LABEL_25;
      }
      if (a3 == 1) {
        goto LABEL_18;
      }
      id v13 = NSString;
    }
LABEL_32:
    id v14 = _WBSLocalizedString();
    objc_msgSend(v13, "localizedStringWithFormat:", v14, a3, v18);
    goto LABEL_33;
  }
  if (v10)
  {
LABEL_18:
    id v12 = _WBSLocalizedString();
    goto LABEL_34;
  }
  if (a3 != 1 || !a4)
  {
    if (a3 && a4 == 1)
    {
      id v13 = NSString;
    }
    else
    {
      if (a3 && a4)
      {
        __int16 v15 = NSString;
        id v14 = _WBSLocalizedString();
        objc_msgSend(v15, "localizedStringWithFormat:", v14, a4, a3);
        goto LABEL_33;
      }
      if (a4 == 1) {
        goto LABEL_18;
      }
      if (a4)
      {
        id v11 = NSString;
        goto LABEL_25;
      }
      if (a3 == 1) {
        goto LABEL_18;
      }
      id v13 = NSString;
    }
    goto LABEL_32;
  }
  id v11 = NSString;
LABEL_25:
  id v14 = _WBSLocalizedString();
  objc_msgSend(v11, "localizedStringWithFormat:", v14, a4, v18);
  id v12 = LABEL_33:;

LABEL_34:

  return v12;
}

+ (id)_subtitleForDeletingNumberOfPasswordsWithVerificationCodes:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = _WBSLocalizedString();
  }
  else
  {
    id v5 = NSString;
    unint64_t v6 = _WBSLocalizedString();
    uint64_t v3 = objc_msgSend(v5, "localizedStringWithFormat:", v6, a3);
  }

  return v3;
}

+ (id)_buttonTitleStringForAlertToDeleteNumberOfPasswords:(unint64_t)a3 numberOfPasskeys:(unint64_t)a4 numberOfSiwaAccounts:(unint64_t)a5 isDeletingSharedAccounts:(BOOL)a6
{
  if (!(a4 | a3) && a5 || a3 && a4 || a4 == 1) {
    goto LABEL_5;
  }
  if (!a4)
  {
    if (a3 != 1)
    {
      id v12 = NSString;
      id v11 = _WBSLocalizedString();
      objc_msgSend(v12, "localizedStringWithFormat:", v11, a3);
      goto LABEL_14;
    }
LABEL_5:
    int v8 = _WBSLocalizedString();
    goto LABEL_6;
  }
  BOOL v10 = NSString;
  id v11 = _WBSLocalizedString();
  objc_msgSend(v10, "localizedStringWithFormat:", v11, a4);
  int v8 = LABEL_14:;

LABEL_6:

  return v8;
}

+ (void)_getInformationForSavedAccountsToDelete:(id)a3 numberOfPasswords:(unint64_t *)a4 numberOfPasskeys:(unint64_t *)a5 numberOfSiwaAccounts:(unint64_t *)a6 isDeletingVerificationCodes:(BOOL *)a7 hasSharedAccounts:(BOOL *)a8 areAllAccountsShared:(BOOL *)a9
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = a3;
  uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    char v11 = 0;
    unint64_t v12 = 0;
    unint64_t v13 = 0;
    unint64_t v14 = 0;
    BOOL v15 = 0;
    uint64_t v16 = *(void *)v35;
    char v17 = 1;
    while (1)
    {
      uint64_t v18 = 0;
      uint64_t v29 = v10;
      do
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v34 + 1) + 8 * v18);
        char v33 = [v19 credentialTypes];
        unint64_t v32 = [v19 credentialTypes];
        unint64_t v31 = [v19 credentialTypes];
        if (v15)
        {
          BOOL v15 = 1;
          if ((v11 & 1) == 0) {
            goto LABEL_8;
          }
        }
        else
        {
          [v19 totpGenerators];
          uint64_t v20 = v16;
          char v21 = v17;
          uint64_t v23 = v22 = v11;
          BOOL v15 = [(id)v23 count] != 0;

          LOBYTE(v23) = v22;
          char v17 = v21;
          uint64_t v16 = v20;
          uint64_t v10 = v29;
          if ((v23 & 1) == 0)
          {
LABEL_8:
            char v11 = [v19 isSavedInSharedGroup];
            if ((v17 & 1) == 0) {
              goto LABEL_9;
            }
            goto LABEL_12;
          }
        }
        char v11 = 1;
        if ((v17 & 1) == 0)
        {
LABEL_9:
          char v17 = 0;
          goto LABEL_13;
        }
LABEL_12:
        char v17 = [v19 isSavedInSharedGroup];
LABEL_13:
        v12 += v33 & 1;
        v13 += (v32 >> 1) & 1;
        v14 += (v31 >> 2) & 1;
        ++v18;
      }
      while (v10 != v18);
      uint64_t v10 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (!v10) {
        goto LABEL_17;
      }
    }
  }
  char v11 = 0;
  unint64_t v12 = 0;
  unint64_t v13 = 0;
  unint64_t v14 = 0;
  BOOL v15 = 0;
  char v17 = 1;
LABEL_17:
  *a4 = v12;
  *a5 = v13;
  *a6 = v14;
  *a7 = v15;
  *a8 = v11;
  *a9 = v17;
}

+ (BOOL)_isKeychainSyncEnabled
{
  v2 = [MEMORY[0x263F662C8] sharedMonitor];
  BOOL v3 = [v2 keychainSyncSettingValue] == 2;

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (NSString)cancelButtonTitle
{
  return self->_cancelButtonTitle;
}

- (BOOL)isPermanentlyRemovingFromRecentlyDeleted
{
  return self->_isPermanentlyRemovingFromRecentlyDeleted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButtonTitle, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end