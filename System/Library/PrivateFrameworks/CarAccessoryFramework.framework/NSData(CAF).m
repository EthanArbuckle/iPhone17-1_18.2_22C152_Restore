@interface NSData(CAF)
+ (id)CAF_encodeBinaryPlistFrom:()CAF error:;
- (id)CAF_decodeBinaryPlist:()CAF;
@end

@implementation NSData(CAF)

+ (id)CAF_encodeBinaryPlistFrom:()CAF error:
{
  if (a3)
  {
    v5 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:200 options:0 error:a4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)CAF_decodeBinaryPlist:()CAF
{
  uint64_t v10 = 0;
  uint64_t v4 = [MEMORY[0x263F08AC0] propertyListWithData:a1 options:0 format:&v10 error:a3];
  v5 = v4;
  if (v10 == 200)
  {
    id v6 = v4;
  }
  else
  {
    v7 = (void *)MEMORY[0x263F087E8];
    v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    objc_msgSend(v7, "CAF_invalidDataForFormat:", v8);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    id v6 = 0;
  }

  return v6;
}

@end