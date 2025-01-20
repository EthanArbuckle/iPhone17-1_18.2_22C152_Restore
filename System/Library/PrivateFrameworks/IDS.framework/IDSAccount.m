@interface IDSAccount
- (BOOL)_isEnabled;
- (BOOL)canSend;
- (BOOL)isActive;
- (BOOL)isEnabled;
- (BOOL)isUsableForOuterMessaging;
- (BOOL)isUserDisabled;
- (IDSAccount)initWithDictionary:(id)a3 uniqueID:(id)a4 serviceName:(id)a5;
- (IDSAccount)initWithLoginID:(id)a3 uniqueID:(id)a4 serviceName:(id)a5;
- (NSArray)accountRegisteredURIs;
- (NSArray)aliasStrings;
- (NSArray)aliases;
- (NSArray)aliasesToRegister;
- (NSArray)connectedDevices;
- (NSArray)devices;
- (NSArray)handles;
- (NSArray)nearbyDevices;
- (NSArray)pseudonyms;
- (NSArray)registeredURIs;
- (NSArray)vettedAliases;
- (NSData)pushToken;
- (NSData)registrationCertificate;
- (NSDate)dateRegistered;
- (NSDate)nextRegistrationDate;
- (NSDictionary)accountInfo;
- (NSDictionary)profileInfo;
- (NSDictionary)pseudonymURIMap;
- (NSDictionary)regionServerContext;
- (NSDictionary)registrationAlertInfo;
- (NSString)displayName;
- (NSString)loginID;
- (NSString)primaryServiceName;
- (NSString)profileID;
- (NSString)regionBasePhoneNumber;
- (NSString)regionID;
- (NSString)serviceName;
- (NSString)uniqueID;
- (NSString)userUniqueIdentifier;
- (_IDSAccount)_internal;
- (id)_initWithDictionary:(id)a3 uniqueID:(id)a4 serviceName:(id)a5;
- (id)description;
- (id)matchingSim;
- (int)accountType;
- (int)profileValidationErrorReason;
- (int)registrationError;
- (int)registrationStatus;
- (int64_t)profileValidationStatus;
- (void)_callNearbyDevicesChanged;
- (void)_reloadCachedDevices;
- (void)_reregisterAndReidentify:(BOOL)a3;
- (void)_setIsEnabled:(BOOL)a3;
- (void)addAliases:(id)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)addRegistrationDelegate:(id)a3 queue:(id)a4;
- (void)authenticateAccount;
- (void)deactivateAndPurgeIdentify;
- (void)dealloc;
- (void)forceRemoveAccount;
- (void)passwordUpdated;
- (void)registerAccount;
- (void)removeAliases:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)removeRegistrationDelegate:(id)a3;
- (void)setAccountInfo:(id)a3;
- (void)setAuthToken:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setLoginID:(id)a3;
- (void)setPassword:(id)a3;
- (void)setRegionBasePhoneNumber:(id)a3;
- (void)setRegionID:(id)a3;
- (void)unregisterAccount;
- (void)unvalidateAliases:(id)a3;
- (void)updateAccountWithAccountInfo:(id)a3;
- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4;
- (void)validateAliases:(id)a3;
- (void)validateProfile;
@end

@implementation IDSAccount

- (id)matchingSim
{
  v3 = [MEMORY[0x1E4F6B3E8] sharedInstance];
  v4 = [(IDSAccount *)self userUniqueIdentifier];
  v5 = [v3 SIMForIdentifier:v4];

  return v5;
}

- (id)_initWithDictionary:(id)a3 uniqueID:(id)a4 serviceName:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_IDSRunningInDaemon())
  {
    v11 = +[IDSLogging Accounts];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A2DE10();
    }

    v12 = 0;
  }
  else
  {
    v13 = +[IDSInternalQueueController sharedInstance];
    int v14 = [v13 assertQueueIsCurrent];

    if (v14)
    {
      v15 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_191A36820();
      }
    }
    v21.receiver = self;
    v21.super_class = (Class)IDSAccount;
    v16 = [(IDSAccount *)&v21 init];
    if (v16)
    {
      v17 = [[_IDSAccount alloc] initWithDictionary:v8 uniqueID:v9 serviceName:v10 delegateContext:v16];
      internal = v16->_internal;
      v16->_internal = v17;
    }
    v19 = +[IDSLogging Accounts];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218754;
      v23 = v16;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v9;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl(&dword_19190B000, v19, OS_LOG_TYPE_INFO, "Creating new IDSAccount %p with config %@ uniqueID %@ serviceName %@", buf, 0x2Au);
    }

    self = v16;
    v12 = self;
  }

  return v12;
}

- (IDSAccount)initWithDictionary:(id)a3 uniqueID:(id)a4 serviceName:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_IDSRunningInDaemon())
  {
    v11 = +[IDSLogging Accounts];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_191A2DE10();
    }

    v12 = 0;
  }
  else
  {
    v13 = +[IDSInternalQueueController sharedInstance];
    int v14 = [v13 assertQueueIsNotCurrent];

    if (v14)
    {
      v15 = [MEMORY[0x1E4F6B460] utilities];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_191A368B8();
      }
    }
    v28.receiver = self;
    v28.super_class = (Class)IDSAccount;
    v16 = [(IDSAccount *)&v28 init];
    if (v16)
    {
      v17 = +[IDSInternalQueueController sharedInstance];
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = sub_1919970F8;
      v23 = &unk_1E5729680;
      __int16 v24 = v16;
      id v25 = v8;
      id v26 = v9;
      id v27 = v10;
      [v17 performBlock:&v20];
    }
    v18 = +[IDSLogging Accounts];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v30 = v16;
      __int16 v31 = 2112;
      id v32 = v8;
      __int16 v33 = 2112;
      id v34 = v9;
      __int16 v35 = 2112;
      id v36 = v10;
      _os_log_impl(&dword_19190B000, v18, OS_LOG_TYPE_INFO, "Creating new IDSAccount %p with config %@ uniqueID %@ serviceName %@", buf, 0x2Au);
    }

    self = v16;
    v12 = self;
  }

  return v12;
}

- (IDSAccount)initWithLoginID:(id)a3 uniqueID:(id)a4 serviceName:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[IDSInternalQueueController sharedInstance];
  int v12 = [v11 assertQueueIsNotCurrent];

  if (v12)
  {
    v13 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A36950();
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)IDSAccount;
  int v14 = [(IDSAccount *)&v26 init];
  if (v14)
  {
    v15 = +[IDSInternalQueueController sharedInstance];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = sub_19199737C;
    uint64_t v21 = &unk_1E5729680;
    v22 = v14;
    id v23 = v8;
    id v24 = v9;
    id v25 = v10;
    [v15 performBlock:&v18];
  }
  v16 = objc_msgSend(MEMORY[0x1E4F6C3B8], "registration", v18, v19, v20, v21);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    objc_super v28 = v14;
    __int16 v29 = 2112;
    id v30 = v8;
    __int16 v31 = 2112;
    id v32 = v9;
    __int16 v33 = 2112;
    id v34 = v10;
    _os_log_debug_impl(&dword_19190B000, v16, OS_LOG_TYPE_DEBUG, "Created new IDSAccount %p with loginID %@ uniqueID %@ serviceName %@", buf, 0x2Au);
  }

  return v14;
}

- (void)dealloc
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_191918710;
  v6[4] = sub_1919185A8;
  v7 = (_IDSAccount *)0xAAAAAAAAAAAAAAAALL;
  v7 = self->_internal;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191997500;
  v5[3] = &unk_1E5728DD0;
  v5[4] = v6;
  [v3 performBlock:v5 waitUntilDone:0];

  _Block_object_dispose(v6, 8);
  v4.receiver = self;
  v4.super_class = (Class)IDSAccount;
  [(IDSAccount *)&v4 dealloc];
}

- (_IDSAccount)_internal
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A369E8();
    }
  }
  internal = self->_internal;

  return internal;
}

- (NSString)uniqueID
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919976E4;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (NSString)loginID
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191997874;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (NSString)serviceName
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191997A04;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (NSString)primaryServiceName
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191997B94;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (int)accountType
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1431655766;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191997CE4;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  void v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)self;
}

- (BOOL)isActive
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191997E28;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  void v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (BOOL)isUserDisabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191997F6C;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  void v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (BOOL)canSend
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1919980B0;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  void v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (NSArray)devices
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191998234;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)nearbyDevices
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919983C4;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)connectedDevices
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191998554;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSDictionary)profileInfo
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919986E4;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSArray)aliases
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191998874;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)aliasStrings
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191998A04;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)vettedAliases
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191998B94;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)aliasesToRegister
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191998D24;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)handles
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191998EB4;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSDictionary)pseudonymURIMap
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191999044;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSArray)pseudonyms
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1919991D4;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (void)setPassword:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1919992F4;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)setAuthToken:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191999400;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (BOOL)isEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19199953C;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  void v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (BOOL)_isEnabled
{
  v3 = +[IDSInternalQueueController sharedInstance];
  int v4 = [v3 assertQueueIsCurrent];

  if (v4)
  {
    v5 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_191A36A80();
    }
  }
  return [(_IDSAccount *)self->_internal _isEnabled];
}

- (void)_setIsEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  int v6 = [v5 assertQueueIsCurrent];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F6B460] utilities];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_191A36B18();
    }
  }
  [(_IDSAccount *)self->_internal _setIsEnabled:v3];
}

- (BOOL)isUsableForOuterMessaging
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191999790;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  void v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LOBYTE(self) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)self;
}

- (NSDictionary)accountInfo
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191999914;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)setAccountInfo:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191999A34;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)updateAccountWithAccountInfo:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_191999B40;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (int)registrationStatus
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1431655766;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191999C7C;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  void v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)self;
}

- (int)registrationError
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1431655766;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_191999DC0;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  void v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)self;
}

- (NSDictionary)registrationAlertInfo
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_191999F44;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (int64_t)profileValidationStatus
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19199A094;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (int)profileValidationErrorReason
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = -1431655766;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19199A1D8;
  v5[3] = &unk_1E5728DF8;
  v5[4] = self;
  void v5[5] = &v6;
  [v3 performBlock:v5 waitUntilDone:1];

  LODWORD(self) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)self;
}

- (NSDate)nextRegistrationDate
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unint64_t v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19199A35C;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

- (NSDate)dateRegistered
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unint64_t v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19199A4EC;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

- (NSArray)registeredURIs
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unint64_t v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19199A67C;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSArray)accountRegisteredURIs
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unint64_t v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19199A80C;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (NSData)registrationCertificate
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unint64_t v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19199A99C;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSData *)v4;
}

- (NSData)pushToken
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unint64_t v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19199AB2C;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSData *)v4;
}

- (NSDictionary)regionServerContext
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unint64_t v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19199ACBC;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (NSString)profileID
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unint64_t v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19199AE4C;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19199AF94;
  v11[3] = &unk_1E5728DA8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11 waitUntilDone:0];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19199B094;
  v6[3] = &unk_1E5729BB0;
  v6[4] = self;
  void v6[5] = v4;
  [v5 performBlock:v6 waitUntilDone:1];
}

- (void)addRegistrationDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19199B1C8;
  v11[3] = &unk_1E5728DA8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11 waitUntilDone:0];
}

- (void)removeRegistrationDelegate:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19199B2C8;
  v6[3] = &unk_1E5729BB0;
  v6[4] = self;
  void v6[5] = v4;
  [v5 performBlock:v6 waitUntilDone:1];
}

- (id)description
{
  BOOL v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(IDSAccount *)self serviceName];
  id v6 = [(IDSAccount *)self loginID];
  id v7 = [(IDSAccount *)self uniqueID];
  [(IDSAccount *)self accountType];
  uint64_t v8 = _StringForIDSAccountType();
  if ([(IDSAccount *)self isActive]) {
    id v9 = @"YES";
  }
  else {
    id v9 = @"NO";
  }
  [(IDSAccount *)self registrationStatus];
  id v10 = _IDSStringFromIDSRegistrationStatus();
  v11 = [v3 stringWithFormat:@"%@: %p [Service: %@  User: %@  ID: %@  Type: %@  Active: %@  Registration Status: %@]", v4, self, v5, v6, v7, v8, v9, v10];

  return v11;
}

- (NSString)regionID
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19199B564;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)setRegionID:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19199B684;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (NSString)regionBasePhoneNumber
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19199B800;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)setRegionBasePhoneNumber:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19199B920;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (NSString)displayName
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19199BA9C;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)setDisplayName:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19199BBBC;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (NSString)userUniqueIdentifier
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_191918710;
  v11 = sub_1919185A8;
  id v12 = 0;
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_19199BD38;
  v6[3] = &unk_1E5728DF8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performBlock:v6 waitUntilDone:1];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSString *)v4;
}

- (void)authenticateAccount
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19199BE30;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (void)passwordUpdated
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19199BF04;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IDSInternalQueueController sharedInstance];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_19199C024;
  v11[3] = &unk_1E5728DA8;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlock:v11];
}

- (void)validateProfile
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19199C108;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (void)addAliases:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19199C204;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)removeAliases:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19199C310;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)validateAliases:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19199C41C;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)unvalidateAliases:(id)a3
{
  id v4 = a3;
  v5 = +[IDSInternalQueueController sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_19199C4E0;
  v7[3] = &unk_1E57291B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performBlock:v7];
}

- (void)registerAccount
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v7 = _os_activity_create(&dword_19190B000, "Framework register account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v7, &state);
  BOOL v3 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Client requesting to register account: %@", buf, 0xCu);
  }

  id v4 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19199C67C;
  v5[3] = &unk_1E5729000;
  v5[4] = self;
  [v4 performBlock:v5];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)unregisterAccount
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v7 = _os_activity_create(&dword_19190B000, "Framework unregister account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v7, &state);
  BOOL v3 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Client requesting to unregister account: %@", buf, 0xCu);
  }

  id v4 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19199C850;
  v5[3] = &unk_1E5729000;
  v5[4] = self;
  [v4 performBlock:v5];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)forceRemoveAccount
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v7 = _os_activity_create(&dword_19190B000, "Framework force remove account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v7, &state);
  BOOL v3 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Client requesting to force remove account: %@", buf, 0xCu);
  }

  id v4 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19199CA24;
  v5[3] = &unk_1E5729000;
  v5[4] = self;
  [v4 performBlock:v5];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_reregisterAndReidentify:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  v11 = _os_activity_create(&dword_19190B000, "Framework reregister account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v11, &state);
  v5 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = @"NO";
    if (v3) {
      id v6 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    v15 = self;
    _os_log_impl(&dword_19190B000, v5, OS_LOG_TYPE_DEFAULT, "Client requesting to reregister (with reidentify %@) account: %@", buf, 0x16u);
  }

  id v7 = +[IDSInternalQueueController sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_19199CC2C;
  v8[3] = &unk_1E5729050;
  v8[4] = self;
  BOOL v9 = v3;
  [v7 performBlock:v8];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)deactivateAndPurgeIdentify
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v7 = _os_activity_create(&dword_19190B000, "Framework deactivate account", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v7, &state);
  BOOL v3 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v9 = self;
    _os_log_impl(&dword_19190B000, v3, OS_LOG_TYPE_DEFAULT, "Client requesting to deactivate and purge identify account: %@", buf, 0xCu);
  }

  id v4 = +[IDSInternalQueueController sharedInstance];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_19199CE10;
  v5[3] = &unk_1E5729000;
  v5[4] = self;
  [v4 performBlock:v5];

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_callNearbyDevicesChanged
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19199CEE4;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (void)_reloadCachedDevices
{
  BOOL v3 = +[IDSInternalQueueController sharedInstance];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_19199CFBC;
  v4[3] = &unk_1E5729000;
  v4[4] = self;
  [v3 performBlock:v4 waitUntilDone:1];
}

- (void)setLoginID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginID, 0);

  objc_storeStrong((id *)&self->_internal, 0);
}

@end