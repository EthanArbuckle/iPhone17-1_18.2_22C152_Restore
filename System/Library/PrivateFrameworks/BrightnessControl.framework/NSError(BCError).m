@interface NSError(BCError)
- (uint64_t)initWithBCError:()BCError;
- (uint64_t)initWithIOKitError:()BCError;
- (uint64_t)retIOKitError;
@end

@implementation NSError(BCError)

- (uint64_t)initWithBCError:()BCError
{
  v9[1] = *MEMORY[0x263EF8340];
  if ((unint64_t)(a3 - 16) > 2) {
    v5 = @"Unknown error";
  }
  else {
    v5 = off_264D103A0[a3 - 16];
  }
  uint64_t v6 = [NSString stringWithUTF8String:"com.apple.BrightnessControl"];
  uint64_t v8 = *MEMORY[0x263F08320];
  v9[0] = v5;
  return objc_msgSend(a1, "initWithDomain:code:userInfo:", v6, a3, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1));
}

- (uint64_t)initWithIOKitError:()BCError
{
  v8[2] = *MEMORY[0x263EF8340];
  uint64_t v5 = [NSString stringWithUTF8String:"com.apple.BrightnessControl"];
  v7[0] = *MEMORY[0x263F08320];
  v7[1] = @"IOKitCode";
  v8[0] = @"IOKit error";
  v8[1] = [NSNumber numberWithInt:a3];
  return objc_msgSend(a1, "initWithDomain:code:userInfo:", v5, 17, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v8, v7, 2));
}

- (uint64_t)retIOKitError
{
  v1 = objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKeyedSubscript:", @"IOKitCode");
  if (!v1) {
    return 5;
  }
  return [v1 intValue];
}

@end