@interface LSPlistDataGetValuesForKeys
@end

@implementation LSPlistDataGetValuesForKeys

void ___LSPlistDataGetValuesForKeys_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = a2;
  uint64_t v6 = (uint64_t)v5;
  if (*(unsigned char *)(a1 + 40))
  {
    v8 = v5;
    uint64_t v7 = _LSPlistCompactString(v5, 0);

    uint64_t v6 = v7;
  }
  id v9 = (id)v6;
  -[_LSPlistHint setCachedValue:forKey:](*(void *)(a1 + 32), a3, v6);
}

@end