@interface ATXModeBiomeEventContextWrapper
+ (BOOL)supportsSecureCoding;
+ (id)wrapEventStream:(id)a3 modeTransitionStream:(id)a4 startingContext:(id)a5;
+ (id)wrapEventStreams:(id)a3 modeTransitionStream:(id)a4 startingContext:(id)a5;
- (ATXModeBiomeEventContextWrapper)init;
- (ATXModeBiomeEventContextWrapper)initWithCoder:(id)a3;
- (ATXModeBiomeEventContextWrapper)initWithData:(id)a3;
- (ATXModeBiomeEventContextWrapper)initWithPath:(id)a3;
- (ATXModeBiomeEventContextWrapper)initWithPreviousContext:(id)a3 nextEvent:(id)a4;
- (ATXModeBiomeEventContextWrapper)initWithTransitionEvent:(id)a3 eventToWrap:(id)a4;
- (ATXTimedEventProtocol)wrappedEvent;
- (ATXUnifiedInferredActivityTransition)mostRecentModeTransition;
- (BOOL)_fileExistsAtPath:(id)a3;
- (id)_dataFromPath:(id)a3;
- (id)eventTime;
- (id)serialize:(id *)a3;
- (unint64_t)currentActivityType;
- (void)encodeWithCoder:(id)a3;
- (void)persistToPath:(id)a3;
- (void)setMostRecentModeTransition:(id)a3;
- (void)setWrappedEvent:(id)a3;
@end

@implementation ATXModeBiomeEventContextWrapper

- (ATXModeBiomeEventContextWrapper)initWithPreviousContext:(id)a3 nextEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v8 = [v6 mostRecentModeTransition];
    v15 = self;
    id v16 = v8;
    id v17 = v7;
LABEL_6:
    v14 = [(ATXModeBiomeEventContextWrapper *)v15 initWithTransitionEvent:v16 eventToWrap:v17];
    goto LABEL_7;
  }
  id v8 = v7;
  v9 = [v6 wrappedEvent];
  v10 = [v9 eventTime];
  v11 = [v8 eventTime];
  uint64_t v12 = [v10 compare:v11];

  if (v12 == -1)
  {
    v15 = self;
    id v16 = v8;
    id v17 = 0;
    goto LABEL_6;
  }
  v13 = [v6 wrappedEvent];
  v14 = [(ATXModeBiomeEventContextWrapper *)self initWithTransitionEvent:v8 eventToWrap:v13];

LABEL_7:
  return v14;
}

- (ATXModeBiomeEventContextWrapper)initWithTransitionEvent:(id)a3 eventToWrap:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ATXModeBiomeEventContextWrapper;
  id v8 = [(ATXModeBiomeEventContextWrapper *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(ATXModeBiomeEventContextWrapper *)v8 setMostRecentModeTransition:v6];
    [(ATXModeBiomeEventContextWrapper *)v9 setWrappedEvent:v7];
  }

  return v9;
}

- (ATXModeBiomeEventContextWrapper)init
{
  id v3 = [[ATXUnifiedInferredActivityTransition alloc] initFromTransitionTime:1 isEntryEvent:@"computedModeActivity" source:14 activityType:0.0 confidence:1.0];
  v4 = [(ATXModeBiomeEventContextWrapper *)self initWithTransitionEvent:v3 eventToWrap:0];

  return v4;
}

- (unint64_t)currentActivityType
{
  id v3 = [(ATXModeBiomeEventContextWrapper *)self mostRecentModeTransition];

  if (!v3) {
    return 14;
  }
  v4 = [(ATXModeBiomeEventContextWrapper *)self mostRecentModeTransition];
  if ([v4 isEntryEvent])
  {
    v5 = [(ATXModeBiomeEventContextWrapper *)self mostRecentModeTransition];
    unint64_t v6 = [v5 inferredActivityType];
  }
  else
  {
    unint64_t v6 = 14;
  }

  return v6;
}

- (id)eventTime
{
  id v3 = [(ATXModeBiomeEventContextWrapper *)self wrappedEvent];
  v4 = [v3 eventTime];

  v5 = [(ATXModeBiomeEventContextWrapper *)self mostRecentModeTransition];
  unint64_t v6 = [v5 eventTime];

  if (v4)
  {
    if (v6)
    {
      id v7 = [v4 laterDate:v6];
    }
    else
    {
      id v7 = v4;
    }
  }
  else
  {
    id v7 = v6;
  }
  id v8 = v7;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXModeBiomeEventContextWrapper *)self mostRecentModeTransition];
  [v4 encodeObject:v5 forKey:@"transition"];
}

- (ATXModeBiomeEventContextWrapper)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F93B90];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_default();
  id v8 = [v4 robustDecodeObjectOfClass:v6 forKey:@"transition" withCoder:v5 expectNonNull:0 errorDomain:@"com.apple.proactive.ATXModeBiomeEventContextWrapper" errorCode:-1 logHandle:v7];

  v9 = [(ATXModeBiomeEventContextWrapper *)self initWithTransitionEvent:v8 eventToWrap:0];
  return v9;
}

- (BOOL)_fileExistsAtPath:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  id v5 = [v3 defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  return v6;
}

- (id)_dataFromPath:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ([(ATXModeBiomeEventContextWrapper *)self _fileExistsAtPath:v4])
    {
      id v5 = [MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:v4];
      char v6 = v5;
      if (v5)
      {
        id v15 = 0;
        id v7 = [v5 readDataToEndOfFileAndReturnError:&v15];
        id v8 = v15;
        v9 = v8;
        if (!v7 || v8)
        {
          v13 = __atxlog_handle_default();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[ATXModeBiomeEventContextWrapper _dataFromPath:]();
          }

          id v10 = 0;
        }
        else
        {
          id v10 = v7;
        }
      }
      else
      {
        v9 = __atxlog_handle_default();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[ATXModeBiomeEventContextWrapper _dataFromPath:](v9);
        }
        id v10 = 0;
      }
    }
    else
    {
      char v6 = __atxlog_handle_default();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_super v11 = (objc_class *)objc_opt_class();
        uint64_t v12 = NSStringFromClass(v11);
        *(_DWORD *)buf = 138412546;
        id v17 = v12;
        __int16 v18 = 2112;
        id v19 = v4;
        _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_INFO, "%@ - file doesn't exist at path %@", buf, 0x16u);
      }
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (ATXModeBiomeEventContextWrapper)initWithData:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1D25F6CC0]();
    id v12 = 0;
    char v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:&v12];
    id v7 = v12;
    if (v7)
    {
      id v8 = __atxlog_handle_default();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[ATXModeBiomeEventContextWrapper initWithData:]();
      }

      v9 = [(ATXModeBiomeEventContextWrapper *)self init];
    }
    else
    {
      v9 = [(ATXModeBiomeEventContextWrapper *)self initWithCoder:v6];
    }
    id v10 = v9;
  }
  else
  {
    id v10 = [(ATXModeBiomeEventContextWrapper *)self init];
  }

  return v10;
}

- (ATXModeBiomeEventContextWrapper)initWithPath:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1D25F6CC0]();
  char v6 = [(ATXModeBiomeEventContextWrapper *)self _dataFromPath:v4];
  id v7 = [(ATXModeBiomeEventContextWrapper *)self initWithData:v6];

  return v7;
}

- (id)serialize:(id *)a3
{
  id v5 = (void *)MEMORY[0x1D25F6CC0](self, a2);
  id v12 = 0;
  char v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v12];
  id v7 = v12;
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    id v10 = v6;
  }
  else
  {
    v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(ATXModeBiomeEventContextWrapper *)(uint64_t)self serialize:v9];
    }

    id v10 = 0;
    if (a3) {
      *a3 = v7;
    }
  }

  return v10;
}

- (void)persistToPath:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ATXModeBiomeEventContextWrapper persistToPath:]();
    }

    char v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C3B8];
    BOOL v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    [v6 raise:v7, @"%@ - Attempting to persist with a nil path", v9 format];
  }
  id v15 = 0;
  id v10 = [(ATXModeBiomeEventContextWrapper *)self serialize:&v15];
  id v11 = v15;
  if (v11)
  {
    id v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXModeBiomeEventContextWrapper persistToPath:]();
    }
LABEL_11:

    goto LABEL_12;
  }
  v13 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v14 = [v13 createFileAtPath:v4 contents:v10 attributes:0];

  if ((v14 & 1) == 0)
  {
    id v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXModeBiomeEventContextWrapper persistToPath:]();
    }
    goto LABEL_11;
  }
LABEL_12:
}

+ (id)wrapEventStreams:(id)a3 modeTransitionStream:(id)a4 startingContext:(id)a5
{
  id v7 = a5;
  BOOL v8 = [a4 orderedMergeWithOthers:a3 comparator:&__block_literal_global_99];
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  id v10 = v9;
  id v11 = [v8 scanWithInitial:v9 nextPartialResult:&__block_literal_global_23_1];

  return v11;
}

uint64_t __89__ATXModeBiomeEventContextWrapper_wrapEventStreams_modeTransitionStream_startingContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 eventTime];
  char v6 = [v4 eventTime];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

ATXModeBiomeEventContextWrapper *__89__ATXModeBiomeEventContextWrapper_wrapEventStreams_modeTransitionStream_startingContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  char v6 = [[ATXModeBiomeEventContextWrapper alloc] initWithPreviousContext:v5 nextEvent:v4];

  return v6;
}

+ (id)wrapEventStream:(id)a3 modeTransitionStream:(id)a4 startingContext:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  BOOL v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 arrayWithObjects:&v15 count:1];

  v13 = objc_msgSend(a1, "wrapEventStreams:modeTransitionStream:startingContext:", v12, v10, v9, v15, v16);

  return v13;
}

- (ATXUnifiedInferredActivityTransition)mostRecentModeTransition
{
  return self->_mostRecentModeTransition;
}

- (void)setMostRecentModeTransition:(id)a3
{
}

- (ATXTimedEventProtocol)wrappedEvent
{
  return self->_wrappedEvent;
}

- (void)setWrappedEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappedEvent, 0);
  objc_storeStrong((id *)&self->_mostRecentModeTransition, 0);
}

- (void)_dataFromPath:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "Unable to acquire readonly handle to cache file.", v1, 2u);
}

- (void)_dataFromPath:.cold.2()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1D0FA3000, v1, OS_LOG_TYPE_ERROR, "Unable to read data from file handle %@ - %@", v2, 0x16u);
}

- (void)initWithData:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_ERROR, "Unable to initialize coder for data, err: %@", v1, 0xCu);
}

- (void)serialize:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = (objc_class *)objc_opt_class();
  char v6 = NSStringFromClass(v5);
  OUTLINED_FUNCTION_0_4();
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1D0FA3000, a3, OS_LOG_TYPE_ERROR, "%@ - could not archive self with error: %@", v7, 0x16u);
}

- (void)persistToPath:.cold.1()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "%@ - Failed to write to disk", v4, v5, v6, v7, v8);
}

- (void)persistToPath:.cold.2()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "%@ - Failed to serialize", v4, v5, v6, v7, v8);
}

- (void)persistToPath:.cold.3()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0FA3000, v2, v3, "%@ - Attempting to persist with a nil path", v4, v5, v6, v7, v8);
}

@end