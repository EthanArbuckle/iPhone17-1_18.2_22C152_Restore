@interface OSActivityEvent
+ (id)activityEventFromStreamEntry:(os_activity_stream_entry_s *)a3;
- (BOOL)persisted;
- (NSDate)timestamp;
- (NSString)eventMessage;
- (NSString)process;
- (NSString)processImagePath;
- (NSString)sender;
- (NSString)senderImagePath;
- (NSString)timezoneName;
- (NSTimeZone)timezone;
- (NSUUID)processImageUUID;
- (NSUUID)senderImageUUID;
- (id)description;
- (id)properties;
- (int)processID;
- (timeval)timeGMT;
- (timezone)tz;
- (unint64_t)activityID;
- (unint64_t)eventType;
- (unint64_t)machTimestamp;
- (unint64_t)parentActivityID;
- (unint64_t)processUniqueID;
- (unint64_t)threadID;
- (unint64_t)traceID;
- (unsigned)userID;
- (void)_addProperties:(id)a3;
- (void)_initWithProperties:(id)a3;
- (void)fillFromStreamEntry:(os_activity_stream_entry_s *)a3 eventMessage:(const char *)a4 persisted:(BOOL)a5;
- (void)setEventMessage:(id)a3;
- (void)setTimezoneName:(id)a3;
@end

@implementation OSActivityEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezoneName, 0);
  objc_storeStrong((id *)&self->_eventMessage, 0);
  objc_storeStrong((id *)&self->_senderImagePath, 0);
  objc_storeStrong((id *)&self->_senderImageUUID, 0);
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_processImagePath, 0);
  objc_storeStrong((id *)&self->_processImageUUID, 0);
}

- (void)setTimezoneName:(id)a3
{
}

- (NSString)timezoneName
{
  return self->_timezoneName;
}

- (timezone)tz
{
  return self->_tz;
}

- (timeval)timeGMT
{
  uint64_t v2 = *(void *)&self->_timeGMT.tv_usec;
  __darwin_time_t tv_sec = self->_timeGMT.tv_sec;
  result.tv_usec = v2;
  result.__darwin_time_t tv_sec = tv_sec;
  return result;
}

- (BOOL)persisted
{
  return self->_persisted;
}

- (void)setEventMessage:(id)a3
{
}

- (NSString)eventMessage
{
  return self->_eventMessage;
}

- (NSString)senderImagePath
{
  return self->_senderImagePath;
}

- (NSUUID)senderImageUUID
{
  return self->_senderImageUUID;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (unint64_t)machTimestamp
{
  return self->_machTimestamp;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (unint64_t)traceID
{
  return self->_traceID;
}

- (unint64_t)activityID
{
  return self->_activityID;
}

- (unint64_t)parentActivityID
{
  return self->_parentActivityID;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (unsigned)userID
{
  return self->_userID;
}

- (NSString)processImagePath
{
  return self->_processImagePath;
}

- (NSUUID)processImageUUID
{
  return self->_processImageUUID;
}

- (unint64_t)processUniqueID
{
  return self->_processUniqueID;
}

- (int)processID
{
  return self->_processID;
}

- (NSString)sender
{
  return [(NSString *)self->_senderImagePath lastPathComponent];
}

- (NSString)process
{
  return [(NSString *)self->_processImagePath lastPathComponent];
}

- (void)_addProperties:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", -[OSActivityEvent processID](self, "processID"));
  [v4 setObject:v5 forKey:@"processID"];

  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[OSActivityEvent processUniqueID](self, "processUniqueID"));
  [v4 setObject:v6 forKey:@"processUniqueID"];

  v7 = [(OSActivityEvent *)self processImageUUID];

  if (v7)
  {
    v8 = [(OSActivityEvent *)self processImageUUID];
    v9 = [v8 UUIDString];
    [v4 setObject:v9 forKey:@"processImageUUID"];
  }
  v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInt:", -[OSActivityEvent userID](self, "userID"));
  [v4 setObject:v10 forKey:@"userID"];

  v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[OSActivityEvent traceID](self, "traceID"));
  [v4 setObject:v11 forKey:@"traceID"];

  v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[OSActivityEvent threadID](self, "threadID"));
  [v4 setObject:v12 forKey:@"threadID"];

  v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[OSActivityEvent machTimestamp](self, "machTimestamp"));
  [v4 setObject:v13 forKey:@"machTimestamp"];

  v14 = [(OSActivityEvent *)self processImagePath];

  if (v14)
  {
    v15 = [(OSActivityEvent *)self processImagePath];
    [v4 setObject:v15 forKey:@"processImagePath"];
  }
  if ([(OSActivityEvent *)self parentActivityID])
  {
    v16 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[OSActivityEvent parentActivityID](self, "parentActivityID"));
    [v4 setObject:v16 forKey:@"parentActivityID"];
  }
  if ([(OSActivityEvent *)self activityID])
  {
    v17 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedLongLong:", -[OSActivityEvent activityID](self, "activityID"));
    [v4 setObject:v17 forKey:@"activityID"];
  }
  v18 = [(OSActivityEvent *)self senderImageUUID];

  if (v18)
  {
    v19 = [(OSActivityEvent *)self senderImageUUID];
    v20 = [v19 UUIDString];
    [v4 setObject:v20 forKey:@"senderImageUUID"];
  }
  v21 = [(OSActivityEvent *)self senderImagePath];

  if (v21)
  {
    v22 = [(OSActivityEvent *)self senderImagePath];
    [v4 setObject:v22 forKey:@"senderImagePath"];
  }
  v23 = [(OSActivityEvent *)self eventMessage];

  if (v23)
  {
    v24 = [(OSActivityEvent *)self eventMessage];
    [v4 setObject:v24 forKey:@"eventMessage"];
  }
  memset(&v35, 0, sizeof(v35));
  int v39 = 0;
  *(_OWORD *)v37 = 0u;
  long long v38 = 0u;
  time_t v34 = self->_timeGMT.tv_sec - 60 * self->_tz.tz_minuteswest + 3600 * self->_tz.tz_dsttime;
  v25 = gmtime_r(&v34, &v35);
  if (v25)
  {
    v26 = v25;
    int v27 = self->_tz.tz_minuteswest - 60 * self->_tz.tz_dsttime;
    unsigned int v28 = ((int)(((unint64_t)(2004318071 * v27) >> 32) - v27) >> 5)
        + ((((unint64_t)(2004318071 * v27) >> 32) - v27) >> 31);
    int v29 = v27 % 60;
    if (v29 < 0) {
      int v29 = -v29;
    }
    snprintf(__str, 0x20uLL, "%%F %%T.%06d%+03d%02d", self->_timeGMT.tv_usec, v28, v29);
    strftime(v37, 0x24uLL, __str, v26);
    v30 = [NSString stringWithUTF8String:v37];
    [v4 setObject:v30 forKey:@"timestamp"];
  }
  else
  {
    if (_addProperties__once != -1) {
      dispatch_once(&_addProperties__once, &__block_literal_global_349);
    }
    v31 = (void *)_addProperties__dateFormat;
    v30 = [(OSActivityEvent *)self timestamp];
    v32 = [v31 stringFromDate:v30];
    [v4 setObject:v32 forKey:@"timestamp"];
  }
  timezoneName = self->_timezoneName;
  if (timezoneName) {
    [v4 setObject:timezoneName forKeyedSubscript:@"timezoneName"];
  }
}

uint64_t __34__OSActivityEvent__addProperties___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_addProperties__dateFormat;
  _addProperties__dateFormat = (uint64_t)v0;

  uint64_t v2 = (void *)_addProperties__dateFormat;
  return [v2 setDateFormat:@"MMM dd HH:mm:ss.SSSSSS"];
}

- (void)_initWithProperties:(id)a3
{
  id v23 = a3;
  id v4 = [v23 objectForKey:@"processID"];
  v5 = v4;
  if (v4) {
    self->_processID = [v4 intValue];
  }
  v6 = [v23 objectForKey:@"processUniqueID"];

  if (v6) {
    self->_processUniqueID = [v6 unsignedLongLongValue];
  }
  v7 = [v23 objectForKey:@"processImageUUID"];

  if (v7) {
    objc_storeStrong((id *)&self->_processImageUUID, v7);
  }
  v8 = [v23 objectForKey:@"processImagePath"];

  if (v8) {
    objc_storeStrong((id *)&self->_processImagePath, v8);
  }
  v9 = [v23 objectForKey:@"userID"];

  if (v9) {
    self->_userID = [v9 unsignedIntValue];
  }
  v10 = [v23 objectForKey:@"eventType"];

  if (v10) {
    self->_eventType = [v10 unsignedLongValue];
  }
  v11 = [v23 objectForKey:@"parentActivityID"];

  if (v11) {
    self->_parentActivityID = [v11 unsignedLongLongValue];
  }
  v12 = [v23 objectForKey:@"activityID"];

  if (v12) {
    self->_activityID = [v12 unsignedLongLongValue];
  }
  v13 = [v23 objectForKey:@"traceID"];

  if (v13) {
    self->_traceID = [v13 unsignedLongLongValue];
  }
  v14 = [v23 objectForKey:@"threadID"];

  if (v14) {
    self->_threadID = [v14 unsignedLongLongValue];
  }
  v15 = [v23 objectForKey:@"machTimestamp"];

  if (v15) {
    self->_machTimestamp = [v15 unsignedLongLongValue];
  }
  v16 = [v23 objectForKey:@"timestamp"];

  if (v16) {
    objc_storeStrong((id *)&self->_timestamp, v16);
  }
  v17 = [v23 objectForKey:@"senderImageUUID"];

  if (v17)
  {
    v18 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v17];
    senderImageUUID = self->_senderImageUUID;
    self->_senderImageUUID = v18;
  }
  v20 = [v23 objectForKey:@"senderImagePath"];

  if (v20) {
    objc_storeStrong((id *)&self->_senderImagePath, v20);
  }
  v21 = [v23 objectForKey:@"eventMessage"];

  if (v21) {
    objc_storeStrong((id *)&self->_eventMessage, v21);
  }
  v22 = [v23 objectForKey:@"persisted"];

  if (v22) {
    self->_persisted = [v22 BOOLValue];
  }
}

- (id)properties
{
  v3 = objc_opt_new();
  [(OSActivityEvent *)self _addProperties:v3];
  return v3;
}

- (void)fillFromStreamEntry:(os_activity_stream_entry_s *)a3 eventMessage:(const char *)a4 persisted:(BOOL)a5
{
  self->_eventType = a3->var0;
  self->_processID = a3->var1;
  self->_processUniqueID = a3->var2;
  self->_userID = a3->var3;
  if (a3->var4)
  {
    v9 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a3->var4];
    processImageUUID = self->_processImageUUID;
    self->_processImageUUID = v9;
  }
  if (a3->var5)
  {
    objc_msgSend(NSString, "stringWithUTF8String:");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    processImagePath = self->_processImagePath;
    self->_processImagePath = v11;
  }
  self->_parentActivityID = a3->var7 & 0xFFFFFFFFFFFFFFLL;
  self->_activityID = a3->var6 & 0xFFFFFFFFFFFFFFLL;
  self->_traceID = a3->var8.var0.var0;
  self->_threadID = a3->var8.var0.var2;
  self->_machTimestamp = a3->var8.var0.var1;
  self->_timeGMT = a3->var8.var12.var5;
  self->_tz = a3->var8.var12.var6;
  v13 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)a3->var8.var0.var5.tv_usec / 1000000.0 + (double)a3->var8.var0.var5.tv_sec];
  timestamp = self->_timestamp;
  self->_timestamp = v13;

  timezoneName = self->_timezoneName;
  self->_timezoneName = (NSString *)&stru_1EF440710;

  timezone = self->_timezone;
  self->_timezone = 0;

  self->_persisted = a5;
  v17 = [NSString stringWithUTF8String:a4];
  eventMessage = self->_eventMessage;
  self->_eventMessage = v17;

  if (!self->_eventMessage) {
    self->_eventMessage = (NSString *)@"<compose failure [invalid utf8]>";
  }
  if (a3->var8.var0.var3)
  {
    v19 = (NSUUID *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:a3->var8.var0.var3];
    senderImageUUID = self->_senderImageUUID;
    self->_senderImageUUID = v19;
  }
  if (a3->var8.var0.var4)
  {
    objc_msgSend(NSString, "stringWithUTF8String:");
    self->_senderImagePath = (NSString *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1F41817F8]();
  }
}

- (NSTimeZone)timezone
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_timezone)
  {
    if ([(NSString *)v2->_timezoneName length]) {
      [MEMORY[0x1E4F1CAF0] timeZoneWithName:v2->_timezoneName];
    }
    else {
    uint64_t v3 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:3600 * v2->_tz.tz_dsttime + -60 * v2->_tz.tz_minuteswest];
    }
    timezone = v2->_timezone;
    v2->_timezone = (NSTimeZone *)v3;
  }
  objc_sync_exit(v2);

  v5 = v2->_timezone;
  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(OSActivityEvent *)self process];
  v6 = [(OSActivityEvent *)self sender];
  v7 = [(OSActivityEvent *)self eventMessage];
  v8 = [v3 stringWithFormat:@"<%@:%p process:%@ sender:%@>{%@}", v4, self, v5, v6, v7];

  return v8;
}

+ (id)activityEventFromStreamEntry:(os_activity_stream_entry_s *)a3
{
  signed int var0 = a3->var0;
  if ((int)a3->var0 <= 1023)
  {
    if (var0 > 514)
    {
      if (var0 == 515)
      {
        uint64_t v4 = off_1E5A41AB8;
        goto LABEL_23;
      }
      if (var0 == 768)
      {
        uint64_t v4 = off_1E5A41AA8;
        goto LABEL_23;
      }
    }
    else
    {
      if (var0 == 513)
      {
        uint64_t v4 = off_1E5A41A68;
        goto LABEL_23;
      }
      if (var0 == 514)
      {
        uint64_t v4 = off_1E5A41AB0;
        goto LABEL_23;
      }
    }
  }
  else if (var0 <= 1279)
  {
    if (var0 == 1024 || var0 == 1152)
    {
      uint64_t v4 = off_1E5A41A80;
      goto LABEL_23;
    }
  }
  else
  {
    switch(var0)
    {
      case 1280:
        uint64_t v4 = off_1E5A41AA0;
        goto LABEL_23;
      case 1792:
        uint64_t v4 = off_1E5A41A88;
        goto LABEL_23;
      case 2560:
        uint64_t v4 = off_1E5A41A98;
LABEL_23:
        v5 = (void *)[objc_alloc(*v4) initWithEntry:a3];
        goto LABEL_24;
    }
  }
  if ((var0 & 0xFFFFFF00) == 0x600)
  {
    uint64_t v4 = off_1E5A41A90;
    goto LABEL_23;
  }
  v5 = 0;
LABEL_24:
  return v5;
}

@end