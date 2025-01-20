@interface VNPersonsModelFaceModelVIPv2
+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)modelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6;
+ (shared_ptr<vision::mod::ImageDescriptorBufferFloat32>)_concatenateFaceprintImageDescriptorBuffer:(shared_ptr<vision:(id)a4 :(int)a5 mod:(void *)a6 :(id *)a7 ImageDescriptorBufferFloat32>)a3 withFaceprints:forIdentityWithSerialNumber:faceprintLabels:error:;
- (BOOL)_getSerialNumber:(int *)a3 forPersonUniqueIdentifier:(id)a4 error:(id *)a5;
- (VNPersonsModelFaceModelVIPv2)initWithCoder:(id)a3;
- (VNPersonsModelFaceModelVIPv2)initWithFaceIDModel:(shared_ptr<vision:(unint64_t)a4 :(unint64_t)a5 mod:(id)a6 :FaceIDModel>)a3 faceprintRequestRevision:maximumElementsPerID:personUniqueIdentifierToSerialNumberMapping:;
- (id).cxx_construct;
- (id)_personPredictionsForFace:(id)a3 withDescriptor:(const void *)a4 limit:(unint64_t)a5 faceIDCanceller:(CVMLCanceller *)a6 error:(id *)a7;
- (id)faceCountsForAllPersons;
- (id)faceCountsForPersonsWithUniqueIdentifiers:(id)a3;
- (id)personPredictionsForFace:(id)a3 withDescriptor:(const void *)a4 limit:(unint64_t)a5 canceller:(id)a6 error:(id *)a7;
- (id)personUniqueIdentifiers;
- (id)trainingFaceprintsForPersonWithUniqueIdentifier:(id)a3 error:(id *)a4;
- (unint64_t)faceCountForPersonWithUniqueIdentifier:(id)a3;
- (unint64_t)faceprintRequestRevision;
- (unint64_t)personCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNPersonsModelFaceModelVIPv2

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_faceIDModel.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_cachedPersonUniqueIdentifierToFaceprintCountMapping, 0);

  objc_storeStrong((id *)&self->_serialNumberToPersonUniqueIdentifierMapTable, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:self->_maximumElementsPerID forKey:@"maximumElementsPerID"];
  v5 = (void *)MEMORY[0x1A6257080]([v4 encodeInteger:self->_faceprintRequestRevision forKey:@"faceprintRequestRevision"]);
  v6 = [(NSMapTable *)self->_serialNumberToPersonUniqueIdentifierMapTable dictionaryRepresentation];
  [v4 encodeObject:v6 forKey:@"serialNumberToIdentifier"];

  v7 = (void *)MEMORY[0x1A6257080]();
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__VNPersonsModelFaceModelVIPv2_encodeWithCoder___block_invoke;
  aBlock[3] = &unk_1E5B1FCB8;
  aBlock[4] = self;
  id v8 = v4;
  id v14 = v8;
  v9 = _Block_copy(aBlock);
  id v12 = 0;
  char v10 = VNExecuteBlock(v9, (uint64_t)&v12);
  id v11 = v12;
  if ((v10 & 1) == 0) {
    [v8 failWithError:v11];
  }
}

BOOL __48__VNPersonsModelFaceModelVIPv2_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  VNNSMutableDataStreambuf::VNNSMutableDataStreambuf((VNNSMutableDataStreambuf *)__sb);
  uint64_t v10 = MEMORY[0x1E4FBA458] + 24;
  v11.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E4FBA458] + 64);
  std::ios_base::init(&v11, __sb);
  uint64_t v12 = 0;
  int v13 = -1;
  id v4 = (void *)vision::mod::FaceIDModel::serialize(*(void **)(*(void *)(a1 + 32) + 24));
  if (v4 == 128)
  {
    std::ostream::flush();
    id v5 = v15;
    [*(id *)(a1 + 40) encodeObject:v5 forKey:@"faceIDModel"];
LABEL_5:

    goto LABEL_6;
  }
  if (a2)
  {
    v6 = NSString;
    v7 = [NSNumber numberWithLongLong:v4];
    id v5 = [v6 stringWithFormat:@"Face ID model data serialization failed with code %@", v7, v10];

    id v8 = VNErrorForCVMLStatus(v4);
    *a2 = +[VNError errorForInternalErrorWithLocalizedDescription:v5 underlyingError:v8];

    goto LABEL_5;
  }
LABEL_6:
  std::ostream::~ostream();

  std::streambuf::~streambuf();
  return v4 == 128;
}

- (VNPersonsModelFaceModelVIPv2)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)VNPersonsModelFaceModelVIPv2;
  id v5 = [(VNPersonsModelFaceModelVIPv2 *)&v32 init];
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1A6257080]();
    if (_serialNumberToPersonUniqueIdentifierDictionaryClasses(void)::onceToken != -1) {
      dispatch_once(&_serialNumberToPersonUniqueIdentifierDictionaryClasses(void)::onceToken, &__block_literal_global_106_8120);
    }
    id v8 = [v4 decodeObjectOfClasses:_serialNumberToPersonUniqueIdentifierDictionaryClasses(void)::classes forKey:@"serialNumberToIdentifier"];
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      serialNumberToPersonUniqueIdentifierMapTable = v5->_serialNumberToPersonUniqueIdentifierMapTable;
      v5->_serialNumberToPersonUniqueIdentifierMapTable = (NSMapTable *)v9;

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __46__VNPersonsModelFaceModelVIPv2_initWithCoder___block_invoke;
      v30[3] = &unk_1E5B1FC48;
      v31 = v5;
      [v8 enumerateKeysAndObjectsUsingBlock:v30];
    }
    if (!v8) {
      goto LABEL_18;
    }
    v5->_int maximumElementsPerID = [v4 decodeIntForKey:@"maximumElementsPerID"];
    v5->_faceprintRequestRevision = [v4 decodeIntegerForKey:@"faceprintRequestRevision"];
    int maximumElementsPerID = v5->_maximumElementsPerID;
    id v28 = 0;
    _newFaceIDModel(&v29, maximumElementsPerID, (uint64_t)&v28);
    id v12 = v28;
    p_faceIDModel = &v5->_faceIDModel;
    cntrl = (std::__shared_weak_count *)p_faceIDModel->__cntrl_;
    ptr = v29.__ptr_;
    shared_ptr<vision::mod::FaceIDModel> *p_faceIDModel = v29;
    if (cntrl)
    {
      std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
      if (p_faceIDModel->__ptr_) {
        goto LABEL_9;
      }
    }
    else if (ptr)
    {
LABEL_9:
      v16 = (void *)MEMORY[0x1A6257080]();
      v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceIDModel"];
      v18 = v17;
      if (v17)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __46__VNPersonsModelFaceModelVIPv2_initWithCoder___block_invoke_2;
        aBlock[3] = &unk_1E5B1FCB8;
        id v26 = v17;
        v27 = v6;
        v19 = _Block_copy(aBlock);
        id v24 = 0;
        int v20 = VNExecuteBlock(v19, (uint64_t)&v24);
        id v21 = v24;
        if ((v20 & 1) == 0) {
          [v4 failWithError:v21];
        }
      }
      else
      {
        int v20 = 1;
      }

      if (v20) {
        goto LABEL_17;
      }
LABEL_18:
      v22 = 0;
      goto LABEL_19;
    }
    [v4 failWithError:v12];

    goto LABEL_18;
  }
LABEL_17:
  v22 = v6;
LABEL_19:

  return v22;
}

uint64_t __46__VNPersonsModelFaceModelVIPv2_initWithCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:a3 forKey:a2];
}

BOOL __46__VNPersonsModelFaceModelVIPv2_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  VNNSDataStreambuf::VNNSDataStreambuf((VNNSDataStreambuf *)__sb, *(NSData **)(a1 + 32));
  v11.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E4FBA450] + 64);
  std::ios_base::init(&v11, __sb);
  uint64_t v12 = 0;
  int v13 = -1;
  id v4 = (void *)vision::mod::FaceIDModel::deserialize(*(void *)(*(void *)(a1 + 40) + 24));
  uint64_t v5 = v4;
  if (a2 && v4 != 128)
  {
    v6 = NSString;
    v7 = [NSNumber numberWithLongLong:v4];
    id v8 = [v6 stringWithFormat:@"Face ID model data deserialization failed with code %@", v7];

    uint64_t v9 = VNErrorForCVMLStatus(v4);
    *a2 = +[VNError errorForInternalErrorWithLocalizedDescription:v8 underlyingError:v9];
  }
  std::istream::~istream();

  std::streambuf::~streambuf();
  return v5 == 128;
}

- (id)trainingFaceprintsForPersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  int v21 = 0;
  if ([(VNPersonsModelFaceModelVIPv2 *)self _getSerialNumber:&v21 forPersonUniqueIdentifier:a3 error:a4])
  {
    v19 = 0;
    int v20 = 0;
    IdentityTrainingData = (void *)vision::mod::FaceIDModel::getIdentityTrainingData(self->_faceIDModel.__ptr_, v21, &v19);
    if (IdentityTrainingData == 128)
    {
      v7 = v19;
      uint64_t v8 = *((void *)v19 + 9);
      if (v8)
      {
        uint64_t v9 = *((void *)v19 + 8);
        uint64_t v10 = *((void *)v19 + 12);
        unint64_t v11 = [(VNPersonsModelFaceModelVIPv2 *)self faceprintRequestRevision];
        uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
        for (unint64_t i = 0; i != v8; ++i)
        {
          unint64_t DataForKthDescriptor = vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(v7, i);
          id v15 = [VNFaceprint alloc];
          LODWORD(v16) = 1.0;
          v17 = [(VNFaceprint *)v15 initWithData:DataForKthDescriptor elementCount:v10 elementType:1 lengthInBytes:v9 confidence:v11 requestRevision:v16];
          [v12 addObject:v17];
        }
      }
      else
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else if (a4)
    {
      VNErrorForCVMLStatus(IdentityTrainingData);
      uint64_t v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v12 = 0;
    }
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v20);
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)faceCountsForAllPersons
{
  cachedPersonUniqueIdentifierToFaceprintCountMapping = self->_cachedPersonUniqueIdentifierToFaceprintCountMapping;
  if (!cachedPersonUniqueIdentifierToFaceprintCountMapping)
  {
    id v4 = (void *)MEMORY[0x1A6257080](0, a2);
    ptr = self->_faceIDModel.__ptr_;
    long long v17 = 0u;
    long long v18 = 0u;
    int v19 = 1065353216;
    for (unint64_t i = (uint64_t *)*((void *)ptr + 30); i; unint64_t i = (uint64_t *)*i)
    {
      int v20 = *((_DWORD *)i + 4);
      int v7 = *((_DWORD *)i + 6);
      *((_DWORD *)std::__hash_table<std::__hash_value_type<int,int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)&v17, v20, &v20)+ 5) = v7;
    }
    id v8 = objc_alloc(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = objc_msgSend(v8, "initWithCapacity:", *((void *)&v18 + 1), v17);
    for (j = (uint64_t **)v18; j; j = (uint64_t **)*j)
    {
      unint64_t v11 = [NSNumber numberWithInt:*((unsigned int *)j + 4)];
      uint64_t v12 = [(NSMapTable *)self->_serialNumberToPersonUniqueIdentifierMapTable objectForKey:v11];
      if (v12)
      {
        int v13 = [NSNumber numberWithInt:*((unsigned int *)j + 5)];
        [v9 setObject:v13 forKeyedSubscript:v12];
      }
    }
    id v14 = (NSDictionary *)[v9 copy];
    id v15 = self->_cachedPersonUniqueIdentifierToFaceprintCountMapping;
    self->_cachedPersonUniqueIdentifierToFaceprintCountMapping = v14;

    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::~__hash_table((uint64_t)&v17);
    cachedPersonUniqueIdentifierToFaceprintCountMapping = self->_cachedPersonUniqueIdentifierToFaceprintCountMapping;
  }

  return cachedPersonUniqueIdentifierToFaceprintCountMapping;
}

- (id)faceCountsForPersonsWithUniqueIdentifiers:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v6 = [(VNPersonsModelFaceModelVIPv2 *)self faceCountsForAllPersons];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v14);
        if (v12) {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (unint64_t)faceCountForPersonWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VNPersonsModelFaceModelVIPv2 *)self faceCountsForAllPersons];
  v6 = [v5 objectForKey:v4];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

- (id)personUniqueIdentifiers
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMapTable count](self->_serialNumberToPersonUniqueIdentifierMapTable, "count"));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = [(NSMapTable *)self->_serialNumberToPersonUniqueIdentifierMapTable objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v9 + 1) + 8 * i)];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return v3;
}

- (unint64_t)personCount
{
  return [(NSMapTable *)self->_serialNumberToPersonUniqueIdentifierMapTable count];
}

- (unint64_t)faceprintRequestRevision
{
  return self->_faceprintRequestRevision;
}

- (id)personPredictionsForFace:(id)a3 withDescriptor:(const void *)a4 limit:(unint64_t)a5 canceller:(id)a6 error:(id *)a7
{
  id v12 = a3;
  int v13 = (VNCanceller *)a6;
  if (!v13) {
    int v13 = objc_alloc_init(VNCanceller);
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__19;
  v40 = __Block_byref_object_dispose__20;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__19;
  v34 = __Block_byref_object_dispose__20;
  id v35 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x4012000000;
  v27[3] = __Block_byref_object_copy__8138;
  v27[4] = __Block_byref_object_dispose__8139;
  v27[5] = "";
  v27[6] = &unk_1EF752200;
  int v29 = -1;
  char v28 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__VNPersonsModelFaceModelVIPv2_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke;
  v20[3] = &unk_1E5B1FC20;
  v22 = &v36;
  v20[4] = self;
  id v14 = v12;
  v25 = a4;
  unint64_t v26 = a5;
  id v21 = v14;
  v23 = v27;
  id v24 = &v30;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__VNPersonsModelFaceModelVIPv2_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke_2;
  v19[3] = &unk_1E5B20220;
  v19[4] = v27;
  if ([(VNCanceller *)v13 tryToPerformBlock:v20 usingSignallingBlock:v19])
  {
    long long v15 = (void *)v37[5];
    if (v15)
    {
      id v16 = v15;
      goto LABEL_12;
    }
    if (a7)
    {
      id v17 = (id) v31[5];
      goto LABEL_10;
    }
  }
  else if (a7)
  {
    VNPersonsModelErrorCancelledOperation();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    id v16 = 0;
    *a7 = v17;
    goto LABEL_12;
  }
  id v16 = 0;
LABEL_12:

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);

  return v16;
}

void __94__VNPersonsModelFaceModelVIPv2_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[9];
  uint64_t v5 = a1[10];
  uint64_t v6 = *(void *)(a1[7] + 8) + 48;
  uint64_t v7 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v2 _personPredictionsForFace:v3 withDescriptor:v4 limit:v5 faceIDCanceller:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(a1[6] + 8);
  long long v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

uint64_t __94__VNPersonsModelFaceModelVIPv2_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 56) = 1;
  return result;
}

- (id)_personPredictionsForFace:(id)a3 withDescriptor:(const void *)a4 limit:(unint64_t)a5 faceIDCanceller:(CVMLCanceller *)a6 error:(id *)a7
{
  id v29 = a3;
  if ([(NSMapTable *)self->_serialNumberToPersonUniqueIdentifierMapTable count])
  {
    uint64_t v32 = 0;
    v33 = 0;
    uint64_t v34 = 0;
    long long v11 = (void *)vision::mod::FaceIDModel::predict((uint64_t)self->_faceIDModel.__ptr_, a4, (uint64_t *)&v32);
    if (v11 == 128)
    {
      char v28 = a7;
      id v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * (v33 - v32)];
      int v13 = v32;
      v27 = v33;
      if (v32 == v33)
      {
LABEL_14:
        [v12 sortUsingComparator:&__block_literal_global_8144];
        if (a5)
        {
          unint64_t v24 = [v12 count];
          if (v24 > a5) {
            objc_msgSend(v12, "removeObjectsInRange:", a5, v24 - a5);
          }
        }
        id v25 = v12;
      }
      else
      {
        while (1)
        {
          std::map<int,double>::map[abi:ne180100]((uint64_t)&v30, v13);
          id v14 = v30;
          if (v30 != (void **)v31) {
            break;
          }
LABEL_13:
          std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v31[0]);
          v13 += 3;
          if (v13 == v27) {
            goto LABEL_14;
          }
        }
        while (1)
        {
          long long v15 = [NSNumber numberWithInt:*((unsigned int *)v14 + 8)];
          id v16 = [(NSMapTable *)self->_serialNumberToPersonUniqueIdentifierMapTable objectForKey:v15];
          if (!v16) {
            break;
          }
          double v17 = *((double *)v14 + 5);
          long long v18 = [VNPersonsModelPrediction alloc];
          *(float *)&double v19 = v17;
          int v20 = [(VNPersonsModelPrediction *)v18 initWithFaceObservation:v29 predictedPersonUniqueIdentifier:v16 confidence:v19];
          if (!v20)
          {
            if (v28)
            {
              *char v28 = +[VNError errorForMemoryAllocationFailure];
            }
            goto LABEL_26;
          }
          [v12 addObject:v20];

          id v21 = (void **)v14[1];
          if (v21)
          {
            do
            {
              v22 = v21;
              id v21 = (void **)*v21;
            }
            while (v21);
          }
          else
          {
            do
            {
              v22 = (void **)v14[2];
              BOOL v23 = *v22 == v14;
              id v14 = v22;
            }
            while (!v23);
          }
          id v14 = v22;
          if (v22 == (void **)v31) {
            goto LABEL_13;
          }
        }
        if (!v28) {
          goto LABEL_27;
        }
        id v16 = [NSString stringWithFormat:@"A prediction for an unknown identity with serial number %@ and confidence %f was provided", v15, v14[5]];
        *char v28 = +[VNError errorForInternalErrorWithLocalizedDescription:v16];
LABEL_26:

LABEL_27:
        std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v31[0]);
        id v25 = 0;
      }
    }
    else if (a7)
    {
      VNErrorForCVMLStatus(v11);
      id v25 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v25 = 0;
    }
    uint64_t v30 = (void **)&v32;
    std::vector<std::map<int,double>>::__destroy_vector::operator()[abi:ne180100](&v30);
  }
  else
  {
    id v25 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v25;
}

uint64_t __101__VNPersonsModelFaceModelVIPv2__personPredictionsForFace_withDescriptor_limit_faceIDCanceller_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  [v4 confidence];
  float v7 = v6;
  [v5 confidence];
  if (v7 <= v8)
  {
    if (v7 < v8)
    {
      uint64_t v9 = 1;
    }
    else
    {
      long long v10 = [v4 predictedPersonUniqueIdentifier];
      long long v11 = [v10 description];

      id v12 = [v5 predictedPersonUniqueIdentifier];
      int v13 = [v12 description];

      uint64_t v9 = [v11 compare:v13];
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (BOOL)_getSerialNumber:(int *)a3 forPersonUniqueIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  float v8 = [(NSMapTable *)self->_serialNumberToPersonUniqueIdentifierMapTable keyEnumerator];
  double v17 = a3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        int v13 = [(NSMapTable *)self->_serialNumberToPersonUniqueIdentifierMapTable objectForKey:v12];
        int v14 = [v13 isEqual:v7];

        if (v14)
        {
          int *v17 = [v12 intValue];

          BOOL v15 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (a5)
  {
    VNPersonsModelErrorForUnknownPersonUniqueIdentifier((uint64_t)v7);
    BOOL v15 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_12:

  return v15;
}

- (VNPersonsModelFaceModelVIPv2)initWithFaceIDModel:(shared_ptr<vision:(unint64_t)a4 :(unint64_t)a5 mod:(id)a6 :FaceIDModel>)a3 faceprintRequestRevision:maximumElementsPerID:personUniqueIdentifierToSerialNumberMapping:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  id v10 = (id)a5;
  +[VNError VNAssert:a4 >> 31 == 0 log:@"maximumElementsPerID should be less or equal than INT32_MAX"];
  v23.receiver = self;
  v23.super_class = (Class)VNPersonsModelFaceModelVIPv2;
  long long v11 = [(VNPersonsModelFaceModelVIPv2 *)&v23 init];
  id v12 = v11;
  if (v11)
  {
    p_faceIDModel = &v11->_faceIDModel;
    BOOL v15 = *(FaceIDModel **)ptr;
    uint64_t v14 = *((void *)ptr + 1);
    if (v14) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
    }
    id v16 = (std::__shared_weak_count *)v11->_faceIDModel.__cntrl_;
    p_faceIDModel->__ptr_ = v15;
    p_faceIDModel->__cntrl_ = (__shared_weak_count *)v14;
    if (v16) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v16);
    }
    v12->_faceprintRequestRevision = (unint64_t)cntrl;
    int v17 = 0x7FFFFFFF;
    if (a4 < 0x7FFFFFFF) {
      int v17 = a4;
    }
    v12->_int maximumElementsPerID = v17;
    uint64_t v18 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    serialNumberToPersonUniqueIdentifierMapTable = v12->_serialNumberToPersonUniqueIdentifierMapTable;
    v12->_serialNumberToPersonUniqueIdentifierMapTable = (NSMapTable *)v18;

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __142__VNPersonsModelFaceModelVIPv2_initWithFaceIDModel_faceprintRequestRevision_maximumElementsPerID_personUniqueIdentifierToSerialNumberMapping___block_invoke;
    v21[3] = &unk_1E5B1FBD8;
    long long v22 = v12;
    [v10 enumerateKeysAndObjectsUsingBlock:v21];
  }
  return v12;
}

uint64_t __142__VNPersonsModelFaceModelVIPv2_initWithFaceIDModel_faceprintRequestRevision_maximumElementsPerID_personUniqueIdentifierToSerialNumberMapping___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:a2 forKey:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5
{
  *a3 = 1919895117;
  return 1;
}

+ (id)modelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6
{
  id v34 = a3;
  id v39 = a4;
  v33 = (VNCanceller *)a5;
  uint64_t v8 = [v39 faceModelPersonsCount];
  v70 = 0;
  v71 = 0;
  uint64_t v72 = 0;
  v37 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v8];
  if (!v8)
  {
    uint64_t v35 = 0;
    long long v21 = 0;
    uint64_t v9 = 0;
LABEL_21:
    int v22 = [v34 faceID2ModelMaximumElementsPerID];
    objc_super v23 = v33;
    _newFaceIDModel(&v65, v22, (uint64_t)a6);
    uint64_t v24 = v65;
    if (!v65) {
      goto LABEL_51;
    }
    if (v35)
    {
      if (!v33) {
        objc_super v23 = objc_alloc_init(VNCanceller);
      }
      uint64_t v56 = 0;
      v57 = (std::__shared_weak_count *)&v56;
      uint64_t v58 = 0x4012000000;
      v59 = __Block_byref_object_copy__8138;
      v60 = __Block_byref_object_dispose__8139;
      v61 = "";
      v62 = &unk_1EF752200;
      int v64 = -1;
      char v63 = 0;
      uint64_t v50 = 0;
      v51 = &v50;
      uint64_t v52 = 0x3032000000;
      v53 = __Block_byref_object_copy__19;
      v54 = __Block_byref_object_dispose__20;
      id v55 = 0;
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3321888768;
      v43[2] = __89__VNPersonsModelFaceModelVIPv2_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke;
      v43[3] = &unk_1EF754140;
      v43[6] = v24;
      v44 = v66;
      if (v66) {
        atomic_fetch_add_explicit(&v66->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v45 = v35;
      v46 = v21;
      if (v21) {
        atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      __p = 0;
      v48 = 0;
      uint64_t v49 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, v70, (uint64_t)v71, (v71 - (unsigned char *)v70) >> 2);
      v43[4] = &v56;
      v43[5] = &v50;
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __89__VNPersonsModelFaceModelVIPv2_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_22;
      v42[3] = &unk_1E5B20220;
      v42[4] = &v56;
      if (![(VNCanceller *)v23 tryToPerformBlock:v43 usingSignallingBlock:v42])
      {
        if (a6)
        {
          VNPersonsModelErrorCancelledOperation();
          id v26 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_43;
        }
LABEL_44:
        if (__p)
        {
          v48 = __p;
          operator delete(__p);
        }
        if (v46) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v46);
        }
        if (v44) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v44);
        }
        _Block_object_dispose(&v50, 8);

        _Block_object_dispose(&v56, 8);
LABEL_51:
        char v28 = 0;
LABEL_63:
        if (v66) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v66);
        }
        goto LABEL_65;
      }
      id v25 = (void *)v51[5];
      if (v25)
      {
        if (a6)
        {
          id v26 = v25;
LABEL_43:
          *a6 = v26;
          goto LABEL_44;
        }
        goto LABEL_44;
      }
      if (__p)
      {
        v48 = __p;
        operator delete(__p);
      }
      if (v46) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v46);
      }
      if (v44) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v44);
      }
      _Block_object_dispose(&v50, 8);

      _Block_object_dispose(&v56, 8);
    }
    id v29 = objc_alloc((Class)a1);
    uint64_t v40 = v24;
    id v41 = v66;
    if (v66) {
      atomic_fetch_add_explicit(&v66->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    char v28 = (void *)[v29 initWithFaceIDModel:&v40 faceprintRequestRevision:v9 maximumElementsPerID:v22 personUniqueIdentifierToSerialNumberMapping:v37];
    if (v41) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v41);
    }
    goto LABEL_63;
  }
  uint64_t v31 = v8;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  long long v11 = 0;
  uint64_t v35 = 0;
  while (1)
  {
    uint64_t v38 = [v39 faceModelUniqueIdentifierOfPersonAtIndex:v10];
    id v12 = [NSNumber numberWithInt:(v10 + 1)];
    [v37 setObject:v12 forKeyedSubscript:v38];

    uint64_t v13 = [v39 faceModelNumberOfFaceObservationsForPersonAtIndex:v10];
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v13];
    if (v13) {
      break;
    }
LABEL_8:
    if ([v14 count])
    {
      long long v20 = (void *)MEMORY[0x1A6257080]();
      uint64_t v67 = v35;
      v68 = v11;
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [a1 _concatenateFaceprintImageDescriptorBuffer:&v67 withFaceprints:v14 forIdentityWithSerialNumber:(v10 + 1) faceprintLabels:&v70 error:a6];
      long long v21 = v57;
      uint64_t v35 = v56;
      uint64_t v56 = 0;
      v57 = 0;
      if (v11) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v11);
      }
      if (v68) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v68);
      }
      if (!v35) {
        goto LABEL_40;
      }
    }
    else
    {
      long long v21 = v11;
    }

    ++v10;
    long long v11 = v21;
    if (v10 == v31) {
      goto LABEL_21;
    }
  }
  uint64_t v15 = 0;
  while (1)
  {
    id v16 = [v39 faceModelFaceObservationAtIndex:v15 forPersonAtIndex:v10];
    int v17 = v16;
    if (!v16) {
      break;
    }
    id v69 = 0;
    uint64_t v18 = [v16 VNPersonsModelFaceprintWithRequestRevision:v9 error:&v69];
    id v19 = v69;
    if (!v18)
    {
      if (a6)
      {
        v27 = [NSString stringWithFormat:@"mismatched faceprint request revision for observation at index %lu, person at index %lu", v15, v10];
        *a6 = +[VNError errorForInvalidModelWithLocalizedDescription:v27 underlyingError:v19];
      }
      goto LABEL_38;
    }
    uint64_t v9 = [v18 requestRevision];
    [v14 addObject:v18];

    if (v13 == ++v15) {
      goto LABEL_8;
    }
  }
  if (!a6) {
    goto LABEL_39;
  }
  int v17 = objc_msgSend(NSString, "stringWithFormat:", @"invalid face observation at index %lu for person at index %lu", v15, v10);
  *a6 = +[VNError errorForInvalidModelWithLocalizedDescription:v17];
LABEL_38:

LABEL_39:
  long long v21 = v11;
LABEL_40:

  char v28 = 0;
  objc_super v23 = v33;
LABEL_65:

  if (v70)
  {
    v71 = v70;
    operator delete(v70);
  }
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v21);
  }

  return v28;
}

void *__89__VNPersonsModelFaceModelVIPv2_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke(uint64_t a1)
{
  result = (void *)vision::mod::FaceIDModel::buildModel(*(void *)(a1 + 48), *(void **)(a1 + 64), (void *)(a1 + 80), *(void *)(*(void *)(a1 + 32) + 8) + 48);
  if (result != 128)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = VNErrorForCVMLStatus(result);
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

uint64_t __89__VNPersonsModelFaceModelVIPv2_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_22(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 56) = 1;
  return result;
}

+ (shared_ptr<vision::mod::ImageDescriptorBufferFloat32>)_concatenateFaceprintImageDescriptorBuffer:(shared_ptr<vision:(id)a4 :(int)a5 mod:(void *)a6 :(id *)a7 ImageDescriptorBufferFloat32>)a3 withFaceprints:forIdentityWithSerialNumber:faceprintLabels:error:
{
  uint64_t v9 = *(void *)&a5;
  int v45 = (int)a4;
  var0 = a3.var0;
  v43 = v7;
  v46 = a3.var1;
  long long v11 = [(__shared_weak_count *)v46 firstObject];
  v44 = v11;
  uint64_t v12 = [v11 lengthInBytes];
  size_t v13 = v12;
  uint64_t v14 = *(vision::mod::ImageDescriptorBufferAbstract **)var0;
  if (!*(void *)var0)
  {
    int v17 = operator new(8uLL);
    void *v17 = 1;
    v48[1] = v17 + 1;
    v48[2] = v17 + 1;
    v48[0] = v17;
    uint64_t v18 = malloc_type_malloc(v13, 0x9A450019uLL);
    std::allocate_shared[abi:ne180100]<vision::mod::ImageDescriptorBufferFloat32,std::allocator<vision::mod::ImageDescriptorBufferFloat32>,std::vector<long long> &,void *,unsigned long,int,BOOL,void>((uint64_t *)&v47, v48, v18, v13, 1, 1);
    id v19 = (std::__shared_weak_count *)*((void *)var0 + 1);
    *(_OWORD *)var0 = v47;
    if (v19) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v19);
    }
    operator delete(v17);
    int v16 = 0;
    goto LABEL_7;
  }
  uint64_t v15 = *((void *)v14 + 8);
  if (v15 == v12)
  {
    int v16 = *((_DWORD *)v14 + 18);
LABEL_7:
    uint64_t v20 = [(__shared_weak_count *)v46 count];
    unint64_t v21 = v20 + v16;
    vision::mod::ImageDescriptorBufferAbstract::resizeForDescriptorsCount(*(vision::mod::ImageDescriptorBufferAbstract **)var0, v21, v16 > 0);
    std::vector<long long>::resize((char **)(*(void *)var0 + 8), v21);
    if (v20)
    {
      uint64_t v22 = 0;
      unint64_t v23 = v16;
      do
      {
        uint64_t v24 = [(__shared_weak_count *)v46 objectAtIndexedSubscript:v22];
        id v25 = [v24 descriptorData];
        unint64_t DataForKthDescriptor = (void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)var0, v23);
        id v27 = v25;
        memcpy(DataForKthDescriptor, (const void *)[v27 bytes], v13);
        vision::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)var0, v23, v45);
        id v29 = *(_DWORD **)(v9 + 8);
        unint64_t v28 = *(void *)(v9 + 16);
        if ((unint64_t)v29 >= v28)
        {
          uint64_t v31 = *(_DWORD **)v9;
          uint64_t v32 = ((uint64_t)v29 - *(void *)v9) >> 2;
          unint64_t v33 = v32 + 1;
          if ((unint64_t)(v32 + 1) >> 62) {
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v34 = v28 - (void)v31;
          if (v34 >> 1 > v33) {
            unint64_t v33 = v34 >> 1;
          }
          BOOL v35 = (unint64_t)v34 >= 0x7FFFFFFFFFFFFFFCLL;
          unint64_t v36 = 0x3FFFFFFFFFFFFFFFLL;
          if (!v35) {
            unint64_t v36 = v33;
          }
          if (v36)
          {
            unint64_t v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v36);
            uint64_t v31 = *(_DWORD **)v9;
            id v29 = *(_DWORD **)(v9 + 8);
          }
          else
          {
            uint64_t v37 = 0;
          }
          uint64_t v38 = (_DWORD *)(v36 + 4 * v32);
          *uint64_t v38 = v45;
          uint64_t v30 = v38 + 1;
          while (v29 != v31)
          {
            int v39 = *--v29;
            *--uint64_t v38 = v39;
          }
          *(void *)uint64_t v9 = v38;
          *(void *)(v9 + 8) = v30;
          *(void *)(v9 + 16) = v36 + 4 * v37;
          if (v31) {
            operator delete(v31);
          }
        }
        else
        {
          *id v29 = v45;
          uint64_t v30 = v29 + 1;
        }
        *(void *)(v9 + 8) = v30;
        ++v23;

        ++v22;
        long long v11 = v44;
      }
      while (v22 != v20);
    }
    *(_OWORD *)v43 = *(_OWORD *)var0;
    goto LABEL_29;
  }
  if (a6)
  {
    uint64_t v40 = objc_msgSend([NSString alloc], "initWithFormat:", @"The model is expecting a faceprint size of %lu instead of %lu", v15, v12);
    VNPersonsModelErrorForIncompatibleFaceprint(v40);
    *(void *)a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  var0 = v43;
LABEL_29:
  *(void *)var0 = 0;
  *((void *)var0 + 1) = 0;

  result.var1 = v42;
  result.var0 = v41;
  return result;
}

@end