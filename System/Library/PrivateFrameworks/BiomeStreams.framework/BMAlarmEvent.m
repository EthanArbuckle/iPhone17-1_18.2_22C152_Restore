@interface BMAlarmEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMAlarmEvent)initWithEventType:(unint64_t)a3 alarmID:(id)a4 isSleepAlarm:(BOOL)a5;
- (BMAlarmEvent)initWithEventType:(unint64_t)a3 lastEventType:(unint64_t)a4 alarmID:(id)a5 isSleepAlarm:(BOOL)a6;
- (BMAlarmEvent)initWithProto:(id)a3;
- (BMAlarmEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSleepAlarm;
- (NSString)description;
- (NSUUID)alarmID;
- (id)encodeAsProto;
- (id)json;
- (id)jsonDict;
- (id)proto;
- (unint64_t)eventType;
- (unint64_t)lastEventType;
- (unsigned)dataVersion;
- (void)proto;
@end

@implementation BMAlarmEvent

- (BMAlarmEvent)initWithEventType:(unint64_t)a3 alarmID:(id)a4 isSleepAlarm:(BOOL)a5
{
  return [(BMAlarmEvent *)self initWithEventType:a3 lastEventType:0 alarmID:a4 isSleepAlarm:a5];
}

- (BMAlarmEvent)initWithEventType:(unint64_t)a3 lastEventType:(unint64_t)a4 alarmID:(id)a5 isSleepAlarm:(BOOL)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMAlarmEvent;
  v12 = [(BMEventBase *)&v15 init];
  v13 = v12;
  if (v12)
  {
    v12->_eventType = a3;
    v12->_lastEventType = a4;
    objc_storeStrong((id *)&v12->_alarmID, a5);
    v13->_isSleepAlarm = a6;
  }

  return v13;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  unint64_t eventType = self->_eventType;
  BOOL isSleepAlarm = self->_isSleepAlarm;
  alarmID = self->_alarmID;
  uint64_t v7 = BMPBLastAlarmEventTypeFromType(self->_lastEventType, 0);
  if (v7 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E55D8510[(int)v7];
  }
  v9 = (void *)[v3 initWithFormat:@"Alarm event with type: %ld is sleep alarm: %d alarm ID: %@ last event: %@", eventType, isSleepAlarm, alarmID, v8];

  return (NSString *)v9;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 2) {
    v4 = (objc_class *)BMAlarmEvent_v2;
  }
  else {
    v4 = (objc_class *)a1;
  }
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithProtoData:v5];

  return v6;
}

- (id)jsonDict
{
  v10[4] = *MEMORY[0x1E4F143B8];
  v9[0] = @"alarmID";
  id v3 = [(NSUUID *)self->_alarmID UUIDString];
  v10[0] = v3;
  v9[1] = @"isSleepAlarm";
  v4 = [NSNumber numberWithBool:self->_isSleepAlarm];
  v10[1] = v4;
  v9[2] = @"eventType";
  id v5 = [NSNumber numberWithUnsignedInteger:self->_eventType];
  v10[2] = v5;
  v9[3] = @"lastEventType";
  v6 = [NSNumber numberWithUnsignedInteger:self->_lastEventType];
  v10[3] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  return v7;
}

- (id)json
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  id v3 = [(BMAlarmEvent *)self jsonDict];
  uint64_t v8 = 0;
  v4 = [v2 dataWithJSONObject:v3 options:1 error:&v8];
  uint64_t v5 = v8;

  if (v5)
  {
    v6 = __biome_log_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[BMDeviceMetadataEvent json](v6);
    }
  }

  return v4;
}

- (id)encodeAsProto
{
  v2 = [(BMAlarmEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMAlarmEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      unsigned int v6 = [v5 eventType];
      if (v6 >= 6)
      {
        v9 = __biome_log_for_category();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[BMAlarmEvent initWithProto:]();
        }

        uint64_t v7 = 1;
      }
      else
      {
        uint64_t v7 = v6;
      }
      unsigned int v10 = [v5 lastEventType];
      if (v10 >= 0xB)
      {
        v12 = __biome_log_for_category();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[BMAlarmEvent initWithProto:]();
        }

        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = v10;
      }
      id v13 = objc_alloc(MEMORY[0x1E4F29128]);
      v14 = [v5 alarmID];
      objc_super v15 = (void *)[v13 initWithUUIDString:v14];
      self = [(BMAlarmEvent *)self initWithEventType:v7 lastEventType:v11 alarmID:v15 isSleepAlarm:[v5 isSleepAlarm]];

      uint64_t v8 = self;
    }
    else
    {
      uint64_t v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMAlarmEvent initWithProto:]();
      }
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BMAlarmEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [[BMPBAlarmEvent alloc] initWithData:v4];

    self = [(BMAlarmEvent *)self initWithProto:v5];
    unsigned int v6 = self;
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

- (id)proto
{
  id v3 = objc_opt_new();
  [v3 setIsSleepAlarm:self->_isSleepAlarm];
  char v9 = 0;
  unint64_t eventType = self->_eventType;
  if (eventType >= 6)
  {
    uint64_t v5 = __biome_log_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[BMAlarmEvent proto](eventType);
    }

    char v9 = 1;
    unint64_t eventType = 0xFFFFFFFFLL;
  }
  [v3 setEventType:eventType];
  objc_msgSend(v3, "setLastEventType:", BMPBLastAlarmEventTypeFromType(self->_lastEventType, &v9));
  if (v9)
  {
    id v6 = 0;
  }
  else
  {
    uint64_t v7 = [(NSUUID *)self->_alarmID UUIDString];
    [v3 setAlarmID:v7];

    id v6 = v3;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v12 = 0;
    goto LABEL_17;
  }
  id v6 = v5;
  uint64_t v7 = v6;
  alarmID = self->_alarmID;
  char v9 = alarmID;
  if (alarmID)
  {
LABEL_5:
    unsigned int v10 = [v7 alarmID];
    char v11 = [(NSUUID *)v9 isEqual:v10];

    if (alarmID) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v3 = [v6 alarmID];
  if (v3)
  {
    char v9 = self->_alarmID;
    goto LABEL_5;
  }
  char v11 = 1;
LABEL_9:

LABEL_10:
  unint64_t eventType = self->_eventType;
  if (eventType == [v7 eventType]
    && (unint64_t lastEventType = self->_lastEventType, lastEventType == [v7 lastEventType]))
  {
    int isSleepAlarm = self->_isSleepAlarm;
    if (isSleepAlarm == [v7 isSleepAlarm]) {
      BOOL v12 = v11;
    }
    else {
      BOOL v12 = 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

LABEL_17:
  return v12;
}

- (BOOL)isSleepAlarm
{
  return self->_isSleepAlarm;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (unint64_t)lastEventType
{
  return self->_lastEventType;
}

- (NSUUID)alarmID
{
  return self->_alarmID;
}

- (void).cxx_destruct
{
}

- (void)initWithProto:.cold.1()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMAlarmEvent: unable to convert BMLastAlarmEventType enum value: %@", v3, v4, v5, v6, v7);
}

- (void)initWithProto:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  v0 = objc_msgSend(NSNumber, "numberWithInt:");
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v1, v2, "BMAlarmEvent: unable to convert BMPBAlarmEventType enum value: %@", v3, v4, v5, v6, v7);
}

- (void)initWithProto:.cold.3()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_18E67D000, v2, v3, "%@: tried to initialize with a non-BMPBAlarmEvent proto", v4, v5, v6, v7, v8);
}

- (void)proto
{
  uint64_t v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMAlarmEvent: unable to convert BMAlarmEventType enum value: %@", v4, v5, v6, v7, v8);
}

@end