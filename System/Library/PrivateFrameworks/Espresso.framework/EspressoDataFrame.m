@interface EspressoDataFrame
- (EspressoDataFrame)init;
- (NSArray)groundTruthAttachmentNames;
- (NSArray)inputAttachmentNames;
- (NSArray)outputAttachmentNames;
- (NSMutableDictionary)groundTruthAttachments;
- (NSMutableDictionary)inputAttachments;
- (NSMutableDictionary)outputAttachments;
- (NSString)function_name;
- (id)getFunctionName;
- (id)getGroundTruthAttachment:(id)a3;
- (id)getInputAttachment:(id)a3;
- (id)getOutputAttachment:(id)a3;
- (void)loadFromDict:(id)a3 frameStorage:(id)a4;
- (void)setFunction_name:(id)a3;
- (void)setGroundTruthAttachments:(id)a3;
- (void)setInputAttachments:(id)a3;
- (void)setOutputAttachments:(id)a3;
@end

@implementation EspressoDataFrame

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_function_name, 0);
  objc_storeStrong((id *)&self->_groundTruthAttachments, 0);
  objc_storeStrong((id *)&self->_outputAttachments, 0);

  objc_storeStrong((id *)&self->_inputAttachments, 0);
}

- (void)setFunction_name:(id)a3
{
}

- (NSString)function_name
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setGroundTruthAttachments:(id)a3
{
}

- (NSMutableDictionary)groundTruthAttachments
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOutputAttachments:(id)a3
{
}

- (NSMutableDictionary)outputAttachments
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInputAttachments:(id)a3
{
}

- (NSMutableDictionary)inputAttachments
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)loadFromDict:(id)a3 frameStorage:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = [v6 objectForKeyedSubscript:@"inputs"];
  uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v43;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v43 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v42 + 1) + 8 * v10);
        v12 = [v6 objectForKeyedSubscript:@"inputs"];
        v13 = [v12 objectForKeyedSubscript:v11];
        v14 = +[EspressoDataFrameAttachment fromDict:v13 frameStorage:v7];

        [(NSMutableDictionary *)self->_inputAttachments setObject:v14 forKeyedSubscript:v11];
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v8);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obja = [v6 objectForKeyedSubscript:@"outputs"];
  uint64_t v15 = [obja countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v39;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(obja);
        }
        uint64_t v18 = *(void *)(*((void *)&v38 + 1) + 8 * v17);
        v19 = [v6 objectForKeyedSubscript:@"outputs"];
        v20 = [v19 objectForKeyedSubscript:v18];
        v21 = +[EspressoDataFrameAttachment fromDict:v20 frameStorage:v7];

        [(NSMutableDictionary *)self->_outputAttachments setObject:v21 forKeyedSubscript:v18];
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [obja countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v15);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id objb = [v6 objectForKeyedSubscript:@"ground_truths"];
  uint64_t v22 = [objb countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v35;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(objb);
        }
        uint64_t v25 = *(void *)(*((void *)&v34 + 1) + 8 * v24);
        v26 = [v6 objectForKeyedSubscript:@"ground_truths"];
        v27 = [v26 objectForKeyedSubscript:v25];
        v28 = +[EspressoDataFrameAttachment fromDict:v27 frameStorage:v7];

        [(NSMutableDictionary *)self->_groundTruthAttachments setObject:v28 forKeyedSubscript:v25];
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [objb countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v22);
  }

  v29 = [v6 objectForKeyedSubscript:@"function_name"];
  function_name = self->_function_name;
  self->_function_name = v29;
}

- (NSArray)outputAttachmentNames
{
  return (NSArray *)[(NSMutableDictionary *)self->_outputAttachments allKeys];
}

- (NSArray)groundTruthAttachmentNames
{
  return (NSArray *)[(NSMutableDictionary *)self->_groundTruthAttachments allKeys];
}

- (NSArray)inputAttachmentNames
{
  return (NSArray *)[(NSMutableDictionary *)self->_inputAttachments allKeys];
}

- (id)getFunctionName
{
  return self->_function_name;
}

- (id)getGroundTruthAttachment:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_groundTruthAttachments objectForKeyedSubscript:a3];

  return v3;
}

- (id)getOutputAttachment:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_outputAttachments objectForKeyedSubscript:a3];

  return v3;
}

- (id)getInputAttachment:(id)a3
{
  v3 = [(NSMutableDictionary *)self->_inputAttachments objectForKeyedSubscript:a3];

  return v3;
}

- (EspressoDataFrame)init
{
  v13.receiver = self;
  v13.super_class = (Class)EspressoDataFrame;
  v2 = [(EspressoDataFrame *)&v13 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    inputAttachments = v2->_inputAttachments;
    v2->_inputAttachments = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    outputAttachments = v2->_outputAttachments;
    v2->_outputAttachments = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    groundTruthAttachments = v2->_groundTruthAttachments;
    v2->_groundTruthAttachments = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    function_name = v2->_function_name;
    v2->_function_name = (NSString *)v9;

    uint64_t v11 = v2;
  }

  return v2;
}

@end