@interface LSEnumerateAllClaimedTypesOrSchemesForBundleID
@end

@implementation LSEnumerateAllClaimedTypesOrSchemesForBundleID

void ___LSEnumerateAllClaimedTypesOrSchemesForBundleID_block_invoke(uint64_t a1)
{
  uint64_t v2 = _LSClaimGet();
  if (v2)
  {
    uint64_t v3 = v2;
    if ((*(_DWORD *)(a1 + 48) & *(unsigned __int16 *)(v2 + 14)) != 0)
    {
      if (*(_DWORD *)(v2 + 68))
      {
        if (!*(unsigned char *)(a1 + 52)) {
          goto LABEL_6;
        }
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = ___LSEnumerateAllClaimedTypesOrSchemesForBundleID_block_invoke_2;
        v9[3] = &unk_1E522DDD0;
        uint64_t v4 = *(void *)(a1 + 40);
        id v10 = *(id *)(a1 + 32);
        uint64_t v11 = v3;
        _LSEnumerateClaimedTypes(v4, v3, v9);

        if (!*(unsigned char *)(a1 + 52))
        {
LABEL_6:
          v6[0] = MEMORY[0x1E4F143A8];
          v6[1] = 3221225472;
          v6[2] = ___LSEnumerateAllClaimedTypesOrSchemesForBundleID_block_invoke_3;
          v6[3] = &unk_1E522DDD0;
          uint64_t v5 = *(void *)(a1 + 40);
          id v7 = *(id *)(a1 + 32);
          uint64_t v8 = v3;
          _LSEnumerateClaimedSchemes(v5, v3, v6);
        }
      }
    }
  }
}

uint64_t ___LSEnumerateAllClaimedTypesOrSchemesForBundleID_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(a1 + 40));
}

uint64_t ___LSEnumerateAllClaimedTypesOrSchemesForBundleID_block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, *(void *)(a1 + 40));
}

@end