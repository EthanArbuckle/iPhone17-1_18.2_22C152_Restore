@interface RegisterThemeProvider
@end

@implementation RegisterThemeProvider

void ___RegisterThemeProvider_block_invoke(uint64_t a1, NSMapTable *table, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11 = _RegisterThemeProvider_theme_seq;
  if (_RegisterThemeProvider_theme_seq != -1) {
    goto LABEL_4;
  }
  _RegisterThemeProvider_theme_seq = 100;
  _CUILog(3, (uint64_t)"CoreUI: _RegisterThemeProvider() has registered a NSUIntegerMax number of themeRefs attempting to find a usable version", a3, a4, a5, a6, a7, a8, v13);
  while (1)
  {
    uint64_t v11 = _RegisterThemeProvider_theme_seq;
LABEL_4:
    _RegisterThemeProvider_theme_seq = v11 + 1;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11 + 1;
    v12 = *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v12 == (const void *)-1) {
      break;
    }
    if (!NSMapGet(table, v12))
    {
      NSMapInsertKnownAbsent(table, *(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 24), *(const void **)(a1 + 32));
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) != -1) {
        return;
      }
      break;
    }
  }
  _CUILog(4, (uint64_t)"CoreUI: _RegisterThemeProvider() has not been able to find a new unique themeRef", a3, a4, a5, a6, a7, a8, a9);
}

@end