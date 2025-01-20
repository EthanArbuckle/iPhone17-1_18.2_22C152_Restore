@interface CNMissingBackgroundColorsContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNMissingBackgroundColorsContactPredicate)initWithCoder:(id)a3;
- (id)description;
- (id)shortDebugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNMissingBackgroundColorsContactPredicate

- (id)description
{
  v2 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v3 = (id)[v2 appendName:@"kind" object:@"-[CNContact predicateForContactsMissingBackgroundColors]"];
  v4 = [v2 build];

  return v4;
}

- (id)shortDebugDescription
{
  return @"MissingBackgroundColorsPredicate";
}

- (BOOL)isEqual:(id)a3
{
  return objc_msgSend(MEMORY[0x1E4F5A3E0], "isObject:equalToOther:withBlocks:", self, a3, &__block_literal_global_84, 0);
}

uint64_t __53__CNMissingBackgroundColorsContactPredicate_isEqual___block_invoke()
{
  return 1;
}

- (unint64_t)hash
{
  v2 = objc_opt_class();

  return [v2 hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNMissingBackgroundColorsContactPredicate)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNMissingBackgroundColorsContactPredicate;
  id v3 = [(CNPredicate *)&v7 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    v5 = v3;
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNMissingBackgroundColorsContactPredicate;
  [(CNPredicate *)&v3 encodeWithCoder:a3];
}

@end