@interface MCMResultBase
- (BOOL)encodeResultOntoReply:(id)a3;
- (BOOL)isCacheable;
- (MCMError)error;
- (MCMResultBase)init;
- (MCMResultBase)initWithError:(id)a3;
- (void)setCacheable:(BOOL)a3;
@end

@implementation MCMResultBase

- (void).cxx_destruct
{
  p_error = &self->_error;

  objc_storeStrong((id *)p_error, 0);
}

- (MCMResultBase)initWithError:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMResultBase;
  v6 = [(MCMResultBase *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v7->_cacheable = 1;
  }

  return v7;
}

- (MCMResultBase)init
{
  return [(MCMResultBase *)self initWithError:0];
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  id v4 = a3;
  id v5 = [(MCMResultBase *)self error];

  if (v5)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    v7 = [(MCMResultBase *)self error];
    [v7 category];
    v8 = [(MCMResultBase *)self error];
    [v8 type];
    objc_super v9 = [(MCMResultBase *)self error];
    id v10 = [v9 path];
    [v10 fileSystemRepresentation];
    v11 = [(MCMResultBase *)self error];
    [v11 POSIXerrno];
    container_error_create();

    container_xpc_encode_error();
    container_error_free();
    xpc_dictionary_set_value(v4, "ReplyErrorExtended", v6);
  }
  xpc_dictionary_set_BOOL(v4, "ReplyCacheable", [(MCMResultBase *)self isCacheable]);

  return 1;
}

- (MCMError)error
{
  return self->_error;
}

- (BOOL)isCacheable
{
  return self->_cacheable;
}

- (void)setCacheable:(BOOL)a3
{
  self->_cacheable = a3;
}

@end