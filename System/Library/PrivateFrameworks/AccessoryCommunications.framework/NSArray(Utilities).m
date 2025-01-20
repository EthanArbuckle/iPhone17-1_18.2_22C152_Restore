@interface NSArray(Utilities)
- (id)truncatedArray:()Utilities;
@end

@implementation NSArray(Utilities)

- (id)truncatedArray:()Utilities
{
  if ([a1 count] <= a3)
  {
    id v7 = a1;
  }
  else
  {
    unint64_t v5 = [a1 count];
    if (v5 >= a3) {
      unint64_t v6 = a3;
    }
    else {
      unint64_t v6 = v5;
    }
    objc_msgSend(a1, "subarrayWithRange:", 0, v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

@end