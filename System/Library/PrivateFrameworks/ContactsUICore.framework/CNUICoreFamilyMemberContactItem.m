@interface CNUICoreFamilyMemberContactItem
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBeenPersisted;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProposed;
- (BOOL)isUnreachable;
- (CNUICoreFamilyMemberContactItem)init;
- (CNUICoreFamilyMemberContactItem)initWithCoder:(id)a3;
- (CNUICoreFamilyMemberContactItem)initWithContactIdentifier:(id)a3;
- (CNUICoreFamilyMemberContactItem)initWithContactIdentifier:(id)a3 formattedName:(id)a4 imageData:(id)a5 isUnreachable:(BOOL)a6 isProposed:(BOOL)a7 contactType:(int64_t)a8 whitelistStatus:(int64_t)a9 hasBeenPersisted:(BOOL)a10;
- (NSData)imageData;
- (NSString)contactIdentifier;
- (NSString)formattedName;
- (id)description;
- (int64_t)contactType;
- (int64_t)whitelistStatus;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNUICoreFamilyMemberContactItem

- (CNUICoreFamilyMemberContactItem)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNUICoreFamilyMemberContactItem)initWithContactIdentifier:(id)a3
{
  LOBYTE(v4) = 0;
  return [(CNUICoreFamilyMemberContactItem *)self initWithContactIdentifier:a3 formattedName:&stru_26BFC7668 imageData:0 isUnreachable:0 isProposed:0 contactType:0 whitelistStatus:0 hasBeenPersisted:v4];
}

- (CNUICoreFamilyMemberContactItem)initWithContactIdentifier:(id)a3 formattedName:(id)a4 imageData:(id)a5 isUnreachable:(BOOL)a6 isProposed:(BOOL)a7 contactType:(int64_t)a8 whitelistStatus:(int64_t)a9 hasBeenPersisted:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  if (v16) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_24 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_24, &__block_literal_global_78);
  }
  v19 = CNGuardOSLog_cn_once_object_0_24;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_24, OS_LOG_TYPE_FAULT))
  {
    -[CNUICoreFamilyMemberContactItem initWithContactIdentifier:formattedName:imageData:isUnreachable:isProposed:contactType:whitelistStatus:hasBeenPersisted:](v19);
    if (v17) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v17) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_24 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_24, &__block_literal_global_78);
  }
  v20 = CNGuardOSLog_cn_once_object_0_24;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_24, OS_LOG_TYPE_FAULT)) {
    -[CNUICoreFamilyMemberContactItem initWithContactIdentifier:formattedName:imageData:isUnreachable:isProposed:contactType:whitelistStatus:hasBeenPersisted:](v20);
  }
LABEL_10:
  v26.receiver = self;
  v26.super_class = (Class)CNUICoreFamilyMemberContactItem;
  v21 = [(CNUICoreFamilyMemberContactItem *)&v26 init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_contactIdentifier, a3);
    objc_storeStrong((id *)&v22->_formattedName, a4);
    objc_storeStrong((id *)&v22->_imageData, a5);
    v22->_isUnreachable = a6;
    v22->_isProposed = a7;
    v22->_contactType = a8;
    v22->_whitelistStatus = a9;
    v22->_hasBeenPersisted = a10;
    v23 = v22;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNUICoreFamilyMemberContactItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNUICoreFamilyMemberContactItem;
  v5 = [(CNUICoreFamilyMemberContactItem *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contactIdentifier"];
    uint64_t v7 = [v6 copy];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_formattedName"];
    uint64_t v10 = [v9 copy];
    formattedName = v5->_formattedName;
    v5->_formattedName = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_imageData"];
    uint64_t v13 = [v12 copy];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v13;

    v5->_isUnreachable = [v4 decodeBoolForKey:@"_isUnreachable"];
    v5->_isProposed = [v4 decodeBoolForKey:@"_isProposed"];
    v5->_contactType = [v4 decodeIntegerForKey:@"_contactType"];
    v5->_whitelistStatus = [v4 decodeIntegerForKey:@"_whitelistStatus"];
    v5->_hasBeenPersisted = [v4 decodeBoolForKey:@"_hasBeenPersisted"];
    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  contactIdentifier = self->_contactIdentifier;
  id v5 = a3;
  [v5 encodeObject:contactIdentifier forKey:@"_contactIdentifier"];
  [v5 encodeObject:self->_formattedName forKey:@"_formattedName"];
  [v5 encodeObject:self->_imageData forKey:@"_imageData"];
  [v5 encodeBool:self->_isUnreachable forKey:@"_isUnreachable"];
  [v5 encodeBool:self->_isProposed forKey:@"_isProposed"];
  [v5 encodeInteger:self->_contactType forKey:@"_contactType"];
  [v5 encodeInteger:self->_whitelistStatus forKey:@"_whitelistStatus"];
  [v5 encodeBool:self->_hasBeenPersisted forKey:@"_hasBeenPersisted"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNUICoreFamilyMemberContactItem *)a3;
  if (self == v4)
  {
    LOBYTE(v16) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
    unint64_t v5 = (unint64_t)[(CNUICoreFamilyMemberContactItem *)self contactIdentifier];
    unint64_t v6 = (unint64_t)[(CNUICoreFamilyMemberContactItem *)v4 contactIdentifier];
    if (v5 | v6)
    {
      if (![(id)v5 isEqual:v6]) {
        goto LABEL_14;
      }
    }
    unint64_t v7 = (unint64_t)[(CNUICoreFamilyMemberContactItem *)self formattedName];
    unint64_t v8 = (unint64_t)[(CNUICoreFamilyMemberContactItem *)v4 formattedName];
    if (v7 | v8)
    {
      if (![(id)v7 isEqual:v8]) {
        goto LABEL_14;
      }
    }
    if (((unint64_t v9 = (unint64_t)[(CNUICoreFamilyMemberContactItem *)self imageData],
           unint64_t v10 = (unint64_t)[(CNUICoreFamilyMemberContactItem *)v4 imageData],
           !(v9 | v10))
       || [(id)v9 isEqual:v10])
      && (BOOL v11 = [(CNUICoreFamilyMemberContactItem *)self isUnreachable],
          v11 == [(CNUICoreFamilyMemberContactItem *)v4 isUnreachable])
      && (BOOL v12 = [(CNUICoreFamilyMemberContactItem *)self isProposed],
          v12 == [(CNUICoreFamilyMemberContactItem *)v4 isProposed])
      && (int64_t v13 = [(CNUICoreFamilyMemberContactItem *)self contactType],
          v13 == [(CNUICoreFamilyMemberContactItem *)v4 contactType])
      && (int64_t v14 = [(CNUICoreFamilyMemberContactItem *)self whitelistStatus],
          v14 == [(CNUICoreFamilyMemberContactItem *)v4 whitelistStatus]))
    {
      BOOL v15 = [(CNUICoreFamilyMemberContactItem *)self hasBeenPersisted];
      BOOL v16 = v15 ^ [(CNUICoreFamilyMemberContactItem *)v4 hasBeenPersisted] ^ 1;
    }
    else
    {
LABEL_14:
      LOBYTE(v16) = 0;
    }
  }

  return v16;
}

- (unint64_t)hash
{
  id v3 = (void *)MEMORY[0x263F335E8];
  id v4 = [(CNUICoreFamilyMemberContactItem *)self contactIdentifier];
  uint64_t v5 = [v3 objectHash:v4];

  unint64_t v6 = (void *)MEMORY[0x263F335E8];
  unint64_t v7 = [(CNUICoreFamilyMemberContactItem *)self formattedName];
  uint64_t v8 = [v6 objectHash:v7] - v5 + 32 * v5;

  unint64_t v9 = (void *)MEMORY[0x263F335E8];
  unint64_t v10 = [(CNUICoreFamilyMemberContactItem *)self imageData];
  uint64_t v11 = 31 * ([v9 objectHash:v10] - v8 + 32 * v8);

  uint64_t v12 = 31 * (v11 + [(CNUICoreFamilyMemberContactItem *)self isUnreachable]);
  uint64_t v13 = v12 + [(CNUICoreFamilyMemberContactItem *)self isProposed];
  uint64_t v14 = [(CNUICoreFamilyMemberContactItem *)self contactType];
  if (v14 >= 0) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = -v14;
  }
  uint64_t v16 = v15 - v13 + 32 * v13;
  uint64_t v17 = [(CNUICoreFamilyMemberContactItem *)self whitelistStatus];
  if (v17 >= 0) {
    uint64_t v18 = v17;
  }
  else {
    uint64_t v18 = -v17;
  }
  return 31 * (v18 - v16 + 32 * v16)
       + [(CNUICoreFamilyMemberContactItem *)self hasBeenPersisted]
       + 0xD2FD88B5F11;
}

- (id)description
{
  id v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  id v4 = [(CNUICoreFamilyMemberContactItem *)self contactIdentifier];
  id v5 = (id)[v3 appendName:@"contactIdentifier" object:v4];

  unint64_t v6 = [(CNUICoreFamilyMemberContactItem *)self formattedName];
  id v7 = (id)[v3 appendName:@"formattedName" object:v6];

  id v8 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"hasBeenPersisted", -[CNUICoreFamilyMemberContactItem hasBeenPersisted](self, "hasBeenPersisted"));
  unint64_t v9 = [v3 build];

  return v9;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)formattedName
{
  return self->_formattedName;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (BOOL)isUnreachable
{
  return self->_isUnreachable;
}

- (BOOL)isProposed
{
  return self->_isProposed;
}

- (int64_t)contactType
{
  return self->_contactType;
}

- (int64_t)whitelistStatus
{
  return self->_whitelistStatus;
}

- (BOOL)hasBeenPersisted
{
  return self->_hasBeenPersisted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_formattedName, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

- (void)initWithContactIdentifier:(os_log_t)log formattedName:imageData:isUnreachable:isProposed:contactType:whitelistStatus:hasBeenPersisted:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘formattedName’ must be nonnull", v1, 2u);
}

- (void)initWithContactIdentifier:(os_log_t)log formattedName:imageData:isUnreachable:isProposed:contactType:whitelistStatus:hasBeenPersisted:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_20B704000, log, OS_LOG_TYPE_FAULT, "parameter ‘contactIdentifier’ must be nonnull", v1, 2u);
}

@end