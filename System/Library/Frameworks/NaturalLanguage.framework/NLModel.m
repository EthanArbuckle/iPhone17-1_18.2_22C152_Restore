@interface NLModel
+ (NLModel)modelWithContentsOfURL:(NSURL *)url error:(NSError *)error;
+ (NLModel)modelWithData:(id)a3 error:(id *)a4;
+ (NLModel)modelWithMLModel:(MLModel *)mlModel error:(NSError *)error;
- (BOOL)writeMLModelToURL:(id)a3 atomically:(BOOL)a4 error:(id *)a5;
- (BOOL)writeMLModelToURL:(id)a3 options:(id)a4 error:(id *)a5;
- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4 error:(id *)a5;
- (NLModel)initWithClassifierMLModel:(id)a3;
- (NLModel)initWithConfiguration:(id)a3 modelImpl:(id)a4;
- (NLModel)initWithContentsOfURL:(id)a3 error:(id *)a4;
- (NLModel)initWithData:(id)a3 error:(id *)a4;
- (NLModel)initWithData:(id)a3 mlModel:(id)a4 error:(id *)a5;
- (NLModel)initWithMLModel:(id)a3 error:(id *)a4;
- (NLModelConfiguration)configuration;
- (NSArray)predictedLabelHypothesesForTokens:(NSArray *)tokens maximumCount:(NSUInteger)maximumCount;
- (NSArray)predictedLabelsForTokens:(NSArray *)tokens;
- (NSDictionary)predictedLabelHypothesesForString:(NSString *)string maximumCount:(NSUInteger)maximumCount;
- (NSString)predictedLabelForString:(NSString *)string;
- (id)classifierTestResultsWithDataProvider:(id)a3;
- (id)data;
- (id)documentFrequencyMap;
- (id)embedding;
- (id)embeddingData;
- (id)gazetteer;
- (id)labelArray;
- (id)labelMap;
- (id)mlModel;
- (id)predictedLabelArraysForTokenArrays:(id)a3;
- (id)sequenceTestResultsWithDataProvider:(id)a3;
- (id)testResultsWithDataProvider:(id)a3;
- (id)testResultsWithDataSet:(id)a3;
- (id)vocabularyMap;
- (unint64_t)systemVersion;
- (void)dealloc;
@end

@implementation NLModel

+ (NLModel)modelWithContentsOfURL:(NSURL *)url error:(NSError *)error
{
  v6 = url;
  v7 = (void *)[objc_alloc((Class)a1) initWithContentsOfURL:v6 error:error];

  return (NLModel *)v7;
}

+ (NLModel)modelWithMLModel:(MLModel *)mlModel error:(NSError *)error
{
  v6 = mlModel;
  v7 = (void *)[objc_alloc((Class)a1) initWithMLModel:v6 error:error];

  return (NLModel *)v7;
}

+ (NLModel)modelWithData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) initWithData:v6 error:a4];

  return (NLModel *)v7;
}

- (NLModel)initWithConfiguration:(id)a3 modelImpl:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NLModel;
  v8 = [(NLModel *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    configuration = v8->_configuration;
    v8->_configuration = (NLModelConfiguration *)v9;

    objc_storeStrong((id *)&v8->_modelImpl, a4);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.NaturalLanguage.NLModel", 0);
    clientQueue = v8->_clientQueue;
    v8->_clientQueue = (OS_dispatch_queue *)v11;
  }
  return v8;
}

- (NLModel)initWithData:(id)a3 mlModel:(id)a4 error:(id *)a5
{
  v80[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v70 = a4;
  v71 = self;
  if (!v9)
  {
    if (a5)
    {
      v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v75 = *MEMORY[0x1E4F28568];
      v76 = @"Failed to load model file, data is nil";
      objc_super v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
      *a5 = [v13 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v14];
    }
    goto LABEL_90;
  }
  id v63 = a4;
  id obj = a3;
  v10 = (const void *)NLModelContainerCreateWithContainerData();
  if (!v10)
  {
    if (a5)
    {
      v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v73 = *MEMORY[0x1E4F28568];
      v74 = @"Failed to load model file, cannot read container";
      v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      *a5 = [v32 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v33];
    }
    goto LABEL_90;
  }
  if (NLModelContainerGetSubtype() != 7 && NLModelContainerGetSubtype() != 8)
  {
    if (!a5)
    {
LABEL_89:
      CFRelease(v10);
LABEL_90:
      i = 0;
      goto LABEL_91;
    }
    v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v77 = *MEMORY[0x1E4F28568];
    v78 = @"Failed to load model file, invalid container type";
    id v72 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
    *a5 = [v15 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v72];
LABEL_35:

    goto LABEL_89;
  }
  int Type = NLModelContainerGetType();
  if (Type - 1) <= 8 && ((0x1EFu >> (Type - 1))) {
    id v12 = (id)objc_opt_class();
  }
  else {
    id v12 = 0;
  }
  Class v68 = (Class)v12;
  uint64_t Revision = NLModelContainerGetRevision();
  unint64_t ModelDataCount = NLModelContainerGetModelDataCount();
  id v72 = (id)NLModelContainerCopyInfoDictionary();
  v18 = (void *)MEMORY[0x1E4F1CA60];
  v19 = [NSNumber numberWithUnsignedInteger:Revision];
  v20 = [v18 dictionaryWithObject:v19 forKey:@"Revision"];

  uint64_t v21 = unsignedIntegerForKey(v72, @"ModelType", Type == 1);
  v22 = stringForKey(v72, @"Language", 0);
  if (!v22)
  {
    v22 = stringForKey(v72, @"TrainingLanguage", 0);
  }
  stringForKeyWithDefault(v72, @"EmbeddingType", @"Static");
  i = (NLModel *)objc_claimAutoreleasedReturnValue();
  int v24 = BOOLForKeyWithDefault(v72, @"UseBidirectionalNeuralNetwork");
  if (v22) {
    [v20 setObject:v22 forKey:@"Language"];
  }
  if (i) {
    [v20 setObject:i forKey:@"EmbeddingType"];
  }
  if (v21) {
    int v25 = 0;
  }
  else {
    int v25 = v24;
  }
  if (v25 == 1)
  {
    v26 = [NSNumber numberWithBool:1];
    [v20 setObject:v26 forKey:@"UseBidirectionalNeuralNetwork"];
  }
  v69 = +[NLModelConfiguration defaultModelConfigurationForType:v21 options:v20 error:a5];

  if (!v68 || !v69 || !ModelDataCount)
  {
    if (a5)
    {
      v28 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v79 = *MEMORY[0x1E4F28568];
      v80[0] = @"Failed to load model file, invalid configuration or data";
      v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:&v79 count:1];
      *a5 = [v28 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:1 userInfo:v29];
    }
    goto LABEL_35;
  }
  id v59 = (id)NLModelContainerCopyModelDataAtIndex();
  if (ModelDataCount >= 2)
  {
    uint64_t v27 = NLModelContainerCopyModelDataAtIndex();
    if (ModelDataCount == 2)
    {
      v57 = 0;
      v58 = 0;
    }
    else
    {
      v58 = (void *)NLModelContainerCopyModelDataAtIndex();
      if (ModelDataCount >= 4)
      {
        v30 = (void *)NLModelContainerCopyModelDataAtIndex();
        if (ModelDataCount == 4) {
          v57 = 0;
        }
        else {
          v57 = (void *)NLModelContainerCopyModelDataAtIndex();
        }
        goto LABEL_42;
      }
      v57 = 0;
    }
    v30 = 0;
LABEL_42:
    v31 = (void *)v27;
    goto LABEL_43;
  }
  v57 = 0;
  v58 = 0;
  v30 = 0;
  v31 = 0;
LABEL_43:
  v56 = v31;
  v61 = stringArrayRepresentationFromData(v31);
  v62 = stringArrayRepresentationFromData(v58);
  id v67 = v30;
  v34 = (const char *)[v67 bytes];
  if ((unint64_t)[v67 length] >= 9 && !strncmp(v34, "bplist00", 8uLL))
  {
    v60 = [MEMORY[0x1E4F28F98] propertyListWithData:v67 options:0 format:0 error:0];
  }
  else
  {
    v60 = 0;
  }

  if (v61 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v35 = v61;
    v66 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v36 = [v35 count];
    if (v36)
    {
      for (i = 0; i != (NLModel *)v36; i = (NLModel *)((char *)i + 1))
      {
        v37 = [v35 objectAtIndex:i];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v37 length])
        {
          v38 = [NSNumber numberWithUnsignedInteger:i];
          [v66 setObject:v37 forKey:v38];
        }
      }
    }
  }
  else
  {
    v66 = 0;
  }
  if (v62 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v39 = v62;
    v65 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v40 = [v39 count];
    if (v40)
    {
      for (i = 0; i != (NLModel *)v40; i = (NLModel *)((char *)i + 1))
      {
        v41 = [v39 objectAtIndex:i];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v41 length])
        {
          v42 = [NSNumber numberWithUnsignedInteger:i];
          [v65 setObject:v42 forKey:v41];
        }
      }
    }
  }
  else
  {
    v65 = 0;
  }
  if (v60 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v43 = [v62 count];
    id v44 = v60;
    v45 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v46 = [v44 count];
    if (v43)
    {
      unint64_t v47 = v46;
      for (i = 0; (NLModel *)v43 != i; i = (NLModel *)((char *)i + 1))
      {
        if ((unint64_t)i >= v47)
        {
          v48 = 0;
        }
        else
        {
          v48 = [v44 objectAtIndex:i];
          if (v48)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              goto LABEL_76;
            }
          }
        }
        uint64_t v49 = [NSNumber numberWithUnsignedInteger:1];

        v48 = (void *)v49;
LABEL_76:
        v50 = [NSNumber numberWithUnsignedInteger:i];
        [v45 setObject:v48 forKey:v50];
      }
    }
  }
  else
  {
    v45 = 0;
  }
  if ([(objc_class *)v68 isEqual:objc_opt_class()]
    && (unint64_t)[v59 length] >= 4
    && *(_DWORD *)[v59 bytes] == 12648430)
  {
    Class v68 = (Class)objc_opt_class();
  }
  v51 = (void *)[[v68 alloc] initWithModelData:v59 configuration:v69 labelMap:v66 vocabularyMap:v65 documentFrequencyMap:v45 customEmbeddingData:v57 trainingInfo:v72 error:a5];
  if (v51)
  {
    uint64_t v52 = [(NLModel *)v71 initWithConfiguration:v69 modelImpl:v51];
    uint64_t v53 = v52;
    if (v52)
    {
      objc_storeStrong((id *)(v52 + 32), obj);
      objc_storeStrong((id *)(v53 + 40), v63);
      *(void *)(v53 + 48) = v10;
      i = (NLModel *)(id)v53;
      char v54 = 0;
      v71 = i;
      goto LABEL_88;
    }
    v71 = 0;
  }
  char v54 = 1;
LABEL_88:

  if (v54) {
    goto LABEL_89;
  }
LABEL_91:

  return i;
}

- (NLModel)initWithData:(id)a3 error:(id *)a4
{
  return [(NLModel *)self initWithData:a3 mlModel:0 error:a4];
}

- (NLModel)initWithClassifierMLModel:(id)a3
{
  id v5 = a3;
  id v6 = +[NLModelConfiguration defaultModelConfigurationForType:0];
  id v7 = [[NLModelImplML alloc] initWithMLModel:v5 configuration:v6];
  if (v7)
  {
    v8 = [(NLModel *)self initWithConfiguration:v6 modelImpl:v7];
    self = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_mlModel, a3);
    }
  }

  return self;
}

- (NLModel)initWithMLModel:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = [v6 parameters];
    v8 = [v7 modelParameterData];

    if (v8)
    {
      id v9 = [(NLModel *)self initWithData:v8 mlModel:v6 error:a4];
LABEL_7:
      self = v9;
      v10 = self;
LABEL_23:

      goto LABEL_24;
    }
  }
  if (v6)
  {
    v8 = [v6 modelDescription];
    dispatch_queue_t v11 = [v8 inputDescriptionsByName];
    if ([v11 count] == 1)
    {
      id v12 = [v8 inputDescriptionsByName];
      v13 = [v12 allValues];
      objc_super v14 = [v13 objectAtIndexedSubscript:0];
      if ([v14 type] == 3)
      {
        v15 = [v8 outputDescriptionsByName];
        if ([v15 count] == 1)
        {
          v22 = [v8 outputDescriptionsByName];
          uint64_t v21 = [v22 allValues];
          v16 = [v21 objectAtIndexedSubscript:0];
          uint64_t v23 = [v16 type];

          if (v23 == 3)
          {
            id v9 = [(NLModel *)self initWithClassifierMLModel:v6];
            goto LABEL_7;
          }
LABEL_20:
          if (a4)
          {
            v18 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v26 = *MEMORY[0x1E4F28568];
            v27[0] = @"MLModel does not have supported input and output descriptions for use with NLModel";
            v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:&v26 count:1];
            *a4 = [v18 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:2 userInfo:v19];
          }
          v10 = 0;
          goto LABEL_23;
        }
      }
    }

    goto LABEL_20;
  }
  if (a4)
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    int v25 = @"MLModel is nil, cannot create NLModel";
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    [v17 errorWithDomain:@"NLNaturalLanguageErrorDomain" code:2 userInfo:v8];
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v10 = 0;
LABEL_24:

  return v10;
}

- (NLModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![v6 isFileURL]) {
    goto LABEL_7;
  }
  id v7 = [v6 path];
  int v8 = open((const char *)[v7 fileSystemRepresentation], 0);

  if (v8 < 0) {
    goto LABEL_7;
  }
  int v15 = 0;
  ssize_t v9 = read(v8, &v15, 4uLL);
  int v10 = v15;
  close(v8);
  if (v9 == 4 && v10 == 156685278)
  {
    dispatch_queue_t v11 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6 options:1 error:a4];
    id v12 = v11;
    if (v11)
    {
      dispatch_queue_t v11 = [(NLModel *)self initWithData:v11 error:a4];
LABEL_9:
      self = v11;
    }
  }
  else
  {
LABEL_7:
    dispatch_queue_t v11 = [MEMORY[0x1E4F1E968] modelWithContentsOfURL:v6 error:a4];
    id v12 = v11;
    if (v11)
    {
      dispatch_queue_t v11 = [(NLModel *)self initWithMLModel:v11 error:a4];
      goto LABEL_9;
    }
  }
  v13 = v11;

  return v13;
}

- (void)dealloc
{
  container = self->_container;
  if (container) {
    CFRelease(container);
  }
  v4.receiver = self;
  v4.super_class = (Class)NLModel;
  [(NLModel *)&v4 dealloc];
}

- (id)data
{
  v62[16] = *MEMORY[0x1E4F143B8];
  v3 = [(NLModel *)self labelMap];
  v55 = stringArrayRepresentationFromInverseMap(v3);

  v57 = self;
  id v4 = [(NLModel *)self vocabularyMap];
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v59 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        id v12 = [v6 objectForKey:v11];
        [v5 setObject:v11 forKey:v12];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v58 objects:v62 count:16];
    }
    while (v8);
  }

  v56 = stringArrayRepresentationFromInverseMap(v5);

  v13 = [(NLModel *)v57 documentFrequencyMap];
  objc_super v14 = [MEMORY[0x1E4F1CA48] array];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  int v15 = [v13 allKeys];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v58 objects:v62 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    unint64_t v18 = 0;
    uint64_t v19 = *(void *)v59;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v59 != v19) {
          objc_enumerationMutation(v15);
        }
        uint64_t v21 = *(void **)(*((void *)&v58 + 1) + 8 * j);
        v22 = [v13 objectForKey:v21];
        unint64_t v23 = [v22 unsignedIntegerValue];

        if (v23 >= 2)
        {
          unint64_t v24 = [v21 unsignedIntegerValue];
          if (v24 > v18) {
            unint64_t v18 = v24;
          }
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v58 objects:v62 count:16];
    }
    while (v17);
  }
  else
  {
    unint64_t v18 = 0;
  }

  unint64_t v25 = 0;
  do
  {
    uint64_t v26 = [NSNumber numberWithUnsignedInteger:v25];
    uint64_t v27 = [v13 objectForKey:v26];

    if (v27)
    {
      [v14 addObject:v27];
    }
    else
    {
      v28 = [NSNumber numberWithUnsignedInteger:0];
      [v14 addObject:v28];
    }
    ++v25;
  }
  while (v25 <= v18);

  v29 = [(NLModel *)v57 configuration];
  [v29 revision];

  v30 = [(NLModelImpl *)v57->_modelImpl trainingInfo];
  v31 = [(NLModel *)v57 configuration];
  id v32 = v30;
  v33 = (void *)MEMORY[0x1E4F1CA60];
  v34 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "type"));
  id v35 = [v33 dictionaryWithObject:v34 forKey:@"ModelType"];

  uint64_t v36 = [v31 type];
  v37 = [v31 language];
  v38 = [v31 options];
  id v39 = stringForKeyWithDefault(v38, @"EmbeddingType", @"Static");
  int v40 = BOOLForKeyWithDefault(v38, @"UseBidirectionalNeuralNetwork");
  if (v37) {
    [v35 setObject:v37 forKey:@"Language"];
  }
  if (v39) {
    [v35 setObject:v39 forKey:@"EmbeddingType"];
  }
  if (v36) {
    int v41 = 0;
  }
  else {
    int v41 = v40;
  }
  if (v41 == 1)
  {
    v42 = [NSNumber numberWithBool:1];
    [v35 setObject:v42 forKey:@"UseBidirectionalNeuralNetwork"];
  }
  [v35 addEntriesFromDictionary:v32];

  uint64_t v43 = [(NLModelImpl *)v57->_modelImpl modelData];
  id v44 = v55;
  v45 = dataFromStringArrayRepresentation(v55);
  uint64_t v46 = dataFromStringArrayRepresentation(v56);
  unint64_t v47 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v14 format:200 options:0 error:0];
  v48 = [(NLModelImpl *)v57->_modelImpl customEmbeddingData];
  uint64_t v49 = 0;
  if (v35 && v43 && v45)
  {
    v50 = objc_opt_class();
    int v51 = modelMethodTypeForImplClass(v50);
    v62[0] = 0;
    if (v51
      && (objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v43, v45, v46, v47, v48, 0),
          (uint64_t v52 = NLModelContainerCreate()) != 0))
    {
      uint64_t v53 = (const void *)v52;
      uint64_t v49 = (void *)NLModelContainerCopyContainerData();
      CFRelease(v53);
    }
    else
    {
      uint64_t v49 = 0;
    }
    id v44 = v55;
  }

  return v49;
}

- (BOOL)writeToURL:(id)a3 atomically:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = [(NLModel *)self data];
  int v10 = v9;
  if (v9) {
    char v11 = [v9 writeToURL:v8 options:v6 error:a5];
  }
  else {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)writeMLModelToURL:(id)a3 options:(id)a4 error:(id *)a5
{
  v66[5] = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v7 = a4;
  id v8 = [(NLModel *)self configuration];
  uint64_t v9 = [v8 type];

  int v10 = objc_opt_class();
  int v47 = modelMethodTypeForImplClass(v10);
  unint64_t v48 = [(NLModel *)self systemVersion];
  char v11 = [(NLModel *)self configuration];
  uint64_t v52 = [v11 language];

  int v51 = [(NLModel *)self labelArray];
  id v12 = v7;
  v13 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v14 = *MEMORY[0x1E4F1E8B8];
  v66[0] = *MEMORY[0x1E4F1E8A0];
  v66[1] = v14;
  uint64_t v15 = *MEMORY[0x1E4F1E8B0];
  v66[2] = *MEMORY[0x1E4F1E890];
  v66[3] = v15;
  v66[4] = *MEMORY[0x1E4F1E898];
  [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:5];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v62 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v61 + 1) + 8 * i);
        v22 = [v12 objectForKey:v21];
        if (v22) {
          [v13 setObject:v22 forKey:v21];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v18);
  }

  if (v9)
  {
    if (v9 != 1)
    {
      id v30 = 0;
      BOOL v38 = 0;
      uint64_t v36 = a5;
      v31 = v50;
      if (!a5) {
        goto LABEL_38;
      }
      goto LABEL_37;
    }
    unint64_t v23 = stringForKey(v12, @"InputFeatureName", @"text");
    unint64_t v24 = stringForKey(v12, @"OutputFeatureName", @"labels");
    id v25 = objc_alloc(MEMORY[0x1E4F1E908]);
    uint64_t v26 = [(NLModel *)self data];
    uint64_t v27 = [v51 count];
    v28 = &unk_1EFB3AA18;
    if (v27) {
      v28 = v51;
    }
    id v60 = 0;
    v29 = (void *)[v25 initWithData:v48 language:v52 inputFeatureName:v23 tokensFeatureName:@"tokens" tokenTagsFeatureName:v24 tokenLocationsFeatureName:@"locations" tokenLengthsFeatureName:@"lengths" modelData:v26 tagNames:v28 metadata:v13 error:&v60];
    id v30 = v60;

    v31 = v50;
    if (v29)
    {
      id v59 = v30;
      id v32 = &v59;
      char v33 = [MEMORY[0x1E4F1E900] saveAppleWordTaggingModelToURL:v50 wordTaggerParameters:v29 error:&v59];
LABEL_27:
      BOOL v38 = v33;
      uint64_t v36 = a5;
LABEL_35:
      id v45 = *v32;

      id v30 = v45;
      goto LABEL_36;
    }
    goto LABEL_28;
  }
  if (v47 == 7)
  {
    unint64_t v23 = stringForKey(v12, @"InputFeatureName", @"text");
    unint64_t v24 = stringForKey(v12, @"OutputFeatureName", @"label");
    id v39 = objc_alloc(MEMORY[0x1E4F1E8C8]);
    int v40 = [(NLModel *)self data];
    if ([v51 count]) {
      int v41 = v51;
    }
    else {
      int v41 = &unk_1EFB3AA30;
    }
    id v56 = 0;
    v29 = (void *)[v39 initWithData:v48 language:v52 inputFeatureName:v23 outputFeatureName:v24 modelData:v40 labelNames:v41 metadata:v13 error:&v56];
    id v30 = v56;

    v31 = v50;
    if (v29)
    {
      id v55 = v30;
      id v32 = &v55;
      char v33 = [MEMORY[0x1E4F1E8C0] saveAppleGazetteerModelToURL:v50 gazetteerParameters:v29 error:&v55];
      goto LABEL_27;
    }
LABEL_28:
    BOOL v38 = 0;
    uint64_t v36 = a5;
    goto LABEL_36;
  }
  v31 = v50;
  if (v47 == 8)
  {
    unint64_t v23 = stringForKey(v12, @"InputFeatureName", @"text");
    unint64_t v24 = stringForKey(v12, @"OutputFeatureName", @"vector");
    id v34 = objc_alloc(MEMORY[0x1E4F1E8F8]);
    id v35 = [(NLModel *)self data];
    id v58 = 0;
    v29 = (void *)[v34 initWithData:v48 language:v52 inputFeatureName:v23 outputFeatureName:v24 modelData:v35 metadata:v13 error:&v58];
    id v30 = v58;

    uint64_t v36 = a5;
    if (v29)
    {
      id v57 = v30;
      id v32 = &v57;
      char v37 = [MEMORY[0x1E4F1E8F0] saveAppleWordEmbeddingModelToURL:v50 wordEmbeddingParameters:v29 error:&v57];
LABEL_34:
      BOOL v38 = v37;
      goto LABEL_35;
    }
  }
  else
  {
    unint64_t v23 = stringForKey(v12, @"InputFeatureName", @"text");
    unint64_t v24 = stringForKey(v12, @"OutputFeatureName", @"label");
    id v42 = objc_alloc(MEMORY[0x1E4F1E8E8]);
    uint64_t v43 = [(NLModel *)self data];
    if ([v51 count]) {
      id v44 = v51;
    }
    else {
      id v44 = &unk_1EFB3AA48;
    }
    id v54 = 0;
    v29 = (void *)[v42 initWithData:v48 language:v52 inputFeatureName:v23 outputFeatureName:v24 modelData:v43 labelNames:v44 metadata:v13 error:&v54];
    id v30 = v54;

    uint64_t v36 = a5;
    if (v29)
    {
      id v53 = v30;
      id v32 = &v53;
      char v37 = [MEMORY[0x1E4F1E8E0] saveAppleTextClassifierModelToURL:v50 textClassifierParameters:v29 error:&v53];
      goto LABEL_34;
    }
  }
  BOOL v38 = 0;
LABEL_36:

  if (v36) {
LABEL_37:
  }
    *uint64_t v36 = v30;
LABEL_38:

  return v38;
}

- (BOOL)writeMLModelToURL:(id)a3 atomically:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v14[1] = *MEMORY[0x1E4F143B8];
  v13 = @"AtomicWrite";
  id v8 = NSNumber;
  id v9 = a3;
  int v10 = [v8 numberWithBool:v6];
  v14[0] = v10;
  char v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  LOBYTE(a5) = [(NLModel *)self writeMLModelToURL:v9 options:v11 error:a5];

  return (char)a5;
}

- (NLModelConfiguration)configuration
{
  return self->_configuration;
}

- (id)mlModel
{
  return self->_mlModel;
}

- (unint64_t)systemVersion
{
  return [(NLModelImpl *)self->_modelImpl systemVersion];
}

- (id)labelMap
{
  return [(NLModelImpl *)self->_modelImpl labelMap];
}

- (id)labelArray
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(NLModel *)self labelMap];
  id v5 = stringArrayRepresentationFromInverseMap(v4);

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 length] && (objc_msgSend(v3, "containsObject:", v10) & 1) == 0) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v3;
}

- (id)vocabularyMap
{
  return [(NLModelImpl *)self->_modelImpl vocabularyMap];
}

- (id)documentFrequencyMap
{
  return [(NLModelImpl *)self->_modelImpl documentFrequencyMap];
}

- (id)gazetteer
{
  return [(NLModelImpl *)self->_modelImpl gazetteer];
}

- (id)embedding
{
  return [(NLModelImpl *)self->_modelImpl embedding];
}

- (id)embeddingData
{
  return [(NLModelImpl *)self->_modelImpl embeddingData];
}

- (NSString)predictedLabelForString:(NSString *)string
{
  id v4 = string;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy_;
  long long v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      clientQueue = self->_clientQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __35__NLModel_predictedLabelForString___block_invoke;
      block[3] = &unk_1E5C537F0;
      int v10 = &v11;
      block[4] = self;
      id v9 = v4;
      dispatch_sync(clientQueue, block);
    }
  }
  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSString *)v6;
}

uint64_t __35__NLModel_predictedLabelForString___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) predictedLabelForString:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (NSArray)predictedLabelsForTokens:(NSArray *)tokens
{
  id v4 = tokens;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy_;
  long long v15 = __Block_byref_object_dispose_;
  id v16 = (id)MEMORY[0x1E4F1CBF0];
  if (isAcceptableTokenArray(v4))
  {
    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__NLModel_predictedLabelsForTokens___block_invoke;
    block[3] = &unk_1E5C537F0;
    int v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(clientQueue, block);
  }
  id v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v6;
}

uint64_t __36__NLModel_predictedLabelsForTokens___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) predictedLabelsForTokens:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (id)predictedLabelArraysForTokenArrays:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  id v21 = (id)MEMORY[0x1E4F1CBF0];
  id v5 = v4;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v5 count])
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v6);
          }
          if (!isAcceptableTokenArray(*(void **)(*((void *)&v22 + 1) + 8 * i)))
          {

            goto LABEL_14;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    clientQueue = self->_clientQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__NLModel_predictedLabelArraysForTokenArrays___block_invoke;
    block[3] = &unk_1E5C537F0;
    long long v15 = &v16;
    block[4] = self;
    id v14 = v6;
    dispatch_sync(clientQueue, block);
  }
  else
  {
  }
LABEL_14:
  id v11 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v11;
}

uint64_t __46__NLModel_predictedLabelArraysForTokenArrays___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 24) predictedLabelArraysForTokenArrays:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (NSDictionary)predictedLabelHypothesesForString:(NSString *)string maximumCount:(NSUInteger)maximumCount
{
  id v6 = string;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = (id)MEMORY[0x1E4F1CC08];
  if (v6)
  {
    if (maximumCount)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        clientQueue = self->_clientQueue;
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __58__NLModel_predictedLabelHypothesesForString_maximumCount___block_invoke;
        v10[3] = &unk_1E5C53818;
        long long v12 = &v14;
        v10[4] = self;
        id v11 = v6;
        NSUInteger v13 = maximumCount;
        dispatch_sync(clientQueue, v10);
      }
    }
  }
  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (NSDictionary *)v8;
}

void __58__NLModel_predictedLabelHypothesesForString_maximumCount___block_invoke(void *a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 24) predictedLabelHypothesesForString:a1[5] maximumCount:a1[7]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (![*(id *)(*(void *)(a1[6] + 8) + 40) count])
  {
    uint64_t v5 = [*(id *)(a1[4] + 24) predictedLabelForString:a1[5]];
    id v6 = (void *)v5;
    if (v5)
    {
      uint64_t v11 = v5;
      uint64_t v7 = [NSNumber numberWithDouble:1.0];
      v12[0] = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
      uint64_t v9 = *(void *)(a1[6] + 8);
      int v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
  }
}

- (NSArray)predictedLabelHypothesesForTokens:(NSArray *)tokens maximumCount:(NSUInteger)maximumCount
{
  id v6 = tokens;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  uint64_t v18 = __Block_byref_object_dispose_;
  id v19 = (id)MEMORY[0x1E4F1CBF0];
  if (isAcceptableTokenArray(v6))
  {
    clientQueue = self->_clientQueue;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__NLModel_predictedLabelHypothesesForTokens_maximumCount___block_invoke;
    v10[3] = &unk_1E5C53818;
    long long v12 = &v14;
    v10[4] = self;
    uint64_t v11 = v6;
    NSUInteger v13 = maximumCount;
    dispatch_sync(clientQueue, v10);
  }
  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return (NSArray *)v8;
}

void __58__NLModel_predictedLabelHypothesesForTokens_maximumCount___block_invoke(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 24) predictedLabelHypothesesForTokens:a1[5] maximumCount:a1[7]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (![*(id *)(*(void *)(a1[6] + 8) + 40) count])
  {
    uint64_t v5 = [*(id *)(a1[4] + 24) predictedLabelsForTokens:a1[5]];
    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          if (a1[7])
          {
            uint64_t v20 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
            long long v12 = objc_msgSend(NSNumber, "numberWithDouble:", 1.0, (void)v16);
            id v21 = v12;
            NSUInteger v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
          }
          else
          {
            NSUInteger v13 = (void *)MEMORY[0x1E4F1CC08];
          }
          objc_msgSend(v6, "addObject:", v13, (void)v16);

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v9);
    }

    uint64_t v14 = *(void *)(a1[6] + 8);
    long long v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v6;
  }
}

- (id)classifierTestResultsWithDataProvider:(id)a3
{
  id v4 = a3;
  long long v24 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v5 = [v4 numberOfInstances];
  double Current = CFAbsoluteTimeGetCurrent();
  if (v5)
  {
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v10 = [v4 instanceAtIndex:i];
      uint64_t v11 = [v10 string];
      long long v12 = [v10 label];
      NSUInteger v13 = [(NLModel *)self predictedLabelForString:v11];
      unsigned int v14 = [v12 isEqualToString:v13];
      v8 += v14 ^ 1;
      v7 += v14;
    }
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v7 = 0;
  }
  double v15 = CFAbsoluteTimeGetCurrent();
  long long v16 = [NSNumber numberWithUnsignedInteger:v5];
  [v24 setObject:v16 forKey:@"NumberOfInstances"];

  long long v17 = [NSNumber numberWithUnsignedInteger:v7];
  [v24 setObject:v17 forKey:@"NumberOfInstancesCorrect"];

  long long v18 = [NSNumber numberWithUnsignedInteger:v8];
  [v24 setObject:v18 forKey:@"NumberOfInstancesIncorrect"];

  double v19 = v15 - Current;
  uint64_t v20 = [NSNumber numberWithDouble:v19];
  [v24 setObject:v20 forKey:@"OverallTestingTime"];

  if (v5)
  {
    id v21 = [NSNumber numberWithDouble:(double)v7 / (double)v5];
    [v24 setObject:v21 forKey:@"InstanceAccuracy"];

    long long v22 = [NSNumber numberWithDouble:v19 / (double)v5];
    [v24 setObject:v22 forKey:@"PerInstanceTestingTime"];
  }

  return v24;
}

- (id)sequenceTestResultsWithDataProvider:(id)a3
{
  id v3 = a3;
  id v34 = [MEMORY[0x1E4F1CA60] dictionary];
  char v37 = v3;
  unint64_t v4 = [v3 numberOfInstances];
  double Current = CFAbsoluteTimeGetCurrent();
  if (v4)
  {
    unint64_t v42 = 0;
    unint64_t v43 = 0;
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    for (i = v4; i != v9; unint64_t v4 = i)
    {
      unint64_t v41 = v7;
      uint64_t v10 = [v37 instanceAtIndex:v9];
      uint64_t v11 = [v10 tokens];
      long long v12 = [v10 labels];
      NSUInteger v13 = [(NLModel *)self predictedLabelsForTokens:v11];
      BOOL v38 = v11;
      uint64_t v14 = [v11 count];
      id v39 = v10;
      uint64_t v40 = v6;
      if (v14)
      {
        unint64_t v15 = 0;
        char v16 = 1;
        do
        {
          if (v15 < [v12 count]
            && v15 < [v13 count]
            && ([v12 objectAtIndex:v15],
                long long v17 = objc_claimAutoreleasedReturnValue(),
                [v13 objectAtIndex:v15],
                long long v18 = objc_claimAutoreleasedReturnValue(),
                int v19 = [v17 isEqualToString:v18],
                v18,
                v17,
                v19))
          {
            ++v43;
          }
          else
          {
            char v16 = 0;
            ++v8;
          }
          ++v15;
        }
        while (v14 != v15);
      }
      else
      {
        char v16 = 1;
      }
      uint64_t v6 = v40 + ((v16 & 1) == 0);
      v42 += v16 & 1;
      unint64_t v7 = v14 + v41;

      ++v9;
    }
  }
  else
  {
    uint64_t v8 = 0;
    unint64_t v42 = 0;
    unint64_t v43 = 0;
    unint64_t v7 = 0;
    uint64_t v6 = 0;
  }
  double v20 = CFAbsoluteTimeGetCurrent();
  id v21 = [NSNumber numberWithUnsignedInteger:v4];
  [v34 setObject:v21 forKey:@"NumberOfInstances"];

  long long v22 = [NSNumber numberWithUnsignedInteger:v42];
  [v34 setObject:v22 forKey:@"NumberOfInstancesCorrect"];

  uint64_t v23 = [NSNumber numberWithUnsignedInteger:v6];
  [v34 setObject:v23 forKey:@"NumberOfInstancesIncorrect"];

  long long v24 = [NSNumber numberWithUnsignedInteger:v7];
  [v34 setObject:v24 forKey:@"NumberOfTokens"];

  long long v25 = [NSNumber numberWithUnsignedInteger:v43];
  [v34 setObject:v25 forKey:@"NumberOfTokensCorrect"];

  uint64_t v26 = [NSNumber numberWithUnsignedInteger:v8];
  [v34 setObject:v26 forKey:@"NumberOfTokensIncorrect"];

  double v27 = v20 - Current;
  v28 = [NSNumber numberWithDouble:v27];
  [v34 setObject:v28 forKey:@"OverallTestingTime"];

  if (v4)
  {
    v29 = [NSNumber numberWithDouble:(double)v42 / (double)v4];
    [v34 setObject:v29 forKey:@"InstanceAccuracy"];

    id v30 = [NSNumber numberWithDouble:v27 / (double)v4];
    [v34 setObject:v30 forKey:@"PerInstanceTestingTime"];
  }
  if (v7)
  {
    v31 = [NSNumber numberWithDouble:(double)v43 / (double)v7];
    [v34 setObject:v31 forKey:@"TokenAccuracy"];

    id v32 = [NSNumber numberWithDouble:v27 / (double)v7];
    [v34 setObject:v32 forKey:@"PerTokenTestingTime"];
  }

  return v34;
}

- (id)testResultsWithDataProvider:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NLModel *)self configuration];
  uint64_t v6 = [v5 type];

  if (!v6)
  {
    uint64_t v7 = [(NLModel *)self classifierTestResultsWithDataProvider:v4];
    goto LABEL_5;
  }
  if (v6 == 1)
  {
    uint64_t v7 = [(NLModel *)self sequenceTestResultsWithDataProvider:v4];
LABEL_5:
    uint64_t v8 = (void *)v7;
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_7:

  return v8;
}

- (id)testResultsWithDataSet:(id)a3
{
  id v4 = [a3 dataProviderOfType:2];
  unint64_t v5 = [(NLModel *)self testResultsWithDataProvider:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_mlModel, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_modelImpl, 0);
  objc_storeStrong((id *)&self->_infoDictionary, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end