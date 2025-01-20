@interface ATXERMEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (ATXERMEvent)initWithEventDate:(id)a3 eventType:(unint64_t)a4 recordEntry:(id)a5 clientModelIds:(id)a6;
- (ATXERMEvent)initWithProto:(id)a3;
- (ATXERMEvent)initWithProtoData:(id)a3;
- (ATXEngagementRecordEntry)entry;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXERMEvent:(id)a3;
- (NSArray)clientModelIds;
- (NSDate)eventDate;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)eventType;
- (unsigned)dataVersion;
@end

@implementation ATXERMEvent

- (ATXERMEvent)initWithEventDate:(id)a3 eventType:(unint64_t)a4 recordEntry:(id)a5 clientModelIds:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)ATXERMEvent;
  v14 = [(ATXERMEvent *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_eventDate, a3);
    v15->_eventType = a4;
    objc_storeStrong((id *)&v15->_entry, a5);
    uint64_t v16 = [v13 copy];
    clientModelIds = v15->_clientModelIds;
    v15->_clientModelIds = (NSArray *)v16;
  }
  return v15;
}

- (ATXERMEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    v5 = [[ATXPBERMEvent alloc] initWithData:v4];

    self = [(ATXERMEvent *)self initWithProto:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXERMEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = __atxlog_handle_default();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[ATXERMEvent initWithProto:].cold.6((uint64_t)self, v5);
      }
      id v12 = 0;
      goto LABEL_23;
    }
    v5 = v4;
    if (-[ATXPBERMEvent hasEventDate]((uint64_t)v5))
    {
      if (-[ATXPBERMEvent eventType]((uint64_t)v5))
      {
        if (-[ATXPBERMEvent hasDateEngaged]((uint64_t)v5))
        {
          if (-[ATXPBERMEvent hasExecutable]((BOOL)v5))
          {
            v6 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:-[ATXPBERMEvent eventDate]((uint64_t)v5)];
            v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceReferenceDate:-[ATXPBERMEvent dateEngaged]((uint64_t)v5)];
            uint64_t v8 = -[ATXPBERMEvent engagementType]((uint64_t)v5);
            v9 = -[ATXPBERMEvent executable]((uint64_t)v5);
            switch(-[ATXPBERMEvent executableType]((uint64_t)v5))
            {
              case 1u:
                v10 = (ATXAction *)[[NSString alloc] initWithData:v9 encoding:4];
                id v11 = [[ATXExecutableIdentifier alloc] initWithString:v10];
                goto LABEL_31;
              case 2u:
                v10 = [[ATXAction alloc] initWithProtoData:v9];
                id v11 = [[ATXExecutableIdentifier alloc] initWithAction:v10];
                goto LABEL_31;
              case 3u:
                v10 = (ATXAction *)[objc_alloc(MEMORY[0x1E4F67E70]) initWithProtoData:v9];
                id v11 = [[ATXExecutableIdentifier alloc] initWithHeroAppPrediction:v10];
                goto LABEL_31;
              case 4u:
                v10 = (ATXAction *)[objc_alloc(MEMORY[0x1E4F938F0]) initWithProtoData:v9];
                id v11 = [[ATXExecutableIdentifier alloc] initWithInfoSuggestion:v10];
LABEL_31:
                p_super = &v11->super;

                v15 = [[ATXEngagementRecordEntry alloc] initWithExecutable:p_super dateEngaged:v7 engagementRecordType:v8];
                uint64_t v16 = (int)-[ATXPBERMEvent eventType]((uint64_t)v5);
                v17 = -[ATXPBERMEvent clientModelIds]((uint64_t)v5);
                self = [(ATXERMEvent *)self initWithEventDate:v6 eventType:v16 recordEntry:v15 clientModelIds:v17];

                id v12 = self;
                break;
              default:
                p_super = __atxlog_handle_default();
                if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
                  -[ATXERMEvent initWithProto:]((uint64_t)v5, p_super);
                }
                id v12 = 0;
                break;
            }

            goto LABEL_22;
          }
          v6 = __atxlog_handle_default();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            -[ATXERMEvent initWithProto:]();
          }
        }
        else
        {
          v6 = __atxlog_handle_default();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            -[ATXERMEvent initWithProto:].cold.4();
          }
        }
      }
      else
      {
        v6 = __atxlog_handle_default();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          -[ATXERMEvent initWithProto:]();
        }
      }
    }
    else
    {
      v6 = __atxlog_handle_default();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[ATXERMEvent initWithProto:].cold.5();
      }
    }
    id v12 = 0;
LABEL_22:

LABEL_23:
    goto LABEL_24;
  }
  id v12 = 0;
LABEL_24:

  return v12;
}

- (id)proto
{
  v3 = objc_opt_new();
  id v4 = (void *)[(NSArray *)self->_clientModelIds mutableCopy];
  -[ATXPBERMEvent setClientModelIds:]((uint64_t)v3, v4);

  v5 = [(ATXEngagementRecordEntry *)self->_entry dateEngaged];
  [v5 timeIntervalSinceReferenceDate];
  -[ATXPBERMEvent setDateEngaged:]((uint64_t)v3, v6);

  -[ATXPBERMEvent setEngagementType:]((uint64_t)v3, [(ATXEngagementRecordEntry *)self->_entry engagementRecordType]);
  [(NSDate *)self->_eventDate timeIntervalSinceReferenceDate];
  -[ATXPBERMEvent setEventDate:]((uint64_t)v3, v7);
  -[ATXPBERMEvent setEventType:]((uint64_t)v3, self->_eventType);
  uint64_t v8 = [(ATXEngagementRecordEntry *)self->_entry executable];
  uint64_t v9 = [v8 type];

  switch(v9)
  {
    case 0:
      -[ATXPBERMEvent setExecutableType:]((uint64_t)v3, 1);
      v10 = [(ATXEngagementRecordEntry *)self->_entry executable];
      id v11 = [v10 object];
      id v12 = [v11 dataUsingEncoding:4];
      goto LABEL_8;
    case 1:
      uint64_t v13 = (uint64_t)v3;
      int v14 = 2;
      goto LABEL_7;
    case 2:
      uint64_t v13 = (uint64_t)v3;
      int v14 = 3;
      goto LABEL_7;
    case 3:
      uint64_t v13 = (uint64_t)v3;
      int v14 = 4;
      goto LABEL_7;
    case 4:
      uint64_t v13 = (uint64_t)v3;
      int v14 = 5;
LABEL_7:
      -[ATXPBERMEvent setExecutableType:](v13, v14);
      v10 = [(ATXEngagementRecordEntry *)self->_entry executable];
      id v11 = [v10 object];
      id v12 = [v11 encodeAsProto];
LABEL_8:
      v15 = v12;
      -[ATXPBERMEvent setExecutable:]((uint64_t)v3, v12);

      break;
    default:
      break;
  }

  return v3;
}

- (id)encodeAsProto
{
  v2 = [(ATXERMEvent *)self proto];
  v3 = [v2 data];

  return v3;
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
    double v6 = (void *)[objc_alloc((Class)a1) initWithProtoData:v5];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)jsonDict
{
  v3 = [(ATXEngagementRecordEntry *)self->_entry jsonDict];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [(NSDate *)self->_eventDate description];
  [v4 setObject:v5 forKeyedSubscript:@"eventDate"];

  [v4 setObject:self->_clientModelIds forKeyedSubscript:@"clientModelIds"];
  if (self->_eventType == 1) {
    double v6 = @"AddedEntry";
  }
  else {
    double v6 = @"Unknown";
  }
  [v4 setObject:v6 forKeyedSubscript:@"eventType"];

  return v4;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(ATXERMEvent *)self jsonDict];
  id v4 = [v2 dataWithJSONObject:v3 options:1 error:0];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXERMEvent *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXERMEvent *)self isEqualToATXERMEvent:v5];

  return v6;
}

- (BOOL)isEqualToATXERMEvent:(id)a3
{
  id v4 = a3;
  unint64_t eventType = self->_eventType;
  if (eventType == [v4 eventType])
  {
    entry = self->_entry;
    double v7 = [v4 entry];
    if ([(ATXEngagementRecordEntry *)entry isEqual:v7])
    {
      clientModelIds = self->_clientModelIds;
      uint64_t v9 = [v4 clientModelIds];
      BOOL v10 = [(NSArray *)clientModelIds isEqualToArray:v9];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSDate)eventDate
{
  return self->_eventDate;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (ATXEngagementRecordEntry)entry
{
  return self->_entry;
}

- (NSArray)clientModelIds
{
  return self->_clientModelIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelIds, 0);
  objc_storeStrong((id *)&self->_entry, 0);

  objc_storeStrong((id *)&self->_eventDate, 0);
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "The ERM event had an unknown event type", v2, v3, v4, v5, v6);
}

- (void)initWithProto:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = (int)-[ATXPBERMEvent executableType](a1);
  _os_log_error_impl(&dword_1A790D000, a2, OS_LOG_TYPE_ERROR, "The ERM event did not have a valid executable type: %ld", (uint8_t *)&v3, 0xCu);
}

- (void)initWithProto:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "The ERM event did not have an executable", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "The ERM event did not have an engaged date", v2, v3, v4, v5, v6);
}

- (void)initWithProto:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1A790D000, v0, v1, "The ERM event did not have an event date", v2, v3, v4, v5, v6);
}

- (void)initWithProto:(uint64_t)a1 .cold.6(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_fault_impl(&dword_1A790D000, a2, OS_LOG_TYPE_FAULT, "%@: tried to initialize with a non-ATXPBERMEvent proto", (uint8_t *)&v5, 0xCu);
}

@end