@interface HUQuickControlSensorSectionLayoutOptions
+ (id)defaultOptionsForViewSize:(CGSize)a3;
@end

@implementation HUQuickControlSensorSectionLayoutOptions

+ (id)defaultOptionsForViewSize:(CGSize)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___HUQuickControlSensorSectionLayoutOptions;
  v3 = objc_msgSendSuper2(&v8, sel_defaultOptionsForViewSize_, a3.width, a3.height);
  uint64_t v4 = [v3 viewSizeSubclass];
  v11[0] = &unk_1F19B4688;
  v11[1] = &unk_1F19B46A0;
  v12[0] = &unk_1F19B6230;
  v12[1] = &unk_1F19B6240;
  v11[2] = &unk_1F19B46B8;
  v12[2] = &unk_1F19B6250;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  objc_msgSend(v3, "setMinimumNavBarToControlsSpacing:", HUConstantFloatForViewSizeSubclass(v4, v5));

  [v3 setRowSpacing:48.0];
  v9[0] = &unk_1F19B4688;
  v9[1] = &unk_1F19B46A0;
  v10[0] = &unk_1F19B46D0;
  v10[1] = &unk_1F19B46E8;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  objc_msgSend(v3, "setThermostatSectionSpacingOverride:", HUConstantFloatForViewSizeSubclass(v4, v6));

  [v3 setInteritemSpacingForExtraSmallControlSize:30.0];
  [v3 setInteritemSpacingForSmallControlSize:30.0];
  [v3 setInteritemSpacingForRegularControlSize:30.0];
  [v3 setInteritemSpacingForLargeControlSize:30.0];

  return v3;
}

@end