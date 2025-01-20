@interface VNPersonsModel
+ (BOOL)isReadOnly;
+ (BOOL)readObjectForModelVersion:(unint64_t)a3 tag:(unsigned int)a4 fromInputStream:(id)a5 intoObjectDictionary:(id)a6 md5Context:(CC_MD5state_st *)a7 error:(id *)a8;
+ (VNPersonsModelInformation)_modelInformationFromUnopenedStream:(void *)a3 error:;
+ (id)_modelFromStream:(void *)a3 options:(void *)a4 error:;
+ (id)_modelFromUnopenedStream:(void *)a3 options:(void *)a4 error:;
+ (id)_readModelObjectsFromStream:(void *)a3 options:(void *)a4 actionBlock:(void *)a5 progressBlock:(void *)a6 modelClass:(void *)a7 version:(void *)a8 error:;
+ (id)configurationFromLoadedObjects:(id)a3 error:(id *)a4;
+ (id)informationForModelWithData:(id)a3 error:(id *)a4;
+ (id)informationForModelWithURL:(id)a3 error:(id *)a4;
+ (id)modelFromData:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)modelFromStream:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)modelFromURL:(id)a3 options:(id)a4 error:(id *)a5;
+ (id)newModelFromVersion:(unint64_t)a3 objects:(id)a4 error:(id *)a5;
+ (id)supportedReadVersions;
+ (id)versionNumbersEncodedInClass:(Class)a3 withMethodNamePrefix:(id)a4 suffix:(id)a5;
- (BOOL)convertToAlgorithm:(id)a3 error:(id *)a4;
- (BOOL)dropCurrentFaceModelAndReturnError:(id *)a3;
- (BOOL)updateInternalConfigurationWithModelFaceprintRequestRevision:(unint64_t)a3 error:(id *)a4;
- (VNPersonsModel)initWithConfiguration:(id)a3 dataSource:(id)a4;
- (VNPersonsModelAlgorithm)algorithm;
- (VNPersonsModelConfiguration)configuration;
- (id)_dataSourceAndReturnError:(uint64_t)a1;
- (id)description;
- (id)faceCountsForAllPersons;
- (id)faceCountsForPersonsWithUniqueIdentifiers:(id)a3;
- (id)faceObservationsForPersonWithUniqueIdentifier:(id)a3 error:(id *)a4;
- (id)personUniqueIdentifiers;
- (id)predictPersonFromFaceObservation:(id)a3 limit:(unint64_t)a4 canceller:(id)a5 error:(id *)a6;
- (id)trainingFaceObservationsForPersonWithUniqueIdentifier:(id)a3 canceller:(id)a4 error:(id *)a5;
- (id)trainingFaceprintsForPersonWithUniqueIdentifier:(id)a3 canceller:(id)a4 error:(id *)a5;
- (id)upToDateFaceModelWithCanceller:(id)a3 error:(id *)a4;
- (unint64_t)faceCountForPersonWithUniqueIdentifier:(id)a3;
- (unint64_t)personCount;
@end

@implementation VNPersonsModel

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_faceModel_DO_NOT_ACCESS_DIRECTLY, 0);
}

- (id)faceCountsForAllPersons
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v4 = [WeakRetained numberOfPersonsInPersonsModel:self];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v4];
    for (uint64_t i = 0; i != v4; ++i)
    {
      v7 = [WeakRetained personsModel:self uniqueIdentifierOfPersonAtIndex:i];
      uint64_t v8 = [WeakRetained personsModel:self numberOfFaceObservationsForPersonAtIndex:i];
      v9 = [NSNumber numberWithUnsignedInteger:v8];
      [v5 setObject:v9 forKeyedSubscript:v7];
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v5;
}

- (id)faceCountsForPersonsWithUniqueIdentifiers:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v15, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v15;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v11 = [WeakRetained personsModel:self indexOfPersonWithUniqueIdentifier:v10];
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v12 = [WeakRetained personsModel:self numberOfFaceObservationsForPersonAtIndex:v11];
          v13 = [NSNumber numberWithUnsignedInteger:v12];
          [v5 setObject:v13 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)trainingFaceprintsForPersonWithUniqueIdentifier:(id)a3 canceller:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(VNPersonsModel *)self upToDateFaceModelWithCanceller:a4 error:a5];
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = [v9 trainingFaceprintsForPersonWithUniqueIdentifier:v8 error:a5];
    uint64_t v12 = v11;
    if (v11) {
      id v13 = v11;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)trainingFaceObservationsForPersonWithUniqueIdentifier:(id)a3 canceller:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(VNPersonsModel *)self faceObservationsForPersonWithUniqueIdentifier:v8 error:a5];
  uint64_t v11 = v10;
  if (v10)
  {
    if ([v10 count])
    {
      uint64_t v12 = [(VNPersonsModel *)self upToDateFaceModelWithCanceller:v9 error:a5];
      id v13 = v12;
      if (v12)
      {
        v14 = [v12 trainingFaceprintsForPersonWithUniqueIdentifier:v8 error:a5];
        id v15 = v14;
        if (v14)
        {
          uint64_t v16 = [v14 count];
          if (v16)
          {
            uint64_t v17 = [v13 faceprintRequestRevision];
            long long v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, v16);
            uint64_t v23 = MEMORY[0x1E4F143A8];
            uint64_t v24 = 3221225472;
            v25 = __88__VNPersonsModel_trainingFaceObservationsForPersonWithUniqueIdentifier_canceller_error___block_invoke;
            v26 = &unk_1E5B1CD68;
            uint64_t v30 = v17;
            v27 = self;
            id v28 = v15;
            id v19 = v18;
            id v29 = v19;
            v20 = [v11 indexesOfObjectsPassingTest:&v23];
            objc_msgSend(v11, "objectsAtIndexes:", v20, v23, v24, v25, v26, v27);
            id v21 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v21 = (id)MEMORY[0x1E4F1CBF0];
          }
        }
        else
        {
          id v21 = 0;
        }
      }
      else
      {
        id v21 = 0;
      }
    }
    else
    {
      id v21 = v11;
    }
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

uint64_t __88__VNPersonsModel_trainingFaceObservationsForPersonWithUniqueIdentifier_canceller_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 VNPersonsModelFaceprintWithRequestRevision:*(void *)(a1 + 56) error:0];
  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v9 = v6;
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __59__VNPersonsModel__indexOfFaceprints_equivalentToFaceprint___block_invoke;
    v14[3] = &unk_1E5B1CD18;
    id v10 = v9;
    id v15 = v10;
    uint64_t v11 = [v8 indexOfObjectPassingTest:v14];

    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_4:
      uint64_t v12 = 0;
      goto LABEL_8;
    }
  }
  else
  {

    uint64_t v11 = 0;
  }
  [*(id *)(a1 + 48) removeIndex:v11];
  uint64_t v12 = 1;
  if (![*(id *)(a1 + 48) count]) {
    *a4 = 1;
  }
LABEL_8:

  return v12;
}

uint64_t __59__VNPersonsModel__indexOfFaceprints_equivalentToFaceprint___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasEquivalentDescriptorToImageprint:*(void *)(a1 + 32)];
}

- (id)faceObservationsForPersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = -[VNPersonsModel _dataSourceAndReturnError:]((uint64_t)self, a4);
  id v8 = v7;
  if (!v7)
  {
LABEL_5:
    id v10 = 0;
    goto LABEL_13;
  }
  uint64_t v9 = [v7 personsModel:self indexOfPersonWithUniqueIdentifier:v6];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      VNPersonsModelErrorForUnknownPersonUniqueIdentifier((uint64_t)v6);
      id v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_5;
  }
  uint64_t v11 = [v8 personsModel:self numberOfFaceObservationsForPersonAtIndex:v9];
  if (v11)
  {
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v11];
    for (uint64_t i = 0; i != v11; ++i)
    {
      id v13 = [v8 personsModel:self faceObservationAtIndex:i forPersonAtIndex:v9];
      if (v13) {
        [v10 addObject:v13];
      }
    }
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_13:

  return v10;
}

- (id)_dataSourceAndReturnError:(uint64_t)a1
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    uint64_t v4 = WeakRetained;
    if (WeakRetained)
    {
      id v5 = WeakRetained;
    }
    else if (a2)
    {
      VNPersonsModelErrorForInvalidModelData(@"the data source is no longer available");
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (unint64_t)faceCountForPersonWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v6 = [WeakRetained personsModel:self indexOfPersonWithUniqueIdentifier:v4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = [WeakRetained personsModel:self numberOfFaceObservationsForPersonAtIndex:v6];
  }

  return v7;
}

- (id)personUniqueIdentifiers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  uint64_t v4 = [WeakRetained numberOfPersonsInPersonsModel:self];
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
    for (uint64_t i = 0; i != v4; ++i)
    {
      unint64_t v7 = [WeakRetained personsModel:self uniqueIdentifierOfPersonAtIndex:i];
      [v5 addObject:v7];
    }
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (unint64_t)personCount
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  unint64_t v4 = [WeakRetained numberOfPersonsInPersonsModel:self];

  return v4;
}

- (id)predictPersonFromFaceObservation:(id)a3 limit:(unint64_t)a4 canceller:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (v10)
  {
    uint64_t v12 = [(VNPersonsModel *)self upToDateFaceModelWithCanceller:v11 error:a6];
    id v13 = v12;
    if (v12)
    {
      v14 = objc_msgSend(v10, "VNPersonsModelFaceprintWithRequestRevision:error:", objc_msgSend(v12, "faceprintRequestRevision"), a6);
      id v15 = v14;
      if (v14)
      {
        uint64_t v24 = [v14 descriptorData];
        uint64_t v16 = operator new(8uLL);
        *uint64_t v16 = 1;
        id v17 = v24;
        long long v18 = objc_msgSend(v17, "bytes", v24, v16, v16 + 1, v16 + 1);
        unint64_t v19 = [v17 length];
        vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)v26, &v25, v18, v19, 1, 0);
        int v27 = 1;
        id v28 = 0;
        v26[0] = &unk_1EF752918;
        v26[12] = (void *)(v19 >> 2);
        operator delete(v16);
        v20 = [v13 personPredictionsForFace:v10 withDescriptor:v26 limit:a4 canceller:v11 error:a6];
        id v21 = v20;
        if (v20) {
          id v22 = v20;
        }

        v26[0] = &unk_1EF752918;
        free(v28);
        vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(v26);
      }
      else
      {
        id v21 = 0;
      }
    }
    else
    {
      id v21 = 0;
    }
  }
  else if (a6)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:@"the face observation must not be nil"];
    id v21 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (VNPersonsModelConfiguration)configuration
{
  v2 = (void *)[(VNPersonsModelConfiguration *)self->_configuration copy];

  return (VNPersonsModelConfiguration *)v2;
}

- (BOOL)convertToAlgorithm:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = [(VNPersonsModelConfiguration *)self->_configuration algorithm];
  char v8 = [v7 isEqual:v6];

  if ((v8 & 1) == 0)
  {
    if (![(VNPersonsModel *)self dropCurrentFaceModelAndReturnError:a4])
    {
      BOOL v9 = 0;
      goto LABEL_6;
    }
    [(VNPersonsModelConfiguration *)self->_configuration setAlgorithm:v6];
  }
  BOOL v9 = 1;
LABEL_6:

  return v9;
}

- (VNPersonsModelAlgorithm)algorithm
{
  v2 = [(VNPersonsModelConfiguration *)self->_configuration resolvedAlgorithmAndReturnError:0];
  v3 = (void *)[v2 copy];

  return (VNPersonsModelAlgorithm *)v3;
}

- (id)upToDateFaceModelWithCanceller:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unint64_t v7 = -[VNPersonsModel _dataSourceAndReturnError:]((uint64_t)self, a4);
  if (!v7) {
    goto LABEL_12;
  }
  if (objc_opt_respondsToSelector())
  {
    unint64_t v8 = [v7 lastDataChangeSequenceNumberForPersonsModel:self];
    if (v8 != self->_lastDataChangeSequenceNumber
      && ![(VNPersonsModel *)self dropCurrentFaceModelAndReturnError:a4])
    {
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  faceModel_DO_NOT_ACCESS_DIRECTLY = self->_faceModel_DO_NOT_ACCESS_DIRECTLY;
  if (faceModel_DO_NOT_ACCESS_DIRECTLY)
  {
LABEL_10:
    id v13 = faceModel_DO_NOT_ACCESS_DIRECTLY;
    goto LABEL_13;
  }
  id v10 = [[_VNPersonsModelDataSourceBasedDataProvider alloc] initWithPersonsModel:self dataSource:v7];
  id v11 = +[VNPersonsModelFaceModel modelBuiltFromConfiguration:self->_configuration dataProvider:v10 canceller:v6 error:a4];
  uint64_t v12 = self->_faceModel_DO_NOT_ACCESS_DIRECTLY;
  self->_faceModel_DO_NOT_ACCESS_DIRECTLY = v11;

  if (self->_faceModel_DO_NOT_ACCESS_DIRECTLY)
  {
    self->_lastDataChangeSequenceNumber = v8;

    faceModel_DO_NOT_ACCESS_DIRECTLY = self->_faceModel_DO_NOT_ACCESS_DIRECTLY;
    goto LABEL_10;
  }

LABEL_12:
  id v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)dropCurrentFaceModelAndReturnError:(id *)a3
{
  faceModel_DO_NOT_ACCESS_DIRECTLY = self->_faceModel_DO_NOT_ACCESS_DIRECTLY;
  self->_faceModel_DO_NOT_ACCESS_DIRECTLY = 0;

  return 1;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithCapacity:64];
  unint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@: %p> %lu identities", v5, self, -[VNPersonsModel personCount](self, "personCount")];

  return v3;
}

- (BOOL)updateInternalConfigurationWithModelFaceprintRequestRevision:(unint64_t)a3 error:(id *)a4
{
  if (!a3) {
    return 1;
  }
  unint64_t v7 = [(VNPersonsModelConfiguration *)self->_configuration faceprintRequestRevision];
  if (v7 == a3) {
    return 1;
  }
  unint64_t v8 = v7;
  if (!v7)
  {
    [(VNPersonsModelConfiguration *)self->_configuration setFaceprintRequestRevision:a3];
    return 1;
  }
  if (a4)
  {
    BOOL v9 = NSString;
    id v10 = (objc_class *)objc_opt_class();
    id v11 = VNRequestRevisionString(v10, v8);
    uint64_t v12 = (objc_class *)objc_opt_class();
    id v13 = VNRequestRevisionString(v12, a3);
    v14 = [v9 stringWithFormat:@"configuration has already been resolved to %@ and cannot be set to %@", v11, v13];

    *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:v14];
  }
  return 0;
}

- (VNPersonsModel)initWithConfiguration:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VNPersonsModel;
  unint64_t v8 = [(VNPersonsModel *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    configuration = v8->_configuration;
    v8->_configuration = (VNPersonsModelConfiguration *)v9;

    id v11 = v8->_configuration;
    uint64_t v12 = [(VNPersonsModelConfiguration *)v11 resolvedAlgorithmAndReturnError:0];
    [(VNPersonsModelConfiguration *)v11 setAlgorithm:v12];

    objc_storeWeak((id *)&v8->_dataSource, v7);
  }

  return v8;
}

+ (BOOL)readObjectForModelVersion:(unint64_t)a3 tag:(unsigned int)a4 fromInputStream:(id)a5 intoObjectDictionary:(id)a6 md5Context:(CC_MD5state_st *)a7 error:(id *)a8
{
  uint64_t v11 = *(void *)&a4;
  id v12 = a5;
  id v13 = a6;
  if ((int)v11 > 1833250632)
  {
    if ((int)v11 <= 1919895090)
    {
      if (v11 == 1833250633 || v11 == 1835104329)
      {
        LODWORD(v77) = 0;
        id v14 = v12;
        LODWORD(aBlock) = 0;
        if (VNPersonsModelIOReadTagFromInputStream(v14, &aBlock, a7, a8))
        {
          if (aBlock == 4)
          {
            BOOL v15 = VNPersonsModelIOReadBufferFromInputStream(v14, 4u, &v77, a7, a8);

            if (!v15)
            {
              char v17 = 0;
              goto LABEL_48;
            }
            id v14 = [NSNumber numberWithInt:v77];
            uint64_t v16 = [NSNumber numberWithUnsignedInt:v11];
            [v13 setObject:v14 forKeyedSubscript:v16];

            char v17 = 1;
            goto LABEL_47;
          }
          if (a8)
          {
            v52 = [NSString stringWithFormat:@"encountered unexpected length of %u, instead of %u", aBlock, 4];
            VNPersonsModelErrorForIOError(v52);
            *a8 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        char v17 = 0;
LABEL_47:

        goto LABEL_48;
      }
      goto LABEL_43;
    }
    if (v11 == 1919895091 || v11 == 1919895117)
    {
LABEL_37:
      uint64_t v45 = objc_opt_class();
      id v14 = v12;
      id v46 = v13;
      v47 = VNPersonsModelIOReadNSDataFromInputStream(v14, a7, a8);
      v48 = v47;
      if (v47)
      {
        id v65 = v13;
        id v77 = 0;
        v78 = &v77;
        uint64_t v79 = 0x3032000000;
        v80 = __Block_byref_object_copy__9039;
        v81 = __Block_byref_object_dispose__9040;
        id v82 = 0;
        uint64_t aBlock = MEMORY[0x1E4F143A8];
        uint64_t v70 = 3221225472;
        v71 = ___ZL24_readTaggedObjectOfClassP13NSInputStreamjP10objc_classP19NSMutableDictionaryP14CC_MD5state_stPU15__autoreleasingP7NSError_block_invoke;
        v72 = &unk_1E5B1CD90;
        int v76 = v11;
        v74 = &v77;
        uint64_t v75 = v45;
        id v73 = v47;
        v49 = _Block_copy(&aBlock);
        char v17 = VNExecuteBlock(v49, (uint64_t)a8);
        if (v17)
        {
          id v50 = v78[5];
          v51 = [NSNumber numberWithUnsignedInt:v11];
          [v46 setObject:v50 forKeyedSubscript:v51];
        }
        _Block_object_dispose(&v77, 8);

        id v13 = v65;
      }
      else
      {
        char v17 = 0;
      }

      goto LABEL_47;
    }
LABEL_43:
    char v17 = VNPersonsModelIOReadPastUnknownTagData(v12, a7, a8);
    goto LABEL_48;
  }
  if (v11 != 1227572778)
  {
    if (v11 == 1634494319 || v11 == 1819111268) {
      goto LABEL_37;
    }
    goto LABEL_43;
  }
  id v18 = v12;
  id v19 = v13;
  v20 = [v19 objectForKeyedSubscript:&unk_1EF7A70E8];
  if (!v20)
  {
    v20 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    [v19 setObject:v20 forKeyedSubscript:&unk_1EF7A70E8];
  }
  id v21 = VNPersonsModelIOReadNSDataFromInputStream(v18, a7, a8);
  id v22 = v21;
  if (v21)
  {
    v59 = v20;
    id v23 = v21;
    id v62 = v23;
    uint64_t v24 = (unsigned int *)[v23 bytes];
    uint64_t v25 = *v24;
    v26 = objc_msgSend(v23, "VNPersonsModelSubdataWithRange:rangeDescription:error:", 4, v25, @"person identifier data", a8);
    if (v26)
    {
      v56 = v22;
      id v57 = v18;
      id v58 = v19;
      int v27 = (void *)MEMORY[0x1E4F28DC0];
      id v28 = VNEntityUniqueIdentifierClasses();
      id v29 = [v27 unarchivedObjectOfClasses:v28 fromData:v26 error:a8];

      if (v29)
      {
        uint64_t v67 = *(unsigned int *)((char *)v24 + v25 + 4);
        id v19 = v58;
        uint64_t v30 = [v59 objectForKey:v29];
        uint64_t v31 = v30;
        if (!v30)
        {
          uint64_t v31 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v67];
          uint64_t v30 = [v59 setObject:v31 forKey:v29];
        }
        v60 = (void *)v31;
        if (v67)
        {
          v54 = a8;
          v55 = v26;
          id v64 = v13;
          id v66 = v12;
          v32 = 0;
          id v33 = 0;
          char v61 = 0;
          uint64_t v34 = v25 + 8;
          v63 = v29;
          do
          {
            v35 = (void *)MEMORY[0x1A6257080](v30);
            v36 = v24;
            uint64_t v37 = *(unsigned int *)((char *)v24 + v34);
            v34 += 4;
            uint64_t aBlock = MEMORY[0x1E4F143A8];
            uint64_t v70 = 3221225472;
            v71 = ___ZL43_readVersion1PersonAndFaceObservationsChunkP13NSInputStreamP19NSMutableDictionaryP14CC_MD5state_stPU15__autoreleasingP7NSError_block_invoke;
            v72 = &unk_1E5B1CDB8;
            v74 = v32;
            uint64_t v75 = v67;
            id v73 = v29;
            id v77 = v33;
            v38 = objc_msgSend(v23, "VNPersonsModelSubdataWithRange:rangeDescriptionProvidingBlock:error:", v34, v37, &aBlock, &v77);
            id v39 = v77;

            if (v38)
            {
              v40 = (void *)MEMORY[0x1E4F28DC0];
              uint64_t v41 = objc_opt_class();
              id v68 = v39;
              v42 = [v40 unarchivedObjectOfClass:v41 fromData:v38 error:&v68];
              id v33 = v68;

              if (v42)
              {
                id v29 = v63;
                [v60 addObject:v42];
                int v43 = 0;
              }
              else
              {
                int v43 = 2;
                char v61 = 1;
                id v29 = v63;
              }
              v34 += v37;

              id v23 = v62;
            }
            else
            {
              int v43 = 2;
              char v61 = 1;
              id v33 = v39;
              id v29 = v63;
            }

            if (v43) {
              break;
            }
            uint64_t v24 = v36;
            BOOL v44 = v67 - 1 == (void)v32;
            v32 = (id *)((char *)v32 + 1);
          }
          while (!v44);
          char v17 = v61 ^ 1;
          v26 = v55;
          v20 = v59;
          if (((v54 != 0) & v61) != 0)
          {
            id v33 = v33;
            id *v54 = v33;
          }
          id v13 = v64;
          id v12 = v66;
          id v19 = v58;
        }
        else
        {
          id v33 = 0;
          char v17 = 1;
          v20 = v59;
        }

        id v18 = v57;
      }
      else
      {
        char v17 = 0;
        id v18 = v57;
        id v19 = v58;
        v20 = v59;
      }

      id v22 = v56;
    }
    else
    {
      char v17 = 0;
      v20 = v59;
    }
  }
  else
  {
    char v17 = 0;
  }

LABEL_48:
  return v17 & 1;
}

+ (id)newModelFromVersion:(unint64_t)a3 objects:(id)a4 error:(id *)a5
{
  if (a5)
  {
    id v6 = objc_msgSend(NSString, "stringWithFormat:", @"cannot create model with version %u", a4, a3);
    VNPersonsModelErrorForInvalidModelData(v6);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (id)informationForModelWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithURL:v6];
  unint64_t v8 = +[VNPersonsModel _modelInformationFromUnopenedStream:error:]((uint64_t)a1, v7, a4);

  return v8;
}

+ (VNPersonsModelInformation)_modelInformationFromUnopenedStream:(void *)a3 error:
{
  id v4 = a2;
  uint64_t v5 = self;
  [v4 open];
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.vis.VNPersonsModelLoader" code:1 userInfo:0];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__9039;
  id v29 = __Block_byref_object_dispose__9040;
  id v30 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__VNPersonsModel__modelInformationFromUnopenedStream_error___block_invoke_154;
  aBlock[3] = &unk_1E5B1CD40;
  uint64_t v24 = &v25;
  id v7 = v6;
  id v23 = v7;
  unint64_t v8 = _Block_copy(aBlock);
  uint64_t v9 = objc_alloc_init(VNPersonsModelReadOptions);
  uint64_t v20 = 0;
  id v21 = 0;
  id v19 = 0;
  id v10 = +[VNPersonsModel _readModelObjectsFromStream:options:actionBlock:progressBlock:modelClass:version:error:](v5, v4, v9, &__block_literal_global_150, v8, &v21, &v20, &v19);
  id v11 = v19;
  id v12 = v11;
  if (v10 || ([v11 isEqual:v7] & 1) != 0)
  {
    if (!v26[5])
    {
      uint64_t v13 = [MEMORY[0x1E4F1C9C8] distantPast];
      id v14 = (void *)v26[5];
      v26[5] = v13;
    }
    BOOL v15 = [v10 objectForKeyedSubscript:&unk_1EF7A70D0];
    uint64_t v16 = [VNPersonsModelInformation alloc];
    char v17 = -[VNPersonsModelInformation initWithVersion:lastModificationDate:algorithm:readOnly:](v16, "initWithVersion:lastModificationDate:algorithm:readOnly:", v20, v26[5], v15, [v21 isReadOnly]);
  }
  else
  {
    char v17 = 0;
    if (a3) {
      *a3 = v12;
    }
  }

  _Block_object_dispose(&v25, 8);
  [v4 close];

  return v17;
}

BOOL __60__VNPersonsModel__modelInformationFromUnopenedStream_error___block_invoke_154(uint64_t a1, int a2, void *a3, void *a4)
{
  id v8 = a3;
  if (a2 == 1819111268)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
      if (a4) {
        *a4 = *(id *)(a1 + 32);
      }
    }
    else if (a4)
    {
      uint64_t v9 = NSString;
      id v10 = VNPersonsModelIOStringForTag(1819111268);
      id v11 = [v9 stringWithFormat:@"%@ read as %@", v10, v8];
      VNPersonsModelErrorForInvalidModelData(v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return a2 != 1819111268;
}

+ (id)_readModelObjectsFromStream:(void *)a3 options:(void *)a4 actionBlock:(void *)a5 progressBlock:(void *)a6 modelClass:(void *)a7 version:(void *)a8 error:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v47 = a3;
  BOOL v15 = a4;
  v48 = a5;
  self;
  CC_MD5_Init(&c);
  unsigned int v54 = 0;
  if (!VNPersonsModelIOReadTagFromInputStream(v14, &v54, &c, a8)) {
    goto LABEL_34;
  }
  uint64_t v16 = v54;
  self;
  if (v16 != 1886217324 && v16 != 1886220911)
  {
    if (a8)
    {
      v32 = NSString;
      id v33 = VNPersonsModelIOStringForTag(v16);
      uint64_t v34 = [v32 stringWithFormat:@"unknown model kind '%@'", v33];
      VNPersonsModelErrorForInvalidModelData(v34);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v35 = 0;
    goto LABEL_34;
  }
  objc_opt_class();
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  if (!v17) {
    goto LABEL_34;
  }
  id v18 = v17;
  if (a6) {
    *a6 = v17;
  }
  unsigned int v53 = 0;
  if (!VNPersonsModelIOReadTagFromInputStream(v14, &v53, &c, a8))
  {
LABEL_34:
    id v36 = 0;
    goto LABEL_35;
  }
  uint64_t v19 = v53;
  if (a7) {
    *a7 = v53;
  }
  BOOL v44 = [v47 acceptableVersions];
  if (v44 && ([v44 containsIndex:v19] & 1) == 0)
  {
    if (a8)
    {
      VNPersonsModelErrorForUnacceptableModelVersion(v19);
      id v36 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v36 = 0;
    }
    goto LABEL_56;
  }
  uint64_t v45 = v19;
  id v46 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v20 = 0;
  LOBYTE(v21) = 1;
  do
  {
    id v22 = (void *)MEMORY[0x1A6257080]();
    *(_DWORD *)md = 0;
    id v52 = v20;
    BOOL v23 = VNPersonsModelIOReadTagFromInputStream(v14, md, &c, &v52);
    id v24 = v52;

    id v20 = v24;
    if (!v23)
    {
LABEL_24:
      LOBYTE(v21) = 0;
LABEL_25:
      int v26 = 3;
      goto LABEL_26;
    }
    if (*(_DWORD *)md == v54) {
      goto LABEL_25;
    }
    if (v15 && v15[2](v15, *(unsigned int *)md) == 1)
    {
      id v51 = v24;
      int v21 = VNPersonsModelIOReadPastUnknownTagData(v14, &c, &v51);
      id v25 = v51;

      if (v21) {
        int v26 = 2;
      }
      else {
        int v26 = 3;
      }
      id v20 = v25;
    }
    else
    {
      id v50 = v24;
      int v27 = objc_msgSend(v18, "readObjectForModelVersion:tag:fromInputStream:intoObjectDictionary:md5Context:error:", v45);
      id v28 = v50;

      if (v27)
      {
        if (v48)
        {
          uint64_t v29 = *(unsigned int *)md;
          id v30 = [NSNumber numberWithUnsignedInt:*(unsigned int *)md];
          uint64_t v31 = [v46 objectForKeyedSubscript:v30];
          id v49 = v28;
          LOBYTE(v29) = v48[2](v48, v29, v31, &v49);
          id v20 = v49;

          if ((v29 & 1) == 0) {
            goto LABEL_24;
          }
        }
        else
        {
          id v20 = v28;
        }
        int v26 = 0;
        LOBYTE(v21) = 1;
      }
      else
      {
        LOBYTE(v21) = 0;
        int v26 = 3;
        id v20 = v28;
      }
    }
LABEL_26:
  }
  while (v26 != 3);
  if ((v21 & 1) == 0)
  {
    if (a8)
    {
      id v41 = v20;
      id v20 = v41;
      goto LABEL_44;
    }
    goto LABEL_54;
  }
  CC_MD5_Final(md, &c);
  id v38 = v14;
  uint64_t v39 = [v38 read:v56 maxLength:16];
  if (v39 != 16 && a8)
  {
    v40 = [v38 streamError];
    VNPersonsModelErrorWithLocalizedDescriptionAndUnderlyingError(1, @"unexpected end of data stream", v40);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_54;
  }
  BOOL v42 = v39 == 16;

  if (!v42) {
    goto LABEL_54;
  }
  if (v56[0] == *(void *)md && v56[1] == v58)
  {
    id v36 = v46;
    goto LABEL_55;
  }
  if (!a8)
  {
LABEL_54:
    id v36 = 0;
    goto LABEL_55;
  }
  VNPersonsModelErrorWithLocalizedDescription(2, @"model data cannot be verified due to mismatched checksums");
  id v41 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:
  id v36 = 0;
  *a8 = v41;
LABEL_55:

LABEL_56:
LABEL_35:

  return v36;
}

BOOL __60__VNPersonsModel__modelInformationFromUnopenedStream_error___block_invoke(uint64_t a1, int a2)
{
  return a2 != 1819111268 && a2 != 1634494319;
}

+ (id)informationForModelWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithData:v6];
  id v8 = +[VNPersonsModel _modelInformationFromUnopenedStream:error:]((uint64_t)a1, v7, a4);

  return v8;
}

+ (id)modelFromURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithURL:v8];
  id v11 = +[VNPersonsModel _modelFromUnopenedStream:options:error:]((uint64_t)a1, v10, v9, a5);

  return v11;
}

+ (id)_modelFromUnopenedStream:(void *)a3 options:(void *)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  [v6 open];
  id v9 = +[VNPersonsModel _modelFromStream:options:error:](v8, v6, v7, a4);
  [v6 close];

  return v9;
}

+ (id)_modelFromStream:(void *)a3 options:(void *)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = self;
  uint64_t v14 = 0;
  id v15 = 0;
  id v9 = +[VNPersonsModel _readModelObjectsFromStream:options:actionBlock:progressBlock:modelClass:version:error:](v8, v6, v7, 0, 0, &v15, &v14, a4);
  if (v9)
  {
    id v10 = (void *)[v15 newModelFromVersion:v14 objects:v9 error:a4];
    id v11 = v10;
    if (v10) {
      id v12 = v10;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (id)modelFromData:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA10]) initWithData:v8];
  id v11 = +[VNPersonsModel _modelFromUnopenedStream:options:error:]((uint64_t)a1, v10, v9, a5);

  return v11;
}

+ (id)modelFromStream:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v5 = +[VNPersonsModel _modelFromStream:options:error:]((uint64_t)a1, a3, a4, a5);

  return v5;
}

+ (id)supportedReadVersions
{
  if (+[VNPersonsModel supportedReadVersions]::onceToken != -1) {
    dispatch_once(&+[VNPersonsModel supportedReadVersions]::onceToken, &__block_literal_global_9099);
  }
  v2 = (void *)+[VNPersonsModel supportedReadVersions]::ourSupportedReadVersions;

  return v2;
}

uint64_t __39__VNPersonsModel_supportedReadVersions__block_invoke()
{
  +[VNPersonsModel supportedReadVersions]::ourSupportedReadVersions = [objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:1];

  return MEMORY[0x1F41817F8]();
}

+ (id)versionNumbersEncodedInClass:(Class)a3 withMethodNamePrefix:(id)a4 suffix:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v10 = [v7 length];
  unsigned int outCount = 0;
  id v11 = class_copyMethodList(a3, &outCount);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      Name = method_getName(v11[i]);
      uint64_t v14 = NSStringFromSelector(Name);
      if ([v14 hasPrefix:v7] && objc_msgSend(v14, "hasSuffix:", v8))
      {
        id v15 = objc_msgSend(v14, "substringWithRange:", v10, objc_msgSend(v14, "length") - (v10 + objc_msgSend(v8, "length")));
        uint64_t v16 = [v15 integerValue];
        if (v16 >= 1) {
          [v9 addIndex:v16];
        }
      }
    }
  }
  free(v11);

  return v9;
}

+ (id)configurationFromLoadedObjects:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(VNPersonsModelConfiguration);
  [(VNPersonsModelConfiguration *)v5 setFaceprintRequestRevision:0];
  id v6 = [v4 objectForKeyedSubscript:&unk_1EF7A70A0];
  id v7 = v6;
  if (v6) {
    -[VNPersonsModelConfiguration setMaximumIdentities:](v5, "setMaximumIdentities:", [v6 unsignedIntegerValue]);
  }
  id v8 = [v4 objectForKeyedSubscript:&unk_1EF7A70B8];
  id v9 = v8;
  if (v8) {
    -[VNPersonsModelConfiguration setMaximumTrainingFaceprintsPerIdentity:](v5, "setMaximumTrainingFaceprintsPerIdentity:", [v8 unsignedIntegerValue]);
  }
  uint64_t v10 = [v4 objectForKeyedSubscript:&unk_1EF7A70D0];
  if (v10) {
    [(VNPersonsModelConfiguration *)v5 setAlgorithm:v10];
  }

  return v5;
}

+ (BOOL)isReadOnly
{
  return 0;
}

@end