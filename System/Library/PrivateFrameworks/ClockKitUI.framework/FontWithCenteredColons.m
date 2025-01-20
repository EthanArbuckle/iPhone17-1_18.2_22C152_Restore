@interface FontWithCenteredColons
@end

@implementation FontWithCenteredColons

void ___FontWithCenteredColons_block_invoke()
{
  v4[2] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4FB2888];
  v3[0] = *MEMORY[0x1E4FB2898];
  v3[1] = v0;
  v4[0] = &unk_1F2A6A650;
  v4[1] = &unk_1F2A6A668;
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:2];
  v2 = (void *)_FontWithCenteredColons___centeredColonsFeatureSetting;
  _FontWithCenteredColons___centeredColonsFeatureSetting = v1;
}

@end