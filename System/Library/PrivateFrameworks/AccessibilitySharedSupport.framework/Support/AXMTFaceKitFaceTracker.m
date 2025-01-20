@interface AXMTFaceKitFaceTracker
+ (NSDictionary)_faceKitCreationOptions;
+ (__n128)_poseRotationMatrixFromArray:(void *)a3;
+ (__n128)_poseTranslationMatrixFromArray:(void *)a3;
+ (float)_intrinsicsMatrixFromFieldOfView:(uint64_t)a3 andWidth:(uint64_t)a4 andHeight:(uint64_t)a5;
+ (id)_backupIntrinsicsMatrixForiOS;
+ (id)_faceKitProcessOptionsForSampleBuffer:(opaqueCMSampleBuffer *)a3 detectedFaceInfo:(id)a4 callback:(id)a5;
+ (id)_intrinsicsArrayFromMatrix:(__n128)a3;
- ($AA6A45B2DFCED8527C3A0E9A46B0D48F)_updateAXExpressions:(SEL)a3 withFaceKitLiteExpresion:(id *)a4 faceKitLiteExpressionActivation:(id)a5;
- (AXMTFaceKitFaceTracker)initWithFaceKitPipeline:(BOOL)a3;
- (AXMTFaceKitFaceTrackerDelegate)delegate;
- (AXMTFaceKitFaceTrackerFaceInfo)_initialFaceInfo;
- (AXMTFaceKitResult)lastResult;
- (BOOL)_videoFrameisValidForProcessing:(opaqueCMSampleBuffer *)a3;
- (CVAFaceTracking)_faceKitRef;
- (CVAFaceTrackingLiteFilter)_faceKitLiteFilterRef;
- (NSValue)_referenceDimensionsValue;
- (id)_generateFaceKitResultForLiteOutput:(id)a3;
- (id)_generateFaceKitResultForVanillaOutput:(id)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (id)_handleFaceBlendShapes:(id)a3;
- (unint64_t)_axFacialExpressionActivationForFaceKitLiteExpresionActivation:(unsigned __int8)a3;
- (void)_processFaceKitOnVideoFrame:(opaqueCMSampleBuffer *)a3;
- (void)_processFaceKitResults:(__CFDictionary *)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4;
- (void)_updateFaceInfoIfNeededWithMetadata:(id)a3;
- (void)dealloc;
- (void)didUpdateVideoResolution:(CGSize)a3;
- (void)failedToTrackFaceWithError:(id)a3;
- (void)processTrackedFacesMetadata:(id)a3;
- (void)processVideoFrame:(opaqueCMSampleBuffer *)a3;
- (void)processVideoFrame:(opaqueCMSampleBuffer *)a3 metadata:(id)a4;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setLastResult:(id)a3;
- (void)set_faceKitLiteFilterRef:(CVAFaceTrackingLiteFilter *)a3;
- (void)set_faceKitRef:(CVAFaceTracking *)a3;
- (void)set_initialFaceInfo:(id)a3;
- (void)set_referenceDimensionsValue:(id)a3;
@end

@implementation AXMTFaceKitFaceTracker

- (AXMTFaceKitFaceTracker)initWithFaceKitPipeline:(BOOL)a3
{
  BOOL v3 = a3;
  v39.receiver = self;
  v39.super_class = (Class)AXMTFaceKitFaceTracker;
  v4 = [(AXMTFaceKitFaceTracker *)&v39 init];
  if (!v4) {
    goto LABEL_30;
  }
  if (v3)
  {
    v38 = 0;
    v5 = [(id)objc_opt_class() _faceKitCreationOptions];
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x2020000000;
    v6 = (uint64_t (*)(const CFAllocatorRef, void *, CVAFaceTracking **))off_100054F18;
    v48 = off_100054F18;
    if (!off_100054F18)
    {
      v40 = _NSConcreteStackBlock;
      uint64_t v41 = 3221225472;
      v42 = sub_10002B0AC;
      v43 = &unk_100048B88;
      v44 = &v45;
      v7 = (void *)sub_10002B0FC();
      v8 = dlsym(v7, "CVAFaceTrackingCreate");
      *(void *)(v44[1] + 24) = v8;
      off_100054F18 = *(_UNKNOWN **)(v44[1] + 24);
      v6 = (uint64_t (*)(const CFAllocatorRef, void *, CVAFaceTracking **))v46[3];
    }
    _Block_object_dispose(&v45, 8);
    if (!v6)
    {
LABEL_33:
      v37 = (_Unwind_Exception *)sub_10002C8C4();
      _Block_object_dispose(&v45, 8);
      _Unwind_Resume(v37);
    }
    CFAllocatorRef v9 = kCFAllocatorDefault;
    uint64_t v10 = v6(kCFAllocatorDefault, v5, &v38);

    uint64_t v11 = (uint64_t)v38;
    v12 = AXSSLogForCategory();
    v13 = v12;
    if (v10) {
      BOOL v14 = 1;
    }
    else {
      BOOL v14 = v11 == 0;
    }
    if (v14)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10002C184(v10, v13, v15, v16, v17, v18, v19, v20);
      }
      goto LABEL_29;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_10002C108((uint64_t *)&v38, v13);
    }

    v4->__faceKitRef = v38;
  }
  else
  {
    v21 = AXSSLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_10002C1F0(v21);
    }

    CFAllocatorRef v9 = kCFAllocatorDefault;
  }
  v38 = 0;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  v23 = (uint64_t (*)(CFAllocatorRef, CVAFaceTracking **))off_100054F28;
  v48 = off_100054F28;
  if (!off_100054F28)
  {
    v40 = _NSConcreteStackBlock;
    uint64_t v41 = 3221225472;
    v42 = sub_10002B270;
    v43 = &unk_100048B88;
    v44 = &v45;
    v24 = (void *)sub_10002B0FC();
    v25 = dlsym(v24, "CVAFaceTrackingLiteFilterCreate");
    *(void *)(v44[1] + 24) = v25;
    off_100054F28 = *(_UNKNOWN **)(v44[1] + 24);
    v23 = (uint64_t (*)(CFAllocatorRef, CVAFaceTracking **))v46[3];
  }
  _Block_object_dispose(&v45, 8);
  if (!v23)
  {
    sub_10002C8C4();
    goto LABEL_33;
  }
  uint64_t v26 = v23(v9, &v38);
  if (v26) {
    BOOL v27 = 1;
  }
  else {
    BOOL v27 = v38 == 0;
  }
  if (!v27)
  {
    v4->__faceKitLiteFilterRef = (CVAFaceTrackingLiteFilter *)v38;
LABEL_30:
    v35 = v4;
    goto LABEL_31;
  }
  uint64_t v28 = v26;
  v13 = AXSSLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_10002C09C(v28, v13, v29, v30, v31, v32, v33, v34);
  }
LABEL_29:

  v35 = 0;
LABEL_31:

  return v35;
}

- (void)dealloc
{
  faceKitRef = self->__faceKitRef;
  if (faceKitRef)
  {
    CFRelease(faceKitRef);
    self->__faceKitRef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXMTFaceKitFaceTracker;
  [(AXMTFaceKitFaceTracker *)&v4 dealloc];
}

- (void)reset
{
  [(AXMTFaceKitFaceTracker *)self setLastResult:0];

  [(AXMTFaceKitFaceTracker *)self set_initialFaceInfo:0];
}

- (void)processVideoFrame:(opaqueCMSampleBuffer *)a3
{
  if (-[AXMTFaceKitFaceTracker _videoFrameisValidForProcessing:](self, "_videoFrameisValidForProcessing:"))
  {
    [(AXMTFaceKitFaceTracker *)self _processFaceKitOnVideoFrame:a3];
  }
}

- (void)processVideoFrame:(opaqueCMSampleBuffer *)a3 metadata:(id)a4
{
  id v6 = a4;
  if ([(AXMTFaceKitFaceTracker *)self _videoFrameisValidForProcessing:a3])
  {
    uint64_t v8 = 0;
    CFAllocatorRef v9 = &v8;
    uint64_t v10 = 0x3032000000;
    uint64_t v11 = sub_100025494;
    v12 = sub_1000254A4;
    id v13 = 0;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000254AC;
    v7[3] = &unk_100049100;
    v7[4] = &v8;
    [v6 enumerateObjectsUsingBlock:v7];
    if (v9[5])
    {
      -[AXMTFaceKitFaceTracker _updateFaceInfoIfNeededWithMetadata:](self, "_updateFaceInfoIfNeededWithMetadata:");
      [(AXMTFaceKitFaceTracker *)self _processFaceKitOnVideoFrame:a3];
    }
    _Block_object_dispose(&v8, 8);
  }
}

- (void)processTrackedFacesMetadata:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  CFAllocatorRef v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_100025494;
  v12 = sub_1000254A4;
  id v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100025668;
  v7[3] = &unk_100049100;
  v7[4] = &v8;
  [v4 enumerateObjectsUsingBlock:v7];
  v5 = (void *)v9[5];
  if (v5)
  {
    id v6 = [v5 payload];
    [(AXMTFaceKitFaceTracker *)self _processFaceKitResults:v6 withSampleBuffer:0];
  }
  _Block_object_dispose(&v8, 8);
}

- (void)failedToTrackFaceWithError:(id)a3
{
  id v8 = a3;
  id v4 = [(AXMTFaceKitFaceTracker *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [[AXMTFaceKitResult alloc] initWithError:v8];
    v7 = [(AXMTFaceKitFaceTracker *)self delegate];
    [v7 faceKitFaceTracker:self updatedResult:v6];
  }
}

- (void)didUpdateVideoResolution:(CGSize)a3
{
  +[NSValue valueWithSize:](NSValue, "valueWithSize:", a3.width, a3.height);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AXMTFaceKitFaceTracker *)self set_referenceDimensionsValue:v4];
}

- (BOOL)_videoFrameisValidForProcessing:(opaqueCMSampleBuffer *)a3
{
  if (a3 && [(AXMTFaceKitFaceTracker *)self _faceKitRef]) {
    return 1;
  }
  id v6 = AXSSLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10002C234((uint64_t)a3, self, v6);
  }

  return 0;
}

- (void)_processFaceKitOnVideoFrame:(opaqueCMSampleBuffer *)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = objc_opt_class();
  v7 = [(AXMTFaceKitFaceTracker *)self _initialFaceInfo];
  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  uint64_t v20 = sub_100025AAC;
  v21 = &unk_100049128;
  v22 = self;
  v24 = a3;
  id v8 = v5;
  v23 = v8;
  CFAllocatorRef v9 = [v6 _faceKitProcessOptionsForSampleBuffer:a3 detectedFaceInfo:v7 callback:&v18];

  uint64_t v10 = [(AXMTFaceKitFaceTracker *)self _faceKitRef];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v11 = (uint64_t (*)(CVAFaceTracking *, void *))off_100054F30;
  uint64_t v33 = off_100054F30;
  if (!off_100054F30)
  {
    v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472;
    BOOL v27 = sub_10002B2C0;
    uint64_t v28 = &unk_100048B88;
    uint64_t v29 = &v30;
    v12 = (void *)sub_10002B0FC();
    id v13 = dlsym(v12, "CVAFaceTrackingProcess");
    *(void *)(v29[1] + 24) = v13;
    off_100054F30 = *(_UNKNOWN **)(v29[1] + 24);
    uint64_t v11 = (uint64_t (*)(CVAFaceTracking *, void *))v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v11)
  {
    uint64_t v17 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v30, 8);
    _Unwind_Resume(v17);
  }
  int v14 = v11(v10, v9);
  if (v14)
  {
    int v15 = v14;
    uint64_t v16 = AXSSLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10002C2E4((uint64_t)a3, v15, v16);
    }
  }
  else
  {
    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (id)_generateFaceKitResultForVanillaOutput:(id)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  id v5 = a3;
  uint64_t v32 = a4;
  if (qword_100054EC0 != -1) {
    dispatch_once(&qword_100054EC0, &stru_100049148);
  }
  v35 = v5;
  v36 = [v5 objectForKeyedSubscript:sub_10002642C()];
  if (![v36 count])
  {
    v25 = 0;
    goto LABEL_33;
  }
  uint64_t v34 = [v36 firstObject];
  id v6 = v34;
  if (v34)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [v34 objectForKeyedSubscript:sub_100026524()];
      uint64_t v46 = 0;
      uint64_t v47 = &v46;
      uint64_t v48 = 0x2020000000;
      id v8 = (void *)qword_100054F58;
      uint64_t v49 = qword_100054F58;
      if (!qword_100054F58)
      {
        uint64_t v41 = _NSConcreteStackBlock;
        uint64_t v42 = 3221225472;
        v43 = sub_10002B450;
        v44 = &unk_100048B88;
        uint64_t v45 = &v46;
        CFAllocatorRef v9 = (void *)sub_10002B0FC();
        v47[3] = (uint64_t)dlsym(v9, "kCVAFaceTracking_Animation");
        qword_100054F58 = *(void *)(v45[1] + 24);
        id v8 = (void *)v47[3];
      }
      _Block_object_dispose(&v46, 8);
      if (v8)
      {
        uint64_t v31 = [v7 objectForKeyedSubscript:*v8];

        if (!v31)
        {
          v24 = 0;
LABEL_29:
          uint64_t v26 = [AXMTFaceKitXNUResult alloc];
          uint64_t v27 = qword_100054EB0;
          uint64_t v28 = [(AXMTFaceKitFaceTracker *)self _referenceDimensionsValue];
          v25 = [(AXMTFaceKitXNUResult *)v26 initWithFaceKitTrackedFaceDictionary:v34 semanticsDictionary:v27 sampleBuffer:v32 expressions:v24 referenceDimensionsValue:v28];

          if (v25) {
            uint64_t v29 = v25;
          }

          id v6 = v34;
          goto LABEL_32;
        }
        uint64_t v46 = 0;
        uint64_t v47 = &v46;
        uint64_t v48 = 0x2020000000;
        uint64_t v10 = (void *)qword_100054F60;
        uint64_t v49 = qword_100054F60;
        if (!qword_100054F60)
        {
          uint64_t v41 = _NSConcreteStackBlock;
          uint64_t v42 = 3221225472;
          v43 = sub_10002B4A0;
          v44 = &unk_100048B88;
          uint64_t v45 = &v46;
          uint64_t v11 = (void *)sub_10002B0FC();
          v47[3] = (uint64_t)dlsym(v11, "kCVAFaceTracking_AnimationBlendshapes");
          qword_100054F60 = *(void *)(v45[1] + 24);
          uint64_t v10 = (void *)v47[3];
        }
        _Block_object_dispose(&v46, 8);
        if (v10)
        {
          v12 = [v31 objectForKeyedSubscript:*v10];
          id v13 = +[NSMutableDictionary dictionary];
          if (v12)
          {
            long long v39 = 0u;
            long long v40 = 0u;
            long long v37 = 0u;
            long long v38 = 0u;
            id v14 = (id)qword_100054EB8;
            id v15 = [v14 countByEnumeratingWithState:&v37 objects:v50 count:16];
            if (v15)
            {
              uint64_t v16 = *(void *)v38;
              do
              {
                for (i = 0; i != v15; i = (char *)i + 1)
                {
                  if (*(void *)v38 != v16) {
                    objc_enumerationMutation(v14);
                  }
                  uint64_t v18 = *(void *)(*((void *)&v37 + 1) + 8 * i);
                  uint64_t v19 = objc_msgSend((id)qword_100054EB8, "objectForKeyedSubscript:", v18, v31);
                  unsigned int v20 = [v19 unsignedIntValue];

                  LODWORD(v21) = *((_DWORD *)[v12 bytes] + v20);
                  v22 = +[NSNumber numberWithFloat:v21];
                  [v13 setObject:v22 forKey:v18];
                }
                id v15 = [v14 countByEnumeratingWithState:&v37 objects:v50 count:16];
              }
              while (v15);
            }

            v23 = [v31 objectForKeyedSubscript:@"tongue_out"];
            if (v23) {
              [v13 setObject:v23 forKey:@"tongue_out"];
            }
            v24 = -[AXMTFaceKitFaceTracker _handleFaceBlendShapes:](self, "_handleFaceBlendShapes:", v13, v31);
          }
          else
          {
            v24 = 0;
          }

          goto LABEL_29;
        }
      }
      sub_10002C8C4();
      __break(1u);
    }
  }
  v25 = 0;
LABEL_32:

LABEL_33:

  return v25;
}

- (id)_generateFaceKitResultForLiteOutput:(id)a3
{
  id v51 = a3;
  v52 = [v51 objectForKeyedSubscript:sub_100026D88()];
  *(void *)&long long v58 = 0;
  *((void *)&v58 + 1) = &v58;
  *(void *)&long long v59 = 0x2020000000;
  id v4 = (void *)qword_100054F70;
  *((void *)&v59 + 1) = qword_100054F70;
  if (!qword_100054F70)
  {
    *(void *)&long long v67 = _NSConcreteStackBlock;
    *((void *)&v67 + 1) = 3221225472;
    *(void *)&long long v68 = sub_10002B540;
    *((void *)&v68 + 1) = &unk_100048B88;
    *(void *)&long long v69 = &v58;
    id v5 = (void *)sub_10002B0FC();
    id v6 = dlsym(v5, "kCVAFaceTrackingLiteFilter_ClientData");
    *(void *)(*(void *)(v69 + 8) + 24) = v6;
    qword_100054F70 = *(void *)(*(void *)(v69 + 8) + 24);
    id v4 = *(void **)(*((void *)&v58 + 1) + 24);
  }
  _Block_object_dispose(&v58, 8);
  if (!v4) {
    goto LABEL_35;
  }
  v7 = [v51 objectForKeyedSubscript:*v4];
  *(void *)&long long v58 = 0;
  *((void *)&v58 + 1) = &v58;
  *(void *)&long long v59 = 0x2020000000;
  id v8 = (void *)qword_100054F78;
  *((void *)&v59 + 1) = qword_100054F78;
  if (!qword_100054F78)
  {
    *(void *)&long long v67 = _NSConcreteStackBlock;
    *((void *)&v67 + 1) = 3221225472;
    *(void *)&long long v68 = sub_10002B590;
    *((void *)&v68 + 1) = &unk_100048B88;
    *(void *)&long long v69 = &v58;
    CFAllocatorRef v9 = (void *)sub_10002B0FC();
    uint64_t v10 = dlsym(v9, "kCVAFaceTrackingLiteFilter_ClientDataAccessibility");
    *(void *)(*(void *)(v69 + 8) + 24) = v10;
    qword_100054F78 = *(void *)(*(void *)(v69 + 8) + 24);
    id v8 = *(void **)(*((void *)&v58 + 1) + 24);
  }
  _Block_object_dispose(&v58, 8);
  if (!v8) {
    goto LABEL_35;
  }
  uint64_t v11 = [v7 objectForKeyedSubscript:*v8];

  v50 = [v52 objectForKeyedSubscript:sub_10002642C()];
  v12 = [v50 firstObject];
  uint64_t v49 = [v12 objectForKeyedSubscript:sub_100026524()];
  if (v11 && v49)
  {
    *(void *)&long long v58 = 0;
    *((void *)&v58 + 1) = &v58;
    *(void *)&long long v59 = 0x2020000000;
    id v13 = (void *)qword_100054F80;
    *((void *)&v59 + 1) = qword_100054F80;
    if (!qword_100054F80)
    {
      *(void *)&long long v67 = _NSConcreteStackBlock;
      *((void *)&v67 + 1) = 3221225472;
      *(void *)&long long v68 = sub_10002B5E0;
      *((void *)&v68 + 1) = &unk_100048B88;
      *(void *)&long long v69 = &v58;
      id v14 = (void *)sub_10002B0FC();
      id v15 = dlsym(v14, "kCVAFaceTrackingLiteFilterClientAccessibility_Expressions");
      *(void *)(*(void *)(v69 + 8) + 24) = v15;
      qword_100054F80 = *(void *)(*(void *)(v69 + 8) + 24);
      id v13 = *(void **)(*((void *)&v58 + 1) + 24);
    }
    _Block_object_dispose(&v58, 8);
    if (v13)
    {
      uint64_t v16 = [v11 objectForKeyedSubscript:*v13];
      uint64_t v71 = 0;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      +[AXSSMotionTrackingExpressionConfiguration_Exclave emptyAccessibilityExpressions];
      long long v65 = 0u;
      long long v66 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      uint64_t v17 = v16;
      id v18 = [v17 countByEnumeratingWithState:&v63 objects:v72 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v64;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v64 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void *)(*((void *)&v63 + 1) + 8 * i);
            v22 = -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", v21, v49);
            unsigned __int8 v23 = [v22 charValue];
            long long v55 = v69;
            long long v56 = v70;
            uint64_t v57 = v71;
            long long v53 = v67;
            long long v54 = v68;
            [(AXMTFaceKitFaceTracker *)self _updateAXExpressions:&v53 withFaceKitLiteExpresion:v21 faceKitLiteExpressionActivation:v23];
            long long v69 = v60;
            long long v70 = v61;
            uint64_t v71 = v62;
            long long v67 = v58;
            long long v68 = v59;
          }
          id v18 = [v17 countByEnumeratingWithState:&v63 objects:v72 count:16];
        }
        while (v18);
      }

      *(void *)&long long v53 = 0;
      *((void *)&v53 + 1) = &v53;
      *(void *)&long long v54 = 0x2020000000;
      v24 = (void *)qword_100054F88;
      *((void *)&v54 + 1) = qword_100054F88;
      if (!qword_100054F88)
      {
        *(void *)&long long v58 = _NSConcreteStackBlock;
        *((void *)&v58 + 1) = 3221225472;
        *(void *)&long long v59 = sub_10002B630;
        *((void *)&v59 + 1) = &unk_100048B88;
        *(void *)&long long v60 = &v53;
        v25 = (void *)sub_10002B0FC();
        uint64_t v26 = dlsym(v25, "kCVAFaceTrackingLiteFilterClientAccessibility_Landmarks");
        *(void *)(*(void *)(v60 + 8) + 24) = v26;
        qword_100054F88 = *(void *)(*(void *)(v60 + 8) + 24);
        v24 = *(void **)(*((void *)&v53 + 1) + 24);
      }
      _Block_object_dispose(&v53, 8);
      if (v24)
      {
        uint64_t v27 = [v11 objectForKeyedSubscript:*v24];
        *(void *)&long long v53 = 0;
        *((void *)&v53 + 1) = &v53;
        *(void *)&long long v54 = 0x2020000000;
        uint64_t v28 = (void *)qword_100054F90;
        *((void *)&v54 + 1) = qword_100054F90;
        if (!qword_100054F90)
        {
          *(void *)&long long v58 = _NSConcreteStackBlock;
          *((void *)&v58 + 1) = 3221225472;
          *(void *)&long long v59 = sub_10002B680;
          *((void *)&v59 + 1) = &unk_100048B88;
          *(void *)&long long v60 = &v53;
          uint64_t v29 = (void *)sub_10002B0FC();
          uint64_t v30 = dlsym(v29, "kCVAFaceTrackingLiteFilterClientAccessibility_LandmarkNoseBaseCenter");
          *(void *)(*(void *)(v60 + 8) + 24) = v30;
          qword_100054F90 = *(void *)(*(void *)(v60 + 8) + 24);
          uint64_t v28 = *(void **)(*((void *)&v53 + 1) + 24);
        }
        _Block_object_dispose(&v53, 8);
        if (v28)
        {
          uint64_t v31 = [v27 objectForKeyedSubscript:*v28];

          if ([v31 count] == (id)2)
          {
            uint64_t v32 = [v31 objectAtIndexedSubscript:0];
            uint64_t v33 = [v31 objectAtIndexedSubscript:1];
            [v32 doubleValue];
            double v35 = v34;
            [v33 doubleValue];
            long long v37 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v35, v36);
            long long v38 = [AXMTFaceKitExclavesResult alloc];
            long long v39 = [(AXMTFaceKitFaceTracker *)self _referenceDimensionsValue];
            long long v60 = v69;
            long long v61 = v70;
            uint64_t v62 = v71;
            long long v58 = v67;
            long long v59 = v68;
            long long v40 = [(AXMTFaceKitExclavesResult *)v38 initWithFaceKitLiteSharedDataDictionary:v52 expressions:&v58 noseBaseCenter:v37 referenceDimensionsValue:v39];
          }
          else
          {
            long long v40 = 0;
          }

          goto LABEL_32;
        }
      }
      sub_10002C8C4();
LABEL_37:
      __break(1u);
    }
LABEL_35:
    sub_10002C8C4();
    goto LABEL_37;
  }
  uint64_t v17 = AXSSLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    sub_10002C3D8(v17, v41, v42, v43, v44, v45, v46, v47);
  }
  long long v40 = 0;
LABEL_32:

  return v40;
}

- ($AA6A45B2DFCED8527C3A0E9A46B0D48F)_updateAXExpressions:(SEL)a3 withFaceKitLiteExpresion:(id *)a4 faceKitLiteExpressionActivation:(id)a5
{
  uint64_t v6 = a6;
  id v10 = a5;
  unint64_t v11 = [(AXMTFaceKitFaceTracker *)self _axFacialExpressionActivationForFaceKitLiteExpresionActivation:v6];
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  v12 = (void *)qword_100054F98;
  uint64_t v33 = qword_100054F98;
  if (!qword_100054F98)
  {
    id v13 = (void *)sub_10002B0FC();
    v31[3] = (uint64_t)dlsym(v13, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionBrowsUp");
    qword_100054F98 = v31[3];
    v12 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v12)
  {
    sub_10002C8C4();
LABEL_39:
    sub_10002C8C4();
LABEL_40:
    sub_10002C8C4();
LABEL_41:
    sub_10002C8C4();
LABEL_42:
    sub_10002C8C4();
    goto LABEL_43;
  }
  unsigned __int8 v14 = [v10 isEqualToString:*v12];
  p_var1 = a4;
  if (v14)
  {
LABEL_36:
    p_var1->var0 = v11;
    goto LABEL_37;
  }
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v16 = (void *)qword_100054FA0;
  uint64_t v33 = qword_100054FA0;
  if (!qword_100054FA0)
  {
    uint64_t v17 = (void *)sub_10002B0FC();
    v31[3] = (uint64_t)dlsym(v17, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionJawOpen");
    qword_100054FA0 = v31[3];
    uint64_t v16 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v16) {
    goto LABEL_39;
  }
  if ([v10 isEqualToString:*v16])
  {
    p_var1 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)&a4->var1;
    goto LABEL_36;
  }
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  id v18 = (void *)qword_100054FA8;
  uint64_t v33 = qword_100054FA8;
  if (!qword_100054FA8)
  {
    uint64_t v19 = (void *)sub_10002B0FC();
    v31[3] = (uint64_t)dlsym(v19, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionSmile");
    qword_100054FA8 = v31[3];
    id v18 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v18) {
    goto LABEL_40;
  }
  if ([v10 isEqualToString:*v18])
  {
    p_var1 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)&a4->var2;
    goto LABEL_36;
  }
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  unsigned int v20 = (void *)qword_100054FB0;
  uint64_t v33 = qword_100054FB0;
  if (!qword_100054FB0)
  {
    uint64_t v21 = (void *)sub_10002B0FC();
    v31[3] = (uint64_t)dlsym(v21, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionTongueOut");
    qword_100054FB0 = v31[3];
    unsigned int v20 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v20) {
    goto LABEL_41;
  }
  if ([v10 isEqualToString:*v20])
  {
    p_var1 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)&a4->var3;
    goto LABEL_36;
  }
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  v22 = (void *)qword_100054FB8;
  uint64_t v33 = qword_100054FB8;
  if (!qword_100054FB8)
  {
    unsigned __int8 v23 = (void *)sub_10002B0FC();
    v31[3] = (uint64_t)dlsym(v23, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionEyeBlink");
    qword_100054FB8 = v31[3];
    v22 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v22) {
    goto LABEL_42;
  }
  if ([v10 isEqualToString:*v22])
  {
    p_var1 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)&a4->var4;
    goto LABEL_36;
  }
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  v24 = (void *)qword_100054FC0;
  uint64_t v33 = qword_100054FC0;
  if (!qword_100054FC0)
  {
    v25 = (void *)sub_10002B0FC();
    v31[3] = (uint64_t)dlsym(v25, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionNoseSneer");
    qword_100054FC0 = v31[3];
    v24 = (void *)v31[3];
  }
  _Block_object_dispose(&v30, 8);
  if (!v24)
  {
LABEL_43:
    uint64_t v29 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v30, 8);
    _Unwind_Resume(v29);
  }
  if ([v10 isEqualToString:*v24])
  {
    p_var1 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)&a4->var5;
    goto LABEL_36;
  }
  if ([v10 isEqualToString:sub_100027434()])
  {
    p_var1 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)&a4->var6;
    goto LABEL_36;
  }
  if ([v10 isEqualToString:sub_10002752C()])
  {
    p_var1 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)&a4->var8;
    goto LABEL_36;
  }
  if ([v10 isEqualToString:sub_100027624()])
  {
    p_var1 = ($AA6A45B2DFCED8527C3A0E9A46B0D48F *)&a4->var7;
    goto LABEL_36;
  }
LABEL_37:
  long long v26 = *(_OWORD *)&a4->var6;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&a4->var4;
  *(_OWORD *)&retstr->var6 = v26;
  retstr->var8 = a4->var8;
  long long v27 = *(_OWORD *)&a4->var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&a4->var0;
  *(_OWORD *)&retstr->var2 = v27;

  return result;
}

- (unint64_t)_axFacialExpressionActivationForFaceKitLiteExpresionActivation:(unsigned __int8)a3
{
  if ((a3 - 1) < 3) {
    return (a3 - 1) + 1;
  }
  else {
    return 0;
  }
}

- (void)_processFaceKitResults:(__CFDictionary *)a3 withSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  uint64_t v6 = a3;
  v7 = [(__CFDictionary *)v6 objectForKeyedSubscript:sub_100026D88()];
  if (v7) {
    goto LABEL_12;
  }
  id v8 = [(AXMTFaceKitFaceTracker *)self _faceKitLiteFilterRef];
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2020000000;
  CFAllocatorRef v9 = (void (*)(CVAFaceTrackingLiteFilter *, __CFDictionary *))off_100054FE0;
  v50 = off_100054FE0;
  if (!off_100054FE0)
  {
    uint64_t v42 = _NSConcreteStackBlock;
    uint64_t v43 = 3221225472;
    uint64_t v44 = sub_10002B9A0;
    uint64_t v45 = &unk_100048B88;
    uint64_t v46 = &v47;
    id v10 = (void *)sub_10002B0FC();
    v48[3] = (uint64_t)dlsym(v10, "CVAFaceTrackingLiteFilterProcessVanilla");
    off_100054FE0 = *(_UNKNOWN **)(v46[1] + 24);
    CFAllocatorRef v9 = (void (*)(CVAFaceTrackingLiteFilter *, __CFDictionary *))v48[3];
  }
  _Block_object_dispose(&v47, 8);
  if (!v9)
  {
    sub_10002C8C4();
LABEL_26:
    sub_10002C8C4();
    goto LABEL_27;
  }
  v9(v8, v6);
  id v41 = 0;
  char v40 = 0;
  unint64_t v11 = [(AXMTFaceKitFaceTracker *)self _faceKitLiteFilterRef];
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2020000000;
  v12 = (uint64_t (*)(CVAFaceTrackingLiteFilter *))off_100054FF0;
  v50 = off_100054FF0;
  if (!off_100054FF0)
  {
    uint64_t v42 = _NSConcreteStackBlock;
    uint64_t v43 = 3221225472;
    uint64_t v44 = sub_10002BA40;
    uint64_t v45 = &unk_100048B88;
    uint64_t v46 = &v47;
    id v13 = (void *)sub_10002B0FC();
    v48[3] = (uint64_t)dlsym(v13, "CVAFaceTrackingLiteFilterGetOutput");
    off_100054FF0 = *(_UNKNOWN **)(v46[1] + 24);
    v12 = (uint64_t (*)(CVAFaceTrackingLiteFilter *))v48[3];
  }
  _Block_object_dispose(&v47, 8);
  if (!v12) {
    goto LABEL_26;
  }
  uint64_t v14 = v12(v11);
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x2020000000;
  id v15 = (void (*)(uint64_t, id *, char *))off_100054FE8;
  v50 = off_100054FE8;
  if (!off_100054FE8)
  {
    uint64_t v42 = _NSConcreteStackBlock;
    uint64_t v43 = 3221225472;
    uint64_t v44 = sub_10002B9F0;
    uint64_t v45 = &unk_100048B88;
    uint64_t v46 = &v47;
    uint64_t v16 = (void *)sub_10002B0FC();
    v48[3] = (uint64_t)dlsym(v16, "CVAFaceTrackingLiteFilterCopyDecodedOutput");
    off_100054FE8 = *(_UNKNOWN **)(v46[1] + 24);
    id v15 = (void (*)(uint64_t, id *, char *))v48[3];
  }
  _Block_object_dispose(&v47, 8);
  if (!v15)
  {
LABEL_27:
    long long v39 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v47, 8);
    _Unwind_Resume(v39);
  }
  v15(v14, &v41, &v40);
  uint64_t v17 = (__CFDictionary *)v41;

  uint64_t v6 = v17;
LABEL_12:
  id v18 = [(__CFDictionary *)v6 objectForKeyedSubscript:sub_100026D88()];

  if (v18) {
    [(AXMTFaceKitFaceTracker *)self _generateFaceKitResultForLiteOutput:v6];
  }
  else {
  uint64_t v19 = [(AXMTFaceKitFaceTracker *)self _generateFaceKitResultForVanillaOutput:v6 withSampleBuffer:a4];
  }
  if (!v19)
  {
    unsigned int v20 = AXSSLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10002C450(v20, v21, v22, v23, v24, v25, v26, v27);
    }

    [(AXMTFaceKitFaceTracker *)self set_initialFaceInfo:0];
    uint64_t v28 = [(AXMTFaceKitFaceTracker *)self lastResult];
    uint64_t v29 = [v28 error];
    if (v29)
    {
      uint64_t v30 = [(AXMTFaceKitFaceTracker *)self lastResult];
      uint64_t v31 = [v30 error];
      uint64_t v32 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v31 code]);
    }
    else
    {
      uint64_t v32 = 0;
    }

    int64_t v33 = +[AXMTUtilities errorCodeForFaceKitPayload:v6 lastReportedFailureNumber:v32];
    id v34 = objc_alloc((Class)NSError);
    id v35 = [v34 initWithDomain:AXSSMotionTrackingErrorDomain code:v33 userInfo:0];
    uint64_t v19 = [[AXMTFaceKitResult alloc] initWithError:v35];
  }
  [(AXMTFaceKitFaceTracker *)self setLastResult:v19];
  double v36 = [(AXMTFaceKitFaceTracker *)self delegate];
  char v37 = objc_opt_respondsToSelector();

  if (v37)
  {
    long long v38 = [(AXMTFaceKitFaceTracker *)self delegate];
    [v38 faceKitFaceTracker:self updatedResult:v19];
  }
}

- (void)_updateFaceInfoIfNeededWithMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [[AXMTFaceKitFaceTrackerFaceInfo alloc] initWithFaceMetadata:v4];

  [(AXMTFaceKitFaceTracker *)self set_initialFaceInfo:v5];
}

- (id)_handleFaceBlendShapes:(id)a3
{
  id v3 = a3;
  if (qword_100054ED0 != -1) {
    dispatch_once(&qword_100054ED0, &stru_100049190);
  }
  id v4 = +[NSMutableDictionary dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)qword_100054EC8;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        unint64_t v11 = objc_msgSend(v3, "objectForKeyedSubscript:", v10, (void)v14);
        if (v11)
        {
          v12 = [(id)qword_100054EC8 objectForKeyedSubscript:v10];
          [v4 setObject:v11 forKey:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (__n128)_poseTranslationMatrixFromArray:(void *)a3
{
  id v3 = a3;
  id v4 = [v3 objectAtIndexedSubscript:0];
  [v4 floatValue];
  unsigned __int32 v13 = v5;
  id v6 = [v3 objectAtIndexedSubscript:1];
  [v6 floatValue];
  unsigned __int32 v12 = v7;
  uint64_t v8 = [v3 objectAtIndexedSubscript:2];

  [v8 floatValue];
  unsigned __int32 v11 = v9;

  result.n128_u32[0] = v13;
  result.n128_u32[1] = v12;
  result.n128_u32[2] = v11;
  return result;
}

+ (__n128)_poseRotationMatrixFromArray:(void *)a3
{
  id v3 = a3;
  id v4 = [v3 objectAtIndexedSubscript:0];
  unsigned __int32 v5 = [v4 objectAtIndexedSubscript:0];
  [v5 floatValue];
  unsigned int v28 = v6;

  unsigned __int32 v7 = [v3 objectAtIndexedSubscript:1];
  uint64_t v8 = [v7 objectAtIndexedSubscript:0];
  [v8 floatValue];
  unsigned int v27 = v9;

  uint64_t v10 = [v3 objectAtIndexedSubscript:2];
  unsigned __int32 v11 = [v10 objectAtIndexedSubscript:0];
  [v11 floatValue];
  *(void *)&long long v12 = __PAIR64__(v27, v28);
  *((void *)&v12 + 1) = v13;
  long long v29 = v12;

  long long v14 = [v3 objectAtIndexedSubscript:0];
  long long v15 = [v14 objectAtIndexedSubscript:1];
  [v15 floatValue];

  long long v16 = [v3 objectAtIndexedSubscript:1];
  long long v17 = [v16 objectAtIndexedSubscript:1];
  [v17 floatValue];

  id v18 = [v3 objectAtIndexedSubscript:2];
  uint64_t v19 = [v18 objectAtIndexedSubscript:1];
  [v19 floatValue];

  unsigned int v20 = [v3 objectAtIndexedSubscript:0];
  uint64_t v21 = [v20 objectAtIndexedSubscript:2];
  [v21 floatValue];

  uint64_t v22 = [v3 objectAtIndexedSubscript:1];
  uint64_t v23 = [v22 objectAtIndexedSubscript:2];
  [v23 floatValue];

  uint64_t v24 = [v3 objectAtIndexedSubscript:2];

  uint64_t v25 = [v24 objectAtIndexedSubscript:2];
  [v25 floatValue];

  return (__n128)v29;
}

+ (id)_intrinsicsArrayFromMatrix:(__n128)a3
{
  uint64_t v19 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  v25[0] = v19;
  id v18 = +[NSNumber numberWithFloat:a2.n128_f64[0]];
  v25[1] = v18;
  long long v17 = +[NSNumber numberWithFloat:a3.n128_f64[0]];
  v25[2] = v17;
  id v3 = +[NSArray arrayWithObjects:v25 count:3];
  v26[0] = v3;
  HIDWORD(v4) = a1.n128_u32[1];
  LODWORD(v4) = a1.n128_u32[1];
  unsigned __int32 v5 = +[NSNumber numberWithFloat:v4];
  v24[0] = v5;
  HIDWORD(v6) = a2.n128_u32[1];
  LODWORD(v6) = a2.n128_u32[1];
  unsigned __int32 v7 = +[NSNumber numberWithFloat:v6];
  v24[1] = v7;
  HIDWORD(v8) = a3.n128_u32[1];
  LODWORD(v8) = a3.n128_u32[1];
  unsigned int v9 = +[NSNumber numberWithFloat:v8];
  v24[2] = v9;
  uint64_t v10 = +[NSArray arrayWithObjects:v24 count:3];
  v26[1] = v10;
  unsigned __int32 v11 = +[NSNumber numberWithFloat:COERCE_DOUBLE(__PAIR64__(a1.n128_u32[1], a1.n128_u32[2]))];
  v23[0] = v11;
  long long v12 = +[NSNumber numberWithFloat:COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2]))];
  v23[1] = v12;
  unsigned int v13 = +[NSNumber numberWithFloat:COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2]))];
  v23[2] = v13;
  long long v14 = +[NSArray arrayWithObjects:v23 count:3];
  v26[2] = v14;
  long long v15 = +[NSArray arrayWithObjects:v26 count:3];

  return v15;
}

+ (float)_intrinsicsMatrixFromFieldOfView:(uint64_t)a3 andWidth:(uint64_t)a4 andHeight:(uint64_t)a5
{
  return sqrtf((float)((float)(unint64_t)(a4 * a4) * 0.25) + (float)((float)(unint64_t)(a5 * a5) * 0.25))
       / tanf((float)((float)(a1 / 180.0) * 3.1416) * 0.5);
}

+ (id)_faceKitProcessOptionsForSampleBuffer:(opaqueCMSampleBuffer *)a3 detectedFaceInfo:(id)a4 callback:(id)a5
{
  id v8 = a4;
  id v65 = a5;
  unsigned int v9 = +[NSMutableDictionary dictionary];
  v77[0] = sub_100028F08();
  v78[0] = &off_100049F00;
  v77[1] = sub_100029000();
  v78[1] = &off_100049F18;
  uint64_t v62 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:2];
  long long v66 = +[NSMutableDictionary dictionary];
  [v66 setObject:v62 forKeyedSubscript:sub_1000290F8()];
  CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(a3);
  if (!ImageBuffer)
  {
    unsigned __int32 v11 = AXSSLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10002C540(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  CFTypeRef v19 = CMGetAttachment(a3, kCMSampleBufferAttachmentKey_CameraIntrinsicMatrix, 0);
  unsigned int v20 = (void *)v19;
  if (v19 && (CFTypeID v21 = CFGetTypeID(v19), v21 == CFDataGetTypeID()))
  {
    *(_OWORD *)long long v69 = 0u;
    memset(time, 0, sizeof(time));
    [v20 getBytes:time length:48];
    long long v64 = objc_msgSend(a1, "_intrinsicsArrayFromMatrix:", *(double *)time, *(double *)&time[16], v69[0]);
  }
  else
  {
    if (!ImageBuffer)
    {
LABEL_12:
      long long v64 = 0;
      goto LABEL_13;
    }
    long long v64 = [(id)objc_opt_class() _backupIntrinsicsMatrixForiOS];
  }
  if (!v64) {
    goto LABEL_12;
  }
  [v66 setObject:v64 forKeyedSubscript:sub_1000291F0()];
LABEL_13:
  id v22 = [v66 copy];
  [v9 setObject:v22 forKeyedSubscript:sub_1000292E8()];

  if (!v8)
  {
    uint64_t v23 = AXSSLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_10002C4C8(v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x2020000000;
  uint64_t v31 = (void *)qword_100055020;
  uint64_t v73 = qword_100055020;
  if (!qword_100055020)
  {
    *(void *)time = _NSConcreteStackBlock;
    *(void *)&time[8] = 3221225472;
    *(void *)&time[16] = sub_10002BC20;
    *(void *)&time[24] = &unk_100048B88;
    *(void *)&v69[0] = &v70;
    uint64_t v32 = (void *)sub_10002B0FC();
    int64_t v33 = dlsym(v32, "kCVAFaceTracking_DetectedFaceFaceID");
    *(void *)(*(void *)(*(void *)&v69[0] + 8) + 24) = v33;
    qword_100055020 = *(void *)(*(void *)(*(void *)&v69[0] + 8) + 24);
    uint64_t v31 = (void *)v71[3];
  }
  _Block_object_dispose(&v70, 8);
  if (!v31) {
    goto LABEL_47;
  }
  v74[0] = *v31;
  long long v63 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 identifier]);
  v75[0] = v63;
  v74[1] = sub_1000293E0();
  [v8 boundingBoxInNormalizedCoordinates];
  CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v80);
  v75[1] = DictionaryRepresentation;
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x2020000000;
  id v35 = (void *)qword_100055030;
  uint64_t v73 = qword_100055030;
  if (!qword_100055030)
  {
    *(void *)time = _NSConcreteStackBlock;
    *(void *)&time[8] = 3221225472;
    *(void *)&time[16] = sub_10002BCC0;
    *(void *)&time[24] = &unk_100048B88;
    *(void *)&v69[0] = &v70;
    double v36 = (void *)sub_10002B0FC();
    char v37 = dlsym(v36, "kCVAFaceTracking_DetectedFaceAngleInfoRoll");
    *(void *)(*(void *)(*(void *)&v69[0] + 8) + 24) = v37;
    qword_100055030 = *(void *)(*(void *)(*(void *)&v69[0] + 8) + 24);
    id v35 = (void *)v71[3];
  }
  _Block_object_dispose(&v70, 8);
  if (!v35) {
    goto LABEL_47;
  }
  v74[2] = *v35;
  [v8 roll];
  long long v38 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v75[2] = v38;
  long long v39 = +[NSDictionary dictionaryWithObjects:v75 forKeys:v74 count:3];
  v76 = v39;
  char v40 = +[NSArray arrayWithObjects:&v76 count:1];
  id v41 = v8;
  uint64_t v42 = a3;
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x2020000000;
  uint64_t v43 = (void *)qword_100055038;
  uint64_t v73 = qword_100055038;
  if (!qword_100055038)
  {
    *(void *)time = _NSConcreteStackBlock;
    *(void *)&time[8] = 3221225472;
    *(void *)&time[16] = sub_10002BD10;
    *(void *)&time[24] = &unk_100048B88;
    *(void *)&v69[0] = &v70;
    uint64_t v44 = (void *)sub_10002B0FC();
    uint64_t v45 = dlsym(v44, "kCVAFaceTracking_DetectedFacesArray");
    *(void *)(*(void *)(*(void *)&v69[0] + 8) + 24) = v45;
    qword_100055038 = *(void *)(*(void *)(*(void *)&v69[0] + 8) + 24);
    uint64_t v43 = (void *)v71[3];
  }
  _Block_object_dispose(&v70, 8);
  if (!v43) {
    goto LABEL_47;
  }
  [v9 setObject:v40 forKeyedSubscript:*v43];

  if (!ImageBuffer) {
    goto LABEL_31;
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x2020000000;
  uint64_t v46 = (void *)qword_100055040;
  uint64_t v73 = qword_100055040;
  if (!qword_100055040)
  {
    *(void *)time = _NSConcreteStackBlock;
    *(void *)&time[8] = 3221225472;
    *(void *)&time[16] = sub_10002BD60;
    *(void *)&time[24] = &unk_100048B88;
    *(void *)&v69[0] = &v70;
    uint64_t v47 = (void *)sub_10002B0FC();
    uint64_t v48 = dlsym(v47, "kCVAFaceTracking_Color");
    *(void *)(*(void *)(*(void *)&v69[0] + 8) + 24) = v48;
    qword_100055040 = *(void *)(*(void *)(*(void *)&v69[0] + 8) + 24);
    uint64_t v46 = (void *)v71[3];
  }
  _Block_object_dispose(&v70, 8);
  if (!v46)
  {
LABEL_47:
    sub_10002C8C4();
    goto LABEL_51;
  }
  [v9 setObject:ImageBuffer forKeyedSubscript:*v46];
LABEL_31:
  memset(&v67, 0, sizeof(v67));
  CMSampleBufferGetPresentationTimeStamp(&v67, v42);
  *(CMTime *)time = v67;
  CFDictionaryRef v49 = CMTimeCopyAsDictionary((CMTime *)time, kCFAllocatorDefault);
  if (v49)
  {
    uint64_t v70 = 0;
    uint64_t v71 = &v70;
    uint64_t v72 = 0x2020000000;
    v50 = (void *)qword_100055048;
    uint64_t v73 = qword_100055048;
    if (!qword_100055048)
    {
      *(void *)time = _NSConcreteStackBlock;
      *(void *)&time[8] = 3221225472;
      *(void *)&time[16] = sub_10002BDB0;
      *(void *)&time[24] = &unk_100048B88;
      *(void *)&v69[0] = &v70;
      id v51 = (void *)sub_10002B0FC();
      v52 = dlsym(v51, "kCVAFaceTracking_Timestamp");
      *(void *)(*(void *)(*(void *)&v69[0] + 8) + 24) = v52;
      qword_100055048 = *(void *)(*(void *)(*(void *)&v69[0] + 8) + 24);
      v50 = (void *)v71[3];
    }
    _Block_object_dispose(&v70, 8);
    if (!v50) {
      goto LABEL_50;
    }
    [v9 setObject:v49 forKeyedSubscript:*v50];
  }
  if (v65)
  {
    id v53 = objc_retainBlock(v65);
    uint64_t v70 = 0;
    uint64_t v71 = &v70;
    uint64_t v72 = 0x2020000000;
    long long v54 = (void *)qword_100055050;
    uint64_t v73 = qword_100055050;
    if (!qword_100055050)
    {
      *(void *)time = _NSConcreteStackBlock;
      *(void *)&time[8] = 3221225472;
      *(void *)&time[16] = sub_10002BE00;
      *(void *)&time[24] = &unk_100048B88;
      *(void *)&v69[0] = &v70;
      long long v55 = (void *)sub_10002B0FC();
      long long v56 = dlsym(v55, "kCVAFaceTracking_Callback");
      *(void *)(*(void *)(*(void *)&v69[0] + 8) + 24) = v56;
      qword_100055050 = *(void *)(*(void *)(*(void *)&v69[0] + 8) + 24);
      long long v54 = (void *)v71[3];
    }
    _Block_object_dispose(&v70, 8);
    if (!v54) {
      goto LABEL_50;
    }
    [v9 setObject:v53 forKeyedSubscript:*v54];
  }
  uint64_t v70 = 0;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x2020000000;
  uint64_t v57 = (void *)qword_100055058;
  uint64_t v73 = qword_100055058;
  if (!qword_100055058)
  {
    *(void *)time = _NSConcreteStackBlock;
    *(void *)&time[8] = 3221225472;
    *(void *)&time[16] = sub_10002BE50;
    *(void *)&time[24] = &unk_100048B88;
    *(void *)&v69[0] = &v70;
    long long v58 = (void *)sub_10002B0FC();
    long long v59 = dlsym(v58, "kCVAFaceTracking_AddMesh");
    *(void *)(*(void *)(*(void *)&v69[0] + 8) + 24) = v59;
    qword_100055058 = *(void *)(*(void *)(*(void *)&v69[0] + 8) + 24);
    uint64_t v57 = (void *)v71[3];
  }
  _Block_object_dispose(&v70, 8);
  if (!v57)
  {
LABEL_50:
    sub_10002C8C4();
LABEL_51:
    __break(1u);
  }
  [v9 setObject:&__kCFBooleanTrue forKeyedSubscript:*v57];
  id v60 = [v9 copy];

  return v60;
}

+ (NSDictionary)_faceKitCreationOptions
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  v2 = (void *)qword_100055060;
  uint64_t v19 = qword_100055060;
  if (!qword_100055060)
  {
    id v3 = (void *)sub_10002B0FC();
    v17[3] = (uint64_t)dlsym(v3, "kCVAFaceTracking_ColorOnly");
    qword_100055060 = v17[3];
    v2 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v2) {
    goto LABEL_16;
  }
  v20[0] = *v2;
  v21[0] = &__kCFBooleanTrue;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  double v4 = (void *)qword_100055068;
  uint64_t v19 = qword_100055068;
  if (!qword_100055068)
  {
    unsigned __int32 v5 = (void *)sub_10002B0FC();
    v17[3] = (uint64_t)dlsym(v5, "kCVAFaceTracking_NumTrackedFaces");
    qword_100055068 = v17[3];
    double v4 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v4) {
    goto LABEL_16;
  }
  v20[1] = *v4;
  double v6 = +[NSNumber numberWithInteger:1];
  v21[1] = v6;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  unsigned __int32 v7 = (void *)qword_100055070;
  uint64_t v19 = qword_100055070;
  if (!qword_100055070)
  {
    id v8 = (void *)sub_10002B0FC();
    v17[3] = (uint64_t)dlsym(v8, "kCVAFaceTracking_UseRecognition");
    qword_100055070 = v17[3];
    unsigned __int32 v7 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v7) {
    goto LABEL_16;
  }
  v20[2] = *v7;
  unsigned int v9 = +[NSNumber numberWithBool:AXMTFaceKitUseRecognition];
  v21[2] = v9;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v10 = (void *)qword_100055078;
  uint64_t v19 = qword_100055078;
  if (!qword_100055078)
  {
    unsigned __int32 v11 = (void *)sub_10002B0FC();
    v17[3] = (uint64_t)dlsym(v11, "kCVAFaceTracking_NetworkFailureThresholdMultiplier");
    qword_100055078 = v17[3];
    uint64_t v10 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (!v10)
  {
LABEL_16:
    sub_10002C8C4();
    __break(1u);
  }
  v20[3] = *v10;
  LODWORD(v12) = 1069547520;
  uint64_t v13 = +[NSNumber numberWithFloat:v12];
  v21[3] = v13;
  uint64_t v14 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];

  return (NSDictionary *)v14;
}

+ (id)_backupIntrinsicsMatrixForiOS
{
  if (qword_100054EE0 != -1) {
    dispatch_once(&qword_100054EE0, &stru_1000491B0);
  }
  v2 = (void *)qword_100054ED8;

  return v2;
}

- (AXMTFaceKitResult)lastResult
{
  return self->_lastResult;
}

- (void)setLastResult:(id)a3
{
}

- (AXMTFaceKitFaceTrackerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXMTFaceKitFaceTrackerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CVAFaceTracking)_faceKitRef
{
  return self->__faceKitRef;
}

- (void)set_faceKitRef:(CVAFaceTracking *)a3
{
  self->__faceKitRef = a3;
}

- (CVAFaceTrackingLiteFilter)_faceKitLiteFilterRef
{
  return self->__faceKitLiteFilterRef;
}

- (void)set_faceKitLiteFilterRef:(CVAFaceTrackingLiteFilter *)a3
{
  self->__faceKitLiteFilterRef = a3;
}

- (AXMTFaceKitFaceTrackerFaceInfo)_initialFaceInfo
{
  return self->__initialFaceInfo;
}

- (void)set_initialFaceInfo:(id)a3
{
}

- (NSValue)_referenceDimensionsValue
{
  return self->__referenceDimensionsValue;
}

- (void)set_referenceDimensionsValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__referenceDimensionsValue, 0);
  objc_storeStrong((id *)&self->__initialFaceInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_lastResult, 0);
}

@end