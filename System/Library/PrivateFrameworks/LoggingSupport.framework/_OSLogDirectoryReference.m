@interface _OSLogDirectoryReference
- (_OSLogDirectoryReference)initWithDescriptor:(int)a3;
- (_OSLogDirectoryReference)initWithDescriptor:(int)a3 sandboxExtensionToken:(const char *)a4;
- (int)fileDescriptor;
- (void)close;
- (void)dealloc;
@end

@implementation _OSLogDirectoryReference

- (int)fileDescriptor
{
  return self->_fd;
}

- (void)close
{
  int fd = self->_fd;
  if (fd < 0 || close(fd) != -1) {
    goto LABEL_3;
  }
  int v4 = *__error();
  uint64_t v5 = *__error();
  if (v4 != 9)
  {
    _os_assumes_log();
LABEL_3:
    self->_int fd = -1;
    return;
  }
  qword_1E953C2E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E953C318 = v5;
  __break(1u);
}

- (void)dealloc
{
  uint64_t fd = self->_fd;
  if (fd == -1)
  {
    if (self->_etk != -1)
    {
      sandbox_extension_release();
      self->_etk = -1;
    }
    v4.receiver = self;
    v4.super_class = (Class)_OSLogDirectoryReference;
    [(_OSLogDirectoryReference *)&v4 dealloc];
  }
  else
  {
    qword_1E953C2E8 = (uint64_t)"BUG IN LIBTRACE: _OSLogDirectoryReference released before close";
    qword_1E953C318 = fd;
    __break(1u);
  }
}

- (_OSLogDirectoryReference)initWithDescriptor:(int)a3 sandboxExtensionToken:(const char *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_OSLogDirectoryReference;
  v6 = [(_OSLogDirectoryReference *)&v8 init];
  if (v6)
  {
    v6->_uint64_t fd = dup(a3);
    v6->_etk = -1;
    if (a4) {
      v6->_etk = sandbox_extension_consume();
    }
  }
  return v6;
}

- (_OSLogDirectoryReference)initWithDescriptor:(int)a3
{
  return [(_OSLogDirectoryReference *)self initWithDescriptor:*(void *)&a3 sandboxExtensionToken:0];
}

@end