@interface UIFont
@end

@implementation UIFont

void __107__UIFont_MKCrossPlatformExtras___mapkit_scaledValueForValue_scalingForMacIdiom_respectingTraitEnvironment___block_invoke()
{
  id v0 = [MEMORY[0x1E4F42948] currentDevice];
  qword_1EB315D50 = [v0 userInterfaceIdiom];
}

void __42__UIFont_MKExtras___mapkit_ax3TextEnabled__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F43768];
  v3[0] = *MEMORY[0x1E4F43770];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E4F43760];
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  v2 = (void *)_MergedGlobals_135;
  _MergedGlobals_135 = v1;
}

void __52__UIFont_MKExtras___mapkit_accessibilityTextEnabled__block_invoke()
{
  v4[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F43778];
  v4[0] = *MEMORY[0x1E4F43780];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F43768];
  v4[2] = *MEMORY[0x1E4F43770];
  v4[3] = v1;
  v4[4] = *MEMORY[0x1E4F43760];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:5];
  v3 = (void *)qword_1EB315D08;
  qword_1EB315D08 = v2;
}

@end