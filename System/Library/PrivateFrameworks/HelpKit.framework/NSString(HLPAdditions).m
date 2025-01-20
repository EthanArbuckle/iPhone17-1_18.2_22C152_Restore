@interface NSString(HLPAdditions)
- (id)htmlDecodedString;
@end

@implementation NSString(HLPAdditions)

- (id)htmlDecodedString
{
  v11[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 length])
  {
    v2 = [v1 dataUsingEncoding:4];
    uint64_t v3 = *MEMORY[0x263F81508];
    uint64_t v4 = *MEMORY[0x263F814C0];
    v10[0] = *MEMORY[0x263F814D0];
    v10[1] = v4;
    v11[0] = v3;
    v11[1] = &unk_26D2A8550;
    v5 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
    v6 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithData:v2 options:v5 documentAttributes:0 error:0];
    v7 = [v6 string];

    if (v7)
    {
      uint64_t v8 = [v6 string];

      id v1 = (id)v8;
    }
  }
  return v1;
}

@end