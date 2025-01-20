@interface CAXContextualAction
+ (BOOL)supportsSecureCoding;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (CAXContextualAction)initWithActionIdentifier:(id)a3 confidence:(int64_t)a4 parameters:(id)a5;
- (CAXContextualAction)initWithActionIdentifier:(id)a3 parameters:(id)a4;
- (CAXContextualAction)initWithCoder:(id)a3;
- (CAXContextualAction)initWithProto:(id)a3;
- (CAXContextualAction)initWithProtoData:(id)a3;
- (NSArray)parameters;
- (NSString)actionIdentifier;
- (NSString)description;
- (NSUUID)suggestionUUID;
- (id)encodeAsProto;
- (id)json;
- (id)jsonRawData;
- (id)proto;
- (int64_t)confidence;
- (void)encodeWithCoder:(id)a3;
- (void)proto;
- (void)setConfidence:(int64_t)a3;
- (void)setSuggestionUUID:(id)a3;
@end

@implementation CAXContextualAction

- (CAXContextualAction)initWithActionIdentifier:(id)a3 parameters:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CAXContextualAction;
  v9 = [(CAXContextualAction *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionIdentifier, a3);
    objc_storeStrong((id *)&v10->_parameters, a4);
    v10->_confidence = 0;
  }

  return v10;
}

- (CAXContextualAction)initWithActionIdentifier:(id)a3 confidence:(int64_t)a4 parameters:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CAXContextualAction;
  v11 = [(CAXContextualAction *)&v14 init];
  objc_super v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_actionIdentifier, a3);
    objc_storeStrong((id *)&v12->_parameters, a5);
    v12->_confidence = a4;
  }

  return v12;
}

- (NSString)description
{
  v2 = [(CAXContextualAction *)self jsonRawData];
  v3 = [v2 description];

  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x263F087E8]);
      uint64_t v21 = *MEMORY[0x263F08320];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CAXContextualAction *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"CAXProtobufData"];
}

- (CAXContextualAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAXProtobufData"];

  v6 = [(CAXContextualAction *)self initWithProtoData:v5];
  return v6;
}

- (id)encodeAsProto
{
  v2 = [(CAXContextualAction *)self proto];
  v3 = [v2 data];

  return v3;
}

- (CAXContextualAction)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[CAXPBContextualAction alloc] initWithData:v4];

    self = [(CAXContextualAction *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CAXContextualAction)initWithProto:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = objc_alloc(MEMORY[0x263EFF980]);
      id v7 = [v5 parameters];
      id v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v9 = [v5 parameters];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v19 != v12) {
              objc_enumerationMutation(v9);
            }
            BOOL v14 = [[CAXContextualActionParameter alloc] initWithProto:*(void *)(*((void *)&v18 + 1) + 8 * i)];
            [v8 addObject:v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v11);
      }

      v15 = [v5 actionIdentifier];
      self = [(CAXContextualAction *)self initWithActionIdentifier:v15 parameters:v8];

      id v16 = self;
    }
    else
    {
      id v5 = __atxlog_handle_contextual_actions();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[CAXContextualActionContent initWithProto:]();
      }
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)proto
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  [v3 setActionIdentifier:self->_actionIdentifier];
  id v4 = [MEMORY[0x263EFF980] array];
  parameters = self->_parameters;
  if (parameters && [(NSArray *)parameters count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = self->_parameters;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v16 + 1) + 8 * v10) proto];
          if (v11)
          {
            [v4 addObject:v3];
          }
          else
          {
            uint64_t v12 = __atxlog_handle_contextual_actions();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
              [(CAXContextualAction *)&v14 proto];
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }
  }
  [v3 setParameters:v4];

  return v3;
}

- (id)jsonRawData
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  uint64_t v4 = [(CAXContextualAction *)self suggestionUUID];
  id v5 = (void *)v4;
  if (v4) {
    id v6 = (__CFString *)v4;
  }
  else {
    id v6 = &stru_26D8EF838;
  }
  [v3 setObject:v6 forKey:@"uuid"];

  uint64_t v7 = [(CAXContextualAction *)self actionIdentifier];
  uint64_t v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  else {
    uint64_t v9 = @"nil";
  }
  [v3 setObject:v9 forKey:@"actionIdentifier"];

  uint64_t v10 = [(CAXContextualAction *)self parameters];
  if (v10)
  {
    uint64_t v11 = [MEMORY[0x263EFF980] array];
    [v3 setObject:v11 forKey:@"parameters"];
  }
  else
  {
    [v3 setObject:@"nil" forKey:@"parameters"];
  }

  uint64_t v12 = [(CAXContextualAction *)self parameters];

  if (v12)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v13 = [(CAXContextualAction *)self parameters];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          long long v19 = [v3 objectForKeyedSubscript:@"parameters"];
          long long v20 = [v18 jsonRawData];
          [v19 addObject:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v15);
    }
  }
  return v3;
}

- (id)json
{
  v2 = (void *)MEMORY[0x263F08900];
  v3 = [(CAXContextualAction *)self jsonRawData];
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (NSUUID)suggestionUUID
{
  return self->_suggestionUUID;
}

- (void)setSuggestionUUID:(id)a3
{
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (int64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int64_t)a3
{
  self->_confidence = a3;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestionUUID, 0);
}

- (void)proto
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_2257D2000, log, OS_LOG_TYPE_FAULT, "Unable to generate inner ProtoBuf class for CAXContextualActionParameter", buf, 2u);
}

@end