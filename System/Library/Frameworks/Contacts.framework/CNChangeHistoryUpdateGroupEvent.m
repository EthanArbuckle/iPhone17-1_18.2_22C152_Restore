@interface CNChangeHistoryUpdateGroupEvent
+ (BOOL)supportsSecureCoding;
+ (unint64_t)instanceSortOrder;
- (BOOL)isEqual:(id)a3;
- (CNChangeHistoryUpdateGroupEvent)init;
- (CNChangeHistoryUpdateGroupEvent)initWithCoder:(id)a3;
- (CNChangeHistoryUpdateGroupEvent)initWithGroup:(id)a3;
- (CNGroup)group;
- (id)description;
- (int64_t)comparisonResultWithinSameClass:(id)a3;
- (unint64_t)hash;
- (void)acceptEventVisitor:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNChangeHistoryUpdateGroupEvent

- (CNChangeHistoryUpdateGroupEvent)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNChangeHistoryUpdateGroupEvent)initWithGroup:(id)a3
{
  id v5 = a3;
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
    }
    v6 = (void *)CNGuardOSLog_cn_once_object_0_2;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
      -[CNChangeHistoryAddGroupEvent initWithGroup:containerIdentifier:](v6);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CNChangeHistoryUpdateGroupEvent;
  v7 = [(CNChangeHistoryUpdateGroupEvent *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_group, a3);
    v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryUpdateGroupEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_group"];

  v6 = [(CNChangeHistoryUpdateGroupEvent *)self initWithGroup:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__CNChangeHistoryUpdateGroupEvent_isEqual___block_invoke;
  v8[3] = &unk_1E56B3E18;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v6, v8, 0);

  return (char)self;
}

uint64_t __43__CNChangeHistoryUpdateGroupEvent_isEqual___block_invoke(uint64_t a1)
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
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__CNChangeHistoryUpdateGroupEvent_hash__block_invoke;
  v3[3] = &unk_1E56B3E40;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A418], "hashWithBlocks:", v3, 0);
}

uint64_t __39__CNChangeHistoryUpdateGroupEvent_hash__block_invoke(uint64_t a1)
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
  uint64_t v4 = [(CNChangeHistoryUpdateGroupEvent *)self group];
  id v5 = (id)[v3 appendName:@"group" object:v4];

  id v6 = [v3 build];

  return v6;
}

- (void)acceptEventVisitor:(id)a3
{
  id v4 = a3;
  id v5 = [[CNSafeChangeHistoryEventVisitorWrapper alloc] initWithChangeHistoryEventVisitor:v4];

  [(CNSafeChangeHistoryEventVisitorWrapper *)v5 visitUpdateGroupEvent:self];
}

- (int64_t)comparisonResultWithinSameClass:(id)a3
{
  id v4 = a3;
  id v5 = [(CNChangeHistoryUpdateGroupEvent *)self group];
  id v6 = [v5 identifier];
  uint64_t v7 = [v4 group];

  v8 = [v7 identifier];
  int64_t v9 = [v6 compare:v8];

  return v9;
}

+ (unint64_t)instanceSortOrder
{
  return 4;
}

- (CNGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
}

@end