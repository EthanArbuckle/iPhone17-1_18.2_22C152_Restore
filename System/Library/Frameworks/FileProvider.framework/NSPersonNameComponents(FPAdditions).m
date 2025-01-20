@interface NSPersonNameComponents(FPAdditions)
- (uint64_t)fp_formattedName;
@end

@implementation NSPersonNameComponents(FPAdditions)

- (uint64_t)fp_formattedName
{
  return [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:a1 style:0 options:0];
}

@end