@interface CNHandleStringClassification
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNHandleStringClassification)initWithBuilder:(id)a3;
- (CNHandleStringClassification)initWithCoder:(id)a3;
- (CNHandleStringClassification)initWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 unknown:(id)a5;
- (NSArray)emailAddresses;
- (NSArray)phoneNumbers;
- (NSArray)unknown;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNHandleStringClassification

- (NSArray)unknown
{
  return self->_unknown;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (CNHandleStringClassification)initWithBuilder:(id)a3
{
  id v4 = a3;
  v5 = [v4 emailAddresses];
  v6 = [v4 phoneNumbers];
  v7 = [v4 unknown];

  v8 = [(CNHandleStringClassification *)self initWithEmailAddresses:v5 phoneNumbers:v6 unknown:v7];
  return v8;
}

- (CNHandleStringClassification)initWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 unknown:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)CNHandleStringClassification;
  v11 = [(CNHandleStringClassification *)&v24 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    v13 = (void *)v12;
    v14 = (void *)MEMORY[0x1E4F1CBF0];
    if (v12) {
      v15 = (void *)v12;
    }
    else {
      v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&v11->_emailAddresses, v15);

    uint64_t v16 = [v9 copy];
    v17 = (void *)v16;
    if (v16) {
      v18 = (void *)v16;
    }
    else {
      v18 = v14;
    }
    objc_storeStrong((id *)&v11->_phoneNumbers, v18);

    uint64_t v19 = [v10 copy];
    v20 = (void *)v19;
    if (v19) {
      v21 = (void *)v19;
    }
    else {
      v21 = v14;
    }
    objc_storeStrong((id *)&v11->_unknown, v21);

    v22 = v11;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknown, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);

  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

- (id)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"emailAddresses" object:self->_emailAddresses];
  id v5 = (id)[v3 appendName:@"phoneNumbers" object:self->_phoneNumbers];
  id v6 = (id)[v3 appendName:@"unknown" object:self->_unknown];
  v7 = [v3 build];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNHandleStringClassification *)a3;
  BOOL v8 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (emailAddresses = self->_emailAddresses,
          (unint64_t)emailAddresses | (unint64_t)v4->_emailAddresses)
      && !-[NSArray isEqual:](emailAddresses, "isEqual:")
      || (phoneNumbers = self->_phoneNumbers, (unint64_t)phoneNumbers | (unint64_t)v4->_phoneNumbers)
      && !-[NSArray isEqual:](phoneNumbers, "isEqual:")
      || (unknown = self->_unknown, (unint64_t)unknown | (unint64_t)v4->_unknown)
      && !-[NSArray isEqual:](unknown, "isEqual:"))
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = +[CNHashBuilder arrayHash:self->_emailAddresses];
  unint64_t v4 = +[CNHashBuilder arrayHash:self->_phoneNumbers] - v3 + 32 * v3;
  return +[CNHashBuilder arrayHash:self->_unknown] - v4 + 32 * v4 + 506447;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNHandleStringClassification)initWithCoder:(id)a3
{
  unint64_t v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  BOOL v8 = [v5 decodeObjectOfClasses:v7 forKey:@"_emailAddresses"];
  id v9 = [v5 decodeObjectOfClasses:v7 forKey:@"_phoneNumbers"];
  id v10 = [v5 decodeObjectOfClasses:v7 forKey:@"_unknown"];

  v11 = [(CNHandleStringClassification *)self initWithEmailAddresses:v8 phoneNumbers:v9 unknown:v10];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  emailAddresses = self->_emailAddresses;
  id v5 = a3;
  [v5 encodeObject:emailAddresses forKey:@"_emailAddresses"];
  [v5 encodeObject:self->_phoneNumbers forKey:@"_phoneNumbers"];
  [v5 encodeObject:self->_unknown forKey:@"_unknown"];
}

@end