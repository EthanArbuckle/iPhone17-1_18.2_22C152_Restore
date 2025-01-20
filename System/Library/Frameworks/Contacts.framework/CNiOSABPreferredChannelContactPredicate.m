@interface CNiOSABPreferredChannelContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_supportsEncodedFetching;
- (BOOL)cn_supportsNativeBatchFetch;
- (BOOL)cn_supportsNativeSorting;
- (BOOL)isEqual:(id)a3;
- (BOOL)limitOne;
- (CNiOSABPreferredChannelContactPredicate)initWithCoder:(id)a3;
- (CNiOSABPreferredChannelContactPredicate)initWithPreferredChannel:(id)a3 limitOne:(BOOL)a4;
- (NSString)description;
- (NSString)preferredChannel;
- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7;
- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5;
- (id)shortDebugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLimitOne:(BOOL)a3;
- (void)setPreferredChannel:(id)a3;
@end

@implementation CNiOSABPreferredChannelContactPredicate

- (CNiOSABPreferredChannelContactPredicate)initWithPreferredChannel:(id)a3 limitOne:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNiOSABPreferredChannelContactPredicate;
  v7 = [(CNPredicate *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    preferredChannel = v7->_preferredChannel;
    v7->_preferredChannel = (NSString *)v8;

    v7->_limitOne = a4;
    v10 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNiOSABPreferredChannelContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNiOSABPreferredChannelContactPredicate;
  v5 = [(CNPredicate *)&v11 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_preferredChannel"];
    uint64_t v7 = [v6 copy];
    preferredChannel = v5->_preferredChannel;
    v5->_preferredChannel = (NSString *)v7;

    v5->_limitOne = [v4 decodeBoolForKey:@"_limitOne"];
    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNiOSABPreferredChannelContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_preferredChannel, @"_preferredChannel", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_limitOne forKey:@"_limitOne"];
}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
}

- (BOOL)cn_supportsNativeBatchFetch
{
  return 0;
}

- (BOOL)cn_supportsEncodedFetching
{
  return 1;
}

- (__CFArray)cn_copyPeopleInAddressBook:(void *)a3 fetchRequest:(id)a4 matchInfos:(id *)a5 environment:(id)a6 error:(__CFError *)a7
{
  id v9 = a4;
  id v10 = a6;
  objc_super v11 = self;
  CNUnimplementedMethodException();
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v12);
}

- (id)cn_ABQSLPredicateForAddressBook:(void *)a3 fetchRequest:(id)a4 error:(id *)a5
{
  id v6 = (void *)MEMORY[0x1E4F498B0];
  uint64_t v7 = [(CNiOSABPreferredChannelContactPredicate *)self preferredChannel];
  uint64_t v8 = objc_msgSend(v6, "predicateForContactsMatchingPreferredChannel:limitOne:", v7, -[CNiOSABPreferredChannelContactPredicate limitOne](self, "limitOne"));

  return v8;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsMatchingPreferredChannel:]"];
  id v5 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"limitOne", -[CNiOSABPreferredChannelContactPredicate limitOne](self, "limitOne"));
  id v6 = [(CNiOSABPreferredChannelContactPredicate *)self preferredChannel];
  id v7 = (id)[v3 appendName:@"preferredChannel" BOOLValue:v6 != 0];

  uint64_t v8 = [v3 build];

  return (NSString *)v8;
}

- (id)shortDebugDescription
{
  return @"PreferredChannelContactPredicate";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__CNiOSABPreferredChannelContactPredicate_isEqual___block_invoke;
  v15[3] = &unk_1E56B3E18;
  v15[4] = self;
  id v16 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  objc_super v11 = __51__CNiOSABPreferredChannelContactPredicate_isEqual___block_invoke_2;
  id v12 = &unk_1E56B3E18;
  v13 = self;
  id v14 = v16;
  id v6 = v16;
  id v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __51__CNiOSABPreferredChannelContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) preferredChannel];
  id v4 = [*(id *)(a1 + 40) preferredChannel];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __51__CNiOSABPreferredChannelContactPredicate_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) limitOne];
  uint64_t v4 = [*(id *)(a1 + 40) limitOne];

  return [v2 isBool:v3 equalToOther:v4];
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__CNiOSABPreferredChannelContactPredicate_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__CNiOSABPreferredChannelContactPredicate_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  uint64_t v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __47__CNiOSABPreferredChannelContactPredicate_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) preferredChannel];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __47__CNiOSABPreferredChannelContactPredicate_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) limitOne];

  return [v1 BOOLHash:v2];
}

- (NSString)preferredChannel
{
  return self->_preferredChannel;
}

- (void)setPreferredChannel:(id)a3
{
}

- (BOOL)limitOne
{
  return self->_limitOne;
}

- (void)setLimitOne:(BOOL)a3
{
  self->_limitOne = a3;
}

- (void).cxx_destruct
{
}

@end