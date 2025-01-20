@interface _CDSpotlightDeletionOperation
+ (BOOL)supportsSecureCoding;
+ (id)deletionForEventsWithDomainIdentifiers:(id)a3 bundleId:(id)a4 completion:(id)a5;
+ (id)deletionForEventsWithItemIdentifiers:(id)a3 bundleId:(id)a4 completion:(id)a5;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (NSString)description;
- (_CDSpotlightDeletionOperation)initWithCoder:(id)a3;
- (_CDSpotlightDeletionOperation)initWithDeletionType:(id)a3 bundleId:(id)a4 itemIdentifiers:(id)a5 domainIdentifiers:(id)a6 completion:(id)a7;
- (id)serialize;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)serialize;
@end

@implementation _CDSpotlightDeletionOperation

+ (id)deletionForEventsWithItemIdentifiers:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v10];

  v13 = objc_opt_new();
  v14 = (void *)[v11 initWithDeletionType:@"identifiers" bundleId:v9 itemIdentifiers:v12 domainIdentifiers:v13 completion:v8];

  return v14;
}

+ (id)deletionForEventsWithDomainIdentifiers:(id)a3 bundleId:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc((Class)a1);
  v12 = objc_opt_new();
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v10];

  v14 = (void *)[v11 initWithDeletionType:@"domainIdentifiers" bundleId:v9 itemIdentifiers:v12 domainIdentifiers:v13 completion:v8];
  return v14;
}

- (_CDSpotlightDeletionOperation)initWithDeletionType:(id)a3 bundleId:(id)a4 itemIdentifiers:(id)a5 domainIdentifiers:(id)a6 completion:(id)a7
{
  id v22 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v23.receiver = self;
  v23.super_class = (Class)_CDSpotlightDeletionOperation;
  v17 = [(_CDSpotlightDeletionOperation *)&v23 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_deletionType, a3);
    objc_storeStrong((id *)&v18->_bundleId, a4);
    objc_storeStrong((id *)&v18->_itemIdentifiers, a5);
    objc_storeStrong((id *)&v18->_domainIdentifiers, a6);
    uint64_t v19 = [v16 copy];
    id completion = v18->_completion;
    v18->_id completion = (id)v19;
  }
  return v18;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self)
  {
    v6 = self->_bundleId;
    v7 = self->_itemIdentifiers;
    domainIdentifiers = self->_domainIdentifiers;
  }
  else
  {
    v7 = 0;
    v6 = 0;
    domainIdentifiers = 0;
  }
  id v9 = (void *)[v3 initWithFormat:@"%@ - bundleId: %@, itemIdentifiers: %@, domainIdentifiers: %@", v5, v6, v7, domainIdentifiers];

  return (NSString *)v9;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v8 = 0;
    v4 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:a1 fromData:a3 error:&v8];
    id v5 = v8;
    if (v5)
    {
      v6 = +[_CDLogging knowledgeChannel];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        +[_CDSpotlightDeletionOperation eventWithData:dataVersion:]((uint64_t)v5, v6);
      }
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)serialize
{
  id v6 = 0;
  v2 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v6];
  id v3 = v6;
  if (v3)
  {
    v4 = +[_CDLogging knowledgeChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(_CDSpotlightDeletionOperation *)(uint64_t)v3 serialize];
    }
  }
  return v2;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  deletionType = self->_deletionType;
  id v5 = a3;
  [v5 encodeObject:deletionType forKey:@"deletionType"];
  [v5 encodeObject:self->_bundleId forKey:@"bundleId"];
  [v5 encodeObject:self->_itemIdentifiers forKey:@"itemIdentifiers"];
  [v5 encodeObject:self->_domainIdentifiers forKey:@"domainIdentifiers"];
}

- (_CDSpotlightDeletionOperation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F93B90] robustDecodeObjectOfClass:objc_opt_class() forKey:@"deletionType" withCoder:v4 expectNonNull:1 errorDomain:@"_CDSpotlightDeletionErrorDomain" errorCode:-1 logHandle:0];
  if (v5)
  {
    id v6 = [MEMORY[0x1E4F93B90] robustDecodeObjectOfClass:objc_opt_class() forKey:@"bundleId" withCoder:v4 expectNonNull:1 errorDomain:@"_CDSpotlightDeletionErrorDomain" errorCode:-1 logHandle:0];
    if (v6)
    {
      v7 = (void *)MEMORY[0x1E4F93B90];
      id v8 = (void *)MEMORY[0x192FB2F20]();
      id v9 = objc_alloc(MEMORY[0x1E4F1CAD0]);
      uint64_t v10 = objc_opt_class();
      id v11 = objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
      v12 = [v7 robustDecodeObjectOfClasses:v11 forKey:@"itemIdentifiers" withCoder:v4 expectNonNull:1 errorDomain:@"_CDSpotlightDeletionErrorDomain" errorCode:-1 logHandle:0];

      if (v12)
      {
        id v13 = (void *)MEMORY[0x1E4F93B90];
        id v14 = (void *)MEMORY[0x192FB2F20]();
        id v15 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v16 = objc_opt_class();
        v17 = objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
        v18 = [v13 robustDecodeObjectOfClasses:v17 forKey:@"domainIdentifiers" withCoder:v4 expectNonNull:1 errorDomain:@"_CDSpotlightDeletionErrorDomain" errorCode:-1 logHandle:0];

        if (v18)
        {
          self = [(_CDSpotlightDeletionOperation *)self initWithDeletionType:v5 bundleId:v6 itemIdentifiers:v12 domainIdentifiers:v18 completion:0];
          uint64_t v19 = self;
        }
        else
        {
          uint64_t v19 = 0;
        }
      }
      else
      {
        uint64_t v19 = 0;
      }
    }
    else
    {
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_domainIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_deletionType, 0);
}

+ (void)eventWithData:(uint64_t)a1 dataVersion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "_CDSpotlightDeletionOperation unarchive error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)serialize
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "_CDSpotlightDeletionOperation archive error: %@", (uint8_t *)&v2, 0xCu);
}

@end