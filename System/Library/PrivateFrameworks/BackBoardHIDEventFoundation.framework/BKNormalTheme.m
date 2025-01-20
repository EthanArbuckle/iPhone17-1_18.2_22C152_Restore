@interface BKNormalTheme
@end

@implementation BKNormalTheme

void ___BKNormalTheme_block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"single";
  v2[1] = @"top";
  v3[0] = @"  ●─";
  v3[1] = @"┌─●─";
  v2[2] = @"middle";
  v2[3] = @"bottom";
  v3[2] = @"├─●─";
  v3[3] = @"└─●─";
  v2[4] = @"indent";
  v2[5] = @"dropline";
  v3[4] = @"  ";
  v3[5] = @"│ ";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)_BKNormalTheme_dictionary;
  _BKNormalTheme_dictionary = v0;
}

@end