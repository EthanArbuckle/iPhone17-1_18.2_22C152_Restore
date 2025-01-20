@interface CRKFetchMDMIdentityResultObject
+ (BOOL)supportsSecureCoding;
- (CRKFetchMDMIdentityResultObject)initWithCoder:(id)a3;
- (NSString)mdmIdentityCommonName;
- (void)encodeWithCoder:(id)a3;
- (void)setMdmIdentityCommonName:(id)a3;
@end

@implementation CRKFetchMDMIdentityResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKFetchMDMIdentityResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKFetchMDMIdentityResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"mdmIdentityCommonName"];
    mdmIdentityCommonName = v5->_mdmIdentityCommonName;
    v5->_mdmIdentityCommonName = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CRKFetchMDMIdentityResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(CRKFetchMDMIdentityResultObject *)self mdmIdentityCommonName];
  [v4 encodeObject:v5 forKey:@"mdmIdentityCommonName"];
}

- (NSString)mdmIdentityCommonName
{
  return self->_mdmIdentityCommonName;
}

- (void)setMdmIdentityCommonName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end