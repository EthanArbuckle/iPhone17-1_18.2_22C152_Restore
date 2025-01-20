@interface _CSMultiQueryCountResult
- (unint64_t)count;
- (void)setCount:(unint64_t)a3;
@end

@implementation _CSMultiQueryCountResult

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

@end