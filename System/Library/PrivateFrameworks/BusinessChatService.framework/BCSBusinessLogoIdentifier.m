@interface BCSBusinessLogoIdentifier
+ (BOOL)supportsSecureCoding;
- (BCSBusinessLogoIdentifier)initWithBusinessId:(id)a3;
- (BCSBusinessLogoIdentifier)initWithCoder:(id)a3;
- (NSString)businessId;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBusinessId:(id)a3;
@end

@implementation BCSBusinessLogoIdentifier

- (BCSBusinessLogoIdentifier)initWithBusinessId:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCSBusinessLogoIdentifier;
  v6 = [(BCSBusinessLogoIdentifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_businessId, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    id v5 = [(BCSBusinessLogoIdentifier *)self businessId];
    uint64_t v6 = [v5 copy];
    v7 = (void *)v4[1];
    v4[1] = v6;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BCSBusinessLogoIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BCSBusinessLogoIdentifier;
  id v5 = [(BCSBusinessLogoIdentifier *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BusinessId"];
    businessId = v5->_businessId;
    v5->_businessId = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)businessId
{
  return self->_businessId;
}

- (void)setBusinessId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end