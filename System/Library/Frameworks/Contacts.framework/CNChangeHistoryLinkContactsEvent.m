@interface CNChangeHistoryLinkContactsEvent
+ (BOOL)supportsSecureCoding;
+ (unint64_t)instanceSortOrder;
- (BOOL)isEqual:(id)a3;
- (CNChangeHistoryLinkContactsEvent)init;
- (CNChangeHistoryLinkContactsEvent)initWithCoder:(id)a3;
- (CNChangeHistoryLinkContactsEvent)initWithFromContact:(id)a3 toContact:(id)a4 unifiedContact:(id)a5;
- (CNContact)fromContact;
- (CNContact)toContact;
- (CNContact)unifiedContact;
- (id)description;
- (int64_t)comparisonResultWithinSameClass:(id)a3;
- (unint64_t)hash;
- (void)acceptEventVisitor:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNChangeHistoryLinkContactsEvent

- (CNChangeHistoryLinkContactsEvent)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNChangeHistoryLinkContactsEvent)initWithFromContact:(id)a3 toContact:(id)a4 unifiedContact:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_6;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_2 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
  }
  v12 = (void *)CNGuardOSLog_cn_once_object_0_2;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (v10) {
      goto LABEL_7;
    }
  }
  else
  {
    -[CNChangeHistoryLinkContactsEvent initWithFromContact:toContact:unifiedContact:](v12);
    if (v10)
    {
LABEL_7:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_11;
      }
    }
  }
  if (CNGuardOSLog_cn_once_token_0_2 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
  }
  v13 = (void *)CNGuardOSLog_cn_once_object_0_2;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT))
  {
    -[CNChangeHistoryLinkContactsEvent initWithFromContact:toContact:unifiedContact:](v13);
    if (!v11) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }
LABEL_11:
  if (!v11) {
    goto LABEL_17;
  }
LABEL_12:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
    }
    v14 = (void *)CNGuardOSLog_cn_once_object_0_2;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
      -[CNChangeHistoryLinkContactsEvent initWithFromContact:toContact:unifiedContact:](v14);
    }
  }
LABEL_17:
  v19.receiver = self;
  v19.super_class = (Class)CNChangeHistoryLinkContactsEvent;
  v15 = [(CNChangeHistoryLinkContactsEvent *)&v19 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fromContact, a3);
    objc_storeStrong((id *)&v16->_toContact, a4);
    objc_storeStrong((id *)&v16->_unifiedContact, a5);
    v17 = v16;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryLinkContactsEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_fromContact"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_toContact"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_unifiedContact"];

  v8 = [(CNChangeHistoryLinkContactsEvent *)self initWithFromContact:v5 toContact:v6 unifiedContact:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  fromContact = self->_fromContact;
  id v5 = a3;
  [v5 encodeObject:fromContact forKey:@"_fromContact"];
  [v5 encodeObject:self->_toContact forKey:@"_toContact"];
  [v5 encodeObject:self->_unifiedContact forKey:@"_unifiedContact"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __44__CNChangeHistoryLinkContactsEvent_isEqual___block_invoke;
  v15[3] = &unk_1E56B3E18;
  v15[4] = self;
  id v16 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__CNChangeHistoryLinkContactsEvent_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E56B3E18;
  aBlock[4] = self;
  id v6 = v16;
  id v14 = v6;
  v7 = _Block_copy(aBlock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__CNChangeHistoryLinkContactsEvent_isEqual___block_invoke_3;
  v11[3] = &unk_1E56B3E18;
  v11[4] = self;
  id v12 = v6;
  id v8 = v6;
  id v9 = _Block_copy(v11);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v8, v15, v7, v9, 0);

  return (char)self;
}

uint64_t __44__CNChangeHistoryLinkContactsEvent_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) fromContact];
  id v4 = [v3 identifier];
  id v5 = [*(id *)(a1 + 40) fromContact];
  id v6 = [v5 identifier];
  uint64_t v7 = [v2 isObject:v4 equalToOther:v6];

  return v7;
}

uint64_t __44__CNChangeHistoryLinkContactsEvent_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) toContact];
  id v4 = [v3 identifier];
  id v5 = [*(id *)(a1 + 40) toContact];
  id v6 = [v5 identifier];
  uint64_t v7 = [v2 isObject:v4 equalToOther:v6];

  return v7;
}

uint64_t __44__CNChangeHistoryLinkContactsEvent_isEqual___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) unifiedContact];
  id v4 = [v3 identifier];
  id v5 = [*(id *)(a1 + 40) unifiedContact];
  id v6 = [v5 identifier];
  uint64_t v7 = [v2 isObject:v4 equalToOther:v6];

  return v7;
}

- (unint64_t)hash
{
  id v3 = (void *)MEMORY[0x1E4F5A418];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__CNChangeHistoryLinkContactsEvent_hash__block_invoke;
  v10[3] = &unk_1E56B3E40;
  v10[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CNChangeHistoryLinkContactsEvent_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__CNChangeHistoryLinkContactsEvent_hash__block_invoke_3;
  v8[3] = &unk_1E56B3E40;
  v8[4] = self;
  id v5 = _Block_copy(v8);
  unint64_t v6 = objc_msgSend(v3, "hashWithBlocks:", v10, v4, v5, 0);

  return v6;
}

uint64_t __40__CNChangeHistoryLinkContactsEvent_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) fromContact];
  id v3 = [v2 identifier];
  uint64_t v4 = [v1 objectHash:v3];

  return v4;
}

uint64_t __40__CNChangeHistoryLinkContactsEvent_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) toContact];
  id v3 = [v2 identifier];
  uint64_t v4 = [v1 objectHash:v3];

  return v4;
}

uint64_t __40__CNChangeHistoryLinkContactsEvent_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) unifiedContact];
  id v3 = [v2 identifier];
  uint64_t v4 = [v1 objectHash:v3];

  return v4;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  uint64_t v4 = [(CNChangeHistoryLinkContactsEvent *)self fromContact];
  id v5 = (id)[v3 appendName:@"fromContact" object:v4];

  unint64_t v6 = [(CNChangeHistoryLinkContactsEvent *)self toContact];
  id v7 = (id)[v3 appendName:@"toContact" object:v6];

  id v8 = [(CNChangeHistoryLinkContactsEvent *)self unifiedContact];
  id v9 = (id)[v3 appendName:@"unifiedContact" object:v8];

  id v10 = [v3 build];

  return v10;
}

- (void)acceptEventVisitor:(id)a3
{
  id v4 = a3;
  id v5 = [[CNSafeChangeHistoryEventVisitorWrapper alloc] initWithChangeHistoryEventVisitor:v4];

  [(CNSafeChangeHistoryEventVisitorWrapper *)v5 visitLinkContactsEvent:self];
}

- (int64_t)comparisonResultWithinSameClass:(id)a3
{
  id v4 = a3;
  id v5 = [(CNChangeHistoryLinkContactsEvent *)self fromContact];
  unint64_t v6 = [v5 identifier];
  id v7 = [v4 fromContact];
  id v8 = [v7 identifier];
  int64_t v9 = [v6 compare:v8];

  if (!v9)
  {
    id v10 = [(CNChangeHistoryLinkContactsEvent *)self toContact];
    id v11 = [v10 identifier];
    id v12 = [v4 toContact];
    v13 = [v12 identifier];
    int64_t v9 = [v11 compare:v13];
  }
  return v9;
}

+ (unint64_t)instanceSortOrder
{
  return 5;
}

- (CNContact)fromContact
{
  return self->_fromContact;
}

- (CNContact)toContact
{
  return self->_toContact;
}

- (CNContact)unifiedContact
{
  return self->_unifiedContact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unifiedContact, 0);
  objc_storeStrong((id *)&self->_toContact, 0);

  objc_storeStrong((id *)&self->_fromContact, 0);
}

- (void)initWithFromContact:(void *)a1 toContact:unifiedContact:.cold.1(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1909E3000, v3, v4, "parameter ‘unifiedContact’ must be of type %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithFromContact:(void *)a1 toContact:unifiedContact:.cold.2(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1909E3000, v3, v4, "parameter ‘toContact’ must be nonnull and of type %{public}@", v5, v6, v7, v8, v9);
}

- (void)initWithFromContact:(void *)a1 toContact:unifiedContact:.cold.3(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1909E3000, v3, v4, "parameter ‘fromContact’ must be nonnull and of type %{public}@", v5, v6, v7, v8, v9);
}

@end