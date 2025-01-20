@interface NSMutableDictionary(AVCaptureMovieFileOutputAdditions)
- (uint64_t)mfo_addEntriesFromDictionaryWithRecursion:()AVCaptureMovieFileOutputAdditions;
@end

@implementation NSMutableDictionary(AVCaptureMovieFileOutputAdditions)

- (uint64_t)mfo_addEntriesFromDictionaryWithRecursion:()AVCaptureMovieFileOutputAdditions
{
  v5 = (void *)[a3 keyEnumerator];
  uint64_t result = [v5 nextObject];
  if (result)
  {
    uint64_t v7 = result;
    do
    {
      v8 = (void *)[a1 objectForKey:v7];
      v9 = (void *)[a3 objectForKey:v7];
      if (v8
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v8, "mfo_addEntriesFromDictionaryWithRecursion:", v9);
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = (id)[v9 mutableCopy];
          v11 = a1;
        }
        else
        {
          v11 = a1;
          id v10 = v9;
        }
        [v11 setObject:v10 forKey:v7];
      }
      uint64_t result = [v5 nextObject];
      uint64_t v7 = result;
    }
    while (result);
  }
  return result;
}

@end