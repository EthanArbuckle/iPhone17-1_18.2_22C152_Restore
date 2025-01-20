@interface CNMeContactsPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNMeContactsPredicate)initWithCoder:(id)a3;
- (id)contactsFromDonationStore:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNMeContactsPredicate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNMeContactsPredicate)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNMeContactsPredicate;
  return [(CNPredicate *)&v4 initWithCoder:a3];
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNMeContactsPredicate;
  [(CNPredicate *)&v3 encodeWithCoder:a3];
}

- (id)description
{
  v2 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v3 = (id)[v2 appendName:@"kind" object:@"-[CNContact predicateForMeContact]"];
  objc_super v4 = [v2 build];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  return objc_msgSend(MEMORY[0x1E4F5A3E0], "isObject:memberOfSameClassAndEqualTo:withBlocks:", a3, self, &__block_literal_global_28, 0);
}

uint64_t __33__CNMeContactsPredicate_isEqual___block_invoke()
{
  return 1;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

- (id)contactsFromDonationStore:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a3 donatedMeCardEither];
  int v4 = [v3 isLeft];
  v5 = (void *)MEMORY[0x1E4F5A3B8];
  if (v4)
  {
    v6 = [v3 left];
    v10[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v8 = [v5 eitherWithLeft:v7];
  }
  else
  {
    v6 = [v3 right];
    v8 = [v5 eitherWithRight:v6];
  }

  return v8;
}

@end