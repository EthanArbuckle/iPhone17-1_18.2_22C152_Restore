@interface ADAccount
+ (BOOL)setActiveAccountIdentifier:(id)a3;
+ (id)_accountForIdentifier:(id)a3 infoDictionary:(id)a4 intanceContext:(id)a5 isReadOnly:(BOOL)a6 isCoupledToHost:(BOOL)a7;
+ (id)accountForIdentifier:(id)a3;
+ (id)activeAccount;
+ (id)activeAccountForInstanceContext:(id)a3;
- (ADAccount)init;
- (ADAccount)initWithMessageDictionary:(id)a3;
- (AFInstanceContext)instanceContext;
- (BOOL)_onQueueSetKeychainValue:(id)a3 forKey:(id)a4;
- (BOOL)_setKeychainValueSync:(id)a3 forKey:(id)a4;
- (BOOL)hasConnectionPolicyFailed;
- (BOOL)isReadOnly;
- (BOOL)needsCreation;
- (BOOL)needsDestruction;
- (BOOL)peerSiriEnabled;
- (BOOL)setLocalCryptoKeyData:(id)a3;
- (BOOL)setValidationDataSync:(id)a3;
- (BOOL)watchExistsForAssistantId:(id)a3;
- (NSDate)connectionPolicyDate;
- (NSDate)connectionPolicyFirstFailureDate;
- (NSDate)validationExpiration;
- (NSDictionary)connectionPolicy;
- (NSNumber)validationVersion;
- (NSString)aceHost;
- (NSString)assistantIdentifier;
- (NSString)connectionPolicyHostname;
- (NSString)group;
- (NSString)hostname;
- (NSString)identifier;
- (NSString)label;
- (NSString)lastAssistantDataAnchor;
- (NSString)localeIdentifier;
- (NSString)loggingAssistantIdentifier;
- (NSString)peerAssistantIdentifier;
- (NSString)peerHostname;
- (NSString)peerLanguageCode;
- (NSString)peerLoggingAssistantIdentifier;
- (NSString)peerSpeechIdentifier;
- (NSString)peerUserAgentString;
- (NSString)predefinedServer;
- (NSString)speechIdentifier;
- (id)_hostnameOverride;
- (id)_hostnameQAOverride;
- (id)_infoDictionaryForPreferences;
- (id)_keychainValueForKey:(id)a3;
- (id)_preferences;
- (id)_serverOverrideFromPreferences;
- (id)aceHostCluster;
- (id)connectionPolicyExpirationDate;
- (id)description;
- (id)localCryptoKeyData;
- (id)messageDictionary;
- (id)pairedWatches;
- (id)saConnectionPolicy;
- (id)saRemoteDevice:(id)a3;
- (id)serverCertificateData;
- (id)validationData;
- (int64_t)connectionPolicyStatus;
- (unint64_t)connectionPolicyFailureCount;
- (void)_markKeychainValuesAsDirty;
- (void)_removeKeychainValueForKey:(id)a3;
- (void)_setKeychainValue:(id)a3 forKey:(id)a4;
- (void)clearAssistantData;
- (void)clearAssistantDataDuringForcedRedirect;
- (void)removeAndSave;
- (void)resetCachedHostname;
- (void)save;
- (void)setAceHost:(id)a3;
- (void)setAssistantIdentifier:(id)a3;
- (void)setConnectionPolicy:(id)a3;
- (void)setConnectionPolicyDate:(id)a3;
- (void)setConnectionPolicyFailureCount:(unint64_t)a3;
- (void)setConnectionPolicyFirstFailureDate:(id)a3;
- (void)setConnectionPolicyHostname:(id)a3;
- (void)setGroup:(id)a3;
- (void)setHostname:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInstanceContext:(id)a3;
- (void)setIsReadOnly:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLastAssistantDataAnchor:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setLoggingAssistantIdentifier:(id)a3;
- (void)setNeedsCreation:(BOOL)a3;
- (void)setNeedsDestruction:(BOOL)a3;
- (void)setPairedWatches:(id)a3;
- (void)setPeerAssistantIdentifier:(id)a3;
- (void)setPeerHostname:(id)a3;
- (void)setPeerLanguageCode:(id)a3;
- (void)setPeerLoggingAssistantIdentifier:(id)a3;
- (void)setPeerSiriEnabled:(BOOL)a3;
- (void)setPeerSpeechIdentifier:(id)a3;
- (void)setPeerUserAgentString:(id)a3;
- (void)setPredefinedServer:(id)a3;
- (void)setServerCertificateData:(id)a3;
- (void)setSpeechIdentifier:(id)a3;
- (void)setValidationData:(id)a3;
- (void)setValidationExpiration:(id)a3;
- (void)setValidationVersion:(id)a3;
- (void)updateAssistantIdentifiers;
- (void)updateGizmoData:(id)a3 forUniqueId:(id)a4;
@end

@implementation ADAccount

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_connectionPolicyFirstFailureDate, 0);
  objc_storeStrong((id *)&self->_validationVersion, 0);
  objc_storeStrong((id *)&self->_validationExpiration, 0);
  objc_storeStrong((id *)&self->_lastAssistantDataAnchor, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_connectionPolicyHostname, 0);
  objc_storeStrong((id *)&self->_connectionPolicyDate, 0);
  objc_storeStrong((id *)&self->_connectionPolicy, 0);
  objc_storeStrong((id *)&self->_aceHost, 0);
  objc_storeStrong((id *)&self->_predefinedServer, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_speechIdentifier, 0);
  objc_storeStrong((id *)&self->_loggingAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_pairedWatches, 0);
  objc_storeStrong((id *)&self->_keychainQueue, 0);
  objc_storeStrong((id *)&self->_cachedHostnameQAOverride, 0);
  objc_storeStrong((id *)&self->_cachedLocalCryptoKeyData, 0);
  objc_storeStrong((id *)&self->_cachedValidationData, 0);
  objc_storeStrong((id *)&self->_cachedServerCertificateData, 0);
  objc_storeStrong((id *)&self->_cachedHostname, 0);
  objc_storeStrong((id *)&self->_peerLanguageCode, 0);
  objc_storeStrong((id *)&self->_peerHostname, 0);
  objc_storeStrong((id *)&self->_peerUserAgentString, 0);
  objc_storeStrong((id *)&self->_peerSpeechIdentifier, 0);
  objc_storeStrong((id *)&self->_peerLoggingAssistantIdentifier, 0);
  objc_storeStrong((id *)&self->_peerAssistantIdentifier, 0);
}

- (void)setInstanceContext:(id)a3
{
}

- (AFInstanceContext)instanceContext
{
  return self->_instanceContext;
}

- (void)setIsReadOnly:(BOOL)a3
{
  self->_isReadOnly = a3;
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (void)setConnectionPolicyFirstFailureDate:(id)a3
{
}

- (NSDate)connectionPolicyFirstFailureDate
{
  return self->_connectionPolicyFirstFailureDate;
}

- (void)setConnectionPolicyFailureCount:(unint64_t)a3
{
  self->_connectionPolicyFailureCount = a3;
}

- (unint64_t)connectionPolicyFailureCount
{
  return self->_connectionPolicyFailureCount;
}

- (void)setNeedsDestruction:(BOOL)a3
{
  self->_needsDestruction = a3;
}

- (BOOL)needsDestruction
{
  return self->_needsDestruction;
}

- (void)setNeedsCreation:(BOOL)a3
{
  self->_needsCreation = a3;
}

- (BOOL)needsCreation
{
  return self->_needsCreation;
}

- (void)setValidationVersion:(id)a3
{
}

- (NSNumber)validationVersion
{
  return self->_validationVersion;
}

- (NSDate)validationExpiration
{
  return self->_validationExpiration;
}

- (void)setLastAssistantDataAnchor:(id)a3
{
}

- (NSString)lastAssistantDataAnchor
{
  return self->_lastAssistantDataAnchor;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (void)setConnectionPolicyHostname:(id)a3
{
}

- (NSString)connectionPolicyHostname
{
  return self->_connectionPolicyHostname;
}

- (void)setConnectionPolicyDate:(id)a3
{
}

- (NSDate)connectionPolicyDate
{
  return self->_connectionPolicyDate;
}

- (void)setConnectionPolicy:(id)a3
{
}

- (NSDictionary)connectionPolicy
{
  return self->_connectionPolicy;
}

- (void)setAceHost:(id)a3
{
}

- (NSString)aceHost
{
  return self->_aceHost;
}

- (void)setPredefinedServer:(id)a3
{
}

- (NSString)predefinedServer
{
  return self->_predefinedServer;
}

- (void)setGroup:(id)a3
{
}

- (NSString)group
{
  return self->_group;
}

- (NSString)speechIdentifier
{
  return self->_speechIdentifier;
}

- (NSString)loggingAssistantIdentifier
{
  return self->_loggingAssistantIdentifier;
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setIdentifier:(id)a3
{
}

- (void)removeAndSave
{
  if (self->_identifier)
  {
    if (self->_isReadOnly)
    {
      v3 = (void *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        v4 = v3;
        v5 = [(ADAccount *)self identifier];
        *(_DWORD *)buf = 136315394;
        v8 = "-[ADAccount removeAndSave]";
        __int16 v9 = 2112;
        v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s Unable to remove and save account info %@ because it is read only.", buf, 0x16u);
      }
    }
    else
    {
      id v6 = [(ADAccount *)self _preferences];
      [v6 setAccountInfo:0 forIdentifier:self->_identifier];
      [v6 synchronize];
      [(ADAccount *)self setServerCertificateData:0];
      [(ADAccount *)self setValidationData:0];
      [(ADAccount *)self setLocalCryptoKeyData:0];
      [(ADAccount *)self _removeKeychainValueForKey:@"Assistant Identifier"];
      [(ADAccount *)self _removeKeychainValueForKey:@"Logging Assistant Identifier"];
      [(ADAccount *)self _removeKeychainValueForKey:@"Speech Identifier"];
      if ((AFIsNano() & 1) != 0 || AFIsHorseman())
      {
        [(ADAccount *)self _removeKeychainValueForKey:@"Peer Assistant Identifier"];
        [(ADAccount *)self _removeKeychainValueForKey:@"Peer Logging Assistant Identifier"];
        [(ADAccount *)self _removeKeychainValueForKey:@"Peer Speech Identifier"];
        [(ADAccount *)self _removeKeychainValueForKey:@"Peer User Agent String"];
        [(ADAccount *)self _removeKeychainValueForKey:@"Peer Language Code"];
        [(ADAccount *)self _removeKeychainValueForKey:@"Peer Siri Enabled"];
      }
      if (AFSupportsPairedDevice() && (AFIsNano() & 1) == 0) {
        [(ADAccount *)self _removeKeychainValueForKey:@"Watch Data Exists"];
      }
      [(ADAccount *)self _markKeychainValuesAsDirty];
    }
  }
}

- (void)save
{
  BOOL isReadOnly = self->_isReadOnly;
  v4 = (void *)AFSiriLogContextDaemon;
  BOOL v5 = os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO);
  if (isReadOnly)
  {
    if (!v5) {
      return;
    }
    id v6 = v4;
    v7 = [(ADAccount *)self identifier];
    int v28 = 136315394;
    v29 = "-[ADAccount save]";
    __int16 v30 = 2112;
    v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Unable to save account info %@ because it is read only.", (uint8_t *)&v28, 0x16u);
  }
  else
  {
    if (v5)
    {
      v8 = v4;
      __int16 v9 = [(ADAccount *)self identifier];
      int v28 = 136315394;
      v29 = "-[ADAccount save]";
      __int16 v30 = 2112;
      v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Saving account info %@", (uint8_t *)&v28, 0x16u);
    }
    id v6 = [(ADAccount *)self _preferences];
    v10 = [(ADAccount *)self identifier];
    v11 = [v6 accountInfoForIdentifier:v10];

    if (v11)
    {
      v12 = [v11 valueForKey:@"Assistant Identifier"];
      v13 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        assistantIdentifier = self->_assistantIdentifier;
        int v28 = 136315651;
        v29 = "-[ADAccount save]";
        __int16 v30 = 2113;
        v31 = v12;
        __int16 v32 = 2113;
        v33 = assistantIdentifier;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s oldAssistantID:%{private}@\tnewAssistantID:%{private}@", (uint8_t *)&v28, 0x20u);
      }
      v15 = self->_assistantIdentifier;
      BOOL v16 = !v12 && v15 || ([v12 isEqualToString:v15] & 1) == 0;
      v18 = [v11 valueForKey:@"Speech Identifier"];
      v19 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        speechIdentifier = self->_speechIdentifier;
        int v28 = 136315651;
        v29 = "-[ADAccount save]";
        __int16 v30 = 2113;
        v31 = v18;
        __int16 v32 = 2113;
        v33 = speechIdentifier;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%s oldSpeechID:%{private}@\tnewSpeechID:%{private}@", (uint8_t *)&v28, 0x20u);
      }
      v21 = self->_speechIdentifier;
      BOOL v17 = !v18 && v21 || ([v18 isEqualToString:v21] & 1) == 0;
    }
    else
    {
      BOOL v17 = 1;
      BOOL v16 = 1;
    }
    v22 = [(ADAccount *)self _infoDictionaryForPreferences];
    v23 = [(ADAccount *)self identifier];
    [v6 setAccountInfo:v22 forIdentifier:v23];

    [v6 synchronize];
    if (self->_sharedDataChanged)
    {
      v24 = +[NSNotificationCenter defaultCenter];
      [v24 postNotificationName:@"ADSharedDataDidChangeNotification" object:0];

      self->_sharedDataChanged = 0;
    }
    if (v16)
    {
      v25 = +[NSNotificationCenter defaultCenter];
      [v25 postNotificationName:@"ADActiveAccountIdentifierDidChangeNotification" object:0];

      if (self->_assistantIdentifier)
      {
        v26 = +[NSNotificationCenter defaultCenter];
        [v26 postNotificationName:@"AssistantAccountCreated" object:0];
      }
    }
    if (v17)
    {
      v27 = objc_alloc_init(ADAnalyticsFBFDeliveryInfrastructure);
      [(ADAnalyticsFBFDeliveryInfrastructure *)v27 deliverLogViewerIdentifier:self->_speechIdentifier];
    }
  }
}

- (void)updateAssistantIdentifiers
{
  v3 = +[NSUUID UUID];
  v4 = [v3 UUIDString];

  BOOL v5 = +[NSUUID UUID];
  id v6 = [v5 UUIDString];

  v7 = +[NSUUID UUID];
  v8 = [v7 UUIDString];

  [(ADAccount *)self setAssistantIdentifier:v4];
  [(ADAccount *)self setLoggingAssistantIdentifier:v6];
  [(ADAccount *)self setSpeechIdentifier:v8];
  __int16 v9 = AFSiriLogContextSession;
  if (os_log_type_enabled(AFSiriLogContextSession, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315906;
    v11 = "-[ADAccount updateAssistantIdentifiers]";
    __int16 v12 = 2112;
    v13 = v4;
    __int16 v14 = 2112;
    v15 = v6;
    __int16 v16 = 2112;
    BOOL v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s assistantId created: %@ loggingAssistantId: %@ speechId: %@", (uint8_t *)&v10, 0x2Au);
  }
}

- (id)_infoDictionaryForPreferences
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = v3;
  label = self->_label;
  if (label) {
    [v3 setObject:label forKey:@"Label"];
  }
  hostname = self->_hostname;
  if (hostname) {
    [v4 setObject:hostname forKey:@"Hostname"];
  }
  group = self->_group;
  if (group) {
    [v4 setObject:group forKey:@"Group"];
  }
  predefinedServer = self->_predefinedServer;
  if (predefinedServer) {
    [v4 setObject:predefinedServer forKey:@"Predefined Server"];
  }
  aceHost = self->_aceHost;
  if (aceHost) {
    [v4 setObject:aceHost forKey:@"Ace Host"];
  }
  connectionPolicy = self->_connectionPolicy;
  if (connectionPolicy) {
    [v4 setObject:connectionPolicy forKey:@"Connection Policy"];
  }
  connectionPolicyDate = self->_connectionPolicyDate;
  if (connectionPolicyDate) {
    [v4 setObject:connectionPolicyDate forKey:@"Connection Policy Date"];
  }
  connectionPolicyFirstFailureDate = self->_connectionPolicyFirstFailureDate;
  if (connectionPolicyFirstFailureDate) {
    [v4 setObject:connectionPolicyFirstFailureDate forKey:@"Connection Policy First Failure Date"];
  }
  connectionPolicyHostname = self->_connectionPolicyHostname;
  if (connectionPolicyHostname) {
    [v4 setObject:connectionPolicyHostname forKey:@"Connection Policy Hostname"];
  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier) {
    [v4 setObject:localeIdentifier forKey:@"Locale Identifier"];
  }
  lastAssistantDataAnchor = self->_lastAssistantDataAnchor;
  if (lastAssistantDataAnchor) {
    [v4 setObject:lastAssistantDataAnchor forKey:@"Last Assistant Data Anchor"];
  }
  validationExpiration = self->_validationExpiration;
  if (validationExpiration) {
    [v4 setObject:validationExpiration forKey:@"Validation Expiration"];
  }
  validationVersion = self->_validationVersion;
  if (validationVersion) {
    [v4 setObject:validationVersion forKey:@"Validation Version"];
  }
  peerHostname = self->_peerHostname;
  if (peerHostname) {
    [v4 setObject:peerHostname forKey:@"Peer Hostname"];
  }
  if (self->_needsCreation)
  {
    v19 = +[NSNumber numberWithBool:1];
    [v4 setObject:v19 forKey:@"Needs Creation"];
  }
  if (self->_needsDestruction)
  {
    v20 = +[NSNumber numberWithBool:1];
    [v4 setObject:v20 forKey:@"Needs Destruction"];
  }
  v21 = AFBuildVersion();
  if (v21) {
    [v4 setObject:v21 forKey:@"Build Version"];
  }
  if (self->_identifier)
  {
    v22 = self->_assistantIdentifier;
    v23 = self->_loggingAssistantIdentifier;
    v24 = self->_speechIdentifier;
    v41 = self->_peerAssistantIdentifier;
    v25 = self->_peerLoggingAssistantIdentifier;
    v26 = self->_peerSpeechIdentifier;
    v27 = self->_peerUserAgentString;
    v43 = v21;
    int v28 = self->_peerLanguageCode;
    BOOL peerSiriEnabled = self->_peerSiriEnabled;
    __int16 v30 = [(ADAccount *)self pairedWatches];
    queue = self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A9244;
    block[3] = &unk_100506030;
    block[4] = self;
    v49 = v22;
    v31 = v22;
    v50 = v23;
    v51 = v24;
    v52 = v41;
    v53 = v25;
    v54 = v26;
    v55 = v27;
    BOOL v58 = peerSiriEnabled;
    v56 = v28;
    id v57 = v30;
    id v47 = v30;
    __int16 v32 = v28;
    v21 = v43;
    v46 = v32;
    v45 = v27;
    v44 = v26;
    v33 = v25;
    v34 = v41;
    v35 = v24;
    v36 = v23;
    v37 = v31;
    dispatch_async(queue, block);
  }
  if ([v4 count]) {
    v38 = v4;
  }
  else {
    v38 = 0;
  }
  id v39 = v38;

  return v39;
}

- (id)_preferences
{
  instanceContext = self->_instanceContext;
  if (!instanceContext || [(AFInstanceContext *)instanceContext isCurrent])
  {
    v4 = +[ADPreferences sharedPreferences];
  }
  else
  {
    v4 = [[ADPreferences alloc] initWithInstanceContext:self->_instanceContext];
  }
  return v4;
}

- (BOOL)_setKeychainValueSync:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isReadOnly || !self->_identifier)
  {
    BOOL v8 = 0;
  }
  else
  {
    uint64_t v16 = 0;
    BOOL v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    keychainQueue = self->_keychainQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000A978C;
    v11[3] = &unk_1005072F0;
    v15 = &v16;
    id v12 = v6;
    v13 = self;
    id v14 = v7;
    dispatch_sync(keychainQueue, v11);
    BOOL v8 = *((unsigned char *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }

  return v8;
}

- (BOOL)_onQueueSetKeychainValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_keychainQueue);
  if (self->_isReadOnly || !self->_identifier) {
    char v8 = 0;
  }
  else {
    char v8 = AFKeychainSetValueForAccountAndKey();
  }

  return v8;
}

- (void)_setKeychainValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_isReadOnly && self->_identifier)
  {
    keychainQueue = self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A9914;
    block[3] = &unk_10050DCB8;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(keychainQueue, block);
  }
}

- (void)_removeKeychainValueForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (!self->_isReadOnly)
  {
    keychainQueue = self->_keychainQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000A99D0;
    v7[3] = &unk_10050E160;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(keychainQueue, v7);
  }
}

- (id)_keychainValueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1000A9AEC;
  uint64_t v16 = sub_1000A9AFC;
  id v17 = 0;
  keychainQueue = self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A9B04;
  block[3] = &unk_10050C700;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(keychainQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)_markKeychainValuesAsDirty
{
  keychainQueue = self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A9BC8;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(keychainQueue, block);
}

- (id)aceHostCluster
{
  v2 = [(ADAccount *)self aceHost];
  id v3 = [v2 componentsSeparatedByString:@":"];
  id v4 = [v3 firstObject];

  return v4;
}

- (void)clearAssistantDataDuringForcedRedirect
{
  [(ADAccount *)self resetCachedHostname];
  [(ADAccount *)self setAceHost:0];
  [(ADAccount *)self setConnectionPolicy:0];
  [(ADAccount *)self setConnectionPolicyDate:0];
  [(ADAccount *)self setConnectionPolicyHostname:0];
  [(ADAccount *)self setLastAssistantDataAnchor:0];
  [(ADAccount *)self setNeedsCreation:0];
  [(ADAccount *)self setNeedsDestruction:0];
  [(ADAccount *)self setConnectionPolicyFailureCount:0];
  [(ADAccount *)self setConnectionPolicyFirstFailureDate:0];
}

- (void)clearAssistantData
{
  [(ADAccount *)self setAssistantIdentifier:0];
  [(ADAccount *)self setLoggingAssistantIdentifier:0];
  [(ADAccount *)self setSpeechIdentifier:0];
  [(ADAccount *)self setAceHost:0];
  [(ADAccount *)self setConnectionPolicy:0];
  [(ADAccount *)self setConnectionPolicyDate:0];
  [(ADAccount *)self setConnectionPolicyHostname:0];
  [(ADAccount *)self setLastAssistantDataAnchor:0];
  [(ADAccount *)self setNeedsCreation:0];
  [(ADAccount *)self setNeedsDestruction:0];
  [(ADAccount *)self setConnectionPolicyFailureCount:0];
  [(ADAccount *)self setConnectionPolicyFirstFailureDate:0];
  id v3 = [(ADAccount *)self _preferences];
  [v3 setCountryCode:0];
}

- (BOOL)setLocalCryptoKeyData:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ADAccount *)self _setKeychainValueSync:v4 forKey:@"Local Crypto Key Data"];
  if (v5)
  {
    id v6 = (NSData *)[v4 copy];
    cachedLocalCryptoKeyData = self->_cachedLocalCryptoKeyData;
    self->_cachedLocalCryptoKeyData = v6;
  }
  return v5;
}

- (id)localCryptoKeyData
{
  cachedLocalCryptoKeyData = self->_cachedLocalCryptoKeyData;
  if (!cachedLocalCryptoKeyData)
  {
    id v4 = [(ADAccount *)self _keychainValueForKey:@"Local Crypto Key Data"];
    BOOL v5 = (NSData *)[v4 copy];
    id v6 = self->_cachedLocalCryptoKeyData;
    self->_cachedLocalCryptoKeyData = v5;

    cachedLocalCryptoKeyData = self->_cachedLocalCryptoKeyData;
  }
  return cachedLocalCryptoKeyData;
}

- (void)setValidationExpiration:(id)a3
{
  self->_validationExpiration = (NSDate *)[a3 copy];
  _objc_release_x1();
}

- (BOOL)setValidationDataSync:(id)a3
{
  id v4 = a3;
  BOOL v5 = (NSData *)[v4 copy];
  cachedValidationData = self->_cachedValidationData;
  self->_cachedValidationData = v5;

  LOBYTE(self) = [(ADAccount *)self _setKeychainValueSync:v4 forKey:@"Validation Data"];
  return (char)self;
}

- (void)setValidationData:(id)a3
{
  id v6 = a3;
  id v4 = (NSData *)[v6 copy];
  cachedValidationData = self->_cachedValidationData;
  self->_cachedValidationData = v4;

  [(ADAccount *)self _setKeychainValue:v6 forKey:@"Validation Data"];
}

- (id)validationData
{
  cachedValidationData = self->_cachedValidationData;
  if (!cachedValidationData)
  {
    id v4 = [(ADAccount *)self _keychainValueForKey:@"Validation Data"];
    BOOL v5 = (NSData *)[v4 copy];
    id v6 = self->_cachedValidationData;
    self->_cachedValidationData = v5;

    cachedValidationData = self->_cachedValidationData;
  }
  return cachedValidationData;
}

- (void)setServerCertificateData:(id)a3
{
  id v6 = a3;
  id v4 = (NSData *)[v6 copy];
  cachedServerCertificateData = self->_cachedServerCertificateData;
  self->_cachedServerCertificateData = v4;

  [(ADAccount *)self _setKeychainValue:v6 forKey:@"Server Certificate Data"];
}

- (id)serverCertificateData
{
  cachedServerCertificateData = self->_cachedServerCertificateData;
  if (!cachedServerCertificateData)
  {
    id v4 = [(ADAccount *)self _keychainValueForKey:@"Server Certificate Data"];
    BOOL v5 = (NSData *)[v4 copy];
    id v6 = self->_cachedServerCertificateData;
    self->_cachedServerCertificateData = v5;

    cachedServerCertificateData = self->_cachedServerCertificateData;
  }
  return cachedServerCertificateData;
}

- (NSString)localeIdentifier
{
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier)
  {
    id v3 = localeIdentifier;
  }
  else
  {
    id v4 = +[NSLocale autoupdatingCurrentLocale];
    id v3 = [v4 localeIdentifier];
  }
  return v3;
}

- (void)resetCachedHostname
{
  cachedHostname = self->_cachedHostname;
  self->_cachedHostname = 0;

  self->_hasCachedHostnameQAOverride = 0;
}

- (void)setHostname:(id)a3
{
  id v4 = (NSString *)a3;
  hostname = self->_hostname;
  if (hostname != v4)
  {
    id v8 = v4;
    if (![(NSString *)hostname isEqualToString:v4])
    {
      id v6 = (NSString *)[(NSString *)v8 copy];
      id v7 = self->_hostname;
      self->_hostname = v6;

      [(ADAccount *)self resetCachedHostname];
    }
  }
  _objc_release_x1();
}

- (NSString)hostname
{
  cachedHostname = self->_cachedHostname;
  if (cachedHostname)
  {
    id v3 = cachedHostname;
  }
  else
  {
    if (AFIsInternalInstall())
    {
      BOOL v5 = [(ADAccount *)self _hostnameOverride];
      hostname = v5;
      if (v5 || (hostname = self->_hostname) != 0) {
        id v7 = hostname;
      }
      else {
        id v7 = @"https://guzzoni.apple.com";
      }
    }
    else
    {
      id v7 = @"https://guzzoni.apple.com";
    }
    uint64_t v8 = [(ADAccount *)self _hostnameQAOverride];
    __int16 v9 = (void *)v8;
    if (v8) {
      id v10 = (void *)v8;
    }
    else {
      id v10 = v7;
    }
    id v11 = v10;

    uint64_t v12 = (NSString *)[v11 copy];
    v13 = self->_cachedHostname;
    self->_cachedHostname = v12;

    id v3 = self->_cachedHostname;
  }
  return v3;
}

- (id)_serverOverrideFromPreferences
{
  v2 = [(ADAccount *)self _preferences];
  id v3 = [v2 serverOverride];

  return v3;
}

- (id)_hostnameQAOverride
{
  if (self->_hasCachedHostnameQAOverride)
  {
    id v3 = self->_cachedHostnameQAOverride;
  }
  else
  {
    id v4 = [(ADAccount *)self _serverOverrideFromPreferences];
    BOOL v5 = v4;
    if (v4)
    {
      if (([v4 hasSuffix:@"apple.com"] & 1) != 0
        || ([v5 rangeOfString:@"apple.com:"], v6))
      {
        id v7 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v12 = 136315394;
          v13 = "-[ADAccount _hostnameQAOverride]";
          __int16 v14 = 2112;
          v15 = v5;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Using Server Override %@", (uint8_t *)&v12, 0x16u);
        }
      }
      else
      {
        uint64_t v8 = AFSiriLogContextDaemon;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
        {
          int v12 = 136315394;
          v13 = "-[ADAccount _hostnameQAOverride]";
          __int16 v14 = 2112;
          v15 = v5;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Bad server override %@", (uint8_t *)&v12, 0x16u);
        }

        BOOL v5 = 0;
      }
    }
    self->_hasCachedHostnameQAOverride = 1;
    cachedHostnameQAOverride = self->_cachedHostnameQAOverride;
    self->_cachedHostnameQAOverride = (NSString *)v5;
    id v10 = v5;

    id v3 = self->_cachedHostnameQAOverride;
  }
  return v3;
}

- (id)_hostnameOverride
{
  id v3 = AFInternalConfigValueForKey();
  id v4 = self->_predefinedServer;
  if (!v4)
  {
    if (AFPreferencesShouldIgnoreInternalConfig())
    {
      id v4 = 0;
LABEL_14:
      BOOL v5 = 0;
      goto LABEL_15;
    }
    hostname = self->_hostname;
    if (hostname && ![(NSString *)hostname isEqualToString:@"https://guzzoni.apple.com"])
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1000AA790;
      v11[3] = &unk_1005009A8;
      void v11[4] = self;
      uint64_t v8 = [v3 keysOfEntriesPassingTest:v11];
      if ([v8 count])
      {
        id v4 = [v8 anyObject];
      }
      else
      {
        __int16 v9 = AFInternalConfigValueForKey();
        id v4 = [v9 objectForKey:self->_hostname];
      }
      if (!v4) {
        goto LABEL_14;
      }
    }
    else
    {
      AFInternalConfigValueForKey();
      id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (!v4) {
        goto LABEL_14;
      }
    }
    [(ADAccount *)self setPredefinedServer:v4];
  }
  BOOL v5 = [v3 objectForKey:v4];
  uint64_t v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v13 = "-[ADAccount _hostnameOverride]";
    __int16 v14 = 2112;
    v15 = v4;
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Found Predefined Server '%@' = %@", buf, 0x20u);
  }
LABEL_15:

  return v5;
}

- (void)setSpeechIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  speechIdentifier = self->_speechIdentifier;
  if (speechIdentifier != v4 && ![(NSString *)speechIdentifier isEqualToString:v4])
  {
    uint64_t v6 = (NSString *)[(NSString *)v4 copy];
    id v7 = self->_speechIdentifier;
    self->_speechIdentifier = v6;

    self->_sharedDataChanged = 1;
    keychainQueue = self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AA888;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (void)setLoggingAssistantIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  loggingAssistantIdentifier = self->_loggingAssistantIdentifier;
  if (loggingAssistantIdentifier != v4
    && ![(NSString *)loggingAssistantIdentifier isEqualToString:v4])
  {
    uint64_t v6 = (NSString *)[(NSString *)v4 copy];
    id v7 = self->_loggingAssistantIdentifier;
    self->_loggingAssistantIdentifier = v6;

    self->_sharedDataChanged = 1;
    keychainQueue = self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AA958;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (void)setAssistantIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  assistantIdentifier = self->_assistantIdentifier;
  if (assistantIdentifier != v4 && ![(NSString *)assistantIdentifier isEqualToString:v4])
  {
    uint64_t v6 = (NSString *)[(NSString *)v4 copy];
    id v7 = self->_assistantIdentifier;
    self->_assistantIdentifier = v6;

    self->_sharedDataChanged = 1;
    keychainQueue = self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AAA28;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (!identifier)
  {
    SiriCoreUUIDStringCreate();
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    BOOL v5 = self->_identifier;
    self->_identifier = v4;

    [(ADAccount *)self _markKeychainValuesAsDirty];
    identifier = self->_identifier;
  }
  return identifier;
}

- (id)messageDictionary
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:kAFAccountInfoIdentifierKey];
  }
  label = self->_label;
  if (label) {
    [v4 setObject:label forKey:kAFAccountInfoLabelKey];
  }
  assistantIdentifier = self->_assistantIdentifier;
  if (assistantIdentifier) {
    [v4 setObject:assistantIdentifier forKey:kAFAccountInfoAssistantIdentifierKey];
  }
  loggingAssistantIdentifier = self->_loggingAssistantIdentifier;
  if (loggingAssistantIdentifier) {
    [v4 setObject:loggingAssistantIdentifier forKey:kAFAccountInfoLoggingAssistantIdentifierKey];
  }
  speechIdentifier = self->_speechIdentifier;
  if (speechIdentifier) {
    [v4 setObject:speechIdentifier forKey:kAFAccountInfoSpeechIdentifierKey];
  }
  id v10 = [(ADAccount *)self hostname];
  [v4 setObject:v10 forKey:kAFAccountInfoHostnameKey];

  peerAssistantIdentifier = self->_peerAssistantIdentifier;
  if (peerAssistantIdentifier) {
    [v4 setObject:peerAssistantIdentifier forKey:kAFAccountInfoPeerAssistantIdentifierKey];
  }
  peerLoggingAssistantIdentifier = self->_peerLoggingAssistantIdentifier;
  if (peerLoggingAssistantIdentifier) {
    [v4 setObject:peerLoggingAssistantIdentifier forKey:kAFAccountInfoPeerLoggingAssistantIdentifierKey];
  }
  peerSpeechIdentifier = self->_peerSpeechIdentifier;
  if (peerSpeechIdentifier) {
    [v4 setObject:peerSpeechIdentifier forKey:kAFAccountInfoPeerSpeechIdentifierKey];
  }
  peerUserAgentString = self->_peerUserAgentString;
  if (peerUserAgentString) {
    [v4 setObject:peerUserAgentString forKey:kAFAccountInfoPeerUserAgentStringKey];
  }
  peerLanguageCode = self->_peerLanguageCode;
  if (peerLanguageCode) {
    [v4 setObject:peerLanguageCode forKey:kAFAccountInfoPeerLanguageCodeKey];
  }
  __int16 v16 = +[NSNumber numberWithBool:self->_peerSiriEnabled];
  [v4 setObject:v16 forKey:kAFAccountInfoPeerSiriEnabledKey];

  peerHostname = self->_peerHostname;
  if (peerHostname) {
    [v4 setObject:peerHostname forKey:kAFAccountInfoPeerHostnameKey];
  }
  group = self->_group;
  if (group) {
    [v4 setObject:group forKey:kAFAccountInfoGroupKey];
  }
  predefinedServer = self->_predefinedServer;
  if (predefinedServer) {
    [v4 setObject:predefinedServer forKey:kAFAccountInfoPredefinedServerKey];
  }
  aceHost = self->_aceHost;
  if (aceHost) {
    [v4 setObject:aceHost forKey:kAFAccountInfoAceHostKey];
  }
  connectionPolicy = self->_connectionPolicy;
  if (connectionPolicy) {
    [v4 setObject:connectionPolicy forKey:kAFAccountInfoConnectionPolicyKey];
  }
  connectionPolicyDate = self->_connectionPolicyDate;
  if (connectionPolicyDate) {
    [v4 setObject:connectionPolicyDate forKey:kAFAccountInfoConnectionPolicyDateKey];
  }
  connectionPolicyFirstFailureDate = self->_connectionPolicyFirstFailureDate;
  if (connectionPolicyFirstFailureDate) {
    [v4 setObject:connectionPolicyFirstFailureDate forKey:kAFAccountInfoConnectionPolicyFirstFailureDateKey];
  }
  connectionPolicyHostname = self->_connectionPolicyHostname;
  if (connectionPolicyHostname) {
    [v4 setObject:connectionPolicyHostname forKey:kAFAccountInfoConnectionPolicyHostnameKey];
  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier) {
    [v4 setObject:localeIdentifier forKey:kAFAccountInfoLocaleIdentifierKey];
  }
  v26 = +[NSNumber numberWithBool:self->_needsCreation];
  [v4 setObject:v26 forKey:kAFAccountInfoNeedsCreationKey];

  v27 = +[NSNumber numberWithBool:self->_needsDestruction];
  [v4 setObject:v27 forKey:kAFAccountInfoNeedsDestructionKey];

  return v4;
}

- (ADAccount)initWithMessageDictionary:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ADAccount *)self init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_BOOL isReadOnly = 1;
    id v7 = [v4 objectForKey:kAFAccountInfoIdentifierKey];
    [(ADAccount *)v6 setIdentifier:v7];

    uint64_t v8 = [v4 objectForKey:kAFAccountInfoLabelKey];
    [(ADAccount *)v6 setLabel:v8];

    __int16 v9 = [v4 objectForKey:kAFAccountInfoAssistantIdentifierKey];
    [(ADAccount *)v6 setAssistantIdentifier:v9];

    id v10 = [v4 objectForKey:kAFAccountInfoLoggingAssistantIdentifierKey];
    [(ADAccount *)v6 setLoggingAssistantIdentifier:v10];

    id v11 = [v4 objectForKey:kAFAccountInfoSpeechIdentifierKey];
    [(ADAccount *)v6 setSpeechIdentifier:v11];

    int v12 = [v4 objectForKey:kAFAccountInfoHostnameKey];
    [(ADAccount *)v6 setHostname:v12];

    v13 = [v4 objectForKey:kAFAccountInfoPeerAssistantIdentifierKey];
    [(ADAccount *)v6 setPeerAssistantIdentifier:v13];

    __int16 v14 = [v4 objectForKey:kAFAccountInfoPeerLoggingAssistantIdentifierKey];
    [(ADAccount *)v6 setPeerLoggingAssistantIdentifier:v14];

    v15 = [v4 objectForKey:kAFAccountInfoPeerSpeechIdentifierKey];
    [(ADAccount *)v6 setPeerSpeechIdentifier:v15];

    __int16 v16 = [v4 objectForKey:kAFAccountInfoPeerUserAgentStringKey];
    [(ADAccount *)v6 setPeerUserAgentString:v16];

    id v17 = [v4 objectForKey:kAFAccountInfoPeerLanguageCodeKey];
    [(ADAccount *)v6 setPeerLanguageCode:v17];

    uint64_t v18 = [v4 objectForKey:kAFAccountInfoPeerSiriEnabledKey];
    -[ADAccount setPeerSiriEnabled:](v6, "setPeerSiriEnabled:", [v18 BOOLValue]);

    char v19 = [v4 objectForKey:kAFAccountInfoPeerHostnameKey];
    [(ADAccount *)v6 setPeerHostname:v19];

    v20 = [v4 objectForKey:kAFAccountInfoPredefinedServerKey];
    [(ADAccount *)v6 setPredefinedServer:v20];

    v21 = [v4 objectForKey:kAFAccountInfoAceHostKey];
    [(ADAccount *)v6 setAceHost:v21];

    v22 = [v4 objectForKey:kAFAccountInfoConnectionPolicyKey];
    [(ADAccount *)v6 setConnectionPolicy:v22];

    v23 = [v4 objectForKey:kAFAccountInfoConnectionPolicyDateKey];
    [(ADAccount *)v6 setConnectionPolicyDate:v23];

    v24 = [v4 objectForKey:kAFAccountInfoConnectionPolicyFirstFailureDateKey];
    [(ADAccount *)v6 setConnectionPolicyFirstFailureDate:v24];

    v25 = [v4 objectForKey:kAFAccountInfoConnectionPolicyHostnameKey];
    [(ADAccount *)v6 setConnectionPolicyHostname:v25];

    v26 = [v4 objectForKey:kAFAccountInfoGroupKey];
    [(ADAccount *)v6 setGroup:v26];

    v27 = [v4 objectForKey:kAFAccountInfoLocaleIdentifierKey];
    [(ADAccount *)v6 setLocaleIdentifier:v27];
  }
  return v6;
}

- (ADAccount)init
{
  v7.receiver = self;
  v7.super_class = (Class)ADAccount;
  v2 = [(ADAccount *)&v7 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create(0, v3);

    keychainQueue = v2->_keychainQueue;
    v2->_keychainQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v7.receiver = self;
  v7.super_class = (Class)ADAccount;
  dispatch_queue_t v4 = [(ADAccount *)&v7 description];
  v5 = [v3 initWithFormat:@"%@ {identifier = %@, label = %@, assistantIdentifier = %@, speechIdentifier = %@} (needsCreation = %d, needsDestruction = %d, BOOL isReadOnly = %d)", v4, self->_identifier, self->_label, self->_assistantIdentifier, self->_speechIdentifier, self->_needsCreation, self->_needsDestruction, self->_isReadOnly];

  return v5;
}

+ (id)_accountForIdentifier:(id)a3 infoDictionary:(id)a4 intanceContext:(id)a5 isReadOnly:(BOOL)a6 isCoupledToHost:(BOOL)a7
{
  BOOL v7 = a6;
  id v10 = (ADAccount *)a3;
  id v11 = a4;
  id v12 = a5;
  v13 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    v91 = "+[ADAccount _accountForIdentifier:infoDictionary:intanceContext:isReadOnly:isCoupledToHost:]";
    __int16 v92 = 2113;
    v93 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
  }
  __int16 v14 = objc_alloc_init(ADAccount);
  [(ADAccount *)v14 setInstanceContext:v12];
  [(ADAccount *)v14 setIsReadOnly:v7];
  [(ADAccount *)v14 setIdentifier:v10];
  v15 = [v11 objectForKey:@"Label"];
  [(ADAccount *)v14 setLabel:v15];

  __int16 v16 = [v11 objectForKey:@"Hostname"];
  [(ADAccount *)v14 setHostname:v16];

  id v17 = [v11 objectForKey:@"Group"];
  [(ADAccount *)v14 setGroup:v17];

  uint64_t v18 = [v11 objectForKey:@"Predefined Server"];
  [(ADAccount *)v14 setPredefinedServer:v18];

  char v19 = [v11 objectForKey:@"Ace Host"];
  [(ADAccount *)v14 setAceHost:v19];

  v20 = AFBuildVersion();
  v21 = [v11 objectForKey:@"Build Version"];
  unsigned __int8 v22 = [v20 isEqualToString:v21];

  if (v22)
  {
    v23 = [v11 objectForKey:@"Connection Policy"];
    [(ADAccount *)v14 setConnectionPolicy:v23];

    v24 = [v11 objectForKey:@"Connection Policy Date"];
    [(ADAccount *)v14 setConnectionPolicyDate:v24];

    v25 = [v11 objectForKey:@"Connection Policy Hostname"];
    [(ADAccount *)v14 setConnectionPolicyHostname:v25];

    v26 = [v11 objectForKey:@"Connection Policy First Failure Date"];
    [(ADAccount *)v14 setConnectionPolicyFirstFailureDate:v26];
  }
  else
  {
    [(ADAccount *)v14 setConnectionPolicy:0];
    [(ADAccount *)v14 setConnectionPolicyDate:0];
    [(ADAccount *)v14 setConnectionPolicyHostname:0];
  }
  v27 = [v11 objectForKey:@"Locale Identifier"];
  [(ADAccount *)v14 setLocaleIdentifier:v27];

  int v28 = [v11 objectForKey:@"Last Assistant Data Anchor"];
  [(ADAccount *)v14 setLastAssistantDataAnchor:v28];

  v29 = [v11 objectForKey:@"Validation Expiration"];
  [(ADAccount *)v14 setValidationExpiration:v29];

  __int16 v30 = [v11 objectForKey:@"Validation Version"];
  [(ADAccount *)v14 setValidationVersion:v30];

  v31 = [v11 objectForKey:@"Peer Hostname"];
  [(ADAccount *)v14 setPeerHostname:v31];

  __int16 v32 = [v11 objectForKey:@"Needs Creation"];
  -[ADAccount setNeedsCreation:](v14, "setNeedsCreation:", [v32 BOOLValue]);

  v33 = [v11 objectForKey:@"Needs Destruction"];
  -[ADAccount setNeedsDestruction:](v14, "setNeedsDestruction:", [v33 BOOLValue]);

  v34 = [(ADAccount *)v14 _keychainValueForKey:@"Assistant Identifier"];
  v35 = [(ADAccount *)v14 _keychainValueForKey:@"Logging Assistant Identifier"];
  [(ADAccount *)v14 _keychainValueForKey:@"Speech Identifier"];
  v84 = v83 = v35;
  if (v34)
  {
    id v36 = [objc_alloc((Class)NSString) initWithData:v34 encoding:4];
    [(ADAccount *)v14 setAssistantIdentifier:v36];
  }
  else
  {
    id v36 = [v11 objectForKey:@"Assistant Identifier"];
    if (v36)
    {
      v37 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v91 = "+[ADAccount _accountForIdentifier:infoDictionary:intanceContext:isReadOnly:isCoupledToHost:]";
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%s Migrating assistantIdentifier", buf, 0xCu);
      }
      [(ADAccount *)v14 setAssistantIdentifier:v36];
      v38 = [v36 dataUsingEncoding:4];
      [(ADAccount *)v14 _setKeychainValue:v38 forKey:@"Assistant Identifier"];

      v35 = v83;
    }
  }

  if (v35)
  {
    id v39 = [objc_alloc((Class)NSString) initWithData:v35 encoding:4];
    [(ADAccount *)v14 setLoggingAssistantIdentifier:v39];
  }
  else
  {
    v40 = [(ADAccount *)v14 assistantIdentifier];

    if (!v40) {
      goto LABEL_19;
    }
    v41 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v91 = "+[ADAccount _accountForIdentifier:infoDictionary:intanceContext:isReadOnly:isCoupledToHost:]";
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "%s Creating coupled assistantIdentifier", buf, 0xCu);
    }
    v42 = +[NSUUID UUID];
    id v39 = [v42 UUIDString];

    [(ADAccount *)v14 setLoggingAssistantIdentifier:v39];
    v43 = [v39 dataUsingEncoding:4];
    [(ADAccount *)v14 _setKeychainValue:v43 forKey:@"Logging Assistant Identifier"];

    v35 = v83;
  }

LABEL_19:
  if (v84)
  {
    id v44 = [objc_alloc((Class)NSString) initWithData:v84 encoding:4];
    [(ADAccount *)v14 setSpeechIdentifier:v44];
  }
  else
  {
    id v44 = [v11 objectForKey:@"Speech Identifier"];
    if (v44)
    {
      v45 = AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v91 = "+[ADAccount _accountForIdentifier:infoDictionary:intanceContext:isReadOnly:isCoupledToHost:]";
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "%s Migrating speechIdentifier", buf, 0xCu);
      }
      [(ADAccount *)v14 setSpeechIdentifier:v44];
      v46 = [v44 dataUsingEncoding:4];
      [(ADAccount *)v14 _setKeychainValue:v46 forKey:@"Speech Identifier"];

      v35 = v83;
    }
  }

  v82 = v34;
  if ((AFIsNano() & 1) != 0 || AFIsHorseman())
  {
    uint64_t v47 = [(ADAccount *)v14 _keychainValueForKey:@"Peer Assistant Identifier"];
    if (v47)
    {
      id v48 = [objc_alloc((Class)NSString) initWithData:v47 encoding:4];
      [(ADAccount *)v14 setPeerAssistantIdentifier:v48];
    }
    v81 = (void *)v47;
    v49 = [(ADAccount *)v14 _keychainValueForKey:@"Peer Logging Assistant Identifier"];
    if (v49)
    {
      id v50 = [objc_alloc((Class)NSString) initWithData:v49 encoding:4];
      [(ADAccount *)v14 setPeerLoggingAssistantIdentifier:v50];
    }
    v51 = [(ADAccount *)v14 _keychainValueForKey:@"Peer Speech Identifier"];
    if (v51)
    {
      id v52 = [objc_alloc((Class)NSString) initWithData:v51 encoding:4];
      [(ADAccount *)v14 setPeerSpeechIdentifier:v52];
    }
    v53 = [(ADAccount *)v14 _keychainValueForKey:@"Peer User Agent String"];
    if (v53)
    {
      id v54 = [objc_alloc((Class)NSString) initWithData:v53 encoding:4];
      [(ADAccount *)v14 setPeerUserAgentString:v54];
    }
    v55 = [(ADAccount *)v14 _keychainValueForKey:@"Peer Language Code"];
    if (v55)
    {
      id v56 = [objc_alloc((Class)NSString) initWithData:v55 encoding:4];
      [(ADAccount *)v14 setPeerLanguageCode:v56];
    }
    id v57 = [(ADAccount *)v14 _keychainValueForKey:@"Peer Siri Enabled"];
    if (v57)
    {
      id v79 = v12;
      BOOL v58 = v10;
      v59 = +[NSSet setWithObject:objc_opt_class()];
      v60 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v59 fromData:v57 error:0];

      if (objc_opt_respondsToSelector()) {
        id v61 = [v60 BOOLValue];
      }
      else {
        id v61 = 0;
      }
      [(ADAccount *)v14 setPeerSiriEnabled:v61];

      id v10 = v58;
      id v12 = v79;
    }

    v34 = v82;
    v35 = v83;
  }
  if (AFSupportsPairedDevice() && (AFIsNano() & 1) == 0)
  {
    v62 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v91 = "+[ADAccount _accountForIdentifier:infoDictionary:intanceContext:isReadOnly:isCoupledToHost:]";
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    v63 = [(ADAccount *)v14 _keychainValueForKey:@"Watch Data Exists"];
    if (v63)
    {
      id v80 = v12;
      v64 = v10;
      uint64_t v65 = objc_opt_class();
      uint64_t v66 = objc_opt_class();
      v67 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v65, v66, objc_opt_class(), 0);
      v68 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v67 fromData:v63 error:0];

      id v69 = objc_alloc_init((Class)NSMutableSet);
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      id v70 = v68;
      id v71 = [v70 countByEnumeratingWithState:&v85 objects:v89 count:16];
      if (v71)
      {
        id v72 = v71;
        uint64_t v73 = *(void *)v86;
        do
        {
          for (i = 0; i != v72; i = (char *)i + 1)
          {
            if (*(void *)v86 != v73) {
              objc_enumerationMutation(v70);
            }
            id v75 = [*(id *)(*((void *)&v85 + 1) + 8 * i) mutableCopy];
            [v69 addObject:v75];
          }
          id v72 = [v70 countByEnumeratingWithState:&v85 objects:v89 count:16];
        }
        while (v72);
      }

      [(ADAccount *)v14 setPairedWatches:v69];
      v76 = +[ADPreferences sharedPreferences];
      objc_msgSend(v76, "setHasPairedWatches:", objc_msgSend(v69, "count") != 0);

      id v10 = v64;
      id v12 = v80;
      v34 = v82;
      v35 = v83;
    }
  }
  v14->_sharedDataChanged = 0;
  v77 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315395;
    v91 = "+[ADAccount _accountForIdentifier:infoDictionary:intanceContext:isReadOnly:isCoupledToHost:]";
    __int16 v92 = 2113;
    v93 = v14;
    _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "%s %{private}@", buf, 0x16u);
  }

  return v14;
}

+ (id)accountForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[ADPreferences sharedPreferences];
  uint64_t v6 = [v5 accountInfoForIdentifier:v4];
  BOOL v7 = [a1 _accountForIdentifier:v4 infoDictionary:v6 intanceContext:0 isReadOnly:0 isCoupledToHost:1];

  return v7;
}

+ (id)activeAccountForInstanceContext:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3 && ([v3 isCurrent] & 1) == 0)
  {
    id v5 = [[ADPreferences alloc] initWithInstanceContext:v4];
    uint64_t v6 = 1;
  }
  else
  {
    id v5 = +[ADPreferences sharedPreferences];
    uint64_t v6 = 0;
  }
  BOOL v7 = [(ADPreferences *)v5 activeAccountIdentifier];
  uint64_t v8 = [(ADPreferences *)v5 accountIdentifiers];
  __int16 v9 = v8;
  if (v7 && ([v8 containsObject:v7] & 1) != 0)
  {
LABEL_9:
    id v11 = [(ADPreferences *)v5 accountInfoForIdentifier:v7];
    id v12 = +[ADAccount _accountForIdentifier:v7 infoDictionary:v11 intanceContext:v4 isReadOnly:v6 isCoupledToHost:1];

    if (v12) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if ([v9 count])
  {
    uint64_t v10 = [v9 objectAtIndex:0];

    BOOL v7 = (void *)v10;
    if (v10) {
      goto LABEL_9;
    }
  }
  else
  {

    BOOL v7 = 0;
  }
LABEL_12:
  id v12 = objc_alloc_init(ADAccount);
  [(ADAccount *)v12 setIsReadOnly:v6];
  [(ADAccount *)v12 setInstanceContext:v4];
LABEL_13:

  return v12;
}

+ (BOOL)setActiveAccountIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[ADPreferences sharedPreferences];
  id v5 = [v4 accountIdentifiers];
  unsigned int v6 = [v5 containsObject:v3];

  if (v6)
  {
    [v4 setActiveAccountIdentifier:v3];
    [v4 synchronize];
  }

  return v6;
}

+ (id)activeAccount
{
  return _[a1 activeAccountForInstanceContext:0];
}

- (BOOL)watchExistsForAssistantId:(id)a3
{
  id v4 = a3;
  id v5 = self->_pairedWatches;
  unsigned int v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    unsigned __int8 v22 = "-[ADAccount(SharedData) watchExistsForAssistantId:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v7 = v5;
  id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "objectForKey:", @"Watch Assistant Identifier", (void)v16);
        unsigned __int8 v13 = [v4 isEqualToString:v12];

        if (v13)
        {
          BOOL v14 = 1;
          goto LABEL_13;
        }
      }
      id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_13:

  return v14;
}

- (void)updateGizmoData:(id)a3 forUniqueId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_pairedWatches;
  v33 = [v6 assistantId];
  id v9 = [v6 languageCode];
  uint64_t v10 = [v6 userAgent];
  id v11 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[ADAccount(SharedData) updateGizmoData:forUniqueId:]";
    __int16 v42 = 2112;
    v43 = v33;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s %@", buf, 0x16u);
    if (!v7) {
      goto LABEL_39;
    }
  }
  else if (!v7)
  {
    goto LABEL_39;
  }
  if (!v33) {
    goto LABEL_39;
  }
  if (![(NSMutableSet *)v8 count]) {
    goto LABEL_15;
  }
  __int16 v32 = v9;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = v8;
  id v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (!v13) {
    goto LABEL_14;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v36;
  __int16 v30 = self;
  id v31 = v6;
  v29 = v8;
  while (2)
  {
    id v16 = v7;
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v36 != v15) {
        objc_enumerationMutation(v12);
      }
      long long v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      long long v19 = [v18 objectForKey:@"Watch Assistant Identifier"];
      if ([v33 isEqualToString:v19])
      {
        id v9 = v32;
        if (v32) {
          [v18 setObject:v32 forKey:@"Watch Language"];
        }
        id v7 = v16;
        if (v10) {
          [v18 setObject:v10 forKey:@"Watch User Agent String"];
        }
        [v18 setObject:v16 forKey:@"Watch Override Id"];
        v25 = AFSiriLogContextDaemon;
        self = v30;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v41 = "-[ADAccount(SharedData) updateGizmoData:forUniqueId:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%s updated assistant data", buf, 0xCu);
        }
        goto LABEL_37;
      }
      v20 = [v18 objectForKey:@"Watch Override Id"];
      if ([v20 isEqualToString:v16])
      {
        id v9 = v32;
        if (v32) {
          [v18 setObject:v32 forKey:@"Watch Language"];
        }
        id v7 = v16;
        if (v10) {
          [v18 setObject:v10 forKey:@"Watch User Agent String"];
        }
        [v18 setObject:v33 forKey:@"Watch Assistant Identifier"];
        v26 = AFSiriLogContextDaemon;
        self = v30;
        if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v41 = "-[ADAccount(SharedData) updateGizmoData:forUniqueId:]";
          _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%s updated assistant for same device", buf, 0xCu);
        }

LABEL_37:
        id v6 = v31;
        id v8 = v29;
        goto LABEL_38;
      }
    }
    id v14 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v35 objects:v39 count:16];
    id v7 = v16;
    self = v30;
    id v6 = v31;
    id v8 = v29;
    if (v14) {
      continue;
    }
    break;
  }
LABEL_14:

  id v9 = v32;
LABEL_15:
  if (!v8)
  {
    v21 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    pairedWatches = self->_pairedWatches;
    self->_pairedWatches = v21;
  }
  v23 = (NSMutableSet *)objc_alloc_init((Class)NSMutableDictionary);
  id v12 = v23;
  if (v9) {
    [(NSMutableSet *)v23 setObject:v9 forKey:@"Watch Language"];
  }
  if (v10) {
    [(NSMutableSet *)v12 setObject:v10 forKey:@"Watch User Agent String"];
  }
  [(NSMutableSet *)v12 setObject:v33 forKey:@"Watch Assistant Identifier"];
  [(NSMutableSet *)v12 setObject:v7 forKey:@"Watch Override Id"];
  v24 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v41 = "-[ADAccount(SharedData) updateGizmoData:forUniqueId:]";
    _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%s inserted", buf, 0xCu);
  }
  [(NSMutableSet *)self->_pairedWatches addObject:v12];
LABEL_38:

  [(ADAccount *)self save];
  v27 = +[ADPreferences sharedPreferences];
  objc_msgSend(v27, "setHasPairedWatches:", -[NSMutableSet count](self->_pairedWatches, "count") != 0);

  keychainQueue = self->_keychainQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AC888;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(keychainQueue, block);
LABEL_39:
}

- (id)pairedWatches
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = self->_pairedWatches;
  id v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "copy", (void)v11);
        [v3 addObject:v9];
      }
      id v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)setPairedWatches:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_pairedWatches] & 1) == 0)
  {
    id v6 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[ADAccount(SharedData) setPairedWatches:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
    }
    objc_storeStrong((id *)&self->_pairedWatches, a3);
    keychainQueue = self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000ACB08;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (void)setPeerSiriEnabled:(BOOL)a3
{
  if (self->_peerSiriEnabled != a3)
  {
    self->_BOOL peerSiriEnabled = a3;
    keychainQueue = self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000ACBA0;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (BOOL)peerSiriEnabled
{
  return self->_peerSiriEnabled;
}

- (void)setPeerLanguageCode:(id)a3
{
  id v4 = (NSString *)a3;
  peerLanguageCode = self->_peerLanguageCode;
  if (peerLanguageCode != v4 && ![(NSString *)peerLanguageCode isEqualToString:v4])
  {
    id v6 = (NSString *)[(NSString *)v4 copy];
    uint64_t v7 = self->_peerLanguageCode;
    self->_peerLanguageCode = v6;

    keychainQueue = self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000ACC70;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (NSString)peerLanguageCode
{
  return self->_peerLanguageCode;
}

- (void)setPeerHostname:(id)a3
{
  self->_peerHostname = (NSString *)[a3 copy];
  _objc_release_x1();
}

- (NSString)peerHostname
{
  peerHostname = [(ADAccount *)self _hostnameQAOverride];
  id v4 = peerHostname;
  if (!peerHostname) {
    peerHostname = self->_peerHostname;
  }
  id v5 = peerHostname;

  return v5;
}

- (void)setPeerUserAgentString:(id)a3
{
  id v4 = (NSString *)a3;
  peerUserAgentString = self->_peerUserAgentString;
  if (peerUserAgentString != v4 && ![(NSString *)peerUserAgentString isEqualToString:v4])
  {
    id v6 = (NSString *)[(NSString *)v4 copy];
    uint64_t v7 = self->_peerUserAgentString;
    self->_peerUserAgentString = v6;

    keychainQueue = self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000ACDC4;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (NSString)peerUserAgentString
{
  return self->_peerUserAgentString;
}

- (void)setPeerSpeechIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  peerSpeechIdentifier = self->_peerSpeechIdentifier;
  if (peerSpeechIdentifier != v4 && ![(NSString *)peerSpeechIdentifier isEqualToString:v4])
  {
    id v6 = (NSString *)[(NSString *)v4 copy];
    uint64_t v7 = self->_peerSpeechIdentifier;
    self->_peerSpeechIdentifier = v6;

    keychainQueue = self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000ACE94;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (NSString)peerSpeechIdentifier
{
  return self->_peerSpeechIdentifier;
}

- (void)setPeerLoggingAssistantIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  peerLoggingAssistantIdentifier = self->_peerLoggingAssistantIdentifier;
  if (peerLoggingAssistantIdentifier != v4
    && ![(NSString *)peerLoggingAssistantIdentifier isEqualToString:v4])
  {
    id v6 = (NSString *)[(NSString *)v4 copy];
    uint64_t v7 = self->_peerLoggingAssistantIdentifier;
    self->_peerLoggingAssistantIdentifier = v6;

    keychainQueue = self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000ACF64;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (NSString)peerLoggingAssistantIdentifier
{
  return self->_peerLoggingAssistantIdentifier;
}

- (void)setPeerAssistantIdentifier:(id)a3
{
  id v4 = (NSString *)a3;
  peerAssistantIdentifier = self->_peerAssistantIdentifier;
  if (peerAssistantIdentifier != v4 && ![(NSString *)peerAssistantIdentifier isEqualToString:v4])
  {
    id v6 = (NSString *)[(NSString *)v4 copy];
    uint64_t v7 = self->_peerAssistantIdentifier;
    self->_peerAssistantIdentifier = v6;

    keychainQueue = self->_keychainQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000AD034;
    block[3] = &unk_10050E138;
    block[4] = self;
    dispatch_async(keychainQueue, block);
  }
}

- (NSString)peerAssistantIdentifier
{
  return self->_peerAssistantIdentifier;
}

- (id)saRemoteDevice:(id)a3
{
  id v4 = a3;
  id v5 = self->_pairedWatches;
  id v6 = AFSiriLogContextDaemon;
  if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v28 = "-[ADAccount(RemoteDevice) saRemoteDevice:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v7 = v5;
  id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v7);
      }
      long long v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
      long long v13 = objc_msgSend(v12, "objectForKey:", @"Watch Override Id", (void)v22);
      unsigned __int8 v14 = [v4 isEqualToString:v13];

      if (v14) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v15 = v12;

    if (!v15) {
      goto LABEL_16;
    }
    id v16 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      int v28 = "-[ADAccount(RemoteDevice) saRemoteDevice:]";
      _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s Found paired watch", buf, 0xCu);
    }
    id v17 = objc_alloc_init((Class)SARemoteDevice);
    long long v18 = [v15 objectForKey:@"Watch Assistant Identifier"];
    [v17 setAssistantId:v18];

    long long v19 = [v15 objectForKey:@"Watch User Agent String"];
    [v17 setUserAgent:v19];

    v20 = [v15 objectForKey:@"Watch Language"];
    [v17 setLanguage:v20];

    [v17 setSiriEnabled:1];
  }
  else
  {
LABEL_11:

    id v15 = 0;
LABEL_16:
    id v17 = 0;
  }

  return v17;
}

- (int64_t)connectionPolicyStatus
{
  id v3 = [(ADAccount *)self saConnectionPolicy];
  id v4 = [(ADAccount *)self connectionPolicyDate];
  id v5 = [(ADAccount *)self connectionPolicyHostname];
  if (v3)
  {
    if ([(ADAccount *)self needsCreation])
    {
      int64_t v6 = 1;
    }
    else if ([(ADAccount *)self needsDestruction])
    {
      int64_t v6 = 2;
    }
    else if (v4)
    {
      if (v5)
      {
        if ([(ADAccount *)self hasConnectionPolicyFailed])
        {
          int64_t v6 = 7;
        }
        else
        {
          uint64_t v7 = [(ADAccount *)self connectionPolicyExpirationDate];
          [v7 timeIntervalSinceNow];
          if (v8 >= 0.0)
          {
            id v9 = [(ADAccount *)self hostname];
            if ([v5 isEqualToString:v9]) {
              int64_t v6 = 0;
            }
            else {
              int64_t v6 = 4;
            }
          }
          else
          {
            int64_t v6 = 3;
          }
        }
      }
      else
      {
        int64_t v6 = 6;
      }
    }
    else
    {
      int64_t v6 = 5;
    }
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (BOOL)hasConnectionPolicyFailed
{
  return [(ADAccount *)self connectionPolicyFailureCount] > 1;
}

- (id)connectionPolicyExpirationDate
{
  id v3 = [(ADAccount *)self saConnectionPolicy];
  id v4 = [v3 timeToLive];
  id v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    double v7 = fmin(v6, 604800.0);
  }
  else
  {
    double v7 = 604800.0;
  }
  double v8 = [(ADAccount *)self connectionPolicyDate];
  id v9 = [v8 dateByAddingTimeInterval:v7];

  return v9;
}

- (id)saConnectionPolicy
{
  v2 = [(ADAccount *)self connectionPolicy];
  if (v2) {
    id v3 = [objc_alloc((Class)SAConnectionPolicy) initWithDictionary:v2];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

@end