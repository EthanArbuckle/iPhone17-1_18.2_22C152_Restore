@interface DIEncryptionCreator
+ (BOOL)supportsSecureCoding;
- (BOOL)allowStoringInKeychain;
- (BOOL)createAndStoreInSystemKeychainWithAccount:(id)a3 error:(id *)a4;
- (BOOL)createWithXpcHandler:(id)a3 error:(id *)a4;
- (id)CLIPassphrasePrompt;
- (id)CLIVerifyPassphrasePrompt;
- (id)GUIPassphraseLabel;
- (id)GUIPassphrasePrompt;
- (id)GUIVerifyPassphraseLabel;
@end

@implementation DIEncryptionCreator

- (BOOL)allowStoringInKeychain
{
  return 1;
}

- (id)GUIPassphrasePrompt
{
  v2 = [(DIEncryptionFrontend *)self diParams];
  v3 = [v2 inputURL];
  v4 = [v3 lastPathComponent];
  v5 = +[NSString stringWithFormat:@"Enter a new password to secure “%@”", v4];

  return v5;
}

- (id)GUIPassphraseLabel
{
  return @"New password";
}

- (id)GUIVerifyPassphraseLabel
{
  return @"Verify";
}

- (id)CLIPassphrasePrompt
{
  v2 = [(DIEncryptionFrontend *)self diParams];
  v3 = [v2 inputURL];
  v4 = [v3 lastPathComponent];
  v5 = +[NSString stringWithFormat:@"Enter a new password to secure “%@”: ", v4];

  return v5;
}

- (id)CLIVerifyPassphrasePrompt
{
  return @"Re-enter new password: ";
}

- (BOOL)createWithXpcHandler:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(DIEncryptionFrontend *)self flags];
  unsigned __int8 v8 = v7;
  if ((v7 & 8) != 0)
  {
    unsigned __int8 v9 = [(DIEncryptionFrontend *)self consoleAskForPassphraseWithUseStdin:1 error:a4];
LABEL_10:
    BOOL v12 = v9;
    goto LABEL_11;
  }
  if ((v7 & 2) == 0) {
    goto LABEL_3;
  }
  if (![(DIEncryptionFrontend *)self consoleAskForPassphraseWithUseStdin:0 error:a4])
  {
    BOOL v12 = 0;
    goto LABEL_11;
  }
  v10 = [(DIEncryptionFrontend *)self diParams];
  unsigned __int8 v11 = [v10 hasUnlockedBackend];

  if ((v11 & 1) == 0)
  {
LABEL_3:
    if ((v8 & 4) != 0) {
      unsigned __int8 v9 = [v6 GUIAskForPassphraseWithEncryptionFrontend:self error:a4];
    }
    else {
      unsigned __int8 v9 = +[DIError failWithPOSIXCode:25 verboseInfo:@"Cannot retrieve passphrase from user via TTY or GUI" error:a4];
    }
    goto LABEL_10;
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (BOOL)createAndStoreInSystemKeychainWithAccount:(id)a3 error:(id *)a4
{
  return +[DIError failWithPOSIXCode:1 verboseInfo:@"System keychain access is not allowed on this platform" error:a4];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end