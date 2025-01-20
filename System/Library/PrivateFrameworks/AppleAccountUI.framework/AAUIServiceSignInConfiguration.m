@interface AAUIServiceSignInConfiguration
- (AAUIServiceSignInConfiguration)init;
- (AAUIServiceSignInControllerDelegate)serviceDelegate;
- (AIDAServiceContext)serviceContext;
- (BOOL)allowSkip;
- (BOOL)canEditUsername;
- (BOOL)hidesBackOrCancelButton;
- (BOOL)isAttemptingBackupRestore;
- (BOOL)newSignInReauth;
- (BOOL)offeriCloudAMSSplitSignIn;
- (BOOL)shouldDisableAccountCreation;
- (BOOL)shouldForceOperation;
- (BOOL)shouldShowSystemBackButton;
- (BOOL)showsChildSignIn;
- (BOOL)splitSignIn;
- (CDPLocalSecret)localSecret;
- (NSArray)privacyLinkIdentifiers;
- (NSArray)serviceTypes;
- (NSDictionary)authenticationResults;
- (NSString)serviceType;
- (NSString)username;
- (UINavigationController)navigationController;
- (int64_t)aidaOperationUIPermissions;
- (unint64_t)ampServiceType;
- (void)setAidaOperationUIPermissions:(int64_t)a3;
- (void)setAllowSkip:(BOOL)a3;
- (void)setAmpServiceType:(unint64_t)a3;
- (void)setAuthenticationResults:(id)a3;
- (void)setCanEditUsername:(BOOL)a3;
- (void)setHidesBackOrCancelButton:(BOOL)a3;
- (void)setIsAttemptingBackupRestore:(BOOL)a3;
- (void)setLocalSecret:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setNewSignInReauth:(BOOL)a3;
- (void)setOfferiCloudAMSSplitSignIn:(BOOL)a3;
- (void)setPrivacyLinkIdentifiers:(id)a3;
- (void)setServiceContext:(id)a3;
- (void)setServiceDelegate:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setServiceTypes:(id)a3;
- (void)setShouldDisableAccountCreation:(BOOL)a3;
- (void)setShouldForceOperation:(BOOL)a3;
- (void)setShouldShowSystemBackButton:(BOOL)a3;
- (void)setShowsChildSignIn:(BOOL)a3;
- (void)setSplitSignIn:(BOOL)a3;
- (void)setUsername:(id)a3;
@end

@implementation AAUIServiceSignInConfiguration

- (AAUIServiceSignInConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)AAUIServiceSignInConfiguration;
  v2 = [(AAUIServiceSignInConfiguration *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(AAUIServiceSignInConfiguration *)v2 setCanEditUsername:1];
    [(AAUIServiceSignInConfiguration *)v3 setAidaOperationUIPermissions:1];
    [(AAUIServiceSignInConfiguration *)v3 setPrivacyLinkIdentifiers:&unk_26BD70C88];
  }
  return v3;
}

- (void)setServiceTypes:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_serviceTypes, a3);
  if ([v6 count] == 1)
  {
    objc_super v5 = [v6 firstObject];
    [(AAUIServiceSignInConfiguration *)self setServiceType:v5];
  }
  else
  {
    [(AAUIServiceSignInConfiguration *)self setServiceType:0];
  }
}

- (NSArray)serviceTypes
{
  return self->_serviceTypes;
}

- (int64_t)aidaOperationUIPermissions
{
  return self->aidaOperationUIPermissions;
}

- (void)setAidaOperationUIPermissions:(int64_t)a3
{
  self->aidaOperationUIPermissions = a3;
}

- (BOOL)allowSkip
{
  return self->allowSkip;
}

- (void)setAllowSkip:(BOOL)a3
{
  self->allowSkip = a3;
}

- (unint64_t)ampServiceType
{
  return self->ampServiceType;
}

- (void)setAmpServiceType:(unint64_t)a3
{
  self->ampServiceType = a3;
}

- (NSDictionary)authenticationResults
{
  return self->authenticationResults;
}

- (void)setAuthenticationResults:(id)a3
{
}

- (BOOL)canEditUsername
{
  return self->canEditUsername;
}

- (void)setCanEditUsername:(BOOL)a3
{
  self->canEditUsername = a3;
}

- (CDPLocalSecret)localSecret
{
  return self->localSecret;
}

- (void)setLocalSecret:(id)a3
{
}

- (BOOL)isAttemptingBackupRestore
{
  return self->isAttemptingBackupRestore;
}

- (void)setIsAttemptingBackupRestore:(BOOL)a3
{
  self->isAttemptingBackupRestore = a3;
}

- (BOOL)newSignInReauth
{
  return self->newSignInReauth;
}

- (void)setNewSignInReauth:(BOOL)a3
{
  self->newSignInReauth = a3;
}

- (UINavigationController)navigationController
{
  return self->navigationController;
}

- (void)setNavigationController:(id)a3
{
}

- (NSArray)privacyLinkIdentifiers
{
  return self->privacyLinkIdentifiers;
}

- (void)setPrivacyLinkIdentifiers:(id)a3
{
}

- (AIDAServiceContext)serviceContext
{
  return self->serviceContext;
}

- (void)setServiceContext:(id)a3
{
}

- (NSString)serviceType
{
  return self->serviceType;
}

- (void)setServiceType:(id)a3
{
}

- (BOOL)shouldDisableAccountCreation
{
  return self->shouldDisableAccountCreation;
}

- (void)setShouldDisableAccountCreation:(BOOL)a3
{
  self->shouldDisableAccountCreation = a3;
}

- (BOOL)shouldShowSystemBackButton
{
  return self->shouldShowSystemBackButton;
}

- (void)setShouldShowSystemBackButton:(BOOL)a3
{
  self->shouldShowSystemBackButton = a3;
}

- (BOOL)showsChildSignIn
{
  return self->showsChildSignIn;
}

- (void)setShowsChildSignIn:(BOOL)a3
{
  self->showsChildSignIn = a3;
}

- (AAUIServiceSignInControllerDelegate)serviceDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->serviceDelegate);
  return (AAUIServiceSignInControllerDelegate *)WeakRetained;
}

- (void)setServiceDelegate:(id)a3
{
}

- (NSString)username
{
  return self->username;
}

- (void)setUsername:(id)a3
{
}

- (BOOL)shouldForceOperation
{
  return self->shouldForceOperation;
}

- (void)setShouldForceOperation:(BOOL)a3
{
  self->shouldForceOperation = a3;
}

- (BOOL)offeriCloudAMSSplitSignIn
{
  return self->offeriCloudAMSSplitSignIn;
}

- (void)setOfferiCloudAMSSplitSignIn:(BOOL)a3
{
  self->offeriCloudAMSSplitSignIn = a3;
}

- (BOOL)splitSignIn
{
  return self->splitSignIn;
}

- (void)setSplitSignIn:(BOOL)a3
{
  self->splitSignIn = a3;
}

- (BOOL)hidesBackOrCancelButton
{
  return self->hidesBackOrCancelButton;
}

- (void)setHidesBackOrCancelButton:(BOOL)a3
{
  self->hidesBackOrCancelButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->username, 0);
  objc_destroyWeak((id *)&self->serviceDelegate);
  objc_storeStrong((id *)&self->serviceTypes, 0);
  objc_storeStrong((id *)&self->serviceType, 0);
  objc_storeStrong((id *)&self->serviceContext, 0);
  objc_storeStrong((id *)&self->privacyLinkIdentifiers, 0);
  objc_storeStrong((id *)&self->navigationController, 0);
  objc_storeStrong((id *)&self->localSecret, 0);
  objc_storeStrong((id *)&self->authenticationResults, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
}

@end