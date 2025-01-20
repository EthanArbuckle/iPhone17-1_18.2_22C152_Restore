@interface _WKProcessInfo
- (_WKProcessInfo)initWithTaskInfo:(const TaskInfo *)a3;
- (double)totalSystemCPUTime;
- (double)totalUserCPUTime;
- (int)pid;
- (int64_t)state;
- (unint64_t)physicalFootprint;
@end

@implementation _WKProcessInfo

- (_WKProcessInfo)initWithTaskInfo:(const TaskInfo *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_WKProcessInfo;
  result = [(_WKProcessInfo *)&v9 init];
  if (result)
  {
    result->_pid = a3->var0;
    int var1 = a3->var1;
    BOOL v6 = var1 == 1;
    BOOL v7 = var1 == 0;
    int64_t v8 = 2;
    if (!v7) {
      int64_t v8 = v6;
    }
    result->_state = v8;
    result->_totalUserCPUTime = a3->var2.m_value;
    result->_totalSystemCPUTime = a3->var3.m_value;
    result->_physicalFootprint = a3->var4;
  }
  return result;
}

- (int)pid
{
  return self->_pid;
}

- (int64_t)state
{
  return self->_state;
}

- (double)totalUserCPUTime
{
  return self->_totalUserCPUTime;
}

- (double)totalSystemCPUTime
{
  return self->_totalSystemCPUTime;
}

- (unint64_t)physicalFootprint
{
  return self->_physicalFootprint;
}

@end