@interface NSUUID(CRKASMAdditions)
+ (id)crk_UUIDWithOpaqueData:()CRKASMAdditions;
+ (id)crk_UUIDWithOpaqueString:()CRKASMAdditions;
+ (int8x16_t)crk_condense32BytesIntoFirst16Bytes:()CRKASMAdditions;
@end

@implementation NSUUID(CRKASMAdditions)

+ (id)crk_UUIDWithOpaqueString:()CRKASMAdditions
{
  v4 = [a3 dataUsingEncoding:4];
  v5 = objc_msgSend(a1, "crk_UUIDWithOpaqueData:", v4);

  return v5;
}

+ (id)crk_UUIDWithOpaqueData:()CRKASMAdditions
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (const void *)[v4 bytes];
  CC_LONG v6 = [v4 length];

  CC_SHA256(v5, v6, md);
  objc_msgSend(a1, "crk_condense32BytesIntoFirst16Bytes:", md);
  v7 = (void *)[objc_alloc((Class)a1) initWithUUIDBytes:md];

  return v7;
}

+ (int8x16_t)crk_condense32BytesIntoFirst16Bytes:()CRKASMAdditions
{
  int8x16_t result = veorq_s8(a3[1], *a3);
  *a3 = result;
  return result;
}

@end