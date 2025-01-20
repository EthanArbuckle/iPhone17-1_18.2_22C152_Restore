@interface CHSWidgetRelevancePropertiesBuf
@end

@implementation CHSWidgetRelevancePropertiesBuf

_CHSWidgetRelevanceBuf *__46___CHSWidgetRelevancePropertiesBuf_relevances__block_invoke(uint64_t a1, unsigned int a2)
{
  v4 = [_CHSWidgetRelevanceBuf alloc];
  v5 = *(unsigned int **)(a1 + 40);
  if (*v5 <= a2) {
    __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke_cold_1();
  }
  v6 = [(_CHSWidgetRelevanceBuf *)v4 initWithBufRef:*(void *)(*(void *)(a1 + 32) + 8) cppPointer:(char *)&v5[a2 + 1] + v5[a2 + 1]];
  return v6;
}

void __71___CHSWidgetRelevancePropertiesBuf_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 deepCopyUsingBufferBuilder:*(void *)(a1 + 40)];
  objc_msgSend(v2, "addObject:");
}

void __71___CHSWidgetRelevancePropertiesBuf_deepCopyUsingBufferBuilder_changes___block_invoke_2(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v9, "setExtensionIdentity:");
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v9, "setKind:");
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3)
  {
    if (*(unsigned char *)(v3 + 24) == 1)
    {
      uint64_t v4 = *(unsigned __int8 *)(v3 + 25) != 0;
      goto LABEL_10;
    }
    if (*(unsigned char *)(v3 + 24)) {
      goto LABEL_11;
    }
  }
  uint64_t v4 = [*(id *)(a1 + 56) supportsBackgroundRefresh];
LABEL_10:
  [v9 setSupportsBackgroundRefresh:v4];
LABEL_11:
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5)
  {
    if (*(unsigned char *)(v5 + 26) == 1)
    {
      uint64_t v6 = *(unsigned __int8 *)(v5 + 27) != 0;
      goto LABEL_16;
    }
    if (*(unsigned char *)(v5 + 26)) {
      goto LABEL_17;
    }
  }
  uint64_t v6 = [*(id *)(a1 + 56) isDeletion];
LABEL_16:
  [v9 setIsDeletion:v6];
LABEL_17:
  uint64_t v7 = *(void *)(a1 + 48);
  if (v7)
  {
    if (*(unsigned char *)(v7 + 28) == 1)
    {
      double v8 = *(double *)(v7 + 32);
      goto LABEL_22;
    }
    if (*(unsigned char *)(v7 + 28)) {
      goto LABEL_23;
    }
  }
  [*(id *)(a1 + 56) lastRelevanceUpdate];
LABEL_22:
  [v9 setLastRelevanceUpdate:v8];
LABEL_23:
  if (*(void *)(a1 + 64)) {
    objc_msgSend(v9, "setRelevances:");
  }
}

uint64_t __52___CHSWidgetRelevancePropertiesBuf_verifyUTF8Fields__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 verifyUTF8Fields];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

@end