@interface EscrowGenericRequest
+ (BOOL)pcsNoRecord;
+ (BOOL)pcsUpdateDisabled;
- (AppleIDPasswordMetadata)appleIDPasswordMetadata;
- (BOOL)duplicate;
- (BOOL)fmipRecovery;
- (BOOL)guitarfish;
- (BOOL)guitarfishToken;
- (BOOL)iCDP;
- (BOOL)isPcsRecord;
- (BOOL)nonViableRepair;
- (BOOL)recoveryResult;
- (BOOL)silentAttempt;
- (BOOL)silentDoubleRecovery;
- (BOOL)stingray;
- (BOOL)useRecoveryPET;
- (EscrowGenericRequest)initWithRequest:(id)a3;
- (LakituAccount)cachedCurrentAccount;
- (NSArray)baseRootCertVersions;
- (NSArray)trustedRootCertVersions;
- (NSData)blob;
- (NSDictionary)escrowRecord;
- (NSDictionary)metadata;
- (NSNumber)protocol;
- (NSString)activityLabel;
- (NSString)activityUUID;
- (NSString)altDSID;
- (NSString)appleID;
- (NSString)authToken;
- (NSString)baseURL;
- (NSString)bypassToken;
- (NSString)challengeCode;
- (NSString)command;
- (NSString)countryCode;
- (NSString)countryDialCode;
- (NSString)deviceSessionID;
- (NSString)doubleRecoveryUUID;
- (NSString)dsid;
- (NSString)duplicateEncodedMetadata;
- (NSString)encodedMetadata;
- (NSString)flowID;
- (NSString)fmipUUID;
- (NSString)iCloudEnv;
- (NSString)iCloudPassword;
- (NSString)phoneNumber;
- (NSString)rawPassword;
- (NSString)recordID;
- (NSString)recordLabel;
- (NSString)recoveryPassphrase;
- (NSString)recoveryUUID;
- (NSString)requestDSID;
- (id)_filteredMetadataForDoubleEnrollment:(id)a3;
- (id)additionalHeaders;
- (id)authorizationHeader;
- (id)authorizationHeaderWithUser:(id)a3 password:(id)a4 authType:(id)a5;
- (id)bodyDictionary;
- (id)currentAccount;
- (id)loggingDescription;
- (id)urlRequest;
- (id)urlString;
- (id)validateInput;
- (void)_checkFetchOperationWithHandler:(id)a3;
- (void)_checkReadOperationWithHandler:(id)a3;
- (void)_checkUpdateOperationWithHandler:(id)a3;
- (void)setActivityLabel:(id)a3;
- (void)setActivityUUID:(id)a3;
- (void)setBaseRootCertVersions:(id)a3;
- (void)setBlob:(id)a3;
- (void)setBypassToken:(id)a3;
- (void)setCachedCurrentAccount:(id)a3;
- (void)setDoubleRecoveryUUID:(id)a3;
- (void)setDuplicate:(BOOL)a3;
- (void)setDuplicateEncodedMetadata:(id)a3;
- (void)setEncodedMetadata:(id)a3;
- (void)setFmipUUID:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setRecoveryResult:(BOOL)a3;
- (void)setRecoveryUUID:(id)a3;
- (void)setRequestDSID:(id)a3;
- (void)setTrustedRootCertVersions:(id)a3;
@end

@implementation EscrowGenericRequest

- (EscrowGenericRequest)initWithRequest:(id)a3
{
  id v4 = a3;
  v61.receiver = self;
  v61.super_class = (Class)EscrowGenericRequest;
  v5 = [(EscrowGenericRequest *)&v61 init];
  if (v5)
  {
    uint64_t v6 = [v4 dsid];
    dsid = v5->_dsid;
    v5->_dsid = (NSString *)v6;

    uint64_t v8 = [v4 dsid];
    requestDSID = v5->_requestDSID;
    v5->_requestDSID = (NSString *)v8;

    uint64_t v10 = [v4 escrowProxyURL];
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSString *)v10;

    uint64_t v12 = [v4 appleID];
    appleID = v5->_appleID;
    v5->_appleID = (NSString *)v12;

    uint64_t v14 = [v4 metadata];
    metadata = v5->_metadata;
    v5->_metadata = (NSDictionary *)v14;

    uint64_t v16 = [v4 authToken];
    authToken = v5->_authToken;
    v5->_authToken = (NSString *)v16;

    uint64_t v18 = [v4 recordID];
    recordID = v5->_recordID;
    v5->_recordID = (NSString *)v18;

    uint64_t v20 = [v4 iCloudEnv];
    iCloudEnv = v5->_iCloudEnv;
    v5->_iCloudEnv = (NSString *)v20;

    uint64_t v22 = [v4 smsTarget];
    phoneNumber = v5->_phoneNumber;
    v5->_phoneNumber = (NSString *)v22;

    uint64_t v24 = [v4 countryCode];
    countryCode = v5->_countryCode;
    v5->_countryCode = (NSString *)v24;

    uint64_t v26 = [v4 escrowRecord];
    escrowRecord = v5->_escrowRecord;
    v5->_escrowRecord = (NSDictionary *)v26;

    uint64_t v28 = [v4 encodedMetadata];
    encodedMetadata = v5->_encodedMetadata;
    v5->_encodedMetadata = (NSString *)v28;

    uint64_t v30 = [v4 duplicateEncodedMetadata];
    duplicateEncodedMetadata = v5->_duplicateEncodedMetadata;
    v5->_duplicateEncodedMetadata = (NSString *)v30;

    uint64_t v32 = [v4 verificationToken];
    challengeCode = v5->_challengeCode;
    v5->_challengeCode = (NSString *)v32;

    uint64_t v34 = [v4 iCloudPassword];
    iCloudPassword = v5->_iCloudPassword;
    v5->_iCloudPassword = (NSString *)v34;

    uint64_t v36 = [v4 rawPassword];
    rawPassword = v5->_rawPassword;
    v5->_rawPassword = (NSString *)v36;

    uint64_t v38 = [v4 countryDialCode];
    countryDialCode = v5->_countryDialCode;
    v5->_countryDialCode = (NSString *)v38;

    uint64_t v40 = [v4 passphrase];
    recoveryPassphrase = v5->_recoveryPassphrase;
    v5->_recoveryPassphrase = (NSString *)v40;

    v5->_silentAttempt = [v4 silent];
    v5->_useRecoveryPET = [v4 useRecoveryPET];
    v5->_fmipRecovery = [v4 fmipRecovery];
    uint64_t v42 = [v4 fmipUUID];
    fmipUUID = v5->_fmipUUID;
    v5->_fmipUUID = (NSString *)v42;

    v5->_stingray = [v4 stingray];
    v5->_iCDP = [v4 icdp];
    v44 = [v4 activityUUID];
    uint64_t v45 = [v44 UUIDString];
    activityUUID = v5->_activityUUID;
    v5->_activityUUID = (NSString *)v45;

    uint64_t v47 = [v4 activityLabel];
    activityLabel = v5->_activityLabel;
    v5->_activityLabel = (NSString *)v47;

    v5->_silentDoubleRecovery = [v4 silentDoubleRecovery];
    v5->_nonViableRepair = [v4 nonViableRepair];
    uint64_t v49 = [v4 recoveryUUID];
    recoveryUUID = v5->_recoveryUUID;
    v5->_recoveryUUID = (NSString *)v49;

    uint64_t v51 = [v4 doubleRecoveryUUID];
    doubleRecoveryUUID = v5->_doubleRecoveryUUID;
    v5->_doubleRecoveryUUID = (NSString *)v51;

    v5->_recoveryResult = [v4 recoveryResult];
    uint64_t v53 = [v4 deviceSessionID];
    deviceSessionID = v5->_deviceSessionID;
    v5->_deviceSessionID = (NSString *)v53;

    uint64_t v55 = [v4 flowID];
    flowID = v5->_flowID;
    v5->_flowID = (NSString *)v55;

    v5->_guitarfish = [v4 guitarfish];
    v5->_guitarfishToken = [v4 guitarfishToken];
    uint64_t v57 = [v4 appleIDPasswordMetadata];
    appleIDPasswordMetadata = v5->_appleIDPasswordMetadata;
    v5->_appleIDPasswordMetadata = (AppleIDPasswordMetadata *)v57;

    v59 = [v4 queue];
    [(LakituRequest *)v5 setQueue:v59];
  }
  return v5;
}

- (id)loggingDescription
{
  if ([(EscrowGenericRequest *)self duplicate])
  {
    v7.receiver = self;
    v7.super_class = (Class)EscrowGenericRequest;
    v3 = [(LakituRequest *)&v7 loggingDescription];
    id v4 = [v3 stringByAppendingString:@" [DOUBLE]"];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)EscrowGenericRequest;
    id v4 = [(LakituRequest *)&v6 loggingDescription];
  }

  return v4;
}

- (NSString)recoveryPassphrase
{
  if ([(EscrowGenericRequest *)self guitarfish])
  {
    v3 = [(EscrowGenericRequest *)self rawPassword];

    if (!v3)
    {
      id v4 = CloudServicesLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        sub_100049D78();
      }
    }
    v5 = [(EscrowGenericRequest *)self rawPassword];
    goto LABEL_10;
  }
  if ([(EscrowGenericRequest *)self guitarfishToken]
    || [(EscrowGenericRequest *)self stingray])
  {
    v5 = [(EscrowGenericRequest *)self dsid];
LABEL_10:
    objc_super v6 = v5;
    goto LABEL_11;
  }
  if (![(EscrowGenericRequest *)self duplicate]
    || ([(EscrowGenericRequest *)self escrowRecord],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
    v5 = self->_recoveryPassphrase;
    goto LABEL_10;
  }
  v9 = [(EscrowGenericRequest *)self escrowRecord];
  objc_super v6 = [v9 objectForKeyedSubscript:@"DoubleEnrollmentPassword"];

  if (!v6)
  {
    uint64_t v10 = CloudServicesLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100049DB8();
    }
  }
LABEL_11:

  return (NSString *)v6;
}

- (id)currentAccount
{
  v3 = [(EscrowGenericRequest *)self cachedCurrentAccount];

  if (!v3)
  {
    id v4 = [(EscrowGenericRequest *)self requestDSID];
    v5 = +[LakituAccount personaAwareAccountWithDSID:v4];
    [(EscrowGenericRequest *)self setCachedCurrentAccount:v5];
  }

  return [(EscrowGenericRequest *)self cachedCurrentAccount];
}

- (NSString)dsid
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_dsid)
  {
    v3 = [(EscrowGenericRequest *)v2 currentAccount];
    uint64_t v4 = [v3 dsid];
    dsid = v2->_dsid;
    v2->_dsid = (NSString *)v4;
  }
  objc_sync_exit(v2);

  objc_super v6 = v2->_dsid;

  return v6;
}

- (NSString)authToken
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_authToken)
  {
    v3 = [(EscrowGenericRequest *)v2 currentAccount];
    uint64_t v4 = [v3 authToken];
    authToken = v2->_authToken;
    v2->_authToken = (NSString *)v4;
  }
  objc_sync_exit(v2);

  objc_super v6 = v2->_authToken;

  return v6;
}

- (NSString)baseURL
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_baseURL)
  {
    v3 = [(EscrowGenericRequest *)v2 currentAccount];
    uint64_t v4 = [v3 escrowURL];
    baseURL = v2->_baseURL;
    v2->_baseURL = (NSString *)v4;
  }
  objc_sync_exit(v2);

  objc_super v6 = v2->_baseURL;

  return v6;
}

- (NSString)altDSID
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(EscrowGenericRequest *)v2 currentAccount];
  uint64_t v4 = [v3 altDSID];

  objc_sync_exit(v2);

  return (NSString *)v4;
}

- (NSString)iCloudEnv
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_iCloudEnv)
  {
    v3 = [(EscrowGenericRequest *)v2 currentAccount];
    uint64_t v4 = [v3 iCloudEnv];
    iCloudEnv = v2->_iCloudEnv;
    v2->_iCloudEnv = (NSString *)v4;
  }
  objc_sync_exit(v2);

  objc_super v6 = v2->_iCloudEnv;

  return v6;
}

- (NSString)recordLabel
{
  if ([(EscrowGenericRequest *)self guitarfish])
  {
    if ([(EscrowGenericRequest *)self duplicate]) {
      sub_100049DEC();
    }
    v3 = (__CFString **)&kEscrowServiceGuitarfishLabel;
  }
  else if ([(EscrowGenericRequest *)self guitarfishToken])
  {
    if ([(EscrowGenericRequest *)self duplicate]) {
      sub_100049DEC();
    }
    v3 = (__CFString **)&kEscrowServiceGuitarfishTokenLabel;
  }
  else
  {
    if ([(EscrowGenericRequest *)self stingray])
    {
      unsigned int v4 = [(EscrowGenericRequest *)self duplicate];
      v3 = off_100071AE0;
      v5 = (__CFString **)&kEscrowServiceStingrayLabel;
    }
    else
    {
      if (![(EscrowGenericRequest *)self iCDP])
      {
        v3 = off_100071AD8;
        goto LABEL_15;
      }
      unsigned int v4 = [(EscrowGenericRequest *)self duplicate];
      v3 = off_100071AF0;
      v5 = off_100071AE8;
    }
    if (!v4) {
      v3 = v5;
    }
  }
LABEL_15:
  objc_super v6 = *v3;

  return (NSString *)v6;
}

- (id)validateInput
{
  v16.receiver = self;
  v16.super_class = (Class)EscrowGenericRequest;
  unsigned int v4 = [(LakituRequest *)&v16 validateInput];
  if (!v4)
  {
    v5 = [(EscrowGenericRequest *)self appleID];
    id v6 = [v5 length];
    if (v6)
    {
      v2 = [(EscrowGenericRequest *)self iCloudPassword];
      if ([v2 length])
      {

LABEL_9:
        uint64_t v10 = [(EscrowGenericRequest *)self baseURL];
        id v11 = [v10 length];

        if (v11)
        {
          unsigned int v4 = 0;
          goto LABEL_19;
        }
        unsigned int v4 = +[CloudServicesError errorWithCode:22 error:0 format:@"Missing base URL"];
        uint64_t v12 = CloudServicesLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Missing base URL", buf, 2u);
        }
        goto LABEL_18;
      }
    }
    objc_super v7 = [(EscrowGenericRequest *)self dsid];
    if ([v7 length])
    {
      uint64_t v8 = [(EscrowGenericRequest *)self authToken];
      id v9 = [v8 length];

      if (v6) {
      if (v9)
      }
        goto LABEL_9;
    }
    else
    {

      if (v6) {
    }
      }
    unsigned int v4 = +[CloudServicesError errorWithCode:311 error:0 format:@"No valid user found"];
    uint64_t v12 = CloudServicesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(EscrowGenericRequest *)self dsid];
      uint64_t v14 = [(EscrowGenericRequest *)self authToken];
      *(_DWORD *)buf = 138412546;
      uint64_t v18 = v13;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No user signed in: %@ %@", buf, 0x16u);
    }
LABEL_18:
  }
LABEL_19:

  return v4;
}

- (id)bodyDictionary
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v4 = [(LakituRequest *)self protocolVersion];
  [v3 setObject:v4 forKeyedSubscript:@"version"];

  v5 = [(EscrowGenericRequest *)self command];
  [v3 setObject:v5 forKeyedSubscript:@"command"];

  if ([(EscrowGenericRequest *)self guitarfish])
  {
    if ([(EscrowGenericRequest *)self duplicate]) {
      sub_100049DEC();
    }
    id v6 = (__CFString **)&kEscrowServiceGuitarfishLabel;
    goto LABEL_16;
  }
  if ([(EscrowGenericRequest *)self guitarfishToken])
  {
    if ([(EscrowGenericRequest *)self duplicate]) {
      sub_100049DEC();
    }
    id v6 = (__CFString **)&kEscrowServiceGuitarfishTokenLabel;
    goto LABEL_16;
  }
  if ([(EscrowGenericRequest *)self stingray])
  {
    unsigned int v7 = [(EscrowGenericRequest *)self duplicate];
    id v6 = off_100071AE0;
    if (!v7) {
      id v6 = (__CFString **)&kEscrowServiceStingrayLabel;
    }
    goto LABEL_16;
  }
  uint64_t v8 = [(EscrowGenericRequest *)self recordID];

  if (!v8)
  {
    id v6 = off_100071AD8;
LABEL_16:
    [v3 setObject:*v6 forKeyedSubscript:@"label"];
    goto LABEL_17;
  }
  unsigned int v9 = [(EscrowGenericRequest *)self duplicate];
  uint64_t v10 = @".double";
  if (!v9) {
    uint64_t v10 = &stru_100072CF8;
  }
  id v11 = v10;
  id v12 = objc_alloc((Class)NSString);
  v13 = [(EscrowGenericRequest *)self recordID];
  id v14 = [v12 initWithFormat:@"%@.%@%@", @"com.apple.icdp.record", v13, v11];

  [v3 setObject:v14 forKeyedSubscript:@"label"];
LABEL_17:
  if ([(EscrowGenericRequest *)self fmipRecovery]) {
    [v3 setObject:&__kCFBooleanTrue forKeyedSubscript:@"fmipRecovery"];
  }
  v15 = [(EscrowGenericRequest *)self fmipUUID];

  if (v15)
  {
    objc_super v16 = [(EscrowGenericRequest *)self fmipUUID];
    [v3 setObject:v16 forKeyedSubscript:@"fmipUUID"];
  }
  v17 = [(EscrowGenericRequest *)self activityUUID];
  [v3 setObject:v17 forKeyedSubscript:@"transactionUUID"];

  uint64_t v18 = [(EscrowGenericRequest *)self activityLabel];
  [v3 setObject:v18 forKeyedSubscript:@"userActionLabel"];

  return v3;
}

- (id)authorizationHeaderWithUser:(id)a3 password:(id)a4 authType:(id)a5
{
  id v7 = a5;
  uint64_t v8 = +[NSString stringWithFormat:@"%@:%@", a3, a4];
  unsigned int v9 = [v8 dataUsingEncoding:4];
  uint64_t v10 = [v9 base64EncodedStringWithOptions:0];

  if (sub_100004254())
  {
    id v11 = [v10 dataUsingEncoding:4];
    id v12 = CloudServicesLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [v11 sha1Digest];
      id v14 = [v13 hexString];
      *(_DWORD *)buf = 138412546;
      id v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "auth type %@, sha1 %@", buf, 0x16u);
    }
  }
  v15 = +[NSString stringWithFormat:@"%@ %@", v7, v10];

  return v15;
}

- (id)authorizationHeader
{
  id v3 = [(EscrowGenericRequest *)self appleID];
  uint64_t v4 = [(EscrowGenericRequest *)self iCloudPassword];
  v5 = (void *)v4;
  if (v3 && v4)
  {
    if ([(EscrowGenericRequest *)self useRecoveryPET]) {
      CFStringRef v6 = @"X-MobileMe-Recovery-PET";
    }
    else {
      CFStringRef v6 = @"Basic";
    }
  }
  else
  {
    uint64_t v7 = [(EscrowGenericRequest *)self dsid];

    uint64_t v8 = [(EscrowGenericRequest *)self authToken];

    CFStringRef v6 = @"X-MobileMe-AuthToken";
    id v3 = (void *)v7;
    v5 = (void *)v8;
  }
  unsigned int v9 = [(EscrowGenericRequest *)self authorizationHeaderWithUser:v3 password:v5 authType:v6];

  return v9;
}

- (id)urlRequest
{
  v10.receiver = self;
  v10.super_class = (Class)EscrowGenericRequest;
  id v3 = [(LakituRequest *)&v10 urlRequest];
  uint64_t v4 = [(EscrowGenericRequest *)self bodyDictionary];
  id v9 = 0;
  v5 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:100 options:0 error:&v9];
  id v6 = v9;

  if (v5)
  {
    [v3 setHTTPBody:v5];
  }
  else
  {
    uint64_t v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100049E08((uint64_t)v6, v7);
    }
  }
  [v3 setHTTPMethod:@"POST"];

  return v3;
}

- (id)urlString
{
  id v3 = [(EscrowGenericRequest *)self baseURL];
  uint64_t v4 = [(EscrowGenericRequest *)self command];
  v5 = [v4 lowercaseString];
  id v6 = [v3 stringByAppendingFormat:@"/escrowproxy/api/%@", v5];

  return v6;
}

- (id)_filteredMetadataForDoubleEnrollment:(id)a3
{
  id v3 = [a3 mutableCopy];
  v6[0] = kSecureBackupEscrowedSPKIKey;
  v6[1] = kSecureBackupBottleIDKey;
  uint64_t v4 = +[NSArray arrayWithObjects:v6 count:2];
  [v3 removeObjectsForKeys:v4];

  return v3;
}

- (id)additionalHeaders
{
  v10.receiver = self;
  v10.super_class = (Class)EscrowGenericRequest;
  id v3 = [(LakituRequest *)&v10 additionalHeaders];
  id v4 = [v3 mutableCopy];

  v5 = [(EscrowGenericRequest *)self deviceSessionID];

  if (v5)
  {
    id v6 = [(EscrowGenericRequest *)self deviceSessionID];
    [v4 setObject:v6 forKeyedSubscript:@"X-Apple-I-Device-Session-Id"];
  }
  uint64_t v7 = [(EscrowGenericRequest *)self flowID];

  if (v7)
  {
    uint64_t v8 = [(EscrowGenericRequest *)self flowID];
    [v4 setObject:v8 forKeyedSubscript:@"X-Apple-I-Flow-Id"];
  }
  if ([(EscrowGenericRequest *)self nonViableRepair]) {
    [v4 setObject:@"true" forKeyedSubscript:@"X-Apple-Non-Viable-Record-Repair"];
  }

  return v4;
}

+ (BOOL)pcsUpdateDisabled
{
  if (!sub_100004254() || !SecureBackupIsGuitarfishEnabled()) {
    return 0;
  }
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.cloudservices"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"PCS-UpdateDisabled"];

  return v3;
}

+ (BOOL)pcsNoRecord
{
  if (!sub_100004254() || !SecureBackupIsGuitarfishEnabled()) {
    return 0;
  }
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.cloudservices"];
  unsigned __int8 v3 = [v2 BOOLForKey:@"PCS-NoRecord"];

  return v3;
}

- (BOOL)isPcsRecord
{
  unsigned __int8 v3 = [(EscrowGenericRequest *)self recordLabel];
  if ([v3 isEqualToString:kEscrowServiceStingrayLabel])
  {
    unsigned __int8 v4 = 1;
  }
  else
  {
    v5 = [(EscrowGenericRequest *)self recordLabel];
    unsigned __int8 v4 = [v5 isEqualToString:@"com.apple.protectedcloudstorage.record.double"];
  }
  return v4;
}

- (void)_checkUpdateOperationWithHandler:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, void, void *))a3;
  if (+[EscrowGenericRequest pcsUpdateDisabled]
    && [(EscrowGenericRequest *)self isPcsRecord])
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = @"artificial error injected (com.apple.cloudservices/PCS-UpdateDisabled)";
    v5 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    id v6 = +[NSError errorWithDomain:@"EscrowProxyErrorDomain" code:-2004 userInfo:v5];

    uint64_t v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100049E80(self);
    }

    v4[2](v4, 0, v6);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EscrowGenericRequest;
    [(LakituRequest *)&v8 performRequestWithHandler:v4];
  }
}

- (void)_checkReadOperationWithHandler:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, void, void *))a3;
  if (+[EscrowGenericRequest pcsNoRecord]
    && [(EscrowGenericRequest *)self isPcsRecord])
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = @"artificial error injected (com.apple.cloudservices/PCS-NoRecord)";
    v5 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    id v6 = +[NSError errorWithDomain:@"EscrowProxyErrorDomain" code:-2003 userInfo:v5];

    uint64_t v7 = CloudServicesLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100049F24(self);
    }

    v4[2](v4, 0, v6);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EscrowGenericRequest;
    [(LakituRequest *)&v8 performRequestWithHandler:v4];
  }
}

- (void)_checkFetchOperationWithHandler:(id)a3
{
  id v4 = a3;
  if (+[EscrowGenericRequest pcsNoRecord])
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    void v6[2] = sub_10000DDE0;
    v6[3] = &unk_1000710E0;
    id v7 = v4;
    v5.receiver = self;
    v5.super_class = (Class)EscrowGenericRequest;
    [(LakituRequest *)&v5 performRequestWithHandler:v6];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)EscrowGenericRequest;
    [(LakituRequest *)&v8 performRequestWithHandler:v4];
  }
}

- (NSDictionary)escrowRecord
{
  return self->_escrowRecord;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSString)encodedMetadata
{
  return self->_encodedMetadata;
}

- (void)setEncodedMetadata:(id)a3
{
}

- (NSString)duplicateEncodedMetadata
{
  return self->_duplicateEncodedMetadata;
}

- (void)setDuplicateEncodedMetadata:(id)a3
{
}

- (NSNumber)protocol
{
  return self->_protocol;
}

- (NSString)command
{
  return self->_command;
}

- (NSString)countryDialCode
{
  return self->_countryDialCode;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSString)challengeCode
{
  return self->_challengeCode;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)iCloudPassword
{
  return self->_iCloudPassword;
}

- (NSString)rawPassword
{
  return self->_rawPassword;
}

- (NSString)recordID
{
  return self->_recordID;
}

- (BOOL)stingray
{
  return self->_stingray;
}

- (BOOL)iCDP
{
  return self->_iCDP;
}

- (BOOL)silentAttempt
{
  return self->_silentAttempt;
}

- (BOOL)useRecoveryPET
{
  return self->_useRecoveryPET;
}

- (BOOL)fmipRecovery
{
  return self->_fmipRecovery;
}

- (BOOL)silentDoubleRecovery
{
  return self->_silentDoubleRecovery;
}

- (BOOL)nonViableRepair
{
  return self->_nonViableRepair;
}

- (NSData)blob
{
  return self->_blob;
}

- (void)setBlob:(id)a3
{
}

- (NSArray)baseRootCertVersions
{
  return self->_baseRootCertVersions;
}

- (void)setBaseRootCertVersions:(id)a3
{
}

- (NSArray)trustedRootCertVersions
{
  return self->_trustedRootCertVersions;
}

- (void)setTrustedRootCertVersions:(id)a3
{
}

- (NSString)bypassToken
{
  return self->_bypassToken;
}

- (void)setBypassToken:(id)a3
{
}

- (NSString)fmipUUID
{
  return self->_fmipUUID;
}

- (void)setFmipUUID:(id)a3
{
}

- (NSString)activityUUID
{
  return self->_activityUUID;
}

- (void)setActivityUUID:(id)a3
{
}

- (NSString)activityLabel
{
  return self->_activityLabel;
}

- (void)setActivityLabel:(id)a3
{
}

- (BOOL)duplicate
{
  return self->_duplicate;
}

- (void)setDuplicate:(BOOL)a3
{
  self->_duplicate = a3;
}

- (NSString)recoveryUUID
{
  return self->_recoveryUUID;
}

- (void)setRecoveryUUID:(id)a3
{
}

- (NSString)doubleRecoveryUUID
{
  return self->_doubleRecoveryUUID;
}

- (void)setDoubleRecoveryUUID:(id)a3
{
}

- (BOOL)recoveryResult
{
  return self->_recoveryResult;
}

- (void)setRecoveryResult:(BOOL)a3
{
  self->_recoveryResult = a3;
}

- (NSString)deviceSessionID
{
  return self->_deviceSessionID;
}

- (NSString)flowID
{
  return self->_flowID;
}

- (BOOL)guitarfish
{
  return self->_guitarfish;
}

- (BOOL)guitarfishToken
{
  return self->_guitarfishToken;
}

- (AppleIDPasswordMetadata)appleIDPasswordMetadata
{
  return self->_appleIDPasswordMetadata;
}

- (LakituAccount)cachedCurrentAccount
{
  return self->_cachedCurrentAccount;
}

- (void)setCachedCurrentAccount:(id)a3
{
}

- (NSString)requestDSID
{
  return self->_requestDSID;
}

- (void)setRequestDSID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestDSID, 0);
  objc_storeStrong((id *)&self->_cachedCurrentAccount, 0);
  objc_storeStrong((id *)&self->_appleIDPasswordMetadata, 0);
  objc_storeStrong((id *)&self->_flowID, 0);
  objc_storeStrong((id *)&self->_deviceSessionID, 0);
  objc_storeStrong((id *)&self->_doubleRecoveryUUID, 0);
  objc_storeStrong((id *)&self->_recoveryUUID, 0);
  objc_storeStrong((id *)&self->_activityLabel, 0);
  objc_storeStrong((id *)&self->_activityUUID, 0);
  objc_storeStrong((id *)&self->_fmipUUID, 0);
  objc_storeStrong((id *)&self->_bypassToken, 0);
  objc_storeStrong((id *)&self->_trustedRootCertVersions, 0);
  objc_storeStrong((id *)&self->_baseRootCertVersions, 0);
  objc_storeStrong((id *)&self->_blob, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_rawPassword, 0);
  objc_storeStrong((id *)&self->_iCloudPassword, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_challengeCode, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_countryDialCode, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_duplicateEncodedMetadata, 0);
  objc_storeStrong((id *)&self->_encodedMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_escrowRecord, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_authToken, 0);
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_iCloudEnv, 0);

  objc_storeStrong((id *)&self->_recoveryPassphrase, 0);
}

@end