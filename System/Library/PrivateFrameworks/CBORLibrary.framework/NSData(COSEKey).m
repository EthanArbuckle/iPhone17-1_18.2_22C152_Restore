@interface NSData(COSEKey)
+ (id)dataWithCOSEKey:()COSEKey;
@end

@implementation NSData(COSEKey)

+ (id)dataWithCOSEKey:()COSEKey
{
  v3 = (void *)MEMORY[0x263EFF8F8];
  v4 = -[COSE sourceObject](a3);
  v5 = [v3 dataWithCBOR:v4];

  return v5;
}

@end