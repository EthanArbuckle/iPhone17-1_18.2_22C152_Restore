@interface EnsureLoaded
@end

@implementation EnsureLoaded

uint64_t ___EnsureLoaded_block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = *(sqlite3_stmt **)(a2 + 8);
  int ID = CPRecordGetID();
  uint64_t result = sqlite3_bind_int(v4, 1, ID);
  int v7 = *(_DWORD *)(*(void *)(a1 + 32) + 48);
  if (v7)
  {
    v8 = *(sqlite3_stmt **)(a2 + 8);
    return sqlite3_bind_int(v8, 2, v7);
  }
  return result;
}

@end