@interface CDCOCalendarDataClassOwner
+ (id)dataclasses;
- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6;
- (CalDatabase)createDatabaseReferenceForAccount:(id)a3;
- (id)_DAAccountIdentifierForAccount:(id)a3 withChildren:(id)a4;
- (id)accountStore;
- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4;
@end

@implementation CDCOCalendarDataClassOwner

- (CalDatabase)createDatabaseReferenceForAccount:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)CalDatabaseInitializationConfiguration);
  [v4 setOptions:20];
  v5 = (CalDatabase *)CalDatabaseCreateWithConfigurationForAccount();

  return v5;
}

- (id)accountStore
{
  accountStore = self->_accountStore;
  if (!accountStore)
  {
    id v4 = (ACAccountStore *)objc_alloc_init((Class)ACAccountStore);
    v5 = self->_accountStore;
    self->_accountStore = v4;

    accountStore = self->_accountStore;
  }
  return accountStore;
}

- (id)_DAAccountIdentifierForAccount:(id)a3 withChildren:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 identifier];
  id v8 = [v5 accountType];
  v9 = [v8 identifier];
  uint64_t v10 = ACAccountTypeIdentifierCalDAV;
  if ([v9 isEqualToString:ACAccountTypeIdentifierCalDAV])
  {
  }
  else
  {
    id v11 = [v6 count];

    if (!v11) {
      goto LABEL_15;
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v8 = v6;
    id v12 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      id v13 = v12;
      v22 = v7;
      id v23 = v6;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v8);
          }
          v16 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v17 = [v16 accountType];
          v18 = [v17 identifier];
          unsigned int v19 = [v18 isEqualToString:v10];

          if (v19)
          {
            v7 = [v16 identifier];

            id v6 = v23;
            goto LABEL_14;
          }
        }
        id v13 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      v7 = v22;
      id v6 = v23;
    }
  }
LABEL_14:

LABEL_15:
  v20 = +[NSString stringWithFormat:@"com.apple.dataaccessd-%@", v7];

  return v20;
}

+ (id)dataclasses
{
  uint64_t v4 = kAccountDataclassCalendars;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];
  return v2;
}

- (id)actionsForAddingAccount:(id)a3 forDataclass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountType];
  v9 = [(CDCOCalendarDataClassOwner *)self createDatabaseReferenceForAccount:0];
  if (+[CalStoreSetupAndTeardownUtils isReadOnlyAccount:v6])
  {
    uint64_t v10 = +[ACDataclassAction actionWithType:1];
    v35 = v10;
    id v11 = +[NSArray arrayWithObjects:&v35 count:1];

    goto LABEL_16;
  }
  id v12 = [v8 identifier];
  if ([v12 isEqualToString:ACAccountTypeIdentifierExchange]) {
    goto LABEL_12;
  }
  id v13 = [v8 identifier];
  if ([v13 isEqualToString:ACAccountTypeIdentifierHotmail])
  {
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  uint64_t v14 = [v8 identifier];
  if ([v14 isEqualToString:ACAccountTypeIdentifierGmail])
  {
LABEL_10:

    goto LABEL_11;
  }
  v15 = [v8 identifier];
  if ([v15 isEqualToString:ACAccountTypeIdentifierYahoo])
  {
LABEL_9:

    goto LABEL_10;
  }
  v30 = [v8 identifier];
  if ([v30 isEqualToString:ACAccountTypeIdentifierCalDAV])
  {

    goto LABEL_9;
  }
  v29 = [v8 identifier];
  uint64_t v28 = ACAccountTypeIdentifierAppleAccount;
  if (objc_msgSend(v29, "isEqualToString:"))
  {
    v21 = [v6 identifier];
    unsigned __int8 v27 = +[CalAccountUtils isAccountDataSeparated:v21];

    if (v27)
    {
LABEL_13:
      if (+[CalStoreSetupAndTeardownUtils isLocalStoreEmptyInDatabase:v9])
      {
        v16 = +[ACDataclassAction actionWithType:1];
        v34 = v16;
        id v11 = +[NSArray arrayWithObjects:&v34 count:1];
      }
      else
      {
        v17 = +[ACDataclassAction actionWithType:4];
        v33[0] = v17;
        v18 = +[ACDataclassAction destructiveActionWithType:6];
        v33[1] = v18;
        unsigned int v19 = +[ACDataclassAction actionWithType:0];
        v33[2] = v19;
        id v11 = +[NSArray arrayWithObjects:v33 count:3];
      }
      goto LABEL_16;
    }
  }
  else
  {
  }
  v22 = [v8 identifier];
  unsigned int v23 = [v22 isEqualToString:v28];

  if (v23)
  {
    if (+[CalStoreSetupAndTeardownUtils isLocalStoreEmptyInDatabase:v9])
    {
      long long v24 = +[ACDataclassAction actionWithType:1];
      v32 = v24;
      id v11 = +[NSArray arrayWithObjects:&v32 count:1];
    }
    else
    {
      long long v25 = +[ACDataclassAction actionWithType:5];
      v31[0] = v25;
      long long v26 = +[ACDataclassAction actionWithType:0];
      v31[1] = v26;
      id v11 = +[NSArray arrayWithObjects:v31 count:2];
    }
  }
  else
  {
    id v11 = 0;
  }
LABEL_16:
  if (v9) {
    CFRelease(v9);
  }

  return v11;
}

- (id)actionsForDeletingAccount:(id)a3 forDataclass:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountType];
  v9 = [(CDCOCalendarDataClassOwner *)self createDatabaseReferenceForAccount:v6];
  if (+[CalStoreSetupAndTeardownUtils isReadOnlyAccount:v6])
  {
    uint64_t v10 = +[ACDataclassAction destructiveActionWithType:3];
    v33 = v10;
    id v11 = +[NSArray arrayWithObjects:&v33 count:1];

    goto LABEL_14;
  }
  id v12 = [v8 identifier];
  if ([v12 isEqualToString:ACAccountTypeIdentifierExchange]) {
    goto LABEL_12;
  }
  id v13 = [v8 identifier];
  if ([v13 isEqualToString:ACAccountTypeIdentifierHotmail])
  {
LABEL_11:

LABEL_12:
LABEL_13:
    v16 = +[ACDataclassAction destructiveActionWithType:3];
    v32[0] = v16;
    v17 = +[ACDataclassAction actionWithType:0];
    v32[1] = v17;
    id v11 = +[NSArray arrayWithObjects:v32 count:2];

    goto LABEL_14;
  }
  uint64_t v14 = [v8 identifier];
  if ([v14 isEqualToString:ACAccountTypeIdentifierGmail])
  {
LABEL_10:

    goto LABEL_11;
  }
  v15 = [v8 identifier];
  if ([v15 isEqualToString:ACAccountTypeIdentifierYahoo])
  {
LABEL_9:

    goto LABEL_10;
  }
  v29 = [v8 identifier];
  if ([v29 isEqualToString:ACAccountTypeIdentifierCalDAV])
  {

    goto LABEL_9;
  }
  uint64_t v28 = [v8 identifier];
  uint64_t v27 = ACAccountTypeIdentifierAppleAccount;
  if (objc_msgSend(v28, "isEqualToString:"))
  {
    unsigned int v19 = [v6 identifier];
    unsigned __int8 v26 = +[CalAccountUtils isAccountDataSeparated:v19];

    if (v26) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v20 = [v8 identifier];
  unsigned int v21 = [v20 isEqualToString:v27];

  if (v21)
  {
    if (+[CalStoreSetupAndTeardownUtils isStoreEmptyForAccount:v6 inDatabase:v9])
    {
      v22 = +[ACDataclassAction destructiveActionWithType:3];
      v31 = v22;
      id v11 = +[NSArray arrayWithObjects:&v31 count:1];
    }
    else
    {
      unsigned int v23 = +[ACDataclassAction destructiveActionWithType:3];
      v30[0] = v23;
      long long v24 = +[ACDataclassAction actionWithType:2];
      v30[1] = v24;
      long long v25 = +[ACDataclassAction actionWithType:0];
      v30[2] = v25;
      id v11 = +[NSArray arrayWithObjects:v30 count:3];
    }
  }
  else
  {
    id v11 = 0;
  }
LABEL_14:
  if (v9) {
    CFRelease(v9);
  }

  return v11;
}

- (id)actionsForEnablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  return [(CDCOCalendarDataClassOwner *)self actionsForAddingAccount:a3 forDataclass:a4];
}

- (id)actionsForDisablingDataclassOnAccount:(id)a3 forDataclass:(id)a4
{
  return [(CDCOCalendarDataClassOwner *)self actionsForDeletingAccount:a3 forDataclass:a4];
}

- (BOOL)performAction:(id)a3 forAccount:(id)a4 withChildren:(id)a5 forDataclass:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v60 = a6;
  id v13 = [v11 accountType];
  uint64_t v14 = [(CDCOCalendarDataClassOwner *)self createDatabaseReferenceForAccount:v11];
  if (CalDatabaseIsAuxiliaryDatabase()) {
    v15 = [(CDCOCalendarDataClassOwner *)self createDatabaseReferenceForAccount:0];
  }
  else {
    v15 = (CalDatabase *)CFRetain(v14);
  }
  cf = v15;
  uint64_t v59 = [(CDCOCalendarDataClassOwner *)self accountStore];
  v57 = [(CDCOCalendarDataClassOwner *)self _DAAccountIdentifierForAccount:v11 withChildren:v12];
  CalDatabaseSetClientIdentifier();
  v16 = [v13 identifier];
  uint64_t v17 = ACAccountTypeIdentifierAppleAccount;
  if ([v16 isEqualToString:ACAccountTypeIdentifierAppleAccount])
  {
    v18 = [v11 identifier];
    unsigned __int8 v19 = +[CalAccountUtils isAccountDataSeparated:v18];

    if ((v19 & 1) == 0)
    {
      LOBYTE(v20) = 0;
      v22 = cf;
      unsigned int v21 = (void *)v59;
      switch((unint64_t)[v10 type])
      {
        case 1uLL:
          goto LABEL_55;
        case 2uLL:
          unsigned int v23 = _ACLogSystem();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            sub_2BBC();
          }

          +[CalStoreSetupAndTeardownUtils setLocalStoreEnabled:1 inDatabase:v14];
          id v24 = +[CalStoreSetupAndTeardownUtils copyStoreForAccount:v11 withChildren:v12 inDatabase:v14];
          if (v24)
          {
            long long v25 = v24;
            unsigned int v20 = +[CalStoreSetupAndTeardownUtils mergeEventsIntoLocalStoreFromStore:v24 inDatabase:v14];
            CFRelease(v25);
            if (v20)
            {
              id v26 = v11;
              id v27 = v12;
LABEL_53:
              +[CalStoreSetupAndTeardownUtils removeStoreForAccount:v26 withChildren:v27 inDatabase:v14 mainDatabase:cf accountStore:v59];
              goto LABEL_60;
            }
          }
          else
          {
            LOBYTE(v20) = 0;
          }
          if (cf) {
            goto LABEL_74;
          }
          goto LABEL_75;
        case 3uLL:
          if (!+[CalStoreSetupAndTeardownUtils clearAllEventsFromStoreForParentAccount:v11 withChildren:v12 inDatabase:v14])goto LABEL_68; {
          id v26 = v11;
          }
          id v27 = v12;
          goto LABEL_53;
        case 4uLL:
          break;
        case 5uLL:
          if (+[CalStoreSetupAndTeardownUtils isLocalStoreEmptyInDatabase:cf])
          {
LABEL_55:
            if (+[CalStoreSetupAndTeardownUtils setUpCalStoreForParentAccount:v11 withChildren:v12 inDatabase:v14])
            {
              v36 = _ACLogSystem();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
                sub_2B54();
              }
              goto LABEL_58;
            }
            goto LABEL_68;
          }
          if (!+[CalStoreSetupAndTeardownUtils setUpCalStoreForParentAccount:v11 withChildren:v12 inDatabase:v14])
          {
LABEL_68:
            LOBYTE(v20) = 0;
            if (cf) {
              goto LABEL_74;
            }
            goto LABEL_75;
          }
          id v45 = +[CalStoreSetupAndTeardownUtils copyStoreForAccount:v11 withChildren:v12 inDatabase:v14];
          if (!v45) {
            goto LABEL_60;
          }
          v46 = v45;
          unsigned int v20 = +[CalStoreSetupAndTeardownUtils mergeEventsFromLocalStoreIntoStore:v45 inDatabase:v14];
          CFRelease(v46);
          if (v20)
          {
            v47 = _ACLogSystem();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
              sub_2B88();
            }

            v44 = v14;
            goto LABEL_59;
          }
          break;
        default:
          goto LABEL_72;
      }
LABEL_73:
      if (!v22) {
        goto LABEL_75;
      }
      goto LABEL_74;
    }
  }
  else
  {
  }
  uint64_t v28 = [v13 identifier];
  if ([v28 isEqualToString:v17]) {
    goto LABEL_22;
  }
  v29 = v14;
  v30 = [v13 identifier];
  if ([v30 isEqualToString:ACAccountTypeIdentifierCalDAV])
  {
LABEL_21:

    uint64_t v14 = v29;
LABEL_22:

    goto LABEL_23;
  }
  v31 = v13;
  v32 = [v13 identifier];
  if ([v32 isEqualToString:ACAccountTypeIdentifierExchange])
  {
LABEL_20:

    id v13 = v31;
    goto LABEL_21;
  }
  v33 = [v31 identifier];
  if ([v33 isEqualToString:ACAccountTypeIdentifierHotmail])
  {
LABEL_19:

    goto LABEL_20;
  }
  v56 = v31;
  v54 = [v31 identifier];
  if ([v54 isEqualToString:ACAccountTypeIdentifierGmail])
  {

    goto LABEL_19;
  }
  v48 = [v31 identifier];
  unsigned __int8 v53 = [v48 isEqualToString:ACAccountTypeIdentifierYahoo];

  id v13 = v56;
  uint64_t v14 = v29;
  if ((v53 & 1) == 0) {
    goto LABEL_71;
  }
LABEL_23:
  if ([v10 type] == (char *)&dword_4 + 2)
  {
    v22 = cf;
    unsigned int v34 = +[CalStoreSetupAndTeardownUtils drainLocalStoreInDatabase:cf];
    unsigned int v35 = +[CalStoreSetupAndTeardownUtils setUpCalStoreForParentAccount:v11 withChildren:v12 inDatabase:v14];
    LOBYTE(v20) = 0;
    unsigned int v21 = (void *)v59;
    if (!v34 || !v35) {
      goto LABEL_73;
    }
    v36 = _ACLogSystem();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      sub_2B20();
    }
    goto LABEL_58;
  }
  if ([v10 type] == (char *)&dword_0 + 1)
  {
    unsigned int v21 = (void *)v59;
    if (!+[CalStoreSetupAndTeardownUtils setUpCalStoreForParentAccount:v11 withChildren:v12 inDatabase:v14])
    {
      LOBYTE(v20) = 0;
      v22 = cf;
      if (!cf) {
        goto LABEL_75;
      }
      goto LABEL_74;
    }
    v36 = _ACLogSystem();
    v22 = cf;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      sub_2B20();
    }
LABEL_58:

    v44 = v22;
LABEL_59:
    +[CalStoreSetupAndTeardownUtils setLocalStoreEnabled:0 inDatabase:v44];
LABEL_60:
    LOBYTE(v20) = 1;
    if (!v22) {
      goto LABEL_75;
    }
LABEL_74:
    CFRelease(v22);
    goto LABEL_75;
  }
  if ([v10 type] == &dword_4)
  {
    LOBYTE(v20) = +[CalStoreSetupAndTeardownUtils setUpCalStoreForParentAccount:v11 withChildren:v12 inDatabase:v14];
LABEL_72:
    v22 = cf;
    unsigned int v21 = (void *)v59;
    goto LABEL_73;
  }
  if ([v10 type] != (char *)&dword_0 + 3)
  {
LABEL_71:
    LOBYTE(v20) = 0;
    goto LABEL_72;
  }
  unsigned int v50 = +[CalStoreSetupAndTeardownUtils clearAllEventsFromStoreForParentAccount:v11 withChildren:v12 inDatabase:v14];
  if (v50) {
    +[CalStoreSetupAndTeardownUtils removeStoreForAccount:v11 withChildren:v12 inDatabase:v14 mainDatabase:cf accountStore:v59];
  }
  v51 = v14;
  id v52 = v12;
  id v55 = v11;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v37 = v12;
  id v38 = [v37 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v38)
  {
    id v39 = v38;
    uint64_t v40 = *(void *)v62;
    do
    {
      for (i = 0; i != v39; i = (char *)i + 1)
      {
        if (*(void *)v62 != v40) {
          objc_enumerationMutation(v37);
        }
        v42 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        v43 = [v42 accountPropertyForKey:@"CalDAVMobileAccountDelegatePrincipalPath"];

        if (v43) {
          [(CDCOCalendarDataClassOwner *)self performAction:v10 forAccount:v42 withChildren:&__NSArray0__struct forDataclass:v60];
        }
      }
      id v39 = [v37 countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v39);
  }

  id v12 = v52;
  id v11 = v55;
  uint64_t v14 = v51;
  v22 = cf;
  unsigned int v21 = (void *)v59;
  LOBYTE(v20) = v50;
  if (cf) {
    goto LABEL_74;
  }
LABEL_75:
  if (v14) {
    CFRelease(v14);
  }

  return v20;
}

- (void).cxx_destruct
{
}

@end