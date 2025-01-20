@interface GEOMAResourceFetchReply
- (BOOL)isValid;
- (GEOMAResourceFetchReply)initWithXPCDictionary:(id)a3 error:(id *)a4;
- (NSData)sandBoxToken;
- (NSURL)url;
- (void)encodeToXPCDictionary:(id)a3;
- (void)setSandBoxToken:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation GEOMAResourceFetchReply

- (BOOL)isValid
{
  return 1;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOMAResourceFetchReply;
  [(GEOXPCReply *)&v9 encodeToXPCDictionary:v4];
  url = self->_url;
  if (url)
  {
    id v6 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:url requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "url", (const void *)[v6 bytes], objc_msgSend(v6, "length"));
  }
  sandBoxToken = self->_sandBoxToken;
  if (sandBoxToken)
  {
    id v8 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:sandBoxToken requiringSecureCoding:1 error:0];
    xpc_dictionary_set_data(v4, "sbt", (const void *)[v8 bytes], objc_msgSend(v8, "length"));
  }
}

- (void)setUrl:(id)a3
{
}

- (void)setSandBoxToken:(id)a3
{
}

- (GEOMAResourceFetchReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOMAResourceFetchReply;
  v7 = [(GEOXPCReply *)&v19 initWithXPCDictionary:v6 error:a4];
  if (v7)
  {
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "url", &length);
    if (data)
    {
      objc_super v9 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:data length:length freeWhenDone:0];
      uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v9 error:a4];
      url = v7->_url;
      v7->_url = (NSURL *)v10;
    }
    size_t length = 0;
    v12 = xpc_dictionary_get_data(v6, "sbt", &length);
    if (v12)
    {
      v13 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v12 length:length freeWhenDone:0];
      uint64_t v14 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v13 error:a4];
      sandBoxToken = v7->_sandBoxToken;
      v7->_sandBoxToken = (NSData *)v14;
    }
    v16 = v7;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sandBoxToken, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (NSURL)url
{
  return self->_url;
}

- (NSData)sandBoxToken
{
  return self->_sandBoxToken;
}

@end