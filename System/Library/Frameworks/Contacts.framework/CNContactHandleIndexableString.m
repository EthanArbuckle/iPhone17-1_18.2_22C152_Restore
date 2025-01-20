@interface CNContactHandleIndexableString
+ (BOOL)supportsSecureCoding;
+ (id)emailIndexKey:(id)a3;
+ (id)equivalenceStrategyWithString:(id)a3;
+ (id)phoneNumberIndexKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToString:(id)a3 strict:(BOOL *)a4;
- (CNContactHandleIndexableString)initWithCoder:(id)a3;
- (CNContactHandleIndexableString)initWithFullString:(id)a3 indexKey:(id)a4 equivalenceStrategy:(id)a5;
- (CNContactHandleIndexableString)initWithString:(id)a3;
- (NSString)indexKey;
- (NSString)stringValue;
- (_CNContactHandleStringEquivalenceStrategy)equivalenceStrategy;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNContactHandleIndexableString

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_equivalenceStrategy, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);

  objc_storeStrong((id *)&self->_indexKey, 0);
}

- (CNContactHandleIndexableString)initWithString:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() equivalenceStrategyWithString:v4];
  v6 = [(id)objc_opt_class() indexKeyForString:v4];
  v7 = [(CNContactHandleIndexableString *)self initWithFullString:v4 indexKey:v6 equivalenceStrategy:v5];

  return v7;
}

- (CNContactHandleIndexableString)initWithFullString:(id)a3 indexKey:(id)a4 equivalenceStrategy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)CNContactHandleIndexableString;
  v11 = [(CNContactHandleIndexableString *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    stringValue = v11->_stringValue;
    v11->_stringValue = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    indexKey = v11->_indexKey;
    v11->_indexKey = (NSString *)v14;

    objc_storeStrong((id *)&v11->_equivalenceStrategy, a5);
    v16 = v11;
  }

  return v11;
}

- (NSString)indexKey
{
  return self->_indexKey;
}

+ (id)equivalenceStrategyWithString:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "_cn_containsSubstring:", @"@")) {
    id v4 = [[_CNContactEmailAddressEquivalence alloc] initWithEmailAddress:v3];
  }
  else {
    id v4 = [[_CNContactPhoneNumberEquivalence alloc] initWithPhoneNumberString:v3];
  }
  v5 = v4;

  return v5;
}

+ (id)emailIndexKey:(id)a3
{
  return +[_CNContactEmailAddressEquivalence indexKeyForString:a3];
}

+ (id)phoneNumberIndexKey:(id)a3
{
  return +[_CNContactPhoneNumberEquivalence indexKeyForString:a3];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"string" object:self->_stringValue];
  id v5 = (id)[v3 appendName:@"indexKey" object:self->_indexKey];
  id v6 = (id)[v3 appendName:@"equivalence strategy" object:self->_equivalenceStrategy];
  v7 = [v3 build];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNContactHandleIndexableString *)a3;
  BOOL v7 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (stringValue = self->_stringValue, (unint64_t)stringValue | (unint64_t)v4->_stringValue)
      && !-[NSString isEqual:](stringValue, "isEqual:")
      || (indexKey = self->_indexKey, (unint64_t)indexKey | (unint64_t)v4->_indexKey)
      && !-[NSString isEqual:](indexKey, "isEqual:"))
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F5A418] objectHash:self->_stringValue];
  return [MEMORY[0x1E4F5A418] objectHash:self->_indexKey] - v3 + 32 * v3 + 16337;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactHandleIndexableString)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringValue"];

  id v6 = [(CNContactHandleIndexableString *)self initWithString:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEquivalentToString:(id)a3 strict:(BOOL *)a4
{
  return [(_CNContactHandleStringEquivalenceStrategy *)self->_equivalenceStrategy isEquivalentToString:a3 strict:a4];
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (_CNContactHandleStringEquivalenceStrategy)equivalenceStrategy
{
  return self->_equivalenceStrategy;
}

@end