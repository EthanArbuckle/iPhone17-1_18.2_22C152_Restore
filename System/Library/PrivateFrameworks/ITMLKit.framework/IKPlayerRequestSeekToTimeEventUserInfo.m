@interface IKPlayerRequestSeekToTimeEventUserInfo
- (BOOL)shouldSeek;
- (IKPlayerRequestSeekToTimeEventUserInfo)initWithRequestedTime:(double)a3 currentTime:(double)a4;
- (NSDictionary)properties;
- (double)currentTime;
- (double)proposedTime;
- (double)requestedTime;
- (void)processReturnJSValue:(id)a3 inContext:(id)a4;
@end

@implementation IKPlayerRequestSeekToTimeEventUserInfo

- (IKPlayerRequestSeekToTimeEventUserInfo)initWithRequestedTime:(double)a3 currentTime:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IKPlayerRequestSeekToTimeEventUserInfo;
  result = [(IKPlayerRequestSeekToTimeEventUserInfo *)&v7 init];
  if (result)
  {
    result->_requestedTime = a3;
    result->_currentTime = a4;
    result->_shouldSeek = 1;
    result->_proposedTime = a3;
  }
  return result;
}

- (NSDictionary)properties
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  v4 = [NSNumber numberWithDouble:self->_requestedTime];
  [v3 setObject:v4 forKeyedSubscript:@"requestedTime"];

  v5 = [NSNumber numberWithDouble:self->_currentTime];
  [v3 setObject:v5 forKeyedSubscript:@"currentTime"];

  v6 = (void *)[v3 copy];
  return (NSDictionary *)v6;
}

- (void)processReturnJSValue:(id)a3 inContext:(id)a4
{
  id v7 = a3;
  if ([v7 isNull])
  {
    self->_shouldSeek = 0;
  }
  else if ([v7 isBoolean])
  {
    self->_shouldSeek = [v7 toBool];
  }
  else if ([v7 isNumber])
  {
    v5 = [v7 toNumber];
    [v5 doubleValue];
    self->_proposedTime = v6;
  }
}

- (double)requestedTime
{
  return self->_requestedTime;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (BOOL)shouldSeek
{
  return self->_shouldSeek;
}

- (double)proposedTime
{
  return self->_proposedTime;
}

@end