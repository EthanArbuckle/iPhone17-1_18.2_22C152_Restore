@interface AKBirthDayKeychain
- (AAFKeychainManager)keychainManager;
- (AKBirthDayKeychain)init;
- (BOOL)deleteBirthdayForAltDSID:(id)a3 error:(id *)a4;
- (BOOL)updateBirthdayForAltDSID:(id)a3 userInformation:(id)a4 error:(id *)a5;
- (id)_birthDayKeychainDescriptorForAltDSID:(id)a3;
- (id)fetchBirthDayForAltDSID:(id)a3 error:(id *)a4;
- (void)setKeychainManager:(id)a3;
@end

@implementation AKBirthDayKeychain

- (AKBirthDayKeychain)init
{
  v6.receiver = self;
  v6.super_class = (Class)AKBirthDayKeychain;
  v2 = [(AKBirthDayKeychain *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    keychainManager = v2->_keychainManager;
    v2->_keychainManager = (AAFKeychainManager *)v3;
  }
  return v2;
}

- (id)fetchBirthDayForAltDSID:(id)a3 error:(id *)a4
{
  objc_super v6 = [(AKBirthDayKeychain *)self _birthDayKeychainDescriptorForAltDSID:a3];
  keychainManager = self->_keychainManager;
  id v19 = 0;
  v8 = [(AAFKeychainManager *)keychainManager keychainItemForDescriptor:v6 error:&v19];
  id v9 = v19;
  v10 = [v8 value];
  if ([v9 code] == (id)-25300
    && ([v9 domain],
        v11 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v12 = [v11 isEqualToString:NSOSStatusErrorDomain],
        v11,
        (v12 & 1) != 0))
  {
    id v13 = 0;
  }
  else
  {
    id v18 = 0;
    v14 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v10 error:&v18];
    id v15 = v18;
    if (v10)
    {
      id v13 = v14;
    }
    else
    {
      v16 = _AKLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100191F10();
      }

      id v13 = 0;
      if (a4) {
        *a4 = v15;
      }
    }
  }

  return v13;
}

- (BOOL)updateBirthdayForAltDSID:(id)a3 userInformation:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = +[AKAccountManager sharedInstance];
  id v37 = 0;
  v11 = [v10 authKitAccountWithAltDSID:v8 error:&v37];
  id v12 = v37;

  if (v11)
  {
    id v33 = v12;
    id v35 = v8;
    id v13 = [v9 birthMonth];
    id v34 = v9;
    v14 = [v9 birthDay];
    id v15 = +[AKAccountManager sharedInstance];
    v16 = [v15 birthYearForAccount:v11];
    uint64_t v17 = +[NSString stringWithFormat:@"%@-%@-%@", v13, v14, v16];

    id v18 = v17;
    id v19 = objc_alloc_init((Class)NSDateFormatter);
    [v19 setDateFormat:@"MM-dd-yyyy"];
    [v19 dateFromString:v17];
    v32 = v36[1] = 0;
    v20 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:");
    id v21 = 0;
    if (v20)
    {
      v22 = [(AKBirthDayKeychain *)self _birthDayKeychainDescriptorForAltDSID:v35];
      id v23 = [objc_alloc((Class)AAFKeychainItem) initWithDescriptor:v22 value:v20];
      keychainManager = self->_keychainManager;
      v36[0] = 0;
      [(AAFKeychainManager *)keychainManager addOrUpdateKeychainItem:v23 error:v36];
      id v25 = v36[0];
      BOOL v26 = v25 == 0;
      if (v25)
      {
        v31 = a5;
        v27 = v18;
        v28 = _AKLogSystem();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_100192060();
        }

        id v18 = v27;
        if (v31) {
          id *v31 = v25;
        }
      }

      id v9 = v34;
      id v8 = v35;
    }
    else
    {
      v29 = _AKLogSystem();
      id v8 = v35;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_100191FEC();
      }

      id v9 = v34;
      BOOL v26 = 0;
      if (a5) {
        *a5 = v21;
      }
    }

    id v12 = v33;
LABEL_19:

    goto LABEL_20;
  }
  if (v12)
  {
    id v18 = _AKLogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100191F84();
    }
    id v21 = 0;
    BOOL v26 = 0;
    goto LABEL_19;
  }
  id v21 = 0;
  BOOL v26 = 0;
LABEL_20:

  return v26;
}

- (BOOL)deleteBirthdayForAltDSID:(id)a3 error:(id *)a4
{
  objc_super v6 = [(AKBirthDayKeychain *)self _birthDayKeychainDescriptorForAltDSID:a3];
  [(AAFKeychainManager *)self->_keychainManager deleteKeychainItemsForDescriptor:v6 error:a4];
  if (a4)
  {
    v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1001920C8((uint64_t)a4, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  return a4 == 0;
}

- (id)_birthDayKeychainDescriptorForAltDSID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)AAFKeychainItemDescriptor);
  [v4 setItemClass:1];
  [v4 setInvisible:2];
  [v4 setSynchronizable:1];
  [v4 setUseDataProtection:2];
  [v4 setItemAccessible:0];
  v5 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.authkit.birthDay", v3];
  [v4 setService:v5];
  [v4 setLabel:v3];

  return v4;
}

- (AAFKeychainManager)keychainManager
{
  return self->_keychainManager;
}

- (void)setKeychainManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end