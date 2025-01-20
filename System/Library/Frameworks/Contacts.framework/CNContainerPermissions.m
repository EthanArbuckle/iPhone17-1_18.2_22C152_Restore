@interface CNContainerPermissions
+ (BOOL)supportsSecureCoding;
- (BOOL)canCreateContacts;
- (BOOL)canCreateGroups;
- (BOOL)canDeleteContacts;
- (BOOL)isEqual:(id)a3;
- (CNContainerPermissions)init;
- (CNContainerPermissions)initWithCanCreateContacts:(BOOL)a3 canDeleteContacts:(BOOL)a4 canCreateGroups:(BOOL)a5;
- (CNContainerPermissions)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNContainerPermissions

- (CNContainerPermissions)init
{
  return [(CNContainerPermissions *)self initWithCanCreateContacts:0 canDeleteContacts:0 canCreateGroups:0];
}

- (CNContainerPermissions)initWithCanCreateContacts:(BOOL)a3 canDeleteContacts:(BOOL)a4 canCreateGroups:(BOOL)a5
{
  v12.receiver = self;
  v12.super_class = (Class)CNContainerPermissions;
  v8 = [(CNContainerPermissions *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_canCreateContacts = a3;
    v8->_canDeleteContacts = a4;
    v8->_canCreateGroups = a5;
    v10 = v8;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContainerPermissions)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CNContainerPermissions *)self init];
  if (v5)
  {
    v5->_canCreateContacts = [v4 decodeIntegerForKey:@"canCreateContacts"] != 0;
    v5->_canDeleteContacts = [v4 decodeIntegerForKey:@"canDeleteContacts"] != 0;
    v5->_canCreateGroups = [v4 decodeIntegerForKey:@"canCreateGroups"] != 0;
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  BOOL canCreateContacts = self->_canCreateContacts;
  id v5 = a3;
  [v5 encodeBool:canCreateContacts forKey:@"canCreateContacts"];
  [v5 encodeBool:self->_canDeleteContacts forKey:@"canDeleteContacts"];
  [v5 encodeBool:self->_canCreateGroups forKey:@"canCreateGroups"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v6 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __34__CNContainerPermissions_isEqual___block_invoke;
  v16[3] = &unk_1E56B3E18;
  v16[4] = self;
  id v17 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__CNContainerPermissions_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E56B3E18;
  aBlock[4] = self;
  id v7 = v17;
  id v15 = v7;
  v8 = _Block_copy(aBlock);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __34__CNContainerPermissions_isEqual___block_invoke_3;
  v12[3] = &unk_1E56B3E18;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  v10 = _Block_copy(v12);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v9, v6, self, v16, v8, v10, 0);

  return (char)self;
}

uint64_t __34__CNContainerPermissions_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) canCreateContacts];
  uint64_t v4 = [*(id *)(a1 + 40) canCreateContacts];

  return [v2 isBool:v3 equalToOther:v4];
}

uint64_t __34__CNContainerPermissions_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) canDeleteContacts];
  uint64_t v4 = [*(id *)(a1 + 40) canCreateGroups];

  return [v2 isBool:v3 equalToOther:v4];
}

uint64_t __34__CNContainerPermissions_isEqual___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) canCreateGroups];
  uint64_t v4 = [*(id *)(a1 + 40) canCreateGroups];

  return [v2 isBool:v3 equalToOther:v4];
}

- (unint64_t)hash
{
  uint64_t v3 = (void *)MEMORY[0x1E4F5A418];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __30__CNContainerPermissions_hash__block_invoke;
  v10[3] = &unk_1E56B3E40;
  v10[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__CNContainerPermissions_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  aBlock[4] = self;
  uint64_t v4 = _Block_copy(aBlock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __30__CNContainerPermissions_hash__block_invoke_3;
  v8[3] = &unk_1E56B3E40;
  v8[4] = self;
  id v5 = _Block_copy(v8);
  unint64_t v6 = objc_msgSend(v3, "hashWithBlocks:", v10, v4, v5, 0);

  return v6;
}

uint64_t __30__CNContainerPermissions_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) canCreateContacts];

  return [v1 BOOLHash:v2];
}

uint64_t __30__CNContainerPermissions_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) canDeleteContacts];

  return [v1 BOOLHash:v2];
}

uint64_t __30__CNContainerPermissions_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) canCreateGroups];

  return [v1 BOOLHash:v2];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"canCreateContacts" BOOLValue:self->_canCreateContacts];
  id v5 = (id)[v3 appendName:@"canDeleteContacts" BOOLValue:self->_canDeleteContacts];
  id v6 = (id)[v3 appendName:@"canCreateGroups" BOOLValue:self->_canCreateGroups];
  id v7 = [v3 build];

  return v7;
}

- (BOOL)canCreateContacts
{
  return self->_canCreateContacts;
}

- (BOOL)canDeleteContacts
{
  return self->_canDeleteContacts;
}

- (BOOL)canCreateGroups
{
  return self->_canCreateGroups;
}

@end