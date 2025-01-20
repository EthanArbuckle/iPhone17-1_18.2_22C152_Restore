@interface _NSMetadataQueryResultArray
- (_NSMetadataQueryResultArray)retain;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)release;
@end

@implementation _NSMetadataQueryResultArray

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)_NSMetadataQueryResultArray;
  [(_NSMetadataQueryResultArray *)&v3 dealloc];
}

- (unint64_t)retainCount
{
  return self->_rc + 1;
}

- (_NSMetadataQueryResultArray)retain
{
  return self;
}

- (void)release
{
  id query = self->_query;
  objc_sync_enter(query);
  if ((int)atomic_fetch_add_explicit(&self->_rc, 0xFFFFFFFF, memory_order_relaxed) <= 0)
  {
    [self->_query _zapResultArrayIfIdenticalTo:self];
    objc_sync_exit(query);
    [(_NSMetadataQueryResultArray *)self dealloc];
  }
  else
  {
    objc_sync_exit(query);
  }
}

- (unint64_t)count
{
  return [self->_query resultCount];
}

- (id)objectAtIndex:(unint64_t)a3
{
  if ([self->_query resultCount] <= a3)
  {
    v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: index (%ld) out of bounds (%ld)", _NSMethodExceptionProem((objc_class *)self, a2), a3, objc_msgSend(self->_query, "resultCount")), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  id query = self->_query;

  return (id)[query resultAtIndex:a3];
}

@end