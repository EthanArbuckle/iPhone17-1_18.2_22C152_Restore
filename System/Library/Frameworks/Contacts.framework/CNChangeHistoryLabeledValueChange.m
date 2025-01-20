@interface CNChangeHistoryLabeledValueChange
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNChangeHistoryLabeledValueChange)initWithCoder:(id)a3;
- (CNChangeHistoryLabeledValueChange)initWithContactIdentifier:(id)a3 propertyKey:(id)a4 labeledValueIdentifier:(id)a5 changeType:(int64_t)a6;
- (NSString)contactIdentifier;
- (NSString)labeledValueIdentifier;
- (NSString)propertyKey;
- (id)description;
- (int64_t)changeType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNChangeHistoryLabeledValueChange

- (CNChangeHistoryLabeledValueChange)initWithContactIdentifier:(id)a3 propertyKey:(id)a4 labeledValueIdentifier:(id)a5 changeType:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CNChangeHistoryLabeledValueChange;
  v13 = [(CNChangeHistoryLabeledValueChange *)&v22 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    contactIdentifier = v13->_contactIdentifier;
    v13->_contactIdentifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    propertyKey = v13->_propertyKey;
    v13->_propertyKey = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    labeledValueIdentifier = v13->_labeledValueIdentifier;
    v13->_labeledValueIdentifier = (NSString *)v18;

    v13->_changeType = a6;
    v20 = v13;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryLabeledValueChange)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CNChangeHistoryLabeledValueChange;
  v5 = [(CNChangeHistoryLabeledValueChange *)&v17 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contactIdentifier"];
    uint64_t v7 = [v6 copy];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_propertyKey"];
    uint64_t v10 = [v9 copy];
    propertyKey = v5->_propertyKey;
    v5->_propertyKey = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_labeledValueIdentifier"];
    uint64_t v13 = [v12 copy];
    labeledValueIdentifier = v5->_labeledValueIdentifier;
    v5->_labeledValueIdentifier = (NSString *)v13;

    v5->_changeType = [v4 decodeIntegerForKey:@"_changeType"];
    v15 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  contactIdentifier = self->_contactIdentifier;
  id v5 = a3;
  [v5 encodeObject:contactIdentifier forKey:@"_contactIdentifier"];
  [v5 encodeObject:self->_propertyKey forKey:@"_propertyKey"];
  [v5 encodeObject:self->_labeledValueIdentifier forKey:@"_labeledValueIdentifier"];
  [v5 encodeInteger:self->_changeType forKey:@"_changeType"];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F5A3A8];
  id v4 = [(CNChangeHistoryLabeledValueChange *)self contactIdentifier];
  id v5 = [(CNChangeHistoryLabeledValueChange *)self propertyKey];
  v6 = [(CNChangeHistoryLabeledValueChange *)self labeledValueIdentifier];
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", -[CNChangeHistoryLabeledValueChange changeType](self, "changeType"));
  v8 = objc_msgSend(v3, "descriptionForObject:withNamesAndObjects:", self, @"contactIdentifier", v4, @"propertyKey", v5, @"labeledValueIdentifier", v6, @"changeType", v7, 0);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke;
  v23[3] = &unk_1E56B3E18;
  v23[4] = self;
  id v24 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E56B3E18;
  aBlock[4] = self;
  id v6 = v24;
  id v22 = v6;
  uint64_t v7 = _Block_copy(aBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke_3;
  v19[3] = &unk_1E56B3E18;
  v19[4] = self;
  id v8 = v6;
  id v20 = v8;
  v9 = _Block_copy(v19);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  v15 = __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke_4;
  uint64_t v16 = &unk_1E56B3E18;
  objc_super v17 = self;
  id v18 = v8;
  id v10 = v8;
  id v11 = _Block_copy(&v13);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v10, self, v23, v7, v9, v11, 0, v13, v14, v15, v16, v17);

  return (char)self;
}

uint64_t __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) contactIdentifier];
  id v4 = [*(id *)(a1 + 40) contactIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) propertyKey];
  id v4 = [*(id *)(a1 + 40) propertyKey];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) labeledValueIdentifier];
  id v4 = [*(id *)(a1 + 40) labeledValueIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __45__CNChangeHistoryLabeledValueChange_isEqual___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) changeType];
  uint64_t v4 = [*(id *)(a1 + 40) changeType];

  return [v2 isInteger:v3 equalToOther:v4];
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)propertyKey
{
  return self->_propertyKey;
}

- (NSString)labeledValueIdentifier
{
  return self->_labeledValueIdentifier;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labeledValueIdentifier, 0);
  objc_storeStrong((id *)&self->_propertyKey, 0);

  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

@end