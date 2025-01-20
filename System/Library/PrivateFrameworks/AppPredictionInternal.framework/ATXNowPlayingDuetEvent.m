@interface ATXNowPlayingDuetEvent
+ (BOOL)supportsSecureCoding;
- (ATXNowPlayingDuetEvent)initWithBundleId:(id)a3 track:(id)a4 nowPlayingState:(int64_t)a5 startDate:(id)a6 endDate:(id)a7;
- (ATXNowPlayingDuetEvent)initWithCoder:(id)a3;
- (ATXNowPlayingDuetEvent)initWithCurrentContextStoreValues;
- (ATXNowPlayingDuetEvent)initWithDKEvent:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (NSString)bundleId;
- (NSString)track;
- (id)description;
- (id)identifier;
- (int64_t)nowPlayingState;
- (void)encodeWithCoder:(id)a3;
- (void)initWithCurrentContextStoreValues;
@end

@implementation ATXNowPlayingDuetEvent

- (ATXNowPlayingDuetEvent)initWithBundleId:(id)a3 track:(id)a4 nowPlayingState:(int64_t)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)ATXNowPlayingDuetEvent;
  v14 = [(ATXDuetEvent *)&v20 initWithStartDate:a6 endDate:a7];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    bundleId = v14->_bundleId;
    v14->_bundleId = (NSString *)v15;

    uint64_t v17 = [v13 copy];
    track = v14->_track;
    v14->_track = (NSString *)v17;

    v14->_nowPlayingState = a5;
  }

  return v14;
}

- (ATXNowPlayingDuetEvent)initWithDKEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"ATXNowPlayingDuetEvent.m", 50, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v6 = [v5 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [v5 value];
    v9 = [v8 stringValue];

    if ([v9 isEqualToString:@"unknown"])
    {
      v10 = __atxlog_handle_default();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ATXNowPlayingDuetEvent initWithDKEvent:]();
      }
    }
    else
    {
      id v12 = +[_ATXAppIconState sharedInstance];
      id v13 = [v12 allInstalledAppsKnownToSpringBoard];
      char v14 = [v13 containsObject:v9];

      if (v14)
      {
        uint64_t v15 = [v5 metadata];
        v16 = [MEMORY[0x1E4F5B5A0] title];
        v10 = [v15 objectForKeyedSubscript:v16];

        if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          uint64_t v17 = [v5 metadata];
          v18 = [MEMORY[0x1E4F5B5A0] playing];
          v19 = [v17 objectForKeyedSubscript:v18];
          uint64_t v20 = [v19 integerValue];

          if (v20)
          {
            v21 = [v5 startDate];
            v22 = [v5 endDate];
            self = [(ATXNowPlayingDuetEvent *)self initWithBundleId:v9 track:v10 nowPlayingState:v20 startDate:v21 endDate:v22];

            v11 = self;
LABEL_21:

            goto LABEL_22;
          }
          v23 = __atxlog_handle_default();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[ATXNowPlayingDuetEvent initWithDKEvent:]();
          }
        }
        else
        {
          v23 = __atxlog_handle_default();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            -[ATXNowPlayingDuetEvent initWithDKEvent:]((uint64_t)v10, v23);
          }
        }
      }
      else
      {
        v10 = __atxlog_handle_default();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[ATXNowPlayingDuetEvent initWithDKEvent:].cold.4();
        }
      }
    }
    v11 = 0;
    goto LABEL_21;
  }
  v9 = __atxlog_handle_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[ATXNowPlayingDuetEvent initWithDKEvent:].cold.5(v5, v9);
  }
  v11 = 0;
LABEL_22:

  return v11;
}

- (ATXNowPlayingDuetEvent)initWithCurrentContextStoreValues
{
  v3 = [MEMORY[0x1E4F5B6A8] userContext];
  v4 = [MEMORY[0x1E4F5B6B8] keyPathForNowPlayingDataDictionary];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5)
  {
    v31 = __atxlog_handle_default();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[ATXNowPlayingDuetEvent initWithCurrentContextStoreValues]();
    }

    goto LABEL_26;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v32 = __atxlog_handle_default();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[ATXNowPlayingDuetEvent initWithCurrentContextStoreValues].cold.5();
    }

    v33 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v34 = *MEMORY[0x1E4F1C3B8];
    v35 = @"ContextStore's 'keyPathForNowPlayingDataDictionary' is not an NSDictionary.";
    goto LABEL_25;
  }
  v6 = [MEMORY[0x1E4F5B6B8] nowPlayingStatusKey];
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v36 = __atxlog_handle_default();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
      -[ATXNowPlayingDuetEvent initWithCurrentContextStoreValues].cold.4();
    }

    v33 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v34 = *MEMORY[0x1E4F1C3B8];
    v35 = @"Value for 'nowPlayingStatusKey' in ContextStore's 'keyPathForNowPlayingDataDictionary' is not an NSNumber.";
    goto LABEL_25;
  }
  v9 = [MEMORY[0x1E4F5B6B8] nowPlayingStatusKey];
  v10 = [v5 objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 integerValue];

  id v12 = [MEMORY[0x1E4F5B6B8] nowPlayingBundleIdKey];
  id v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  char v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) == 0)
  {
    v37 = __atxlog_handle_default();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[ATXNowPlayingDuetEvent initWithCurrentContextStoreValues]();
    }

    v33 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v34 = *MEMORY[0x1E4F1C3B8];
    v35 = @"Value for 'nowPlayingBundleIdKey' in ContextStore's 'keyPathForNowPlayingDataDictionary' is not an NSString.";
LABEL_25:
    [v33 raise:v34 format:v35];
LABEL_26:
    v30 = 0;
    goto LABEL_27;
  }
  uint64_t v15 = [MEMORY[0x1E4F5B6B8] nowPlayingBundleIdKey];
  uint64_t v16 = [v5 objectForKeyedSubscript:v15];
  uint64_t v17 = (void *)v16;
  if (v16) {
    v18 = (__CFString *)v16;
  }
  else {
    v18 = &stru_1F2740B58;
  }
  v19 = v18;

  uint64_t v20 = [MEMORY[0x1E4F5B6B8] nowPlayingTrackKey];
  v21 = [v5 objectForKeyedSubscript:v20];
  objc_opt_class();
  char v22 = objc_opt_isKindOfClass();

  if (v22)
  {
    v23 = [MEMORY[0x1E4F5B6B8] nowPlayingTrackKey];
    uint64_t v24 = [v5 objectForKeyedSubscript:v23];
    v25 = (void *)v24;
    if (v24) {
      v26 = (__CFString *)v24;
    }
    else {
      v26 = &stru_1F2740B58;
    }
    v27 = v26;

    v28 = [MEMORY[0x1E4F1C9C8] date];
    v29 = [(ATXNowPlayingDuetEvent *)self initWithBundleId:v19 track:v27 nowPlayingState:v11 startDate:v28 endDate:v28];

    self = v29;
    v30 = self;
  }
  else
  {
    v39 = __atxlog_handle_default();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[ATXNowPlayingDuetEvent initWithCurrentContextStoreValues]();
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Value for 'nowPlayingTrackKey' in ContextStore's 'keyPathForNowPlayingDataDictionary' is not an NSString."];
    v30 = 0;
  }

LABEL_27:
  return v30;
}

- (id)identifier
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"%@ - %@ - %ld", self->_bundleId, self->_track, self->_nowPlayingState];
  return v2;
}

- (id)description
{
  id v3 = [NSString alloc];
  bundleId = self->_bundleId;
  track = self->_track;
  int64_t nowPlayingState = self->_nowPlayingState;
  v7 = [(ATXDuetEvent *)self startDate];
  v8 = [(ATXDuetEvent *)self endDate];
  v9 = (void *)[v3 initWithFormat:@"App bundleId: %@, Track: %@, Now playing status: %ld, start date: %@, end date: %@", bundleId, track, nowPlayingState, v7, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    uint64_t v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      uint64_t v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
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
  id v8 = a3;
  v4 = [(ATXDuetEvent *)self startDate];
  [v8 encodeObject:v4 forKey:@"codingKeyForStartDate"];

  id v5 = [(ATXDuetEvent *)self endDate];
  [v8 encodeObject:v5 forKey:@"codingKeyForEndDate"];

  v6 = [(ATXNowPlayingDuetEvent *)self bundleId];
  [v8 encodeObject:v6 forKey:@"codingKeyForBundleId"];

  v7 = [(ATXNowPlayingDuetEvent *)self track];
  [v8 encodeObject:v7 forKey:@"codingKeyForTrack"];

  objc_msgSend(v8, "encodeInteger:forKey:", -[ATXNowPlayingDuetEvent nowPlayingState](self, "nowPlayingState"), @"codingKeyForNowPlayingState");
}

- (ATXNowPlayingDuetEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_anchor();
  id v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForStartDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.NowPlaying" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    id v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    id v13 = __atxlog_handle_anchor();
    BOOL v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"codingKeyForEndDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.NowPlaying" errorCode:-1 logHandle:v13];

    if (v14 && ([v4 error], uint64_t v15 = objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      id v16 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v17 = objc_opt_class();
      v18 = __atxlog_handle_anchor();
      v19 = [v16 robustDecodeObjectOfClass:v17 forKey:@"codingKeyForBundleId" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.NowPlaying" errorCode:-1 logHandle:v18];

      if (v19
        && ([v4 error], uint64_t v20 = objc_claimAutoreleasedReturnValue(), v20, !v20))
      {
        uint64_t v21 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v22 = objc_opt_class();
        v23 = __atxlog_handle_anchor();
        uint64_t v24 = [v21 robustDecodeObjectOfClass:v22 forKey:@"codingKeyForTrack" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.NowPlaying" errorCode:-1 logHandle:v23];

        if (!v24
          || ([v4 error], v25 = objc_claimAutoreleasedReturnValue(), v25, v25)
          || (uint64_t v26 = [v4 decodeIntegerForKey:@"codingKeyForNowPlayingState"],
              [(ATXNowPlayingDuetEvent *)self checkAndReportDecodingFailureIfNeededForNSInteger:v26 key:@"codingKeyForNowPlayingState" coder:v4 errorDomain:@"com.apple.proactive.ATXDuetEvent.NowPlaying" errorCode:-1]))
        {
          v10 = 0;
        }
        else
        {
          self = [(ATXNowPlayingDuetEvent *)self initWithBundleId:v19 track:v24 nowPlayingState:v26 startDate:v8 endDate:v14];
          v10 = self;
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

- (NSString)track
{
  return self->_track;
}

- (int64_t)nowPlayingState
{
  return self->_nowPlayingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_track, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)initWithDKEvent:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Received now playing event but bundleId is 'unknown'.", v2, v3, v4, v5, v6);
}

- (void)initWithDKEvent:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Value for metadata key for NowPlaying 'title' is not a string, %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithDKEvent:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Value for metadata key for NowPlaying 'playing' is 'unknown'.", v2, v3, v4, v5, v6);
}

- (void)initWithDKEvent:.cold.4()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "Skipping apps not on SpringBoard.", v1, 2u);
}

- (void)initWithDKEvent:(void *)a1 .cold.5(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 value];
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint8_t v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  int v8 = 138412546;
  v9 = v5;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Value of _DKEvent was %@, not %@", (uint8_t *)&v8, 0x16u);
}

- (void)initWithCurrentContextStoreValues
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ContextStore's 'keyPathForNowPlayingDataDictionary' is not an NSDictionary.", v2, v3, v4, v5, v6);
}

@end