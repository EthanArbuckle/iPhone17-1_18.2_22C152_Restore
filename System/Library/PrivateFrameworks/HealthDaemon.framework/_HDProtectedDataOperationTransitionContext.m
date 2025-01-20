@interface _HDProtectedDataOperationTransitionContext
- (BOOL)hasNewState;
- (BOOL)isEqual:(id)a3;
- (_HDProtectedDataOperationTransitionContext)initWithOldState:(int64_t)a3 newState:(int64_t)a4;
- (id)copyWithNewState:(int64_t)a3;
- (int64_t)newState;
- (int64_t)oldState;
- (unint64_t)hash;
@end

@implementation _HDProtectedDataOperationTransitionContext

- (_HDProtectedDataOperationTransitionContext)initWithOldState:(int64_t)a3 newState:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_HDProtectedDataOperationTransitionContext;
  result = [(_HDProtectedDataOperationTransitionContext *)&v7 init];
  if (result)
  {
    result->_oldState = a3;
    result->_newState = a4;
  }
  return result;
}

- (id)copyWithNewState:(int64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  int64_t oldState = self->_oldState;

  return (id)[v5 initWithOldState:oldState newState:a3];
}

- (BOOL)hasNewState
{
  return self->_newState != 0;
}

- (unint64_t)hash
{
  return self->_newState ^ self->_oldState;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_HDProtectedDataOperationTransitionContext *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_oldState == v4->_oldState && self->_newState == v4->_newState;
  }

  return v5;
}

- (int64_t)oldState
{
  return self->_oldState;
}

- (int64_t)newState
{
  return self->_newState;
}

@end