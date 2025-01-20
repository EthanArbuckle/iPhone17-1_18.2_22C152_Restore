@interface NSValue(AEAdditions)
+ (id)ae_valueFromData:()AEAdditions ofObjCType:;
- (id)ae_dataRepresentation;
@end

@implementation NSValue(AEAdditions)

- (id)ae_dataRepresentation
{
  id v1 = a1;
  NSUInteger sizep = 0;
  NSGetSizeAndAlignment((const char *)[v1 objCType], &sizep, 0);
  NSUInteger v2 = sizep;
  v3 = malloc_type_malloc(sizep, 0x74EDC0ABuLL);
  [v1 getValue:v3];
  v4 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v3 length:v2 freeWhenDone:1];
  return v4;
}

+ (id)ae_valueFromData:()AEAdditions ofObjCType:
{
  id v5 = a3;
  uint64_t v6 = [v5 length];
  NSUInteger sizep = 0;
  NSGetSizeAndAlignment(a4, &sizep, 0);
  v7 = 0;
  if (v6 == sizep)
  {
    v7 = objc_msgSend(MEMORY[0x263F08D40], "valueWithBytes:objCType:", objc_msgSend(v5, "bytes"), a4);
  }

  return v7;
}

@end