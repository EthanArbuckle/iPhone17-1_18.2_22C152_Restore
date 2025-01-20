@interface NSDictionary
@end

@implementation NSDictionary

BOOL __66__NSDictionary_IntentsFoundation__if_dictionaryWithNonEmptyValues__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v3 length]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && ![v3 count])
  {
    BOOL v4 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [v3 allKeys];
      BOOL v4 = [v5 count] != 0;
    }
    else
    {
      BOOL v4 = 1;
    }
  }

  return v4;
}

@end