@interface VNEntityIdentificationModel
+ (BOOL)canCreateModelOfClass:(Class)a3 withObjects:(id)a4 error:(id *)a5;
+ (BOOL)isReadOnly;
+ (BOOL)readObjectForVersion1Tag:(unsigned int)a3 fromInputStream:(id)a4 intoObjectDictionary:(id)a5 md5Context:(CC_MD5state_st *)a6 error:(id *)a7;
+ (BOOL)validateAceptableObservation:(id)a3 forEntityPrintOriginatingRequestSpecifier:(id)a4 error:(id *)a5;
+ (BOOL)validateConfiguration:(id)a3 error:(id *)a4;
+ (VNEntityIdentificationModelInformation)_modelInformationFromUnopenedStream:(void *)a3 error:;
+ (id)_modelFromInputStream:(void *)a3 options:(void *)a4 error:;
+ (id)_modelFromUnopenedStream:(void *)a3 options:(void *)a4 error:;
+ (id)_readModelObjectsFromStream:(uint64_t)a1 options:(void *)a2 actionBlock:(void *)a3 progressBlock:(void *)a4 modelClass:(objc_class *)a5 version:(void *)a6 error:(void *)a7;
+ (id)informationForModelWithData:(id)a3 error:(id *)a4;
+ (id)informationForModelWithURL:(id)a3 error:(id *)a4;
+ (id)modelConfigurationForVersion:(unint64_t)a3 modelObjects:(id)a4 error:(id *)a5;
+ (id)modelFromData:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)modelFromStream:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)modelFromURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)modelWithConfiguration:(id)a3 dataSource:(id)a4 error:(id *)a5;
+ (id)newModelForVersion:(unint64_t)a3 modelObjects:(id)a4 error:(id *)a5;
+ (id)supportedReadVersions;
+ (id)supportedRequestSpecifiers;
+ (id)supportedWriteVersions;
- (BOOL)_writeToOutputStream:(void *)a3 options:(void *)a4 error:;
- (BOOL)_writeToUnopenedOutputStream:(void *)a3 options:(void *)a4 error:;
- (BOOL)convertToAlgorithm:(id)a3 error:(id *)a4;
- (BOOL)dropTrainedModelAndReturnError:(id *)a3;
- (BOOL)validateWithCanceller:(id)a3 error:(id *)a4;
- (BOOL)writeReadOnlyVersion1ToOutputStream:(id)a3 options:(id)a4 md5Context:(CC_MD5state_st *)a5 error:(id *)a6;
- (BOOL)writeToStream:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)writeToURL:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)writeVersion1ToOutputStream:(id)a3 options:(id)a4 md5Context:(CC_MD5state_st *)a5 error:(id *)a6;
- (VNEntityIdentificationModel)initWithConfiguration:(id)a3 dataSource:(id)a4;
- (VNEntityIdentificationModelAlgorithm)algorithm;
- (VNEntityIdentificationModelConfiguration)configuration;
- (VNEntityIdentificationModelDelegate)delegate;
- (VNEntityIdentificationModelInformation)information;
- (id)_dataSourceAndReturnError:(uint64_t)a1;
- (id)dataWithOptions:(id)a3 error:(id *)a4;
- (id)entityPredictionsForObservation:(id)a3 limit:(unint64_t)a4 canceller:(id)a5 error:(id *)a6;
- (id)entityUniqueIdentifiers;
- (id)observationCountsForAllEntities;
- (id)observationCountsForEntitiesWithUniqueIdentifiers:(id)a3;
- (id)observationsForEntityWithUniqueIdentifier:(id)a3 error:(id *)a4;
- (id)trainedModelWithCanceller:(id)a3 error:(id *)a4;
- (id)trainingObservationsForEntityWithUniqueIdentifier:(id)a3 canceller:(id)a4 error:(id *)a5;
- (id)trainingPrintsForEntityWithUniqueIdentifier:(id)a3 canceller:(id)a4 error:(id *)a5;
- (id)uniqueIdentifierForEntityAtIndex:(unint64_t)a3;
- (uint64_t)_writePreambleAndCommonTagsForModelKind:(id *)a1 version:(int)a2 toOutputStream:(void *)a3 md5Context:(CC_MD5_CTX *)a4 error:(void *)a5;
- (uint64_t)_writeVersion1ConfigurationToOutputStream:(void *)a1 options:(void *)a2 md5Context:(CC_MD5_CTX *)a3 error:(void *)a4;
- (unint64_t)entityCount;
- (unint64_t)observationCountForEntityWithUniqueIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation VNEntityIdentificationModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainedModel_DO_NOT_ACCESS_DIRECTLY, 0);
  objc_destroyWeak((id *)&self->_dataSource_DO_NOT_ACCESS_DIRECTLY);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_destroyWeak((id *)&self->_delegate_DO_NOT_ACCESS_DIRECTLY);
}

- (id)entityPredictionsForObservation:(id)a3 limit:(unint64_t)a4 canceller:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  v12 = [(VNEntityIdentificationModel *)self trainedModelWithCanceller:v11 error:a6];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 predictionsForObservation:v10 limit:a4 canceller:v11 error:a6];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)convertToAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(VNEntityIdentificationModelConfiguration *)self->_configuration algorithm];
  char v8 = [v7 isEqual:v6];

  if ((v8 & 1) == 0)
  {
    if (![(VNEntityIdentificationModel *)self dropTrainedModelAndReturnError:a4])
    {
      BOOL v9 = 0;
      goto LABEL_6;
    }
    [(VNEntityIdentificationModelConfiguration *)self->_configuration setAlgorithm:v6];
  }
  BOOL v9 = 1;
LABEL_6:

  return v9;
}

- (VNEntityIdentificationModelAlgorithm)algorithm
{
  v2 = [(VNEntityIdentificationModelConfiguration *)self->_configuration resolvedAlgorithmAndReturnError:0];
  v3 = (void *)[v2 copy];

  return (VNEntityIdentificationModelAlgorithm *)v3;
}

- (id)trainingPrintsForEntityWithUniqueIdentifier:(id)a3 canceller:(id)a4 error:(id *)a5
{
  id v8 = a3;
  BOOL v9 = [(VNEntityIdentificationModel *)self trainedModelWithCanceller:a4 error:a5];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 trainingEntityPrintsForEntityWithUniqueIdentifier:v8 error:a5];
    v12 = v11;
    if (v11) {
      id v13 = v11;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)trainingObservationsForEntityWithUniqueIdentifier:(id)a3 canceller:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(VNEntityIdentificationModel *)self observationsForEntityWithUniqueIdentifier:v8 error:a5];
  id v11 = v10;
  if (v10)
  {
    if ([v10 count])
    {
      v12 = [(VNEntityIdentificationModel *)self trainedModelWithCanceller:v9 error:a5];
      id v13 = v12;
      if (v12)
      {
        v14 = [v12 trainingEntityPrintsForEntityWithUniqueIdentifier:v8 error:a5];
        v15 = v14;
        if (v14)
        {
          uint64_t v16 = [v14 count];
          if (v16)
          {
            uint64_t v17 = v16;
            v18 = [(VNEntityIdentificationModel *)self configuration];
            v19 = [v18 entityPrintOriginatingRequestSpecifier];

            v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, v17);
            v26[0] = MEMORY[0x1E4F143A8];
            v26[1] = 3221225472;
            v26[2] = __97__VNEntityIdentificationModel_trainingObservationsForEntityWithUniqueIdentifier_canceller_error___block_invoke;
            v26[3] = &unk_1E5B1F908;
            id v27 = v19;
            id v28 = v15;
            id v29 = v20;
            id v21 = v20;
            id v22 = v19;
            v23 = [v11 indexesOfObjectsPassingTest:v26];
            id v24 = [v11 objectsAtIndexes:v23];
          }
          else
          {
            id v24 = (id)MEMORY[0x1E4F1CBF0];
          }
        }
        else
        {
          id v24 = 0;
        }
      }
      else
      {
        id v24 = 0;
      }
    }
    else
    {
      id v24 = v11;
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

BOOL __97__VNEntityIdentificationModel_trainingObservationsForEntityWithUniqueIdentifier_canceller_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:*(void *)(a1 + 32) error:0];
  v7 = v6;
  if (v6)
  {
    id v8 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __97__VNEntityIdentificationModel_trainingObservationsForEntityWithUniqueIdentifier_canceller_error___block_invoke_2;
    v12[3] = &unk_1E5B1F8E0;
    id v13 = v6;
    uint64_t v9 = [v8 indexOfObjectPassingTest:v12];
    BOOL v10 = v9 != 0x7FFFFFFFFFFFFFFFLL;
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      [*(id *)(a1 + 48) removeIndex:v9];
      if (![*(id *)(a1 + 48) count]) {
        *a4 = 1;
      }
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

uint64_t __97__VNEntityIdentificationModel_trainingObservationsForEntityWithUniqueIdentifier_canceller_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEquivalentToVNEntityIdentificationModelPrint:*(void *)(a1 + 32)];
}

- (id)observationCountsForAllEntities
{
  v3 = -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, 0);
  uint64_t v4 = [v3 numberOfEntitiesInEntityIdentificationModel:self];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v4];
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v8 = [v3 entityIdentificationModel:self uniqueIdentifierOfEntityAtIndex:i];
      uint64_t v9 = [v3 entityIdentificationModel:self numberOfObservationsForEntityAtIndex:i];
      BOOL v10 = [NSNumber numberWithUnsignedInteger:v9];
      [v6 setObject:v10 forKey:v8];
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v6;
}

- (id)_dataSourceAndReturnError:(uint64_t)a1
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v4 = WeakRetained;
    if (WeakRetained)
    {
      id v5 = WeakRetained;
    }
    else if (a2)
    {
      VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, @"the data source is no longer available", 0);
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)observationCountsForEntitiesWithUniqueIdentifiers:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, 0);
  if (v5)
  {
    id v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v17 = v4;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v13 = [v5 entityIdentificationModel:self indexOfEntityWithUniqueIdentifier:v12];
          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v14 = [v5 entityIdentificationModel:self numberOfObservationsForEntityAtIndex:v13];
            v15 = [NSNumber numberWithUnsignedInteger:v14];
            [v6 setObject:v15 forKey:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    id v4 = v17;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v6;
}

- (id)observationsForEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, a4);
  uint64_t v8 = v7;
  if (!v7)
  {
LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_9;
  }
  uint64_t v9 = [v7 entityIdentificationModel:self indexOfEntityWithUniqueIdentifier:v6];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      VNEntityIdentificationModelErrorForUnknownEntityUniqueIdentifier((uint64_t)v6);
      uint64_t v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    goto LABEL_5;
  }
  uint64_t v11 = v9;
  uint64_t v12 = [v8 entityIdentificationModel:self numberOfObservationsForEntityAtIndex:v9];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v12];
  if (v12)
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      uint64_t v14 = [v8 entityIdentificationModel:self observationAtIndex:i forEntityAtIndex:v11];
      [v10 addObject:v14];
    }
  }
LABEL_9:

  return v10;
}

- (unint64_t)observationCountForEntityWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, 0);
  id v6 = v5;
  if (v5
    && (uint64_t v7 = [v5 entityIdentificationModel:self indexOfEntityWithUniqueIdentifier:v4],
        v7 != 0x7FFFFFFFFFFFFFFFLL))
  {
    unint64_t v8 = [v6 entityIdentificationModel:self numberOfObservationsForEntityAtIndex:v7];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (id)uniqueIdentifierForEntityAtIndex:(unint64_t)a3
{
  id v5 = -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, 0);
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 entityIdentificationModel:self uniqueIdentifierOfEntityAtIndex:a3];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)entityUniqueIdentifiers
{
  v3 = -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, 0);
  uint64_t v4 = [v3 numberOfEntitiesInEntityIdentificationModel:self];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
    for (uint64_t i = 0; i != v5; ++i)
    {
      unint64_t v8 = [v3 entityIdentificationModel:self uniqueIdentifierOfEntityAtIndex:i];
      [v6 addObject:v8];
    }
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (unint64_t)entityCount
{
  v3 = -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, 0);
  unint64_t v4 = [v3 numberOfEntitiesInEntityIdentificationModel:self];

  return v4;
}

- (BOOL)validateWithCanceller:(id)a3 error:(id *)a4
{
  unint64_t v4 = [(VNEntityIdentificationModel *)self trainedModelWithCanceller:a3 error:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (VNEntityIdentificationModelInformation)information
{
  v3 = [(VNEntityIdentificationModelConfiguration *)self->_configuration resolvedAlgorithmAndReturnError:0];
  unint64_t v4 = -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, 0);
  BOOL v5 = 0;
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [v4 lastModificationDateForEntityIdentificationModel:self];
  }
  id v6 = -[VNEntityIdentificationModelInformation initWithVersion:algorithm:lastModificationDate:readOnly:]([VNEntityIdentificationModelInformation alloc], "initWithVersion:algorithm:lastModificationDate:readOnly:", 1, v3, v5, [(id)objc_opt_class() isReadOnly]);

  return v6;
}

- (VNEntityIdentificationModelConfiguration)configuration
{
  v2 = (void *)[(VNEntityIdentificationModelConfiguration *)self->_configuration copy];

  return (VNEntityIdentificationModelConfiguration *)v2;
}

- (BOOL)writeToURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void *)MEMORY[0x1A6257080]();
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initWithURL:v8 append:0];
  id v15 = 0;
  BOOL v12 = -[VNEntityIdentificationModel _writeToUnopenedOutputStream:options:error:]((BOOL)self, v11, v9, &v15);
  id v13 = v15;

  if (a5 && !v12) {
    *a5 = v13;
  }

  return v12;
}

- (BOOL)_writeToUnopenedOutputStream:(void *)a3 options:(void *)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    [v7 open];
    LOBYTE(a1) = -[VNEntityIdentificationModel _writeToOutputStream:options:error:](a1, v7, v8, a4);
    [v7 close];
  }

  return a1;
}

- (BOOL)_writeToOutputStream:(void *)a3 options:(void *)a4 error:
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v26 = a2;
  id v7 = a3;
  id v8 = v7;
  if (a1)
  {
    uint64_t v28 = 0;
    id v29 = 0;
    id v9 = v7;
    uint64_t v10 = [v9 version];
    if (v10)
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:v10];
    }
    else
    {
      uint64_t v11 = [(id)objc_opt_class() supportedWriteVersions];
    }
    BOOL v12 = (void *)v11;
    if ([v9 readOnly])
    {
      char v13 = 1;
    }
    else
    {
      uint64_t v14 = [(id)a1 information];
      char v13 = [v14 isReadOnly];
    }
    *(void *)md = 0;
    v31 = md;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 0;
    *(void *)&c.A = MEMORY[0x1E4F143A8];
    *(void *)&c.C = 3221225472;
    *(void *)&c.Nl = __96__VNEntityIdentificationModel__getModelWritingImplementation_selector_version_forOptions_error___block_invoke;
    *(void *)c.data = &unk_1E5B1F898;
    *(void *)&c.data[6] = &v29;
    *(void *)&c.data[8] = &v28;
    LOBYTE(c.data[10]) = v13;
    *(void *)&c.data[2] = a1;
    *(void *)&c.data[4] = md;
    [v12 enumerateIndexesWithOptions:2 usingBlock:&c];
    uint64_t v15 = *((void *)v31 + 3);
    if (!v15 && a4)
    {
      uint64_t v16 = NSString;
      id v17 = (objc_class *)objc_opt_class();
      long long v18 = NSStringFromClass(v17);
      long long v19 = [NSNumber numberWithUnsignedInteger:v10];
      long long v20 = [v16 stringWithFormat:@"%@ does not support writing version %@", v18, v19];

      VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(5, v20, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    _Block_object_dispose(md, 8);

    if (v15 && (memset(&c, 0, sizeof(c)), CC_MD5_Init(&c), v29(a1, v28, v26, v9, &c, a4)))
    {
      CC_MD5_Final(md, &c);
      id v21 = v26;
      uint64_t v22 = [v21 write:md maxLength:16];
      a1 = v22 == 16;
      if (v22 != 16 && a4 != 0)
      {
        id v24 = [v21 streamError];
        VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(1, @"failed to write to data stream", v24);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void __96__VNEntityIdentificationModel__getModelWritingImplementation_selector_version_forOptions_error___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(a1 + 32))
  {
    int v6 = *(unsigned __int8 *)(a1 + 64);
    id v7 = *(IMP **)(a1 + 48);
    id v8 = *(const char ***)(a1 + 56);
    IMP *v7 = 0;
    *id v8 = 0;
    if (v6) {
      id v9 = @"writeReadOnlyVersion";
    }
    else {
      id v9 = @"writeVersion";
    }
    uint64_t v14 = [NSString stringWithFormat:@"%@%lu%@", v9, a2, @"ToOutputStream:options:md5Context:error:"];
    uint64_t v10 = NSSelectorFromString(v14);
    *id v8 = v10;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (uint64_t v11 = (objc_class *)objc_opt_class(), (InstanceMethod = class_getInstanceMethod(v11, v10)) != 0)
      && (IMP Implementation = method_getImplementation(InstanceMethod)) != 0)
    {
      IMP *v7 = Implementation;

      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
      *a3 = 1;
    }
    else
    {
    }
  }
}

- (id)dataWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1A6257080]();
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initToMemory];
  id v15 = 0;
  BOOL v9 = -[VNEntityIdentificationModel _writeToUnopenedOutputStream:options:error:]((BOOL)self, v8, v6, &v15);
  id v10 = v15;
  if (v9)
  {
    uint64_t v11 = [v8 propertyForKey:*MEMORY[0x1E4F1C4C0]];
    if (v11)
    {
      BOOL v12 = (void *)v11;

      goto LABEL_8;
    }
    uint64_t v13 = VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(1, @"failed to obtain the data", 0);

    id v10 = (id)v13;
  }

  if (a4)
  {
    id v10 = v10;
    BOOL v12 = 0;
    *a4 = v10;
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_8:

  return v12;
}

- (BOOL)writeToStream:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1A6257080]();
  id v14 = 0;
  BOOL v11 = -[VNEntityIdentificationModel _writeToOutputStream:options:error:]((BOOL)self, v8, v9, &v14);
  id v12 = v14;
  if (a5 && !v11) {
    *a5 = v12;
  }

  return v11;
}

- (void)setDelegate:(id)a3
{
  p_delegate_DO_NOT_ACCESS_DIRECTLY = &self->_delegate_DO_NOT_ACCESS_DIRECTLY;
  id v5 = a3;
  objc_storeWeak((id *)p_delegate_DO_NOT_ACCESS_DIRECTLY, v5);
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFD | v6;
  if (objc_opt_respondsToSelector()) {
    char v7 = 4;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xFB | v7;
  if (objc_opt_respondsToSelector()) {
    char v8 = 8;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xF7 | v8;
  char v9 = objc_opt_respondsToSelector();

  if (v9) {
    char v10 = 16;
  }
  else {
    char v10 = 0;
  }
  *(unsigned char *)&self->_delegateFlags = *(unsigned char *)&self->_delegateFlags & 0xEF | v10;
}

- (VNEntityIdentificationModelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate_DO_NOT_ACCESS_DIRECTLY);

  return (VNEntityIdentificationModelDelegate *)WeakRetained;
}

- (BOOL)dropTrainedModelAndReturnError:(id *)a3
{
  if (self->_trainedModel_DO_NOT_ACCESS_DIRECTLY)
  {
    unint64_t v4 = [(VNEntityIdentificationModel *)self delegate];
    id v5 = v4;
    if ((*(unsigned char *)&self->_delegateFlags & 8) != 0) {
      [v4 entityIdentificationModelWillDropTrainingData:self];
    }
    trainedModel_DO_NOT_ACCESS_DIRECTLY = self->_trainedModel_DO_NOT_ACCESS_DIRECTLY;
    self->_trainedModel_DO_NOT_ACCESS_DIRECTLY = 0;

    if ((*(unsigned char *)&self->_delegateFlags & 0x10) != 0) {
      [v5 entityIdentificationModelDidDropTrainingData:self];
    }
  }
  return 1;
}

- (id)trainedModelWithCanceller:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = -[VNEntityIdentificationModel _dataSourceAndReturnError:]((uint64_t)self, a4);
  if (!v7) {
    goto LABEL_22;
  }
  if (!self->_trainedModel_DO_NOT_ACCESS_DIRECTLY)
  {
    unint64_t v8 = 0;
LABEL_10:
    char v10 = [(VNEntityIdentificationModel *)self delegate];
    BOOL v11 = v10;
    if (*(unsigned char *)&self->_delegateFlags) {
      [v10 willTrainEntityIdentificationModel:self withCanceller:v6];
    }
    id v12 = [[_VNEntityIdentificationModelDataSourceBasedTrainedModelDataProvider alloc] initWithEntityIdentificationModel:self dataSource:v7];
    uint64_t v13 = [(VNEntityIdentificationModel *)self configuration];
    id v19 = 0;
    id v14 = +[VNEntityIdentificationModelTrainedModel trainedModelBuiltFromConfiguration:v13 dataProvider:v12 canceller:v6 error:&v19];
    id v15 = v19;
    trainedModel_DO_NOT_ACCESS_DIRECTLY = self->_trainedModel_DO_NOT_ACCESS_DIRECTLY;
    self->_trainedModel_DO_NOT_ACCESS_DIRECTLY = v14;

    if (!self->_trainedModel_DO_NOT_ACCESS_DIRECTLY)
    {
      if ((*(unsigned char *)&self->_delegateFlags & 4) != 0) {
        [v11 entityIdentificationModel:self trainingFailedWithError:v15];
      }
      if (a4) {
        *a4 = v15;
      }

      goto LABEL_22;
    }
    self->_lastDataChangeSequenceNumber = v8;
    if ((*(unsigned char *)&self->_delegateFlags & 2) != 0) {
      [v11 didTrainEntityIdentificationModel:self];
    }

    char v9 = self->_trainedModel_DO_NOT_ACCESS_DIRECTLY;
LABEL_16:
    id v17 = v9;
    goto LABEL_23;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    unint64_t v8 = 0;
    goto LABEL_9;
  }
  unint64_t v8 = [v7 lastDataChangeSequenceNumberForEntityIdentificationModel:self];
  if (v8 == self->_lastDataChangeSequenceNumber
    || [(VNEntityIdentificationModel *)self dropTrainedModelAndReturnError:a4])
  {
LABEL_9:
    char v9 = self->_trainedModel_DO_NOT_ACCESS_DIRECTLY;
    if (v9) {
      goto LABEL_16;
    }
    goto LABEL_10;
  }
LABEL_22:
  id v17 = 0;
LABEL_23:

  return v17;
}

- (VNEntityIdentificationModel)initWithConfiguration:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VNEntityIdentificationModel;
  unint64_t v8 = [(VNEntityIdentificationModel *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    configuration = v8->_configuration;
    v8->_configuration = (VNEntityIdentificationModelConfiguration *)v9;

    BOOL v11 = v8->_configuration;
    id v12 = [(VNEntityIdentificationModelConfiguration *)v11 resolvedAlgorithmAndReturnError:0];
    [(VNEntityIdentificationModelConfiguration *)v11 setAlgorithm:v12];

    objc_storeWeak((id *)&v8->_dataSource_DO_NOT_ACCESS_DIRECTLY, v7);
  }

  return v8;
}

- (BOOL)writeReadOnlyVersion1ToOutputStream:(id)a3 options:(id)a4 md5Context:(CC_MD5state_st *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [(VNEntityIdentificationModel *)self trainedModelWithCanceller:0 error:a6];
  if (!v12) {
    goto LABEL_8;
  }
  int v15 = 0;
  BOOL v13 = 0;
  if ([(id)objc_opt_class() getStoredRepresentationTag:&v15 forModelVersion:1 error:a6])
  {
    if (-[VNEntityIdentificationModel _writePreambleAndCommonTagsForModelKind:version:toOutputStream:md5Context:error:]((id *)&self->super.isa, 1701409391, v10, a5, a6))
    {
      if (-[VNEntityIdentificationModel _writeVersion1ConfigurationToOutputStream:options:md5Context:error:](self, v10, a5, a6))
      {
        int v16 = 1497715488;
        if (VNEntityIdentificationModelIOWriteTaggedBufferToOutputStream(1378832160, &v16, 4u, v10, a5, a6))
        {
          if (VNEntityIdentificationModelIOWriteTaggedNSObjectToOutputStream(v15, v12, v10, a5, (uint64_t)a6))
          {
            BOOL v13 = VNEntityIdentificationModelIOWriteUInt32ToOutputStream(1701409391, v10, a5, a6);
            goto LABEL_9;
          }
        }
      }
    }
LABEL_8:
    BOOL v13 = 0;
  }
LABEL_9:

  return v13;
}

- (uint64_t)_writePreambleAndCommonTagsForModelKind:(id *)a1 version:(int)a2 toOutputStream:(void *)a3 md5Context:(CC_MD5_CTX *)a4 error:(void *)a5
{
  id v9 = a3;
  if (a1
    && VNEntityIdentificationModelIOWriteUInt32ToOutputStream(a2, v9, a4, a5)
    && VNEntityIdentificationModelIOWriteUInt32ToOutputStream(1, v9, a4, a5))
  {
    id v10 = [a1 information];
    id v11 = [v10 lastModificationDate];
    int v12 = VNEntityIdentificationModelIOWriteTaggedNSObjectToOutputStream(1819111268, v11, v9, a4, (uint64_t)a5);

    if (v12)
    {
      BOOL v13 = [a1[3] resolvedAlgorithmAndReturnError:a5];
      if (v13) {
        uint64_t v14 = VNEntityIdentificationModelIOWriteTaggedNSObjectToOutputStream(1634494319, v13, v9, a4, (uint64_t)a5);
      }
      else {
        uint64_t v14 = 0;
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (uint64_t)_writeVersion1ConfigurationToOutputStream:(void *)a1 options:(void *)a2 md5Context:(CC_MD5_CTX *)a3 error:(void *)a4
{
  id v7 = a2;
  if (a1)
  {
    unint64_t v8 = [a1 configuration];
    uint64_t v9 = [v8 entityPrintOriginatingRequestSpecifier];
    if (v9)
    {
      id v10 = (void *)v9;
      id v11 = v7;
      id v12 = v10;
      int v16 = [v12 requestClassCode];
      uint64_t v13 = [v12 requestRevision];

      uint64_t v17 = v13;
      LODWORD(v13) = VNEntityIdentificationModelIOWriteTaggedBufferToOutputStream(1701995889, &v16, 0xCu, v11, a3, a4);

      if (!v13) {
        goto LABEL_6;
      }
    }
    if (VNEntityIdentificationModelIOWriteTaggedUInt32ToOutputStream(1835104325, [v8 maximumEntities], v7, a3, a4))uint64_t v14 = VNEntityIdentificationModelIOWriteTaggedUInt32ToOutputStream(1833971525, objc_msgSend(v8, "maximumTrainingPrintsPerEntity"), v7, a3, a4); {
    else
    }
LABEL_6:
      uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)writeVersion1ToOutputStream:(id)a3 options:(id)a4 md5Context:(CC_MD5state_st *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (!-[VNEntityIdentificationModel _writePreambleAndCommonTagsForModelKind:version:toOutputStream:md5Context:error:]((id *)&self->super.isa, 1701405805, v10, a5, a6)|| !-[VNEntityIdentificationModel _writeVersion1ConfigurationToOutputStream:options:md5Context:error:](self, v10, a5, a6))
  {
    goto LABEL_23;
  }
  id v12 = v10;
  id v13 = v11;
  uint64_t v14 = v13;
  if (!self)
  {

LABEL_23:
    BOOL v33 = 0;
    goto LABEL_24;
  }
  unint64_t v42 = [(VNEntityIdentificationModel *)self entityCount];
  if (v42)
  {
    v35 = v14;
    v36 = a6;
    id v37 = v11;
    id v38 = v10;
    BOOL v15 = 0;
    uint64_t v16 = 0;
    id v17 = 0;
    v39 = self;
    id v40 = v12;
    while (1)
    {
      BOOL v41 = v15;
      long long v18 = (void *)MEMORY[0x1A6257080]();
      id v19 = [(VNEntityIdentificationModel *)self uniqueIdentifierForEntityAtIndex:v16];
      id v44 = v17;
      long long v20 = [(VNEntityIdentificationModel *)self observationsForEntityWithUniqueIdentifier:v19 error:&v44];
      id v21 = v44;

      if (!v20)
      {

        id v17 = v21;
        goto LABEL_15;
      }
      context = v18;
      id v22 = v19;
      id v23 = v20;
      id v24 = v12;
      uint64_t v58 = 0;
      v59 = &v58;
      uint64_t v60 = 0x2020000000;
      char v61 = 1;
      uint64_t v52 = 0;
      v53 = &v52;
      uint64_t v54 = 0x3032000000;
      v55 = __Block_byref_object_copy__33723;
      v56 = __Block_byref_object_dispose__33724;
      id v57 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = ___writeVersion1EntityAndObservations_block_invoke;
      aBlock[3] = &unk_1E5B1F958;
      id v25 = v22;
      id v47 = v25;
      id v26 = v24;
      id v48 = v26;
      v49 = &v52;
      id v27 = a5;
      v50 = &v58;
      v51 = a5;
      uint64_t v28 = _Block_copy(aBlock);
      id v29 = (void *)MEMORY[0x1A6257080]();
      objc_msgSend(v23, "vn_enumerateObjectsAsSubarraysOfCount:usingBlock:", 20, v28);
      int v30 = *((unsigned __int8 *)v59 + 24);
      id v31 = v21;
      if (!*((unsigned char *)v59 + 24)) {
        id v31 = (id) v53[5];
      }

      _Block_object_dispose(&v52, 8);
      _Block_object_dispose(&v58, 8);

      id v17 = v31;
      if (!v30) {
        break;
      }
      BOOL v15 = ++v16 >= v42;
      a5 = v27;
      self = v39;
      id v12 = v40;
      if (v42 == v16) {
        goto LABEL_16;
      }
    }
    a5 = v27;
    id v12 = v40;
LABEL_15:
    BOOL v15 = v41;
LABEL_16:
    uint64_t v14 = v35;
    a6 = v36;
    if (v36)
    {
      id v11 = v37;
      id v10 = v38;
      if (!v15)
      {
        id v17 = v17;
        BOOL v15 = 0;
        id *v36 = v17;
      }
    }
    else
    {
      id v11 = v37;
      id v10 = v38;
    }
  }
  else
  {
    id v17 = 0;
    BOOL v15 = 1;
  }
  BOOL v45 = v15;

  BOOL v32 = v45;
  if (!v32) {
    goto LABEL_23;
  }
  BOOL v33 = VNEntityIdentificationModelIOWriteUInt32ToOutputStream(1701405805, v12, a5, a6);
LABEL_24:

  return v33;
}

+ (id)supportedWriteVersions
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:1];

  return v2;
}

+ (id)informationForModelWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1A6257080]();
  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithURL:v6];
  id v13 = 0;
  uint64_t v9 = +[VNEntityIdentificationModel _modelInformationFromUnopenedStream:error:]((uint64_t)a1, v8, &v13);
  id v10 = v13;

  if (v9)
  {
    id v11 = v9;
  }
  else if (a4)
  {
    *a4 = v10;
  }

  return v9;
}

+ (VNEntityIdentificationModelInformation)_modelInformationFromUnopenedStream:(void *)a3 error:
{
  id v4 = a2;
  self;
  [v4 open];
  id v5 = v4;
  uint64_t v6 = self;
  id v7 = objc_alloc_init(VNEntityIdentificationModelReadOptions);
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  unint64_t v8 = +[VNEntityIdentificationModel _readModelObjectsFromStream:options:actionBlock:progressBlock:modelClass:version:error:](v6, v5, v7, &__block_literal_global_33757, &v16, &v15, a3);

  if (v8)
  {
    uint64_t v9 = [v8 objectForKeyedSubscript:&unk_1EF7A7880];
    if (!v9)
    {
      uint64_t v9 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    id v10 = [VNEntityIdentificationModelInformation alloc];
    uint64_t v11 = v15;
    id v12 = [v8 objectForKeyedSubscript:&unk_1EF7A7898];
    id v13 = [(VNEntityIdentificationModelInformation *)v10 initWithVersion:v11 algorithm:v12 lastModificationDate:v9 readOnly:[(objc_class *)v16 isReadOnly]];
  }
  else
  {
    id v13 = 0;
  }

  [v4 close];

  return v13;
}

+ (id)_readModelObjectsFromStream:(uint64_t)a1 options:(void *)a2 actionBlock:(void *)a3 progressBlock:(void *)a4 modelClass:(objc_class *)a5 version:(void *)a6 error:(void *)a7
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v12 = a2;
  id v13 = a3;
  uint64_t v14 = a4;
  self;
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  unsigned int v50 = 0;
  id v15 = 0;
  if (!VNEntityIdentificationModelIOReadUInt32FromInputStream(v12, &v50, &c, a7)) {
    goto LABEL_51;
  }
  uint64_t v16 = v50;
  self;
  if (v16 != 1701405805 && v16 != 1701409391)
  {
    if (a7)
    {
      id v29 = NSString;
      int v30 = VNPersonsModelIOStringForTag(v16);
      id v31 = [v29 stringWithFormat:@"unknown model kind %@", v30];
      VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v31, 0);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v32 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  id v17 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
  if (!v17) {
    goto LABEL_25;
  }
  long long v18 = v17;
  if (a5) {
    *a5 = v17;
  }
  unsigned int v49 = 0;
  if (!VNEntityIdentificationModelIOReadUInt32FromInputStream(v12, &v49, &c, a7))
  {
LABEL_25:
    id v15 = 0;
    goto LABEL_51;
  }
  if (a6) {
    *a6 = v49;
  }
  id v19 = [v13 acceptableVersions];
  long long v20 = v19;
  if (v19 && ([v19 containsIndex:v49] & 1) == 0)
  {
    if (a7)
    {
      BOOL v33 = objc_msgSend(NSString, "stringWithFormat:", @"cannot accept model version %lu", v49);
      uint64_t v34 = VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v33, 0);

      id v35 = v34;
      id v15 = 0;
      *a7 = v35;
    }
    else
    {
      id v15 = 0;
    }
    goto LABEL_50;
  }
  objc_msgSend(NSString, "stringWithFormat:", @"readObjectForVersion%uTag:fromInputStream:intoObjectDictionary:md5Context:error:", v49);
  v43 = (NSString *)objc_claimAutoreleasedReturnValue();
  id v21 = NSSelectorFromString(v43);
  ClassMethod = class_getClassMethod(v18, v21);
  if (!ClassMethod)
  {
    if (a7)
    {
      v46 = objc_msgSend(NSString, "stringWithFormat:", @"cannot read model version %u", v49);
      VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v46, 0);
      id v15 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      v36 = v43;
    }
    else
    {
      id v15 = 0;
      v36 = v43;
    }
    goto LABEL_49;
  }
  unint64_t v42 = v20;
  IMP Implementation = method_getImplementation(ClassMethod);
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v23 = 0;
  while (1)
  {
    id v24 = (void *)MEMORY[0x1A6257080]();
    *(_DWORD *)md = 0;
    id v48 = v23;
    BOOL v25 = VNEntityIdentificationModelIOReadUInt32FromInputStream(v12, md, &c, &v48);
    id v26 = v48;

    if (!v25)
    {
      id v23 = v26;
LABEL_31:
      if (a7)
      {
        id v26 = v23;
        id v15 = 0;
        *a7 = v26;
      }
      else
      {
        id v15 = 0;
        id v26 = v23;
      }
LABEL_47:
      v36 = v43;
      goto LABEL_48;
    }
    if (*(_DWORD *)md == v50) {
      break;
    }
    if (v14 && v14[2](v14, *(unsigned int *)md) == 1)
    {
      id v47 = v26;
      char v27 = VNEntityIdentificationModelIOReadPastUnknownTagData(v12, &c, &v47);
      uint64_t v28 = v47;
    }
    else
    {
      char v27 = ((uint64_t (*)(objc_class *, const char *))Implementation)(v18, v21);
      uint64_t v28 = v26;
    }
    id v23 = v28;

    if ((v27 & 1) == 0) {
      goto LABEL_31;
    }
  }
  CC_MD5_Final(md, &c);
  id v37 = v12;
  uint64_t v38 = [v37 read:v52 maxLength:16];
  if (v38 != 16 && a7)
  {
    v39 = [v37 streamError];
    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(1, @"unexpected end of data stream", v39);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_46;
  }

  if (v38 != 16)
  {
LABEL_46:
    id v15 = 0;
    goto LABEL_47;
  }
  BOOL v40 = v52[0] == *(void *)md && v52[1] == v54;
  v36 = v43;
  if (v40)
  {
    id v15 = v45;
  }
  else if (a7)
  {
    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, @"model data fails checksum validation", 0);
    id v15 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = 0;
  }
LABEL_48:

  long long v20 = v42;
LABEL_49:

LABEL_50:
LABEL_51:

  return v15;
}

BOOL __70__VNEntityIdentificationModel__modelInformationFromInputStream_error___block_invoke(uint64_t a1, int a2)
{
  return a2 != 1819111268 && a2 != 1634494319;
}

+ (id)informationForModelWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1A6257080]();
  unint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithData:v6];
  id v13 = 0;
  uint64_t v9 = +[VNEntityIdentificationModel _modelInformationFromUnopenedStream:error:]((uint64_t)a1, v8, &v13);
  id v10 = v13;

  if (v9)
  {
    id v11 = v9;
  }
  else if (a4)
  {
    *a4 = v10;
  }

  return v9;
}

+ (id)modelFromURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1A6257080]();
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithURL:v8];
  id v16 = 0;
  id v12 = +[VNEntityIdentificationModel _modelFromUnopenedStream:options:error:]((uint64_t)a1, v11, v9, &v16);
  id v13 = v16;

  if (v12)
  {
    id v14 = v12;
  }
  else if (a5)
  {
    *a5 = v13;
  }

  return v12;
}

+ (id)_modelFromUnopenedStream:(void *)a3 options:(void *)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  [v6 open];
  id v9 = +[VNEntityIdentificationModel _modelFromInputStream:options:error:](v8, v6, v7, a4);
  [v6 close];

  return v9;
}

+ (id)_modelFromInputStream:(void *)a3 options:(void *)a4 error:
{
  id v6 = a3;
  id v7 = a2;
  uint64_t v8 = self;
  uint64_t v12 = 0;
  id v13 = 0;
  id v9 = +[VNEntityIdentificationModel _readModelObjectsFromStream:options:actionBlock:progressBlock:modelClass:version:error:]((uint64_t)v8, v7, v6, 0, &v13, &v12, a4);

  if (v9 && [v8 canCreateModelOfClass:v13 withObjects:v9 error:a4]) {
    id v10 = (void *)[(objc_class *)v13 newModelForVersion:v12 modelObjects:v9 error:a4];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (id)modelFromData:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1A6257080]();
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithData:v8];
  id v16 = 0;
  uint64_t v12 = +[VNEntityIdentificationModel _modelFromUnopenedStream:options:error:]((uint64_t)a1, v11, v9, &v16);
  id v13 = v16;

  if (v12)
  {
    id v14 = v12;
  }
  else if (a5)
  {
    *a5 = v13;
  }

  return v12;
}

+ (id)modelFromStream:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)MEMORY[0x1A6257080]();
  id v15 = 0;
  id v11 = +[VNEntityIdentificationModel _modelFromInputStream:options:error:]((uint64_t)a1, v8, v9, &v15);
  id v12 = v15;
  if (v11)
  {
    id v13 = v11;
  }
  else if (a5)
  {
    *a5 = v12;
  }

  return v11;
}

+ (id)supportedReadVersions
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:1];

  return v2;
}

+ (id)modelWithConfiguration:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([a1 validateConfiguration:v8 error:a5]) {
    id v10 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v8 dataSource:v9];
  }
  else {
    id v10 = 0;
  }

  return v10;
}

+ (id)supportedRequestSpecifiers
{
  v2 = VNEntityUniqueIdentifierSupportedRequestSpecifiers();
  v3 = [v2 allObjects];

  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_201];

  return v4;
}

uint64_t __57__VNEntityIdentificationModel_supportedRequestSpecifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 requestClassName];
  id v7 = [v5 requestClassName];
  uint64_t v8 = [v6 compare:v7];
  if (!v8)
  {
    unint64_t v9 = [v4 requestRevision];
    unint64_t v10 = [v5 requestRevision];
    if (v9 < v10) {
      uint64_t v8 = -1;
    }
    else {
      uint64_t v8 = v9 > v10;
    }
  }

  return v8;
}

+ (BOOL)isReadOnly
{
  return 0;
}

+ (BOOL)validateAceptableObservation:(id)a3 forEntityPrintOriginatingRequestSpecifier:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v13 = 0;
  unint64_t v9 = [v7 VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:v8 error:&v13];
  id v10 = v13;
  if (a5 && !v9)
  {
    id v11 = [NSString stringWithFormat:@"%@ is generated by %@ instead of %@", v7, v8, v8];
    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(8, v11, v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9 != 0;
}

+ (id)newModelForVersion:(unint64_t)a3 modelObjects:(id)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = +[VNError errorForUnimplementedMethod:a2 ofObject:a1];
  }
  return 0;
}

+ (BOOL)canCreateModelOfClass:(Class)a3 withObjects:(id)a4 error:(id *)a5
{
  char v8 = -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", a1, a4);
  BOOL v9 = v8;
  if (a5 && (v8 & 1) == 0)
  {
    id v10 = NSString;
    id v11 = NSStringFromClass((Class)a1);
    id v12 = NSStringFromClass(a3);
    id v13 = [v10 stringWithFormat:@"%@ cannot be created from a %@", v11, v12];

    VNEntityIdentificationModelErrorForReadOnlyModelWithLocalizedDescription(v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

+ (BOOL)validateConfiguration:(id)a3 error:(id *)a4
{
  id v5 = [a3 entityPrintOriginatingRequestSpecifier];

  if (a4 && !v5)
  {
    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(2, @"an entity print originating request specifier must be configured", 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5 != 0;
}

+ (id)modelConfigurationForVersion:(unint64_t)a3 modelObjects:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = [v6 objectForKeyedSubscript:&unk_1EF7A78B0];
  if (v7)
  {
    char v8 = [[VNEntityIdentificationModelConfiguration alloc] initWithEntityPrintOriginatingRequestSpecifier:v7];
    BOOL v9 = (objc_class *)objc_opt_class();
    if (VNEntityIdentificationModelApplyTagValue(v6, 1835104325, v9, v8, @"maximumEntities", (uint64_t)a5)&& (id v10 = (objc_class *)objc_opt_class(), VNEntityIdentificationModelApplyTagValue(v6, 1833971525, v10, v8, @"maximumTrainingPrintsPerEntity", (uint64_t)a5)))
    {
      id v11 = v8;
    }
    else
    {
      id v11 = 0;
    }
  }
  else if (a5)
  {
    VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, @"no entity print originating request specifier is defined", 0);
    id v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (BOOL)readObjectForVersion1Tag:(unsigned int)a3 fromInputStream:(id)a4 intoObjectDictionary:(id)a5 md5Context:(CC_MD5state_st *)a6 error:(id *)a7
{
  uint64_t v10 = *(void *)&a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v12;
  if ((int)v10 <= 1701995888)
  {
    if ((int)v10 > 1447645234)
    {
      if (v10 == 1447645235)
      {
        uint64_t v14 = objc_opt_class();
        id v15 = v11;
        uint64_t v16 = 1447645235;
        goto LABEL_30;
      }
      if (v10 == 1634494319)
      {
        uint64_t v14 = objc_opt_class();
        id v15 = v11;
        uint64_t v16 = 1634494319;
        goto LABEL_30;
      }
      goto LABEL_32;
    }
    if (v10 != 1160466208)
    {
      if (v10 != 1378832160) {
        goto LABEL_32;
      }
      LODWORD(v52[0]) = 0;
      if (VNEntityIdentificationModelIOReadBufferOfExpectedLengthFromInputStream(v11, 4, v52, a6, a7))
      {
        if (LODWORD(v52[0]) == 1497715488)
        {
          uint64_t v17 = 1;
          goto LABEL_51;
        }
        if (LODWORD(v52[0]) == 1313808416)
        {
          uint64_t v17 = 0;
LABEL_51:
          unint64_t v42 = [NSNumber numberWithBool:v17];
          v43 = [NSNumber numberWithUnsignedInt:1378832160];
          [v13 setObject:v42 forKeyedSubscript:v43];

          LOBYTE(v18) = 1;
          goto LABEL_69;
        }
        if (a7)
        {
          id v44 = objc_msgSend(NSString, "stringWithFormat:", @"corrupted BOOLean value: %02X", LODWORD(v52[0]));
          VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v44, 0);
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      LOBYTE(v18) = 0;
      goto LABEL_69;
    }
    id v21 = v12;
    id v22 = v11;
    LODWORD(v52[0]) = 0;
    if (!VNEntityIdentificationModelIOReadUInt32FromInputStream(v22, v52, a6, a7))
    {

      id v26 = 0;
      goto LABEL_47;
    }
    id v23 = objc_alloc(MEMORY[0x1E4F1CA58]);
    id v24 = (id) [v23 initWithLength:LODWORD(v52[0])];
    BOOL v25 = (const void *)[v24 mutableBytes];
    if (v25)
    {
      if (VNEntityIdentificationModelIOReadBufferFromInputStream(v22, v52[0], v25, a6, a7))
      {
        id v26 = v24;
        goto LABEL_38;
      }
    }
    else if (a7)
    {
      +[VNError errorForMemoryAllocationFailure];
      id v26 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
    id v26 = 0;
LABEL_38:

    if (v26)
    {
      int v30 = [NSNumber numberWithUnsignedInt:1160466208];
      id v31 = [v21 objectForKeyedSubscript:v30];

      if (!v31)
      {
        id v31 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
        id v32 = [NSNumber numberWithUnsignedInt:1160466208];
        [v21 setObject:v31 forKeyedSubscript:v32];
      }
      BOOL v33 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v26 error:a7];
      uint64_t v34 = v33;
      if (!v33)
      {
        LOBYTE(v18) = 0;
LABEL_67:

        goto LABEL_68;
      }
      uint64_t v35 = objc_msgSend(v33, "vn_decodeEntityUniqueIdentifierForKey:", @"E");
      v36 = (void *)v35;
      if (!v35)
      {
        if (!a7)
        {
          LOBYTE(v18) = 0;
          goto LABEL_66;
        }
        v51 = [NSString stringWithFormat:@"unable to decode entity unique identifier for tag %@", VisionCoreFourCharCodeToString()];
        v39 = [v34 error];
        VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v51, v39);
        LOBYTE(v18) = 0;
        *a7 = (id)objc_claimAutoreleasedReturnValue();
        id v45 = v51;
LABEL_65:

LABEL_66:
        goto LABEL_67;
      }
      unsigned int v49 = (void *)v35;
      id v37 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v38 = objc_opt_class();
      uint64_t v50 = objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
      v39 = objc_msgSend(v34, "decodeObjectOfClasses:forKey:");
      if (v39)
      {
        [v34 finishDecoding];
        BOOL v40 = [v34 error];
        if (!v40)
        {
          id v47 = [v31 objectForKey:v49];
          if (!v47)
          {
            id v47 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v31 setObject:v47 forKey:v49];
          }
          [v47 addObjectsFromArray:v39];

          id v41 = 0;
          LOBYTE(v18) = 1;
          goto LABEL_64;
        }
        id v41 = v40;
        if (a7)
        {
          id v41 = v40;
          LOBYTE(v18) = 0;
          *a7 = v41;
LABEL_64:
          id v45 = (void *)v50;

          v36 = v49;
          goto LABEL_65;
        }
      }
      else
      {
        if (!a7)
        {
          v39 = 0;
          LOBYTE(v18) = 0;
          v36 = v49;
          id v45 = (void *)v50;
          goto LABEL_65;
        }
        id v41 = [NSString stringWithFormat:@"unable to decode observations for tag %@", VisionCoreFourCharCodeToString()];
        v46 = [v34 error];
        VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v41, v46);
        *a7 = (id)objc_claimAutoreleasedReturnValue();
      }
      LOBYTE(v18) = 0;
      goto LABEL_64;
    }
LABEL_47:
    LOBYTE(v18) = 0;
LABEL_68:

    goto LABEL_69;
  }
  if ((int)v10 <= 1833971524)
  {
    if (v10 != 1701995889)
    {
      if (v10 == 1819111268)
      {
        uint64_t v14 = objc_opt_class();
        id v15 = v11;
        uint64_t v16 = 1819111268;
        goto LABEL_30;
      }
LABEL_32:
      char TaggedObjectOfClass = VNEntityIdentificationModelIOReadPastUnknownTagData(v11, a6, a7);
      goto LABEL_31;
    }
    id v27 = v11;
    memset(v52, 0, 12);
    if (VNEntityIdentificationModelIOReadBufferOfExpectedLengthFromInputStream(v27, 12, v52, a6, a7))
    {
      id v19 = +[VNRequestSpecifier specifierForRequestClassCode:LODWORD(v52[0]) revision:*(void *)((char *)v52 + 4) error:a7];

      if (v19)
      {
        uint64_t v28 = [NSNumber numberWithUnsignedInt:1701995889];
        [v13 setObject:v19 forKeyedSubscript:v28];

        LOBYTE(v18) = 1;
      }
      else
      {
        LOBYTE(v18) = 0;
      }
    }
    else
    {

      LOBYTE(v18) = 0;
      id v19 = 0;
    }
LABEL_49:

    goto LABEL_69;
  }
  if (v10 != 1833971525 && v10 != 1835104325)
  {
    if (v10 == 1953326188)
    {
      uint64_t v14 = objc_opt_class();
      id v15 = v11;
      uint64_t v16 = 1953326188;
LABEL_30:
      char TaggedObjectOfClass = _readTaggedObjectOfClass(v15, v16, v14, v13, a6, a7);
LABEL_31:
      LOBYTE(v18) = TaggedObjectOfClass;
      goto LABEL_69;
    }
    goto LABEL_32;
  }
  LODWORD(v52[0]) = 0;
  BOOL v18 = VNEntityIdentificationModelIOReadBufferOfExpectedLengthFromInputStream(v11, 4, v52, a6, a7);
  if (v18)
  {
    id v19 = [NSNumber numberWithUnsignedInt:LODWORD(v52[0])];
    long long v20 = [NSNumber numberWithUnsignedInt:v10];
    [v13 setObject:v19 forKeyedSubscript:v20];

    goto LABEL_49;
  }
LABEL_69:

  return v18;
}

@end