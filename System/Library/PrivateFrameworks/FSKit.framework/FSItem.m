@interface FSItem
- (FSFileHandle)fileHandle;
- (FSItem)init;
- (int64_t)type;
- (void)setFileHandle:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation FSItem

- (FSItem)init
{
  v8.receiver = self;
  v8.super_class = (Class)FSItem;
  v2 = [(FSItem *)&v8 init];
  if (v2)
  {
    v3 = objc_opt_class();
    objc_sync_enter(v3);
    v4 = [FSFileHandle alloc];
    ++fileHandleCounter;
    uint64_t v5 = -[FSFileHandle initWithValue:](v4, "initWithValue:");
    fileHandle = v2->_fileHandle;
    v2->_fileHandle = (FSFileHandle *)v5;

    objc_sync_exit(v3);
  }
  return v2;
}

- (FSFileHandle)fileHandle
{
  return (FSFileHandle *)objc_getProperty(self, a2, 8, 1);
}

- (void)setFileHandle:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
}

@end