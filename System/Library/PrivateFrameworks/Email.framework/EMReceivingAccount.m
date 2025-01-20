@interface EMReceivingAccount
+ (BOOL)supportsSecureCoding;
- (BOOL)isLocalAccount;
- (BOOL)isPrimaryiCloudAccount;
- (BOOL)shouldArchiveByDefault;
- (BOOL)sourceIsManaged;
- (ECEmailAddress)identityEmailAddress;
- (EMDeliveryAccount)deliveryAccount;
- (EMReceivingAccount)initWithCoder:(id)a3;
- (EMReceivingAccount)initWithObjectID:(id)a3 name:(id)a4 hostname:(id)a5 builder:(id)a6;
- (NSArray)emailAddresses;
- (NSString)hostname;
- (NSString)statisticsKind;
- (NSString)username;
- (id)_calculateIdentityEmailAddress;
- (id)name;
- (void)_commonInitName:(id)a3 hostname:(id)a4 builder:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setDeliveryAccount:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setHostname:(id)a3;
- (void)setIsLocalAccount:(BOOL)a3;
- (void)setPrimaryiCloudAccount:(BOOL)a3;
- (void)setShouldArchiveByDefault:(BOOL)a3;
- (void)setSourceIsManaged:(BOOL)a3;
- (void)setStatisticsKind:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation EMReceivingAccount

- (ECEmailAddress)identityEmailAddress
{
  v3 = EFAtomicObjectLoad();
  if (!v3)
  {
    v4 = [(EMReceivingAccount *)self _calculateIdentityEmailAddress];
    v3 = EFAtomicObjectSetIfNil();
  }
  return (ECEmailAddress *)v3;
}

- (id)_calculateIdentityEmailAddress
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v36 = [(EMReceivingAccount *)self emailAddresses];
  if ((unint64_t)[v36 count] <= 1)
  {
    id v3 = [v36 firstObject];
    goto LABEL_39;
  }
  v4 = [(EMReceivingAccount *)self hostname];
  v40 = v4;
  v31 = objc_msgSend(v4, "_lp_highLevelDomainFromHost");
  v33 = [(EMReceivingAccount *)self username];
  v5 = [v33 emailAddressValue];
  uint64_t v6 = [v5 localPart];
  v7 = (void *)v6;
  v8 = v33;
  if (v6) {
    v8 = (void *)v6;
  }
  id v34 = v8;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v36;
  uint64_t v9 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (!v9)
  {

LABEL_37:
    id v3 = [obj firstObject];
    v32 = 0;
    v37 = 0;
    v35 = 0;
    v39 = 0;
    v10 = 0;
    goto LABEL_38;
  }
  v10 = 0;
  v39 = 0;
  v35 = 0;
  v37 = 0;
  v32 = 0;
  uint64_t v11 = *(void *)v42;
  do
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v42 != v11) {
        objc_enumerationMutation(obj);
      }
      v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
      if ([v5 isEqual:v13])
      {
        id v3 = v13;

        goto LABEL_38;
      }
      if (!v10)
      {
        v14 = [v13 domain];
        char v15 = objc_msgSend(v14, "ef_caseInsensitiveIsEqualToString:", v4);

        if (v15)
        {
          v16 = v13;
          v17 = v39;
          v18 = v37;
LABEL_14:
          id v19 = v13;
          v10 = v16;
          v39 = v17;
          v37 = v18;
          goto LABEL_17;
        }
        if (v39)
        {
          v10 = 0;
        }
        else
        {
          v20 = [v13 localPart];
          int v21 = objc_msgSend(v20, "ef_caseInsensitiveIsEqualToString:", v34);

          v22 = (void *)MEMORY[0x1E4F60DC8];
          v23 = [v13 domain];
          LODWORD(v22) = [v22 domain:v4 isSubdomainOfDomain:v23];

          if (v22)
          {
            id v24 = v35;
            if (!v35) {
              id v24 = v13;
            }
            v35 = v24;
            v16 = 0;
            v10 = 0;
            v39 = 0;
            v17 = v13;
            v18 = v37;
            if (v21) {
              goto LABEL_14;
            }
          }
          else if (v37)
          {
            v10 = 0;
            v39 = 0;
          }
          else
          {
            v25 = [v13 highLevelDomain];
            int v26 = objc_msgSend(v25, "ef_caseInsensitiveIsEqualToString:", v31);

            if (v26)
            {
              id v27 = v32;
              if (!v32) {
                id v27 = v13;
              }
              v32 = v27;
              v16 = 0;
              v17 = 0;
              v10 = 0;
              v39 = 0;
              v37 = 0;
              v18 = v13;
              if (v21) {
                goto LABEL_14;
              }
            }
            else
            {
              v10 = 0;
              v39 = 0;
              v37 = 0;
            }
          }
        }
      }
LABEL_17:
      ++v12;
      v4 = v40;
    }
    while (v9 != v12);
    uint64_t v28 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
    uint64_t v9 = v28;
  }
  while (v28);

  if (v10)
  {
    v29 = v10;
    goto LABEL_47;
  }
  v29 = v39;
  if (v39) {
    goto LABEL_47;
  }
  v29 = v35;
  if (v35) {
    goto LABEL_44;
  }
  if (v37)
  {
    v35 = 0;
    v39 = 0;
    v29 = v37;
    goto LABEL_47;
  }
  v29 = v32;
  if (!v32) {
    goto LABEL_37;
  }
  v37 = 0;
  v35 = 0;
LABEL_44:
  v39 = 0;
LABEL_47:
  id v3 = v29;
LABEL_38:

LABEL_39:
  return v3;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMReceivingAccount;
  [(EMObject *)&v11 encodeWithCoder:v4];
  v5 = [(EMReceivingAccount *)self name];
  [v4 encodeObject:v5 forKey:@"EFPropertyKey_name"];

  uint64_t v6 = [(EMReceivingAccount *)self hostname];
  [v4 encodeObject:v6 forKey:@"EFPropertyKey_hostname"];

  v7 = [(EMReceivingAccount *)self username];
  [v4 encodeObject:v7 forKey:@"EFPropertyKey_username"];

  v8 = [(EMReceivingAccount *)self statisticsKind];
  [v4 encodeObject:v8 forKey:@"EFPropertyKey_statisticsKind"];

  uint64_t v9 = [(EMReceivingAccount *)self deliveryAccount];
  [v4 encodeObject:v9 forKey:@"EFPropertyKey_deliveryAccount"];

  v10 = [(EMReceivingAccount *)self emailAddresses];
  [v4 encodeObject:v10 forKey:@"EFPropertyKey_emailAddresses"];

  objc_msgSend(v4, "encodeBool:forKey:", -[EMReceivingAccount sourceIsManaged](self, "sourceIsManaged"), @"EFPropertyKey_sourceIsManaged");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMReceivingAccount shouldArchiveByDefault](self, "shouldArchiveByDefault"), @"EFPropertyKey_shouldArchiveByDefault");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMReceivingAccount isPrimaryiCloudAccount](self, "isPrimaryiCloudAccount"), @"EFPropertyKey_primaryiCloudAccount");
  objc_msgSend(v4, "encodeBool:forKey:", -[EMReceivingAccount isLocalAccount](self, "isLocalAccount"), @"EFPropertyKey_isLocalAccount");
}

- (id)name
{
  return self->_name;
}

- (NSString)username
{
  return self->_username;
}

- (NSString)statisticsKind
{
  return self->_statisticsKind;
}

- (BOOL)sourceIsManaged
{
  return self->_sourceIsManaged;
}

- (BOOL)shouldArchiveByDefault
{
  return self->_shouldArchiveByDefault;
}

- (BOOL)isPrimaryiCloudAccount
{
  return self->_primaryiCloudAccount;
}

- (BOOL)isLocalAccount
{
  return self->_isLocalAccount;
}

- (NSString)hostname
{
  return self->_hostname;
}

- (EMDeliveryAccount)deliveryAccount
{
  return self->_deliveryAccount;
}

- (EMReceivingAccount)initWithObjectID:(id)a3 name:(id)a4 hostname:(id)a5 builder:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v14)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"EMReceivingAccount.m", 37, @"Invalid parameter not satisfying: %@", @"builderBlock" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)EMReceivingAccount;
  char v15 = [(EMObject *)&v19 initWithObjectID:v11];
  v16 = v15;
  if (v15) {
    [(EMReceivingAccount *)v15 _commonInitName:v12 hostname:v13 builder:v14];
  }

  return v16;
}

- (EMReceivingAccount)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMReceivingAccount;
  v5 = [(EMObject *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_name"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_hostname"];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__EMReceivingAccount_initWithCoder___block_invoke;
    v9[3] = &unk_1E63E5DC0;
    id v10 = v4;
    [(EMReceivingAccount *)v5 _commonInitName:v6 hostname:v7 builder:v9];
  }
  return v5;
}

- (void)_commonInitName:(id)a3 hostname:(id)a4 builder:(id)a5
{
  id v12 = a3;
  uint64_t v9 = (NSString *)a4;
  objc_storeStrong((id *)&self->_name, a3);
  id v10 = (void (**)(id, EMReceivingAccount *))a5;
  hostname = self->_hostname;
  self->_hostname = v9;

  v10[2](v10, self);
}

void __36__EMReceivingAccount_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  id v3 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_username"];
  [v11 setUsername:v3];

  id v4 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_statisticsKind"];
  [v11 setStatisticsKind:v4];

  v5 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"EFPropertyKey_deliveryAccount"];
  [v11 setDeliveryAccount:v5];

  objc_msgSend(v11, "setSourceIsManaged:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_sourceIsManaged"));
  objc_msgSend(v11, "setShouldArchiveByDefault:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_shouldArchiveByDefault"));
  uint64_t v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  id v10 = [v6 decodeObjectOfClasses:v9 forKey:@"EFPropertyKey_emailAddresses"];
  [v11 setEmailAddresses:v10];

  objc_msgSend(v11, "setPrimaryiCloudAccount:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_primaryiCloudAccount"));
  objc_msgSend(v11, "setIsLocalAccount:", objc_msgSend(*(id *)(a1 + 32), "decodeBoolForKey:", @"EFPropertyKey_isLocalAccount"));
}

- (void)setUsername:(id)a3
{
}

- (void)setStatisticsKind:(id)a3
{
}

- (void)setSourceIsManaged:(BOOL)a3
{
  self->_sourceIsManaged = a3;
}

- (void)setShouldArchiveByDefault:(BOOL)a3
{
  self->_shouldArchiveByDefault = a3;
}

- (void)setPrimaryiCloudAccount:(BOOL)a3
{
  self->_primaryiCloudAccount = a3;
}

- (void)setIsLocalAccount:(BOOL)a3
{
  self->_isLocalAccount = a3;
}

- (void)setEmailAddresses:(id)a3
{
}

- (void)setDeliveryAccount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsKind, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_deliveryAccount, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setHostname:(id)a3
{
}

@end