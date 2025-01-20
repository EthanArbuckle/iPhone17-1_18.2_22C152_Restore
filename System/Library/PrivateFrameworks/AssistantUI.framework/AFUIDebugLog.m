@interface AFUIDebugLog
+ (id)logWithData:(id)a3 mimeType:(id)a4 name:(id)a5 attemptCompression:(BOOL)a6;
- (AFUIDebugLog)initWithData:(id)a3 mimeType:(id)a4 name:(id)a5 attemptCompression:(BOOL)a6;
- (NSData)data;
- (NSString)mimeType;
- (NSString)name;
@end

@implementation AFUIDebugLog

+ (id)logWithData:(id)a3 mimeType:(id)a4 name:(id)a5 attemptCompression:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithData:v12 mimeType:v11 name:v10 attemptCompression:v6];

  return v13;
}

- (AFUIDebugLog)initWithData:(id)a3 mimeType:(id)a4 name:(id)a5 attemptCompression:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v24.receiver = self;
  v24.super_class = (Class)AFUIDebugLog;
  v13 = [(AFUIDebugLog *)&v24 init];
  if (v13)
  {
    if (v6)
    {
      uint64_t v14 = objc_msgSend(v10, "sruif_dataByCompressingWithGzip");
      data = v13->_data;
      v13->_data = (NSData *)v14;
    }
    if (v13->_data)
    {
      mimeType = v13->_mimeType;
      v13->_mimeType = (NSString *)@"application/x-gzip";

      uint64_t v17 = [v12 stringByAppendingPathExtension:@"gz"];
    }
    else
    {
      uint64_t v18 = [v10 copy];
      v19 = v13->_data;
      v13->_data = (NSData *)v18;

      uint64_t v20 = [v11 copy];
      v21 = v13->_mimeType;
      v13->_mimeType = (NSString *)v20;

      uint64_t v17 = [v12 copy];
    }
    name = v13->_name;
    v13->_name = (NSString *)v17;

    if (!v13->_mimeType)
    {
      v13->_mimeType = (NSString *)@"application/octet-stream";
    }
  }

  return v13;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end