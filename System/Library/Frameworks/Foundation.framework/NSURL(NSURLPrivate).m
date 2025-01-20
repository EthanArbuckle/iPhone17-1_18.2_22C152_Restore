@interface NSURL(NSURLPrivate)
+ (id)_fileURLWithPath:()NSURLPrivate cachingResourceValuesForKeys:error:;
- (char)_initFileURLWithPath:()NSURLPrivate cachingResourceValuesForKeys:error:;
@end

@implementation NSURL(NSURLPrivate)

- (char)_initFileURLWithPath:()NSURLPrivate cachingResourceValuesForKeys:error:
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (![a3 length])
    {

      return 0;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@: nil string parameter", _NSMethodExceptionProem((objc_class *)a1, a2) format];
  }
  if (([a3 isAbsolutePath] & 1) == 0) {
    [a3 stringByStandardizingPath];
  }
  Class Class = object_getClass(a1);
  if (qword_1EB1ED850 != -1) {
    dispatch_once(&qword_1EB1ED850, &__block_literal_global_477);
  }
  if (Class != (Class)qword_1EB1ED848)
  {
    v13.receiver = a1;
    v13.super_class = (Class)&off_1ECAF3790;
    v9 = (char *)objc_msgSendSuper2(&v13, sel_init);
    if (!v9) {
      return v9;
    }
    uint64_t v11 = _CFURLCreateWithFileSystemPathCachingResourcePropertiesForKeys();
    if (v11)
    {
      *(void *)&v9[*MEMORY[0x1E4F1CB48]] = v11;
      return v9;
    }

    if (!a5) {
      return 0;
    }
    goto LABEL_22;
  }
  if (qword_1EB1ED840 != -1) {
    dispatch_once(&qword_1EB1ED840, &__block_literal_global_51);
  }
  if ((void *)qword_1EB1ED838 != a1) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"%@: object already initialized", _NSMethodExceptionProem((objc_class *)a1, a2) format];
  }
  v9 = (char *)_CFURLCreateWithFileSystemPathCachingResourcePropertiesForKeys();
  if (!v9)
  {
    if (!a5) {
      return 0;
    }
LABEL_22:
    if (*a5)
    {
      v9 = 0;
      *a5 = *a5;
      return v9;
    }
    return 0;
  }
  return v9;
}

+ (id)_fileURLWithPath:()NSURLPrivate cachingResourceValuesForKeys:error:
{
  v5 = (void *)[objc_allocWithZone(a1) _initFileURLWithPath:a3 cachingResourceValuesForKeys:a4 error:a5];

  return v5;
}

@end