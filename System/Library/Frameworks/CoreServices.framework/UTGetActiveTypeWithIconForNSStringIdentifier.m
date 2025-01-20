@interface UTGetActiveTypeWithIconForNSStringIdentifier
@end

@implementation UTGetActiveTypeWithIconForNSStringIdentifier

void ___UTGetActiveTypeWithIconForNSStringIdentifier_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  v6 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = _UTGetActiveTypeForCFStringIdentifier(*(void **)(a1 + 32), v6, (_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8)+ 24));
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v5)
  {
    if (*(_DWORD *)(v5 + 28)
      || (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = _UTTypeSearchConformsToTypesCommon(*(void *)(a1 + 32), *(_DWORD *)(*(void *)(*(void *)(a1 + 48)+ 8)+ 24), 32, (uint64_t)typeHasIconFile, 0, (_DWORD *)(*(void *)(*(void *)(a1 + 48)+ 8)+ 24)), (uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) != 0))
    {
      if (*(_DWORD *)(v5 + 28)) {
        *a3 = 1;
      }
    }
  }
}

@end