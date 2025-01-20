@interface NSNumber(BRAdditions)
- (uint64_t)br_isEqualToNumber:()BRAdditions;
- (uint64_t)br_roundedLongLongValue;
@end

@implementation NSNumber(BRAdditions)

- (uint64_t)br_roundedLongLongValue
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v2 setUsesSignificantDigits:1];
  [v2 setMaximumSignificantDigits:2];
  if ([a1 compare:&unk_1EF133640] == -1) {
    [v2 setMaximumSignificantDigits:1];
  }
  v3 = [v2 stringFromNumber:a1];
  v4 = [v2 numberFromString:v3];
  v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 longLongValue];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

- (uint64_t)br_isEqualToNumber:()BRAdditions
{
  if (a3) {
    return objc_msgSend(a1, "isEqualToNumber:");
  }
  else {
    return 0;
  }
}

@end