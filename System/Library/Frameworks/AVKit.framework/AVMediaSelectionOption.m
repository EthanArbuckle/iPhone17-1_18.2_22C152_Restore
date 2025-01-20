@interface AVMediaSelectionOption
@end

@implementation AVMediaSelectionOption

uint64_t __55__AVMediaSelectionOption_AVAdditions__avkit_autoOption__block_invoke()
{
  v0 = objc_alloc_init(AVCustomMediaSelectionOption);
  uint64_t v1 = avkit_autoOption_mediaSelectionAutoOption;
  avkit_autoOption_mediaSelectionAutoOption = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

uint64_t __54__AVMediaSelectionOption_AVAdditions__avkit_offOption__block_invoke()
{
  v0 = objc_alloc_init(AVCustomMediaSelectionOption);
  uint64_t v1 = avkit_offOption_mediaSelectionOffOption;
  avkit_offOption_mediaSelectionOffOption = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end