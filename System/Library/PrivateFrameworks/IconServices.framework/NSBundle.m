@interface NSBundle
@end

@implementation NSBundle

uint64_t __56__NSBundle_IconServicesAdditions____IS__frameworkBundle__block_invoke()
{
  __IS__frameworkBundle_frameworkBundle = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.IconServices"];
  return MEMORY[0x1F41817F8]();
}

void __62__NSBundle_IconServicesAdditions____IS__iconsetResourceBundle__block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/CoreServices/IconsetResources.bundle"];
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleWithURL:v2];
  v1 = (void *)__IS__iconsetResourceBundle_resourceBundle;
  __IS__iconsetResourceBundle_resourceBundle = v0;
}

@end