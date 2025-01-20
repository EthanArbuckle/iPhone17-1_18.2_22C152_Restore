@interface StringForPTEffectReactionType
@end

@implementation StringForPTEffectReactionType

id __bbn_StringForPTEffectReactionType_block_invoke()
{
  v2[8] = *MEMORY[0x1E4F143B8];
  v1[0] = &unk_1EFAFF078;
  v1[1] = &unk_1EFAFF090;
  v2[0] = @"ReactionThumbsUp";
  v2[1] = @"ReactionThumbsDown";
  v1[2] = &unk_1EFAFF0A8;
  v1[3] = &unk_1EFAFF0C0;
  v2[2] = @"ReactionBalloons";
  v2[3] = @"ReactionHeart";
  v1[4] = &unk_1EFAFF0D8;
  v1[5] = &unk_1EFAFF0F0;
  v2[4] = @"ReactionFireworks";
  v2[5] = @"ReactionRain";
  v1[6] = &unk_1EFAFF108;
  v1[7] = &unk_1EFAFF120;
  v2[6] = @"ReactionConfetti";
  v2[7] = @"ReactionLasers";
  bbn_StringForPTEffectReactionType_sMapReactionTypeToName = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v2 forKeys:v1 count:8];
  return (id)bbn_StringForPTEffectReactionType_sMapReactionTypeToName;
}

@end