@interface UIFont(CUIKWidgetFontUtils)
- (id)CUIKFontByApplyingFeatureSettings:()CUIKWidgetFontUtils;
- (id)CUIKFontWithAlternativePunctuation;
- (id)CUIKFontWithLocalizedSmallCaps:()CUIKWidgetFontUtils;
@end

@implementation UIFont(CUIKWidgetFontUtils)

- (id)CUIKFontWithAlternativePunctuation
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4FB0960];
  v8[0] = *MEMORY[0x1E4FB0968];
  v8[1] = v2;
  v9[0] = &unk_1F1892168;
  v9[1] = &unk_1F1892180;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  v7 = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v7 count:1];

  v5 = [a1 CUIKFontByApplyingFeatureSettings:v4];

  return v5;
}

- (id)CUIKFontWithLocalizedSmallCaps:()CUIKWidgetFontUtils
{
  v15[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = *MEMORY[0x1E4FB0960];
    v14[0] = *MEMORY[0x1E4FB0968];
    uint64_t v4 = v14[0];
    v14[1] = v5;
    v15[0] = &unk_1F1892120;
    v15[1] = &unk_1F1892138;
    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    v12[0] = v4;
    v12[1] = v5;
    v13[0] = &unk_1F1892150;
    v13[1] = &unk_1F1892138;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
    v11[0] = v6;
    v11[1] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

    id v9 = [a1 CUIKFontByApplyingFeatureSettings:v8];
  }
  else
  {
    id v9 = a1;
  }

  return v9;
}

- (id)CUIKFontByApplyingFeatureSettings:()CUIKWidgetFontUtils
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 fontDescriptor];
  uint64_t v10 = *MEMORY[0x1E4FB0910];
  v11[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];

  v7 = [v5 fontDescriptorByAddingAttributes:v6];

  v8 = [(id)objc_opt_class() fontWithDescriptor:v7 size:0.0];

  return v8;
}

@end