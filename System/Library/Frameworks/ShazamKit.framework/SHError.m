@interface SHError
+ (BOOL)annotateClientError:(id *)a3 code:(int64_t)a4 underlyingError:(id)a5;
+ (BOOL)annotateClientError:(id *)a3 code:(int64_t)a4 underlyingError:(id)a5 keyOverrides:(id)a6;
+ (BOOL)remapErrorToClientErrorPointer:(id *)a3;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 keyOverrides:(id)a5;
+ (id)messageForCode:(int64_t)a3;
+ (id)normalizedError:(id)a3;
+ (id)normalizedUserInfo:(id)a3;
+ (id)privateErrorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)remapErrorToClientError:(id)a3;
@end

@implementation SHError

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  return (id)[a1 errorWithCode:a3 underlyingError:a4 keyOverrides:MEMORY[0x263EFFA78]];
}

+ (id)privateErrorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  v5 = (void *)MEMORY[0x263EFF9A0];
  id v6 = a4;
  v7 = [v5 dictionary];
  [v7 setValue:v6 forKey:*MEMORY[0x263F08608]];

  if (a3 == 203)
  {
    uint64_t v8 = *MEMORY[0x263F07F80];
    [v7 setValue:@"The match attempt was cancelled" forKey:*MEMORY[0x263F07F80]];
  }
  else
  {
    if (a3 != 204) {
      goto LABEL_6;
    }
    uint64_t v8 = *MEMORY[0x263F07F80];
  }
  [v7 setValue:@"Matching cannot take place until a customer has acknowledged the privacy disclosure" forKey:v8];
LABEL_6:
  v9 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ShazamKit" code:a3 userInfo:v7];

  return v9;
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4 keyOverrides:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 dictionary];
  [v11 setValue:v10 forKey:*MEMORY[0x263F08608]];

  v12 = [a1 messageForCode:a3];
  [v11 setValue:v12 forKey:*MEMORY[0x263F07F80]];

  [v11 setValuesForKeysWithDictionary:v9];
  v13 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.ShazamKit" code:a3 userInfo:v11];

  return v13;
}

+ (BOOL)annotateClientError:(id *)a3 code:(int64_t)a4 underlyingError:(id)a5
{
  return [a1 annotateClientError:a3 code:a4 underlyingError:a5 keyOverrides:MEMORY[0x263EFFA78]];
}

+ (BOOL)annotateClientError:(id *)a3 code:(int64_t)a4 underlyingError:(id)a5 keyOverrides:(id)a6
{
  v7 = +[SHError errorWithCode:a4 underlyingError:a5 keyOverrides:a6];
  uint64_t v8 = v7;
  if (a3) {
    *a3 = v7;
  }

  return a3 != 0;
}

+ (id)messageForCode:(int64_t)a3
{
  v3 = @"The supplied audio is not contiguous. Flow contiguous audio.";
  v4 = @"There was an error syncing items to the library.";
  v5 = @"ShazamKit encountered an internal error.";
  id v6 = @"Failed to fetch Media Item. Ensure shazamID is valid.";
  if (a3 != 600) {
    id v6 = @"The supplied audio is not contiguous. Flow contiguous audio.";
  }
  if (a3 != 500) {
    v5 = v6;
  }
  if (a3 != 400) {
    v4 = v5;
  }
  v7 = @"The Catalog URL is not a file path URL that points to a valid catalog.";
  if (a3 != 301) {
    v7 = @"The supplied audio is not contiguous. Flow contiguous audio.";
  }
  if (a3 == 300) {
    v7 = @"The Custom Catalog is invalid.";
  }
  if (a3 <= 399) {
    v4 = v7;
  }
  uint64_t v8 = @"The provided signature duration is outside the valid range.";
  id v9 = @"The match attempt failed.";
  if (a3 != 202) {
    id v9 = @"The supplied audio is not contiguous. Flow contiguous audio.";
  }
  if (a3 != 201) {
    uint64_t v8 = v9;
  }
  if (a3 == 200) {
    v3 = @"The Signature was invalid (possibly no peaks). Ensure novel audio is playing.";
  }
  if (a3 == 100) {
    v3 = @"The supplied audio format is not supported. Please choose a supported audio format.";
  }
  if (a3 > 200) {
    v3 = v8;
  }
  if (a3 <= 299) {
    return v3;
  }
  else {
    return v4;
  }
}

+ (id)normalizedError:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    v4 = objc_opt_class();
    v5 = [v3 userInfo];
    id v6 = [v4 normalizedUserInfo:v5];

    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = [v3 domain];
    uint64_t v9 = [v3 code];

    id v10 = [v7 errorWithDomain:v8 code:v9 userInfo:v6];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)normalizedUserInfo:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF9A0];
  id v5 = a3;
  id v6 = [v4 dictionary];
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __30__SHError_normalizedUserInfo___block_invoke;
  v13 = &unk_2646EF528;
  id v14 = v6;
  id v15 = a1;
  id v7 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:&v10];

  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

void __30__SHError_normalizedUserInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (![MEMORY[0x263F08AC0] propertyList:v6 isValidForFormat:200])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ([v5 isEqualToString:*MEMORY[0x263F08608]]
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v7 = [(id)objc_opt_class() normalizedError:v6];
      }
      else
      {
        if ([v5 isEqualToString:*MEMORY[0x263F083F0]])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v8 = (void *)MEMORY[0x263EFF980];
            id v9 = v6;
            uint64_t v10 = objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
            uint64_t v13 = MEMORY[0x263EF8330];
            uint64_t v14 = 3221225472;
            id v15 = __30__SHError_normalizedUserInfo___block_invoke_2;
            v16 = &unk_2646EF500;
            uint64_t v11 = *(void *)(a1 + 40);
            id v17 = v10;
            uint64_t v18 = v11;
            id v12 = v10;
            [v9 enumerateObjectsUsingBlock:&v13];

            objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v12, v5, v13, v14, v15, v16);
LABEL_12:

            goto LABEL_13;
          }
        }
        uint64_t v7 = [v6 description];
      }
      id v12 = (id)v7;
      [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
      goto LABEL_12;
    }
  }
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
LABEL_13:
}

void __30__SHError_normalizedUserInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(void **)(a1 + 32);
    v4 = [(id)objc_opt_class() normalizedError:v5];
    [v3 addObject:v4];
  }
}

+ (id)remapErrorToClientError:(id)a3
{
  v17[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "sh_isPrivacyDisclosureAcknowledgementNeededError")
      || objc_msgSend(v4, "sh_isMatchAttemptCancelledError"))
    {
      goto LABEL_4;
    }
    if (objc_msgSend(v4, "sh_hasShazamKitPublicErrorDomain"))
    {
      id v6 = v4;
      goto LABEL_6;
    }
    if (!objc_msgSend(v4, "sh_isShazamCoreError"))
    {
      if (objc_msgSend(v4, "sh_isMediaLibraryError"))
      {
        uint64_t v5 = 400;
        goto LABEL_5;
      }
LABEL_4:
      uint64_t v5 = 202;
LABEL_5:
      id v6 = +[SHError errorWithCode:v5 underlyingError:v4];
LABEL_6:
      uint64_t v7 = v6;
      goto LABEL_8;
    }
    uint64_t v9 = [v4 code];
    uint64_t v10 = 202;
    if (v9 == 302) {
      uint64_t v10 = 600;
    }
    if ((unint64_t)(v9 - 400) < 2) {
      uint64_t v10 = 500;
    }
    if ((unint64_t)(v9 - 300) >= 2) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = 300;
    }
    id v12 = [v4 userInfo];
    uint64_t v13 = [v12 objectForKeyedSubscript:*MEMORY[0x263F08608]];
    uint64_t v16 = *MEMORY[0x263F07F80];
    uint64_t v14 = [MEMORY[0x263F6C498] messageForCode:v9];
    v17[0] = v14;
    id v15 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v7 = +[SHError errorWithCode:v11 underlyingError:v13 keyOverrides:v15];
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_8:

  return v7;
}

+ (BOOL)remapErrorToClientErrorPointer:(id *)a3
{
  if (a3)
  {
    *a3 = [a1 remapErrorToClientError:*a3];
  }
  return 1;
}

@end