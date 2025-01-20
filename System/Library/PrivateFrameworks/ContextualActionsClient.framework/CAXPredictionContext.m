@interface CAXPredictionContext
+ (BOOL)supportsSecureCoding;
- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)checkAndReportDecodingFailureIfNeededForint32_t:(int)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCAXPredictionContext:(id)a3;
- (CAXPredictionContext)initWithAbsoluteDate:(double)a3 sourceAppName:(id)a4 contents:(id)a5 previousActions:(id)a6 searchTerm:(id)a7;
- (CAXPredictionContext)initWithCoder:(id)a3;
- (CAXPredictionContext)initWithProto:(id)a3;
- (CAXPredictionContext)initWithProtoData:(id)a3;
- (CAXPredictionContext)initWithSuggestionDate:(id)a3 sourceAppName:(id)a4 contents:(id)a5 previousActions:(id)a6 searchTerm:(id)a7;
- (NSArray)contents;
- (NSArray)previousActions;
- (NSDate)suggestionDate;
- (NSString)searchTerm;
- (NSString)sourceAppName;
- (id)date;
- (id)encodeAsProto;
- (id)json;
- (id)jsonRawData;
- (id)proto;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)proto;
- (void)setContents:(id)a3;
- (void)setDate:(id)a3;
- (void)setPreviousActions:(id)a3;
- (void)setSourceAppName:(id)a3;
- (void)setSuggestionDate:(id)a3;
@end

@implementation CAXPredictionContext

- (CAXPredictionContext)initWithSuggestionDate:(id)a3 sourceAppName:(id)a4 contents:(id)a5 previousActions:(id)a6 searchTerm:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  [a3 timeIntervalSince1970];
  v16 = -[CAXPredictionContext initWithAbsoluteDate:sourceAppName:contents:previousActions:searchTerm:](self, "initWithAbsoluteDate:sourceAppName:contents:previousActions:searchTerm:", v15, v14, v13, v12);

  return v16;
}

- (CAXPredictionContext)initWithAbsoluteDate:(double)a3 sourceAppName:(id)a4 contents:(id)a5 previousActions:(id)a6 searchTerm:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)CAXPredictionContext;
  v17 = [(CAXPredictionContext *)&v22 init];
  v18 = v17;
  if (v17)
  {
    v17->_absoluteDate = a3;
    uint64_t v19 = [(CAXPredictionContext *)v17 date];
    suggestionDate = v18->_suggestionDate;
    v18->_suggestionDate = (NSDate *)v19;

    objc_storeStrong((id *)&v18->_sourceAppName, a4);
    objc_storeStrong((id *)&v18->_contents, a5);
    objc_storeStrong((id *)&v18->_previousActions, a6);
    objc_storeStrong((id *)&v18->_searchTerm, a7);
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CAXPredictionContext *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CAXPredictionContext *)self isEqualToCAXPredictionContext:v5];

  return v6;
}

- (BOOL)isEqualToCAXPredictionContext:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  double v6 = self->_absoluteDate - *((double *)v4 + 1);
  if (v6 < 0.0) {
    double v6 = -v6;
  }
  if (v6 > 2.22044605e-16) {
    goto LABEL_14;
  }
  sourceAppName = self->_sourceAppName;
  v8 = (NSString *)v4[3];
  if (sourceAppName == v8)
  {
  }
  else
  {
    v9 = v8;
    v10 = sourceAppName;
    char v11 = [(NSString *)v10 isEqual:v9];

    if ((v11 & 1) == 0) {
      goto LABEL_14;
    }
  }
  contents = self->_contents;
  id v13 = (NSArray *)v5[4];
  if (contents == v13)
  {
  }
  else
  {
    id v14 = v13;
    id v15 = contents;
    char v16 = [(NSArray *)v15 isEqual:v14];

    if ((v16 & 1) == 0) {
      goto LABEL_14;
    }
  }
  previousActions = self->_previousActions;
  v18 = (NSArray *)v5[5];
  if (previousActions == v18)
  {
  }
  else
  {
    uint64_t v19 = v18;
    v20 = previousActions;
    char v21 = [(NSArray *)v20 isEqual:v19];

    if ((v21 & 1) == 0)
    {
LABEL_14:
      char v22 = 0;
      goto LABEL_15;
    }
  }
  v24 = self->_searchTerm;
  v25 = v24;
  if (v24 == v5[6]) {
    char v22 = 1;
  }
  else {
    char v22 = -[NSString isEqual:](v24, "isEqual:");
  }

LABEL_15:
  return v22;
}

- (unint64_t)hash
{
  unint64_t absoluteDate = (unint64_t)self->_absoluteDate;
  NSUInteger v4 = [(NSString *)self->_sourceAppName hash] - absoluteDate + 32 * absoluteDate;
  uint64_t v5 = [(NSArray *)self->_contents hash] - v4 + 32 * v4;
  uint64_t v6 = [(NSArray *)self->_previousActions hash] - v5 + 32 * v5;
  return [(NSString *)self->_searchTerm hash] - v6 + 32 * v6;
}

- (id)date
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSince1970:self->_absoluteDate];
  return v2;
}

- (void)setDate:(id)a3
{
  [a3 timeIntervalSince1970];
  self->_unint64_t absoluteDate = v4;
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
    id v15 = [v12 error];

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
      uint64_t v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForint32_t:(int)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    id v15 = [v12 error];

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
      uint64_t v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3 == 0.0)
  {
    id v15 = [v12 error];

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
      uint64_t v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

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
  id v5 = [(CAXPredictionContext *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"CAXProtobufData"];
}

- (CAXPredictionContext)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CAXProtobufData"];

  uint64_t v6 = [(CAXPredictionContext *)self initWithProtoData:v5];
  return v6;
}

- (id)encodeAsProto
{
  v2 = [(CAXPredictionContext *)self proto];
  v3 = [v2 data];

  return v3;
}

- (CAXPredictionContext)initWithProto:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v30 = self;
      id v5 = v4;
      id v6 = objc_alloc(MEMORY[0x263EFF980]);
      v7 = [v5 contents];
      v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v9 = [v5 contents];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v36 != v12) {
              objc_enumerationMutation(v9);
            }
            BOOL v14 = [[CAXContextualActionContent alloc] initWithProto:*(void *)(*((void *)&v35 + 1) + 8 * i)];
            [v8 addObject:v14];
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v11);
      }

      id v15 = objc_alloc(MEMORY[0x263EFF980]);
      id v16 = [v5 previousActions];
      v17 = objc_msgSend(v15, "initWithCapacity:", objc_msgSend(v16, "count"));

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v18 = [v5 previousActions];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v32 != v21) {
              objc_enumerationMutation(v18);
            }
            v23 = [[CAXContextualAction alloc] initWithProto:*(void *)(*((void *)&v31 + 1) + 8 * j)];
            [v17 addObject:v23];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v20);
      }

      [v5 suggestionDate];
      double v25 = v24;
      v26 = [v5 sourceAppName];
      v27 = [v5 searchTerm];
      self = [(CAXPredictionContext *)v30 initWithAbsoluteDate:v26 sourceAppName:v8 contents:v17 previousActions:v27 searchTerm:v25];

      v28 = self;
    }
    else
    {
      id v5 = __atxlog_handle_contextual_actions();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[CAXContextualActionsFeedbackEvent initWithProto:]((uint64_t)self, v5);
      }
      v28 = 0;
    }
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (CAXPredictionContext)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[CAXPBPredictionContext alloc] initWithData:v4];

    self = [(CAXPredictionContext *)self initWithProto:v5];
    id v6 = self;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  [v3 setSuggestionDate:self->_absoluteDate];
  [v3 setSourceAppName:self->_sourceAppName];
  [v3 setSearchTerm:self->_searchTerm];
  id v4 = [MEMORY[0x263EFF980] array];
  contents = self->_contents;
  if (contents && [(NSArray *)contents count])
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v6 = self->_contents;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v32;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v31 + 1) + 8 * v10) proto];
          if (v11)
          {
            [v4 addObject:v11];
          }
          else
          {
            uint64_t v12 = __atxlog_handle_contextual_actions();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
              [(CAXPredictionContext *)&buf proto];
            }
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v8);
    }
  }
  [v3 setContents:v4];
  id v13 = [MEMORY[0x263EFF980] array];
  previousActions = self->_previousActions;
  if (previousActions && [(NSArray *)previousActions count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = self->_previousActions;
    uint64_t v16 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [*(id *)(*((void *)&v25 + 1) + 8 * v19) proto];
          if (v20)
          {
            [v13 addObject:v20];
          }
          else
          {
            uint64_t v21 = __atxlog_handle_contextual_actions();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
              [(CAXPredictionContext *)&v23 proto];
            }
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [(NSArray *)v15 countByEnumeratingWithState:&v25 objects:v35 count:16];
      }
      while (v17);
    }
  }
  [v3 setPreviousActions:v13];

  return v3;
}

- (id)jsonRawData
{
  v44[5] = *MEMORY[0x263EF8340];
  v43[0] = @"absoluteDate";
  double absoluteDate = self->_absoluteDate;
  if (absoluteDate == 0.0)
  {
    id v4 = @"nil";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%lf", *(void *)&absoluteDate);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v44[0] = v4;
  v43[1] = @"sourceAppName";
  uint64_t v5 = [(CAXPredictionContext *)self sourceAppName];
  id v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = (__CFString *)v5;
  }
  else {
    uint64_t v7 = @"nil";
  }
  v44[1] = v7;
  v43[2] = @"contents";
  uint64_t v8 = objc_opt_new();
  v44[2] = v8;
  v43[3] = @"previousActions";
  uint64_t v9 = objc_opt_new();
  v44[3] = v9;
  v43[4] = @"searchTerm";
  uint64_t v10 = [(CAXPredictionContext *)self searchTerm];
  uint64_t v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = (__CFString *)v10;
  }
  else {
    uint64_t v12 = @"nil";
  }
  v44[4] = v12;
  id v13 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:5];

  if (absoluteDate != 0.0) {
  BOOL v14 = [(CAXPredictionContext *)self contents];
  }

  if (v14)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v15 = [(CAXPredictionContext *)self contents];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          uint64_t v21 = [v13 objectForKeyedSubscript:@"contents"];
          char v22 = [v20 jsonRawData];
          [v21 addObject:v22];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v42 count:16];
      }
      while (v17);
    }
  }
  uint8_t v23 = [(CAXPredictionContext *)self previousActions];

  if (v23)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    double v24 = [(CAXPredictionContext *)self previousActions];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v34;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v34 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          v30 = [v13 objectForKeyedSubscript:@"previousActions"];
          long long v31 = [v29 jsonRawData];
          [v30 addObject:v31];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v26);
    }
  }
  return v13;
}

- (id)json
{
  v2 = (void *)MEMORY[0x263F08900];
  v3 = [(CAXPredictionContext *)self jsonRawData];
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (NSDate)suggestionDate
{
  return self->_suggestionDate;
}

- (void)setSuggestionDate:(id)a3
{
}

- (NSString)sourceAppName
{
  return self->_sourceAppName;
}

- (void)setSourceAppName:(id)a3
{
}

- (NSArray)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
}

- (NSArray)previousActions
{
  return self->_previousActions;
}

- (void)setPreviousActions:(id)a3
{
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchTerm, 0);
  objc_storeStrong((id *)&self->_previousActions, 0);
  objc_storeStrong((id *)&self->_contents, 0);
  objc_storeStrong((id *)&self->_sourceAppName, 0);
  objc_storeStrong((id *)&self->_suggestionDate, 0);
}

- (void)proto
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_2257D2000, log, OS_LOG_TYPE_FAULT, "Unable to generate inner ProtoBuf class for CAXContextualActionContent", buf, 2u);
}

@end