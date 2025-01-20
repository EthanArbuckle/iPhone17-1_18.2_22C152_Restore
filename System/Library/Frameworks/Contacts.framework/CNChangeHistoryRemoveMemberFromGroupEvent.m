@interface CNChangeHistoryRemoveMemberFromGroupEvent
+ (BOOL)supportsSecureCoding;
+ (unint64_t)instanceSortOrder;
- (BOOL)isEqual:(id)a3;
- (CNChangeHistoryRemoveMemberFromGroupEvent)init;
- (CNChangeHistoryRemoveMemberFromGroupEvent)initWithCoder:(id)a3;
- (CNChangeHistoryRemoveMemberFromGroupEvent)initWithMember:(id)a3 group:(id)a4;
- (CNContact)member;
- (CNGroup)group;
- (id)description;
- (int64_t)comparisonResultWithinSameClass:(id)a3;
- (unint64_t)hash;
- (void)acceptEventVisitor:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNChangeHistoryRemoveMemberFromGroupEvent

- (CNChangeHistoryRemoveMemberFromGroupEvent)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNChangeHistoryRemoveMemberFromGroupEvent)initWithMember:(id)a3 group:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_2 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
  }
  v9 = (void *)CNGuardOSLog_cn_once_object_0_2;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (v8) {
      goto LABEL_7;
    }
  }
  else
  {
    -[CNChangeHistoryAddMemberToGroupEvent initWithMember:group:](v9);
    if (v8)
    {
LABEL_7:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_12;
      }
    }
  }
  if (CNGuardOSLog_cn_once_token_0_2 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
  }
  v10 = (void *)CNGuardOSLog_cn_once_object_0_2;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
    -[CNChangeHistoryAddGroupEvent initWithGroup:containerIdentifier:](v10);
  }
LABEL_12:
  v15.receiver = self;
  v15.super_class = (Class)CNChangeHistoryRemoveMemberFromGroupEvent;
  v11 = [(CNChangeHistoryRemoveMemberFromGroupEvent *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_member, a3);
    objc_storeStrong((id *)&v12->_group, a4);
    v13 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryRemoveMemberFromGroupEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_member"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_group"];

  id v7 = [(CNChangeHistoryRemoveMemberFromGroupEvent *)self initWithMember:v5 group:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  member = self->_member;
  id v5 = a3;
  [v5 encodeObject:member forKey:@"_member"];
  [v5 encodeObject:self->_group forKey:@"_group"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__CNChangeHistoryRemoveMemberFromGroupEvent_isEqual___block_invoke;
  v15[3] = &unk_1E56B3E18;
  v15[4] = self;
  id v16 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __53__CNChangeHistoryRemoveMemberFromGroupEvent_isEqual___block_invoke_2;
  v12 = &unk_1E56B3E18;
  v13 = self;
  id v14 = v16;
  id v6 = v16;
  id v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v6, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __53__CNChangeHistoryRemoveMemberFromGroupEvent_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) member];
  id v4 = [v3 identifier];
  id v5 = [*(id *)(a1 + 40) member];
  id v6 = [v5 identifier];
  uint64_t v7 = [v2 isObject:v4 equalToOther:v6];

  return v7;
}

uint64_t __53__CNChangeHistoryRemoveMemberFromGroupEvent_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) group];
  id v4 = [v3 identifier];
  id v5 = [*(id *)(a1 + 40) group];
  id v6 = [v5 identifier];
  uint64_t v7 = [v2 isObject:v4 equalToOther:v6];

  return v7;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__CNChangeHistoryRemoveMemberFromGroupEvent_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__CNChangeHistoryRemoveMemberFromGroupEvent_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  id v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __49__CNChangeHistoryRemoveMemberFromGroupEvent_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) member];
  id v3 = [v2 identifier];
  uint64_t v4 = [v1 objectHash:v3];

  return v4;
}

uint64_t __49__CNChangeHistoryRemoveMemberFromGroupEvent_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) group];
  id v3 = [v2 identifier];
  uint64_t v4 = [v1 objectHash:v3];

  return v4;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  uint64_t v4 = [(CNChangeHistoryRemoveMemberFromGroupEvent *)self member];
  id v5 = (id)[v3 appendName:@"member" object:v4];

  id v6 = [(CNChangeHistoryRemoveMemberFromGroupEvent *)self group];
  id v7 = (id)[v3 appendName:@"group" object:v6];

  id v8 = [v3 build];

  return v8;
}

- (void)acceptEventVisitor:(id)a3
{
  id v4 = a3;
  id v5 = [[CNSafeChangeHistoryEventVisitorWrapper alloc] initWithChangeHistoryEventVisitor:v4];

  [(CNSafeChangeHistoryEventVisitorWrapper *)v5 visitRemoveMemberFromGroupEvent:self];
}

- (int64_t)comparisonResultWithinSameClass:(id)a3
{
  id v4 = a3;
  id v5 = [(CNChangeHistoryRemoveMemberFromGroupEvent *)self group];
  id v6 = [v5 identifier];
  id v7 = [v4 group];
  id v8 = [v7 identifier];
  int64_t v9 = [v6 compare:v8];

  if (!v9)
  {
    uint64_t v10 = [(CNChangeHistoryRemoveMemberFromGroupEvent *)self member];
    v11 = [v10 identifier];
    v12 = [v4 member];
    v13 = [v12 identifier];
    int64_t v9 = [v11 compare:v13];
  }
  return v9;
}

+ (unint64_t)instanceSortOrder
{
  return 12;
}

- (CNContact)member
{
  return self->_member;
}

- (CNGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);

  objc_storeStrong((id *)&self->_member, 0);
}

@end