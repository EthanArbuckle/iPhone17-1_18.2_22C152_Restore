@interface VNCreateAnimalprintRequest
+ (BOOL)_isAnimalFaceprintingSupportedForRequestRevision:(unint64_t)a3;
+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4;
+ (const)dependentRequestMappingTable;
+ (const)revisionAvailability;
+ (id)createVNEntityIdentificationModelEntryPrintForRevision:(unint64_t)a3 fromDescriptorData:(const void *)a4 length:(unint64_t)a5 elementCount:(unint64_t)a6 error:(id *)a7;
+ (id)descriptionForPrivateRevision:(unint64_t)a3;
+ (id)privateRevisionsSet;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (int64_t)dependencyProcessingOrdinality;
- (void)_determineAnimalsToProcessFrom:(id)a3 outputAnimalsThatNeedNoProcessing:(id)a4 outputAnimalsThatNeedAnimalprints:(id)a5;
@end

@implementation VNCreateAnimalprintRequest

+ (BOOL)_isAnimalFaceprintingSupportedForRequestRevision:(unint64_t)a3
{
  return a3 == 3737841667;
}

+ (const)dependentRequestMappingTable
{
  {
    +[VNCreateAnimalprintRequest dependentRequestMappingTable]::ourDependentRequestMappingTable = 1;
    qword_1E96408B0 = objc_opt_class();
    unk_1E96408B8 = xmmword_1A410C250;
    qword_1E96408C8 = objc_opt_class();
    unk_1E96408D0 = 1;
    qword_1E96408E0 = 0;
    unk_1E96408E8 = 0;
    qword_1E96408D8 = 0;
  }
  return (const $BB6EA70A2DEABF36E8ECE2B2BD0E2E04 *)&+[VNCreateAnimalprintRequest dependentRequestMappingTable]::ourDependentRequestMappingTable;
}

+ (BOOL)recordSpecifierModelEquivalenciesInRegistrar:(id)a3 error:(id *)a4
{
  return [a3 registerRequestClass:a1 revision:3737841664 equivalencyToRevision:1 error:a4];
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v76 = 0;
  v56 = v8;
  BOOL v9 = [(VNImageBasedRequest *)self getOptionalValidatedInputDetectedObjectObservations:&v76 forObservationClass:objc_opt_class() relationWithRegionOfInterest:1 error:a5];
  id v57 = v76;
  if (v9)
  {
    unint64_t v53 = a3;
    v58 = a5;
    id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v57)
    {
      [(VNCreateAnimalprintRequest *)self _determineAnimalsToProcessFrom:v57 outputAnimalsThatNeedNoProcessing:v55 outputAnimalsThatNeedAnimalprints:v10];
    }
    else
    {
      v54 = [v8 requestPerformerAndReturnError:a5];
      if (!v54)
      {
        BOOL v29 = 0;
        goto LABEL_42;
      }
      v62 = objc_alloc_init(VNRecognizeAnimalsRequest);
      [(VNImageBasedRequest *)v62 applyConfigurationOfRequest:self];
      v59 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v62, 0);
      if ([(id)objc_opt_class() _isAnimalFaceprintingSupportedForRequestRevision:v53])
      {
        v30 = objc_alloc_init(VNRecognizeAnimalFacesRequest);
        [(VNImageBasedRequest *)v30 applyConfigurationOfRequest:self];
        [v59 addObject:v30];
      }
      if (([v54 performDependentRequests:v59 onBehalfOfRequest:self inContext:v8 error:a5] & 1) == 0) {
        goto LABEL_37;
      }
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      id obja = v59;
      uint64_t v31 = [obja countByEnumeratingWithState:&v72 objects:v80 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v73;
        do
        {
          for (uint64_t i = 0; i != v31; ++i)
          {
            if (*(void *)v73 != v32) {
              objc_enumerationMutation(obja);
            }
            v34 = *(void **)(*((void *)&v72 + 1) + 8 * i);
            long long v68 = 0u;
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            v35 = [v34 results];
            uint64_t v36 = [v35 countByEnumeratingWithState:&v68 objects:v79 count:16];
            if (v36)
            {
              uint64_t v37 = *(void *)v69;
              do
              {
                for (uint64_t j = 0; j != v36; ++j)
                {
                  if (*(void *)v69 != v37) {
                    objc_enumerationMutation(v35);
                  }
                  v39 = *(void **)(*((void *)&v68 + 1) + 8 * j);
                  [(VNImageBasedRequest *)self regionOfInterest];
                  CGFloat v41 = v40;
                  CGFloat v43 = v42;
                  CGFloat v45 = v44;
                  CGFloat v47 = v46;
                  [v39 boundingBox];
                  v83.origin.x = v48;
                  v83.origin.y = v49;
                  v83.size.width = v50;
                  v83.size.height = v51;
                  v82.origin.x = v41;
                  v82.origin.y = v43;
                  v82.size.width = v45;
                  v82.size.height = v47;
                  if (CGRectIntersectsRect(v82, v83)) {
                    [v10 addObject:v39];
                  }
                }
                uint64_t v36 = [v35 countByEnumeratingWithState:&v68 objects:v79 count:16];
              }
              while (v36);
            }
          }
          uint64_t v31 = [obja countByEnumeratingWithState:&v72 objects:v80 count:16];
        }
        while (v31);
      }

      id v8 = v56;
    }
    v54 = [v8 session];
    id v11 = [(VNRequest *)self newDefaultDetectorOptionsForRequestRevision:v53 session:v54];
    id v67 = v11;
    v59 = [(VNRequest *)self applicableDetectorAndOptions:&v67 forRevision:v53 loadedInSession:v54 error:v58];
    v62 = (VNRecognizeAnimalsRequest *)v67;

    if (v59)
    {
      v12 = [MEMORY[0x1E4F1CA48] arrayWithArray:v55];
      uint64_t v13 = [v56 imageBufferAndReturnError:v58];
      obuint64_t j = (id)v13;
      if (v13)
      {
        uint64_t v78 = v13;
        v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
        [(VNRecognizeAnimalsRequest *)v62 setObject:v14 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

        [(VNImageBasedRequest *)self regionOfInterest];
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        uint64_t v23 = [v56 qosClass];
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v24 = v10;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v63 objects:v77 count:16];
        if (v25)
        {
          uint64_t v26 = *(void *)v64;
          while (2)
          {
            for (uint64_t k = 0; k != v25; ++k)
            {
              if (*(void *)v64 != v26) {
                objc_enumerationMutation(v24);
              }
              [(VNRecognizeAnimalsRequest *)v62 setObject:*(void *)(*((void *)&v63 + 1) + 8 * k) forKeyedSubscript:@"VNAnimalprintDetectorProcessOption_InputAnimalObservation"];
              v28 = objc_msgSend(v59, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v23, v62, self, v58, 0, v16, v18, v20, v22);
              if (!v28)
              {

                goto LABEL_39;
              }
              [v12 addObjectsFromArray:v28];
            }
            uint64_t v25 = [v24 countByEnumeratingWithState:&v63 objects:v77 count:16];
            if (v25) {
              continue;
            }
            break;
          }
        }

        [(VNRequest *)self setResults:v12];
        BOOL v29 = 1;
      }
      else
      {
LABEL_39:
        BOOL v29 = 0;
      }

      goto LABEL_41;
    }
LABEL_37:
    BOOL v29 = 0;
LABEL_41:

LABEL_42:
    goto LABEL_43;
  }
  BOOL v29 = 0;
LABEL_43:

  return v29;
}

- (void)_determineAnimalsToProcessFrom:(id)a3 outputAnimalsThatNeedNoProcessing:(id)a4 outputAnimalsThatNeedAnimalprints:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        double v16 = v9;
        if (isKindOfClass)
        {
          double v17 = objc_msgSend(v14, "animalprint", (void)v19);
          BOOL v18 = v17 == 0;

          if (v18) {
            double v16 = v9;
          }
          else {
            double v16 = v8;
          }
        }
        objc_msgSend(v16, "addObject:", v14, (void)v19);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

- (int64_t)dependencyProcessingOrdinality
{
  return VNRequestDependencyProcessingOrdinalityAdjustedForConfiguredRequest(3000, self);
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 3737841667 || a3 == 1)
  {
    v5 = @"VNAnimalprintDetectorDetectorType";
    v6 = @"VNAnimalprintDetectorDetectorType";
  }
  else if (a4)
  {
    +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
    v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)descriptionForPrivateRevision:(unint64_t)a3
{
  if (a3 - 3737841665u >= 3)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___VNCreateAnimalprintRequest;
    v3 = objc_msgSendSuper2(&v5, sel_descriptionForPrivateRevision_);
  }
  else
  {
    v3 = (void *)*((void *)&off_1E5B1DAD8 + a3 - 3737841665u);
  }

  return v3;
}

+ (id)privateRevisionsSet
{
  if (+[VNCreateAnimalprintRequest(Revisioning) privateRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNCreateAnimalprintRequest(Revisioning) privateRevisionsSet]::onceToken, &__block_literal_global_17806);
  }
  v2 = (void *)+[VNCreateAnimalprintRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions;

  return v2;
}

uint64_t __62__VNCreateAnimalprintRequest_Revisioning__privateRevisionsSet__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  +[VNCreateAnimalprintRequest(Revisioning) privateRevisionsSet]::ourPrivateRevisions = VNRequestPrivateRevisionsSet(0xDECAF003uLL, a2, a3, a4, a5, a6, a7, a8, 0);

  return MEMORY[0x1F41817F8]();
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNCreateAnimalprintRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

+ (id)createVNEntityIdentificationModelEntryPrintForRevision:(unint64_t)a3 fromDescriptorData:(const void *)a4 length:(unint64_t)a5 elementCount:(unint64_t)a6 error:(id *)a7
{
  uint64_t v11 = [VNAnimalprint alloc];
  LODWORD(v12) = 1.0;
  uint64_t v13 = [(VNAnimalprint *)v11 initWithData:a4 elementCount:a6 elementType:1 lengthInBytes:a5 confidence:a3 requestRevision:v12];

  return v13;
}

@end