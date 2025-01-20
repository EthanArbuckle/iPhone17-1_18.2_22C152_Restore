@interface MCMResultContainerFromPath
- (BOOL)encodeResultOntoReply:(id)a3;
- (MCMResultContainerFromPath)initWithUUID:(id)a3 containerPathIdentifier:(id)a4 identifier:(id)a5 containerClass:(unint64_t)a6 POSIXUser:(id)a7 personaUniqueString:(id)a8 sandboxToken:(const char *)a9 existed:(BOOL)a10 url:(id)a11 info:(id)a12 transient:(BOOL)a13 userManagedAssetsRelPath:(id)a14 creator:(id)a15 relativePath:(id)a16;
- (NSString)relativePath;
- (void)setRelativePath:(id)a3;
@end

@implementation MCMResultContainerFromPath

- (void).cxx_destruct
{
  p_relativePath = &self->_relativePath;

  objc_storeStrong((id *)p_relativePath, 0);
}

- (void)setRelativePath:(id)a3
{
  p_relativePath = &self->_relativePath;

  objc_storeStrong((id *)p_relativePath, a3);
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (BOOL)encodeResultOntoReply:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMResultContainerFromPath;
  BOOL v5 = [(MCMResultWithContainerBase *)&v9 encodeResultOntoReply:v4];
  if (v5)
  {
    id v6 = [(MCMResultBase *)self error];
    if (v6)
    {
LABEL_5:

      goto LABEL_6;
    }
    v7 = [(MCMResultContainerFromPath *)self relativePath];

    if (v7)
    {
      id v6 = [(MCMResultContainerFromPath *)self relativePath];
      xpc_dictionary_set_string(v4, "ReplyRelativePath", (const char *)[v6 UTF8String]);
      goto LABEL_5;
    }
  }
LABEL_6:

  return v5;
}

- (MCMResultContainerFromPath)initWithUUID:(id)a3 containerPathIdentifier:(id)a4 identifier:(id)a5 containerClass:(unint64_t)a6 POSIXUser:(id)a7 personaUniqueString:(id)a8 sandboxToken:(const char *)a9 existed:(BOOL)a10 url:(id)a11 info:(id)a12 transient:(BOOL)a13 userManagedAssetsRelPath:(id)a14 creator:(id)a15 relativePath:(id)a16
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v26 = a16;
  v29.receiver = self;
  v29.super_class = (Class)MCMResultContainerFromPath;
  v18 = [(MCMResultWithContainerBase *)&v29 initWithUUID:a3 containerPathIdentifier:a4 identifier:a5 containerClass:a6 POSIXUser:a7 personaUniqueString:a8 sandboxToken:a9 existed:a10 url:a11 info:a12 transient:a13 userManagedAssetsRelPath:a14 creator:a15];
  v19 = v18;
  if (v18) {
    objc_storeStrong((id *)&v18->_relativePath, a16);
  }

  return v19;
}

@end