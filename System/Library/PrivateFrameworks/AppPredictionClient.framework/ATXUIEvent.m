@interface ATXUIEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)uiEventWithAppDirectoryEvent:(id)a3;
+ (id)uiEventWithHomeScreenEvent:(id)a3;
+ (id)uiEventWithLockscreenEvent:(id)a3;
+ (id)uiEventWithShortcutsEditorEvent:(id)a3;
+ (id)uiEventWithSpotlightEvent:(id)a3;
- (ATXProactiveSuggestionUIInteractionProtocol)event;
- (ATXUIEvent)initWithCoder:(id)a3;
- (ATXUIEvent)initWithConsumerSubType:(unsigned __int8)a3 event:(id)a4;
- (ATXUIEvent)initWithProto:(id)a3;
- (ATXUIEvent)initWithProtoData:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXUIEvent:(id)a3;
- (id)appDirectoryEvent;
- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3;
- (id)encodeAsProto;
- (id)homeScreenEvent;
- (id)json;
- (id)jsonDict;
- (id)lockscreenEvent;
- (id)proto;
- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4;
- (id)sessionProcessingOptionsForSessionType:(int64_t)a3;
- (id)shortcutsEditorEvent;
- (id)spotlightEvent;
- (unsigned)consumerSubType;
- (unsigned)consumerSubTypeForUIStream;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4;
@end

@implementation ATXUIEvent

- (unsigned)dataVersion
{
  return 2;
}

- (unsigned)consumerSubTypeForUIStream
{
  return self->_consumerSubType;
}

- (void).cxx_destruct
{
}

+ (id)uiEventWithHomeScreenEvent:(id)a3
{
  id v3 = a3;
  v4 = [[ATXUIEvent alloc] initWithConsumerSubType:34 event:v3];

  return v4;
}

- (ATXUIEvent)initWithConsumerSubType:(unsigned __int8)a3 event:(id)a4
{
  unsigned int v5 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXUIEvent;
  v8 = [(ATXUIEvent *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_consumerSubType = v5;
    objc_storeStrong((id *)&v8->_event, a4);
  }
  if (v5 > 0x2B || ((1 << v5) & 0x80C00600200) == 0)
  {
    v11 = __atxlog_handle_feedback();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXUIEvent initWithConsumerSubType:event:](v5);
    }
  }
  return v9;
}

- (id)encodeAsProto
{
  v2 = [(ATXUIEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (id)proto
{
  id v3 = objc_opt_new();
  v4 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_consumerSubType];
  -[ATXPBUIEvent setConsumerSubType:]((uint64_t)v3, v4);

  unsigned int v5 = [(ATXProactiveSuggestionUIInteractionProtocol *)self->_event encodeAsProto];
  -[ATXPBUIEvent setEvent:]((uint64_t)v3, v5);

  return v3;
}

+ (id)uiEventWithSpotlightEvent:(id)a3
{
  id v3 = a3;
  v4 = [[ATXUIEvent alloc] initWithConsumerSubType:9 event:v3];

  return v4;
}

+ (id)uiEventWithAppDirectoryEvent:(id)a3
{
  id v3 = a3;
  v4 = [[ATXUIEvent alloc] initWithConsumerSubType:35 event:v3];

  return v4;
}

+ (id)uiEventWithLockscreenEvent:(id)a3
{
  id v3 = a3;
  v4 = [[ATXUIEvent alloc] initWithConsumerSubType:22 event:v3];

  return v4;
}

+ (id)uiEventWithShortcutsEditorEvent:(id)a3
{
  id v3 = a3;
  v4 = [[ATXUIEvent alloc] initWithConsumerSubType:43 event:v3];

  return v4;
}

- (id)homeScreenEvent
{
  if (self->_consumerSubType == 34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = self->_event;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)spotlightEvent
{
  if (self->_consumerSubType == 9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = self->_event;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)appDirectoryEvent
{
  if (self->_consumerSubType == 35 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = self->_event;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)lockscreenEvent
{
  if (self->_consumerSubType == 22 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = self->_event;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)shortcutsEditorEvent
{
  if (self->_consumerSubType == 43 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = self->_event;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)sessionProcessingOptionsForSessionType:(int64_t)a3
{
  return (id)[(ATXProactiveSuggestionUIInteractionProtocol *)self->_event sessionProcessingOptionsForSessionType:a3];
}

- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  return (id)[(ATXProactiveSuggestionUIInteractionProtocol *)self->_event sessionIdentifierForSessionType:a3 uiCacheConsumerSubType:a4];
}

- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3
{
  return (id)[(ATXProactiveSuggestionUIInteractionProtocol *)self->_event blendingUICacheUpdateUUIDForUICacheConsumerSubType:a3];
}

- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
}

- (ATXUIEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unsigned int v5 = [[ATXPBUIEvent alloc] initWithData:v4];

    self = [(ATXUIEvent *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXUIEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      unsigned int v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXUIEvent initWithProto:]();
      }
      v8 = 0;
      goto LABEL_24;
    }
    unsigned int v5 = v4;
    v6 = -[ATXPBUIEvent consumerSubType]((uint64_t)v5);
    char v15 = 0;
    uint64_t v7 = [MEMORY[0x1E4F4B680] consumerSubtypeForString:v6 found:&v15];
    v8 = 0;
    if (!v15 || (uint64_t v9 = v7, !v7) || v7 == 48)
    {
LABEL_23:

LABEL_24:
      goto LABEL_25;
    }
    if ((int)v7 <= 33)
    {
      if (v7 == 9)
      {
        v10 = ATXSpotlightEvent;
        goto LABEL_21;
      }
      if (v7 == 22)
      {
        v10 = ATXLockscreenEvent;
        goto LABEL_21;
      }
    }
    else
    {
      switch(v7)
      {
        case '""':
          v10 = ATXHomeScreenEvent;
          goto LABEL_21;
        case '#':
          v10 = ATXAppDirectoryEvent;
          goto LABEL_21;
        case '+':
          v10 = (__objc2_class *)MEMORY[0x1E4F93990];
LABEL_21:
          id v11 = [v10 alloc];
          objc_super v12 = -[ATXPBUIEvent event]((uint64_t)v5);
          v13 = [v11 initWithProtoData:v12];

          self = [(ATXUIEvent *)self initWithConsumerSubType:v9 event:v13];
          v8 = self;
LABEL_22:

          goto LABEL_23;
      }
    }
    v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      [(ATXUIEvent *)(uint64_t)self initWithProto:v13];
    }
    v8 = 0;
    goto LABEL_22;
  }
  v8 = 0;
LABEL_25:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    char v15 = [v12 error];

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
  id v5 = [(ATXUIEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXUIEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"protobufData"];

  v6 = [(ATXUIEvent *)self initWithProtoData:v5];
  return v6;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 2)
  {
    id v5 = a3;
    v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)jsonDict
{
  v15[2] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  event = self->_event;
  if (isKindOfClass) {
    goto LABEL_5;
  }
  objc_opt_class();
  char v5 = objc_opt_isKindOfClass();
  event = self->_event;
  if ((v5 & 1) != 0
    || (objc_opt_class(), char v6 = objc_opt_isKindOfClass(), event = self->_event, (v6 & 1) != 0)
    || (objc_opt_class(), char v7 = objc_opt_isKindOfClass(), event = self->_event, (v7 & 1) != 0))
  {
LABEL_5:
    v8 = event;
LABEL_6:
    uint64_t v9 = [(ATXProactiveSuggestionUIInteractionProtocol *)v8 jsonDict];
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v8 = self->_event;
    goto LABEL_6;
  }
  uint64_t v9 = objc_opt_new();
LABEL_7:
  v10 = (void *)v9;
  v14[0] = @"consumerSubType";
  id v11 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:self->_consumerSubType];
  v14[1] = @"event";
  v15[0] = v11;
  v15[1] = v10;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];

  return v12;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(ATXUIEvent *)self jsonDict];
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXUIEvent *)a3;
  char v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXUIEvent *)self isEqualToATXUIEvent:v5];

  return v6;
}

- (BOOL)isEqualToATXUIEvent:(id)a3
{
  id v4 = a3;
  int consumerSubType = self->_consumerSubType;
  if (consumerSubType == [v4 consumerSubType])
  {
    BOOL v6 = self->_event;
    char v7 = v6;
    if (v6 == (ATXProactiveSuggestionUIInteractionProtocol *)v4[2]) {
      char v8 = 1;
    }
    else {
      char v8 = -[ATXProactiveSuggestionUIInteractionProtocol isEqual:](v6, "isEqual:");
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unsigned)consumerSubType
{
  return self->_consumerSubType;
}

- (ATXProactiveSuggestionUIInteractionProtocol)event
{
  return self->_event;
}

- (void)initWithConsumerSubType:(unsigned __int8)a1 event:.cold.1(unsigned __int8 a1)
{
  v1 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a1];
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "initializing ATXUIEvent with invalid consumerSubType: %@", v4, v5, v6, v7, 2u);
}

- (void)initWithProto:(NSObject *)a3 .cold.1(uint64_t a1, unsigned __int8 a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  uint64_t v7 = [MEMORY[0x1E4F4B680] stringForConsumerSubtype:a2];
  int v8 = 138412546;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_fault_impl(&dword_1A790D000, a3, OS_LOG_TYPE_FAULT, "%@: in initWithProto, unhandled consumerSubType of: %@", (uint8_t *)&v8, 0x16u);
}

- (void)initWithProto:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_0_1(&dword_1A790D000, v2, v3, "%@: tried to initialize with a non-ATXPBUIEvent proto", v4, v5, v6, v7, 2u);
}

@end