@interface CNAppleAccountMergeSyncDataIntoLocalDataActionHandler
- (BOOL)perform;
@end

@implementation CNAppleAccountMergeSyncDataIntoLocalDataActionHandler

- (BOOL)perform
{
  v3 = objc_msgSend((id)objc_opt_class(), "os_log");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(CNDataclassActionHandler *)self account];
    v5 = [v4 accountType];
    v6 = [v5 identifier];
    v7 = [(CNDataclassActionHandler *)self account];
    v8 = [v7 username];
    int v15 = 138412546;
    v16 = v6;
    __int16 v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Will merge from the Contacts container for iCloud account %@ (%@) to the Contacts local container, so first enable the Contacts local container", (uint8_t *)&v15, 0x16u);
  }
  [(CNDataclassActionHandler *)self setLocalSourceEnabled:1];
  v9 = [(CNDataclassActionHandler *)self account];
  v10 = [(CNDataclassActionHandler *)self childAccounts];
  id v11 = [(CNDataclassActionHandler *)self copyABAccountForACAccount:v9 withChildren:v10];

  if (!v11) {
    goto LABEL_9;
  }
  if (![(CNDataclassActionHandler *)self mergeContactsIntoLocalSourceFromABAccount:v11])
  {
    v13 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_9C48();
    }

LABEL_9:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  [(CNDataclassActionHandler *)self removeContactsAccount:v11];
  BOOL v12 = 1;
LABEL_10:

  return v12;
}

@end