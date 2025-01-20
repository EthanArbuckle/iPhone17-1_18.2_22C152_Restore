@interface AVAirMessageResponse
+ (id)messageWithVersion:(id)a3 headers:(id)a4 bodyData:(id)a5;
+ (id)responseWithParts:(id)a3;
- (AVAirMessageResponse)initWithStatus:(int64_t)a3 localizedDescription:(id)a4;
- (NSString)description;
- (NSString)localizedDescription;
- (id)bodyData;
- (id)headersForContentLength:(int64_t)a3 compression:(id)a4;
- (id)messageDataRepresentation;
- (int64_t)status;
@end

@implementation AVAirMessageResponse

- (void).cxx_destruct
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (int64_t)status
{
  return self->_status;
}

- (id)messageDataRepresentation
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v19 = [(AVAirMessageResponse *)self bodyData];
  v3 = -[AVAirMessageResponse headersForContentLength:compression:](self, "headersForContentLength:compression:", [v19 length], 0);
  v4 = [MEMORY[0x1E4F1CA48] arrayWithObject:@"AVKitAirResponse/1"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v11 = NSString;
        v12 = [v5 objectForKeyedSubscript:v10];
        v13 = [v11 stringWithFormat:@"%@:%@", v10, v12];
        [v4 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }

  v14 = [v4 componentsJoinedByString:@"\n"];
  v15 = [v14 stringByAppendingFormat:@"\n\n"];

  v16 = [v15 dataUsingEncoding:4];
  v17 = (void *)[v16 mutableCopy];
  if ([v19 length]) {
    [v17 appendData:v19];
  }

  return v17;
}

- (id)bodyData
{
  v18[2] = *MEMORY[0x1E4F143B8];
  v17[0] = @"status";
  v3 = objc_msgSend(NSNumber, "numberWithInteger:", -[AVAirMessageResponse status](self, "status"));
  v17[1] = @"description";
  v18[0] = v3;
  uint64_t v4 = [(AVAirMessageResponse *)self localizedDescription];
  id v5 = (void *)v4;
  uint64_t v6 = &stru_1F09185C8;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  v18[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  id v12 = 0;
  uint64_t v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:4 error:&v12];
  id v9 = v12;
  if (!v8)
  {
    uint64_t v10 = _avairlog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[AVAirMessageResponse bodyData]";
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "%s failed to serialize response body: %{public}@", buf, 0x16u);
    }
  }

  return v8;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int64_t v6 = [(AVAirMessageResponse *)self status];
  uint64_t v7 = [(AVAirMessageResponse *)self localizedDescription];
  uint64_t v8 = (void *)v7;
  id v9 = &stru_1F09185C8;
  if (v7) {
    id v9 = (__CFString *)v7;
  }
  uint64_t v10 = [v3 stringWithFormat:@"%@ status %ld; \"%@\"", v5, v6, v9];

  return (NSString *)v10;
}

- (id)headersForContentLength:(int64_t)a3 compression:(id)a4
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v19[0] = @"length";
  int64_t v6 = NSNumber;
  uint64_t v7 = (__CFString *)a4;
  uint64_t v8 = [v6 numberWithInteger:a3];
  uint64_t v9 = [v8 stringValue];
  uint64_t v10 = (void *)v9;
  v11 = @"none";
  if (v7) {
    v11 = v7;
  }
  v20[0] = v9;
  v20[1] = v11;
  v19[1] = @"compression";
  v19[2] = @"response-status";
  id v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[AVAirMessageResponse status](self, "status"));
  v13 = [v12 stringValue];
  v20[2] = v13;
  v19[3] = @"response-description";
  uint64_t v14 = [(AVAirMessageResponse *)self localizedDescription];
  __int16 v15 = (void *)v14;
  id v16 = &stru_1F09185C8;
  if (v14) {
    id v16 = (__CFString *)v14;
  }
  v20[3] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:4];

  return v17;
}

- (AVAirMessageResponse)initWithStatus:(int64_t)a3 localizedDescription:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVAirMessageResponse;
  uint64_t v7 = [(AVAirMessageResponse *)&v12 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_status = a3;
    uint64_t v9 = [v6 copy];
    localizedDescription = v8->_localizedDescription;
    v8->_localizedDescription = (NSString *)v9;
  }
  return v8;
}

+ (id)responseWithParts:(id)a3
{
  id v4 = a3;
  if ([v4 isIncomplete])
  {
    [v4 rawBodyData];
  }
  id v5 = [v4 version];
  id v6 = [v4 uniqueHeaders];
  uint64_t v7 = [v4 rawBodyData];
  uint64_t v8 = [a1 messageWithVersion:v5 headers:v6 bodyData:v7];

  return v8;
}

+ (id)messageWithVersion:(id)a3 headers:(id)a4 bodyData:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  uint64_t v7 = (__CFString *)a4;
  uint64_t v8 = _avairlog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    id v16 = "+[AVAirMessageResponse messageWithVersion:headers:bodyData:]";
    __int16 v17 = 2114;
    v18 = v7;
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s response received: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  if ([(__CFString *)v6 isEqualToString:@"AVKitAirResponse/1"])
  {
    uint64_t v9 = [(__CFString *)v7 objectForKeyedSubscript:@"response-status"];
    uint64_t v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 integerValue];
      objc_super v12 = [(__CFString *)v7 objectForKeyedSubscript:@"response-description"];
      v13 = [[AVAirMessageResponse alloc] initWithStatus:v11 localizedDescription:v12];
    }
    else
    {
      objc_super v12 = _avairlog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315394;
        id v16 = "+[AVAirMessageResponse messageWithVersion:headers:bodyData:]";
        __int16 v17 = 2114;
        v18 = @"response-status";
        _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "%s response is invalid: the %{public}@ header is missing", (uint8_t *)&v15, 0x16u);
      }
      v13 = 0;
    }
  }
  else
  {
    uint64_t v10 = _avairlog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      id v16 = "+[AVAirMessageResponse messageWithVersion:headers:bodyData:]";
      __int16 v17 = 2114;
      v18 = v6;
      __int16 v19 = 2114;
      long long v20 = @"AVKitAirResponse/1";
      _os_log_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_DEFAULT, "%s response version seems incorrect; have '%{public}@' but expecting '%{public}@'",
        (uint8_t *)&v15,
        0x20u);
    }
    v13 = 0;
  }

  return v13;
}

@end