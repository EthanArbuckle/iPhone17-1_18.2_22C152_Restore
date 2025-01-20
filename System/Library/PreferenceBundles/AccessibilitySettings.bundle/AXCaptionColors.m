@interface AXCaptionColors
@end

@implementation AXCaptionColors

void __AXCaptionColors_block_invoke(id a1)
{
  v1 = (void *)AXCaptionColors_WindowColors;
  AXCaptionColors_WindowColors = (uint64_t)&off_22C080;

  v2 = (void *)AXCaptionColors_TextColors;
  AXCaptionColors_TextColors = (uint64_t)&off_22C158;
}

@end