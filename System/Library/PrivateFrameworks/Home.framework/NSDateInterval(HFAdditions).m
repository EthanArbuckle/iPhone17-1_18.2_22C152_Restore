@interface NSDateInterval(HFAdditions)
- (uint64_t)hf_searchResultForDate:()HFAdditions;
@end

@implementation NSDateInterval(HFAdditions)

- (uint64_t)hf_searchResultForDate:()HFAdditions
{
  id v4 = a3;
  v5 = [a1 startDate];
  uint64_t v6 = [v4 compare:v5];

  if (v6 == -1)
  {
    uint64_t v9 = 0;
  }
  else
  {
    v7 = [a1 endDate];
    uint64_t v8 = [v4 compare:v7];

    if (v8 == 1) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
  }

  return v9;
}

@end