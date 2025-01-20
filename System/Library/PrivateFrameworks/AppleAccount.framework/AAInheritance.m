@interface AAInheritance
+ (BOOL)supportsSecureCoding;
- (AAInheritance)initWithCoder:(id)a3;
- (NSArray)benefactors;
- (NSArray)beneficiaries;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AAInheritance

- (void)encodeWithCoder:(id)a3
{
  beneficiaries = self->_beneficiaries;
  id v5 = a3;
  [v5 encodeObject:beneficiaries forKey:@"_beneficiaries"];
  [v5 encodeObject:self->_benefactors forKey:@"_benefactors"];
}

- (AAInheritance)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AAInheritance *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v8 forKey:@"_beneficiaries"];
    beneficiaries = v5->_beneficiaries;
    v5->_beneficiaries = (NSArray *)v12;

    uint64_t v14 = [v4 decodeObjectOfClasses:v11 forKey:@"_benefactors"];
    benefactors = v5->_benefactors;
    v5->_benefactors = (NSArray *)v14;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(AAInheritance);
  uint64_t v5 = [(NSArray *)self->_beneficiaries copy];
  beneficiaries = v4->_beneficiaries;
  v4->_beneficiaries = (NSArray *)v5;

  uint64_t v7 = [(NSArray *)self->_benefactors copy];
  benefactors = v4->_benefactors;
  v4->_benefactors = (NSArray *)v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)beneficiaries
{
  return self->_beneficiaries;
}

- (NSArray)benefactors
{
  return self->_benefactors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_benefactors, 0);

  objc_storeStrong((id *)&self->_beneficiaries, 0);
}

@end