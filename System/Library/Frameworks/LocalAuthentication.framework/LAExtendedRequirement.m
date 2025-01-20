@interface LAExtendedRequirement
+ (LAExtendedRequirement)applicationRemainsForegroundRequirement;
- (BOOL)isEqual:(id)a3;
- (id)initWithConstraint:(id *)a1;
- (unint64_t)hash;
- (void)encodeWithACLCoder:(id)a3;
@end

@implementation LAExtendedRequirement

- (id)initWithConstraint:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)LAExtendedRequirement;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

+ (LAExtendedRequirement)applicationRemainsForegroundRequirement
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = [LAExtendedRequirement alloc];
  v6 = @"af";
  v7[0] = MEMORY[0x1E4F1CC38];
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = -[LAExtendedRequirement initWithConstraint:]((id *)&v2->super.isa, v3);

  return (LAExtendedRequirement *)v4;
}

- (void)encodeWithACLCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    v6 = (NSDictionary *)v5[1];
    BOOL v7 = v6 == self->_constraint || -[NSDictionary isEqualToDictionary:](v6, "isEqualToDictionary:");
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_constraint hash];
}

- (void).cxx_destruct
{
}

@end