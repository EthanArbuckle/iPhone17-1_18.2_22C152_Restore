@interface NLModelImplX
- (NLModelImplX)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10;
- (NLModelImplX)initWithModelTrainer:(id)a3 error:(id *)a4;
- (float)outputForString:(id)a3;
- (id)configuration;
- (id)customEmbeddingData;
- (id)labelMap;
- (id)modelData;
- (id)predictedLabelForString:(id)a3;
- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4;
- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4;
- (id)predictedLabelsForTokens:(id)a3;
- (id)trainingInfo;
- (unint64_t)numberOfTrainingInstances;
- (unint64_t)systemVersion;
- (void)dealloc;
@end

@implementation NLModelImplX

- (NLModelImplX)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  v98[1] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v82 = 0;
  v17 = v13;
  id v18 = a9;
  uint64_t v71 = [v14 revision];
  uint64_t v97 = *MEMORY[0x1E4F78EE0];
  v98[0] = v13;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v98 forKeys:&v97 count:1];
  cf = (MontrealNeuralNetwork *)MRLNeuralNetworkCreate();
  stringForKey(v18, 0x1EFB30610, 0);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v20 = obj;
  stringForKeyWithDefault(v18, @"TrainingEmbeddingType", 0);
  id v68 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v68;
  stringForKeyWithDefault(v18, @"EmbeddingModelIdentifier", 0);
  id v77 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v67 = unsignedIntegerForKey(v18, 0x1EFB30650, 0);

  v22 = v20;
  v75 = v20;
  if (!v20)
  {
    v22 = [v14 language];
  }
  v23 = v21;
  if (!v21)
  {
    v24 = [v14 options];
    v23 = stringForKeyWithDefault(v24, @"EmbeddingType", 0);
  }
  v74 = v21;
  if ([v23 isEqualToString:@"Static"])
  {
    if (!v22
      || (+[NLEmbedding wordEmbeddingForLanguage:v22 revision:v71], (uint64_t v25 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      NSLog(&cfstr_FailedToLoadSt.isa, v22, v71);
LABEL_22:
      requestWordEmbeddingAssetsForLanguage(v22);
LABEL_23:
      uint64_t v26 = 0;
      goto LABEL_24;
    }
    goto LABEL_16;
  }
  if (![v23 isEqualToString:@"Dynamic"])
  {
    if ([v23 isEqualToString:@"Transformer"])
    {
      if (!v22
        || (+[NLEmbedding transformerContextualTokenEmbeddingForLanguage:v22], (uint64_t v25 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        NSLog(&cfstr_FailedToLoadTr.isa, v22);
        goto LABEL_22;
      }
      goto LABEL_16;
    }
    if ([v23 isEqualToString:@"Contextual"])
    {
      if (v77)
      {
        uint64_t v27 = +[NLContextualEmbedding contextualEmbeddingWithModelIdentifier:](NLContextualEmbedding, "contextualEmbeddingWithModelIdentifier:");
        if (!v27)
        {
          NSLog(&cfstr_FailedToLoadCo_0.isa, v77);
LABEL_64:
          uint64_t v26 = 0;
          goto LABEL_25;
        }
      }
      else
      {
        if (!v22)
        {
          NSLog(&cfstr_FailedToLoadCo_2.isa);
          goto LABEL_23;
        }
        uint64_t v27 = +[NLContextualEmbedding contextualEmbeddingWithLanguage:v22];
        if (!v27)
        {
          NSLog(&cfstr_FailedToLoadCo_1.isa, v22);
          goto LABEL_64;
        }
      }
      if (([(id)v27 hasAvailableAssets] & 1) == 0)
      {
        NSLog(&cfstr_AssetsNotAvail.isa, v27);
        requestContextualEmbeddingAssetsForEmbedding_0((void *)v27);
      }
      goto LABEL_64;
    }
    if (![v23 isEqualToString:@"Custom"]) {
      goto LABEL_23;
    }
    if (v16)
    {
      id v81 = 0;
      uint64_t v26 = +[NLEmbedding embeddingWithData:v16 error:&v81];
      id v76 = v81;
      if (v26)
      {
LABEL_58:
        uint64_t v27 = 0;
        goto LABEL_26;
      }
    }
    else
    {
      id v76 = 0;
    }
    NSLog(&cfstr_FailedToLoadEm_3.isa);
    uint64_t v26 = 0;
    goto LABEL_58;
  }
  if (!v22
    || (+[NLEmbedding contextualWordEmbeddingForLanguage:v22 revision:v71], (uint64_t v25 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    NSLog(&cfstr_FailedToLoadDy_0.isa, v22, v71);
    goto LABEL_22;
  }
LABEL_16:
  uint64_t v26 = v25;
LABEL_24:
  uint64_t v27 = 0;
LABEL_25:
  id v76 = 0;
LABEL_26:
  v28 = cf;
  if (cf && v26 | v27)
  {
    v65 = v19;
    v29 = v17;
    v80.receiver = self;
    v80.super_class = (Class)NLModelImplX;
    v30 = [(NLModelImplX *)&v80 init];
    if (v30)
    {
      v31 = v30;
      v30->_montrealModel = cf;
      uint64_t v32 = [v14 copy];
      configuration = v31->_configuration;
      v31->_configuration = (NLModelConfiguration *)v32;

      objc_storeStrong((id *)&v31->_embedding, (id)v26);
      objc_storeStrong((id *)&v31->_contextualEmbedding, (id)v27);
      uint64_t v34 = [v16 copy];
      customEmbeddingData = v31->_customEmbeddingData;
      v31->_customEmbeddingData = (NSData *)v34;

      uint64_t v36 = [v15 copy];
      labelMap = v31->_labelMap;
      v31->_labelMap = (NSDictionary *)v36;

      v31->_numberOfTrainingInstances = v67;
      objc_storeStrong((id *)&v31->_trainingLanguage, obj);
      objc_storeStrong((id *)&v31->_trainingEmbeddingType, v68);
      objc_storeStrong((id *)&v31->_embeddingModelIdentifier, v77);
      objc_storeStrong((id *)&v31->_modelData, a3);
      v38 = v31;
      self = v38;
      v17 = v29;
      v19 = v65;
      goto LABEL_41;
    }
    self = 0;
    v19 = v65;
    v28 = cf;
  }
  if (a10)
  {
    if (v82)
    {
      id v39 = v82;
    }
    else
    {
      if (!v76)
      {
        id v64 = v16;
        if (v26)
        {
          v72 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v95 = *MEMORY[0x1E4F28568];
          v96 = @"Failed to load model file, invalid Transfer model data";
          [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
          v41 = v19;
          v43 = v42 = v17;
          *a10 = [v72 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v43];

          v17 = v42;
          v19 = v41;
        }
        else
        {
          id v63 = v15;
          if ([v23 isEqualToString:@"Static"])
          {
            v73 = [NSString stringWithFormat:@"Failed to load model file, could not find static embedding for language %@ revision %llu", v22, v71];
            v44 = (void *)MEMORY[0x1E4F28C58];
            id v45 = v14;
            v46 = v17;
            uint64_t v93 = *MEMORY[0x1E4F28568];
            v94 = v73;
            v47 = (void *)MEMORY[0x1E4F1C9E8];
            v48 = &v94;
            v49 = &v93;
          }
          else if ([v23 isEqualToString:@"Dynamic"])
          {
            v73 = [NSString stringWithFormat:@"Failed to load model file, could not find dynamic embedding for language %@ revision %llu", v22, v71];
            v44 = (void *)MEMORY[0x1E4F28C58];
            id v45 = v14;
            v46 = v17;
            uint64_t v91 = *MEMORY[0x1E4F28568];
            v92 = v73;
            v47 = (void *)MEMORY[0x1E4F1C9E8];
            v48 = &v92;
            v49 = &v91;
          }
          else
          {
            if (![v23 isEqualToString:@"Transformer"])
            {
              v66 = v19;
              if ([v23 isEqualToString:@"Contextual"])
              {
                v53 = [NSString stringWithFormat:@"Failed to load model file, could not find contextual embedding for language %@", v22];
                v54 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v87 = *MEMORY[0x1E4F28568];
                v88 = v53;
                v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v88 forKeys:&v87 count:1];
                *a10 = [v54 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:8 userInfo:v55];
              }
              else
              {
                v56 = v17;
                int v57 = [v23 isEqualToString:@"Custom"];
                v58 = (void *)MEMORY[0x1E4F28C58];
                if (v57)
                {
                  uint64_t v85 = *MEMORY[0x1E4F28568];
                  v86 = @"Failed to load model file, invalid custom embedding";
                  v59 = (void *)MEMORY[0x1E4F1C9E8];
                  v60 = &v86;
                  v61 = &v85;
                }
                else
                {
                  uint64_t v83 = *MEMORY[0x1E4F28568];
                  v84 = @"Failed to load model file, invalid embedding type";
                  v59 = (void *)MEMORY[0x1E4F1C9E8];
                  v60 = &v84;
                  v61 = &v83;
                }
                v62 = [v59 dictionaryWithObjects:v60 forKeys:v61 count:1];
                *a10 = [v58 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v62];

                v17 = v56;
              }
              id v16 = v64;
              v19 = v66;
              goto LABEL_37;
            }
            v73 = [NSString stringWithFormat:@"Failed to load model file, could not find transformer embedding for language %@", v22];
            v44 = (void *)MEMORY[0x1E4F28C58];
            id v45 = v14;
            v46 = v17;
            uint64_t v89 = *MEMORY[0x1E4F28568];
            v90 = v73;
            v47 = (void *)MEMORY[0x1E4F1C9E8];
            v48 = &v90;
            v49 = &v89;
          }
          [v47 dictionaryWithObjects:v48 forKeys:v49 count:1];
          v51 = v50 = v19;
          v52 = v44;
          v17 = v46;
          id v14 = v45;
          id v15 = v63;
          id v16 = v64;
          *a10 = [v52 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:8 userInfo:v51];

          v19 = v50;
        }
LABEL_37:
        v28 = cf;
        goto LABEL_38;
      }
      id v39 = v76;
    }
    *a10 = v39;
    goto LABEL_37;
  }
LABEL_38:
  if (v28) {
    CFRelease(v28);
  }
  v38 = 0;
LABEL_41:

  return v38;
}

- (NLModelImplX)initWithModelTrainer:(id)a3 error:(id *)a4
{
  uint64_t v163 = *MEMORY[0x1E4F143B8];
  id v142 = 0;
  id v129 = a3;
  v130 = [v129 configuration];
  uint64_t v5 = [v130 language];
  v120 = [v130 embeddingURL];
  v119 = [v130 embeddingModel];
  v116 = [v130 embeddingData];
  v131 = [v129 dataSet];
  *(_OWORD *)buf = xmmword_1A646D4D0;
  *(int64x2_t *)&buf[16] = vdupq_n_s64(0x400uLL);
  long long v162 = xmmword_1A646D8C0;
  v126 = +[NLDataSet dataSetWithDataSet:v131 constraintParameters:buf modelTrainer:v129];
  v123 = [v131 labelMap];
  v121 = [v131 inverseLabelMap];
  uint64_t v6 = [v130 revision];
  unint64_t v115 = [v131 numberOfTrainingInstances];
  unint64_t v7 = [v131 numberOfLabels];
  unint64_t v8 = [v131 numberOfValidationInstances];
  v9 = [v129 options];
  uint64_t v113 = unsignedIntegerForKey(v9, @"MaximumIterations", 75);

  v10 = [v130 options];
  stringForKeyWithDefault(v10, @"EmbeddingType", 0);
  v128 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)v5;
  if (!v5)
  {
    v12 = objc_msgSend(v131, "dataProviderOfType:");
    uint64_t v13 = [v12 recognizedLanguage];

    v11 = (void *)v13;
  }
  v127 = v11;
  if (v128 || !v11)
  {
    if ([(__CFString *)v128 isEqualToString:@"Static"])
    {
      id v16 = v127;
      if (v127)
      {
        id v14 = +[NLEmbedding wordEmbeddingForLanguage:v127 revision:v6];
        id v16 = v127;
        if (v14) {
          goto LABEL_22;
        }
      }
      uint64_t v17 = [NSString stringWithFormat:@"Failed to load static embedding for language %@ revision %llu", v16, v6];
      uint64_t v18 = v17;
      if (a4)
      {
        v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v157 = *MEMORY[0x1E4F28568];
        uint64_t v158 = v17;
        id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v158 forKeys:&v157 count:1];
        *a4 = [v19 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:8 userInfo:v20];
      }
      requestWordEmbeddingAssetsForLanguage(v127);
      goto LABEL_40;
    }
    if ([(__CFString *)v128 isEqualToString:@"Dynamic"])
    {
      id v16 = v127;
      if (v127)
      {
        id v14 = +[NLEmbedding contextualWordEmbeddingForLanguage:v127 revision:v6];
        id v16 = v127;
        if (v14) {
          goto LABEL_22;
        }
      }
      uint64_t v21 = [NSString stringWithFormat:@"Failed to load dynamic embedding for language %@ revision %llu", v16, v6];
      uint64_t v18 = v21;
      if (a4)
      {
        v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v155 = *MEMORY[0x1E4F28568];
        uint64_t v156 = v21;
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v156 forKeys:&v155 count:1];
        *a4 = [v22 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:8 userInfo:v23];
      }
      requestWordEmbeddingAssetsForLanguage(v127);
      goto LABEL_40;
    }
    if ([(__CFString *)v128 isEqualToString:@"Transformer"])
    {
      id v16 = v127;
      if (v127)
      {
        id v14 = +[NLEmbedding transformerContextualTokenEmbeddingForLanguage:](NLEmbedding, "transformerContextualTokenEmbeddingForLanguage:");
        id v16 = v127;
        if (v14) {
          goto LABEL_22;
        }
      }
      uint64_t v27 = [NSString stringWithFormat:@"Failed to load transformer embedding for language %@", v16];
      uint64_t v18 = v27;
      if (a4)
      {
        v28 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v153 = *MEMORY[0x1E4F28568];
        uint64_t v154 = v27;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v154 forKeys:&v153 count:1];
        *a4 = [v28 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:8 userInfo:v29];
      }
      requestWordEmbeddingAssetsForLanguage(v127);
      goto LABEL_40;
    }
    if ([(__CFString *)v128 isEqualToString:@"Contextual"])
    {
      v44 = v127;
      if (v127)
      {
        id v45 = +[NLContextualEmbedding contextualEmbeddingWithLanguage:](NLContextualEmbedding, "contextualEmbeddingWithLanguage:");
        id v14 = v45;
        v44 = v127;
        if (v45)
        {
          if (objc_msgSend(v45, "hasAvailableAssets", v127))
          {
            uint64_t v36 = 0;
            v117 = 0;
            v118 = 0;
            v122 = 0;
LABEL_45:
            v125 = 0;
            if (![v14 dimension])
            {
              id v24 = v14;
              uint64_t v25 = 0;
              uint64_t v26 = v36;
              goto LABEL_144;
            }
            uint64_t v26 = v36;
            if (v115 < 2 || (v125 = 0, v7 < 2) || (v110 = v14, v8 <= 1))
            {
              id v24 = v14;
              uint64_t v25 = 0;
              goto LABEL_144;
            }
            goto LABEL_49;
          }
          uint64_t v94 = [NSString stringWithFormat:@"Assets not available for contextual embedding %@", v14];
          uint64_t v18 = v94;
          if (a4)
          {
            uint64_t v95 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v151 = *MEMORY[0x1E4F28568];
            uint64_t v152 = v94;
            v96 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v152 forKeys:&v151 count:1];
            *a4 = [v95 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:8 userInfo:v96];
          }
          requestContextualEmbeddingAssetsForEmbedding_0(v14);
          v118 = 0;
LABEL_41:
          v122 = 0;
          v117 = 0;
          if (v18)
          {
LABEL_42:
            v33 = (__CFString *)v18;
            uint64_t v34 = v14;
            goto LABEL_43;
          }
LABEL_141:
          uint64_t v26 = 0;
          if (v14) {
            goto LABEL_44;
          }
LABEL_142:
          v125 = 0;
          id v24 = 0;
          goto LABEL_143;
        }
      }
      uint64_t v91 = [NSString stringWithFormat:@"Failed to load contextual embedding for language %@", v44];
      uint64_t v18 = v91;
      if (a4)
      {
        v92 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v149 = *MEMORY[0x1E4F28568];
        uint64_t v150 = v91;
        uint64_t v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v150 forKeys:&v149 count:1];
        *a4 = [v92 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:8 userInfo:v93];
      }
LABEL_40:
      v118 = 0;
      id v14 = 0;
      goto LABEL_41;
    }
    if (![(__CFString *)v128 isEqualToString:@"Custom"])
    {
      v125 = 0;
      id v24 = 0;
      uint64_t v26 = 0;
      v117 = 0;
      v118 = 0;
      v122 = 0;
LABEL_143:
      uint64_t v25 = 0;
      goto LABEL_144;
    }
    if (v120)
    {
      v118 = +[NLEmbedding _embeddingWithContentsOfURL:v120 error:0];
      if (v118)
      {
        v122 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v120];
        v117 = 0;
      }
      else
      {
        v98 = +[NLModel modelWithContentsOfURL:v120 error:a4];
        v117 = v98;
        if (!v98)
        {
          v122 = 0;
          v117 = 0;
          goto LABEL_140;
        }
        v122 = [v98 embeddingData];
      }
      if (v122)
      {
        id v14 = +[NLEmbedding _embeddingWithData:v122 error:a4];
        if (v14) {
          goto LABEL_23;
        }
      }
      else
      {
        v122 = 0;
      }
LABEL_140:
      uint64_t v18 = [NSString stringWithFormat:@"Failed to load custom embedding from %@", v120];
      id v14 = 0;
      if (v18) {
        goto LABEL_42;
      }
      goto LABEL_141;
    }
    if (v119)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v97 = v119;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (+[NLModel modelWithMLModel:v119 error:a4],
              (id v97 = (id)objc_claimAutoreleasedReturnValue()) == 0))
        {
          v117 = 0;
          goto LABEL_146;
        }
      }
      v117 = v97;
      v122 = [v97 embeddingData];
      if (v122)
      {
        id v14 = +[NLEmbedding _embeddingWithData:v122 error:a4];
        uint64_t v34 = 0;
        if (v14)
        {
          v118 = 0;
          goto LABEL_23;
        }
        v33 = @"Failed to load custom embedding from model";
        v118 = 0;
LABEL_43:
        v35 = v33;
        NSLog(&stru_1EFB32910.isa, v33);
        [v129 logMessage:v35];
        id v14 = v34;
        uint64_t v26 = v35;
        if (v34)
        {
LABEL_44:
          uint64_t v36 = v26;
          goto LABEL_45;
        }
        goto LABEL_142;
      }
LABEL_146:
      v122 = 0;
      uint64_t v34 = 0;
      v118 = 0;
      v33 = @"Failed to load custom embedding from model";
      goto LABEL_43;
    }
    if (!v116)
    {
      v33 = @"Failed to load custom embedding, no embedding specified";
      if (a4)
      {
        v101 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v147 = *MEMORY[0x1E4F28568];
        v148 = @"Failed to load custom embedding, no embedding specified";
        v102 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
        *a4 = [v101 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:4 userInfo:v102];

        v117 = 0;
        v118 = 0;
        v122 = 0;
        uint64_t v34 = 0;
        v33 = @"Failed to load custom embedding, no embedding specified";
      }
      else
      {
        v117 = 0;
        v118 = 0;
        v122 = 0;
        uint64_t v34 = 0;
      }
      goto LABEL_43;
    }
    v118 = +[NLEmbedding _embeddingWithData:v116 error:0];
    if (v118)
    {
      id v99 = v116;
      v117 = 0;
      goto LABEL_132;
    }
    v103 = +[NLModel modelWithData:v116 error:a4];
    v117 = v103;
    if (v103)
    {
      uint64_t v104 = [v103 embeddingData];
      if (v104)
      {
        id v99 = (id)v104;
LABEL_132:
        v122 = v99;
        id v14 = +[NLEmbedding _embeddingWithData:error:](NLEmbedding, "_embeddingWithData:error:");
        if (v14) {
          goto LABEL_23;
        }
        goto LABEL_156;
      }
    }
    else
    {
      v117 = 0;
    }
    v122 = 0;
LABEL_156:
    uint64_t v34 = 0;
    v33 = @"Failed to load custom embedding from data";
    goto LABEL_43;
  }
  id v14 = +[NLEmbedding contextualWordEmbeddingForLanguage:v11 revision:v6];
  if (!v14)
  {
    id v14 = +[NLEmbedding wordEmbeddingForLanguage:v127 revision:v6];
    if (v14)
    {
      id v15 = NLModelEmbeddingTypeStatic;
      goto LABEL_21;
    }
    uint64_t v30 = [NSString stringWithFormat:@"Failed to load embedding for language %@ revision %llu", v127, v6];
    uint64_t v18 = v30;
    if (a4)
    {
      v31 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v159 = *MEMORY[0x1E4F28568];
      uint64_t v160 = v30;
      uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v160 forKeys:&v159 count:1];
      *a4 = [v31 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:8 userInfo:v32];
    }
    requestWordEmbeddingAssetsForLanguage(v127);
    v128 = 0;
    goto LABEL_40;
  }
  id v15 = NLModelEmbeddingTypeDynamic;
LABEL_21:
  v128 = *v15;
LABEL_22:
  v117 = 0;
  v118 = 0;
  v122 = 0;
LABEL_23:
  id v24 = 0;
  if (objc_msgSend(v14, "dimension", v16) && v115 > 1)
  {
    uint64_t v25 = 0;
    if (v7 < 2)
    {
      v125 = v14;
      goto LABEL_36;
    }
    v125 = v14;
    v110 = 0;
    uint64_t v26 = 0;
    if (v8 < 2)
    {
      v125 = v14;
      uint64_t v25 = 0;
LABEL_36:
      id v24 = 0;
      uint64_t v26 = 0;
      goto LABEL_144;
    }
LABEL_49:
    v109 = v26;
    uint64_t v37 = [v14 dimension];
    unint64_t v38 = [v126 numberOfTrainingInstances];
    if (v38 < 0x21)
    {
      uint64_t v42 = 1;
    }
    else
    {
      unint64_t v39 = 16;
      if (v38 < 0x100) {
        unint64_t v39 = v38 >> 4;
      }
      unint64_t v40 = 3 * v39;
      if (3 * v39 >= v38) {
        unint64_t v40 = v38;
      }
      if (v39 >= v40)
      {
        uint64_t v42 = v39;
      }
      else
      {
        unint64_t v41 = v38;
        uint64_t v42 = v39;
        do
        {
          unint64_t v43 = v39 + 1;
          if (v38 % (v39 + 1) < v41)
          {
            uint64_t v42 = v39 + 1;
            unint64_t v41 = v38 % (v39 + 1);
          }
          ++v39;
        }
        while (v40 != v43);
      }
    }
    unint64_t v46 = [v126 numberOfValidationInstances];
    if (v46 < 0x21)
    {
      uint64_t v50 = 1;
    }
    else
    {
      unint64_t v47 = 16;
      if (v46 < 0x100) {
        unint64_t v47 = v46 >> 4;
      }
      unint64_t v48 = 3 * v47;
      if (3 * v47 >= v46) {
        unint64_t v48 = v46;
      }
      if (v47 >= v48)
      {
        uint64_t v50 = v47;
      }
      else
      {
        unint64_t v49 = v46;
        uint64_t v50 = v47;
        do
        {
          unint64_t v51 = v47 + 1;
          if (v46 % (v47 + 1) < v49)
          {
            uint64_t v50 = v47 + 1;
            unint64_t v49 = v46 % (v47 + 1);
          }
          ++v47;
        }
        while (v48 != v51);
      }
    }
    uint64_t v52 = *MEMORY[0x1E4F78DF8];
    v145[0] = *MEMORY[0x1E4F78E00];
    v145[1] = v52;
    v146[0] = &unk_1EFB3A9E8;
    v146[1] = &unk_1EFB3AA00;
    v145[2] = *MEMORY[0x1E4F78DF0];
    v53 = [NSNumber numberWithUnsignedInteger:v37];
    v146[2] = v53;
    v145[3] = *MEMORY[0x1E4F78E18];
    v54 = [NSNumber numberWithUnsignedInteger:v7 - 1];
    v146[3] = v54;
    v145[4] = *MEMORY[0x1E4F78DE0];
    v55 = [NSNumber numberWithUnsignedInteger:v42];
    v146[4] = v55;
    v145[5] = *MEMORY[0x1E4F78DE8];
    v56 = [NSNumber numberWithUnsignedInteger:v50];
    v146[5] = v56;
    v145[6] = *MEMORY[0x1E4F78E10];
    int v57 = [NSNumber numberWithUnsignedInteger:v113];
    v146[6] = v57;
    v145[7] = *MEMORY[0x1E4F78E08];
    LODWORD(v58) = 973279855;
    v59 = [NSNumber numberWithFloat:v58];
    v146[7] = v59;
    v112 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v146 forKeys:v145 count:8];

    CFTypeRef cf = (CFTypeRef)MLPModelTrainerCreate();
    if (cf)
    {
      v60 = [NLDataEnumerator alloc];
      v61 = [v126 dataProviderOfType:0];
      v107 = [(NLDataEnumerator *)v60 initWithDataProvider:v61];

      v106 = [MEMORY[0x1E4F1CA60] dictionary];
      v105 = [MEMORY[0x1E4F1CA60] dictionary];
      double Current = CFAbsoluteTimeGetCurrent();
      if ([v126 numberOfValidationInstances])
      {
        id v63 = [NLDataEnumerator alloc];
        id v64 = [v126 dataProviderOfType:1];
        v108 = [(NLDataEnumerator *)v63 initWithDataProvider:v64];
      }
      else
      {
        v108 = 0;
      }
      reportInstanceCompletionToTrainer(v129, v115 - 1, v115, 2);
      v65 = NSString;
      v66 = [(__CFString *)v128 lowercaseString];
      uint64_t v67 = [v65 stringWithFormat:@"Starting %@ transfer training with %llu training samples and %llu validation samples", v66, v115, v8];
      [v129 logMessage:v67];

      id v68 = (void *)MEMORY[0x1AD0BB930]();
      v69 = NLGetLogCategory(0);
      v70 = [v69 internal];

      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = 0;
        _os_log_impl(&dword_1A6419000, v70, OS_LOG_TYPE_INFO, "event: %lu", buf, 0xCu);
      }

      if ([&unk_1EFB3AAC0 count])
      {
        unint64_t v71 = 0;
        do
        {
          v72 = (void *)MEMORY[0x1AD0BB930]();
          v73 = NLGetLogCategory(0);
          v74 = [v73 internal];

          if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
          {
            id v75 = [&unk_1EFB3AAC0 objectAtIndexedSubscript:v71];
            uint64_t v76 = [v75 UTF8String];
            *(_DWORD *)buf = 134218498;
            *(void *)&buf[4] = 1;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v71;
            *(_WORD *)&buf[22] = 2082;
            *(void *)&buf[24] = v76;
            _os_log_impl(&dword_1A6419000, v74, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %{public}s", buf, 0x20u);
          }
          ++v71;
        }
        while (v71 < [&unk_1EFB3AAC0 count]);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)&buf[24] = __Block_byref_object_copy__3;
      *(void *)&long long v162 = __Block_byref_object_dispose__3;
      *((void *)&v162 + 1) = &unk_1EFB3AAE8;
      v140[0] = 0;
      v140[1] = v140;
      v140[2] = 0x3032000000;
      v140[3] = __Block_byref_object_copy__3;
      v140[4] = __Block_byref_object_dispose__3;
      id v141 = 0;
      id v135 = v125;
      id v136 = v110;
      id v137 = v123;
      v138 = v107;
      id v139 = v106;
      id v77 = v105;
      v78 = v138;
      id v79 = v135;
      id v24 = v136;
      id v133 = v137;
      id v114 = v139;
      id v134 = v129;
      id v80 = v134;
      v132 = v80;
      id v81 = (const void *)MLPModelTrainerTrainModel();
      id v82 = (void *)MEMORY[0x1AD0BB930]();
      uint64_t v83 = NLGetLogCategory(0);
      v84 = [v83 internal];

      if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v143 = 134217984;
        uint64_t v144 = 3;
        _os_log_impl(&dword_1A6419000, v84, OS_LOG_TYPE_INFO, "event: %lu", v143, 0xCu);
      }

      uint64_t v85 = [NSString stringWithFormat:@"Finished transfer training in %.2f seconds", CFAbsoluteTimeGetCurrent() - Current];
      [v80 logMessage:v85];

      if (v81)
      {
        v86 = (const void *)NLModelContainerCopyContainerData();
        CFRelease(v81);
      }
      else
      {
        v86 = 0;
      }
      CFRelease(cf);

      _Block_object_dispose(v140, 8);
      _Block_object_dispose(buf, 8);

      if (!v86)
      {
        uint64_t v25 = 0;
        v125 = v79;
        goto LABEL_109;
      }
      uint64_t v87 = (void *)MEMORY[0x1E4F1CA60];
      v88 = [NSNumber numberWithUnsignedInteger:v115];
      v112 = objc_msgSend(v87, "dictionaryWithObjectsAndKeys:", v88, 0x1EFB30650, v128, 0x1EFB30690, 0);

      if (v127) {
        [v112 setObject:v127 forKey:0x1EFB30610];
      }
      if (v24)
      {
        uint64_t v89 = [v24 identifier];
        [v112 setObject:v89 forKey:0x1EFB306B0];
      }
      v90 = [(NLModelImplX *)self initWithModelData:v86 configuration:v130 labelMap:v121 vocabularyMap:0 documentFrequencyMap:0 customEmbeddingData:v122 trainingInfo:v112 error:0];
      CFRelease(v86);
      uint64_t v25 = v90;
      self = v25;
    }
    else
    {
      uint64_t v25 = 0;
      if (a4 && v142)
      {
        uint64_t v25 = 0;
        *a4 = v142;
      }
    }

    id v24 = v110;
LABEL_109:
    uint64_t v26 = v109;
    goto LABEL_144;
  }
  v125 = v14;
  uint64_t v26 = 0;
  uint64_t v25 = 0;
LABEL_144:

  return v25;
}

CFMutableDictionaryRef __43__NLModelImplX_initWithModelTrainer_error___block_invoke(void **a1, void *a2, unsigned int a3, int a4, unsigned char *a5)
{
  uint64_t v5 = 9;
  if (a1[7] == a2) {
    uint64_t v5 = 8;
  }
  return copySampleDataEnumerator_1(a2, a3, a4, a1[4], a1[5], a1[6], a1[v5], a1[7] == a2, a5);
}

void __43__NLModelImplX_initWithModelTrainer_error___block_invoke_2(uint64_t a1, unsigned int a2, void *a3, unsigned char *a4)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = (void *)MEMORY[0x1E4F78E20];
  unint64_t v8 = [a3 objectForKey:*MEMORY[0x1E4F78E20]];
  id v9 = *(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
  if (!*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) || objc_msgSend(v8, "compare:") == 1)
  {
    id v27 = *(id *)(a1 + 32);
    id v28 = *(id *)(a1 + 40);
    id v29 = *(id *)(a1 + 48);
    id v30 = *(id *)(a1 + 56);
    id v31 = *(id *)(a1 + 64);
    uint64_t v10 = [(id)MLPModelTrainerEvaluateModel() objectForKey:*v7];

    id v9 = (id)v10;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v9);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v8);
  v11 = *(void **)(a1 + 72);
  v12 = NSString;
  [v8 floatValue];
  id v14 = objc_msgSend(v12, "stringWithFormat:", @"Iteration %llu validation accuracy %.6f", a2 + 1, v13 / 100.0);
  [v11 logMessage:v14];

  id v15 = (void *)MEMORY[0x1AD0BB930]();
  id v16 = NLGetLogCategory(0);
  uint64_t v17 = [v16 internal];

  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(void *)&double v18 = *(void *)(a1 + 104) - a2;
    *(_DWORD *)buf = 134218496;
    uint64_t v33 = 2;
    __int16 v34 = 2048;
    uint64_t v35 = 0;
    __int16 v36 = 2048;
    double v37 = v18;
    _os_log_impl(&dword_1A6419000, v17, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %llu", buf, 0x20u);
  }

  v19 = (void *)MEMORY[0x1AD0BB930]();
  id v20 = NLGetLogCategory(0);
  uint64_t v21 = [v20 internal];

  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    [v9 floatValue];
    *(_DWORD *)buf = 134218496;
    uint64_t v33 = 2;
    __int16 v34 = 2048;
    uint64_t v35 = 1;
    __int16 v36 = 2048;
    double v37 = v22 / 100.0;
    _os_log_impl(&dword_1A6419000, v21, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %f", buf, 0x20u);
  }

  v23 = (void *)MEMORY[0x1AD0BB930]();
  id v24 = NLGetLogCategory(0);
  uint64_t v25 = [v24 internal];

  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    [v8 floatValue];
    *(_DWORD *)buf = 134218496;
    uint64_t v33 = 2;
    __int16 v34 = 2048;
    uint64_t v35 = 2;
    __int16 v36 = 2048;
    double v37 = v26 / 100.0;
    _os_log_impl(&dword_1A6419000, v25, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %f", buf, 0x20u);
  }

  if ([*(id *)(a1 + 72) shouldStop]) {
    *a4 = 1;
  }
}

CFMutableDictionaryRef __43__NLModelImplX_initWithModelTrainer_error___block_invoke_3(void **a1, uint64_t a2, unsigned int a3, int a4, unsigned char *a5)
{
  return copySampleDataEnumerator_1(a1[4], a3, a4, a1[5], a1[6], a1[7], a1[8], 1, a5);
}

uint64_t __43__NLModelImplX_initWithModelTrainer_error___block_invoke_92(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) shouldStop];
  if (result) {
    *a3 = 1;
  }
  return result;
}

- (void)dealloc
{
  montrealModel = self->_montrealModel;
  if (montrealModel) {
    CFRelease(montrealModel);
  }
  v4.receiver = self;
  v4.super_class = (Class)NLModelImplX;
  [(NLModelImplX *)&v4 dealloc];
}

- (id)modelData
{
  return self->_modelData;
}

- (id)configuration
{
  return self->_configuration;
}

- (unint64_t)systemVersion
{
  v3 = [(NLModelImplX *)self configuration];
  objc_super v4 = [v3 options];

  uint64_t v5 = stringForKeyWithDefault(v4, @"EmbeddingType", 0);
  if ([v5 isEqualToString:@"Contextual"])
  {
    uint64_t v6 = [(NLModelImplX *)self configuration];
    unint64_t v7 = [v6 language];

    unint64_t v8 = +[NLContextualEmbedding systemVersionForLanguage:v7];
  }
  else
  {
    unint64_t v8 = 2;
  }

  return v8;
}

- (id)labelMap
{
  return self->_labelMap;
}

- (id)customEmbeddingData
{
  return self->_customEmbeddingData;
}

- (unint64_t)numberOfTrainingInstances
{
  return self->_numberOfTrainingInstances;
}

- (id)trainingInfo
{
  v3 = (void *)MEMORY[0x1E4F1CA60];
  objc_super v4 = [NSNumber numberWithUnsignedInteger:self->_numberOfTrainingInstances];
  uint64_t v5 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, 0x1EFB30650, self->_trainingEmbeddingType, 0x1EFB30690, 0);

  trainingLanguage = self->_trainingLanguage;
  if (trainingLanguage) {
    [v5 setObject:trainingLanguage forKey:0x1EFB30610];
  }
  embeddingModelIdentifier = self->_embeddingModelIdentifier;
  if (embeddingModelIdentifier) {
    [v5 setObject:embeddingModelIdentifier forKey:0x1EFB306B0];
  }

  return v5;
}

- (float)outputForString:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  contextualEmbedding = self->_contextualEmbedding;
  uint64_t v6 = inputSequenceFromSentence(v4, 0);
  unint64_t v7 = v6;
  if (contextualEmbedding) {
    normalizedQuoteTokens(v6);
  }
  else {
  unint64_t v8 = formattedTokens(v6);
  }

  id embedding = self->_contextualEmbedding;
  if (embedding)
  {
    v20[0] = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    id v19 = v4;
    v11 = (void *)MEMORY[0x1E4F1C978];
    v12 = &v19;
  }
  else
  {
    id embedding = self->_embedding;
    if (!embedding)
    {
LABEL_13:
      Output = 0;
      goto LABEL_14;
    }
    double v18 = v8;
    uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
    id v17 = v4;
    v11 = (void *)MEMORY[0x1E4F1C978];
    v12 = &v17;
  }
  float v13 = [v11 arrayWithObjects:v12 count:1];
  id embedding = [embedding vectorsForTokenizedSentences:v10 untokenizedSentences:v13 maxTokens:50];

  if (self->_montrealModel) {
    BOOL v14 = embedding == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14) {
    goto LABEL_13;
  }
  id embedding = embedding;
  [embedding bytes];
  MRLNeuralNetworkSetInput();
  MRLNeuralNetworkPredict();
  Output = (float *)MRLNeuralNetworkGetOutput();
LABEL_14:

  return Output;
}

- (id)predictedLabelForString:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSDictionary *)self->_labelMap count];
  uint64_t v6 = [(NLModelImplX *)self outputForString:v4];
  if (v6)
  {
    if (v5)
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      double v7 = 0.0;
      do
      {
        if (v6[v9] > *(float *)&v7)
        {
          uint64_t v8 = v9;
          *(float *)&double v7 = v6[v9];
        }
        ++v9;
      }
      while (v5 != v9);
      uint64_t v10 = v8 + 1;
    }
    else
    {
      uint64_t v10 = 1;
    }
    labelMap = self->_labelMap;
    float v13 = objc_msgSend(NSNumber, "numberWithInteger:", v10, v7);
    v11 = [(NSDictionary *)labelMap objectForKey:v13];
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)predictedLabelsForTokens:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [v4 componentsJoinedByString:@" "];
  uint64_t v6 = [(NLModelImplX *)self predictedLabelForString:v5];

  double v7 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 count])
  {
    unint64_t v8 = 0;
    if (v6) {
      uint64_t v9 = v6;
    }
    else {
      uint64_t v9 = &stru_1EFB303D0;
    }
    do
    {
      [v7 addObject:v9];
      ++v8;
    }
    while (v8 < [v4 count]);
  }

  return v7;
}

- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4
{
  unint64_t v18 = a4;
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  NSUInteger v7 = [(NSDictionary *)self->_labelMap count];
  id v19 = v5;
  unint64_t v8 = [(NLModelImplX *)self outputForString:v5];
  if (v8 && v7)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    do
    {
      labelMap = self->_labelMap;
      uint64_t v12 = v10 + 1;
      float v13 = objc_msgSend(NSNumber, "numberWithInteger:", v10 + 1, v18);
      BOOL v14 = [(NSDictionary *)labelMap objectForKey:v13];

      if (v14)
      {
        id v15 = [NSNumber numberWithDouble:v9[v10]];
        [v6 setObject:v15 forKey:v14];
      }
      ++v10;
    }
    while (v7 != v12);
  }
  id v16 = topHypotheses(v6, v18);

  return v16;
}

- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4
{
  id v6 = a3;
  NSUInteger v7 = [v6 componentsJoinedByString:@" "];
  unint64_t v8 = [(NLModelImplX *)self predictedLabelHypothesesForString:v7 maximumCount:a4];

  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  if ([v6 count])
  {
    unint64_t v10 = 0;
    if (v8) {
      v11 = v8;
    }
    else {
      v11 = (void *)MEMORY[0x1E4F1CC08];
    }
    do
    {
      [v9 addObject:v11];
      ++v10;
    }
    while (v10 < [v6 count]);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelData, 0);
  objc_storeStrong((id *)&self->_embeddingModelIdentifier, 0);
  objc_storeStrong((id *)&self->_trainingEmbeddingType, 0);
  objc_storeStrong((id *)&self->_trainingLanguage, 0);
  objc_storeStrong((id *)&self->_labelMap, 0);
  objc_storeStrong((id *)&self->_customEmbeddingData, 0);
  objc_storeStrong((id *)&self->_contextualEmbedding, 0);
  objc_storeStrong((id *)&self->_embedding, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end