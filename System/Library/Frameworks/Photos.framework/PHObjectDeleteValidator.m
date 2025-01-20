@interface PHObjectDeleteValidator
- (BOOL)recordObjectID:(id)a3;
- (BOOL)validateForDeleteWithRequestsByObjectID:(id)a3 error:(id *)a4;
- (PHObjectDeleteValidator)initWithEntityName:(id)a3 managedObjectContext:(id)a4;
@end

@implementation PHObjectDeleteValidator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_entity, 0);

  objc_storeStrong((id *)&self->_deletedObjectIDs, 0);
}

- (BOOL)validateForDeleteWithRequestsByObjectID:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(NSMutableSet *)self->_deletedObjectIDs count])
  {
    v7 = (void *)MEMORY[0x1E4F1C0D0];
    v8 = [(NSEntityDescription *)self->_entity name];
    v9 = [v7 fetchRequestWithEntityName:v8];

    v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", self->_deletedObjectIDs];
    [v9 setPredicate:v10];

    [(NSManagedObjectContext *)self->_context executeFetchRequest:v9 error:0];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v17 = [v16 objectID];
          v18 = [v6 objectForKey:v17];

          LODWORD(v16) = [v18 validateForDeleteManagedObject:v16 error:a4];
          if (!v16)
          {
            BOOL v19 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    BOOL v19 = 1;
LABEL_12:
  }
  else
  {
    BOOL v19 = 1;
  }

  return v19;
}

- (BOOL)recordObjectID:(id)a3
{
  id v4 = a3;
  v5 = [v4 entity];
  id v6 = v5;
  if (self->_entity && objc_msgSend(v5, "isKindOfEntity:"))
  {
    [(NSMutableSet *)self->_deletedObjectIDs addObject:v4];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (PHObjectDeleteValidator)initWithEntityName:(id)a3 managedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHObjectDeleteValidator;
  v8 = [(PHObjectDeleteValidator *)&v14 init];
  if (v8)
  {
    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    deletedObjectIDs = v8->_deletedObjectIDs;
    v8->_deletedObjectIDs = v9;

    uint64_t v11 = PLSafeEntityForNameInManagedObjectContext();
    entity = v8->_entity;
    v8->_entity = (NSEntityDescription *)v11;

    objc_storeStrong((id *)&v8->_context, a4);
  }

  return v8;
}

@end