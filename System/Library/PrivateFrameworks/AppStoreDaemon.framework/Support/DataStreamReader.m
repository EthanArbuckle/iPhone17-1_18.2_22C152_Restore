@interface DataStreamReader
- (BOOL)hasBytesAvailable;
- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4 error:(id *)a5;
- (void)close;
@end

@implementation DataStreamReader

- (BOOL)hasBytesAvailable
{
  unint64_t cursor = self->_cursor;
  return cursor < [(NSData *)self->_data length];
}

- (void)close
{
  data = self->_data;
  self->_data = 0;

  v4.receiver = self;
  v4.super_class = (Class)DataStreamReader;
  [(Stream *)&v4 close];
}

- (int64_t)readBytes:(char *)a3 length:(unint64_t)a4 error:(id *)a5
{
  int64_t v5 = a4;
  NSUInteger v8 = [(NSData *)self->_data length];
  unint64_t cursor = (void *)self->_cursor;
  if (v8 - (unint64_t)cursor < v5) {
    int64_t v5 = v8 - (void)cursor;
  }
  if (v5 >= 1)
  {
    -[NSData getBytes:range:](self->_data, "getBytes:range:", a3, self->_cursor, v5);
    unint64_t cursor = (void *)(self->_cursor + v5);
    self->_unint64_t cursor = (unint64_t)cursor;
  }
  if (cursor == (void *)[(NSData *)self->_data length])
  {
    sub_1002E7B3C((uint64_t)self, 5);
    dispatch_source_merge_data((dispatch_source_t)self->super._delegateSource, 0x10uLL);
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end