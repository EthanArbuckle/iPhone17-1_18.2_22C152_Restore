@interface UITextView(MUXCrossPlatformOperations)
+ (id)_mapsui_defaultTextView;
@end

@implementation UITextView(MUXCrossPlatformOperations)

+ (id)_mapsui_defaultTextView
{
  id v0 = objc_alloc(MEMORY[0x1E4FB1DD8]);
  v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v1 setEditable:0];
  [v1 setScrollEnabled:0];
  objc_msgSend(v1, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  v2 = [MEMORY[0x1E4FB1618] clearColor];
  [v1 setBackgroundColor:v2];

  v3 = [v1 textContainer];
  [v3 setLineFragmentPadding:0.0];

  return v1;
}

@end