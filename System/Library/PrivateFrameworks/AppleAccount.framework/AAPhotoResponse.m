@interface AAPhotoResponse
- (AAPhotoResponse)initWithHTTPResponse:(id)a3 data:(id)a4;
- (NSData)photoData;
- (NSString)serverCacheTag;
- (NSValue)cropRect;
@end

@implementation AAPhotoResponse

- (AAPhotoResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  id v6 = a3;
  v40.receiver = self;
  v40.super_class = (Class)AAPhotoResponse;
  v7 = [(AAResponse *)&v40 initWithHTTPResponse:v6 data:a4];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(AAResponse *)v7 data];
    photoData = v8->_photoData;
    v8->_photoData = (NSData *)v9;

    v11 = [v6 allHeaderFields];
    v12 = [v11 objectForKeyedSubscript:@"X-MMe-Setup-Family-Photo"];

    if (v12)
    {
      v13 = [v12 componentsSeparatedByString:@","];
      if ([v13 count] == 4)
      {
        v14 = CGImageSourceCreateWithData((CFDataRef)v8->_photoData, 0);
        if (v14)
        {
          v15 = v14;
          CFDictionaryRef v16 = CGImageSourceCopyPropertiesAtIndex(v14, 0, 0);
          v17 = (void *)*MEMORY[0x1E4F2FCE8];
          v18 = [(__CFDictionary *)v16 objectForKeyedSubscript:*MEMORY[0x1E4F2FCE8]];
          uint64_t v19 = [v18 unsignedIntegerValue];

          v20 = [v13 objectAtIndexedSubscript:1];
          uint64_t v21 = [v20 integerValue];
          v22 = [v13 objectAtIndexedSubscript:3];
          uint64_t v23 = v19 - (v21 + [v22 integerValue]);

          v24 = [v13 objectAtIndexedSubscript:0];
          double v25 = (double)[v24 integerValue];
          double v26 = (double)v23;
          v27 = [v13 objectAtIndexedSubscript:2];
          double v28 = (double)[v27 integerValue];
          v29 = [v13 objectAtIndexedSubscript:3];
          double v36 = v25;
          double v37 = v26;
          double v38 = v28;
          double v39 = (double)[v29 integerValue];

          uint64_t v30 = [MEMORY[0x1E4F29238] valueWithBytes:&v36 objCType:"{CGRect={CGPoint=dd}{CGSize=dd}}"];
          cropRect = v8->_cropRect;
          v8->_cropRect = (NSValue *)v30;

          CFRelease(v15);
        }
      }
    }
    v32 = objc_msgSend(v6, "allHeaderFields", *(void *)&v36, *(void *)&v37, *(void *)&v38, *(void *)&v39);
    uint64_t v33 = [v32 objectForKeyedSubscript:@"ETag"];
    serverCacheTag = v8->_serverCacheTag;
    v8->_serverCacheTag = (NSString *)v33;
  }
  return v8;
}

- (NSData)photoData
{
  return self->_photoData;
}

- (NSValue)cropRect
{
  return self->_cropRect;
}

- (NSString)serverCacheTag
{
  return self->_serverCacheTag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverCacheTag, 0);
  objc_storeStrong((id *)&self->_cropRect, 0);

  objc_storeStrong((id *)&self->_photoData, 0);
}

@end