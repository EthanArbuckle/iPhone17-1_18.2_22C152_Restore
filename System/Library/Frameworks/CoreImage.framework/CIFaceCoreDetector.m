@interface CIFaceCoreDetector
- (CGAffineTransform)ctmForImageWithBounds:(SEL)a3 orientation:(CGRect)a4;
- (CIContext)context;
- (CIFaceCoreDetector)initWithContext:(id)a3 options:(id)a4;
- (VNDetectFaceRectanglesRequest)visionRequest;
- (VNTrackLegacyFaceCoreObjectRequest)visionTrackingRequest;
- (id)adjustedImageFromImage:(id)a3 orientation:(int)a4 inverseCTM:(CGAffineTransform *)a5;
- (id)createFaceCoreDataFromCIImage:(id)a3 width:(unint64_t *)a4 height:(unint64_t *)a5;
- (id)featuresInImage:(id)a3;
- (id)featuresInImage:(id)a3 options:(id)a4;
- (void)dealloc;
- (void)setContext:(id)a3;
- (void)setVisionRequest:(id)a3;
- (void)setVisionTrackingRequest:(id)a3;
@end

@implementation CIFaceCoreDetector

- (CIFaceCoreDetector)initWithContext:(id)a3 options:(id)a4
{
  v35.receiver = self;
  v35.super_class = (Class)CIFaceCoreDetector;
  v6 = [(CIDetector *)&v35 init];
  if (!v6) {
    return v6;
  }
  if (!a3) {
    a3 = +[CIContext _singletonContext];
  }
  [(CIFaceCoreDetector *)v6 setContext:a3];
  v7 = (void *)[a4 objectForKey:@"CIDetectorAccuracy"];
  unsigned int v8 = [v7 isEqual:@"CIDetectorAccuracyLow"];
  unsigned int v9 = v8;
  if (v7 && (v8 & 1) == 0 && ([v7 isEqual:@"CIDetectorAccuracyHigh"] & 1) == 0) {
    NSLog(&cfstr_UnknownCidetec.isa);
  }
  uint64_t v10 = [a4 objectForKey:@"CIDetectorTracking"];
  v6->_tracking = 0;
  uint64_t v11 = *MEMORY[0x1E4F1CFD0];
  v12 = (void *)MEMORY[0x1E4F1CFC8];
  if (v10 == *MEMORY[0x1E4F1CFD0])
  {
    v6->_tracking = 1;
  }
  else
  {
    if (v10) {
      BOOL v13 = v10 == *MEMORY[0x1E4F1CFC8];
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13) {
      NSLog(&cfstr_UnknownCidetec_0.isa);
    }
  }
  uint64_t v14 = [a4 objectForKey:@"CIDetectorBetterEyeLocs"];
  BOOL v15 = (v9 & 1) == 0 && !v6->_tracking;
  if (v14 == v11) {
    BOOL v15 = 1;
  }
  BOOL v16 = v14 != *v12 && v15;
  v17 = (void *)[a4 objectForKey:@"CIDetectorMinFeatureSize"];
  v18 = v17;
  if (v17)
  {
    [v17 floatValue];
    float v20 = v19;
  }
  else
  {
    float v20 = 0.15;
  }
  if (v20 <= 0.0 || v20 > 1.0)
  {
    NSLog(&cfstr_UnknownCidetec_1.isa);
    v18 = 0;
  }
  v21 = (void *)[a4 objectForKey:@"CIDetectorNumberOfAngles"];
  v23 = v21;
  if (v21) {
    [v21 floatValue];
  }
  else {
    LODWORD(v22) = -1.0;
  }
  long long v34 = v22;
  if (v23
    && *(float *)&v22 != 1.0
    && (vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vceqq_f32((float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v22, 0), (float32x4_t)xmmword_193953140), (int8x16_t)xmmword_193953150)) & 0xF) == 0&& *(float *)&v22 != 11.0)
  {
    NSLog(&cfstr_UnknownCidetec_2.isa);
    v23 = 0;
  }
  if (v6->_tracking)
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3052000000;
    v44 = __Block_byref_object_copy__6;
    v45 = __Block_byref_object_dispose__6;
    v25 = (void *)getVNFaceObservationClass(void)::softClass;
    uint64_t v46 = getVNFaceObservationClass(void)::softClass;
    if (!getVNFaceObservationClass(void)::softClass)
    {
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      v38 = ___ZL25getVNFaceObservationClassv_block_invoke;
      v39 = &unk_1E57710B8;
      v40 = &v41;
      ___ZL25getVNFaceObservationClassv_block_invoke((uint64_t)&v36);
      v25 = (void *)v42[5];
    }
    _Block_object_dispose(&v41, 8);
    uint64_t v26 = objc_msgSend(v25, "faceObservationWithRequestRevision:boundingBox:roll:yaw:pitch:", 0, 0, 0, 0, 0.0, 0.0, 1.0, 1.0);
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3052000000;
    v44 = __Block_byref_object_copy__6;
    v45 = __Block_byref_object_dispose__6;
    v27 = (objc_class *)getVNTrackLegacyFaceCoreObjectRequestClass(void)::softClass;
    uint64_t v46 = getVNTrackLegacyFaceCoreObjectRequestClass(void)::softClass;
    if (!getVNTrackLegacyFaceCoreObjectRequestClass(void)::softClass)
    {
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      v38 = ___ZL42getVNTrackLegacyFaceCoreObjectRequestClassv_block_invoke;
      v39 = &unk_1E57710B8;
      v40 = &v41;
      ___ZL42getVNTrackLegacyFaceCoreObjectRequestClassv_block_invoke((uint64_t)&v36);
      v27 = (objc_class *)v42[5];
    }
    _Block_object_dispose(&v41, 8);
    v28 = (VNTrackLegacyFaceCoreObjectRequest *)[[v27 alloc] initWithDetectedObjectObservation:v26];
    p_visionTrackingRequest = (id *)&v6->visionTrackingRequest;
    v6->visionTrackingRequest = v28;
    [(VNTrackLegacyFaceCoreObjectRequest *)v28 setRevision:3737841664 error:0];
    [(VNTrackLegacyFaceCoreObjectRequest *)v6->visionTrackingRequest setTrackingLevel:v9];
    if (!v18) {
      goto LABEL_46;
    }
  }
  else
  {
    uint64_t v41 = 0;
    v42 = &v41;
    uint64_t v43 = 0x3052000000;
    v44 = __Block_byref_object_copy__6;
    v45 = __Block_byref_object_dispose__6;
    v32 = (objc_class *)getVNDetectFaceRectanglesRequestClass(void)::softClass;
    uint64_t v46 = getVNDetectFaceRectanglesRequestClass(void)::softClass;
    if (!getVNDetectFaceRectanglesRequestClass(void)::softClass)
    {
      uint64_t v36 = MEMORY[0x1E4F143A8];
      uint64_t v37 = 3221225472;
      v38 = ___ZL37getVNDetectFaceRectanglesRequestClassv_block_invoke;
      v39 = &unk_1E57710B8;
      v40 = &v41;
      ___ZL37getVNDetectFaceRectanglesRequestClassv_block_invoke((uint64_t)&v36);
      v32 = (objc_class *)v42[5];
    }
    _Block_object_dispose(&v41, 8);
    v33 = (VNDetectFaceRectanglesRequest *)objc_alloc_init(v32);
    p_visionTrackingRequest = (id *)&v6->visionRequest;
    v6->visionRequest = v33;
    [(VNDetectFaceRectanglesRequest *)v33 setRevision:3737841665 error:0];
    [(VNDetectFaceRectanglesRequest *)v6->visionRequest setFaceCoreType:v9];
    if (!v18) {
      goto LABEL_46;
    }
  }
  *(float *)&double v30 = v20;
  objc_msgSend(*p_visionTrackingRequest, "setFaceCoreMinFaceSize:", objc_msgSend(NSNumber, "numberWithFloat:", v30, v34));
LABEL_46:
  if (v23) {
    objc_msgSend(*p_visionTrackingRequest, "setFaceCoreNumberOfDetectionAngles:", objc_msgSend(NSNumber, "numberWithFloat:", *(double *)&v34));
  }
  objc_msgSend(*p_visionTrackingRequest, "setFaceCoreEnhanceEyesAndMouthLocalization:", v16, v34);
  [*p_visionTrackingRequest setFaceCoreExtractBlink:1];
  [*p_visionTrackingRequest setFaceCoreExtractSmile:1];
  return v6;
}

- (void)dealloc
{
  [(CIFaceCoreDetector *)self setContext:0];
  visionRequest = self->visionRequest;
  if (visionRequest) {

  }
  visionTrackingRequest = self->visionTrackingRequest;
  if (visionTrackingRequest) {

  }
  v5.receiver = self;
  v5.super_class = (Class)CIFaceCoreDetector;
  [(CIFaceCoreDetector *)&v5 dealloc];
}

- (id)featuresInImage:(id)a3 options:(id)a4
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  uint64_t v103 = 0;
  v104 = &v103;
  uint64_t v105 = 0x2020000000;
  int v106 = 0;
  v7 = ci_signpost_log_detector();
  if ((unint64_t)&self->super.super.isa + 1 >= 2)
  {
    float v19 = v7;
    if (os_signpost_enabled(v7))
    {
      int v20 = *((_DWORD *)v104 + 6);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v20;
      _os_signpost_emit_with_name_impl(&dword_193671000, v19, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "CIFaceCoreDetector", "count:%d", buf, 8u);
    }
  }
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v99 = __46__CIFaceCoreDetector_featuresInImage_options___block_invoke;
  v100 = &unk_1E5771090;
  v101 = &v103;
  v102 = self;
  p_visionRequest = (id *)&self->visionRequest;
  if (!self->visionRequest && !self->visionTrackingRequest)
  {
    id v70 = (id)[MEMORY[0x1E4F1C978] array];
    goto LABEL_47;
  }
  uint64_t v97 = 0;
  id v9 = -[CIFaceCoreDetector adjustedImageFromImage:orientation:inverseCTM:](self, "adjustedImageFromImage:orientation:inverseCTM:", a3, objc_msgSend((id)objc_msgSend(a4, "valueForKey:", @"CIDetectorImageOrientation"), "intValue"), &v96);
  uint64_t v10 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  context = self->context;
  if (context)
  {
    uint64_t v107 = 0;
    uint64_t v108 = (uint64_t)&v107;
    uint64_t v109 = 0x2020000000;
    v12 = (void *)getVNImageOptionCIContextSymbolLoc(void)::ptr;
    v110 = (void *)getVNImageOptionCIContextSymbolLoc(void)::ptr;
    if (!getVNImageOptionCIContextSymbolLoc(void)::ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v116 = 3221225472;
      uint64_t v117 = (uint64_t)___ZL34getVNImageOptionCIContextSymbolLocv_block_invoke;
      v118 = (void (*)(uint64_t, uint64_t))&unk_1E57710B8;
      v119 = (void (*)(uint64_t))&v107;
      BOOL v13 = (void *)VisionLibrary();
      uint64_t v14 = dlsym(v13, "VNImageOptionCIContext");
      *(void *)(*((void *)v119 + 1) + 24) = v14;
      getVNImageOptionCIContextSymbolLoc(void)::ptr = *(void *)(*((void *)v119 + 1) + 24);
      v12 = *(void **)(v108 + 24);
    }
    _Block_object_dispose(&v107, 8);
    if (!v12) {
      goto LABEL_52;
    }
    [v10 setObject:context forKey:*v12];
  }
  uint64_t v15 = objc_msgSend((id)objc_msgSend(a4, "valueForKey:", @"CIDetectorEyeBlink"), "BOOLValue");
  uint64_t v16 = objc_msgSend((id)objc_msgSend(a4, "valueForKey:", @"CIDetectorSmile"), "BOOLValue");
  *(void *)buf = 0;
  uint64_t v116 = (uint64_t)buf;
  uint64_t v117 = 0x3052000000;
  v118 = __Block_byref_object_copy__6;
  v119 = __Block_byref_object_dispose__6;
  v17 = (objc_class *)getVNImageRequestHandlerClass(void)::softClass;
  uint64_t v120 = getVNImageRequestHandlerClass(void)::softClass;
  if (!getVNImageRequestHandlerClass(void)::softClass)
  {
    uint64_t v107 = MEMORY[0x1E4F143A8];
    uint64_t v108 = 3221225472;
    uint64_t v109 = (uint64_t)___ZL29getVNImageRequestHandlerClassv_block_invoke;
    v110 = &unk_1E57710B8;
    v111 = buf;
    ___ZL29getVNImageRequestHandlerClassv_block_invoke((uint64_t)&v107);
    v17 = *(objc_class **)(v116 + 40);
  }
  _Block_object_dispose(buf, 8);
  v18 = (void *)[[v17 alloc] initWithCIImage:v9 options:v10];
  if (*p_visionRequest)
  {
    [*p_visionRequest setFaceCoreExtractBlink:v15];
    [*p_visionRequest setFaceCoreExtractSmile:v16];
    id v114 = *p_visionRequest;
    objc_msgSend(v18, "performRequests:error:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v114, 1), &v97);
  }
  else
  {
    p_visionRequest = (id *)&self->visionTrackingRequest;
    visionTrackingRequest = self->visionTrackingRequest;
    if (!visionTrackingRequest) {
      goto LABEL_18;
    }
    [(VNTrackLegacyFaceCoreObjectRequest *)visionTrackingRequest setFaceCoreExtractBlink:v15];
    [*p_visionRequest setFaceCoreExtractSmile:v16];
    id v113 = *p_visionRequest;
    objc_msgSend(v18, "performRequests:error:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v113, 1), &v97);
  }
  if (!v97)
  {
    id obj = (id)[*p_visionRequest results];
    goto LABEL_20;
  }
LABEL_18:
  id obj = 0;
LABEL_20:
  v68 = v18;
  id v70 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v90 = self;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  uint64_t v22 = [obj countByEnumeratingWithState:&v92 objects:v112 count:16];
  if (v22)
  {
    uint64_t v71 = *(void *)v93;
    do
    {
      uint64_t v72 = v22;
      for (uint64_t i = 0; i != v72; ++i)
      {
        if (*(void *)v93 != v71) {
          objc_enumerationMutation(obj);
        }
        v24 = (void *)[*(id *)(*((void *)&v92 + 1) + 8 * i) legacyFaceCore];
        v25 = (void *)[v24 features];
        uint64_t v107 = 0;
        uint64_t v108 = (uint64_t)&v107;
        uint64_t v109 = 0x2020000000;
        uint64_t v26 = (void *)getVNFaceLegacyFaceCoreFeature_SmileScoreSymbolLoc(void)::ptr;
        v110 = (void *)getVNFaceLegacyFaceCoreFeature_SmileScoreSymbolLoc(void)::ptr;
        if (!getVNFaceLegacyFaceCoreFeature_SmileScoreSymbolLoc(void)::ptr)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          uint64_t v116 = 3221225472;
          uint64_t v117 = (uint64_t)___ZL50getVNFaceLegacyFaceCoreFeature_SmileScoreSymbolLocv_block_invoke;
          v118 = (void (*)(uint64_t, uint64_t))&unk_1E57710B8;
          v119 = (void (*)(uint64_t))&v107;
          v27 = (void *)VisionLibrary();
          v28 = dlsym(v27, "VNFaceLegacyFaceCoreFeature_SmileScore");
          *(void *)(*((void *)v119 + 1) + 24) = v28;
          getVNFaceLegacyFaceCoreFeature_SmileScoreSymbolLoc(void)::ptr = *(void *)(*((void *)v119 + 1) + 24);
          uint64_t v26 = *(void **)(v108 + 24);
        }
        _Block_object_dispose(&v107, 8);
        if (!v26)
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", @"NSString *getVNFaceLegacyFaceCoreFeature_SmileScore()", @"CIVision.h", 76, @"%s", dlerror());
          goto LABEL_51;
        }
        v29 = (void *)[v25 valueForKey:*v26];
        double v30 = (void *)[v24 features];
        uint64_t v107 = 0;
        uint64_t v108 = (uint64_t)&v107;
        uint64_t v109 = 0x2020000000;
        v31 = (void *)getVNFaceLegacyFaceCoreFeature_LeftEyeClosedScoreSymbolLoc(void)::ptr;
        v110 = (void *)getVNFaceLegacyFaceCoreFeature_LeftEyeClosedScoreSymbolLoc(void)::ptr;
        if (!getVNFaceLegacyFaceCoreFeature_LeftEyeClosedScoreSymbolLoc(void)::ptr)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          uint64_t v116 = 3221225472;
          uint64_t v117 = (uint64_t)___ZL58getVNFaceLegacyFaceCoreFeature_LeftEyeClosedScoreSymbolLocv_block_invoke;
          v118 = (void (*)(uint64_t, uint64_t))&unk_1E57710B8;
          v119 = (void (*)(uint64_t))&v107;
          v32 = (void *)VisionLibrary();
          v33 = dlsym(v32, "VNFaceLegacyFaceCoreFeature_LeftEyeClosedScore");
          *(void *)(*((void *)v119 + 1) + 24) = v33;
          getVNFaceLegacyFaceCoreFeature_LeftEyeClosedScoreSymbolLoc(void)::ptr = *(void *)(*((void *)v119 + 1)
                                                                                            + 24);
          v31 = *(void **)(v108 + 24);
        }
        _Block_object_dispose(&v107, 8);
        if (!v31)
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", @"NSString *getVNFaceLegacyFaceCoreFeature_LeftEyeClosedScore()", @"CIVision.h", 70, @"%s", dlerror());
          goto LABEL_51;
        }
        long long v34 = (void *)[v30 valueForKey:*v31];
        objc_super v35 = (void *)[v24 features];
        uint64_t v107 = 0;
        uint64_t v108 = (uint64_t)&v107;
        uint64_t v109 = 0x2020000000;
        uint64_t v36 = (void *)getVNFaceLegacyFaceCoreFeature_RightEyeClosedScoreSymbolLoc(void)::ptr;
        v110 = (void *)getVNFaceLegacyFaceCoreFeature_RightEyeClosedScoreSymbolLoc(void)::ptr;
        if (!getVNFaceLegacyFaceCoreFeature_RightEyeClosedScoreSymbolLoc(void)::ptr)
        {
          *(void *)buf = MEMORY[0x1E4F143A8];
          uint64_t v116 = 3221225472;
          uint64_t v117 = (uint64_t)___ZL59getVNFaceLegacyFaceCoreFeature_RightEyeClosedScoreSymbolLocv_block_invoke;
          v118 = (void (*)(uint64_t, uint64_t))&unk_1E57710B8;
          v119 = (void (*)(uint64_t))&v107;
          uint64_t v37 = (void *)VisionLibrary();
          v38 = dlsym(v37, "VNFaceLegacyFaceCoreFeature_RightEyeClosedScore");
          *(void *)(*((void *)v119 + 1) + 24) = v38;
          getVNFaceLegacyFaceCoreFeature_RightEyeClosedScoreSymbolLoc(void)::ptr = *(void *)(*((void *)v119 + 1)
                                                                                             + 24);
          uint64_t v36 = *(void **)(v108 + 24);
        }
        _Block_object_dispose(&v107, 8);
        if (!v36)
        {
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", @"NSString *getVNFaceLegacyFaceCoreFeature_RightEyeClosedScore()", @"CIVision.h", 73, @"%s", dlerror());
          while (1)
          {
LABEL_51:
            __break(1u);
LABEL_52:
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", @"NSString *getVNImageOptionCIContext()", @"CIVision.h", 61, @"%s", dlerror());
          }
        }
        v39 = (void *)[v35 valueForKey:*v36];
        v40 = [CIFaceFeature alloc];
        [v24 faceBoundingBox];
        CGAffineTransform v91 = v96;
        CGRect v123 = CGRectApplyAffineTransform(v122, &v91);
        double y = v123.origin.y;
        double x = v123.origin.x;
        double height = v123.size.height;
        double width = v123.size.width;
        [v24 leftEye];
        double v42 = v41;
        double v44 = v43;
        long long v85 = *(_OWORD *)&v96.a;
        double tx = v96.tx;
        double c = v96.c;
        double ty = v96.ty;
        double d = v96.d;
        [v24 rightEye];
        double v46 = v45;
        double v48 = v47;
        long long v80 = *(_OWORD *)&v96.a;
        double v76 = v96.tx;
        double v77 = v96.c;
        double v78 = v96.ty;
        double v79 = v96.d;
        [v24 mouth];
        double v50 = v49;
        double v52 = v51;
        double v53 = v96.c;
        long long v75 = *(_OWORD *)&v96.a;
        long long v54 = *(_OWORD *)&v96.tx;
        double v73 = v96.ty;
        double v74 = v96.d;
        [v24 faceAngle];
        double v56 = v55;
        v57 = v90->visionTrackingRequest;
        uint64_t v58 = [v24 trackID];
        v59 = v90->visionTrackingRequest;
        int v60 = [v24 trackDuration];
        if (v29) {
          LOBYTE(v29) = [v29 BOOLValue];
        }
        if (v34) {
          LOBYTE(v34) = [v34 BOOLValue];
        }
        if (v39) {
          char v61 = [v39 BOOLValue];
        }
        else {
          char v61 = 0;
        }
        BYTE6(v67) = v61;
        BYTE5(v67) = (_BYTE)v34;
        BYTE4(v67) = (_BYTE)v29;
        LODWORD(v67) = v60;
        BYTE4(v66) = v59 != 0;
        float v62 = v56;
        *(float *)&uint64_t v66 = v62;
        v63 = -[CIFaceFeature initWithBounds:hasLeftEyePosition:leftEyePosition:hasRightEyePosition:rightEyePosition:hasMouthPosition:mouthPosition:hasFaceAngle:faceAngle:hasTrackingID:trackingID:hasTrackingFrameCount:trackingFrameCount:hasSmile:leftEyeClosed:rightEyeClosed:landmarks:](v40, "initWithBounds:hasLeftEyePosition:leftEyePosition:hasRightEyePosition:rightEyePosition:hasMouthPosition:mouthPosition:hasFaceAngle:faceAngle:hasTrackingID:trackingID:hasTrackingFrameCount:trackingFrameCount:hasSmile:leftEyeClosed:rightEyeClosed:landmarks:", 1, 1, 1, 1, v57 != 0, v58, x, y, width, height, tx + v44 * c + *(double *)&v85 * v42, ty + v44 * d + *((double *)&v85 + 1) * v42, v76 + v48 * v77 + *(double *)&v80 * v46, v78 + v48 * v79 + *((double *)&v80 + 1) * v46, *(double *)&v54 + v52 * v53 + *(double *)&v75 * v50,
                v73 + v52 * v74 + *((double *)&v75 + 1) * v50,
                v66,
                v67,
                0,
                v68);
        if (v63) {
          [v70 addObject:v63];
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v92 objects:v112 count:16];
    }
    while (v22);
  }

  int v64 = [v70 count];
  *((_DWORD *)v104 + 6) = v64;
LABEL_47:
  v99((uint64_t)v98);
  _Block_object_dispose(&v103, 8);
  return v70;
}

void __46__CIFaceCoreDetector_featuresInImage_options___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = ci_signpost_log_detector();
  os_signpost_id_t v3 = *(void *)(a1 + 40);
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v2;
    if (os_signpost_enabled(v2))
    {
      int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      v6[0] = 67109120;
      v6[1] = v5;
      _os_signpost_emit_with_name_impl(&dword_193671000, v4, OS_SIGNPOST_INTERVAL_END, v3, "CIFaceCoreDetector", "count:%d", (uint8_t *)v6, 8u);
    }
  }
}

- (id)featuresInImage:(id)a3
{
  return [(CIFaceCoreDetector *)self featuresInImage:a3 options:0];
}

- (CIContext)context
{
  return self->context;
}

- (void)setContext:(id)a3
{
}

- (VNDetectFaceRectanglesRequest)visionRequest
{
  return (VNDetectFaceRectanglesRequest *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVisionRequest:(id)a3
{
}

- (VNTrackLegacyFaceCoreObjectRequest)visionTrackingRequest
{
  return (VNTrackLegacyFaceCoreObjectRequest *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVisionTrackingRequest:(id)a3
{
}

- (CGAffineTransform)ctmForImageWithBounds:(SEL)a3 orientation:(CGRect)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  double v5 = fmax(a4.size.width, a4.size.height);
  t1.b = 0.0;
  t1.double c = 0.0;
  v17[0] = 0x3FF0000000000000;
  v17[1] = 0;
  v17[2] = 0;
  v17[3] = 0x3FF0000000000000;
  v17[4] = 0;
  v17[5] = 0;
  v17[6] = 0xBFF0000000000000;
  v17[7] = 0;
  v17[8] = 0;
  v17[9] = 0x3FF0000000000000;
  double v6 = 1024.0 / v5;
  BOOL v7 = v5 <= 1228.0;
  double v8 = 1.0;
  if (!v7) {
    double v8 = v6;
  }
  *(double *)&v17[10] = a4.size.width * v8;
  long long v18 = xmmword_193953160;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  unint64_t v21 = 0xBFF0000000000000;
  double v22 = a4.size.width * v8;
  double v23 = a4.size.height * v8;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  uint64_t v24 = 0x3FF0000000000000;
  long long v27 = xmmword_193951E50;
  long long v29 = xmmword_193953160;
  long long v30 = xmmword_193951E50;
  double v28 = a4.size.height * v8;
  double v31 = a4.size.height * v8;
  double v32 = a4.size.width * v8;
  long long v33 = xmmword_193953160;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v34 = 0x3FF0000000000000;
  double v37 = a4.size.width * v8;
  long long v38 = xmmword_193953170;
  long long v41 = 0u;
  long long v40 = 0u;
  uint64_t v39 = 0x3FF0000000000000;
  uint64_t v42 = 0x3FF0000000000000;
  long long v43 = xmmword_193951E50;
  double v44 = a4.size.height * v8;
  uint64_t v45 = 0;
  t1.a = v8;
  t1.double d = v8;
  CGFloat y = a4.origin.y;
  *(int8x16_t *)&t1.double tx = vandq_s8((int8x16_t)vmulq_n_f64(vnegq_f64((float64x2_t)a4.origin), v8), (int8x16_t)vcgtq_f64(vabsq_f64((float64x2_t)a4.origin), (float64x2_t)vdupq_n_s64(0x3F847AE147AE147BuLL)));
  if ((a5 - 9) >= 0xFFFFFFF8) {
    int v10 = a5 - 1;
  }
  else {
    int v10 = 0;
  }
  uint64_t v11 = (long long *)&v17[6 * v10];
  long long v12 = *v11;
  long long v13 = v11[2];
  *(_OWORD *)&v15.double c = v11[1];
  *(_OWORD *)&v15.double tx = v13;
  *(_OWORD *)&v15.a = v12;
  return CGAffineTransformConcat(retstr, &t1, &v15);
}

- (id)adjustedImageFromImage:(id)a3 orientation:(int)a4 inverseCTM:(CGAffineTransform *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  memset(&v15, 0, sizeof(v15));
  [a3 extent];
  if (self) {
    -[CIFaceCoreDetector ctmForImageWithBounds:orientation:](self, "ctmForImageWithBounds:orientation:", v6);
  }
  else {
    memset(&v15, 0, sizeof(v15));
  }
  CGAffineTransform v13 = v15;
  CGAffineTransformInvert(&v14, &v13);
  long long v9 = *(_OWORD *)&v14.c;
  *(_OWORD *)&a5->a = *(_OWORD *)&v14.a;
  *(_OWORD *)&a5->double c = v9;
  *(_OWORD *)&a5->double tx = *(_OWORD *)&v14.tx;
  CGAffineTransform v12 = v15;
  if (!CGAffineTransformIsIdentity(&v12))
  {
    CGAffineTransform v11 = v15;
    return (id)[v7 imageByApplyingTransform:&v11];
  }
  return v7;
}

- (id)createFaceCoreDataFromCIImage:(id)a3 width:(unint64_t *)a4 height:(unint64_t *)a5
{
  id result = [(CIFaceCoreDetector *)self context];
  if (result)
  {
    [a3 extent];
    LODWORD(v5) = vcvtmd_s64_f64(CGRectGetWidth(v25));
    [a3 extent];
    LODWORD(v6) = vcvtmd_s64_f64(CGRectGetHeight(v26));
    [a3 extent];
    double v13 = v12;
    double v15 = v14;
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v17 = (char *)malloc_type_malloc(4 * (int)v5 * (int)v6, 0xD9115E3AuLL);
    if (v17)
    {
      long long v18 = v17;
      -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:]([(CIFaceCoreDetector *)self context], "render:toBitmap:rowBytes:bounds:format:colorSpace:", a3, v17, 4 * (int)v5, 264, DeviceRGB, v13, v15, (double)(int)v5, (double)(int)v6);
      if ((int)v6 >= 1)
      {
        uint64_t v19 = 0;
        uint64_t v20 = v18;
        do
        {
          if ((int)v5 >= 1)
          {
            unint64_t v21 = &v18[4 * (int)v19 * (int)v5];
            uint64_t v22 = v5;
            double v23 = v20;
            do
            {
              *v23++ = (unsigned __int16)(77 * *v21
                                        + 151 * v21[1]
                                        + 28 * v21[2]) >> 8;
              v21 += 4;
              --v22;
            }
            while (v22);
          }
          ++v19;
          v20 += (int)v5;
        }
        while (v19 != v6);
      }
      uint64_t v24 = malloc_type_realloc(v18, (int)v6 * (int)v5, 0xA59F83CEuLL);
      CGColorSpaceRelease(DeviceRGB);
      id result = (id)[MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v24 length:(int)v6 * (int)v5 freeWhenDone:1];
      if (a4) {
        *a4 = (int)v5;
      }
      if (a5) {
        *a5 = (int)v6;
      }
    }
    else
    {
      CGColorSpaceRelease(DeviceRGB);
      return 0;
    }
  }
  return result;
}

@end