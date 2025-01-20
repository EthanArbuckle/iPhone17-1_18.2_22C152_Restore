@interface ADDeviceCirclePeerData
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (ADDeviceCirclePeerData)init;
- (ADDeviceCirclePeerData)initWithAceVersion:(id)a3 assistantIdentifier:(id)a4 buildVersion:(id)a5 productType:(id)a6 sharedUserIdentifier:(id)a7 userAssignedDeviceName:(id)a8 userInterfaceIdiom:(id)a9 isLocationSharingDevice:(id)a10 homeAccessoryInfo:(id)a11 isSiriCloudSyncEnabled:(id)a12 myriadTrialTreatment:(id)a13;
- (ADDeviceCirclePeerData)initWithBuilder:(id)a3;
- (ADDeviceCirclePeerData)initWithCoder:(id)a3;
- (ADDeviceCirclePeerData)initWithDictionaryRepresentation:(id)a3;
- (AFHomeAccessoryInfo)homeAccessoryInfo;
- (BOOL)isEqual:(id)a3;
- (NSNumber)isLocationSharingDevice;
- (NSNumber)isSiriCloudSyncEnabled;
- (NSString)aceVersion;
- (NSString)assistantIdentifier;
- (NSString)buildVersion;
- (NSString)description;
- (NSString)myriadTrialTreatment;
- (NSString)productType;
- (NSString)sharedUserIdentifier;
- (NSString)userAssignedDeviceName;
- (NSString)userInterfaceIdiom;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)buildDictionaryRepresentation;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ADDeviceCirclePeerData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_myriadTrialTreatment, 0);
  objc_storeStrong((id *)&self->_isSiriCloudSyncEnabled, 0);
  objc_storeStrong((id *)&self->_homeAccessoryInfo, 0);
  objc_storeStrong((id *)&self->_isLocationSharingDevice, 0);
  objc_storeStrong((id *)&self->_userInterfaceIdiom, 0);
  objc_storeStrong((id *)&self->_userAssignedDeviceName, 0);
  objc_storeStrong((id *)&self->_sharedUserIdentifier, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_aceVersion, 0);
}

- (NSString)myriadTrialTreatment
{
  return self->_myriadTrialTreatment;
}

- (NSNumber)isSiriCloudSyncEnabled
{
  return self->_isSiriCloudSyncEnabled;
}

- (AFHomeAccessoryInfo)homeAccessoryInfo
{
  return self->_homeAccessoryInfo;
}

- (NSNumber)isLocationSharingDevice
{
  return self->_isLocationSharingDevice;
}

- (NSString)userInterfaceIdiom
{
  return self->_userInterfaceIdiom;
}

- (NSString)userAssignedDeviceName
{
  return self->_userAssignedDeviceName;
}

- (NSString)sharedUserIdentifier
{
  return self->_sharedUserIdentifier;
}

- (NSString)productType
{
  return self->_productType;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (NSString)aceVersion
{
  return self->_aceVersion;
}

- (id)buildDictionaryRepresentation
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = v3;
  aceVersion = self->_aceVersion;
  if (aceVersion) {
    [v3 setObject:aceVersion forKey:@"aceVersion"];
  }
  assistantIdentifier = self->_assistantIdentifier;
  if (assistantIdentifier) {
    [v4 setObject:assistantIdentifier forKey:@"assistantIdentifier"];
  }
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    [v4 setObject:buildVersion forKey:@"buildVersion"];
  }
  productType = self->_productType;
  if (productType) {
    [v4 setObject:productType forKey:@"productType"];
  }
  sharedUserIdentifier = self->_sharedUserIdentifier;
  if (sharedUserIdentifier) {
    [v4 setObject:sharedUserIdentifier forKey:@"sharedUserIdentifier"];
  }
  userAssignedDeviceName = self->_userAssignedDeviceName;
  if (userAssignedDeviceName) {
    [v4 setObject:userAssignedDeviceName forKey:@"userAssignedDeviceName"];
  }
  userInterfaceIdiom = self->_userInterfaceIdiom;
  if (userInterfaceIdiom) {
    [v4 setObject:userInterfaceIdiom forKey:@"userInterfaceIdiom"];
  }
  isLocationSharingDevice = self->_isLocationSharingDevice;
  if (isLocationSharingDevice) {
    [v4 setObject:isLocationSharingDevice forKey:@"isLocationSharingDevice"];
  }
  homeAccessoryInfo = self->_homeAccessoryInfo;
  if (homeAccessoryInfo)
  {
    v14 = [(AFHomeAccessoryInfo *)homeAccessoryInfo buildDictionaryRepresentation];
    [v4 setObject:v14 forKey:@"homeAccessoryInfo"];
  }
  isSiriCloudSyncEnabled = self->_isSiriCloudSyncEnabled;
  if (isSiriCloudSyncEnabled) {
    [v4 setObject:isSiriCloudSyncEnabled forKey:@"isSiriCloudSyncEnabled"];
  }
  myriadTrialTreatment = self->_myriadTrialTreatment;
  if (myriadTrialTreatment) {
    [v4 setObject:myriadTrialTreatment forKey:@"trialTreatment"];
  }
  id v17 = [v4 copy];

  return v17;
}

- (ADDeviceCirclePeerData)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 objectForKey:@"aceVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v30 = v6;
    }
    else {
      id v30 = 0;
    }

    v8 = [v5 objectForKey:@"assistantIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v29 = v8;
    }
    else {
      id v29 = 0;
    }

    v9 = [v5 objectForKey:@"buildVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v28 = v9;
    }
    else {
      id v28 = 0;
    }

    v10 = [v5 objectForKey:@"productType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v27 = v10;
    }
    else {
      id v27 = 0;
    }

    v11 = [v5 objectForKey:@"sharedUserIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v26 = v11;
    }
    else {
      id v26 = 0;
    }

    v12 = [v5 objectForKey:@"userAssignedDeviceName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    v14 = [v5 objectForKey:@"userInterfaceIdiom"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v15 = v14;
    }
    else {
      id v15 = 0;
    }

    v16 = [v5 objectForKey:@"isLocationSharingDevice"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v17 = v16;
    }
    else {
      id v17 = 0;
    }

    v18 = [v5 objectForKey:@"homeAccessoryInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = [objc_alloc((Class)AFHomeAccessoryInfo) initWithDictionaryRepresentation:v18];
    }
    else {
      id v19 = 0;
    }

    v20 = [v5 objectForKey:@"isSiriCloudSyncEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v21 = v20;
    }
    else {
      id v21 = 0;
    }

    v22 = [v5 objectForKey:@"trialTreatment"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v23 = v22;
    }
    else {
      id v23 = 0;
    }

    v25 = [(ADDeviceCirclePeerData *)self initWithAceVersion:v30 assistantIdentifier:v29 buildVersion:v28 productType:v27 sharedUserIdentifier:v26 userAssignedDeviceName:v13 userInterfaceIdiom:v15 isLocationSharingDevice:v17 homeAccessoryInfo:v19 isSiriCloudSyncEnabled:v21 myriadTrialTreatment:v23];
    self = v25;

    v7 = v25;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  aceVersion = self->_aceVersion;
  id v5 = a3;
  [v5 encodeObject:aceVersion forKey:@"ADDeviceCirclePeerData::aceVersion"];
  [v5 encodeObject:self->_assistantIdentifier forKey:@"ADDeviceCirclePeerData::assistantIdentifier"];
  [v5 encodeObject:self->_buildVersion forKey:@"ADDeviceCirclePeerData::buildVersion"];
  [v5 encodeObject:self->_productType forKey:@"ADDeviceCirclePeerData::productType"];
  [v5 encodeObject:self->_sharedUserIdentifier forKey:@"ADDeviceCirclePeerData::sharedUserIdentifier"];
  [v5 encodeObject:self->_userAssignedDeviceName forKey:@"ADDeviceCirclePeerData::userAssignedDeviceName"];
  [v5 encodeObject:self->_userInterfaceIdiom forKey:@"ADDeviceCirclePeerData::userInterfaceIdiom"];
  [v5 encodeObject:self->_isLocationSharingDevice forKey:@"ADDeviceCirclePeerData::isLocationSharingDevice"];
  [v5 encodeObject:self->_homeAccessoryInfo forKey:@"ADDeviceCirclePeerData::homeAccessoryInfo"];
  [v5 encodeObject:self->_isSiriCloudSyncEnabled forKey:@"ADDeviceCirclePeerData::isSiriCloudSyncEnabled"];
  [v5 encodeObject:self->_myriadTrialTreatment forKey:@"ADDeviceCirclePeerData::myriadTrialTreatment"];
}

- (ADDeviceCirclePeerData)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceCirclePeerData::aceVersion"];
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceCirclePeerData::assistantIdentifier"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceCirclePeerData::buildVersion"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceCirclePeerData::productType"];
  id v17 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceCirclePeerData::sharedUserIdentifier"];
  v14 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceCirclePeerData::userAssignedDeviceName"];
  id v13 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceCirclePeerData::userInterfaceIdiom"];
  v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceCirclePeerData::isLocationSharingDevice"];
  v9 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceCirclePeerData::homeAccessoryInfo"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceCirclePeerData::isSiriCloudSyncEnabled"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"ADDeviceCirclePeerData::myriadTrialTreatment"];

  v16 = [(ADDeviceCirclePeerData *)self initWithAceVersion:v4 assistantIdentifier:v5 buildVersion:v6 productType:v7 sharedUserIdentifier:v17 userAssignedDeviceName:v14 userInterfaceIdiom:v13 isLocationSharingDevice:v8 homeAccessoryInfo:v9 isSiriCloudSyncEnabled:v10 myriadTrialTreatment:v11];
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ADDeviceCirclePeerData *)a3;
  if (self == v4)
  {
    BOOL v30 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(ADDeviceCirclePeerData *)v5 aceVersion];
      aceVersion = self->_aceVersion;
      if (aceVersion == v6 || [(NSString *)aceVersion isEqual:v6])
      {
        v8 = [(ADDeviceCirclePeerData *)v5 assistantIdentifier];
        assistantIdentifier = self->_assistantIdentifier;
        if (assistantIdentifier == v8 || [(NSString *)assistantIdentifier isEqual:v8])
        {
          v10 = [(ADDeviceCirclePeerData *)v5 buildVersion];
          buildVersion = self->_buildVersion;
          if (buildVersion == v10 || [(NSString *)buildVersion isEqual:v10])
          {
            v12 = [(ADDeviceCirclePeerData *)v5 productType];
            productType = self->_productType;
            if (productType == v12 || [(NSString *)productType isEqual:v12])
            {
              v14 = [(ADDeviceCirclePeerData *)v5 sharedUserIdentifier];
              sharedUserIdentifier = self->_sharedUserIdentifier;
              if (sharedUserIdentifier == v14
                || [(NSString *)sharedUserIdentifier isEqual:v14])
              {
                v16 = [(ADDeviceCirclePeerData *)v5 userAssignedDeviceName];
                userAssignedDeviceName = self->_userAssignedDeviceName;
                if (userAssignedDeviceName == v16
                  || [(NSString *)userAssignedDeviceName isEqual:v16])
                {
                  v18 = [(ADDeviceCirclePeerData *)v5 userInterfaceIdiom];
                  userInterfaceIdiom = self->_userInterfaceIdiom;
                  if (userInterfaceIdiom == v18
                    || [(NSString *)userInterfaceIdiom isEqual:v18])
                  {
                    v34 = v18;
                    v20 = [(ADDeviceCirclePeerData *)v5 isLocationSharingDevice];
                    isLocationSharingDevice = self->_isLocationSharingDevice;
                    if (isLocationSharingDevice == v20
                      || [(NSNumber *)isLocationSharingDevice isEqual:v20])
                    {
                      v33 = v20;
                      v22 = [(ADDeviceCirclePeerData *)v5 homeAccessoryInfo];
                      homeAccessoryInfo = self->_homeAccessoryInfo;
                      if (homeAccessoryInfo == v22
                        || [(AFHomeAccessoryInfo *)homeAccessoryInfo isEqual:v22])
                      {
                        v32 = v22;
                        v24 = [(ADDeviceCirclePeerData *)v5 isSiriCloudSyncEnabled];
                        isSiriCloudSyncEnabled = self->_isSiriCloudSyncEnabled;
                        if (isSiriCloudSyncEnabled == v24
                          || [(NSNumber *)isSiriCloudSyncEnabled isEqual:v24])
                        {
                          id v26 = [(ADDeviceCirclePeerData *)v5 myriadTrialTreatment];
                          myriadTrialTreatment = self->_myriadTrialTreatment;
                          BOOL v30 = 1;
                          if (myriadTrialTreatment != v26)
                          {
                            id v28 = v26;
                            unsigned int v29 = [(NSString *)myriadTrialTreatment isEqual:v26];
                            id v26 = v28;
                            if (!v29) {
                              BOOL v30 = 0;
                            }
                          }
                        }
                        else
                        {
                          BOOL v30 = 0;
                        }

                        v22 = v32;
                      }
                      else
                      {
                        BOOL v30 = 0;
                      }

                      v20 = v33;
                    }
                    else
                    {
                      BOOL v30 = 0;
                    }

                    v18 = v34;
                  }
                  else
                  {
                    BOOL v30 = 0;
                  }
                }
                else
                {
                  BOOL v30 = 0;
                }
              }
              else
              {
                BOOL v30 = 0;
              }
            }
            else
            {
              BOOL v30 = 0;
            }
          }
          else
          {
            BOOL v30 = 0;
          }
        }
        else
        {
          BOOL v30 = 0;
        }
      }
      else
      {
        BOOL v30 = 0;
      }
    }
    else
    {
      BOOL v30 = 0;
    }
  }

  return v30;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_aceVersion hash];
  unint64_t v4 = [(NSString *)self->_assistantIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_buildVersion hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_productType hash];
  NSUInteger v7 = [(NSString *)self->_sharedUserIdentifier hash];
  unint64_t v8 = v7 ^ [(NSString *)self->_userAssignedDeviceName hash];
  unint64_t v9 = v6 ^ v8 ^ [(NSString *)self->_userInterfaceIdiom hash];
  unint64_t v10 = (unint64_t)[(NSNumber *)self->_isLocationSharingDevice hash];
  unint64_t v11 = v10 ^ (unint64_t)[(AFHomeAccessoryInfo *)self->_homeAccessoryInfo hash];
  unint64_t v12 = v11 ^ (unint64_t)[(NSNumber *)self->_isSiriCloudSyncEnabled hash];
  return v9 ^ v12 ^ [(NSString *)self->_myriadTrialTreatment hash];
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = objc_alloc((Class)NSString);
  v8.receiver = self;
  v8.super_class = (Class)ADDeviceCirclePeerData;
  NSUInteger v5 = [(ADDeviceCirclePeerData *)&v8 description];
  id v6 = [v4 initWithFormat:@"%@ {aceVersion = %@, assistantIdentifier = %@, buildVersion = %@, productType = %@, sharedUserIdentifier = %@, userAssignedDeviceName = %@, userInterfaceIdiom = %@, isLocationSharingDevice = %@, homeAccessoryInfo = %@ isSiriCloudSyncEnabled = %@ trialTreatment = %@}", v5, self->_aceVersion, self->_assistantIdentifier, self->_buildVersion, self->_productType, self->_sharedUserIdentifier, self->_userAssignedDeviceName, self->_userInterfaceIdiom, self->_isLocationSharingDevice, self->_homeAccessoryInfo, self->_isSiriCloudSyncEnabled, self->_myriadTrialTreatment];

  return v6;
}

- (NSString)description
{
  return (NSString *)[(ADDeviceCirclePeerData *)self _descriptionWithIndent:0];
}

- (ADDeviceCirclePeerData)initWithAceVersion:(id)a3 assistantIdentifier:(id)a4 buildVersion:(id)a5 productType:(id)a6 sharedUserIdentifier:(id)a7 userAssignedDeviceName:(id)a8 userInterfaceIdiom:(id)a9 isLocationSharingDevice:(id)a10 homeAccessoryInfo:(id)a11 isSiriCloudSyncEnabled:(id)a12 myriadTrialTreatment:(id)a13
{
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_1001646E0;
  v32[3] = &unk_100503E28;
  id v33 = a3;
  id v34 = a4;
  id v35 = a5;
  id v36 = a6;
  id v37 = a7;
  id v38 = a8;
  id v39 = a9;
  id v40 = a10;
  id v41 = a11;
  id v42 = a12;
  id v43 = a13;
  id v30 = v43;
  id v29 = v42;
  id v18 = v41;
  id v19 = v40;
  id v20 = v39;
  id v21 = v38;
  id v22 = v37;
  id v23 = v36;
  id v24 = v35;
  id v25 = v34;
  id v26 = v33;
  id v27 = [(ADDeviceCirclePeerData *)self initWithBuilder:v32];

  return v27;
}

- (ADDeviceCirclePeerData)init
{
  return [(ADDeviceCirclePeerData *)self initWithBuilder:0];
}

- (ADDeviceCirclePeerData)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceCirclePeerDataMutation *))a3;
  v42.receiver = self;
  v42.super_class = (Class)ADDeviceCirclePeerData;
  NSUInteger v5 = [(ADDeviceCirclePeerData *)&v42 init];
  id v6 = v5;
  if (v4 && v5)
  {
    NSUInteger v7 = [[_ADDeviceCirclePeerDataMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_ADDeviceCirclePeerDataMutation *)v7 isDirty])
    {
      objc_super v8 = [(_ADDeviceCirclePeerDataMutation *)v7 getAceVersion];
      unint64_t v9 = (NSString *)[v8 copy];
      aceVersion = v6->_aceVersion;
      v6->_aceVersion = v9;

      unint64_t v11 = [(_ADDeviceCirclePeerDataMutation *)v7 getAssistantIdentifier];
      unint64_t v12 = (NSString *)[v11 copy];
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = v12;

      v14 = [(_ADDeviceCirclePeerDataMutation *)v7 getBuildVersion];
      id v15 = (NSString *)[v14 copy];
      buildVersion = v6->_buildVersion;
      v6->_buildVersion = v15;

      id v17 = [(_ADDeviceCirclePeerDataMutation *)v7 getProductType];
      id v18 = (NSString *)[v17 copy];
      productType = v6->_productType;
      v6->_productType = v18;

      id v20 = [(_ADDeviceCirclePeerDataMutation *)v7 getSharedUserIdentifier];
      id v21 = (NSString *)[v20 copy];
      sharedUserIdentifier = v6->_sharedUserIdentifier;
      v6->_sharedUserIdentifier = v21;

      id v23 = [(_ADDeviceCirclePeerDataMutation *)v7 getUserAssignedDeviceName];
      id v24 = (NSString *)[v23 copy];
      userAssignedDeviceName = v6->_userAssignedDeviceName;
      v6->_userAssignedDeviceName = v24;

      id v26 = [(_ADDeviceCirclePeerDataMutation *)v7 getUserInterfaceIdiom];
      id v27 = (NSString *)[v26 copy];
      userInterfaceIdiom = v6->_userInterfaceIdiom;
      v6->_userInterfaceIdiom = v27;

      id v29 = [(_ADDeviceCirclePeerDataMutation *)v7 getIsLocationSharingDevice];
      id v30 = (NSNumber *)[v29 copy];
      isLocationSharingDevice = v6->_isLocationSharingDevice;
      v6->_isLocationSharingDevice = v30;

      v32 = [(_ADDeviceCirclePeerDataMutation *)v7 getHomeAccessoryInfo];
      id v33 = (AFHomeAccessoryInfo *)[v32 copy];
      homeAccessoryInfo = v6->_homeAccessoryInfo;
      v6->_homeAccessoryInfo = v33;

      id v35 = [(_ADDeviceCirclePeerDataMutation *)v7 getIsSiriCloudSyncEnabled];
      id v36 = (NSNumber *)[v35 copy];
      isSiriCloudSyncEnabled = v6->_isSiriCloudSyncEnabled;
      v6->_isSiriCloudSyncEnabled = v36;

      id v38 = [(_ADDeviceCirclePeerDataMutation *)v7 getMyriadTrialTreatment];
      id v39 = (NSString *)[v38 copy];
      myriadTrialTreatment = v6->_myriadTrialTreatment;
      v6->_myriadTrialTreatment = v39;
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
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithBuilder:v3];

  return v4;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _ADDeviceCirclePeerDataMutation *))a3;
  if (v4)
  {
    NSUInteger v5 = [[_ADDeviceCirclePeerDataMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_ADDeviceCirclePeerDataMutation *)v5 isDirty])
    {
      id v6 = objc_alloc_init(ADDeviceCirclePeerData);
      NSUInteger v7 = [(_ADDeviceCirclePeerDataMutation *)v5 getAceVersion];
      objc_super v8 = (NSString *)[v7 copy];
      aceVersion = v6->_aceVersion;
      v6->_aceVersion = v8;

      unint64_t v10 = [(_ADDeviceCirclePeerDataMutation *)v5 getAssistantIdentifier];
      unint64_t v11 = (NSString *)[v10 copy];
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = v11;

      id v13 = [(_ADDeviceCirclePeerDataMutation *)v5 getBuildVersion];
      v14 = (NSString *)[v13 copy];
      buildVersion = v6->_buildVersion;
      v6->_buildVersion = v14;

      v16 = [(_ADDeviceCirclePeerDataMutation *)v5 getProductType];
      id v17 = (NSString *)[v16 copy];
      productType = v6->_productType;
      v6->_productType = v17;

      id v19 = [(_ADDeviceCirclePeerDataMutation *)v5 getSharedUserIdentifier];
      id v20 = (NSString *)[v19 copy];
      sharedUserIdentifier = v6->_sharedUserIdentifier;
      v6->_sharedUserIdentifier = v20;

      id v22 = [(_ADDeviceCirclePeerDataMutation *)v5 getUserAssignedDeviceName];
      id v23 = (NSString *)[v22 copy];
      userAssignedDeviceName = v6->_userAssignedDeviceName;
      v6->_userAssignedDeviceName = v23;

      id v25 = [(_ADDeviceCirclePeerDataMutation *)v5 getUserInterfaceIdiom];
      id v26 = (NSString *)[v25 copy];
      userInterfaceIdiom = v6->_userInterfaceIdiom;
      v6->_userInterfaceIdiom = v26;

      id v28 = [(_ADDeviceCirclePeerDataMutation *)v5 getIsLocationSharingDevice];
      id v29 = (NSNumber *)[v28 copy];
      isLocationSharingDevice = v6->_isLocationSharingDevice;
      v6->_isLocationSharingDevice = v29;

      v31 = [(_ADDeviceCirclePeerDataMutation *)v5 getHomeAccessoryInfo];
      v32 = (AFHomeAccessoryInfo *)[v31 copy];
      homeAccessoryInfo = v6->_homeAccessoryInfo;
      v6->_homeAccessoryInfo = v32;

      id v34 = [(_ADDeviceCirclePeerDataMutation *)v5 getMyriadTrialTreatment];
      id v35 = (NSString *)[v34 copy];
      myriadTrialTreatment = v6->_myriadTrialTreatment;
      v6->_myriadTrialTreatment = v35;
    }
    else
    {
      id v6 = (ADDeviceCirclePeerData *)[(ADDeviceCirclePeerData *)self copy];
    }
  }
  else
  {
    id v6 = (ADDeviceCirclePeerData *)[(ADDeviceCirclePeerData *)self copy];
  }

  return v6;
}

@end