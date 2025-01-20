@interface DIKeyRetriever
+ (BOOL)KKMSKeyWithURL:(id)a3 destKey:(char *)a4 destKeySize:(unint64_t)a5 error:(id *)a6;
+ (BOOL)WKMSKeyWithURL:(id)a3 authData:(const AuthData *)a4 destKey:(char *)a5 destKeySize:(unint64_t)a6 error:(id *)a7;
+ (BOOL)decryptKeyWithData:(id)a3 destKey:(char *)a4 destKeySize:(unint64_t)a5 error:(id *)a6;
+ (BOOL)writeHexKeyToBuffer:(char *)a3 hexKey:(id)a4 error:(id *)a5;
+ (id)getRequestWithURL:(id)a3 error:(id *)a4;
+ (id)hintFormat:(id)a3;
+ (id)jsonResponseWithRequest:(id)a3 session:(id)a4 error:(id *)a5;
+ (id)newACEndpointWithEnvironment:(id)a3 error:(id *)a4;
+ (id)newDawTokenWithError:(id *)a3;
+ (id)newEnvWithDictionary:(id)a3 error:(id *)a4;
+ (id)newSessionWithError:(id *)a3;
+ (id)newUrl:(id)a3;
+ (id)postRequestWithURL:(id)a3 session:(id)a4 data:(id)a5 error:(id *)a6;
+ (id)requestSynchronousDataWithRequest:(id)a3 session:(id)a4;
@end

@implementation DIKeyRetriever

+ (id)newACEndpointWithEnvironment:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 isEqual:@"uat"])
  {
    CFStringRef v6 = @"saks-ac-uat.g.apple.com";
  }
  else if ([v5 isEqual:@"prod"])
  {
    CFStringRef v6 = @"saks-ac-prod.g.apple.com";
  }
  else if ([v5 isEqual:@"dev"])
  {
    CFStringRef v6 = @"saks-ac-dev.g.apple.com";
  }
  else
  {
    CFStringRef v6 = +[DIError nilWithPOSIXCode:22 verboseInfo:@"Not valid SAKS environment" error:a4];
  }

  return (id)v6;
}

+ (id)newDawTokenWithError:(id *)a3
{
  v4 = +[NSPipe pipe];
  id v5 = [v4 fileHandleForReading];
  id v6 = objc_alloc_init((Class)NSTask);
  v7 = +[NSURL fileURLWithPath:@"/usr/local/bin/appleconnect"];
  [v6 setExecutableURL:v7];

  [v6 setArguments:&off_1001C8140];
  [v6 setStandardOutput:v4];
  if ([v6 launchAndReturnError:a3])
  {
    [v6 waitUntilExit];
    if ([v6 terminationStatus])
    {
      v8 = +[DIError nilWithPOSIXCode:22 verboseInfo:@"Could not generate daw token - AppleConnect Failure" error:a3];
    }
    else
    {
      v9 = [v5 readDataToEndOfFileAndReturnError:a3];
      if (v9)
      {
        id v10 = [objc_alloc((Class)NSString) initWithData:v9 encoding:4];
        v11 = +[NSCharacterSet newlineCharacterSet];
        v8 = [v10 stringByTrimmingCharactersInSet:v11];
      }
      else
      {
        v8 = 0;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)newSessionWithError:(id *)a3
{
  id v3 = [a1 newDawTokenWithError:a3];
  if (v3)
  {
    v4 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    id v5 = +[NSString stringWithFormat:@"Bearer %@", v3, @"Authorization"];
    id v10 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v4 setHTTPAdditionalHeaders:v6];

    v7 = +[NSURLSession sessionWithConfiguration:v4];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)hintFormat:(id)a3
{
  if ([a3 hasPrefix:@"<"]) {
    return @"plist";
  }
  else {
    return @"json";
  }
}

+ (id)requestSynchronousDataWithRequest:(id)a3 session:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100099AC4;
  v21 = sub_100099AD4;
  id v22 = 0;
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_100099ADC;
  v14 = &unk_1001AF818;
  v16 = &v17;
  v7 = dispatch_semaphore_create(0);
  v15 = v7;
  v8 = [v6 dataTaskWithRequest:v5 completionHandler:&v11];
  objc_msgSend(v8, "resume", v11, v12, v13, v14);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  id v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

+ (id)jsonResponseWithRequest:(id)a3 session:(id)a4 error:(id *)a5
{
  id v6 = [a1 requestSynchronousDataWithRequest:a3 session:a4];
  if (v6) {
    +[NSJSONSerialization JSONObjectWithData:v6 options:0 error:a5];
  }
  else {
  v7 = +[DIError nilWithEnumValue:150 verboseInfo:@"AEA key retrieval failed" error:a5];
  }

  return v7;
}

+ (id)postRequestWithURL:(id)a3 session:(id)a4 data:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = +[NSMutableURLRequest requestWithURL:a3];
  [v12 setHTTPMethod:@"POST"];
  [v12 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  if (v11) {
    [v12 setHTTPBody:v11];
  }
  v13 = [a1 jsonResponseWithRequest:v12 session:v10 error:a6];

  return v13;
}

+ (id)getRequestWithURL:(id)a3 error:(id *)a4
{
  id v6 = +[NSMutableURLRequest requestWithURL:a3];
  [v6 setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
  v7 = +[NSURLSession sharedSession];
  v8 = [a1 requestSynchronousDataWithRequest:v6 session:v7];

  if (!v8)
  {
    v8 = +[DIError nilWithEnumValue:150 verboseInfo:@"AEA key retrieval failed" error:a4];
  }

  return v8;
}

+ (id)newEnvWithDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    uint64_t v9 = +[DIError nilWithPOSIXCode:22 verboseInfo:@"Not valid SAKS metadata (json format expected)" error:a4];
    goto LABEL_5;
  }
  v7 = [v5 objectForKey:@"metadata"];
  v8 = [v7 valueForKey:@"environment"];

  if (!v8)
  {
    uint64_t v9 = +[DIError nilWithPOSIXCode:22 verboseInfo:@"Not valid SAKS metadata (no environment field)" error:a4];
LABEL_5:
    v8 = (void *)v9;
  }

  return v8;
}

+ (id)newUrl:(id)a3
{
  id v3 = +[NSString stringWithFormat:@"https://%@/v1/ac/decrypt", a3];
  v4 = +[NSURL URLWithString:v3];

  return v4;
}

+ (BOOL)writeHexKeyToBuffer:(char *)a3 hexKey:(id)a4 error:(id *)a5
{
  id v7 = a4;
  v8 = (const char *)[v7 UTF8String];
  size_t v9 = strnlen(v8, 0x41uLL);
  if (v9 == 64)
  {
    if (strlen(v8) != 64)
    {
      id v11 = "Key is not 32 bytes size.";
LABEL_11:
      exception = __cxa_allocate_exception(0x40uLL);
      void *exception = &off_1001C3DE8;
      uint64_t v17 = std::generic_category();
      exception[1] = 22;
      exception[2] = v17;
      *((unsigned char *)exception + 24) = 0;
      *((unsigned char *)exception + 48) = 0;
      exception[7] = v11;
    }
    uint64_t v10 = 0;
    char v19 = 0;
    id v11 = "Key is not hexadecimal number.";
    do
    {
      *(_WORD *)__str = *(_WORD *)&v8[2 * v10];
      char v12 = strtol(__str, 0, 16);
      a3[v10] = v12;
      if (!v12 && *(unsigned __int16 *)__str != 12336) {
        goto LABEL_11;
      }
      ++v10;
    }
    while (v10 != 32);
    BOOL v13 = 1;
  }
  else
  {
    v14 = +[NSString stringWithFormat:@"Invalid size hex key %lu", v9];
    BOOL v13 = +[DIError failWithPOSIXCode:22 verboseInfo:v14 error:a5];
  }
  return v13;
}

+ (BOOL)KKMSKeyWithURL:(id)a3 destKey:(char *)a4 destKeySize:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = +[DIKeyRetriever newSessionWithError:a6];
  if (v10)
  {
    id v11 = [v9 URLByAppendingPathComponent:@"decryption-components"];
    char v12 = +[DIKeyRetriever postRequestWithURL:v11 session:v10 data:0 error:a6];
    BOOL v13 = v12;
    if (v12)
    {
      v14 = [v12 objectForKeyedSubscript:@"encryption"];
      v15 = v14;
      if (v14)
      {
        v16 = [v14 objectForKeyedSubscript:@"key"];
        if (v16) {
          unsigned __int8 v17 = [a1 writeHexKeyToBuffer:a4 hexKey:v16 error:a6];
        }
        else {
          unsigned __int8 v17 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Missing key in KKMS response" error:a6];
        }
        BOOL v18 = v17;
      }
      else
      {
        BOOL v18 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Missing key in KKMS response" error:a6];
      }
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

+ (BOOL)WKMSKeyWithURL:(id)a3 authData:(const AuthData *)a4 destKey:(char *)a5 destKeySize:(unint64_t)a6 error:(id *)a7
{
  id v10 = +[DIKeyRetriever getRequestWithURL:error:](DIKeyRetriever, "getRequestWithURL:error:", a3, a7, a5, a6);
  if (v10)
  {
    id v11 = frk_metadata_from_aea_auth_data(a4->var0, a7);
    char v12 = v11;
    if (v11)
    {
      BOOL v13 = frk_unwrapped_symmetric_key_with_shipping_private_key(v11, v10, a7);
      v14 = v13;
      if (v13)
      {
        if ([v13 length] == (id)32)
        {
          v15 = [v14 bytes];
          long long v16 = v15[1];
          *(_OWORD *)a5 = *v15;
          *((_OWORD *)a5 + 1) = v16;
          BOOL v17 = 1;
        }
        else
        {
          BOOL v17 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Invalid key size" error:a7];
        }
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

+ (BOOL)decryptKeyWithData:(id)a3 destKey:(char *)a4 destKeySize:(unint64_t)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = [a1 hintFormat:v9];
  id v11 = [v9 dataUsingEncoding:4];
  id v12 = v9;
  if ([v10 isEqual:@"plist"])
  {
    uint64_t v13 = +[NSPropertyListSerialization propertyListWithData:v11 options:0 format:0 error:a6];
    id v14 = +[NSJSONSerialization dataWithJSONObject:v13 options:1 error:a6];
    v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v14 bytes]);

    long long v16 = (void *)v13;
    if (!v13)
    {
LABEL_3:
      BOOL v17 = 0;
      BOOL v18 = @"dev";
      goto LABEL_25;
    }
  }
  else
  {
    +[NSJSONSerialization JSONObjectWithData:v11 options:0 error:a6];
    long long v16 = v15 = v12;
    if (!v16) {
      goto LABEL_3;
    }
  }
  BOOL v18 = +[DIKeyRetriever newEnvWithDictionary:v16 error:a6];
  if (v18)
  {
    v36 = a4;
    id v19 = +[DIKeyRetriever newACEndpointWithEnvironment:v18 error:a6];
    if (v19)
    {
      id v20 = +[DIKeyRetriever newSessionWithError:a6];
      if (v20)
      {
        id v38 = v20;
        id v35 = v19;
        id v37 = +[DIKeyRetriever newUrl:v19];
        v21 = [v15 dataUsingEncoding:4];
        id v22 = +[DIKeyRetriever postRequestWithURL:v37 session:v38 data:v21 error:a6];

        if (v22)
        {
          v34 = v22;
          v23 = [v22 objectForKeyedSubscript:@"key"];
          if (v23)
          {
            v24 = v23;
            v25 = (const char *)[v23 UTF8String];
            v26 = v25;
            if (v25)
            {
              size_t v27 = strnlen(v25, 0x59uLL);
              if (v27 == 88)
              {
                long long v28 = *((_OWORD *)v26 + 1);
                *(_OWORD *)v36 = *(_OWORD *)v26;
                *((_OWORD *)v36 + 1) = v28;
                long long v29 = *((_OWORD *)v26 + 2);
                long long v30 = *((_OWORD *)v26 + 3);
                long long v31 = *((_OWORD *)v26 + 4);
                *((void *)v36 + 10) = *((void *)v26 + 10);
                *((_OWORD *)v36 + 3) = v30;
                *((_OWORD *)v36 + 4) = v31;
                *((_OWORD *)v36 + 2) = v29;
                BOOL v17 = 1;
              }
              else
              {
                v32 = +[NSString stringWithFormat:@"Invalid size of saks response %lu", v27];
                BOOL v17 = +[DIError failWithPOSIXCode:22 verboseInfo:v32 error:a6];
              }
            }
            else
            {
              BOOL v17 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Missing key in SAKS response" error:a6];
            }
            id v19 = v35;
          }
          else
          {
            v24 = 0;
            id v19 = v35;
            BOOL v17 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Bad or missing key in SAKS response." error:a6];
          }

          id v22 = v34;
        }
        else
        {
          BOOL v17 = 0;
          id v19 = v35;
        }

        id v20 = v38;
      }
      else
      {
        BOOL v17 = 0;
      }
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_25:

  return v17;
}

@end