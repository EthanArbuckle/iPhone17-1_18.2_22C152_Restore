@interface PHImportTimer
- (NSDate)endTime;
- (NSDate)startTime;
- (PHImportTimer)initWithType:(unsigned __int8)a3 subtype:(unsigned __int8)a4;
- (double)duration;
- (id)description;
- (id)uuid;
- (unint64_t)signpostId;
- (unsigned)subtype;
- (unsigned)type;
- (void)setEndTime:(id)a3;
- (void)setSignpostId:(unint64_t)a3;
- (void)setStartTime:(id)a3;
- (void)setSubtype:(unsigned __int8)a3;
- (void)setType:(unsigned __int8)a3;
- (void)setUuid:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation PHImportTimer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);

  objc_storeStrong(&self->_uuid, 0);
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSubtype:(unsigned __int8)a3
{
  self->_subtype = a3;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setEndTime:(id)a3
{
}

- (NSDate)endTime
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStartTime:(id)a3
{
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUuid:(id)a3
{
}

- (id)uuid
{
  return objc_getProperty(self, a2, 16, 1);
}

- (id)description
{
  v3 = NSString;
  id uuid = self->_uuid;
  v5 = [(id)importTypeNames objectAtIndexedSubscript:self->_type];
  uint64_t subtype = self->_subtype;
  [(PHImportTimer *)self duration];
  v8 = [v3 stringWithFormat:@"uuid: %@, type: %@, sub type: %hhu, duration: %fl", uuid, v5, subtype, v7];

  return v8;
}

- (double)duration
{
  [(NSDate *)self->_endTime timeIntervalSinceDate:self->_startTime];
  return result;
}

- (void)stop
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_startTime && !self->_endTime)
  {
    v4 = (id)importPerfLog;
    v5 = v4;
    os_signpost_id_t signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      uint64_t type = self->_type;
      uint64_t subtype = self->_subtype;
      *(_DWORD *)buf = 134218240;
      uint64_t v13 = type;
      __int16 v14 = 2048;
      uint64_t v15 = subtype;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v5, OS_SIGNPOST_INTERVAL_END, signpostId, "PHImportTimer", "%lu-%lu", buf, 0x16u);
    }

    v9 = [MEMORY[0x1E4F1C9C8] date];
    endTime = self->_endTime;
    self->_endTime = v9;
  }
  else
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PHImportTimer.m" lineNumber:166 description:@"Trying to stop a timer that is either not running or already done running."];
  }
}

- (void)start
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_startTime)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"PHImportTimer.m" lineNumber:156 description:@"Trying to start a timer that is already running."];
  }
  else
  {
    v4 = (id)importPerfLog;
    v5 = v4;
    os_signpost_id_t signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      uint64_t type = self->_type;
      uint64_t subtype = self->_subtype;
      *(_DWORD *)buf = 134218240;
      uint64_t v13 = type;
      __int16 v14 = 2048;
      uint64_t v15 = subtype;
      _os_signpost_emit_with_name_impl(&dword_19B043000, v5, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "PHImportTimer", "%lu-%lu", buf, 0x16u);
    }

    v9 = [MEMORY[0x1E4F1C9C8] date];
    startTime = self->_startTime;
    self->_startTime = v9;
  }
}

- (PHImportTimer)initWithType:(unsigned __int8)a3 subtype:(unsigned __int8)a4
{
  if (initWithType_subtype__onceToken != -1) {
    dispatch_once(&initWithType_subtype__onceToken, &__block_literal_global_36864);
  }
  uint64_t v7 = [(PHImportTimer *)self init];
  v8 = v7;
  if (v7)
  {
    v7->_uint64_t type = a3;
    v7->_uint64_t subtype = a4;
    v7->_os_signpost_id_t signpostId = os_signpost_id_make_with_pointer((os_log_t)importPerfLog, v7);
  }
  return v8;
}

void __38__PHImportTimer_initWithType_subtype___block_invoke()
{
  v0 = (void *)importTypeNames;
  importTypeNames = (uint64_t)&unk_1EEB26BF8;

  v1 = (void *)mediaTypeNames;
  mediaTypeNames = (uint64_t)&unk_1EEB26C10;

  v2 = (void *)aspectRatioNames;
  aspectRatioNames = (uint64_t)&unk_1EEB26C28;

  os_log_t v3 = os_log_create("com.apple.Photos.Import", "PointsOfInterest");
  v4 = (void *)importPerfLog;
  importPerfLog = (uint64_t)v3;
}

@end