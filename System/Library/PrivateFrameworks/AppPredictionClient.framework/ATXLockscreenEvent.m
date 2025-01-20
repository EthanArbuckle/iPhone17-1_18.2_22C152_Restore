@interface ATXLockscreenEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXLockscreenEvent)initWithAbsoluteDate:(double)a3 eventType:(int)a4 blendingCacheId:(id)a5 suggestionIds:(id)a6;
- (ATXLockscreenEvent)initWithCoder:(id)a3;
- (ATXLockscreenEvent)initWithDate:(id)a3 eventType:(int)a4 blendingCacheId:(id)a5 suggestionIds:(id)a6;
- (ATXLockscreenEvent)initWithProto:(id)a3;
- (ATXLockscreenEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXLockscreenEvent:(id)a3;
- (NSArray)suggestionIds;
- (NSDate)date;
- (NSUUID)blendingCacheId;
- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3;
- (id)encodeAsProto;
- (id)jsonDict;
- (id)proto;
- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4;
- (id)sessionProcessingOptionsForSessionType:(int64_t)a3;
- (int)eventType;
- (unint64_t)hash;
- (unsigned)consumerSubTypeForUIStream;
- (unsigned)dataVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setBlendingCacheId:(id)a3;
- (void)setDate:(id)a3;
- (void)setEventType:(int)a3;
- (void)setSuggestionIds:(id)a3;
- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4;
@end

@implementation ATXLockscreenEvent

- (ATXLockscreenEvent)initWithDate:(id)a3 eventType:(int)a4 blendingCacheId:(id)a5 suggestionIds:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = a5;
  [a3 timeIntervalSince1970];
  v12 = -[ATXLockscreenEvent initWithAbsoluteDate:eventType:blendingCacheId:suggestionIds:](self, "initWithAbsoluteDate:eventType:blendingCacheId:suggestionIds:", v7, v11, v10);

  return v12;
}

- (ATXLockscreenEvent)initWithAbsoluteDate:(double)a3 eventType:(int)a4 blendingCacheId:(id)a5 suggestionIds:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ATXLockscreenEvent;
  v13 = [(ATXLockscreenEvent *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->_absoluteDate = a3;
    v13->_eventType = a4;
    objc_storeStrong((id *)&v13->_blendingCacheId, a5);
    objc_storeStrong((id *)&v14->_suggestionIds, a6);
  }

  return v14;
}

- (NSDate)date
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:self->_absoluteDate];

  return (NSDate *)v2;
}

- (void)setDate:(id)a3
{
  [a3 timeIntervalSince1970];
  self->_absoluteDate = v4;
}

- (unsigned)consumerSubTypeForUIStream
{
  return 22;
}

- (id)blendingUICacheUpdateUUIDForUICacheConsumerSubType:(unsigned __int8)a3
{
  return self->_blendingCacheId;
}

- (id)sessionIdentifierForSessionType:(int64_t)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  return @"lockscreen";
}

- (id)sessionProcessingOptionsForSessionType:(int64_t)a3
{
  int v3 = self->_eventType - 2;
  if (v3 > 2) {
    return &unk_1EFDF49E0;
  }
  else {
    return (id)qword_1E5D07FA8[v3];
  }
}

- (void)updateUIFeedbackSession:(id)a3 uiCacheConsumerSubType:(unsigned __int8)a4
{
  id v5 = a3;
  int eventType = self->_eventType;
  id v10 = v5;
  if (eventType == 3)
  {
    suggestionIds = self->_suggestionIds;
    v8 = 0;
LABEL_7:
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  if (eventType == 2)
  {
    v8 = self->_suggestionIds;
    suggestionIds = 0;
    goto LABEL_7;
  }
  if (eventType != 1) {
    goto LABEL_9;
  }
  uint64_t v7 = self->_suggestionIds;
  v8 = 0;
  suggestionIds = 0;
LABEL_8:
  [v5 updateEngagedUUIDs:v8 rejectedUUIDs:suggestionIds shownUUIDs:v7];
  id v5 = v10;
LABEL_9:
  [v5 updateConsumerSubTypeIfUnset:22];
  [v10 updateBlendingUICacheUpdateUUIDIfUnset:self->_blendingCacheId];
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
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
  v16[4] = *MEMORY[0x1E4F143B8];
  int v3 = [(NSArray *)self->_suggestionIds _pas_mappedArrayWithTransform:&__block_literal_global_50];
  v15[0] = @"date";
  double v4 = NSNumber;
  id v5 = [(ATXLockscreenEvent *)self date];
  [v5 timeIntervalSinceReferenceDate];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  v16[0] = v6;
  v15[1] = @"eventType";
  unsigned int v7 = self->_eventType - 1;
  if (v7 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E5D07FC0[v7];
  }
  v16[1] = v8;
  v15[2] = @"blendingCacheId";
  uint64_t v9 = [(NSUUID *)self->_blendingCacheId UUIDString];
  id v10 = (void *)v9;
  id v11 = @"nil";
  if (v9) {
    id v12 = (__CFString *)v9;
  }
  else {
    id v12 = @"nil";
  }
  v15[3] = @"suggestionIds";
  if (v3) {
    id v11 = v3;
  }
  v16[2] = v12;
  v16[3] = v11;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];

  return v13;
}

uint64_t __30__ATXLockscreenEvent_jsonDict__block_invoke(uint64_t a1, void *a2)
{
  return [a2 UUIDString];
}

- (id)encodeAsProto
{
  v2 = [(ATXLockscreenEvent *)self proto];
  int v3 = [v2 data];

  return v3;
}

- (ATXLockscreenEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_10:
    id v12 = 0;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = __atxlog_handle_default();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[ATXLockscreenEvent initWithProto:]((uint64_t)self, v11);
    }

    goto LABEL_10;
  }
  id v5 = v4;
  if (-[ATXPBLockscreenEvent hasDate]((uint64_t)v5)
    && (double v6 = -[ATXPBLockscreenEvent date]((uint64_t)v5), -[ATXPBLockscreenEvent hasEventType]((uint64_t)v5)))
  {
    uint64_t v7 = -[ATXPBLockscreenEvent eventType]((uint64_t)v5);
    if (-[ATXPBLockscreenEvent hasBlendingCacheId]((BOOL)v5))
    {
      id v8 = objc_alloc(MEMORY[0x1E4F29128]);
      uint64_t v9 = -[ATXPBLockscreenEvent blendingCacheId]((uint64_t)v5);
      id v10 = (void *)[v8 initWithUUIDString:v9];
    }
    else
    {
      id v10 = 0;
    }
    v13 = -[ATXPBLockscreenEvent suggestionIds]((uint64_t)v5);
    v14 = objc_msgSend(v13, "_pas_mappedArrayWithTransform:", &__block_literal_global_40_0);

    self = [(ATXLockscreenEvent *)self initWithAbsoluteDate:v7 eventType:v10 blendingCacheId:v14 suggestionIds:v6];
    id v12 = self;
  }
  else
  {
    id v12 = 0;
  }

LABEL_15:
  return v12;
}

id __36__ATXLockscreenEvent_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

- (ATXLockscreenEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[ATXPBLockscreenEvent alloc] initWithData:v4];

    self = [(ATXLockscreenEvent *)self initWithProto:v5];
    double v6 = self;
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)proto
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  -[ATXPBLockscreenEvent setDate:]((uint64_t)v3, self->_absoluteDate);
  -[ATXPBLockscreenEvent setEventType:]((uint64_t)v3, self->_eventType);
  blendingCacheId = self->_blendingCacheId;
  if (blendingCacheId)
  {
    id v5 = [(NSUUID *)blendingCacheId UUIDString];
    -[ATXPBLockscreenEvent setBlendingCacheId:]((uint64_t)v3, v5);
  }
  if (self->_suggestionIds)
  {
    double v6 = objc_opt_new();
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = self->_suggestionIds;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "UUIDString", (void)v14);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }

    -[ATXPBLockscreenEvent setSuggestionIds:]((uint64_t)v3, v6);
  }

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXLockscreenEvent *)self encodeAsProto];
  [v4 encodeObject:v5 forKey:@"protobufData"];
}

- (ATXLockscreenEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = __atxlog_handle_default();
  uint64_t v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"protobufData" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.duetexpertd.ATXLockscreenEvent" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    self = [(ATXLockscreenEvent *)self initWithProtoData:v8];
    uint64_t v10 = self;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXLockscreenEvent *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXLockscreenEvent *)self isEqualToATXLockscreenEvent:v5];

  return v6;
}

- (BOOL)isEqualToATXLockscreenEvent:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  double v6 = self->_absoluteDate - *((double *)v4 + 1);
  if (v6 < 0.0) {
    double v6 = -v6;
  }
  if (v6 > 2.22044605e-16 || self->_eventType != *((_DWORD *)v4 + 4)) {
    goto LABEL_7;
  }
  blendingCacheId = self->_blendingCacheId;
  uint64_t v8 = (NSUUID *)*((id *)v4 + 3);
  if (blendingCacheId == v8)
  {
  }
  else
  {
    uint64_t v9 = v8;
    uint64_t v10 = blendingCacheId;
    char v11 = [(NSUUID *)v10 isEqual:v9];

    if ((v11 & 1) == 0)
    {
LABEL_7:
      char v12 = 0;
      goto LABEL_8;
    }
  }
  long long v14 = self->_suggestionIds;
  long long v15 = v14;
  if (v14 == (NSArray *)v5[4]) {
    char v12 = 1;
  }
  else {
    char v12 = -[NSArray isEqual:](v14, "isEqual:");
  }

LABEL_8:
  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = self->_eventType - (unint64_t)self->_absoluteDate + 32 * (unint64_t)self->_absoluteDate;
  uint64_t v4 = [(NSUUID *)self->_blendingCacheId hash] - v3 + 32 * v3;
  return [(NSArray *)self->_suggestionIds hash] - v4 + 32 * v4;
}

- (int)eventType
{
  return self->_eventType;
}

- (void)setEventType:(int)a3
{
  self->_int eventType = a3;
}

- (NSUUID)blendingCacheId
{
  return self->_blendingCacheId;
}

- (void)setBlendingCacheId:(id)a3
{
}

- (NSArray)suggestionIds
{
  return self->_suggestionIds;
}

- (void)setSuggestionIds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionIds, 0);

  objc_storeStrong((id *)&self->_blendingCacheId, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  double v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBLockscreenEvent proto", (uint8_t *)&v5, 0xCu);
}

@end