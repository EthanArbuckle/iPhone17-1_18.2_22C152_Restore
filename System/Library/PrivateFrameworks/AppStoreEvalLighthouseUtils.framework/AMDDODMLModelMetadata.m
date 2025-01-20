@interface AMDDODMLModelMetadata
- (NSArray)inputNames;
- (NSArray)learningRateSchedule;
- (NSArray)metricsNames;
- (NSArray)outputNames;
- (NSArray)weightNames;
- (NSDictionary)shortenedEmbeddingMappingKeys;
- (NSDictionary)shortenedEmbeddingNames;
- (NSDictionary)shortenedEmbeddingNumberVectorsAfter;
- (NSDictionary)shortenedEmbeddingNumberVectorsBefore;
- (NSDictionary)shortenedEmbeddingSize;
- (NSNumber)initializeManually;
- (NSNumber)learningRate;
- (NSNumber)useCoreMLTrainer;
- (NSString)initializationFunctionName;
- (NSString)learningRateBufferName;
- (NSString)lossName;
- (NSString)modelPath;
- (NSString)trainingModeBufferName;
- (id)initModelMetadata:(id)a3 error:(id *)a4 errorDomain:(id)a5;
- (int64_t)batchSize;
- (int64_t)numEpochs;
- (int64_t)numLocalIterations;
- (void)setBatchSize:(int64_t)a3;
- (void)setInitializationFunctionName:(id)a3;
- (void)setInitializeManually:(id)a3;
- (void)setInputNames:(id)a3;
- (void)setLearningRate:(id)a3;
- (void)setLearningRateBufferName:(id)a3;
- (void)setLearningRateSchedule:(id)a3;
- (void)setLossName:(id)a3;
- (void)setMetricsNames:(id)a3;
- (void)setModelPath:(id)a3;
- (void)setNumEpochs:(int64_t)a3;
- (void)setNumLocalIterations:(int64_t)a3;
- (void)setOutputNames:(id)a3;
- (void)setShortenedEmbeddingMappingKeys:(id)a3;
- (void)setShortenedEmbeddingNames:(id)a3;
- (void)setShortenedEmbeddingNumberVectorsAfter:(id)a3;
- (void)setShortenedEmbeddingNumberVectorsBefore:(id)a3;
- (void)setShortenedEmbeddingSize:(id)a3;
- (void)setTrainingModeBufferName:(id)a3;
- (void)setUseCoreMLTrainer:(id)a3;
- (void)setWeightNames:(id)a3;
@end

@implementation AMDDODMLModelMetadata

- (id)initModelMetadata:(id)a3 error:(id *)a4 errorDomain:(id)a5
{
  id v113 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v111 = a4;
  id v110 = 0;
  objc_storeStrong(&v110, a5);
  id v5 = v113;
  id v113 = 0;
  v109.receiver = v5;
  v109.super_class = (Class)AMDDODMLModelMetadata;
  v84 = [(AMDDODMLModelMetadata *)&v109 init];
  id v113 = v84;
  objc_storeStrong(&v113, v84);
  if (!v84) {
    goto LABEL_82;
  }
  id v81 = (id)[location[0] parameters];
  id v108 = (id)[v81 stringValueForKey:ModelFileNameKey defaultValue:0];

  if (!v108)
  {
    id v6 = objc_alloc(MEMORY[0x263F087E8]);
    id v7 = (id)[v6 initWithDomain:v110 code:1 userInfo:0];
    id *v111 = v7;
    id v114 = 0;
    int v107 = 1;
    goto LABEL_81;
  }
  id v80 = (id)[location[0] attachments];
  id v106 = (id)[v80 attachmentURLsForBasename:v108];

  if ([v106 count])
  {
    if ((unint64_t)[v106 count] > 1)
    {
      id v10 = objc_alloc(MEMORY[0x263F087E8]);
      id v11 = (id)[v10 initWithDomain:v110 code:3 userInfo:0];
      id *v111 = v11;
      id v114 = 0;
      int v107 = 1;
      goto LABEL_80;
    }
    id v78 = (id)[v106 objectAtIndexedSubscript:0];
    id v77 = (id)[v78 path];
    objc_msgSend(v113, "setModelPath:");

    id v79 = (id)[location[0] parameters];
    id v105 = (id)[v79 objectForKeyedSubscript:InputNamesKey];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v105 count])
    {
      id v12 = objc_alloc(MEMORY[0x263F087E8]);
      id v13 = (id)[v12 initWithDomain:v110 code:4 userInfo:0];
      id *v111 = v13;
      id v114 = 0;
      int v107 = 1;
LABEL_79:
      objc_storeStrong(&v105, 0);
      goto LABEL_80;
    }
    [v113 setInputNames:v105];
    id v76 = (id)[location[0] parameters];
    id v104 = (id)[v76 objectForKeyedSubscript:OutputNamesKey];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v104 count])
    {
      id v14 = objc_alloc(MEMORY[0x263F087E8]);
      id v15 = (id)[v14 initWithDomain:v110 code:5 userInfo:0];
      id *v111 = v15;
      id v114 = 0;
      int v107 = 1;
LABEL_78:
      objc_storeStrong(&v104, 0);
      goto LABEL_79;
    }
    [v113 setOutputNames:v104];
    id v75 = (id)[location[0] parameters];
    id v103 = (id)[v75 objectForKeyedSubscript:WeightNamesKey];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v103 count])
    {
      id v16 = objc_alloc(MEMORY[0x263F087E8]);
      id v17 = (id)[v16 initWithDomain:v110 code:6 userInfo:0];
      id *v111 = v17;
      id v114 = 0;
      int v107 = 1;
LABEL_77:
      objc_storeStrong(&v103, 0);
      goto LABEL_78;
    }
    [v113 setWeightNames:v103];
    id v73 = (id)[location[0] parameters];
    uint64_t v74 = [v73 unsignedIntegerValueForKey:BatchSizeKey defaultValue:1];

    uint64_t v102 = v74;
    if (v74 < 1)
    {
      id v18 = objc_alloc(MEMORY[0x263F087E8]);
      id v19 = (id)[v18 initWithDomain:v110 code:7 userInfo:0];
      id *v111 = v19;
      id v114 = 0;
      int v107 = 1;
      goto LABEL_77;
    }
    [v113 setBatchSize:v102];
    id v71 = (id)[location[0] parameters];
    uint64_t v72 = [v71 unsignedIntegerValueForKey:NumLocalIterationsKey defaultValue:1];

    uint64_t v101 = v72;
    if (v72 < 1)
    {
      id v20 = objc_alloc(MEMORY[0x263F087E8]);
      id v21 = (id)[v20 initWithDomain:v110 code:8 userInfo:0];
      id *v111 = v21;
      id v114 = 0;
      int v107 = 1;
      goto LABEL_77;
    }
    [v113 setNumLocalIterations:v101];
    id v67 = (id)[location[0] parameters];
    v68 = (void *)[v67 unsignedIntegerValueForKey:NumEpochsKey defaultValue:0];

    v100[1] = v68;
    [v113 setNumEpochs:v68];
    v69 = NSNumber;
    id v70 = (id)[location[0] parameters];
    [v70 floatValueForKey:LearningRateKey defaultValue:0.0];
    v100[0] = (id)objc_msgSend(v69, "numberWithFloat:");

    [v100[0] floatValue];
    if (v22 < 0.0)
    {
      id v23 = objc_alloc(MEMORY[0x263F087E8]);
      id v24 = (id)[v23 initWithDomain:v110 code:9 userInfo:0];
      id *v111 = v24;
      id v114 = 0;
      int v107 = 1;
LABEL_76:
      objc_storeStrong(v100, 0);
      goto LABEL_77;
    }
    [v113 setLearningRate:v100[0]];
    id v66 = (id)[location[0] parameters];
    id v99 = (id)[v66 stringValueForKey:InitFunctionNameKey defaultValue:InitFunctionDefaultName];

    if (![v99 length])
    {
      id v25 = objc_alloc(MEMORY[0x263F087E8]);
      id v26 = (id)[v25 initWithDomain:v110 code:10 userInfo:0];
      id *v111 = v26;
      id v114 = 0;
      int v107 = 1;
LABEL_75:
      objc_storeStrong(&v99, 0);
      goto LABEL_76;
    }
    [v113 setInitializationFunctionName:v99];
    id v65 = (id)[location[0] parameters];
    id v98 = (id)[v65 stringValueForKey:TrainingModeBufferNameKey defaultValue:TrainingModeBufferDefaultName];

    if (![v98 length])
    {
      id v27 = objc_alloc(MEMORY[0x263F087E8]);
      id v28 = (id)[v27 initWithDomain:v110 code:11 userInfo:0];
      id *v111 = v28;
      id v114 = 0;
      int v107 = 1;
LABEL_74:
      objc_storeStrong(&v98, 0);
      goto LABEL_75;
    }
    [v113 setTrainingModeBufferName:v98];
    id v64 = (id)[location[0] parameters];
    id v97 = (id)[v64 stringValueForKey:LearningRateBufferNameKey defaultValue:LearningRateBufferDefaultName];

    if (![v97 length])
    {
      id v29 = objc_alloc(MEMORY[0x263F087E8]);
      id v30 = (id)[v29 initWithDomain:v110 code:12 userInfo:0];
      id *v111 = v30;
      id v114 = 0;
      int v107 = 1;
LABEL_73:
      objc_storeStrong(&v97, 0);
      goto LABEL_74;
    }
    [v113 setLearningRateBufferName:v97];
    id v63 = (id)[location[0] parameters];
    id v96 = (id)[v63 stringValueForKey:LossNameKey defaultValue:0];

    if (!v96)
    {
      id v31 = objc_alloc(MEMORY[0x263F087E8]);
      id v32 = (id)[v31 initWithDomain:v110 code:18 userInfo:0];
      id *v111 = v32;
      id v114 = 0;
      int v107 = 1;
LABEL_72:
      objc_storeStrong(&v96, 0);
      goto LABEL_73;
    }
    id v61 = (id)[v113 outputNames];
    char v62 = [v61 containsObject:v96];

    if ((v62 & 1) == 0)
    {
      id v33 = objc_alloc(MEMORY[0x263F087E8]);
      id v34 = (id)[v33 initWithDomain:v110 code:19 userInfo:0];
      id *v111 = v34;
      id v114 = 0;
      int v107 = 1;
      goto LABEL_72;
    }
    [v113 setLossName:v96];
    id v60 = (id)[location[0] parameters];
    id v95 = (id)[v60 objectForKeyedSubscript:InitializeManually];

    if (!v95)
    {
      id v95 = (id)[NSNumber numberWithLong:0];
    }
    [v113 setInitializeManually:v95];
    id v59 = (id)[location[0] parameters];
    id v94 = (id)[v59 objectForKeyedSubscript:UseCoreMLTrainer];

    if (!v94)
    {
      id v94 = (id)[NSNumber numberWithLong:0];
    }
    [v113 setUseCoreMLTrainer:v94];
    id v58 = (id)[location[0] parameters];
    id v93 = (id)[v58 objectForKeyedSubscript:LearningRateScheduleKey];

    if (v93)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v35 = objc_alloc(MEMORY[0x263F087E8]);
        id v36 = (id)[v35 initWithDomain:v110 code:131 userInfo:0];
        id *v111 = v36;
        id v114 = 0;
        int v107 = 1;
LABEL_71:
        objc_storeStrong(&v93, 0);
        objc_storeStrong(&v94, 0);
        objc_storeStrong(&v95, 0);
        goto LABEL_72;
      }
    }
    if (v93)
    {
      uint64_t v57 = [v93 count];
      if (v57 != [v113 numLocalIterations])
      {
        id v37 = objc_alloc(MEMORY[0x263F087E8]);
        id v38 = (id)[v37 initWithDomain:v110 code:132 userInfo:0];
        id *v111 = v38;
        id v114 = 0;
        int v107 = 1;
        goto LABEL_71;
      }
    }
    [v113 setLearningRateSchedule:v93];
    id v52 = (id)[location[0] parameters];
    id v92 = (id)[v52 objectForKeyedSubscript:ShortenedEmbeddingNames];

    id v53 = (id)[location[0] parameters];
    id v91 = (id)[v53 objectForKeyedSubscript:ShortenedEmbeddingMappingKeys];

    id v54 = (id)[location[0] parameters];
    id v90 = (id)[v54 objectForKeyedSubscript:ShortenedEmbeddingSize];

    id v55 = (id)[location[0] parameters];
    id v89 = (id)[v55 objectForKeyedSubscript:ShortenedEmbeddingNumberVectorsBefore];

    id v56 = (id)[location[0] parameters];
    id v88 = (id)[v56 objectForKeyedSubscript:ShortenedEmbeddingNumberVectorsAfter];

    if (v92 || v91 || v90 || v89 || v88)
    {
      if (!v92
        || !v91
        || !v90
        || !v89
        || !v88
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v39 = objc_alloc(MEMORY[0x263F087E8]);
        id v40 = (id)[v39 initWithDomain:v110 code:109 userInfo:0];
        id *v111 = v40;
        id v114 = 0;
        int v107 = 1;
LABEL_70:
        objc_storeStrong(&v88, 0);
        objc_storeStrong(&v89, 0);
        objc_storeStrong(&v90, 0);
        objc_storeStrong(&v91, 0);
        objc_storeStrong(&v92, 0);
        goto LABEL_71;
      }
      [v113 setShortenedEmbeddingNames:v92];
      [v113 setShortenedEmbeddingMappingKeys:v91];
      [v113 setShortenedEmbeddingSize:v90];
      [v113 setShortenedEmbeddingNumberVectorsBefore:v89];
      [v113 setShortenedEmbeddingNumberVectorsAfter:v88];
    }
    else
    {
      id v47 = objc_alloc_init(NSDictionary);
      objc_msgSend(v113, "setShortenedEmbeddingNames:");

      id v48 = objc_alloc_init(NSDictionary);
      objc_msgSend(v113, "setShortenedEmbeddingMappingKeys:");

      id v49 = objc_alloc_init(NSDictionary);
      objc_msgSend(v113, "setShortenedEmbeddingSize:");

      id v50 = objc_alloc_init(NSDictionary);
      objc_msgSend(v113, "setShortenedEmbeddingNumberVectorsBefore:");

      id v51 = objc_alloc_init(NSDictionary);
      objc_msgSend(v113, "setShortenedEmbeddingNumberVectorsAfter:");
    }
    id v46 = (id)[location[0] parameters];
    id v87 = (id)[v46 objectForKeyedSubscript:MetricsNamesKey];

    if (!v87 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v86 = (id)[MEMORY[0x263EFFA08] setWithArray:v87];
      id v85 = (id)[MEMORY[0x263EFFA08] setWithArray:v104];
      if ([v86 isSubsetOfSet:v85])
      {
        [v113 setMetricsNames:v87];
        int v107 = 0;
      }
      else
      {
        id v43 = objc_alloc(MEMORY[0x263F087E8]);
        id v44 = (id)[v43 initWithDomain:v110 code:61 userInfo:0];
        id *v111 = v44;
        id v114 = 0;
        int v107 = 1;
      }
      objc_storeStrong(&v85, 0);
      objc_storeStrong(&v86, 0);
    }
    else
    {
      id v41 = objc_alloc(MEMORY[0x263F087E8]);
      id v42 = (id)[v41 initWithDomain:v110 code:60 userInfo:0];
      id *v111 = v42;
      id v114 = 0;
      int v107 = 1;
    }
    objc_storeStrong(&v87, 0);
    goto LABEL_70;
  }
  id v8 = objc_alloc(MEMORY[0x263F087E8]);
  id v9 = (id)[v8 initWithDomain:v110 code:2 userInfo:0];
  id *v111 = v9;
  id v114 = 0;
  int v107 = 1;
LABEL_80:
  objc_storeStrong(&v106, 0);
LABEL_81:
  objc_storeStrong(&v108, 0);
  if (!v107)
  {
LABEL_82:
    id v114 = v113;
    int v107 = 1;
  }
  objc_storeStrong(&v110, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v113, 0);
  return v114;
}

- (NSString)modelPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setModelPath:(id)a3
{
}

- (NSArray)inputNames
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInputNames:(id)a3
{
}

- (NSArray)outputNames
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutputNames:(id)a3
{
}

- (NSArray)weightNames
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWeightNames:(id)a3
{
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(int64_t)a3
{
  self->_batchSize = a3;
}

- (NSNumber)learningRate
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLearningRate:(id)a3
{
}

- (int64_t)numLocalIterations
{
  return self->_numLocalIterations;
}

- (void)setNumLocalIterations:(int64_t)a3
{
  self->_numLocalIterations = a3;
}

- (int64_t)numEpochs
{
  return self->_numEpochs;
}

- (void)setNumEpochs:(int64_t)a3
{
  self->_numEpochs = a3;
}

- (NSString)initializationFunctionName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInitializationFunctionName:(id)a3
{
}

- (NSString)trainingModeBufferName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTrainingModeBufferName:(id)a3
{
}

- (NSString)learningRateBufferName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLearningRateBufferName:(id)a3
{
}

- (NSString)lossName
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLossName:(id)a3
{
}

- (NSArray)metricsNames
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMetricsNames:(id)a3
{
}

- (NSDictionary)shortenedEmbeddingNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setShortenedEmbeddingNames:(id)a3
{
}

- (NSDictionary)shortenedEmbeddingMappingKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setShortenedEmbeddingMappingKeys:(id)a3
{
}

- (NSDictionary)shortenedEmbeddingNumberVectorsBefore
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setShortenedEmbeddingNumberVectorsBefore:(id)a3
{
}

- (NSDictionary)shortenedEmbeddingNumberVectorsAfter
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setShortenedEmbeddingNumberVectorsAfter:(id)a3
{
}

- (NSDictionary)shortenedEmbeddingSize
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setShortenedEmbeddingSize:(id)a3
{
}

- (NSNumber)initializeManually
{
  return (NSNumber *)objc_getProperty(self, a2, 152, 1);
}

- (void)setInitializeManually:(id)a3
{
}

- (NSNumber)useCoreMLTrainer
{
  return (NSNumber *)objc_getProperty(self, a2, 160, 1);
}

- (void)setUseCoreMLTrainer:(id)a3
{
}

- (NSArray)learningRateSchedule
{
  return (NSArray *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLearningRateSchedule:(id)a3
{
}

- (void).cxx_destruct
{
}

@end