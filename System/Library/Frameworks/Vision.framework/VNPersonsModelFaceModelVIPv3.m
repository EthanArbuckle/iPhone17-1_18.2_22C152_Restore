@interface VNPersonsModelFaceModelVIPv3
+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)modelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6;
+ (shared_ptr<vision::mod::ImageDescriptorBufferFloat32>)_concatenateFaceprintImageDescriptorBuffer:(shared_ptr<vision:(id)a4 :(int)a5 mod:(void *)a6 :ImageDescriptorBufferFloat32>)a3 withFaceprints:forIdentityWithSerialNumber:faceprintLabels:;
- (BOOL)_getSerialNumber:(int *)a3 forPersonUniqueIdentifier:(id)a4 error:(id *)a5;
- (VNPersonsModelFaceModelVIPv3)initWithCoder:(id)a3;
- (VNPersonsModelFaceModelVIPv3)initWithFaceIDModel:(shared_ptr<vision:(unint64_t)a4 :(id)a5 mod::FaceID3Model>)a3 faceprintRequestRevision:personUniqueIdentifierToSerialNumberMapping:;
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

@implementation VNPersonsModelFaceModelVIPv3

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_faceIDModel.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }

  objc_storeStrong((id *)&self->_serialNumberToPersonUniqueIdentifierMapTable, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1A6257080]([v4 encodeInteger:self->_faceprintRequestRevision forKey:@"faceprintRequestRevision"]);
  v6 = [(NSMapTable *)self->_serialNumberToPersonUniqueIdentifierMapTable dictionaryRepresentation];
  [v4 encodeObject:v6 forKey:@"serialNumberToIdentifier"];

  v7 = (void *)MEMORY[0x1A6257080]();
  VNNSMutableDataStreambuf::VNNSMutableDataStreambuf((VNNSMutableDataStreambuf *)__sb);
  uint64_t v12 = MEMORY[0x1E4FBA458] + 24;
  v13.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E4FBA458] + 64);
  std::ios_base::init(&v13, __sb);
  uint64_t v14 = 0;
  int v15 = -1;
  uint64_t v8 = vision::mod::FaceID3Model::serialize(self->_faceIDModel.__ptr_);
  if (v8 != 128)
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    v10 = [NSNumber numberWithLongLong:v8];
    [v9 raise:*MEMORY[0x1E4F1C4A0], @"unable to serialize the face ID model (status = %@)", v10, v12 format];
  }
  std::ostream::flush();
  id v11 = v17;
  [v4 encodeObject:v11 forKey:@"faceIDModel"];

  std::ostream::~ostream();
  std::streambuf::~streambuf();
}

- (VNPersonsModelFaceModelVIPv3)initWithCoder:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)VNPersonsModelFaceModelVIPv3;
  v5 = [(VNPersonsModelFaceModelVIPv3 *)&v34 init];
  v6 = v5;
  if (!v5) {
    goto LABEL_16;
  }
  v7 = (void *)MEMORY[0x1A6257080]();
  if (_serialNumberToPersonUniqueIdentifierDictionaryClasses(void)::onceToken != -1) {
    dispatch_once(&_serialNumberToPersonUniqueIdentifierDictionaryClasses(void)::onceToken, &__block_literal_global_98_35468);
  }
  uint64_t v8 = [v4 decodeObjectOfClasses:_serialNumberToPersonUniqueIdentifierDictionaryClasses(void)::classes forKey:@"serialNumberToIdentifier"];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    serialNumberToPersonUniqueIdentifierMapTable = v5->_serialNumberToPersonUniqueIdentifierMapTable;
    v5->_serialNumberToPersonUniqueIdentifierMapTable = (NSMapTable *)v9;

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __46__VNPersonsModelFaceModelVIPv3_initWithCoder___block_invoke;
    v32[3] = &unk_1E5B1FC48;
    v33 = v5;
    [v8 enumerateKeysAndObjectsUsingBlock:v32];
  }
  if (!v8) {
    goto LABEL_17;
  }
  v5->_faceprintRequestRevision = [v4 decodeIntegerForKey:@"faceprintRequestRevision"];
  id v11 = (void *)MEMORY[0x1A6257080]();
  uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceIDModel"];
  if (!v12) {
    goto LABEL_13;
  }
  VNNSDataStreambuf::VNNSDataStreambuf((VNNSDataStreambuf *)__sb, v12);
  v26[0] = MEMORY[0x1E4FBA450] + 24;
  v26[1] = 0;
  v27.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E4FBA450] + 64);
  std::ios_base::init(&v27, __sb);
  uint64_t v28 = 0;
  int v29 = -1;
  v24 = 0;
  uint64_t v25 = 11125;
  vision::mod::FaceID3Model::deserialize(&v23, (uint64_t)v26, &v25);
  std::ios_base v13 = v23;
  v24 = v23;
  if (v23)
  {
    std::shared_ptr<vision::mod::FaceID3Model>::operator=[abi:ne180100]<vision::mod::FaceID3Model,std::default_delete<vision::mod::FaceID3Model>,void>((uint64_t)&v5->_faceIDModel, &v24);
    if (v24)
    {
      vision::mod::FaceID3Model::~FaceID3Model(v24);
      MEMORY[0x1A62562C0]();
    }
  }
  else
  {
    uint64_t v14 = NSString;
    int v15 = (void *)v25;
    v16 = [NSNumber numberWithLongLong:v25];
    id v17 = [v14 stringWithFormat:@"Face ID model data deserialization failed with code %@", v16];

    v18 = VNErrorForCVMLStatus(v15);
    v19 = +[VNError errorForInternalErrorWithLocalizedDescription:v17 underlyingError:v18];
    [v4 failWithError:v19];
  }
  std::istream::~istream();

  std::streambuf::~streambuf();
  if (!v13) {
    int v20 = 0;
  }
  else {
LABEL_13:
  }
    int v20 = 1;

  if (v20) {
LABEL_16:
  }
    v21 = v6;
  else {
LABEL_17:
  }
    v21 = 0;

  return v21;
}

uint64_t __46__VNPersonsModelFaceModelVIPv3_initWithCoder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:a3 forKey:a2];
}

- (id)trainingFaceprintsForPersonWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  LODWORD(v21) = 0;
  if (![(VNPersonsModelFaceModelVIPv3 *)self _getSerialNumber:&v21 forPersonUniqueIdentifier:v6 error:a4])
  {
LABEL_10:
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  id v20 = (id)-38;
  vision::mod::FaceID3Model::getIdentityTrainingData((vision::mod::FaceID3Model *)&v19, (vision::mod::FaceID3Model *)self->_faceIDModel.__ptr_, (uint64_t *)v21, (uint64_t *)&v20);
  v7 = v19;
  if (!v19)
  {
    if (a4)
    {
      VNErrorForCVMLStatus(v20);
      uint64_t v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  uint64_t v8 = *((void *)v19 + 9);
  if (!v8)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_12:
    (*(void (**)(vision::mod::ImageDescriptorBufferAbstract *))(*(void *)v7 + 8))(v7);
    goto LABEL_13;
  }
  uint64_t v9 = *((void *)v19 + 8);
  uint64_t v10 = *((void *)v19 + 12);
  unint64_t v11 = [(VNPersonsModelFaceModelVIPv3 *)self faceprintRequestRevision];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v8];
  for (unint64_t i = 0; i != v8; ++i)
  {
    unint64_t DataForKthDescriptor = vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(v7, i);
    int v15 = [VNFaceprint alloc];
    LODWORD(v16) = 1.0;
    id v17 = [(VNFaceprint *)v15 initWithData:DataForKthDescriptor elementCount:v10 elementType:1 lengthInBytes:v9 confidence:v11 requestRevision:v16];
    [v12 addObject:v17];
  }
  if (v7) {
    goto LABEL_12;
  }
LABEL_13:

  return v12;
}

- (id)faceCountsForAllPersons
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)faceCountsForPersonsWithUniqueIdentifiers:(id)a3
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (unint64_t)faceCountForPersonWithUniqueIdentifier:(id)a3
{
  return 0;
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
  std::ios_base v13 = (VNCanceller *)a6;
  if (!v13) {
    std::ios_base v13 = objc_alloc_init(VNCanceller);
  }
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__17;
  v40 = __Block_byref_object_dispose__18;
  id v41 = 0;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__17;
  objc_super v34 = __Block_byref_object_dispose__18;
  id v35 = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x4012000000;
  v27[3] = __Block_byref_object_copy__35495;
  v27[4] = __Block_byref_object_dispose__35496;
  v27[5] = "";
  v27[6] = &unk_1EF752200;
  int v29 = -1;
  char v28 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __94__VNPersonsModelFaceModelVIPv3_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke;
  v20[3] = &unk_1E5B1FC20;
  v22 = &v36;
  v20[4] = self;
  id v14 = v12;
  uint64_t v25 = a4;
  unint64_t v26 = a5;
  id v21 = v14;
  v23 = v27;
  v24 = &v30;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __94__VNPersonsModelFaceModelVIPv3_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke_2;
  v19[3] = &unk_1E5B20220;
  v19[4] = v27;
  if ([(VNCanceller *)v13 tryToPerformBlock:v20 usingSignallingBlock:v19])
  {
    int v15 = (void *)v37[5];
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

void __94__VNPersonsModelFaceModelVIPv3_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke(void *a1)
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

uint64_t __94__VNPersonsModelFaceModelVIPv3_personPredictionsForFace_withDescriptor_limit_canceller_error___block_invoke_2(uint64_t result)
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
    long long v11 = (void *)vision::mod::FaceID3Model::predict((uint64_t)self->_faceIDModel.__ptr_, (uint64_t)a4, (uint64_t *)&v32);
    if (v11 == 128)
    {
      char v28 = a7;
      id v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * (v33 - v32)];
      std::ios_base v13 = v32;
      std::ios_base v27 = v33;
      if (v32 == v33)
      {
LABEL_14:
        [v12 sortWithOptions:16 usingComparator:&__block_literal_global_35500];
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
          int v15 = [NSNumber numberWithInt:*((unsigned int *)v14 + 8)];
          id v16 = [(NSMapTable *)self->_serialNumberToPersonUniqueIdentifierMapTable objectForKey:v15];
          if (!v16) {
            break;
          }
          double v17 = *((double *)v14 + 5);
          v18 = [VNPersonsModelPrediction alloc];
          *(float *)&double v19 = v17;
          id v20 = [(VNPersonsModelPrediction *)v18 initWithFaceObservation:v29 predictedPersonUniqueIdentifier:v16 confidence:v19];
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

uint64_t __101__VNPersonsModelFaceModelVIPv3__personPredictionsForFace_withDescriptor_limit_faceIDCanceller_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  [a2 confidence];
  float v6 = v5;
  [v4 confidence];
  if (v6 > v7) {
    uint64_t v8 = -1;
  }
  else {
    uint64_t v8 = v6 < v7;
  }

  return v8;
}

- (BOOL)_getSerialNumber:(int *)a3 forPersonUniqueIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v8 = [(NSMapTable *)self->_serialNumberToPersonUniqueIdentifierMapTable keyEnumerator];
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
        std::ios_base v13 = [(NSMapTable *)self->_serialNumberToPersonUniqueIdentifierMapTable objectForKey:v12];
        int v14 = [v13 isEqual:v7];

        if (v14)
        {
          *double v17 = [v12 intValue];

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

- (VNPersonsModelFaceModelVIPv3)initWithFaceIDModel:(shared_ptr<vision:(unint64_t)a4 :(id)a5 mod::FaceID3Model>)a3 faceprintRequestRevision:personUniqueIdentifierToSerialNumberMapping:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  id v8 = (id)a4;
  v20.receiver = self;
  v20.super_class = (Class)VNPersonsModelFaceModelVIPv3;
  uint64_t v9 = [(VNPersonsModelFaceModelVIPv3 *)&v20 init];
  uint64_t v10 = v9;
  if (v9)
  {
    p_faceIDModel = &v9->_faceIDModel;
    std::ios_base v13 = *(FaceID3Model **)ptr;
    uint64_t v12 = *((void *)ptr + 1);
    if (v12) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
    }
    int v14 = (std::__shared_weak_count *)v9->_faceIDModel.__cntrl_;
    p_faceIDModel->__ptr_ = v13;
    p_faceIDModel->__cntrl_ = (__shared_weak_count *)v12;
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v14);
    }
    v10->_faceprintRequestRevision = (unint64_t)cntrl;
    uint64_t v15 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    serialNumberToPersonUniqueIdentifierMapTable = v10->_serialNumberToPersonUniqueIdentifierMapTable;
    v10->_serialNumberToPersonUniqueIdentifierMapTable = (NSMapTable *)v15;

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __121__VNPersonsModelFaceModelVIPv3_initWithFaceIDModel_faceprintRequestRevision_personUniqueIdentifierToSerialNumberMapping___block_invoke;
    v18[3] = &unk_1E5B1FBD8;
    long long v19 = v10;
    [v8 enumerateKeysAndObjectsUsingBlock:v18];
  }
  return v10;
}

uint64_t __121__VNPersonsModelFaceModelVIPv3_initWithFaceIDModel_faceprintRequestRevision_personUniqueIdentifierToSerialNumberMapping___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:a2 forKey:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5
{
  *a3 = 1919895091;
  return 1;
}

+ (id)modelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6
{
  id v42 = a3;
  id v47 = a4;
  id v41 = (VNCanceller *)a5;
  uint64_t v8 = [v47 faceModelPersonsCount];
  v61 = 0;
  v62 = 0;
  uint64_t v63 = 0;
  v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v8];
  if (!v8)
  {
    uint64_t v12 = 0;
    BOOL v23 = 0;
    uint64_t v9 = 0;
LABEL_18:
    id v24 = v42;
    unsigned int v25 = [v24 faceID3ModelMaximumIDs];
    unsigned int v26 = [v24 faceID3ModelMaximumElementsPerID];
    int v27 = [v24 faceID3ModelSeed];
    int v28 = [v24 faceID3IndexMode];
    uint64_t v72 = 0;
    v73 = (std::__shared_weak_count *)&v72;
    uint64_t v74 = 0x4012000000;
    v75 = __Block_byref_object_copy__90;
    v76 = __Block_byref_object_dispose__91;
    v77 = "";
    v78 = 0;
    v79 = 0;
    uint64_t aBlock = MEMORY[0x1E4F143A8];
    p_uint64_t aBlock = 3221225472;
    uint64_t v66 = (uint64_t)___ZL15_newFaceIDModelP27VNPersonsModelConfigurationPU15__autoreleasingP7NSError_block_invoke;
    v67 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5B1FC70;
    v68 = (void (*)(uint64_t))&v72;
    id v69 = (id)__PAIR64__(v25, v26);
    int v70 = v27;
    int v71 = v28;
    id v29 = _Block_copy(&aBlock);
    uint64_t v30 = v41;
    if (VNExecuteBlock(v29, (uint64_t)a6))
    {
      id v31 = v73[2].__vftable;
      shared_owners = (std::__shared_weak_count *)v73[2].__shared_owners_;
      if (shared_owners) {
        atomic_fetch_add_explicit(&shared_owners->__shared_owners_, 1uLL, memory_order_relaxed);
      }
    }
    else
    {
      id v31 = 0;
      shared_owners = 0;
    }

    _Block_object_dispose(&v72, 8);
    if (v79) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v79);
    }

    if (!v31) {
      goto LABEL_53;
    }
    if (v12)
    {
      if (!v41) {
        uint64_t v30 = objc_alloc_init(VNCanceller);
      }
      uint64_t v72 = 0;
      v73 = (std::__shared_weak_count *)&v72;
      uint64_t v74 = 0x4012000000;
      v75 = __Block_byref_object_copy__35495;
      v76 = (void (*)(uint64_t))__Block_byref_object_dispose__35496;
      v77 = "";
      v78 = &unk_1EF752200;
      HIDWORD(v79) = -1;
      LOBYTE(v79) = 0;
      uint64_t aBlock = 0;
      p_uint64_t aBlock = (uint64_t)&aBlock;
      uint64_t v66 = 0x3032000000;
      v67 = __Block_byref_object_copy__17;
      v68 = __Block_byref_object_dispose__18;
      id v69 = 0;
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3321888768;
      v51[2] = __89__VNPersonsModelFaceModelVIPv3_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke;
      v51[3] = &unk_1EF754178;
      v51[6] = v31;
      v52 = shared_owners;
      if (shared_owners) {
        atomic_fetch_add_explicit(&shared_owners->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      uint64_t v53 = v12;
      v54 = v23;
      if (v23) {
        atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      __p = 0;
      v56 = 0;
      uint64_t v57 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, v61, (uint64_t)v62, (v62 - (unsigned char *)v61) >> 2);
      v51[4] = &v72;
      v51[5] = &aBlock;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __89__VNPersonsModelFaceModelVIPv3_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_20;
      v50[3] = &unk_1E5B20220;
      v50[4] = &v72;
      if (![(VNCanceller *)v30 tryToPerformBlock:v51 usingSignallingBlock:v50])
      {
        if (a6)
        {
          VNPersonsModelErrorCancelledOperation();
          id v36 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_45;
        }
LABEL_46:
        if (__p)
        {
          v56 = __p;
          operator delete(__p);
        }
        if (v54) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v54);
        }
        if (v52) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v52);
        }
        _Block_object_dispose(&aBlock, 8);

        _Block_object_dispose(&v72, 8);
LABEL_53:
        uint64_t v34 = 0;
LABEL_65:
        if (shared_owners) {
          std::__shared_weak_count::__release_shared[abi:nn180100](shared_owners);
        }
        v46 = v23;
        goto LABEL_68;
      }
      id v35 = *(void **)(p_aBlock + 40);
      if (v35)
      {
        if (a6)
        {
          id v36 = v35;
LABEL_45:
          *a6 = v36;
          goto LABEL_46;
        }
        goto LABEL_46;
      }
      if (__p)
      {
        v56 = __p;
        operator delete(__p);
      }
      if (v54) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v54);
      }
      if (v52) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v52);
      }
      _Block_object_dispose(&aBlock, 8);

      _Block_object_dispose(&v72, 8);
    }
    id v37 = objc_alloc((Class)a1);
    v48 = v31;
    v49 = shared_owners;
    if (shared_owners) {
      atomic_fetch_add_explicit(&shared_owners->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v34 = (void *)[v37 initWithFaceIDModel:&v48 faceprintRequestRevision:v9 personUniqueIdentifierToSerialNumberMapping:v44];
    if (v49) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v49);
    }
    goto LABEL_65;
  }
  uint64_t v39 = v8;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  long long v11 = 0;
  uint64_t v12 = 0;
  while (1)
  {
    v46 = v11;
    uint64_t v13 = v12;
    v45 = [v47 faceModelUniqueIdentifierOfPersonAtIndex:v10];
    int v14 = [NSNumber numberWithInt:(v10 + 1)];
    [v44 setObject:v14 forKeyedSubscript:v45];

    uint64_t v15 = [v47 faceModelNumberOfFaceObservationsForPersonAtIndex:v10];
    id v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
    if (v15) {
      break;
    }
LABEL_8:
    long long v22 = (void *)MEMORY[0x1A6257080]();
    uint64_t v58 = v13;
    v59 = v46;
    if (v46) {
      atomic_fetch_add_explicit(&v46->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    [a1 _concatenateFaceprintImageDescriptorBuffer:&v58 withFaceprints:v16 forIdentityWithSerialNumber:(v10 + 1) faceprintLabels:&v61];
    uint64_t v12 = v72;
    BOOL v23 = v73;
    uint64_t v72 = 0;
    v73 = 0;
    if (v46)
    {
      std::__shared_weak_count::__release_shared[abi:nn180100](v46);
      if (v73) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v73);
      }
    }
    if (v59) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v59);
    }

    ++v10;
    long long v11 = v23;
    if (v10 == v39) {
      goto LABEL_18;
    }
  }
  uint64_t v17 = 0;
  while (1)
  {
    v18 = [v47 faceModelFaceObservationAtIndex:v17 forPersonAtIndex:v10];
    long long v19 = v18;
    if (!v18) {
      break;
    }
    id v60 = 0;
    objc_super v20 = [v18 VNPersonsModelFaceprintWithRequestRevision:v9 error:&v60];
    id v21 = v60;
    if (!v20)
    {
      if (a6)
      {
        v33 = [NSString stringWithFormat:@"mismatched faceprint request revision for observation at index %lu, person at index %lu", v17, v10];
        *a6 = +[VNError errorForInvalidModelWithLocalizedDescription:v33 underlyingError:v21];
      }
      goto LABEL_26;
    }
    uint64_t v9 = [v20 requestRevision];
    [v16 addObject:v20];

    if (v15 == ++v17) {
      goto LABEL_8;
    }
  }
  if (!a6) {
    goto LABEL_27;
  }
  long long v19 = objc_msgSend(NSString, "stringWithFormat:", @"invalid face observation at index %lu for person at index %lu", v17, v10);
  *a6 = +[VNError errorForInvalidModelWithLocalizedDescription:v19];
LABEL_26:

LABEL_27:
  uint64_t v34 = 0;
  uint64_t v30 = v41;
LABEL_68:

  if (v61)
  {
    v62 = v61;
    operator delete(v61);
  }
  if (v46) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v46);
  }

  return v34;
}

void *__89__VNPersonsModelFaceModelVIPv3_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke(uint64_t a1)
{
  result = (void *)vision::mod::FaceID3Model::buildModel(*(void *)(a1 + 48), *(vision::mod::ImageDescriptorBufferAbstract **)(a1 + 64), (uint64_t *)(a1 + 80), *(void *)(*(void *)(a1 + 32) + 8) + 48);
  if (result != 128)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = VNErrorForCVMLStatus(result);
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

uint64_t __89__VNPersonsModelFaceModelVIPv3_modelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_20(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 56) = 1;
  return result;
}

+ (shared_ptr<vision::mod::ImageDescriptorBufferFloat32>)_concatenateFaceprintImageDescriptorBuffer:(shared_ptr<vision:(id)a4 :(int)a5 mod:(void *)a6 :ImageDescriptorBufferFloat32>)a3 withFaceprints:forIdentityWithSerialNumber:faceprintLabels:
{
  uint64_t v7 = *(void *)&a5;
  int v41 = (int)a4;
  var0 = a3.var0;
  uint64_t v39 = v6;
  id v42 = a3.var1;
  uint64_t v9 = [(__shared_weak_count *)v42 count];
  if (v9)
  {
    uint64_t v10 = [(__shared_weak_count *)v42 firstObject];
    size_t v11 = [v10 lengthInBytes];
    uint64_t v12 = *(vision::mod::ImageDescriptorBufferAbstract **)var0;
    size_t __n = v11;
    if (*(void *)var0)
    {
      int v13 = *((_DWORD *)v12 + 18);
    }
    else
    {
      int v14 = operator new(8uLL);
      *int v14 = 1;
      v44[1] = v14 + 1;
      v44[2] = v14 + 1;
      v44[0] = v14;
      uint64_t v15 = malloc_type_malloc(v11, 0x361D0256uLL);
      std::allocate_shared[abi:ne180100]<vision::mod::ImageDescriptorBufferFloat32,std::allocator<vision::mod::ImageDescriptorBufferFloat32>,std::vector<long long> &,void *,unsigned long,int,BOOL,void>(v43, v44, v15, v11, 1, 1);
      id v16 = (std::__shared_weak_count *)*((void *)var0 + 1);
      *(_OWORD *)var0 = *(_OWORD *)v43;
      if (v16) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v16);
      }
      operator delete(v14);
      int v13 = 0;
      uint64_t v12 = *(vision::mod::ImageDescriptorBufferAbstract **)var0;
    }
    uint64_t v17 = v9;
    unint64_t v18 = v9 + v13;
    vision::mod::ImageDescriptorBufferAbstract::resizeForDescriptorsCount(v12, v18, v13 > 0);
    std::vector<long long>::resize((char **)(*(void *)var0 + 8), v18);
    uint64_t v19 = 0;
    unint64_t v20 = v13;
    do
    {
      id v21 = -[__shared_weak_count objectAtIndexedSubscript:](v42, "objectAtIndexedSubscript:", v19, v39);
      long long v22 = [v21 descriptorData];
      unint64_t DataForKthDescriptor = (void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)var0, v20);
      id v24 = v22;
      memcpy(DataForKthDescriptor, (const void *)[v24 bytes], __n);
      vision::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor(*(vision::mod::ImageDescriptorBufferAbstract **)var0, v20, v41);
      unsigned int v26 = *(_DWORD **)(v7 + 8);
      unint64_t v25 = *(void *)(v7 + 16);
      if ((unint64_t)v26 >= v25)
      {
        int v28 = *(_DWORD **)v7;
        uint64_t v29 = ((uint64_t)v26 - *(void *)v7) >> 2;
        unint64_t v30 = v29 + 1;
        if ((unint64_t)(v29 + 1) >> 62) {
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v31 = v25 - (void)v28;
        if (v31 >> 1 > v30) {
          unint64_t v30 = v31 >> 1;
        }
        BOOL v32 = (unint64_t)v31 >= 0x7FFFFFFFFFFFFFFCLL;
        unint64_t v33 = 0x3FFFFFFFFFFFFFFFLL;
        if (!v32) {
          unint64_t v33 = v30;
        }
        if (v33)
        {
          unint64_t v33 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v33);
          int v28 = *(_DWORD **)v7;
          unsigned int v26 = *(_DWORD **)(v7 + 8);
        }
        else
        {
          uint64_t v34 = 0;
        }
        id v35 = (_DWORD *)(v33 + 4 * v29);
        *id v35 = v41;
        int v27 = v35 + 1;
        while (v26 != v28)
        {
          int v36 = *--v26;
          *--id v35 = v36;
        }
        *(void *)uint64_t v7 = v35;
        *(void *)(v7 + 8) = v27;
        *(void *)(v7 + 16) = v33 + 4 * v34;
        if (v28) {
          operator delete(v28);
        }
      }
      else
      {
        *unsigned int v26 = v41;
        int v27 = v26 + 1;
      }
      *(void *)(v7 + 8) = v27;
      ++v20;

      ++v19;
    }
    while (v19 != v17);
    *uint64_t v39 = *(_OWORD *)var0;
    *(void *)var0 = 0;
    *((void *)var0 + 1) = 0;
  }
  else
  {
    *uint64_t v39 = *(_OWORD *)var0;
    *(void *)var0 = 0;
    *((void *)var0 + 1) = 0;
  }

  result.var1 = v38;
  result.var0 = v37;
  return result;
}

@end