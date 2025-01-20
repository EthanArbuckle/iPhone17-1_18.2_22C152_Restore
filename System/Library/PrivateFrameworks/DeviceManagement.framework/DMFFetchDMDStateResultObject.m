@interface DMFFetchDMDStateResultObject
+ (BOOL)supportsSecureCoding;
- (DMFFetchDMDStateResultObject)initWithCoder:(id)a3;
- (DMFFetchDMDStateResultObject)initWithStateDescription:(id)a3;
- (NSString)dmdStateDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setDmdStateDescription:(id)a3;
@end

@implementation DMFFetchDMDStateResultObject

- (DMFFetchDMDStateResultObject)initWithStateDescription:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchDMDStateResultObject;
  v5 = [(CATTaskResultObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dmdStateDescription = v5->_dmdStateDescription;
    v5->_dmdStateDescription = (NSString *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchDMDStateResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DMFFetchDMDStateResultObject;
  v5 = [(CATTaskResultObject *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"dmdStateDescription"];
    dmdStateDescription = v5->_dmdStateDescription;
    v5->_dmdStateDescription = (NSString *)v7;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchDMDStateResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(DMFFetchDMDStateResultObject *)self dmdStateDescription];
  [v4 encodeObject:v5 forKey:@"dmdStateDescription"];
}

- (NSString)dmdStateDescription
{
  return self->_dmdStateDescription;
}

- (void)setDmdStateDescription:(id)a3
{
}

- (void).cxx_destruct
{
}

@end