@interface NSObject(JSON)
+ (id)objectWithJSONString:()JSON;
+ (void)jsonStringWithObject:()JSON;
@end

@implementation NSObject(JSON)

+ (id)objectWithJSONString:()JSON
{
  if ((*((char *)a3 + 23) & 0x80000000) == 0)
  {
    if (!*((unsigned char *)a3 + 23)) {
      goto LABEL_7;
    }
LABEL_6:
    v3 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", a3);
    v4 = [MEMORY[0x263F08900] JSONObjectWithData:v3 options:4 error:0];

    goto LABEL_8;
  }
  if (a3[1])
  {
    a3 = (uint64_t *)*a3;
    goto LABEL_6;
  }
LABEL_7:
  v4 = 0;
LABEL_8:

  return v4;
}

+ (void)jsonStringWithObject:()JSON
{
  id v3 = a1;
  if ([MEMORY[0x263F08900] isValidJSONObject:v3])
  {
    id v8 = 0;
    v4 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:1 error:&v8];
    id v5 = v8;
    if (v4)
    {
      v6 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
      v7 = v6;
      if (v6) {
        std::string::basic_string[abi:ne180100]<0>(a2, (char *)[v6 UTF8String]);
      }
      else {
        std::string::basic_string[abi:ne180100]<0>(a2, "");
      }
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(a2, "");
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a2, "");
  }
}

@end