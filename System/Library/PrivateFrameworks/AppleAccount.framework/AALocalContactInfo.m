@interface AALocalContactInfo
+ (BOOL)supportsSecureCoding;
- (AAInheritanceContactInfo)inheritanceContactInfo;
- (AALocalContactInfo)initWithCoder:(id)a3;
- (AALocalContactInfo)initWithFamilyDSID:(id)a3 firstName:(id)a4 lastName:(id)a5 fullName:(id)a6 appleID:(id)a7 familyMemberType:(id)a8 isChild:(BOOL)a9;
- (AALocalContactInfo)initWithHandle:(id)a3 contact:(id)a4;
- (AALocalContactInfo)initWithHandle:(id)a3 firstName:(id)a4 lastName:(id)a5;
- (BOOL)_isEqualToLocalContact:(id)a3;
- (BOOL)isAcceptedAndShared;
- (BOOL)isChild;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFamilyMember;
- (BOOL)isIdMSConfirmed;
- (NSData)imageData;
- (NSNumber)familyDSID;
- (NSString)familyMemberType;
- (NSString)firstName;
- (NSString)fullName;
- (NSString)handle;
- (NSString)lastName;
- (NSUUID)custodianID;
- (id)_detailsTextForContactType;
- (id)_fullNameFromFirstName:(id)a3 lastName:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)displayName;
- (id)firstNameOrHandleForDisplay;
- (int64_t)contactType;
- (int64_t)preflightStatus;
- (int64_t)trustedContactStatus;
- (void)encodeWithCoder:(id)a3;
- (void)setContactType:(int64_t)a3;
- (void)setCustodianID:(id)a3;
- (void)setImageData:(id)a3;
- (void)setInheritanceContactInfo:(id)a3;
- (void)setIsAcceptedAndShared:(BOOL)a3;
- (void)setIsIdMSConfirmed:(BOOL)a3;
- (void)setPreflightStatus:(int64_t)a3;
- (void)setTrustedContactStatus:(int64_t)a3;
@end

@implementation AALocalContactInfo

- (AALocalContactInfo)initWithHandle:(id)a3 firstName:(id)a4 lastName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AALocalContactInfo;
  v12 = [(AALocalContactInfo *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_handle, a3);
    objc_storeStrong((id *)&v13->_firstName, a4);
    objc_storeStrong((id *)&v13->_lastName, a5);
    uint64_t v14 = [(AALocalContactInfo *)v13 _fullNameFromFirstName:v10 lastName:v11];
    fullName = v13->_fullName;
    v13->_fullName = (NSString *)v14;
  }
  return v13;
}

- (AALocalContactInfo)initWithHandle:(id)a3 contact:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 givenName];
    id v10 = [v7 familyName];
    int v17 = 138412802;
    v18 = v9;
    __int16 v19 = 2112;
    v20 = v10;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "Local contact First name :%@  lastname: %@ handle %@", (uint8_t *)&v17, 0x20u);
  }
  id v11 = [v7 givenName];
  v12 = [v7 familyName];
  v13 = [(AALocalContactInfo *)self initWithHandle:v6 firstName:v11 lastName:v12];

  if (v13)
  {
    uint64_t v14 = [v7 thumbnailImageData];
    imageData = v13->_imageData;
    v13->_imageData = (NSData *)v14;
  }
  return v13;
}

- (AALocalContactInfo)initWithFamilyDSID:(id)a3 firstName:(id)a4 lastName:(id)a5 fullName:(id)a6 appleID:(id)a7 familyMemberType:(id)a8 isChild:(BOOL)a9
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a8;
  __int16 v19 = [(AALocalContactInfo *)self initWithHandle:a7 firstName:a4 lastName:a5];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_fullName, a6);
    objc_storeStrong((id *)&v20->_familyDSID, a3);
    objc_storeStrong((id *)&v20->_familyMemberType, a8);
    v20->_contactType |= 0x10uLL;
    v20->_isChild = a9;
  }

  return v20;
}

- (AALocalContactInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(AALocalContactInfo *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_handle"];
    handle = v5->_handle;
    v5->_handle = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fullName"];
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_familyDSID"];
    familyDSID = v5->_familyDSID;
    v5->_familyDSID = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_familyMemberType"];
    familyMemberType = v5->_familyMemberType;
    v5->_familyMemberType = (NSString *)v18;

    v5->_isChild = [v4 decodeBoolForKey:@"_isChild"];
    v5->_contactType = [v4 decodeIntegerForKey:@"_contactType"];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_custodianID"];
    custodianID = v5->_custodianID;
    v5->_custodianID = (NSUUID *)v20;

    v5->_trustedContactStatus = [v4 decodeIntegerForKey:@"_trustedContactStatus"];
    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_inheritanceContactInfo"];
    inheritanceContactInfo = v5->_inheritanceContactInfo;
    v5->_inheritanceContactInfo = (AAInheritanceContactInfo *)v22;

    v5->_isAcceptedAndShared = [v4 decodeBoolForKey:@"_isAcceptedAndShared"];
    v5->_isIdMSConfirmed = [v4 decodeBoolForKey:@"_isIdMSConfirmed"];
    v5->_preflightStatus = [v4 decodeIntegerForKey:@"_preflightStatus"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  handle = self->_handle;
  id v5 = a3;
  [v5 encodeObject:handle forKey:@"_handle"];
  [v5 encodeObject:self->_fullName forKey:@"_fullName"];
  [v5 encodeObject:self->_firstName forKey:@"_firstName"];
  [v5 encodeObject:self->_lastName forKey:@"_lastName"];
  [v5 encodeObject:self->_imageData forKey:@"_imageData"];
  [v5 encodeObject:self->_familyDSID forKey:@"_familyDSID"];
  [v5 encodeObject:self->_familyMemberType forKey:@"_familyMemberType"];
  [v5 encodeBool:self->_isChild forKey:@"_isChild"];
  [v5 encodeInteger:self->_contactType forKey:@"_contactType"];
  [v5 encodeObject:self->_custodianID forKey:@"_custodianID"];
  [v5 encodeInteger:self->_trustedContactStatus forKey:@"_trustedContactStatus"];
  [v5 encodeObject:self->_inheritanceContactInfo forKey:@"_inheritanceContactInfo"];
  [v5 encodeBool:self->_isAcceptedAndShared forKey:@"_isAcceptedAndShared"];
  [v5 encodeBool:self->_isIdMSConfirmed forKey:@"_isIdMSConfirmed"];
  [v5 encodeInteger:self->_preflightStatus forKey:@"_preflightStatus"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [(NSString *)self->_handle copy];
  uint64_t v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = [(NSString *)self->_fullName copy];
  uint64_t v8 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v7;

  uint64_t v9 = [(NSString *)self->_firstName copy];
  uint64_t v10 = *(void **)(v4 + 32);
  *(void *)(v4 + 32) = v9;

  uint64_t v11 = [(NSString *)self->_lastName copy];
  uint64_t v12 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v11;

  uint64_t v13 = [(NSData *)self->_imageData copy];
  uint64_t v14 = *(void **)(v4 + 64);
  *(void *)(v4 + 64) = v13;

  uint64_t v15 = [(NSNumber *)self->_familyDSID copy];
  uint64_t v16 = *(void **)(v4 + 48);
  *(void *)(v4 + 48) = v15;

  uint64_t v17 = [(NSString *)self->_familyMemberType copy];
  uint64_t v18 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = v17;

  *(unsigned char *)(v4 + 8) = self->_isChild;
  *(void *)(v4 + 72) = self->_contactType;
  uint64_t v19 = [(NSUUID *)self->_custodianID copy];
  uint64_t v20 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v19;

  *(void *)(v4 + 88) = self->_trustedContactStatus;
  int64_t contactType = self->_contactType;
  if ((contactType & 4) != 0 || (contactType & 8) != 0)
  {
    uint64_t v22 = [(AAInheritanceContactInfo *)self->_inheritanceContactInfo copy];
    uint64_t v23 = *(void **)(v4 + 104);
    *(void *)(v4 + 104) = v22;
  }
  *(unsigned char *)(v4 + 9) = self->_isAcceptedAndShared;
  *(unsigned char *)(v4 + 10) = self->_isIdMSConfirmed;
  *(void *)(v4 + 96) = self->_preflightStatus;
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(AALocalContactInfo *)self _isEqualToLocalContact:v4];

  return v5;
}

- (id)displayName
{
  v3 = [(AALocalContactInfo *)self fullName];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    BOOL v5 = [(AALocalContactInfo *)self fullName];
  }
  else
  {
    uint64_t v6 = [(AALocalContactInfo *)self handle];
    uint64_t v7 = [v6 length];

    if (v7) {
      [(AALocalContactInfo *)self handle];
    }
    else {
    BOOL v5 = [(AALocalContactInfo *)self firstName];
    }
  }

  return v5;
}

- (id)firstNameOrHandleForDisplay
{
  v3 = [(AALocalContactInfo *)self firstName];
  uint64_t v4 = [v3 length];

  if (v4) {
    [(AALocalContactInfo *)self firstName];
  }
  else {
  BOOL v5 = [(AALocalContactInfo *)self handle];
  }

  return v5;
}

- (BOOL)isFamilyMember
{
  return ((unint64_t)[(AALocalContactInfo *)self contactType] >> 4) & 1;
}

- (id)_fullNameFromFirstName:(id)a3 lastName:(id)a4
{
  BOOL v5 = (objc_class *)MEMORY[0x1E4F28F30];
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc_init(v5);
  [v8 setGivenName:v7];

  [v8 setFamilyName:v6];
  uint64_t v9 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v8 style:2 options:0];

  return v9;
}

- (BOOL)_isEqualToLocalContact:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(AALocalContactInfo *)self handle];
  id v6 = [v5 lowercaseString];
  id v7 = [v4 handle];

  id v8 = [v7 lowercaseString];
  char v9 = [v6 isEqualToString:v8];

  return v9;
}

- (id)_detailsTextForContactType
{
  int64_t contactType = self->_contactType;
  if (contactType)
  {
    int64_t v7 = [(AALocalContactInfo *)self trustedContactStatus];
    if (v7 != 3)
    {
      if (v7 != 2)
      {
        if (v7 == 1)
        {
          id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
          BOOL v5 = v4;
          id v6 = @"ACCOUNT_RECOVERY_CONTACT_STATUS_PENDING";
          goto LABEL_17;
        }
LABEL_14:
        id v8 = 0;
        goto LABEL_18;
      }
      if ([(AALocalContactInfo *)self preflightStatus])
      {
        if (![(AALocalContactInfo *)self isAcceptedAndShared]
          || ![(AALocalContactInfo *)self isIdMSConfirmed])
        {
          id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
          BOOL v5 = v4;
          id v6 = @"ACCOUNT_RECOVERY_CONTACT_STATUS_ACCEPTED_BUT_SHARE_PENDING";
          goto LABEL_17;
        }
        goto LABEL_14;
      }
    }
    id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
    BOOL v5 = v4;
    id v6 = @"ACCOUNT_RECOVERY_CONTACT_STATUS_NOT_REACHABLE";
    goto LABEL_17;
  }
  if ((contactType & 4) == 0 || [(AALocalContactInfo *)self trustedContactStatus] != 1)
  {
    if ([(AALocalContactInfo *)self isFamilyMember])
    {
      id v8 = [(AALocalContactInfo *)self familyMemberType];
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  id v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AppleAccount"];
  BOOL v5 = v4;
  id v6 = @"ACCOUNT_BENEFICIARY_CONTACT_STATUS_PENDING";
LABEL_17:
  id v8 = [v4 localizedStringForKey:v6 value:0 table:@"Localizable"];

LABEL_18:

  return v8;
}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSNumber)familyDSID
{
  return self->_familyDSID;
}

- (NSString)familyMemberType
{
  return self->_familyMemberType;
}

- (BOOL)isChild
{
  return self->_isChild;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (int64_t)contactType
{
  return self->_contactType;
}

- (void)setContactType:(int64_t)a3
{
  self->_int64_t contactType = a3;
}

- (NSUUID)custodianID
{
  return self->_custodianID;
}

- (void)setCustodianID:(id)a3
{
}

- (int64_t)trustedContactStatus
{
  return self->_trustedContactStatus;
}

- (void)setTrustedContactStatus:(int64_t)a3
{
  self->_trustedContactStatus = a3;
}

- (BOOL)isAcceptedAndShared
{
  return self->_isAcceptedAndShared;
}

- (void)setIsAcceptedAndShared:(BOOL)a3
{
  self->_isAcceptedAndShared = a3;
}

- (BOOL)isIdMSConfirmed
{
  return self->_isIdMSConfirmed;
}

- (void)setIsIdMSConfirmed:(BOOL)a3
{
  self->_isIdMSConfirmed = a3;
}

- (int64_t)preflightStatus
{
  return self->_preflightStatus;
}

- (void)setPreflightStatus:(int64_t)a3
{
  self->_preflightStatus = a3;
}

- (AAInheritanceContactInfo)inheritanceContactInfo
{
  return self->_inheritanceContactInfo;
}

- (void)setInheritanceContactInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inheritanceContactInfo, 0);
  objc_storeStrong((id *)&self->_custodianID, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_familyMemberType, 0);
  objc_storeStrong((id *)&self->_familyDSID, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_fullName, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end