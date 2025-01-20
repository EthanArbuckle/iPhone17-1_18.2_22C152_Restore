@interface EscrowService
+ (BOOL)isFatalError:(id)a3;
+ (id)certificateRequest:(id)a3 duplicate:(BOOL)a4 error:(id *)a5;
+ (id)createEscrowBlobWithCertificate:(id)a3 escrowRequest:(id)a4 error:(id *)a5;
+ (id)doubleEnrollmentRecordFromPrimaryRecord:(id)a3;
- (BOOL)_invalidateEscrowCache:(id)a3 error:(id *)a4;
- (BOOL)cacheStoredCertificate:(id)a3 error:(id *)a4;
- (BOOL)processPrerecord:(id)a3 outerRequest:(id)a4 escrowRequest:(id)a5 error:(id *)a6;
- (EscrowService)initWithOperationsLogger:(id)a3;
- (SBEscrowOperationLogger)operationsLogger;
- (id)_getBypassToken;
- (id)fetchCachedCertificateWithRequest:(id)a3 error:(id *)a4;
- (id)keychainBaseQueryWithEnvironment:(id)a3 andBaseURL:(id)a4;
- (void)_deleteRecordWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5;
- (void)_fetchCertificatesWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5;
- (void)_performDoubleRecoveryICDPWithRequest:(id)a3 primaryResponse:(id)a4;
- (void)_performDoubleRecoveryStingrayWithRequest:(id)a3 primaryResponse:(id)a4;
- (void)_performPostEnrollSilentRecoveryWithRequest:(id)a3;
- (void)_recoverActualRecordWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5;
- (void)_recoverWithVersion:(int)a3 req:(id)a4 duplicate:(BOOL)a5 sesWrapper:(id)a6 srpInitResponse:(id)a7 reply:(id)a8;
- (void)_removeBypassToken;
- (void)_saveBypassToken:(id)a3;
- (void)_srpInitHelper:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5;
- (void)_storeRecordWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5;
- (void)changeSMSTargetWithRequest:(id)a3 completionBlock:(id)a4;
- (void)deleteRecordWithRequest:(id)a3 completionBlock:(id)a4;
- (void)fetchCertificatesAndDuplicateRequest:(id)a3 completionBlock:(id)a4;
- (void)fetchCertificatesWithRequest:(id)a3 completionBlock:(id)a4;
- (void)getAccountInfoWithRequest:(id)a3 completionBlock:(id)a4;
- (void)getCountrySMSCodesWithRequest:(id)a3 completionBlock:(id)a4;
- (void)listSMSTargetsWithRequest:(id)a3 completionBlock:(id)a4;
- (void)logRecoveryResults:(id)a3 completionBlock:(id)a4;
- (void)recoverRecordWithRequest:(id)a3 completionBlock:(id)a4;
- (void)setPasswordMetadataWithRequest:(id)a3 response:(id)a4 ses:(id)a5;
- (void)startSMSChallengeWithRequest:(id)a3 completionBlock:(id)a4;
- (void)storeRecordWithCertDataRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5;
- (void)storeRecordWithRequest:(id)a3 completionBlock:(id)a4;
- (void)ttrForPCSDataMatchFailure:(id)a3;
- (void)updateRecordMetadataWithRequest:(id)a3 completionBlock:(id)a4;
- (void)verifyCertificateWithRequest:(id)a3 completionBlock:(id)a4;
@end

@implementation EscrowService

- (void)_saveBypassToken:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  [v4 setObject:@"EscrowServiceBypassToken" forKeyedSubscript:kSecAttrAccount];
  [v4 setObject:@"EscrowService" forKeyedSubscript:kSecAttrService];
  [v4 setObject:kSecClassGenericPassword forKeyedSubscript:kSecClass];
  [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecAttrSynchronizable];
  v5 = [v3 dataUsingEncoding:1];

  [v4 setObject:v5 forKeyedSubscript:kSecValueData];
  if (SecItemAdd((CFDictionaryRef)v4, 0))
  {
    v6 = CloudServicesLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10004D5EC();
    }
  }
}

- (void)_removeBypassToken
{
  v4[0] = kSecAttrAccount;
  v4[1] = kSecAttrService;
  v5[0] = @"EscrowServiceBypassToken";
  v5[1] = @"EscrowService";
  v4[2] = kSecClass;
  v4[3] = kSecAttrSynchronizable;
  v5[2] = kSecClassGenericPassword;
  v5[3] = &__kCFBooleanTrue;
  CFDictionaryRef v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:4];
  if (SecItemDelete(v2))
  {
    id v3 = CloudServicesLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10004D658();
    }
  }
}

- (id)_getBypassToken
{
  CFTypeRef v9 = 0;
  v10[0] = kSecAttrAccount;
  v10[1] = kSecAttrService;
  v11[0] = @"EscrowServiceBypassToken";
  v11[1] = @"EscrowService";
  v10[2] = kSecClass;
  v10[3] = kSecAttrSynchronizable;
  v11[2] = kSecClassGenericPassword;
  v11[3] = &__kCFBooleanTrue;
  v10[4] = kSecReturnData;
  v11[4] = &__kCFBooleanTrue;
  CFDictionaryRef v2 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:5];
  OSStatus v3 = SecItemCopyMatching(v2, &v9);
  if (v3 == -25300)
  {
    id v6 = 0;
  }
  else
  {
    if (v3)
    {
      v7 = CloudServicesLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10004D6C4();
      }

      id v5 = 0;
      id v4 = 0;
    }
    else
    {
      id v4 = (void *)v9;
      id v5 = [objc_alloc((Class)NSString) initWithData:v9 encoding:1];
    }
    id v6 = v5;
  }

  return v6;
}

- (EscrowService)initWithOperationsLogger:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EscrowService;
  id v6 = [(EscrowService *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_operationsLogger, a3);
    v8 = v7;
  }

  return v7;
}

- (void)getAccountInfoWithRequest:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = CloudServicesLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "in getAccountInfoWithRequest:", buf, 2u);
  }

  v8 = [(EscrowGenericRequest *)[EscrowAccountInfoRequest alloc] initWithRequest:v6];
  CFTypeRef v9 = CloudServicesLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "calling iCloud accountInfoRequest", buf, 2u);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000388C8;
  v11[3] = &unk_1000710E0;
  id v12 = v5;
  id v10 = v5;
  [(EscrowAccountInfoRequest *)v8 performRequestWithHandler:v11];
}

+ (id)certificateRequest:(id)a3 duplicate:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = [(EscrowGenericRequest *)[EscrowCertificateRequest alloc] initWithRequest:v7];
  [(EscrowGenericRequest *)v8 setDuplicate:v6];
  CFTypeRef v9 = [(EscrowGenericRequest *)v8 altDSID];
  uint64_t v10 = [(EscrowGenericRequest *)v8 iCloudEnv];
  v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    v13 = CloudServicesLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10004D88C();
    }

    if (!a5) {
      goto LABEL_43;
    }
    uint64_t v14 = kEscrowServiceErrorDomain;
    CFStringRef v15 = @"Can't get account info";
    uint64_t v16 = 116;
    goto LABEL_37;
  }
  if (v6
    || ([v7 specifiedFederation],
        v17 = objc_claimAutoreleasedReturnValue(),
        v17,
        !v17))
  {
    id v48 = v7;
    unsigned int v24 = [(EscrowGenericRequest *)v8 stingray];
    if (v24) {
      uint64_t v25 = 2;
    }
    else {
      uint64_t v25 = 6;
    }
    if (v24) {
      uint64_t v26 = 3;
    }
    else {
      uint64_t v26 = 7;
    }
    v27 = +[CSCertOperations rootBaseVersionsForRootType:v25 altDSID:v9 inEnvironment:v11 duplicate:v6];
    [(EscrowGenericRequest *)v8 setBaseRootCertVersions:v27];

    v28 = [(EscrowGenericRequest *)v8 baseRootCertVersions];
    id v29 = [v28 count];

    if (!v29)
    {
      v40 = CloudServicesLog();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_10004D730();
      }

      id v7 = v48;
      if (!a5) {
        goto LABEL_43;
      }
      +[CloudServicesError errorWithDomain:kEscrowServiceErrorDomain, 118, @"Can't get base cert versions for root type %u in %@ environment", v25, v11 code format];
LABEL_38:
      v39 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_44;
    }
    v30 = +[CSCertOperations rootTrustedVersionsForRootType:v26 altDSID:v9 inEnvironment:v11 duplicate:v6];
    [(EscrowGenericRequest *)v8 setTrustedRootCertVersions:v30];

    v31 = [(EscrowGenericRequest *)v8 trustedRootCertVersions];
    id v32 = [v31 count];

    id v7 = v48;
    if (v32) {
      goto LABEL_22;
    }
    v41 = CloudServicesLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_10004D798();
    }

    if (!a5)
    {
LABEL_43:
      v39 = 0;
      goto LABEL_44;
    }
    uint64_t v14 = kEscrowServiceErrorDomain;
    uint64_t v46 = v26;
    v47 = v11;
    CFStringRef v15 = @"Can't get cert versions for root type %u in %@ environment";
    uint64_t v16 = 119;
LABEL_37:
    +[CloudServicesError errorWithDomain:code:format:](CloudServicesError, "errorWithDomain:code:format:", v14, v16, v15, v46, v47);
    goto LABEL_38;
  }
  v18 = [v7 specifiedFederation];
  unsigned __int8 v19 = +[CSCertOperations moveToFederationAllowed:v18 altDSID:v9];

  if ((v19 & 1) == 0)
  {
    v42 = CloudServicesLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
      sub_10004D800(v7, v42);
    }

    if (a5)
    {
      uint64_t v43 = kEscrowServiceErrorDomain;
      v44 = [v7 specifiedFederation];
      *a5 = +[CloudServicesError errorWithDomain:v43, 117, @"Terms not accepted for federation %@", v44 code format];
    }
    goto LABEL_43;
  }
  v20 = [v7 specifiedFederation];
  v52 = v20;
  v21 = +[NSArray arrayWithObjects:&v52 count:1];
  [(EscrowGenericRequest *)v8 setBaseRootCertVersions:v21];

  v22 = [v7 specifiedFederation];
  v51 = v22;
  v23 = +[NSArray arrayWithObjects:&v51 count:1];
  [(EscrowGenericRequest *)v8 setTrustedRootCertVersions:v23];

LABEL_22:
  v33 = CloudServicesLog();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = [(EscrowGenericRequest *)v8 recordLabel];
    *(_DWORD *)buf = 138412290;
    v50 = v34;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Requesting cert for label: %@", buf, 0xCu);
  }
  v35 = CloudServicesLog();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = [(EscrowGenericRequest *)v8 baseRootCertVersions];
    *(_DWORD *)buf = 138412290;
    v50 = v36;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Platform trust versions: %@", buf, 0xCu);
  }
  v37 = CloudServicesLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = [(EscrowGenericRequest *)v8 trustedRootCertVersions];
    *(_DWORD *)buf = 138412290;
    v50 = v38;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Requesting cert for versions: %@", buf, 0xCu);
  }
  v39 = v8;
LABEL_44:

  return v39;
}

- (void)_fetchCertificatesWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v14 = 0;
  v8 = +[EscrowService certificateRequest:a3 duplicate:v5 error:&v14];
  id v9 = v14;
  if (v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000390C4;
    v11[3] = &unk_100071C78;
    id v13 = v7;
    id v12 = v8;
    [v12 performRequestWithHandler:v11];
  }
  else
  {
    uint64_t v10 = CloudServicesLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Bailing on fetch certificates due to no cert request: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, id))v7 + 2))(v7, 0, v9);
  }
}

- (void)fetchCertificatesWithRequest:(id)a3 completionBlock:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000393B8;
  v7[3] = &unk_100071CA0;
  id v8 = a4;
  id v6 = v8;
  [(EscrowService *)self fetchCertificatesAndDuplicateRequest:a3 completionBlock:v7];
}

- (void)fetchCertificatesAndDuplicateRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_10003978C;
  v38[4] = sub_10003979C;
  id v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_10003978C;
  v36[4] = sub_10003979C;
  id v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_10003978C;
  v34[4] = sub_10003979C;
  id v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_10003978C;
  v32[4] = sub_10003979C;
  id v33 = 0;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_1000397A4;
  activity_block[3] = &unk_100071CF0;
  id v8 = dispatch_group_create();
  v27 = v8;
  v28 = self;
  id v9 = v6;
  id v29 = v9;
  v30 = v38;
  v31 = v36;
  _os_activity_initiate((void *)&_mh_execute_header, "fetchCertificates", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if ([v9 requiresDoubleEnrollment])
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000398F0;
    v20[3] = &unk_100071CF0;
    v21 = v8;
    v22 = self;
    id v23 = v9;
    unsigned int v24 = v34;
    uint64_t v25 = v32;
    _os_activity_initiate((void *)&_mh_execute_header, "fetchCertificates (duplicate)", OS_ACTIVITY_FLAG_DEFAULT, v20);
  }
  uint64_t v10 = [v9 queue];

  if (!v10)
  {
    _os_assert_log();
    uint64_t v13 = _os_crash();
    sub_10004D9B4(v13);
  }
  v11 = [v9 queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100039A6C;
  block[3] = &unk_100071D18;
  v17 = v36;
  v18 = v34;
  unsigned __int8 v19 = v32;
  id v15 = v7;
  id v16 = v38;
  id v12 = v7;
  dispatch_group_notify(v8, v11, block);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);
}

- (id)keychainBaseQueryWithEnvironment:(id)a3 andBaseURL:(id)a4
{
  v9[0] = kSecClass;
  v9[1] = kSecAttrAccount;
  v10[0] = kSecClassInternetPassword;
  v10[1] = @"EscrowServiceCertificateStore";
  v9[2] = kSecAttrPath;
  v9[3] = kSecAttrServer;
  v10[2] = a3;
  v10[3] = a4;
  v9[4] = kSecAttrAccessible;
  v9[5] = kSecUseDataProtectionKeychain;
  v10[4] = kSecAttrAccessibleAfterFirstUnlock;
  void v10[5] = &__kCFBooleanTrue;
  v9[6] = kSecAttrSynchronizable;
  v10[6] = &__kCFBooleanFalse;
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:7];

  return v7;
}

- (BOOL)cacheStoredCertificate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 iCloudEnvironment];
  id v8 = [v6 escrowBaseURL];
  CFDictionaryRef v9 = [(EscrowService *)self keychainBaseQueryWithEnvironment:v7 andBaseURL:v8];

  uint64_t v10 = SecItemDelete(v9);
  if (v10)
  {
    uint64_t v11 = v10;
    id v12 = CloudServicesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10004DA24(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  id v19 = [(__CFDictionary *)v9 mutableCopy];
  v20 = [v6 data];
  [v19 setObject:v20 forKeyedSubscript:kSecValueData];

  uint64_t v21 = SecItemAdd((CFDictionaryRef)v19, 0);
  if (v21)
  {
    v22 = CloudServicesLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10004D9B8(v21, v22, v23, v24, v25, v26, v27, v28);
    }

    if (a4)
    {
      *a4 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:(int)v21 userInfo:0];
    }
  }

  return v21 == 0;
}

- (id)fetchCachedCertificateWithRequest:(id)a3 error:(id *)a4
{
  id v53 = 0;
  id v6 = +[EscrowService certificateRequest:a3 duplicate:0 error:&v53];
  id v7 = v53;
  id v8 = v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    id v12 = [v6 iCloudEnv];
    uint64_t v13 = [v6 baseURL];
    uint64_t v14 = [(EscrowService *)self keychainBaseQueryWithEnvironment:v12 andBaseURL:v13];
    id v15 = [v14 mutableCopy];

    [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnAttributes];
    [v15 setObject:&__kCFBooleanTrue forKeyedSubscript:kSecReturnData];
    [v15 setObject:kSecMatchLimitOne forKeyedSubscript:kSecMatchLimit];
    *(void *)buf = 0;
    uint64_t v16 = SecItemCopyMatching((CFDictionaryRef)v15, (CFTypeRef *)buf);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = CloudServicesLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10004DB60(v17, v18, v19, v20, v21, v22, v23, v24);
      }

      if (!a4)
      {
        uint64_t v11 = 0;
LABEL_43:

        goto LABEL_44;
      }
      uint64_t v25 = (int)v17;
      NSErrorUserInfoKey v62 = NSLocalizedDescriptionKey;
      CFStringRef v63 = @"Unable to find certificate in keychain";
      uint64_t v26 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];
      +[NSError errorWithDomain:NSOSStatusErrorDomain code:v25 userInfo:v26];
      uint64_t v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:

      goto LABEL_43;
    }
    uint64_t v26 = *(void **)buf;
    uint64_t v27 = [StoredCertificate alloc];
    uint64_t v28 = [v26 objectForKeyedSubscript:kSecValueData];
    id v29 = [(StoredCertificate *)v27 initWithData:v28];

    if (v29)
    {
      v30 = [(StoredCertificate *)v29 dsid];
      v31 = [v6 dsid];
      unsigned __int8 v32 = [v30 isEqualToString:v31];

      if (v32)
      {
        id v33 = [(StoredCertificate *)v29 iCloudEnvironment];
        v34 = [v6 iCloudEnv];
        unsigned __int8 v35 = [v33 isEqualToString:v34];

        if (v35)
        {
          v36 = [(StoredCertificate *)v29 escrowBaseURL];
          id v37 = [v6 baseURL];
          unsigned __int8 v38 = [v36 isEqualToString:v37];

          id v39 = CloudServicesLog();
          v40 = v39;
          if (v38)
          {
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              __int16 v52 = 0;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Found a valid stored certificate in the keychain", (uint8_t *)&v52, 2u);
            }

            uint64_t v11 = v29;
            goto LABEL_41;
          }
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
            sub_10004DAC4();
          }

          if (!a4)
          {
LABEL_40:
            uint64_t v11 = 0;
LABEL_41:

            goto LABEL_42;
          }
          uint64_t v50 = kEscrowServiceErrorDomain;
          NSErrorUserInfoKey v54 = NSLocalizedDescriptionKey;
          CFStringRef v55 = @"Cached certificate for wrong escrow URL";
          uint64_t v43 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
          uint64_t v44 = v50;
          uint64_t v45 = 123;
        }
        else
        {
          id v48 = CloudServicesLog();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
            sub_10004DAF8();
          }

          if (!a4) {
            goto LABEL_40;
          }
          uint64_t v49 = kEscrowServiceErrorDomain;
          NSErrorUserInfoKey v56 = NSLocalizedDescriptionKey;
          CFStringRef v57 = @"Cached certificate for wrong iCloud Environment";
          uint64_t v43 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
          uint64_t v44 = v49;
          uint64_t v45 = 122;
        }
      }
      else
      {
        uint64_t v46 = CloudServicesLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
          sub_10004DB2C();
        }

        if (!a4) {
          goto LABEL_40;
        }
        uint64_t v47 = kEscrowServiceErrorDomain;
        NSErrorUserInfoKey v58 = NSLocalizedDescriptionKey;
        CFStringRef v59 = @"Cached certificate for wrong DSID";
        uint64_t v43 = +[NSDictionary dictionaryWithObjects:&v59 forKeys:&v58 count:1];
        uint64_t v44 = v47;
        uint64_t v45 = 121;
      }
    }
    else
    {
      v41 = CloudServicesLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        sub_10004DA90();
      }

      if (!a4) {
        goto LABEL_40;
      }
      uint64_t v42 = kEscrowServiceErrorDomain;
      NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
      CFStringRef v61 = @"Unable to deserialize certificate from keychain";
      uint64_t v43 = +[NSDictionary dictionaryWithObjects:&v61 forKeys:&v60 count:1];
      uint64_t v44 = v42;
      uint64_t v45 = 120;
    }
    *a4 = +[NSError errorWithDomain:v44 code:v45 userInfo:v43];

    goto LABEL_40;
  }
  uint64_t v10 = CloudServicesLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Bailing on fetch certificates from keychain due to no cert request: %@", buf, 0xCu);
  }

  uint64_t v11 = 0;
  if (a4) {
    *a4 = v8;
  }
LABEL_44:

  return v11;
}

- (void)storeRecordWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[SBEscrowOperationStartEvent alloc] initWithRequest:v6 type:200];
  BOOL v9 = [(EscrowService *)self operationsLogger];
  [v9 updateStoreWithEvent:v8];

  id v10 = objc_retainBlock(v7);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10003A8F8;
  v47[3] = &unk_1000713A8;
  v47[4] = self;
  id v48 = v8;
  id v49 = v10;
  id v11 = v10;
  id v12 = v8;
  uint64_t v13 = objc_retainBlock(v47);

  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x3032000000;
  v45[3] = sub_10003978C;
  v45[4] = sub_10003979C;
  id v46 = 0;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = sub_10003978C;
  v43[4] = sub_10003979C;
  id v44 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = sub_10003978C;
  v41[4] = sub_10003979C;
  id v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = sub_10003978C;
  v39[4] = sub_10003979C;
  id v40 = 0;
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_10003A9AC;
  activity_block[3] = &unk_100071CF0;
  uint64_t v14 = dispatch_group_create();
  v34 = v14;
  unsigned __int8 v35 = self;
  id v15 = v6;
  id v36 = v15;
  id v37 = v45;
  unsigned __int8 v38 = v43;
  _os_activity_initiate((void *)&_mh_execute_header, "storeRecordWithRequest", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  if ([v15 requiresDoubleEnrollment])
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10003AAF8;
    v27[3] = &unk_100071CF0;
    uint64_t v28 = v14;
    id v29 = self;
    id v30 = v15;
    v31 = v41;
    unsigned __int8 v32 = v39;
    _os_activity_initiate((void *)&_mh_execute_header, "storeRecordWithRequest (double enrollment)", OS_ACTIVITY_FLAG_DEFAULT, v27);
  }
  uint64_t v16 = [v15 queue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10003AC74;
  v19[3] = &unk_100071D68;
  id v20 = v15;
  uint64_t v21 = self;
  id v22 = v13;
  uint64_t v23 = v41;
  uint64_t v24 = v39;
  uint64_t v25 = v45;
  uint64_t v26 = v43;
  uint64_t v17 = v13;
  id v18 = v15;
  dispatch_group_notify(v14, v16, v19);

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(v45, 8);
}

- (void)_storeRecordWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v18 = 0;
  id v10 = +[EscrowService certificateRequest:v8 duplicate:v6 error:&v18];
  id v11 = v18;
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10003AFD8;
    v13[3] = &unk_100071D90;
    id v16 = v9;
    id v14 = v8;
    id v15 = self;
    BOOL v17 = v6;
    [v10 performRequestWithHandler:v13];
  }
  else
  {
    id v12 = CloudServicesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Bailing record store due to no cert request: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, id))v9 + 2))(v9, 0, v11);
  }
}

- (BOOL)_invalidateEscrowCache:(id)a3 error:(id *)a4
{
  id v5 = objc_alloc_init((Class)OTConfigurationContext);
  BOOL v6 = sub_100010238();
  [v5 setAltDSID:v6];

  [v5 setContext:OTDefaultContext];
  id v13 = 0;
  unsigned int v7 = +[OTClique invalidateEscrowCache:v5 error:&v13];
  id v8 = v13;
  id v9 = CloudServicesLog();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully invalidated escrow cache", buf, 2u);
    }
  }
  else
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to invalidate escrow cache error: %@", buf, 0xCu);
    }

    if (a4) {
      *a4 = v8;
    }
  }

  return v7;
}

- (void)storeRecordWithCertDataRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [v8 certData];
  if (v10)
  {
    if (v6) {
      [v8 duplicateEncodedMetadata];
    }
    else {
    id v13 = [v8 encodedMetadata];
    }
    id v14 = CloudServicesLog();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        CFStringRef v16 = &stru_100072CF8;
        if (v6) {
          CFStringRef v16 = @" (duplicate)";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v42 = v16;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Creating an escrow update operation%@", buf, 0xCu);
      }
      BOOL v17 = &off_100070968;
    }
    else
    {
      if (v15)
      {
        CFStringRef v18 = &stru_100072CF8;
        if (v6) {
          CFStringRef v18 = @" (duplicate)";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v42 = v18;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Creating an escrow enrollment operation%@", buf, 0xCu);
      }
      BOOL v17 = off_100070960;
    }

    id v19 = [objc_alloc(*v17) initWithRequest:v8];
    [v19 setDuplicate:v6];
    uint64_t v20 = [v19 validateInput];
    BOOL v11 = (__CFString *)v20;
    if (!v19 || v20)
    {
      uint64_t v27 = CloudServicesLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v42 = v11;
        uint64_t v28 = "Error creating or validating escrow request: %@";
LABEL_30:
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0xCu);
      }
    }
    else
    {
      uint64_t v21 = [v8 prerecord];

      id v22 = CloudServicesLog();
      BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
      if (v21)
      {
        if (v23)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "EscrowService: Using provided prerecord", buf, 2u);
        }

        uint64_t v24 = [v8 prerecord];
        id v40 = 0;
        unsigned int v25 = [(EscrowService *)self processPrerecord:v24 outerRequest:v8 escrowRequest:v19 error:&v40];
        BOOL v11 = (__CFString *)v40;

        if (!v25 || (uint64_t v26 = 0, v11))
        {
          uint64_t v27 = CloudServicesLog();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            sub_10004DD70();
          }
          goto LABEL_31;
        }
LABEL_36:
        v31 = CloudServicesLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v32 = [v19 recordID];
          *(_DWORD *)buf = 138412290;
          CFStringRef v42 = v32;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Attempting to store/update a escrow record: %@", buf, 0xCu);
        }
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10003B9D4;
        v33[3] = &unk_100071DB8;
        id v38 = v9;
        id v34 = v8;
        unsigned __int8 v35 = self;
        id v36 = v19;
        id v37 = v10;
        [v36 performRequestWithHandler:v33];

        BOOL v11 = v26;
        goto LABEL_39;
      }
      if (v23)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "EscrowService: Using provided escrow record contents", buf, 2u);
      }

      id v39 = 0;
      id v29 = +[EscrowService createEscrowBlobWithCertificate:v10 escrowRequest:v19 error:&v39];
      BOOL v11 = (__CFString *)v39;
      [v19 setBlob:v29];

      id v30 = [v19 blob];

      if (v30)
      {
        uint64_t v26 = v11;
        goto LABEL_36;
      }
      uint64_t v27 = CloudServicesLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v42 = v11;
        uint64_t v28 = "Failed to create escrow blob: %@";
        goto LABEL_30;
      }
    }
LABEL_31:

    (*((void (**)(id, void, __CFString *))v9 + 2))(v9, 0, v11);
LABEL_39:

    goto LABEL_40;
  }
  BOOL v11 = +[CloudServicesError errorWithDomain:kEscrowServiceErrorDomain code:126 format:@"Unexpected error with missing certificate"];
  id v12 = CloudServicesLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v42 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Certificate encoding error: %@", buf, 0xCu);
  }

  (*((void (**)(id, void, __CFString *))v9 + 2))(v9, 0, v11);
LABEL_40:
}

- (BOOL)processPrerecord:(id)a3 outerRequest:(id)a4 escrowRequest:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 dsid];
  if (!v10) {
    goto LABEL_7;
  }
  BOOL v11 = (void *)v10;
  id v12 = [v8 dsid];
  id v13 = [v9 dsid];
  unsigned __int8 v14 = [v12 isEqualToString:v13];

  if ((v14 & 1) == 0)
  {
LABEL_7:
    uint64_t v21 = CloudServicesLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_10004DDD8();
    }

    if (a6)
    {
      +[CloudServicesError errorWithDomain:kEscrowServiceErrorDomain code:104 format:@"DSID missing or mismatched"];
      BOOL v22 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_20:
    BOOL v22 = 0;
    goto LABEL_21;
  }
  BOOL v15 = [v8 iCloudEnvironment];
  CFStringRef v16 = [v9 iCloudEnv];
  unsigned __int8 v17 = [v15 isEqualToString:v16];

  if ((v17 & 1) == 0)
  {
    BOOL v23 = CloudServicesLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10004DED8();
    }

    if (!a6) {
      goto LABEL_20;
    }
    uint64_t v24 = kEscrowServiceErrorDomain;
    NSErrorUserInfoKey v41 = NSLocalizedDescriptionKey;
    CFStringRef v42 = @"Prerecord for wrong iCloud Environment";
    unsigned int v25 = &v42;
    uint64_t v26 = &v41;
LABEL_19:
    uint64_t v28 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v26 count:1];
    *a6 = +[NSError errorWithDomain:v24 code:104 userInfo:v28];

    goto LABEL_20;
  }
  CFStringRef v18 = [v8 escrowBaseURL];
  id v19 = [v9 baseURL];
  unsigned __int8 v20 = [v18 isEqualToString:v19];

  if ((v20 & 1) == 0)
  {
    uint64_t v27 = CloudServicesLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10004DEA4();
    }

    if (!a6) {
      goto LABEL_20;
    }
    uint64_t v24 = kEscrowServiceErrorDomain;
    NSErrorUserInfoKey v39 = NSLocalizedDescriptionKey;
    CFStringRef v40 = @"Prerecord for wrong escrow URL";
    unsigned int v25 = &v40;
    uint64_t v26 = &v39;
    goto LABEL_19;
  }
  if ([v9 duplicate]) {
    [v8 duplicateEscrowBlob];
  }
  else {
  id v30 = [v8 escrowBlob];
  }
  BOOL v22 = v30 != 0;
  if (v30)
  {
    [v9 setBlob:v30];
  }
  else
  {
    v31 = CloudServicesLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_10004DE0C(v9, v31);
    }

    if (a6)
    {
      uint64_t v32 = kEscrowServiceErrorDomain;
      NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
      unsigned int v33 = [v9 duplicate];
      CFStringRef v34 = &stru_100072CF8;
      if (v33) {
        CFStringRef v34 = @"(duplicate) ";
      }
      unsigned __int8 v35 = +[NSString stringWithFormat:@"Prerecord has no %@escrow blob", v34];
      id v38 = v35;
      id v36 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      *a6 = +[NSError errorWithDomain:v32 code:105 userInfo:v36];
    }
  }

LABEL_21:
  return v22;
}

+ (id)doubleEnrollmentRecordFromPrimaryRecord:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 objectForKeyedSubscript:@"DoubleEnrollmentVersion"];
  unsigned int v6 = [v5 intValue];

  if (v6 == 1)
  {
    v32[0] = 0xAAAAAAAAAAAAAAAALL;
    v32[1] = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v24 = [v3 objectForKeyedSubscript:@"DoubleEnrollmentPassword"];
    id v23 = [objc_alloc((Class)NSUUID) initWithUUIDString:v24];
    [v23 getUUIDBytes:v32];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v25 = v3;
    id v7 = v3;
    id v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v28;
      BOOL v11 = &CC_SHA1_ptr;
      id v26 = v7;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          unsigned __int8 v14 = [v7 objectForKeyedSubscript:v13];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v9;
            CFStringRef v16 = v4;
            unsigned __int8 v17 = v11;
            unint64_t v18 = (unint64_t)[v14 length];
            id v19 = [objc_alloc((Class)NSMutableData) initWithCapacity:v18];
            if (v18 >= 0x10)
            {
              unint64_t v20 = v18 >> 4;
              do
              {
                [v19 appendBytes:v32 length:16];
                --v20;
              }
              while (v20);
            }
            [v19 appendBytes:v32 length:v18 & 0xF];
            id v4 = v16;
            [v16 setObject:v19 forKeyedSubscript:v13];

            BOOL v11 = v17;
            id v9 = v15;
            id v7 = v26;
          }
          else
          {
            [v4 setObject:v14 forKeyedSubscript:v13];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v9);
    }

    id v3 = v25;
  }
  else
  {
    uint64_t v21 = [v3 objectForKeyedSubscript:@"DoubleEnrollmentPassword"];
    [v4 setObject:v21 forKeyedSubscript:@"DoubleEnrollmentPassword"];
  }

  return v4;
}

+ (id)createEscrowBlobWithCertificate:(id)a3 escrowRequest:(id)a4 error:(id *)a5
{
  id v7 = a4;
  CFTypeRef cf = 0;
  id v8 = a3;
  id v9 = [v7 stingray];
  uint64_t v10 = [v7 altDSID];
  BOOL v11 = [v7 iCloudEnv];
  LOWORD(v20) = [v7 duplicate];
  unsigned __int8 v12 = +[CSCertOperations verifyCertData:withCert:withPubKey:stingray:enroll:altDSID:env:duplicate:sigVerification:error:](CSCertOperations, "verifyCertData:withCert:withPubKey:stingray:enroll:altDSID:env:duplicate:sigVerification:error:", v8, 0, &cf, v9, 1, v10, v11, v20, a5);

  if (v12)
  {
    uint64_t v13 = (__CFString *)[objc_alloc((Class)CSSESWrapper) initWithRequest:v7 validate:0 reqVersion:0];
    unsigned __int8 v14 = [(__CFString *)v13 encodedEscrowRecordWithPublicKey:cf error:a5];
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }
    if (v14)
    {
      unsigned __int8 v14 = v14;
      id v15 = v14;
    }
    else
    {
      if (a5 && !*a5)
      {
        *a5 = +[CloudServicesError errorWithDomain:kEscrowServiceErrorDomain code:124 format:@"Unknown error encoding record"];
      }
      unsigned __int8 v17 = CloudServicesLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        if (a5) {
          CFStringRef v18 = (const __CFString *)*a5;
        }
        else {
          CFStringRef v18 = @"no error pointer";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Failed to create escrow blob: %@", buf, 0xCu);
      }

      id v15 = 0;
    }
  }
  else
  {
    CFStringRef v16 = +[CloudServicesError errorWithDomain:kEscrowServiceErrorDomain code:96 format:@"Unexpected error with certificate"];
    uint64_t v13 = v16;
    if (a5) {
      *a5 = v16;
    }
    unsigned __int8 v14 = CloudServicesLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Error extracting public key from cert: %@", buf, 0xCu);
    }
    id v15 = 0;
  }

  return v15;
}

+ (BOOL)isFatalError:(id)a3
{
  id v3 = a3;
  id v4 = [v3 domain];
  unsigned int v5 = [v4 isEqualToString:kEscrowServiceErrorDomain];

  if (!v5) {
    goto LABEL_11;
  }
  uint64_t v6 = (uint64_t)[v3 code];
  BOOL v7 = 1;
  if (v6 > -1003)
  {
    if (v6 == -1002) {
      goto LABEL_12;
    }
    if (v6 == 99)
    {
      id v8 = [v3 userInfo];
      id v9 = [v8 objectForKeyedSubscript:NSUnderlyingErrorKey];

      if (v9) {
        BOOL v7 = [v9 code] == (id)128;
      }
      else {
        BOOL v7 = 0;
      }

      goto LABEL_12;
    }
LABEL_11:
    BOOL v7 = 0;
    goto LABEL_12;
  }
  if (((unint64_t)(v6 + 6015) > 3 || v6 == -6013) && v6 != -6162) {
    goto LABEL_11;
  }
LABEL_12:

  return v7;
}

- (void)_recoverWithVersion:(int)a3 req:(id)a4 duplicate:(BOOL)a5 sesWrapper:(id)a6 srpInitResponse:(id)a7 reply:(id)a8
{
  BOOL v11 = a5;
  uint64_t v12 = *(void *)&a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a8;
  id v17 = a7;
  CFStringRef v18 = CloudServicesLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v33) = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "performing recovery request version %d", buf, 8u);
  }

  [v15 setReqVersion:v12];
  id v19 = [v17 srpData];

  id v31 = 0;
  uint64_t v20 = [v15 srpRecoveryBlobFromData:v19 error:&v31];
  id v21 = v31;

  if (v21 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v33 = v21;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "srpError: %@", buf, 0xCu);
  }
  if (v20)
  {
    BOOL v22 = [(EscrowGenericRequest *)[EscrowRecoveryRequest alloc] initWithRequest:v14];
    [(EscrowGenericRequest *)v22 setDuplicate:v11];
    [(EscrowGenericRequest *)v22 setBlob:v20];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10003C9A8;
    v25[3] = &unk_100071DE0;
    v25[4] = self;
    id v26 = v22;
    id v29 = v16;
    id v27 = v15;
    id v28 = v14;
    BOOL v30 = v11;
    CFStringRef v23 = v22;
    [(EscrowRecoveryRequest *)v23 performRequestWithHandler:v25];
  }
  else
  {
    CFStringRef v23 = (EscrowRecoveryRequest *)objc_alloc_init((Class)NSMutableDictionary);
    [(EscrowRecoveryRequest *)v23 setObject:@"Error authenticating" forKeyedSubscript:NSLocalizedDescriptionKey];
    [(EscrowRecoveryRequest *)v23 setObject:v21 forKeyedSubscript:NSUnderlyingErrorKey];
    uint64_t v24 = +[NSError errorWithDomain:kEscrowServiceErrorDomain code:99 userInfo:v23];
    (*((void (**)(id, void, void *))v16 + 2))(v16, 0, v24);
  }
}

- (void)_srpInitHelper:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = a3;
  id v9 = [(EscrowGenericRequest *)[EscrowSRPRequest alloc] initWithRequest:v8];

  id v10 = [objc_alloc((Class)CSSESWrapper) initWithRequest:v9 reqVersion:0];
  [(EscrowGenericRequest *)v9 setDuplicate:v5];
  if ([v10 validatePassphrasePresentOrPending])
  {
    BOOL v11 = [v10 srpInitBlob];
    [(EscrowGenericRequest *)v9 setBlob:v11];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10003CF6C;
    v16[3] = &unk_100071E08;
    id v18 = v7;
    id v17 = v10;
    [(EscrowSRPRequest *)v9 performRequestWithHandler:v16];

    uint64_t v12 = v18;
  }
  else
  {
    uint64_t v13 = CloudServicesLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10004DF74();
    }

    uint64_t v14 = kEscrowServiceErrorDomain;
    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    CFStringRef v20 = @"No passphrase provided";
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v15 = +[NSError errorWithDomain:v14 code:128 userInfo:v12];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v15);
  }
}

- (void)setPasswordMetadataWithRequest:(id)a3 response:(id)a4 ses:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if ([a3 guitarfish])
  {
    if (_os_feature_enabled_impl())
    {
      id v9 = CloudServicesLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = [v7 responseDictionary];
        int v21 = 138412546;
        id v22 = v7;
        __int16 v23 = 2112;
        uint64_t v24 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "DEMO: parsing srp init: %@, %@", (uint8_t *)&v21, 0x16u);
      }
    }
    BOOL v11 = [v8 appleIDPasswordMetadata];
    uint64_t v12 = [v11 proto];
    uint64_t v13 = [v11 salt];
    id v14 = [v11 iterations];
    id v15 = [v7 proto];

    if (v15)
    {
      uint64_t v16 = [v7 proto];

      uint64_t v12 = (void *)v16;
    }
    id v17 = [v7 iterations];

    if (v17)
    {
      id v18 = [v7 iterations];
      id v14 = [v18 integerValue];
    }
    if (_os_feature_enabled_impl())
    {
      NSErrorUserInfoKey v19 = CloudServicesLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412802;
        id v22 = v12;
        __int16 v23 = 2112;
        uint64_t v24 = v13;
        __int16 v25 = 1024;
        int v26 = (int)v14;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "DEMO: proto %@, salt %@, iterations %d", (uint8_t *)&v21, 0x1Cu);
      }
    }
    id v20 = [objc_alloc((Class)AppleIDPasswordMetadata) initWithProto:v12 salt:v13 iterations:v14];
    [v8 setAppleIDPasswordMetadata:v20];
  }
}

- (void)_recoverActualRecordWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10003D420;
  v10[3] = &unk_100071E30;
  id v11 = a3;
  id v12 = a5;
  v10[4] = self;
  BOOL v13 = v6;
  id v8 = v11;
  id v9 = v12;
  [(EscrowService *)self _srpInitHelper:v8 duplicate:v6 completionBlock:v10];
}

- (void)recoverRecordWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[SBEscrowOperationStartEvent alloc] initWithRequest:v6 type:201];
  id v9 = [(EscrowService *)self operationsLogger];
  [v9 updateStoreWithEvent:v8];

  id v10 = objc_retainBlock(v7);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10003DFD4;
  v22[3] = &unk_1000713A8;
  v22[4] = self;
  __int16 v23 = v8;
  id v24 = v10;
  id v11 = v10;
  id v12 = v8;
  BOOL v13 = objc_retainBlock(v22);

  id v14 = CloudServicesLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "dispatching to recover queue", buf, 2u);
  }

  id v15 = sub_10003E088();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003E0DC;
  block[3] = &unk_100071E80;
  void block[4] = self;
  id v19 = v6;
  id v20 = v13;
  uint64_t v16 = v13;
  id v17 = v6;
  dispatch_async(v15, block);
}

- (void)_performPostEnrollSilentRecoveryWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)SecureBackup) initWithUserActivityLabel:@"silent recovery after enroll"];
  objc_msgSend(v5, "setIcdp:", objc_msgSend(v4, "icdp"));
  objc_msgSend(v5, "setStingray:", objc_msgSend(v4, "stingray"));
  id v6 = [v4 appleID];
  [v5 setAppleID:v6];

  id v7 = [v4 iCloudPassword];
  [v5 setICloudPassword:v7];

  id v8 = [v4 passphrase];
  [v5 setPassphrase:v8];

  id v9 = [v4 recordID];
  [v5 setRecordID:v9];

  [v5 setSilentDoubleRecovery:1];
  id v10 = [v4 queue];
  [v5 setQueue:v10];

  id v11 = [v4 dsid];
  [v5 setDsid:v11];

  id v12 = [v4 authToken];
  [v5 setAuthToken:v12];

  BOOL v13 = [v4 escrowProxyURL];
  [v5 setEscrowProxyURL:v13];

  id v14 = [v4 iCloudEnv];

  [v5 setICloudEnv:v14];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003E5BC;
  v16[3] = &unk_100071EE8;
  void v16[4] = self;
  id v17 = v5;
  id v15 = v5;
  _os_activity_initiate((void *)&_mh_execute_header, "silent recovery", OS_ACTIVITY_FLAG_DEFAULT, v16);
}

- (void)_performDoubleRecoveryICDPWithRequest:(id)a3 primaryResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:kEscrowServiceRecordDataKey];
  id v9 = [v8 objectForKeyedSubscript:@"DoubleEnrollmentPassword"];

  id v10 = CloudServicesLog();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "attempting double enrollment recovery", buf, 2u);
    }

    [v6 setPassphrase:v9];
    id v12 = CloudServicesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "dispatching to recover queue (double recovery)", buf, 2u);
    }

    BOOL v13 = sub_10003E088();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003E850;
    block[3] = &unk_100070F80;
    void block[4] = self;
    id v15 = v6;
    id v16 = v7;
    dispatch_async(v13, block);
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "recovered record does not contain a double-enrollment password; skipping double enrollment recovery",
        buf,
        2u);
    }
  }
}

- (void)_performDoubleRecoveryStingrayWithRequest:(id)a3 primaryResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = CloudServicesLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "dispatching to recover queue (PCS double recovery)", buf, 2u);
  }

  id v9 = sub_10003E088();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003EFEC;
  block[3] = &unk_100070F80;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)ttrForPCSDataMatchFailure:(id)a3
{
  id v3 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v5 = CloudServicesLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "PCS double TTR: skipping prompt/TTR due to DataMatchTTR feature flag";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
    }
LABEL_16:

    goto LABEL_17;
  }
  if (_os_feature_enabled_impl())
  {
    id v4 = CloudServicesLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PCS double TTR: forcing prompt/TTR due to feature flag", buf, 2u);
    }

LABEL_9:
    if (sub_100004254())
    {
      id v7 = +[NSDate now];
      if (qword_1000810B0 != -1) {
        dispatch_once(&qword_1000810B0, &stru_100072130);
      }
      id v8 = qword_1000810B8;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10003F868;
      v9[3] = &unk_100071EE8;
      id v10 = v7;
      id v11 = v3;
      id v5 = v7;
      dispatch_async(v8, v9);

      goto LABEL_16;
    }
    id v5 = CloudServicesLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v6 = "PCS double TTR: not showing prompt; not on internal release";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (v3) {
    goto LABEL_9;
  }
LABEL_17:
}

- (void)deleteRecordWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[SBEscrowOperationStartEvent alloc] initWithRequest:v6 type:203];
  id v9 = [(EscrowService *)self operationsLogger];
  [v9 updateStoreWithEvent:v8];

  id v10 = objc_retainBlock(v7);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000400FC;
  v44[3] = &unk_1000713A8;
  v44[4] = self;
  uint64_t v45 = v8;
  id v46 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = objc_retainBlock(v44);

  dispatch_group_t v14 = dispatch_group_create();
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = sub_10003978C;
  v42[4] = sub_10003979C;
  id v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = sub_10003978C;
  v40[4] = sub_10003979C;
  id v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_10003978C;
  v38[4] = sub_10003979C;
  id v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_10003978C;
  v36[4] = sub_10003979C;
  id v37 = 0;
  if ([v6 deleteDoubleOnly]
    && ([v6 requiresDoubleEnrollment] & 1) == 0)
  {
    id v16 = +[CloudServicesError errorWithCode:22 error:0 format:@"DeleteDoubleOnly for invalid request type"];
    ((void (*)(void *, void, void *))v13[2])(v13, 0, v16);
  }
  else
  {
    if (([v6 deleteDoubleOnly] & 1) == 0)
    {
      activity_block[0] = _NSConcreteStackBlock;
      activity_block[1] = 3221225472;
      activity_block[2] = sub_1000401B0;
      activity_block[3] = &unk_100071CF0;
      id v31 = v14;
      uint64_t v32 = self;
      id v33 = v6;
      CFStringRef v34 = v42;
      unsigned __int8 v35 = v40;
      _os_activity_initiate((void *)&_mh_execute_header, "deleteRecordWithRequest", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
    }
    if ([v6 requiresDoubleEnrollment])
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_1000402FC;
      v24[3] = &unk_100071CF0;
      __int16 v25 = v14;
      int v26 = self;
      id v27 = v6;
      id v28 = v38;
      id v29 = v36;
      _os_activity_initiate((void *)&_mh_execute_header, "deleteRecordWithRequest (double enrollment)", OS_ACTIVITY_FLAG_DEFAULT, v24);
    }
    id v15 = [v6 queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000404B8;
    block[3] = &unk_100071FB8;
    id v18 = v6;
    id v19 = v13;
    id v20 = v42;
    int v21 = v40;
    id v22 = v38;
    __int16 v23 = v36;
    dispatch_group_notify(v14, v15, block);

    id v16 = v18;
  }

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);
}

- (void)_deleteRecordWithRequest:(id)a3 duplicate:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [(EscrowGenericRequest *)[EscrowDeleteRequest alloc] initWithRequest:v9];

  [(EscrowGenericRequest *)v10 setDuplicate:v5];
  [(EscrowService *)self _removeBypassToken];
  id v11 = CloudServicesLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(EscrowGenericRequest *)v10 recordID];
    *(_DWORD *)buf = 138412290;
    id v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to delete a escrow record: %@", buf, 0xCu);
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000406B4;
  v15[3] = &unk_100071FE0;
  id v16 = v10;
  id v17 = v8;
  v15[4] = self;
  id v13 = v10;
  id v14 = v8;
  [(EscrowDeleteRequest *)v13 performRequestWithHandler:v15];
}

- (void)updateRecordMetadataWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[SBEscrowOperationStartEvent alloc] initWithRequest:v7 type:202];
  id v9 = [(EscrowService *)self operationsLogger];
  [v9 updateStoreWithEvent:v8];

  id v10 = objc_retainBlock(v6);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100040A7C;
  v20[3] = &unk_1000713A8;
  void v20[4] = self;
  int v21 = v8;
  id v22 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = objc_retainBlock(v20);

  id v14 = [(EscrowGenericRequest *)[EscrowUpdateMetadataRequest alloc] initWithRequest:v7];
  id v15 = CloudServicesLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [(EscrowGenericRequest *)v14 recordID];
    *(_DWORD *)buf = 138412290;
    id v24 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Attempting to update metadata for a escrow record: %@", buf, 0xCu);
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100040B30;
  v18[3] = &unk_100072008;
  id v19 = v13;
  id v17 = v13;
  [(EscrowUpdateMetadataRequest *)v14 performRequestWithHandler:v18];
}

- (void)startSMSChallengeWithRequest:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(EscrowGenericRequest *)[EscrowSMSChallengeRequest alloc] initWithRequest:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100040D7C;
  v9[3] = &unk_100072030;
  id v10 = v5;
  id v8 = v5;
  [(LakituRequest *)v7 performRequestWithHandler:v9];
}

- (void)changeSMSTargetWithRequest:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(EscrowGenericRequest *)[EscrowChangeSMSTargetRequest alloc] initWithRequest:v7];

  id v9 = [(EscrowService *)self _getBypassToken];
  [(EscrowGenericRequest *)v8 setBypassToken:v9];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100041054;
  v11[3] = &unk_100072058;
  id v12 = v6;
  id v10 = v6;
  [(LakituRequest *)v8 performRequestWithHandler:v11];
}

- (void)listSMSTargetsWithRequest:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(EscrowGenericRequest *)[EscrowListSMSTargetsRequest alloc] initWithRequest:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000412BC;
  v9[3] = &unk_100072080;
  id v10 = v5;
  id v8 = v5;
  [(LakituRequest *)v7 performRequestWithHandler:v9];
}

- (void)getCountrySMSCodesWithRequest:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(EscrowGenericRequest *)[EscrowGetCountrySMSCodesRequest alloc] initWithRequest:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100041498;
  v9[3] = &unk_1000720A8;
  id v10 = v5;
  id v8 = v5;
  [(LakituRequest *)v7 performRequestWithHandler:v9];
}

- (void)verifyCertificateWithRequest:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, id))a4;
  id v7 = [v5 iCloudEnv];
  if (v7 || (sub_10001029C(), (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = [v5 certData];
    if (![v8 length])
    {
      id v10 = +[CloudServicesError errorWithCode:22 error:0 format:@"Missing certificate data"];
      id v11 = CloudServicesLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Missing certificate data", buf, 2u);
      }

      v6[2](v6, 0, v10);
      goto LABEL_22;
    }
    id v22 = 0;
    CFTypeRef cf = 0;
    LOWORD(v21) = 0;
    unsigned __int8 v9 = +[CSCertOperations verifyCertData:withCert:withPubKey:stingray:enroll:altDSID:env:duplicate:sigVerification:error:](CSCertOperations, "verifyCertData:withCert:withPubKey:stingray:enroll:altDSID:env:duplicate:sigVerification:error:", v8, &cf, 0, 0, 0, 0, v7, v21, &v22);
    id v10 = v22;
    if (v9)
    {
      ((void (**)(id, void *, id))v6)[2](v6, &__NSDictionary0__struct, 0);
      if (cf) {
        CFRelease(cf);
      }
LABEL_22:

      goto LABEL_23;
    }
    id v12 = +[CSCertOperations certVersion:cf];
    id v13 = +[CSCertOperations rootCurrentVersionForRootType:5 altDSID:0 inEnvironment:v7];
    id v14 = CloudServicesLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v25 = v13;
      __int16 v26 = 2112;
      id v27 = v12;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Current Trust Version: %@; Current Cert Version: %@",
        buf,
        0x16u);
    }

    id v15 = [v12 unsignedLongLongValue];
    if (v15 <= [v13 unsignedLongLongValue])
    {
      id v16 = +[CloudServicesError errorWithDomain:kEscrowServiceErrorDomain code:127 format:@"Cert does not match our trust policy"];
      id v17 = CloudServicesLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v10;
        id v18 = "Cert does not match our trust policy: %@";
        id v19 = v17;
        uint32_t v20 = 12;
        goto LABEL_18;
      }
    }
    else
    {
      id v16 = +[CloudServicesError errorWithDomain:kEscrowServiceErrorDomain code:100 format:@"Cert is newer than trust policy"];
      id v17 = CloudServicesLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v18 = "Cert is newer than trust policy";
        id v19 = v17;
        uint32_t v20 = 2;
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
      }
    }

    v6[2](v6, 0, v16);
    if (cf)
    {
      CFRelease(cf);
      CFTypeRef cf = 0;
    }

    goto LABEL_22;
  }
  id v7 = +[CloudServicesError errorWithCode:22 error:0 format:@"Can't get iCloud environment"];
  v6[2](v6, 0, v7);
LABEL_23:
}

- (void)logRecoveryResults:(id)a3 completionBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(EscrowGenericRequest *)[EscrowLogRecoveryRequest alloc] initWithRequest:v6];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100041A38;
  v9[3] = &unk_1000720D0;
  id v10 = v5;
  id v8 = v5;
  [(LakituRequest *)v7 performRequestWithHandler:v9];
}

- (SBEscrowOperationLogger)operationsLogger
{
  return self->_operationsLogger;
}

- (void).cxx_destruct
{
}

@end