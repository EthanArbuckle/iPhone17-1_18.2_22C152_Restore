@interface NSUUID(CRNSUUIDAdditions)
+ (id)CRTTZero;
- (id)CRTTShortDescription;
- (id)CRTTxorWith:()CRNSUUIDAdditions;
- (uint64_t)CRTTCompare:()CRNSUUIDAdditions;
@end

@implementation NSUUID(CRNSUUIDAdditions)

+ (id)CRTTZero
{
  if (CRTTZero_once != -1) {
    dispatch_once(&CRTTZero_once, &__block_literal_global);
  }
  v0 = (void *)CRTTZero_zero;
  return v0;
}

- (id)CRTTxorWith:()CRNSUUIDAdditions
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int8x16_t v8 = 0uLL;
  int8x16_t v7 = 0uLL;
  [a1 getUUIDBytes:&v8];
  [v4 getUUIDBytes:&v7];
  int8x16_t v8 = veorq_s8(v7, v8);
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v8];

  return v5;
}

- (uint64_t)CRTTCompare:()CRNSUUIDAdditions
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  *(void *)uu1 = 0;
  uint64_t v9 = 0;
  *(void *)uu2 = 0;
  uint64_t v7 = 0;
  id v4 = a3;
  [a1 getUUIDBytes:uu1];
  [v4 getUUIDBytes:uu2];

  return uuid_compare(uu1, uu2);
}

- (id)CRTTShortDescription
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  v1 = objc_msgSend(NSString, "stringWithFormat:", @"%02X%02X", LOBYTE(v3[0]), BYTE1(v3[0]));
  return v1;
}

@end