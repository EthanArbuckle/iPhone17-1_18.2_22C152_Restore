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
  id v112 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v110 = a4;
  id v109 = 0;
  objc_storeStrong(&v109, a5);
  id v5 = v112;
  id v112 = 0;
  v108.receiver = v5;
  v108.super_class = (Class)AMDDODMLModelMetadata;
  v83 = [(AMDDODMLModelMetadata *)&v108 init];
  id v112 = v83;
  objc_storeStrong(&v112, v83);
  if (!v83) {
    goto LABEL_82;
  }
  id v80 = [location[0] parameters];
  id v107 = [v80 stringValueForKey:ModelFileNameKey defaultValue:0];

  if (!v107)
  {
    id v6 = objc_alloc((Class)NSError);
    id v7 = [v6 initWithDomain:v109 code:1 userInfo:0];
    id *v110 = v7;
    id v113 = 0;
    int v106 = 1;
    goto LABEL_81;
  }
  id v79 = [location[0] attachments];
  id v105 = [v79 attachmentURLsForBasename:v107];

  if ([v105 count])
  {
    if ((unint64_t)[v105 count] > 1)
    {
      id v10 = objc_alloc((Class)NSError);
      id v11 = [v10 initWithDomain:v109 code:3 userInfo:0];
      id *v110 = v11;
      id v113 = 0;
      int v106 = 1;
      goto LABEL_80;
    }
    id v77 = [v105 objectAtIndexedSubscript:0];
    id v76 = [v77 path];
    objc_msgSend(v112, "setModelPath:");

    id v78 = [location[0] parameters];
    id v104 = [v78 objectForKeyedSubscript:InputNamesKey];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v104 count])
    {
      id v12 = objc_alloc((Class)NSError);
      id v13 = [v12 initWithDomain:v109 code:4 userInfo:0];
      id *v110 = v13;
      id v113 = 0;
      int v106 = 1;
LABEL_79:
      objc_storeStrong(&v104, 0);
      goto LABEL_80;
    }
    [v112 setInputNames:v104];
    id v75 = [location[0] parameters];
    id v103 = [v75 objectForKeyedSubscript:OutputNamesKey];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v103 count])
    {
      id v14 = objc_alloc((Class)NSError);
      id v15 = [v14 initWithDomain:v109 code:5 userInfo:0];
      id *v110 = v15;
      id v113 = 0;
      int v106 = 1;
LABEL_78:
      objc_storeStrong(&v103, 0);
      goto LABEL_79;
    }
    [v112 setOutputNames:v103];
    id v74 = [location[0] parameters];
    id v102 = [v74 objectForKeyedSubscript:WeightNamesKey];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v102 count])
    {
      id v16 = objc_alloc((Class)NSError);
      id v17 = [v16 initWithDomain:v109 code:6 userInfo:0];
      id *v110 = v17;
      id v113 = 0;
      int v106 = 1;
LABEL_77:
      objc_storeStrong(&v102, 0);
      goto LABEL_78;
    }
    [v112 setWeightNames:v102];
    id v72 = [location[0] parameters];
    uint64_t v73 = (uint64_t)[v72 unsignedIntegerValueForKey:BatchSizeKey defaultValue:1];

    uint64_t v101 = v73;
    if (v73 < 1)
    {
      id v18 = objc_alloc((Class)NSError);
      id v19 = [v18 initWithDomain:v109 code:7 userInfo:0];
      id *v110 = v19;
      id v113 = 0;
      int v106 = 1;
      goto LABEL_77;
    }
    [v112 setBatchSize:v101];
    id v70 = [location[0] parameters];
    uint64_t v71 = (uint64_t)[v70 unsignedIntegerValueForKey:NumLocalIterationsKey defaultValue:1];

    uint64_t v100 = v71;
    if (v71 < 1)
    {
      id v20 = objc_alloc((Class)NSError);
      id v21 = [v20 initWithDomain:v109 code:8 userInfo:0];
      id *v110 = v21;
      id v113 = 0;
      int v106 = 1;
      goto LABEL_77;
    }
    [v112 setNumLocalIterations:v100];
    id v67 = [location[0] parameters];
    id v68 = [v67 unsignedIntegerValueForKey:NumEpochsKey defaultValue:0];

    v99[1] = v68;
    [v112 setNumEpochs:v68];
    id v69 = [location[0] parameters];
    [v69 floatValueForKey:LearningRateKey defaultValue:0.0];
    v99[0] = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");

    [v99[0] floatValue];
    if (v22 < 0.0)
    {
      id v23 = objc_alloc((Class)NSError);
      id v24 = [v23 initWithDomain:v109 code:9 userInfo:0];
      id *v110 = v24;
      id v113 = 0;
      int v106 = 1;
LABEL_76:
      objc_storeStrong(v99, 0);
      goto LABEL_77;
    }
    [v112 setLearningRate:v99[0]];
    id v66 = [location[0] parameters];
    id v98 = [v66 stringValueForKey:InitFunctionNameKey defaultValue:InitFunctionDefaultName];

    if (![v98 length])
    {
      id v25 = objc_alloc((Class)NSError);
      id v26 = [v25 initWithDomain:v109 code:10 userInfo:0];
      id *v110 = v26;
      id v113 = 0;
      int v106 = 1;
LABEL_75:
      objc_storeStrong(&v98, 0);
      goto LABEL_76;
    }
    [v112 setInitializationFunctionName:v98];
    id v65 = [location[0] parameters];
    id v97 = [v65 stringValueForKey:TrainingModeBufferNameKey defaultValue:TrainingModeBufferDefaultName];

    if (![v97 length])
    {
      id v27 = objc_alloc((Class)NSError);
      id v28 = [v27 initWithDomain:v109 code:11 userInfo:0];
      id *v110 = v28;
      id v113 = 0;
      int v106 = 1;
LABEL_74:
      objc_storeStrong(&v97, 0);
      goto LABEL_75;
    }
    [v112 setTrainingModeBufferName:v97];
    id v64 = [location[0] parameters];
    id v96 = [v64 stringValueForKey:LearningRateBufferNameKey defaultValue:LearningRateBufferDefaultName];

    if (![v96 length])
    {
      id v29 = objc_alloc((Class)NSError);
      id v30 = [v29 initWithDomain:v109 code:12 userInfo:0];
      id *v110 = v30;
      id v113 = 0;
      int v106 = 1;
LABEL_73:
      objc_storeStrong(&v96, 0);
      goto LABEL_74;
    }
    [v112 setLearningRateBufferName:v96];
    id v63 = [location[0] parameters];
    id v95 = [v63 stringValueForKey:LossNameKey defaultValue:0];

    if (!v95)
    {
      id v31 = objc_alloc((Class)NSError);
      id v32 = [v31 initWithDomain:v109 code:18 userInfo:0];
      id *v110 = v32;
      id v113 = 0;
      int v106 = 1;
LABEL_72:
      objc_storeStrong(&v95, 0);
      goto LABEL_73;
    }
    id v61 = [v112 outputNames];
    unsigned __int8 v62 = [v61 containsObject:v95];

    if ((v62 & 1) == 0)
    {
      id v33 = objc_alloc((Class)NSError);
      id v34 = [v33 initWithDomain:v109 code:19 userInfo:0];
      id *v110 = v34;
      id v113 = 0;
      int v106 = 1;
      goto LABEL_72;
    }
    [v112 setLossName:v95];
    id v60 = [location[0] parameters];
    id v94 = [v60 objectForKeyedSubscript:InitializeManually];

    if (!v94)
    {
      id v94 = +[NSNumber numberWithLong:0];
    }
    [v112 setInitializeManually:v94];
    id v59 = [location[0] parameters];
    id v93 = [v59 objectForKeyedSubscript:UseCoreMLTrainer];

    if (!v93)
    {
      id v93 = +[NSNumber numberWithLong:0];
    }
    [v112 setUseCoreMLTrainer:v93];
    id v58 = [location[0] parameters];
    id v92 = [v58 objectForKeyedSubscript:LearningRateScheduleKey];

    if (v92)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v35 = objc_alloc((Class)NSError);
        id v36 = [v35 initWithDomain:v109 code:131 userInfo:0];
        id *v110 = v36;
        id v113 = 0;
        int v106 = 1;
LABEL_71:
        objc_storeStrong(&v92, 0);
        objc_storeStrong(&v93, 0);
        objc_storeStrong(&v94, 0);
        goto LABEL_72;
      }
    }
    if (v92)
    {
      id v57 = [v92 count];
      if (v57 != [v112 numLocalIterations])
      {
        id v37 = objc_alloc((Class)NSError);
        id v38 = [v37 initWithDomain:v109 code:132 userInfo:0];
        id *v110 = v38;
        id v113 = 0;
        int v106 = 1;
        goto LABEL_71;
      }
    }
    [v112 setLearningRateSchedule:v92];
    id v52 = [location[0] parameters];
    id v91 = [v52 objectForKeyedSubscript:ShortenedEmbeddingNames];

    id v53 = [location[0] parameters];
    id v90 = [v53 objectForKeyedSubscript:ShortenedEmbeddingMappingKeys];

    id v54 = [location[0] parameters];
    id v89 = [v54 objectForKeyedSubscript:ShortenedEmbeddingSize];

    id v55 = [location[0] parameters];
    id v88 = [v55 objectForKeyedSubscript:ShortenedEmbeddingNumberVectorsBefore];

    id v56 = [location[0] parameters];
    id v87 = [v56 objectForKeyedSubscript:ShortenedEmbeddingNumberVectorsAfter];

    if (v91 || v90 || v89 || v88 || v87)
    {
      if (!v91
        || !v90
        || !v89
        || !v88
        || !v87
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v39 = objc_alloc((Class)NSError);
        id v40 = [v39 initWithDomain:v109 code:109 userInfo:0];
        id *v110 = v40;
        id v113 = 0;
        int v106 = 1;
LABEL_70:
        objc_storeStrong(&v87, 0);
        objc_storeStrong(&v88, 0);
        objc_storeStrong(&v89, 0);
        objc_storeStrong(&v90, 0);
        objc_storeStrong(&v91, 0);
        goto LABEL_71;
      }
      [v112 setShortenedEmbeddingNames:v91];
      [v112 setShortenedEmbeddingMappingKeys:v90];
      [v112 setShortenedEmbeddingSize:v89];
      [v112 setShortenedEmbeddingNumberVectorsBefore:v88];
      [v112 setShortenedEmbeddingNumberVectorsAfter:v87];
    }
    else
    {
      id v47 = objc_alloc_init((Class)NSDictionary);
      objc_msgSend(v112, "setShortenedEmbeddingNames:");

      id v48 = objc_alloc_init((Class)NSDictionary);
      objc_msgSend(v112, "setShortenedEmbeddingMappingKeys:");

      id v49 = objc_alloc_init((Class)NSDictionary);
      objc_msgSend(v112, "setShortenedEmbeddingSize:");

      id v50 = objc_alloc_init((Class)NSDictionary);
      objc_msgSend(v112, "setShortenedEmbeddingNumberVectorsBefore:");

      id v51 = objc_alloc_init((Class)NSDictionary);
      objc_msgSend(v112, "setShortenedEmbeddingNumberVectorsAfter:");
    }
    id v46 = [location[0] parameters];
    id v86 = [v46 objectForKeyedSubscript:MetricsNamesKey];

    if (!v86 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v85 = +[NSSet setWithArray:v86];
      id v84 = +[NSSet setWithArray:v103];
      if ([v85 isSubsetOfSet:v84])
      {
        [v112 setMetricsNames:v86];
        int v106 = 0;
      }
      else
      {
        id v43 = objc_alloc((Class)NSError);
        id v44 = [v43 initWithDomain:v109 code:61 userInfo:0];
        id *v110 = v44;
        id v113 = 0;
        int v106 = 1;
      }
      objc_storeStrong(&v84, 0);
      objc_storeStrong(&v85, 0);
    }
    else
    {
      id v41 = objc_alloc((Class)NSError);
      id v42 = [v41 initWithDomain:v109 code:60 userInfo:0];
      id *v110 = v42;
      id v113 = 0;
      int v106 = 1;
    }
    objc_storeStrong(&v86, 0);
    goto LABEL_70;
  }
  id v8 = objc_alloc((Class)NSError);
  id v9 = [v8 initWithDomain:v109 code:2 userInfo:0];
  id *v110 = v9;
  id v113 = 0;
  int v106 = 1;
LABEL_80:
  objc_storeStrong(&v105, 0);
LABEL_81:
  objc_storeStrong(&v107, 0);
  if (!v106)
  {
LABEL_82:
    id v113 = v112;
    int v106 = 1;
  }
  objc_storeStrong(&v109, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v112, 0);
  return v113;
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