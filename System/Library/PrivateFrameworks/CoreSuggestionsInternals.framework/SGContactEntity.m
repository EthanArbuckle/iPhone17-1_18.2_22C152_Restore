@interface SGContactEntity
+ (id)contactEntityFromEntity:(id)a3;
+ (id)contactEntityWithTitle:(id)a3 duplicateKey:(id)a4 recordId:(id)a5 masterEntityId:(int64_t)a6;
- (SGContactEntity)initWithDuplicateKey:(id)a3 recordId:(id)a4 masterEntityId:(int64_t)a5 title:(id)a6;
@end

@implementation SGContactEntity

- (SGContactEntity)initWithDuplicateKey:(id)a3 recordId:(id)a4 masterEntityId:(int64_t)a5 title:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  if (v11)
  {
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SGContactEntity.m", 24, @"Invalid parameter not satisfying: %@", @"duplicateKey" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SGContactEntity.m", 25, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)SGContactEntity;
  v14 = [(SGEntity *)&v19 init];
  v15 = v14;
  if (v14)
  {
    [(SGEntity *)v14 setRecordId:v12];
    [(SGEntity *)v15 setDuplicateKey:v11];
    [(SGEntity *)v15 setMasterEntityId:a5];
    [(SGEntity *)v15 setTitle:v13];
  }

  return v15;
}

+ (id)contactEntityWithTitle:(id)a3 duplicateKey:(id)a4 recordId:(id)a5 masterEntityId:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = v13;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"SGContactEntity.m", 65, @"Invalid parameter not satisfying: %@", @"duplicateKey" object file lineNumber description];

    if (v14) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, a1, @"SGContactEntity.m", 66, @"Invalid parameter not satisfying: %@", @"recordId" object file lineNumber description];

LABEL_3:
  v15 = [[SGContactEntity alloc] initWithDuplicateKey:v12 recordId:v14 masterEntityId:a6 title:v11];

  return v15;
}

+ (id)contactEntityFromEntity:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"SGContactEntity.m", 38, @"Invalid parameter not satisfying: %@", @"entity" object file lineNumber description];
  }
  v6 = [v5 duplicateKey];
  [v6 entityType];
  char IsContact = SGEntityTypeIsContact();

  if ((IsContact & 1) == 0)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"SGContactEntity.m", 39, @"Invalid parameter not satisfying: %@", @"SGEntityTypeIsContact(entity.duplicateKey.entityType)" object file lineNumber description];
  }
  v8 = [SGContactEntity alloc];
  v9 = [v5 duplicateKey];
  v10 = [v5 recordId];
  uint64_t v11 = [v5 masterEntityId];
  id v12 = [v5 title];
  id v13 = [(SGContactEntity *)v8 initWithDuplicateKey:v9 recordId:v10 masterEntityId:v11 title:v12];

  v14 = [v5 duplicateKey];
  [(SGEntity *)v13 setDuplicateKey:v14];

  v15 = [v5 sourceKey];
  [(SGEntity *)v13 setSourceKey:v15];

  v16 = [v5 content];
  [(SGEntity *)v13 setContent:v16];

  [v5 creationTimestamp];
  -[SGEntity setCreationTimestamp:](v13, "setCreationTimestamp:");
  [v5 lastModifiedTimestamp];
  -[SGEntity setLastModifiedTimestamp:](v13, "setLastModifiedTimestamp:");
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v17 = [v5 tags];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(v17);
        }
        [(SGEntity *)v13 addTag:*(void *)(*((void *)&v27 + 1) + 8 * i)];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v19);
  }

  v22 = [v5 structuredData];
  [(SGEntity *)v13 setStructuredData:v22];

  [v5 quality];
  -[SGEntity setQuality:](v13, "setQuality:");
  v23 = [v5 extractionInfo];
  [(SGEntity *)v13 setExtractionInfo:v23];

  return v13;
}

@end