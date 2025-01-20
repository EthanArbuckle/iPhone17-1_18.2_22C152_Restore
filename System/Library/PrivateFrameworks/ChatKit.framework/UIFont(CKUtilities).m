@interface UIFont(CKUtilities)
+ (id)__ck_emphasizedFontFromFont:()CKUtilities;
+ (id)__ck_emphasizedPreferredFontForTextStyle:()CKUtilities;
+ (id)__ck_fontForStyle:()CKUtilities weight:;
+ (id)__ck_monospacedPreferredFontForTextStyle:()CKUtilities;
+ (id)__ck_shortEmphasizedPreferredFontForTextStyle:()CKUtilities;
+ (id)__ck_shortMonospacedPreferredFontForTextStyle:()CKUtilities;
+ (id)__ck_shortPreferredFontForTextStyle:()CKUtilities;
+ (id)__ck_shortPreferredFontForTextStyle:()CKUtilities size:;
+ (uint64_t)__ck_preferredFontForStyle:()CKUtilities;
+ (uint64_t)__ck_preferredFontForStyle:()CKUtilities weight:;
- (id)__ck_fontWithWeight:()CKUtilities;
- (uint64_t)__ck_fontScaledByUserPreference;
@end

@implementation UIFont(CKUtilities)

+ (id)__ck_shortPreferredFontForTextStyle:()CKUtilities
{
  id v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "__ck_shortPreferredFontForTextStyle:size:", v3, 0.0);

  return v4;
}

+ (id)__ck_shortPreferredFontForTextStyle:()CKUtilities size:
{
  v5 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:a4 addingSymbolicTraits:0x8000 options:0];
  v6 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:a1];

  return v6;
}

+ (uint64_t)__ck_preferredFontForStyle:()CKUtilities
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:");
}

+ (id)__ck_monospacedPreferredFontForTextStyle:()CKUtilities
{
  v17[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4FB0960];
  v15[0] = *MEMORY[0x1E4FB0968];
  v15[1] = v3;
  v16[0] = &unk_1EDF16220;
  v16[1] = &unk_1EDF16238;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v16 forKeys:v15 count:2];
  v17[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];

  v8 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v5];

  uint64_t v13 = *MEMORY[0x1E4FB0910];
  v14 = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  v10 = [v8 fontDescriptorByAddingAttributes:v9];

  v11 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v10 size:0.0];

  return v11;
}

+ (id)__ck_shortMonospacedPreferredFontForTextStyle:()CKUtilities
{
  v15[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:0x8000 options:0];
  uint64_t v4 = *MEMORY[0x1E4FB0960];
  v13[0] = *MEMORY[0x1E4FB0968];
  v13[1] = v4;
  v14[0] = &unk_1EDF16220;
  v14[1] = &unk_1EDF16238;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v15[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  uint64_t v11 = *MEMORY[0x1E4FB0910];
  v12 = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  v8 = [v3 fontDescriptorByAddingAttributes:v7];

  v9 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];

  return v9;
}

+ (id)__ck_emphasizedPreferredFontForTextStyle:()CKUtilities
{
  uint64_t v3 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:2 options:0];
  uint64_t v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];

  return v4;
}

+ (id)__ck_shortEmphasizedPreferredFontForTextStyle:()CKUtilities
{
  uint64_t v3 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:32770 options:0];
  uint64_t v4 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v3 size:0.0];

  return v4;
}

+ (id)__ck_emphasizedFontFromFont:()CKUtilities
{
  id v3 = a3;
  uint64_t v4 = [v3 fontDescriptor];
  uint64_t v5 = [v4 symbolicTraits] | 2;

  v6 = [v3 fontDescriptor];

  v7 = [v6 fontDescriptorWithSymbolicTraits:v5];

  v8 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v7 size:0.0];

  return v8;
}

+ (id)__ck_fontForStyle:()CKUtilities weight:
{
  v0 = objc_msgSend(MEMORY[0x1E4FB08E8], "preferredFontDescriptorWithTextStyle:");
  v1 = (void *)MEMORY[0x1E4FB08E0];
  [v0 pointSize];
  v2 = objc_msgSend(v1, "systemFontOfSize:weight:");

  return v2;
}

+ (uint64_t)__ck_preferredFontForStyle:()CKUtilities weight:
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "_preferredFontForTextStyle:weight:");
}

- (uint64_t)__ck_fontScaledByUserPreference
{
  v2 = +[CKUIBehavior sharedBehaviors];
  id v3 = [v2 defaultBalloonTextFont];
  [v3 pointSize];
  double v5 = v4;

  [a1 pointSize];
  double v7 = v6 + 13.0 - v5;

  return [a1 fontWithSize:v7];
}

- (id)__ck_fontWithWeight:()CKUtilities
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v12 = *MEMORY[0x1E4FB0950];
  uint64_t v10 = *MEMORY[0x1E4FB09F0];
  v2 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v11 = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  v13[0] = v3;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];

  double v5 = [a1 fontDescriptor];
  double v6 = [v5 fontDescriptorByAddingAttributes:v4];

  double v7 = (void *)MEMORY[0x1E4FB08E0];
  [a1 pointSize];
  v8 = objc_msgSend(v7, "fontWithDescriptor:size:", v6);

  return v8;
}

@end