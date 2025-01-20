@interface SGMailIntelligenceFollowUpWarning
+ (BOOL)supportsSecureCoding;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSNumber)type;
- (NSString)endDateCore;
- (NSString)startDateCore;
- (SGMailIntelligenceFollowUpWarning)initWithCoder:(id)a3;
- (SGMailIntelligenceFollowUpWarning)initWithNSData:(id)a3;
- (SGMailIntelligenceFollowUpWarning)initWithNSDictionary:(id)a3;
- (SGMailIntelligenceFollowUpWarning)initWithSnippet:(id)a3 core:(id)a4 signature:(id)a5 detectedLanguage:(id)a6 isIncomingMessage:(BOOL)a7 score:(id)a8 startDate:(id)a9 startDateCore:(id)a10 endDate:(id)a11 endDateCore:(id)a12;
- (SGMailIntelligenceFollowUpWarning)initWithString:(id)a3;
- (id)description;
- (id)toLightJson;
- (id)toLightNSData;
- (id)toLightNSDictionary;
- (void)encodeWithCoder:(id)a3;
- (void)setType:(id)a3;
@end

@implementation SGMailIntelligenceFollowUpWarning

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_endDateCore, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDateCore, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

- (void)setType:(id)a3
{
}

- (NSNumber)type
{
  return self->_type;
}

- (NSString)endDateCore
{
  return self->_endDateCore;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)startDateCore
{
  return self->_startDateCore;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(SGMailIntelligenceWarning *)self snippet];
  v5 = [(SGMailIntelligenceWarning *)self signature];
  v6 = [(SGMailIntelligenceWarning *)self score];
  v7 = (void *)[v3 initWithFormat:@"<SGMailIntelligenceFollowUpWarningtriggered on: %@ (with signature %@) score: %@ valid from %@ to %@>", v4, v5, v6, self->_startDate, self->_endDate];

  return v7;
}

- (id)toLightJson
{
  v4 = (void *)MEMORY[0x1E4F28D90];
  v5 = [(SGMailIntelligenceFollowUpWarning *)self toLightNSDictionary];
  uint64_t v10 = 0;
  v6 = [v4 dataWithJSONObject:v5 options:0 error:&v10];

  v7 = (void *)[[NSString alloc] initWithData:v6 encoding:4];
  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SGMailIntelligenceWarning.m", 509, @"Invalid parameter not satisfying: %@", @"output" object file lineNumber description];
  }

  return v7;
}

- (id)toLightNSData
{
  v4 = (void *)MEMORY[0x1E4F28F98];
  v5 = [(SGMailIntelligenceFollowUpWarning *)self toLightNSDictionary];
  v6 = [v4 dataWithPropertyList:v5 format:200 options:0 error:0];

  if (!v6)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"SGMailIntelligenceWarning.m", 500, @"Invalid parameter not satisfying: %@", @"output" object file lineNumber description];
  }

  return v6;
}

- (id)toLightNSDictionary
{
  id v3 = objc_opt_new();
  [v3 setObject:@"2" forKeyedSubscript:@"version"];
  v4 = [(SGMailIntelligenceWarning *)self signature];
  v5 = __56__SGMailIntelligenceFollowUpWarning_toLightNSDictionary__block_invoke(v4);
  [v3 setObject:v5 forKeyedSubscript:@"signature"];

  v6 = [(SGMailIntelligenceWarning *)self detectedLanguage];
  v7 = __56__SGMailIntelligenceFollowUpWarning_toLightNSDictionary__block_invoke(v6);
  [v3 setObject:v7 forKeyedSubscript:@"detectedLanguage"];

  v8 = [(SGMailIntelligenceWarning *)self score];
  v9 = __56__SGMailIntelligenceFollowUpWarning_toLightNSDictionary__block_invoke(v8);
  [v3 setObject:v9 forKeyedSubscript:@"score"];

  uint64_t v10 = [(SGMailIntelligenceFollowUpWarning *)self type];
  v11 = __56__SGMailIntelligenceFollowUpWarning_toLightNSDictionary__block_invoke(v10);
  [v3 setObject:v11 forKeyedSubscript:@"type"];

  v12 = [MEMORY[0x1E4F1CA98] null];
  v13 = [v3 allKeysForObject:v12];

  [v3 removeObjectsForKeys:v13];

  return v3;
}

id __56__SGMailIntelligenceFollowUpWarning_toLightNSDictionary__block_invoke(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    id v3 = v1;
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1CA98] null];
  }
  v4 = v3;

  return v4;
}

- (SGMailIntelligenceFollowUpWarning)initWithString:(id)a3
{
  if (a3)
  {
    v4 = [a3 dataUsingEncoding:4];
    if (v4)
    {
      id v8 = 0;
      v5 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v8];
      id v6 = v8;
      if (v5)
      {
        self = [(SGMailIntelligenceFollowUpWarning *)self initWithNSDictionary:v5];

        v5 = self;
      }
    }
    else
    {
      id v6 = 0;
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SGMailIntelligenceFollowUpWarning)initWithNSData:(id)a3
{
  v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:0 error:0];
  v5 = [(SGMailIntelligenceFollowUpWarning *)self initWithNSDictionary:v4];

  return v5;
}

- (SGMailIntelligenceFollowUpWarning)initWithNSDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"version"];
  char v6 = [v5 isEqualToString:@"1"];

  if (v6)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v7 = [v4 objectForKeyedSubscript:@"version"];
  int v8 = [v7 isEqualToString:@"2"];

  if (!v8)
  {
    v17 = sgMailIntelligenceLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1A4D8C000, v17, OS_LOG_TYPE_FAULT, "SGMailIntelligenceFollowUpWarning version not supported.", buf, 2u);
    }

    goto LABEL_7;
  }
  v9 = [SGMailIntelligenceFollowUpWarning alloc];
  uint64_t v10 = [v4 objectForKeyedSubscript:@"signature"];
  v11 = [v4 objectForKeyedSubscript:@"detectedLanguage"];
  v12 = [v4 objectForKeyedSubscript:@"score"];
  v13 = [MEMORY[0x1E4F1C9C8] now];
  v14 = [MEMORY[0x1E4F1C9C8] now];
  v15 = [(SGMailIntelligenceFollowUpWarning *)v9 initWithSnippet:&stru_1EF915628 core:&stru_1EF915628 signature:v10 detectedLanguage:v11 isIncomingMessage:0 score:v12 startDate:v13 startDateCore:&stru_1EF915628 endDate:v14 endDateCore:&stru_1EF915628];

  v16 = [v4 objectForKeyedSubscript:@"type"];
  [(SGMailIntelligenceFollowUpWarning *)v15 setType:v16];

LABEL_8:
  return v15;
}

- (SGMailIntelligenceFollowUpWarning)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [[SGMailIntelligenceWarning alloc] initWithCoder:v4];
  if (v5)
  {
    char v6 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v7 = objc_opt_class();
    int v8 = sgMailIntelligenceLogHandle();
    v9 = [v6 robustDecodeObjectOfClass:v7 forKey:@"startDate" withCoder:v4 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v8];

    uint64_t v10 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v11 = objc_opt_class();
    v12 = sgMailIntelligenceLogHandle();
    v36 = [v10 robustDecodeObjectOfClass:v11 forKey:@"startDateCore" withCoder:v4 expectNonNull:0 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v12];

    v13 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v14 = objc_opt_class();
    v15 = sgMailIntelligenceLogHandle();
    v16 = [v13 robustDecodeObjectOfClass:v14 forKey:@"endDate" withCoder:v4 expectNonNull:1 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v15];

    v17 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v18 = objc_opt_class();
    v19 = sgMailIntelligenceLogHandle();
    v20 = [v17 robustDecodeObjectOfClass:v18 forKey:@"endDateCore" withCoder:v4 expectNonNull:0 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v19];

    v21 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v22 = objc_opt_class();
    v23 = sgMailIntelligenceLogHandle();
    v24 = [v21 robustDecodeObjectOfClass:v22 forKey:@"type" withCoder:v4 expectNonNull:0 errorDomain:@"SGErrorDomain" errorCode:11 logHandle:v23];

    v25 = 0;
    if (v9 && v16)
    {
      v26 = [v4 error];

      if (v26)
      {
        v25 = 0;
      }
      else
      {
        v33 = [SGMailIntelligenceFollowUpWarning alloc];
        v35 = [(SGMailIntelligenceWarning *)v5 snippet];
        v32 = [(SGMailIntelligenceWarning *)v5 core];
        v27 = [(SGMailIntelligenceWarning *)v5 signature];
        [(SGMailIntelligenceWarning *)v5 detectedLanguage];
        v28 = v34 = v9;
        BOOL v31 = [(SGMailIntelligenceWarning *)v5 isIncomingMessage];
        v29 = [(SGMailIntelligenceWarning *)v5 score];
        v25 = [(SGMailIntelligenceFollowUpWarning *)v33 initWithSnippet:v35 core:v32 signature:v27 detectedLanguage:v28 isIncomingMessage:v31 score:v29 startDate:v34 startDateCore:v36 endDate:v16 endDateCore:v20];

        v9 = v34;
        [(SGMailIntelligenceFollowUpWarning *)v25 setType:v24];
      }
    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SGMailIntelligenceFollowUpWarning;
  id v4 = a3;
  [(SGMailIntelligenceWarning *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_startDate, @"startDate", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_startDateCore forKey:@"startDateCore"];
  [v4 encodeObject:self->_endDate forKey:@"endDate"];
  [v4 encodeObject:self->_endDateCore forKey:@"endDateCore"];
  [v4 encodeObject:self->_type forKey:@"type"];
}

- (SGMailIntelligenceFollowUpWarning)initWithSnippet:(id)a3 core:(id)a4 signature:(id)a5 detectedLanguage:(id)a6 isIncomingMessage:(BOOL)a7 score:(id)a8 startDate:(id)a9 startDateCore:(id)a10 endDate:(id)a11 endDateCore:(id)a12
{
  BOOL v12 = a7;
  id v25 = a9;
  id v24 = a10;
  id v23 = a11;
  id v22 = a12;
  v26.receiver = self;
  v26.super_class = (Class)SGMailIntelligenceFollowUpWarning;
  uint64_t v18 = [(SGMailIntelligenceWarning *)&v26 initWithSnippet:a3 core:a4 signature:a5 detectedLanguage:a6 isIncomingMessage:v12 score:a8];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_startDate, a9);
    objc_storeStrong((id *)&v19->_startDateCore, a10);
    objc_storeStrong((id *)&v19->_endDate, a11);
    objc_storeStrong((id *)&v19->_endDateCore, a12);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end