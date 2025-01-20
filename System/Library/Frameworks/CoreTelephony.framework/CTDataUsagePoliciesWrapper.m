@interface CTDataUsagePoliciesWrapper
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTDataUsagePoliciesWrapper)initWithCoder:(id)a3;
- (CTDataUsagePoliciesWrapper)initWithPolicies:(id)a3;
- (NSSet)policies;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CTDataUsagePoliciesWrapper

- (CTDataUsagePoliciesWrapper)initWithPolicies:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTDataUsagePoliciesWrapper;
  v6 = [(CTDataUsagePoliciesWrapper *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_policies, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(CTDataUsagePoliciesWrapper *)self policies];
    v6 = [v4 policies];
    char v7 = [v5 isEqualToSet:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(CTDataUsagePoliciesWrapper *)self policies];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CTDataUsagePoliciesWrapper *)self policies];
  [v4 encodeObject:v5 forKey:@"policiesKey"];
}

- (CTDataUsagePoliciesWrapper)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTDataUsagePoliciesWrapper;
  id v5 = [(CTDataUsagePoliciesWrapper *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    char v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"policiesKey"];
    policies = v5->_policies;
    v5->_policies = (NSSet *)v9;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSet)policies
{
  return self->_policies;
}

- (void).cxx_destruct
{
}

@end