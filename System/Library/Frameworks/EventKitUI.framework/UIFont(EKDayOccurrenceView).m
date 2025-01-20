@interface UIFont(EKDayOccurrenceView)
+ (id)ek_defaultOccurrencePrimaryTextFontForSizeClass:()EKDayOccurrenceView;
+ (id)ek_defaultOccurrenceSecondaryTextFont;
+ (id)ek_defaultOccurrenceSmallPrimaryTextFontForSizeClass:()EKDayOccurrenceView;
@end

@implementation UIFont(EKDayOccurrenceView)

+ (id)ek_defaultOccurrenceSecondaryTextFont
{
  if (dyld_program_sdk_at_least())
  {
    v0 = 0;
  }
  else
  {
    v0 = [MEMORY[0x1E4F57BB0] defaultOccurrenceSecondaryTextFont];
  }

  return v0;
}

+ (id)ek_defaultOccurrencePrimaryTextFontForSizeClass:()EKDayOccurrenceView
{
  if (dyld_program_sdk_at_least())
  {
    v4 = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4F57BB0] defaultOccurrencePrimaryTextFontForSizeClass:a3];
  }

  return v4;
}

+ (id)ek_defaultOccurrenceSmallPrimaryTextFontForSizeClass:()EKDayOccurrenceView
{
  if (dyld_program_sdk_at_least())
  {
    v4 = 0;
  }
  else
  {
    v4 = [MEMORY[0x1E4F57BB0] defaultOccurrenceSmallPrimaryTextFontForSizeClass:a3];
  }

  return v4;
}

@end