@interface NSIndexSet(HKDayIndex)
+ (uint64_t)hk_indexSetWithDayIndexRange:()HKDayIndex;
- (void)hk_enumerateDayIndexRangesUsingBlock:()HKDayIndex;
- (void)hk_enumerateDayIndexRangesWithOptions:()HKDayIndex usingBlock:;
@end

@implementation NSIndexSet(HKDayIndex)

+ (uint64_t)hk_indexSetWithDayIndexRange:()HKDayIndex
{
  if (a3 < 0)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = [NSString stringWithUTF8String:"NSRange NSRangeFromHKDayIndexRange(HKDayIndexRange)"];
    [v8 handleFailureInFunction:v9 file:@"HKDayIndexRange.h" lineNumber:46 description:@"Cannot convert day index ranges less than 0 to NSRange"];
  }

  return objc_msgSend(a1, "indexSetWithIndexesInRange:", a3, a4);
}

- (void)hk_enumerateDayIndexRangesUsingBlock:()HKDayIndex
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__NSIndexSet_HKDayIndex__hk_enumerateDayIndexRangesUsingBlock___block_invoke;
  v6[3] = &unk_1E58BEC50;
  id v7 = v4;
  id v5 = v4;
  [a1 enumerateRangesUsingBlock:v6];
}

- (void)hk_enumerateDayIndexRangesWithOptions:()HKDayIndex usingBlock:
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __75__NSIndexSet_HKDayIndex__hk_enumerateDayIndexRangesWithOptions_usingBlock___block_invoke;
  v8[3] = &unk_1E58BEC50;
  id v9 = v6;
  id v7 = v6;
  [a1 enumerateRangesWithOptions:a3 usingBlock:v8];
}

@end