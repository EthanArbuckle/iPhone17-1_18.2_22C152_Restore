@interface CNUIFontRepository
+ (UIFont)carPlayContactInfoViewPrimaryLabelFont;
+ (UIFont)carPlayContactInfoViewSecondaryLabelFont;
+ (UIFont)carPlayNavigationBarContactNameFont;
+ (UIFont)carPlayNoContentViewSiriButtonFont;
+ (UIFont)carPlayNoContentViewTitleFont;
+ (UIFont)carPlayQuickActionButtonTitleFont;
+ (UIFont)carPlayQuickActionButtonTitleFontBold;
+ (UIFont)carPlaySymbolImageFont;
+ (UIFont)carPlayTableViewCellSubtitleFont;
+ (UIFont)carPlayTableViewCellTitleFont;
+ (UIFont)catalystAudienceDetailsLabelFont;
+ (UIFont)catalystLabelsFont;
+ (UIFont)catalystNameTextFieldsFont;
+ (UIFont)contactCardPhotoPickerActionButtonFont;
+ (UIFont)contactCardPhotoPickerCaptionFont;
+ (UIFont)contactCardRecentBadgeFont;
+ (UIFont)contactCardStaticHeaderDefaultNameFont;
+ (UIFont)contactCardStaticHeaderDefaultTaglineFont;
+ (UIFont)contactCardStaticHeaderNicknameTaglineFont;
+ (UIFont)contactCardWarningHeaderLabelFont;
+ (UIFont)contactListBannerFootnoteFontPrimary;
+ (UIFont)contactListBannerFootnoteFontSecondary;
+ (UIFont)contactListBannerTitleFontPrimary;
+ (UIFont)contactListContactCountFont;
+ (UIFont)contactListDuplicateCountFont;
+ (UIFont)contactStyleDefaultBoldTextFont;
+ (UIFont)contactStyleDefaultItalicTextFont;
+ (UIFont)contactStyleDefaultTextFont;
+ (UIFont)contactSuggestionsHeaderTitleFont;
+ (UIFont)contactSuggestionsNameFont;
+ (UIFont)groupHeaderActionButtonFont;
+ (UIFont)groupHeaderActionButtonWrappedFont;
+ (UIFont)groupHeaderSubTitleFont;
+ (UIFont)groupHeaderTitleFont;
+ (UIFont)groupHeaderWrappedTitleFont;
+ (UIFont)groupsAllButtonFont;
+ (UIFont)navigationListCellSubtitleFontRegular;
+ (UIFont)navigationListCellTitleFontRegular;
+ (UIFont)navigationListDetailCellSubtitleFontRegular;
+ (UIFont)navigationListDetailCellTitleFontRegular;
+ (UIFont)visualIdentityEditorSegmentedControlFont;
+ (UIFont)visualIdentityEditorTextFont;
+ (UIFont)visualIdentityPickerHeaderPlaceholderFont;
+ (UIFont)visualIdentityPickerHeaderTitleFont;
+ (id)boldFontWithFontDescriptor:(id)a3;
+ (id)carPlayFontWithBoldWeightStyle:(id)a3;
+ (id)carPlayFontWithMediumWeightStyle:(id)a3;
+ (id)carPlayFontWithStyle:(id)a3;
+ (id)fontWithBoldWeightStyle:(id)a3;
@end

@implementation CNUIFontRepository

+ (UIFont)contactStyleDefaultBoldTextFont
{
  v3 = [a1 contactStyleDefaultTextFont];
  v4 = [v3 fontDescriptor];
  v5 = [v4 fontDescriptorWithSymbolicTraits:2];

  v6 = (void *)MEMORY[0x1E4FB08E0];
  v7 = [a1 contactStyleDefaultTextFont];
  [v7 pointSize];
  v8 = objc_msgSend(v6, "fontWithDescriptor:size:", v5);

  return (UIFont *)v8;
}

+ (UIFont)contactStyleDefaultTextFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (UIFont)contactListBannerFootnoteFontPrimary
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
}

+ (id)fontWithBoldWeightStyle:(id)a3
{
  v3 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:a3];
  v4 = [v3 fontDescriptorWithSymbolicTraits:2];

  v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];

  return v5;
}

+ (UIFont)contactListBannerTitleFontPrimary
{
  return (UIFont *)[a1 fontWithBoldWeightStyle:*MEMORY[0x1E4FB2998]];
}

+ (UIFont)contactSuggestionsNameFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8] compatibleWithTraitCollection:0];
}

+ (UIFont)contactSuggestionsHeaderTitleFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
}

+ (id)carPlayFontWithBoldWeightStyle:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB08E8];
  v4 = (void *)MEMORY[0x1E4FB1BA8];
  id v5 = a3;
  v6 = [v4 _carScreen];
  v7 = [v6 traitCollection];
  v8 = [v3 preferredFontDescriptorWithTextStyle:v5 compatibleWithTraitCollection:v7];

  v9 = [v8 fontDescriptorWithSymbolicTraits:2];

  v10 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v9 size:0.0];

  return v10;
}

+ (id)carPlayFontWithMediumWeightStyle:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4FB08E8];
  v4 = (void *)MEMORY[0x1E4FB1BA8];
  id v5 = a3;
  v6 = [v4 _carScreen];
  v7 = [v6 traitCollection];
  v8 = [v3 preferredFontDescriptorWithTextStyle:v5 compatibleWithTraitCollection:v7];

  uint64_t v14 = *MEMORY[0x1E4FB09F0];
  v9 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09D0]];
  v15[0] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  v11 = [v8 fontDescriptorByAddingAttributes:v10];

  v12 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v11 size:0.0];

  return v12;
}

+ (id)carPlayFontWithStyle:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB08E8];
  v4 = (void *)MEMORY[0x1E4FB1BA8];
  id v5 = a3;
  v6 = [v4 _carScreen];
  v7 = [v6 traitCollection];
  v8 = [v3 preferredFontDescriptorWithTextStyle:v5 compatibleWithTraitCollection:v7];

  v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];

  return v9;
}

+ (id)boldFontWithFontDescriptor:(id)a3
{
  v3 = [a3 fontDescriptorWithSymbolicTraits:2];
  v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];

  return v4;
}

+ (UIFont)carPlayNoContentViewSiriButtonFont
{
  return (UIFont *)[a1 carPlayFontWithBoldWeightStyle:*MEMORY[0x1E4FB28D0]];
}

+ (UIFont)carPlayNoContentViewTitleFont
{
  return (UIFont *)[a1 carPlayFontWithStyle:*MEMORY[0x1E4FB2988]];
}

+ (UIFont)carPlaySymbolImageFont
{
  return (UIFont *)[a1 carPlayFontWithMediumWeightStyle:*MEMORY[0x1E4FB28D0]];
}

+ (UIFont)carPlayNavigationBarContactNameFont
{
  return (UIFont *)[a1 carPlayFontWithMediumWeightStyle:*MEMORY[0x1E4FB28D0]];
}

+ (UIFont)carPlayQuickActionButtonTitleFontBold
{
  return (UIFont *)[a1 carPlayFontWithBoldWeightStyle:*MEMORY[0x1E4FB28D8]];
}

+ (UIFont)carPlayQuickActionButtonTitleFont
{
  return (UIFont *)[a1 carPlayFontWithStyle:*MEMORY[0x1E4FB28D8]];
}

+ (UIFont)carPlayContactInfoViewSecondaryLabelFont
{
  return (UIFont *)[a1 carPlayFontWithStyle:*MEMORY[0x1E4FB28D8]];
}

+ (UIFont)carPlayContactInfoViewPrimaryLabelFont
{
  return (UIFont *)[a1 carPlayFontWithBoldWeightStyle:*MEMORY[0x1E4FB2990]];
}

+ (UIFont)carPlayTableViewCellSubtitleFont
{
  return (UIFont *)[a1 carPlayFontWithStyle:*MEMORY[0x1E4FB28D8]];
}

+ (UIFont)carPlayTableViewCellTitleFont
{
  return (UIFont *)[a1 carPlayFontWithMediumWeightStyle:*MEMORY[0x1E4FB28D0]];
}

+ (UIFont)catalystAudienceDetailsLabelFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
}

+ (UIFont)catalystLabelsFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (UIFont)catalystNameTextFieldsFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (UIFont)visualIdentityEditorSegmentedControlFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
}

+ (UIFont)visualIdentityEditorTextFont
{
  v12[2] = *MEMORY[0x1E4F143B8];
  double v2 = *MEMORY[0x1E4FB09E0];
  v3 = [MEMORY[0x1E4FB08E0] systemFontOfSize:120.0 weight:*MEMORY[0x1E4FB09E0]];
  v4 = [v3 fontDescriptor];
  id v5 = [v4 fontDescriptorWithDesign:*MEMORY[0x1E4FB0938]];

  v11[0] = *MEMORY[0x1E4FB09F0];
  v6 = [NSNumber numberWithDouble:v2];
  v11[1] = *MEMORY[0x1E4F24520];
  v12[0] = v6;
  v12[1] = &unk_1ED9155F0;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  v8 = [v5 fontDescriptorByAddingAttributes:v7];

  v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];

  return (UIFont *)v9;
}

+ (UIFont)visualIdentityPickerHeaderPlaceholderFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2928]];
}

+ (UIFont)visualIdentityPickerHeaderTitleFont
{
  return (UIFont *)[a1 fontWithBoldWeightStyle:*MEMORY[0x1E4FB2928]];
}

+ (UIFont)groupHeaderActionButtonWrappedFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
}

+ (UIFont)groupHeaderActionButtonFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2948]];
}

+ (UIFont)groupHeaderSubTitleFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2948]];
}

+ (UIFont)groupHeaderWrappedTitleFont
{
  double v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2990]];
  v3 = [v2 fontDescriptorWithSymbolicTraits:32770];

  v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];

  return (UIFont *)v4;
}

+ (UIFont)groupHeaderTitleFont
{
  return (UIFont *)[a1 fontWithBoldWeightStyle:*MEMORY[0x1E4FB2988]];
}

+ (UIFont)contactCardPhotoPickerActionButtonFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
}

+ (UIFont)contactCardPhotoPickerCaptionFont
{
  return (UIFont *)[a1 fontWithBoldWeightStyle:*MEMORY[0x1E4FB28D8]];
}

+ (UIFont)contactCardStaticHeaderNicknameTaglineFont
{
  double v2 = [a1 contactCardStaticHeaderDefaultTaglineFont];
  v3 = [v2 fontDescriptor];

  v4 = [v3 fontDescriptorWithSymbolicTraits:3];

  id v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];

  return (UIFont *)v5;
}

+ (UIFont)contactCardStaticHeaderDefaultTaglineFont
{
  return (UIFont *)[a1 fontWithBoldWeightStyle:*MEMORY[0x1E4FB28F0]];
}

+ (UIFont)contactCardStaticHeaderDefaultNameFont
{
  double v2 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2928]];
  v3 = [v2 fontDescriptorWithSymbolicTraits:0x8000];

  v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];

  return (UIFont *)v4;
}

+ (UIFont)contactCardWarningHeaderLabelFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8]];
}

+ (UIFont)contactCardRecentBadgeFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (UIFont)contactStyleDefaultItalicTextFont
{
  v3 = [a1 contactStyleDefaultTextFont];
  v4 = [v3 fontDescriptor];
  id v5 = [v4 fontDescriptorWithSymbolicTraits:1];

  v6 = (void *)MEMORY[0x1E4FB08E0];
  v7 = [a1 contactStyleDefaultTextFont];
  [v7 pointSize];
  v8 = objc_msgSend(v6, "fontWithDescriptor:size:", v5);

  return (UIFont *)v8;
}

+ (UIFont)contactListDuplicateCountFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
}

+ (UIFont)contactListContactCountFont
{
  v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:8];

  if (v5) {
    [a1 fontWithBoldWeightStyle:*MEMORY[0x1E4FB28C8]];
  }
  else {
  v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:20.0];
  }

  return (UIFont *)v6;
}

+ (UIFont)contactListBannerFootnoteFontSecondary
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (UIFont)navigationListDetailCellSubtitleFontRegular
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
}

+ (UIFont)navigationListDetailCellTitleFontRegular
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (UIFont)navigationListCellSubtitleFontRegular
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (UIFont)navigationListCellTitleFontRegular
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
}

+ (UIFont)groupsAllButtonFont
{
  return (UIFont *)[MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
}

@end