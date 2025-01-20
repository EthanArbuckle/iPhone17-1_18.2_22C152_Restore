@interface AFSharedUserInfo
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (AFCompanionDeviceInfo)companionDeviceInfo;
- (AFSharedUserInfo)init;
- (AFSharedUserInfo)initWithBuilder:(id)a3;
- (AFSharedUserInfo)initWithCoder:(id)a3;
- (AFSharedUserInfo)initWithSharedUserId:(id)a3 loggableSharedUserId:(id)a4 companionDeviceInfo:(id)a5 personalRequestsEnabled:(BOOL)a6 companionLinkReady:(BOOL)a7 homeUserId:(id)a8 iCloudAltDSID:(id)a9;
- (BOOL)companionLinkReady;
- (BOOL)isEqual:(id)a3;
- (BOOL)personalRequestsEnabled;
- (NSString)homeUserId;
- (NSString)iCloudAltDSID;
- (NSString)loggableSharedUserId;
- (NSString)sharedUserId;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFSharedUserInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iCloudAltDSID, 0);
  objc_storeStrong((id *)&self->_homeUserId, 0);
  objc_storeStrong((id *)&self->_companionDeviceInfo, 0);
  objc_storeStrong((id *)&self->_loggableSharedUserId, 0);
  objc_storeStrong((id *)&self->_sharedUserId, 0);
}

- (NSString)iCloudAltDSID
{
  return self->_iCloudAltDSID;
}

- (NSString)homeUserId
{
  return self->_homeUserId;
}

- (BOOL)companionLinkReady
{
  return self->_companionLinkReady;
}

- (BOOL)personalRequestsEnabled
{
  return self->_personalRequestsEnabled;
}

- (AFCompanionDeviceInfo)companionDeviceInfo
{
  return self->_companionDeviceInfo;
}

- (NSString)loggableSharedUserId
{
  return self->_loggableSharedUserId;
}

- (NSString)sharedUserId
{
  return self->_sharedUserId;
}

- (void)encodeWithCoder:(id)a3
{
  sharedUserId = self->_sharedUserId;
  id v7 = a3;
  [v7 encodeObject:sharedUserId forKey:@"AFSharedUserInfo::sharedUserId"];
  [v7 encodeObject:self->_loggableSharedUserId forKey:@"AFSharedUserInfo::loggableSharedUserId"];
  [v7 encodeObject:self->_companionDeviceInfo forKey:@"AFSharedUserInfo::companionDeviceInfo"];
  v5 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_personalRequestsEnabled];
  [v7 encodeObject:v5 forKey:@"AFSharedUserInfo::personalRequestsEnabled"];

  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_companionLinkReady];
  [v7 encodeObject:v6 forKey:@"AFSharedUserInfo::companionLinkReady"];

  [v7 encodeObject:self->_homeUserId forKey:@"AFSharedUserInfo::homeUserId"];
  [v7 encodeObject:self->_iCloudAltDSID forKey:@"AFSharedUserInfo::iCloudAltDSID"];
}

- (AFSharedUserInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSharedUserInfo::sharedUserId"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSharedUserInfo::loggableSharedUserId"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSharedUserInfo::companionDeviceInfo"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSharedUserInfo::personalRequestsEnabled"];
  uint64_t v9 = [v8 BOOLValue];

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSharedUserInfo::companionLinkReady"];
  uint64_t v11 = [v10 BOOLValue];

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSharedUserInfo::homeUserId"];
  v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AFSharedUserInfo::iCloudAltDSID"];

  v14 = [(AFSharedUserInfo *)self initWithSharedUserId:v5 loggableSharedUserId:v6 companionDeviceInfo:v7 personalRequestsEnabled:v9 companionLinkReady:v11 homeUserId:v12 iCloudAltDSID:v13];
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (AFSharedUserInfo *)a3;
  if (self == v4)
  {
    BOOL v18 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL personalRequestsEnabled = self->_personalRequestsEnabled;
      if (personalRequestsEnabled == [(AFSharedUserInfo *)v5 personalRequestsEnabled]
        && (BOOL companionLinkReady = self->_companionLinkReady,
            companionLinkReady == [(AFSharedUserInfo *)v5 companionLinkReady]))
      {
        v8 = [(AFSharedUserInfo *)v5 sharedUserId];
        sharedUserId = self->_sharedUserId;
        if (sharedUserId == v8 || [(NSString *)sharedUserId isEqual:v8])
        {
          v10 = [(AFSharedUserInfo *)v5 loggableSharedUserId];
          loggableSharedUserId = self->_loggableSharedUserId;
          if (loggableSharedUserId == v10 || [(NSString *)loggableSharedUserId isEqual:v10])
          {
            v12 = [(AFSharedUserInfo *)v5 companionDeviceInfo];
            companionDeviceInfo = self->_companionDeviceInfo;
            if (companionDeviceInfo == v12 || [(AFCompanionDeviceInfo *)companionDeviceInfo isEqual:v12])
            {
              v14 = [(AFSharedUserInfo *)v5 homeUserId];
              homeUserId = self->_homeUserId;
              if (homeUserId == v14 || [(NSString *)homeUserId isEqual:v14])
              {
                v16 = [(AFSharedUserInfo *)v5 iCloudAltDSID];
                iCloudAltDSID = self->_iCloudAltDSID;
                BOOL v18 = iCloudAltDSID == v16 || [(NSString *)iCloudAltDSID isEqual:v16];
              }
              else
              {
                BOOL v18 = 0;
              }
            }
            else
            {
              BOOL v18 = 0;
            }
          }
          else
          {
            BOOL v18 = 0;
          }
        }
        else
        {
          BOOL v18 = 0;
        }
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }

  return v18;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sharedUserId hash];
  NSUInteger v4 = [(NSString *)self->_loggableSharedUserId hash] ^ v3;
  unint64_t v5 = v4 ^ [(AFCompanionDeviceInfo *)self->_companionDeviceInfo hash];
  v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_personalRequestsEnabled];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_companionLinkReady];
  uint64_t v9 = [v8 hash];
  NSUInteger v10 = v7 ^ v9 ^ [(NSString *)self->_homeUserId hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_iCloudAltDSID hash];

  return v11;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v11.receiver = self;
  v11.super_class = (Class)AFSharedUserInfo;
  uint64_t v5 = [(AFSharedUserInfo *)&v11 description];
  v6 = (void *)v5;
  uint64_t v7 = @"YES";
  if (self->_personalRequestsEnabled) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  if (!self->_companionLinkReady) {
    uint64_t v7 = @"NO";
  }
  uint64_t v9 = (void *)[v4 initWithFormat:@"%@ {sharedUserId = %@, loggableSharedUserId = %@, companionDeviceInfo = %@, personalRequestsEnabled = %@, companionLinkReady = %@, homeUserId = %@, iCloudAltDSID = %@}", v5, *(_OWORD *)&self->_sharedUserId, self->_companionDeviceInfo, v8, v7, self->_homeUserId, self->_iCloudAltDSID];

  return v9;
}

- (id)description
{
  return [(AFSharedUserInfo *)self _descriptionWithIndent:0];
}

- (AFSharedUserInfo)initWithSharedUserId:(id)a3 loggableSharedUserId:(id)a4 companionDeviceInfo:(id)a5 personalRequestsEnabled:(BOOL)a6 companionLinkReady:(BOOL)a7 homeUserId:(id)a8 iCloudAltDSID:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __150__AFSharedUserInfo_initWithSharedUserId_loggableSharedUserId_companionDeviceInfo_personalRequestsEnabled_companionLinkReady_homeUserId_iCloudAltDSID___block_invoke;
  v27[3] = &unk_1E5928C48;
  id v28 = v15;
  id v29 = v16;
  BOOL v33 = a6;
  BOOL v34 = a7;
  id v30 = v17;
  id v31 = v18;
  id v32 = v19;
  id v20 = v19;
  id v21 = v18;
  id v22 = v17;
  id v23 = v16;
  id v24 = v15;
  v25 = [(AFSharedUserInfo *)self initWithBuilder:v27];

  return v25;
}

void __150__AFSharedUserInfo_initWithSharedUserId_loggableSharedUserId_companionDeviceInfo_personalRequestsEnabled_companionLinkReady_homeUserId_iCloudAltDSID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setSharedUserId:v3];
  [v4 setLoggableSharedUserId:*(void *)(a1 + 40)];
  [v4 setCompanionDeviceInfo:*(void *)(a1 + 48)];
  [v4 setPersonalRequestsEnabled:*(unsigned __int8 *)(a1 + 72)];
  [v4 setCompanionLinkReady:*(unsigned __int8 *)(a1 + 73)];
  [v4 setHomeUserId:*(void *)(a1 + 56)];
  [v4 setICloudAltDSID:*(void *)(a1 + 64)];
}

- (AFSharedUserInfo)init
{
  return [(AFSharedUserInfo *)self initWithBuilder:0];
}

- (AFSharedUserInfo)initWithBuilder:(id)a3
{
  id v4 = (void (**)(id, _AFSharedUserInfoMutation *))a3;
  v24.receiver = self;
  v24.super_class = (Class)AFSharedUserInfo;
  uint64_t v5 = [(AFSharedUserInfo *)&v24 init];
  v6 = v5;
  if (v4 && v5)
  {
    uint64_t v7 = [[_AFSharedUserInfoMutation alloc] initWithBase:0];
    v4[2](v4, v7);
    if ([(_AFSharedUserInfoMutation *)v7 isDirty])
    {
      v8 = [(_AFSharedUserInfoMutation *)v7 getSharedUserId];
      uint64_t v9 = [v8 copy];
      sharedUserId = v6->_sharedUserId;
      v6->_sharedUserId = (NSString *)v9;

      objc_super v11 = [(_AFSharedUserInfoMutation *)v7 getLoggableSharedUserId];
      uint64_t v12 = [v11 copy];
      loggableSharedUserId = v6->_loggableSharedUserId;
      v6->_loggableSharedUserId = (NSString *)v12;

      v14 = [(_AFSharedUserInfoMutation *)v7 getCompanionDeviceInfo];
      uint64_t v15 = [v14 copy];
      companionDeviceInfo = v6->_companionDeviceInfo;
      v6->_companionDeviceInfo = (AFCompanionDeviceInfo *)v15;

      v6->_BOOL personalRequestsEnabled = [(_AFSharedUserInfoMutation *)v7 getPersonalRequestsEnabled];
      v6->_BOOL companionLinkReady = [(_AFSharedUserInfoMutation *)v7 getCompanionLinkReady];
      id v17 = [(_AFSharedUserInfoMutation *)v7 getHomeUserId];
      uint64_t v18 = [v17 copy];
      homeUserId = v6->_homeUserId;
      v6->_homeUserId = (NSString *)v18;

      id v20 = [(_AFSharedUserInfoMutation *)v7 getICloudAltDSID];
      uint64_t v21 = [v20 copy];
      iCloudAltDSID = v6->_iCloudAltDSID;
      v6->_iCloudAltDSID = (NSString *)v21;
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
  id v4 = (void (**)(id, _AFSharedUserInfoMutation *))a3;
  if (v4)
  {
    uint64_t v5 = [[_AFSharedUserInfoMutation alloc] initWithBase:self];
    v4[2](v4, v5);
    if ([(_AFSharedUserInfoMutation *)v5 isDirty])
    {
      v6 = objc_alloc_init(AFSharedUserInfo);
      uint64_t v7 = [(_AFSharedUserInfoMutation *)v5 getSharedUserId];
      uint64_t v8 = [v7 copy];
      sharedUserId = v6->_sharedUserId;
      v6->_sharedUserId = (NSString *)v8;

      NSUInteger v10 = [(_AFSharedUserInfoMutation *)v5 getLoggableSharedUserId];
      uint64_t v11 = [v10 copy];
      loggableSharedUserId = v6->_loggableSharedUserId;
      v6->_loggableSharedUserId = (NSString *)v11;

      v13 = [(_AFSharedUserInfoMutation *)v5 getCompanionDeviceInfo];
      uint64_t v14 = [v13 copy];
      companionDeviceInfo = v6->_companionDeviceInfo;
      v6->_companionDeviceInfo = (AFCompanionDeviceInfo *)v14;

      v6->_BOOL personalRequestsEnabled = [(_AFSharedUserInfoMutation *)v5 getPersonalRequestsEnabled];
      v6->_BOOL companionLinkReady = [(_AFSharedUserInfoMutation *)v5 getCompanionLinkReady];
      id v16 = [(_AFSharedUserInfoMutation *)v5 getHomeUserId];
      uint64_t v17 = [v16 copy];
      homeUserId = v6->_homeUserId;
      v6->_homeUserId = (NSString *)v17;

      id v19 = [(_AFSharedUserInfoMutation *)v5 getICloudAltDSID];
      uint64_t v20 = [v19 copy];
      iCloudAltDSID = v6->_iCloudAltDSID;
      v6->_iCloudAltDSID = (NSString *)v20;
    }
    else
    {
      v6 = (AFSharedUserInfo *)[(AFSharedUserInfo *)self copy];
    }
  }
  else
  {
    v6 = (AFSharedUserInfo *)[(AFSharedUserInfo *)self copy];
  }

  return v6;
}

@end