@interface NSString(C2MetricOptionsPrivateNSStringExtension)
- (int8x8_t)c2UniformlyDistributedIdentifier;
- (void)c2UniformlyDistributedIdentifier;
@end

@implementation NSString(C2MetricOptionsPrivateNSStringExtension)

- (int8x8_t)c2UniformlyDistributedIdentifier
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)md = 0u;
  int8x16_t v8 = 0u;
  v1 = [a1 dataUsingEncoding:4];
  if (!v1) {
    -[NSString(C2MetricOptionsPrivateNSStringExtension) c2UniformlyDistributedIdentifier]();
  }
  v2 = v1;
  if (![v1 length]) {
    -[NSString(C2MetricOptionsPrivateNSStringExtension) c2UniformlyDistributedIdentifier]();
  }
  CC_SHA256((const void *)[v2 bytes], objc_msgSend(v2, "length"), md);
  int8x16_t v5 = *(int8x16_t *)md;
  int8x16_t v6 = v8;

  int8x16_t v3 = veorq_s8(v5, v6);
  return veor_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL));
}

- (void)c2UniformlyDistributedIdentifier
{
}

@end