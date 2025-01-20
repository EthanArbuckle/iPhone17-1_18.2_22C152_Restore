@interface NSArray(_NBAdditions)
- (id)nb_safeObjectAtIndex:()_NBAdditions class:;
- (uint64_t)nb_safeArrayAtIndex:()_NBAdditions;
- (uint64_t)nb_safeDataAtIndex:()_NBAdditions;
- (uint64_t)nb_safeNumberAtIndex:()_NBAdditions;
- (uint64_t)nb_safeStringAtIndex:()_NBAdditions;
@end

@implementation NSArray(_NBAdditions)

- (id)nb_safeObjectAtIndex:()_NBAdditions class:
{
  if ([a1 count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    v5 = [a1 objectAtIndex:a3];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }

  return v6;
}

- (uint64_t)nb_safeStringAtIndex:()_NBAdditions
{
  uint64_t v5 = objc_opt_class();

  return objc_msgSend(a1, "nb_safeObjectAtIndex:class:", a3, v5);
}

- (uint64_t)nb_safeNumberAtIndex:()_NBAdditions
{
  uint64_t v5 = objc_opt_class();

  return objc_msgSend(a1, "nb_safeObjectAtIndex:class:", a3, v5);
}

- (uint64_t)nb_safeArrayAtIndex:()_NBAdditions
{
  uint64_t v5 = objc_opt_class();

  return objc_msgSend(a1, "nb_safeObjectAtIndex:class:", a3, v5);
}

- (uint64_t)nb_safeDataAtIndex:()_NBAdditions
{
  uint64_t v5 = objc_opt_class();

  return objc_msgSend(a1, "nb_safeObjectAtIndex:class:", a3, v5);
}

@end