@interface VNDetectScreenGazeRequest
+ (Class)configurationClass;
+ (const)revisionAvailability;
+ (id)publicRevisionsSet;
+ (unint64_t)applicableRevisionForDependentRequestOfClass:(Class)a3 beingPerformedByRevision:(unint64_t)a4;
- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5;
- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier;
- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3;
- (VNDetectScreenGazeRequest)init;
- (VNDetectScreenGazeRequest)initWithCompletionHandler:(id)a3;
- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4;
- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4;
- (int64_t)temporalSmoothingFrameCount;
- (unint64_t)screenSize;
- (void)applyConfigurationOfRequest:(id)a3;
- (void)setScreenSize:(unint64_t)a3;
- (void)setTemporalSmoothingFrameCount:(int64_t)a3;
@end

@implementation VNDetectScreenGazeRequest

+ (id)publicRevisionsSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__VNDetectScreenGazeRequest_publicRevisionsSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNDetectScreenGazeRequest publicRevisionsSet]::onceToken != -1) {
    dispatch_once(&+[VNDetectScreenGazeRequest publicRevisionsSet]::onceToken, block);
  }
  v2 = (void *)+[VNDetectScreenGazeRequest publicRevisionsSet]::supportedPublicRevisions;

  return v2;
}

void __47__VNDetectScreenGazeRequest_publicRevisionsSet__block_invoke(uint64_t a1)
{
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)&OBJC_METACLASS___VNDetectScreenGazeRequest;
  uint64_t v1 = objc_msgSendSuper2(&v6, sel_publicRevisionsSet);
  v2 = (void *)+[VNDetectScreenGazeRequest publicRevisionsSet]::supportedPublicRevisions;
  +[VNDetectScreenGazeRequest publicRevisionsSet]::supportedPublicRevisions = v1;

  if (!+[VNScreenGazeDetectorRevision2 supportsExecution])
  {
    v3 = (void *)[(id)+[VNDetectScreenGazeRequest publicRevisionsSet]::supportedPublicRevisions mutableCopy];
    [v3 removeIndex:2];
    uint64_t v4 = [v3 copy];
    v5 = (void *)+[VNDetectScreenGazeRequest publicRevisionsSet]::supportedPublicRevisions;
    +[VNDetectScreenGazeRequest publicRevisionsSet]::supportedPublicRevisions = v4;
  }
}

+ (unint64_t)applicableRevisionForDependentRequestOfClass:(Class)a3 beingPerformedByRevision:(unint64_t)a4
{
  if (a4 == 2 && ([(objc_class *)a3 isEqual:objc_opt_class()] & 1) != 0) {
    return 3737841670;
  }
  else {
    return 0;
  }
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
}

- (void)setScreenSize:(unint64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setScreenSize:a3];
}

- (unint64_t)screenSize
{
  v2 = [(VNRequest *)self configuration];
  unint64_t v3 = [v2 screenSize];

  return v3;
}

- (void)setTemporalSmoothingFrameCount:(int64_t)a3
{
  id v4 = [(VNRequest *)self configuration];
  [v4 setTemporalSmoothingFrameCount:a3];
}

- (int64_t)temporalSmoothingFrameCount
{
  v2 = [(VNRequest *)self configuration];
  int64_t v3 = [v2 temporalSmoothingFrameCount];

  return v3;
}

- (BOOL)willAcceptCachedResultsFromRequestWithConfiguration:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(VNDetectScreenGazeRequest *)self temporalSmoothingFrameCount];
  if (v5 == [v4 temporalSmoothingFrameCount])
  {
    v8.receiver = self;
    v8.super_class = (Class)VNDetectScreenGazeRequest;
    BOOL v6 = [(VNImageBasedRequest *)&v8 willAcceptCachedResultsFromRequestWithConfiguration:v4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)internalPerformRevision:(unint64_t)a3 inContext:(id)a4 error:(id *)a5
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v84 = v8;
  if (!self->_state)
  {
    v9 = a5;
    v10 = [VNScreenGazeState alloc];
    int v11 = [(VNDetectScreenGazeRequest *)self temporalSmoothingFrameCount];
    if (v10)
    {
      int v12 = v11;
      v114.receiver = v10;
      v114.super_class = (Class)VNScreenGazeState;
      v13 = [(VNRequest *)&v114 init];
      v10 = (VNScreenGazeState *)v13;
      if (v13)
      {
        LODWORD(v13->super.super.super._completionHandler) = v12;
        v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        faceObjectStates = v10->_faceObjectStates;
        v10->_faceObjectStates = v14;
      }
    }
    state = self->_state;
    self->_state = v10;

    id v8 = v84;
    a5 = v9;
  }
  v92 = a5;
  v17 = [v8 imageBufferAndReturnError:a5];
  v18 = v17;
  v82 = v17;
  if (!v17)
  {
    BOOL v23 = 0;
    goto LABEL_91;
  }
  uint64_t v86 = [v17 width];
  uint64_t v85 = [v18 height];
  id v91 = v84;
  *(void *)&long long v103 = 0;
  BOOL v19 = [(VNImageBasedRequest *)self getOptionalValidatedInputFaceObservations:&v103 clippedToRegionOfInterest:1 error:v92];
  id v20 = (id)v103;
  id v21 = v20;
  if (v19)
  {
    id v22 = v20;
    if (v22)
    {
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id v24 = v22;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v110 objects:&v114 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v111;
        while (2)
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v111 != v26) {
              objc_enumerationMutation(v24);
            }
            v28 = *(void **)(*((void *)&v110 + 1) + 8 * i);
            v29 = [v28 landmarks];
            if (!v29 || (unint64_t)[v28 requestRevision] < 2)
            {

              goto LABEL_22;
            }
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v110 objects:&v114 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }

      id v21 = v24;
      v80 = v21;
      goto LABEL_33;
    }
  }
LABEL_22:
  v30 = [v91 requestPerformerAndReturnError:v92];
  if (!v30) {
    goto LABEL_31;
  }
  if (!v21)
  {
    v31 = objc_alloc_init(VNDetectFaceRectanglesRequest);
    [(VNDetectFaceRectanglesRequest *)v31 applyConfigurationOfRequest:self];
    v114.receiver = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v114 count:1];
    char v33 = [v30 performDependentRequests:v32 onBehalfOfRequest:self inContext:v91 error:v92];

    if ((v33 & 1) == 0)
    {

      id v21 = 0;
      goto LABEL_31;
    }
    id v21 = [(VNRequest *)v31 results];
  }
  if (a3 != 2)
  {
    if (v92)
    {
      +[VNError errorForUnsupportedRevision:a3 ofRequest:self];
      v80 = 0;
      id *v92 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
LABEL_31:
    v80 = 0;
    goto LABEL_32;
  }
  id v21 = v21;
  v80 = v21;
LABEL_32:

LABEL_33:
  if (v80)
  {
    [v91 session];
    v79 = id v97 = 0;
    uint64_t v34 = -[VNRequest applicableDetectorAndOptions:forRevision:loadedInSession:error:](self, "applicableDetectorAndOptions:forRevision:loadedInSession:error:", &v97, a3);
    id v35 = v97;
    v90 = (void *)v34;
    if (v34)
    {
      id v89 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v36 = self->_state;
      if (v36) {
        ++v36->_currentFrame;
      }
      v109 = v82;
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v109 count:1];
      [v35 setObject:v37 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id obj = v80;
      uint64_t v38 = [obj countByEnumeratingWithState:&v93 objects:v108 count:16];
      if (v38)
      {
        uint64_t v88 = *(void *)v94;
        v39 = &selRef_extent;
        do
        {
          uint64_t v87 = v38;
          uint64_t v40 = 0;
          v81 = v39[318];
          do
          {
            if (*(void *)v94 != v88) {
              objc_enumerationMutation(obj);
            }
            v41 = self->_state;
            id v42 = *(id *)(*((void *)&v93 + 1) + 8 * v40);
            if (v41)
            {
              long long v100 = 0u;
              long long v101 = 0u;
              long long v98 = 0u;
              long long v99 = 0u;
              v43 = v41->_faceObjectStates;
              uint64_t v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v98 objects:&v110 count:16];
              if (v44)
              {
                uint64_t v45 = *(void *)v99;
                do
                {
                  uint64_t v46 = 0;
                  do
                  {
                    if (*(void *)v99 != v45) {
                      objc_enumerationMutation(v43);
                    }
                    v47 = *(id **)(*((void *)&v98 + 1) + 8 * v46);
                    if (v47)
                    {
                      [v47[1] boundingBox];
                      CGFloat v49 = v48;
                      CGFloat v51 = v50;
                      double v53 = v52;
                      double v55 = v54;
                    }
                    else
                    {
                      CGFloat v51 = 0.0;
                      double v53 = 0.0;
                      double v55 = 0.0;
                      CGFloat v49 = 0.0;
                    }
                    [v42 boundingBox];
                    v118.origin.x = v56;
                    v118.origin.y = v57;
                    v118.size.width = v58;
                    v118.size.height = v59;
                    v116.origin.x = v49;
                    v116.origin.y = v51;
                    v116.size.width = v53;
                    v116.size.height = v55;
                    CGRect v117 = CGRectIntersection(v116, v118);
                    if (v117.size.width * v117.size.height / (v53 * v55) >= 0.7)
                    {
                      -[VNScreenGazeFaceObjectState _replaceFaceObservation:imageWidth:imageHeight:frameIndex:]((uint64_t)v47, v42, v86, v85, v41->_currentFrame);
                      v61 = v47;

                      goto LABEL_60;
                    }
                    ++v46;
                  }
                  while (v44 != v46);
                  uint64_t v60 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v98 objects:&v110 count:16];
                  uint64_t v44 = v60;
                }
                while (v60);
              }

              v61 = [VNScreenGazeFaceObjectState alloc];
              id v62 = v42;
              if (v61)
              {
                v102.receiver = v61;
                v102.super_class = (Class)VNScreenGazeFaceObjectState;
                v61 = (VNScreenGazeFaceObjectState *)objc_msgSendSuper2(&v102, v81);
                if (v61)
                {
                  uint64_t v63 = [v62 uuid];
                  uuid = v61->_uuid;
                  v61->_uuid = (NSUUID *)v63;

                  operator new();
                }
              }

              [(NSMutableArray *)v41->_faceObjectStates addObject:v61];
            }
            else
            {
              v61 = 0;
            }
LABEL_60:

            id v107 = v42;
            v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
            [v35 setObject:v65 forKeyedSubscript:@"VNDetectorProcessOption_InputFaceObservations"];

            [v35 setObject:v61 forKeyedSubscript:@"VNScreenGazeDetectorProcessOption_FaceObjectState"];
            uint64_t v66 = [v91 qosClass];
            [(VNImageBasedRequest *)self regionOfInterest];
            v67 = objc_msgSend(v90, "processUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:", v66, v35, self, v92, 0);
            if (!v67)
            {

              int v68 = 1;
              goto LABEL_68;
            }
            [v89 addObjectsFromArray:v67];

            ++v40;
          }
          while (v40 != v87);
          uint64_t v38 = [obj countByEnumeratingWithState:&v93 objects:v108 count:16];
          v39 = &selRef_extent;
        }
        while (v38);
      }
      int v68 = 0;
LABEL_68:

      v69 = self->_state;
      if (v69)
      {
        if (v69->_temporalSmoothingFrameCount > 1)
        {
          id v70 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v105 = 0u;
          long long v106 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          v71 = v69->_faceObjectStates;
          uint64_t v72 = [(NSMutableArray *)v71 countByEnumeratingWithState:&v103 objects:&v114 count:16];
          if (v72)
          {
            uint64_t v73 = *(void *)v104;
            do
            {
              uint64_t v74 = 0;
              do
              {
                if (*(void *)v104 != v73) {
                  objc_enumerationMutation(v71);
                }
                uint64_t v75 = *(void *)(*((void *)&v103 + 1) + 8 * v74);
                if (v75) {
                  int v76 = *(_DWORD *)(v75 + 32);
                }
                else {
                  int v76 = 0;
                }
                if (v76 != v69->_currentFrame) {
                  objc_msgSend(v70, "addObject:");
                }
                ++v74;
              }
              while (v72 != v74);
              uint64_t v77 = [(NSMutableArray *)v71 countByEnumeratingWithState:&v103 objects:&v114 count:16];
              uint64_t v72 = v77;
            }
            while (v77);
          }

          [(NSMutableArray *)v69->_faceObjectStates removeObjectsInArray:v70];
        }
        else
        {
          [(NSMutableArray *)v69->_faceObjectStates removeAllObjects];
        }
      }
      BOOL v23 = v68 == 0;
      if (!v68) {
        [(VNRequest *)self setResults:v89];
      }
    }
    else
    {
      BOOL v23 = 0;
    }
  }
  else
  {
    BOOL v23 = 0;
  }

LABEL_91:
  return v23;
}

- (BOOL)resultsAreAssignedWithOriginatingRequestSpecifier
{
  return 0;
}

- (id)applicableDetectorTypeForRevision:(unint64_t)a3 error:(id *)a4
{
  if (a3 == 2)
  {
    if (+[VNScreenGazeDetectorRevision2 supportsExecution])
    {
      int64_t v5 = @"VNE5RTScreenGazeDetectorType";
      BOOL v6 = @"VNE5RTScreenGazeDetectorType";
      goto LABEL_10;
    }
    if (a4)
    {
      v7 = +[VNError errorWithCode:22 message:@"Requires newer ANE device"];
      goto LABEL_8;
    }
  }
  else if (a4)
  {
    v7 = +[VNError errorForUnsupportedRevision:ofRequest:](VNError, "errorForUnsupportedRevision:ofRequest:");
LABEL_8:
    int64_t v5 = 0;
    *a4 = v7;
    goto LABEL_10;
  }
  int64_t v5 = 0;
LABEL_10:

  return v5;
}

- (void)applyConfigurationOfRequest:(id)a3
{
  id v4 = (VNDetectScreenGazeRequest *)a3;
  if (self != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)VNDetectScreenGazeRequest;
    [(VNImageBasedRequest *)&v6 applyConfigurationOfRequest:v4];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v5 = v4;
      [(VNDetectScreenGazeRequest *)self setTemporalSmoothingFrameCount:[(VNDetectScreenGazeRequest *)v5 temporalSmoothingFrameCount]];
    }
  }
}

- (VNDetectScreenGazeRequest)initWithCompletionHandler:(id)a3
{
  id v4 = a3;
  CMTimeMake(&v8, 0, 1);
  v7.receiver = self;
  v7.super_class = (Class)VNDetectScreenGazeRequest;
  int64_t v5 = [(VNStatefulRequest *)&v7 initWithFrameAnalysisSpacing:&v8 completionHandler:v4];

  return v5;
}

- (VNDetectScreenGazeRequest)init
{
  return [(VNDetectScreenGazeRequest *)self initWithCompletionHandler:0];
}

- (id)newDefaultDetectorOptionsForRequestRevision:(unint64_t)a3 session:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)VNDetectScreenGazeRequest;
  id v6 = [(VNRequest *)&v9 newDefaultDetectorOptionsForRequestRevision:a3 session:a4];
  if (a3 == 2)
  {
    objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[VNDetectScreenGazeRequest screenSize](self, "screenSize"));
    [v6 setObject:v7 forKeyedSubscript:@"VNScreenGazeDetectorInitOption_ScreenSize"];
  }
  return v6;
}

+ (const)revisionAvailability
{
  return (const $1305BF644A263E76A656B24897EDB60D *)&+[VNDetectScreenGazeRequest(Revisioning) revisionAvailability]::ourRevisionAvailability;
}

@end