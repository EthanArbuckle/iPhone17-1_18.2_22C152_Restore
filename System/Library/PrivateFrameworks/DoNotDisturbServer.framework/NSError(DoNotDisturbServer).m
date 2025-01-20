@interface NSError(DoNotDisturbServer)
- (uint64_t)dnds_isOutOfSpaceError;
@end

@implementation NSError(DoNotDisturbServer)

- (uint64_t)dnds_isOutOfSpaceError
{
  v2 = [a1 domain];
  uint64_t v3 = [a1 code];
  if ([v2 isEqual:*MEMORY[0x1E4F281F8]] && v3 == 640)
  {
    uint64_t v4 = 1;
  }
  else
  {
    unsigned int v5 = [v2 isEqual:*MEMORY[0x1E4F28798]];
    if (v3 == 28) {
      uint64_t v4 = v5;
    }
    else {
      uint64_t v4 = 0;
    }
  }

  return v4;
}

@end