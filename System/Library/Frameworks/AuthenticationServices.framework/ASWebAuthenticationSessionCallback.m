@interface ASWebAuthenticationSessionCallback
+ (BOOL)supportsSecureCoding;
+ (id)callbackWithCustomScheme:(id)a3;
+ (id)callbackWithDownloadMIMEType:(id)a3;
+ (id)callbackWithHTTPSHost:(id)a3 path:(id)a4;
- (ASWebAuthenticationSessionCallback)initWithCoder:(id)a3;
- (BOOL)matchesURL:(id)a3;
- (NSString)customScheme;
- (NSString)downloadMIMEType;
- (NSString)host;
- (NSString)path;
- (id)_initWithCustomScheme:(id)a3 host:(id)a4 path:(id)a5 downloadMIMEType:(id)a6;
- (id)description;
- (unint64_t)callbackType;
- (void)encodeWithCoder:(id)a3;
- (void)setCallbackType:(unint64_t)a3;
@end

@implementation ASWebAuthenticationSessionCallback

+ (id)callbackWithCustomScheme:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithCustomScheme:v4 host:0 path:0 downloadMIMEType:0];

  return v5;
}

+ (id)callbackWithHTTPSHost:(id)a3 path:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) _initWithCustomScheme:0 host:v7 path:v6 downloadMIMEType:0];

  return v8;
}

+ (id)callbackWithDownloadMIMEType:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithCustomScheme:0 host:0 path:0 downloadMIMEType:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithCustomScheme:(id)a3 host:(id)a4 path:(id)a5 downloadMIMEType:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)ASWebAuthenticationSessionCallback;
  v14 = [(ASWebAuthenticationSessionCallback *)&v28 init];
  if (v14)
  {
    if (v11)
    {
      if (!v12)
      {
        id v27 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Unexpectedly found nil path when using HTTPS callback." userInfo:0];
        objc_exception_throw(v27);
      }
      if (([v12 hasPrefix:@"/"] & 1) == 0)
      {
        uint64_t v15 = [@"/" stringByAppendingString:v12];

        id v12 = (id)v15;
      }
      v16 = objc_msgSend(v12, "safari_stringByDeletingTrailingSlash");

      uint64_t v17 = [v11 copy];
      host = v14->_host;
      v14->_host = (NSString *)v17;

      uint64_t v19 = [v16 copy];
      path = v14->_path;
      v14->_path = (NSString *)v19;

      v14->_callbackType = 1;
      id v12 = v16;
    }
    else if (v13)
    {
      uint64_t v21 = [v13 copy];
      downloadMIMEType = v14->_downloadMIMEType;
      v14->_downloadMIMEType = (NSString *)v21;

      v14->_callbackType = 2;
    }
    else
    {
      uint64_t v23 = [v10 copy];
      customScheme = v14->_customScheme;
      v14->_customScheme = (NSString *)v23;

      v14->_callbackType = 0;
    }
    v25 = v14;
  }

  return v14;
}

- (ASWebAuthenticationSessionCallback)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scheme"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"host"];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadMIMEType"];

  v9 = [(ASWebAuthenticationSessionCallback *)self _initWithCustomScheme:v5 host:v6 path:v7 downloadMIMEType:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  customScheme = self->_customScheme;
  id v5 = a3;
  [v5 encodeObject:customScheme forKey:@"scheme"];
  [v5 encodeObject:self->_host forKey:@"host"];
  [v5 encodeObject:self->_path forKey:@"path"];
  [v5 encodeObject:self->_downloadMIMEType forKey:@"downloadMIMEType"];
}

- (id)description
{
  unint64_t callbackType = self->_callbackType;
  if (callbackType == 2)
  {
    [NSString stringWithFormat:@"Download { mimeType: %@ }", self->_downloadMIMEType, v4];
  }
  else if (callbackType == 1)
  {
    [NSString stringWithFormat:@"Callback { URL: https://%@%@ }", self->_host, self->_path];
  }
  else
  {
    if (callbackType) {
      goto LABEL_8;
    }
    [NSString stringWithFormat:@"Callback { scheme: %@ }", self->_customScheme, v4];
  }
  a2 = (SEL)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return (id)(id)a2;
}

- (BOOL)matchesURL:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  unint64_t callbackType = self->_callbackType;
  if (callbackType == 1)
  {
    if (objc_msgSend(v4, "safari_isHTTPFamilyURL"))
    {
      v9 = [v5 host];
      uint64_t v10 = [v9 caseInsensitiveCompare:self->_host];

      if (!v10)
      {
        id v11 = [v5 path];
        id v7 = objc_msgSend(v11, "safari_stringByDeletingTrailingSlash");

        char v8 = [v7 caseInsensitiveCompare:self->_path] == 0;
        goto LABEL_9;
      }
    }
  }
  else if (!callbackType && (objc_msgSend(v4, "safari_isHTTPFamilyURL") & 1) == 0)
  {
    id v7 = [v5 scheme];
    char v8 = objc_msgSend(v7, "safari_isCaseInsensitiveEqualToString:", self->_customScheme);
LABEL_9:

    goto LABEL_10;
  }
  char v8 = 0;
LABEL_10:

  return v8;
}

- (unint64_t)callbackType
{
  return self->_callbackType;
}

- (void)setCallbackType:(unint64_t)a3
{
  self->_unint64_t callbackType = a3;
}

- (NSString)customScheme
{
  return self->_customScheme;
}

- (NSString)host
{
  return self->_host;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)downloadMIMEType
{
  return self->_downloadMIMEType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadMIMEType, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_host, 0);

  objc_storeStrong((id *)&self->_customScheme, 0);
}

@end