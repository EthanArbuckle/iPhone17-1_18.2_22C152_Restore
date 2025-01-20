@interface NSData(FPFSHelpers)
- (uint64_t)getFileIDFromXattr:()FPFSHelpers docID:genCount:;
@end

@implementation NSData(FPFSHelpers)

- (uint64_t)getFileIDFromXattr:()FPFSHelpers docID:genCount:
{
  if (a3) {
    *a3 = 0;
  }
  if (a4) {
    *a4 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  size_t v9 = [a1 length];
  v10 = (char *)[a1 bytes];
  v11 = (const char *)memchr(v10, 58, v9);
  if (v10[v9 - 1]) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v11 == 0;
  }
  if (v12) {
    return 0;
  }
  v14 = v11;
  if (a3) {
    *a3 = atoll(v10);
  }
  uint64_t result = (uint64_t)memchr((void *)(v14 + 1), 58, (size_t)&v10[v9 + ~(unint64_t)v14]);
  if (result)
  {
    uint64_t v15 = result;
    if (a4) {
      *a4 = atol(v14 + 1);
    }
    if (a5) {
      *a5 = atoll((const char *)(v15 + 1));
    }
    return 1;
  }
  return result;
}

@end