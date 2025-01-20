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
    v6 = @"saks-ac-uat.g.apple.com";
  }
  else if ([v5 isEqual:@"prod"])
  {
    v6 = @"saks-ac-prod.g.apple.com";
  }
  else if ([v5 isEqual:@"dev"])
  {
    v6 = @"saks-ac-dev.g.apple.com";
  }
  else
  {
    v6 = +[DIError nilWithPOSIXCode:22 verboseInfo:@"Not valid SAKS environment" error:a4];
  }

  return v6;
}

+ (id)newDawTokenWithError:(id *)a3
{
  v4 = [MEMORY[0x263F08A80] pipe];
  id v5 = [v4 fileHandleForReading];
  id v6 = objc_alloc_init(MEMORY[0x263F08B50]);
  v7 = [NSURL fileURLWithPath:@"/usr/local/bin/appleconnect"];
  [v6 setExecutableURL:v7];

  [v6 setArguments:&unk_26CF4FCC8];
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
        v10 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
        v11 = [MEMORY[0x263F08708] newlineCharacterSet];
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
  v10[1] = *MEMORY[0x263EF8340];
  v3 = (void *)[a1 newDawTokenWithError:a3];
  if (v3)
  {
    v4 = [MEMORY[0x263EFC648] ephemeralSessionConfiguration];
    id v5 = [NSString stringWithFormat:@"Bearer %@", v3, @"Authorization"];
    v10[0] = v5;
    id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v4 setHTTPAdditionalHeaders:v6];

    v7 = [MEMORY[0x263EFC640] sessionWithConfiguration:v4];
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
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  id v23 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  v14 = __60__DIKeyRetriever_requestSynchronousDataWithRequest_session___block_invoke;
  v15 = &unk_2644A2360;
  v17 = &v18;
  v8 = v7;
  v16 = v8;
  uint64_t v9 = [v6 dataTaskWithRequest:v5 completionHandler:&v12];
  objc_msgSend(v9, "resume", v12, v13, v14, v15);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  id v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void __60__DIKeyRetriever_requestSynchronousDataWithRequest_session___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a2;
  id v7 = a4;
  if (v7)
  {
    int v8 = *__error();
    if (DIForwardLogs())
    {
      uint64_t v9 = getDIOSLog();
      os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68158210;
      int v16 = 73;
      __int16 v17 = 2080;
      uint64_t v18 = "+[DIKeyRetriever requestSynchronousDataWithRequest:session:]_block_invoke";
      __int16 v19 = 2112;
      id v20 = v7;
      id v10 = (char *)_os_log_send_and_compose_impl();

      if (v10)
      {
        fprintf((FILE *)*MEMORY[0x263EF8348], "%s\n", v10);
        free(v10);
      }
    }
    else
    {
      v11 = getDIOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158210;
        int v16 = 73;
        __int16 v17 = 2080;
        uint64_t v18 = "+[DIKeyRetriever requestSynchronousDataWithRequest:session:]_block_invoke";
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl(&dword_21E237000, v11, OS_LOG_TYPE_ERROR, "%.*s: %@", buf, 0x1Cu);
      }
    }
    *__error() = v8;
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v6;
  id v14 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)jsonResponseWithRequest:(id)a3 session:(id)a4 error:(id *)a5
{
  id v6 = [a1 requestSynchronousDataWithRequest:a3 session:a4];
  if (v6) {
    [MEMORY[0x263F08900] JSONObjectWithData:v6 options:0 error:a5];
  }
  else {
  id v7 = +[DIError nilWithEnumValue:150 verboseInfo:@"AEA key retrieval failed" error:a5];
  }

  return v7;
}

+ (id)postRequestWithURL:(id)a3 session:(id)a4 data:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [MEMORY[0x263EFC5E8] requestWithURL:a3];
  [v12 setHTTPMethod:@"POST"];
  [v12 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  if (v11) {
    [v12 setHTTPBody:v11];
  }
  uint64_t v13 = [a1 jsonResponseWithRequest:v12 session:v10 error:a6];

  return v13;
}

+ (id)getRequestWithURL:(id)a3 error:(id *)a4
{
  id v6 = [MEMORY[0x263EFC5E8] requestWithURL:a3];
  [v6 setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
  id v7 = [MEMORY[0x263EFC640] sharedSession];
  int v8 = [a1 requestSynchronousDataWithRequest:v6 session:v7];

  if (!v8)
  {
    int v8 = +[DIError nilWithEnumValue:150 verboseInfo:@"AEA key retrieval failed" error:a4];
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
  id v7 = [v5 objectForKey:@"metadata"];
  int v8 = [v7 valueForKey:@"environment"];

  if (!v8)
  {
    uint64_t v9 = +[DIError nilWithPOSIXCode:22 verboseInfo:@"Not valid SAKS metadata (no environment field)" error:a4];
LABEL_5:
    int v8 = (void *)v9;
  }

  return v8;
}

+ (id)newUrl:(id)a3
{
  v3 = [NSString stringWithFormat:@"https://%@/v1/ac/decrypt", a3];
  v4 = [NSURL URLWithString:v3];

  return v4;
}

+ (BOOL)writeHexKeyToBuffer:(char *)a3 hexKey:(id)a4 error:(id *)a5
{
  id v7 = a4;
  int v8 = (const char *)[v7 UTF8String];
  size_t v9 = strnlen(v8, 0x41uLL);
  if (v9 == 64)
  {
    if (strlen(v8) != 64)
    {
      id v11 = "Key is not 32 bytes size.";
LABEL_11:
      exception = __cxa_allocate_exception(0x40uLL);
      void *exception = &unk_26CF39EE0;
      __int16 v17 = std::generic_category();
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
    id v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid size hex key %lu", v9);
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
      id v14 = [v12 objectForKeyedSubscript:@"encryption"];
      v15 = v14;
      if (v14)
      {
        int v16 = [v14 objectForKeyedSubscript:@"key"];
        if (v16) {
          char v17 = [a1 writeHexKeyToBuffer:a4 hexKey:v16 error:a6];
        }
        else {
          char v17 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Missing key in KKMS response" error:a6];
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
      id v14 = v13;
      if (v13)
      {
        if ([v13 length] == 32)
        {
          v15 = (_OWORD *)[v14 bytes];
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
    uint64_t v13 = [MEMORY[0x263F08AC0] propertyListWithData:v11 options:0 format:0 error:a6];
    id v14 = [MEMORY[0x263F08900] dataWithJSONObject:v13 options:1 error:a6];
    v15 = NSString;
    id v16 = v14;
    BOOL v17 = objc_msgSend(v15, "stringWithUTF8String:", objc_msgSend(v16, "bytes"));

    BOOL v18 = (void *)v13;
    if (!v13)
    {
LABEL_3:
      BOOL v19 = 0;
      id v20 = @"dev";
      goto LABEL_25;
    }
  }
  else
  {
    [MEMORY[0x263F08900] JSONObjectWithData:v11 options:0 error:a6];
    BOOL v18 = v17 = v12;
    if (!v18) {
      goto LABEL_3;
    }
  }
  id v20 = +[DIKeyRetriever newEnvWithDictionary:v18 error:a6];
  if (v20)
  {
    v38 = a4;
    id v21 = +[DIKeyRetriever newACEndpointWithEnvironment:v20 error:a6];
    if (v21)
    {
      id v22 = +[DIKeyRetriever newSessionWithError:a6];
      if (v22)
      {
        id v40 = v22;
        id v37 = v21;
        id v39 = +[DIKeyRetriever newUrl:v21];
        id v23 = [v17 dataUsingEncoding:4];
        v24 = +[DIKeyRetriever postRequestWithURL:v39 session:v40 data:v23 error:a6];

        if (v24)
        {
          v36 = v24;
          v25 = [v24 objectForKeyedSubscript:@"key"];
          if (v25)
          {
            v26 = v25;
            v27 = (const char *)[v25 UTF8String];
            v28 = v27;
            if (v27)
            {
              size_t v29 = strnlen(v27, 0x59uLL);
              if (v29 == 88)
              {
                long long v30 = *((_OWORD *)v28 + 1);
                *(_OWORD *)v38 = *(_OWORD *)v28;
                *((_OWORD *)v38 + 1) = v30;
                long long v31 = *((_OWORD *)v28 + 2);
                long long v32 = *((_OWORD *)v28 + 3);
                long long v33 = *((_OWORD *)v28 + 4);
                *((void *)v38 + 10) = *((void *)v28 + 10);
                *((_OWORD *)v38 + 3) = v32;
                *((_OWORD *)v38 + 4) = v33;
                *((_OWORD *)v38 + 2) = v31;
                BOOL v19 = 1;
              }
              else
              {
                v34 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid size of saks response %lu", v29);
                BOOL v19 = +[DIError failWithPOSIXCode:22 verboseInfo:v34 error:a6];
              }
            }
            else
            {
              BOOL v19 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Missing key in SAKS response" error:a6];
            }
            id v21 = v37;
          }
          else
          {
            v26 = 0;
            id v21 = v37;
            BOOL v19 = +[DIError failWithPOSIXCode:22 verboseInfo:@"Bad or missing key in SAKS response." error:a6];
          }

          v24 = v36;
        }
        else
        {
          BOOL v19 = 0;
          id v21 = v37;
        }

        id v22 = v40;
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_25:

  return v19;
}

@end