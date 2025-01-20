@interface IKPlayerDurationDidChangeEventUserInfo
- (IKPlayerDurationDidChangeEventUserInfo)initWithNewDuration:(double)a3;
- (NSDictionary)properties;
- (double)newDuration;
@end

@implementation IKPlayerDurationDidChangeEventUserInfo

- (IKPlayerDurationDidChangeEventUserInfo)initWithNewDuration:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)IKPlayerDurationDidChangeEventUserInfo;
  result = [(IKPlayerDurationDidChangeEventUserInfo *)&v5 init];
  if (result) {
    result->_newDuration = a3;
  }
  return result;
}

- (NSDictionary)properties
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
  v4 = [NSNumber numberWithDouble:self->_newDuration];
  [v3 setObject:v4 forKeyedSubscript:@"duration"];

  objc_super v5 = (void *)[v3 copy];
  return (NSDictionary *)v5;
}

- (double)newDuration
{
  return self->_newDuration;
}

@end