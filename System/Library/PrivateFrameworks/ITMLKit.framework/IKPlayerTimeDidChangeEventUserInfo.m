@interface IKPlayerTimeDidChangeEventUserInfo
- (IKPlayerTimeDidChangeEventUserInfo)initWithInterval:(double)a3 elapsedTime:(double)a4;
- (NSDictionary)properties;
- (double)elapsedTime;
- (double)interval;
@end

@implementation IKPlayerTimeDidChangeEventUserInfo

- (IKPlayerTimeDidChangeEventUserInfo)initWithInterval:(double)a3 elapsedTime:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IKPlayerTimeDidChangeEventUserInfo;
  result = [(IKPlayerTimeDidChangeEventUserInfo *)&v7 init];
  if (result)
  {
    result->_interval = a3;
    result->_elapsedTime = a4;
  }
  return result;
}

- (NSDictionary)properties
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  v4 = [NSNumber numberWithDouble:self->_interval];
  [v3 setObject:v4 forKeyedSubscript:@"interval"];

  v5 = [NSNumber numberWithDouble:self->_elapsedTime];
  [v3 setObject:v5 forKeyedSubscript:@"time"];

  v6 = (void *)[v3 copy];
  return (NSDictionary *)v6;
}

- (double)interval
{
  return self->_interval;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

@end