@interface _GDSHMACGenerator
+ (id)HMACSignedRequest:(id)a3 secret:(id)a4 secretVersion:(id)a5;
+ (id)HMAC_SHA256Digest:(id)a3 key:(id)a4;
+ (id)SHA256_HashStringFromData:(id)a3;
+ (id)bucketedEpochTimeStamp;
+ (id)encodeStringToBase64:(id)a3;
+ (id)generateURLRequest:(id)a3 secretVersion:(id)a4 signature:(id)a5 content:(id)a6 timestamp:(id)a7;
@end

@implementation _GDSHMACGenerator

+ (id)HMAC_SHA256Digest:(id)a3 key:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = a3;
  v7 = (const char *)[v5 cStringUsingEncoding:1];
  id v8 = v6;
  v9 = (const char *)[v8 cStringUsingEncoding:1];

  size_t v10 = strlen(v7);
  size_t v11 = strlen(v9);
  CCHmac(2u, v7, v10, v9, v11, macOut);
  v12 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:macOut length:32];
  v13 = [v12 base64EncodedStringWithOptions:0];

  return v13;
}

+ (id)SHA256_HashStringFromData:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  CC_SHA256((const void *)[v3 bytes], objc_msgSend(v3, "length"), md);
  v4 = [MEMORY[0x263F089D8] stringWithCapacity:64];
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v4, "appendFormat:", @"%02x", md[i]);

  return v4;
}

+ (id)HMACSignedRequest:(id)a3 secret:(id)a4 secretVersion:(id)a5
{
  v44[7] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  id v40 = a4;
  size_t v10 = [v8 HTTPMethod];
  uint64_t v11 = [v10 lowercaseString];

  v12 = [v8 URL];
  v13 = [v12 path];
  uint64_t v14 = [v13 lowercaseString];

  uint64_t v15 = [v8 HTTPBody];
  v42 = v8;
  uint64_t v16 = [v8 URL];
  v17 = [v16 query];

  v39 = (void *)v15;
  uint64_t v18 = objc_msgSend(a1, "SHA256_HashStringFromData:", v15);
  uint64_t v19 = [a1 bucketedEpochTimeStamp];
  v20 = [MEMORY[0x263EFF980] array];
  v43 = (void *)v11;
  v21 = [a1 encodeStringToBase64:v11];
  [v20 addObject:v21];

  v41 = (void *)v14;
  v22 = [a1 encodeStringToBase64:v14];
  [v20 addObject:v22];

  if ([v17 length])
  {
    v23 = [a1 encodeStringToBase64:v17];
    [v20 addObject:v23];
  }
  v24 = [a1 encodeStringToBase64:@"X-Apple-Content-SHA256"];
  v44[0] = v24;
  v25 = [a1 encodeStringToBase64:v18];
  v44[1] = v25;
  [a1 encodeStringToBase64:@"X-Apple-HMAC-Secret-Version"];
  v26 = v37 = (void *)v18;
  v44[2] = v26;
  v27 = [a1 encodeStringToBase64:v9];
  v44[3] = v27;
  [a1 encodeStringToBase64:@"X-Apple-HMAC-Sent-Timestamp"];
  v38 = v17;
  v29 = v28 = v9;
  v44[4] = v29;
  [a1 encodeStringToBase64:v19];
  v30 = v36 = (void *)v19;
  v44[5] = v30;
  v44[6] = &stru_27018E150;
  v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:7];
  [v20 addObjectsFromArray:v31];

  v32 = [v20 componentsJoinedByString:@"|"];
  v33 = objc_msgSend(a1, "HMAC_SHA256Digest:key:", v32, v40);

  v34 = [a1 generateURLRequest:v42 secretVersion:v28 signature:v33 content:v37 timestamp:v36];

  return v34;
}

+ (id)generateURLRequest:(id)a3 secretVersion:(id)a4 signature:(id)a5 content:(id)a6 timestamp:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  uint64_t v15 = (void *)[a3 mutableCopy];
  [v15 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  [v15 setValue:v12 forHTTPHeaderField:@"X-Apple-Content-SHA256"];

  [v15 setValue:v14 forHTTPHeaderField:@"X-Apple-HMAC-Secret-Version"];
  [v15 setValue:v11 forHTTPHeaderField:@"X-Apple-HMAC-Sent-Timestamp"];

  [v15 setValue:v13 forHTTPHeaderField:@"X-Apple-HMAC-Digest"];

  return v15;
}

+ (id)bucketedEpochTimeStamp
{
  v2 = [MEMORY[0x263EFF910] date];
  [v2 timeIntervalSince1970];
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"%.0f", floor(v3 * 1000.0 / 300000.0) * 300000.0);

  return v4;
}

+ (id)encodeStringToBase64:(id)a3
{
  double v3 = [a3 dataUsingEncoding:4];
  v4 = [v3 base64EncodedStringWithOptions:0];

  return v4;
}

@end