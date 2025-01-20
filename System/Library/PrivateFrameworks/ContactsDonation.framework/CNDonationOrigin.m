@interface CNDonationOrigin
+ (BOOL)supportsSecureCoding;
+ (id)originWithUpdatedDonationIdentifier:(id)a3 fromOrigin:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CNDonationOrigin)initWithBundleIdentifier:(id)a3 donationIdentifier:(id)a4 clusterIdentifier:(id)a5 donationDate:(id)a6 expirationDate:(id)a7;
- (CNDonationOrigin)initWithBundleIdentifier:(id)a3 donationIdentifier:(id)a4 donationDate:(id)a5 expirationDate:(id)a6;
- (CNDonationOrigin)initWithCoder:(id)a3;
- (CNDonationOrigin)initWithDonationOrigin:(id)a3;
- (CNDonationOrigin)initWithPropertyListRepresentation:(id)a3;
- (NSDate)donationDate;
- (NSDate)expirationDate;
- (NSDictionary)propertyListRepresentation;
- (NSString)bundleIdentifier;
- (NSString)clusterIdentifier;
- (NSString)donationIdentifier;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNDonationOrigin

- (CNDonationOrigin)initWithDonationOrigin:(id)a3
{
  id v4 = a3;
  v5 = [v4 bundleIdentifier];
  v6 = [v4 donationIdentifier];
  v7 = [v4 clusterIdentifier];
  v8 = [v4 donationDate];
  v9 = [v4 expirationDate];

  v10 = [(CNDonationOrigin *)self initWithBundleIdentifier:v5 donationIdentifier:v6 clusterIdentifier:v7 donationDate:v8 expirationDate:v9];
  return v10;
}

- (CNDonationOrigin)initWithBundleIdentifier:(id)a3 donationIdentifier:(id)a4 donationDate:(id)a5 expirationDate:(id)a6
{
  return [(CNDonationOrigin *)self initWithBundleIdentifier:a3 donationIdentifier:a4 clusterIdentifier:&stru_26C4F6B38 donationDate:a5 expirationDate:a6];
}

+ (id)originWithUpdatedDonationIdentifier:(id)a3 fromOrigin:(id)a4
{
  id v5 = a3;
  v6 = (void *)[a4 mutableCopy];
  [v6 setDonationIdentifier:v5];

  return v6;
}

- (CNDonationOrigin)initWithBundleIdentifier:(id)a3 donationIdentifier:(id)a4 clusterIdentifier:(id)a5 donationDate:(id)a6 expirationDate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global);
  }
  v17 = CNGuardOSLog_cn_once_object_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT))
  {
    -[CNDonationOrigin initWithBundleIdentifier:donationIdentifier:clusterIdentifier:donationDate:expirationDate:](v17);
    if (v13) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v13) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global);
  }
  v18 = CNGuardOSLog_cn_once_object_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT)) {
    -[CNDonationOrigin initWithBundleIdentifier:donationIdentifier:clusterIdentifier:donationDate:expirationDate:](v18);
  }
LABEL_10:
  if (v15)
  {
    if (v16) {
      goto LABEL_12;
    }
  }
  else
  {
    id v15 = [MEMORY[0x263EFF910] date];
    if (v16) {
      goto LABEL_12;
    }
  }
  id v16 = [v15 dateByAddingTimeInterval:2419200.0];
LABEL_12:
  v32.receiver = self;
  v32.super_class = (Class)CNDonationOrigin;
  v19 = [(CNDonationOrigin *)&v32 init];
  if (v19)
  {
    uint64_t v20 = [v12 copy];
    bundleIdentifier = v19->_bundleIdentifier;
    v19->_bundleIdentifier = (NSString *)v20;

    uint64_t v22 = [v13 copy];
    donationIdentifier = v19->_donationIdentifier;
    v19->_donationIdentifier = (NSString *)v22;

    if (v14)
    {
      uint64_t v24 = [v14 copy];
      clusterIdentifier = v19->_clusterIdentifier;
      v19->_clusterIdentifier = (NSString *)v24;
    }
    else
    {
      clusterIdentifier = v19->_clusterIdentifier;
      v19->_clusterIdentifier = (NSString *)&stru_26C4F6B38;
    }

    uint64_t v26 = [v15 copy];
    donationDate = v19->_donationDate;
    v19->_donationDate = (NSDate *)v26;

    uint64_t v28 = [v16 copy];
    expirationDate = v19->_expirationDate;
    v19->_expirationDate = (NSDate *)v28;

    v30 = v19;
  }

  return v19;
}

- (id)description
{
  v3 = [MEMORY[0x263F335A8] descriptionBuilderWithObject:self];
  id v4 = [(CNDonationOrigin *)self bundleIdentifier];
  id v5 = (id)[v3 appendName:@"bundleIdentifier" object:v4];

  v6 = [(CNDonationOrigin *)self donationIdentifier];
  id v7 = (id)[v3 appendName:@"donationIdentifier" object:v6];

  v8 = [(CNDonationOrigin *)self clusterIdentifier];
  id v9 = (id)[v3 appendName:@"clusterIdentifier" object:v8];

  v10 = [(CNDonationOrigin *)self donationDate];
  id v11 = (id)[v3 appendName:@"donationDate" object:v10];

  id v12 = [(CNDonationOrigin *)self expirationDate];
  id v13 = (id)[v3 appendName:@"expirationDate" object:v12];

  id v14 = [v3 build];

  return v14;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [CNMutableDonationOrigin alloc];

  return [(CNDonationOrigin *)v4 initWithDonationOrigin:self];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F335D0];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __28__CNDonationOrigin_isEqual___block_invoke;
  v23[3] = &unk_2641FBF68;
  v23[4] = self;
  id v24 = v4;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __28__CNDonationOrigin_isEqual___block_invoke_2;
  v21[3] = &unk_2641FBF68;
  v21[4] = self;
  id v6 = v24;
  id v22 = v6;
  id v7 = (void *)MEMORY[0x21669C740](v21);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __28__CNDonationOrigin_isEqual___block_invoke_3;
  v19[3] = &unk_2641FBF68;
  v19[4] = self;
  id v8 = v6;
  id v20 = v8;
  id v9 = (void *)MEMORY[0x21669C740](v19);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __28__CNDonationOrigin_isEqual___block_invoke_4;
  v17[3] = &unk_2641FBF68;
  v17[4] = self;
  id v10 = v8;
  id v18 = v10;
  id v11 = (void *)MEMORY[0x21669C740](v17);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __28__CNDonationOrigin_isEqual___block_invoke_5;
  v15[3] = &unk_2641FBF68;
  v15[4] = self;
  id v16 = v10;
  id v12 = v10;
  id v13 = (void *)MEMORY[0x21669C740](v15);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v12, v23, v7, v9, v11, v13, 0);

  return (char)self;
}

uint64_t __28__CNDonationOrigin_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) bundleIdentifier];
  id v4 = [*(id *)(a1 + 40) bundleIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __28__CNDonationOrigin_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) donationIdentifier];
  id v4 = [*(id *)(a1 + 40) donationIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __28__CNDonationOrigin_isEqual___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) clusterIdentifier];
  id v4 = [*(id *)(a1 + 40) clusterIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __28__CNDonationOrigin_isEqual___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) donationDate];
  id v4 = [*(id *)(a1 + 40) donationDate];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __28__CNDonationOrigin_isEqual___block_invoke_5(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F335D0];
  v3 = [*(id *)(a1 + 32) expirationDate];
  id v4 = [*(id *)(a1 + 40) expirationDate];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x263F335E8];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __24__CNDonationOrigin_hash__block_invoke;
  v14[3] = &unk_2641FBF90;
  v14[4] = self;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __24__CNDonationOrigin_hash__block_invoke_2;
  v13[3] = &unk_2641FBF90;
  v13[4] = self;
  id v4 = (void *)MEMORY[0x21669C740](v13, a2);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __24__CNDonationOrigin_hash__block_invoke_3;
  v12[3] = &unk_2641FBF90;
  v12[4] = self;
  uint64_t v5 = (void *)MEMORY[0x21669C740](v12);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __24__CNDonationOrigin_hash__block_invoke_4;
  v11[3] = &unk_2641FBF90;
  v11[4] = self;
  id v6 = (void *)MEMORY[0x21669C740](v11);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __24__CNDonationOrigin_hash__block_invoke_5;
  v10[3] = &unk_2641FBF90;
  v10[4] = self;
  id v7 = (void *)MEMORY[0x21669C740](v10);
  unint64_t v8 = objc_msgSend(v3, "hashWithBlocks:", v14, v4, v5, v6, v7, 0);

  return v8;
}

uint64_t __24__CNDonationOrigin_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __24__CNDonationOrigin_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) donationIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __24__CNDonationOrigin_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) clusterIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __24__CNDonationOrigin_hash__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) donationDate];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __24__CNDonationOrigin_hash__block_invoke_5(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F335E8];
  v2 = [*(id *)(a1 + 32) expirationDate];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (CNDonationOrigin)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_bundleIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_donationIdentifier"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_clusterIdentifier"];
  unint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_donationDate"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_expirationDate"];

  id v10 = [(CNDonationOrigin *)self initWithBundleIdentifier:v5 donationIdentifier:v6 clusterIdentifier:v7 donationDate:v8 expirationDate:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  bundleIdentifier = self->_bundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:bundleIdentifier forKey:@"_bundleIdentifier"];
  [v5 encodeObject:self->_donationIdentifier forKey:@"_donationIdentifier"];
  [v5 encodeObject:self->_clusterIdentifier forKey:@"_clusterIdentifier"];
  [v5 encodeObject:self->_donationDate forKey:@"_donationDate"];
  [v5 encodeObject:self->_expirationDate forKey:@"_expirationDate"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNDonationOrigin)initWithPropertyListRepresentation:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  uint64_t v4 = [v3 objectForKeyedSubscript:CNDonationOriginBundleIdentifierKey];
  id v22 = (void *)v4;
  if (objc_opt_isKindOfClass()) {
    id v5 = (void *)v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  objc_opt_class();
  id v7 = [v3 objectForKeyedSubscript:CNDonationOriginDonationIdentifierKey];
  if (objc_opt_isKindOfClass()) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = 0;
  }
  id v9 = v8;
  objc_opt_class();
  id v10 = [v3 objectForKeyedSubscript:CNDonationOriginClusterIdentifierKey];
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  objc_opt_class();
  id v13 = [v3 objectForKeyedSubscript:CNDonationOriginDonationDateKey];
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }
  id v15 = v14;
  objc_opt_class();
  id v16 = [v3 objectForKeyedSubscript:CNDonationOriginExpirationDateKey];

  if (objc_opt_isKindOfClass()) {
    v17 = v16;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;
  v19 = [(CNDonationOrigin *)self initWithBundleIdentifier:v6 donationIdentifier:v9 clusterIdentifier:v12 donationDate:v15 expirationDate:v18];

  return v19;
}

- (NSDictionary)propertyListRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
  [v3 setObject:&unk_26C4FAEE8 forKeyedSubscript:CNDonationOriginPlistEncodingVersionKey];
  uint64_t v4 = [(CNDonationOrigin *)self bundleIdentifier];
  [v3 setObject:v4 forKeyedSubscript:CNDonationOriginBundleIdentifierKey];

  id v5 = [(CNDonationOrigin *)self donationIdentifier];
  [v3 setObject:v5 forKeyedSubscript:CNDonationOriginDonationIdentifierKey];

  id v6 = [(CNDonationOrigin *)self clusterIdentifier];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    unint64_t v8 = [(CNDonationOrigin *)self clusterIdentifier];
    [v3 setObject:v8 forKeyedSubscript:CNDonationOriginClusterIdentifierKey];
  }
  id v9 = [(CNDonationOrigin *)self donationDate];
  [v3 setObject:v9 forKeyedSubscript:CNDonationOriginDonationDateKey];

  id v10 = [(CNDonationOrigin *)self expirationDate];
  [v3 setObject:v10 forKeyedSubscript:CNDonationOriginExpirationDateKey];

  return (NSDictionary *)v3;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)donationIdentifier
{
  return self->_donationIdentifier;
}

- (NSString)clusterIdentifier
{
  return self->_clusterIdentifier;
}

- (NSDate)donationDate
{
  return self->_donationDate;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_donationDate, 0);
  objc_storeStrong((id *)&self->_clusterIdentifier, 0);
  objc_storeStrong((id *)&self->_donationIdentifier, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (void)initWithBundleIdentifier:(os_log_t)log donationIdentifier:clusterIdentifier:donationDate:expirationDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_214267000, log, OS_LOG_TYPE_FAULT, "parameter ‘donationIdentifier’ must be nonnull", v1, 2u);
}

- (void)initWithBundleIdentifier:(os_log_t)log donationIdentifier:clusterIdentifier:donationDate:expirationDate:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_214267000, log, OS_LOG_TYPE_FAULT, "parameter ‘bundleIdentifier’ must be nonnull", v1, 2u);
}

@end