@interface NSArray(DACPLogShared)
- (id)DACPLogSubarrayFromIndexToEndOfArray:()DACPLogShared;
- (uint64_t)DACPLogArrayBeginsWithArray:()DACPLogShared;
@end

@implementation NSArray(DACPLogShared)

- (id)DACPLogSubarrayFromIndexToEndOfArray:()DACPLogShared
{
  if ([a1 count] <= a3)
  {
    v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v5 = objc_msgSend(a1, "subarrayWithRange:", a3, objc_msgSend(a1, "count") - a3);
  }

  return v5;
}

- (uint64_t)DACPLogArrayBeginsWithArray:()DACPLogShared
{
  id v4 = a3;
  unint64_t v5 = [v4 count];
  if (v5 <= [a1 count])
  {
    if ([v4 count])
    {
      unint64_t v7 = 0;
      do
      {
        v8 = [v4 objectAtIndexedSubscript:v7];
        v9 = [a1 objectAtIndexedSubscript:v7];
        uint64_t v6 = [v8 isEqual:v9];

        if ((v6 & 1) == 0) {
          break;
        }
        ++v7;
      }
      while (v7 < [v4 count]);
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

@end