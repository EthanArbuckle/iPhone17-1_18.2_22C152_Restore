@interface UIVisualEffect
@end

@implementation UIVisualEffect

void __53__UIVisualEffect_HUAdditions__hu_dashboardBarEffects__block_invoke_2()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F428C0] colorEffectLuminanceCurveMap:&unk_1F19B59C0 blendingAmount:0.18];
  v6[0] = v0;
  v5[6] = xmmword_1EA11FDC0;
  v5[7] = unk_1EA11FDD0;
  v5[8] = xmmword_1EA11FDE0;
  v5[9] = unk_1EA11FDF0;
  v5[2] = xmmword_1EA11FD80;
  v5[3] = unk_1EA11FD90;
  v5[4] = xmmword_1EA11FDA0;
  v5[5] = unk_1EA11FDB0;
  v5[0] = HUDashboardBarColorMatrix;
  v5[1] = unk_1EA11FD70;
  v1 = [MEMORY[0x1E4F428C0] colorEffectMatrix:v5];
  v6[1] = v1;
  v2 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:32.0];
  v6[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  v4 = (void *)qword_1EBA47948;
  qword_1EBA47948 = v3;
}

void __62__UIVisualEffect_HUAdditions__hu_gridCellBackgroundOffEffects__block_invoke_2()
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F428C0] colorEffectLuminanceCurveMap:&unk_1F19B59F0 blendingAmount:0.24];
  v6[0] = v0;
  v5[6] = xmmword_1EA11FE60;
  v5[7] = unk_1EA11FE70;
  v5[8] = xmmword_1EA11FE80;
  v5[9] = unk_1EA11FE90;
  v5[2] = xmmword_1EA11FE20;
  v5[3] = unk_1EA11FE30;
  v5[4] = xmmword_1EA11FE40;
  v5[5] = unk_1EA11FE50;
  v5[0] = HUGridCellBackgroundOffColorMatrix;
  v5[1] = unk_1EA11FE10;
  v1 = [MEMORY[0x1E4F428C0] colorEffectMatrix:v5];
  v6[1] = v1;
  v2 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:20.0];
  v6[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  v4 = (void *)qword_1EBA47968;
  qword_1EBA47968 = v3;
}

void __61__UIVisualEffect_HUAdditions__hu_gridCellBackgroundOnEffects__block_invoke_2()
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F427D8] effectWithStyle:14];
  v3[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  v2 = (void *)qword_1EBA47978;
  qword_1EBA47978 = v1;
}

void __68__UIVisualEffect_HUAdditions__hu_categoryDashboardBackgroundEffects__block_invoke_2()
{
  void v6[4] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F428C0] colorEffectLuminanceCurveMap:&unk_1F19B59D8 blendingAmount:0.25];
  v6[0] = v0;
  uint64_t v1 = [MEMORY[0x1E4F428C0] colorEffectSaturate:1.2];
  v6[1] = v1;
  v2 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:32.0];
  v6[2] = v2;
  uint64_t v3 = [MEMORY[0x1E4F428C0] colorEffectBrightness:-0.1];
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  v5 = (void *)qword_1EBA47958;
  qword_1EBA47958 = v4;
}

@end