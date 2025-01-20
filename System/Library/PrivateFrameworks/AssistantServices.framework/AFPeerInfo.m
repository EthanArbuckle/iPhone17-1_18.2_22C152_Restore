@interface AFPeerInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFPeerInfo)init;
- (AFPeerInfo)initWithBuilder:(id)a3;
- (AFPeerInfo)initWithCoder:(id)a3;
- (AFPeerInfo)initWithDictionaryRepresentation:(id)a3;
- (AFPeerInfo)initWithIsDeviceOwnedByCurrentUser:(BOOL)a3 assistantIdentifier:(id)a4 idsIdentifier:(id)a5 idsDeviceUniqueIdentifier:(id)a6 sharedUserID:(id)a7 rapportEffectiveIdentifier:(id)a8 homeKitAccessoryIdentifier:(id)a9 mediaSystemIdentifier:(id)a10 mediaRouteIdentifier:(id)a11 isCommunalDevice:(BOOL)a12 roomName:(id)a13 name:(id)a14 productType:(id)a15 buildVersion:(id)a16 userInterfaceIdiom:(id)a17 aceVersion:(id)a18 myriadTrialTreatment:(id)a19;
- (AFPeerInfo)initWithIsDeviceOwnedByCurrentUser:(BOOL)a3 assistantIdentifier:(id)a4 sharedUserIdentifier:(id)a5 idsIdentifier:(id)a6 idsDeviceUniqueIdentifier:(id)a7 rapportEffectiveIdentifier:(id)a8 homeKitAccessoryIdentifier:(id)a9 mediaSystemIdentifier:(id)a10 mediaRouteIdentifier:(id)a11 isCommunalDevice:(BOOL)a12 roomName:(id)a13 name:(id)a14 productType:(id)a15 buildVersion:(id)a16 userInterfaceIdiom:(id)a17 aceVersion:(id)a18 isLocationSharingDevice:(BOOL)a19 isSiriCloudSyncEnabled:(BOOL)a20 myriadTrialTreatment:(id)a21;
- (AFPeerInfo)initWithIsDeviceOwnedByCurrentUser:(BOOL)a3 assistantIdentifier:(id)a4 sharedUserIdentifier:(id)a5 idsIdentifier:(id)a6 idsDeviceUniqueIdentifier:(id)a7 rapportEffectiveIdentifier:(id)a8 homeKitAccessoryIdentifier:(id)a9 mediaSystemIdentifier:(id)a10 mediaRouteIdentifier:(id)a11 isCommunalDevice:(BOOL)a12 roomName:(id)a13 name:(id)a14 productType:(id)a15 buildVersion:(id)a16 userInterfaceIdiom:(id)a17 aceVersion:(id)a18 isLocationSharingDevice:(BOOL)a19 myriadTrialTreatment:(id)a20;
- (BOOL)isCommunalDevice;
- (BOOL)isDeviceOwnedByCurrentUser;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocationSharingDevice;
- (BOOL)isSiriCloudSyncEnabled;
- (NSString)aceVersion;
- (NSString)assistantIdentifier;
- (NSString)buildVersion;
- (NSString)description;
- (NSString)homeKitAccessoryIdentifier;
- (NSString)idsDeviceUniqueIdentifier;
- (NSString)idsIdentifier;
- (NSString)mediaRouteIdentifier;
- (NSString)mediaSystemIdentifier;
- (NSString)myriadTrialTreatment;
- (NSString)name;
- (NSString)productType;
- (NSString)rapportEffectiveIdentifier;
- (NSString)roomName;
- (NSString)sharedUserIdentifier;
- (NSString)userInterfaceIdiom;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)ad_shortDescription;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFPeerInfo

- (AFPeerInfo)initWithIsDeviceOwnedByCurrentUser:(BOOL)a3 assistantIdentifier:(id)a4 idsIdentifier:(id)a5 idsDeviceUniqueIdentifier:(id)a6 sharedUserID:(id)a7 rapportEffectiveIdentifier:(id)a8 homeKitAccessoryIdentifier:(id)a9 mediaSystemIdentifier:(id)a10 mediaRouteIdentifier:(id)a11 isCommunalDevice:(BOOL)a12 roomName:(id)a13 name:(id)a14 productType:(id)a15 buildVersion:(id)a16 userInterfaceIdiom:(id)a17 aceVersion:(id)a18 myriadTrialTreatment:(id)a19
{
  LOWORD(v21) = 256;
  LOBYTE(v20) = a12;
  return -[AFPeerInfo initWithIsDeviceOwnedByCurrentUser:assistantIdentifier:sharedUserIdentifier:idsIdentifier:idsDeviceUniqueIdentifier:rapportEffectiveIdentifier:homeKitAccessoryIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:isCommunalDevice:roomName:name:productType:buildVersion:userInterfaceIdiom:aceVersion:isLocationSharingDevice:isSiriCloudSyncEnabled:myriadTrialTreatment:](self, "initWithIsDeviceOwnedByCurrentUser:assistantIdentifier:sharedUserIdentifier:idsIdentifier:idsDeviceUniqueIdentifier:rapportEffectiveIdentifier:homeKitAccessoryIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:isCommunalDevice:roomName:name:productType:buildVersion:userInterfaceIdiom:aceVersion:isLocationSharingDevice:isSiriCloudSyncEnabled:myriadTrialTreatment:", a3, a4, a7, a5, a6, a8, a9, a10, a11, v20, a13, a14, a15, a16,
           a17,
           a18,
           v21,
           a19);
}

- (id)ad_shortDescription
{
  v15 = NSString;
  v17 = [(AFPeerInfo *)self assistantIdentifier];
  v3 = objc_msgSend(v17, "ad_shortDescription");
  v16 = [(AFPeerInfo *)self idsDeviceUniqueIdentifier];
  v4 = objc_msgSend(v16, "ad_shortDescription");
  v5 = [(AFPeerInfo *)self mediaSystemIdentifier];
  v6 = objc_msgSend(v5, "ad_shortDescription");
  v7 = [(AFPeerInfo *)self mediaRouteIdentifier];
  v8 = objc_msgSend(v7, "ad_shortDescription");
  v9 = [(AFPeerInfo *)self name];
  v10 = [(AFPeerInfo *)self roomName];
  BOOL v11 = [(AFPeerInfo *)self isCommunalDevice];
  v12 = [(AFPeerInfo *)self myriadTrialTreatment];
  v13 = [v15 stringWithFormat:@"(assistant=%@, ids=%@, media(s/r)=%@/%@, nm=%@, rm=%@, communal=%d, tt=%@)", v3, v4, v6, v8, v9, v10, v11, v12];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myriadTrialTreatment, 0);
  objc_storeStrong((id *)&self->_aceVersion, 0);
  objc_storeStrong((id *)&self->_userInterfaceIdiom, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_homeKitAccessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportEffectiveIdentifier, 0);
  objc_storeStrong((id *)&self->_idsDeviceUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
}

- (NSString)myriadTrialTreatment
{
  return self->_myriadTrialTreatment;
}

- (BOOL)isSiriCloudSyncEnabled
{
  return self->_isSiriCloudSyncEnabled;
}

- (BOOL)isLocationSharingDevice
{
  return self->_isLocationSharingDevice;
}

- (NSString)aceVersion
{
  return self->_aceVersion;
}

- (NSString)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (BOOL)isCommunalDevice
{
  return self->_isCommunalDevice;
}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (NSString)mediaSystemIdentifier
{
  return self->_mediaSystemIdentifier;
}

- (NSString)homeKitAccessoryIdentifier
{
  return self->_homeKitAccessoryIdentifier;
}

- (NSString)rapportEffectiveIdentifier
{
  return self->_rapportEffectiveIdentifier;
}

- (NSString)idsDeviceUniqueIdentifier
{
  return self->_idsDeviceUniqueIdentifier;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (NSString)sharedUserIdentifier
{
  return self->_sharedUserIdentifier;
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (BOOL)isDeviceOwnedByCurrentUser
{
  return self->_isDeviceOwnedByCurrentUser;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDeviceOwnedByCurrentUser];
  [v3 setObject:v4 forKey:@"isDeviceOwnedByCurrentUser"];

  assistantIdentifier = self->_assistantIdentifier;
  if (assistantIdentifier) {
    [v3 setObject:assistantIdentifier forKey:@"assistantIdentifier"];
  }
  sharedUserIdentifier = self->_sharedUserIdentifier;
  if (sharedUserIdentifier) {
    [v3 setObject:sharedUserIdentifier forKey:@"sharedUserIdentifier"];
  }
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier) {
    [v3 setObject:idsIdentifier forKey:@"idsIdentifier"];
  }
  idsDeviceUniqueIdentifier = self->_idsDeviceUniqueIdentifier;
  if (idsDeviceUniqueIdentifier) {
    [v3 setObject:idsDeviceUniqueIdentifier forKey:@"idsDeviceUniqueIdentifier"];
  }
  rapportEffectiveIdentifier = self->_rapportEffectiveIdentifier;
  if (rapportEffectiveIdentifier) {
    [v3 setObject:rapportEffectiveIdentifier forKey:@"rapportEffectiveIdentifier"];
  }
  homeKitAccessoryIdentifier = self->_homeKitAccessoryIdentifier;
  if (homeKitAccessoryIdentifier) {
    [v3 setObject:homeKitAccessoryIdentifier forKey:@"homeKitAccessoryIdentifier"];
  }
  mediaSystemIdentifier = self->_mediaSystemIdentifier;
  if (mediaSystemIdentifier) {
    [v3 setObject:mediaSystemIdentifier forKey:@"mediaSystemIdentifier"];
  }
  mediaRouteIdentifier = self->_mediaRouteIdentifier;
  if (mediaRouteIdentifier) {
    [v3 setObject:mediaRouteIdentifier forKey:@"mediaRouteIdentifier"];
  }
  v13 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isCommunalDevice];
  [v3 setObject:v13 forKey:@"isCommunalDevice"];

  roomName = self->_roomName;
  if (roomName) {
    [v3 setObject:roomName forKey:@"roomName"];
  }
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  productType = self->_productType;
  if (productType) {
    [v3 setObject:productType forKey:@"productType"];
  }
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    [v3 setObject:buildVersion forKey:@"buildVersion"];
  }
  userInterfaceIdiom = self->_userInterfaceIdiom;
  if (userInterfaceIdiom) {
    [v3 setObject:userInterfaceIdiom forKey:@"userInterfaceIdiom"];
  }
  aceVersion = self->_aceVersion;
  if (aceVersion) {
    [v3 setObject:aceVersion forKey:@"aceVersion"];
  }
  uint64_t v20 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isLocationSharingDevice];
  [v3 setObject:v20 forKey:@"isLocationSharingDevice"];

  uint64_t v21 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSiriCloudSyncEnabled];
  [v3 setObject:v21 forKey:@"isSiriCloudSyncEnabled"];

  myriadTrialTreatment = self->_myriadTrialTreatment;
  if (myriadTrialTreatment) {
    [v3 setObject:myriadTrialTreatment forKey:@"trialTreatment"];
  }
  v23 = (void *)[v3 copy];

  return v23;
}

- (AFPeerInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v46 = self;
    v6 = [v4 objectForKey:@"isDeviceOwnedByCurrentUser"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v7 = v6;
    }
    else {
      id v7 = 0;
    }

    unsigned int v45 = [v7 BOOLValue];
    v9 = [v5 objectForKey:@"assistantIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v52 = v9;
    }
    else {
      id v52 = 0;
    }

    v10 = [v5 objectForKey:@"sharedUserIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v51 = v10;
    }
    else {
      id v51 = 0;
    }

    BOOL v11 = [v5 objectForKey:@"idsIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v44 = v11;
    }
    else {
      id v44 = 0;
    }

    v12 = [v5 objectForKey:@"idsDeviceUniqueIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v43 = v12;
    }
    else {
      id v43 = 0;
    }

    v13 = [v5 objectForKey:@"rapportEffectiveIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v42 = v13;
    }
    else {
      id v42 = 0;
    }

    v14 = [v5 objectForKey:@"homeKitAccessoryIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v50 = v14;
    }
    else {
      id v50 = 0;
    }

    v15 = [v5 objectForKey:@"mediaSystemIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v49 = v15;
    }
    else {
      id v49 = 0;
    }

    v16 = [v5 objectForKey:@"mediaRouteIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v48 = v16;
    }
    else {
      id v48 = 0;
    }

    v17 = [v5 objectForKey:@"isCommunalDevice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }

    char v41 = [v18 BOOLValue];
    v19 = [v5 objectForKey:@"roomName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v47 = v19;
    }
    else {
      id v47 = 0;
    }

    uint64_t v20 = [v5 objectForKey:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v40 = v20;
    }
    else {
      id v40 = 0;
    }

    uint64_t v21 = [v5 objectForKey:@"productType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v22 = v21;
    }
    else {
      id v22 = 0;
    }

    v23 = [v5 objectForKey:@"buildVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v24 = v23;
    }
    else {
      id v24 = 0;
    }

    v25 = [v5 objectForKey:@"userInterfaceIdiom"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v26 = v25;
    }
    else {
      id v26 = 0;
    }

    v27 = [v5 objectForKey:@"aceVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v28 = v27;
    }
    else {
      id v28 = 0;
    }

    v29 = [v5 objectForKey:@"isLocationSharingDevice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v30 = v29;
    }
    else {
      id v30 = 0;
    }

    char v31 = [v30 BOOLValue];
    v32 = [v5 objectForKey:@"isSiriCloudSyncEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v33 = v32;
    }
    else {
      id v33 = 0;
    }

    char v34 = [v33 BOOLValue];
    v35 = [v5 objectForKey:@"trialTreatment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v36 = v35;
    }
    else {
      id v36 = 0;
    }

    BYTE1(v39) = v34;
    LOBYTE(v39) = v31;
    LOBYTE(v38) = v41;
    self = objc_retain(-[AFPeerInfo initWithIsDeviceOwnedByCurrentUser:assistantIdentifier:sharedUserIdentifier:idsIdentifier:idsDeviceUniqueIdentifier:rapportEffectiveIdentifier:homeKitAccessoryIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:isCommunalDevice:roomName:name:productType:buildVersion:userInterfaceIdiom:aceVersion:isLocationSharingDevice:isSiriCloudSyncEnabled:myriadTrialTreatment:](v46, "initWithIsDeviceOwnedByCurrentUser:assistantIdentifier:sharedUserIdentifier:idsIdentifier:idsDeviceUniqueIdentifier:rapportEffectiveIdentifier:homeKitAccessoryIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:isCommunalDevice:roomName:name:productType:buildVersion:userInterfaceIdiom:aceVersion:isLocationSharingDevice:isSiriCloudSyncEnabled:myriadTrialTreatment:", v45, v52, v51, v44, v43, v42, v50, v49, v48, v38, v47, v40, v22,
               v24,
               v26,
               v28,
               v39,
               v36));

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28ED0];
  BOOL isDeviceOwnedByCurrentUser = self->_isDeviceOwnedByCurrentUser;
  id v10 = a3;
  v6 = [v4 numberWithBool:isDeviceOwnedByCurrentUser];
  [v10 encodeObject:v6 forKey:@"AFPeerInfo::isDeviceOwnedByCurrentUser"];

  [v10 encodeObject:self->_assistantIdentifier forKey:@"AFPeerInfo::assistantIdentifier"];
  [v10 encodeObject:self->_sharedUserIdentifier forKey:@"AFPeerInfo::sharedUserIdentifier"];
  [v10 encodeObject:self->_idsIdentifier forKey:@"AFPeerInfo::idsIdentifier"];
  [v10 encodeObject:self->_idsDeviceUniqueIdentifier forKey:@"AFPeerInfo::idsDeviceUniqueIdentifier"];
  [v10 encodeObject:self->_rapportEffectiveIdentifier forKey:@"AFPeerInfo::rapportEffectiveIdentifier"];
  [v10 encodeObject:self->_homeKitAccessoryIdentifier forKey:@"AFPeerInfo::homeKitAccessoryIdentifier"];
  [v10 encodeObject:self->_mediaSystemIdentifier forKey:@"AFPeerInfo::mediaSystemIdentifier"];
  [v10 encodeObject:self->_mediaRouteIdentifier forKey:@"AFPeerInfo::mediaRouteIdentifier"];
  id v7 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isCommunalDevice];
  [v10 encodeObject:v7 forKey:@"AFPeerInfo::isCommunalDevice"];

  [v10 encodeObject:self->_roomName forKey:@"AFPeerInfo::roomName"];
  [v10 encodeObject:self->_name forKey:@"AFPeerInfo::name"];
  [v10 encodeObject:self->_productType forKey:@"AFPeerInfo::productType"];
  [v10 encodeObject:self->_buildVersion forKey:@"AFPeerInfo::buildVersion"];
  [v10 encodeObject:self->_userInterfaceIdiom forKey:@"AFPeerInfo::userInterfaceIdiom"];
  [v10 encodeObject:self->_aceVersion forKey:@"AFPeerInfo::aceVersion"];
  v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isLocationSharingDevice];
  [v10 encodeObject:v8 forKey:@"AFPeerInfo::isLocationSharingDevice"];

  v9 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSiriCloudSyncEnabled];
  [v10 encodeObject:v9 forKey:@"AFPeerInfo::isSiriCloudSyncEnabled"];

  [v10 encodeObject:self->_myriadTrialTreatment forKey:@"AFPeerInfo::myriadTrialTreatment"];
}

- (AFPeerInfo)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::isDeviceOwnedByCurrentUser"];
  unsigned int v24 = [v4 BOOLValue];

  id v30 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::assistantIdentifier"];
  v29 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::sharedUserIdentifier"];
  id v28 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::idsIdentifier"];
  v27 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::idsDeviceUniqueIdentifier"];
  v23 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::rapportEffectiveIdentifier"];
  id v22 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::homeKitAccessoryIdentifier"];
  uint64_t v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::mediaSystemIdentifier"];
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::mediaRouteIdentifier"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::isCommunalDevice"];
  char v21 = [v5 BOOLValue];

  id v18 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::roomName"];
  v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::name"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::productType"];
  id v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::buildVersion"];
  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::userInterfaceIdiom"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::aceVersion"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::isLocationSharingDevice"];
  char v10 = [v9 BOOLValue];

  BOOL v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::isLocationSharingDevice"];
  LOBYTE(v9) = [v11 BOOLValue];

  v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"AFPeerInfo::myriadTrialTreatment"];

  BYTE1(v15) = (_BYTE)v9;
  LOBYTE(v15) = v10;
  LOBYTE(v14) = v21;
  id v26 = -[AFPeerInfo initWithIsDeviceOwnedByCurrentUser:assistantIdentifier:sharedUserIdentifier:idsIdentifier:idsDeviceUniqueIdentifier:rapportEffectiveIdentifier:homeKitAccessoryIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:isCommunalDevice:roomName:name:productType:buildVersion:userInterfaceIdiom:aceVersion:isLocationSharingDevice:isSiriCloudSyncEnabled:myriadTrialTreatment:](self, "initWithIsDeviceOwnedByCurrentUser:assistantIdentifier:sharedUserIdentifier:idsIdentifier:idsDeviceUniqueIdentifier:rapportEffectiveIdentifier:homeKitAccessoryIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:isCommunalDevice:roomName:name:productType:buildVersion:userInterfaceIdiom:aceVersion:isLocationSharingDevice:isSiriCloudSyncEnabled:myriadTrialTreatment:", v24, v30, v29, v28, v27, v23, v22, v20, v19, v14, v18, v17, v6, v7,
          v16,
          v8,
          v15,
          v12);

  return v26;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFPeerInfo *)a3;
  if (self == v4)
  {
    BOOL v41 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL isDeviceOwnedByCurrentUser = self->_isDeviceOwnedByCurrentUser;
      if (isDeviceOwnedByCurrentUser == [(AFPeerInfo *)v5 isDeviceOwnedByCurrentUser]
        && (BOOL isCommunalDevice = self->_isCommunalDevice,
            isCommunalDevice == [(AFPeerInfo *)v5 isCommunalDevice])
        && (BOOL isLocationSharingDevice = self->_isLocationSharingDevice,
            isLocationSharingDevice == [(AFPeerInfo *)v5 isLocationSharingDevice])
        && (BOOL isSiriCloudSyncEnabled = self->_isSiriCloudSyncEnabled,
            isSiriCloudSyncEnabled == [(AFPeerInfo *)v5 isSiriCloudSyncEnabled]))
      {
        char v10 = [(AFPeerInfo *)v5 assistantIdentifier];
        assistantIdentifier = self->_assistantIdentifier;
        if (assistantIdentifier == v10 || [(NSString *)assistantIdentifier isEqual:v10])
        {
          v12 = [(AFPeerInfo *)v5 sharedUserIdentifier];
          sharedUserIdentifier = self->_sharedUserIdentifier;
          if (sharedUserIdentifier == v12 || [(NSString *)sharedUserIdentifier isEqual:v12])
          {
            uint64_t v14 = [(AFPeerInfo *)v5 idsIdentifier];
            idsIdentifier = self->_idsIdentifier;
            if (idsIdentifier == v14 || [(NSString *)idsIdentifier isEqual:v14])
            {
              v16 = [(AFPeerInfo *)v5 idsDeviceUniqueIdentifier];
              idsDeviceUniqueIdentifier = self->_idsDeviceUniqueIdentifier;
              if (idsDeviceUniqueIdentifier == v16
                || [(NSString *)idsDeviceUniqueIdentifier isEqual:v16])
              {
                id v18 = [(AFPeerInfo *)v5 rapportEffectiveIdentifier];
                rapportEffectiveIdentifier = self->_rapportEffectiveIdentifier;
                if (rapportEffectiveIdentifier == v18
                  || [(NSString *)rapportEffectiveIdentifier isEqual:v18])
                {
                  uint64_t v20 = [(AFPeerInfo *)v5 homeKitAccessoryIdentifier];
                  homeKitAccessoryIdentifier = self->_homeKitAccessoryIdentifier;
                  if (homeKitAccessoryIdentifier == v20
                    || [(NSString *)homeKitAccessoryIdentifier isEqual:v20])
                  {
                    id v22 = [(AFPeerInfo *)v5 mediaSystemIdentifier];
                    mediaSystemIdentifier = self->_mediaSystemIdentifier;
                    if (mediaSystemIdentifier == v22
                      || [(NSString *)mediaSystemIdentifier isEqual:v22])
                    {
                      id v50 = v22;
                      unsigned int v24 = [(AFPeerInfo *)v5 mediaRouteIdentifier];
                      mediaRouteIdentifier = self->_mediaRouteIdentifier;
                      if (mediaRouteIdentifier == v24
                        || [(NSString *)mediaRouteIdentifier isEqual:v24])
                      {
                        id v49 = v24;
                        id v26 = [(AFPeerInfo *)v5 roomName];
                        roomName = self->_roomName;
                        if (roomName == v26 || [(NSString *)roomName isEqual:v26])
                        {
                          id v48 = v26;
                          id v28 = [(AFPeerInfo *)v5 name];
                          name = self->_name;
                          if (name == v28 || [(NSString *)name isEqual:v28])
                          {
                            id v47 = v28;
                            id v30 = [(AFPeerInfo *)v5 productType];
                            productType = self->_productType;
                            if (productType == v30 || [(NSString *)productType isEqual:v30])
                            {
                              unsigned int v45 = v30;
                              uint64_t v32 = [(AFPeerInfo *)v5 buildVersion];
                              buildVersion = self->_buildVersion;
                              v46 = (void *)v32;
                              if (buildVersion == (NSString *)v32
                                || [(NSString *)buildVersion isEqual:v32])
                              {
                                char v34 = [(AFPeerInfo *)v5 userInterfaceIdiom];
                                userInterfaceIdiom = self->_userInterfaceIdiom;
                                if (userInterfaceIdiom == v34
                                  || [(NSString *)userInterfaceIdiom isEqual:v34])
                                {
                                  uint64_t v36 = [(AFPeerInfo *)v5 aceVersion];
                                  aceVersion = self->_aceVersion;
                                  id v44 = (void *)v36;
                                  if (aceVersion == (NSString *)v36
                                    || [(NSString *)aceVersion isEqual:v36])
                                  {
                                    uint64_t v38 = [(AFPeerInfo *)v5 myriadTrialTreatment];
                                    myriadTrialTreatment = self->_myriadTrialTreatment;
                                    id v40 = (void *)v38;
                                    BOOL v41 = myriadTrialTreatment == (NSString *)v38
                                       || [(NSString *)myriadTrialTreatment isEqual:v38];
                                  }
                                  else
                                  {
                                    BOOL v41 = 0;
                                  }

                                  char v34 = v43;
                                }
                                else
                                {
                                  BOOL v41 = 0;
                                }
                              }
                              else
                              {
                                BOOL v41 = 0;
                              }

                              id v30 = v45;
                            }
                            else
                            {
                              BOOL v41 = 0;
                            }

                            id v28 = v47;
                          }
                          else
                          {
                            BOOL v41 = 0;
                          }

                          id v26 = v48;
                        }
                        else
                        {
                          BOOL v41 = 0;
                        }

                        unsigned int v24 = v49;
                      }
                      else
                      {
                        BOOL v41 = 0;
                      }

                      id v22 = v50;
                    }
                    else
                    {
                      BOOL v41 = 0;
                    }
                  }
                  else
                  {
                    BOOL v41 = 0;
                  }
                }
                else
                {
                  BOOL v41 = 0;
                }
              }
              else
              {
                BOOL v41 = 0;
              }
            }
            else
            {
              BOOL v41 = 0;
            }
          }
          else
          {
            BOOL v41 = 0;
          }
        }
        else
        {
          BOOL v41 = 0;
        }
      }
      else
      {
        BOOL v41 = 0;
      }
    }
    else
    {
      BOOL v41 = 0;
    }
  }

  return v41;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isDeviceOwnedByCurrentUser];
  uint64_t v4 = [v3 hash];
  NSUInteger v5 = [(NSString *)self->_assistantIdentifier hash];
  NSUInteger v6 = v5 ^ [(NSString *)self->_sharedUserIdentifier hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_idsIdentifier hash] ^ v4;
  NSUInteger v8 = [(NSString *)self->_idsDeviceUniqueIdentifier hash];
  NSUInteger v9 = v8 ^ [(NSString *)self->_rapportEffectiveIdentifier hash];
  NSUInteger v10 = v9 ^ [(NSString *)self->_homeKitAccessoryIdentifier hash];
  NSUInteger v11 = v7 ^ v10 ^ [(NSString *)self->_mediaSystemIdentifier hash];
  NSUInteger v12 = [(NSString *)self->_mediaRouteIdentifier hash];
  v13 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isCommunalDevice];
  uint64_t v14 = v12 ^ [v13 hash];
  NSUInteger v15 = v11 ^ v14 ^ [(NSString *)self->_roomName hash];
  NSUInteger v16 = [(NSString *)self->_name hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_productType hash];
  NSUInteger v18 = v17 ^ [(NSString *)self->_buildVersion hash];
  NSUInteger v19 = v18 ^ [(NSString *)self->_userInterfaceIdiom hash];
  NSUInteger v20 = v19 ^ [(NSString *)self->_aceVersion hash];
  char v21 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isLocationSharingDevice];
  uint64_t v22 = v15 ^ v20 ^ [v21 hash];
  v23 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isSiriCloudSyncEnabled];
  uint64_t v24 = [v23 hash];
  NSUInteger v25 = v22 ^ v24 ^ [(NSString *)self->_myriadTrialTreatment hash];

  return v25;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v13.receiver = self;
  v13.super_class = (Class)AFPeerInfo;
  uint64_t v5 = [(AFPeerInfo *)&v13 description];
  NSUInteger v6 = (void *)v5;
  NSUInteger v7 = @"YES";
  if (self->_isDeviceOwnedByCurrentUser) {
    NSUInteger v8 = @"YES";
  }
  else {
    NSUInteger v8 = @"NO";
  }
  if (self->_isCommunalDevice) {
    NSUInteger v9 = @"YES";
  }
  else {
    NSUInteger v9 = @"NO";
  }
  if (self->_isLocationSharingDevice) {
    NSUInteger v10 = @"YES";
  }
  else {
    NSUInteger v10 = @"NO";
  }
  if (!self->_isSiriCloudSyncEnabled) {
    NSUInteger v7 = @"NO";
  }
  NSUInteger v11 = (void *)[v4 initWithFormat:@"%@ {isDeviceOwnedByCurrentUser = %@, assistantIdentifier = %@, sharedUserIdentifier = %@, idsIdentifier = %@, idsDeviceUniqueIdentifier = %@, rapportEffectiveIdentifier = %@, homeKitAccessoryIdentifier = %@, mediaSystemIdentifier = %@, mediaRouteIdentifier = %@, isCommunalDevice = %@, roomName = %@, name = %@, productType = %@, buildVersion = %@, userInterfaceIdiom = %@, aceVersion = %@, isLocationSharingDevice = %@, isSiriCloudSyncEnabled = %@, trialTreatment = %@}", v5, v8, *(_OWORD *)&self->_assistantIdentifier, *(_OWORD *)&self->_idsIdentifier, *(_OWORD *)&self->_rapportEffectiveIdentifier, self->_mediaSystemIdentifier, self->_mediaRouteIdentifier, v9, *(_OWORD *)&self->_roomName, *(_OWORD *)&self->_productType, self->_userInterfaceIdiom, self->_aceVersion, v10, v7, self->_myriadTrialTreatment];

  return v11;
}

- (NSString)description
{
  return (NSString *)[(AFPeerInfo *)self _descriptionWithIndent:0];
}

- (AFPeerInfo)initWithIsDeviceOwnedByCurrentUser:(BOOL)a3 assistantIdentifier:(id)a4 sharedUserIdentifier:(id)a5 idsIdentifier:(id)a6 idsDeviceUniqueIdentifier:(id)a7 rapportEffectiveIdentifier:(id)a8 homeKitAccessoryIdentifier:(id)a9 mediaSystemIdentifier:(id)a10 mediaRouteIdentifier:(id)a11 isCommunalDevice:(BOOL)a12 roomName:(id)a13 name:(id)a14 productType:(id)a15 buildVersion:(id)a16 userInterfaceIdiom:(id)a17 aceVersion:(id)a18 isLocationSharingDevice:(BOOL)a19 isSiriCloudSyncEnabled:(BOOL)a20 myriadTrialTreatment:(id)a21
{
  id v58 = a4;
  id v57 = a5;
  id v56 = a6;
  id v55 = a7;
  id v25 = a8;
  id v42 = a9;
  id v26 = a10;
  id v27 = a11;
  id v28 = a13;
  id v29 = a14;
  id v30 = a15;
  id v31 = a16;
  id v32 = a17;
  id v33 = a18;
  id v34 = a21;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __381__AFPeerInfo_initWithIsDeviceOwnedByCurrentUser_assistantIdentifier_sharedUserIdentifier_idsIdentifier_idsDeviceUniqueIdentifier_rapportEffectiveIdentifier_homeKitAccessoryIdentifier_mediaSystemIdentifier_mediaRouteIdentifier_isCommunalDevice_roomName_name_productType_buildVersion_userInterfaceIdiom_aceVersion_isLocationSharingDevice_isSiriCloudSyncEnabled_myriadTrialTreatment___block_invoke;
  v59[3] = &unk_1E592C4E8;
  BOOL v75 = a3;
  id v60 = v58;
  id v61 = v57;
  id v62 = v56;
  id v63 = v55;
  id v64 = v25;
  id v65 = v42;
  id v66 = v26;
  id v67 = v27;
  BOOL v76 = a12;
  id v68 = v28;
  id v69 = v29;
  id v70 = v30;
  id v71 = v31;
  id v72 = v32;
  id v73 = v33;
  BOOL v77 = a19;
  BOOL v78 = a20;
  id v74 = v34;
  id v53 = v34;
  id v52 = v33;
  id v51 = v32;
  id v50 = v31;
  id v48 = v30;
  id v47 = v29;
  id v46 = v28;
  id v45 = v27;
  id v44 = v26;
  id v43 = v42;
  id v35 = v25;
  id v36 = v55;
  id v37 = v56;
  id v38 = v57;
  id v39 = v58;
  id v40 = [(AFPeerInfo *)self initWithBuilder:v59];

  return v40;
}

void __381__AFPeerInfo_initWithIsDeviceOwnedByCurrentUser_assistantIdentifier_sharedUserIdentifier_idsIdentifier_idsDeviceUniqueIdentifier_rapportEffectiveIdentifier_homeKitAccessoryIdentifier_mediaSystemIdentifier_mediaRouteIdentifier_isCommunalDevice_roomName_name_productType_buildVersion_userInterfaceIdiom_aceVersion_isLocationSharingDevice_isSiriCloudSyncEnabled_myriadTrialTreatment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 152);
  id v4 = a2;
  [v4 setIsDeviceOwnedByCurrentUser:v3];
  [v4 setAssistantIdentifier:*(void *)(a1 + 32)];
  [v4 setSharedUserIdentifier:*(void *)(a1 + 40)];
  [v4 setIdsIdentifier:*(void *)(a1 + 48)];
  [v4 setIdsDeviceUniqueIdentifier:*(void *)(a1 + 56)];
  [v4 setRapportEffectiveIdentifier:*(void *)(a1 + 64)];
  [v4 setHomeKitAccessoryIdentifier:*(void *)(a1 + 72)];
  [v4 setMediaSystemIdentifier:*(void *)(a1 + 80)];
  [v4 setMediaRouteIdentifier:*(void *)(a1 + 88)];
  [v4 setIsCommunalDevice:*(unsigned __int8 *)(a1 + 153)];
  [v4 setRoomName:*(void *)(a1 + 96)];
  [v4 setName:*(void *)(a1 + 104)];
  [v4 setProductType:*(void *)(a1 + 112)];
  [v4 setBuildVersion:*(void *)(a1 + 120)];
  [v4 setUserInterfaceIdiom:*(void *)(a1 + 128)];
  [v4 setAceVersion:*(void *)(a1 + 136)];
  [v4 setIsLocationSharingDevice:*(unsigned __int8 *)(a1 + 154)];
  [v4 setIsSiriCloudSyncEnabled:*(unsigned __int8 *)(a1 + 155)];
  [v4 setMyriadTrialTreatment:*(void *)(a1 + 144)];
}

- (AFPeerInfo)initWithIsDeviceOwnedByCurrentUser:(BOOL)a3 assistantIdentifier:(id)a4 sharedUserIdentifier:(id)a5 idsIdentifier:(id)a6 idsDeviceUniqueIdentifier:(id)a7 rapportEffectiveIdentifier:(id)a8 homeKitAccessoryIdentifier:(id)a9 mediaSystemIdentifier:(id)a10 mediaRouteIdentifier:(id)a11 isCommunalDevice:(BOOL)a12 roomName:(id)a13 name:(id)a14 productType:(id)a15 buildVersion:(id)a16 userInterfaceIdiom:(id)a17 aceVersion:(id)a18 isLocationSharingDevice:(BOOL)a19 myriadTrialTreatment:(id)a20
{
  id v57 = a4;
  id v56 = a5;
  id v55 = a6;
  id v54 = a7;
  id v24 = a8;
  id v41 = a9;
  id v25 = a10;
  id v26 = a11;
  id v27 = a13;
  id v28 = a14;
  id v29 = a15;
  id v30 = a16;
  id v31 = a17;
  id v32 = a18;
  id v33 = a20;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __358__AFPeerInfo_initWithIsDeviceOwnedByCurrentUser_assistantIdentifier_sharedUserIdentifier_idsIdentifier_idsDeviceUniqueIdentifier_rapportEffectiveIdentifier_homeKitAccessoryIdentifier_mediaSystemIdentifier_mediaRouteIdentifier_isCommunalDevice_roomName_name_productType_buildVersion_userInterfaceIdiom_aceVersion_isLocationSharingDevice_myriadTrialTreatment___block_invoke;
  v58[3] = &unk_1E592C4C0;
  BOOL v74 = a3;
  id v59 = v57;
  id v60 = v56;
  id v61 = v55;
  id v62 = v54;
  id v63 = v24;
  id v64 = v41;
  id v65 = v25;
  id v66 = v26;
  BOOL v75 = a12;
  id v67 = v27;
  id v68 = v28;
  id v69 = v29;
  id v70 = v30;
  id v71 = v31;
  id v72 = v32;
  BOOL v76 = a19;
  id v73 = v33;
  id v52 = v33;
  id v51 = v32;
  id v50 = v31;
  id v48 = v30;
  id v47 = v29;
  id v46 = v28;
  id v45 = v27;
  id v44 = v26;
  id v43 = v25;
  id v42 = v41;
  id v34 = v24;
  id v35 = v54;
  id v36 = v55;
  id v37 = v56;
  id v38 = v57;
  id v39 = [(AFPeerInfo *)self initWithBuilder:v58];

  return v39;
}

void __358__AFPeerInfo_initWithIsDeviceOwnedByCurrentUser_assistantIdentifier_sharedUserIdentifier_idsIdentifier_idsDeviceUniqueIdentifier_rapportEffectiveIdentifier_homeKitAccessoryIdentifier_mediaSystemIdentifier_mediaRouteIdentifier_isCommunalDevice_roomName_name_productType_buildVersion_userInterfaceIdiom_aceVersion_isLocationSharingDevice_myriadTrialTreatment___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a1 + 152);
  id v4 = a2;
  [v4 setIsDeviceOwnedByCurrentUser:v3];
  [v4 setAssistantIdentifier:*(void *)(a1 + 32)];
  [v4 setSharedUserIdentifier:*(void *)(a1 + 40)];
  [v4 setIdsIdentifier:*(void *)(a1 + 48)];
  [v4 setIdsDeviceUniqueIdentifier:*(void *)(a1 + 56)];
  [v4 setRapportEffectiveIdentifier:*(void *)(a1 + 64)];
  [v4 setHomeKitAccessoryIdentifier:*(void *)(a1 + 72)];
  [v4 setMediaSystemIdentifier:*(void *)(a1 + 80)];
  [v4 setMediaRouteIdentifier:*(void *)(a1 + 88)];
  [v4 setIsCommunalDevice:*(unsigned __int8 *)(a1 + 153)];
  [v4 setRoomName:*(void *)(a1 + 96)];
  [v4 setName:*(void *)(a1 + 104)];
  [v4 setProductType:*(void *)(a1 + 112)];
  [v4 setBuildVersion:*(void *)(a1 + 120)];
  [v4 setUserInterfaceIdiom:*(void *)(a1 + 128)];
  [v4 setAceVersion:*(void *)(a1 + 136)];
  [v4 setIsLocationSharingDevice:*(unsigned __int8 *)(a1 + 154)];
  [v4 setIsSiriCloudSyncEnabled:1];
  [v4 setMyriadTrialTreatment:*(void *)(a1 + 144)];
}

- (AFPeerInfo)init
{
  return [(AFPeerInfo *)self initWithBuilder:0];
}

- (AFPeerInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFPeerInfoMutation *))a3;
  v54.receiver = self;
  v54.super_class = (Class)AFPeerInfo;
  uint64_t v5 = [(AFPeerInfo *)&v54 init];
  NSUInteger v6 = v5;
  if (v4 && v5)
  {
    NSUInteger v7 = [[_AFPeerInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFPeerInfoMutation *)v7 isDirty])
    {
      v6->_BOOL isDeviceOwnedByCurrentUser = [(_AFPeerInfoMutation *)v7 getIsDeviceOwnedByCurrentUser];
      NSUInteger v8 = [(_AFPeerInfoMutation *)v7 getAssistantIdentifier];
      uint64_t v9 = [v8 copy];
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = (NSString *)v9;

      NSUInteger v11 = [(_AFPeerInfoMutation *)v7 getSharedUserIdentifier];
      uint64_t v12 = [v11 copy];
      sharedUserIdentifier = v6->_sharedUserIdentifier;
      v6->_sharedUserIdentifier = (NSString *)v12;

      uint64_t v14 = [(_AFPeerInfoMutation *)v7 getIdsIdentifier];
      uint64_t v15 = [v14 copy];
      idsIdentifier = v6->_idsIdentifier;
      v6->_idsIdentifier = (NSString *)v15;

      NSUInteger v17 = [(_AFPeerInfoMutation *)v7 getIdsDeviceUniqueIdentifier];
      uint64_t v18 = [v17 copy];
      idsDeviceUniqueIdentifier = v6->_idsDeviceUniqueIdentifier;
      v6->_idsDeviceUniqueIdentifier = (NSString *)v18;

      NSUInteger v20 = [(_AFPeerInfoMutation *)v7 getRapportEffectiveIdentifier];
      uint64_t v21 = [v20 copy];
      rapportEffectiveIdentifier = v6->_rapportEffectiveIdentifier;
      v6->_rapportEffectiveIdentifier = (NSString *)v21;

      v23 = [(_AFPeerInfoMutation *)v7 getHomeKitAccessoryIdentifier];
      uint64_t v24 = [v23 copy];
      homeKitAccessoryIdentifier = v6->_homeKitAccessoryIdentifier;
      v6->_homeKitAccessoryIdentifier = (NSString *)v24;

      id v26 = [(_AFPeerInfoMutation *)v7 getMediaSystemIdentifier];
      uint64_t v27 = [v26 copy];
      mediaSystemIdentifier = v6->_mediaSystemIdentifier;
      v6->_mediaSystemIdentifier = (NSString *)v27;

      id v29 = [(_AFPeerInfoMutation *)v7 getMediaRouteIdentifier];
      uint64_t v30 = [v29 copy];
      mediaRouteIdentifier = v6->_mediaRouteIdentifier;
      v6->_mediaRouteIdentifier = (NSString *)v30;

      v6->_BOOL isCommunalDevice = [(_AFPeerInfoMutation *)v7 getIsCommunalDevice];
      id v32 = [(_AFPeerInfoMutation *)v7 getRoomName];
      uint64_t v33 = [v32 copy];
      roomName = v6->_roomName;
      v6->_roomName = (NSString *)v33;

      id v35 = [(_AFPeerInfoMutation *)v7 getName];
      uint64_t v36 = [v35 copy];
      name = v6->_name;
      v6->_name = (NSString *)v36;

      id v38 = [(_AFPeerInfoMutation *)v7 getProductType];
      uint64_t v39 = [v38 copy];
      productType = v6->_productType;
      v6->_productType = (NSString *)v39;

      id v41 = [(_AFPeerInfoMutation *)v7 getBuildVersion];
      uint64_t v42 = [v41 copy];
      buildVersion = v6->_buildVersion;
      v6->_buildVersion = (NSString *)v42;

      id v44 = [(_AFPeerInfoMutation *)v7 getUserInterfaceIdiom];
      uint64_t v45 = [v44 copy];
      userInterfaceIdiom = v6->_userInterfaceIdiom;
      v6->_userInterfaceIdiom = (NSString *)v45;

      id v47 = [(_AFPeerInfoMutation *)v7 getAceVersion];
      uint64_t v48 = [v47 copy];
      aceVersion = v6->_aceVersion;
      v6->_aceVersion = (NSString *)v48;

      v6->_BOOL isLocationSharingDevice = [(_AFPeerInfoMutation *)v7 getIsLocationSharingDevice];
      v6->_BOOL isSiriCloudSyncEnabled = [(_AFPeerInfoMutation *)v7 getIsSiriCloudSyncEnabled];
      id v50 = [(_AFPeerInfoMutation *)v7 getMyriadTrialTreatment];
      uint64_t v51 = [v50 copy];
      myriadTrialTreatment = v6->_myriadTrialTreatment;
      v6->_myriadTrialTreatment = (NSString *)v51;
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)newWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _AFPeerInfoMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFPeerInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFPeerInfoMutation *)v5 isDirty])
    {
      NSUInteger v6 = objc_alloc_init(AFPeerInfo);
      v6->_BOOL isDeviceOwnedByCurrentUser = [(_AFPeerInfoMutation *)v5 getIsDeviceOwnedByCurrentUser];
      NSUInteger v7 = [(_AFPeerInfoMutation *)v5 getAssistantIdentifier];
      uint64_t v8 = [v7 copy];
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = (NSString *)v8;

      NSUInteger v10 = [(_AFPeerInfoMutation *)v5 getSharedUserIdentifier];
      uint64_t v11 = [v10 copy];
      sharedUserIdentifier = v6->_sharedUserIdentifier;
      v6->_sharedUserIdentifier = (NSString *)v11;

      objc_super v13 = [(_AFPeerInfoMutation *)v5 getIdsIdentifier];
      uint64_t v14 = [v13 copy];
      idsIdentifier = v6->_idsIdentifier;
      v6->_idsIdentifier = (NSString *)v14;

      NSUInteger v16 = [(_AFPeerInfoMutation *)v5 getIdsDeviceUniqueIdentifier];
      uint64_t v17 = [v16 copy];
      idsDeviceUniqueIdentifier = v6->_idsDeviceUniqueIdentifier;
      v6->_idsDeviceUniqueIdentifier = (NSString *)v17;

      NSUInteger v19 = [(_AFPeerInfoMutation *)v5 getRapportEffectiveIdentifier];
      uint64_t v20 = [v19 copy];
      rapportEffectiveIdentifier = v6->_rapportEffectiveIdentifier;
      v6->_rapportEffectiveIdentifier = (NSString *)v20;

      uint64_t v22 = [(_AFPeerInfoMutation *)v5 getHomeKitAccessoryIdentifier];
      uint64_t v23 = [v22 copy];
      homeKitAccessoryIdentifier = v6->_homeKitAccessoryIdentifier;
      v6->_homeKitAccessoryIdentifier = (NSString *)v23;

      id v25 = [(_AFPeerInfoMutation *)v5 getMediaSystemIdentifier];
      uint64_t v26 = [v25 copy];
      mediaSystemIdentifier = v6->_mediaSystemIdentifier;
      v6->_mediaSystemIdentifier = (NSString *)v26;

      id v28 = [(_AFPeerInfoMutation *)v5 getMediaRouteIdentifier];
      uint64_t v29 = [v28 copy];
      mediaRouteIdentifier = v6->_mediaRouteIdentifier;
      v6->_mediaRouteIdentifier = (NSString *)v29;

      v6->_BOOL isCommunalDevice = [(_AFPeerInfoMutation *)v5 getIsCommunalDevice];
      id v31 = [(_AFPeerInfoMutation *)v5 getRoomName];
      uint64_t v32 = [v31 copy];
      roomName = v6->_roomName;
      v6->_roomName = (NSString *)v32;

      id v34 = [(_AFPeerInfoMutation *)v5 getName];
      uint64_t v35 = [v34 copy];
      name = v6->_name;
      v6->_name = (NSString *)v35;

      id v37 = [(_AFPeerInfoMutation *)v5 getProductType];
      uint64_t v38 = [v37 copy];
      productType = v6->_productType;
      v6->_productType = (NSString *)v38;

      id v40 = [(_AFPeerInfoMutation *)v5 getBuildVersion];
      uint64_t v41 = [v40 copy];
      buildVersion = v6->_buildVersion;
      v6->_buildVersion = (NSString *)v41;

      id v43 = [(_AFPeerInfoMutation *)v5 getUserInterfaceIdiom];
      uint64_t v44 = [v43 copy];
      userInterfaceIdiom = v6->_userInterfaceIdiom;
      v6->_userInterfaceIdiom = (NSString *)v44;

      id v46 = [(_AFPeerInfoMutation *)v5 getAceVersion];
      uint64_t v47 = [v46 copy];
      aceVersion = v6->_aceVersion;
      v6->_aceVersion = (NSString *)v47;

      v6->_BOOL isLocationSharingDevice = [(_AFPeerInfoMutation *)v5 getIsLocationSharingDevice];
      v6->_BOOL isSiriCloudSyncEnabled = [(_AFPeerInfoMutation *)v5 getIsSiriCloudSyncEnabled];
      uint64_t v49 = [(_AFPeerInfoMutation *)v5 getMyriadTrialTreatment];
      myriadTrialTreatment = v6->_myriadTrialTreatment;
      v6->_myriadTrialTreatment = (NSString *)v49;
    }
    else
    {
      NSUInteger v6 = (AFPeerInfo *)[(AFPeerInfo *)self copy];
    }
  }
  else
  {
    NSUInteger v6 = (AFPeerInfo *)[(AFPeerInfo *)self copy];
  }

  return v6;
}

@end