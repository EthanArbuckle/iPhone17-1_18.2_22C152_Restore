@interface BCMessageData
- (BCMessageData)initWithUrl:(id)a3 data:(id)a4;
- (NSArray)imagesArray;
- (NSData)data;
- (NSDictionary)combinedDictionary;
- (NSDictionary)jsonDictionary;
- (NSDictionary)receivedMessageDictionary;
- (NSDictionary)replyMessageDictionary;
- (NSURL)url;
- (void)decodeData:(void *)a3 dictionaryKey:;
@end

@implementation BCMessageData

- (BCMessageData)initWithUrl:(id)a3 data:(id)a4
{
  id v5 = a3;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = LogCategory_Daemon();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [v7 description];
    v11 = [v8 description];
    *(_DWORD *)buf = 138412546;
    v36 = v10;
    __int16 v37 = 2112;
    v38 = v11;
    _os_log_impl(&dword_228C26000, v9, OS_LOG_TYPE_DEFAULT, "BCMessageData: initWithUrl: %@ data: %@", buf, 0x16u);
  }
  v33.receiver = self;
  v33.super_class = (Class)BCMessageData;
  v12 = [(BCMessageData *)&v33 init];
  if (v12)
  {
    if (v7)
    {
      id v25 = v8;
      id v26 = v5;
      id v27 = a4;
      id v28 = v7;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v24 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:v7 resolvingAgainstBaseURL:0];
      v13 = [v24 queryItems];
      uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v30 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v19 = [v18 value];
            v20 = -[NSString normalizedBase64Encoded](v19);
            v21 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v20 options:0];
            v22 = [v18 name];
            -[BCMessageData decodeData:dictionaryKey:](v12, v21, v22);
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v34 count:16];
        }
        while (v15);
      }

      a4 = v27;
      id v7 = v28;
      id v8 = v25;
      id v5 = v26;
    }
    if (v8) {
      -[BCMessageData decodeData:dictionaryKey:](v12, v8, @"data");
    }
    objc_storeStrong((id *)&v12->_url, v5);
    objc_storeStrong((id *)&v12->_data, a4);
  }

  return v12;
}

- (void)decodeData:(void *)a3 dictionaryKey:
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LogCategory_Daemon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v5;
    _os_log_impl(&dword_228C26000, v7, OS_LOG_TYPE_DEFAULT, "BCMessageData: decodeDataKey %@ %@", buf, 0x16u);
  }

  id v14 = 0;
  id v8 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:4 error:&v14];
  id v9 = v14;
  if (v9)
  {
    v10 = LogCategory_Daemon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_error_impl(&dword_228C26000, v10, OS_LOG_TYPE_ERROR, "BCMessageData: error serializing JSON for key %@, error: %@", buf, 0x16u);
    }
  }
  else if ([v6 isEqualToString:@"replyMessage"])
  {
    id v11 = v8;
    v10 = a1[4];
    a1[4] = v11;
  }
  else if ([v6 isEqualToString:@"receivedMessage"])
  {
    id v12 = v8;
    v10 = a1[5];
    a1[5] = v12;
  }
  else if ([v6 isEqualToString:@"data"])
  {
    id v13 = v8;
    v10 = a1[3];
    a1[3] = v13;
  }
  else
  {
    v10 = LogCategory_Daemon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_228C26000, v10, OS_LOG_TYPE_DEFAULT, "BCMessageData: unrecognized key in the url %@", buf, 0xCu);
    }
  }
}

- (NSDictionary)combinedDictionary
{
  v3 = [(BCMessageData *)self jsonDictionary];
  v4 = (void *)[v3 mutableCopy];

  id v5 = [(BCMessageData *)self replyMessageDictionary];

  if (v5)
  {
    id v6 = [(BCMessageData *)self replyMessageDictionary];
    [v4 setObject:v6 forKeyedSubscript:@"replyMessage"];
  }
  id v7 = [(BCMessageData *)self receivedMessageDictionary];

  if (v7)
  {
    id v8 = [(BCMessageData *)self receivedMessageDictionary];
    [v4 setObject:v8 forKeyedSubscript:@"receivedMessage"];
  }

  return (NSDictionary *)v4;
}

- (NSArray)imagesArray
{
  v2 = [(BCMessageData *)self jsonDictionary];
  v3 = [v2 objectForKeyedSubscript:@"images"];

  return (NSArray *)v3;
}

- (NSURL)url
{
  return self->_url;
}

- (NSData)data
{
  return self->_data;
}

- (NSDictionary)jsonDictionary
{
  return self->_jsonDictionary;
}

- (NSDictionary)replyMessageDictionary
{
  return self->_replyMessageDictionary;
}

- (NSDictionary)receivedMessageDictionary
{
  return self->_receivedMessageDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedMessageDictionary, 0);
  objc_storeStrong((id *)&self->_replyMessageDictionary, 0);
  objc_storeStrong((id *)&self->_jsonDictionary, 0);
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end