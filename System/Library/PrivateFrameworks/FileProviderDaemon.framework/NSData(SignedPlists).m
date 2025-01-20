@interface NSData(SignedPlists)
+ (uint64_t)fp_dataWithContentsOfURL:()SignedPlists enforceSignatureCheck:shouldUpdateXattr:error:;
- (uint64_t)fp_writeToURL:()SignedPlists withSignature:options:error:;
@end

@implementation NSData(SignedPlists)

- (uint64_t)fp_writeToURL:()SignedPlists withSignature:options:error:
{
  return [a1 writeToURL:a3 options:a5 error:a6];
}

+ (uint64_t)fp_dataWithContentsOfURL:()SignedPlists enforceSignatureCheck:shouldUpdateXattr:error:
{
  return [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:a3 options:1 error:a6];
}

@end