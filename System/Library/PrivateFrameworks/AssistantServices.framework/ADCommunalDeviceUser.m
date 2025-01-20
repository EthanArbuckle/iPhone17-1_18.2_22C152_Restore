@interface ADCommunalDeviceUser
+ (id)saHomeMemberInfo:(id)a3;
+ (id)saMultiUserInfo:(id)a3;
+ (id)saRemoteDeviceForHomeMember:(id)a3;
- (ADCommunalDeviceUser)initWithDictionary:(id)a3 attribute:(unint64_t)a4;
- (ADCommunalDeviceUserAttributes)attributes;
- (BOOL)allowExplicitContent;
- (BOOL)companionPeerToPeerHandoffCapable;
- (BOOL)companionSyncMetadataCapable;
- (BOOL)loggingIsAllowed;
- (BOOL)nonCloudSyncedUser;
- (BOOL)personalDomainsIsEnabled;
- (BOOL)unauthenticatedRequestsAllowed;
- (BOOL)voiceIDAllowedByUser;
- (NSData)audioAppSignals;
- (NSDictionary)companionSyncMetadata;
- (NSDictionary)settings;
- (NSString)aceHost;
- (NSString)companionAssistantID;
- (NSString)companionIDSIdentifier;
- (NSString)companionSpeechID;
- (NSString)enrollmentName;
- (NSString)homeUserUUID;
- (NSString)iCloudAltDSID;
- (NSString)loggableCompanionAssistantID;
- (NSString)loggableMultiUserSharedUserID;
- (NSString)loggableMusicSyncSharedUserID;
- (NSString)loggableSharedUserID;
- (NSString)perceptionIdentifier;
- (NSString)personaID;
- (NSString)productPrefix;
- (NSString)shareOwnerName;
- (NSString)sharedUserID;
- (NSString)speechID;
- (id)dictionaryRepresentation;
- (id)init:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 attribute:(unint64_t)a7;
- (id)lastSyncDateForSyncType:(id)a3;
- (id)lastSyncGenerationForSyncType:(id)a3;
- (id)userProperties;
- (void)setAceHost:(id)a3;
- (void)setAllowExplicitContent:(BOOL)a3;
- (void)setAttributes:(id)a3;
- (void)setAudioAppSignals:(id)a3;
- (void)setCompanionAssistantID:(id)a3;
- (void)setCompanionIDSIdentifier:(id)a3;
- (void)setCompanionPeerToPeerHandoffCapable:(BOOL)a3;
- (void)setCompanionSpeechID:(id)a3;
- (void)setCompanionSyncMetadata:(id)a3;
- (void)setCompanionSyncMetadataCapable:(BOOL)a3;
- (void)setEnrollmentName:(id)a3;
- (void)setLoggableCompanionAssistantID:(id)a3;
- (void)setLoggableMultiUserSharedUserID:(id)a3;
- (void)setLoggableMusicSyncSharedUserID:(id)a3;
- (void)setNonCloudSyncedUserAttribute:(BOOL)a3;
- (void)setPerceptionIdentifier:(id)a3;
- (void)setPersonaID:(id)a3;
- (void)setPersonalDomainsIsEnabled:(BOOL)a3;
- (void)setProductPrefix:(id)a3;
- (void)setSettings:(id)a3;
- (void)setShareOwnerName:(id)a3;
- (void)setSharedUserID:(id)a3;
- (void)setSpeechID:(id)a3;
- (void)setUnauthenticatedRequestsAllowed:(BOOL)a3;
- (void)setVoiceIDAllowedByUser:(BOOL)a3;
- (void)testAndSetLoggingIsAllowed:(BOOL)a3;
@end

@implementation ADCommunalDeviceUser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perceptionIdentifier, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_shareOwnerName, 0);
  objc_storeStrong((id *)&self->_companionSyncMetadata, 0);
  objc_storeStrong((id *)&self->_aceHost, 0);
  objc_storeStrong((id *)&self->_productPrefix, 0);
  objc_storeStrong((id *)&self->_speechID, 0);
  objc_storeStrong((id *)&self->_companionIDSIdentifier, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_enrollmentName, 0);
  objc_storeStrong((id *)&self->_companionSpeechID, 0);
  objc_storeStrong((id *)&self->_companionAssistantID, 0);
  objc_storeStrong((id *)&self->_loggableCompanionAssistantID, 0);
  objc_storeStrong((id *)&self->_loggableMusicSyncSharedUserID, 0);
  objc_storeStrong((id *)&self->_loggableMultiUserSharedUserID, 0);
  objc_storeStrong((id *)&self->_audioAppSignals, 0);
  objc_storeStrong((id *)&self->_iCloudAltDSID, 0);
  objc_storeStrong((id *)&self->_loggableSharedUserID, 0);
  objc_storeStrong((id *)&self->_sharedUserID, 0);
  objc_storeStrong((id *)&self->_homeUserUUID, 0);
}

- (void)setPerceptionIdentifier:(id)a3
{
}

- (NSString)perceptionIdentifier
{
  return self->_perceptionIdentifier;
}

- (void)setPersonaID:(id)a3
{
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setCompanionPeerToPeerHandoffCapable:(BOOL)a3
{
  self->_companionPeerToPeerHandoffCapable = a3;
}

- (BOOL)companionPeerToPeerHandoffCapable
{
  return self->_companionPeerToPeerHandoffCapable;
}

- (void)setCompanionSyncMetadataCapable:(BOOL)a3
{
  self->_companionSyncMetadataCapable = a3;
}

- (BOOL)companionSyncMetadataCapable
{
  return self->_companionSyncMetadataCapable;
}

- (BOOL)loggingIsAllowed
{
  return self->_loggingIsAllowed;
}

- (void)setSettings:(id)a3
{
}

- (NSDictionary)settings
{
  return self->_settings;
}

- (BOOL)nonCloudSyncedUser
{
  return self->_nonCloudSyncedUser;
}

- (void)setShareOwnerName:(id)a3
{
}

- (NSString)shareOwnerName
{
  return self->_shareOwnerName;
}

- (void)setCompanionSyncMetadata:(id)a3
{
}

- (NSDictionary)companionSyncMetadata
{
  return self->_companionSyncMetadata;
}

- (void)setAllowExplicitContent:(BOOL)a3
{
  self->_allowExplicitContent = a3;
}

- (BOOL)allowExplicitContent
{
  return self->_allowExplicitContent;
}

- (void)setVoiceIDAllowedByUser:(BOOL)a3
{
  self->_voiceIDAllowedByUser = a3;
}

- (BOOL)voiceIDAllowedByUser
{
  return self->_voiceIDAllowedByUser;
}

- (void)setUnauthenticatedRequestsAllowed:(BOOL)a3
{
  self->_unauthenticatedRequestsAllowed = a3;
}

- (BOOL)unauthenticatedRequestsAllowed
{
  return self->_unauthenticatedRequestsAllowed;
}

- (void)setPersonalDomainsIsEnabled:(BOOL)a3
{
  self->_personalDomainsIsEnabled = a3;
}

- (BOOL)personalDomainsIsEnabled
{
  return self->_personalDomainsIsEnabled;
}

- (void)setAceHost:(id)a3
{
}

- (NSString)aceHost
{
  return self->_aceHost;
}

- (void)setProductPrefix:(id)a3
{
}

- (NSString)productPrefix
{
  return self->_productPrefix;
}

- (void)setSpeechID:(id)a3
{
}

- (NSString)speechID
{
  return self->_speechID;
}

- (void)setCompanionIDSIdentifier:(id)a3
{
}

- (NSString)companionIDSIdentifier
{
  return self->_companionIDSIdentifier;
}

- (void)setAttributes:(id)a3
{
}

- (ADCommunalDeviceUserAttributes)attributes
{
  return self->_attributes;
}

- (void)setEnrollmentName:(id)a3
{
}

- (NSString)enrollmentName
{
  return self->_enrollmentName;
}

- (void)setCompanionSpeechID:(id)a3
{
}

- (NSString)companionSpeechID
{
  return self->_companionSpeechID;
}

- (void)setCompanionAssistantID:(id)a3
{
}

- (NSString)companionAssistantID
{
  return self->_companionAssistantID;
}

- (void)setLoggableCompanionAssistantID:(id)a3
{
}

- (NSString)loggableCompanionAssistantID
{
  return self->_loggableCompanionAssistantID;
}

- (void)setLoggableMusicSyncSharedUserID:(id)a3
{
}

- (NSString)loggableMusicSyncSharedUserID
{
  return self->_loggableMusicSyncSharedUserID;
}

- (void)setLoggableMultiUserSharedUserID:(id)a3
{
}

- (NSString)loggableMultiUserSharedUserID
{
  return self->_loggableMultiUserSharedUserID;
}

- (void)setAudioAppSignals:(id)a3
{
}

- (NSData)audioAppSignals
{
  return self->_audioAppSignals;
}

- (NSString)iCloudAltDSID
{
  return self->_iCloudAltDSID;
}

- (NSString)loggableSharedUserID
{
  return self->_loggableSharedUserID;
}

- (void)setSharedUserID:(id)a3
{
}

- (NSString)sharedUserID
{
  return self->_sharedUserID;
}

- (NSString)homeUserUUID
{
  return self->_homeUserUUID;
}

- (id)lastSyncGenerationForSyncType:(id)a3
{
  id v4 = a3;
  v5 = [(ADCommunalDeviceUser *)self companionSyncMetadata];
  v6 = [v5 objectForKey:v4];

  v7 = [v6 objectForKey:@"syncGeneration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (id)lastSyncDateForSyncType:(id)a3
{
  id v4 = a3;
  v5 = [(ADCommunalDeviceUser *)self companionSyncMetadata];
  v6 = [v5 objectForKey:v4];

  v7 = [v6 objectForKey:@"syncTimestamp"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  [v8 floatValue];
  v10 = +[NSDate dateWithTimeIntervalSince1970:v9];

  return v10;
}

- (void)testAndSetLoggingIsAllowed:(BOOL)a3
{
  if (self->_loggingIsAllowed != a3)
  {
    self->_loggingIsAllowed = a3;
    if (a3)
    {
      objc_storeStrong((id *)&self->_loggableCompanionAssistantID, self->_companionAssistantID);
      id v4 = self->_sharedUserID;
      loggableMultiUserSharedUserID = self->_loggableMultiUserSharedUserID;
      self->_loggableMultiUserSharedUserID = v4;
    }
    else
    {
      v6 = +[NSUUID UUID];
      v7 = [v6 UUIDString];
      loggableCompanionAssistantID = self->_loggableCompanionAssistantID;
      self->_loggableCompanionAssistantID = v7;

      v11 = +[NSUUID UUID];
      float v9 = [v11 UUIDString];
      v10 = self->_loggableMultiUserSharedUserID;
      self->_loggableMultiUserSharedUserID = v9;

      loggableMultiUserSharedUserID = (NSString *)v11;
    }
    _objc_release_x1(v4, loggableMultiUserSharedUserID);
  }
}

- (void)setNonCloudSyncedUserAttribute:(BOOL)a3
{
  self->_nonCloudSyncedUser = a3;
  if (a3) {
    [(ADCommunalDeviceUserAttributes *)self->_attributes addAttribute:4];
  }
}

- (id)dictionaryRepresentation
{
  if ((AFIsATV() & 1) != 0 || self->_homeUserUUID && self->_sharedUserID && self->_loggableSharedUserID)
  {
    id v51 = objc_alloc((Class)NSMutableDictionary);
    uint64_t v3 = [(ADCommunalDeviceUser *)self sharedUserID];
    id v4 = (void *)v3;
    CFStringRef v5 = @"empty";
    if (v3) {
      CFStringRef v6 = (const __CFString *)v3;
    }
    else {
      CFStringRef v6 = @"empty";
    }
    CFStringRef v50 = v6;
    uint64_t v7 = [(ADCommunalDeviceUser *)self homeUserUUID];
    v8 = (void *)v7;
    if (v7) {
      CFStringRef v9 = (const __CFString *)v7;
    }
    else {
      CFStringRef v9 = @"empty";
    }
    CFStringRef v49 = v9;
    uint64_t v10 = [(ADCommunalDeviceUser *)self enrollmentName];
    v11 = (void *)v10;
    if (v10) {
      CFStringRef v12 = (const __CFString *)v10;
    }
    else {
      CFStringRef v12 = @"empty";
    }
    CFStringRef v48 = v12;
    uint64_t v13 = [(ADCommunalDeviceUser *)self loggableSharedUserID];
    v14 = (void *)v13;
    if (v13) {
      CFStringRef v15 = (const __CFString *)v13;
    }
    else {
      CFStringRef v15 = @"empty";
    }
    CFStringRef v47 = v15;
    uint64_t v16 = [(ADCommunalDeviceUser *)self iCloudAltDSID];
    v17 = (void *)v16;
    if (v16) {
      CFStringRef v5 = (const __CFString *)v16;
    }
    v18 = [(ADCommunalDeviceUser *)self speechID];
    v19 = v18;
    if (!v18)
    {
      v46 = +[NSUUID UUID];
      v19 = [v46 UUIDString];
    }
    uint64_t v20 = [(ADCommunalDeviceUser *)self companionSyncMetadata];
    v21 = (void *)v20;
    v22 = &__NSDictionary0__struct;
    if (v20) {
      v22 = (void *)v20;
    }
    id v23 = objc_msgSend(v51, "initWithObjectsAndKeys:", v50, @"sharedUserId", v49, @"homeUserId", v48, @"enrollmentName", v47, @"loggableSharedUserId", v5, @"iCloudAltDSID", v19, @"speechIdentifier", v22, @"companionSyncMetadata", 0);

    if (!v18)
    {
    }
    if (self->_companionSyncMetadataCapable)
    {
      v24 = [&__kCFBooleanTrue stringValue];
      [v23 setObject:v24 forKey:@"companionSyncMetadataCapable"];
    }
    if (self->_companionPeerToPeerHandoffCapable)
    {
      v25 = [&__kCFBooleanTrue stringValue];
      [v23 setObject:v25 forKey:@"companionPeerToPeerHandoffCapable"];
    }
    if (self->_companionAssistantID)
    {
      v26 = [(ADCommunalDeviceUser *)self companionAssistantID];
      [v23 setObject:v26 forKey:@"companionAssistantId"];
    }
    if (self->_companionSpeechID)
    {
      v27 = [(ADCommunalDeviceUser *)self companionSpeechID];
      [v23 setObject:v27 forKey:@"companionSpeechId"];
    }
    if (self->_companionIDSIdentifier)
    {
      v28 = [(ADCommunalDeviceUser *)self companionIDSIdentifier];
      [v23 setObject:v28 forKey:@"companionIDSIdentifier"];
    }
    if (self->_productPrefix)
    {
      v29 = [(ADCommunalDeviceUser *)self productPrefix];
      [v23 setObject:v29 forKey:@"userAgent"];
    }
    if (self->_personalDomainsIsEnabled)
    {
      v30 = [&__kCFBooleanTrue stringValue];
      [v23 setObject:v30 forKey:@"personalDomainEnabled"];
    }
    if (self->_unauthenticatedRequestsAllowed)
    {
      v31 = [&__kCFBooleanTrue stringValue];
      [v23 setObject:v31 forKey:@"personalDomainUnauthenticatedRequestsAllowed"];
    }
    if (self->_allowExplicitContent)
    {
      v32 = [&__kCFBooleanTrue stringValue];
      [v23 setObject:v32 forKey:@"allowExplicitContent"];
    }
    if (self->_shareOwnerName)
    {
      v33 = [(ADCommunalDeviceUser *)self shareOwnerName];
      [v23 setObject:v33 forKey:@"cloudShareOwnerName"];
    }
    if (self->_voiceIDAllowedByUser)
    {
      v34 = +[NSNumber numberWithBool:[(ADCommunalDeviceUser *)self voiceIDAllowedByUser]];
      v35 = [v34 stringValue];
      [v23 setObject:v35 forKey:@"voiceIDAllowedByUser"];
    }
    if (self->_nonCloudSyncedUser)
    {
      v36 = [&__kCFBooleanTrue stringValue];
      [v23 setObject:v36 forKey:@"voiceIDAllowedByUser"];
    }
    if (self->_loggableMultiUserSharedUserID)
    {
      v37 = [(ADCommunalDeviceUser *)self loggableMultiUserSharedUserID];
      [v23 setObject:v37 forKey:@"loggableMultiUserSharedUserId"];
    }
    if (self->_loggableCompanionAssistantID)
    {
      v38 = [(ADCommunalDeviceUser *)self loggableCompanionAssistantID];
      [v23 setObject:v38 forKey:@"loggableCompanionAssistantId"];
    }
    if (self->_loggableMusicSyncSharedUserID)
    {
      v39 = [(ADCommunalDeviceUser *)self loggableMusicSyncSharedUserID];
      [v23 setObject:v39 forKey:@"loggableMusicSyncSharedUserId"];
    }
    aceHost = self->_aceHost;
    if (aceHost) {
      [v23 setObject:aceHost forKey:@"aceHost"];
    }
    if (self->_settings)
    {
      v41 = [(ADCommunalDeviceUser *)self settings];
      v42 = +[NSPropertyListSerialization dataWithPropertyList:v41 format:200 options:0 error:0];

      [v23 setObject:v42 forKey:@"homeMemberSettings"];
    }
    if (self->_personaID)
    {
      v43 = [(ADCommunalDeviceUser *)self personaID];
      [v23 setObject:v43 forKey:@"personaId"];
    }
    if (self->_perceptionIdentifier)
    {
      v44 = [(ADCommunalDeviceUser *)self perceptionIdentifier];
      [v23 setObject:v44 forKey:@"perceptionIdentifier"];
    }
  }
  else
  {
    id v23 = 0;
  }
  return v23;
}

- (id)userProperties
{
  id v18 = objc_alloc((Class)NSDictionary);
  uint64_t v3 = [(ADCommunalDeviceUser *)self sharedUserID];
  id v4 = (void *)v3;
  if (v3) {
    CFStringRef v5 = (const __CFString *)v3;
  }
  else {
    CFStringRef v5 = @"empty";
  }
  uint64_t v6 = [(ADCommunalDeviceUser *)self homeUserUUID];
  uint64_t v7 = (void *)v6;
  if (v6) {
    CFStringRef v8 = (const __CFString *)v6;
  }
  else {
    CFStringRef v8 = @"empty";
  }
  uint64_t v9 = [(ADCommunalDeviceUser *)self iCloudAltDSID];
  uint64_t v10 = (void *)v9;
  if (v9) {
    CFStringRef v11 = (const __CFString *)v9;
  }
  else {
    CFStringRef v11 = @"empty";
  }
  uint64_t v12 = [(ADCommunalDeviceUser *)self enrollmentName];
  uint64_t v13 = (void *)v12;
  if (v12) {
    CFStringRef v14 = (const __CFString *)v12;
  }
  else {
    CFStringRef v14 = @"empty";
  }
  CFStringRef v15 = +[NSNumber numberWithBool:[(ADCommunalDeviceUser *)self voiceIDAllowedByUser]];
  id v16 = objc_msgSend(v18, "initWithObjectsAndKeys:", v5, @"sharedUserId", v8, @"homeUserId", v11, @"iCloudAltDSID", v14, @"enrollmentName", v15, @"voiceIDAllowedByUser", 0);

  return v16;
}

- (ADCommunalDeviceUser)initWithDictionary:(id)a3 attribute:(unint64_t)a4
{
  id v6 = a3;
  v71.receiver = self;
  v71.super_class = (Class)ADCommunalDeviceUser;
  uint64_t v7 = [(ADCommunalDeviceUser *)&v71 init];
  if (v7)
  {
    CFStringRef v8 = [v6 objectForKey:@"homeUserId"];
    if ([v8 isEqualToString:@"empty"]) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v8;
    }
    objc_storeStrong((id *)&v7->_homeUserUUID, v9);

    uint64_t v10 = [v6 objectForKey:@"sharedUserId"];
    if ([v10 isEqualToString:@"empty"]) {
      CFStringRef v11 = 0;
    }
    else {
      CFStringRef v11 = v10;
    }
    objc_storeStrong((id *)&v7->_sharedUserID, v11);

    uint64_t v12 = [v6 objectForKey:@"loggableSharedUserId"];
    if ([v12 isEqualToString:@"empty"]) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v12;
    }
    objc_storeStrong((id *)&v7->_loggableSharedUserID, v13);

    CFStringRef v14 = [v6 objectForKey:@"iCloudAltDSID"];
    if ([v14 isEqualToString:@"empty"]) {
      CFStringRef v15 = 0;
    }
    else {
      CFStringRef v15 = v14;
    }
    objc_storeStrong((id *)&v7->_iCloudAltDSID, v15);

    id v16 = [v6 objectForKey:@"companionAssistantId"];
    if ([v16 isEqualToString:@"empty"]) {
      v17 = 0;
    }
    else {
      v17 = v16;
    }
    objc_storeStrong((id *)&v7->_companionAssistantID, v17);

    id v18 = [v6 objectForKey:@"companionSpeechId"];
    if ([v18 isEqualToString:@"empty"]) {
      v19 = 0;
    }
    else {
      v19 = v18;
    }
    objc_storeStrong((id *)&v7->_companionSpeechID, v19);

    uint64_t v20 = [v6 objectForKey:@"companionIDSIdentifier"];
    if ([v20 isEqualToString:@"empty"]) {
      v21 = 0;
    }
    else {
      v21 = v20;
    }
    objc_storeStrong((id *)&v7->_companionIDSIdentifier, v21);

    v22 = [v6 objectForKey:@"enrollmentName"];
    if ([v22 isEqualToString:@"empty"]) {
      id v23 = 0;
    }
    else {
      id v23 = v22;
    }
    objc_storeStrong((id *)&v7->_enrollmentName, v23);

    v24 = [[ADCommunalDeviceUserAttributes alloc] initWithAttribute:a4];
    attributes = v7->_attributes;
    v7->_attributes = v24;

    uint64_t v26 = [v6 objectForKey:@"speechIdentifier"];
    speechID = v7->_speechID;
    v7->_speechID = (NSString *)v26;

    uint64_t v28 = [v6 objectForKey:@"companionSyncMetadata"];
    companionSyncMetadata = v7->_companionSyncMetadata;
    v7->_companionSyncMetadata = (NSDictionary *)v28;

    v30 = [v6 objectForKey:@"companionSyncMetadataCapable"];
    v7->_companionSyncMetadataCapable = [v30 BOOLValue];

    v31 = [v6 objectForKey:@"companionPeerToPeerHandoffCapable"];
    v7->_companionPeerToPeerHandoffCapable = [v31 BOOLValue];

    if (!v7->_speechID)
    {
      v32 = +[NSUUID UUID];
      uint64_t v33 = [v32 UUIDString];
      v34 = v7->_speechID;
      v7->_speechID = (NSString *)v33;
    }
    uint64_t v35 = [v6 objectForKey:@"cloudShareOwnerName"];
    shareOwnerName = v7->_shareOwnerName;
    v7->_shareOwnerName = (NSString *)v35;

    v37 = [v6 objectForKey:@"voiceIDAllowedByUser"];
    v7->_voiceIDAllowedByUser = [v37 BOOLValue];

    v38 = [v6 objectForKey:@"personalDomainEnabled"];
    v7->_personalDomainsIsEnabled = [v38 BOOLValue];

    v39 = [v6 objectForKey:@"personalDomainUnauthenticatedRequestsAllowed"];
    v7->_unauthenticatedRequestsAllowed = [v39 BOOLValue];

    v40 = [v6 objectForKey:@"allowExplicitContent"];
    v7->_allowExplicitContent = [v40 BOOLValue];

    uint64_t v41 = [v6 objectForKey:@"userAgent"];
    productPrefix = v7->_productPrefix;
    v7->_productPrefix = (NSString *)v41;

    uint64_t v43 = [v6 objectForKey:@"aceHost"];
    aceHost = v7->_aceHost;
    v7->_aceHost = (NSString *)v43;

    uint64_t v45 = [v6 objectForKey:@"loggableCompanionAssistantId"];
    loggableCompanionAssistantID = v7->_loggableCompanionAssistantID;
    v7->_loggableCompanionAssistantID = (NSString *)v45;

    if (!v7->_loggableCompanionAssistantID)
    {
      CFStringRef v47 = +[NSUUID UUID];
      uint64_t v48 = [v47 UUIDString];
      CFStringRef v49 = v7->_loggableCompanionAssistantID;
      v7->_loggableCompanionAssistantID = (NSString *)v48;
    }
    uint64_t v50 = [v6 objectForKey:@"loggableMultiUserSharedUserId"];
    loggableMultiUserSharedUserID = v7->_loggableMultiUserSharedUserID;
    v7->_loggableMultiUserSharedUserID = (NSString *)v50;

    if (!v7->_loggableMultiUserSharedUserID)
    {
      v52 = +[NSUUID UUID];
      uint64_t v53 = [v52 UUIDString];
      v54 = v7->_loggableMultiUserSharedUserID;
      v7->_loggableMultiUserSharedUserID = (NSString *)v53;
    }
    uint64_t v55 = [v6 objectForKey:@"loggableMusicSyncSharedUserId"];
    loggableMusicSyncSharedUserID = v7->_loggableMusicSyncSharedUserID;
    v7->_loggableMusicSyncSharedUserID = (NSString *)v55;

    if (!v7->_loggableMusicSyncSharedUserID)
    {
      v57 = +[NSUUID UUID];
      uint64_t v58 = [v57 UUIDString];
      v59 = v7->_loggableMusicSyncSharedUserID;
      v7->_loggableMusicSyncSharedUserID = (NSString *)v58;
    }
    v60 = [v6 objectForKey:@"homeMemberSettings"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v61 = v60;
      settings = v7->_settings;
      v7->_settings = v61;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_39:
        uint64_t v66 = [v6 objectForKey:@"personaId"];
        personaID = v7->_personaID;
        v7->_personaID = (NSString *)v66;

        uint64_t v68 = [v6 objectForKey:@"perceptionIdentifier"];
        perceptionIdentifier = v7->_perceptionIdentifier;
        v7->_perceptionIdentifier = (NSString *)v68;

        goto LABEL_40;
      }
      settings = [v6 objectForKey:@"homeMemberSettings"];
      v63 = +[AceObject aceObjectWithPlistData:settings];
      uint64_t v64 = [v63 dictionary];
      v65 = v7->_settings;
      v7->_settings = (NSDictionary *)v64;
    }
    goto LABEL_39;
  }
LABEL_40:

  return v7;
}

- (id)init:(id)a3 sharedUserId:(id)a4 loggableSharedUserId:(id)a5 iCloudAltDSID:(id)a6 attribute:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v35.receiver = self;
  v35.super_class = (Class)ADCommunalDeviceUser;
  v17 = [(ADCommunalDeviceUser *)&v35 init];
  id v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_homeUserUUID, a3);
    objc_storeStrong((id *)&v18->_sharedUserID, a4);
    objc_storeStrong((id *)&v18->_loggableSharedUserID, a5);
    objc_storeStrong((id *)&v18->_iCloudAltDSID, a6);
    v19 = [[ADCommunalDeviceUserAttributes alloc] initWithAttribute:a7];
    attributes = v18->_attributes;
    v18->_attributes = v19;

    v21 = +[NSUUID UUID];
    uint64_t v22 = [v21 UUIDString];
    speechID = v18->_speechID;
    v18->_speechID = (NSString *)v22;

    v18->_voiceIDAllowedByUser = 0;
    v24 = +[NSUUID UUID];
    uint64_t v25 = [v24 UUIDString];
    loggableCompanionAssistantID = v18->_loggableCompanionAssistantID;
    v18->_loggableCompanionAssistantID = (NSString *)v25;

    v27 = +[NSUUID UUID];
    uint64_t v28 = [v27 UUIDString];
    loggableMultiUserSharedUserID = v18->_loggableMultiUserSharedUserID;
    v18->_loggableMultiUserSharedUserID = (NSString *)v28;

    v30 = +[NSUUID UUID];
    uint64_t v31 = [v30 UUIDString];
    loggableMusicSyncSharedUserID = v18->_loggableMusicSyncSharedUserID;
    v18->_loggableMusicSyncSharedUserID = (NSString *)v31;

    companionSyncMetadata = v18->_companionSyncMetadata;
    v18->_companionSyncMetadata = (NSDictionary *)&__NSDictionary0__struct;

    *(_WORD *)&v18->_companionSyncMetadataCapable = 0;
  }

  return v18;
}

+ (id)saRemoteDeviceForHomeMember:(id)a3
{
  id v3 = a3;
  id v4 = [v3 companionAssistantID];
  if (v3)
  {
    id v5 = objc_alloc_init((Class)SARemoteDevice);
    [v5 setAssistantId:v4];
    id v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 personalDomainsIsEnabled]);
    [v5 setPersonalDomainsEnabled:v6];

    unsigned int v7 = [v3 unauthenticatedRequestsAllowed];
    CFStringRef v8 = &SARemoteDevicePersonalDomainsAuthenticationModeNeverValue;
    if (!v7) {
      CFStringRef v8 = &SARemoteDevicePersonalDomainsAuthenticationModeSecureRequestsValue;
    }
    [v5 setPersonalDomainsAuthenticationMode:*v8];
    [v5 setSiriEnabled:1];
    uint64_t v9 = [v3 productPrefix];
    [v5 setUserAgent:v9];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)saMultiUserInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)SAMultiUserInfo);
  id v5 = +[ADCommunalDeviceUser saHomeMemberInfo:v3];

  CFStringRef v8 = v5;
  id v6 = +[NSArray arrayWithObjects:&v8 count:1];
  [v4 setHomeMembers:v6];

  return v4;
}

+ (id)saHomeMemberInfo:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)SAHomeMemberInfo);
  id v5 = v4;
  if (v3)
  {
    id v6 = [v3 sharedUserID];
    [v5 setSharedUserId:v6];

    unsigned int v7 = [v3 loggableSharedUserID];
    [v5 setLoggableSharedUserId:v7];

    CFStringRef v8 = [v3 companionAssistantID];
    [v5 setCompanionAssistantId:v8];

    uint64_t v9 = [v3 companionSpeechID];
    [v5 setCompanionSpeechId:v9];

    uint64_t v10 = [v3 attributes];
    CFStringRef v11 = +[ADCommunalDeviceUserAttributes saCopy:v10];
    [v5 setAttributes:v11];

    uint64_t v12 = [v3 enrollmentName];
    [v5 setEnrollmentName:v12];

    id v13 = [v3 speechID];
    [v5 setSpeechId:v13];

    id v14 = [v3 loggableCompanionAssistantID];
    [v5 setLoggableCompanionAssistantId:v14];

    id v15 = [v3 loggableMultiUserSharedUserID];
    [v5 setLoggableMultiUserSharedUserId:v15];

    id v16 = [v3 aceHost];
    [v5 setLastVisitedAceHost:v16];

    id v17 = objc_alloc((Class)SAHomeMemberSettings);
    id v18 = [v3 settings];
    id v19 = [v17 initWithDictionary:v18];

    objc_msgSend(v19, "setMediaPlayerExplicitContentDisallowed:", objc_msgSend(v3, "allowExplicitContent") ^ 1);
    [v5 setHomeMemberSettings:v19];
    uint64_t v20 = [v3 personaID];
    [v5 setPersonaIdentifier:v20];
  }
  else
  {
    uint64_t v21 = AFMultiUserDefaultSharedUserId;
    [v4 setSharedUserId:AFMultiUserDefaultSharedUserId];
    [v5 setLoggableSharedUserId:v21];
    [v5 setCompanionAssistantId:0];
    [v5 setCompanionSpeechId:0];
    uint64_t v22 = +[ADCommunalDeviceUserAttributes saCopy:0];
    [v5 setAttributes:v22];

    [v5 setEnrollmentName:@"unknown"];
    [v5 setSpeechId:0];
    [v5 setLastVisitedAceHost:0];
    [v5 setLoggableCompanionAssistantId:0];
    [v5 setLoggableMultiUserSharedUserId:0];
    [v5 setPersonaIdentifier:v21];
  }

  return v5;
}

@end