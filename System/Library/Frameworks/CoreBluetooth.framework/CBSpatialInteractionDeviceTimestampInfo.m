@interface CBSpatialInteractionDeviceTimestampInfo
- (double)timestamp;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (unsigned)duplicateCount;
- (unsigned)reason;
- (void)setDuplicateCount:(unsigned __int8)a3;
- (void)setReason:(unsigned __int8)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation CBSpatialInteractionDeviceTimestampInfo

- (id)description
{
  return [(CBSpatialInteractionDeviceTimestampInfo *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  if (a3 > 5)
  {
    v6 = objc_msgSend(NSString, "stringWithFormat:", @"%f", *(void *)&self->_timestamp);
    if (self->_timestamp == 0.0) {
      goto LABEL_5;
    }
LABEL_8:
    NSAppendPrintF_safe();
    id v7 = 0;
    if (!self->_reason) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (qword_1EB479230 != -1) {
    dispatch_once(&qword_1EB479230, &__block_literal_global_720);
  }
  v4 = (void *)qword_1EB479228;
  v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:self->_timestamp];
  v6 = [v4 stringFromDate:v5];

  if (self->_timestamp != 0.0) {
    goto LABEL_8;
  }
LABEL_5:
  id v7 = 0;
  if (self->_reason)
  {
LABEL_9:
    v11 = CUPrintFlags32();
    NSAppendPrintF_safe();
    id v8 = v7;

    id v7 = v8;
  }
LABEL_10:
  if (self->_duplicateCount)
  {
    NSAppendPrintF_safe();
    id v9 = v7;

    id v7 = v9;
  }

  return v7;
}

uint64_t __64__CBSpatialInteractionDeviceTimestampInfo_descriptionWithLevel___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1EB479228;
  qword_1EB479228 = (uint64_t)v0;

  v2 = (void *)qword_1EB479228;

  return [v2 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
}

- (unsigned)duplicateCount
{
  return self->_duplicateCount;
}

- (void)setDuplicateCount:(unsigned __int8)a3
{
  self->_duplicateCount = a3;
}

- (unsigned)reason
{
  return self->_reason;
}

- (void)setReason:(unsigned __int8)a3
{
  self->_reason = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

@end