@interface VNCoreSceneUnderstandingDetector
+ (BOOL)_getEntityNetTaxonomy:(void *)a3 forCSUSceneNetV5Configuration:(void *)a4 session:(uint64_t)a5 error:;
+ (BOOL)_getSceneNetV5ConfigurationRevision:(void *)a3 forConfigurationOptions:(void *)a4 error:;
+ (BOOL)handlesRequestClass:(Class)a3 revision:(unint64_t)a4;
+ (BOOL)producesObservationsForMultipleRequestClasses;
+ (id)_detectedObjectTaxonomyForCSUSceneNetV5Configuration:(void *)a3 session:(uint64_t)a4 error:;
+ (id)_globalOrProvidedSessionInOptions:(uint64_t)a3 error:;
+ (id)_identifiersSupportedByCustomClassifierConfiguration:(uint64_t)a3 error:;
+ (id)_newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:(id)a3;
+ (id)_sceneNetTaxonomyForCSUSceneNetV5Configuration:(void *)a3 session:(uint64_t)a4 error:;
+ (id)_specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:(id)a3;
+ (id)allCityNatureIdentifiersWithConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)allClassificationIdentifiersWithConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)allRecognizedObjectIdentifiersWithConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)allSignificantEventIdentifiersWithConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)allVN5kJNH3eYuyaLxNpZr5Z7ziIdentifiersWithConfigurationOptions:(id)a3 error:(id *)a4;
+ (id)computeStagesToBindForConfigurationOptions:(id)a3;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)keyForDetectorWithConfigurationOptions:(id)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4;
+ (uint64_t)_getCSUSceneNetV5Configuration:(void *)a3 junkLeafConfiguration:(void *)a4 junkHierarchicalConfiguration:(void *)a5 VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:(void *)a6 significantEventConfiguration:(void *)a7 cityNatureConfiguration:(void *)a8 forConfigurationOptions:(void *)a9 error:;
+ (uint64_t)_sceneNetV5ConfigurationRevisionForRequestClass:(unint64_t)a3 revision:;
+ (uint64_t)_sceneNetV5ConfigurationRevisionForRequestSpecifier:(uint64_t)a1;
+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3;
- (BOOL)_runSceneNetCustomClassifiers:(void *)a1 onSceneprintBuffer:(void *)a2 forConfigurations:(void *)a3 collectedObservations:(void *)a4 error:(void *)a5;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (BOOL)needsMetalContext;
- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5;
- (id)_CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN:(uint64_t)a1 observations:(void *)a2 minimumConfidence:(void *)a3 disallowedList:(void *)a4 taxonomy:(void *)a5 originatingRequestSpecifier:(float)a6;
- (id)_entityNetTaxonomyForSession:(uint64_t)a3 error:;
- (id)_processSaliencyConfiguration:(uint64_t)a3 fromSaliencyMapProvidedBySelector:(void *)a4 ofSceneNetOutput:(void *)a5 regionOfInterest:(uint64_t)a6 options:(void *)a7 qosClass:(uint64_t)a8 saliencyGeneratorType:(double)a9 error:(double)a10;
- (id)_processSceneNetOutput:(void *)a3 regionOfInterest:(unsigned int)a4 options:(void *)a5 qosClass:(double)a6 error:(double)a7;
- (id)_sceneNetTaxonomyForSession:(uint64_t)a3 error:;
- (id)description;
- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (int64_t)sceneNetConfigurationRevision;
- (uint64_t)_processJunkConfigurations:(void *)a3 VN5kJNH3eYuyaLxNpZr5Z7ziConfigurations:(void *)a4 significantEventConfigurations:(void *)a5 cityNatureConfigurations:(void *)a6 forSceneNetOutput:(void *)a7 collectedObservations:(void *)a8 error:;
- (uint64_t)_warmUpTaxonomiesForOptions:(void *)a3 inSession:(uint64_t)a4 error:;
@end

@implementation VNCoreSceneUnderstandingDetector

+ (BOOL)handlesRequestClass:(Class)a3 revision:(unint64_t)a4
{
  return +[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]((uint64_t)a1, a3, a4) != 0;
}

+ (uint64_t)_sceneNetV5ConfigurationRevisionForRequestClass:(unint64_t)a3 revision:
{
  self;
  if (+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::onceToken != -1) {
    dispatch_once(&+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::onceToken, &__block_literal_global_26723);
  }
  uint64_t v5 = +[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap;
  v6 = VNRequestClassFromClientSubclass(a2);
  v9 = *(void **)(v5 + 8);
  v8 = (void *)(v5 + 8);
  v7 = v9;
  if (!v9) {
    goto LABEL_20;
  }
  v10 = v8;
  do
  {
    v11 = (void *)v7[4];
    if (v6 == v11) {
      BOOL v12 = v7[5] < a3;
    }
    else {
      BOOL v12 = v11 < v6;
    }
    BOOL v13 = !v12;
    if (v12) {
      v14 = v7 + 1;
    }
    else {
      v14 = v7;
    }
    if (v13) {
      v10 = v7;
    }
    v7 = (void *)*v14;
  }
  while (*v14);
  if (v10 == v8 || ((v15 = (void *)v10[4], v15 != v6) ? (BOOL v16 = v6 < v15) : (BOOL v16 = v10[5] > a3), v16)) {
LABEL_20:
  }
    v10 = v8;

  if ((void *)(+[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:]::ourModelMap
                + 8) == v10)
    return 0;
  else {
    return v10[6];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cityNatureClassifier, 0);
  objc_storeStrong((id *)&self->_significantEventClassifier, 0);
  objc_storeStrong((id *)&self->_VN5kJNH3eYuyaLxNpZr5Z7ziCLassifier, 0);
  objc_storeStrong((id *)&self->_junkHierarchicalClassifier, 0);
  objc_storeStrong((id *)&self->_junkLeafClassifier, 0);
  objc_storeStrong((id *)&self->_inputImageTilingOptions, 0);
  objc_storeStrong((id *)&self->_cachedDetectedObjectsTaxonomy_DO_NOT_DIRECTLY_ACCESS, 0);
  objc_storeStrong((id *)&self->_cachedEntityNetTaxonomy_DO_NOT_DIRECTLY_ACCESS, 0);
  objc_storeStrong((id *)&self->_cachedSceneTaxonomy_DO_NOT_DIRECTLY_ACCESS, 0);

  objc_storeStrong((id *)&self->_sceneNet, 0);
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v17 = a5;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__39_26522;
  v43 = __Block_byref_object_dispose__40_26523;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__39_26522;
  v37 = __Block_byref_object_dispose__40_26523;
  id v38 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __134__VNCoreSceneUnderstandingDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke;
  aBlock[3] = &unk_1E5B1EA70;
  v26 = &v33;
  v27 = &v39;
  aBlock[4] = self;
  CGFloat v28 = x;
  CGFloat v29 = y;
  CGFloat v30 = width;
  CGFloat v31 = height;
  id v18 = v17;
  id v25 = v18;
  unsigned int v32 = a6;
  v19 = _Block_copy(aBlock);
  v20 = (void *)MEMORY[0x1A6257080]();
  [(CSUSceneNetV5 *)self->_sceneNet runOnInputImage:a4 completion:v19];
  v21 = (void *)v40[5];
  if (v21)
  {
    id v22 = v21;
  }
  else if (a8)
  {
    *a8 = (id) v34[5];
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v21;
}

void __134__VNCoreSceneUnderstandingDetector_processRegionOfInterest_croppedPixelBuffer_options_qosClass_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    double v7 = *(double *)(a1 + 64);
    double v8 = *(double *)(a1 + 72);
    double v9 = *(double *)(a1 + 80);
    double v10 = *(double *)(a1 + 88);
    v11 = *(id **)(a1 + 32);
    BOOL v12 = *(void **)(a1 + 40);
    unsigned int v13 = *(_DWORD *)(a1 + 96);
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v14 + 40);
    uint64_t v15 = -[VNCoreSceneUnderstandingDetector _processSceneNetOutput:regionOfInterest:options:qosClass:error:](v11, v5, v12, v13, &obj, v7, v8, v9, v10);
    objc_storeStrong((id *)(v14 + 40), obj);
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    id v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
}

- (id)_processSceneNetOutput:(void *)a3 regionOfInterest:(unsigned int)a4 options:(void *)a5 qosClass:(double)a6 error:(double)a7
{
  uint64_t v331 = *MEMORY[0x1E4F143B8];
  id v281 = a2;
  id v12 = a3;
  v279 = a1;
  v260 = v12;
  if (!a1)
  {
    id v159 = 0;
    goto LABEL_162;
  }
  v282 = a5;
  v267 = +[VNValidationUtilities requiredSessionInOptions:v12 error:a5];
  if (!v267)
  {
    id v159 = 0;
    goto LABEL_161;
  }
  id v280 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unsigned int v13 = [v260 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorInternalProcessingOption_Tiling"];

  if (v13) {
    goto LABEL_4;
  }
  long long v313 = 0u;
  long long v314 = 0u;
  long long v311 = 0u;
  long long v312 = 0u;
  id v240 = [v260 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"];
  uint64_t v160 = [v240 countByEnumeratingWithState:&v311 objects:v322 count:16];
  if (v160)
  {
    id objd = *(id *)v312;
    v161 = &selRef_setSmartThreshold_;
    do
    {
      uint64_t v258 = v160;
      uint64_t v162 = 0;
      v271 = v161[442];
      do
      {
        if (*(id *)v312 != objd) {
          objc_enumerationMutation(v240);
        }
        id v163 = *(id *)(*((void *)&v311 + 1) + 8 * v162);
        id v164 = v281;
        id v165 = v267;
        v166 = [v164 VNRequiredBufferFromSelector:v271 error:v282];
        if (v166)
        {
          v167 = -[VNCoreSceneUnderstandingDetector _sceneNetTaxonomyForSession:error:]((uint64_t)v279, v165, (uint64_t)v282);
          if (v167)
          {
            id v248 = [v163 observationsRecipient];
            v253 = [v248 originatingRequestSpecifier];
            [v163 minimumConfidence];
            float v169 = v168;
            v170 = [v163 disallowedList];
            v244 = v170;
            id v277 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v171 = -[VNCoreSceneUnderstandingDetector _CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN:observations:minimumConfidence:disallowedList:taxonomy:originatingRequestSpecifier:]([v163 maximumHierarchicalClassifications], v277, v170, v167, v253, v169);
            if ([v279[7] enumerateHierarchicalSceneClassificationLikelihoods:v166 usingBlock:v171 error:v282])
            {
              id v172 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              uint64_t v173 = -[VNCoreSceneUnderstandingDetector _CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN:observations:minimumConfidence:disallowedList:taxonomy:originatingRequestSpecifier:]([v163 maximumLeafClassifications], v172, v170, v167, v253, v169);

              if ([v279[7] enumerateLeafSceneClassificationLikelihoods:v166 usingBlock:v173 error:v282])
              {
                [v172 addObjectsFromArray:v277];
                id v174 = &__block_literal_global_128_38097;
                [v172 sortWithOptions:16 usingComparator:&__block_literal_global_128_38097];

                [v248 receiveObservations:v172];
                id v175 = v172;
              }
              else
              {
                id v175 = 0;
              }

              v171 = (void *)v173;
            }
            else
            {
              id v175 = 0;
            }
          }
          else
          {
            id v175 = 0;
          }
        }
        else
        {
          id v175 = 0;
        }

        if (!v175)
        {

          goto LABEL_159;
        }
        [v280 addObjectsFromArray:v175];

        ++v162;
      }
      while (v258 != v162);
      uint64_t v160 = [v240 countByEnumeratingWithState:&v311 objects:v322 count:16];
      v161 = &selRef_setSmartThreshold_;
    }
    while (v160);
  }

  long long v309 = 0u;
  long long v310 = 0u;
  long long v307 = 0u;
  long long v308 = 0u;
  v176 = [v260 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"];
  id v249 = v176;
  uint64_t v177 = [v176 countByEnumeratingWithState:&v307 objects:v321 count:16];
  if (!v177) {
    goto LABEL_151;
  }
  id obje = *(id *)v308;
  while (2)
  {
    uint64_t v259 = v177;
    for (uint64_t i = 0; i != v259; ++i)
    {
      if (*(id *)v308 != obje) {
        objc_enumerationMutation(v176);
      }
      id v179 = *(id *)(*((void *)&v307 + 1) + 8 * i);
      id v278 = v281;
      id v272 = v267;
      v180 = [v179 observationsRecipient];
      id v181 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v182 = [v278 entityNetClassificationLikelihoods];
      if (!v182) {
        goto LABEL_145;
      }
      v183 = -[VNCoreSceneUnderstandingDetector _entityNetTaxonomyForSession:error:]((uint64_t)v279, v272, (uint64_t)v282);
      if (v183)
      {
        v254 = [v180 originatingRequestSpecifier];
        uint64_t v184 = [v179 maximumClassifications];
        [v179 minimumConfidence];
        float v186 = v185;
        v187 = [v179 disallowedList];
        v188 = -[VNCoreSceneUnderstandingDetector _CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN:observations:minimumConfidence:disallowedList:taxonomy:originatingRequestSpecifier:](v184, v181, v187, v183, v254, v186);

        v176 = v249;
        if ([v279[7] enumerateEntityNetClassificationLikelihoods:v182 usingBlock:v188 error:v282])
        {
          id v189 = &__block_literal_global_128_38097;
          [v181 sortWithOptions:16 usingComparator:&__block_literal_global_128_38097];

LABEL_145:
          [v180 receiveObservations:v181];
          id v190 = v181;
          goto LABEL_148;
        }
      }
      id v190 = 0;
LABEL_148:

      if (!v190)
      {

        goto LABEL_159;
      }
      [v280 addObjectsFromArray:v190];
    }
    uint64_t v177 = [v176 countByEnumeratingWithState:&v307 objects:v321 count:16];
    if (v177) {
      continue;
    }
    break;
  }
LABEL_151:

LABEL_4:
  long long v305 = 0u;
  long long v306 = 0u;
  long long v303 = 0u;
  long long v304 = 0u;
  id obj = [v260 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_SceneprintConfigurations"];
  uint64_t v14 = [obj countByEnumeratingWithState:&v303 objects:v320 count:16];
  if (v14)
  {
    uint64_t v268 = *(void *)v304;
    uint64_t v15 = &selRef_nmsThreshold;
    while (2)
    {
      uint64_t v16 = 0;
      v273 = v15[492];
      do
      {
        if (*(void *)v304 != v268) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(id *)(*((void *)&v303 + 1) + 8 * v16);
        id v18 = v281;
        v19 = [v18 VNRequiredBufferFromSelector:v273 error:v282];
        if (v19)
        {
          v20 = [v17 observationsRecipient];
          v21 = [v20 originatingRequestSpecifier];
          id v22 = +[VNEspressoModelImageprint printFromCSUBuffer:v19 originatingRequestSpecifier:v21 error:v282];
          if (v22)
          {
            v23 = [VNSceneObservation alloc];
            v326[0] = v22;
            v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v326 count:1];
            id v25 = [(VNSceneObservation *)v23 initWithOriginatingRequestSpecifier:v21 sceneprints:v24];

            *(void *)&long long v327 = v25;
            v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v327 count:1];
            [v20 receiveObservations:v26];
          }
          else
          {
            v26 = 0;
          }
        }
        else
        {
          v26 = 0;
        }

        if (!v26)
        {

          goto LABEL_159;
        }
        [v280 addObjectsFromArray:v26];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [obj countByEnumeratingWithState:&v303 objects:v320 count:16];
      uint64_t v15 = &selRef_nmsThreshold;
      if (v14) {
        continue;
      }
      break;
    }
  }

  long long v301 = 0u;
  long long v302 = 0u;
  long long v299 = 0u;
  long long v300 = 0u;
  id v193 = [v260 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageAestheticsConfigurations"];
  uint64_t v27 = [v193 countByEnumeratingWithState:&v299 objects:v319 count:16];
  if (v27)
  {
    CGFloat v28 = &selRef_setSmartThreshold_;
    CGFloat v29 = &selRef_setSmartThreshold_;
    id v237 = *(id *)v300;
    while (2)
    {
      uint64_t v235 = v27;
      uint64_t v30 = 0;
      v241 = v28[443];
      v194 = v29[444];
      do
      {
        if (*(id *)v300 != v237) {
          objc_enumerationMutation(v193);
        }
        id v269 = *(id *)(*((void *)&v299 + 1) + 8 * v30);
        id v274 = v281;
        uint64_t v31 = [v274 VNRequiredBufferFromSelector:v241 error:v282];
        id obja = (id)v31;
        if (v31)
        {
          unsigned int v32 = [v279[7] allAestheticsAttributeScores:v31];
          uint64_t v33 = [v274 VNRequiredBufferFromSelector:v194 error:v282];
          v255 = (void *)v33;
          if (v33)
          {
            v250 = [v279[7] allAestheticsGlobalScores:v33];
            v233 = [v269 observationsRecipient];
            id v245 = [v233 originatingRequestSpecifier];
            v213 = [v250 objectForKeyedSubscript:@"aesthetic_score"];
            [v213 floatValue];
            int v222 = v34;
            v211 = [v32 objectForKeyedSubscript:@"subject_framing"];
            [v211 floatValue];
            int v221 = v35;
            v210 = [v32 objectForKeyedSubscript:@"background"];
            [v210 floatValue];
            int v220 = v36;
            v208 = [v32 objectForKeyedSubscript:@"blur"];
            [v208 floatValue];
            int v219 = v37;
            v207 = [v32 objectForKeyedSubscript:@"subject_sharpness"];
            [v207 floatValue];
            int v218 = v38;
            v205 = [v32 objectForKeyedSubscript:@"timing"];
            [v205 floatValue];
            int v217 = v39;
            v204 = [v32 objectForKeyedSubscript:@"lightning"];
            [v204 floatValue];
            int v216 = v40;
            v202 = [v32 objectForKeyedSubscript:@"reflections"];
            [v202 floatValue];
            int v215 = v41;
            v201 = [v32 objectForKeyedSubscript:@"color_harmony"];
            [v201 floatValue];
            unsigned int v214 = v42;
            v200 = [v32 objectForKeyedSubscript:@"color_brightness"];
            [v200 floatValue];
            unsigned int v212 = v43;
            v199 = [v32 objectForKeyedSubscript:@"symmetry"];
            [v199 floatValue];
            unsigned int v209 = v44;
            v198 = [v32 objectForKeyedSubscript:@"repetition"];
            [v198 floatValue];
            unsigned int v206 = v45;
            v197 = [v32 objectForKeyedSubscript:@"immersive_feeling"];
            [v197 floatValue];
            unsigned int v203 = v46;
            v196 = [v32 objectForKeyedSubscript:@"perspective"];
            [v196 floatValue];
            unsigned int v48 = v47;
            v195 = [v32 objectForKeyedSubscript:@"post_processing"];
            [v195 floatValue];
            unsigned int v50 = v49;
            v51 = [v32 objectForKeyedSubscript:@"noise"];
            [v51 floatValue];
            unsigned int v53 = v52;
            v54 = [v32 objectForKeyedSubscript:@"failure"];
            [v54 floatValue];
            unsigned int v56 = v55;
            v57 = [v32 objectForKeyedSubscript:@"composition"];
            [v57 floatValue];
            unsigned int v59 = v58;
            v60 = [v32 objectForKeyedSubscript:@"interestingness"];
            [v60 floatValue];
            unsigned int v62 = v61;
            v63 = [v32 objectForKeyedSubscript:@"object_intrusion"];
            [v63 floatValue];
            unsigned int v65 = v64;
            v66 = [v32 objectForKeyedSubscript:@"tilt"];
            [v66 floatValue];
            unsigned int v68 = v67;
            v69 = [v32 objectForKeyedSubscript:@"low_light"];
            [v69 floatValue];
            unint64_t v192 = __PAIR64__(v70, v68);
            LODWORD(v71) = v215;
            LODWORD(v73) = v221;
            LODWORD(v72) = v222;
            LODWORD(v75) = v219;
            LODWORD(v74) = v220;
            LODWORD(v77) = v217;
            LODWORD(v76) = v218;
            LODWORD(v78) = v216;
            +[VNImageAestheticsObservation observationForOriginatingRequestSpecifier:overallAestheticScore:wellFramedSubjectScore:wellChosenBackgroundScore:tastefullyBlurredScore:sharplyFocusedSubjectScore:wellTimedShotScore:pleasantLightingScore:pleasantReflectionsScore:harmoniousColorScore:livelyColorScore:pleasantSymmetryScore:pleasantPatternScore:immersivenessScore:pleasantPerspectiveScore:pleasantPostProcessingScore:noiseScore:failureScore:pleasantCompositionScore:interestingSubjectScore:intrusiveObjectPresenceScore:pleasantCameraTiltScore:lowKeyLightingScore:error:](VNImageAestheticsObservation, "observationForOriginatingRequestSpecifier:overallAestheticScore:wellFramedSubjectScore:wellChosenBackgroundScore:tastefullyBlurredScore:sharplyFocusedSubjectScore:wellTimedShotScore:pleasantLightingScore:pleasantReflectionsScore:harmoniousColorScore:livelyColorScore:pleasantSymmetryScore:pleasantPatternScore:immersivenessScore:pleasantPerspectiveScore:pleasantPostProcessingScore:noiseScore:failureScore:pleasantCompositionScore:interestingSubjectScore:intrusiveObjectPresenceScore:pleasantCameraTiltScore:lowKeyLightingScore:error:", v245, v282, v72, v73, v74, v75, v76, v77, v78, v71, __PAIR64__(v212, v214), __PAIR64__(v206, v209), __PAIR64__(v48, v203),
              __PAIR64__(v53, v50),
              __PAIR64__(v59, v56),
              __PAIR64__(v65, v62),
            v79 = v192);

            if (v79)
            {
              v326[0] = v79;
              v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v326 count:1];
              [v233 receiveObservations:v80];
            }
            else
            {
              v80 = 0;
            }
          }
          else
          {
            v80 = 0;
          }
        }
        else
        {
          v80 = 0;
        }

        if (!v80)
        {

          goto LABEL_159;
        }
        [v280 addObjectsFromArray:v80];

        ++v30;
      }
      while (v235 != v30);
      uint64_t v27 = [v193 countByEnumeratingWithState:&v299 objects:v319 count:16];
      CGFloat v28 = &selRef_setSmartThreshold_;
      CGFloat v29 = &selRef_setSmartThreshold_;
      if (v27) {
        continue;
      }
      break;
    }
  }

  long long v297 = 0u;
  long long v298 = 0u;
  long long v295 = 0u;
  long long v296 = 0u;
  v81 = [v260 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyAConfigurations"];
  uint64_t v82 = [v81 countByEnumeratingWithState:&v295 objects:v318 count:16];
  if (v82)
  {
    uint64_t v83 = *(void *)v296;
    v84 = &selRef_setSmartThreshold_;
    while (2)
    {
      uint64_t v85 = 0;
      uint64_t v86 = (uint64_t)v84[445];
      do
      {
        if (*(void *)v296 != v83) {
          objc_enumerationMutation(v81);
        }
        id v87 = *(id *)(*((void *)&v295 + 1) + 8 * v85);
        id v88 = v281;
        id v89 = v260;
        v90 = [(VNCoreSceneUnderstandingDetector *)v279 _processSaliencyConfiguration:v86, v88, v89, a4, @"VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType", (uint64_t)v282, a6, a7, a8, a9 fromSaliencyMapProvidedBySelector ofSceneNetOutput regionOfInterest options qosClass saliencyGeneratorType error];

        if (!v90)
        {

          goto LABEL_159;
        }
        [v280 addObjectsFromArray:v90];

        ++v85;
      }
      while (v82 != v85);
      uint64_t v82 = [v81 countByEnumeratingWithState:&v295 objects:v318 count:16];
      v84 = &selRef_setSmartThreshold_;
      if (v82) {
        continue;
      }
      break;
    }
  }

  long long v293 = 0u;
  long long v294 = 0u;
  long long v291 = 0u;
  long long v292 = 0u;
  v91 = [v260 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyOConfigurations"];
  uint64_t v92 = [v91 countByEnumeratingWithState:&v291 objects:v317 count:16];
  if (v92)
  {
    uint64_t v93 = *(void *)v292;
    v94 = &selRef_setSmartThreshold_;
    while (2)
    {
      uint64_t v95 = 0;
      uint64_t v96 = (uint64_t)v94[446];
      do
      {
        if (*(void *)v292 != v93) {
          objc_enumerationMutation(v91);
        }
        id v97 = *(id *)(*((void *)&v291 + 1) + 8 * v95);
        id v98 = v281;
        id v99 = v260;
        v100 = [(VNCoreSceneUnderstandingDetector *)v279 _processSaliencyConfiguration:v96, v98, v99, a4, @"VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType", (uint64_t)v282, a6, a7, a8, a9 fromSaliencyMapProvidedBySelector ofSceneNetOutput regionOfInterest options qosClass saliencyGeneratorType error];

        if (!v100)
        {

          goto LABEL_159;
        }
        [v280 addObjectsFromArray:v100];

        ++v95;
      }
      while (v92 != v95);
      uint64_t v92 = [v91 countByEnumeratingWithState:&v291 objects:v317 count:16];
      v94 = &selRef_setSmartThreshold_;
      if (v92) {
        continue;
      }
      break;
    }
  }

  long long v289 = 0u;
  long long v290 = 0u;
  long long v287 = 0u;
  long long v288 = 0u;
  id v224 = [v260 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations"];
  id v238 = (id)[v224 countByEnumeratingWithState:&v287 objects:v316 count:16];
  if (v238)
  {
    uint64_t v236 = *(void *)v288;
    v101 = &selRef_setSmartThreshold_;
    v102 = &selRef_setSmartThreshold_;
    while (2)
    {
      v275 = 0;
      v242 = v101[447];
      v226 = v102[448];
      do
      {
        if (*(void *)v288 != v236) {
          objc_enumerationMutation(v224);
        }
        id v103 = *(id *)(*((void *)&v287 + 1) + 8 * (void)v275);
        id v104 = v281;
        v256 = v104;
        id objb = [v104 VNRequiredBufferFromSelector:v242 error:v282];
        if (objb)
        {
          v105 = [v104 VNRequiredBufferFromSelector:v226 error:v282];
          if (v105)
          {
            id v246 = v105;
            id v251 = objc_alloc_init(MEMORY[0x1E4F5D080]);
            [v103 minimumDetectionConfidence];
            objc_msgSend(v251, "setDetectionForegroundThreshold:");
            [v103 nonMaximumSuppressionThreshold];
            objc_msgSend(v251, "setNmsThresholdDetection:");
            v106 = [v103 targetedIdentifiers];
            [v251 setRelevantClassNames:v106];

            v107 = [v279[7] detectionResultFromScoreHeatMap:objb coordinateOffsetMap:v246 options:v251 error:v282];
            if (v107)
            {
              v234 = v107;
              v228 = [v103 observationsRecipient];
              v108 = [v228 originatingRequestSpecifier];
              v109 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v107, "count"));
              aBlock[0] = MEMORY[0x1E4F143A8];
              aBlock[1] = 3221225472;
              aBlock[2] = __96__VNCoreSceneUnderstandingDetector__processRecognizedObjectsConfiguration_sceneNetOutput_error___block_invoke;
              aBlock[3] = &unk_1E5B1E8F0;
              id v232 = v108;
              id v324 = v232;
              id v230 = v109;
              id v325 = v230;
              v110 = (void (**)(void *, void *))_Block_copy(aBlock);
              v111 = [v103 disallowedList];
              [v103 minimumDetectionConfidence];
              float v113 = v112;
              v114 = [(id)objc_opt_class() _specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:v232];
              long long v329 = 0u;
              long long v330 = 0u;
              long long v327 = 0u;
              long long v328 = 0u;
              id v115 = v107;
              uint64_t v116 = [v115 countByEnumeratingWithState:&v327 objects:v326 count:16];
              if (v116)
              {
                uint64_t v117 = *(void *)v328;
                do
                {
                  for (uint64_t j = 0; j != v116; ++j)
                  {
                    if (*(void *)v328 != v117) {
                      objc_enumerationMutation(v115);
                    }
                    v119 = *(void **)(*((void *)&v327 + 1) + 8 * j);
                    [v119 score];
                    float v121 = v120;
                    if (v120 >= v113)
                    {
                      v122 = [v119 label];
                      if (([v111 containsIdentifier:v122] & 1) == 0)
                      {
                        [v119 box];
                        v333.origin.double y = 1.0 - v123 - v333.size.height;
                        v335.origin.double x = 0.0;
                        v335.origin.double y = 0.0;
                        v335.size.double width = 1.0;
                        v335.size.double height = 1.0;
                        CGRect v334 = CGRectIntersection(v333, v335);
                        double x = v334.origin.x;
                        double y = v334.origin.y;
                        double width = v334.size.width;
                        double height = v334.size.height;
                        v110[2](v110, v122);
                        v128 = [v114 objectForKeyedSubscript:v122];
                        if (v128) {
                          ((void (*)(void (**)(void *, void *), void *, double, double, double, double, float))v110[2])(v110, v128, x, y, width, height, v121);
                        }
                      }
                    }
                  }
                  uint64_t v116 = [v115 countByEnumeratingWithState:&v327 objects:v326 count:16];
                }
                while (v116);
              }

              id v129 = &__block_literal_global_133;
              [v230 sortWithOptions:16 usingComparator:&__block_literal_global_133];

              [v228 receiveObservations:v230];
              id v130 = v230;

              v107 = v234;
            }
            else
            {
              id v130 = 0;
            }

            v105 = v246;
          }
          else
          {
            id v130 = 0;
          }
        }
        else
        {
          id v130 = 0;
        }

        if (!v130)
        {

          goto LABEL_159;
        }
        [v280 addObjectsFromArray:v130];

        v275 = (char *)v275 + 1;
      }
      while (v275 != v238);
      id v238 = (id)[v224 countByEnumeratingWithState:&v287 objects:v316 count:16];
      v101 = &selRef_setSmartThreshold_;
      v102 = &selRef_setSmartThreshold_;
      if (v238) {
        continue;
      }
      break;
    }
  }

  long long v285 = 0u;
  long long v286 = 0u;
  long long v283 = 0u;
  long long v284 = 0u;
  id v239 = [v260 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageFingerprintsConfigurations"];
  id v247 = (id)[v239 countByEnumeratingWithState:&v283 objects:v315 count:16];
  if (v247)
  {
    uint64_t v243 = *(void *)v284;
    v131 = &selRef_setSmartThreshold_;
    while (2)
    {
      v276 = 0;
      v252 = v131[449];
      do
      {
        if (*(void *)v284 != v243) {
          objc_enumerationMutation(v239);
        }
        id v270 = *(id *)(*((void *)&v283 + 1) + 8 * (void)v276);
        id objc = v281;
        v132 = [objc VNRequiredBufferFromSelector:v252 error:v282];
        if (v132)
        {
          v257 = v132;
          v133 = [v279[7] hashesFromFingerprintEmbedding:v132];
          id v134 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v329 = 0u;
          long long v330 = 0u;
          long long v327 = 0u;
          long long v328 = 0u;
          id v135 = v133;
          uint64_t v136 = [v135 countByEnumeratingWithState:&v327 objects:v326 count:16];
          if (v136)
          {
            uint64_t v137 = *(void *)v328;
            do
            {
              for (uint64_t k = 0; k != v136; ++k)
              {
                if (*(void *)v328 != v137) {
                  objc_enumerationMutation(v135);
                }
                id v139 = *(id *)(*((void *)&v327 + 1) + 8 * k);
                v140 = (const void *)[v139 bytes];
                uint64_t v141 = [v139 length];
                uint64_t v142 = v141;
                if ((unint64_t)v141 >= 4)
                {
                  if (v141 < 0) {
                    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                  }
                  size_t v146 = v141 >> 2;
                  v143 = std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v141 >> 2);
                  size_t v145 = v142 & 0xFFFFFFFFFFFFFFFCLL;
                  memmove(v143, v140, v145);
                  if (v145)
                  {
                    if ((v145 & 0x8000000000000000) != 0) {
                      std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
                    }
                    v147 = operator new(v146);
                    v144 = v147;
                    uint64_t v148 = 0;
                    do
                    {
                      *((unsigned char *)v147 + v148) = (int)*((float *)v143 + v148);
                      ++v148;
                      v145 -= 4;
                    }
                    while (v145);
                    size_t v145 = (size_t)v147 + v148;
                  }
                  else
                  {
                    v144 = 0;
                  }
                }
                else
                {
                  v143 = 0;
                  v144 = 0;
                  size_t v145 = 0;
                }
                v149 = [[VNFingerprintHash alloc] initWithBooleanBytes:v144 length:v145 - (void)v144];
                [v134 addObject:v149];

                if (v144) {
                  operator delete(v144);
                }
                if (v143) {
                  operator delete(v143);
                }
              }
              uint64_t v136 = [v135 countByEnumeratingWithState:&v327 objects:v326 count:16];
            }
            while (v136);
          }

          v150 = [v270 observationsRecipient];
          v151 = [v150 originatingRequestSpecifier];
          v152 = [[VNImageFingerprintsObservation alloc] initWithOriginatingRequestSpecifier:v151 fingerprintHashes:v134];
          aBlock[0] = v152;
          v153 = [MEMORY[0x1E4F1C978] arrayWithObjects:aBlock count:1];
          [v150 receiveObservations:v153];

          v132 = v257;
        }
        else
        {
          v153 = 0;
        }

        if (!v153)
        {

          goto LABEL_159;
        }
        [v280 addObjectsFromArray:v153];

        v276 = (char *)v276 + 1;
      }
      while (v276 != v247);
      id v247 = (id)[v239 countByEnumeratingWithState:&v283 objects:v315 count:16];
      v131 = &selRef_setSmartThreshold_;
      if (v247) {
        continue;
      }
      break;
    }
  }

  v154 = [v260 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_JunkConfigurations"];
  v155 = [v260 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_5kJNH3eYuyaLxNpZr5Z7ziConfigurations"];
  v156 = [v260 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_SignificantEventConfigurations"];
  v157 = [v260 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_CityNatureGatingConfigurations"];
  char v158 = -[VNCoreSceneUnderstandingDetector _processJunkConfigurations:VN5kJNH3eYuyaLxNpZr5Z7ziConfigurations:significantEventConfigurations:cityNatureConfigurations:forSceneNetOutput:collectedObservations:error:](v279, v154, v155, v156, v157, v281, v280, v282);

  if (v158)
  {
    id v159 = v280;
    goto LABEL_160;
  }
LABEL_159:
  id v159 = 0;
LABEL_160:

LABEL_161:
LABEL_162:

  return v159;
}

- (uint64_t)_processJunkConfigurations:(void *)a3 VN5kJNH3eYuyaLxNpZr5Z7ziConfigurations:(void *)a4 significantEventConfigurations:(void *)a5 cityNatureConfigurations:(void *)a6 forSceneNetOutput:(void *)a7 collectedObservations:(void *)a8 error:
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v16 = a3;
  id v32 = a4;
  id v31 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = [v17 scenePrint];
  if ([v15 count])
  {
    uint64_t v20 = a1[17];
    v36[0] = a1[16];
    v36[1] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:2];
    BOOL v22 = -[VNCoreSceneUnderstandingDetector _runSceneNetCustomClassifiers:onSceneprintBuffer:forConfigurations:collectedObservations:error:](v21, v19, v15, v18, a8);

    if (!v22) {
      goto LABEL_10;
    }
  }
  if (objc_msgSend(v16, "count", v31))
  {
    uint64_t v35 = a1[18];
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    BOOL v24 = -[VNCoreSceneUnderstandingDetector _runSceneNetCustomClassifiers:onSceneprintBuffer:forConfigurations:collectedObservations:error:](v23, v19, v16, v18, a8);

    if (!v24) {
      goto LABEL_10;
    }
  }
  if ([v32 count])
  {
    uint64_t v34 = a1[19];
    id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
    BOOL v26 = -[VNCoreSceneUnderstandingDetector _runSceneNetCustomClassifiers:onSceneprintBuffer:forConfigurations:collectedObservations:error:](v25, v19, v32, v18, a8);

    if (!v26) {
      goto LABEL_10;
    }
  }
  if ([v31 count]
    && (uint64_t v33 = a1[20],
        [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1],
        uint64_t v27 = objc_claimAutoreleasedReturnValue(),
        BOOL v28 = -[VNCoreSceneUnderstandingDetector _runSceneNetCustomClassifiers:onSceneprintBuffer:forConfigurations:collectedObservations:error:](v27, v19, v31, v18, a8), v27, !v28))
  {
LABEL_10:
    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v29 = 1;
  }

  return v29;
}

- (BOOL)_runSceneNetCustomClassifiers:(void *)a1 onSceneprintBuffer:(void *)a2 forConfigurations:(void *)a3 collectedObservations:(void *)a4 error:(void *)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a1;
  id v29 = a2;
  id v30 = a3;
  id v9 = a4;
  double v10 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v11 = v8;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v47 objects:v52 count:16];
  BOOL v28 = v11;
  if (v12)
  {
    uint64_t v27 = *(void *)v48;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v48 != v27) {
          objc_enumerationMutation(v11);
        }
        uint64_t v14 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v41 = 0;
        unsigned int v42 = &v41;
        uint64_t v43 = 0x3032000000;
        unsigned int v44 = __Block_byref_object_copy__39_26522;
        unsigned int v45 = __Block_byref_object_dispose__40_26523;
        id v46 = 0;
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __131__VNCoreSceneUnderstandingDetector__runSceneNetCustomClassifiers_onSceneprintBuffer_forConfigurations_collectedObservations_error___block_invoke;
        aBlock[3] = &unk_1E5B1E940;
        int v40 = &v41;
        id v37 = v30;
        int v38 = v14;
        id v39 = v10;
        id v15 = _Block_copy(aBlock);
        [v14 runOnInputScenePrint:v29 completion:v15];
        id v16 = (void *)v42[5];
        if (v16 && a5) {
          *a5 = v16;
        }
        BOOL v17 = v16 == 0;

        _Block_object_dispose(&v41, 8);
        if (!v17)
        {
          id v18 = v28;
          goto LABEL_21;
        }
        id v11 = v28;
      }
      uint64_t v12 = [v28 countByEnumeratingWithState:&v47 objects:v52 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v18 = v30;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v51 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v33 != v20) {
          objc_enumerationMutation(v18);
        }
        BOOL v22 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        v23 = [v10 objectForKey:v22];
        id v24 = &__block_literal_global_128_38097;
        [v23 sortWithOptions:16 usingComparator:&__block_literal_global_128_38097];

        id v25 = [v22 observationsRecipient];
        [v25 receiveObservations:v23];
        [v9 addObjectsFromArray:v23];
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v51 count:16];
    }
    while (v19);
  }
  BOOL v17 = 1;
LABEL_21:

  return v17;
}

void __131__VNCoreSceneUnderstandingDetector__runSceneNetCustomClassifiers_onSceneprintBuffer_forConfigurations_collectedObservations_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v20 = a3;
  v21 = v5;
  if (v20)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  else
  {
    id v24 = [v5 classificationLikelihoods];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v6)
    {
      uint64_t v23 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v9 = [v8 observationsRecipient];
          double v10 = [v9 originatingRequestSpecifier];
          id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = __131__VNCoreSceneUnderstandingDetector__runSceneNetCustomClassifiers_onSceneprintBuffer_forConfigurations_collectedObservations_error___block_invoke_2;
          aBlock[3] = &unk_1E5B1E918;
          id v12 = v10;
          id v27 = v12;
          id v13 = v11;
          id v28 = v13;
          uint64_t v14 = _Block_copy(aBlock);
          id v15 = *(void **)(a1 + 40);
          uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
          id v25 = *(id *)(v16 + 40);
          char v17 = [v15 enumerateClassificationLikelihoods:v24 usingBlock:v14 error:&v25];
          objc_storeStrong((id *)(v16 + 40), v25);
          if ((v17 & 1) == 0)
          {

            goto LABEL_16;
          }
          id v18 = [*(id *)(a1 + 48) objectForKey:v8];
          id v19 = v18;
          if (v18)
          {
            [v18 addObjectsFromArray:v13];
          }
          else
          {
            id v19 = v13;
            [*(id *)(a1 + 48) setObject:v19 forKey:v8];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
}

void __131__VNCoreSceneUnderstandingDetector__runSceneNetCustomClassifiers_onSceneprintBuffer_forConfigurations_collectedObservations_error___block_invoke_2(uint64_t a1, void *a2, float a3)
{
  id v8 = a2;
  id v5 = [VNClassificationObservation alloc];
  *(float *)&double v6 = a3;
  double v7 = [(VNClassificationObservation *)v5 initWithOriginatingRequestSpecifier:*(void *)(a1 + 32) identifier:v8 confidence:0 classificationMetrics:v6];
  [*(id *)(a1 + 40) addObject:v7];
}

void __96__VNCoreSceneUnderstandingDetector__processRecognizedObjectsConfiguration_sceneNetOutput_error___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, float a7)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  uint64_t v14 = [VNClassificationObservation alloc];
  *(float *)&double v15 = a7;
  uint64_t v16 = [(VNClassificationObservation *)v14 initWithOriginatingRequestSpecifier:*(void *)(a1 + 32) identifier:v13 confidence:0 classificationMetrics:v15];
  char v17 = [VNRecognizedObjectObservation alloc];
  uint64_t v18 = *(void *)(a1 + 32);
  v22[0] = v16;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  *(float *)&double v20 = a7;
  v21 = -[VNRecognizedObjectObservation initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:](v17, "initWithOriginatingRequestSpecifier:boundingBox:confidence:labels:segmentationMask:groupId:", v18, v19, 0, 0, a3, a4, a5, a6, v20);

  [*(id *)(a1 + 40) addObject:v21];
}

- (id)_processSaliencyConfiguration:(uint64_t)a3 fromSaliencyMapProvidedBySelector:(void *)a4 ofSceneNetOutput:(void *)a5 regionOfInterest:(uint64_t)a6 options:(void *)a7 qosClass:(uint64_t)a8 saliencyGeneratorType:(double)a9 error:(double)a10
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v22 = a2;
  id v23 = a4;
  id v24 = a5;
  id v25 = a7;
  BOOL v26 = +[VNValidationUtilities requiredSessionInOptions:v24 error:a8];
  if (v26)
  {
    id v27 = [v23 VNRequiredBufferFromSelector:a3 error:a8];
    if (v27)
    {
      id v39 = [v22 observationsRecipient];
      unsigned int v42 = [v39 originatingRequestSpecifier];
      texture = (__CVBuffer *)[a1[7] pixelBufferForSaliencyMap:v27 error:a8];
      if (texture)
      {
        int v38 = [[VNImageBuffer alloc] initWithCVPixelBuffer:texture orientation:1 options:v24 session:v26];
        uint64_t v41 = (void *)[(id)objc_opt_class() _newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:v24];
        id v37 = objc_msgSend(v26, "detectorOfType:configuredWithOptions:error:", v25);
        if (v37)
        {
          v44[0] = v38;
          id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
          [v41 setObject:v28 forKeyedSubscript:@"VNDetectorProcessOption_InputImageBuffers"];

          [v41 setObject:v42 forKeyedSubscript:@"VNDetectorOption_OriginatingRequestSpecifier"];
          if ([v42 observationProvidesBoundsNormalizedToROI]) {
            double v30 = 0.0;
          }
          else {
            double v30 = a9;
          }
          long long v31 = [v37 processUsingQualityOfServiceClass:a6 options:v41 regionOfInterest:0 warningRecorder:a8 error:0 progressHandler:v30];
          if (v31)
          {
            long long v32 = [a1 validatedImageBufferFromOptions:v24 error:a8];
            long long v33 = v32;
            if (v32)
            {
              uint64_t v34 = -[VNSaliencyImageObservation initWithOriginatingRequestSpecifier:rawSaliencyImage:originalImageSize:salientObjectBoundingBoxes:]([VNSaliencyImageObservation alloc], "initWithOriginatingRequestSpecifier:rawSaliencyImage:originalImageSize:salientObjectBoundingBoxes:", v42, texture, v31, a11 * (double)(unint64_t)[v32 width], a12 * (double)(unint64_t)objc_msgSend(v32, "height"));
              uint64_t v43 = v34;
              long long v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
              [v39 receiveObservations:v35];
            }
            else
            {
              long long v35 = 0;
            }
          }
          else
          {
            long long v35 = 0;
          }
        }
        else
        {
          long long v35 = 0;
        }

        CVPixelBufferRelease(texture);
      }
      else
      {
        long long v35 = 0;
      }
    }
    else
    {
      long long v35 = 0;
    }
  }
  else
  {
    long long v35 = 0;
  }

  return v35;
}

- (id)_entityNetTaxonomyForSession:(uint64_t)a3 error:
{
  id v5 = a2;
  double v6 = *(void **)(a1 + 72);
  if (v6) {
    goto LABEL_4;
  }
  id v13 = 0;
  double v7 = [*(id *)(a1 + 56) configuration];
  BOOL v8 = +[VNCoreSceneUnderstandingDetector _getEntityNetTaxonomy:forCSUSceneNetV5Configuration:session:error:]((uint64_t)VNCoreSceneUnderstandingDetector, &v13, v7, v5, a3);
  id v9 = v13;

  if (v8)
  {
    double v10 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = v9;

    double v6 = *(void **)(a1 + 72);
LABEL_4:
    id v11 = v6;
    goto LABEL_5;
  }

  id v11 = 0;
LABEL_5:

  return v11;
}

- (id)_CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN:(uint64_t)a1 observations:(void *)a2 minimumConfidence:(void *)a3 disallowedList:(void *)a4 taxonomy:(void *)a5 originatingRequestSpecifier:(float)a6
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __189__VNCoreSceneUnderstandingDetector__CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN_observations_minimumConfidence_disallowedList_taxonomy_originatingRequestSpecifier___block_invoke;
  v22[3] = &unk_1E5B1E8C8;
  float v28 = a6;
  id v15 = v12;
  id v23 = v15;
  id v16 = v13;
  id v24 = v16;
  id v17 = v14;
  id v25 = v17;
  id v18 = v11;
  id v26 = v18;
  uint64_t v27 = a1;
  id v19 = _Block_copy(v22);
  double v20 = _Block_copy(v19);

  return v20;
}

void __189__VNCoreSceneUnderstandingDetector__CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN_observations_minimumConfidence_disallowedList_taxonomy_originatingRequestSpecifier___block_invoke(uint64_t a1, void *a2, float a3)
{
  id v5 = a2;
  if (*(float *)(a1 + 72) <= a3 && ([*(id *)(a1 + 32) containsIdentifier:v5] & 1) == 0)
  {
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    double v10 = __189__VNCoreSceneUnderstandingDetector__CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN_observations_minimumConfidence_disallowedList_taxonomy_originatingRequestSpecifier___block_invoke_2;
    id v11 = &unk_1E5B1E8A0;
    id v12 = *(id *)(a1 + 40);
    id v13 = v5;
    id v14 = *(id *)(a1 + 48);
    float v15 = a3;
    double v6 = _Block_copy(&v8);
    *(float *)&double v7 = a3;
    objc_msgSend(*(id *)(a1 + 56), "VNInsertObservationWithConfidence:limitedToN:providedByBlock:", *(void *)(a1 + 64), v6, v7, v8, v9, v10, v11);
  }
}

VNClassificationObservation *__189__VNCoreSceneUnderstandingDetector__CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN_observations_minimumConfidence_disallowedList_taxonomy_originatingRequestSpecifier___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) classificationMetricsForLabel:*(void *)(a1 + 40)];
  v3 = [VNClassificationObservation alloc];
  LODWORD(v4) = *(_DWORD *)(a1 + 56);
  id v5 = [(VNClassificationObservation *)v3 initWithOriginatingRequestSpecifier:*(void *)(a1 + 48) identifier:*(void *)(a1 + 40) confidence:v2 classificationMetrics:v4];

  return v5;
}

+ (BOOL)_getEntityNetTaxonomy:(void *)a3 forCSUSceneNetV5Configuration:(void *)a4 session:(uint64_t)a5 error:
{
  id v8 = a3;
  id v9 = a4;
  double v10 = (objc_class *)self;
  id v11 = [v8 entityNetVocabularyName];
  if (v11)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __102__VNCoreSceneUnderstandingDetector__getEntityNetTaxonomy_forCSUSceneNetV5Configuration_session_error___block_invoke;
    aBlock[3] = &unk_1E5B1E850;
    id v12 = v8;
    id v23 = v12;
    id v24 = v11;
    id v13 = _Block_copy(aBlock);
    id v14 = [NSString alloc];
    float v15 = NSStringFromClass(v10);
    id v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "revision"));
    id v17 = (void *)[v14 initWithFormat:@"%@.SceneNetV5.%@.entityNetTaxonomy", v15, v16];

    id v18 = [v9 resourceObjectForIdentifier:v17 creationBlock:v13 error:a5];
    id v19 = v18;
    BOOL v20 = v18 != 0;
    if (v18) {
      *a2 = v18;
    }
  }
  else
  {
    *a2 = 0;
    BOOL v20 = 1;
  }

  return v20;
}

id __102__VNCoreSceneUnderstandingDetector__getEntityNetTaxonomy_forCSUSceneNetV5Configuration_session_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  double v4 = [*(id *)(a1 + 32) sceneTaxonomyWithError:a2];
  if (v4)
  {
    v8[0] = *(void *)(a1 + 40);
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    double v6 = +[VNCoreSceneUnderstandingDetectorTaxonomy taxonomyForCSUTaxonomy:v4 vocabularyNames:v5 error:a2];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_sceneNetTaxonomyForSession:(uint64_t)a3 error:
{
  id v5 = a2;
  double v6 = *(void **)(a1 + 64);
  if (v6) {
    goto LABEL_3;
  }
  double v7 = [*(id *)(a1 + 56) configuration];
  uint64_t v8 = +[VNCoreSceneUnderstandingDetector _sceneNetTaxonomyForCSUSceneNetV5Configuration:session:error:]((uint64_t)VNCoreSceneUnderstandingDetector, v7, v5, a3);
  id v9 = *(void **)(a1 + 64);
  *(void *)(a1 + 64) = v8;

  double v6 = *(void **)(a1 + 64);
  if (v6) {
LABEL_3:
  }
    id v10 = v6;
  else {
    id v10 = 0;
  }

  return v10;
}

+ (id)_sceneNetTaxonomyForCSUSceneNetV5Configuration:(void *)a3 session:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = (objc_class *)self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__VNCoreSceneUnderstandingDetector__sceneNetTaxonomyForCSUSceneNetV5Configuration_session_error___block_invoke;
  aBlock[3] = &unk_1E5B1EE70;
  id v9 = v6;
  id v18 = v9;
  id v10 = _Block_copy(aBlock);
  id v11 = [NSString alloc];
  id v12 = NSStringFromClass(v8);
  id v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "revision"));
  id v14 = (void *)[v11 initWithFormat:@"%@.SceneNetV5.%@.sceneTaxonomy", v12, v13];

  float v15 = [v7 resourceObjectForIdentifier:v14 creationBlock:v10 error:a4];

  return v15;
}

id __97__VNCoreSceneUnderstandingDetector__sceneNetTaxonomyForCSUSceneNetV5Configuration_session_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  double v4 = [*(id *)(a1 + 32) sceneTaxonomyWithError:a2];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) leafSceneClassificationVocabularyName];
    v10[0] = v5;
    id v6 = [*(id *)(a1 + 32) hierarchicalSceneClassificationVocabularyName];
    v10[1] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    uint64_t v8 = +[VNCoreSceneUnderstandingDetectorTaxonomy taxonomyForCSUTaxonomy:v4 vocabularyNames:v7 error:a2];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  id v18 = a6;
  id v19 = v17;
  if (self
    && (uint64_t v39 = 0,
        +[VNValidationUtilities getNSUIntegerValue:&v39 forKey:@"VNDetectorProcessOption_ImageCropAndScaleOption" inOptions:v19 withDefaultValue:2 error:a8]))
  {
    uint64_t v20 = v39;

    v21 = [(VNDetector *)self validatedImageBufferFromOptions:v19 error:a8];
    id v22 = v21;
    if (v21)
    {
      unint64_t v23 = [v21 width];
      unint64_t v24 = [v22 height];
      double v25 = width * (double)v23;
      double v26 = (double)v24;
      double v27 = height * (double)v24;
      if (v25 >= v27) {
        double v28 = height * (double)v24;
      }
      else {
        double v28 = width * (double)v23;
      }
      double inputImageMinimumDimension = (double)self->_inputImageMinimumDimension;
      if (v28 < inputImageMinimumDimension)
      {
        if (width >= height) {
          double v30 = height;
        }
        else {
          double v30 = width;
        }
        if (v30 <= 0.0) {
          double v30 = 1.0;
        }
        VNRecordImageTooSmallWarningWithImageMinimumShortDimension(v18, (unint64_t)(inputImageMinimumDimension / v30));
      }
      [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
      unint64_t inputImagePixelWidth = self->_inputImagePixelWidth;
      unint64_t inputImagePixelHeight = self->_inputImagePixelHeight;
      uint64_t inputImagePixelFormat = self->_inputImagePixelFormat;
      id v38 = 0;
      uint64_t v34 = (__CVBuffer *)objc_msgSend(v22, "cropAndScaleBufferWithWidth:height:cropRect:format:imageCropAndScaleOption:options:error:calculatedNormalizedOriginOffset:calculatedScaleX:calculatedScaleY:pixelBufferRepsCacheKey:", inputImagePixelWidth, inputImagePixelHeight, inputImagePixelFormat, v20, v19, a8, x * (double)v23, y * v26, v25, v27, 0, 0, 0, &v38);
      id v35 = v38;
      *a7 = v34;
      BOOL v36 = v34 != 0;
      if (v34) {
        [(VNDetector *)self recordImageCropQuickLookInfoToOptionsSafe:v19 cacheKey:v35 imageBuffer:v22];
      }
    }
    else
    {
      BOOL v36 = 0;
    }
  }
  else
  {

    BOOL v36 = 0;
  }

  return v36;
}

- (id)internalProcessUsingQualityOfServiceClass:(unsigned int)a3 options:(id)a4 regionOfInterest:(CGRect)a5 warningRecorder:(id)a6 error:(id *)a7 progressHandler:(id)a8
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v15 = *(void *)&a3;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  id v18 = a6;
  id v49 = a8;
  id v19 = [(VNDetector *)self validatedImageBufferFromOptions:v17 error:a7];
  uint64_t v20 = v19;
  if (!v19)
  {
    unint64_t v24 = 0;
    goto LABEL_51;
  }
  long long v48 = +[VNRegionOfInterestTiling tilingForRegionOfInterest:inPixelWidth:height:tileAspectRatio:options:](VNRegionOfInterestTiling, "tilingForRegionOfInterest:inPixelWidth:height:tileAspectRatio:options:", [v19 width], objc_msgSend(v19, "height"), self->_inputImageTilingOptions, x, y, width, height, (double)self->_inputImagePixelWidth / (double)self->_inputImagePixelHeight);
  unint64_t v21 = [v48 tileCount];
  if (v21 >= 2) {
    [v17 setObject:v48 forKeyedSubscript:@"VNCoreSceneUnderstandingDetectorInternalProcessingOption_Tiling"];
  }
  id v22 = [v17 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"];
  if ([v22 count])
  {
    BOOL v23 = 1;
  }
  else
  {
    double v25 = [v17 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"];
    BOOL v23 = [v25 count] != 0;
  }
  if (v21 > 1 || !v23)
  {
    double v26 = [v17 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_SceneprintConfigurations"];
    if ([v26 count])
    {
LABEL_27:

      goto LABEL_28;
    }
    double v27 = [v17 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageAestheticsConfigurations"];
    if ([v27 count])
    {
LABEL_26:

      goto LABEL_27;
    }
    long long v47 = [v17 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyAConfigurations"];
    if ([v47 count])
    {
LABEL_25:

      goto LABEL_26;
    }
    id v46 = [v17 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyOConfigurations"];
    if ([v46 count])
    {
LABEL_24:

      goto LABEL_25;
    }
    unsigned int v45 = [v17 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations"];
    if ([v45 count])
    {
LABEL_23:

      goto LABEL_24;
    }
    unsigned int v44 = [v17 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageFingerprintsConfigurations"];
    if ([v44 count])
    {
LABEL_22:

      goto LABEL_23;
    }
    uint64_t v43 = [v17 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_JunkConfigurations"];
    if ([v43 count])
    {
LABEL_21:

      goto LABEL_22;
    }
    unsigned int v42 = [v17 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_5kJNH3eYuyaLxNpZr5Z7ziConfigurations"];
    if ([v42 count])
    {
LABEL_20:

      goto LABEL_21;
    }
    uint64_t v41 = [v17 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_SignificantEventConfigurations"];
    if ([v41 count])
    {

      goto LABEL_20;
    }
    int v40 = [v17 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_CityNatureGatingConfigurations"];
    uint64_t v39 = [v40 count];

    if (!v39)
    {
      id v28 = 0;
      goto LABEL_29;
    }
  }
LABEL_28:
  v65.receiver = self;
  v65.super_class = (Class)VNCoreSceneUnderstandingDetector;
  -[VNDetector internalProcessUsingQualityOfServiceClass:options:regionOfInterest:warningRecorder:error:progressHandler:](&v65, sel_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler_, v15, v17, v18, a7, v49, x, y, width, height);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  if (!v28)
  {
LABEL_49:
    unint64_t v24 = 0;
    goto LABEL_50;
  }
LABEL_29:
  char v29 = !v23;
  if (v21 < 2) {
    char v29 = 1;
  }
  if ((v29 & 1) == 0)
  {
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x3032000000;
    unsigned int v62 = __Block_byref_object_copy__39_26522;
    v63 = __Block_byref_object_dispose__40_26523;
    id v64 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __141__VNCoreSceneUnderstandingDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke;
    aBlock[3] = &unk_1E5B1EA48;
    unsigned int v58 = &v59;
    void aBlock[4] = self;
    id v55 = v48;
    id v56 = v17;
    id v57 = v18;
    double v30 = _Block_copy(aBlock);
    int v31 = [(id)objc_opt_class() runSuccessReportingBlockSynchronously:v30 detector:self qosClass:v15 error:a7];
    if (v31)
    {
      long long v32 = (void *)v60[5];
      if (v28)
      {
        uint64_t v33 = [v28 arrayByAddingObjectsFromArray:v32];

        id v28 = (id)v33;
      }
      else
      {
        id v28 = v32;
      }
    }

    _Block_object_dispose(&v59, 8);
    if (!v31) {
      goto LABEL_49;
    }
  }
  if (v28)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v34 = v28;
    uint64_t v35 = [v34 countByEnumeratingWithState:&v50 objects:v66 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v51 != v36) {
            objc_enumerationMutation(v34);
          }
          [(VNDetector *)self recordImageCropQuickLookInfoFromOptions:v17 toObservation:*(void *)(*((void *)&v50 + 1) + 8 * i)];
        }
        uint64_t v35 = [v34 countByEnumeratingWithState:&v50 objects:v66 count:16];
      }
      while (v35);
    }

    id v28 = v34;
    unint64_t v24 = v28;
    goto LABEL_50;
  }
  if (!a7)
  {
    id v28 = 0;
    goto LABEL_49;
  }
  +[VNError errorForUnimplementedFunctionWithLocalizedDescription:@"no CSU processing took place"];
  id v28 = 0;
  unint64_t v24 = 0;
  *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_50:

LABEL_51:

  return v24;
}

BOOL __141__VNCoreSceneUnderstandingDetector_internalProcessUsingQualityOfServiceClass_options_regionOfInterest_warningRecorder_error_progressHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  double v4 = *(void **)(a1 + 56);
  uint64_t v61 = a1;
  id v5 = *(id *)(a1 + 40);
  id v62 = v3;
  id v63 = v4;
  uint64_t v78 = (uint64_t)v2;
  id v64 = v5;
  if (v2)
  {
    VNRecordImageTilingWarning(v63, [v5 tileColumnsCount], objc_msgSend(v5, "tileRowsCount"));
    id v6 = v5;
    id v66 = v62;
    id v7 = objc_msgSend(v2, "validatedImageBufferFromOptions:error:");
    if (v7)
    {
      uint64_t v8 = [v66 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"];
      id v9 = (id)[v8 count];
      BOOL v10 = v9 != 0;

      if (v9)
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      else
      {
        id v11 = 0;
      }
      id v16 = objc_msgSend(v66, "objectForKeyedSubscript:", @"VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations", v61);
      uint64_t v17 = [v16 count];

      if (v17) {
        id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      else {
        id v18 = 0;
      }
      *(void *)&long long v87 = 0;
      *((void *)&v87 + 1) = &v87;
      *(void *)&long long v88 = 0x3032000000;
      *((void *)&v88 + 1) = __Block_byref_object_copy__39_26522;
      *(void *)&long long v89 = __Block_byref_object_dispose__40_26523;
      *((void *)&v89 + 1) = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke;
      aBlock[3] = &unk_1E5B1E9B0;
      BOOL v107 = v10;
      v106 = &v87;
      void aBlock[4] = v78;
      id v19 = v11;
      id v103 = v19;
      id v20 = v9;
      id v104 = v20;
      BOOL v108 = v17 != 0;
      id v21 = v18;
      id v105 = v21;
      id v22 = _Block_copy(aBlock);
      uint64_t v93 = MEMORY[0x1E4F143A8];
      uint64_t v94 = 3221225472;
      uint64_t v95 = __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_6;
      uint64_t v96 = &unk_1E5B1E9D8;
      id v97 = v7;
      uint64_t v98 = v78;
      id v99 = v66;
      v101 = &v87;
      id v23 = v22;
      id v100 = v23;
      [v6 enumerateTilesUsingBlock:&v93];
      unint64_t v24 = *(void **)(*((void *)&v87 + 1) + 40);
      BOOL v15 = v24 == 0;
      if (v24)
      {
        id v12 = 0;
        id v13 = 0;
        id v14 = 0;
        if (a2) {
          *a2 = v24;
        }
      }
      else
      {
        id v12 = v19;
        id v13 = v20;
        id v14 = v21;
      }

      _Block_object_dispose(&v87, 8);
    }
    else
    {
      id v12 = 0;
      id v13 = 0;
      id v14 = 0;
      BOOL v15 = 0;
    }

    id v71 = v12;
    id v72 = v13;
    id v65 = v14;
    if (v15)
    {
      double v74 = +[VNValidationUtilities requiredSessionInOptions:v66 error:a2];
      if (v74)
      {
        id v73 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v89 = 0u;
        long long v90 = 0u;
        long long v87 = 0u;
        long long v88 = 0u;
        double v25 = [v66 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"];
        unsigned int v70 = v25;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v87 objects:aBlock count:16];
        if (v26)
        {
          id obj = *(id *)v88;
          while (2)
          {
            uint64_t v27 = 0;
            uint64_t v67 = v26;
            do
            {
              if (*(id *)v88 != obj) {
                objc_enumerationMutation(v25);
              }
              id v28 = *(id *)(*((void *)&v87 + 1) + 8 * v27);
              id v29 = v71;
              id v81 = v72;
              id v30 = v74;
              v79 = v29;
              int v31 = -[VNCoreSceneUnderstandingDetector _sceneNetTaxonomyForSession:error:](v78, v30, (uint64_t)a2);
              if (v31)
              {
                double v75 = [v28 observationsRecipient];
                long long v32 = [v75 originatingRequestSpecifier];
                uint64_t v33 = [v28 disallowedList];
                [v28 minimumConfidence];
                float v35 = v34;
                id v36 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                id v37 = -[VNCoreSceneUnderstandingDetector _CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN:observations:minimumConfidence:disallowedList:taxonomy:originatingRequestSpecifier:]([v28 maximumLeafClassifications], v36, v33, v31, v32, v35);
                uint64_t v93 = MEMORY[0x1E4F143A8];
                uint64_t v94 = 3221225472;
                uint64_t v95 = __143__VNCoreSceneUnderstandingDetector__processImageClassificationConfiguration_forTiledBestLeafConfidences_hierarchicalConfidences_session_error___block_invoke;
                uint64_t v96 = &unk_1E5B1EA00;
                id v38 = v37;
                id v97 = v38;
                [v29 enumerateKeysAndObjectsUsingBlock:&v93];
                id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                int v40 = -[VNCoreSceneUnderstandingDetector _CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN:observations:minimumConfidence:disallowedList:taxonomy:originatingRequestSpecifier:]([v28 maximumHierarchicalClassifications], v39, v33, v31, v32, v35);

                *(void *)&long long v83 = MEMORY[0x1E4F143A8];
                *((void *)&v83 + 1) = 3221225472;
                *(void *)&long long v84 = __143__VNCoreSceneUnderstandingDetector__processImageClassificationConfiguration_forTiledBestLeafConfidences_hierarchicalConfidences_session_error___block_invoke_2;
                *((void *)&v84 + 1) = &unk_1E5B1EA00;
                id v41 = v40;
                *(void *)&long long v85 = v41;
                [v81 enumerateKeysAndObjectsUsingBlock:&v83];
                [v36 addObjectsFromArray:v39];
                id v42 = &__block_literal_global_128_38097;
                [v36 sortWithOptions:16 usingComparator:&__block_literal_global_128_38097];

                [v75 receiveObservations:v36];
              }
              else
              {
                id v36 = 0;
              }

              if (!v36)
              {

LABEL_44:
                id v57 = 0;
                goto LABEL_45;
              }
              [v73 addObjectsFromArray:v36];

              ++v27;
              double v25 = v70;
            }
            while (v67 != v27);
            uint64_t v26 = [v70 countByEnumeratingWithState:&v87 objects:aBlock count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }

        long long v85 = 0u;
        long long v86 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        id obja = [v66 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"];
        uint64_t v43 = [obja countByEnumeratingWithState:&v83 objects:&v93 count:16];
        if (v43)
        {
          uint64_t v80 = *(void *)v84;
          while (2)
          {
            uint64_t v76 = v43;
            for (uint64_t i = 0; i != v76; ++i)
            {
              if (*(void *)v84 != v80) {
                objc_enumerationMutation(obja);
              }
              id v45 = *(id *)(*((void *)&v83 + 1) + 8 * i);
              id v82 = v65;
              id v46 = v74;
              long long v47 = -[VNCoreSceneUnderstandingDetector _entityNetTaxonomyForSession:error:](v78, v46, (uint64_t)a2);
              if (v47)
              {
                long long v48 = [v45 observationsRecipient];
                id v49 = [v48 originatingRequestSpecifier];
                long long v50 = [v45 disallowedList];
                [v45 minimumConfidence];
                float v52 = v51;
                id v53 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                v54 = -[VNCoreSceneUnderstandingDetector _CSUSceneNetV5NetworkLabelLikelihoodEnumerationBlockForCollectingTopN:observations:minimumConfidence:disallowedList:taxonomy:originatingRequestSpecifier:]([v45 maximumClassifications], v53, v50, v47, v49, v52);
                v91[0] = MEMORY[0x1E4F143A8];
                v91[1] = 3221225472;
                v91[2] = __128__VNCoreSceneUnderstandingDetector__processEntityNetClassificationConfiguration_forTiledBestEntityNetConfidences_session_error___block_invoke;
                v91[3] = &unk_1E5B1EA00;
                id v55 = v54;
                id v92 = v55;
                [v82 enumerateKeysAndObjectsUsingBlock:v91];
                id v56 = &__block_literal_global_128_38097;
                [v53 sortWithOptions:16 usingComparator:&__block_literal_global_128_38097];

                [v48 receiveObservations:v53];
              }
              else
              {
                id v53 = 0;
              }

              if (!v53)
              {

                goto LABEL_44;
              }
              [v73 addObjectsFromArray:v53];
            }
            uint64_t v43 = [obja countByEnumeratingWithState:&v83 objects:&v93 count:16];
            if (v43) {
              continue;
            }
            break;
          }
        }

        id v57 = v73;
LABEL_45:
      }
      else
      {
        id v57 = 0;
      }
    }
    else
    {
      id v57 = 0;
    }
  }
  else
  {
    id v57 = 0;
  }

  uint64_t v58 = *(void *)(*(void *)(v61 + 64) + 8);
  uint64_t v59 = *(void **)(v58 + 40);
  *(void *)(v58 + 40) = v57;

  return *(void *)(*(void *)(*(void *)(v61 + 64) + 8) + 40) != 0;
}

void __128__VNCoreSceneUnderstandingDetector__processEntityNetClassificationConfiguration_forTiledBestEntityNetConfidences_session_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v9 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  [v7 floatValue];
  (*(void (**)(uint64_t, id, uint64_t))(v8 + 16))(v8, v9, a4);
}

void __143__VNCoreSceneUnderstandingDetector__processImageClassificationConfiguration_forTiledBestLeafConfidences_hierarchicalConfidences_session_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v9 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  [v7 floatValue];
  (*(void (**)(uint64_t, id, uint64_t))(v8 + 16))(v8, v9, a4);
}

void __143__VNCoreSceneUnderstandingDetector__processImageClassificationConfiguration_forTiledBestLeafConfidences_hierarchicalConfidences_session_error___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v9 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  [v7 floatValue];
  (*(void (**)(uint64_t, id, uint64_t))(v8 + 16))(v8, v9, a4);
}

void __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
      v29[0] = *(id *)(v7 + 40);
      uint64_t v8 = [v5 VNRequiredBufferFromSelector:sel_sceneClassificationLikelihoods error:v29];
      objc_storeStrong((id *)(v7 + 40), v29[0]);
      if (!v8) {
        goto LABEL_11;
      }
      id v9 = *(void **)(*(void *)(a1 + 32) + 56);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_3;
      v26[3] = &unk_1E5B1E988;
      id v28 = &__block_literal_global_422;
      id v27 = *(id *)(a1 + 40);
      uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v10 + 40);
      LOBYTE(v9) = [v9 enumerateLeafSceneClassificationLikelihoods:v8 usingBlock:v26 error:&obj];
      objc_storeStrong((id *)(v10 + 40), obj);

      if ((v9 & 1) == 0) {
        goto LABEL_11;
      }
      id v11 = *(void **)(*(void *)(a1 + 32) + 56);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      void v22[2] = __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_4;
      v22[3] = &unk_1E5B1E988;
      id v24 = &__block_literal_global_422;
      id v23 = *(id *)(a1 + 48);
      uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
      id v21 = *(id *)(v12 + 40);
      LOBYTE(v11) = [v11 enumerateHierarchicalSceneClassificationLikelihoods:v8 usingBlock:v22 error:&v21];
      objc_storeStrong((id *)(v12 + 40), v21);

      if ((v11 & 1) == 0) {
        goto LABEL_11;
      }
    }
    if (!*(unsigned char *)(a1 + 73)) {
      goto LABEL_12;
    }
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    id v20 = *(id *)(v13 + 40);
    uint64_t v8 = [v5 VNRequiredBufferFromSelector:sel_entityNetClassificationLikelihoods error:&v20];
    objc_storeStrong((id *)(v13 + 40), v20);
    if (v8)
    {
      id v14 = *(void **)(*(void *)(a1 + 32) + 56);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_5;
      v17[3] = &unk_1E5B1E988;
      id v19 = &__block_literal_global_422;
      id v18 = *(id *)(a1 + 56);
      uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
      id v16 = *(id *)(v15 + 40);
      [v14 enumerateEntityNetClassificationLikelihoods:v8 usingBlock:v17 error:&v16];
      objc_storeStrong((id *)(v15 + 40), v16);
    }
LABEL_11:

    goto LABEL_12;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
LABEL_12:
}

void __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_6(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v8 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v9 = *(void *)(v7 + 96);
  uint64_t v10 = *(void *)(v7 + 104);
  uint64_t v11 = *(unsigned int *)(v7 + 88);
  [v6 pixelCropRect];
  uint64_t v12 = a1[6];
  uint64_t v13 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v13 + 40);
  id v14 = (__CVBuffer *)objc_msgSend(v8, "croppedBufferWithWidth:height:format:cropRect:options:error:pixelBufferRepsCacheKey:", v9, v10, v11, v12, &obj, 0);
  objc_storeStrong((id *)(v13 + 40), obj);
  if (!v14
    || ([*(id *)(a1[5] + 56) runOnInputImage:v14 completion:a1[7]],
        CVPixelBufferRelease(v14),
        *(void *)(*(void *)(a1[8] + 8) + 40)))
  {
    *a4 = 1;
  }
}

uint64_t __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

uint64_t __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

uint64_t __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

void __137__VNCoreSceneUnderstandingDetector__getBestLeafConfidences_bestHierarchicalConfidences_bestEntityNetConfidences_forTiling_options_error___block_invoke_2(float a1, uint64_t a2, void *a3, void *a4)
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 objectForKeyedSubscript:v11];
  uint64_t v9 = v7;
  if (!v7 || ([v7 floatValue], *(float *)&v8 < a1))
  {
    *(float *)&double v8 = a1;
    uint64_t v10 = [NSNumber numberWithFloat:v8];
    [v6 setObject:v10 forKeyedSubscript:v11];
  }
}

- (BOOL)warmUpSession:(id)a3 withOptions:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v30.receiver = self;
  v30.super_class = (Class)VNCoreSceneUnderstandingDetector;
  if (![(VNDetector *)&v30 warmUpSession:v8 withOptions:v9 error:a5]) {
    goto LABEL_17;
  }
  if (![(CSUSceneNetV5 *)self->_sceneNet loadResources:a5]) {
    goto LABEL_17;
  }
  uint64_t v10 = [v9 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_JunkConfigurations"];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    if (([(CSUSceneNetV5CustomClassifier *)self->_junkLeafClassifier loadResourcesAndReturnError:a5] & 1) == 0|| ![(CSUSceneNetV5CustomClassifier *)self->_junkHierarchicalClassifier loadResourcesAndReturnError:a5])
    {
      goto LABEL_17;
    }
  }
  uint64_t v12 = [v9 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_5kJNH3eYuyaLxNpZr5Z7ziConfigurations"];
  uint64_t v13 = [v12 count];

  if (v13)
  {
    if (([(CSUSceneNetV5CustomClassifier *)self->_VN5kJNH3eYuyaLxNpZr5Z7ziCLassifier loadResourcesAndReturnError:a5] & 1) == 0)goto LABEL_17; {
  }
    }
  id v14 = [v9 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_SignificantEventConfigurations"];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    if (([(CSUSceneNetV5CustomClassifier *)self->_significantEventClassifier loadResourcesAndReturnError:a5] & 1) == 0)goto LABEL_17; {
  }
    }
  id v16 = [v9 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_CityNatureGatingConfigurations"];
  uint64_t v17 = [v16 count];

  if (!v17
    || ([(CSUSceneNetV5CustomClassifier *)self->_cityNatureClassifier loadResourcesAndReturnError:a5] & 1) != 0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__VNCoreSceneUnderstandingDetector_warmUpSession_withOptions_error___block_invoke;
    aBlock[3] = &unk_1E5B1EB28;
    void aBlock[4] = self;
    id v18 = v9;
    id v28 = v18;
    id v19 = v8;
    id v29 = v19;
    id v20 = (uint64_t (**)(void *, __CFString *, id *))_Block_copy(aBlock);
    id v21 = [v18 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyAConfigurations"];
    uint64_t v22 = [v21 count];

    if (v22 && (v20[2](v20, @"VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType", a5) & 1) == 0
      || ([v18 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyOConfigurations"], v23 = objc_claimAutoreleasedReturnValue(), uint64_t v24 = objc_msgSend(v23, "count"), v23, v24)&& (v20[2](v20, @"VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType", a5) & 1) == 0)
    {
      char v25 = 0;
    }
    else
    {
      char v25 = -[VNCoreSceneUnderstandingDetector _warmUpTaxonomiesForOptions:inSession:error:]((uint64_t)self, v18, v19, (uint64_t)a5);
    }
  }
  else
  {
LABEL_17:
    char v25 = 0;
  }

  return v25;
}

uint64_t __68__VNCoreSceneUnderstandingDetector_warmUpSession_withOptions_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = (void *)[(id)objc_opt_class() _newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:*(void *)(a1 + 40)];
  uint64_t v7 = [*(id *)(a1 + 48) detectorOfType:v5 configuredWithOptions:v6 error:a3];
  id v8 = v7;
  if (v7) {
    uint64_t v9 = [v7 warmUpSession:*(void *)(a1 + 48) withOptions:*(void *)(a1 + 40) error:a3];
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

- (uint64_t)_warmUpTaxonomiesForOptions:(void *)a3 inSession:(uint64_t)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"];
    uint64_t v10 = [v9 count];

    if (v10)
    {
      uint64_t v11 = -[VNCoreSceneUnderstandingDetector _sceneNetTaxonomyForSession:error:](a1, v8, a4);

      if (!v11) {
        goto LABEL_12;
      }
    }
    uint64_t v12 = [v7 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"];
    uint64_t v13 = [v12 count];

    if (v13
      && (-[VNCoreSceneUnderstandingDetector _entityNetTaxonomyForSession:error:](a1, v8, a4),
          id v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          !v14))
    {
LABEL_12:
      a1 = 0;
    }
    else
    {
      uint64_t v15 = [v7 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations"];
      uint64_t v16 = [v15 count];

      if (!v16) {
        goto LABEL_11;
      }
      id v17 = v8;
      id v18 = *(void **)(a1 + 80);
      if (v18) {
        goto LABEL_9;
      }
      id v19 = [*(id *)(a1 + 56) configuration];
      uint64_t v20 = +[VNCoreSceneUnderstandingDetector _detectedObjectTaxonomyForCSUSceneNetV5Configuration:session:error:]((uint64_t)VNCoreSceneUnderstandingDetector, v19, v17, a4);
      id v21 = *(void **)(a1 + 80);
      *(void *)(a1 + 80) = v20;

      id v18 = *(void **)(a1 + 80);
      if (v18) {
LABEL_9:
      }
        a1 = v18;
      else {
        a1 = 0;
      }

      if (a1) {
LABEL_11:
      }
        a1 = 1;
    }
  }

  return a1;
}

+ (id)_detectedObjectTaxonomyForCSUSceneNetV5Configuration:(void *)a3 session:(uint64_t)a4 error:
{
  id v6 = a2;
  id v7 = a3;
  id v8 = (objc_class *)self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__VNCoreSceneUnderstandingDetector__detectedObjectTaxonomyForCSUSceneNetV5Configuration_session_error___block_invoke;
  aBlock[3] = &unk_1E5B1EE70;
  id v9 = v6;
  id v18 = v9;
  uint64_t v10 = _Block_copy(aBlock);
  id v11 = [NSString alloc];
  uint64_t v12 = NSStringFromClass(v8);
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "revision"));
  id v14 = (void *)[v11 initWithFormat:@"%@.SceneNetV5.%@.detectedObjectTaxonomy", v12, v13];

  uint64_t v15 = [v7 resourceObjectForIdentifier:v14 creationBlock:v10 error:a4];

  return v15;
}

id __103__VNCoreSceneUnderstandingDetector__detectedObjectTaxonomyForCSUSceneNetV5Configuration_session_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  double v4 = [*(id *)(a1 + 32) sceneTaxonomyWithError:a2];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) detectionVocabularyName];
    v9[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v7 = +[VNCoreSceneUnderstandingDetectorTaxonomy taxonomyForCSUTaxonomy:v4 vocabularyNames:v6 error:a2];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)VNCoreSceneUnderstandingDetector;
  if ([(VNDetector *)&v40 completeInitializationForSession:v6 error:a4])
  {
    [(VNDetector *)self configurationOptions];
    id v38 = 0;
    id v39 = 0;
    id v36 = 0;
    id v37 = 0;
    id v34 = 0;
    uint64_t v33 = v35 = 0;
    char v7 = +[VNCoreSceneUnderstandingDetector _getCSUSceneNetV5Configuration:junkLeafConfiguration:junkHierarchicalConfiguration:VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:significantEventConfiguration:cityNatureConfiguration:forConfigurationOptions:error:]((uint64_t)VNCoreSceneUnderstandingDetector, &v39, &v38, &v37, &v36, &v35, &v34, v33, a4);
    id v8 = v39;
    id v9 = v38;
    id v10 = v37;
    id v11 = v36;
    id v12 = v35;
    id v13 = v34;
    if (v7)
    {
      id v14 = (CSUSceneNetV5 *)[objc_alloc(MEMORY[0x1E4F5D088]) initWithConfiguration:v8];
      sceneNet = self->_sceneNet;
      self->_sceneNet = v14;

      uint64_t v16 = [v8 inputPixelBufferDescriptor];
      self->_uint64_t inputImagePixelFormat = [v16 pixelFormat];
      self->_unint64_t inputImagePixelWidth = [v16 width];
      unint64_t v17 = [v16 height];
      self->_unint64_t inputImagePixelHeight = v17;
      unint64_t inputImagePixelWidth = self->_inputImagePixelWidth;
      if (inputImagePixelWidth >= v17) {
        unint64_t inputImagePixelWidth = v17;
      }
      self->_double inputImageMinimumDimension = inputImagePixelWidth;
      id v19 = objc_alloc_init(VNRegionOfInterestTilingOptions);
      inputImageTilingOptions = self->_inputImageTilingOptions;
      self->_inputImageTilingOptions = v19;

      id v21 = (CSUSceneNetV5CustomClassifier *)[objc_alloc(MEMORY[0x1E4F5D098]) initWithConfiguration:v9];
      junkLeafClassifier = self->_junkLeafClassifier;
      self->_junkLeafClassifier = v21;

      id v23 = (CSUSceneNetV5CustomClassifier *)[objc_alloc(MEMORY[0x1E4F5D098]) initWithConfiguration:v10];
      junkHierarchicalClassifier = self->_junkHierarchicalClassifier;
      self->_junkHierarchicalClassifier = v23;

      char v25 = (CSUSceneNetV5CustomClassifier *)[objc_alloc(MEMORY[0x1E4F5D098]) initWithConfiguration:v11];
      VN5kJNH3eYuyaLxNpZr5Z7ziCLassifier = self->_VN5kJNH3eYuyaLxNpZr5Z7ziCLassifier;
      self->_VN5kJNH3eYuyaLxNpZr5Z7ziCLassifier = v25;

      id v27 = (CSUSceneNetV5CustomClassifier *)[objc_alloc(MEMORY[0x1E4F5D098]) initWithConfiguration:v12];
      significantEventClassifier = self->_significantEventClassifier;
      self->_significantEventClassifier = v27;

      id v29 = (CSUSceneNetV5CustomClassifier *)[objc_alloc(MEMORY[0x1E4F5D098]) initWithConfiguration:v13];
      cityNatureClassifier = self->_cityNatureClassifier;
      self->_cityNatureClassifier = v29;

      char v31 = -[VNCoreSceneUnderstandingDetector _warmUpTaxonomiesForOptions:inSession:error:]((uint64_t)self, v33, v6, (uint64_t)a4);
    }
    else
    {
      char v31 = 0;
    }
  }
  else
  {
    char v31 = 0;
  }

  return v31;
}

+ (uint64_t)_getCSUSceneNetV5Configuration:(void *)a3 junkLeafConfiguration:(void *)a4 junkHierarchicalConfiguration:(void *)a5 VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:(void *)a6 significantEventConfiguration:(void *)a7 cityNatureConfiguration:(void *)a8 forConfigurationOptions:(void *)a9 error:
{
  id v14 = a8;
  uint64_t v15 = self;
  uint64_t v16 = [v15 computeDeviceForComputeStage:@"VNComputeStageMain" configurationOptions:v14 error:a9];
  if (v16)
  {
    uint64_t v38 = 0;
    if (+[VNCoreSceneUnderstandingDetector _getSceneNetV5ConfigurationRevision:forConfigurationOptions:error:]((uint64_t)v15, &v38, v14, a9))
    {
      uint64_t v17 = v38;
      id v18 = [MEMORY[0x1E4F5D090] sceneNetV5ConfigurationForRevision:v38 error:a9];
      id v19 = v18;
      if (!v18)
      {
        uint64_t v31 = 0;
        goto LABEL_28;
      }
      [v18 setComputeDevice:v16];
      if ((v17 | 2) == 3) {
        [v19 setValue:&unk_1EF7A8370 forKey:@"detectionNMSThreshold"];
      }
      if (a2) {
        *a2 = v19;
      }
      uint64_t v20 = +[VNComputeDeviceUtilities mostPerformantCPUComputeDevice];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __241__VNCoreSceneUnderstandingDetector__getCSUSceneNetV5Configuration_junkLeafConfiguration_junkHierarchicalConfiguration_VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration_significantEventConfiguration_cityNatureConfiguration_forConfigurationOptions_error___block_invoke;
      aBlock[3] = &unk_1E5B1E828;
      id v33 = v20;
      id v37 = v33;
      id v34 = (void (**)(void *, void *))_Block_copy(aBlock);
      if (a3)
      {
        id v21 = (void *)[v19 newJunkLeafConfigurationAndReturnError:a9];
        if (!v21) {
          goto LABEL_25;
        }
        v34[2](v34, v21);
        id v22 = v21;
        *a3 = v22;
      }
      if (a4)
      {
        id v23 = (void *)[v19 newJunkHierarchicalConfigurationAndReturnError:a9];
        if (!v23) {
          goto LABEL_25;
        }
        v34[2](v34, v23);
        id v24 = v23;
        *a4 = v24;
      }
      if (a5)
      {
        char v25 = (void *)[v19 newClassifierBetaConfigurationAndReturnError:a9];
        if (!v25) {
          goto LABEL_25;
        }
        v34[2](v34, v25);
        id v26 = v25;
        *a5 = v26;
      }
      if (a6)
      {
        id v27 = (void *)[v19 newClassifierAlphaConfigurationAndReturnError:a9];
        if (!v27) {
          goto LABEL_25;
        }
        v34[2](v34, v27);
        id v28 = v27;
        *a6 = v28;
      }
      if (!a7)
      {
LABEL_23:
        uint64_t v31 = 1;
LABEL_26:

LABEL_28:
        goto LABEL_29;
      }
      id v29 = (void *)[v19 newCityNatureConfigurationAndReturnError:a9];
      if (v29)
      {
        v34[2](v34, v29);
        id v30 = v29;
        *a7 = v30;

        goto LABEL_23;
      }
LABEL_25:
      uint64_t v31 = 0;
      goto LABEL_26;
    }
  }
  uint64_t v31 = 0;
LABEL_29:

  return v31;
}

+ (BOOL)_getSceneNetV5ConfigurationRevision:(void *)a3 forConfigurationOptions:(void *)a4 error:
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__VNCoreSceneUnderstandingDetector__getSceneNetV5ConfigurationRevision_forConfigurationOptions_error___block_invoke;
  aBlock[3] = &unk_1E5B1E800;
  id v9 = v6;
  id v17 = v9;
  uint64_t v19 = v7;
  id v10 = v8;
  id v18 = v10;
  id v11 = (void (**)(void *, __CFString *))_Block_copy(aBlock);
  v11[2](v11, @"VNCoreSceneUnderstandingDetectorProcessingOption_SceneprintConfigurations");
  v11[2](v11, @"VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations");
  v11[2](v11, @"VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations");
  v11[2](v11, @"VNCoreSceneUnderstandingDetectorProcessingOption_ImageAestheticsConfigurations");
  v11[2](v11, @"VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyAConfigurations");
  v11[2](v11, @"VNCoreSceneUnderstandingDetectorProcessingOption_ImageSaliencyOConfigurations");
  v11[2](v11, @"VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations");
  v11[2](v11, @"VNCoreSceneUnderstandingDetectorProcessingOption_ImageFingerprintsConfigurations");
  v11[2](v11, @"VNCoreSceneUnderstandingDetectorProcessingOption_JunkConfigurations");
  v11[2](v11, @"VNCoreSceneUnderstandingDetectorProcessingOption_5kJNH3eYuyaLxNpZr5Z7ziConfigurations");
  v11[2](v11, @"VNCoreSceneUnderstandingDetectorProcessingOption_SignificantEventConfigurations");
  v11[2](v11, @"VNCoreSceneUnderstandingDetectorProcessingOption_CityNatureGatingConfigurations");
  uint64_t v12 = [v10 count];
  if (v12)
  {
    if (v12 == 1)
    {
      *a2 = [v10 firstIndex];
      BOOL v13 = 1;
    }
    else if (a4)
    {
      +[VNError errorForInvalidOperationWithLocalizedDescription:@"The configuration options require multiple model revisions"];
      BOOL v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    id v14 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v9 error:a4];
    BOOL v13 = v14 != 0;
    if (v14) {
      *a2 = +[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestSpecifier:](v7, v14);
    }
  }
  return v13;
}

uint64_t __241__VNCoreSceneUnderstandingDetector__getCSUSceneNetV5Configuration_junkLeafConfiguration_junkHierarchicalConfiguration_VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration_significantEventConfiguration_cityNatureConfiguration_forConfigurationOptions_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setComputeDevice:*(void *)(a1 + 32)];
}

void __102__VNCoreSceneUnderstandingDetector__getSceneNetV5ConfigurationRevision_forConfigurationOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(id *)(*((void *)&v12 + 1) + 8 * v6);
        uint64_t v8 = self;
        id v9 = objc_msgSend(v7, "observationsRecipient", (void)v12);
        id v10 = [v9 originatingRequestSpecifier];

        if (v10) {
          uint64_t v11 = +[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestSpecifier:](v8, v10);
        }
        else {
          uint64_t v11 = 0;
        }

        [*(id *)(a1 + 40) addIndex:v11];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v4);
  }
}

+ (uint64_t)_sceneNetV5ConfigurationRevisionForRequestSpecifier:(uint64_t)a1
{
  id v2 = a2;
  uint64_t v3 = self;
  uint64_t v4 = (objc_class *)[v2 requestClassAndReturnError:0];
  if (v4) {
    uint64_t v5 = +[VNCoreSceneUnderstandingDetector _sceneNetV5ConfigurationRevisionForRequestClass:revision:](v3, v4, [v2 requestRevision]);
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

void __93__VNCoreSceneUnderstandingDetector__sceneNetV5ConfigurationRevisionForRequestClass_revision___block_invoke()
{
}

- (BOOL)needsMetalContext
{
  return 0;
}

- (id)description
{
  v9.receiver = self;
  v9.super_class = (Class)VNCoreSceneUnderstandingDetector;
  uint64_t v3 = [(VNDetector *)&v9 description];
  uint64_t v4 = [(CSUSceneNetV5 *)self->_sceneNet configuration];
  uint64_t v5 = [v4 revision];
  if ((unint64_t)(v5 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"CSUSceneNetV5ConfigurationRevision(%ld)", v5);
    uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v6 = off_1E5B1EA90[v5 - 1];
  }
  id v7 = [v3 stringByAppendingFormat:@" %@", v6];

  return v7;
}

- (int64_t)sceneNetConfigurationRevision
{
  id v2 = [(CSUSceneNetV5 *)self->_sceneNet configuration];
  int64_t v3 = [v2 revision];

  return v3;
}

+ (id)supportedImageSizeSetForOptions:(id)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v11 = 0;
  int v4 = +[VNCoreSceneUnderstandingDetector _getCSUSceneNetV5Configuration:junkLeafConfiguration:junkHierarchicalConfiguration:VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:significantEventConfiguration:cityNatureConfiguration:forConfigurationOptions:error:]((uint64_t)VNCoreSceneUnderstandingDetector, &v11, 0, 0, 0, 0, 0, a3, a4);
  id v5 = v11;
  uint64_t v6 = v5;
  if (v4)
  {
    id v7 = [v5 inputPixelBufferDescriptor];
    uint64_t v8 = -[VNSupportedImageSize initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:]([VNSupportedImageSize alloc], "initWithIdealFormat:width:height:orientation:aspectRatioHandling:orientationAgnostic:", [v7 pixelFormat], objc_msgSend(v7, "width"), objc_msgSend(v7, "height"), 1, 0, 0);
    v12[0] = v8;
    objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

+ (void)recordDefaultConfigurationOptionsInDictionary:(id)a3
{
  id v4 = a3;
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___VNCoreSceneUnderstandingDetector;
  objc_msgSendSuper2(&v5, sel_recordDefaultConfigurationOptionsInDictionary_, v4);
  [v4 setObject:&unk_1EF7A76D0 forKeyedSubscript:@"VNDetectorProcessOption_ImageCropAndScaleOption"];
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v27 = 0;
  if (!+[VNCoreSceneUnderstandingDetector _getSceneNetV5ConfigurationRevision:forConfigurationOptions:error:]((uint64_t)a1, &v27, v6, a4))
  {
    id v18 = 0;
    goto LABEL_24;
  }
  if (+[VNCoreSceneUnderstandingDetector supportedComputeStageDevicesForOptions:error:]::onceToken != -1) {
    dispatch_once(&+[VNCoreSceneUnderstandingDetector supportedComputeStageDevicesForOptions:error:]::onceToken, &__block_literal_global_447);
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __81__VNCoreSceneUnderstandingDetector_supportedComputeStageDevicesForOptions_error___block_invoke_2;
  aBlock[3] = &__block_descriptor_40_e9__16__0__8l;
  uint64_t v7 = v27;
  void aBlock[4] = v27;
  uint64_t v8 = _Block_copy(aBlock);
  objc_super v9 = (void *)+[VNCoreSceneUnderstandingDetector supportedComputeStageDevicesForOptions:error:]::sceneNetConfigurationCache;
  id v10 = [NSNumber numberWithInteger:v7];
  id v11 = [v9 objectForIdentifier:v10 creationBlock:v8 error:a4];

  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v13 = [v11 supportedComputeDevices];
    [v12 setObject:v13 forKeyedSubscript:@"VNComputeStageMain"];

    long long v14 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v6 error:a4];
    long long v15 = v14;
    if (!v14)
    {
      id v18 = 0;
LABEL_22:

      goto LABEL_23;
    }
    id v16 = v14;
    self;
    if ([v16 specifiesRequestClass:objc_opt_class()])
    {
      uint64_t v17 = VNAttentionBasedSaliencyHeatmapBoundingBoxGeneratorType;
    }
    else
    {
      if (![v16 specifiesRequestClass:objc_opt_class()])
      {
        uint64_t v19 = 0;
        goto LABEL_19;
      }
      uint64_t v17 = VNObjectnessBasedSaliencyHeatmapBoundingBoxGeneratorType;
    }
    uint64_t v19 = *v17;

    if (!v19)
    {
LABEL_20:
      id v18 = v12;
      goto LABEL_21;
    }
    uint64_t v20 = (void *)[a1 _newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:v6];
    id v21 = +[VNDetector detectorClassForDetectorType:v19 configuredWithOptions:v20 error:a4];
    if (!v21
      || ([(objc_class *)v21 supportedComputeStageDevicesForOptions:v6 error:a4], id v22 = objc_claimAutoreleasedReturnValue(), (v23 = v22) == 0))
    {

      id v18 = 0;
LABEL_21:

      goto LABEL_22;
    }
    id v24 = [v22 objectForKeyedSubscript:@"VNComputeStageMain"];
    [v12 setObject:v24 forKeyedSubscript:@"VNComputeStagePostProcessing"];

    id v16 = v20;
LABEL_19:

    goto LABEL_20;
  }
  id v18 = 0;
LABEL_23:

LABEL_24:

  return v18;
}

uint64_t __81__VNCoreSceneUnderstandingDetector_supportedComputeStageDevicesForOptions_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F5D090] sceneNetV5ConfigurationForRevision:*(void *)(a1 + 32) error:a2];
}

uint64_t __81__VNCoreSceneUnderstandingDetector_supportedComputeStageDevicesForOptions_error___block_invoke()
{
  +[VNCoreSceneUnderstandingDetector supportedComputeStageDevicesForOptions:error:]::sceneNetConfigurationCache = (uint64_t)objc_alloc_init(MEMORY[0x1E4FB3EE8]);

  return MEMORY[0x1F41817F8]();
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = @"VNComputeStageMain";
  int64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (BOOL)producesObservationsForMultipleRequestClasses
{
  return 1;
}

+ (id)keyForDetectorWithConfigurationOptions:(id)a3
{
  id v4 = a3;
  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VNCoreSceneUnderstandingDetector;
  objc_super v5 = objc_msgSendSuper2(&v10, sel_keyForDetectorWithConfigurationOptions_, v4);
  uint64_t v9 = 0;
  if (+[VNCoreSceneUnderstandingDetector _getSceneNetV5ConfigurationRevision:forConfigurationOptions:error:]((uint64_t)a1, &v9, v4, 0))
  {
    id v6 = [NSString alloc];
    uint64_t v7 = [v6 initWithFormat:@"%@:%lu", v5, v9];

    objc_super v5 = (void *)v7;
  }

  return v5;
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__VNCoreSceneUnderstandingDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNCoreSceneUnderstandingDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNCoreSceneUnderstandingDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  id v2 = (void *)+[VNCoreSceneUnderstandingDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __73__VNCoreSceneUnderstandingDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNCoreSceneUnderstandingDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  id v2 = (void *)[v1 mutableCopy];

  [v2 removeObject:@"VNDetectorInitOption_ModelBackingStore"];
  [v2 removeObject:@"VNDetectorOption_OriginatingRequestSpecifier"];
  [v2 removeObject:@"VNDetectorOption_EspressoPlanPriority"];
  uint64_t v3 = [v2 copy];
  id v4 = (void *)+[VNCoreSceneUnderstandingDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNCoreSceneUnderstandingDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)allCityNatureIdentifiersWithConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v11 = 0;
  char v7 = +[VNCoreSceneUnderstandingDetector _getCSUSceneNetV5Configuration:junkLeafConfiguration:junkHierarchicalConfiguration:VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:significantEventConfiguration:cityNatureConfiguration:forConfigurationOptions:error:]((uint64_t)a1, 0, 0, 0, 0, 0, &v11, v6, a4);
  id v8 = v11;
  if (v7)
  {
    uint64_t v9 = +[VNCoreSceneUnderstandingDetector _identifiersSupportedByCustomClassifierConfiguration:error:]((uint64_t)a1, v8, (uint64_t)a4);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)_identifiersSupportedByCustomClassifierConfiguration:(uint64_t)a3 error:
{
  id v4 = a2;
  self;
  objc_super v5 = [v4 taxonomyWithError:a3];
  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    char v7 = [v4 vocabularyName];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __95__VNCoreSceneUnderstandingDetector__identifiersSupportedByCustomClassifierConfiguration_error___block_invoke;
    void v10[3] = &unk_1E5B1E878;
    id v8 = v6;
    id v11 = v8;
    [v5 enumerateLabelsInVocabularyNamed:v7 usingBlock:v10];

    [v8 sortUsingSelector:sel_compare_];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __95__VNCoreSceneUnderstandingDetector__identifiersSupportedByCustomClassifierConfiguration_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

+ (id)allSignificantEventIdentifiersWithConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v11 = 0;
  char v7 = +[VNCoreSceneUnderstandingDetector _getCSUSceneNetV5Configuration:junkLeafConfiguration:junkHierarchicalConfiguration:VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:significantEventConfiguration:cityNatureConfiguration:forConfigurationOptions:error:]((uint64_t)a1, 0, 0, 0, 0, &v11, 0, v6, a4);
  id v8 = v11;
  if (v7)
  {
    uint64_t v9 = +[VNCoreSceneUnderstandingDetector _identifiersSupportedByCustomClassifierConfiguration:error:]((uint64_t)a1, v8, (uint64_t)a4);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)allVN5kJNH3eYuyaLxNpZr5Z7ziIdentifiersWithConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v11 = 0;
  char v7 = +[VNCoreSceneUnderstandingDetector _getCSUSceneNetV5Configuration:junkLeafConfiguration:junkHierarchicalConfiguration:VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:significantEventConfiguration:cityNatureConfiguration:forConfigurationOptions:error:]((uint64_t)a1, 0, 0, 0, &v11, 0, 0, v6, a4);
  id v8 = v11;
  if (v7)
  {
    uint64_t v9 = +[VNCoreSceneUnderstandingDetector _identifiersSupportedByCustomClassifierConfiguration:error:]((uint64_t)a1, v8, (uint64_t)a4);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

+ (id)allRecognizedObjectIdentifiersWithConfigurationOptions:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = +[VNCoreSceneUnderstandingDetector _globalOrProvidedSessionInOptions:error:]((uint64_t)a1, v6, (uint64_t)a4);
  if (v7)
  {
    id v8 = [v6 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_RecognizeObjectsConfigurations"];
    if ([v8 count] == 1)
    {
      id v28 = [v8 firstObject];
      id v33 = 0;
      char v9 = +[VNCoreSceneUnderstandingDetector _getCSUSceneNetV5Configuration:junkLeafConfiguration:junkHierarchicalConfiguration:VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:significantEventConfiguration:cityNatureConfiguration:forConfigurationOptions:error:]((uint64_t)a1, &v33, 0, 0, 0, 0, 0, v6, a4);
      id v10 = v33;
      uint64_t v27 = v10;
      if (v9)
      {
        id v11 = +[VNCoreSceneUnderstandingDetector _detectedObjectTaxonomyForCSUSceneNetV5Configuration:session:error:]((uint64_t)a1, v10, v7, (uint64_t)a4);
        id v26 = v11;
        if (v11)
        {
          id v12 = [v11 labels];
          long long v13 = (void *)[v12 mutableCopy];

          long long v14 = [v28 observationsRecipient];
          char v25 = [v14 originatingRequestSpecifier];

          long long v15 = [a1 _specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:v25];
          id v16 = v15;
          if (v15)
          {
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            id v17 = v15;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v34 count:16];
            if (v18)
            {
              uint64_t v19 = *(void *)v30;
              do
              {
                for (uint64_t i = 0; i != v18; ++i)
                {
                  if (*(void *)v30 != v19) {
                    objc_enumerationMutation(v17);
                  }
                  uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * i);
                  if ([v13 containsObject:v21])
                  {
                    id v22 = [v17 objectForKeyedSubscript:v21];
                    id v23 = (id)[v13 arrayByAddingObject:v22];
                  }
                }
                uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v34 count:16];
              }
              while (v18);
            }
          }
        }
        else
        {
          long long v13 = 0;
        }
      }
      else
      {
        long long v13 = 0;
      }
    }
    else if (a4)
    {
      +[VNError errorForInternalErrorWithLocalizedDescription:@"incorrect recognized objects configurations"];
      long long v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v13 = 0;
    }
  }
  else
  {
    long long v13 = 0;
  }

  return v13;
}

+ (id)_globalOrProvidedSessionInOptions:(uint64_t)a3 error:
{
  id v4 = a2;
  self;
  id v8 = 0;
  LOBYTE(a3) = +[VNValidationUtilities getOptionalObject:&v8 ofClass:objc_opt_class() forKey:@"VNDetectorProcessOption_Session" inOptions:v4 error:a3];
  id v5 = v8;
  if (a3)
  {
    if (!v5)
    {
      id v5 = +[VNSession globalSession];
    }
    id v5 = v5;
    id v6 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)allClassificationIdentifiersWithConfigurationOptions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  char v7 = +[VNCoreSceneUnderstandingDetector _globalOrProvidedSessionInOptions:error:]((uint64_t)a1, v6, (uint64_t)a4);
  if (!v7)
  {
    long long v14 = 0;
    goto LABEL_21;
  }
  id v21 = 0;
  char v8 = +[VNCoreSceneUnderstandingDetector _getCSUSceneNetV5Configuration:junkLeafConfiguration:junkHierarchicalConfiguration:VN5kJNH3eYuyaLxNpZr5Z7ziConfiguration:significantEventConfiguration:cityNatureConfiguration:forConfigurationOptions:error:]((uint64_t)a1, &v21, 0, 0, 0, 0, 0, v6, a4);
  id v9 = v21;
  if (v8)
  {
    id v10 = [v6 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_ImageClassificationConfigurations"];
    if ([v10 count] == 1)
    {
      id v11 = +[VNCoreSceneUnderstandingDetector _sceneNetTaxonomyForCSUSceneNetV5Configuration:session:error:]((uint64_t)a1, v9, v7, (uint64_t)a4);
      if (v11)
      {
        id v12 = [v10 firstObject];
        long long v13 = [v12 disallowedList];

        long long v14 = [v11 labelsFilteredByDisallowedList:v13];
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      id v11 = [v6 objectForKeyedSubscript:@"VNCoreSceneUnderstandingDetectorProcessingOption_EntityNetClassificationConfigurations"];
      if ([v11 count] == 1)
      {
        id v20 = 0;
        BOOL v15 = +[VNCoreSceneUnderstandingDetector _getEntityNetTaxonomy:forCSUSceneNetV5Configuration:session:error:]((uint64_t)a1, &v20, v9, v7, (uint64_t)a4);
        id v16 = v20;
        long long v13 = v16;
        if (v15)
        {
          if (v16)
          {
            id v17 = [v11 firstObject];
            uint64_t v18 = [v17 disallowedList];

            long long v14 = [v13 labelsFilteredByDisallowedList:v18];

            goto LABEL_18;
          }
          if (a4)
          {
            +[VNError errorForInvalidModelWithLocalizedDescription:@"classification is not supported"];
            long long v14 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_18;
          }
        }
        long long v14 = 0;
        goto LABEL_18;
      }
      if (a4)
      {
        +[VNError errorForInternalErrorWithLocalizedDescription:@"incorrect classification configurations"];
        long long v14 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

        goto LABEL_20;
      }
    }
    long long v14 = 0;
    goto LABEL_19;
  }
  long long v14 = 0;
LABEL_20:

LABEL_21:

  return v14;
}

+ (id)_newSaliencyHeatmapBoundingBoxGeneratorOptionsForOptions:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
  id v5 = [v3 objectForKeyedSubscript:@"VNDetectorOption_ComputeStageDeviceAssignments"];
  if ([v5 count])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    char v7 = [v5 objectForKeyedSubscript:@"VNComputeStagePostProcessing"];
    char v8 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, @"VNComputeStageMain", 0);

    [v4 setObject:v8 forKeyedSubscript:@"VNDetectorOption_ComputeStageDeviceAssignments"];
  }

  return v4;
}

+ (id)_specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:(id)a3
{
  id v3 = a3;
  if ([v3 specifiesRequestClass:objc_opt_class() revision:3737841667])
  {
    if (+[VNCoreSceneUnderstandingDetector _specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:]::onceToken != -1) {
      dispatch_once(&+[VNCoreSceneUnderstandingDetector _specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:]::onceToken, &__block_literal_global_305);
    }
    id v4 = (id)+[VNCoreSceneUnderstandingDetector _specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:]::specialCase1;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

void __108__VNCoreSceneUnderstandingDetector__specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier___block_invoke()
{
  v0 = (void *)+[VNCoreSceneUnderstandingDetector _specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:]::specialCase1;
  +[VNCoreSceneUnderstandingDetector _specialCaseRecognizedObjectsDuplicationsForOriginatingRequestSpecifier:]::specialCase1 = (uint64_t)&unk_1EF7A8380;
}

@end