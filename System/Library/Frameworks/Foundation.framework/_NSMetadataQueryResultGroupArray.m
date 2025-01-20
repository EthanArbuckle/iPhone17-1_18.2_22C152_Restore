@interface _NSMetadataQueryResultGroupArray
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)dealloc;
@end

@implementation _NSMetadataQueryResultGroupArray

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [self->_group _zapResultArray];

  v3.receiver = self;
  v3.super_class = (Class)_NSMetadataQueryResultGroupArray;
  [(_NSMetadataQueryResultGroupArray *)&v3 dealloc];
}

- (unint64_t)count
{
  return [self->_group resultCount];
}

- (id)objectAtIndex:(unint64_t)a3
{
  if ([self->_group resultCount] <= a3)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: index (%ld) out of bounds (%ld)", _NSMethodExceptionProem((objc_class *)self, a2), a3, objc_msgSend(self->_group, "resultCount")), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  id group = self->_group;

  return (id)[group resultAtIndex:a3];
}

@end