@interface CRKPrivateIdentity
+ (BOOL)supportsSecureCoding;
+ (id)commonNameWithPrefix:(id)a3;
+ (id)freshPrivateIdentityWithCommonNamePrefix:(id)a3;
+ (id)keychainGroup;
+ (id)makeIdentityWithCommonName:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)refreshIdentities;
- (CRKPrivateIdentity)initWithCoder:(id)a3;
- (CRKPrivateIdentity)initWithDictionary:(id)a3;
- (CRKPrivateIdentity)initWithIdentityPersistentId:(id)a3 stagedIdentityPersistentId:(id)a4 commonNamePrefix:(id)a5;
- (NSData)identityPersistentId;
- (NSData)stagedIdentityPersistentId;
- (NSDate)identityExpirationDate;
- (NSDate)stagedIdentityExpirationDate;
- (NSString)commonNamePrefix;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryValue;
- (void)encodeWithCoder:(id)a3;
- (void)setCommonNamePrefix:(id)a3;
- (void)setIdentityExpirationDate:(id)a3;
- (void)setIdentityPersistentId:(id)a3;
- (void)setStagedIdentityExpirationDate:(id)a3;
- (void)setStagedIdentityPersistentId:(id)a3;
@end

@implementation CRKPrivateIdentity

- (CRKPrivateIdentity)initWithIdentityPersistentId:(id)a3 stagedIdentityPersistentId:(id)a4 commonNamePrefix:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v31 = [MEMORY[0x263F08690] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"CRKPrivateIdentity.m", 48, @"Invalid parameter not satisfying: %@", @"identityPersistentId" object file lineNumber description];

    if (v13) {
      goto LABEL_3;
    }
  }
  v32 = [MEMORY[0x263F08690] currentHandler];
  [v32 handleFailureInMethod:a2, self, @"CRKPrivateIdentity.m", 49, @"Invalid parameter not satisfying: %@", @"commonNamePrefix" object file lineNumber description];

LABEL_3:
  v33.receiver = self;
  v33.super_class = (Class)CRKPrivateIdentity;
  v14 = [(CRKPrivateIdentity *)&v33 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identityPersistentId, a3);
    objc_storeStrong((id *)&v15->_stagedIdentityPersistentId, a4);
    uint64_t v16 = [v13 copy];
    commonNamePrefix = v15->_commonNamePrefix;
    v15->_commonNamePrefix = (NSString *)v16;

    v18 = +[CRKKeychainProvider sharedProvider];
    v19 = [v18 keychain];

    v20 = [v19 identityWithPersistentID:v10];
    v21 = [v20 certificate];
    v22 = [v21 validityDateInterval];
    uint64_t v23 = [v22 endDate];
    identityExpirationDate = v15->_identityExpirationDate;
    v15->_identityExpirationDate = (NSDate *)v23;

    if (v11)
    {
      v25 = [v19 identityWithPersistentID:v11];
      v26 = [v25 certificate];
      v27 = [v26 validityDateInterval];
      uint64_t v28 = [v27 endDate];
      stagedIdentityExpirationDate = v15->_stagedIdentityExpirationDate;
      v15->_stagedIdentityExpirationDate = (NSDate *)v28;
    }
  }

  return v15;
}

+ (id)freshPrivateIdentityWithCommonNamePrefix:(id)a3
{
  id v4 = a3;
  v5 = [a1 commonNameWithPrefix:v4];
  v6 = [a1 makeIdentityWithCommonName:v5];

  if (v6)
  {
    v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdentityPersistentId:v6 stagedIdentityPersistentId:0 commonNamePrefix:v4];
  }
  else
  {
    v8 = _CRKLogGeneral_15();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[CRKPrivateIdentity freshPrivateIdentityWithCommonNamePrefix:](v8);
    }

    v7 = 0;
  }

  return v7;
}

+ (id)makeIdentityWithCommonName:(id)a3
{
  id v4 = a3;
  v5 = [[CRKIdentityConfiguration alloc] initWithCommonName:v4];

  v6 = +[CRKKeychainProvider sharedProvider];
  v7 = [v6 keychain];

  v8 = [v7 makeIdentityWithConfiguration:v5];
  if (v8)
  {
    v9 = [a1 keychainGroup];
    id v10 = [v7 addIdentity:v8 toAccessGroup:v9];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)commonNameWithPrefix:(id)a3
{
  v3 = NSString;
  id v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  v6 = [v4 UUID];
  v7 = [v6 UUIDString];
  v8 = [v3 stringWithFormat:@"%@ %@", v5, v7];

  return v8;
}

- (BOOL)refreshIdentities
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v4 = [v3 stringForKey:@"CERTIFICATE"];

  id v5 = [v4 lowercaseString];
  char v6 = [v5 isEqualToString:@"expire"];

  v7 = [v4 lowercaseString];
  char v8 = [v7 isEqualToString:@"stage"];

  if (v6)
  {
    v9 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-1.0];
    if ((v8 & 1) == 0)
    {
LABEL_3:
      uint64_t v10 = [v9 dateByAddingTimeInterval:-15768000.0];
      goto LABEL_6;
    }
  }
  else
  {
    id v11 = [(CRKPrivateIdentity *)self identityExpirationDate];
    v9 = [v11 dateByAddingTimeInterval:-86400.0];

    if ((v8 & 1) == 0) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-1.0];
LABEL_6:
  id v12 = (void *)v10;
  v13 = +[CRKKeychainProvider sharedProvider];
  v14 = [v13 keychain];

  v15 = [(CRKPrivateIdentity *)self stagedIdentityPersistentId];
  if (v15)
  {
    uint64_t v16 = [MEMORY[0x263EFF910] date];
    v17 = [v9 earlierDate:v16];

    if (v17 == v9)
    {
      v18 = [(CRKPrivateIdentity *)self identityPersistentId];
      [v14 removeItemWithPersistentID:v18];

      v19 = [(CRKPrivateIdentity *)self stagedIdentityPersistentId];
      [(CRKPrivateIdentity *)self setIdentityPersistentId:v19];

      v15 = [(CRKPrivateIdentity *)self stagedIdentityExpirationDate];
      [(CRKPrivateIdentity *)self setIdentityExpirationDate:v15];

      [(CRKPrivateIdentity *)self setStagedIdentityPersistentId:0];
      [(CRKPrivateIdentity *)self setStagedIdentityExpirationDate:0];
      LOBYTE(v15) = 1;
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }
  v20 = [(CRKPrivateIdentity *)self stagedIdentityPersistentId];
  if (v20)
  {
  }
  else
  {
    v21 = [MEMORY[0x263EFF910] date];
    v22 = [v12 earlierDate:v21];

    if (v22 == v12)
    {
      uint64_t v23 = objc_opt_class();
      v24 = [(CRKPrivateIdentity *)self commonNamePrefix];
      v25 = [v23 commonNameWithPrefix:v24];

      v26 = _CRKLogGeneral_15();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 138543362;
        v35 = v25;
        _os_log_impl(&dword_224C00000, v26, OS_LOG_TYPE_DEFAULT, "Creating staged private identity with common name: %{public}@", (uint8_t *)&v34, 0xCu);
      }

      v27 = [(id)objc_opt_class() makeIdentityWithCommonName:v25];
      [(CRKPrivateIdentity *)self setStagedIdentityPersistentId:v27];

      uint64_t v28 = [(CRKPrivateIdentity *)self stagedIdentityPersistentId];

      if (v28)
      {
        v29 = [(CRKPrivateIdentity *)self stagedIdentityPersistentId];
        v30 = [v14 identityWithPersistentID:v29];

        v15 = [v30 certificate];
        v31 = [v15 validityDateInterval];
        v32 = [v31 endDate];
        [(CRKPrivateIdentity *)self setStagedIdentityExpirationDate:v32];

        LOBYTE(v15) = 1;
      }
    }
  }

  return (char)v15;
}

- (CRKPrivateIdentity)initWithDictionary:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"CRKPrivateIdentity.m", 140, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];
  }
  char v6 = [v5 objectForKeyedSubscript:@"PersistentId"];
  v7 = [v5 objectForKeyedSubscript:@"StagedPersistentId"];
  uint64_t v8 = [v5 objectForKeyedSubscript:@"CommonNamePrefix"];
  v9 = (void *)v8;
  if (v6)
  {
    if (!v8)
    {
      uint64_t v10 = [MEMORY[0x263F08C38] UUID];
      v9 = [v10 UUIDString];
    }
    self = [(CRKPrivateIdentity *)self initWithIdentityPersistentId:v6 stagedIdentityPersistentId:v7 commonNamePrefix:v9];
    id v11 = self;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (id)dictionaryValue
{
  v3 = objc_opt_new();
  id v4 = [(CRKPrivateIdentity *)self identityPersistentId];
  [v3 setObject:v4 forKeyedSubscript:@"PersistentId"];

  id v5 = [(CRKPrivateIdentity *)self commonNamePrefix];
  [v3 setObject:v5 forKeyedSubscript:@"CommonNamePrefix"];

  char v6 = [(CRKPrivateIdentity *)self stagedIdentityPersistentId];

  if (v6)
  {
    v7 = [(CRKPrivateIdentity *)self stagedIdentityPersistentId];
    [v3 setObject:v7 forKeyedSubscript:@"StagedPersistentId"];
  }
  uint64_t v8 = (void *)[v3 copy];

  return v8;
}

+ (id)keychainGroup
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"CRKPrivateIdentity.m" lineNumber:174 description:@"Group name should be overwritten by Private Identity subclass"];

  return &stru_26D7E7B00;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_msgSend(@"identityPersistentId, stagedIdentityPersistentId, commonNamePrefix", "componentsSeparatedByString:", @",");
  char v6 = (void *)[v5 mutableCopy];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __crk_tokenized_properties_block_invoke_18;
  v28[3] = &unk_2646F3750;
  id v7 = v6;
  id v29 = v7;
  [v7 enumerateObjectsUsingBlock:v28];

  uint64_t v8 = self;
  v9 = (CRKPrivateIdentity *)v4;
  id v10 = v7;
  if (v8 == v9)
  {
    BOOL v21 = 1;
  }
  else if ([(CRKPrivateIdentity *)v9 isMemberOfClass:objc_opt_class()])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      id v23 = v10;
      uint64_t v14 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(id *)(*((void *)&v24 + 1) + 8 * i);
          v17 = v9;
          uint64_t v18 = [(CRKPrivateIdentity *)v8 valueForKey:v16];
          uint64_t v19 = [(CRKPrivateIdentity *)v17 valueForKey:v16];

          if (v18 | v19)
          {
            int v20 = [(id)v18 isEqual:v19];

            if (!v20)
            {
              BOOL v21 = 0;
              goto LABEL_16;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v13) {
          continue;
        }
        break;
      }
      BOOL v21 = 1;
LABEL_16:
      id v10 = v23;
    }
    else
    {
      BOOL v21 = 1;
    }
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(CRKPrivateIdentity *)self identityPersistentId];
  char v6 = [(CRKPrivateIdentity *)self stagedIdentityPersistentId];
  id v7 = [(CRKPrivateIdentity *)self commonNamePrefix];
  uint64_t v8 = (void *)[v4 initWithIdentityPersistentId:v5 stagedIdentityPersistentId:v6 commonNamePrefix:v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  if (!v9)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"CRKPrivateIdentity.m", 199, @"Invalid parameter not satisfying: %@", @"aCoder" object file lineNumber description];
  }
  id v5 = [(CRKPrivateIdentity *)self identityPersistentId];
  [v9 encodeObject:v5 forKey:@"identityPersistentId"];

  char v6 = [(CRKPrivateIdentity *)self stagedIdentityPersistentId];
  [v9 encodeObject:v6 forKey:@"stagedIdentityPersistentId"];

  id v7 = [(CRKPrivateIdentity *)self commonNamePrefix];
  [v9 encodeObject:v7 forKey:@"commonNamePrefix"];
}

- (CRKPrivateIdentity)initWithCoder:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v32 = [MEMORY[0x263F08690] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"CRKPrivateIdentity.m", 207, @"Invalid parameter not satisfying: %@", @"aDecoder" object file lineNumber description];
  }
  v33.receiver = self;
  v33.super_class = (Class)CRKPrivateIdentity;
  char v6 = [(CRKPrivateIdentity *)&v33 init];
  if (v6)
  {
    id v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v8 = [v5 decodeObjectOfClasses:v7 forKey:@"identityPersistentId"];
    identityPersistentId = v6->_identityPersistentId;
    v6->_identityPersistentId = (NSData *)v8;

    id v10 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v11 = [v5 decodeObjectOfClasses:v10 forKey:@"stagedIdentityPersistentId"];
    stagedIdentityPersistentId = v6->_stagedIdentityPersistentId;
    v6->_stagedIdentityPersistentId = (NSData *)v11;

    uint64_t v13 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v14 = [v5 decodeObjectOfClasses:v13 forKey:@"commonNamePrefix"];
    commonNamePrefix = v6->_commonNamePrefix;
    v6->_commonNamePrefix = (NSString *)v14;

    if (!v6->_commonNamePrefix)
    {
      id v16 = [MEMORY[0x263F08C38] UUID];
      uint64_t v17 = [v16 UUIDString];
      uint64_t v18 = v6->_commonNamePrefix;
      v6->_commonNamePrefix = (NSString *)v17;
    }
    uint64_t v19 = +[CRKKeychainProvider sharedProvider];
    int v20 = [v19 keychain];

    if (v6->_identityPersistentId)
    {
      BOOL v21 = objc_msgSend(v20, "identityWithPersistentID:");
      v22 = [v21 certificate];
      id v23 = [v22 validityDateInterval];
      uint64_t v24 = [v23 endDate];
      identityExpirationDate = v6->_identityExpirationDate;
      v6->_identityExpirationDate = (NSDate *)v24;
    }
    if (v6->_stagedIdentityPersistentId)
    {
      long long v26 = objc_msgSend(v20, "identityWithPersistentID:");
      long long v27 = [v26 certificate];
      uint64_t v28 = [v27 validityDateInterval];
      uint64_t v29 = [v28 endDate];
      stagedIdentityExpirationDate = v6->_stagedIdentityExpirationDate;
      v6->_stagedIdentityExpirationDate = (NSDate *)v29;
    }
  }

  return v6;
}

- (NSData)identityPersistentId
{
  return self->_identityPersistentId;
}

- (void)setIdentityPersistentId:(id)a3
{
}

- (NSData)stagedIdentityPersistentId
{
  return self->_stagedIdentityPersistentId;
}

- (void)setStagedIdentityPersistentId:(id)a3
{
}

- (NSString)commonNamePrefix
{
  return self->_commonNamePrefix;
}

- (void)setCommonNamePrefix:(id)a3
{
}

- (NSDate)identityExpirationDate
{
  return self->_identityExpirationDate;
}

- (void)setIdentityExpirationDate:(id)a3
{
}

- (NSDate)stagedIdentityExpirationDate
{
  return self->_stagedIdentityExpirationDate;
}

- (void)setStagedIdentityExpirationDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedIdentityExpirationDate, 0);
  objc_storeStrong((id *)&self->_identityExpirationDate, 0);
  objc_storeStrong((id *)&self->_commonNamePrefix, 0);
  objc_storeStrong((id *)&self->_stagedIdentityPersistentId, 0);

  objc_storeStrong((id *)&self->_identityPersistentId, 0);
}

+ (void)freshPrivateIdentityWithCommonNamePrefix:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "Failed to create a fresh private identity", v1, 2u);
}

@end