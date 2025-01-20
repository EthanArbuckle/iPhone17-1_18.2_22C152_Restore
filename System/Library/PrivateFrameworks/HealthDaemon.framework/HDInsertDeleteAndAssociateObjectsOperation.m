@interface HDInsertDeleteAndAssociateObjectsOperation
+ (BOOL)supportsSecureCoding;
- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5;
- (HDInsertDeleteAndAssociateObjectsOperation)initWithCoder:(id)a3;
- (HDInsertDeleteAndAssociateObjectsOperation)initWithObjectsToInsertByDataProvenance:(id)a3 objectsToDelete:(id)a4 associations:(id)a5;
- (NSArray)objectsToDelete;
- (NSDictionary)associations;
- (NSDictionary)objectsToInsertByDataProvenance;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDInsertDeleteAndAssociateObjectsOperation

- (HDInsertDeleteAndAssociateObjectsOperation)initWithObjectsToInsertByDataProvenance:(id)a3 objectsToDelete:(id)a4 associations:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDInsertDeleteAndAssociateObjectsOperation;
  v11 = [(HDInsertDeleteAndAssociateObjectsOperation *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    objectsToInsertByDataProvenance = v11->_objectsToInsertByDataProvenance;
    v11->_objectsToInsertByDataProvenance = (NSDictionary *)v12;

    uint64_t v14 = [v9 copy];
    objectsToDelete = v11->_objectsToDelete;
    v11->_objectsToDelete = (NSArray *)v14;

    uint64_t v16 = [v10 copy];
    associations = v11->_associations;
    v11->_associations = (NSDictionary *)v16;
  }
  return v11;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obj = self->_objectsToInsertByDataProvenance;
  uint64_t v9 = [(NSDictionary *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v33;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v33 != v11) {
        objc_enumerationMutation(obj);
      }
      uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * v12);
      uint64_t v14 = [v7 dataManager];
      v15 = [(NSDictionary *)self->_objectsToInsertByDataProvenance objectForKeyedSubscript:v13];
      int v16 = [v14 insertDataObjects:v15 withProvenance:v13 creationDate:a5 error:Current];

      if (!v16) {
        goto LABEL_20;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSDictionary *)obj countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  v17 = [v7 dataManager];
  int v18 = [v17 deleteDataObjects:self->_objectsToDelete restrictedSourceEntities:0 failIfNotFound:0 recursiveDeleteAuthorizationBlock:0 error:a5];

  LOBYTE(v16) = 0;
  if (v18)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    obj = self->_associations;
    uint64_t v19 = [(NSDictionary *)obj countByEnumeratingWithState:&v28 objects:v36 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
LABEL_12:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v28 + 1) + 8 * v22);
        v24 = [(NSDictionary *)self->_associations objectForKeyedSubscript:v23];
        uint64_t v27 = 0;
        int v16 = +[HDAssociationEntity associateSampleUUIDs:v24 withSampleUUID:v23 type:0 destinationSubObjectReference:0 lastInsertedEntityID:&v27 profile:v7 error:a5];

        if (!v16) {
          break;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [(NSDictionary *)obj countByEnumeratingWithState:&v28 objects:v36 count:16];
          LOBYTE(v16) = 1;
          if (v20) {
            goto LABEL_12;
          }
          break;
        }
      }
    }
    else
    {
      LOBYTE(v16) = 1;
    }
LABEL_20:
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertDeleteAndAssociateObjectsOperation)initWithCoder:(id)a3
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HDInsertDeleteAndAssociateObjectsOperation;
  v5 = [(HDInsertDeleteAndAssociateObjectsOperation *)&v22 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
    id v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"objectsToInsertByDataProvenance"];
    objectsToInsertByDataProvenance = v5->_objectsToInsertByDataProvenance;
    v5->_objectsToInsertByDataProvenance = (NSDictionary *)v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    uint64_t v13 = [v11 setWithArray:v12];
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"objectsToDelete"];
    objectsToDelete = v5->_objectsToDelete;
    v5->_objectsToDelete = (NSArray *)v14;

    int v16 = (void *)MEMORY[0x1E4F1CAD0];
    v23[0] = objc_opt_class();
    v23[1] = objc_opt_class();
    v23[2] = objc_opt_class();
    v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
    int v18 = [v16 setWithArray:v17];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"associations"];
    associations = v5->_associations;
    v5->_associations = (NSDictionary *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objectsToInsertByDataProvenance = self->_objectsToInsertByDataProvenance;
  id v5 = a3;
  [v5 encodeObject:objectsToInsertByDataProvenance forKey:@"objectsToInsertByDataProvenance"];
  [v5 encodeObject:self->_objectsToDelete forKey:@"objectsToDelete"];
  [v5 encodeObject:self->_associations forKey:@"associations"];
}

- (NSDictionary)objectsToInsertByDataProvenance
{
  return self->_objectsToInsertByDataProvenance;
}

- (NSArray)objectsToDelete
{
  return self->_objectsToDelete;
}

- (NSDictionary)associations
{
  return self->_associations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associations, 0);
  objc_storeStrong((id *)&self->_objectsToDelete, 0);

  objc_storeStrong((id *)&self->_objectsToInsertByDataProvenance, 0);
}

@end