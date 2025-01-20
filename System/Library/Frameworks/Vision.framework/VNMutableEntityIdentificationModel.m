@interface VNMutableEntityIdentificationModel
+ (BOOL)canCreateModelOfClass:(Class)a3 withObjects:(id)a4 error:(id *)a5;
+ (id)modelFromPersonsModel:(id)a3 error:(id *)a4;
+ (id)modelWithConfiguration:(id)a3 dataSource:(id)a4 error:(id *)a5;
+ (id)modelWithConfiguration:(id)a3 error:(id *)a4;
+ (id)newModelForVersion:(unint64_t)a3 modelObjects:(id)a4 error:(id *)a5;
- (BOOL)addAllPersonsFromPersonsModel:(id)a3 error:(id *)a4;
- (BOOL)addObservations:(id)a3 toEntityWithUniqueIdentifier:(id)a4 error:(id *)a5;
- (BOOL)addPersonWithUniqueIdentifier:(id)a3 fromPersonsModel:(id)a4 error:(id *)a5;
- (BOOL)removeAllObservationsFromEntityWithUniqueIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeEntityWithUniqueIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeObservations:(id)a3 fromEntityWithUniqueIdentifier:(id)a4 error:(id *)a5;
- (BOOL)validateWithCanceller:(id)a3 error:(id *)a4;
- (VNMutableEntityIdentificationModel)initWithConfiguration:(id)a3;
- (void)entityIdentificationModelTrainingDataWasModified:(id)a3;
@end

@implementation VNMutableEntityIdentificationModel

+ (id)modelWithConfiguration:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([a1 validateConfiguration:v6 error:a4]) {
    v7 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v6];
  }
  else {
    v7 = 0;
  }

  return v7;
}

+ (id)newModelForVersion:(unint64_t)a3 modelObjects:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [v8 objectForKeyedSubscript:&unk_1EF7A7040];
  int v10 = [v9 BOOLValue];

  if (v10)
  {
    if (a5)
    {
      v11 = NSString;
      v12 = NSStringFromClass((Class)a1);
      v13 = [v11 stringWithFormat:@"%@ cannot open a read-only model", v12];

      VNEntityIdentificationModelErrorForReadOnlyModelWithLocalizedDescription(v13);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      a5 = 0;
    }
  }
  else
  {
    v14 = [a1 modelConfigurationForVersion:a3 modelObjects:v8 error:a5];
    if (v14)
    {
      v25 = v14;
      v15 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v14];
      v16 = [v8 objectForKeyedSubscript:&unk_1EF7A7058];
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v17 = [v16 keyEnumerator];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v27;
        while (2)
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v27 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v26 + 1) + 8 * i);
            v23 = [v16 objectForKey:v22];
            LODWORD(v22) = [v15 addObservations:v23 toEntityWithUniqueIdentifier:v22 error:a5];

            if (!v22)
            {

              a5 = 0;
              goto LABEL_15;
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v30 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      a5 = v15;
LABEL_15:

      v14 = v25;
    }
    else
    {
      a5 = 0;
    }
  }
  return a5;
}

+ (id)modelWithConfiguration:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  if (a5)
  {
    id v6 = NSString;
    v7 = NSStringFromClass((Class)a1);
    id v8 = [v6 stringWithFormat:@"%@ cannot be created with a data source", v7];

    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(2, v8, 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (BOOL)canCreateModelOfClass:(Class)a3 withObjects:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
  {
    if (a5)
    {
      v9 = NSString;
      int v10 = NSStringFromClass((Class)a1);
      v11 = [v9 stringWithFormat:@"%@ cannot be created from a read-only model", v10];

      VNEntityIdentificationModelErrorForReadOnlyModelWithLocalizedDescription(v11);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = 0;
    }
  }
  else
  {
    v13.receiver = a1;
    v13.super_class = (Class)&OBJC_METACLASS___VNMutableEntityIdentificationModel;
    LOBYTE(a5) = objc_msgSendSuper2(&v13, sel_canCreateModelOfClass_withObjects_error_, a3, v8, a5);
  }

  return (char)a5;
}

- (void).cxx_destruct
{
}

- (void)entityIdentificationModelTrainingDataWasModified:(id)a3
{
}

- (BOOL)removeEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  return [(VNEntityIdentificationModelTrainingData *)self->_trainingData removeEntityWithUniqueIdentifier:a3 error:a4];
}

- (BOOL)removeAllObservationsFromEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  return [(VNEntityIdentificationModelTrainingData *)self->_trainingData removeAllObservationsFromEntityWithUniqueIdentifier:a3 error:a4];
}

- (BOOL)removeObservations:(id)a3 fromEntityWithUniqueIdentifier:(id)a4 error:(id *)a5
{
  return [(VNEntityIdentificationModelTrainingData *)self->_trainingData removeObservations:a3 fromEntityWithUniqueIdentifier:a4 error:a5];
}

- (BOOL)addObservations:(id)a3 toEntityWithUniqueIdentifier:(id)a4 error:(id *)a5
{
  return [(VNEntityIdentificationModelTrainingData *)self->_trainingData addObservations:a3 toEntityWithUniqueIdentifier:a4 error:a5];
}

- (VNMutableEntityIdentificationModel)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [[VNEntityIdentificationModelTrainingData alloc] initWithModelConfiguration:v4];
  v8.receiver = self;
  v8.super_class = (Class)VNMutableEntityIdentificationModel;
  id v6 = [(VNEntityIdentificationModel *)&v8 initWithConfiguration:v4 dataSource:v5];

  if (v6)
  {
    [(VNEntityIdentificationModelTrainingData *)v5 setDelegate:v6];
    objc_storeStrong((id *)&v6->_trainingData, v5);
  }

  return v6;
}

- (BOOL)validateWithCanceller:(id)a3 error:(id *)a4
{
  return [(VNEntityIdentificationModelTrainingData *)self->_trainingData validateWithCanceller:a3 error:a4];
}

- (BOOL)addPersonWithUniqueIdentifier:(id)a3 fromPersonsModel:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [a4 faceObservationsForPersonWithUniqueIdentifier:v8 error:a5];
  if (v9) {
    BOOL v10 = [(VNMutableEntityIdentificationModel *)self addObservations:v9 toEntityWithUniqueIdentifier:v8 error:a5];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)addAllPersonsFromPersonsModel:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [v6 personUniqueIdentifiers];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!-[VNMutableEntityIdentificationModel addPersonWithUniqueIdentifier:fromPersonsModel:error:](self, "addPersonWithUniqueIdentifier:fromPersonsModel:error:", *(void *)(*((void *)&v14 + 1) + 8 * i), v6, a4, (void)v14))
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

+ (id)modelFromPersonsModel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 configuration];
  uint64_t v8 = objc_alloc_init(VNCreateFaceprintRequest);
  if (-[VNRequest setRevision:error:](v8, "setRevision:error:", [v7 faceprintRequestRevision], a4))
  {
    id v9 = +[VNEntityIdentificationModelConfiguration newConfigurationForEntityPrintsGeneratedByRequest:v8 error:a4];
    if (v9)
    {
      objc_msgSend(v9, "setMaximumEntities:", objc_msgSend(v7, "maximumIdentities"));
      objc_msgSend(v9, "setMaximumTrainingPrintsPerEntity:", objc_msgSend(v7, "maximumTrainingFaceprintsPerIdentity"));
      uint64_t v10 = [a1 modelWithConfiguration:v9 error:a4];
      v11 = v10;
      if (v10 && [v10 addAllPersonsFromPersonsModel:v6 error:a4]) {
        id v12 = v11;
      }
      else {
        id v12 = 0;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

@end