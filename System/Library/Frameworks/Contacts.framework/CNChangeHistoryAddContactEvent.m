@interface CNChangeHistoryAddContactEvent
+ (BOOL)supportsSecureCoding;
+ (unint64_t)instanceSortOrder;
- (BOOL)isEqual:(id)a3;
- (CNChangeHistoryAddContactEvent)init;
- (CNChangeHistoryAddContactEvent)initWithCoder:(id)a3;
- (CNChangeHistoryAddContactEvent)initWithContact:(id)a3 contactIdentifier:(id)a4 containerIdentifier:(id)a5;
- (CNChangeHistoryAddContactEvent)initWithContact:(id)a3 containerIdentifier:(id)a4;
- (CNChangeHistoryAddContactEvent)initWithContactIdentifier:(id)a3 containerIdentifier:(id)a4;
- (CNContact)contact;
- (NSString)contactIdentifier;
- (NSString)containerIdentifier;
- (id)contactIdentifiers;
- (id)description;
- (int64_t)comparisonResultWithinSameClass:(id)a3;
- (unint64_t)hash;
- (void)acceptEventVisitor:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContact:(id)a3;
@end

@implementation CNChangeHistoryAddContactEvent

- (CNChangeHistoryAddContactEvent)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNChangeHistoryAddContactEvent)initWithContact:(id)a3 containerIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
    }
    v8 = (void *)CNGuardOSLog_cn_once_object_0_2;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
      -[CNChangeHistoryAddContactEvent initWithContact:containerIdentifier:](v8);
    }
  }
  v9 = [v6 identifier];
  v10 = [(CNChangeHistoryAddContactEvent *)self initWithContact:v6 contactIdentifier:v9 containerIdentifier:v7];

  return v10;
}

- (CNChangeHistoryAddContactEvent)initWithContactIdentifier:(id)a3 containerIdentifier:(id)a4
{
  return [(CNChangeHistoryAddContactEvent *)self initWithContact:0 contactIdentifier:a3 containerIdentifier:a4];
}

- (CNChangeHistoryAddContactEvent)initWithContact:(id)a3 contactIdentifier:(id)a4 containerIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNChangeHistoryAddContactEvent;
  v12 = [(CNChangeHistoryAddContactEvent *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_contact, a3);
    uint64_t v14 = [v10 copy];
    contactIdentifier = v13->_contactIdentifier;
    v13->_contactIdentifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    containerIdentifier = v13->_containerIdentifier;
    v13->_containerIdentifier = (NSString *)v16;

    v18 = v13;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryAddContactEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contact"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contactIdentifier"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_containerIdentifier"];

  v8 = [(CNChangeHistoryAddContactEvent *)self initWithContact:v5 contactIdentifier:v6 containerIdentifier:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  contact = self->_contact;
  id v5 = a3;
  [v5 encodeObject:contact forKey:@"_contact"];
  [v5 encodeObject:self->_contactIdentifier forKey:@"_contactIdentifier"];
  [v5 encodeObject:self->_containerIdentifier forKey:@"_containerIdentifier"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__CNChangeHistoryAddContactEvent_isEqual___block_invoke;
  v15[3] = &unk_1E56B3E18;
  v15[4] = self;
  id v16 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __42__CNChangeHistoryAddContactEvent_isEqual___block_invoke_2;
  v12 = &unk_1E56B3E18;
  v13 = self;
  id v14 = v16;
  id v6 = v16;
  id v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v6, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __42__CNChangeHistoryAddContactEvent_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) contactIdentifier];
  id v4 = [*(id *)(a1 + 40) contactIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __42__CNChangeHistoryAddContactEvent_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) containerIdentifier];
  id v4 = [*(id *)(a1 + 40) containerIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CNChangeHistoryAddContactEvent_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__CNChangeHistoryAddContactEvent_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  id v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __38__CNChangeHistoryAddContactEvent_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) contactIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __38__CNChangeHistoryAddContactEvent_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) containerIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  unint64_t v4 = [(CNChangeHistoryAddContactEvent *)self contactIdentifier];
  id v5 = (id)[v3 appendName:@"contactIdentifier" object:v4];

  id v6 = [(CNChangeHistoryAddContactEvent *)self containerIdentifier];
  id v7 = (id)[v3 appendName:@"containerIdentifier" object:v6];

  v8 = [(CNChangeHistoryAddContactEvent *)self contact];
  id v9 = (id)[v3 appendName:@"contact" object:v8];

  uint64_t v10 = [v3 build];

  return v10;
}

- (void)acceptEventVisitor:(id)a3
{
  id v4 = a3;
  id v5 = [[CNSafeChangeHistoryEventVisitorWrapper alloc] initWithChangeHistoryEventVisitor:v4];

  [(CNSafeChangeHistoryEventVisitorWrapper *)v5 visitAddContactEvent:self];
}

- (id)contactIdentifiers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(CNChangeHistoryAddContactEvent *)self contactIdentifier];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (int64_t)comparisonResultWithinSameClass:(id)a3
{
  id v4 = a3;
  id v5 = [(CNChangeHistoryAddContactEvent *)self contactIdentifier];
  id v6 = [v4 contactIdentifier];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

+ (unint64_t)instanceSortOrder
{
  return 1;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

- (void)initWithContact:(void *)a1 containerIdentifier:.cold.1(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1909E3000, v3, v4, "parameter ‘contact’ must be nonnull and of type %{public}@", v5, v6, v7, v8, v9);
}

@end