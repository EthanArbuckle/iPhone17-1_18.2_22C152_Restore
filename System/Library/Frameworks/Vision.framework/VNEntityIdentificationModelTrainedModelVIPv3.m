@interface VNEntityIdentificationModelTrainedModelVIPv3
+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (id)trainedModelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6;
- (VNEntityIdentificationModelTrainedModelVIPv3)initWithCoder:(id)a3;
- (VNEntityIdentificationModelTrainedModelVIPv3)initWithFaceIDModel:(shared_ptr<vision:(id)a4 :(id)a5 mod:(id)a6 :FaceID3Model>)a3 entityPrintOriginatingRequestSpecifier:entityUniqueIdentifiers:entityPrintCounts:;
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

@implementation VNEntityIdentificationModelTrainedModelVIPv3

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
  v5 = (void *)MEMORY[0x1A6257080]([v4 encodeObject:self->_entityPrintOriginatingRequestSpecifier forKey:@"entityPrintOriginatingRequestSpecifier"]);
  VNNSMutableDataStreambuf::VNNSMutableDataStreambuf((VNNSMutableDataStreambuf *)__sb);
  v8.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E4FBA458] + 64);
  std::ios_base::init(&v8, __sb);
  uint64_t v9 = 0;
  int v10 = -1;
  v6 = (void *)vision::mod::FaceID3Model::serialize(self->_faceIDModel.__ptr_);
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

- (VNEntityIdentificationModelTrainedModelVIPv3)initWithCoder:(id)a3
{
  id v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)VNEntityIdentificationModelTrainedModelVIPv3;
  v5 = [(VNEntityIdentificationModelTrainedModelVIPv3 *)&v37 init];
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(v4, "vn_decodeEntityUniqueIdentifierArrayForKey:", @"entityUniqueIdentifiers");
    entityUniqueIdentifiers = v5->_entityUniqueIdentifiers;
    v5->_entityUniqueIdentifiers = (NSArray *)v7;

    uint64_t v9 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"entityPrintCounts"];
    entityPrintCounts = v5->_entityPrintCounts;
    v5->_entityPrintCounts = (NSArray *)v9;

    uint64_t v11 = [(NSArray *)v5->_entityUniqueIdentifiers count];
    if (v11 == [(NSArray *)v5->_entityPrintCounts count])
    {
      uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entityPrintOriginatingRequestSpecifier"];
      entityPrintOriginatingRequestSpecifier = v5->_entityPrintOriginatingRequestSpecifier;
      v5->_entityPrintOriginatingRequestSpecifier = (VNRequestSpecifier *)v12;

      v14 = (void *)MEMORY[0x1A6257080]();
      v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"faceIDModel"];
      if (!v15) {
        goto LABEL_10;
      }
      VNNSDataStreambuf::VNNSDataStreambuf((VNNSDataStreambuf *)__sb, v15);
      v31[0] = MEMORY[0x1E4FBA450] + 24;
      v31[1] = 0;
      v32.__vftable = (std::ios_base_vtbl *)(MEMORY[0x1E4FBA450] + 64);
      std::ios_base::init(&v32, __sb);
      uint64_t v33 = 0;
      int v34 = -1;
      v29 = 0;
      uint64_t v30 = 11125;
      vision::mod::FaceID3Model::deserialize(&v28, (uint64_t)v31, &v30);
      v16 = v28;
      v29 = v28;
      if (v28)
      {
        std::shared_ptr<vision::mod::FaceID3Model>::operator=[abi:ne180100]<vision::mod::FaceID3Model,std::default_delete<vision::mod::FaceID3Model>,void>((uint64_t)&v5->_faceIDModel, &v29);
        if (v29)
        {
          vision::mod::FaceID3Model::~FaceID3Model(v29);
          MEMORY[0x1A62562C0]();
        }
      }
      else
      {
        v19 = NSString;
        v20 = (void *)v30;
        v21 = [NSNumber numberWithLongLong:v30];
        v22 = [v19 stringWithFormat:@"Face ID model data deserialization failed with code %@", v21];

        v23 = VNErrorForCVMLStatus(v20);
        v24 = +[VNError errorForInternalErrorWithLocalizedDescription:v22 underlyingError:v23];
        [v4 failWithError:v24];
      }
      std::istream::~istream();

      std::streambuf::~streambuf();
      if (!v16) {
        int v25 = 0;
      }
      else {
LABEL_10:
      }
        int v25 = 1;

      if (v25) {
        goto LABEL_13;
      }
    }
    else
    {
      v17 = objc_msgSend(NSString, "stringWithFormat:", @"entity unique identifier counts (%lu) do not agree with the print counts (%lu)", -[NSArray count](v5->_entityUniqueIdentifiers, "count"), -[NSArray count](v5->_entityPrintCounts, "count"));
      v18 = VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v17, 0);
      [v4 failWithError:v18];
    }
    v26 = 0;
    goto LABEL_15;
  }
LABEL_13:
  v26 = v6;
LABEL_15:

  return v26;
}

- (id)printCountsForAllEntities
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSArray count](self->_entityUniqueIdentifiers, "count"));
  entityUniqueIdentifiers = self->_entityUniqueIdentifiers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__VNEntityIdentificationModelTrainedModelVIPv3_printCountsForAllEntities__block_invoke;
  v8[3] = &unk_1E5B1EDC8;
  id v5 = v3;
  id v9 = v5;
  int v10 = self;
  [(NSArray *)entityUniqueIdentifiers enumerateObjectsUsingBlock:v8];
  id v6 = v5;

  return v6;
}

void __73__VNEntityIdentificationModelTrainedModelVIPv3_printCountsForAllEntities__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  id v5 = [*(id *)(*(void *)(a1 + 40) + 40) objectAtIndex:a3];
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
  v12[2] = __92__VNEntityIdentificationModelTrainedModelVIPv3_printCountsForEntitiesWithUniqueIdentifiers___block_invoke;
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

void __92__VNEntityIdentificationModelTrainedModelVIPv3_printCountsForEntitiesWithUniqueIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    uint64_t v7 = [*(id *)(*(void *)(a1 + 48) + 40) objectAtIndex:a3];
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
    uint64_t v7 = [(NSArray *)self->_entityPrintCounts objectAtIndex:v5];
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
  uint64_t v12 = [(VNEntityIdentificationModelTrainedModelVIPv3 *)self entityPrintOriginatingRequestSpecifier];
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
    v21 = [v13 VNEntityIdentificationModelPrintData];
    id v14 = operator new(8uLL);
    void *v14 = 1;
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
    v57 = __Block_byref_object_copy__49_17614;
    v58 = __Block_byref_object_dispose__50_17615;
    id v59 = 0;
    uint64_t v48 = 0;
    v49 = &v48;
    uint64_t v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__49_17614;
    v52 = __Block_byref_object_dispose__50_17615;
    id v53 = 0;
    v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x4012000000;
    v42 = __Block_byref_object_copy__17616;
    v43 = __Block_byref_object_dispose__17617;
    v44 = "";
    v45 = &unk_1EF752200;
    int v47 = -1;
    char v46 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3321888768;
    v25[2] = __96__VNEntityIdentificationModelTrainedModelVIPv3_predictionsForObservation_limit_canceller_error___block_invoke;
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
    uint64_t v30 = &unk_1EF752918;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __96__VNEntityIdentificationModelTrainedModelVIPv3_predictionsForObservation_limit_canceller_error___block_invoke_55;
    v24[3] = &unk_1E5B20220;
    v24[4] = &v39;
    if ([(VNCanceller *)v11 tryToPerformBlock:v25 usingSignallingBlock:v24])
    {
      v17 = (void *)v55[5];
      if (v17)
      {
        id v18 = v17;
LABEL_18:
        uint64_t v30 = &unk_1EF752918;
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

void __96__VNEntityIdentificationModelTrainedModelVIPv3_predictionsForObservation_limit_canceller_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void *)(a1 + 192);
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v7 = *(void **)(v4 + 40);
  NSUInteger v5 = (id *)(v4 + 40);
  id v6 = v7;
  id v31 = *(id *)(a1 + 40);
  if (v2)
  {
    if ([*(id *)(v2 + 32) count])
    {
      std::ios_base v32 = 0;
      long long v33 = 0;
      uint64_t v34 = 0;
      id v8 = (void *)vision::mod::FaceID3Model::predict(*(void *)(v2 + 8), a1 + 72, (uint64_t *)&v32);
      if (v8 == 128)
      {
        unint64_t v28 = v3;
        id v9 = objc_alloc(MEMORY[0x1E4F1CA48]);
        uint64_t v30 = (void *)[v9 initWithCapacity:0xAAAAAAAAAAAAAAABLL * (v33 - v32)];
        uint64_t v11 = v32;
        id v10 = v33;
        for (i = v33; ; id v10 = i)
        {
          if (v11 == v10)
          {
            id v23 = v30;
            [v30 sortUsingComparator:&__block_literal_global_17622];
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
          uint64_t v12 = *v11;
          if (*v11 != (double *)(v11 + 1)) {
            break;
          }
LABEL_17:
          v11 += 3;
        }
        while (1)
        {
          uint64_t v13 = *((unsigned int *)v12 + 8);
          if ((int)v13 < 1 || v13 - 1 >= (unint64_t)[*(id *)(v2 + 32) count])
          {
            int v25 = objc_msgSend(NSString, "stringWithFormat:", @"No entity for identity serial number %d", v13);
            id v23 = v30;
            id v6 = +[VNError errorForInternalErrorWithLocalizedDescription:v25];

            id v22 = 0;
            goto LABEL_27;
          }
          id v14 = objc_msgSend(*(id *)(v2 + 32), "objectAtIndex:");
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
              uint64_t v12 = (double *)v20;
            }
            while (!v21);
          }
          uint64_t v12 = (double *)v20;
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

uint64_t __96__VNEntityIdentificationModelTrainedModelVIPv3_predictionsForObservation_limit_canceller_error___block_invoke_55(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 56) = 1;
  return result;
}

uint64_t __129__VNEntityIdentificationModelTrainedModelVIPv3__predictionsForObservation_withEntityPrintDescriptor_limit_faceIDCanceller_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

      uint64_t v12 = [v5 entityUniqueIdentifier];
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
    goto LABEL_22;
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
  uint64_t v9 = (uint64_t *)(v7 + 1);
  id v21 = v6;

  id v23 = (id)-38;
  vision::mod::FaceID3Model::getIdentityTrainingData((vision::mod::FaceID3Model *)&v22, (vision::mod::FaceID3Model *)self->_faceIDModel.__ptr_, v9, (uint64_t *)&v23);
  id v10 = v22;
  if (v22)
  {
    uint64_t v11 = *((void *)v22 + 9);
    if (v11)
    {
      v20 = [(VNEntityIdentificationModelTrainedModelVIPv3 *)self entityPrintOriginatingRequestSpecifier];
      uint64_t v12 = (void *)[v20 requestClassAndReturnError:a4];
      if (v12)
      {
        uint64_t v13 = [v20 requestRevision];
        uint64_t v14 = *((void *)v10 + 8);
        uint64_t v15 = *((void *)v10 + 12);
        unint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v11];
        unint64_t v17 = 0;
        while (1)
        {
          id v18 = objc_msgSend(v12, "createVNEntityIdentificationModelEntryPrintForRevision:fromDescriptorData:length:elementCount:error:", v13, vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor(v10, v17), v14, v15, a4);
          if (!v18) {
            break;
          }
          [v16 addObject:v18];

          if (v11 == ++v17)
          {
            id v8 = v16;
            goto LABEL_19;
          }
        }
        id v8 = 0;
LABEL_19:

        if (!v10) {
          goto LABEL_21;
        }
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
    (*(void (**)(vision::mod::ImageDescriptorBufferAbstract *))(*(void *)v10 + 8))(v10);
  }
  else if (a4)
  {
    VNErrorForCVMLStatus(v23);
    id v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = 0;
  }
LABEL_21:
  id v6 = v21;
LABEL_22:

  return v8;
}

- (id)entityPrintOriginatingRequestSpecifier
{
  return self->_entityPrintOriginatingRequestSpecifier;
}

- (VNEntityIdentificationModelTrainedModelVIPv3)initWithFaceIDModel:(shared_ptr<vision:(id)a4 :(id)a5 mod:(id)a6 :FaceID3Model>)a3 entityPrintOriginatingRequestSpecifier:entityUniqueIdentifiers:entityPrintCounts:
{
  ptr = a3.__ptr_;
  id v10 = a3.__cntrl_;
  id v11 = a4;
  id v12 = a5;
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", [v11 count] == objc_msgSend(v12, "count"), @"entity unique identifier / print count mismatch");
  v26.receiver = self;
  v26.super_class = (Class)VNEntityIdentificationModelTrainedModelVIPv3;
  uint64_t v13 = [(VNEntityIdentificationModelTrainedModelVIPv3 *)&v26 init];
  uint64_t v14 = v13;
  if (v13)
  {
    p_faceIDModel = &v13->_faceIDModel;
    unint64_t v17 = *(FaceID3Model **)ptr;
    uint64_t v16 = *((void *)ptr + 1);
    if (v16) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v16 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v13->_faceIDModel.__cntrl_;
    p_faceIDModel->__ptr_ = v17;
    p_faceIDModel->__cntrl_ = (__shared_weak_count *)v16;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
    }
    uint64_t v19 = [(__shared_weak_count *)v10 copy];
    entityPrintOriginatingRequestSpecifier = v14->_entityPrintOriginatingRequestSpecifier;
    v14->_entityPrintOriginatingRequestSpecifier = (VNRequestSpecifier *)v19;

    uint64_t v21 = [v11 copy];
    entityUniqueIdentifiers = v14->_entityUniqueIdentifiers;
    v14->_entityUniqueIdentifiers = (NSArray *)v21;

    uint64_t v23 = [v12 copy];
    entityPrintCounts = v14->_entityPrintCounts;
    v14->_entityPrintCounts = (NSArray *)v23;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)trainedModelBuiltFromConfiguration:(id)a3 dataProvider:(id)a4 canceller:(id)a5 error:(id *)a6
{
  id v8 = a3;
  id v73 = a4;
  id v70 = v8;
  v68 = (VNCanceller *)a5;
  if (!v68) {
    v68 = objc_alloc_init(VNCanceller);
  }
  v71 = [v8 entityPrintOriginatingRequestSpecifier];
  uint64_t v9 = [v73 trainedModelEntityCount];
  v67 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
  long long v66 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v9];
  if (!v9)
  {
    __p = 0;
    id v10 = 0;
    id v11 = 0;
    v69 = 0;
LABEL_52:
    id v43 = v8;
    unsigned int v44 = [v43 faceID3ModelMaximumIDs];
    unsigned int v45 = [v43 faceID3ModelMaximumElementsPerID];
    int v46 = [v43 faceID3ModelSeed];
    int v47 = [v43 faceID3IndexMode];
    v95 = 0;
    v96 = &v95;
    uint64_t v97 = 0x4012000000;
    v98 = __Block_byref_object_copy__121;
    v99 = __Block_byref_object_dispose__122;
    v100 = "";
    v101 = 0;
    v102 = 0;
    *(void *)&long long aBlock = MEMORY[0x1E4F143A8];
    *((void *)&aBlock + 1) = 3221225472;
    uint64_t v89 = (uint64_t)___ZL15_newFaceIDModelP40VNEntityIdentificationModelConfigurationPU15__autoreleasingP7NSError_block_invoke;
    v90 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E5B1FC70;
    v91 = (void (*)(uint64_t))&v95;
    id v92 = (id)__PAIR64__(v44, v45);
    int v93 = v46;
    int v94 = v47;
    uint64_t v48 = _Block_copy(&aBlock);
    if (VNExecuteBlock(v48, (uint64_t)a6))
    {
      uint64_t v50 = v96[6];
      v49 = (std::__shared_weak_count *)v96[7];
      if (v49) {
        atomic_fetch_add_explicit(&v49->__shared_owners_, 1uLL, memory_order_relaxed);
      }
    }
    else
    {
      uint64_t v50 = 0;
      v49 = 0;
    }

    _Block_object_dispose(&v95, 8);
    if (v102) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v102);
    }

    if (!v50) {
      goto LABEL_83;
    }
    if (v11)
    {
      v95 = 0;
      v96 = &v95;
      uint64_t v97 = 0x4012000000;
      v98 = __Block_byref_object_copy__17616;
      v99 = (void (*)(uint64_t))__Block_byref_object_dispose__17617;
      v100 = "";
      v101 = &unk_1EF752200;
      HIDWORD(v102) = -1;
      LOBYTE(v102) = 0;
      *(void *)&long long aBlock = 0;
      *((void *)&aBlock + 1) = &aBlock;
      uint64_t v89 = 0x3032000000;
      v90 = __Block_byref_object_copy__49_17614;
      v91 = __Block_byref_object_dispose__50_17615;
      id v92 = 0;
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3321888768;
      v80[2] = __112__VNEntityIdentificationModelTrainedModelVIPv3_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke;
      v80[3] = &unk_1EF754178;
      v80[6] = v50;
      v81 = v49;
      if (v49) {
        atomic_fetch_add_explicit(&v49->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v82 = v11;
      v83 = v69;
      if (v69) {
        atomic_fetch_add_explicit(&v69->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v84 = 0;
      v85 = 0;
      uint64_t v86 = 0;
      std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(&v84, __p, (uint64_t)v10, (v10 - __p) >> 2);
      v80[4] = &v95;
      v80[5] = &aBlock;
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __112__VNEntityIdentificationModelTrainedModelVIPv3_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_52;
      v79[3] = &unk_1E5B20220;
      v79[4] = &v95;
      if (![(VNCanceller *)v68 tryToPerformBlock:v80 usingSignallingBlock:v79])
      {
        if (a6)
        {
          VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(4, @"operation was cancelled", 0);
          id v52 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_75;
        }
LABEL_76:
        if (v84)
        {
          v85 = v84;
          operator delete(v84);
        }
        if (v83) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v83);
        }
        if (v81) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v81);
        }
        _Block_object_dispose(&aBlock, 8);

        _Block_object_dispose(&v95, 8);
LABEL_83:
        uint64_t v56 = 0;
LABEL_97:
        if (v49) {
          std::__shared_weak_count::__release_shared[abi:nn180100](v49);
        }
        goto LABEL_99;
      }
      v51 = *(void **)(*((void *)&aBlock + 1) + 40);
      if (v51)
      {
        if (a6)
        {
          id v52 = v51;
LABEL_75:
          *a6 = v52;
          goto LABEL_76;
        }
        goto LABEL_76;
      }
      if (v84)
      {
        v85 = v84;
        operator delete(v84);
      }
      if (v83) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v83);
      }
      if (v81) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v81);
      }
      _Block_object_dispose(&aBlock, 8);

      _Block_object_dispose(&v95, 8);
    }
    id v57 = objc_alloc((Class)a1);
    v77 = v50;
    v78 = v49;
    if (v49) {
      atomic_fetch_add_explicit(&v49->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    uint64_t v56 = (void *)[v57 initWithFaceIDModel:&v77 entityPrintOriginatingRequestSpecifier:v71 entityUniqueIdentifiers:v67 entityPrintCounts:v66];
    if (v78) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v78);
    }
    goto LABEL_97;
  }
  uint64_t v61 = v9;
  unint64_t v75 = 0;
  __p = 0;
  id v10 = 0;
  uint64_t v72 = 0;
  v69 = 0;
  id v11 = 0;
  while (![(VNCanceller *)v68 wasSignalled])
  {
    long long v64 = [v73 trainedModelUniqueIdentifierOfEntityAtIndex:v72];
    [v67 addObject:v64];
    uint64_t v12 = [v73 trainedModelNumberOfObservationsForEntityAtIndex:v72];
    uint64_t v13 = [NSNumber numberWithUnsignedInteger:v12];
    [v66 addObject:v13];

    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v12];
    if (v12)
    {
      uint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = [v73 trainedModelObservationAtIndex:v15 forEntityAtIndex:v72];
        unint64_t v17 = v16;
        if (!v16 || (VNEntityIdentificationModelObservationConformingObject(v16) & 1) == 0) {
          break;
        }
        id v87 = 0;
        id v18 = [v17 VNEntityIdentificationModelPrintWithOriginatingRequestSpecifier:v71 error:&v87];
        id v19 = v87;
        if (!v18)
        {
          if (a6)
          {
            id v53 = NSString;
            uint64_t v54 = [v17 originatingRequestSpecifier];
            v55 = [v53 stringWithFormat:@"entity index %lu, observation index %lu was generated by %@, which is not compatible with the model requirement of %@", v72, v15, v54, v71];

            VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(3, v55, v19);
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_70;
        }
        [v14 addObject:v18];

        if (v12 == ++v15) {
          goto LABEL_12;
        }
      }
      if (!a6) {
        goto LABEL_71;
      }
      objc_msgSend(NSString, "stringWithFormat:", @"invalid observation at index %lu for entity at index %lu", v15, v72);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
      *a6 = +[VNError errorForInvalidModelWithLocalizedDescription:v19];
LABEL_70:

LABEL_71:
      goto LABEL_72;
    }
LABEL_12:
    v20 = (void *)MEMORY[0x1A6257080]();
    if (v69) {
      atomic_fetch_add_explicit(&v69->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    *(void *)&long long v21 = v11;
    *((void *)&v21 + 1) = v69;
    long long v63 = v21;
    id v22 = v14;
    self;
    uint64_t v23 = [v22 count];
    if (v23)
    {
      v60 = [v22 firstObject];
      size_t v24 = [v60 VNEntityIdentificationModelPrintByteLength];
      id v59 = v20;
      if (v11)
      {
        int v25 = *((_DWORD *)v11 + 18);
      }
      else
      {
        objc_super v26 = operator new(8uLL);
        void *v26 = 1;
        v96 = (void **)(v26 + 1);
        uint64_t v97 = (uint64_t)(v26 + 1);
        v95 = v26;
        v27 = malloc_type_malloc(v24, 0x3B8CBC45uLL);
        std::allocate_shared[abi:ne180100]<vision::mod::ImageDescriptorBufferFloat32,std::allocator<vision::mod::ImageDescriptorBufferFloat32>,std::vector<long long> &,void *,unsigned long const&,int,BOOL,void>((uint64_t *)&aBlock, &v95, v27, v24, 1, 1);
        long long v63 = aBlock;
        long long aBlock = 0uLL;
        if (v69)
        {
          std::__shared_weak_count::__release_shared[abi:nn180100](v69);
          if (*((void *)&aBlock + 1)) {
            std::__shared_weak_count::__release_shared[abi:nn180100](*((std::__shared_weak_count **)&aBlock + 1));
          }
        }
        if (v95) {
          operator delete(v95);
        }
        int v25 = 0;
        id v11 = (vision::mod::ImageDescriptorBufferAbstract *)v63;
      }
      vision::mod::ImageDescriptorBufferAbstract::resizeForDescriptorsCount(v11, v23 + v25, v25 > 0);
      std::vector<long long>::resize((char **)(v63 + 8), v23 + v25);
      uint64_t v28 = 0;
      unint64_t v29 = v25;
      int v74 = v72 + 1;
      do
      {
        id v30 = v22;
        id v31 = [v22 objectAtIndexedSubscript:v28];
        std::ios_base v32 = [v31 VNEntityIdentificationModelPrintData];
        DataForKthDescriptor = (void *)vision::mod::ImageDescriptorBufferAbstract::getDataForKthDescriptor((vision::mod::ImageDescriptorBufferAbstract *)v63, v29);
        id v34 = v32;
        memcpy(DataForKthDescriptor, (const void *)[v34 bytes], v24);
        vision::mod::ImageDescriptorBufferAbstract::setDescriptorIdForKthDescriptor((vision::mod::ImageDescriptorBufferAbstract *)v63, v29, v74);
        if ((unint64_t)v10 >= v75)
        {
          uint64_t v35 = (v10 - __p) >> 2;
          unint64_t v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) >> 62) {
            std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v75 - (void)__p) >> 1 > v36) {
            unint64_t v36 = (uint64_t)(v75 - (void)__p) >> 1;
          }
          if (v75 - (unint64_t)__p >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v37 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v37 = v36;
          }
          if (v37) {
            unint64_t v37 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v37);
          }
          else {
            uint64_t v38 = 0;
          }
          v39 = (char *)(v37 + 4 * v35);
          *(_DWORD *)v39 = v74;
          v40 = v39 + 4;
          if (v10 == __p)
          {
            uint64_t v41 = __p;
          }
          else
          {
            uint64_t v41 = __p;
            do
            {
              int v42 = *((_DWORD *)v10 - 1);
              v10 -= 4;
              *((_DWORD *)v39 - 1) = v42;
              v39 -= 4;
            }
            while (v10 != __p);
          }
          unint64_t v75 = v37 + 4 * v38;
          if (v41) {
            operator delete(v41);
          }
          __p = v39;
          id v10 = v40;
          id v8 = v70;
        }
        else
        {
          *(_DWORD *)id v10 = v74;
          v10 += 4;
        }
        ++v29;

        ++v28;
        id v22 = v30;
      }
      while (v28 != v23);

      id v11 = (vision::mod::ImageDescriptorBufferAbstract *)v63;
      v20 = v59;
    }

    if (v69) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v69);
    }
    v69 = (std::__shared_weak_count *)*((void *)&v63 + 1);

    if (++v72 == v61) {
      goto LABEL_52;
    }
  }
  if (!a6)
  {
LABEL_72:
    uint64_t v56 = 0;
    goto LABEL_99;
  }
  VNEntityIdentificationModelErrorWithLocalizedDescriptionAndUnderlyingError(4, @"operation was cancelled", 0);
  uint64_t v56 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_99:

  if (__p) {
    operator delete(__p);
  }
  if (v69) {
    std::__shared_weak_count::__release_shared[abi:nn180100](v69);
  }

  return v56;
}

void *__112__VNEntityIdentificationModelTrainedModelVIPv3_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke(uint64_t a1)
{
  result = (void *)vision::mod::FaceID3Model::buildModel(*(void *)(a1 + 48), *(vision::mod::ImageDescriptorBufferAbstract **)(a1 + 64), (uint64_t *)(a1 + 80), *(void *)(*(void *)(a1 + 32) + 8) + 48);
  if (result != 128)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = VNErrorForCVMLStatus(result);
    return (void *)MEMORY[0x1F41817F8]();
  }
  return result;
}

uint64_t __112__VNEntityIdentificationModelTrainedModelVIPv3_trainedModelBuiltFromConfiguration_dataProvider_canceller_error___block_invoke_52(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 56) = 1;
  return result;
}

+ (BOOL)getStoredRepresentationTag:(unsigned int *)a3 forModelVersion:(unint64_t)a4 error:(id *)a5
{
  *a3 = 1447645235;
  return 1;
}

@end