@interface MTTimer(CoordinationCore)
- (id)co_preferredTimer:()CoordinationCore;
@end

@implementation MTTimer(CoordinationCore)

- (id)co_preferredTimer:()CoordinationCore
{
  id v4 = a3;
  id v5 = a1;
  if (v4)
  {
    uint64_t v6 = [v4 lastModifiedDate];
    if (v6)
    {
      v7 = (void *)v6;
      v8 = [v4 lastModifiedDate];
      v9 = [v5 lastModifiedDate];
      if ([v8 compare:v9] == 1)
      {
      }
      else
      {
        v10 = [v5 lastModifiedDate];

        if (v10) {
          goto LABEL_7;
        }
      }
      id v11 = v4;

      id v5 = v11;
    }
  }
LABEL_7:

  return v5;
}

@end