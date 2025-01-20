@interface IDSUTunTimingEventKernelTest
- (IDSUTunTimingEventKernelTest)initWithTimestamp:(double)a3 kernelTime:(double)a4 bytes:(int64_t)a5;
- (double)timestamp;
- (void)appendToString:(id)a3;
@end

@implementation IDSUTunTimingEventKernelTest

- (IDSUTunTimingEventKernelTest)initWithTimestamp:(double)a3 kernelTime:(double)a4 bytes:(int64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)IDSUTunTimingEventKernelTest;
  result = [(IDSUTunTimingEventKernelTest *)&v9 init];
  if (result)
  {
    result->_timestamp = a3;
    result->_kernelTime = a4;
    result->_bytes = a5;
  }
  return result;
}

- (void)appendToString:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

@end