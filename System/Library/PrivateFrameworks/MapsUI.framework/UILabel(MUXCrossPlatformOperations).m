@interface UILabel(MUXCrossPlatformOperations)
+ (id)_mapsui_defaultLabel;
@end

@implementation UILabel(MUXCrossPlatformOperations)

+ (id)_mapsui_defaultLabel
{
  id v0 = objc_alloc(MEMORY[0x1E4FB1930]);
  v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  return v1;
}

@end