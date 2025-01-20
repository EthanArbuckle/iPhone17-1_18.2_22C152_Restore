@interface NSError(GEOXPCUtil)
+ (id)_geo_errorFromXPCData:()GEOXPCUtil;
+ (id)_geo_errorFromXPCError:()GEOXPCUtil;
- (uint64_t)_geo_isXPCInterruptedError;
- (uint64_t)_geo_newXPCData;
@end

@implementation NSError(GEOXPCUtil)

+ (id)_geo_errorFromXPCData:()GEOXPCUtil
{
  uint64_t v0 = _CFXPCCreateCFObjectFromXPCObject();
  if (v0)
  {
    v1 = (void *)v0;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v2 = _geo_NSErrorFromDictionaryRepresentationCopy(v1);
    }
    else
    {
      v2 = 0;
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

+ (id)_geo_errorFromXPCError:()GEOXPCUtil
{
  id v3 = a3;
  if (MEMORY[0x18C1213B0]() == MEMORY[0x1E4F145A8])
  {
    string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14530]);
    if (string)
    {
      v6 = [NSString stringWithUTF8String:string];
    }
    else
    {
      v6 = 0;
    }
    if (v3 == (id)MEMORY[0x1E4F14520])
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = -300;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E4F28C58];
      if (v3 == (id)MEMORY[0x1E4F14528]) {
        uint64_t v8 = -301;
      }
      else {
        uint64_t v8 = -15;
      }
    }
    v4 = [v7 GEOErrorWithCode:v8 reason:v6];
  }
  else
  {
    v4 = [MEMORY[0x1E4F28C58] GEOErrorWithCode:-15 reason:0];
  }

  return v4;
}

- (uint64_t)_geo_isXPCInterruptedError
{
  if ([a1 code] != -300) {
    return 0;
  }
  v2 = [a1 domain];
  id v3 = GEOErrorDomain();
  uint64_t v4 = [v2 isEqualToString:v3];

  return v4;
}

- (uint64_t)_geo_newXPCData
{
  v1 = _geo_NSErrorDictionaryRepresentationCopy(a1);
  uint64_t v2 = _CFXPCCreateXPCObjectFromCFObject();

  return v2;
}

@end