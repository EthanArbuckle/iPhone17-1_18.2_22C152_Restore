@interface CNChangeHistoryDifferentMeCardEvent
+ (BOOL)supportsSecureCoding;
+ (unint64_t)instanceSortOrder;
- (BOOL)isEqual:(id)a3;
- (CNChangeHistoryDifferentMeCardEvent)init;
- (CNChangeHistoryDifferentMeCardEvent)initWithCoder:(id)a3;
- (CNChangeHistoryDifferentMeCardEvent)initWithContactIdentifier:(id)a3;
- (NSString)contactIdentifier;
- (id)description;
- (int64_t)comparisonResultWithinSameClass:(id)a3;
- (unint64_t)hash;
- (void)acceptEventVisitor:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNChangeHistoryDifferentMeCardEvent

- (CNChangeHistoryDifferentMeCardEvent)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNChangeHistoryDifferentMeCardEvent)initWithContactIdentifier:(id)a3
{
  id v4 = a3;
  if (!v4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
    }
    v5 = (void *)CNGuardOSLog_cn_once_object_0_2;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
      -[CNChangeHistoryDeleteContactEvent initWithContactIdentifier:externalURI:externalModificationTag:](v5);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)CNChangeHistoryDifferentMeCardEvent;
  v6 = [(CNChangeHistoryDifferentMeCardEvent *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    contactIdentifier = v6->_contactIdentifier;
    v6->_contactIdentifier = (NSString *)v7;

    v9 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryDifferentMeCardEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_contactIdentifier"];

  v6 = [(CNChangeHistoryDifferentMeCardEvent *)self initWithContactIdentifier:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F5A3E0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__CNChangeHistoryDifferentMeCardEvent_isEqual___block_invoke;
  v8[3] = &unk_1E56B3E18;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v6, v8, 0);

  return (char)self;
}

uint64_t __47__CNChangeHistoryDifferentMeCardEvent_isEqual___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contactIdentifier];
  id v3 = [*(id *)(a1 + 40) contactIdentifier];
  uint64_t v4 = [v2 isEqual:v3];

  return v4;
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__CNChangeHistoryDifferentMeCardEvent_hash__block_invoke;
  v3[3] = &unk_1E56B3E40;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A418], "hashWithBlocks:", v3, 0);
}

uint64_t __43__CNChangeHistoryDifferentMeCardEvent_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) contactIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  uint64_t v4 = [(CNChangeHistoryDifferentMeCardEvent *)self contactIdentifier];
  id v5 = (id)[v3 appendName:@"contactIdentifier" object:v4];

  id v6 = [v3 build];

  return v6;
}

- (void)acceptEventVisitor:(id)a3
{
  id v4 = a3;
  id v5 = [[CNSafeChangeHistoryEventVisitorWrapper alloc] initWithChangeHistoryEventVisitor:v4];

  [(CNSafeChangeHistoryEventVisitorWrapper *)v5 visitDifferentMeCardEvent:self];
}

- (int64_t)comparisonResultWithinSameClass:(id)a3
{
  id v4 = a3;
  id v5 = [(CNChangeHistoryDifferentMeCardEvent *)self contactIdentifier];
  id v6 = [v4 contactIdentifier];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

+ (unint64_t)instanceSortOrder
{
  return 9;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void).cxx_destruct
{
}

@end