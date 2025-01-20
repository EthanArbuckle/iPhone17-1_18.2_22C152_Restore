@interface UIFont(AVAdditions)
+ (id)avkit_nonScalingFontWithTextStyle:()AVAdditions weight:;
+ (id)boldTimeFontOfSize:()AVAdditions;
+ (id)italicTimeFontOfSize:()AVAdditions;
+ (id)monospacedTimeFontOfSize:()AVAdditions;
+ (id)timeFontOfSize:()AVAdditions;
+ (id)timeFontWithFont:()AVAdditions;
+ (id)timeFontWithName:()AVAdditions size:;
@end

@implementation UIFont(AVAdditions)

+ (id)avkit_nonScalingFontWithTextStyle:()AVAdditions weight:
{
  v3 = (void *)MEMORY[0x1E4FB08E0];
  v4 = (void *)MEMORY[0x1E4FB1E20];
  uint64_t v5 = *MEMORY[0x1E4FB27D0];
  id v6 = a3;
  v7 = [v4 traitCollectionWithPreferredContentSizeCategory:v5];
  v8 = [v3 preferredFontForTextStyle:v6 compatibleWithTraitCollection:v7];

  v9 = (void *)MEMORY[0x1E4FB08E0];
  [v8 pointSize];
  v10 = objc_msgSend(v9, "systemFontOfSize:weight:");

  return v10;
}

+ (id)monospacedTimeFontOfSize:()AVAdditions
{
  v3 = [MEMORY[0x1E4FB08E0] monospacedDigitSystemFontOfSize:a2 weight:*MEMORY[0x1E4FB09D8]];
  v4 = [a1 timeFontWithFont:v3];

  return v4;
}

+ (id)italicTimeFontOfSize:()AVAdditions
{
  v2 = objc_msgSend(MEMORY[0x1E4FB08E0], "italicSystemFontOfSize:");
  v3 = [a1 timeFontWithFont:v2];

  return v3;
}

+ (id)boldTimeFontOfSize:()AVAdditions
{
  v2 = objc_msgSend(MEMORY[0x1E4FB08E0], "boldSystemFontOfSize:");
  v3 = [a1 timeFontWithFont:v2];

  return v3;
}

+ (id)timeFontOfSize:()AVAdditions
{
  v2 = objc_msgSend(MEMORY[0x1E4FB08E0], "systemFontOfSize:");
  v3 = [a1 timeFontWithFont:v2];

  return v3;
}

+ (id)timeFontWithName:()AVAdditions size:
{
  v2 = objc_msgSend(MEMORY[0x1E4FB08E0], "fontWithName:size:");
  v3 = [a1 timeFontWithFont:v2];

  return v3;
}

+ (id)timeFontWithFont:()AVAdditions
{
  v21[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v3 = *MEMORY[0x1E4FB0960];
    v19[0] = *MEMORY[0x1E4FB0968];
    v19[1] = v3;
    v20[0] = &unk_1F094A220;
    v20[1] = &unk_1F094A238;
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = a3;
    id v6 = [v4 dictionaryWithObjects:v20 forKeys:v19 count:2];
    v21[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

    v8 = [v5 fontDescriptor];
    uint64_t v17 = *MEMORY[0x1E4FB0910];
    v18 = v7;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v10 = [v8 fontDescriptorByAddingAttributes:v9];

    v11 = (void *)MEMORY[0x1E4FB08E0];
    [v5 pointSize];
    v12 = objc_msgSend(v10, "fontDescriptorWithSize:");
    [v5 pointSize];
    double v14 = v13;

    v15 = [v11 fontWithDescriptor:v12 size:v14];
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end