@interface NEFileHandle
- (BOOL)launchOwnerWhenReadable;
- (NEFileHandle)initWithFileDescriptor:(int)a3 launchOwnerWhenReadable:(BOOL)a4;
- (NSFileHandle)handle;
- (OS_xpc_object)dictionary;
- (id)initFromDictionary:(id)a3;
- (unint64_t)type;
@end

@implementation NEFileHandle

- (void).cxx_destruct
{
}

- (NSFileHandle)handle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)launchOwnerWhenReadable
{
  return self->_launchOwnerWhenReadable;
}

- (unint64_t)type
{
  return 0;
}

- (OS_xpc_object)dictionary
{
  v3 = [(NEFileHandle *)self handle];
  int v4 = [v3 fileDescriptor];

  if (v4 < 0)
  {
    xpc_object_t v5 = 0;
  }
  else
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "type", [(NEFileHandle *)self type]);
    v6 = [(NEFileHandle *)self handle];
    xpc_dictionary_set_fd(v5, "file-descriptor", [v6 fileDescriptor]);

    xpc_dictionary_set_BOOL(v5, "launch-owner-when-readable", [(NEFileHandle *)self launchOwnerWhenReadable]);
  }

  return (OS_xpc_object *)v5;
}

- (NEFileHandle)initWithFileDescriptor:(int)a3 launchOwnerWhenReadable:(BOOL)a4
{
  uint64_t v5 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)NEFileHandle;
  v6 = [(NEFileHandle *)&v10 init];
  if (v6)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F28CB0]) initWithFileDescriptor:v5 closeOnDealloc:1];
    handle = v6->_handle;
    v6->_handle = (NSFileHandle *)v7;

    v6->_launchOwnerWhenReadable = a4;
  }
  return v6;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = xpc_dictionary_dup_fd(v4, "file-descriptor");
  BOOL v6 = xpc_dictionary_get_BOOL(v4, "launch-owner-when-readable");

  if ((v5 & 0x80000000) != 0)
  {
    uint64_t v7 = 0;
  }
  else
  {
    self = [(NEFileHandle *)self initWithFileDescriptor:v5 launchOwnerWhenReadable:v6];
    uint64_t v7 = self;
  }

  return v7;
}

@end