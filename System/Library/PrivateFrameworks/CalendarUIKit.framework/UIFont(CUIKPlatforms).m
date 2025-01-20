@interface UIFont(CUIKPlatforms)
+ (id)cuik_createFontFromFont:()CUIKPlatforms withFontGrade:;
+ (uint64_t)cuik_preferredTightLeadingBoldFontForTextStyle:()CUIKPlatforms;
+ (uint64_t)cuik_preferredTightLeadingFontForTextStyle:()CUIKPlatforms;
@end

@implementation UIFont(CUIKPlatforms)

+ (uint64_t)cuik_preferredTightLeadingFontForTextStyle:()CUIKPlatforms
{
  return [a1 _preferredFontForTextStyle:a3 addingSymbolicTraits:0x8000];
}

+ (uint64_t)cuik_preferredTightLeadingBoldFontForTextStyle:()CUIKPlatforms
{
  return [a1 _preferredFontForTextStyle:a3 addingSymbolicTraits:32770];
}

+ (id)cuik_createFontFromFont:()CUIKPlatforms withFontGrade:
{
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();

  return CopyOfSystemUIFontWithGrade;
}

@end