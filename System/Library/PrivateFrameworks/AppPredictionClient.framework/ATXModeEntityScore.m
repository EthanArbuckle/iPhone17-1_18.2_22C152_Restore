@interface ATXModeEntityScore
+ (BOOL)supportsSecureCoding;
- (ATXModeEntityScore)initWithCoder:(id)a3;
- (ATXModeEntityScore)initWithScore:(double)a3 featureVector:(id)a4 uuid:(id)a5;
- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (NSDictionary)featureVector;
- (NSUUID)uuid;
- (double)score;
- (id)debugDescription;
- (id)description;
- (id)jsonDict;
- (void)encodeWithCoder:(id)a3;
- (void)setFeatureVector:(id)a3;
- (void)setScore:(double)a3;
- (void)setUuid:(id)a3;
@end

@implementation ATXModeEntityScore

- (ATXModeEntityScore)initWithScore:(double)a3 featureVector:(id)a4 uuid:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ATXModeEntityScore;
  v11 = [(ATXModeEntityScore *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_uuid, a5);
    v12->_score = a3;
    objc_storeStrong((id *)&v12->_featureVector, a4);
  }

  return v12;
}

- (id)jsonDict
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v11[0] = @"uuid";
  v3 = [(ATXModeEntityScore *)self uuid];
  v4 = [v3 UUIDString];
  v12[0] = v4;
  v11[1] = @"score";
  v5 = NSNumber;
  [(ATXModeEntityScore *)self score];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v12[1] = v6;
  v11[2] = @"features";
  v7 = [(ATXModeEntityScore *)self featureVector];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (!v7) {

  }
  return v9;
}

- (id)debugDescription
{
  v2 = [(ATXModeEntityScore *)self jsonDict];
  v3 = [v2 debugDescription];

  return v3;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"uuid: %@, score: %.3f", self->_uuid, *(void *)&self->_score];

  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededFordouble:(double)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a3 == 0.0)
  {
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
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
  v5 = [(ATXModeEntityScore *)self uuid];
  [v4 encodeObject:v5 forKey:@"codingKeyForUUID"];

  [(ATXModeEntityScore *)self score];
  objc_msgSend(v4, "encodeDouble:forKey:", @"codingKeyForScore");
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  v6 = allowedFeatureVectorClasses();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __38__ATXModeEntityScore_encodeWithCoder___block_invoke;
  v15[3] = &unk_1E5D06710;
  id v7 = v6;
  id v16 = v7;
  v8 = (void *)MEMORY[0x1AD0D3E40](v15);
  id v9 = [(ATXModeEntityScore *)self featureVector];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __38__ATXModeEntityScore_encodeWithCoder___block_invoke_2;
  v12[3] = &unk_1E5D06738;
  id v10 = v8;
  id v13 = v10;
  BOOL v14 = &v17;
  [v9 enumerateKeysAndObjectsUsingBlock:v12];

  if (*((unsigned char *)v18 + 24))
  {
    id v11 = [(ATXModeEntityScore *)self featureVector];
    [v4 encodeObject:v11 forKey:@"codingKeyForFeatures"];
  }
  _Block_object_dispose(&v17, 8);
}

uint64_t __38__ATXModeEntityScore_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_opt_isKindOfClass())
        {
          uint64_t v5 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

void __38__ATXModeEntityScore_encodeWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
  {
    long long v9 = __atxlog_handle_modes();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __38__ATXModeEntityScore_encodeWithCoder___block_invoke_2_cold_2();
    }
    goto LABEL_7;
  }
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
  {
    long long v9 = __atxlog_handle_modes();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __38__ATXModeEntityScore_encodeWithCoder___block_invoke_2_cold_1();
    }
LABEL_7:

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (ATXModeEntityScore)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_notification_management();
  id v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForUUID" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.modeEntityScore" errorCode:-1 logHandle:v7];

  long long v9 = [v4 error];

  if (v9)
  {
LABEL_8:
    id v13 = 0;
    goto LABEL_9;
  }
  if (!v8) {
    id v8 = objc_opt_new();
  }
  [v4 decodeDoubleForKey:@"codingKeyForScore"];
  double v11 = v10;
  if (-[ATXModeEntityScore checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededFordouble:key:coder:errorDomain:errorCode:", @"codingKeyForScore", v4, @"com.apple.proactive.decode.modeEntityScore", -1))
  {
    long long v12 = __atxlog_handle_notification_management();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[ATXModeEntityScore initWithCoder:](v12);
    }

    goto LABEL_8;
  }
  v15 = (void *)MEMORY[0x1E4F93B90];
  id v16 = allowedFeatureVectorClasses();
  uint64_t v17 = __atxlog_handle_notification_management();
  v18 = [v15 robustDecodeObjectOfClasses:v16 forKey:@"codingKeyForFeatures" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.decode.modeEntityScore" errorCode:-1 logHandle:v17];

  uint64_t v19 = [v4 error];

  if (v19)
  {
    id v13 = 0;
  }
  else
  {
    self = [(ATXModeEntityScore *)self initWithScore:v18 featureVector:v8 uuid:v11];
    id v13 = self;
  }

LABEL_9:
  return v13;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (NSDictionary)featureVector
{
  return self->_featureVector;
}

- (void)setFeatureVector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureVector, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

void __38__ATXModeEntityScore_encodeWithCoder___block_invoke_2_cold_1()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v1, v2, "ATXModeEntityScore: unexpected value class: %{public}@", v3, v4, v5, v6, 2u);
}

void __38__ATXModeEntityScore_encodeWithCoder___block_invoke_2_cold_2()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v1, v2, "ATXModeEntityScore: unexpected key class: %{public}@", v3, v4, v5, v6, 2u);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_1A790D000, log, OS_LOG_TYPE_FAULT, "Failed to decode score from ATXModeEntityScore.", v1, 2u);
}

@end