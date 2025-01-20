@interface OSLogChunkStore
@end

@implementation OSLogChunkStore

BOOL __54___OSLogChunkStore_enumerateChunksInRange_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  int v3 = *(_DWORD *)a2;
  if (*(void *)(*(void *)(a1 + 32) + 8) == a2)
  {
    if (v3 != 4096 || *(void *)(a2 + 8) <= 0x27uLL) {
      return 0;
    }
  }
  else
  {
    if (v3 > 7679)
    {
      switch(v3)
      {
        case 24577:
        case 24578:
        case 24579:
        case 24580:
          if (!*(_DWORD *)(a2 + 4)) {
            goto LABEL_17;
          }
          return 1;
        case 24581:
        case 24582:
        case 24583:
        case 24584:
        case 24585:
        case 24586:
        case 24590:
        case 24591:
          return 1;
        case 24587:
          if ((*(_DWORD *)(a2 + 4) - 14) > 3) {
            return 1;
          }
          goto LABEL_17;
        case 24588:
        case 24592:
          if ((*(_DWORD *)(a2 + 4) - 14) >= 4) {
            return 1;
          }
          goto LABEL_17;
        case 24589:
          goto LABEL_17;
        default:
          if (v3 != 7680 && v3 != 0x2000) {
            return 1;
          }
          goto LABEL_17;
      }
    }
    if (v3 > 7167)
    {
      BOOL v4 = v3 == 7168;
      int v5 = 7424;
    }
    else
    {
      BOOL v4 = v3 == 4096;
      int v5 = 6912;
    }
    if (!v4 && v3 != v5) {
      return 1;
    }
  }
LABEL_17:
  v7 = (void *)MEMORY[0x1A622D720]();
  int v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  return v8 != 0;
}

@end