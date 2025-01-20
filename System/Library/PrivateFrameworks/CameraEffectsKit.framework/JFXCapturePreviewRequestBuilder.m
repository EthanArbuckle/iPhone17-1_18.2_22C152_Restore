@interface JFXCapturePreviewRequestBuilder
- (JFXCapturePreviewProperties)previewProperties;
- (JFXCapturePreviewRequestBuilder)initWithPreviewProperties:(id)a3 outputColorSpace:(id)a4;
- (PVColorSpace)outputColorSpace;
- (PVTransformAnimationInfo)requestTransformAnimation;
- (id)JFX_getEffectsOfType:(id)a3 ofType:(int)a4;
- (id)JFX_visibleEffects:(id)a3;
- (id)createPVRenderRequestUsingAnimojiRenderer:(id)a3 metadataValidator:(id)a4 additionalTransform:(CGAffineTransform *)a5 effectStack:(id)a6 animojiTapPoint:(BOOL)a7 animojiUsesInterfaceOrientation:(BOOL)a8 requestHandler:(id *)a9;
- (void)setRequestTransformAnimation:(PVTransformAnimationInfo *)a3;
@end

@implementation JFXCapturePreviewRequestBuilder

- (JFXCapturePreviewRequestBuilder)initWithPreviewProperties:(id)a3 outputColorSpace:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)JFXCapturePreviewRequestBuilder;
  v8 = [(JFXCapturePreviewRequestBuilder *)&v17 init];
  v9 = (void *)*((void *)v8 + 3);
  *((void *)v8 + 3) = v6;
  id v10 = v6;

  PVTransformAnimationInfoIdentity();
  *(_OWORD *)(v8 + 40) = v13;
  *(_OWORD *)(v8 + 56) = v14;
  *(_OWORD *)(v8 + 72) = v15;
  *((void *)v8 + 11) = v16;
  *((_WORD *)v8 + 8) = 0;
  v11 = (void *)*((void *)v8 + 4);
  *((void *)v8 + 4) = v7;

  return (JFXCapturePreviewRequestBuilder *)v8;
}

- (id)createPVRenderRequestUsingAnimojiRenderer:(id)a3 metadataValidator:(id)a4 additionalTransform:(CGAffineTransform *)a5 effectStack:(id)a6 animojiTapPoint:(BOOL)a7 animojiUsesInterfaceOrientation:(BOOL)a8 requestHandler:(id *)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  v166[4] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  v18 = [(JFXCapturePreviewRequestBuilder *)self previewProperties];
  v19 = [v18 cameraFrameSet];

  if (!v19) {
    goto LABEL_18;
  }
  v125 = a5;
  v20 = [v19 metadataDict];
  v21 = [v20 objectForKey:@"PVFrameSetMetadataOriginalBufferSizeKey"];
  [v21 CGSizeValue];
  double v23 = v22;
  double v25 = v24;

  if (v23 == *MEMORY[0x263F001B0] && v25 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
LABEL_18:
    v51 = 0;
    goto LABEL_62;
  }
  v122 = v16;
  v126 = [v19 colorImageBuffer];
  v27 = [v19 metadataDict];
  v28 = [v27 objectForKey:@"PVFrameSetMetadataARMetadataKey"];

  v120 = [v28 faceAnchor];
  v127 = v28;
  v124 = [v28 arFrame];
  v29 = [(JFXCapturePreviewRequestBuilder *)self previewProperties];
  [v29 renderOutputSize];
  double v31 = v30;
  double v33 = v32;

  v34 = [v19 metadataObjectForKey:*MEMORY[0x263F61650]];
  v35 = self;
  uint64_t v36 = [v34 captureVideoOrientation];
  v117 = v34;
  uint64_t v37 = [v34 interfaceOrientation];
  v38 = [v19 metadataObjectForKey:@"PVFrameSetMetadataDeviceOrientationkey"];
  uint64_t v39 = [v38 integerValue];

  v123 = objc_opt_new();
  v129 = v35;
  v40 = [(JFXCapturePreviewRequestBuilder *)v35 JFX_getEffectsOfType:v17 ofType:7];
  v41 = [v40 firstObject];

  v118 = v19;
  v116 = v41;
  if (v15 && v41)
  {
    if (v124)
    {
      if (v9) {
        uint64_t v42 = v37;
      }
      else {
        uint64_t v42 = v39;
      }
      int v43 = ((unint64_t)(v36 - 5) < 0xFFFFFFFFFFFFFFFELL) ^ ((unint64_t)(v42 - 3) < 2);
      if (v43) {
        double v44 = v25;
      }
      else {
        double v44 = v23;
      }
      if (!v43) {
        double v23 = v25;
      }
      objc_msgSend(v122, "validateFaceTrackedARFrame:");
      v166[0] = v127;
      v165[0] = @"JFXAnimojiRendererMetadata_JFXARMetadata";
      v165[1] = @"JFXAnimojiRendererMetadata_RenderSize";
      *(double *)v154 = v23;
      *(double *)&v154[1] = v44;
      v45 = [MEMORY[0x263F08D40] valueWithBytes:v154 objCType:"{CGSize=dd}"];
      v166[1] = v45;
      v165[2] = @"JFXAnimojiRendererMetadata_AVCaptureVideoOrientation";
      v46 = [NSNumber numberWithInteger:v36];
      v166[2] = v46;
      v165[3] = @"JFXAnimojiRendererMetadata_UIInterfaceOrientation";
      v47 = [NSNumber numberWithInteger:v42];
      v166[3] = v47;
      [NSDictionary dictionaryWithObjects:v166 forKeys:v165 count:4];
      v49 = uint64_t v48 = v37;

      id v50 = +[JFXCustomRenderProperties newCustomRenderProperties:v15 metadata:v49];
      [v50 setAnimojiTapPoint:v10];
      [v123 setObject:v50 forKeyedSubscript:@"JFXCustomRenderingPropertiesKey_Animoji"];
      v129->_logged_render_request_failure_animojuint64_t i = 0;

      uint64_t v37 = v48;
    }
    else if (!v129->_logged_render_request_failure_animoji)
    {
      v52 = JFXLog_animoji();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        -[JFXCapturePreviewRequestBuilder createPVRenderRequestUsingAnimojiRenderer:metadataValidator:additionalTransform:effectStack:animojiTapPoint:animojiUsesInterfaceOrientation:requestHandler:](v41, v52);
      }

      v129->_logged_render_request_failure_animojuint64_t i = 1;
    }
  }
  v53 = [(JFXCapturePreviewRequestBuilder *)v129 JFX_getEffectsOfType:v17 ofType:2];
  v121 = v53;
  id v119 = v15;
  v128 = v17;
  if ([v53 count])
  {
    if (![v127 hasTrackedFace])
    {
      v61 = 0;
LABEL_32:
      long long v146 = 0u;
      long long v147 = 0u;
      long long v144 = 0u;
      long long v145 = 0u;
      id v65 = v53;
      uint64_t v66 = [v65 countByEnumeratingWithState:&v144 objects:v159 count:16];
      if (v66)
      {
        uint64_t v67 = v66;
        uint64_t v68 = *(void *)v145;
        do
        {
          for (uint64_t i = 0; i != v67; ++i)
          {
            if (*(void *)v145 != v68) {
              objc_enumerationMutation(v65);
            }
            id v70 = *(id *)(*((void *)&v144 + 1) + 8 * i);
            if (([v70 isEditingFaceTrackingTransforms] & 1) == 0) {
              [v70 setFaceTrackingTransform:v61];
            }
          }
          uint64_t v67 = [v65 countByEnumeratingWithState:&v144 objects:v159 count:16];
        }
        while (v67);
      }

      id v17 = v128;
      goto LABEL_42;
    }
    if (v124)
    {
      [v122 validateFaceTrackedARFrame:v124];
      v164[0] = v124;
      v163[0] = @"JFXFaceTrackingRendererMetadata_ARFrame";
      v163[1] = @"JFXFaceTrackingRendererMetadata_OriginalBufferSize";
      *(double *)v153 = v31;
      *(double *)&v153[1] = v33;
      v54 = [MEMORY[0x263F08D40] valueWithBytes:v153 objCType:"{CGSize=dd}"];
      v164[1] = v54;
      v163[2] = @"JFXFaceTrackingRendererMetadata_AVCaptureVideoOrientation";
      v55 = [NSNumber numberWithInteger:v36];
      v164[2] = v55;
      v163[3] = @"JFXFaceTrackingRendererMetadata_UIInterfaceOrientation";
      v56 = [NSNumber numberWithInteger:v37];
      v164[3] = v56;
      v163[4] = @"JFXFaceTrackingRendererMetadata_DeviceInterfaceOrientation";
      v57 = [NSNumber numberWithInteger:v39];
      v164[4] = v57;
      v58 = NSDictionary;
      v59 = v164;
      v60 = v163;
    }
    else
    {
      if (!v120)
      {
        long long v150 = 0u;
        long long v151 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        id v102 = v53;
        uint64_t v103 = [v102 countByEnumeratingWithState:&v148 objects:v160 count:16];
        v104 = v129;
        if (v103)
        {
          uint64_t v105 = v103;
          uint64_t v106 = *(void *)v149;
          uint64_t v114 = 138543618;
          do
          {
            for (uint64_t j = 0; j != v105; ++j)
            {
              if (*(void *)v149 != v106) {
                objc_enumerationMutation(v102);
              }
              id v108 = *(id *)(*((void *)&v148 + 1) + 8 * j);
              v109 = [v108 trackingProps];
              uint64_t v110 = [v109 currentTrackingType];

              if ((unint64_t)(v110 - 1) <= 1 && !v104->_logged_render_request_failure_facetracking)
              {
                v111 = JFXLog_facetracking();
                if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
                {
                  v112 = NSStringFromJFXEffectType([v108 type]);
                  v113 = [v108 displayName];
                  *(_DWORD *)buf = 138543618;
                  *(void *)&buf[4] = v112;
                  *(_WORD *)&buf[12] = 2114;
                  *(void *)&buf[14] = v113;
                  _os_log_error_impl(&dword_234C41000, v111, OS_LOG_TYPE_ERROR, "Unable to build render request with effect - type: %{public}@, name: %{public}@", buf, 0x16u);

                  v104 = v129;
                }
              }
            }
            uint64_t v105 = [v102 countByEnumeratingWithState:&v148 objects:v160 count:16];
          }
          while (v105);
        }

        v104->_logged_render_request_failure_facetracking = 1;
        goto LABEL_31;
      }
      v162[0] = v120;
      v161[0] = @"JFXFaceTrackingRendererMetadata_JFXFaceAnchor";
      v161[1] = @"JFXFaceTrackingRendererMetadata_OriginalBufferSize";
      *(double *)v152 = v31;
      *(double *)&v152[1] = v33;
      v54 = [MEMORY[0x263F08D40] valueWithBytes:v152 objCType:"{CGSize=dd}"];
      v162[1] = v54;
      v161[2] = @"JFXFaceTrackingRendererMetadata_AVCaptureVideoOrientation";
      v55 = [NSNumber numberWithInteger:v36];
      v162[2] = v55;
      v161[3] = @"JFXFaceTrackingRendererMetadata_UIInterfaceOrientation";
      v56 = [NSNumber numberWithInteger:v37];
      v162[3] = v56;
      v161[4] = @"JFXFaceTrackingRendererMetadata_DeviceInterfaceOrientation";
      v57 = [NSNumber numberWithInteger:v39];
      v162[4] = v57;
      v58 = NSDictionary;
      v59 = v162;
      v60 = v161;
    }
    v62 = [v58 dictionaryWithObjects:v59 forKeys:v60 count:5];
    id v63 = +[JFXCustomRenderProperties newCustomRenderProperties:0 metadata:v62];

    [v123 setObject:v63 forKeyedSubscript:@"JFXCustomRenderingPropertiesKey_FaceTracking"];
    v129->_logged_render_request_failure_facetracking = 0;

LABEL_31:
    v64 = -[JFXFaceTrackingTransformCalculator initWithARMetaData:outputSize:playableInterfaceOrientation:]([JFXFaceTrackingTransformCalculator alloc], "initWithARMetaData:outputSize:playableInterfaceOrientation:", v127, v39, v31, v33);
    v61 = [(JFXFaceTrackingTransformCalculator *)v64 calculateFaceTrackingTransform];

    v53 = v121;
    goto LABEL_32;
  }
LABEL_42:
  v71 = -[JFXCapturePreviewRequestBuilder JFX_visibleEffects:](v129, "JFX_visibleEffects:", v17, v114);
  v72 = [JFXEffectsPreviewGenerationRequest alloc];
  v73 = [(JFXCapturePreviewRequestBuilder *)v129 previewProperties];
  [v73 renderOutputSize];
  double v75 = v74;
  double v77 = v76;
  v78 = [(JFXCapturePreviewRequestBuilder *)v129 previewProperties];
  [v78 frameSize];
  double v80 = v79;
  double v82 = v81;
  v83 = [(JFXCapturePreviewRequestBuilder *)v129 previewProperties];
  v84 = v83;
  if (v83) {
    [v83 renderTime];
  }
  else {
    memset(v143, 0, sizeof(v143));
  }
  v115 = -[JFXEffectsPreviewGenerationRequest initWithInput:effectStack:outputSize:frameSize:renderTime:](v72, "initWithInput:effectStack:outputSize:frameSize:renderTime:", v126, v71, v143, v75, v77, v80, v82);

  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id v85 = v128;
  uint64_t v86 = [v85 countByEnumeratingWithState:&v139 objects:v158 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v140;
    uint64_t v89 = *MEMORY[0x263F61728];
    do
    {
      for (uint64_t k = 0; k != v87; ++k)
      {
        if (*(void *)v140 != v88) {
          objc_enumerationMutation(v85);
        }
        v91 = *(void **)(*((void *)&v139 + 1) + 8 * k);
        v92 = objc_msgSend(v91, "parameterForKey:", v89, v115);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v91, "setRenderSize:", v31, v33);
          objc_msgSend(v91, "setPlayableAspectRatio:", aspectRatioForSize(v31, v33));
        }
        if ([v91 type] == 1)
        {
          v93 = [(JFXCapturePreviewRequestBuilder *)v129 outputColorSpace];
          int v94 = [v93 isHDRSpace];

          if (v94) {
            [v91 setHDR:1];
          }
        }
      }
      uint64_t v87 = [v85 countByEnumeratingWithState:&v139 objects:v158 count:16];
    }
    while (v87);
  }

  [(JFXEffectsPreviewGenerationRequest *)v115 setCustomRenderingProperties:v123];
  long long v95 = *(_OWORD *)&v125->c;
  v138[0] = *(_OWORD *)&v125->a;
  v138[1] = v95;
  v138[2] = *(_OWORD *)&v125->tx;
  [(JFXEffectsPreviewGenerationRequest *)v115 setUserSourceTransform:v138];
  [(JFXCapturePreviewRequestBuilder *)v129 requestTransformAnimation];
  v132[0] = v134;
  v132[1] = v135;
  v132[2] = v136;
  uint64_t v133 = v137;
  [(JFXEffectsPreviewGenerationRequest *)v115 setAnimationTransformInfo:v132];
  v96 = [(JFXCapturePreviewRequestBuilder *)v129 previewProperties];
  int v97 = [v96 renderRequiresCrop];

  if (v97)
  {
    v98 = [(JFXCapturePreviewRequestBuilder *)v129 previewProperties];
    [v98 frameSize];

    uint64_t v157 = 0;
    long long v156 = 0u;
    memset(buf, 0, sizeof(buf));
    PVTransformAnimationInfoForLiveCapture();
    v130[0] = *(_OWORD *)buf;
    v130[1] = *(_OWORD *)&buf[16];
    v130[2] = v156;
    uint64_t v131 = v157;
    [(JFXEffectsPreviewGenerationRequest *)v115 setTransformAnimationInfo:v130 scaleToOutput:0];
  }
  v99 = [[JFXEffectsPreviewRequestHandler alloc] initWithRequest:v115];
  v100 = [(JFXCapturePreviewRequestBuilder *)v129 outputColorSpace];
  v51 = [(JFXEffectsPreviewRequestHandler *)v99 buildPVRenderRequestWithOutputColorSpace:v100];

  v19 = v118;
  [v51 setUserContext:v118];
  id v15 = v119;
  id v16 = v122;
  id v17 = v128;
  if (a9) {
    *a9 = v99;
  }

LABEL_62:
  return v51;
}

- (id)JFX_getEffectsOfType:(id)a3 ofType:(int)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__JFXCapturePreviewRequestBuilder_JFX_getEffectsOfType_ofType___block_invoke;
  v9[3] = &unk_264C0AC20;
  int v11 = a4;
  id v7 = v6;
  id v10 = v7;
  [v5 enumerateObjectsUsingBlock:v9];

  return v7;
}

void __63__JFXCapturePreviewRequestBuilder_JFX_getEffectsOfType_ofType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == *(_DWORD *)(a1 + 40)) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)JFX_visibleEffects:(id)a3
{
  id v3 = (void *)MEMORY[0x263F08A98];
  id v4 = a3;
  id v5 = [v3 predicateWithBlock:&__block_literal_global_15];
  id v6 = [v4 filteredArrayUsingPredicate:v5];

  return v6;
}

uint64_t __54__JFXCapturePreviewRequestBuilder_JFX_visibleEffects___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHidden] ^ 1;
}

- (JFXCapturePreviewProperties)previewProperties
{
  return self->_previewProperties;
}

- (PVTransformAnimationInfo)requestTransformAnimation
{
  long long v3 = *(_OWORD *)&self[1].time.value;
  *(_OWORD *)&retstr->time.value = *(_OWORD *)&self->scale;
  *(_OWORD *)&retstr->time.epoch = v3;
  *(_OWORD *)&retstr->translation.y = *(_OWORD *)&self[1].time.epoch;
  retstr->rotation = self[1].translation.y;
  return self;
}

- (void)setRequestTransformAnimation:(PVTransformAnimationInfo *)a3
{
  long long v3 = *(_OWORD *)&a3->time.value;
  long long v4 = *(_OWORD *)&a3->time.epoch;
  long long v5 = *(_OWORD *)&a3->translation.y;
  self->_requestTransformAnimation.rotation = a3->rotation;
  *(_OWORD *)&self->_requestTransformAnimation.translation.y = v5;
  *(_OWORD *)&self->_requestTransformAnimation.time.epoch = v4;
  *(_OWORD *)&self->_requestTransformAnimation.time.value = v3;
}

- (PVColorSpace)outputColorSpace
{
  return self->_outputColorSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputColorSpace, 0);
  objc_storeStrong((id *)&self->_previewProperties, 0);
  objc_storeStrong((id *)&self->_selfieBGLoadQ, 0);
}

- (void)createPVRenderRequestUsingAnimojiRenderer:(void *)a1 metadataValidator:(NSObject *)a2 additionalTransform:effectStack:animojiTapPoint:animojiUsesInterfaceOrientation:requestHandler:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  long long v4 = NSStringFromJFXEffectType([a1 type]);
  long long v5 = [a1 displayName];
  int v6 = 138543618;
  id v7 = v4;
  __int16 v8 = 2114;
  BOOL v9 = v5;
  _os_log_error_impl(&dword_234C41000, a2, OS_LOG_TYPE_ERROR, "Unable to build render request with effect - type: %{public}@, name: %{public}@", (uint8_t *)&v6, 0x16u);
}

@end