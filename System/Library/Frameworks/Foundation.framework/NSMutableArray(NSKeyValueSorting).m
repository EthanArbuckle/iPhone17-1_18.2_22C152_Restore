@interface NSMutableArray(NSKeyValueSorting)
- (void)sortUsingDescriptors:()NSKeyValueSorting;
@end

@implementation NSMutableArray(NSKeyValueSorting)

- (void)sortUsingDescriptors:()NSKeyValueSorting
{
  v18[3] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a1 count];
  uint64_t v6 = [a3 count];
  if (v6 && v5 >= 2)
  {
    if (v5 >> 60)
    {
      CFStringRef v16 = CFStringCreateWithFormat(0, 0, @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt", v5);
      v17 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v16 userInfo:0];
      CFRelease(v16);
      objc_exception_throw(v17);
    }
    if (v5 >= 0x101) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v5;
    }
    uint64_t v8 = 8 * v7;
    double v9 = MEMORY[0x1F4188790](v6);
    v11 = (char *)v18 - v10;
    v18[2] = 0;
    if (v5 >= 0x101)
    {
      v11 = (char *)_CFCreateArrayStorage();
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    uint64_t v13 = objc_msgSend(a1, "getObjects:range:", v11, 0, v5, v9);
    MEMORY[0x1F4188790](v13);
    v14 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v15 = 0;
    v18[1] = 0;
    if (v5 >= 0x101)
    {
      v15 = (char *)_CFCreateArrayStorage();
      v14 = v15;
    }
    _sortedObjectsUsingDescriptors((uint64_t)v11, v5, a3, (uint64_t)v14);
    objc_msgSend(a1, "replaceObjectsInRange:withObjects:count:", 0, v5, v14, v5);
    free(v15);
    free(v12);
  }
}

@end