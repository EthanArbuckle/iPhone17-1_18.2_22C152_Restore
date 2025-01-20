@interface HMAccessorySetupRequest
+ (BOOL)supportsSecureCoding;
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMAccessorySetupPayload)payload;
- (HMAccessorySetupRequest)init;
- (HMAccessorySetupRequest)initWithCoder:(id)a3;
- (MTRSetupPayload)matterPayload;
- (NSArray)attributeDescriptions;
- (NSString)description;
- (NSString)shortDescription;
- (NSString)suggestedAccessoryName;
- (NSUUID)homeUniqueIdentifier;
- (NSUUID)suggestedRoomUniqueIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHomeUniqueIdentifier:(NSUUID *)homeUniqueIdentifier;
- (void)setMatterPayload:(MTRSetupPayload *)matterPayload;
- (void)setPayload:(HMAccessorySetupPayload *)payload;
- (void)setSuggestedAccessoryName:(NSString *)suggestedAccessoryName;
- (void)setSuggestedRoomUniqueIdentifier:(NSUUID *)suggestedRoomUniqueIdentifier;
@end

@implementation HMAccessorySetupRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matterPayload, 0);
  objc_storeStrong((id *)&self->_suggestedAccessoryName, 0);
  objc_storeStrong((id *)&self->_suggestedRoomUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_homeUniqueIdentifier, 0);

  objc_storeStrong((id *)&self->_payload, 0);
}

- (void)setMatterPayload:(MTRSetupPayload *)matterPayload
{
}

- (MTRSetupPayload)matterPayload
{
  return (MTRSetupPayload *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSuggestedAccessoryName:(NSString *)suggestedAccessoryName
{
}

- (NSString)suggestedAccessoryName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSuggestedRoomUniqueIdentifier:(NSUUID *)suggestedRoomUniqueIdentifier
{
}

- (NSUUID)suggestedRoomUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHomeUniqueIdentifier:(NSUUID *)homeUniqueIdentifier
{
}

- (NSUUID)homeUniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPayload:(HMAccessorySetupPayload *)payload
{
}

- (HMAccessorySetupPayload)payload
{
  return (HMAccessorySetupPayload *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = [(HMAccessorySetupRequest *)self payload];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
    v6 = [(HMAccessorySetupRequest *)self payload];
    v7 = (void *)[v5 initWithName:@"Payload" value:v6];
    [v3 addObject:v7];
  }
  v8 = [(HMAccessorySetupRequest *)self matterPayload];

  if (v8)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
    v10 = [(HMAccessorySetupRequest *)self matterPayload];
    v11 = (void *)[v9 initWithName:@"Matter Payload" value:v10];
    [v3 addObject:v11];
  }
  v12 = [(HMAccessorySetupRequest *)self homeUniqueIdentifier];

  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x1E4F653F8]);
    v14 = [(HMAccessorySetupRequest *)self homeUniqueIdentifier];
    v15 = (void *)[v13 initWithName:@"Home Unique Identifier" value:v14];
    [v3 addObject:v15];
  }
  v16 = [(HMAccessorySetupRequest *)self suggestedRoomUniqueIdentifier];

  if (v16)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F653F8]);
    v18 = [(HMAccessorySetupRequest *)self suggestedRoomUniqueIdentifier];
    v19 = (void *)[v17 initWithName:@"Suggested Room Unique Identifier" value:v18];
    [v3 addObject:v19];
  }
  v20 = [(HMAccessorySetupRequest *)self suggestedAccessoryName];

  if (v20)
  {
    id v21 = objc_alloc(MEMORY[0x1E4F653F8]);
    v22 = [(HMAccessorySetupRequest *)self suggestedAccessoryName];
    v23 = (void *)[v21 initWithName:@"Suggested Accessory Name" value:v22];
    [v3 addObject:v23];
  }
  v24 = (void *)[v3 copy];

  return (NSArray *)v24;
}

- (NSString)description
{
  return (NSString *)MEMORY[0x1F411CB90](self, a2);
}

- (NSString)shortDescription
{
  v2 = objc_opt_class();

  return (NSString *)[v2 shortDescription];
}

- (HMAccessorySetupRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMASR.ck.payload"];
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v6 = (void *)getMTRSetupPayloadClass_softClass;
  uint64_t v18 = getMTRSetupPayloadClass_softClass;
  if (!getMTRSetupPayloadClass_softClass)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __getMTRSetupPayloadClass_block_invoke;
    v14[3] = &unk_1E5943DD8;
    v14[4] = &v15;
    __getMTRSetupPayloadClass_block_invoke((uint64_t)v14);
    v6 = (void *)v16[3];
  }
  id v7 = v6;
  _Block_object_dispose(&v15, 8);
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMASR.ck.matterPayload"];
  id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMASR.ck.homeUniqueIdentifier"];
  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMASR.ck.suggestedRoomUniqueIdentifier"];
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMASR.ck.suggestedAccessoryName"];
  v12 = [(HMAccessorySetupRequest *)self init];
  [(HMAccessorySetupRequest *)v12 setPayload:v5];
  [(HMAccessorySetupRequest *)v12 setMatterPayload:v8];
  [(HMAccessorySetupRequest *)v12 setHomeUniqueIdentifier:v9];
  [(HMAccessorySetupRequest *)v12 setSuggestedRoomUniqueIdentifier:v10];
  [(HMAccessorySetupRequest *)v12 setSuggestedAccessoryName:v11];

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HMAccessorySetupRequest *)self payload];
  [v4 encodeObject:v5 forKey:@"HMASR.ck.payload"];

  v6 = [(HMAccessorySetupRequest *)self matterPayload];
  [v4 encodeObject:v6 forKey:@"HMASR.ck.matterPayload"];

  id v7 = [(HMAccessorySetupRequest *)self homeUniqueIdentifier];
  [v4 encodeObject:v7 forKey:@"HMASR.ck.homeUniqueIdentifier"];

  v8 = [(HMAccessorySetupRequest *)self suggestedRoomUniqueIdentifier];
  [v4 encodeObject:v8 forKey:@"HMASR.ck.suggestedRoomUniqueIdentifier"];

  id v9 = [(HMAccessorySetupRequest *)self suggestedAccessoryName];
  [v4 encodeObject:v9 forKey:@"HMASR.ck.suggestedAccessoryName"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[HMAccessorySetupRequest allocWithZone:a3] init];
  id v5 = [(HMAccessorySetupRequest *)self payload];
  [(HMAccessorySetupRequest *)v4 setPayload:v5];

  v6 = [(HMAccessorySetupRequest *)self matterPayload];
  [(HMAccessorySetupRequest *)v4 setMatterPayload:v6];

  id v7 = [(HMAccessorySetupRequest *)self homeUniqueIdentifier];
  [(HMAccessorySetupRequest *)v4 setHomeUniqueIdentifier:v7];

  v8 = [(HMAccessorySetupRequest *)self suggestedRoomUniqueIdentifier];
  [(HMAccessorySetupRequest *)v4 setSuggestedRoomUniqueIdentifier:v8];

  id v9 = [(HMAccessorySetupRequest *)self suggestedAccessoryName];
  [(HMAccessorySetupRequest *)v4 setSuggestedAccessoryName:v9];

  return v4;
}

- (unint64_t)hash
{
  v3 = [(HMAccessorySetupRequest *)self payload];
  uint64_t v4 = [v3 hash];

  id v5 = [(HMAccessorySetupRequest *)self matterPayload];
  uint64_t v6 = [v5 hash] ^ v4;

  id v7 = [(HMAccessorySetupRequest *)self homeUniqueIdentifier];
  uint64_t v8 = [v7 hash];

  id v9 = [(HMAccessorySetupRequest *)self suggestedRoomUniqueIdentifier];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];

  v11 = [(HMAccessorySetupRequest *)self suggestedAccessoryName];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_10;
  }
  id v7 = [(HMAccessorySetupRequest *)self payload];
  uint64_t v8 = [v6 payload];
  int v9 = HMFEqualObjects();

  if (!v9) {
    goto LABEL_10;
  }
  uint64_t v10 = [(HMAccessorySetupRequest *)self matterPayload];
  v11 = [v6 matterPayload];
  int v12 = HMFEqualObjects();

  if (!v12) {
    goto LABEL_10;
  }
  id v13 = [(HMAccessorySetupRequest *)self homeUniqueIdentifier];
  v14 = [v6 homeUniqueIdentifier];
  int v15 = HMFEqualObjects();

  if (!v15) {
    goto LABEL_10;
  }
  v16 = [(HMAccessorySetupRequest *)self suggestedRoomUniqueIdentifier];
  uint64_t v17 = [v6 suggestedRoomUniqueIdentifier];
  int v18 = HMFEqualObjects();

  if (v18)
  {
    v19 = [(HMAccessorySetupRequest *)self suggestedAccessoryName];
    v20 = [v6 suggestedAccessoryName];
    char v21 = HMFEqualObjects();
  }
  else
  {
LABEL_10:
    char v21 = 0;
  }

  return v21;
}

- (HMAccessorySetupRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)HMAccessorySetupRequest;
  return [(HMAccessorySetupRequest *)&v3 init];
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

@end