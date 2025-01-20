@interface MPCAudioFailure
+ (id)multiSamplesFailure:(double)a3 duration:(double)a4;
+ (id)singleSampleFailure:(double)a3 duration:(double)a4;
- (MPCAudioFailure)initWithType:(int64_t)a3 startTime:(double)a4 duration:(double)a5;
- (double)duration;
- (double)startTime;
- (int64_t)type;
@end

@implementation MPCAudioFailure

- (double)duration
{
  return self->_duration;
}

- (double)startTime
{
  return self->_startTime;
}

- (int64_t)type
{
  return self->_type;
}

- (MPCAudioFailure)initWithType:(int64_t)a3 startTime:(double)a4 duration:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MPCAudioFailure;
  result = [(MPCAudioFailure *)&v9 init];
  if (result)
  {
    result->_type = a3;
    result->_startTime = a4;
    result->_duration = a5;
  }
  return result;
}

+ (id)multiSamplesFailure:(double)a3 duration:(double)a4
{
  v4 = [[MPCAudioFailure alloc] initWithType:1 startTime:a3 duration:a4];

  return v4;
}

+ (id)singleSampleFailure:(double)a3 duration:(double)a4
{
  v4 = [[MPCAudioFailure alloc] initWithType:0 startTime:a3 duration:a4];

  return v4;
}

@end