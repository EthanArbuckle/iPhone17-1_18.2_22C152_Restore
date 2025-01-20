@interface CUICatalog
@end

@implementation CUICatalog

uint64_t __60__CUICatalog_IconServicesAdditions___IS_coreGlyphsBundleURL__block_invoke()
{
  _IS_coreGlyphsBundleURL_url = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/System/Library/CoreServices/CoreGlyphs.bundle"];
  return MEMORY[0x1F41817F8]();
}

void *__55__CUICatalog_IconServicesAdditions__idiomsForPlatform___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 > 7)
  {
    switch(a2)
    {
      case 8:
        return &unk_1F064B0B0;
      case 16:
        return &unk_1F064B0C8;
      case 32:
        return &unk_1F064B0E0;
    }
    return (void *)MEMORY[0x1E4F1CBF0];
  }
  if ((unint64_t)(a2 - 1) < 2) {
    return &unk_1F064B068;
  }
  if (a2 != 4) {
    return (void *)MEMORY[0x1E4F1CBF0];
  }
  if (objc_msgSend(*(id *)(a1 + 32), "nativeIdiom", v2, v3) == 1) {
    return &unk_1F064B080;
  }
  else {
    return &unk_1F064B098;
  }
}

@end