@interface DEDRequestRecord
- (BOOL)isFailure;
- (DEDRequestRecord)initWithRequest:(id)a3 response:(id)a4 session:(id)a5 cookies:(id)a6 body:(id)a7 error:(id)a8;
- (DEDRequestRecord)initWithURL:(id)a3 httpMethod:(id)a4 responseData:(id)a5;
- (NSDate)date;
- (NSString)URL;
- (NSString)method;
- (NSString)requestBody;
- (NSString)requestHeader;
- (NSString)responseBody;
- (NSString)responseHeader;
- (id)formattedBody:(id)a3 error:(id)a4;
- (id)formattedRequestHeader:(id)a3 session:(id)a4 cookies:(id)a5;
- (id)formattedResponseHeader:(id)a3;
- (int64_t)runtime;
- (void)setDate:(id)a3;
- (void)setIsFailure:(BOOL)a3;
- (void)setMethod:(id)a3;
- (void)setRequestBody:(id)a3;
- (void)setRequestHeader:(id)a3;
- (void)setResponseBody:(id)a3;
- (void)setResponseHeader:(id)a3;
- (void)setRuntime:(int64_t)a3;
- (void)setURL:(id)a3;
@end

@implementation DEDRequestRecord

- (DEDRequestRecord)initWithURL:(id)a3 httpMethod:(id)a4 responseData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DEDRequestRecord;
  v11 = [(DEDRequestRecord *)&v16 init];
  if (v11)
  {
    v12 = [v8 path];
    [(DEDRequestRecord *)v11 setURL:v12];

    v13 = [MEMORY[0x263EFF910] date];
    [(DEDRequestRecord *)v11 setDate:v13];

    [(DEDRequestRecord *)v11 setMethod:v9];
    [(DEDRequestRecord *)v11 setIsFailure:0];
    v14 = [(DEDRequestRecord *)v11 formattedBody:v10 error:0];
    [(DEDRequestRecord *)v11 setResponseBody:v14];
  }
  return v11;
}

- (DEDRequestRecord)initWithRequest:(id)a3 response:(id)a4 session:(id)a5 cookies:(id)a6 body:(id)a7 error:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  v46.receiver = self;
  v46.super_class = (Class)DEDRequestRecord;
  id v45 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  v19 = [(DEDRequestRecord *)&v46 init];
  v20 = [v14 URL];
  v21 = [v20 query];

  v22 = [v14 URL];
  uint64_t v23 = [v22 path];
  v24 = (void *)v23;
  if (v21)
  {
    v25 = [v14 URL];
    v26 = [v25 query];
    uint64_t v27 = [v24 stringByAppendingFormat:@"%@%@", @"?", v26];
    URL = v19->_URL;
    v19->_URL = (NSString *)v27;
  }
  else
  {
    v29 = v19->_URL;
    v19->_URL = (NSString *)v23;
    v24 = v29;
  }

  uint64_t v30 = [MEMORY[0x263EFF910] date];
  date = v19->_date;
  v19->_date = (NSDate *)v30;

  uint64_t v32 = [v14 HTTPMethod];
  method = v19->_method;
  v19->_method = (NSString *)v32;

  v19->_isFailure = v15 != 0;
  uint64_t v34 = [(DEDRequestRecord *)v19 formattedRequestHeader:v14 session:v17 cookies:v16];

  requestHeader = v19->_requestHeader;
  v19->_requestHeader = (NSString *)v34;

  v36 = [v14 HTTPBody];

  if (v36)
  {
    v37 = [v14 HTTPBody];
    uint64_t v38 = [(DEDRequestRecord *)v19 formattedBody:v37 error:v15];
    requestBody = v19->_requestBody;
    v19->_requestBody = (NSString *)v38;
  }
  else
  {
    v37 = v19->_requestBody;
    v19->_requestBody = (NSString *)&stru_26D197018;
  }

  uint64_t v40 = [(DEDRequestRecord *)v19 formattedResponseHeader:v18];

  responseHeader = v19->_responseHeader;
  v19->_responseHeader = (NSString *)v40;

  uint64_t v42 = [(DEDRequestRecord *)v19 formattedBody:v45 error:v15];

  responseBody = v19->_responseBody;
  v19->_responseBody = (NSString *)v42;

  return v19;
}

- (id)formattedResponseHeader:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = (void *)MEMORY[0x263F089D8];
  uint64_t v5 = [v3 statusCode];
  v6 = objc_msgSend(MEMORY[0x263F088A0], "localizedStringForStatusCode:", objc_msgSend(v3, "statusCode"));
  v7 = [v4 stringWithFormat:@"%ld %@\n", v5, v6];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [v3 allHeaderFields];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v14 = [v3 allHeaderFields];
        id v15 = [v14 objectForKeyedSubscript:v13];
        [v7 appendFormat:@"%@: %@\n", v13, v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v16 = [NSString stringWithFormat:@"%@", v7];

  return v16;
}

- (id)formattedRequestHeader:(id)a3 session:(id)a4 cookies:(id)a5
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v43 = a5;
  uint64_t v9 = (void *)MEMORY[0x263F089D8];
  uint64_t v10 = [v7 HTTPMethod];
  uint64_t v11 = [v7 URL];
  v12 = [v11 debugDescription];
  uint64_t v13 = [v9 stringWithFormat:@"%@ %@\n", v10, v12];

  v44 = v7;
  id v14 = [v7 URL];
  id v15 = [v14 host];
  [v13 appendFormat:@"Host: %@\n", v15];

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v45 = v8;
  id v16 = [v8 configuration];
  id v17 = [v16 HTTPAdditionalHeaders];

  uint64_t v18 = [v17 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v55 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        uint64_t v23 = [v45 configuration];
        v24 = [v23 HTTPAdditionalHeaders];
        v25 = [v24 objectForKeyedSubscript:v22];
        [v13 appendFormat:@"%@: %@\n", v22, v25];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v19);
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v26 = v43;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v50 objects:v59 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v51 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v50 + 1) + 8 * j);
        uint64_t v32 = [v31 name];
        v33 = [v31 value];
        [v13 appendFormat:@"%@: %@\n", v32, v33];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v50 objects:v59 count:16];
    }
    while (v28);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v34 = [v44 allHTTPHeaderFields];
  uint64_t v35 = [v34 countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v47;
    do
    {
      for (uint64_t k = 0; k != v36; ++k)
      {
        if (*(void *)v47 != v37) {
          objc_enumerationMutation(v34);
        }
        uint64_t v39 = *(void *)(*((void *)&v46 + 1) + 8 * k);
        uint64_t v40 = [v44 valueForHTTPHeaderField:v39];
        [v13 appendFormat:@"%@: %@\n", v39, v40];
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v36);
  }

  v41 = [NSString stringWithFormat:@"%@", v13];

  return v41;
}

- (id)formattedBody:(id)a3 error:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = v6;
    id v8 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
    goto LABEL_9;
  }
  id v15 = 0;
  uint64_t v9 = [MEMORY[0x263F08900] JSONObjectWithData:v5 options:0 error:&v15];
  id v7 = v15;
  if (!v9)
  {
    id v10 = v5;
    goto LABEL_7;
  }
  id v14 = 0;
  id v10 = [MEMORY[0x263F08900] dataWithJSONObject:v9 options:1 error:&v14];
  id v11 = v14;
  if (!v11)
  {
LABEL_7:
    id v8 = (void *)[[NSString alloc] initWithData:v10 encoding:4];
    goto LABEL_8;
  }
  v12 = v11;
  id v8 = (void *)[[NSString alloc] initWithData:v5 encoding:4];

LABEL_8:
LABEL_9:

  return v8;
}

- (NSString)URL
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setURL:(id)a3
{
}

- (NSDate)date
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDate:(id)a3
{
}

- (NSString)method
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMethod:(id)a3
{
}

- (int64_t)runtime
{
  return self->_runtime;
}

- (void)setRuntime:(int64_t)a3
{
  self->_runtime = a3;
}

- (BOOL)isFailure
{
  return self->_isFailure;
}

- (void)setIsFailure:(BOOL)a3
{
  self->_isFailure = a3;
}

- (NSString)requestHeader
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRequestHeader:(id)a3
{
}

- (NSString)requestBody
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequestBody:(id)a3
{
}

- (NSString)responseHeader
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setResponseHeader:(id)a3
{
}

- (NSString)responseBody
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setResponseBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseBody, 0);
  objc_storeStrong((id *)&self->_responseHeader, 0);
  objc_storeStrong((id *)&self->_requestBody, 0);
  objc_storeStrong((id *)&self->_requestHeader, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end