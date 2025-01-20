@interface HMUserInviteInformation
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)_validateInviteInformationForHome:(id)a3;
- (BOOL)isAdministrator;
- (BOOL)isAnnounceAccessAllowed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemoteAccessAllowed;
- (BOOL)isRestrictedGuest;
- (HMRestrictedGuestHomeAccessSettings)restrictedGuestHomeAccessSettings;
- (HMUserInviteInformation)initWithCoder:(id)a3;
- (HMUserInviteInformation)initWithUser:(id)a3 administrator:(BOOL)a4 remoteAccess:(BOOL)a5;
- (HMUserInviteInformation)initWithUser:(id)a3 administrator:(BOOL)a4 remoteAccess:(BOOL)a5 announceAccess:(BOOL)a6 camerasAccessLevel:(unint64_t)a7;
- (HMUserInviteInformation)initWithUser:(id)a3 administrator:(BOOL)a4 remoteAccess:(BOOL)a5 announceAccess:(BOOL)a6 camerasAccessLevel:(unint64_t)a7 restrictedGuest:(BOOL)a8 restrictedGuestHomeAccessSettings:(id)a9;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSString)userID;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)camerasAccessLevel;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setRestrictedGuestHomeAccessSettings:(id)a3;
- (void)setUserID:(id)a3;
@end

@implementation HMUserInviteInformation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedGuestHomeAccessSettings, 0);

  objc_storeStrong((id *)&self->_userID, 0);
}

- (void)setRestrictedGuestHomeAccessSettings:(id)a3
{
}

- (HMRestrictedGuestHomeAccessSettings)restrictedGuestHomeAccessSettings
{
  return (HMRestrictedGuestHomeAccessSettings *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isRestrictedGuest
{
  return self->_restrictedGuest;
}

- (BOOL)isAnnounceAccessAllowed
{
  return self->_announceAccessAllowed;
}

- (unint64_t)camerasAccessLevel
{
  return self->_camerasAccessLevel;
}

- (BOOL)isRemoteAccessAllowed
{
  return self->_remoteAccessAllowed;
}

- (BOOL)isAdministrator
{
  return self->_administrator;
}

- (void)setUserID:(id)a3
{
}

- (NSString)userID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)attributeDescriptions
{
  v26[7] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v25 = [(HMUserInviteInformation *)self userID];
  v24 = (void *)[v3 initWithName:@"User ID" value:v25];
  v26[0] = v24;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMUserInviteInformation *)self isAdministrator];
  v23 = HMFBooleanToString();
  v22 = (void *)[v4 initWithName:@"Administrator" value:v23];
  v26[1] = v22;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMUserInviteInformation *)self isRemoteAccessAllowed];
  v21 = HMFBooleanToString();
  v6 = (void *)[v5 initWithName:@"Remote Access Allowed" value:v21];
  v26[2] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMUserInviteInformation *)self isAnnounceAccessAllowed];
  v8 = HMFBooleanToString();
  v9 = (void *)[v7 initWithName:@"Announce Access Allowed" value:v8];
  v26[3] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = HMUserCameraAccessLevelAsString([(HMUserInviteInformation *)self camerasAccessLevel]);
  v12 = (void *)[v10 initWithName:@"Cameras Access Level" value:v11];
  v26[4] = v12;
  id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
  [(HMUserInviteInformation *)self isRestrictedGuest];
  v14 = HMFBooleanToString();
  v15 = (void *)[v13 initWithName:@"Restricted Guest" value:v14];
  v26[5] = v15;
  id v16 = objc_alloc(MEMORY[0x1E4F653F8]);
  v17 = [(HMUserInviteInformation *)self restrictedGuestHomeAccessSettings];
  v18 = (void *)[v16 initWithName:@"Restricted guest access settings" value:v17];
  v26[6] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:7];

  return (NSArray *)v19;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (HMUserInviteInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMUserInviteInformationUserIDCodingKey"];
  if (v5)
  {
    uint64_t v6 = [v4 decodeBoolForKey:@"HMUserInviteInformationAdministratorCodingKey"];
    uint64_t v7 = [v4 decodeBoolForKey:@"HMUserInviteInformationAnnounceAccessAllowedCodingKey"];
    uint64_t v8 = [v4 decodeBoolForKey:@"HMUserInviteInformationRemoteAccessCodingKey"];
    uint64_t v9 = [v4 decodeIntegerForKey:@"HMUserInviteInformationCamerasAccessLevelCodingKey"];
    uint64_t v10 = [v4 decodeBoolForKey:@"HMUserInviteInformationRestrictedGuestPrivilegeCodingKey"];
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMUserInviteInformationRestrictedGuestHomeAccessSettingsCodingKey"];
    self = [(HMUserInviteInformation *)self initWithUser:v5 administrator:v6 remoteAccess:v8 announceAccess:v7 camerasAccessLevel:v9 restrictedGuest:v10 restrictedGuestHomeAccessSettings:v11];

    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMUserInviteInformation *)self userID];
  [v4 encodeObject:v5 forKey:@"HMUserInviteInformationUserIDCodingKey"];

  objc_msgSend(v4, "encodeBool:forKey:", -[HMUserInviteInformation isAdministrator](self, "isAdministrator"), @"HMUserInviteInformationAdministratorCodingKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMUserInviteInformation isAnnounceAccessAllowed](self, "isAnnounceAccessAllowed"), @"HMUserInviteInformationAnnounceAccessAllowedCodingKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMUserInviteInformation isRemoteAccessAllowed](self, "isRemoteAccessAllowed"), @"HMUserInviteInformationRemoteAccessCodingKey");
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMUserInviteInformation camerasAccessLevel](self, "camerasAccessLevel"), @"HMUserInviteInformationCamerasAccessLevelCodingKey");
  objc_msgSend(v4, "encodeBool:forKey:", -[HMUserInviteInformation isRestrictedGuest](self, "isRestrictedGuest"), @"HMUserInviteInformationRestrictedGuestPrivilegeCodingKey");
  id v6 = [(HMUserInviteInformation *)self restrictedGuestHomeAccessSettings];
  [v4 encodeObject:v6 forKey:@"HMUserInviteInformationRestrictedGuestHomeAccessSettingsCodingKey"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [HMMutableUserInviteInformation alloc];
  id v5 = [(HMUserInviteInformation *)self userID];
  BOOL v6 = [(HMUserInviteInformation *)self isAdministrator];
  BOOL v7 = [(HMUserInviteInformation *)self isRemoteAccessAllowed];
  BOOL v8 = [(HMUserInviteInformation *)self isAnnounceAccessAllowed];
  unint64_t v9 = [(HMUserInviteInformation *)self camerasAccessLevel];
  BOOL v10 = [(HMUserInviteInformation *)self isRestrictedGuest];
  v11 = [(HMUserInviteInformation *)self restrictedGuestHomeAccessSettings];
  v12 = [(HMUserInviteInformation *)v4 initWithUser:v5 administrator:v6 remoteAccess:v7 announceAccess:v8 camerasAccessLevel:v9 restrictedGuest:v10 restrictedGuestHomeAccessSettings:v11];

  return v12;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)_validateInviteInformationForHome:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(HMUserInviteInformation *)self isAdministrator]
    || ![(HMUserInviteInformation *)self isRestrictedGuest])
  {
    BOOL v6 = [(HMUserInviteInformation *)self restrictedGuestHomeAccessSettings];
    if ([(HMUserInviteInformation *)self isAdministrator])
    {
      if (v6)
      {
        BOOL v7 = (void *)MEMORY[0x19F3A64A0]();
        BOOL v8 = self;
        unint64_t v9 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          BOOL v10 = HMFGetLogIdentifier();
          int v14 = 138543618;
          v15 = v10;
          __int16 v16 = 2112;
          v17 = v8;
          v11 = "%{public}@An admin cannot have restricted guest access settings : %@";
LABEL_13:
          _os_log_impl(&dword_19D1A8000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v14, 0x16u);

          goto LABEL_14;
        }
        goto LABEL_14;
      }
    }
    else if ([(HMUserInviteInformation *)self isRestrictedGuest] {
           && ([(HMUserInviteInformation *)self isAnnounceAccessAllowed]
    }
            || [(HMUserInviteInformation *)self camerasAccessLevel]
            || v6 && ([v6 doAllAccessoriesBelongToHome:v4] & 1) == 0))
    {
      BOOL v7 = (void *)MEMORY[0x19F3A64A0]();
      v12 = self;
      unint64_t v9 = HMFGetOSLogHandle();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        BOOL v10 = HMFGetLogIdentifier();
        int v14 = 138543618;
        v15 = v10;
        __int16 v16 = 2112;
        v17 = v12;
        v11 = "%{public}@Restricted guest home access settings are not valid. Either accessory list is empty or they all "
              "do not belong to the same home where this user is supposed to be invited in. : %@";
        goto LABEL_13;
      }
LABEL_14:

      BOOL v5 = 0;
LABEL_18:

      goto LABEL_19;
    }
    BOOL v5 = 1;
    goto LABEL_18;
  }
  BOOL v5 = 0;
LABEL_19:

  return v5;
}

- (unint64_t)hash
{
  id v3 = [(HMUserInviteInformation *)self userID];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = v4 ^ [(HMUserInviteInformation *)self isAdministrator];
  uint64_t v6 = [(HMUserInviteInformation *)self isRemoteAccessAllowed];
  uint64_t v7 = v5 ^ v6 ^ [(HMUserInviteInformation *)self isAnnounceAccessAllowed];
  unint64_t v8 = [(HMUserInviteInformation *)self camerasAccessLevel];
  unint64_t v9 = v8 ^ [(HMUserInviteInformation *)self isRestrictedGuest];
  BOOL v10 = [(HMUserInviteInformation *)self restrictedGuestHomeAccessSettings];
  unint64_t v11 = v7 ^ v9 ^ [v10 hash];

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    uint64_t v7 = [(HMUserInviteInformation *)self userID];
    unint64_t v8 = [v6 userID];
    if ([v7 isEqual:v8]
      && (int v9 = [(HMUserInviteInformation *)self isAdministrator],
          v9 == [v6 isAdministrator])
      && (int v10 = [(HMUserInviteInformation *)self isRemoteAccessAllowed],
          v10 == [v6 isRemoteAccessAllowed])
      && (int v11 = [(HMUserInviteInformation *)self isAnnounceAccessAllowed],
          v11 == [v6 isAnnounceAccessAllowed])
      && (unint64_t v12 = [(HMUserInviteInformation *)self camerasAccessLevel],
          v12 == [v6 camerasAccessLevel])
      && (int v13 = [(HMUserInviteInformation *)self isRestrictedGuest],
          v13 == [v6 isRestrictedGuest]))
    {
      __int16 v16 = [(HMUserInviteInformation *)self restrictedGuestHomeAccessSettings];
      v17 = [v6 restrictedGuestHomeAccessSettings];
      char v14 = HMFEqualObjects();
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (HMUserInviteInformation)initWithUser:(id)a3 administrator:(BOOL)a4 remoteAccess:(BOOL)a5 announceAccess:(BOOL)a6 camerasAccessLevel:(unint64_t)a7 restrictedGuest:(BOOL)a8 restrictedGuestHomeAccessSettings:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  BOOL v13 = a4;
  id v16 = a9;
  v17 = [(HMUserInviteInformation *)self initWithUser:a3 administrator:v13 remoteAccess:v12 announceAccess:v11 camerasAccessLevel:a7];
  uint64_t v18 = v17;
  if (v17)
  {
    v17->_restrictedGuest = a8;
    objc_storeStrong((id *)&v17->_restrictedGuestHomeAccessSettings, a9);
  }

  return v18;
}

- (HMUserInviteInformation)initWithUser:(id)a3 administrator:(BOOL)a4 remoteAccess:(BOOL)a5 announceAccess:(BOOL)a6 camerasAccessLevel:(unint64_t)a7
{
  id v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HMUserInviteInformation;
  char v14 = [(HMUserInviteInformation *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_userID, a3);
    v15->_administrator = a4;
    v15->_remoteAccessAllowed = a5;
    v15->_camerasAccessLevel = a7;
    v15->_announceAccessAllowed = a6;
  }

  return v15;
}

- (HMUserInviteInformation)initWithUser:(id)a3 administrator:(BOOL)a4 remoteAccess:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  int v9 = [(HMUserInviteInformation *)self initWithUser:v8 administrator:v6 remoteAccess:v5 announceAccess:0 camerasAccessLevel:1];

  return v9;
}

@end