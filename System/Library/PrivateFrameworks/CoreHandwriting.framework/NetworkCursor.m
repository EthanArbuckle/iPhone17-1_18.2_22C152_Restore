@interface NetworkCursor
- (BOOL)isCompletePattern;
- (NetworkCursor)init;
- (id).cxx_construct;
@end

@implementation NetworkCursor

- (NetworkCursor)init
{
  v3.receiver = self;
  v3.super_class = (Class)NetworkCursor;
  result = [(NetworkCursor *)&v3 init];
  if (result) {
    result->_stateType = 0;
  }
  return result;
}

- (BOOL)isCompletePattern
{
  return (self->_stateType & 6) != 0;
}

- (void).cxx_destruct
{
  begin = self->_nodeIndexes.__begin_;
  if (begin)
  {
    self->_nodeIndexes.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end