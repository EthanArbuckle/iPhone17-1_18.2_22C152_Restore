@interface NSMutableData(SecRandom)
+ (id)dataWithRandomBytes:()SecRandom;
@end

@implementation NSMutableData(SecRandom)

+ (id)dataWithRandomBytes:()SecRandom
{
  v3 = [MEMORY[0x263EFF990] dataWithLength:a3];
  v4 = (const __SecRandom *)*MEMORY[0x263F17510];
  size_t v5 = [v3 length];
  id v6 = v3;
  if (SecRandomCopyBytes(v4, v5, (void *)[v6 mutableBytes])) {
    id v7 = 0;
  }
  else {
    id v7 = v6;
  }

  return v7;
}

@end