@interface MCMResultWithURLBase
- (BOOL)encodeResultOntoReply:(id)a3;
- (BOOL)existed;
- (MCMResultWithURLBase)initWithPath:(id)a3 existed:(BOOL)a4 sandboxToken:(const char *)a5;
- (MCMResultWithURLBase)initWithURL:(id)a3 existed:(BOOL)a4 sandboxToken:(const char *)a5;
- (NSString)path;
- (NSURL)url;
- (const)sandboxToken;
- (void)dealloc;
@end

@implementation MCMResultWithURLBase

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MCMResultWithURLBase;
  BOOL v5 = [(MCMResultBase *)&v12 encodeResultOntoReply:v4];
  if (v5)
  {
    v6 = [(MCMResultBase *)self error];

    if (!v6)
    {
      v7 = [(MCMResultWithURLBase *)self path];

      if (v7)
      {
        id v8 = [(MCMResultWithURLBase *)self path];
        v9 = (const char *)[v8 fileSystemRepresentation];

        if (v9) {
          xpc_dictionary_set_string(v4, "ReplyPath", v9);
        }
      }
      v10 = self;
      if ([(MCMResultWithURLBase *)v10 sandboxToken]) {
        xpc_dictionary_set_string(v4, "ReplySandboxToken", [(MCMResultWithURLBase *)v10 sandboxToken]);
      }
      xpc_dictionary_set_BOOL(v4, "ReplyExisted", [(MCMResultWithURLBase *)v10 existed]);
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  p_sandboxToken = &self->_sandboxToken;
  sandboxToken = (char *)self->_sandboxToken;
  if (sandboxToken)
  {
    free(sandboxToken);
    memset_s(p_sandboxToken, 8uLL, 0, 8uLL);
  }
  v5.receiver = self;
  v5.super_class = (Class)MCMResultWithURLBase;
  [(MCMResultWithURLBase *)&v5 dealloc];
}

- (BOOL)existed
{
  return self->_existed;
}

- (const)sandboxToken
{
  return self->_sandboxToken;
}

- (NSString)path
{
  return self->_path;
}

- (NSURL)url
{
  return self->_url;
}

- (MCMResultWithURLBase)initWithPath:(id)a3 existed:(BOOL)a4 sandboxToken:(const char *)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MCMResultWithURLBase;
  v10 = [(MCMResultBase *)&v14 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_path, a3);
    if (a5) {
      objc_super v12 = strndup(a5, 0x800uLL);
    }
    else {
      objc_super v12 = 0;
    }
    v11->_sandboxToken = v12;
    v11->_existed = a4;
  }

  return v11;
}

- (MCMResultWithURLBase)initWithURL:(id)a3 existed:(BOOL)a4 sandboxToken:(const char *)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  v10 = [v9 path];
  v11 = [(MCMResultWithURLBase *)self initWithPath:v10 existed:v6 sandboxToken:a5];

  if (v11) {
    objc_storeStrong((id *)&v11->_url, a3);
  }

  return v11;
}

@end