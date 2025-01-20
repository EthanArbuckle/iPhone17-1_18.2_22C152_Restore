@interface CNChangeHistoryDeleteGroupEvent
+ (BOOL)supportsSecureCoding;
+ (unint64_t)instanceSortOrder;
- (BOOL)isEqual:(id)a3;
- (CNChangeHistoryDeleteGroupEvent)init;
- (CNChangeHistoryDeleteGroupEvent)initWithCoder:(id)a3;
- (CNChangeHistoryDeleteGroupEvent)initWithGroupIdentifier:(id)a3;
- (CNChangeHistoryDeleteGroupEvent)initWithGroupIdentifier:(id)a3 externalURI:(id)a4 externalModificationTag:(id)a5;
- (NSString)externalModificationTag;
- (NSString)externalURI;
- (NSString)groupIdentifier;
- (id)description;
- (int64_t)comparisonResultWithinSameClass:(id)a3;
- (unint64_t)hash;
- (void)acceptEventVisitor:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNChangeHistoryDeleteGroupEvent

- (CNChangeHistoryDeleteGroupEvent)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNChangeHistoryDeleteGroupEvent)initWithGroupIdentifier:(id)a3
{
  return [(CNChangeHistoryDeleteGroupEvent *)self initWithGroupIdentifier:a3 externalURI:&stru_1EE052B80 externalModificationTag:&stru_1EE052B80];
}

- (CNChangeHistoryDeleteGroupEvent)initWithGroupIdentifier:(id)a3 externalURI:(id)a4 externalModificationTag:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_2 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_2, &__block_literal_global_14);
    }
    v11 = (void *)CNGuardOSLog_cn_once_object_0_2;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_2, OS_LOG_TYPE_FAULT)) {
      -[CNChangeHistoryDeleteGroupEvent initWithGroupIdentifier:externalURI:externalModificationTag:](v11);
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)CNChangeHistoryDeleteGroupEvent;
  v12 = [(CNChangeHistoryDeleteGroupEvent *)&v26 init];
  if (v12)
  {
    uint64_t v13 = [v8 copy];
    groupIdentifier = v12->_groupIdentifier;
    v12->_groupIdentifier = (NSString *)v13;

    v15 = (uint64_t *)MEMORY[0x1E4F5A1F8];
    uint64_t v16 = *MEMORY[0x1E4F5A1F8];
    v17 = (void *)[v9 copy];
    uint64_t v18 = (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
    externalURI = v12->_externalURI;
    v12->_externalURI = (NSString *)v18;

    uint64_t v20 = *v15;
    v21 = (void *)[v10 copy];
    uint64_t v22 = (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);
    externalModificationTag = v12->_externalModificationTag;
    v12->_externalModificationTag = (NSString *)v22;

    v24 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNChangeHistoryDeleteGroupEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_groupIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_externalURI"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_externalModificationTag"];

  id v8 = [(CNChangeHistoryDeleteGroupEvent *)self initWithGroupIdentifier:v5 externalURI:v6 externalModificationTag:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  groupIdentifier = self->_groupIdentifier;
  id v5 = a3;
  [v5 encodeObject:groupIdentifier forKey:@"_groupIdentifier"];
  [v5 encodeObject:self->_externalURI forKey:@"_externalURI"];
  [v5 encodeObject:self->_externalModificationTag forKey:@"_externalModificationTag"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNChangeHistoryDeleteGroupEvent *)a3;
  BOOL v8 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || (groupIdentifier = self->_groupIdentifier,
          (unint64_t)groupIdentifier | (unint64_t)v4->_groupIdentifier)
      && !-[NSString isEqual:](groupIdentifier, "isEqual:")
      || (externalURI = self->_externalURI, (unint64_t)externalURI | (unint64_t)v4->_externalURI)
      && !-[NSString isEqual:](externalURI, "isEqual:")
      || (externalModificationTag = self->_externalModificationTag,
          (unint64_t)externalModificationTag | (unint64_t)v4->_externalModificationTag)
      && !-[NSString isEqual:](externalModificationTag, "isEqual:"))
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = [MEMORY[0x1E4F5A418] objectHash:self->_groupIdentifier];
  uint64_t v4 = [MEMORY[0x1E4F5A418] objectHash:self->_externalURI] - v3 + 32 * v3;
  return [MEMORY[0x1E4F5A418] objectHash:self->_externalModificationTag] - v4 + 32 * v4 + 506447;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"groupIdentifier" object:self->_groupIdentifier];
  id v5 = (id)[v3 appendName:@"externalURI" object:self->_externalURI];
  id v6 = (id)[v3 appendName:@"externalModificationTag" object:self->_externalModificationTag];
  v7 = [v3 build];

  return v7;
}

- (void)acceptEventVisitor:(id)a3
{
  id v4 = a3;
  id v5 = [[CNSafeChangeHistoryEventVisitorWrapper alloc] initWithChangeHistoryEventVisitor:v4];

  [(CNSafeChangeHistoryEventVisitorWrapper *)v5 visitDeleteGroupEvent:self];
}

- (int64_t)comparisonResultWithinSameClass:(id)a3
{
  id v4 = a3;
  id v5 = [(CNChangeHistoryDeleteGroupEvent *)self groupIdentifier];
  id v6 = [v4 groupIdentifier];

  int64_t v7 = [v5 compare:v6];
  return v7;
}

+ (unint64_t)instanceSortOrder
{
  return 15;
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (NSString)externalURI
{
  return self->_externalURI;
}

- (NSString)externalModificationTag
{
  return self->_externalModificationTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_externalURI, 0);

  objc_storeStrong((id *)&self->_groupIdentifier, 0);
}

- (void)initWithGroupIdentifier:(void *)a1 externalURI:externalModificationTag:.cold.1(void *a1)
{
  id v2 = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1909E3000, v3, v4, "parameter ‘groupIdentifier’ must be nonnull and of type %{public}@", v5, v6, v7, v8, v9);
}

@end