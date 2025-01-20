@interface MCMXPCMessageWithURLBase
- (MCMXPCMessageWithURLBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSURL)url;
@end

@implementation MCMXPCMessageWithURLBase

- (void).cxx_destruct
{
  p_url = &self->_url;

  objc_storeStrong((id *)p_url, 0);
}

- (NSURL)url
{
  return self->_url;
}

- (MCMXPCMessageWithURLBase)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCMXPCMessageWithURLBase;
  v9 = [(MCMXPCMessageBase *)&v15 initWithXPCObject:v8 context:a4 error:a5];
  if (v9)
  {
    string = xpc_dictionary_get_string(v8, "Path");
    if (string
      && ([MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:string isDirectory:1 relativeToURL:0], (v11 = (NSURL *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      url = v9->_url;
      v9->_url = v11;
      v13 = v11;
    }
    else
    {
      if (a5) {
        *a5 = 38;
      }
      v13 = v9;
      v9 = 0;
    }
  }
  return v9;
}

@end