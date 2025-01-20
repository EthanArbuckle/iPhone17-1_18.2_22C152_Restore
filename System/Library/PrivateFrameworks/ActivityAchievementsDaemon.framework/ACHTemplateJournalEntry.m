@interface ACHTemplateJournalEntry
+ (BOOL)supportsSecureCoding;
+ (void)applyEntries:(id)a3 withProfile:(id)a4;
- (ACHTemplate)template;
- (ACHTemplateJournalEntry)initWithCoder:(id)a3;
- (ACHTemplateJournalEntry)initWithTemplate:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 action:(int64_t)a6;
- (BOOL)useLegacySyncIdentity;
- (id)description;
- (int64_t)action;
- (int64_t)provenance;
- (void)encodeWithCoder:(id)a3;
- (void)setProvenance:(int64_t)a3;
@end

@implementation ACHTemplateJournalEntry

- (ACHTemplateJournalEntry)initWithTemplate:(id)a3 provenance:(int64_t)a4 useLegacySyncIdentity:(BOOL)a5 action:(int64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ACHTemplateJournalEntry;
  v12 = [(ACHTemplateJournalEntry *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_action = a6;
    objc_storeStrong((id *)&v12->_template, a3);
    v13->_provenance = a4;
    v13->_useLegacySyncIdentity = a5;
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)ACHTemplateJournalEntry;
  v4 = [(ACHTemplateJournalEntry *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@(template %@ provenance %lld action %ld)", v4, self->_template, self->_provenance, self->_action];

  return v5;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [v6 database];
  id v19 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __52__ACHTemplateJournalEntry_applyEntries_withProfile___block_invoke;
  v16[3] = &unk_2645176B8;
  id v17 = v5;
  id v18 = v6;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__ACHTemplateJournalEntry_applyEntries_withProfile___block_invoke_2;
  v13[3] = &unk_264516378;
  id v8 = v18;
  id v14 = v8;
  id v9 = v17;
  id v15 = v9;
  BOOL v10 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v7 error:&v19 block:v16 inaccessibilityHandler:v13];
  id v11 = v19;

  if (!v10)
  {
    v12 = ACHLogDatabase();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[ACHTemplateJournalEntry applyEntries:withProfile:]((uint64_t)v9);
    }
  }
}

uint64_t __52__ACHTemplateJournalEntry_applyEntries_withProfile___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v21 = a2;
  v20 = [v21 databaseForEntityClass:objc_opt_class()];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "action", v20);
        if (v9)
        {
          if (v9 != 1) {
            goto LABEL_14;
          }
          BOOL v10 = [v8 template];
          v28 = v10;
          id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v28 count:1];
          BOOL v12 = +[ACHTemplateEntity _removeTemplates:v11 profile:*(void *)(a1 + 40) error:a3];

          if (!v12)
          {
LABEL_14:
            uint64_t v18 = 0;
            goto LABEL_15;
          }
        }
        else
        {
          v13 = [v8 template];
          id v14 = ACHTemplateSyncIdentityFromTemplate(v13, [v8 useLegacySyncIdentity], *(void **)(a1 + 40), v21);

          id v15 = [v8 template];
          uint64_t v16 = [v8 provenance];
          id v17 = [v14 entity];
          LODWORD(v16) = +[ACHTemplateEntity _insertTemplate:provenance:syncIdentity:database:error:](ACHTemplateEntity, "_insertTemplate:provenance:syncIdentity:database:error:", v15, v16, [v17 persistentID], v20, a3);

          if (!v16) {
            goto LABEL_14;
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  uint64_t v18 = 1;
LABEL_15:

  return v18;
}

uint64_t __52__ACHTemplateJournalEntry_applyEntries_withProfile___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) database];
  uint64_t v6 = [v5 addJournalEntries:*(void *)(a1 + 40) error:a3];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ACHTemplateJournalEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACHTemplateJournalEntry;
  uint64_t v5 = [(HDJournalEntry *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_action = [v4 decodeIntegerForKey:@"action"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"template"];
    if ([v6 length])
    {
      objc_super v7 = (void *)[objc_alloc(MEMORY[0x263F23698]) initWithData:v6];
      if (v7)
      {
        uint64_t v8 = [objc_alloc(MEMORY[0x263F236D8]) initWithCodable:v7];
        uint64_t v9 = v5->_template;
        v5->_template = (ACHTemplate *)v8;
      }
    }
    v5->_provenance = [v4 decodeInt64ForKey:@"provenance"];
    v5->_useLegacySyncIdentity = 1;
    if ([v4 containsValueForKey:@"UseLegacySyncIdentity"]) {
      v5->_useLegacySyncIdentity = [v4 decodeBoolForKey:@"UseLegacySyncIdentity"];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeInteger:self->_action forKey:@"action"];
  id v4 = [(ACHTemplateJournalEntry *)self template];
  uint64_t v5 = ACHCodableFromTemplate();

  uint64_t v6 = [v5 data];
  if ([v6 length]) {
    [v7 encodeObject:v6 forKey:@"template"];
  }
  [v7 encodeInt64:self->_provenance forKey:@"provenance"];
  [v7 encodeBool:self->_useLegacySyncIdentity forKey:@"UseLegacySyncIdentity"];
}

- (int64_t)action
{
  return self->_action;
}

- (ACHTemplate)template
{
  return self->_template;
}

- (int64_t)provenance
{
  return self->_provenance;
}

- (void)setProvenance:(int64_t)a3
{
  self->_provenance = a3;
}

- (BOOL)useLegacySyncIdentity
{
  return self->_useLegacySyncIdentity;
}

- (void).cxx_destruct
{
}

+ (void)applyEntries:(uint64_t)a1 withProfile:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_1_0(&dword_21F5DA000, v1, v2, "Error applying journal entries: %@: %{public}@", (void)v3, DWORD2(v3));
}

@end