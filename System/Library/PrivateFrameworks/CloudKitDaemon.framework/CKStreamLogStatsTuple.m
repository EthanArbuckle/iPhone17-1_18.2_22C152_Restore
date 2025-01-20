@interface CKStreamLogStatsTuple
- (NSString)fileAndLine;
- (unint64_t)count;
- (unint64_t)size;
- (void)setCount:(unint64_t)a3;
- (void)setFileAndLine:(id)a3;
- (void)setSize:(unint64_t)a3;
@end

@implementation CKStreamLogStatsTuple

- (NSString)fileAndLine
{
  return self->_fileAndLine;
}

- (void)setFileAndLine:(id)a3
{
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
}

@end