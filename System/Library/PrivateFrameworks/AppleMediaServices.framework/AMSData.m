@interface AMSData
+ (id)compressedGzippedDataWithData:(id)a3;
+ (id)dataWithObject:(id)a3 encoding:(int64_t)a4 error:(id *)a5;
+ (id)decompressedDataWithGzippedData:(id)a3;
+ (id)objectWithData:(id)a3 encoding:(int64_t)a4 error:(id *)a5;
+ (id)objectWithData:(id)a3 response:(id)a4 error:(id *)a5;
+ (int64_t)_dataEncodingFromResponse:(id)a3;
+ (int64_t)dataEncodingFromContentType:(id)a3;
@end

@implementation AMSData

+ (id)objectWithData:(id)a3 response:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 length])
  {
    id v14 = 0;
    v10 = objc_msgSend(a1, "objectWithData:encoding:error:", v8, objc_msgSend(a1, "_dataEncodingFromResponse:", v9), &v14);
    id v11 = v14;
    v12 = v11;
    if (a5) {
      *a5 = v11;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)objectWithData:(id)a3 encoding:(int64_t)a4 error:(id *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (v8)
  {
    id v9 = 0;
    switch(a4)
    {
      case 0:
        id v9 = [a1 objectWithData:v8 encoding:2 error:0];
        if (!v9)
        {
          id v9 = [a1 objectWithData:v8 encoding:3 error:0];
          if (!v9)
          {
            v10 = AMSError(4, @"Decoding Failed", @"Unable to determine encoding for unknown encoding", 0);
            id v11 = v10;
            if (a5)
            {
              *a5 = v10;
            }
            else
            {
              v13 = +[AMSLogConfig sharedConfig];
              if (!v13)
              {
                v13 = +[AMSLogConfig sharedConfig];
              }
              id v14 = [v13 OSLogObject];
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                uint64_t v15 = objc_opt_class();
                v16 = AMSLogableError(v11);
                int v18 = 138543618;
                uint64_t v19 = v15;
                __int16 v20 = 2114;
                v21 = v16;
                _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to decode data. Error = %{public}@", (uint8_t *)&v18, 0x16u);
              }
            }

            goto LABEL_17;
          }
        }
        break;
      case 2:
        uint64_t v12 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:a5];
        goto LABEL_10;
      case 3:
        uint64_t v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v8 options:0 error:a5];
        goto LABEL_10;
      case 4:
        uint64_t v12 = [[NSString alloc] initWithData:v8 encoding:4];
LABEL_10:
        id v9 = (void *)v12;
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_17:
    id v9 = 0;
  }

  return v9;
}

+ (int64_t)_dataEncodingFromResponse:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = objc_msgSend(v4, "ams_valueForHTTPHeaderField:", @"Content-Type");
    int64_t v6 = [a1 dataEncodingFromContentType:v5];
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

+ (int64_t)dataEncodingFromContentType:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    if ([v3 rangeOfString:@"/json" options:1] == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v4 = [v3 rangeOfString:@"/xml" options:1];
      uint64_t v5 = [v3 rangeOfString:@"/plist" options:1];
      int64_t v6 = 2;
      if (v4 == 0x7FFFFFFFFFFFFFFFLL && v5 == 0x7FFFFFFFFFFFFFFFLL) {
        int64_t v6 = [v3 rangeOfString:@"/data" options:1] != 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      int64_t v6 = 3;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

+ (id)decompressedDataWithGzippedData:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  memset(&strm.avail_in, 0, 104);
  strm.avail_in = [v3 length];
  id v4 = v3;
  strm.next_in = (Bytef *)[v4 bytes];
  id v5 = 0;
  if (!inflateInit2_(&strm, 31, "1.2.12", 112))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v10;
      unsigned int v6 = inflate(&strm, 0);
      if (v6 > 1) {
        break;
      }
      unsigned int v7 = v6;
      if (strm.avail_out != 0x4000) {
        [v5 appendBytes:v10 length:0x4000 - strm.avail_out];
      }
      if (v7)
      {
        inflateEnd(&strm);
        goto LABEL_9;
      }
    }
    inflateEnd(&strm);

    id v5 = 0;
  }
LABEL_9:

  return v5;
}

+ (id)dataWithObject:(id)a3 encoding:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  if (v7)
  {
    switch(a4)
    {
      case 1:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_19;
        }
        id v8 = v7;
        goto LABEL_11;
      case 2:
        if ([MEMORY[0x1E4F28F98] propertyList:v7 isValidForFormat:100])
        {
          id v8 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:100 options:0 error:a5];
          goto LABEL_11;
        }
        if (!a5) {
          goto LABEL_19;
        }
        v10 = @"Invalid PLIST object";
        goto LABEL_18;
      case 3:
        if ([MEMORY[0x1E4F28D90] isValidJSONObject:v7])
        {
          id v8 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v7 options:0 error:a5];
          goto LABEL_11;
        }
        if (!a5) {
          goto LABEL_19;
        }
        v10 = @"Invalid JSON object";
        goto LABEL_18;
      case 4:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = [v7 dataUsingEncoding:4];
LABEL_11:
          id v9 = v8;
        }
        else
        {
          if (!a5) {
            goto LABEL_19;
          }
          v10 = @"Invalid String object";
LABEL_18:
          AMSError(3, @"Data Encoding Failed", v10, 0);
          id v9 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        break;
      default:
        goto LABEL_19;
    }
  }
  else
  {
LABEL_19:
    id v9 = 0;
  }

  return v9;
}

+ (id)compressedGzippedDataWithData:(id)a3
{
  id v3 = a3;
  id v4 = (Bytef *)[v3 bytes];
  uint64_t v5 = [v3 length];

  id v6 = 0;
  if (v4 && v5)
  {
    memset(&v11.avail_in, 0, 104);
    v11.avail_in = v5;
    v11.avail_out = v5;
    v11.next_in = v4;
    id v7 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:v5];
    v11.next_out = (Bytef *)objc_msgSend(v7, "mutableBytes", v11.next_in, *(void *)&v11.avail_in);
    if (v7
      && !deflateInit2_(&v11, -1, 8, 31, 8, 0, "1.2.12", 112)
      && (int v8 = deflate(&v11, 4), v9 = deflateEnd(&v11), v8 == 1))
    {
      id v6 = 0;
      if (!v9 && v5 == v11.total_in)
      {
        [v7 setLength:v11.total_out];
        id v6 = v7;
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

@end