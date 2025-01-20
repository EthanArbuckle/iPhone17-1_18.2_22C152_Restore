@interface UIFont(MessageUI)
+ (double)mf_defaultComposeFontPixelSize;
+ (id)mf_messageHeaderSenderLabelFont;
+ (id)mf_messageHeaderSenderLabelFontForMailActionHeader;
+ (uint64_t)mf_messageBodyFont;
+ (uint64_t)mf_messageHeaderSummaryLabelFont;
+ (uint64_t)mf_messageHeaderSummaryLabelFontForMailActionHeader;
+ (uint64_t)mf_messageHeaderTimestampLabelFont;
- (double)mf_baselinePointFromOriginPoint:()MessageUI;
- (double)mf_originPointFromBaselinePoint:()MessageUI;
@end

@implementation UIFont(MessageUI)

- (double)mf_originPointFromBaselinePoint:()MessageUI
{
  return a2;
}

- (double)mf_baselinePointFromOriginPoint:()MessageUI
{
  return a2;
}

+ (double)mf_defaultComposeFontPixelSize
{
  return 17.0;
}

+ (id)mf_messageHeaderSenderLabelFont
{
  v0 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] addingSymbolicTraits:32770 options:0];
  v1 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v0 size:0.0];

  return v1;
}

+ (uint64_t)mf_messageHeaderSummaryLabelFont
{
  return [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2948]];
}

+ (uint64_t)mf_messageHeaderTimestampLabelFont
{
  return [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2948]];
}

+ (id)mf_messageHeaderSenderLabelFontForMailActionHeader
{
  v0 = [MEMORY[0x1E4FB1438] sharedApplication];
  v1 = [v0 preferredContentSizeCategory];

  v2 = (NSString *)(id)*MEMORY[0x1E4FB2790];
  if (UIContentSizeCategoryCompareToCategory(v1, v2) == NSOrderedAscending) {
    v3 = v1;
  }
  else {
    v3 = v2;
  }
  v4 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v3];
  v5 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB28C8] compatibleWithTraitCollection:v4];
  v6 = [v5 fontDescriptorWithSymbolicTraits:32770];

  v7 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v6 size:0.0];

  return v7;
}

+ (uint64_t)mf_messageHeaderSummaryLabelFontForMailActionHeader
{
  return [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB2948] maximumContentSizeCategory:*MEMORY[0x1E4FB2790]];
}

+ (uint64_t)mf_messageBodyFont
{
  return [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

@end