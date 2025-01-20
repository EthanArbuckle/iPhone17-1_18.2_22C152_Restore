@interface TimedBuffer
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp;
- (TimedBuffer)initWithBuffer:(__CVBuffer *)a3 atTimestamp:(id *)a4;
- (__CVBuffer)buffer;
- (void)setBuffer:(__CVBuffer *)a3;
- (void)setTimestamp:(id *)a3;
@end

@implementation TimedBuffer

- (TimedBuffer)initWithBuffer:(__CVBuffer *)a3 atTimestamp:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)TimedBuffer;
  result = [(TimedBuffer *)&v8 init];
  if (result)
  {
    long long v7 = *(_OWORD *)&a4->var0;
    result->_timestamp.epoch = a4->var3;
    *(_OWORD *)&result->_timestamp.value = v7;
    result->_buffer = a3;
  }
  return result;
}

- (__CVBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(__CVBuffer *)a3
{
  self->_buffer = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void)setTimestamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_timestamp.epoch = a3->var3;
  *(_OWORD *)&self->_timestamp.value = v3;
}

@end