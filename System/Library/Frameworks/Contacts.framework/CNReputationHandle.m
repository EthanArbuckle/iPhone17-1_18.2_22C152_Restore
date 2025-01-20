@interface CNReputationHandle
+ (CNReputationHandle)handleWithEmailAddress:(id)a3;
+ (CNReputationHandle)handleWithPhoneNumber:(id)a3;
+ (CNReputationHandle)handleWithStringValue:(id)a3;
+ (id)descriptionForType:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CNReputationHandle)initWithStringValue:(id)a3 type:(int64_t)a4;
- (NSString)stringValue;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)configureBuilder:(id)a3;
@end

@implementation CNReputationHandle

+ (CNReputationHandle)handleWithStringValue:(id)a3
{
  id v3 = a3;
  v4 = [(CNReputationHandle *)[_CNReputationGenericHandle alloc] initWithStringValue:v3 type:0];

  return (CNReputationHandle *)v4;
}

+ (CNReputationHandle)handleWithEmailAddress:(id)a3
{
  id v3 = a3;
  v4 = [(CNReputationHandle *)[_CNReputationEmailAddressHandle alloc] initWithStringValue:v3 type:1];

  return (CNReputationHandle *)v4;
}

+ (CNReputationHandle)handleWithPhoneNumber:(id)a3
{
  id v3 = a3;
  v4 = [(CNReputationHandle *)[_CNReputationPhoneNumberHandle alloc] initWithStringValue:v3 type:2];

  return (CNReputationHandle *)v4;
}

- (CNReputationHandle)initWithStringValue:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNReputationHandle;
  v7 = [(CNReputationHandle *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    stringValue = v7->_stringValue;
    v7->_stringValue = (NSString *)v8;

    v7->_type = a4;
    v10 = v7;
  }

  return v7;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [(CNReputationHandle *)self stringValue];
  id v5 = (id)[v3 appendName:@"handle" object:v4];

  id v6 = objc_msgSend((id)objc_opt_class(), "descriptionForType:", -[CNReputationHandle type](self, "type"));
  id v7 = (id)[v3 appendName:@"type" object:v6];

  uint64_t v8 = [v3 build];

  return v8;
}

+ (id)descriptionForType:(int64_t)a3
{
  if (a3 == 2)
  {
    id v5 = NSString;
    v4 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v5 stringWithFormat:@"%@ (phone)", v4];
  }
  else if (a3 == 1)
  {
    id v6 = NSString;
    v4 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v6 stringWithFormat:@"%@ (email)", v4];
  }
  else
  {
    id v3 = NSString;
    if (a3)
    {
      v4 = objc_msgSend(NSNumber, "numberWithInteger:");
      [v3 stringWithFormat:@"%@ (invalid)", v4];
    }
    else
    {
      v4 = objc_msgSend(NSNumber, "numberWithInteger:");
      [v3 stringWithFormat:@"%@ (unknown)", v4];
    }
  id v7 = };

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __30__CNReputationHandle_isEqual___block_invoke;
  v15[3] = &unk_1E56B3E18;
  v15[4] = self;
  id v16 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __30__CNReputationHandle_isEqual___block_invoke_2;
  objc_super v12 = &unk_1E56B3E18;
  v13 = self;
  id v14 = v16;
  id v6 = v16;
  id v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __30__CNReputationHandle_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) type];
  uint64_t v4 = [*(id *)(a1 + 40) type];

  return [v2 isInteger:v3 equalToOther:v4];
}

uint64_t __30__CNReputationHandle_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) stringValue];
  uint64_t v4 = [*(id *)(a1 + 40) stringValue];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__CNReputationHandle_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __26__CNReputationHandle_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  uint64_t v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __26__CNReputationHandle_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) stringValue];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __26__CNReputationHandle_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) type];

  return [v1 integerHash:v2];
}

- (void)configureBuilder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  CNAbstractMethodException();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end