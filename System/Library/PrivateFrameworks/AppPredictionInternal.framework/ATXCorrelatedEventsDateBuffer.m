@interface ATXCorrelatedEventsDateBuffer
- (ATXCorrelatedEventsDateBuffer)initWithBufferSeconds:(double)a3 andBufferType:(int64_t)a4;
- (double)bufferSeconds;
- (id)endDateWithBufferForEvent:(id)a3;
- (id)startDateWithBufferForEvent:(id)a3;
- (int64_t)bufferType;
@end

@implementation ATXCorrelatedEventsDateBuffer

- (ATXCorrelatedEventsDateBuffer)initWithBufferSeconds:(double)a3 andBufferType:(int64_t)a4
{
  v4 = self;
  if (a4 < 3)
  {
    v11.receiver = self;
    v11.super_class = (Class)ATXCorrelatedEventsDateBuffer;
    v9 = [(ATXCorrelatedEventsDateBuffer *)&v11 init];
    if (v9)
    {
      v9->_bufferSeconds = a3;
      v9->_bufferType = a4;
    }
    v4 = v9;
    v6 = v4;
  }
  else
  {
    v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[ATXCorrelatedEventsDateBuffer initWithBufferSeconds:andBufferType:](v5);
    }

    v6 = 0;
  }

  return v6;
}

- (id)startDateWithBufferForEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"ATXCorrelatedEventsDateBuffer.m", 36, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v6 = (void *)MEMORY[0x1E4F1C9C8];
  double v7 = -self->_bufferSeconds;
  if ((self->_bufferType | 2) == 2) {
    [v5 startDate];
  }
  else {
  v8 = [v5 endDate];
  }
  v9 = [v6 dateWithTimeInterval:v8 sinceDate:v7];

  return v9;
}

- (id)endDateWithBufferForEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"ATXCorrelatedEventsDateBuffer.m", 48, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v6 = (void *)MEMORY[0x1E4F1C9C8];
  double bufferSeconds = self->_bufferSeconds;
  if ((unint64_t)(self->_bufferType - 1) > 1) {
    [v5 startDate];
  }
  else {
  v8 = [v5 endDate];
  }
  v9 = [v6 dateWithTimeInterval:v8 sinceDate:bufferSeconds];

  return v9;
}

- (double)bufferSeconds
{
  return self->_bufferSeconds;
}

- (int64_t)bufferType
{
  return self->_bufferType;
}

- (void)initWithBufferSeconds:(os_log_t)log andBufferType:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_FAULT, "Tried to initialize an ATXCorrelatedEventsDateBuffer without specifying bufferSeconds or bufferType", v1, 2u);
}

@end