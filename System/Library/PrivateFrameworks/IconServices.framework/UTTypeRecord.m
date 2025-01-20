@interface UTTypeRecord
@end

@implementation UTTypeRecord

uint64_t __125__UTTypeRecord_IconServicesAdditions___IS_symbolProvidingRecordWithVariantKey_allowNonVariantMatch_preferHeroOverBaseSymbol___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (!*(void *)(a1 + 32))
  {
LABEL_5:
    if (*(unsigned char *)(a1 + 41))
    {
      v6 = objc_msgSend(v4, "_IS_symbolHeroName");

      if (v6) {
        goto LABEL_8;
      }
    }
    v7 = objc_msgSend(v4, "_IS_symbolName");

    if (v7) {
      goto LABEL_8;
    }
LABEL_10:
    uint64_t v8 = 0;
    goto LABEL_9;
  }
  v5 = objc_msgSend(v3, "_IS_symbolNameForVariantKey:");

  if (!v5)
  {
    if (*(void *)(a1 + 32) && !*(unsigned char *)(a1 + 40)) {
      goto LABEL_10;
    }
    goto LABEL_5;
  }
LABEL_8:
  uint64_t v8 = 1;
LABEL_9:

  return v8;
}

uint64_t __80__UTTypeRecord_IconServicesAdditions___IS_iconProvidingRecordAcceptingWildCard___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 iconDictionary];
  if ([v4 count])
  {
    if ([v3 isWildcard])
    {
      int v5 = *(unsigned __int8 *)(a1 + 32);

      if (!v5) {
        goto LABEL_6;
      }
    }
    else
    {
    }
    uint64_t v6 = 1;
    goto LABEL_9;
  }

LABEL_6:
  uint64_t v6 = 0;
LABEL_9:

  return v6;
}

void __80__UTTypeRecord_IconServicesAdditions___IS_iconProvidingRecordAcceptingWildCard___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void __125__UTTypeRecord_IconServicesAdditions___IS_symbolProvidingRecordWithVariantKey_allowNonVariantMatch_preferHeroOverBaseSymbol___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

@end