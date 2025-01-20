@interface NSDate(FamilyCircle)
- (uint64_t)isDateRelative;
@end

@implementation NSDate(FamilyCircle)

- (uint64_t)isDateRelative
{
  v2 = objc_msgSend(MEMORY[0x1E4F28C10], "fa_standardFormatter");
  v3 = [v2 stringFromDate:a1];
  v4 = objc_msgSend(MEMORY[0x1E4F28C10], "fa_standardFormatter");
  [v4 setDoesRelativeDateFormatting:0];
  v5 = [v4 stringFromDate:a1];
  uint64_t v6 = [v3 isEqualToString:v5] ^ 1;

  return v6;
}

@end