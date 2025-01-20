@interface THThreadNetworkCredentialsActiveDataSetRecord
+ (id)activeDataSetRecordFromKeychainDictionary:(id)a3;
+ (id)computedUniqueIdentifierForBorderAgent:(id)a3 network:(id)a4 keychainAccessGroup:(id)a5;
+ (id)computedUniqueIdentifierForNetwork:(id)a3 keychainAccessGroup:(id)a4;
+ (id)keyChainQueryFetchForNumberOfActiveDataSetOperationForKeychainAccessGroup:(id)a3 count:(int)a4;
+ (id)keyChainQueryFetchForNumberOfActiveDataSetOperationForThreadNetworkWithKeychainAccessGroup:(id)a3 count:(int)a4 clientKeychainAccessGroup:(id)a5;
+ (id)keyChainQueryFetchForOneActiveDataSetOperationForThreadNetwork:(id)a3;
+ (id)keyChainQueryForDeleteActiveDataSetOperationForNetworkAndBorderAgent:(id)a3 borderAgent:(id)a4;
+ (id)keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgent:(id)a3;
+ (id)keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgentWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4;
+ (id)keyChainQueryForDeleteActiveDataSetRecordOperationForUniqueIdentifier:(id)a3;
+ (id)keyChainQueryForDeleteActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4;
+ (id)keyChainQueryForDeleteAllActiveDataSetOperationForThreadNetwork:(id)a3;
+ (id)keyChainQueryForDeleteAllActiveDataSetOperationForThreadNetworkWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4;
+ (id)keyChainQueryForDeleteAllActiveDataSetOperationWithKeychainAccessGroup:(id)a3;
+ (id)keyChainQueryForDeleteNumberOfActiveDataSetOperationWithKeychainAccessGroup:(id)a3 count:(int)a4;
+ (id)keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgent:(id)a3;
+ (id)keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgentWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4;
+ (id)keyChainQueryForFetchActiveDataSetRecordOperationForNetworkAndBorderAgent:(id)a3 borderAgent:(id)a4;
+ (id)keyChainQueryForFetchActiveDataSetRecordsOperationForClientKeychainAccessGroup:(id)a3;
+ (id)keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:(id)a3;
+ (id)keyChainQueryForFetchAllActiveDataSetRecordsOperation;
+ (id)keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifier:(id)a3;
+ (id)keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4;
+ (id)keyChainQueryForFetchOneActiveDataSetRecordOperationForXPANId:(id)a3;
- (id)computedUniqueIdentifier;
- (id)computedUniqueIdentifierWithBorderAgent;
- (id)keyChainItemRepresentationForActiveDataSetRecordAddOperation;
- (id)keyChainItemRepresentationForActiveDataSetRecordUpdateOperation;
- (id)keyChainQueryForActiveDataSetRecordUpdateOperation;
@end

@implementation THThreadNetworkCredentialsActiveDataSetRecord

+ (id)computedUniqueIdentifierForNetwork:(id)a3 keychainAccessGroup:(id)a4
{
  memset(&v18, 0, sizeof(v18));
  id v5 = a4;
  id v6 = a3;
  CC_SHA256_Init(&v18);
  CC_SHA256_Update(&v18, &THThreadNetworkBorderAgentUUIDNamespace, 0x10u);
  id v7 = v5;
  id v8 = objc_msgSend(v7, "UTF8String", *(_OWORD *)v18.count, *(_OWORD *)&v18.hash[2], *(_OWORD *)&v18.hash[6], *(_OWORD *)&v18.wbuf[2], *(_OWORD *)&v18.wbuf[6], *(_OWORD *)&v18.wbuf[10], *(void *)&v18.wbuf[14]);
  CC_LONG v9 = [v7 lengthOfBytesUsingEncoding:4];

  CC_SHA256_Update(&v18, v8, v9);
  id v10 = [v6 networkName];
  id v11 = [v10 UTF8String];
  v12 = [v6 networkName];
  CC_SHA256_Update(&v18, v11, (CC_LONG)[v12 lengthOfBytesUsingEncoding:4]);

  id v13 = [v6 extendedPANID];
  id v14 = [v13 bytes];
  v15 = [v6 extendedPANID];

  CC_SHA256_Update(&v18, v14, (CC_LONG)[v15 length]);
  CC_SHA256_Final(md, &v18);
  long long v20 = *(_OWORD *)md;
  BYTE6(v20) = md[6] & 0xF | 0x50;
  BYTE8(v20) = md[8] & 0x3F | 0x80;
  id v16 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v20];

  return v16;
}

- (id)computedUniqueIdentifier
{
  v3 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self network];
  uint64_t v4 = [v3 networkName];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self network];
    id v7 = [v6 extendedPANID];

    if (v7)
    {
      id v8 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self network];
      CC_LONG v9 = +[THThreadNetworkCredentialsActiveDataSetRecord computedUniqueIdentifierForNetwork:v8 keychainAccessGroup:@"com.apple.thread.dataset"];

      goto LABEL_8;
    }
  }
  else
  {
  }
  id v10 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    [(THThreadNetworkCredentialsActiveDataSetRecord(Keychain) *)self computedUniqueIdentifier];
  }

  CC_LONG v9 = 0;
LABEL_8:

  return v9;
}

+ (id)computedUniqueIdentifierForBorderAgent:(id)a3 network:(id)a4 keychainAccessGroup:(id)a5
{
  memset(&v24, 0, sizeof(v24));
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  CC_SHA256_Init(&v24);
  CC_SHA256_Update(&v24, &THThreadNetworkBorderAgentUUIDNamespace, 0x10u);
  id v10 = v7;
  id v11 = objc_msgSend(v10, "UTF8String", *(_OWORD *)v24.count, *(_OWORD *)&v24.hash[2], *(_OWORD *)&v24.hash[6], *(_OWORD *)&v24.wbuf[2], *(_OWORD *)&v24.wbuf[6], *(_OWORD *)&v24.wbuf[10], *(void *)&v24.wbuf[14]);
  CC_LONG v12 = [v10 lengthOfBytesUsingEncoding:4];

  CC_SHA256_Update(&v24, v11, v12);
  id v13 = [v8 networkName];
  id v14 = [v13 UTF8String];
  v15 = [v8 networkName];
  CC_SHA256_Update(&v24, v14, (CC_LONG)[v15 lengthOfBytesUsingEncoding:4]);

  id v16 = [v8 extendedPANID];
  id v17 = [v16 bytes];
  CC_SHA256_CTX v18 = [v8 extendedPANID];

  CC_SHA256_Update(&v24, v17, (CC_LONG)[v18 length]);
  id v19 = [v9 discriminatorId];
  id v20 = [v19 bytes];
  v21 = [v9 discriminatorId];

  CC_SHA256_Update(&v24, v20, (CC_LONG)[v21 length]);
  CC_SHA256_Final(md, &v24);
  long long v26 = *(_OWORD *)md;
  BYTE6(v26) = md[6] & 0xF | 0x50;
  BYTE8(v26) = md[8] & 0x3F | 0x80;
  id v22 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v26];

  return v22;
}

- (id)computedUniqueIdentifierWithBorderAgent
{
  v3 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self network];
  uint64_t v4 = [v3 networkName];
  if (!v4) {
    goto LABEL_8;
  }
  id v5 = (void *)v4;
  id v6 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self network];
  uint64_t v7 = [v6 extendedPANID];
  if (!v7)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  id v8 = (void *)v7;
  id v9 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self borderAgent];
  uint64_t v10 = [v9 discriminatorId];
  if (!v10)
  {

    goto LABEL_7;
  }
  id v11 = (void *)v10;
  CC_LONG v12 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self keychainAccessGroup];

  if (v12)
  {
    id v13 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self borderAgent];
    id v14 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self network];
    v15 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self keychainAccessGroup];
    id v16 = +[THThreadNetworkCredentialsActiveDataSetRecord computedUniqueIdentifierForBorderAgent:v13 network:v14 keychainAccessGroup:v15];

    goto LABEL_12;
  }
LABEL_9:
  id v17 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsActiveDataSetRecord(Keychain) computedUniqueIdentifierWithBorderAgent](self);
  }

  id v16 = 0;
LABEL_12:

  return v16;
}

+ (id)activeDataSetRecordFromKeychainDictionary:(id)a3
{
  id v3 = a3;
  id v5 = [v3 objectForKey:kSecAttrAccount];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v3 objectForKey:kSecAttrAccount];
  }
  else
  {
    uint64_t v6 = 0;
  }

  uint64_t v7 = [v3 objectForKey:kSecAttrServer];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v3 objectForKey:kSecAttrServer];
  }
  else
  {
    id v8 = 0;
  }

  uint64_t v9 = dataFromBase64String(v8);
  uint64_t v10 = [v3 objectForKey:kSecAttrProtocol];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = [v3 objectForKey:kSecAttrProtocol];
  }
  else
  {
    id v11 = 0;
  }

  v46 = dataFromBase64String(v11);
  CC_LONG v12 = [v3 objectForKey:kSecAttrSecurityDomain];
  objc_opt_class();
  v47 = (void *)v6;
  v48 = (void *)v9;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v13 = 0;
    goto LABEL_18;
  }
  id v13 = [v3 objectForKey:kSecAttrSecurityDomain];

  if (!v13)
  {
LABEL_18:
    v15 = 0;
    goto LABEL_19;
  }
  id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:v13];
  v15 = v14;
  if (v6 && v9 && v14)
  {
    id v16 = [v3 objectForKey:kSecValueData];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = [v3 objectForKey:kSecValueData];
    }
    else
    {
      id v17 = 0;
    }

    id v49 = 0;
    id v20 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v17 error:&v49];
    id v44 = v49;
    if (!v20)
    {
      v21 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        +[THThreadNetworkCredentialsActiveDataSetRecord(Keychain) activeDataSetRecordFromKeychainDictionary:].cold.8();
      }

      id v22 = objc_alloc((Class)THThreadNetworkCredentials);
      LOBYTE(v36) = 0;
      id v20 = [v22 initWithMasterKey:0 passPhrase:0 PSKc:0 channel:kTHNetworkChannel_None PANID:0 userInfo:0 credentialDataSet:0 isActiveDevice:v36];
    }
    [v20 credentialsDataSet];
    CC_SHA256_CTX v24 = v23 = v20;

    v45 = v23;
    if (v24)
    {
      v25 = [v23 credentialsDataSet];

      if (!v25)
      {
        long long v26 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          +[THThreadNetworkCredentialsActiveDataSetRecord(Keychain) activeDataSetRecordFromKeychainDictionary:].cold.6();
        }
        goto LABEL_44;
      }
      if (!v46)
      {
        long long v26 = THCredentialsServerLogHandleForCategory(1);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          +[THThreadNetworkCredentialsActiveDataSetRecord(Keychain) activeDataSetRecordFromKeychainDictionary:].cold.7(v26);
        }
LABEL_44:
        id v18 = 0;
        v30 = v44;
LABEL_69:

        goto LABEL_22;
      }
    }
    else
    {
      v27 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        +[THThreadNetworkCredentialsActiveDataSetRecord(Keychain) activeDataSetRecordFromKeychainDictionary:].cold.5();
      }

      id v28 = [objc_alloc((Class)THThreadNetworkCredentialsDataSet) initWithDataSetArray:0 userInfo:0];
      [v23 setCredentialsDataSet:v28];
    }
    long long v26 = [objc_alloc((Class)THThreadNetwork) initWithName:v47 extendedPANID:v48];
    if (!v26)
    {
      v43 = THCredentialsServerLogHandleForCategory(1);
      v30 = v44;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        +[THThreadNetworkCredentialsActiveDataSetRecord(Keychain) activeDataSetRecordFromKeychainDictionary:]();
      }
      id v18 = 0;
      goto LABEL_68;
    }
    v43 = [objc_alloc((Class)THThreadNetworkBorderAgent) initWithBaDiscrId:v46];
    if (!v43)
    {
      v42 = THCredentialsServerLogHandleForCategory(1);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        +[THThreadNetworkCredentialsActiveDataSetRecord(Keychain) activeDataSetRecordFromKeychainDictionary:]();
      }
      id v18 = 0;
      v30 = v44;
      goto LABEL_67;
    }
    v29 = objc_msgSend(v3, "objectForKey:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v42 = [v3 objectForKey:kSecAttrCreationDate];
    }
    else
    {
      v42 = 0;
    }

    v31 = objc_msgSend(v3, "objectForKey:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v39 = [v3 objectForKey:kSecAttrModificationDate];
    }
    else
    {
      v39 = 0;
    }
    v40 = v26;

    v32 = [v3 objectForKey:kSecAttrPath];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v33 = [v3 objectForKey:kSecAttrPath];

      v30 = v44;
      os_log_t log = (os_log_t)v33;
      if (v33)
      {
        id v34 = objc_alloc((Class)THThreadNetworkCredentialsActiveDataSetRecord);
        v37 = [v45 credentialsDataSet];
        id v18 = [v34 initWithBorderAgent:v43 credentialsDataSet:v37 network:v40 credentials:v45 uniqueIdentifier:v15 keychainAccessGroup:v33 creationDate:v42 lastModificationDate:v39];

        v35 = [v18 computedUniqueIdentifier];
        if (([v35 isEqual:v15] & 1) == 0)
        {
          v38 = THCredentialsServerLogHandleForCategory(1);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            +[THThreadNetworkCredentialsActiveDataSetRecord(Keychain) activeDataSetRecordFromKeychainDictionary:v38];
          }
        }
LABEL_66:
        long long v26 = v40;

LABEL_67:
LABEL_68:

        goto LABEL_69;
      }
    }
    else
    {

      v30 = v44;
    }
    THCredentialsServerLogHandleForCategory(1);
    os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      +[THThreadNetworkCredentialsActiveDataSetRecord(Keychain) activeDataSetRecordFromKeychainDictionary:](log);
    }
    id v18 = 0;
    goto LABEL_66;
  }
LABEL_19:
  id v17 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    v51 = "+[THThreadNetworkCredentialsActiveDataSetRecord(Keychain) activeDataSetRecordFromKeychainDictionary:]";
    __int16 v52 = 1024;
    int v53 = 158;
    __int16 v54 = 2112;
    uint64_t v55 = v6;
    __int16 v56 = 2112;
    v57 = v48;
    __int16 v58 = 2112;
    v59 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s:%d: This is not a Credentials DataSet record, (name=%@; xpanid=%@; uuid=%@)!",
      buf,
      0x30u);
  }
  id v18 = 0;
LABEL_22:

  return v18;
}

- (id)keyChainItemRepresentationForActiveDataSetRecordAddOperation
{
  id v3 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self keyChainQueryForActiveDataSetRecordUpdateOperation];
  uint64_t v4 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self keyChainItemRepresentationForActiveDataSetRecordUpdateOperation];
  id v5 = (void *)v4;
  if (v3 && v4)
  {
    uint64_t v6 = [v3 mutableCopy];
    [v6 addEntriesFromDictionary:v5];
    v11[0] = kSecAttrIsInvisible;
    v11[1] = kSecAttrSynchronizable;
    v12[0] = &__kCFBooleanTrue;
    v12[1] = &__kCFBooleanTrue;
    v11[2] = kSecAttrAccessGroup;
    v11[3] = kSecAttrSyncViewHint;
    v12[2] = @"com.apple.thread.dataset";
    v12[3] = kSecAttrViewHintHome;
    v11[4] = kSecAttrAccessible;
    v11[5] = kSecAttrDescription;
    v12[4] = kSecAttrAccessibleAlways;
    v12[5] = @"Thread network credentials Active Data Set Record";
    v11[6] = kSecAttrPath;
    uint64_t v7 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self keychainAccessGroup];
    v12[6] = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:7];
    [v6 addEntriesFromDictionary:v8];

    id v9 = [v6 copy];
  }
  else
  {
    uint64_t v6 = THCredentialsServerLogHandleForCategory(1);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[THThreadNetworkCredentialsActiveDataSetRecord(Keychain) keyChainItemRepresentationForActiveDataSetRecordAddOperation](v6);
    }
    id v9 = 0;
  }

  return v9;
}

- (id)keyChainQueryForActiveDataSetRecordUpdateOperation
{
  id v3 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self computedUniqueIdentifier];
  uint64_t v4 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self network];
  uint64_t v5 = [v4 networkName];
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v6 = (void *)v5;
  uint64_t v7 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self network];
  uint64_t v8 = [v7 extendedPANID];
  if (!v8)
  {

LABEL_7:
    goto LABEL_8;
  }
  id v9 = (void *)v8;
  uint64_t v10 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self borderAgent];
  id v11 = [v10 discriminatorId];

  if (v11 && v3)
  {
    v23[0] = kSecClass;
    v23[1] = kSecAttrSynchronizable;
    v24[0] = kSecClassInternetPassword;
    v24[1] = kSecAttrSynchronizableAny;
    v24[2] = kSecAttrViewHintHome;
    v23[2] = kSecAttrSyncViewHint;
    v23[3] = kSecAttrAccount;
    CC_LONG v12 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self network];
    id v22 = [v12 networkName];
    v24[3] = v22;
    v23[4] = kSecAttrServer;
    id v13 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self network];
    id v14 = [v13 extendedPANID];
    v15 = base64StringFromData_0(v14);
    v24[4] = v15;
    v23[5] = kSecAttrProtocol;
    id v16 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self borderAgent];
    id v17 = [v16 discriminatorId];
    id v18 = base64StringFromData_0(v17);
    v24[5] = v18;
    v23[6] = kSecAttrSecurityDomain;
    id v19 = [v3 UUIDString];
    v24[6] = v19;
    id v20 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:7];

    goto LABEL_11;
  }
LABEL_8:
  CC_LONG v12 = THCredentialsServerLogHandleForCategory(1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[THThreadNetworkCredentialsActiveDataSetRecord(Keychain) keyChainQueryForActiveDataSetRecordUpdateOperation](self);
  }
  id v20 = 0;
LABEL_11:

  return v20;
}

- (id)keyChainItemRepresentationForActiveDataSetRecordUpdateOperation
{
  v2 = [(THThreadNetworkCredentialsActiveDataSetRecord *)self credentials];
  id v7 = 0;
  id v3 = +[NSKeyedArchiver archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v7];
  id v4 = v7;

  CFStringRef v8 = kSecValueData;
  id v9 = v3;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

  return v5;
}

+ (id)keyChainQueryForFetchAllActiveDataSetRecordsOperation
{
  v4[0] = kSecClass;
  v4[1] = kSecAttrSynchronizable;
  v5[0] = kSecClassInternetPassword;
  v5[1] = kSecAttrSynchronizableAny;
  v4[2] = kSecAttrSyncViewHint;
  v4[3] = kSecReturnData;
  v5[2] = kSecAttrViewHintHome;
  v5[3] = &__kCFBooleanTrue;
  v4[4] = kSecReturnAttributes;
  v4[5] = kSecMatchLimit;
  v5[4] = &__kCFBooleanTrue;
  v5[5] = kSecMatchLimitAll;
  v4[6] = kSecAttrAccessGroup;
  v5[6] = @"com.apple.thread.dataset";
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:7];

  return v2;
}

+ (id)keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifier:(id)a3
{
  v6[0] = kSecAttrSecurityDomain;
  id v3 = [a3 UUIDString];
  v7[0] = v3;
  v7[1] = kSecClassInternetPassword;
  v6[1] = kSecClass;
  v6[2] = kSecAttrSynchronizable;
  v7[2] = kSecAttrSynchronizableAny;
  v7[3] = kSecAttrViewHintHome;
  v6[3] = kSecAttrSyncViewHint;
  v6[4] = kSecReturnData;
  v7[4] = &__kCFBooleanTrue;
  v7[5] = &__kCFBooleanTrue;
  v6[5] = kSecReturnAttributes;
  v6[6] = kSecMatchLimit;
  v7[6] = kSecMatchLimitAll;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:7];

  return v4;
}

+ (id)keyChainQueryForFetchOneActiveDataSetRecordOperationForXPANId:(id)a3
{
  v6[0] = kSecAttrServer;
  id v3 = base64StringFromData_0(a3);
  v7[0] = v3;
  v7[1] = kSecClassInternetPassword;
  v6[1] = kSecClass;
  v6[2] = kSecAttrSynchronizable;
  v7[2] = kSecAttrSynchronizableAny;
  v7[3] = kSecAttrViewHintHome;
  v6[3] = kSecAttrSyncViewHint;
  v6[4] = kSecReturnData;
  v7[4] = &__kCFBooleanTrue;
  v7[5] = &__kCFBooleanTrue;
  v6[5] = kSecReturnAttributes;
  v6[6] = kSecMatchLimit;
  void v6[7] = kSecAttrAccessGroup;
  v7[6] = kSecMatchLimitAll;
  void v7[7] = @"com.apple.thread.dataset";
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:8];

  return v4;
}

+ (id)keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgent:(id)a3
{
  v7[0] = kSecAttrProtocol;
  id v3 = [a3 discriminatorId];
  id v4 = base64StringFromData_0(v3);
  v8[0] = v4;
  v8[1] = kSecClassInternetPassword;
  v7[1] = kSecClass;
  v7[2] = kSecAttrSynchronizable;
  v8[2] = kSecAttrSynchronizableAny;
  v8[3] = kSecAttrViewHintHome;
  v7[3] = kSecAttrSyncViewHint;
  v7[4] = kSecReturnData;
  v8[4] = &__kCFBooleanTrue;
  v8[5] = &__kCFBooleanTrue;
  v7[5] = kSecReturnAttributes;
  v7[6] = kSecMatchLimit;
  void v7[7] = kSecAttrAccessGroup;
  v8[6] = kSecMatchLimitAll;
  v8[7] = @"com.apple.thread.dataset";
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:8];

  return v5;
}

+ (id)keyChainQueryForFetchActiveDataSetRecordsOperationForNetwork:(id)a3
{
  v9[0] = kSecAttrAccount;
  id v3 = a3;
  id v4 = [v3 networkName];
  v10[0] = v4;
  v9[1] = kSecAttrServer;
  uint64_t v5 = [v3 extendedPANID];

  uint64_t v6 = base64StringFromData_0(v5);
  v10[1] = v6;
  v10[2] = kSecClassInternetPassword;
  v9[2] = kSecClass;
  v9[3] = kSecAttrSynchronizable;
  v10[3] = kSecAttrSynchronizableAny;
  v10[4] = kSecAttrViewHintHome;
  v9[4] = kSecAttrSyncViewHint;
  v9[5] = kSecReturnData;
  v10[5] = &__kCFBooleanTrue;
  v10[6] = &__kCFBooleanTrue;
  v9[6] = kSecReturnAttributes;
  v9[7] = kSecMatchLimit;
  v9[8] = kSecAttrAccessGroup;
  v10[7] = kSecMatchLimitAll;
  v10[8] = @"com.apple.thread.dataset";
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:9];

  return v7;
}

+ (id)keyChainQueryForFetchActiveDataSetRecordOperationForNetworkAndBorderAgent:(id)a3 borderAgent:(id)a4
{
  v13[0] = kSecAttrProtocol;
  id v5 = a3;
  uint64_t v6 = [a4 discriminatorId];
  id v7 = base64StringFromData_0(v6);
  v14[0] = v7;
  v13[1] = kSecAttrAccount;
  CFStringRef v8 = [v5 networkName];
  v14[1] = v8;
  v13[2] = kSecAttrServer;
  id v9 = [v5 extendedPANID];

  uint64_t v10 = base64StringFromData_0(v9);
  v14[2] = v10;
  v14[3] = kSecClassInternetPassword;
  v13[3] = kSecClass;
  v13[4] = kSecAttrSynchronizable;
  v14[4] = kSecAttrSynchronizableAny;
  v14[5] = kSecAttrViewHintHome;
  v13[5] = kSecAttrSyncViewHint;
  v13[6] = kSecReturnData;
  v14[6] = &__kCFBooleanTrue;
  v14[7] = &__kCFBooleanTrue;
  v13[7] = kSecReturnAttributes;
  v13[8] = kSecMatchLimit;
  v13[9] = kSecAttrAccessGroup;
  v14[8] = kSecMatchLimitAll;
  v14[9] = @"com.apple.thread.dataset";
  id v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:10];

  return v11;
}

+ (id)keyChainQueryForFetchActiveDataSetRecordsOperationForClientKeychainAccessGroup:(id)a3
{
  v6[0] = kSecAttrPath;
  v6[1] = kSecClass;
  v7[0] = a3;
  v7[1] = kSecClassInternetPassword;
  v6[2] = kSecAttrSynchronizable;
  v6[3] = kSecAttrSyncViewHint;
  v7[2] = kSecAttrSynchronizableAny;
  v7[3] = kSecAttrViewHintHome;
  v6[4] = kSecReturnData;
  v6[5] = kSecReturnAttributes;
  v7[4] = &__kCFBooleanTrue;
  v7[5] = &__kCFBooleanTrue;
  v6[6] = kSecMatchLimit;
  void v6[7] = kSecAttrAccessGroup;
  v7[6] = kSecMatchLimitAll;
  void v7[7] = @"com.apple.thread.dataset";
  id v3 = a3;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:8];

  return v4;
}

+ (id)keyChainQueryForDeleteActiveDataSetRecordOperationForUniqueIdentifier:(id)a3
{
  v6[0] = kSecAttrSecurityDomain;
  id v3 = [a3 UUIDString];
  v7[0] = v3;
  v7[1] = kSecClassInternetPassword;
  v6[1] = kSecClass;
  v6[2] = kSecAttrSynchronizable;
  v6[3] = kSecAttrSyncViewHint;
  v7[2] = kSecAttrSynchronizableAny;
  v7[3] = kSecAttrViewHintHome;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:4];

  return v4;
}

+ (id)keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgent:(id)a3
{
  v7[0] = kSecAttrProtocol;
  id v3 = [a3 discriminatorId];
  id v4 = base64StringFromData_0(v3);
  v8[0] = v4;
  v8[1] = kSecClassInternetPassword;
  v7[1] = kSecClass;
  v7[2] = kSecAttrSynchronizable;
  v7[3] = kSecAttrSyncViewHint;
  v8[2] = kSecAttrSynchronizableAny;
  v8[3] = kSecAttrViewHintHome;
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

+ (id)keyChainQueryForDeleteActiveDataSetOperationForNetworkAndBorderAgent:(id)a3 borderAgent:(id)a4
{
  v13[0] = kSecAttrProtocol;
  id v5 = a3;
  uint64_t v6 = [a4 discriminatorId];
  id v7 = base64StringFromData_0(v6);
  v14[0] = v7;
  v13[1] = kSecAttrAccount;
  CFStringRef v8 = [v5 networkName];
  v14[1] = v8;
  v13[2] = kSecAttrServer;
  id v9 = [v5 extendedPANID];

  uint64_t v10 = base64StringFromData_0(v9);
  v14[2] = v10;
  v14[3] = kSecClassInternetPassword;
  v13[3] = kSecClass;
  v13[4] = kSecAttrSynchronizable;
  v13[5] = kSecAttrSyncViewHint;
  v14[4] = kSecAttrSynchronizableAny;
  v14[5] = kSecAttrViewHintHome;
  id v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];

  return v11;
}

+ (id)keyChainQueryForFetchOneActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4
{
  v10[0] = a4;
  v9[0] = kSecAttrPath;
  v9[1] = kSecAttrSecurityDomain;
  id v5 = a4;
  uint64_t v6 = [a3 UUIDString];
  v10[1] = v6;
  v10[2] = kSecClassInternetPassword;
  v9[2] = kSecClass;
  v9[3] = kSecAttrSynchronizable;
  v10[3] = kSecAttrSynchronizableAny;
  v10[4] = kSecAttrViewHintHome;
  v9[4] = kSecAttrSyncViewHint;
  v9[5] = kSecReturnData;
  v10[5] = &__kCFBooleanTrue;
  v10[6] = &__kCFBooleanTrue;
  v9[6] = kSecReturnAttributes;
  v9[7] = kSecMatchLimit;
  v10[7] = kSecMatchLimitAll;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:8];

  return v7;
}

+ (id)keyChainQueryForFetchActiveDataSetRecordOperationForBorderAgentWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4
{
  v11[0] = a4;
  v10[0] = kSecAttrPath;
  v10[1] = kSecAttrProtocol;
  id v5 = a4;
  uint64_t v6 = [a3 discriminatorId];
  id v7 = base64StringFromData_0(v6);
  v11[1] = v7;
  v11[2] = kSecClassInternetPassword;
  v10[2] = kSecClass;
  v10[3] = kSecAttrSynchronizable;
  v11[3] = kSecAttrSynchronizableAny;
  v11[4] = kSecAttrViewHintHome;
  v10[4] = kSecAttrSyncViewHint;
  v10[5] = kSecReturnData;
  v11[5] = &__kCFBooleanTrue;
  v11[6] = &__kCFBooleanTrue;
  v10[6] = kSecReturnAttributes;
  v10[7] = kSecMatchLimit;
  void v11[7] = kSecMatchLimitAll;
  CFStringRef v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:8];

  return v8;
}

+ (id)keyChainQueryForDeleteActiveDataSetRecordOperationForUniqueIdentifierWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4
{
  v10[0] = a4;
  v9[0] = kSecAttrPath;
  v9[1] = kSecAttrSecurityDomain;
  id v5 = a4;
  uint64_t v6 = [a3 UUIDString];
  v10[1] = v6;
  v10[2] = kSecClassInternetPassword;
  v9[2] = kSecClass;
  v9[3] = kSecAttrSynchronizable;
  v9[4] = kSecAttrSyncViewHint;
  v10[3] = kSecAttrSynchronizableAny;
  v10[4] = kSecAttrViewHintHome;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

+ (id)keyChainQueryForDeleteActiveDataSetOperationForThreadNetworkBorderAgentWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4
{
  v11[0] = a4;
  v10[0] = kSecAttrPath;
  v10[1] = kSecAttrProtocol;
  id v5 = a4;
  uint64_t v6 = [a3 discriminatorId];
  id v7 = base64StringFromData_0(v6);
  v11[1] = v7;
  v11[2] = kSecClassInternetPassword;
  v10[2] = kSecClass;
  v10[3] = kSecAttrSynchronizable;
  v10[4] = kSecAttrSyncViewHint;
  v11[3] = kSecAttrSynchronizableAny;
  v11[4] = kSecAttrViewHintHome;
  CFStringRef v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];

  return v8;
}

+ (id)keyChainQueryFetchForOneActiveDataSetOperationForThreadNetwork:(id)a3
{
  v9[0] = kSecAttrAccount;
  id v3 = a3;
  id v4 = [v3 networkName];
  v10[0] = v4;
  v9[1] = kSecAttrServer;
  id v5 = [v3 extendedPANID];

  uint64_t v6 = base64StringFromData_0(v5);
  v10[1] = v6;
  v10[2] = kSecClassInternetPassword;
  v9[2] = kSecClass;
  v9[3] = kSecAttrSynchronizable;
  v10[3] = kSecAttrSynchronizableAny;
  v10[4] = kSecAttrViewHintHome;
  v9[4] = kSecAttrSyncViewHint;
  void v9[5] = kSecReturnData;
  void v10[5] = &__kCFBooleanTrue;
  v10[6] = &__kCFBooleanTrue;
  v9[6] = kSecReturnAttributes;
  v9[7] = kSecMatchLimit;
  void v9[8] = kSecAttrAccessGroup;
  v10[7] = kSecMatchLimitOne;
  void v10[8] = @"com.apple.thread.dataset";
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:9];

  return v7;
}

+ (id)keyChainQueryFetchForNumberOfActiveDataSetOperationForThreadNetworkWithKeychainAccessGroup:(id)a3 count:(int)a4 clientKeychainAccessGroup:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v15[0] = kSecAttrAccount;
  id v7 = a5;
  id v8 = a3;
  id v9 = [v8 networkName];
  v16[0] = v9;
  v15[1] = kSecAttrServer;
  uint64_t v10 = [v8 extendedPANID];

  id v11 = base64StringFromData_0(v10);
  v16[1] = v11;
  v16[2] = v7;
  v15[2] = kSecAttrPath;
  v15[3] = kSecClass;
  v16[3] = kSecClassInternetPassword;
  v16[4] = kSecAttrSynchronizableAny;
  v15[4] = kSecAttrSynchronizable;
  v15[5] = kSecAttrSyncViewHint;
  v16[5] = kSecAttrViewHintHome;
  v16[6] = &__kCFBooleanTrue;
  v15[6] = kSecReturnData;
  v15[7] = kSecReturnAttributes;
  v16[7] = &__kCFBooleanTrue;
  v15[8] = kSecMatchLimit;
  CC_LONG v12 = +[NSNumber numberWithInt:v5];
  v15[9] = kSecAttrAccessGroup;
  v16[8] = v12;
  v16[9] = @"com.apple.thread.dataset";
  id v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:10];

  return v13;
}

+ (id)keyChainQueryFetchForNumberOfActiveDataSetOperationForKeychainAccessGroup:(id)a3 count:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v9[0] = kSecAttrPath;
  v9[1] = kSecClass;
  v10[0] = a3;
  v10[1] = kSecClassInternetPassword;
  v9[2] = kSecAttrSynchronizable;
  v9[3] = kSecAttrSyncViewHint;
  v10[2] = kSecAttrSynchronizableAny;
  v10[3] = kSecAttrViewHintHome;
  v9[4] = kSecReturnData;
  void v9[5] = kSecReturnAttributes;
  v10[4] = &__kCFBooleanTrue;
  void v10[5] = &__kCFBooleanTrue;
  v9[6] = kSecMatchLimit;
  id v5 = a3;
  uint64_t v6 = +[NSNumber numberWithInt:v4];
  v9[7] = kSecAttrAccessGroup;
  v10[6] = v6;
  v10[7] = @"com.apple.thread.dataset";
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:8];

  return v7;
}

+ (id)keyChainQueryForDeleteAllActiveDataSetOperationForThreadNetworkWithKeychainAccessGroup:(id)a3 clientKeychainAccessGroup:(id)a4
{
  v12[0] = kSecAttrAccount;
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 networkName];
  v13[0] = v7;
  v12[1] = kSecAttrServer;
  id v8 = [v6 extendedPANID];

  id v9 = base64StringFromData_0(v8);
  v13[1] = v9;
  v13[2] = v5;
  v12[2] = kSecAttrPath;
  v12[3] = kSecClass;
  v13[3] = kSecClassInternetPassword;
  v13[4] = kSecAttrSynchronizableAny;
  v12[4] = kSecAttrSynchronizable;
  v12[5] = kSecAttrSyncViewHint;
  v12[6] = kSecAttrAccessGroup;
  v13[5] = kSecAttrViewHintHome;
  void v13[6] = @"com.apple.thread.dataset";
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:7];

  return v10;
}

+ (id)keyChainQueryForDeleteAllActiveDataSetOperationForThreadNetwork:(id)a3
{
  v9[0] = kSecAttrAccount;
  id v3 = a3;
  uint64_t v4 = [v3 networkName];
  v10[0] = v4;
  v9[1] = kSecAttrServer;
  id v5 = [v3 extendedPANID];

  id v6 = base64StringFromData_0(v5);
  v10[1] = v6;
  v10[2] = kSecClassInternetPassword;
  v9[2] = kSecClass;
  v9[3] = kSecAttrSynchronizable;
  v10[3] = kSecAttrSynchronizableAny;
  v10[4] = kSecAttrViewHintHome;
  v9[4] = kSecAttrSyncViewHint;
  void v9[5] = kSecAttrAccessGroup;
  void v10[5] = @"com.apple.thread.dataset";
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];

  return v7;
}

+ (id)keyChainQueryForDeleteAllActiveDataSetOperationWithKeychainAccessGroup:(id)a3
{
  v6[0] = kSecAttrPath;
  v6[1] = kSecClass;
  v7[0] = a3;
  v7[1] = kSecClassInternetPassword;
  v6[2] = kSecAttrSynchronizable;
  v6[3] = kSecAttrSyncViewHint;
  v7[2] = kSecAttrSynchronizableAny;
  v7[3] = kSecAttrViewHintHome;
  void v6[4] = kSecAttrAccessGroup;
  void v7[4] = @"com.apple.thread.dataset";
  id v3 = a3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:5];

  return v4;
}

+ (id)keyChainQueryForDeleteNumberOfActiveDataSetOperationWithKeychainAccessGroup:(id)a3 count:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  v9[0] = kSecAttrPath;
  v9[1] = kSecClass;
  v10[0] = a3;
  v10[1] = kSecClassInternetPassword;
  v9[2] = kSecAttrSynchronizable;
  v9[3] = kSecAttrSyncViewHint;
  v10[2] = kSecAttrSynchronizableAny;
  v10[3] = kSecAttrViewHintHome;
  v9[4] = kSecMatchLimit;
  id v5 = a3;
  id v6 = +[NSNumber numberWithInt:v4];
  void v9[5] = kSecAttrAccessGroup;
  v10[4] = v6;
  void v10[5] = @"com.apple.thread.dataset";
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:6];

  return v7;
}

@end