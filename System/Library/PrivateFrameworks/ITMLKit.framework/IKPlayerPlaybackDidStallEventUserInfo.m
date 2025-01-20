@interface IKPlayerPlaybackDidStallEventUserInfo
- (IKPlayerPlaybackDidStallEventUserInfo)initWithElapsedTime:(double)a3;
- (NSDictionary)properties;
- (double)elapsedTime;
@end

@implementation IKPlayerPlaybackDidStallEventUserInfo

- (IKPlayerPlaybackDidStallEventUserInfo)initWithElapsedTime:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IKPlayerPlaybackDidStallEventUserInfo;
  result = [(IKPlayerPlaybackDidStallEventUserInfo *)&v5 init];
  if (result) {
    result->_elapsedTime = a3;
  }
  return result;
}

- (NSDictionary)properties
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  v4 = [NSNumber numberWithDouble:self->_elapsedTime];
  [v3 setObject:v4 forKeyedSubscript:@"elapsedTime"];

  objc_super v5 = (void *)[v3 copy];
  return (NSDictionary *)v5;
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

@end