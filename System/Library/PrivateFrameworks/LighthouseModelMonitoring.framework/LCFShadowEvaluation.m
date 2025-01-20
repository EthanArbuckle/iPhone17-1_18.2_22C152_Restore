@interface LCFShadowEvaluation
- (LCFFeatureStore)featureStore;
- (LCFModelStore)modelStore;
- (id)evaluateModels:(id)a3;
- (id)init:(id)a3 modelStore:(id)a4;
@end

@implementation LCFShadowEvaluation

- (id)init:(id)a3 modelStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)LCFShadowEvaluation;
  v9 = [(LCFShadowEvaluation *)&v11 init];
  if (v9)
  {
    LCFModelMonitoringLoggingUtilsInit();
    objc_storeStrong((id *)&v9->_featureStore, a3);
    objc_storeStrong((id *)&v9->_modelStore, a4);
  }

  return v9;
}

- (id)evaluateModels:(id)a3
{
  v159[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v123 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v5 = [v4 featureNames];
  v6 = [v4 srcLabelName];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    id v8 = (void *)LCFMMLogShadowEvaluation;
    if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_ERROR)) {
      -[LCFShadowEvaluation evaluateModels:](v8, v4);
    }
    id v9 = 0;
    goto LABEL_79;
  }
  v10 = [v4 featureNames];
  objc_super v11 = [v4 srcLabelName];
  v159[0] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v159 count:1];
  uint64_t v13 = [v10 arrayByAddingObjectsFromArray:v12];

  v115 = (void *)v13;
  v122 = [(LCFFeatureStore *)self->_featureStore getFeatureVectors:v13 startDate:0 endDate:0 option:4];
  uint64_t v14 = objc_msgSend(MEMORY[0x263F515B8], "fromMLProvider:");
  v15 = (void *)MEMORY[0x263F515C8];
  v16 = [v4 featureNames];
  v17 = [v4 srcLabelName];
  v18 = [v4 vectorFeatureName];
  v19 = [v4 destLabelName];
  v114 = (void *)v14;
  v20 = [v15 toMultiArrayTypeBatchProvider:v14 srcFeatureNames:v16 srcLabelName:v17 destFeatureName:v18 destLabelName:v19];

  v21 = v4;
  v22 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v20, "count"));
  if ([v20 count] >= 1)
  {
    uint64_t v23 = 0;
    do
    {
      v24 = [v20 featuresAtIndex:v23];
      v25 = [v21 groundTruthLabelFeatureName];
      v26 = [v24 featureValueForName:v25];
      [v22 addObject:v26];

      ++v23;
    }
    while (v23 < [v20 count]);
  }
  long long v149 = 0u;
  long long v150 = 0u;
  long long v147 = 0u;
  long long v148 = 0u;
  v133 = v21;
  id obj = [v21 modelNames];
  uint64_t v129 = [obj countByEnumeratingWithState:&v147 objects:v158 count:16];
  if (v129)
  {
    uint64_t v128 = *(void *)v148;
    *(void *)&long long v27 = 138412802;
    long long v113 = v27;
    v119 = self;
    v132 = v20;
    v116 = v22;
LABEL_10:
    uint64_t v28 = 0;
    v29 = v133;
    while (1)
    {
      if (*(void *)v148 != v128) {
        objc_enumerationMutation(obj);
      }
      uint64_t v134 = v28;
      v30 = *(void **)(*((void *)&v147 + 1) + 8 * v28);
      v31 = objc_msgSend(v29, "preprocessHandler", v113);

      if (v31)
      {
        v32 = [v29 preprocessHandler];
        ((void (**)(void, void *, void *))v32)[2](v32, v30, v20);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v33 = v20;
      }
      v34 = [v29 inferenceHandler];

      v136 = v33;
      if (v34)
      {
        v35 = [v29 inferenceHandler];
        id v146 = 0;
        v36 = ((void (**)(void, void *, id, id *))v35)[2](v35, v30, v33, &v146);
        id v37 = v146;

        v135 = &unk_2703F9CA0;
        v38 = v37;
      }
      else
      {
        uint64_t v39 = [(LCFModelStore *)self->_modelStore getModelURL:v30];
        if (!v39)
        {
          v111 = LCFMMLogShadowEvaluation;
          if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v152 = v30;
            _os_log_error_impl(&dword_254EB7000, v111, OS_LOG_TYPE_ERROR, "could not find modelURl for %@", buf, 0xCu);
          }
          v36 = 0;
          v38 = 0;
          v135 = &unk_2703F9CA0;
LABEL_77:

          id v9 = 0;
          v22 = v116;
          goto LABEL_78;
        }
        v40 = (void *)v39;
        uint64_t v41 = [(LCFModelStore *)self->_modelStore getModelConfig:v30];
        v125 = (void *)v41;
        if (v41)
        {
          uint64_t v144 = 0;
          v42 = (id *)&v144;
          uint64_t v43 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v40 configuration:v41 error:&v144];
        }
        else
        {
          v44 = LCFMMLogShadowEvaluation;
          if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v152 = v30;
            _os_log_impl(&dword_254EB7000, v44, OS_LOG_TYPE_INFO, "MLModelConfiguration was not stored %@", buf, 0xCu);
          }
          uint64_t v145 = 0;
          v42 = (id *)&v145;
          uint64_t v43 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v40 error:&v145];
        }
        v45 = (void *)v43;
        id v46 = *v42;
        v126 = v45;
        if (v45)
        {
          v130 = v30;
          v47 = [v45 modelDescription];
          if ([v33 count])
          {
            v118 = v40;
            v120 = v46;
            v48 = [v33 featuresAtIndex:0];
            long long v138 = 0u;
            long long v139 = 0u;
            long long v140 = 0u;
            long long v141 = 0u;
            v117 = v48;
            v49 = [v48 featureNames];
            uint64_t v50 = [v49 countByEnumeratingWithState:&v138 objects:v157 count:16];
            if (v50)
            {
              uint64_t v51 = v50;
              uint64_t v52 = *(void *)v139;
              while (2)
              {
                for (uint64_t i = 0; i != v51; ++i)
                {
                  if (*(void *)v139 != v52) {
                    objc_enumerationMutation(v49);
                  }
                  v54 = *(void **)(*((void *)&v138 + 1) + 8 * i);
                  v55 = [v47 inputFeatureNames];
                  if ([v55 containsObject:v54])
                  {
                  }
                  else
                  {
                    v56 = [v47 outputFeatureNames];
                    char v57 = [v56 containsObject:v54];

                    if ((v57 & 1) == 0)
                    {
                      v71 = (void *)LCFMMLogShadowEvaluation;
                      if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_ERROR))
                      {
                        v108 = v71;
                        v109 = [v47 inputFeatureNames];
                        v110 = [v47 outputFeatureNames];
                        *(_DWORD *)buf = v113;
                        v152 = v54;
                        __int16 v153 = 2112;
                        uint64_t v154 = (uint64_t)v109;
                        __int16 v155 = 2112;
                        v156[0] = v110;
                        _os_log_error_impl(&dword_254EB7000, v108, OS_LOG_TYPE_ERROR, "featureName %@ is not in modelDescription %@ %@", buf, 0x20u);
                      }
                      v36 = 0;
                      int v68 = 1;
                      v135 = &unk_2703F9CA0;
                      self = v119;
                      v38 = v120;
                      v20 = v132;
                      goto LABEL_53;
                    }
                  }
                }
                uint64_t v51 = [v49 countByEnumeratingWithState:&v138 objects:v157 count:16];
                if (v51) {
                  continue;
                }
                break;
              }
            }

            id v137 = 0;
            v58 = [v126 predictionsFromBatch:v136 error:&v137];
            id v121 = v137;
            if ([v116 count])
            {
              unint64_t v59 = 0;
              unsigned int v60 = 0;
              v61 = v116;
              do
              {
                v62 = [v116 objectAtIndexedSubscript:v59];
                v63 = [v58 featuresAtIndex:v59];
                v64 = [v133 predictedLabelFeatureName];
                v65 = [v63 featureValueForName:v64];
                int v66 = [v62 isEqualToFeatureValue:v65];

                v60 += v66;
                ++v59;
              }
              while (v59 < [v116 count]);
            }
            else
            {
              unsigned int v60 = 0;
              v61 = v116;
            }
            uint64_t v72 = objc_msgSend(NSNumber, "numberWithDouble:", (double)v60 / (double)(unint64_t)objc_msgSend(v61, "count"));
            v73 = (void *)LCFMMLogShadowEvaluation;
            v135 = (void *)v72;
            if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_INFO))
            {
              v74 = v73;
              uint64_t v75 = [v61 count];
              *(_DWORD *)buf = 138413058;
              v152 = v130;
              __int16 v153 = 2112;
              uint64_t v154 = v72;
              __int16 v155 = 1024;
              LODWORD(v156[0]) = v60;
              WORD2(v156[0]) = 2048;
              *(void *)((char *)v156 + 6) = v75;
              _os_log_impl(&dword_254EB7000, v74, OS_LOG_TYPE_INFO, "prediction accuracy modelName:%@ accuracy:%@ matchedCount:%d cout:%lu", buf, 0x26u);
            }
            int v68 = 0;
            self = v119;
            v38 = v121;
            v20 = v132;
            v29 = v133;
            v36 = v58;
LABEL_53:
            v40 = v118;
            v69 = v125;

            id v33 = v136;
          }
          else
          {
            v70 = LCFMMLogShadowEvaluation;
            if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_ERROR)) {
              [(LCFShadowEvaluation *)&v142 evaluateModels:v70];
            }
            v36 = 0;
            int v68 = 1;
            v135 = &unk_2703F9CA0;
            id v33 = v136;
            v38 = v46;
            v69 = v125;
          }

          v30 = v130;
        }
        else
        {
          v67 = (void *)LCFMMLogShadowEvaluation;
          if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_ERROR))
          {
            v106 = v67;
            v107 = [v46 description];
            *(_DWORD *)buf = 138412546;
            v152 = v40;
            __int16 v153 = 2112;
            uint64_t v154 = (uint64_t)v107;
            _os_log_error_impl(&dword_254EB7000, v106, OS_LOG_TYPE_ERROR, "could not load a model %@: %@", buf, 0x16u);
          }
          v36 = 0;
          int v68 = 1;
          v135 = &unk_2703F9CA0;
          v38 = v46;
          id v33 = v136;
          v69 = v125;
        }

        if (v68) {
          goto LABEL_77;
        }
      }
      if (v38)
      {
        v76 = v36;
        v77 = LCFMMLogShadowEvaluation;
        if (os_log_type_enabled((os_log_t)LCFMMLogShadowEvaluation, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v152 = v38;
          _os_log_error_impl(&dword_254EB7000, v77, OS_LOG_TYPE_ERROR, "predictionsFromBatch failed %@", buf, 0xCu);
        }
        id v78 = objc_alloc(MEMORY[0x263F51608]);
        id v79 = objc_alloc(MEMORY[0x263F515D0]);
        v80 = [MEMORY[0x263F515B8] fromMLProvider:v20];
        v81 = [v29 srcLabelName];
        v82 = (void *)[v79 init:v80 labelFeatureName:v81];
        v83 = v78;
        v84 = v135;
        id v85 = (id)[v83 init:v30 inputBachProviderInfo:v82 evaluatedPredictions:0 accuracy:v135 succeeded:&unk_2703F9C88 evaluationError:v38];

        [MEMORY[0x263F515E8] emitShadowEvaluationEvent:v85];
        uint64_t v86 = v134;
        v36 = v76;
        goto LABEL_71;
      }
      v87 = [v29 metricsHandler];

      if (v87)
      {
        v88 = [v29 metricsHandler];
        ((void (**)(void, void *, id, void *))v88)[2](v88, v30, v33, v36);
        v89 = v30;
        id v85 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v89 = v30;
        id v85 = v36;
      }
      v131 = v89;
      [v123 setObject:v85 forKey:v89];
      if ([v85 count] < 1)
      {
        id v90 = 0;
      }
      else
      {
        id v90 = objc_alloc_init(MEMORY[0x263EFF980]);
        if ([v85 count] >= 1)
        {
          v127 = v36;
          uint64_t v91 = 0;
          unint64_t v92 = 0x263F51000uLL;
          do
          {
            v93 = [*(id *)(v92 + 1464) fromMLProvider:v132];
            v94 = [v93 featureProviders];
            v95 = [v94 objectAtIndexedSubscript:v91];

            v96 = [v85 featuresAtIndex:v91];
            id v97 = objc_alloc(MEMORY[0x263F51610]);
            v98 = [v29 destLabelName];
            v99 = (void *)[v97 init:v95 predictedFeatureSet:v96 outputLabelFeatureName:v98];

            [v90 addObject:v99];
            ++v91;
            uint64_t v100 = [v85 count];
            unint64_t v92 = 0x263F51000;
          }
          while (v91 < v100);
          self = v119;
          v36 = v127;
          goto LABEL_70;
        }
      }
      unint64_t v92 = 0x263F51000uLL;
LABEL_70:
      v101 = [*(id *)(v92 + 1464) fromMLProvider:v122];
      id v102 = objc_alloc(MEMORY[0x263F515D0]);
      v103 = [v29 srcLabelName];
      v104 = (void *)[v102 init:v101 labelFeatureName:v103];

      v105 = (void *)[objc_alloc(MEMORY[0x263F51608]) init:v131 inputBachProviderInfo:v104 evaluatedPredictions:v90 accuracy:v135 succeeded:&unk_2703F9C88 evaluationError:0];
      [MEMORY[0x263F515E8] emitShadowEvaluationEvent:v105];

      v84 = v135;
      v38 = 0;
      uint64_t v86 = v134;
LABEL_71:

      uint64_t v28 = v86 + 1;
      v20 = v132;
      if (v28 == v129)
      {
        uint64_t v129 = [obj countByEnumeratingWithState:&v147 objects:v158 count:16];
        v22 = v116;
        if (v129) {
          goto LABEL_10;
        }
        break;
      }
    }
  }

  id v9 = v123;
LABEL_78:

  id v4 = v133;
LABEL_79:

  return v9;
}

- (LCFFeatureStore)featureStore
{
  return self->_featureStore;
}

- (LCFModelStore)modelStore
{
  return self->_modelStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelStore, 0);
  objc_storeStrong((id *)&self->_featureStore, 0);
}

- (void)evaluateModels:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v3 = a1;
  id v4 = [a2 srcLabelName];
  int v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_254EB7000, v3, OS_LOG_TYPE_ERROR, "Parameter labelName %@ is in the featureNames.", (uint8_t *)&v5, 0xCu);
}

- (void)evaluateModels:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_254EB7000, log, OS_LOG_TYPE_ERROR, "batchProvider has no features", buf, 2u);
}

@end