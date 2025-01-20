@interface UIFont
@end

@implementation UIFont

id __62__UIFont_NUIAccessibilitySupport___nui_isAccessibilityEnabled__block_invoke()
{
  v3[5] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = *MEMORY[0x1E4F43778];
  v3[0] = *MEMORY[0x1E4F43780];
  v3[1] = v0;
  uint64_t v1 = *MEMORY[0x1E4F43768];
  v3[2] = *MEMORY[0x1E4F43770];
  v3[3] = v1;
  v3[4] = *MEMORY[0x1E4F43760];
  id result = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
  +[UIFont(NUIAccessibilitySupport) _nui_isAccessibilityEnabled]::largeSizes = (uint64_t)result;
  return result;
}

@end