@interface NWURLLoaderData
- (BOOL)allowsWrite;
- (BOOL)requestComplete;
- (NSString)multipartMixedReplaceBoundary;
- (OS_nw_connection)underlyingConnection;
- (OS_nw_http_fields)trailerFields;
- (OS_sec_trust)peerTrust;
- (id)initWithURL:(id *)a1;
- (id)takeCachedResponse;
- (void)notifyRequestCompletion:(id)a3;
- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5;
- (void)readResponse:(id)a3;
- (void)start:(id)a3;
- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation NWURLLoaderData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textEncodingName, 0);
  objc_storeStrong((id *)&self->_MIMEType, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

- (OS_nw_connection)underlyingConnection
{
  result = (OS_nw_connection *)_os_crash();
  __break(1u);
  return result;
}

- (void)writeData:(id)a3 complete:(BOOL)a4 completionHandler:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  _os_crash();
  __break(1u);
}

- (BOOL)allowsWrite
{
  return 0;
}

- (OS_nw_http_fields)trailerFields
{
  return 0;
}

- (id)takeCachedResponse
{
  return 0;
}

- (void)notifyRequestCompletion:(id)a3
{
}

- (BOOL)requestComplete
{
  return 1;
}

- (OS_sec_trust)peerTrust
{
  return 0;
}

- (NSString)multipartMixedReplaceBoundary
{
  return 0;
}

- (void)readDataOfMinimumIncompleteLength:(unint64_t)a3 maximumLength:(unint64_t)a4 completionHandler:(id)a5
{
  v15 = (void (**)(id, NWURLLoaderData *, BOOL, void))a5;
  if (self && (data = self->_data) != 0)
  {
    size_t size = dispatch_data_get_size((dispatch_data_t)self->_data);
    size_t offset = self->_offset;
    if (size - offset >= a4) {
      size_t v10 = a4;
    }
    else {
      size_t v10 = size - offset;
    }
    BOOL v11 = size - offset <= a4;
    subrange = (NWURLLoaderData *)dispatch_data_create_subrange(data, offset, v10);
    self->_offset += v10;
    v15[2](v15, subrange, v11, 0);
  }
  else
  {
    v13 = [NWURLError alloc];
    if (v13)
    {
      uint64_t v14 = *MEMORY[0x1E4F289A0];
      v16.receiver = v13;
      v16.super_class = (Class)NWURLError;
      subrange = [(NWURLLoaderData *)&v16 initWithDomain:v14 code:-1000 userInfo:0];
    }
    else
    {
      subrange = 0;
    }
    ((void (**)(id, NWURLLoaderData *, BOOL, NWURLLoaderData *))v15)[2](v15, 0, 0, subrange);
  }
}

- (void)readResponse:(id)a3
{
  v15 = (void (**)(id, void *, void))a3;
  if (self && self->_data)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F18DB0]);
    v5 = self->_URL;
    id v6 = self->_MIMEType;
    data = self->_data;
    size_t size = dispatch_data_get_size(data);
    textEncodingName = self->_textEncodingName;
    size_t v10 = data;
    BOOL v11 = (void *)[v4 initWithURL:v5 MIMEType:v6 expectedContentLength:size textEncodingName:textEncodingName];
    v15[2](v15, v11, 0);

    goto LABEL_4;
  }
  v12 = [NWURLError alloc];
  if (!v12)
  {
    v5 = 0;
    if (self) {
      goto LABEL_9;
    }
LABEL_12:
    URL = 0;
    goto LABEL_10;
  }
  uint64_t v13 = *MEMORY[0x1E4F289A0];
  v16.receiver = v12;
  v16.super_class = (Class)NWURLError;
  v5 = [(NWURLLoaderData *)&v16 initWithDomain:v13 code:-1000 userInfo:0];
  if (!self) {
    goto LABEL_12;
  }
LABEL_9:
  URL = self->_URL;
LABEL_10:
  [(NSURL *)v5 setFailingURL:URL];
  ((void (**)(id, void *, NSURL *))v15)[2](v15, 0, v5);
LABEL_4:
}

- (void)start:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(void))a3;
  CFDictionaryRef properties = 0;
  CFDataRef resourceData = 0;
  SInt32 errorCode = 0;
  if (self) {
    URL = self->_URL;
  }
  else {
    URL = 0;
  }
  if (CFURLCreateDataAndPropertiesFromResource((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFURLRef)URL, &resourceData, &properties, 0, &errorCode))
  {
    CFDataRef v6 = resourceData;
    id v7 = (void *)[(__CFData *)resourceData _createDispatchData];
    if (self) {
      objc_storeStrong((id *)&self->_data, v7);
    }

    CFDictionaryRef v8 = properties;
    v9 = [(__CFDictionary *)properties objectForKeyedSubscript:@"kCFDataURLMimeType"];
    if (self) {
      objc_storeStrong((id *)&self->_MIMEType, v9);
    }

    size_t v10 = [(__CFDictionary *)v8 objectForKeyedSubscript:@"kCFDataURLTextEncodingName"];
    if (self) {
      objc_storeStrong((id *)&self->_textEncodingName, v10);
    }

    v4[2](v4);
  }
  else
  {
    if (__nwlog_url_log::onceToken != -1) {
      dispatch_once(&__nwlog_url_log::onceToken, &__block_literal_global_68_44915);
    }
    BOOL v11 = (id)gurlLogObj;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      SInt32 v16 = errorCode;
      _os_log_impl(&dword_1830D4000, v11, OS_LOG_TYPE_ERROR, "Failed to parse data URL %d", buf, 8u);
    }

    v4[2](v4);
  }
}

- (id)initWithURL:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NWURLLoaderData;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 1, a2);
    }
  }

  return a1;
}

@end