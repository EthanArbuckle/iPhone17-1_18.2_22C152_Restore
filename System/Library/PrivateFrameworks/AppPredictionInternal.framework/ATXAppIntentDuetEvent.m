@interface ATXAppIntentDuetEvent
+ (BOOL)supportsSecureCoding;
- (ATXAppIntentDuetEvent)initWithBundleId:(id)a3 actionType:(id)a4 parameterHashes:(id)a5 slotSetHashes:(id)a6 paramCount:(id)a7 startDate:(id)a8 endDate:(id)a9;
- (ATXAppIntentDuetEvent)initWithBundleId:(id)a3 actionType:(id)a4 parameterHashes:(id)a5 slotSetHashes:(id)a6 paramCount:(id)a7 startDate:(id)a8 endDate:(id)a9 alogId:(id)a10;
- (ATXAppIntentDuetEvent)initWithCoder:(id)a3;
- (ATXAppIntentDuetEvent)initWithCurrentContextStoreValues;
- (ATXAppIntentDuetEvent)initWithDKEvent:(id)a3;
- (NSArray)parameterHashes;
- (NSArray)slotSetHashes;
- (NSNumber)alogId;
- (NSNumber)paramCount;
- (NSString)actionType;
- (NSString)bundleId;
- (id)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)initWithCurrentContextStoreValues;
@end

@implementation ATXAppIntentDuetEvent

- (ATXAppIntentDuetEvent)initWithBundleId:(id)a3 actionType:(id)a4 parameterHashes:(id)a5 slotSetHashes:(id)a6 paramCount:(id)a7 startDate:(id)a8 endDate:(id)a9
{
  return [(ATXAppIntentDuetEvent *)self initWithBundleId:a3 actionType:a4 parameterHashes:a5 slotSetHashes:a6 paramCount:a7 startDate:a8 endDate:a9 alogId:0];
}

- (ATXAppIntentDuetEvent)initWithBundleId:(id)a3 actionType:(id)a4 parameterHashes:(id)a5 slotSetHashes:(id)a6 paramCount:(id)a7 startDate:(id)a8 endDate:(id)a9 alogId:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v37 = a6;
  id v35 = a7;
  id v36 = a8;
  id v19 = a9;
  id v20 = a10;
  if ([v16 length])
  {
    uint64_t v21 = [v17 length];
    v22 = 0;
    if (v18
      && v21
      && (uint64_t v23 = [v18 count], v22 = 0, v37)
      && v23
      && (uint64_t v24 = [v37 count], v22 = 0, v36)
      && v24)
    {
      v38.receiver = self;
      v38.super_class = (Class)ATXAppIntentDuetEvent;
      v25 = v19;
      v26 = [(ATXDuetEvent *)&v38 initWithStartDate:v36 endDate:v19];
      if (v26)
      {
        uint64_t v27 = [v16 copy];
        bundleId = v26->_bundleId;
        v26->_bundleId = (NSString *)v27;

        uint64_t v29 = [v17 copy];
        actionType = v26->_actionType;
        v26->_actionType = (NSString *)v29;

        uint64_t v31 = [v18 copy];
        parameterHashes = v26->_parameterHashes;
        v26->_parameterHashes = (NSArray *)v31;

        objc_storeStrong((id *)&v26->_slotSetHashes, a6);
        objc_storeStrong((id *)&v26->_paramCount, a7);
        objc_storeStrong((id *)&v26->_alogId, a10);
      }
      self = v26;
      v22 = self;
    }
    else
    {
      v25 = v19;
    }
    v33 = v35;
  }
  else
  {
    v25 = v19;
    v22 = 0;
    v33 = v35;
  }

  return v22;
}

- (ATXAppIntentDuetEvent)initWithDKEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"ATXAppIntentDuetEvent.m", 85, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v6 = [v5 source];
  v7 = [v6 bundleID];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (([v7 isEqualToString:@"unknown"] & 1) != 0
      || ([v7 isEqualToString:&stru_1F2740B58] & 1) != 0
      || !v7)
    {
      v8 = __atxlog_handle_default();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ATXAppIntentDuetEvent initWithDKEvent:]();
      }
    }
    else
    {
      v11 = [v5 metadata];
      v12 = [MEMORY[0x1E4F5B550] intentClass];
      v8 = [v11 objectForKey:v12];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (([v8 isEqualToString:&stru_1F2740B58] & 1) == 0 && v8)
        {
          objc_storeStrong((id *)&self->_bundleId, v7);
          objc_storeStrong((id *)&self->_actionType, v8);
          v13 = [v5 startDate];
          v14 = [v5 endDate];
          self = [(ATXAppIntentDuetEvent *)self initWithBundleId:v7 actionType:v8 parameterHashes:&unk_1F27F3630 slotSetHashes:&unk_1F27F3648 paramCount:&unk_1F27F18A8 startDate:v13 endDate:v14];

          v9 = self;
          goto LABEL_10;
        }
        v15 = __atxlog_handle_default();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[ATXAppIntentDuetEvent initWithDKEvent:]();
        }
      }
      else
      {
        v15 = __atxlog_handle_default();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          -[ATXAppIntentDuetEvent initWithDKEvent:]((uint64_t)v8, v15);
        }
      }
    }
  }
  else
  {
    v8 = __atxlog_handle_default();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[ATXAppIntentDuetEvent initWithDKEvent:].cold.4((uint64_t)v7, v8);
    }
  }
  v9 = 0;
LABEL_10:

  return v9;
}

- (ATXAppIntentDuetEvent)initWithCurrentContextStoreValues
{
  v3 = [MEMORY[0x1E4F5B6A8] userContext];
  v4 = [MEMORY[0x1E4F5B6B8] keyPathForIntentsDataDictionary];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5)
  {
    v28 = __atxlog_handle_default();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[ATXAppIntentDuetEvent initWithCurrentContextStoreValues]();
    }

    goto LABEL_22;
  }
  v6 = [MEMORY[0x1E4F5B6B8] keyPathForIntentsDataDictionary];
  v7 = [v3 objectForKeyedSubscript:v6];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v29 = __atxlog_handle_default();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[ATXAppIntentDuetEvent initWithCurrentContextStoreValues].cold.4();
    }

    v30 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v31 = *MEMORY[0x1E4F1C3B8];
    v32 = @"ContextStore's 'keyPathForIntentsDataDictionary' is not an NSDictionary.";
    goto LABEL_21;
  }
  v9 = [MEMORY[0x1E4F5B6B8] intentSourceBundleIDKey];
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if ((v11 & 1) == 0)
  {
    v33 = __atxlog_handle_default();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      -[ATXAppIntentDuetEvent initWithCurrentContextStoreValues]();
    }

    v30 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v31 = *MEMORY[0x1E4F1C3B8];
    v32 = @"Value for 'intentSourceBundleIDKey' in ContextStore's 'keyPathForIntentsDataDictionary' is not an NSString.";
LABEL_21:
    [v30 raise:v31 format:v32];
LABEL_22:
    uint64_t v27 = 0;
    goto LABEL_23;
  }
  v12 = [MEMORY[0x1E4F5B6B8] intentSourceBundleIDKey];
  uint64_t v13 = [v5 objectForKeyedSubscript:v12];
  v14 = (void *)v13;
  if (v13) {
    v15 = (__CFString *)v13;
  }
  else {
    v15 = &stru_1F2740B58;
  }
  id v16 = v15;

  id v17 = [MEMORY[0x1E4F5B6B8] intentClassKey];
  id v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  char v19 = objc_opt_isKindOfClass();

  if (v19)
  {
    id v20 = [MEMORY[0x1E4F5B6B8] intentClassKey];
    uint64_t v21 = [v5 objectForKeyedSubscript:v20];
    v22 = (void *)v21;
    if (v21) {
      uint64_t v23 = (__CFString *)v21;
    }
    else {
      uint64_t v23 = &stru_1F2740B58;
    }
    uint64_t v24 = v23;

    v25 = [MEMORY[0x1E4F1C9C8] date];
    v26 = [(ATXAppIntentDuetEvent *)self initWithBundleId:v16 actionType:v24 parameterHashes:&unk_1F27F3660 slotSetHashes:&unk_1F27F3678 paramCount:&unk_1F27F18A8 startDate:v25 endDate:v25];

    self = v26;
    uint64_t v27 = self;
  }
  else
  {
    id v35 = __atxlog_handle_default();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[ATXAppIntentDuetEvent initWithCurrentContextStoreValues]();
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Value for 'intentClassKey' in ContextStore's 'keyPathForIntentsDataDictionary' is not an NSString."];
    uint64_t v27 = 0;
  }

LABEL_23:
  return v27;
}

- (id)identifier
{
  v3 = objc_opt_new();
  v4 = [NSString stringWithFormat:@"%@:%@:", self->_bundleId, self->_actionType];
  [v3 appendString:v4];

  if ([(NSArray *)self->_parameterHashes count])
  {
    unint64_t v5 = 0;
    do
    {
      v6 = [(NSArray *)self->_parameterHashes objectAtIndexedSubscript:v5];
      NSUInteger v7 = [(NSArray *)self->_parameterHashes count] - 1;
      id v8 = [NSString alloc];
      uint64_t v9 = [v6 longLongValue];
      if (v7 <= v5) {
        v10 = @"%lld";
      }
      else {
        v10 = @"%lld,";
      }
      char v11 = objc_msgSend(v8, "initWithFormat:", v10, v9);
      [v3 appendString:v11];

      ++v5;
    }
    while ([(NSArray *)self->_parameterHashes count] > v5);
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(ATXDuetEvent *)self startDate];
  [v6 encodeObject:v4 forKey:@"codingKeyForDuetEventStartDate"];

  unint64_t v5 = [(ATXDuetEvent *)self endDate];
  [v6 encodeObject:v5 forKey:@"codingKeyForDuetEventEndDate"];

  [v6 encodeObject:self->_bundleId forKey:@"codingKeyForBundleId"];
  [v6 encodeObject:self->_actionType forKey:@"codingKeyForActionType"];
  [v6 encodeObject:self->_parameterHashes forKey:@"codingKeyForParamHashes"];
  [v6 encodeObject:self->_slotSetHashes forKey:@"codingKeyForSlotSetHashes"];
  [v6 encodeObject:self->_paramCount forKey:@"codingKeyForParamCount"];
  [v6 encodeObject:self->_alogId forKey:@"codingKeyForALogId"];
}

- (ATXAppIntentDuetEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  NSUInteger v7 = __atxlog_handle_anchor();
  id v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForDuetEventStartDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    char v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = __atxlog_handle_anchor();
    v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"codingKeyForDuetEventEndDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent" errorCode:-1 logHandle:v13];

    if (v14 && ([v4 error], v15 = objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      id v16 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v17 = objc_opt_class();
      id v18 = __atxlog_handle_anchor();
      char v19 = [v16 robustDecodeObjectOfClass:v17 forKey:@"codingKeyForBundleId" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent" errorCode:-1 logHandle:v18];

      if (v19
        && ([v4 error], id v20 = objc_claimAutoreleasedReturnValue(), v20, !v20))
      {
        uint64_t v21 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v22 = objc_opt_class();
        uint64_t v23 = __atxlog_handle_anchor();
        uint64_t v24 = [v21 robustDecodeObjectOfClass:v22 forKey:@"codingKeyForActionType" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent" errorCode:-1 logHandle:v23];

        if (v24
          && ([v4 error], v25 = objc_claimAutoreleasedReturnValue(), v25, !v25))
        {
          v53 = (void *)MEMORY[0x1E4F93B90];
          v26 = (void *)MEMORY[0x1D25F6CC0]();
          id v27 = objc_alloc(MEMORY[0x1E4F1CAD0]);
          uint64_t v28 = objc_opt_class();
          uint64_t v29 = objc_msgSend(v27, "initWithObjects:", v28, objc_opt_class(), 0);
          v30 = __atxlog_handle_anchor();
          uint64_t v31 = [v53 robustDecodeObjectOfClasses:v29 forKey:@"codingKeyForParamHashes" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent" errorCode:-1 logHandle:v30];

          if (v31
            && ([v4 error], v32 = objc_claimAutoreleasedReturnValue(), v32, !v32))
          {
            v54 = v31;
            v33 = (void *)MEMORY[0x1E4F93B90];
            contexta = (void *)MEMORY[0x1D25F6CC0]();
            id v34 = objc_alloc(MEMORY[0x1E4F1CAD0]);
            uint64_t v35 = objc_opt_class();
            id v36 = objc_msgSend(v34, "initWithObjects:", v35, objc_opt_class(), 0);
            id v37 = __atxlog_handle_anchor();
            objc_super v38 = [v33 robustDecodeObjectOfClasses:v36 forKey:@"codingKeyForSlotSetHashes" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent" errorCode:-1 logHandle:v37];

            if (v38
              && ([v4 error], v39 = objc_claimAutoreleasedReturnValue(), v39, !v39))
            {
              context = v38;
              v40 = (void *)MEMORY[0x1E4F93B90];
              uint64_t v41 = objc_opt_class();
              v42 = __atxlog_handle_anchor();
              v43 = [v40 robustDecodeObjectOfClass:v41 forKey:@"codingKeyForParamCount" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent" errorCode:-1 logHandle:v42];

              if (v43
                && ([v4 error], v44 = objc_claimAutoreleasedReturnValue(),
                                               v44,
                                               !v44))
              {
                v45 = (void *)MEMORY[0x1E4F93B90];
                uint64_t v46 = objc_opt_class();
                v47 = __atxlog_handle_anchor();
                v48 = [v45 robustDecodeObjectOfClass:v46 forKey:@"codingKeyForALogId" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXDuetEvent" errorCode:-1 logHandle:v47];

                if (v48
                  && ([v4 error],
                      v49 = objc_claimAutoreleasedReturnValue(),
                      v49,
                      !v49))
                {
                  self = [(ATXAppIntentDuetEvent *)self initWithBundleId:v19 actionType:v24 parameterHashes:v54 slotSetHashes:context paramCount:v43 startDate:v8 endDate:v14 alogId:v48];
                  v10 = self;
                }
                else
                {
                  v10 = 0;
                }
              }
              else
              {
                v10 = 0;
              }
              objc_super v38 = context;
            }
            else
            {
              v10 = 0;
            }

            uint64_t v31 = v54;
          }
          else
          {
            v10 = 0;
          }
        }
        else
        {
          v10 = 0;
        }
      }
      else
      {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSArray)parameterHashes
{
  return self->_parameterHashes;
}

- (NSArray)slotSetHashes
{
  return self->_slotSetHashes;
}

- (NSNumber)paramCount
{
  return self->_paramCount;
}

- (NSNumber)alogId
{
  return self->_alogId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alogId, 0);
  objc_storeStrong((id *)&self->_paramCount, 0);
  objc_storeStrong((id *)&self->_slotSetHashes, 0);
  objc_storeStrong((id *)&self->_parameterHashes, 0);
  objc_storeStrong((id *)&self->_actionType, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)initWithDKEvent:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Received AppIntent event but bundleId is 'unknown' or empty.", v2, v3, v4, v5, v6);
}

- (void)initWithDKEvent:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Received AppIntent event but actionType is empty or nil.", v2, v3, v4, v5, v6);
}

- (void)initWithDKEvent:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Value for metdata key 'intentClass' is not a string, %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithDKEvent:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Value for source key 'bundleID' is not a string, %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithCurrentContextStoreValues
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ContextStore's 'keyPathForIntentsDataDictionary' is not an NSDictionary.", v2, v3, v4, v5, v6);
}

@end