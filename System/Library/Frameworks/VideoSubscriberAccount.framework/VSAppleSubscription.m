@interface VSAppleSubscription
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (NSArray)productCodes;
- (NSString)customerID;
- (VSAppleSubscription)init;
- (VSAppleSubscription)initWithCoder:(id)a3;
- (VSAppleSubscription)initWithCustomerID:(id)a3 productCodes:(id)a4;
- (id)componentsForPrinting:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)prettyPrint;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCustomerID:(id)a3;
- (void)setProductCodes:(id)a3;
@end

@implementation VSAppleSubscription

- (VSAppleSubscription)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

+ (id)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3C8];
  uint64_t v4 = NSStringFromSelector(a2);
  [v2 raise:v3, @"The %@ initializer is not available.", v4 format];

  return 0;
}

- (VSAppleSubscription)initWithCustomerID:(id)a3 productCodes:(id)a4
{
  id v5 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)VSAppleSubscription;
  v9 = [(VSAppleSubscription *)&v32 init];
  if (v9)
  {
    v10 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
    v11 = [v7 stringByTrimmingCharactersInSet:v10];
    uint64_t v12 = [v11 length];

    if (!v12) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"customerID is required."];
    }
    if ([v8 count])
    {
      v24 = v9;
      id v25 = v5;
      id v26 = a4;
      id v27 = v7;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v13 = v8;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v29;
        uint64_t v17 = *MEMORY[0x1E4F1C3C8];
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v29 != v16) {
              objc_enumerationMutation(v13);
            }
            v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            v20 = [MEMORY[0x1E4F28E58] whitespaceAndNewlineCharacterSet];
            v21 = [v19 stringByTrimmingCharactersInSet:v20];
            uint64_t v22 = [v21 length];

            if (!v22) {
              [MEMORY[0x1E4F1CA00] raise:v17 format:@"Invalid product code was provided."];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
        }
        while (v15);
      }

      a4 = v26;
      id v7 = v27;
      id v5 = v25;
      v9 = v24;
    }
    else
    {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"At least one product code is required."];
    }
    objc_storeStrong((id *)&v9->_customerID, v5);
    objc_storeStrong((id *)&v9->_productCodes, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VSAppleSubscription)initWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireKeyedCoder(v4);
  id v5 = [(VSAppleSubscription *)self initWithCustomerID:@"sampleCID" productCodes:&unk_1F34D0E80];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customerID"];

    if (!v6) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [coder decodeObjectOfClass:[NSString class] forKey:kVSAppleSubscriptionTypeCustomerIDKey] parameter must not be nil."];
    }
    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customerID"];
    [(VSAppleSubscription *)v5 setCustomerID:v7];

    id v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"productCodes"];

    if (!v8) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [coder decodeArrayOfObjectsOfClass:[NSString class] forKey:kVSAppleSubscriptionTypeProductCodesKey] parameter must not be nil."];
    }
    v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"productCodes"];
    [(VSAppleSubscription *)v5 setProductCodes:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  VSRequireKeyedCoder(v4);
  id v5 = [(VSAppleSubscription *)self customerID];
  [v4 encodeObject:v5 forKey:@"customerID"];

  id v6 = [(VSAppleSubscription *)self productCodes];
  [v4 encodeObject:v6 forKey:@"productCodes"];
}

- (id)description
{
  uint64_t v3 = [(VSAppleSubscription *)self componentsForPrinting:@" = "];
  id v4 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)VSAppleSubscription;
  id v5 = [(VSAppleSubscription *)&v9 description];
  id v6 = [v3 componentsJoinedByString:@", "];
  id v7 = [v4 stringWithFormat:@"<%@ %@>", v5, v6];

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(VSAppleSubscription *)self customerID];
  uint64_t v4 = [v3 hash];
  id v5 = [(VSAppleSubscription *)self productCodes];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VSAppleSubscription *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    char v16 = 1;
  }
  else if (v4)
  {
    unint64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v7 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v8 = *MEMORY[0x1E4F1C3C8];
        objc_super v9 = (objc_class *)objc_opt_class();
        v10 = NSStringFromClass(v9);
        [v7 raise:v8, @"Unexpectedly, object was %@, instead of VSAppleSubscription.", v10 format];
      }
      v11 = v6;
      uint64_t v12 = [(VSAppleSubscription *)self customerID];
      id v13 = [(VSAppleSubscription *)v11 customerID];
      if ([v12 isEqualToString:v13])
      {
        uint64_t v14 = [(VSAppleSubscription *)self productCodes];
        uint64_t v15 = [(VSAppleSubscription *)v11 productCodes];
        char v16 = [v14 isEqualToArray:v15];
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [VSAppleSubscription alloc];
  id v5 = [(VSAppleSubscription *)self customerID];
  unint64_t v6 = [(VSAppleSubscription *)self productCodes];
  id v7 = [(VSAppleSubscription *)v4 initWithCustomerID:v5 productCodes:v6];

  return v7;
}

- (id)componentsForPrinting:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  id v7 = NSString;
  uint64_t v8 = [(VSAppleSubscription *)self customerID];
  objc_super v9 = [v7 stringWithFormat:@"%@%@%@", @"customerID", v5, v8];
  [v6 addObject:v9];

  v10 = NSString;
  v11 = [(VSAppleSubscription *)self productCodes];
  uint64_t v12 = [v10 stringWithFormat:@"%@%@%@", @"productCodes", v5, v11];

  [v6 addObject:v12];

  return v6;
}

- (id)prettyPrint
{
  v2 = [(VSAppleSubscription *)self componentsForPrinting:@": "];
  uint64_t v3 = [v2 componentsJoinedByString:@"\n"];

  return v3;
}

- (NSString)customerID
{
  return self->_customerID;
}

- (void)setCustomerID:(id)a3
{
}

- (NSArray)productCodes
{
  return self->_productCodes;
}

- (void)setProductCodes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productCodes, 0);

  objc_storeStrong((id *)&self->_customerID, 0);
}

@end