@interface FHMerchantAggregateFeature
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (FHMerchantAggregateFeature)initWithCoder:(id)a3;
- (FHMerchantAggregateFeature)initWithMerchantID:(id)a3 merchantDisplayName:(id)a4;
- (NSString)merchantDisplayName;
- (NSString)merchantID;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMerchantDisplayName:(id)a3;
- (void)setMerchantID:(id)a3;
@end

@implementation FHMerchantAggregateFeature

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FHMerchantAggregateFeature;
  id v4 = a3;
  [(FHAggregateFeature *)&v7 encodeWithCoder:v4];
  v5 = [(FHMerchantAggregateFeature *)self merchantID];
  [v4 encodeObject:v5 forKey:@"merchantID"];

  v6 = [(FHMerchantAggregateFeature *)self merchantDisplayName];
  [v4 encodeObject:v6 forKey:@"merchantDisplayName"];
}

- (FHMerchantAggregateFeature)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FHMerchantAggregateFeature;
  v5 = [(FHAggregateFeature *)&v9 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantID"];
    [(FHMerchantAggregateFeature *)v5 setMerchantID:v6];

    objc_super v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"merchantDisplayName"];
    [(FHMerchantAggregateFeature *)v5 setMerchantDisplayName:v7];
  }
  return v5;
}

- (FHMerchantAggregateFeature)initWithMerchantID:(id)a3 merchantDisplayName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FHMerchantAggregateFeature;
  objc_super v9 = [(FHMerchantAggregateFeature *)&v12 init];
  v10 = v9;
  if (v9)
  {
    [(FHAggregateFeature *)v9 setType:3];
    objc_storeStrong((id *)&v10->_merchantID, a3);
    objc_storeStrong((id *)&v10->_merchantDisplayName, a4);
  }

  return v10;
}

- (id)description
{
  v3 = [MEMORY[0x263F089D8] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"%@: '%@'; ", @"merchantID", self->_merchantID];
  [v3 appendFormat:@"%@: '%@'; ", @"merchantDisplayName", self->_merchantDisplayName];
  [v3 appendFormat:@">"];
  return v3;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)FHMerchantAggregateFeature;
  unint64_t v3 = [(FHAggregateFeature *)&v9 hash];
  id v4 = [(FHMerchantAggregateFeature *)self merchantID];
  uint64_t v5 = [v4 hash] - v3 + 32 * v3;

  v6 = [(FHMerchantAggregateFeature *)self merchantDisplayName];
  unint64_t v7 = [v6 hash] - v5 + 32 * v5;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FHMerchantAggregateFeature *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else if (v4 {
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
         && (v12.receiver = self,
             v12.super_class = (Class)FHMerchantAggregateFeature,
             [(FHAggregateFeature *)&v12 isEqual:v5]))
  {
    v6 = [(FHMerchantAggregateFeature *)self merchantID];
    unint64_t v7 = [(FHMerchantAggregateFeature *)v5 merchantID];
    if ([v6 isEqual:v7])
    {
      id v8 = [(FHMerchantAggregateFeature *)self merchantDisplayName];
      objc_super v9 = [(FHMerchantAggregateFeature *)v5 merchantDisplayName];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (NSString)merchantID
{
  return self->_merchantID;
}

- (void)setMerchantID:(id)a3
{
}

- (NSString)merchantDisplayName
{
  return self->_merchantDisplayName;
}

- (void)setMerchantDisplayName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantDisplayName, 0);
  objc_storeStrong((id *)&self->_merchantID, 0);
}

@end