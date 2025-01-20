@interface NSArray(DiffBuilding)
- (void)diffAgainstObject:()DiffBuilding usingDiffBuilder:withDescription:;
@end

@implementation NSArray(DiffBuilding)

- (void)diffAgainstObject:()DiffBuilding usingDiffBuilder:withDescription:
{
  id v6 = a3;
  id v7 = a4;
  id v15 = v6;
  unint64_t v8 = [a1 count];
  unint64_t v9 = [v15 count];
  if (v8 <= v9) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v8;
  }
  if (v10)
  {
    for (unint64_t i = 0; i != v10; ++i)
    {
      if ([a1 count] <= i)
      {
        v12 = 0;
      }
      else
      {
        v12 = [a1 objectAtIndexedSubscript:i];
      }
      if ([v15 count] <= i)
      {
        v13 = 0;
      }
      else
      {
        v13 = [v15 objectAtIndexedSubscript:i];
      }
      v14 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", i);
      [v7 diffObject:v12 againstObject:v13 withDescription:v14];
    }
  }
}

@end