@interface HUQuickControlUtilities
+ (BOOL)shouldAlwaysDisplayQuickControlAsSwitch:(id)a3;
+ (BOOL)shouldDisplayQuickControlAsPushButton:(id)a3 preferredControl:(unint64_t)a4;
+ (id)backgroundColorForUserInterfaceStyle:(int64_t)a3;
+ (unint64_t)iconSizeForQuickControlSize:(unint64_t)a3;
+ (unint64_t)quickControlStepperViewSizeForViewSizeSubclass:(int64_t)a3;
+ (unint64_t)sliderQuickControlSizeForViewSizeSubclass:(int64_t)a3;
@end

@implementation HUQuickControlUtilities

+ (unint64_t)quickControlStepperViewSizeForViewSizeSubclass:(int64_t)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = &unk_1F19B3CE0;
  v7[1] = &unk_1F19B3D10;
  v8[0] = &unk_1F19B3CF8;
  v8[1] = &unk_1F19B3D28;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  unint64_t v5 = HUConstantIntegerForViewSizeSubclass(a3, v4);

  return v5;
}

+ (unint64_t)sliderQuickControlSizeForViewSizeSubclass:(int64_t)a3
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = &unk_1F19B3CE0;
  v7[1] = &unk_1F19B3D10;
  v8[0] = &unk_1F19B3CF8;
  v8[1] = &unk_1F19B3D40;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];
  unint64_t v5 = HUConstantIntegerForViewSizeSubclass(a3, v4);

  return v5;
}

+ (unint64_t)iconSizeForQuickControlSize:(unint64_t)a3
{
  unint64_t v3 = 2;
  if (a3 == 1) {
    unint64_t v3 = 3;
  }
  if (a3) {
    return v3;
  }
  else {
    return 4;
  }
}

+ (id)backgroundColorForUserInterfaceStyle:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E4F428B8], "systemBackgroundColor", a3);
}

+ (BOOL)shouldAlwaysDisplayQuickControlAsSwitch:(id)a3
{
  uint64_t v3 = qword_1EBA477D8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_1EBA477D8, &__block_literal_global_52);
  }
  unint64_t v5 = [v4 valueSource];

  v6 = [v5 primaryServiceDescriptor];
  v7 = [v6 serviceType];

  LOBYTE(v6) = [(id)_MergedGlobals_617 containsObject:v7];
  return (char)v6;
}

void __67__HUQuickControlUtilities_shouldAlwaysDisplayQuickControlAsSwitch___block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F2DF08];
  v3[0] = *MEMORY[0x1E4F2DED8];
  v3[1] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:2];
  v2 = (void *)_MergedGlobals_617;
  _MergedGlobals_617 = v1;
}

+ (BOOL)shouldDisplayQuickControlAsPushButton:(id)a3 preferredControl:(unint64_t)a4
{
  id v5 = a3;
  v6 = [v5 valueSource];
  v7 = [v6 primaryServiceDescriptor];
  v8 = [v7 serviceType];

  if ([v8 isEqualToString:*MEMORY[0x1E4F2DEF0]])
  {
    BOOL v9 = 1;
  }
  else
  {
    int v10 = [(id)objc_opt_class() shouldAlwaysDisplayQuickControlAsSwitch:v5] ^ 1;
    if (a4 == 1) {
      BOOL v9 = v10;
    }
    else {
      BOOL v9 = 0;
    }
  }

  return v9;
}

@end