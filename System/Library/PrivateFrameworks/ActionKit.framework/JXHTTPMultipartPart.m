@interface JXHTTPMultipartPart
+ (id)withMultipartType:(int)a3 key:(id)a4 data:(id)a5 contentType:(id)a6 fileName:(id)a7 boundary:(id)a8;
- (NSData)contentData;
- (NSData)postData;
- (NSData)preData;
- (NSString)key;
- (id)filePath;
- (int)multipartType;
- (int64_t)contentLength;
- (int64_t)dataLength;
- (unint64_t)loadMutableData:(id)a3 withDataInRange:(_NSRange)a4;
- (void)setContentData:(id)a3;
- (void)setKey:(id)a3;
- (void)setMultipartType:(int)a3;
- (void)setPostData:(id)a3;
- (void)setPreData:(id)a3;
@end

@implementation JXHTTPMultipartPart

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postData, 0);
  objc_storeStrong((id *)&self->_contentData, 0);
  objc_storeStrong((id *)&self->_preData, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)setPostData:(id)a3
{
}

- (NSData)postData
{
  return self->_postData;
}

- (void)setContentData:(id)a3
{
}

- (NSData)contentData
{
  return self->_contentData;
}

- (void)setPreData:(id)a3
{
}

- (NSData)preData
{
  return self->_preData;
}

- (void)setKey:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setMultipartType:(int)a3
{
  self->_multipartType = a3;
}

- (int)multipartType
{
  return self->_multipartType;
}

- (unint64_t)loadMutableData:(id)a3 withDataInRange:(_NSRange)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v28 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v5 = [(JXHTTPMultipartPart *)self preData];
  v37[0] = v5;
  v6 = [(JXHTTPMultipartPart *)self contentData];
  v37[1] = v6;
  v7 = [(JXHTTPMultipartPart *)self postData];
  v37[2] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:3];

  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    NSUInteger v11 = 0;
    unint64_t v30 = 0;
    uint64_t v31 = *(void *)v34;
    while (1)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v34 != v31) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v14 = [(JXHTTPMultipartPart *)self contentData];
        if (v13 == v14) {
          uint64_t v15 = [(JXHTTPMultipartPart *)self contentLength];
        }
        else {
          uint64_t v15 = [v13 length];
        }
        NSUInteger v16 = v15;

        v40.location = v11;
        v40.length = v16;
        NSRange v17 = NSIntersectionRange(v40, a4);
        if (v17.length)
        {
          NSUInteger v18 = v17.location - v11;
          uint64_t v19 = [(JXHTTPMultipartPart *)self preData];
          if (v13 == (void *)v19)
          {

LABEL_19:
            v26 = objc_msgSend(v13, "subdataWithRange:", v18, v17.length);
            if (!v26) {
              goto LABEL_21;
            }
LABEL_20:
            [v28 appendData:v26];
            v30 += [v26 length];

            goto LABEL_21;
          }
          v20 = (void *)v19;
          v21 = [(JXHTTPMultipartPart *)self postData];

          if (v13 == v21) {
            goto LABEL_19;
          }
          v22 = [(JXHTTPMultipartPart *)self contentData];

          if (v13 != v22) {
            goto LABEL_21;
          }
          if (![(JXHTTPMultipartPart *)self multipartType]) {
            goto LABEL_19;
          }
          if ([(JXHTTPMultipartPart *)self multipartType] == 1)
          {
            v23 = (void *)MEMORY[0x263F08840];
            v24 = [(JXHTTPMultipartPart *)self filePath];
            v25 = [v23 fileHandleForReadingAtPath:v24];

            if (!v25) {
              goto LABEL_25;
            }
            [v25 seekToFileOffset:v18];
            v26 = [v25 readDataOfLength:v17.length];
            [v25 closeFile];

            if (v26) {
              goto LABEL_20;
            }
          }
        }
LABEL_21:
        v11 += v16;
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (!v10) {
        goto LABEL_25;
      }
    }
  }
  unint64_t v30 = 0;
LABEL_25:

  return v30;
}

- (int64_t)contentLength
{
  if ([(JXHTTPMultipartPart *)self multipartType])
  {
    if ([(JXHTTPMultipartPart *)self multipartType] != 1) {
      return 0;
    }
    v3 = [MEMORY[0x263F08850] defaultManager];
    v4 = [(JXHTTPMultipartPart *)self filePath];
    id v16 = 0;
    v5 = [v3 attributesOfItemAtPath:v4 error:&v16];
    id v6 = v16;

    if (v6)
    {
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Shortcuts/ShortcutsActions/ActionKit/External/JXHTTP/JXHTTP/JXHTTPMultipartBody.m"];
      v8 = [v7 lastPathComponent];
      uint64_t v9 = [v6 localizedDescription];
      NSLog(&cfstr_DError.isa, v8, 78, v9);
    }
    uint64_t v10 = [v5 objectForKey:*MEMORY[0x263F080B8]];
    NSUInteger v11 = v10;
    if (v10) {
      int64_t v12 = [v10 longLongValue];
    }
    else {
      int64_t v12 = 0;
    }

    return v12;
  }
  else
  {
    v13 = [(JXHTTPMultipartPart *)self contentData];
    int64_t v14 = [v13 length];

    return v14;
  }
}

- (int64_t)dataLength
{
  v3 = [(JXHTTPMultipartPart *)self preData];
  uint64_t v4 = [v3 length];

  int64_t v5 = [(JXHTTPMultipartPart *)self contentLength] + v4;
  id v6 = [(JXHTTPMultipartPart *)self postData];
  int64_t v7 = v5 + [v6 length];

  return v7;
}

- (id)filePath
{
  if ([(JXHTTPMultipartPart *)self multipartType] == 1)
  {
    id v3 = [NSString alloc];
    uint64_t v4 = [(JXHTTPMultipartPart *)self contentData];
    int64_t v5 = (void *)[v3 initWithData:v4 encoding:4];
  }
  else
  {
    int64_t v5 = 0;
  }
  return v5;
}

+ (id)withMultipartType:(int)a3 key:(id)a4 data:(id)a5 contentType:(id)a6 fileName:(id)a7 boundary:(id)a8
{
  uint64_t v12 = *(void *)&a3;
  id v13 = a6;
  id v14 = a7;
  id v15 = a8;
  id v16 = a5;
  id v17 = a4;
  NSUInteger v18 = objc_alloc_init(JXHTTPMultipartPart);
  [(JXHTTPMultipartPart *)v18 setMultipartType:v12];
  [(JXHTTPMultipartPart *)v18 setKey:v17];
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"%@\r\n", v15];

  [v19 appendFormat:@"Content-Disposition: form-data; name=\"%@\"", v17];
  if ([v14 length]) {
    [v19 appendFormat:@"; filename=\"%@\"", v14];
  }
  if ([v13 length])
  {
    [v19 appendFormat:@"\r\nContent-Type: %@", v13];
  }
  else if ([(JXHTTPMultipartPart *)v18 multipartType] == 1)
  {
    [v19 appendString:@"\r\nContent-Type: application/octet-stream"];
  }
  [v19 appendString:@"\r\n\r\n"];
  v20 = [v19 dataUsingEncoding:4];
  [(JXHTTPMultipartPart *)v18 setPreData:v20];

  [(JXHTTPMultipartPart *)v18 setContentData:v16];
  v21 = [@"\r\n" dataUsingEncoding:4];
  [(JXHTTPMultipartPart *)v18 setPostData:v21];

  return v18;
}

@end