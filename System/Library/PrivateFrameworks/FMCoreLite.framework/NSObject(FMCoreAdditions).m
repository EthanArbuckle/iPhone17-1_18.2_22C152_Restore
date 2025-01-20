@interface NSObject(FMCoreAdditions)
- (id)fm_nullToNil;
- (uint64_t)fm_logID;
@end

@implementation NSObject(FMCoreAdditions)

- (id)fm_nullToNil
{
  v2 = [MEMORY[0x1E4F1CA98] null];

  if (v2 == a1) {
    id v3 = 0;
  }
  else {
    id v3 = a1;
  }
  return v3;
}

- (uint64_t)fm_logID
{
  return [NSString stringWithFormat:@"%@(0x%X)", objc_opt_class(), a1];
}

@end