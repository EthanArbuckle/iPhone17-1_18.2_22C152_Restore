@interface NSString(CKAdditions)
- (uint64_t)compareToVersion:()CKAdditions;
@end

@implementation NSString(CKAdditions)

- (uint64_t)compareToVersion:()CKAdditions
{
  v4 = (void *)[a1 componentsSeparatedByString:@"."];
  v5 = (void *)[a3 componentsSeparatedByString:@"."];
  unint64_t v6 = [v4 count];
  if (v6 <= [v5 count]) {
    v7 = v5;
  }
  else {
    v7 = v4;
  }
  uint64_t v8 = [v7 count];
  if (v8 < 1) {
    return 0;
  }
  uint64_t v9 = v8;
  uint64_t v10 = 0;
  while (1)
  {
    v11 = @"0";
    if (v10 < [v4 count]) {
      v11 = (__CFString *)[v4 objectAtIndexedSubscript:v10];
    }
    uint64_t v12 = [v5 count];
    v13 = @"0";
    if (v10 < v12) {
      v13 = (__CFString *)[v5 objectAtIndexedSubscript:v10];
    }
    uint64_t result = [(__CFString *)v11 compare:v13 options:64];
    if (result) {
      break;
    }
    if (v9 == ++v10) {
      return 0;
    }
  }
  return result;
}

@end