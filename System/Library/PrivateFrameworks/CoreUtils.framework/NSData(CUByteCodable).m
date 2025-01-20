@interface NSData(CUByteCodable)
+ (id)createWithBytesNoCopy:()CUByteCodable length:error:;
- (const)encodedBytesAndReturnLength:()CUByteCodable error:;
@end

@implementation NSData(CUByteCodable)

- (const)encodedBytesAndReturnLength:()CUByteCodable error:
{
  *a3 = [a1 length];
  result = (const char *)[a1 bytes];
  if (!result) {
    return "";
  }
  return result;
}

+ (id)createWithBytesNoCopy:()CUByteCodable length:error:
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:a3 length:a4 freeWhenDone:1];
  return v4;
}

@end