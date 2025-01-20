@interface CAXContextualActionsPredictorDriver
+ (id)decoderUrl;
+ (id)encoderUrl;
+ (id)personalizedModelInUseKey;
- (CAXContextualActionsPredictor)globalModel;
- (CAXContextualActionsPredictor)personalizedModel;
- (CAXContextualActionsPredictorDriver)initWithConfigUrl:(id)a3;
- (CAXContextualActionsPredictorDriver)initWithConfigUrl:(id)a3 encoderUrl:(id)a4 decoderUrl:(id)a5 globalModelUrl:(id)a6 personalizedModelUrl:(id)a7;
- (NSDictionary)configDict;
- (id)decodeArrayOfCAElements:(id)a3 fromDecoderUrl:(id)a4;
- (id)decodeArrayOfCAElementsIntoActionIds:(id)a3 fromDecoderUrl:(id)a4;
- (id)predictWithConfidenceFromContext:(id)a3 numActions:(unint64_t)a4;
- (void)setConfigDict:(id)a3;
- (void)setGlobalModel:(id)a3;
- (void)setPersonalizedModel:(id)a3;
@end

@implementation CAXContextualActionsPredictorDriver

+ (id)encoderUrl
{
  return +[CAXContextualActionsPredictor defaultCoderUrlForName:@"encoding"];
}

+ (id)decoderUrl
{
  return +[CAXContextualActionsPredictor defaultCoderUrlForName:@"decoding"];
}

+ (id)personalizedModelInUseKey
{
  return @"personalizedModelInUse";
}

- (CAXContextualActionsPredictorDriver)initWithConfigUrl:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CAXContextualActionsPredictorDriver;
  v5 = [(CAXContextualActionsPredictorDriver *)&v24 init];
  if (v5)
  {
    v6 = [MEMORY[0x263F08850] defaultManager];
    v7 = [v4 path];
    int v8 = [v6 fileExistsAtPath:v7];

    if (v8)
    {
      uint64_t v9 = [objc_alloc(NSDictionary) initWithContentsOfURL:v4];
      configDict = v5->_configDict;
      v5->_configDict = (NSDictionary *)v9;
    }
    v11 = +[CAXContextualActionsPredictor defaultGlobalModelUrl];
    v12 = [[CAXContextualActionsPredictor alloc] initWithDefaultCodersAndModelUrl:v11 configUrl:v4];
    globalModel = v5->_globalModel;
    v5->_globalModel = v12;

    v14 = v5->_configDict;
    v15 = +[CAXContextualActionsPredictorDriver personalizedModelInUseKey];
    v16 = [(NSDictionary *)v14 objectForKeyedSubscript:v15];

    if (v16)
    {
      v17 = +[CAXContextualActionsPredictor defaultPersonalizedModelUrl];
      v18 = [MEMORY[0x263F08850] defaultManager];
      v19 = [v17 path];
      int v20 = [v18 fileExistsAtPath:v19];

      if (v20) {
        v21 = [[CAXContextualActionsPredictor alloc] initWithModelUrl:v17 configUrl:v4];
      }
      else {
        v21 = objc_alloc_init(CAXContextualActionsPredictor);
      }
      personalizedModel = v5->_personalizedModel;
      v5->_personalizedModel = v21;
    }
    else
    {
      v17 = v5->_personalizedModel;
      v5->_personalizedModel = 0;
    }
  }
  return v5;
}

- (CAXContextualActionsPredictorDriver)initWithConfigUrl:(id)a3 encoderUrl:(id)a4 decoderUrl:(id)a5 globalModelUrl:(id)a6 personalizedModelUrl:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v28.receiver = self;
  v28.super_class = (Class)CAXContextualActionsPredictorDriver;
  v17 = [(CAXContextualActionsPredictorDriver *)&v28 init];
  if (v17)
  {
    uint64_t v18 = [objc_alloc(NSDictionary) initWithContentsOfURL:v12];
    configDict = v17->_configDict;
    v17->_configDict = (NSDictionary *)v18;

    int v20 = [[CAXContextualActionsPredictor alloc] initWithModelUrl:v15 encoderUrl:v13 decoderUrl:v14 configUrl:v12];
    globalModel = v17->_globalModel;
    v17->_globalModel = v20;

    v22 = v17->_configDict;
    v23 = +[CAXContextualActionsPredictorDriver personalizedModelInUseKey];
    objc_super v24 = [(NSDictionary *)v22 objectForKeyedSubscript:v23];

    if (v24)
    {
      v25 = [[CAXContextualActionsPredictor alloc] initWithModelUrl:v16 encoderUrl:v13 decoderUrl:v14 configUrl:v12];
      personalizedModel = v17->_personalizedModel;
      v17->_personalizedModel = v25;
    }
    else
    {
      personalizedModel = v17->_personalizedModel;
      v17->_personalizedModel = 0;
    }
  }
  return v17;
}

- (id)predictWithConfidenceFromContext:(id)a3 numActions:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(CAXContextualActionsPredictorDriver *)self globalModel];
  int v8 = [v7 predictNumActions:a4 givenContext:v6];

  uint64_t v9 = [(CAXContextualActionsPredictorDriver *)self configDict];
  v10 = +[CAXContextualActionsPredictorDriver personalizedModelInUseKey];
  v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    id v12 = [(CAXContextualActionsPredictorDriver *)self personalizedModel];
    [v12 loadCoderFilesToInstanceFromDefaulUrls];
  }
  id v13 = +[CAXContextualActionsPredictorDriver decoderUrl];
  id v14 = [(CAXContextualActionsPredictorDriver *)self decodeArrayOfCAElements:v8 fromDecoderUrl:v13];

  return v14;
}

- (id)decodeArrayOfCAElements:(id)a3 fromDecoderUrl:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v20 = [MEMORY[0x263EFF8C0] arrayWithContentsOfURL:a4];
  id v6 = [v20 objectAtIndexedSubscript:0];
  objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v12 = [CAXContextualActionsPredictionElement alloc];
        id v13 = [v11 encodedActionIdentifier];
        id v14 = [v6 objectForKey:v13];
        id v15 = [v11 frequency];
        id v16 = [v11 normalizedFrequency];
        v17 = [v11 priorTotal];
        uint64_t v18 = [(CAXContextualActionsPredictionElement *)v12 initWithIdentifier:v14 frequency:v15 normalizedFrequency:v16 priorTotal:v17];

        [v22 addObject:v18];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v8);
  }

  return v22;
}

- (id)decodeArrayOfCAElementsIntoActionIds:(id)a3 fromDecoderUrl:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithContentsOfURL:a4];
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];
  uint64_t v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "encodedActionIdentifier", (void)v17);
        id v15 = [v7 objectForKey:v14];
        [v8 addObject:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v8;
}

- (CAXContextualActionsPredictor)globalModel
{
  return self->_globalModel;
}

- (void)setGlobalModel:(id)a3
{
}

- (CAXContextualActionsPredictor)personalizedModel
{
  return self->_personalizedModel;
}

- (void)setPersonalizedModel:(id)a3
{
}

- (NSDictionary)configDict
{
  return self->_configDict;
}

- (void)setConfigDict:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configDict, 0);
  objc_storeStrong((id *)&self->_personalizedModel, 0);
  objc_storeStrong((id *)&self->_globalModel, 0);
}

@end