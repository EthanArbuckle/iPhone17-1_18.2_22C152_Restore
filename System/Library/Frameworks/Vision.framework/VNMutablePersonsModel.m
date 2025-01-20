@interface VNMutablePersonsModel
+ (id)_version1ModelWithObjects:(id)a3 error:(id *)a4;
+ (id)newModelFromVersion:(unint64_t)a3 objects:(id)a4 error:(id *)a5;
+ (id)supportedWriteVersions;
- (BOOL)_getModelWritingImplementation:(void *)a3 selector:(SEL *)a4 version:(unint64_t *)a5 forOptions:(id)a6;
- (BOOL)addFaceObservations:(id)a3 toPersonWithUniqueIdentifier:(id)a4 error:(id *)a5;
- (BOOL)removeAllFaceObservationsFromPersonWithUniqueIdentifier:(id)a3 error:(id *)a4;
- (BOOL)removeFaceObservations:(id)a3 fromPersonWithUniqueIdentifier:(id)a4 error:(id *)a5;
- (BOOL)removePersonWithUniqueIdentifier:(id)a3 error:(id *)a4;
- (BOOL)writeReadOnlyVersion1ToOutputStream:(id)a3 options:(id)a4 md5Context:(CC_MD5state_st *)a5 error:(id *)a6;
- (BOOL)writeToStream:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)writeToURL:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)writeVersion1ToOutputStream:(id)a3 options:(id)a4 md5Context:(CC_MD5state_st *)a5 error:(id *)a6;
- (NSString)description;
- (VNMutablePersonsModel)initWithConfiguration:(id)a3;
- (id)dataWithOptions:(id)a3 error:(id *)a4;
- (id)upToDateFaceModelWithCanceller:(id)a3 error:(id *)a4;
- (uint64_t)_writeToUnopenedStream:(void *)a3 options:(uint64_t)a4 error:;
- (void)_writeVersion1ConfigurationToOutputStream:(CC_MD5_CTX *)a3 md5Context:(void *)a4 error:;
- (void)_writeVersion1InformationToOutputStream:(CC_MD5_CTX *)a3 md5Context:(void *)a4 error:;
- (void)personsModelDataWasModified:(id)a3;
@end

@implementation VNMutablePersonsModel

- (void).cxx_destruct
{
}

- (void)personsModelDataWasModified:(id)a3
{
  id v5 = a3;
  -[VNPersonsModel updateInternalConfigurationWithModelFaceprintRequestRevision:error:](self, "updateInternalConfigurationWithModelFaceprintRequestRevision:error:", [v5 faceprintRequestRevision], 0);
  if (self)
  {
    faceModel_DO_NOT_ACCESS_DIRECTLY = self->super._faceModel_DO_NOT_ACCESS_DIRECTLY;
    self->super._faceModel_DO_NOT_ACCESS_DIRECTLY = 0;
  }
}

- (BOOL)removePersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  return [(VNPersonsModelData *)self->_modelData removePersonWithUniqueIdentifier:a3 error:a4];
}

- (BOOL)removeAllFaceObservationsFromPersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  return [(VNPersonsModelData *)self->_modelData removeAllFaceObservationsFromPersonWithUniqueIdentifier:a3 error:a4];
}

- (BOOL)removeFaceObservations:(id)a3 fromPersonWithUniqueIdentifier:(id)a4 error:(id *)a5
{
  return [(VNPersonsModelData *)self->_modelData removeFaceObservations:a3 fromPersonWithUniqueIdentifier:a4 error:a5];
}

- (BOOL)addFaceObservations:(id)a3 toPersonWithUniqueIdentifier:(id)a4 error:(id *)a5
{
  return [(VNPersonsModelData *)self->_modelData addFaceObservations:a3 toPersonWithUniqueIdentifier:a4 error:a5];
}

- (BOOL)writeToURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initWithURL:v8 append:0];
  LOBYTE(a5) = -[VNMutablePersonsModel _writeToUnopenedStream:options:error:](self, v10, v9, (uint64_t)a5);

  return (char)a5;
}

- (uint64_t)_writeToUnopenedStream:(void *)a3 options:(uint64_t)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    [v7 open];
    LOBYTE(a1) = [a1 writeToStream:v7 options:v8 error:a4];
    [v7 close];
  }

  return a1 & 1;
}

- (id)dataWithOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CAA8]) initToMemory];
  if (-[VNMutablePersonsModel _writeToUnopenedStream:options:error:](self, v7, v6, (uint64_t)a4))
  {
    id v8 = [v7 propertyForKey:*MEMORY[0x1E4F1C4C0]];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else if (a4)
    {
      *a4 = +[VNError errorForInternalErrorWithLocalizedDescription:@"failed to obtain the data"];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)writeToStream:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = 0;
  v18 = 0;
  uint64_t v16 = 0;
  if (![(VNMutablePersonsModel *)self _getModelWritingImplementation:&v18 selector:&v17 version:&v16 forOptions:v9])
  {
    if (a5)
    {
      VNPersonsModelErrorForUnacceptableModelVersion(v16);
      BOOL v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    BOOL v12 = 0;
    goto LABEL_10;
  }
  CC_MD5_Init(&c);
  if ((v18(self, v17, v8, v9, &c, a5) & 1) == 0) {
    goto LABEL_9;
  }
  CC_MD5_Final(md, &c);
  id v10 = v8;
  uint64_t v11 = [v10 write:md maxLength:16];
  BOOL v12 = v11 == 16;
  if (v11 != 16 && a5)
  {
    v13 = [v10 streamError];
    VNPersonsModelErrorWithLocalizedDescriptionAndUnderlyingError(1, @"failed to write to data stream", v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  return v12;
}

- (BOOL)_getModelWritingImplementation:(void *)a3 selector:(SEL *)a4 version:(unint64_t *)a5 forOptions:(id)a6
{
  id v10 = a6;
  uint64_t v11 = [v10 version];
  if (v11)
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:v11];
  }
  else
  {
    uint64_t v12 = [(id)objc_opt_class() supportedWriteVersions];
  }
  v13 = (void *)v12;
  char v14 = [v10 readOnly];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__VNMutablePersonsModel__getModelWritingImplementation_selector_version_forOptions___block_invoke;
  v18[3] = &unk_1E5B1F898;
  v18[6] = a3;
  v18[7] = a4;
  char v19 = v14;
  v18[4] = self;
  v18[5] = &v20;
  [v13 enumerateIndexesWithOptions:2 usingBlock:v18];
  unint64_t v15 = v21[3];
  if (v15) {
    *a5 = v15;
  }
  BOOL v16 = v15 != 0;
  _Block_object_dispose(&v20, 8);

  return v16;
}

void __84__VNMutablePersonsModel__getModelWritingImplementation_selector_version_forOptions___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(a1 + 32))
  {
    id v6 = *(IMP **)(a1 + 48);
    id v7 = *(const char ***)(a1 + 56);
    int v8 = *(unsigned __int8 *)(a1 + 64);
    *id v6 = 0;
    *id v7 = 0;
    id v9 = [NSString alloc];
    id v10 = @"writeReadOnlyVersion";
    if (!v8) {
      id v10 = @"writeVersion";
    }
    unint64_t v15 = (NSString *)[v9 initWithFormat:@"%@%lu%@", v10, a2, @"ToOutputStream:options:md5Context:error:"];
    uint64_t v11 = NSSelectorFromString(v15);
    *id v7 = v11;
    if ((objc_opt_respondsToSelector() & 1) != 0
      && (uint64_t v12 = (objc_class *)objc_opt_class(), (InstanceMethod = class_getInstanceMethod(v12, v11)) != 0)
      && (IMP Implementation = method_getImplementation(InstanceMethod)) != 0)
    {
      *id v6 = Implementation;

      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
      *a3 = 1;
    }
    else
    {
    }
  }
}

- (BOOL)writeReadOnlyVersion1ToOutputStream:(id)a3 options:(id)a4 md5Context:(CC_MD5state_st *)a5 error:(id *)a6
{
  id v9 = a3;
  if (self)
  {
    id v10 = [(VNMutablePersonsModel *)self upToDateFaceModelWithCanceller:0 error:a6];
    BOOL v11 = v10
       && (unsigned int v13 = 0,
           ([(id)objc_opt_class() getStoredRepresentationTag:&v13 forModelVersion:1 error:a6] & 1) != 0)
       && VNPersonsModelIOWriteTagToOutputStream(1886220911, v9, a5, a6)
       && VNPersonsModelIOWriteTagToOutputStream(1, v9, a5, a6)
       && -[VNMutablePersonsModel _writeVersion1InformationToOutputStream:md5Context:error:]((uint64_t)self, v9, a5, a6)&& -[VNMutablePersonsModel _writeVersion1ConfigurationToOutputStream:md5Context:error:](self, v9, a5, a6)&& VNPersonsModelIOWriteTaggedObjectToOutputStream(v13, (uint64_t)v10, v9, a5, a6)&& VNPersonsModelIOWriteTagToOutputStream(1886220911, v9, a5, a6);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_writeVersion1InformationToOutputStream:(CC_MD5_CTX *)a3 md5Context:(void *)a4 error:
{
  id v7 = a2;
  if (a1)
  {
    int v8 = [*(id *)(a1 + 40) lastModificationDate];
    id v9 = VNPersonsModelIOWriteTaggedObjectToOutputStream(1819111268, (uint64_t)v8, v7, a3, a4);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)_writeVersion1ConfigurationToOutputStream:(CC_MD5_CTX *)a3 md5Context:(void *)a4 error:
{
  id v7 = a2;
  if (a1)
  {
    int v8 = [a1 configuration];
    int v12 = [v8 maximumIdentities];
    if ((VNPersonsModelIOWriteTaggedBufferToOutputStream(1835104329, &v12, 4u, v7, a3, (uint64_t)a4) & 1) != 0
      && (int v13 = [v8 maximumTrainingFaceprintsPerIdentity],
          VNPersonsModelIOWriteTaggedBufferToOutputStream(1833250633, &v13, 4u, v7, a3, (uint64_t)a4)))
    {
      id v9 = [v8 resolvedAlgorithmAndReturnError:a4];
      if (v9) {
        id v10 = VNPersonsModelIOWriteTaggedObjectToOutputStream(1634494319, (uint64_t)v9, v7, a3, a4);
      }
      else {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BOOL)writeVersion1ToOutputStream:(id)a3 options:(id)a4 md5Context:(CC_MD5state_st *)a5 error:(id *)a6
{
  id v9 = a3;
  v46 = a5;
  if (VNPersonsModelIOWriteTagToOutputStream(1886217324, v9, a5, a6)
    && VNPersonsModelIOWriteTagToOutputStream(1, v9, a5, a6)
    && -[VNMutablePersonsModel _writeVersion1ConfigurationToOutputStream:md5Context:error:](self, v9, a5, a6)&& -[VNMutablePersonsModel _writeVersion1InformationToOutputStream:md5Context:error:]((uint64_t)self, v9, a5, a6))
  {
    unint64_t v10 = [(VNPersonsModelData *)self->_modelData faceModelPersonsCount];
    v36 = a6;
    if (v10)
    {
      uint64_t v11 = 0;
      int v12 = 0;
      v38 = self;
      unint64_t v37 = v10;
      id v39 = v9;
      while (1)
      {
        uint64_t v13 = MEMORY[0x1A6257080]();
        v42 = v12;
        unint64_t v14 = [(VNPersonsModelData *)self->_modelData faceModelNumberOfFaceObservationsForPersonAtIndex:v11];
        unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
        if (v14)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            uint64_t v17 = -[VNPersonsModelData faceModelFaceObservationAtIndex:forPersonAtIndex:](self->_modelData, "faceModelFaceObservationAtIndex:forPersonAtIndex:", i, v11, v36);
            [v15 addObject:v17];
          }
        }
        context = (void *)v13;
        v18 = -[VNPersonsModelData faceModelUniqueIdentifierOfPersonAtIndex:](self->_modelData, "faceModelUniqueIdentifierOfPersonAtIndex:", v11, v36);
        id v47 = v12;
        id v19 = v18;
        id v20 = v15;
        id v45 = v9;
        v21 = (void *)MEMORY[0x1A6257080]();
        v64[0] = 0;
        v41 = v19;
        uint64_t v22 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v19 requiringSecureCoding:1 error:v64];
        id v44 = v64[0];
        if (v22)
        {
          v43 = v22;
          uint64_t v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithCapacity:0x4000];
          int v63 = [v43 length];
          [v23 appendBytes:&v63 length:4];
          [v23 appendData:v43];
          uint64_t v24 = [v23 length];
          unint64_t v25 = [v20 count];
          if (v25)
          {
            unint64_t v26 = 0;
            uint64_t v27 = 20;
            while (1)
            {
              [v23 setLength:v24];
              if (v27 + v26 > v25) {
                uint64_t v27 = v25 - v26;
              }
              int v62 = v27;
              [v23 appendBytes:&v62 length:4];
              v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", v26, v27);
              uint64_t v56 = 0;
              v57 = &v56;
              uint64_t v58 = 0x3032000000;
              v59 = __Block_byref_object_copy__5449;
              v60 = __Block_byref_object_dispose__5450;
              id v61 = 0;
              uint64_t v52 = 0;
              v53 = &v52;
              uint64_t v54 = 0x2020000000;
              char v55 = 1;
              v48[0] = MEMORY[0x1E4F143A8];
              v48[1] = 3221225472;
              v48[2] = ___ZL39_writeVersion1PersonAndFaceObservationsPU44objcproto9NSCopying8NSObject14NSSecureCoding11objc_objectP7NSArrayIP17VNFaceObservationEP14NSOutputStreamP14CC_MD5state_stPU15__autoreleasingP7NSError_block_invoke;
              v48[3] = &unk_1E5B1C6F0;
              v50 = &v56;
              v51 = &v52;
              id v29 = v23;
              id v49 = v29;
              [v20 enumerateObjectsAtIndexes:v28 options:0 usingBlock:v48];
              if (!*((unsigned char *)v53 + 24)) {
                break;
              }
              unsigned __int8 v30 = VNPersonsModelIOWriteTaggedDataToOutputStream(1227572778, v29, v45, v46, &v47);

              _Block_object_dispose(&v52, 8);
              _Block_object_dispose(&v56, 8);

              v26 += v27;
              if (v26 < v25) {
                unsigned __int8 v31 = v30;
              }
              else {
                unsigned __int8 v31 = 0;
              }
              if ((v31 & 1) == 0) {
                goto LABEL_24;
              }
            }
            id v47 = (id) v57[5];

            _Block_object_dispose(&v52, 8);
            _Block_object_dispose(&v56, 8);

            unsigned __int8 v30 = 0;
          }
          else
          {
            unsigned __int8 v30 = 1;
          }
LABEL_24:

          uint64_t v22 = v43;
          v32 = v44;
        }
        else
        {
          v32 = v44;
          unsigned __int8 v30 = 0;
          id v47 = v44;
        }

        id v33 = v47;
        if ((v30 & 1) == 0) {
          break;
        }
        ++v11;
        int v12 = v33;
        self = v38;
        id v9 = v39;
        if (v11 == v37) {
          goto LABEL_31;
        }
      }
      if (v36)
      {
        id v33 = v33;
        BOOL v34 = 0;
        id *v36 = v33;
      }
      else
      {
        BOOL v34 = 0;
      }
      id v9 = v39;
    }
    else
    {
      id v33 = 0;
LABEL_31:
      BOOL v34 = VNPersonsModelIOWriteTagToOutputStream(1886217324, v9, v46, v36);
    }
  }
  else
  {
    BOOL v34 = 0;
  }

  return v34;
}

- (id)upToDateFaceModelWithCanceller:(id)a3 error:(id *)a4
{
  id v6 = a3;
  faceModel_DO_NOT_ACCESS_DIRECTLY = self->super._faceModel_DO_NOT_ACCESS_DIRECTLY;
  if (!faceModel_DO_NOT_ACCESS_DIRECTLY)
  {
    int v8 = [(VNPersonsModel *)self configuration];
    id v9 = +[VNPersonsModelFaceModelDataSummarization summarizationOfDataFromProvider:self->_modelData];
    id v10 = [v9 description];
    uint64_t v11 = [v10 UTF8String];
    id v12 = [v8 description];
    [v12 UTF8String];
    VNValidatedLog(1, @"Vision building %s with configuration %s", v13, v14, v15, v16, v17, v18, v11);

    id v19 = +[VNPersonsModelFaceModel modelBuiltFromConfiguration:v8 dataProvider:self->_modelData canceller:v6 error:a4];
    id v20 = self->super._faceModel_DO_NOT_ACCESS_DIRECTLY;
    self->super._faceModel_DO_NOT_ACCESS_DIRECTLY = v19;

    faceModel_DO_NOT_ACCESS_DIRECTLY = self->super._faceModel_DO_NOT_ACCESS_DIRECTLY;
  }
  v21 = faceModel_DO_NOT_ACCESS_DIRECTLY;

  return v21;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)VNMutablePersonsModel;
  v3 = [(VNPersonsModel *)&v10 description];
  v4 = (void *)MEMORY[0x1E4F28C10];
  if (self)
  {
    id v5 = [(VNPersonsModelData *)self->_modelData lastModificationDate];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [v4 localizedStringFromDate:v5 dateStyle:1 timeStyle:1];

  id v7 = [v3 stringByAppendingFormat:@" modified on %@", v6];

  if (!self->super._faceModel_DO_NOT_ACCESS_DIRECTLY)
  {
    uint64_t v8 = [v7 stringByAppendingString:@" <dirty>"];

    id v7 = (void *)v8;
  }

  return (NSString *)v7;
}

- (VNMutablePersonsModel)initWithConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [[VNPersonsModelData alloc] initWithConfiguration:v4];
  v9.receiver = self;
  v9.super_class = (Class)VNMutablePersonsModel;
  id v6 = [(VNPersonsModel *)&v9 initWithConfiguration:v4 dataSource:v5];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_modelData, v5);
    [(VNPersonsModelData *)v5 setDelegate:v7];
  }

  return v7;
}

+ (id)newModelFromVersion:(unint64_t)a3 objects:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3 == 1)
  {
    uint64_t v9 = [a1 _version1ModelWithObjects:v8 error:a5];
  }
  else
  {
    v12.receiver = a1;
    v12.super_class = (Class)&OBJC_METACLASS___VNMutablePersonsModel;
    uint64_t v9 = (uint64_t)objc_msgSendSuper2(&v12, sel_newModelFromVersion_objects_error_, a3, v8, a5);
  }
  objc_super v10 = (void *)v9;

  return v10;
}

+ (id)supportedWriteVersions
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VNMutablePersonsModel_supportedWriteVersions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNMutablePersonsModel supportedWriteVersions]::onceToken != -1) {
    dispatch_once(&+[VNMutablePersonsModel supportedWriteVersions]::onceToken, block);
  }
  v2 = (void *)+[VNMutablePersonsModel supportedWriteVersions]::ourSupportedWriteVersions;

  return v2;
}

void __47__VNMutablePersonsModel_supportedWriteVersions__block_invoke(uint64_t a1)
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v2 = [*(id *)(a1 + 32) versionNumbersEncodedInClass:objc_opt_class() withMethodNamePrefix:@"writeVersion" suffix:@"ToOutputStream:options:md5Context:error:"];
  [v6 addIndexes:v2];

  v3 = [*(id *)(a1 + 32) versionNumbersEncodedInClass:objc_opt_class() withMethodNamePrefix:@"writeVersion" suffix:@"ToOutputStream:options:md5Context:error:"];
  [v6 addIndexes:v3];

  uint64_t v4 = [v6 copy];
  id v5 = (void *)+[VNMutablePersonsModel supportedWriteVersions]::ourSupportedWriteVersions;
  +[VNMutablePersonsModel supportedWriteVersions]::ourSupportedWriteVersions = v4;
}

+ (id)_version1ModelWithObjects:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v18 = v6;
  id v7 = [a1 configurationFromLoadedObjects:v6 error:a4];
  if (v7)
  {
    id v8 = (void *)[objc_alloc((Class)a1) initWithConfiguration:v7];
    if (v8)
    {
      uint64_t v9 = [v6 objectForKeyedSubscript:&unk_1EF7A6F08];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      objc_super v10 = [v9 keyEnumerator];
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v20 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            uint64_t v15 = [v9 objectForKey:v14];
            LODWORD(v14) = [v8 addFaceObservations:v15 toPersonWithUniqueIdentifier:v14 error:a4];

            if (!v14)
            {

              id v16 = 0;
              goto LABEL_14;
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }

      id v16 = v8;
LABEL_14:
    }
    else if (a4)
    {
      +[VNError errorForMemoryAllocationFailure];
      id v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

@end