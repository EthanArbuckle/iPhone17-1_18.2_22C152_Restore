@interface CNChangeHistoryUpdateContactEvent
+ (BOOL)supportsSecureCoding;
+ (unint64_t)instanceSortOrder;
- (BOOL)imagesChanged;
- (BOOL)isEqual:(id)a3;
- (CNChangeHistoryUpdateContactEvent)init;
- (CNChangeHistoryUpdateContactEvent)initWithCoder:(id)a3;
- (CNChangeHistoryUpdateContactEvent)initWithContact:(id)a3 contactIdentifier:(id)a4 imagesChanged:(BOOL)a5;
- (CNChangeHistoryUpdateContactEvent)initWithContact:(id)a3 imagesChanged:(BOOL)a4;
- (CNChangeHistoryUpdateContactEvent)initWithContactIdentifier:(id)a3 imagesChanged:(BOOL)a4;
- (CNContact)contact;
- (NSString)contactIdentifier;
- (id)contactIdentifiers;
- (id)description;
- (int64_t)comparisonResultWithinSameClass:(id)a3;
- (unint64_t)hash;
- (void)acceptEventVisitor:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContact:(id)a3;
@end

@implementation CNChangeHistoryUpdateContactEvent

- (CNChangeHistoryUpdateContactEvent)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNChangeHistoryUpdateContactEvent)initWithContact:(id)a3 imagesChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
    }
    v7 = (void *)CNGuardOSLog_cn_once_object_0_2;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
      -[CNChangeHistoryAddContactEvent initWithContact:containerIdentifier:](v7);
    }
  }
  v8 = [v6 identifier];
  v9 = [(CNChangeHistoryUpdateContactEvent *)self initWithContact:v6 contactIdentifier:v8 imagesChanged:v4];

  return v9;
}

- (CNChangeHistoryUpdateContactEvent)initWithContactIdentifier:(id)a3 imagesChanged:(BOOL)a4
{
  return [(CNChangeHistoryUpdateContactEvent *)self initWithContact:0 contactIdentifier:a3 imagesChanged:a4];
}

- (CNChangeHistoryUpdateContactEvent)initWithContact:(id)a3 contactIdentifier:(id)a4 imagesChanged:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNChangeHistoryUpdateContactEvent;
  v11 = [(CNChangeHistoryUpdateContactEvent *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_contact, a3);
    uint64_t v13 = [v10 copy];
    contactIdentifier = v12->_contactIdentifier;
    v12->_contactIdentifier = (NSString *)v13;

    v12->_imagesChanged = a5;
    v15 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryUpdateContactEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contact"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contactIdentifier"];
  uint64_t v7 = [v4 decodeBoolForKey:@"_imagesChanged"];

  v8 = [(CNChangeHistoryUpdateContactEvent *)self initWithContact:v5 contactIdentifier:v6 imagesChanged:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  contact = self->_contact;
  id v5 = a3;
  [v5 encodeObject:contact forKey:@"_contact"];
  [v5 encodeObject:self->_contactIdentifier forKey:@"_contactIdentifier"];
  [v5 encodeBool:self->_imagesChanged forKey:@"_imagesChanged"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __45__CNChangeHistoryUpdateContactEvent_isEqual___block_invoke;
  v15[3] = &unk_1E56B3E18;
  v15[4] = self;
  id v16 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __45__CNChangeHistoryUpdateContactEvent_isEqual___block_invoke_2;
  v12 = &unk_1E56B3E18;
  uint64_t v13 = self;
  id v14 = v16;
  id v6 = v16;
  uint64_t v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v6, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __45__CNChangeHistoryUpdateContactEvent_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) contactIdentifier];
  id v4 = [*(id *)(a1 + 40) contactIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __45__CNChangeHistoryUpdateContactEvent_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) imagesChanged];
  uint64_t v4 = [*(id *)(a1 + 40) imagesChanged];

  return [v2 isBool:v3 equalToOther:v4];
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CNChangeHistoryUpdateContactEvent_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__CNChangeHistoryUpdateContactEvent_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  uint64_t v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __41__CNChangeHistoryUpdateContactEvent_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) contactIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __41__CNChangeHistoryUpdateContactEvent_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) imagesChanged];

  return [v1 BOOLHash:v2];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  unint64_t v4 = [(CNChangeHistoryUpdateContactEvent *)self contactIdentifier];
  id v5 = (id)[v3 appendName:@"contactIdentifier" object:v4];

  id v6 = (id)objc_msgSend(v3, "appendName:BOOLValue:", @"imagesChanged", -[CNChangeHistoryUpdateContactEvent imagesChanged](self, "imagesChanged"));
  uint64_t v7 = [(CNChangeHistoryUpdateContactEvent *)self contact];
  id v8 = (id)[v3 appendName:@"contact" object:v7];

  id v9 = [v3 build];

  return v9;
}

- (void)acceptEventVisitor:(id)a3
{
  id v4 = a3;
  id v5 = [[CNSafeChangeHistoryEventVisitorWrapper alloc] initWithChangeHistoryEventVisitor:v4];

  [(CNSafeChangeHistoryEventVisitorWrapper *)v5 visitUpdateContactEvent:self];
}

- (id)contactIdentifiers
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(CNChangeHistoryUpdateContactEvent *)self contactIdentifier];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (int64_t)comparisonResultWithinSameClass:(id)a3
{
  id v4 = a3;
  id v5 = [(CNChangeHistoryUpdateContactEvent *)self contactIdentifier];
  id v6 = [v4 contactIdentifier];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

+ (unint64_t)instanceSortOrder
{
  return 2;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (BOOL)imagesChanged
{
  return self->_imagesChanged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);

  objc_storeStrong((id *)&self->_contact, 0);
}

@end