@interface THPreferredThreadNetwork
+ (id)keyChainQueryForDeleteAllPreferredNetworks;
+ (id)keyChainQueryForDeletePreferredNetworkRecord:(id)a3;
+ (id)keyChainQueryForDeletePreferredNetworkRecordForNetworkSignature:(id)a3;
+ (id)keyChainQueryForDeletePreferredNetworkRecordOperationForNetworkName:(id)a3;
+ (id)keyChainQueryForFetchPreferredNetworkRecordsOperation;
+ (id)keyChainQueryForFetchPreferredNetworkRecordsOperationForTheCount:(int)a3;
+ (id)keyChainQueryForPreferredNetworkRecordsOperationForLabelAsSSID:(id)a3;
+ (id)keyChainQueryForPreferredNetworkRecordsOperationForNetwork:(id)a3;
+ (id)keyChainQueryForPreferredNetworkRecordsOperationForNetworkSignature:(id)a3;
+ (id)keyChainQueryForPreferredNetworkRecordsOperationForWifiNetwork:(id)a3;
+ (id)keyChainQueryForPreferredNetworkRecordsOperationForWifiNetworkWithSignature:(id)a3;
+ (id)preferredNetworkFromKeychainDictionary:(id)a3;
- (id)DEBUGkeyChainItemRepresentationForpreferredNetworkAddOperation;
- (id)DEBUGkeyChainQueryForpreferredNetworkUpdateOperation;
- (id)keyChainItemRepresentationForpreferredNetworkAddOperation;
- (id)keyChainItemRepresentationForpreferredNetworkUpdateOperation;
- (id)keyChainQueryForpreferredNetworkUpdateOperation;
@end

@implementation THPreferredThreadNetwork

+ (id)preferredNetworkFromKeychainDictionary:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKey:kSecAttrAccount];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [v3 objectForKey:kSecAttrAccount];
  }
  else
  {
    v5 = 0;
  }

  v6 = [v3 objectForKey:kSecAttrServer];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [v3 objectForKey:kSecAttrServer];
  }
  else
  {
    v7 = 0;
  }

  v8 = dataFromBase64String(v7);
  v9 = [v3 objectForKey:kSecAttrPort];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = [v3 objectForKey:kSecAttrPort];
  }
  else
  {
    v10 = 0;
  }

  v11 = [v3 objectForKey:kSecAttrProtocol];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12 = [v3 objectForKey:kSecAttrProtocol];
  }
  else
  {
    v12 = 0;
  }

  v46 = v10;
  v13 = dataFromBase64String(v10);
  v45 = v12;
  v14 = dataFromBase64String(v12);
  v15 = [v3 objectForKey:kSecAttrAuthenticationType];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v48 = [v3 objectForKey:kSecAttrAuthenticationType];
  }
  else
  {
    v48 = 0;
  }

  if (v5 && v8 && v13 && v14)
  {
    v16 = [v3 objectForKey:kSecAttrSecurityDomain];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = [v3 objectForKey:kSecAttrSecurityDomain];

      if (v17) {
        goto LABEL_30;
      }
    }
    else
    {
    }
    v19 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[THPreferredThreadNetwork(Keychain) preferredNetworkFromKeychainDictionary:].cold.5();
    }

    v17 = &stru_1004A31D0;
LABEL_30:
    v44 = v8;
    v20 = [v3 objectForKey:kSecAttrLabel];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [v3 objectForKey:kSecAttrLabel];

      if (v21)
      {
LABEL_37:
        v23 = [v3 objectForKey:kSecValueData];
        objc_opt_class();
        v41 = v7;
        if (objc_opt_isKindOfClass())
        {
          v24 = [v3 objectForKey:kSecValueData];
        }
        else
        {
          v24 = 0;
        }

        id v49 = 0;
        v25 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v24 error:&v49];
        id v40 = v49;
        v26 = THCredentialsServerLogHandleForCategory(1);
        v27 = v26;
        v43 = v25;
        if (v25)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v28 = [v25 network];
            [v28 networkName];
            v30 = v29 = v21;
            *(_DWORD *)buf = 136315650;
            v51 = "+[THPreferredThreadNetwork(Keychain) preferredNetworkFromKeychainDictionary:]";
            __int16 v52 = 1024;
            int v53 = 107;
            __int16 v54 = 2112;
            v55 = v30;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%s: %d : credentials dataset record is present for preferred network entry : %@", buf, 0x1Cu);

            v21 = v29;
            v8 = v44;
          }
        }
        else if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          +[THPreferredThreadNetwork(Keychain) preferredNetworkFromKeychainDictionary:]();
        }

        v42 = v5;
        id v31 = [objc_alloc((Class)THThreadNetwork) initWithName:v5 extendedPANID:v8];
        if (v31)
        {
          v32 = [objc_alloc((Class)THNetworkSignature) initWithSignatures:v13 ipv6NwSignature:v14 wifSSID:v17 wifiPassword:v21];
          if (v32)
          {
            v39 = v21;
            v33 = [v3 objectForKey:kSecAttrCreationDate];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v34 = [v3 objectForKey:kSecAttrCreationDate];
            }
            else
            {
              v34 = 0;
            }

            v36 = [v3 objectForKey:kSecAttrModificationDate];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v37 = [v3 objectForKey:kSecAttrModificationDate];
            }
            else
            {
              v37 = 0;
            }

            id v18 = [objc_alloc((Class)THPreferredThreadNetwork) initWithThreadNetwork:v31 networkSignature:v32 credentialsDataSetRecord:v43 creationDate:v34 lastModificationDate:v37 userInfo:v48];
            v21 = v39;
          }
          else
          {
            v34 = THCredentialsServerLogHandleForCategory(1);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              +[THPreferredThreadNetwork(Keychain) preferredNetworkFromKeychainDictionary:](v34);
            }
            id v18 = 0;
          }

          v35 = v40;
        }
        else
        {
          v32 = THCredentialsServerLogHandleForCategory(1);
          v35 = v40;
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            +[THPreferredThreadNetwork(Keychain) preferredNetworkFromKeychainDictionary:](v32);
          }
          id v18 = 0;
        }

        v7 = v41;
        v5 = v42;
        v8 = v44;
        goto LABEL_62;
      }
    }
    else
    {
    }
    v22 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      +[THPreferredThreadNetwork(Keychain) preferredNetworkFromKeychainDictionary:].cold.4();
    }

    v21 = &stru_1004A31D0;
    goto LABEL_37;
  }
  v17 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    +[THPreferredThreadNetwork(Keychain) preferredNetworkFromKeychainDictionary:].cold.6();
  }
  id v18 = 0;
LABEL_62:

  return v18;
}

- (id)DEBUGkeyChainItemRepresentationForpreferredNetworkAddOperation
{
  id v3 = [(THPreferredThreadNetwork *)self DEBUGkeyChainQueryForpreferredNetworkUpdateOperation];
  uint64_t v4 = [(THPreferredThreadNetwork *)self keyChainItemRepresentationForpreferredNetworkUpdateOperation];
  v5 = (void *)v4;
  if (v3 && v4)
  {
    v6 = [v3 mutableCopy];
    [v6 addEntriesFromDictionary:v5];
    v10[0] = kSecAttrIsInvisible;
    v10[1] = kSecAttrSynchronizable;
    v11[0] = &__kCFBooleanTrue;
    v11[1] = &__kCFBooleanTrue;
    v10[2] = kSecAttrAccessGroup;
    v10[3] = kSecAttrSyncViewHint;
    v11[2] = @"com.apple.preferred.network";
    v11[3] = kSecAttrViewHintHome;
    v10[4] = kSecAttrAccessible;
    v10[5] = kSecAttrDescription;
    v11[4] = kSecAttrAccessibleAlways;
    v11[5] = @"Preferred Thread network Record";
    v10[6] = kSecAttrPath;
    v11[6] = @"com.apple.preferred.network";
    v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:7];
    [v6 addEntriesFromDictionary:v7];

    id v8 = [v6 copy];
  }
  else
  {
    v6 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[THPreferredThreadNetwork(Keychain) DEBUGkeyChainItemRepresentationForpreferredNetworkAddOperation](v6);
    }
    id v8 = 0;
  }

  return v8;
}

- (id)DEBUGkeyChainQueryForpreferredNetworkUpdateOperation
{
  id v3 = [(THPreferredThreadNetwork *)self network];
  uint64_t v4 = [v3 networkName];
  if (!v4) {
    goto LABEL_8;
  }
  v5 = (void *)v4;
  v6 = [(THPreferredThreadNetwork *)self network];
  uint64_t v7 = [v6 extendedPANID];
  if (!v7)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  id v8 = (void *)v7;
  v9 = [(THPreferredThreadNetwork *)self networkSignature];
  uint64_t v10 = [v9 ipv4NwSignature];
  if (!v10)
  {

    goto LABEL_7;
  }
  v11 = (void *)v10;
  v12 = [(THPreferredThreadNetwork *)self networkSignature];
  v13 = [v12 ipv6NwSignature];

  if (v13)
  {
    v28[0] = kSecClass;
    v28[1] = kSecAttrSynchronizable;
    v29[0] = kSecClassInternetPassword;
    v29[1] = kSecAttrSynchronizableAny;
    v29[2] = kSecAttrViewHintHome;
    v28[2] = kSecAttrSyncViewHint;
    v28[3] = kSecAttrAccount;
    v14 = [(THPreferredThreadNetwork *)self network];
    v27 = [v14 networkName];
    v29[3] = v27;
    v28[4] = kSecAttrServer;
    v26 = [(THPreferredThreadNetwork *)self network];
    v25 = [v26 extendedPANID];
    v15 = base64StringFromData_0(v25);
    v29[4] = v15;
    v28[5] = kSecAttrPort;
    v16 = [(THPreferredThreadNetwork *)self networkSignature];
    v17 = [v16 ipv4NwSignature];
    id v18 = base64StringFromData_0(v17);
    v29[5] = v18;
    v28[6] = kSecAttrProtocol;
    v19 = [(THPreferredThreadNetwork *)self networkSignature];
    v20 = [v19 ipv6NwSignature];
    v21 = base64StringFromData_0(v20);
    v29[6] = v21;
    v28[7] = kSecAttrAuthenticationType;
    v22 = [(THPreferredThreadNetwork *)self userInfo];
    v29[7] = v22;
    v23 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:8];

    goto LABEL_12;
  }
LABEL_9:
  v14 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[THPreferredThreadNetwork(Keychain) DEBUGkeyChainQueryForpreferredNetworkUpdateOperation]();
  }
  v23 = 0;
LABEL_12:

  return v23;
}

- (id)keyChainItemRepresentationForpreferredNetworkAddOperation
{
  id v3 = [(THPreferredThreadNetwork *)self keyChainQueryForpreferredNetworkUpdateOperation];
  uint64_t v4 = [(THPreferredThreadNetwork *)self keyChainItemRepresentationForpreferredNetworkUpdateOperation];
  v5 = (void *)v4;
  if (v3 && v4)
  {
    v6 = [v3 mutableCopy];
    [v6 addEntriesFromDictionary:v5];
    v10[0] = kSecAttrIsInvisible;
    v10[1] = kSecAttrSynchronizable;
    v11[0] = &__kCFBooleanTrue;
    v11[1] = &__kCFBooleanTrue;
    v10[2] = kSecAttrAccessGroup;
    v10[3] = kSecAttrSyncViewHint;
    v11[2] = @"com.apple.preferred.network";
    v11[3] = kSecAttrViewHintHome;
    v10[4] = kSecAttrAccessible;
    v10[5] = kSecAttrDescription;
    v11[4] = kSecAttrAccessibleAlways;
    v11[5] = @"Preferred Thread network Record";
    v10[6] = kSecAttrPath;
    v11[6] = @"com.apple.preferred.network";
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:7];
    [v6 addEntriesFromDictionary:v7];

    id v8 = [v6 copy];
  }
  else
  {
    v6 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[THPreferredThreadNetwork(Keychain) keyChainItemRepresentationForpreferredNetworkAddOperation](v6);
    }
    id v8 = 0;
  }

  return v8;
}

- (id)keyChainQueryForpreferredNetworkUpdateOperation
{
  id v3 = [(THPreferredThreadNetwork *)self network];
  uint64_t v4 = [v3 networkName];
  if (!v4) {
    goto LABEL_12;
  }
  v5 = (void *)v4;
  v6 = [(THPreferredThreadNetwork *)self network];
  uint64_t v7 = [v6 extendedPANID];
  if (!v7)
  {
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  id v8 = (void *)v7;
  v9 = [(THPreferredThreadNetwork *)self networkSignature];
  uint64_t v10 = [v9 ipv4NwSignature];
  if (!v10)
  {
LABEL_10:

    goto LABEL_11;
  }
  v11 = (void *)v10;
  v12 = [(THPreferredThreadNetwork *)self networkSignature];
  uint64_t v13 = [v12 ipv6NwSignature];
  if (!v13)
  {
LABEL_9:

    goto LABEL_10;
  }
  v14 = (void *)v13;
  v15 = [(THPreferredThreadNetwork *)self networkSignature];
  uint64_t v16 = [v15 wifiSSID];
  if (!v16)
  {

    goto LABEL_9;
  }
  v48 = (void *)v16;
  __int16 v52 = v15;
  v46 = [(THPreferredThreadNetwork *)self networkSignature];
  v17 = [v46 wifiPassword];
  if (v17)
  {
    id v18 = [(THPreferredThreadNetwork *)self userInfo];
    BOOL v50 = v18 == 0;
  }
  else
  {
    BOOL v50 = 1;
  }

  if (!v50)
  {
    v22 = [(THPreferredThreadNetwork *)self networkSignature];
    v23 = [v22 wifiSSID];
    if ([v23 length])
    {
    }
    else
    {
      v24 = [(THPreferredThreadNetwork *)self networkSignature];
      v25 = [v24 wifiPassword];
      id v26 = [v25 length];

      if (!v26)
      {
        v56[0] = kSecClass;
        v56[1] = kSecAttrSynchronizable;
        v57[0] = kSecClassInternetPassword;
        v57[1] = kSecAttrSynchronizableAny;
        v57[2] = kSecAttrViewHintHome;
        v56[2] = kSecAttrSyncViewHint;
        v56[3] = kSecAttrAccount;
        v19 = [(THPreferredThreadNetwork *)self network];
        int v53 = [v19 networkName];
        v57[3] = v53;
        v56[4] = kSecAttrServer;
        v51 = [(THPreferredThreadNetwork *)self network];
        id v49 = [v51 extendedPANID];
        v35 = base64StringFromData_0(v49);
        v57[4] = v35;
        v56[5] = kSecAttrPort;
        v36 = [(THPreferredThreadNetwork *)self networkSignature];
        v37 = [v36 ipv4NwSignature];
        v38 = base64StringFromData_0(v37);
        v57[5] = v38;
        v56[6] = kSecAttrProtocol;
        v39 = [(THPreferredThreadNetwork *)self networkSignature];
        id v40 = [v39 ipv6NwSignature];
        v41 = base64StringFromData_0(v40);
        v57[6] = v41;
        v56[7] = kSecAttrAuthenticationType;
        v42 = [(THPreferredThreadNetwork *)self userInfo];
        v57[7] = v42;
        v20 = +[NSDictionary dictionaryWithObjects:v57 forKeys:v56 count:8];

        goto LABEL_25;
      }
    }
    v54[0] = kSecClass;
    v54[1] = kSecAttrSynchronizable;
    v55[0] = kSecClassInternetPassword;
    v55[1] = kSecAttrSynchronizableAny;
    v55[2] = kSecAttrViewHintHome;
    v54[2] = kSecAttrSyncViewHint;
    v54[3] = kSecAttrAccount;
    v19 = [(THPreferredThreadNetwork *)self network];
    int v53 = [v19 networkName];
    v55[3] = v53;
    v54[4] = kSecAttrServer;
    v51 = [(THPreferredThreadNetwork *)self network];
    id v49 = [v51 extendedPANID];
    v47 = base64StringFromData_0(v49);
    v55[4] = v47;
    v54[5] = kSecAttrPort;
    v45 = [(THPreferredThreadNetwork *)self networkSignature];
    v44 = [v45 ipv4NwSignature];
    v43 = base64StringFromData_0(v44);
    v55[5] = v43;
    v54[6] = kSecAttrProtocol;
    v27 = [(THPreferredThreadNetwork *)self networkSignature];
    v28 = [v27 ipv6NwSignature];
    v29 = base64StringFromData_0(v28);
    v55[6] = v29;
    v54[7] = kSecAttrSecurityDomain;
    v30 = [(THPreferredThreadNetwork *)self networkSignature];
    id v31 = [v30 wifiSSID];
    v55[7] = v31;
    v54[8] = kSecAttrLabel;
    v32 = [(THPreferredThreadNetwork *)self networkSignature];
    v33 = [v32 wifiPassword];
    v55[8] = v33;
    v54[9] = kSecAttrAuthenticationType;
    v34 = [(THPreferredThreadNetwork *)self userInfo];
    v55[9] = v34;
    v20 = +[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:10];

LABEL_25:
    goto LABEL_16;
  }
LABEL_13:
  v19 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[THPreferredThreadNetwork(Keychain) keyChainQueryForpreferredNetworkUpdateOperation]();
  }
  v20 = 0;
LABEL_16:

  return v20;
}

- (id)keyChainItemRepresentationForpreferredNetworkUpdateOperation
{
  v2 = [(THPreferredThreadNetwork *)self credentialsDataSetRecord];
  id v7 = 0;
  id v3 = +[NSKeyedArchiver archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v7];
  id v4 = v7;

  CFStringRef v8 = kSecValueData;
  v9 = v3;
  v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  return v5;
}

+ (id)keyChainQueryForDeletePreferredNetworkRecordOperationForNetworkName:(id)a3
{
  v11[0] = kSecAttrAccount;
  id v3 = a3;
  id v4 = [v3 network];
  v5 = [v4 networkName];
  v12[0] = v5;
  v11[1] = kSecAttrServer;
  v6 = [v3 network];

  id v7 = [v6 extendedPANID];
  CFStringRef v8 = base64StringFromData_0(v7);
  v12[1] = v8;
  v12[2] = kSecClassInternetPassword;
  v11[2] = kSecClass;
  v11[3] = kSecAttrSynchronizable;
  v12[3] = kSecAttrSynchronizableAny;
  v12[4] = @"com.apple.preferred.network";
  v11[4] = kSecAttrAccessGroup;
  v11[5] = kSecAttrSyncViewHint;
  v12[5] = kSecAttrViewHintHome;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:6];

  return v9;
}

+ (id)keyChainQueryForDeleteAllPreferredNetworks
{
  v4[0] = kSecClass;
  v4[1] = kSecAttrSynchronizable;
  v5[0] = kSecClassInternetPassword;
  v5[1] = kSecAttrSynchronizableAny;
  v4[2] = kSecAttrAccessGroup;
  v4[3] = kSecAttrSyncViewHint;
  v5[2] = @"com.apple.preferred.network";
  v5[3] = kSecAttrViewHintHome;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];

  return v2;
}

+ (id)keyChainQueryForFetchPreferredNetworkRecordsOperation
{
  v4[0] = kSecClass;
  v4[1] = kSecAttrSynchronizable;
  v5[0] = kSecClassInternetPassword;
  v5[1] = kSecAttrSynchronizableAny;
  v4[2] = kSecAttrAccessGroup;
  v4[3] = kSecAttrSyncViewHint;
  v5[2] = @"com.apple.preferred.network";
  v5[3] = kSecAttrViewHintHome;
  void v4[4] = kSecAttrAccessible;
  v4[5] = kSecReturnData;
  v4[6] = kSecReturnAttributes;
  v4[7] = kSecMatchLimit;
  void v5[4] = kSecAttrAccessibleAlways;
  v5[5] = &__kCFBooleanTrue;
  v5[6] = &__kCFBooleanTrue;
  v5[7] = kSecMatchLimitAll;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:8];

  return v2;
}

+ (id)keyChainQueryForFetchPreferredNetworkRecordsOperationForTheCount:(int)a3
{
  v6[0] = kSecClass;
  v6[1] = kSecAttrSynchronizable;
  v7[0] = kSecClassInternetPassword;
  v7[1] = kSecAttrSynchronizableAny;
  v6[2] = kSecAttrAccessGroup;
  v6[3] = kSecAttrSyncViewHint;
  v7[2] = @"com.apple.preferred.network";
  v7[3] = kSecAttrViewHintHome;
  v6[4] = kSecAttrAccessible;
  v6[5] = kSecReturnData;
  v7[4] = kSecAttrAccessibleAlways;
  v7[5] = &__kCFBooleanTrue;
  v7[6] = &__kCFBooleanTrue;
  v6[6] = kSecReturnAttributes;
  v6[7] = kSecMatchLimit;
  id v3 = +[NSNumber numberWithInt:*(void *)&a3];
  v7[7] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:8];

  return v4;
}

+ (id)keyChainQueryForPreferredNetworkRecordsOperationForNetwork:(id)a3
{
  v9[0] = kSecAttrAccount;
  id v3 = a3;
  id v4 = [v3 networkName];
  v10[0] = v4;
  v9[1] = kSecAttrServer;
  v5 = [v3 extendedPANID];

  v6 = base64StringFromData_0(v5);
  v10[1] = v6;
  v10[2] = kSecClassInternetPassword;
  v9[2] = kSecClass;
  v9[3] = kSecAttrSynchronizable;
  v10[3] = kSecAttrSynchronizableAny;
  v10[4] = @"com.apple.preferred.network";
  v9[4] = kSecAttrAccessGroup;
  v9[5] = kSecAttrSyncViewHint;
  v9[6] = kSecReturnData;
  v9[7] = kSecReturnAttributes;
  v9[8] = kSecMatchLimit;
  v10[5] = kSecAttrViewHintHome;
  v10[6] = &__kCFBooleanTrue;
  void v10[7] = &__kCFBooleanTrue;
  v10[8] = kSecMatchLimitAll;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:9];

  return v7;
}

+ (id)keyChainQueryForPreferredNetworkRecordsOperationForWifiNetworkWithSignature:(id)a3
{
  id v3 = a3;
  id v4 = [v3 ipv4NwSignature];
  id v5 = [v4 length];

  if (v5)
  {
    v22[0] = kSecAttrPort;
    v6 = [v3 ipv4NwSignature];
    id v7 = base64StringFromData_0(v6);
    v23[0] = v7;
    v22[1] = kSecAttrSecurityDomain;
    CFStringRef v8 = [v3 wifiSSID];
    v23[1] = v8;
    v22[2] = kSecAttrLabel;
    v9 = [v3 wifiPassword];
    v23[2] = v9;
    v23[3] = kSecClassInternetPassword;
    v22[3] = kSecClass;
    v22[4] = kSecAttrSynchronizable;
    v23[4] = kSecAttrSynchronizableAny;
    v23[5] = @"com.apple.preferred.network";
    v22[5] = kSecAttrAccessGroup;
    v22[6] = kSecAttrSyncViewHint;
    v22[7] = kSecReturnData;
    v22[8] = kSecReturnAttributes;
    v22[9] = kSecMatchLimit;
    v23[6] = kSecAttrViewHintHome;
    v23[7] = &__kCFBooleanTrue;
    v23[8] = &__kCFBooleanTrue;
    v23[9] = kSecMatchLimitAll;
    uint64_t v10 = v23;
    v11 = v22;
LABEL_5:
    v14 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v11 count:10];
    goto LABEL_6;
  }
  v12 = [v3 ipv6NwSignature];
  id v13 = [v12 length];

  if (v13)
  {
    v20[0] = kSecAttrProtocol;
    v6 = [v3 ipv6NwSignature];
    id v7 = base64StringFromData_0(v6);
    v21[0] = v7;
    v20[1] = kSecAttrSecurityDomain;
    CFStringRef v8 = [v3 wifiSSID];
    v21[1] = v8;
    v20[2] = kSecAttrLabel;
    v9 = [v3 wifiPassword];
    v21[2] = v9;
    v21[3] = kSecClassInternetPassword;
    v20[3] = kSecClass;
    v20[4] = kSecAttrSynchronizable;
    v21[4] = kSecAttrSynchronizableAny;
    v21[5] = @"com.apple.preferred.network";
    v20[5] = kSecAttrAccessGroup;
    v20[6] = kSecAttrSyncViewHint;
    v20[7] = kSecReturnData;
    v20[8] = kSecReturnAttributes;
    v20[9] = kSecMatchLimit;
    v21[6] = kSecAttrViewHintHome;
    v21[7] = &__kCFBooleanTrue;
    v21[8] = &__kCFBooleanTrue;
    v21[9] = kSecMatchLimitAll;
    uint64_t v10 = v21;
    v11 = v20;
    goto LABEL_5;
  }
  v18[0] = kSecAttrPort;
  v6 = [v3 ipv4NwSignature];
  id v7 = base64StringFromData_0(v6);
  v19[0] = v7;
  v18[1] = kSecAttrProtocol;
  CFStringRef v8 = [v3 ipv6NwSignature];
  v9 = base64StringFromData_0(v8);
  v19[1] = v9;
  v18[2] = kSecAttrSecurityDomain;
  uint64_t v16 = [v3 wifiSSID];
  v19[2] = v16;
  v18[3] = kSecAttrLabel;
  v17 = [v3 wifiPassword];
  v19[3] = v17;
  v19[4] = kSecClassInternetPassword;
  v18[4] = kSecClass;
  v18[5] = kSecAttrSynchronizable;
  v19[5] = kSecAttrSynchronizableAny;
  v19[6] = @"com.apple.preferred.network";
  v18[6] = kSecAttrAccessGroup;
  v18[7] = kSecAttrSyncViewHint;
  v18[8] = kSecReturnData;
  v18[9] = kSecReturnAttributes;
  v18[10] = kSecMatchLimit;
  v19[7] = kSecAttrViewHintHome;
  v19[8] = &__kCFBooleanTrue;
  v19[9] = &__kCFBooleanTrue;
  v19[10] = kSecMatchLimitAll;
  v14 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:11];

LABEL_6:

  return v14;
}

+ (id)keyChainQueryForPreferredNetworkRecordsOperationForWifiNetwork:(id)a3
{
  v6[0] = kSecAttrSecurityDomain;
  id v3 = [a3 wifiSSID];
  v7[0] = v3;
  v7[1] = kSecClassInternetPassword;
  v6[1] = kSecClass;
  v6[2] = kSecAttrSynchronizable;
  v7[2] = kSecAttrSynchronizableAny;
  v7[3] = @"com.apple.preferred.network";
  v6[3] = kSecAttrAccessGroup;
  v6[4] = kSecAttrSyncViewHint;
  v6[5] = kSecReturnData;
  v6[6] = kSecReturnAttributes;
  v6[7] = kSecMatchLimit;
  v7[4] = kSecAttrViewHintHome;
  v7[5] = &__kCFBooleanTrue;
  v7[6] = &__kCFBooleanTrue;
  v7[7] = kSecMatchLimitAll;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:8];

  return v4;
}

+ (id)keyChainQueryForPreferredNetworkRecordsOperationForLabelAsSSID:(id)a3
{
  v6[0] = kSecAttrLabel;
  id v3 = [a3 wifiSSID];
  v7[0] = v3;
  v7[1] = kSecClassInternetPassword;
  v6[1] = kSecClass;
  v6[2] = kSecAttrSynchronizable;
  v7[2] = kSecAttrSynchronizableAny;
  v7[3] = @"com.apple.preferred.network";
  v6[3] = kSecAttrAccessGroup;
  v6[4] = kSecAttrSyncViewHint;
  v6[5] = kSecReturnData;
  v6[6] = kSecReturnAttributes;
  v6[7] = kSecMatchLimit;
  v7[4] = kSecAttrViewHintHome;
  v7[5] = &__kCFBooleanTrue;
  v7[6] = &__kCFBooleanTrue;
  v7[7] = kSecMatchLimitAll;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:8];

  return v4;
}

+ (id)keyChainQueryForPreferredNetworkRecordsOperationForNetworkSignature:(id)a3
{
  id v3 = a3;
  id v4 = [v3 ipv4NwSignature];
  id v5 = [v4 length];

  if (v5)
  {
    v20[0] = kSecAttrPort;
    v6 = [v3 ipv4NwSignature];
    id v7 = base64StringFromData_0(v6);
    v21[0] = v7;
    v21[1] = kSecClassInternetPassword;
    v20[1] = kSecClass;
    v20[2] = kSecAttrSynchronizable;
    v21[2] = kSecAttrSynchronizableAny;
    v21[3] = @"com.apple.preferred.network";
    v20[3] = kSecAttrAccessGroup;
    v20[4] = kSecAttrSyncViewHint;
    v20[5] = kSecReturnData;
    v20[6] = kSecReturnAttributes;
    v20[7] = kSecMatchLimit;
    v21[4] = kSecAttrViewHintHome;
    v21[5] = &__kCFBooleanTrue;
    v21[6] = &__kCFBooleanTrue;
    v21[7] = kSecMatchLimitAll;
    CFStringRef v8 = v21;
    v9 = v20;
LABEL_5:
    v12 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v9 count:8];
    goto LABEL_6;
  }
  uint64_t v10 = [v3 ipv6NwSignature];
  id v11 = [v10 length];

  if (v11)
  {
    v18[0] = kSecAttrProtocol;
    v6 = [v3 ipv6NwSignature];
    id v7 = base64StringFromData_0(v6);
    v19[0] = v7;
    v19[1] = kSecClassInternetPassword;
    v18[1] = kSecClass;
    v18[2] = kSecAttrSynchronizable;
    v19[2] = kSecAttrSynchronizableAny;
    v19[3] = @"com.apple.preferred.network";
    v18[3] = kSecAttrAccessGroup;
    v18[4] = kSecAttrSyncViewHint;
    v18[5] = kSecReturnData;
    v18[6] = kSecReturnAttributes;
    v18[7] = kSecMatchLimit;
    v19[4] = kSecAttrViewHintHome;
    v19[5] = &__kCFBooleanTrue;
    v19[6] = &__kCFBooleanTrue;
    v19[7] = kSecMatchLimitAll;
    CFStringRef v8 = v19;
    v9 = v18;
    goto LABEL_5;
  }
  v16[0] = kSecAttrPort;
  v6 = [v3 ipv4NwSignature];
  id v7 = base64StringFromData_0(v6);
  v17[0] = v7;
  v16[1] = kSecAttrProtocol;
  v14 = [v3 ipv6NwSignature];
  v15 = base64StringFromData_0(v14);
  v17[1] = v15;
  v17[2] = kSecClassInternetPassword;
  v16[2] = kSecClass;
  v16[3] = kSecAttrSynchronizable;
  v17[3] = kSecAttrSynchronizableAny;
  v17[4] = @"com.apple.preferred.network";
  v16[4] = kSecAttrAccessGroup;
  v16[5] = kSecAttrSyncViewHint;
  v16[6] = kSecReturnData;
  v16[7] = kSecReturnAttributes;
  v16[8] = kSecMatchLimit;
  v17[5] = kSecAttrViewHintHome;
  v17[6] = &__kCFBooleanTrue;
  v17[7] = &__kCFBooleanTrue;
  v17[8] = kSecMatchLimitAll;
  v12 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:9];

LABEL_6:

  return v12;
}

+ (id)keyChainQueryForDeletePreferredNetworkRecord:(id)a3
{
  v19[0] = kSecAttrAccount;
  id v3 = a3;
  id v18 = [v3 network];
  v17 = [v18 networkName];
  v20[0] = v17;
  v19[1] = kSecAttrServer;
  uint64_t v16 = [v3 network];
  v15 = [v16 extendedPANID];
  id v4 = base64StringFromData_0(v15);
  v20[1] = v4;
  v19[2] = kSecAttrPort;
  id v5 = [v3 networkSignature];
  v6 = [v5 ipv4NwSignature];
  id v7 = base64StringFromData_0(v6);
  v20[2] = v7;
  v19[3] = kSecAttrProtocol;
  CFStringRef v8 = [v3 networkSignature];
  v9 = [v8 ipv6NwSignature];
  uint64_t v10 = base64StringFromData_0(v9);
  v20[3] = v10;
  v19[4] = kSecAttrSecurityDomain;
  id v11 = [v3 networkSignature];

  v12 = [v11 wifiSSID];
  v20[4] = v12;
  v20[5] = kSecClassInternetPassword;
  v19[5] = kSecClass;
  v19[6] = kSecAttrSynchronizable;
  v20[6] = kSecAttrSynchronizableAny;
  v20[7] = @"com.apple.preferred.network";
  v19[7] = kSecAttrAccessGroup;
  void v19[8] = kSecAttrSyncViewHint;
  void v20[8] = kSecAttrViewHintHome;
  id v13 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:9];

  return v13;
}

+ (id)keyChainQueryForDeletePreferredNetworkRecordForNetworkSignature:(id)a3
{
  id v3 = a3;
  id v4 = [v3 ipv4NwSignature];
  if (![v4 length]) {
    goto LABEL_6;
  }
  id v5 = [v3 ipv6NwSignature];
  if (![v5 length])
  {

LABEL_6:
    goto LABEL_7;
  }
  v6 = [v3 wifiSSID];
  id v7 = [v6 length];

  if (v7)
  {
    v27[0] = kSecAttrPort;
    CFStringRef v8 = [v3 ipv4NwSignature];
    v9 = base64StringFromData_0(v8);
    v28[0] = v9;
    v27[1] = kSecAttrProtocol;
    uint64_t v10 = [v3 ipv6NwSignature];
    id v11 = base64StringFromData_0(v10);
    v28[1] = v11;
    v27[2] = kSecAttrSecurityDomain;
    v12 = [v3 wifiSSID];
    v28[2] = v12;
    v28[3] = kSecClassInternetPassword;
    v27[3] = kSecClass;
    v27[4] = kSecAttrSynchronizable;
    v28[4] = kSecAttrSynchronizableAny;
    v28[5] = @"com.apple.preferred.network";
    v27[5] = kSecAttrAccessGroup;
    v27[6] = kSecAttrSyncViewHint;
    v28[6] = kSecAttrViewHintHome;
    id v13 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:7];

    goto LABEL_13;
  }
LABEL_7:
  v14 = [v3 wifiSSID];
  id v15 = [v14 length];

  if (v15)
  {
    v25[0] = kSecAttrSecurityDomain;
    CFStringRef v8 = [v3 wifiSSID];
    v26[0] = v8;
    v26[1] = kSecClassInternetPassword;
    v25[1] = kSecClass;
    v25[2] = kSecAttrSynchronizable;
    v26[2] = kSecAttrSynchronizableAny;
    v26[3] = @"com.apple.preferred.network";
    v25[3] = kSecAttrAccessGroup;
    v25[4] = kSecAttrSyncViewHint;
    v26[4] = kSecAttrViewHintHome;
    id v13 = +[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:5];
    goto LABEL_14;
  }
  uint64_t v16 = [v3 ipv6NwSignature];
  id v17 = [v16 length];

  if (v17)
  {
    v23[0] = kSecAttrProtocol;
    CFStringRef v8 = [v3 ipv6NwSignature];
    v9 = base64StringFromData_0(v8);
    v24[0] = v9;
    v24[1] = kSecClassInternetPassword;
    v23[1] = kSecClass;
    v23[2] = kSecAttrSynchronizable;
    v24[2] = kSecAttrSynchronizableAny;
    v24[3] = @"com.apple.preferred.network";
    v23[3] = kSecAttrAccessGroup;
    v23[4] = kSecAttrSyncViewHint;
    v24[4] = kSecAttrViewHintHome;
    id v18 = v24;
    v19 = v23;
  }
  else
  {
    v21[0] = kSecAttrPort;
    CFStringRef v8 = [v3 ipv4NwSignature];
    v9 = base64StringFromData_0(v8);
    v22[0] = v9;
    v22[1] = kSecClassInternetPassword;
    v21[1] = kSecClass;
    v21[2] = kSecAttrSynchronizable;
    v22[2] = kSecAttrSynchronizableAny;
    v22[3] = @"com.apple.preferred.network";
    v21[3] = kSecAttrAccessGroup;
    v21[4] = kSecAttrSyncViewHint;
    v22[4] = kSecAttrViewHintHome;
    id v18 = v22;
    v19 = v21;
  }
  id v13 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v19 count:5];
LABEL_13:

LABEL_14:

  return v13;
}

@end