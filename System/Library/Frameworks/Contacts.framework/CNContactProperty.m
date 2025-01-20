@interface CNContactProperty
+ (BOOL)supportsSecureCoding;
+ (CNContactProperty)contactPropertyWithContact:(id)a3 propertyKey:(id)a4 identifier:(id)a5;
+ (CNContactProperty)contactPropertyWithContactNoCopy:(id)a3 propertyKey:(id)a4 identifier:(id)a5;
- (BOOL)isEqual:(id)a3;
- (CNContact)contact;
- (CNContactProperty)initWithCoder:(id)a3;
- (NSString)identifier;
- (NSString)key;
- (NSString)label;
- (id)description;
- (id)labeledValue;
- (id)labeledValueForContact:(void *)a1;
- (id)primitiveValue;
- (id)sourceContact;
- (id)value;
- (int)multiValueIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)isMultiValueProperty;
@end

@implementation CNContactProperty

+ (CNContactProperty)contactPropertyWithContact:(id)a3 propertyKey:(id)a4 identifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  v12 = (void *)[v10 copy];

  -[CNChangesNotifierProxy setRemovalBlocks:]((uint64_t)v11, v12);
  if (v11)
  {
    objc_setProperty_nonatomic_copy(v11, v13, v8, 8);
    objc_setProperty_nonatomic_copy(v11, v14, v9, 16);
  }

  return (CNContactProperty *)v11;
}

+ (CNContactProperty)contactPropertyWithContactNoCopy:(id)a3 propertyKey:(id)a4 identifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)a1);
  -[CNChangesNotifierProxy setRemovalBlocks:]((uint64_t)v11, v10);

  if (v11)
  {
    objc_setProperty_nonatomic_copy(v11, v12, v8, 8);
    objc_setProperty_nonatomic_copy(v11, v13, v9, 16);
  }

  return (CNContactProperty *)v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactProperty)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNContactProperty;
  v5 = [(CNContactProperty *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_internalContact"];
    uint64_t v7 = [v6 copy];
    internalContact = v5->_internalContact;
    v5->_internalContact = (CNContact *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_key"];
    uint64_t v10 = [v9 copy];
    key = v5->_key;
    v5->_key = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_identifier"];
    uint64_t v13 = [v12 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  internalContact = self->_internalContact;
  id v5 = a3;
  [v5 encodeObject:internalContact forKey:@"_internalContact"];
  [v5 encodeObject:self->_key forKey:@"_key"];
  [v5 encodeObject:self->_identifier forKey:@"_identifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v6 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __29__CNContactProperty_isEqual___block_invoke;
  v16[3] = &unk_1E56B3E18;
  v16[4] = self;
  id v17 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __29__CNContactProperty_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E56B3E18;
  aBlock[4] = self;
  id v7 = v17;
  id v15 = v7;
  id v8 = _Block_copy(aBlock);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __29__CNContactProperty_isEqual___block_invoke_3;
  v12[3] = &unk_1E56B3E18;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  uint64_t v10 = _Block_copy(v12);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v9, v6, self, v16, v8, v10, 0);

  return (char)self;
}

uint64_t __29__CNContactProperty_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) contact];
  id v4 = [*(id *)(a1 + 40) contact];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __29__CNContactProperty_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) key];
  id v4 = [*(id *)(a1 + 40) key];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __29__CNContactProperty_isEqual___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) identifier];
  id v4 = [*(id *)(a1 + 40) identifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x1E4F5A418];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __25__CNContactProperty_hash__block_invoke;
  v10[3] = &unk_1E56B3E40;
  v10[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __25__CNContactProperty_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __25__CNContactProperty_hash__block_invoke_3;
  v8[3] = &unk_1E56B3E40;
  v8[4] = self;
  uint64_t v5 = _Block_copy(v8);
  unint64_t v6 = objc_msgSend(v3, "hashWithBlocks:", v10, v4, v5, 0);

  return v6;
}

uint64_t __25__CNContactProperty_hash__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    uint64_t v2 = *(void *)(v1 + 24);
  }
  else {
    uint64_t v2 = 0;
  }
  return [MEMORY[0x1E4F5A418] objectHash:v2];
}

uint64_t __25__CNContactProperty_hash__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) key];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __25__CNContactProperty_hash__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (id)description
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = [(CNContact *)self->_internalContact identifier];
  id v5 = (id)[v3 appendName:@"contact identifier" object:v4];

  internalContact = self->_internalContact;
  id v7 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v17[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  LODWORD(internalContact) = [(CNContact *)internalContact areKeysAvailable:v8];

  if (internalContact)
  {
    id v9 = +[CNContactFormatter stringFromContact:self->_internalContact style:0];
  }
  else
  {
    id v9 = @"<not fetched>";
  }
  id v10 = (id)[v3 appendName:@"contact name" object:v9];
  id v11 = (id)[v3 appendName:@"key" object:self->_key];
  if (self->_identifier) {
    id v12 = (id)objc_msgSend(v3, "appendName:object:", @"identifier");
  }
  id v13 = [(CNContactProperty *)self value];
  id v14 = (id)[v3 appendName:@"value" object:v13];

  id v15 = [v3 build];

  return v15;
}

- (CNContact)contact
{
  return self->_internalContact;
}

- (id)sourceContact
{
  uint64_t v3 = [(CNContactProperty *)self value];
  id v4 = [(CNContactProperty *)self identifier];
  id v5 = [(CNContactProperty *)self key];
  unint64_t v6 = [(CNContactProperty *)self contact];
  id v7 = +[CN sourceContactForValue:v3 labeledValueIdentifier:v4 propertyKey:v5 inUnifiedContact:v6];

  return v7;
}

- (id)labeledValueForContact:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = *MEMORY[0x1E4F5A298];
    id v5 = [a1 identifier];
    LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    if (v4)
    {
      a1 = 0;
    }
    else
    {
      objc_opt_class();
      unint64_t v6 = -[CNContactProperty primitiveValue](a1);
      if (objc_opt_isKindOfClass()) {
        id v7 = v6;
      }
      else {
        id v7 = 0;
      }
      id v8 = v7;

      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __44__CNContactProperty_labeledValueForContact___block_invoke;
      v10[3] = &unk_1E56B4F90;
      v10[4] = a1;
      a1 = objc_msgSend(v8, "_cn_firstObjectPassingTest:", v10);
    }
  }

  return a1;
}

- (id)primitiveValue
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = +[CN contactPropertiesByKey];
    id v3 = [v1 key];
    uint64_t v4 = [v2 objectForKeyedSubscript:v3];

    id v5 = [v1 contact];
    id v1 = [v4 CNValueForContact:v5];
  }

  return v1;
}

uint64_t __44__CNContactProperty_labeledValueForContact___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [*(id *)(a1 + 32) identifier];
  uint64_t v5 = [v3 isEqualToString:v4];

  return v5;
}

- (id)labeledValue
{
  id v3 = [(CNContactProperty *)self contact];
  uint64_t v4 = -[CNContactProperty labeledValueForContact:](self, v3);

  return v4;
}

- (NSString)label
{
  uint64_t v2 = [(CNContactProperty *)self labeledValue];
  id v3 = [v2 label];

  return (NSString *)v3;
}

- (id)value
{
  if (-[CNContactProperty isMultiValueProperty](self))
  {
    id v3 = [(CNContactProperty *)self labeledValue];
    uint64_t v4 = [v3 value];
  }
  else
  {
    uint64_t v4 = -[CNContactProperty primitiveValue](self);
  }

  return v4;
}

- (void)isMultiValueProperty
{
  if (result)
  {
    id v1 = result;
    uint64_t v2 = +[CN contactPropertiesByKey];
    id v3 = [v1 key];
    uint64_t v4 = [v2 objectForKeyedSubscript:v3];

    uint64_t v5 = [v4 isMultiValue];
    return (void *)v5;
  }
  return result;
}

- (int)multiValueIdentifier
{
  id v3 = [(CNContactProperty *)self contact];
  int v4 = [v3 isUnified];

  if (!v4)
  {
    unint64_t v6 = [(CNContactProperty *)self labeledValue];
    if (v6) {
      goto LABEL_3;
    }
LABEL_5:
    int v7 = -1;
    goto LABEL_6;
  }
  uint64_t v5 = [(CNContactProperty *)self sourceContact];
  unint64_t v6 = -[CNContactProperty labeledValueForContact:](self, v5);

  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  int v7 = [v6 iOSLegacyIdentifier];
LABEL_6:

  return v7;
}

- (NSString)key
{
  return self->_key;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalContact, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end