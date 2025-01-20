@interface HMCHIPAccessoryOperationalIdentity
+ (id)shortDescription;
- (BOOL)isEqual:(id)a3;
- (HMCHIPAccessoryOperationalIdentity)initWithRootPublicKey:(id)a3 nodeID:(id)a4;
- (NSArray)attributeDescriptions;
- (NSData)rootPublicKey;
- (NSNumber)nodeID;
- (NSString)description;
- (NSString)shortDescription;
- (unint64_t)hash;
@end

@implementation HMCHIPAccessoryOperationalIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeID, 0);

  objc_storeStrong((id *)&self->_rootPublicKey, 0);
}

- (NSNumber)nodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSData)rootPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)attributeDescriptions
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v5 = NSNumber;
  v6 = [(HMCHIPAccessoryOperationalIdentity *)self rootPublicKey];
  v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  v8 = (void *)[v4 initWithName:@"rootPublicKey Hash" value:v7];
  [v3 addObject:v8];

  id v9 = objc_alloc(MEMORY[0x1E4F653F8]);
  v10 = [(HMCHIPAccessoryOperationalIdentity *)self nodeID];
  v11 = (void *)[v9 initWithName:@"NodeID" value:v10];
  [v3 addObject:v11];

  v12 = (void *)[v3 copy];

  return (NSArray *)v12;
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

- (unint64_t)hash
{
  v3 = [(HMCHIPAccessoryOperationalIdentity *)self rootPublicKey];
  uint64_t v4 = [v3 hash];
  v5 = [(HMCHIPAccessoryOperationalIdentity *)self nodeID];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HMCHIPAccessoryOperationalIdentity *)self rootPublicKey];
    v8 = [v6 rootPublicKey];
    if ([v7 isEqualToData:v8])
    {
      id v9 = [(HMCHIPAccessoryOperationalIdentity *)self nodeID];
      v10 = [v6 nodeID];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (HMCHIPAccessoryOperationalIdentity)initWithRootPublicKey:(id)a3 nodeID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMCHIPAccessoryOperationalIdentity;
  id v9 = [(HMCHIPAccessoryOperationalIdentity *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rootPublicKey, a3);
    objc_storeStrong((id *)&v10->_nodeID, a4);
  }

  return v10;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

@end