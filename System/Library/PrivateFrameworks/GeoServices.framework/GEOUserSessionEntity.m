@interface GEOUserSessionEntity
- (BOOL)_isValidSessionIDHighOrLowString:(id)a3;
- (GEOSessionID)sessionID;
- (GEOUserSessionEntity)initWithSessionEntityString:(id)a3;
- (GEOUserSessionEntity)initWithSessionID:(GEOSessionID)a3 sessionCreationTime:(double)a4 sequenceNumber:(unsigned int)a5;
- (NSNumber)sessionIDHigh;
- (NSNumber)sessionIDLow;
- (NSString)sessionEntityString;
- (NSString)sessionIDHighString;
- (NSString)sessionIDLowString;
- (NSString)sessionIDString;
- (NSString)sessionUUIDString;
- (double)sessionCreationTime;
- (double)sessionRelativeTimestamp;
- (double)sessionRelativeTimestampForEventTime:(double)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unsigned)sequenceNumber;
- (void)setSessionCreationTime:(double)a3;
- (void)updateSessionIDFromUUIDString:(id)a3;
- (void)updateWithSessionEntityString:(id)a3;
@end

@implementation GEOUserSessionEntity

- (double)sessionRelativeTimestampForEventTime:(double)a3
{
  return a3 - self->_sessionCreationTime;
}

- (GEOUserSessionEntity)initWithSessionID:(GEOSessionID)a3 sessionCreationTime:(double)a4 sequenceNumber:(unsigned int)a5
{
  unint64_t low = a3._low;
  unint64_t high = a3._high;
  v9 = [(GEOUserSessionEntity *)self init];
  v10 = v9;
  if (v9)
  {
    v9->_sessionID._unint64_t high = high;
    v9->_sessionID._unint64_t low = low;
    v9->_sessionCreationTime = a4;
    v9->_sequenceNumber = a5;
    v11 = +[GEOReferenceTimeManager sharedManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __77__GEOUserSessionEntity_initWithSessionID_sessionCreationTime_sequenceNumber___block_invoke;
    v13[3] = &unk_1E53DC4A8;
    v14 = v10;
    [v11 referenceTimeResult:v13];
  }
  return v10;
}

double __77__GEOUserSessionEntity_initWithSessionID_sessionCreationTime_sequenceNumber___block_invoke(uint64_t a1, double a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double result = a2 - *(double *)(v2 + 32);
  *(double *)(v2 + 40) = result;
  return result;
}

- (GEOUserSessionEntity)initWithSessionEntityString:(id)a3
{
  id v4 = a3;
  v5 = [(GEOUserSessionEntity *)self init];
  v6 = v5;
  if (v5) {
    [(GEOUserSessionEntity *)v5 updateWithSessionEntityString:v4];
  }

  return v6;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(GEOUserSessionEntity *)self sessionIDHighString];
  v5 = [(GEOUserSessionEntity *)self sessionIDLowString];
  v6 = [v3 stringWithFormat:@"SessionID high:%@ low:%@ CreationTime=%f SequenceNumber=%d", v4, v5, *(void *)&self->_sessionCreationTime, self->_sequenceNumber];

  return v6;
}

- (NSString)sessionEntityString
{
  v3 = NSString;
  id v4 = [(GEOUserSessionEntity *)self sessionIDHighString];
  v5 = [(GEOUserSessionEntity *)self sessionIDLowString];
  v6 = [v3 stringWithFormat:@"user_session_entity=%@,%@,%f,%u", v4, v5, *(void *)&self->_sessionCreationTime, self->_sequenceNumber];

  return (NSString *)v6;
}

- (NSString)sessionIDString
{
  v3 = NSString;
  id v4 = [(GEOUserSessionEntity *)self sessionIDHighString];
  v5 = [(GEOUserSessionEntity *)self sessionIDLowString];
  v6 = [v3 stringWithFormat:@"%@%@", v4, v5];

  return (NSString *)v6;
}

- (NSString)sessionUUIDString
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(GEOUserSessionEntity *)self sessionID];
  *(void *)&v15.byte8 = bswap64(v4);
  *(void *)&v15.byte0 = bswap64(v3);
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, v15);
  v6 = (__CFString *)CFUUIDCreateString(0, v5);
  CFRelease(v5);
  v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138478083;
    v10 = self;
    __int16 v11 = 2113;
    v12 = v6;
    _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "uuidString returned for %{private}@ is: %{private}@", (uint8_t *)&v9, 0x16u);
  }

  return (NSString *)v6;
}

- (NSNumber)sessionIDLow
{
  return (NSNumber *)[NSNumber numberWithUnsignedLongLong:self->_sessionID._low];
}

- (NSNumber)sessionIDHigh
{
  return (NSNumber *)[NSNumber numberWithUnsignedLongLong:self->_sessionID._high];
}

- (NSString)sessionIDLowString
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%0*llu", 20, self->_sessionID._low);
}

- (NSString)sessionIDHighString
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%0*llu", 20, self->_sessionID._high);
}

- (BOOL)_isValidSessionIDHighOrLowString:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 20
    && (uint64_t v4 = [v3 cStringUsingEncoding:1]) != 0)
  {
    uint64_t v5 = 0;
    do
    {
      unsigned int v6 = *(unsigned __int8 *)(v4 + v5) - 48;
      BOOL v7 = v6 < 0xA;
    }
    while (v6 <= 9 && v5++ != 19);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)updateWithSessionEntityString:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (GEOUserSessionEntity *)a3;
  if ([(GEOUserSessionEntity *)v4 length])
  {
    uint64_t v5 = [(GEOUserSessionEntity *)v4 componentsSeparatedByString:@"="];
    unint64_t v6 = [v5 count];
    BOOL v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v6 < 2)
    {
      if (v8)
      {
        int v24 = 138477827;
        v25 = v4;
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Incoming the sessionEntityString (%{private}@) is raw entity data continue parsing", (uint8_t *)&v24, 0xCu);
      }
    }
    else
    {
      if (v8)
      {
        int v24 = 138477827;
        v25 = v4;
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Incoming sessionEntityString (%{private}@) is a full entityString", (uint8_t *)&v24, 0xCu);
      }

      uint64_t v9 = [v5 objectAtIndexedSubscript:1];

      BOOL v7 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v24 = 138477827;
        v25 = (GEOUserSessionEntity *)v9;
        _os_log_impl(&dword_188D96000, v7, OS_LOG_TYPE_DEBUG, "Parsed the sessionEntityString as (%{private}@) to continue parsing the raw data", (uint8_t *)&v24, 0xCu);
      }
      uint64_t v4 = (GEOUserSessionEntity *)v9;
    }

    v10 = [(GEOUserSessionEntity *)v4 componentsSeparatedByString:@","];
    if ([v10 count] != 4)
    {
      __int16 v11 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v24 = 138543362;
        v25 = v4;
        _os_log_impl(&dword_188D96000, v11, OS_LOG_TYPE_ERROR, "Invalid user_session_entity - does not have all 4 components (%{public}@) in queryString", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_30;
    }
    __int16 v11 = [v10 objectAtIndexedSubscript:0];
    v12 = [v10 objectAtIndexedSubscript:1];
    if ([(GEOUserSessionEntity *)self _isValidSessionIDHighOrLowString:v11])
    {
      if ([(GEOUserSessionEntity *)self _isValidSessionIDHighOrLowString:v12])
      {
        uint64_t v13 = (const char *)[v11 UTF8String];
        v14 = (const char *)[v12 UTF8String];
        self->_sessionID._unint64_t high = strtoull(v13, 0, 10);
        unint64_t v15 = strtoull(v14, 0, 10);
        self->_sessionID._unint64_t low = v15;
        if (self->_sessionID._high && v15)
        {
          v16 = [v10 objectAtIndexedSubscript:2];
          [v16 doubleValue];
          self->_sessionCreationTime = v17;

          v18 = [v10 objectAtIndexedSubscript:3];
          self->_sequenceNumber = [v18 integerValue];

          v19 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            int v24 = 138478083;
            v25 = self;
            __int16 v26 = 2113;
            v27 = v4;
            v20 = "Extracted user_session_entity (%{private}@) from queryString (%{private}@).";
            v21 = v19;
            os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
            uint32_t v23 = 22;
LABEL_28:
            _os_log_impl(&dword_188D96000, v21, v22, v20, (uint8_t *)&v24, v23);
          }
LABEL_29:

LABEL_30:
          goto LABEL_31;
        }
        v19 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        int v24 = 138543362;
        v25 = v4;
        v20 = "Invalid user_session_entity - Either High or Low values is Zero (%{public}@) in queryString";
      }
      else
      {
        v19 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          goto LABEL_29;
        }
        int v24 = 138543362;
        v25 = v4;
        v20 = "Invalid user_session_entity - - invalid Low Value (%{public}@) in queryString";
      }
    }
    else
    {
      v19 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        goto LABEL_29;
      }
      int v24 = 138543362;
      v25 = v4;
      v20 = "Invalid user_session_entity - invalid High Value (%{public}@) in queryString";
    }
    v21 = v19;
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
    uint32_t v23 = 12;
    goto LABEL_28;
  }
  uint64_t v5 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_188D96000, v5, OS_LOG_TYPE_ERROR, " sessionEntityString is empty.", (uint8_t *)&v24, 2u);
  }
LABEL_31:
}

- (void)updateSessionIDFromUUIDString:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (__CFString *)a3;
  self->_sessionID._unint64_t high = 0;
  self->_sessionID._unint64_t low = 0;
  if (![(__CFString *)v4 length])
  {
    BOOL v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    LOWORD(v13) = 0;
    uint64_t v9 = "Incoming uuidString is empty. so set the sessionID to 0";
LABEL_9:
    v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 2;
    goto LABEL_10;
  }
  CFUUIDRef v5 = CFUUIDCreateFromString(0, v4);
  if (!v5)
  {
    BOOL v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    LOWORD(v13) = 0;
    uint64_t v9 = "Incoming uuidString is invalid, Unable to create CFUUID from string. so set the sessionID to 0";
    goto LABEL_9;
  }
  CFUUIDRef v6 = v5;
  CFUUIDBytes v7 = CFUUIDGetUUIDBytes(v5);
  self->_sessionID._unint64_t high = bswap64(*(unint64_t *)&v7.byte0);
  self->_sessionID._unint64_t low = bswap64(*(unint64_t *)&v7.byte8);
  CFRelease(v6);
  BOOL v8 = GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138478083;
    v14 = v4;
    __int16 v15 = 2113;
    v16 = self;
    uint64_t v9 = "updateSessionIDFromUUIDString:(%{private}@) updated value (%{private}@)";
    v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
    uint32_t v12 = 22;
LABEL_10:
    _os_log_impl(&dword_188D96000, v10, v11, v9, (uint8_t *)&v13, v12);
  }
LABEL_11:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  double sessionCreationTime = self->_sessionCreationTime;
  uint64_t sequenceNumber = self->_sequenceNumber;
  unint64_t high = self->_sessionID._high;
  unint64_t low = self->_sessionID._low;

  return (id)objc_msgSend(v4, "initWithSessionID:sessionCreationTime:sequenceNumber:", high, low, sequenceNumber, sessionCreationTime);
}

- (GEOSessionID)sessionID
{
  unint64_t low = self->_sessionID._low;
  unint64_t high = self->_sessionID._high;
  result._unint64_t low = low;
  result._unint64_t high = high;
  return result;
}

- (double)sessionCreationTime
{
  return self->_sessionCreationTime;
}

- (void)setSessionCreationTime:(double)a3
{
  self->_double sessionCreationTime = a3;
}

- (double)sessionRelativeTimestamp
{
  return self->_sessionRelativeTimestamp;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

@end