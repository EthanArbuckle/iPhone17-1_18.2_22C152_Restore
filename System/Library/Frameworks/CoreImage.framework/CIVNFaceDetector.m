@interface CIVNFaceDetector
- (CIContext)context;
- (CIVNFaceDetector)initWithContext:(id)a3 options:(id)a4;
- (id)featuresInImage:(id)a3 options:(id)a4;
- (void)dealloc;
@end

@implementation CIVNFaceDetector

- (CIVNFaceDetector)initWithContext:(id)a3 options:(id)a4
{
  v4 = (CIContext *)a3;
  v8.receiver = self;
  v8.super_class = (Class)CIVNFaceDetector;
  v5 = [(CIDetector *)&v8 init];
  if (v5)
  {
    if (!v4) {
      v4 = +[CIContext _singletonContext];
    }
    v5->context = v4;
    v6 = v4;
  }
  return v5;
}

- (id)featuresInImage:(id)a3 options:(id)a4
{
  uint64_t v133 = *MEMORY[0x1E4F143B8];
  uint64_t v113 = 0;
  v114 = &v113;
  uint64_t v115 = 0x2020000000;
  int v116 = 0;
  v6 = ci_signpost_log_detector();
  if ((unint64_t)&self->super.super.isa + 1 >= 2)
  {
    v7 = v6;
    if (os_signpost_enabled(v6))
    {
      int v8 = *((_DWORD *)v114 + 6);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v8;
      _os_signpost_emit_with_name_impl(&dword_193671000, v7, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)self, "CIVNFaceDetector", "count:%d", buf, 8u);
    }
  }
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v109 = __44__CIVNFaceDetector_featuresInImage_options___block_invoke;
  v110 = &unk_1E5771090;
  v112 = self;
  v111 = &v113;
  if (a4)
  {
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"CIDetectorAccuracy"), "isEqual:", @"CIDetectorAccuracyLow");
    if ([a4 objectForKey:@"CIDetectorSmile"]) {
      int v10 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"CIDetectorSmile"), "BOOLValue");
    }
    else {
      int v10 = 0;
    }
    if ([a4 objectForKey:@"CIDetectorEyeBlink"]) {
      unsigned int v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"CIDetectorEyeBlink"), "BOOLValue");
    }
    else {
      unsigned int v13 = 0;
    }
    if ([a4 objectForKey:@"CIDetectorImageOrientation"]) {
      unsigned int v82 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", @"CIDetectorImageOrientation"), "intValue");
    }
    else {
      unsigned int v82 = 1;
    }
    id v11 = (id)[a4 mutableCopy];
    uint64_t v12 = v10 | v13;
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v12 = 0;
    uint64_t v9 = 0;
    unsigned int v82 = 1;
  }
  uint64_t v14 = MEMORY[0x1E4F1CC38];
  v126[0] = MEMORY[0x1E4F1CC38];
  v125[0] = @"kCIVNDetectOptionRequestLandmarks";
  v125[1] = @"kCIVNDetectOptionRequestAttributes";
  v126[1] = [NSNumber numberWithBool:v12];
  v126[2] = v14;
  v125[2] = @"kCIVNDetectOptionRequestPose";
  v125[3] = @"kCIVNDetectOptionRequestFast";
  v126[3] = [NSNumber numberWithBool:v9];
  objc_msgSend(v11, "addEntriesFromDictionary:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v126, v125, 4));
  obuint64_t j = (id)CIVNDetectFaces((uint64_t)a3, v82, (uint64_t)self->context, v11);

  if (!obj)
  {
    id v72 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_65;
  }
  id v80 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  uint64_t v81 = [obj countByEnumeratingWithState:&v104 objects:v124 count:16];
  if (!v81) {
    goto LABEL_63;
  }
  uint64_t v79 = *(void *)v105;
  do
  {
    for (uint64_t i = 0; i != v81; ++i)
    {
      if (*(void *)v105 != v79) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v104 + 1) + 8 * i);
      v16 = (void *)CIVNDenormalizedLandmarks(a3, v82, v15);
      v90 = (void *)[v16 objectForKeyedSubscript:@"allPoints"];
      v17 = (void *)[v16 objectForKeyedSubscript:@"leftEye"];
      v91 = (void *)[v16 objectForKeyedSubscript:@"outerLips"];
      v92 = (void *)[v16 objectForKeyedSubscript:@"rightEye"];
      uint64_t v103 = 0;
      float v102 = 0.0;
      [v15 pose];
      double v22 = *(double *)v18.i64;
      v89 = v16;
      if (*(float *)v18.i32 != 1.0
        || (v23.i32[1] = v18.i32[1],
            v23.i32[0] = vextq_s8(v18, v18, 8uLL).u32[0],
            int32x2_t v24 = vceqz_f32(v23),
            (v24.i8[4] & 1) == 0)
        || (v24.i8[0] & 1) == 0)
      {
        double v77 = v21;
        double v78 = v20;
        double v84 = v19;
        double v87 = v22;
        *(void *)buf = 0;
        uint64_t v128 = (uint64_t)buf;
        uint64_t v129 = 0x3052000000;
        v130 = __Block_byref_object_copy__18;
        v131 = __Block_byref_object_dispose__18;
        v25 = (void *)getVNFaceObservationClass_softClass;
        uint64_t v132 = getVNFaceObservationClass_softClass;
        if (!getVNFaceObservationClass_softClass)
        {
          uint64_t v117 = MEMORY[0x1E4F143A8];
          uint64_t v118 = 3221225472;
          uint64_t v119 = (uint64_t)__getVNFaceObservationClass_block_invoke;
          v120 = &unk_1E57710B8;
          v121 = buf;
          __getVNFaceObservationClass_block_invoke((uint64_t)&v117);
          v25 = *(void **)(v128 + 40);
        }
        _Block_object_dispose(buf, 8);
        if (objc_msgSend(v25, "computeYawPitchRollFromPoseMatrix:outputYaw:outputPitch:outputRoll:", (char *)&v103 + 4, &v103, &v102, v87, v84, v78, v77))
        {
          float v26 = v102;
LABEL_31:
          float v27 = v26 * -57.296;
          goto LABEL_33;
        }
      }
      if ([v15 roll])
      {
        objc_msgSend((id)objc_msgSend(v15, "roll"), "floatValue");
        goto LABEL_31;
      }
      float v27 = 0.0;
LABEL_33:
      long long v100 = 0u;
      long long v101 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      v28 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "faceAttributes"), "smilingCategory"), "allLabelsWithConfidences");
      uint64_t v29 = [v28 countByEnumeratingWithState:&v98 objects:v123 count:16];
      if (v29)
      {
        v85 = v17;
        uint64_t v30 = *(void *)v99;
        while (2)
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v99 != v30) {
              objc_enumerationMutation(v28);
            }
            v32 = *(void **)(*((void *)&v98 + 1) + 8 * j);
            v33 = (void *)[v32 identifier];
            uint64_t v117 = 0;
            uint64_t v118 = (uint64_t)&v117;
            uint64_t v119 = 0x2020000000;
            v34 = (void *)getVNFaceAttributeSmilingSymbolLoc_ptr;
            v120 = (void *)getVNFaceAttributeSmilingSymbolLoc_ptr;
            if (!getVNFaceAttributeSmilingSymbolLoc_ptr)
            {
              *(void *)buf = MEMORY[0x1E4F143A8];
              uint64_t v128 = 3221225472;
              uint64_t v129 = (uint64_t)__getVNFaceAttributeSmilingSymbolLoc_block_invoke;
              v130 = (void (*)(uint64_t, uint64_t))&unk_1E57710B8;
              v131 = (void (*)(uint64_t))&v117;
              v35 = (void *)VisionLibrary_1();
              v36 = dlsym(v35, "VNFaceAttributeSmiling");
              *(void *)(*((void *)v131 + 1) + 24) = v36;
              getVNFaceAttributeSmilingSymbolLoc_ptr = *(void *)(*((void *)v131 + 1) + 24);
              v34 = *(void **)(v118 + 24);
            }
            _Block_object_dispose(&v117, 8);
            if (!v34)
            {
              objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", @"NSString *getVNFaceAttributeSmiling(void)", @"CIVision.h", 64, @"%s", dlerror());
              goto LABEL_68;
            }
            if ([v33 isEqualToString:*v34])
            {
              [v32 confidence];
              v17 = v85;
              BOOL v37 = v38 > 0.5;
              goto LABEL_47;
            }
          }
          uint64_t v29 = [v28 countByEnumeratingWithState:&v98 objects:v123 count:16];
          if (v29) {
            continue;
          }
          break;
        }
        BOOL v37 = 0;
        v17 = v85;
      }
      else
      {
        BOOL v37 = 0;
      }
LABEL_47:
      long long v96 = 0u;
      long long v97 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      v39 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v15, "faceAttributes"), "eyesCategory"), "allLabelsWithConfidences");
      uint64_t v40 = [v39 countByEnumeratingWithState:&v94 objects:v122 count:16];
      float v88 = v27;
      if (v40)
      {
        BOOL v86 = v37;
        v41 = v17;
        uint64_t v42 = *(void *)v95;
LABEL_49:
        uint64_t v43 = 0;
        while (1)
        {
          if (*(void *)v95 != v42) {
            objc_enumerationMutation(v39);
          }
          v44 = *(void **)(*((void *)&v94 + 1) + 8 * v43);
          v45 = (void *)[v44 identifier];
          uint64_t v117 = 0;
          uint64_t v118 = (uint64_t)&v117;
          uint64_t v119 = 0x2020000000;
          v46 = (void *)getVNFaceAttributeEyesClosedSymbolLoc_ptr;
          v120 = (void *)getVNFaceAttributeEyesClosedSymbolLoc_ptr;
          if (!getVNFaceAttributeEyesClosedSymbolLoc_ptr)
          {
            *(void *)buf = MEMORY[0x1E4F143A8];
            uint64_t v128 = 3221225472;
            uint64_t v129 = (uint64_t)__getVNFaceAttributeEyesClosedSymbolLoc_block_invoke;
            v130 = (void (*)(uint64_t, uint64_t))&unk_1E57710B8;
            v131 = (void (*)(uint64_t))&v117;
            v47 = (void *)VisionLibrary_1();
            v48 = dlsym(v47, "VNFaceAttributeEyesClosed");
            *(void *)(*((void *)v131 + 1) + 24) = v48;
            getVNFaceAttributeEyesClosedSymbolLoc_ptr = *(void *)(*((void *)v131 + 1) + 24);
            v46 = *(void **)(v118 + 24);
          }
          _Block_object_dispose(&v117, 8);
          if (!v46)
          {
            objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", @"NSString *getVNFaceAttributeEyesClosed(void)", @"CIVision.h", 67, @"%s", dlerror());
LABEL_68:
            __break(1u);
          }
          if ([v45 isEqualToString:*v46]) {
            break;
          }
          if (v40 == ++v43)
          {
            uint64_t v40 = [v39 countByEnumeratingWithState:&v94 objects:v122 count:16];
            if (!v40)
            {
              BOOL v49 = 0;
              v17 = v41;
              BOOL v37 = v86;
              goto LABEL_61;
            }
            goto LABEL_49;
          }
        }
        [v44 confidence];
        BOOL v37 = v86;
        v17 = v41;
        BOOL v49 = v50 > 0.5;
      }
      else
      {
        BOOL v49 = 0;
      }
LABEL_61:
      v51 = [CIFaceFeature alloc];
      double v52 = CIVNBoundingRect(v90);
      double v54 = v53;
      double v56 = v55;
      double v58 = v57;
      uint64_t v59 = [v17 count];
      double v60 = CIVNAverage(v17);
      double v62 = v61;
      uint64_t v63 = [v92 count];
      double v64 = CIVNAverage(v92);
      double v66 = v65;
      uint64_t v67 = [v91 count];
      double v68 = CIVNAverage(v91);
      BYTE6(v75) = v49;
      BYTE5(v75) = v49;
      BYTE4(v75) = v37;
      LODWORD(v75) = 0;
      BYTE4(v74) = 0;
      *(float *)&uint64_t v74 = v88;
      v70 = -[CIFaceFeature initWithBounds:hasLeftEyePosition:leftEyePosition:hasRightEyePosition:rightEyePosition:hasMouthPosition:mouthPosition:hasFaceAngle:faceAngle:hasTrackingID:trackingID:hasTrackingFrameCount:trackingFrameCount:hasSmile:leftEyeClosed:rightEyeClosed:landmarks:](v51, "initWithBounds:hasLeftEyePosition:leftEyePosition:hasRightEyePosition:rightEyePosition:hasMouthPosition:mouthPosition:hasFaceAngle:faceAngle:hasTrackingID:trackingID:hasTrackingFrameCount:trackingFrameCount:hasSmile:leftEyeClosed:rightEyeClosed:landmarks:", v59 != 0, v63 != 0, v67 != 0, 1, 0, 0, v52, v54, v56, v58, v60, v62, v64, v66, *(void *)&v68,
              v69,
              v74,
              v75,
              v89);
      [v80 addObject:v70];
    }
    uint64_t v81 = [obj countByEnumeratingWithState:&v104 objects:v124 count:16];
  }
  while (v81);
LABEL_63:
  int v71 = [v80 count];
  *((_DWORD *)v114 + 6) = v71;
  id v72 = v80;
LABEL_65:
  v109((uint64_t)v108);
  _Block_object_dispose(&v113, 8);
  return v72;
}

void __44__CIVNFaceDetector_featuresInImage_options___block_invoke(uint64_t a1)
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
      _os_signpost_emit_with_name_impl(&dword_193671000, v4, OS_SIGNPOST_INTERVAL_END, v3, "CIVNFaceDetector", "count:%d", (uint8_t *)v6, 8u);
    }
  }
}

- (void)dealloc
{
  self->context = 0;
  v3.receiver = self;
  v3.super_class = (Class)CIVNFaceDetector;
  [(CIVNFaceDetector *)&v3 dealloc];
}

- (CIContext)context
{
  return (CIContext *)objc_getProperty(self, a2, 8, 1);
}

@end