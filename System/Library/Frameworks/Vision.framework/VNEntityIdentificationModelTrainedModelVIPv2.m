@interface VNEntityIdentificationModelTrainedModelVIPv2
+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)trainedModelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6;
- (VNEntityIdentificationModelTrainedModelVIPv2)initWithCoder:(id)a3;
- (VNEntityIdentificationModelTrainedModelVIPv2)initWithFaceIDModel:(shared_ptr<vision:(id)a4 :(unint64_t)a5 mod:(id)a6 :(id)a7 FaceIDModel>)a3 entityPrintOriginatingRequestSpecifier:maximumElementsPerID:entityUniqueIdentifiers:entityPrintCounts:;
- (id).cxx_construct;
- (id)entityPrintOriginatingRequestSpecifier;
- (id)entityUniqueIdentifiers;
- (id)predictionsForObservation:(id)a3 limit:(unint64_t)a4 canceller:(id)a5 error:(id *)a6;
- (id)printCountsForAllEntities;
- (id)printCountsForEntitiesWithUniqueIdentifiers:(id)a3;
- (id)trainingEntityPrintsForEntityWithUniqueIdentifier:(id)a3 error:(id *)a4;
- (id)uniqueIdentifierOfEntityAtIndex:(unint64_t)a3;
- (unint64_t)entityCount;
- (unint64_t)indexOfEntityWithUniqueIdentifier:(id)a3;
- (unint64_t)printCountForEntityWithUniqueIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNEntityIdentificationModelTrainedModelVIPv2

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityPrintCounts, 0);
  objc_storeStrong((id *)&self->_entityUniqueIdentifiers, 0);
  objc_storeStrong((id *)&self->_entityPrintOriginatingRequestSpecifier, 0);
  cntrl = self->_faceIDModel.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "vn_encodeEntityUniqueIdentifierArray:forKey:", self->_entityUniqueIdentifiers, @"entityUniqueIdentifiers");
  [v4 encodeObject:self->_entityPrintCounts forKey:@"entityPrintCounts"];
  [v4 encodeObject:self->_entityPrintOriginatingRequestSpecifier forKey:@"entityPrintOriginatingRequestSpecifier"];
  v5 = (void *)MEMORY[0x1A6257080]([v4 encodeInt:self->_maximumElementsPerID forKey:@"maximumElementsPerID"]);
  VNNSMutableDataStreambuf::VNNSMutableDataStreambuf((VNNSMutableDataStreambuf *)__sb);
  v8.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E4FBA458] + 64);
  std::ios_base::init(&v8, __sb);
  uint64_t v9 = 0;
  int v10 = -1;
  v6 = (void *)vision::mod::FaceIDModel::serialize(self->_faceIDModel.__ptr_);
  if (v6 == 128)
  {
    std::ostream::flush();
    id v7 = v12;
    [v4 encodeObject:v7 forKey:@"faceIDModel"];
  }
  else
  {
    VNErrorForCVMLStatus(v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v4 failWithError:v7];
  }

  std::ostream::~ostream();
  std::streambuf::~streambuf();
}

- (VNEntityIdentificationModelTrainedModelVIPv2)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)VNEntityIdentificationModelTrainedModelVIPv2;
  v5 = [(VNEntityIdentificationModelTrainedModelVIPv2 *)&v37 init];
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = objc_msgSend(v4, "vn_decodeEntityUniqueIdentifierArrayForKey:", @"entityUniqueIdentifiers");
  id v7 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v6;

  uint64_t v8 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"entityPrintCounts"];
  uint64_t v9 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v8;

  uint64_t v10 = [*((id *)v5 + 5) count];
  if (v10 != [*((id *)v5 + 6) count])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"entity unique identifier counts (%lu) do not agree with the print counts (%lu)", objc_msgSend(*((id *)v5 + 5), "count"), objc_msgSend(*((id *)v5 + 6), "count"));
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v22 = VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v14, 0);
    [v4 failWithError:v22];

LABEL_12:
    goto LABEL_13;
  }
  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityPrintOriginatingRequestSpecifier"];
  id v12 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v11;

  int v13 = [v4 decodeIntForKey:@"maximumElementsPerID"];
  *((_DWORD *)v5 + 8) = v13;
  id v36 = 0;
  _newFaceIDModel(&v30, v13, (uint64_t)&v36);
  id v14 = v36;
  v15 = (uint64_t *)(v5 + 8);
  v16 = (std::__shared_weak_count *)*((void *)v5 + 2);
  uint64_t v17 = v30;
  *(_OWORD *)(v5 + 8) = v30;
  if (v16)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100](v16);
    if (*v15) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
  if (!v17)
  {
LABEL_11:
    [v4 failWithError:v14];
    goto LABEL_12;
  }
LABEL_5:
  v18 = (void *)MEMORY[0x1A6257080]();
  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceIDModel"];
  if (!v19)
  {
LABEL_8:
    int v21 = 1;
    goto LABEL_15;
  }
  VNNSDataStreambuf::VNNSDataStreambuf((VNNSDataStreambuf *)__sb, v19);
  long long v30 = (unint64_t)(MEMORY[0x1E4FBA450] + 24);
  v31.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E4FBA450] + 64);
  std::ios_base::init(&v31, __sb);
  uint64_t v32 = 0;
  int v33 = -1;
  v20 = (void *)vision::mod::FaceIDModel::deserialize(*v15);
  if (v20 == 128)
  {
    std::istream::~istream();

    std::streambuf::~streambuf();
    goto LABEL_8;
  }
  v24 = NSString;
  v25 = [NSNumber numberWithLongLong:v20];
  v26 = [v24 stringWithFormat:@"Face ID model data deserialization failed with code %@", v25];

  v27 = VNErrorForCVMLStatus(v20);
  v28 = +[VNError errorForInternalErrorWithLocalizedDescription:v26 underlyingError:v27];
  [v4 failWithError:v28];

  std::istream::~istream();
  std::streambuf::~streambuf();
  int v21 = 0;
LABEL_15:

  if (v21)
  {
LABEL_16:
    v23 = v5;
    goto LABEL_17;
  }
LABEL_13:
  v23 = 0;
LABEL_17:

  return v23;
}

- (id)printCountsForAllEntities
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](self->_entityUniqueIdentifiers, "count"));
  entityUniqueIdentifiers = self->_entityUniqueIdentifiers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__VNEntityIdentificationModelTrainedModelVIPv2_printCountsForAllEntities__block_invoke;
  v8[3] = &unk_1E5B1EDC8;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = self;
  [(NSArray *)entityUniqueIdentifiers enumerateObjectsUsingBlock:v8];
  id v6 = v5;

  return v6;
}

void __73__VNEntityIdentificationModelTrainedModelVIPv2_printCountsForAllEntities__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id v5 = [*(id *)(*(void *)(a1 + 40) + 48) objectAtIndex:a3];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (id)printCountsForEntitiesWithUniqueIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v4];
  entityUniqueIdentifiers = self->_entityUniqueIdentifiers;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __92__VNEntityIdentificationModelTrainedModelVIPv2_printCountsForEntitiesWithUniqueIdentifiers___block_invoke;
  v12[3] = &unk_1E5B1EDA0;
  id v13 = v6;
  id v8 = v5;
  id v14 = v8;
  v15 = self;
  id v9 = v6;
  [(NSArray *)entityUniqueIdentifiers enumerateObjectsUsingBlock:v12];
  id v10 = v8;

  return v10;
}

void __92__VNEntityIdentificationModelTrainedModelVIPv2_printCountsForEntitiesWithUniqueIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    id v7 = [*(id *)(*(void *)(a1 + 48) + 48) objectAtIndex:a3];
    [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v8];

    [*(id *)(a1 + 32) removeObject:v8];
    if (![*(id *)(a1 + 32) count]) {
      *a4 = 1;
    }
  }
}

- (unint64_t)printCountForEntityWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSArray *)self->_entityUniqueIdentifiers indexOfObject:v4];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = 0;
  }
  else
  {
    id v7 = [(NSArray *)self->_entityPrintCounts objectAtIndex:v5];
    unint64_t v6 = [v7 unsignedIntegerValue];
  }
  return v6;
}

- (unint64_t)indexOfEntityWithUniqueIdentifier:(id)a3
{
  return [(NSArray *)self->_entityUniqueIdentifiers indexOfObject:a3];
}

- (id)uniqueIdentifierOfEntityAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_entityUniqueIdentifiers objectAtIndex:a3];
}

- (id)entityUniqueIdentifiers
{
  return self->_entityUniqueIdentifiers;
}

- (unint64_t)entityCount
{
  return [(NSArray *)self->_entityUniqueIdentifiers count];
}

- (id)predictionsForObservation:(id)a3 limit:(unint64_t)a4 canceller:(id)a5 error:(id *)a6
{
  id v10 = a3;
  uint64_t v11 = (VNCanceller *)a5;
  id v12 = [(VNEntityIdentificationModelTrainedModelVIPv2 *)self entityPrintOriginatingRequestSpecifier];
  if (!v12)
  {
    id v18 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_20;
  }
  if (!+[VNEntityIdentificationModel validateAceptableObservation:v10 forEntityPrintOriginatingRequestSpecifier:v12 error:a6])
  {
    id v18 = 0;
    goto LABEL_20;
  }
  id v13 = [v10 VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:v12 error:a6];
  if (v13)
  {
    id v22 = v13;
    int v21 = [v13 VNEntityIdentificationModelPrintData];
    id v14 = operator new(8uLL);
    *id v14 = 1;
    v40 = (void **)(v14 + 1);
    uint64_t v41 = (uint64_t)(v14 + 1);
    v39 = v14;
    id v23 = v21;
    v15 = objc_msgSend(v23, "bytes", v21);
    unint64_t v16 = [v23 length];
    vision::mod::ImageDescriptorBufferAbstract::ImageDescriptorBufferAbstract((uint64_t)&v60, &v39, v15, v16, 1, 0);
    DWORD2(v66) = 1;
    v67 = 0;
    v60 = &unk_1EF752918;
    *(void *)&long long v66 = v16 >> 2;
    operator delete(v14);
    if (!v11) {
      uint64_t v11 = objc_alloc_init(VNCanceller);
    }
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x3032000000;
    v57 = __Block_byref_object_copy__45;
    v58 = __Block_byref_object_dispose__46;
    id v59 = 0;
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__45;
    v52 = __Block_byref_object_dispose__46;
    id v53 = 0;
    v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x4012000000;
    v42 = __Block_byref_object_copy__28836;
    v43 = __Block_byref_object_dispose__28837;
    v44 = "";
    v45 = &unk_1EF752200;
    int v47 = -1;
    char v46 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3321888768;
    v25[2] = __96__VNEntityIdentificationModelTrainedModelVIPv2_predictionsForObservation_limit_canceller_error___block_invoke;
    v25[3] = &unk_1EF7541B0;
    v27 = &v54;
    v25[4] = self;
    id v26 = v10;
    memset(v31, 0, sizeof(v31));
    std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(v31, v61, v62, (v62 - (uint64_t)v61) >> 3);
    std::map<long long,int>::map[abi:ne180100](v32, (uint64_t)v63);
    long long v33 = *(_OWORD *)&v63[24];
    long long v34 = v64;
    char v35 = v65;
    long long v36 = v66;
    objc_super v37 = v67;
    unint64_t v38 = a4;
    v28 = &v39;
    v29 = &v48;
    long long v30 = &unk_1EF752918;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __96__VNEntityIdentificationModelTrainedModelVIPv2_predictionsForObservation_limit_canceller_error___block_invoke_51;
    v24[3] = &unk_1E5B20220;
    v24[4] = &v39;
    if ([(VNCanceller *)v11 tryToPerformBlock:v25 usingSignallingBlock:v24])
    {
      uint64_t v17 = (void *)v55[5];
      if (v17)
      {
        id v18 = v17;
LABEL_18:
        long long v30 = &unk_1EF752918;
        free(v37);
        vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(&v30);

        _Block_object_dispose(&v39, 8);
        _Block_object_dispose(&v48, 8);

        _Block_object_dispose(&v54, 8);
        v60 = &unk_1EF752918;
        free(v67);
        vision::mod::ImageDescriptorBufferAbstract::~ImageDescriptorBufferAbstract(&v60);

        id v13 = v22;
        goto LABEL_19;
      }
      if (a6)
      {
        id v19 = (id) v49[5];
        goto LABEL_16;
      }
    }
    else if (a6)
    {
      VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(4, @"operation was cancelled", 0);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
      id v18 = 0;
      *a6 = v19;
      goto LABEL_18;
    }
    id v18 = 0;
    goto LABEL_18;
  }
  id v18 = 0;
LABEL_19:

LABEL_20:

  return v18;
}

void __96__VNEntityIdentificationModelTrainedModelVIPv2_predictionsForObservation_limit_canceller_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(a1 + 192);
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id v7 = *(void **)(v4 + 40);
  NSUInteger v5 = (id *)(v4 + 40);
  id v6 = v7;
  id v31 = *(id *)(a1 + 40);
  if (v2)
  {
    if ([*(id *)(v2 + 40) count])
    {
      uint64_t v32 = 0;
      long long v33 = 0;
      uint64_t v34 = 0;
      id v8 = (void *)vision::mod::FaceIDModel::predict(*(void *)(v2 + 8), (void *)(a1 + 72), (uint64_t *)&v32);
      if (v8 == 128)
      {
        unint64_t v28 = v3;
        id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
        long long v30 = (void *)[v9 initWithCapacity:0xAAAAAAAAAAAAAAABLL * (v33 - v32)];
        uint64_t v11 = v32;
        id v10 = v33;
        for (i = v33; ; id v10 = i)
        {
          if (v11 == v10)
          {
            id v23 = v30;
            [v30 sortUsingComparator:&__block_literal_global_28841];
            if (v28)
            {
              unint64_t v24 = [v30 count];
              if (v24 > v28) {
                objc_msgSend(v30, "removeObjectsInRange:", v28, v24 - v28);
              }
            }
            id v22 = v30;
            goto LABEL_27;
          }
          id v12 = *v11;
          if (*v11 != (double *)(v11 + 1)) {
            break;
          }
LABEL_17:
          v11 += 3;
        }
        while (1)
        {
          uint64_t v13 = *((unsigned int *)v12 + 8);
          if ((int)v13 < 1 || v13 - 1 >= (unint64_t)[*(id *)(v2 + 40) count])
          {
            v25 = objc_msgSend(NSString, "stringWithFormat:", @"No entity for identity serial number %d", v13);
            id v23 = v30;
            id v6 = +[VNError errorForInternalErrorWithLocalizedDescription:v25];

            id v22 = 0;
            goto LABEL_27;
          }
          id v14 = objc_msgSend(*(id *)(v2 + 40), "objectAtIndex:");
          if (!v14) {
            break;
          }
          double v15 = v12[5];
          unint64_t v16 = [VNEntityIdentificationModelPrediction alloc];
          *(float *)&double v17 = v15;
          id v18 = [(VNEntityIdentificationModelPrediction *)v16 initWithObservation:v31 entityUniqueIdentifier:v14 confidence:v17];
          if (!v18)
          {
            id v6 = +[VNError errorForMemoryAllocationFailure];

            break;
          }
          [v30 addObject:v18];

          id v19 = (double *)*((void *)v12 + 1);
          if (v19)
          {
            do
            {
              v20 = (double **)v19;
              id v19 = *(double **)v19;
            }
            while (v19);
          }
          else
          {
            do
            {
              v20 = (double **)*((void *)v12 + 2);
              BOOL v21 = *v20 == v12;
              id v12 = (double *)v20;
            }
            while (!v21);
          }
          id v12 = (double *)v20;
          if (v20 == v11 + 1) {
            goto LABEL_17;
          }
        }
        id v22 = 0;
        id v23 = v30;
LABEL_27:
      }
      else
      {
        VNErrorForCVMLStatus(v8);
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        id v22 = 0;
      }
      char v35 = &v32;
      std::vector<std::map<int,double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v35);
    }
    else
    {
      id v22 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v22 = 0;
  }

  objc_storeStrong(v5, v6);
  uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
  v27 = *(void **)(v26 + 40);
  *(void *)(v26 + 40) = v22;
}

uint64_t __96__VNEntityIdentificationModelTrainedModelVIPv2_predictionsForObservation_limit_canceller_error___block_invoke_51(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 56) = 1;
  return result;
}

uint64_t __129__VNEntityIdentificationModelTrainedModelVIPv2__predictionsForObservation_withEntityPrintDescriptor_limit_faceIDCanceller_error___block_invoke(uint64_t a1, void *a2, void *a3)
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
      id v10 = [v4 entityUniqueIdentifier];
      uint64_t v11 = [v10 description];

      id v12 = [v5 entityUniqueIdentifier];
      uint64_t v13 = [v12 description];

      uint64_t v9 = [v11 compare:v13];
    }
  }
  else
  {
    uint64_t v9 = -1;
  }

  return v9;
}

- (id)trainingEntityPrintsForEntityWithUniqueIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!self)
  {
LABEL_5:

    id v8 = 0;
    goto LABEL_23;
  }
  NSUInteger v7 = [(NSArray *)self->_entityUniqueIdentifiers indexOfObject:v6];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a4)
    {
      VNEntityIdentificationModelErrorForUnknownEntityUniqueIdentifier((uint64_t)v6);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_5;
  }
  int v9 = v7 + 1;

  id v22 = 0;
  id v23 = 0;
  IdentityTrainingData = (void *)vision::mod::FaceIDModel::getIdentityTrainingData(self->_faceIDModel.__ptr_, v9, &v22);
  if (IdentityTrainingData == 128)
  {
    uint64_t v11 = v22;
    uint64_t v12 = *((void *)v22 + 9);
    if (v12)
    {
      BOOL v21 = [(VNEntityIdentificationModelTrainedModelVIPv2 *)self entityPrintOriginatingRequestSpecifier];
      uint64_t v13 = (void *)[v21 requestClassAndReturnError:a4];
      if (v13)
      {
        uint64_t v14 = [v21 requestRevision];
        uint64_t v15 = *((void *)v11 + 8);
        uint64_t v16 = *((void *)v11 + 12);
        double v17 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v12];
        unint64_t v18 = 0;
        while (1)
        {
          id v19 = objc_msgSend(v13, "createVNEntityIdentificationModelEntryPrintForRevision:fromDescriptorData:length:elementCount:error:", v14, vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(v11, v18), v15, v16, a4);
          if (!v19) {
            break;
          }
          [v17 addObject:v19];

          if (v12 == ++v18)
          {
            id v8 = v17;
            goto LABEL_19;
          }
        }
        id v8 = 0;
LABEL_19:
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else if (a4)
  {
    VNErrorForCVMLStatus(IdentityTrainingData);
    id v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
  if (v23) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v23);
  }
LABEL_23:

  return v8;
}

- (id)entityPrintOriginatingRequestSpecifier
{
  return self->_entityPrintOriginatingRequestSpecifier;
}

- (VNEntityIdentificationModelTrainedModelVIPv2)initWithFaceIDModel:(shared_ptr<vision:(id)a4 :(unint64_t)a5 mod:(id)a6 :(id)a7 FaceIDModel>)a3 entityPrintOriginatingRequestSpecifier:maximumElementsPerID:entityUniqueIdentifiers:entityPrintCounts:
{
  ptr = a3.__ptr_;
  uint64_t v12 = a3.__cntrl_;
  id v13 = (id)a5;
  id v14 = a6;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", [v13 count] == objc_msgSend(v14, "count"), @"entity unique identifier / print count mismatch");
  v29.receiver = self;
  v29.super_class = (Class)VNEntityIdentificationModelTrainedModelVIPv2;
  uint64_t v15 = [(VNEntityIdentificationModelTrainedModelVIPv2 *)&v29 init];
  uint64_t v16 = v15;
  if (v15)
  {
    p_faceIDModel = &v15->_faceIDModel;
    id v19 = *(FaceIDModel **)ptr;
    uint64_t v18 = *((void *)ptr + 1);
    if (v18) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v18 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v15->_faceIDModel.__cntrl_;
    p_faceIDModel->__ptr_ = v19;
    p_faceIDModel->__cntrl_ = (__shared_weak_count *)v18;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
    }
    uint64_t v21 = [(__shared_weak_count *)v12 copy];
    entityPrintOriginatingRequestSpecifier = v16->_entityPrintOriginatingRequestSpecifier;
    v16->_entityPrintOriginatingRequestSpecifier = (VNRequestSpecifier *)v21;

    int v23 = 0x7FFFFFFF;
    if ((unint64_t)a4 < 0x7FFFFFFF) {
      int v23 = (int)a4;
    }
    v16->_maximumElementsPerID = v23;
    uint64_t v24 = [v13 copy];
    entityUniqueIdentifiers = v16->_entityUniqueIdentifiers;
    v16->_entityUniqueIdentifiers = (NSArray *)v24;

    uint64_t v26 = [v14 copy];
    entityPrintCounts = v16->_entityPrintCounts;
    v16->_entityPrintCounts = (NSArray *)v26;
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)trainedModelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v66 = a4;
  uint64_t v62 = (VNCanceller *)a5;
  v58 = v8;
  if (!v62) {
    uint64_t v62 = objc_alloc_init(VNCanceller);
  }
  char v65 = [v8 entityPrintOriginatingRequestSpecifier];
  uint64_t v9 = [v66 trainedModelEntityCount];
  v61 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
  v60 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
  if (!v9)
  {
    id v10 = 0;
    uint64_t v11 = 0;
    id v13 = 0;
    v63 = 0;
LABEL_50:
    int v43 = [v58 faceIDModelMaximumElementsPerID];
    _newFaceIDModel(&v95, v43, (uint64_t)a6);
    v44 = v95;
    if (!v95)
    {
      v45 = v96;
LABEL_89:
      if (v45) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v45);
      }
      goto LABEL_91;
    }
    if (v13)
    {
      v86 = 0;
      v87 = &v86;
      uint64_t v88 = 0x4012000000;
      v89 = __Block_byref_object_copy__28836;
      v90 = __Block_byref_object_dispose__28837;
      v91 = "";
      v92 = &unk_1EF752200;
      int v94 = -1;
      char v93 = 0;
      *(void *)&long long v81 = 0;
      *((void *)&v81 + 1) = &v81;
      uint64_t v82 = 0x3032000000;
      v83 = __Block_byref_object_copy__45;
      v84 = __Block_byref_object_dispose__46;
      id v85 = 0;
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3321888768;
      v74[2] = __112__VNEntityIdentificationModelTrainedModelVIPv2_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke;
      v74[3] = &unk_1EF754140;
      v45 = v96;
      v74[6] = v95;
      v75 = v96;
      if (v96) {
        atomic_fetch_add_explicit(&v96->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v76 = v13;
      v77 = v63;
      if (v63) {
        atomic_fetch_add_explicit(&v63->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      __p = 0;
      v79 = 0;
      uint64_t v80 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&__p, v10, (uint64_t)v11, (v11 - v10) >> 2);
      v74[4] = &v86;
      v74[5] = &v81;
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __112__VNEntityIdentificationModelTrainedModelVIPv2_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_48;
      v73[3] = &unk_1E5B20220;
      v73[4] = &v86;
      if (![(VNCanceller *)v62 tryToPerformBlock:v74 usingSignallingBlock:v73])
      {
        if (a6)
        {
          VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(4, @"operation was cancelled", 0);
          id v47 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_68;
        }
LABEL_69:
        if (__p)
        {
          v79 = __p;
          operator delete(__p);
        }
        if (v77) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v77);
        }
        if (v75) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v75);
        }
        _Block_object_dispose(&v81, 8);

        _Block_object_dispose(&v86, 8);
        v44 = 0;
        goto LABEL_89;
      }
      char v46 = *(void **)(*((void *)&v81 + 1) + 40);
      if (v46)
      {
        if (a6)
        {
          id v47 = v46;
LABEL_68:
          *a6 = v47;
          goto LABEL_69;
        }
        goto LABEL_69;
      }
      if (__p)
      {
        v79 = __p;
        operator delete(__p);
      }
      if (v77) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v77);
      }
      if (v75) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v75);
      }
      _Block_object_dispose(&v81, 8);

      _Block_object_dispose(&v86, 8);
    }
    id v51 = objc_alloc((Class)a1);
    v45 = v96;
    v71 = v44;
    v72 = v96;
    if (v96) {
      atomic_fetch_add_explicit(&v96->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v44 = (void *)[v51 initWithFaceIDModel:&v71 entityPrintOriginatingRequestSpecifier:v65 maximumElementsPerID:v43 entityUniqueIdentifiers:v61 entityPrintCounts:v60];
    if (v72) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v72);
    }
    goto LABEL_89;
  }
  uint64_t v54 = v9;
  id v10 = 0;
  uint64_t v11 = 0;
  unint64_t v70 = 0;
  uint64_t v12 = 0;
  v63 = 0;
  id v13 = 0;
  while (![(VNCanceller *)v62 wasSignalled])
  {
    v57 = [v66 trainedModelUniqueIdentifierOfEntityAtIndex:v12];
    [v61 addObject:v57];
    uint64_t v14 = [v66 trainedModelNumberOfObservationsForEntityAtIndex:v12];
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:v14];
    [v60 addObject:v15];

    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v14];
    if (v14)
    {
      uint64_t v17 = 0;
      while (1)
      {
        uint64_t v18 = [v66 trainedModelObservationAtIndex:v17 forEntityAtIndex:v12];
        id v19 = v18;
        if (!v18 || (VNEntityIdentificationModelObservationConformingObject(v18) & 1) == 0) {
          break;
        }
        v97[0] = 0;
        v20 = [v19 VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:v65 error:v97];
        id v21 = v97[0];
        if (!v20)
        {
          if (a6)
          {
            uint64_t v48 = NSString;
            v49 = [v19 originatingRequestSpecifier];
            uint64_t v50 = [v48 stringWithFormat:@"entity index %lu, observation index %lu was generated by %@, which is not compatible with the model requirement of %@", v12, v17, v49, v65];

            VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v50, v21);
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_62;
        }
        [v16 addObject:v20];

        if (v14 == ++v17) {
          goto LABEL_12;
        }
      }
      if (!a6) {
        goto LABEL_63;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"invalid observation at index %lu for entity at index %lu", v17, v12);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      *a6 = +[VNError errorForInvalidModelWithLocalizedDescription:v21];
LABEL_62:

LABEL_63:
      goto LABEL_64;
    }
LABEL_12:
    id v22 = (void *)MEMORY[0x1A6257080]();
    if (v63) {
      atomic_fetch_add_explicit(&v63->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    *(void *)&long long v23 = v13;
    *((void *)&v23 + 1) = v63;
    long long v56 = v23;
    id v24 = v16;
    id v64 = v24;
    self;
    uint64_t v25 = [v24 count];
    if (v25)
    {
      id v53 = [v24 firstObject];
      size_t v26 = [v53 VNEntityIdentificationModelPrintByteLength];
      if (v13)
      {
        int v27 = *((_DWORD *)v13 + 18);
      }
      else
      {
        unint64_t v28 = operator new(8uLL);
        void *v28 = 1;
        v87 = (void **)(v28 + 1);
        uint64_t v88 = (uint64_t)(v28 + 1);
        v86 = v28;
        objc_super v29 = malloc_type_malloc(v26, 0x5687EFB9uLL);
        std::allocate_shared[abi:ne180100]<vision::mod::ImageDescriptorBufferFloat32,std::allocator<vision::mod::ImageDescriptorBufferFloat32>,std::vector<long long> &,void *,unsigned long const&,int,BOOL,void>((uint64_t *)&v81, &v86, v29, v26, 1, 1);
        long long v56 = v81;
        long long v81 = 0uLL;
        if (v63)
        {
          std::__shared_weak_count::__release_shared[abi:nn180100](v63);
          if (*((void *)&v81 + 1)) {
            std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&v81 + 1));
          }
        }
        if (v86) {
          operator delete(v86);
        }
        int v27 = 0;
        id v13 = (vision::mod::ImageDescriptorBufferAbstract *)v56;
      }
      uint64_t v68 = v25;
      size_t __n = v26;
      vision::mod::ImageDescriptorBufferAbstract::resizeForDescriptorsCount(v13, v25 + v27, v27 > 0);
      std::vector<long long>::resize((char **)(v56 + 8), v25 + v27);
      uint64_t v30 = 0;
      unint64_t v31 = v27;
      int v67 = v12 + 1;
      do
      {
        uint64_t v32 = [v24 objectAtIndexedSubscript:v30];
        long long v33 = [v32 VNEntityIdentificationModelPrintData];
        DataForKthDescriptor = (void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor((vision::mod::ImageDescriptorBufferAbstract *)v56, v31);
        id v35 = v33;
        memcpy(DataForKthDescriptor, (const void *)[v35 bytes], __n);
        vision::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor((vision::mod::ImageDescriptorBufferAbstract *)v56, v31, v67);
        if ((unint64_t)v11 >= v70)
        {
          uint64_t v36 = (v11 - v10) >> 2;
          unint64_t v37 = v36 + 1;
          if ((unint64_t)(v36 + 1) >> 62) {
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v70 - (void)v10) >> 1 > v37) {
            unint64_t v37 = (uint64_t)(v70 - (void)v10) >> 1;
          }
          if (v70 - (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v38 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v38 = v37;
          }
          if (v38) {
            unint64_t v38 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v38);
          }
          else {
            uint64_t v39 = 0;
          }
          v40 = (char *)(v38 + 4 * v36);
          *(_DWORD *)v40 = v67;
          uint64_t v41 = v40 + 4;
          while (v11 != v10)
          {
            int v42 = *((_DWORD *)v11 - 1);
            v11 -= 4;
            *((_DWORD *)v40 - 1) = v42;
            v40 -= 4;
          }
          unint64_t v70 = v38 + 4 * v39;
          if (v10) {
            operator delete(v10);
          }
          id v10 = v40;
          uint64_t v11 = v41;
          id v24 = v64;
        }
        else
        {
          *(_DWORD *)uint64_t v11 = v67;
          v11 += 4;
        }
        ++v31;

        ++v30;
      }
      while (v30 != v68);

      id v13 = (vision::mod::ImageDescriptorBufferAbstract *)v56;
    }

    if (v63) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v63);
    }
    v63 = (std::__shared_weak_count *)*((void *)&v56 + 1);

    if (++v12 == v54) {
      goto LABEL_50;
    }
  }
  if (!a6)
  {
LABEL_64:
    v44 = 0;
    goto LABEL_91;
  }
  VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(4, @"operation was cancelled", 0);
  v44 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_91:

  if (v10) {
    operator delete(v10);
  }
  if (v63) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v63);
  }

  return v44;
}

void *__112__VNEntityIdentificationModelTrainedModelVIPv2_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke(uint64_t a1)
{
  result = (void *)vision::mod::FaceIDModel::buildModel(*(void *)(a1 + 48), *(void **)(a1 + 64), (void *)(a1 + 80), *(void *)(*(void *)(a1 + 32) + 8) + 48);
  if (result != 128)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = VNErrorForCVMLStatus(result);
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

uint64_t __112__VNEntityIdentificationModelTrainedModelVIPv2_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_48(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 56) = 1;
  return result;
}

+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5
{
  *a3 = 1953326188;
  return 1;
}

@end