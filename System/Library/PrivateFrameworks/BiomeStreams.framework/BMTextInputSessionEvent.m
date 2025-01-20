@interface BMTextInputSessionEvent
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (BMTextInputSessionEvent)initWithDateInterval:(id)a3 bundleID:(id)a4 sessionID:(id)a5 sessionType:(unint64_t)a6;
- (BMTextInputSessionEvent)initWithDateInterval:(id)a3 bundleID:(id)a4 sessionType:(unint64_t)a5;
- (BMTextInputSessionEvent)initWithProto:(id)a3;
- (BMTextInputSessionEvent)initWithProtoData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDate)startDate;
- (NSDateInterval)dateInterval;
- (NSString)bundleID;
- (NSString)description;
- (NSString)sessionID;
- (double)duration;
- (id)encodeAsProto;
- (id)proto;
- (unint64_t)sessionType;
- (unsigned)dataVersion;
- (void)proto;
- (void)setBundleID:(id)a3;
- (void)setDateInterval:(id)a3;
- (void)setDuration:(double)a3;
- (void)setSessionID:(id)a3;
- (void)setSessionType:(unint64_t)a3;
- (void)setStartDate:(id)a3;
@end

@implementation BMTextInputSessionEvent

- (BMTextInputSessionEvent)initWithDateInterval:(id)a3 bundleID:(id)a4 sessionType:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)BMTextInputSessionEvent;
  v11 = [(BMEventBase *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_dateInterval, a3);
    uint64_t v13 = [v9 startDate];
    startDate = v12->_startDate;
    v12->_startDate = (NSDate *)v13;

    [v9 duration];
    v12->_duration = v15;
    objc_storeStrong((id *)&v12->_bundleID, a4);
    sessionID = v12->_sessionID;
    v12->_sessionID = 0;

    v12->_sessionType = a5;
  }

  return v12;
}

- (BMTextInputSessionEvent)initWithDateInterval:(id)a3 bundleID:(id)a4 sessionID:(id)a5 sessionType:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)BMTextInputSessionEvent;
  v14 = [(BMEventBase *)&v20 init];
  double v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_dateInterval, a3);
    uint64_t v16 = [v11 startDate];
    startDate = v15->_startDate;
    v15->_startDate = (NSDate *)v16;

    [v11 duration];
    v15->_duration = v18;
    objc_storeStrong((id *)&v15->_bundleID, a4);
    objc_storeStrong((id *)&v15->_sessionID, a5);
    v15->_sessionType = a6;
  }

  return v15;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  dateInterval = self->_dateInterval;
  bundleID = self->_bundleID;
  sessionID = self->_sessionID;
  v7 = [NSNumber numberWithUnsignedInteger:self->_sessionType];
  v8 = (void *)[v3 initWithFormat:@"TextInputSessionEvent event with dateInterval: %@, bundleID: %@, sessionID: %@, sessionType: %@", dateInterval, bundleID, sessionID, v7];

  return (NSString *)v8;
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1) {
    v4 = (objc_class *)BMTextInputSessionEvent_v1;
  }
  else {
    v4 = (objc_class *)a1;
  }
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithProtoData:v5];

  return v6;
}

- (id)encodeAsProto
{
  v2 = [(BMTextInputSessionEvent *)self proto];
  id v3 = [v2 data];

  return v3;
}

- (BMTextInputSessionEvent)initWithProto:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
      v7 = (void *)MEMORY[0x1E4F1C9C8];
      [v5 timestamp];
      v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
      [v5 duration];
      id v9 = objc_msgSend(v6, "initWithStartDate:duration:", v8);
      id v10 = [v5 bundleID];
      id v11 = [v5 sessionID];
      uint64_t v12 = [v5 sessionType];
      uint64_t v13 = v12;
      if (v12 >= 4)
      {
        uint64_t v16 = __biome_log_for_category();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[BMTextInputSessionEvent initWithProto:](v13);
        }

        uint64_t v14 = 4;
      }
      else
      {
        uint64_t v14 = v12;
      }
      self = [(BMTextInputSessionEvent *)self initWithDateInterval:v9 bundleID:v10 sessionID:v11 sessionType:v14];

      double v15 = self;
    }
    else
    {
      id v5 = __biome_log_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        -[BMTextInputSessionEvent initWithProto:]();
      }
      double v15 = 0;
    }
  }
  else
  {
    double v15 = 0;
  }

  return v15;
}

- (BMTextInputSessionEvent)initWithProtoData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[BMPBTextInputSessionEvent alloc] initWithData:v4];

    self = [(BMTextInputSessionEvent *)self initWithProto:v5];
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
  id v3 = objc_opt_new();
  [(BMTextInputSessionEvent *)self duration];
  objc_msgSend(v3, "setDuration:");
  id v4 = [(BMTextInputSessionEvent *)self bundleID];
  [v3 setBundleID:v4];

  id v5 = [(BMTextInputSessionEvent *)self sessionID];
  [v3 setSessionID:v5];

  id v6 = [(BMTextInputSessionEvent *)self startDate];
  MEMORY[0x192FB0750]();
  objc_msgSend(v3, "setTimestamp:");

  unint64_t v7 = [(BMTextInputSessionEvent *)self sessionType];
  if (v7 >= 4)
  {
    id v9 = __biome_log_for_category();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[BMTextInputSessionEvent proto](v7);
    }

    id v8 = 0;
  }
  else
  {
    [v3 setSessionType:v7];
    id v8 = v3;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    dateInterval = self->_dateInterval;
    unint64_t v7 = [v5 dateInterval];
    if ([(NSDateInterval *)dateInterval isEqualToDateInterval:v7])
    {
      bundleID = self->_bundleID;
      id v9 = [v5 bundleID];
      if ([(NSString *)bundleID isEqualToString:v9])
      {
        sessionID = self->_sessionID;
        id v11 = [v5 sessionID];
        if ([(NSString *)sessionID isEqualToString:v11])
        {
          unint64_t sessionType = self->_sessionType;
          BOOL v13 = sessionType == [v5 sessionType];
        }
        else
        {
          BOOL v13 = 0;
        }
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
}

- (unint64_t)sessionType
{
  return self->_sessionType;
}

- (void)setSessionType:(unint64_t)a3
{
  self->_unint64_t sessionType = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_dateInterval, 0);
}

- (void)initWithProto:(uint64_t)a1 .cold.1(uint64_t a1)
{
  v1 = [NSNumber numberWithInt:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMTextInputSessionEvent: unable to convert BMPBTextInputSessionType enum value: %@", v4, v5, v6, v7, v8);
}

- (void)initWithProto:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_18E67D000, v2, v3, "%@: tried to initialize with a non-BMPBTextInputSessionDataVersion proto", v4, v5, v6, v7, v8);
}

- (void)proto
{
  v1 = [NSNumber numberWithUnsignedInteger:a1];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_8(&dword_18E67D000, v2, v3, "BMTextInputSessionEvent: unable to convert BMTextInputSessionType enum value: %@", v4, v5, v6, v7, v8);
}

@end