@interface NSDictionary
@end

@implementation NSDictionary

BOOL __71__NSDictionary_CalClassAdditions__CalDictionaryWithEmptyObjectsRemoved__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 integerValue];
LABEL_11:
    BOOL v6 = v4 == 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 length];
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v6 = 0;
          goto LABEL_12;
        }
      }
    }
    uint64_t v4 = [v3 count];
    goto LABEL_11;
  }
  v5 = [v3 absoluteString];
  BOOL v6 = [v5 length] == 0;

LABEL_12:
  return v6;
}

@end