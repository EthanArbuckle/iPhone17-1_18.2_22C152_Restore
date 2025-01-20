@interface IKPlayerShouldHandleStateChangeEventUserInfo
- (BOOL)shouldHandle;
- (IKPlayerShouldHandleStateChangeEventUserInfo)initWithState:(int64_t)a3;
- (IKPlayerShouldHandleStateChangeEventUserInfo)initWithState:(int64_t)a3 oldState:(int64_t)a4;
- (IKPlayerShouldHandleStateChangeEventUserInfo)initWithState:(int64_t)a3 oldState:(int64_t)a4 requestedTime:(double)a5;
- (IKPlayerShouldHandleStateChangeEventUserInfo)initWithState:(int64_t)a3 requestedTime:(double)a4;
- (double)proposedTime;
- (double)requestedTime;
- (void)processReturnJSValue:(id)a3 inContext:(id)a4;
@end

@implementation IKPlayerShouldHandleStateChangeEventUserInfo

- (IKPlayerShouldHandleStateChangeEventUserInfo)initWithState:(int64_t)a3
{
  return [(IKPlayerShouldHandleStateChangeEventUserInfo *)self initWithState:a3 requestedTime:0.0];
}

- (IKPlayerShouldHandleStateChangeEventUserInfo)initWithState:(int64_t)a3 oldState:(int64_t)a4
{
  return [(IKPlayerShouldHandleStateChangeEventUserInfo *)self initWithState:a3 oldState:a4 requestedTime:0.0];
}

- (IKPlayerShouldHandleStateChangeEventUserInfo)initWithState:(int64_t)a3 requestedTime:(double)a4
{
  v6.receiver = self;
  v6.super_class = (Class)IKPlayerShouldHandleStateChangeEventUserInfo;
  result = [(IKPlayerStateChangeEventUserInfo *)&v6 initWithState:a3];
  if (result)
  {
    result->_shouldHandle = 1;
    result->_requestedTime = a4;
    result->_proposedTime = a4;
  }
  return result;
}

- (IKPlayerShouldHandleStateChangeEventUserInfo)initWithState:(int64_t)a3 oldState:(int64_t)a4 requestedTime:(double)a5
{
  v7.receiver = self;
  v7.super_class = (Class)IKPlayerShouldHandleStateChangeEventUserInfo;
  result = [(IKPlayerStateChangeEventUserInfo *)&v7 initWithState:a3 oldState:a4];
  if (result)
  {
    result->_shouldHandle = 1;
    result->_requestedTime = a5;
    result->_proposedTime = a5;
  }
  return result;
}

- (void)processReturnJSValue:(id)a3 inContext:(id)a4
{
  id v7 = a3;
  if ([v7 isNull])
  {
    self->_shouldHandle = 0;
  }
  else if ([v7 isBoolean])
  {
    self->_shouldHandle = [v7 toBool];
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

- (BOOL)shouldHandle
{
  return self->_shouldHandle;
}

- (double)proposedTime
{
  return self->_proposedTime;
}

@end