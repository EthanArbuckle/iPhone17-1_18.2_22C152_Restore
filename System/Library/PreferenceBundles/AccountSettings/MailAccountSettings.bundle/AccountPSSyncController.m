@interface AccountPSSyncController
- (BOOL)shouldAutomaticallyTryEnablingDataclassDuringSetup:(id)a3;
- (BOOL)shouldVerifyBeforeAccountSave;
- (Class)accountInfoControllerClass;
- (MailAccount)mailAccount;
- (id)specifiers;
- (id)valueForAccountSummaryCell;
- (void)viewDidLoad;
@end

@implementation AccountPSSyncController

- (void)viewDidLoad
{
  v3 = [(AccountPSSyncController *)self mailAccount];
  unsigned int v4 = [v3 isManaged];

  if (v4) {
    [(AccountPSSyncController *)self setShouldShowDeleteAccountButton:0];
  }
  v5.receiver = self;
  v5.super_class = (Class)AccountPSSyncController;
  [(AccountPSSyncController *)&v5 viewDidLoad];
}

- (id)specifiers
{
  v10.receiver = self;
  v10.super_class = (Class)AccountPSSyncController;
  v3 = [(AccountPSSyncController *)&v10 specifiers];
  id v4 = [v3 mutableCopy];

  objc_super v5 = [(AccountPSSyncController *)self mailAccount];
  v6 = [v5 otherTopLevelSpecifiers];
  [v4 addObjectsFromArray:v6];

  v7 = [v5 managedAccountFooterText];
  if (v7)
  {
    v8 = +[PSSpecifier emptyGroupSpecifier];
    [v8 setProperty:v7 forKey:PSFooterTextGroupKey];
    [v4 addObject:v8];
  }
  objc_storeStrong((id *)&self->ACUIDataclassConfigurationViewController_opaque[OBJC_IVAR___PSListController__specifiers], v4);

  return v4;
}

- (Class)accountInfoControllerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldVerifyBeforeAccountSave
{
  return 0;
}

- (id)valueForAccountSummaryCell
{
  if (_os_feature_enabled_impl())
  {
    v3 = [(AccountPSSyncController *)self account];
    id v4 = [v3 accountDescription];
  }
  else
  {
    v3 = [(AccountPSSyncController *)self mailAccount];
    objc_super v5 = [v3 defaultEmailAddress];
    v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [v3 firstEmailAddress];
    }
    id v4 = v7;
  }

  return v4;
}

- (MailAccount)mailAccount
{
  v2 = [(AccountPSSyncController *)self account];
  v3 = +[MFAccount accountWithPersistentAccount:v2];

  return (MailAccount *)v3;
}

- (BOOL)shouldAutomaticallyTryEnablingDataclassDuringSetup:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:kAccountDataclassNotes])
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)AccountPSSyncController;
    BOOL v5 = [(AccountPSSyncController *)&v7 shouldAutomaticallyTryEnablingDataclassDuringSetup:v4];
  }

  return v5;
}

@end