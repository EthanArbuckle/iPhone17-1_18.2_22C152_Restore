@interface IRFrame
- (IRFrame)initWithTimings:(const unsigned int *)a3 count:(unint64_t)a4 timestamp:(unint64_t)a5;
- (unint64_t)count;
- (unint64_t)timestamp;
- (unsigned)timeIntervalAtIndex:(unint64_t)a3;
- (void)dealloc;
- (void)getTimings:(unsigned int *)a3 range:(_NSRange)a4;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation IRFrame

- (IRFrame)initWithTimings:(const unsigned int *)a3 count:(unint64_t)a4 timestamp:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)IRFrame;
  v8 = [(IRFrame *)&v12 init];
  v9 = v8;
  if (v8)
  {
    v8->_count = a4;
    v10 = (unsigned int *)malloc_type_calloc(a4, 4uLL, 0x100004052888210uLL);
    v9->_timings = v10;
    if (v10)
    {
      memcpy(v10, a3, 4 * a4);
      v9->_timestamp = a5;
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  timings = self->_timings;
  if (timings) {
    free(timings);
  }
  v4.receiver = self;
  v4.super_class = (Class)IRFrame;
  [(IRFrame *)&v4 dealloc];
}

- (unsigned)timeIntervalAtIndex:(unint64_t)a3
{
  if ([(IRFrame *)self count] <= a3) {
    objc_msgSend(MEMORY[0x263EFF940], "raise:format:", *MEMORY[0x263EFF578], @"invalid index %lu", a3);
  }
  return self->_timings[a3];
}

- (void)getTimings:(unsigned int *)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  if (a4.location + a4.length > [(IRFrame *)self count])
  {
    v10.NSUInteger location = location;
    v10.NSUInteger length = length;
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF578], @"invalid range %@", NSStringFromRange(v10) format];
  }
  v8 = &self->_timings[location];
  memcpy(a3, v8, 4 * length);
}

- (unint64_t)count
{
  return self->_count;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

@end