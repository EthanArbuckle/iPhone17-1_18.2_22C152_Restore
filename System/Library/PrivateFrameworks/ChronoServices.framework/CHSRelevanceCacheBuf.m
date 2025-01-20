@interface CHSRelevanceCacheBuf
@end

@implementation CHSRelevanceCacheBuf

id __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke(uint64_t a1, unsigned int a2)
{
  v2 = *(unsigned int **)(a1 + 32);
  if (*v2 <= a2) {
    __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke_cold_1();
  }
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithLongLong:*((unsigned __int8 *)v2 + a2 + 4)];
  return v3;
}

_CHSWidgetRelevancePropertiesBuf *__31___CHSRelevanceCacheBuf_groups__block_invoke(uint64_t a1, unsigned int a2)
{
  v4 = [_CHSWidgetRelevancePropertiesBuf alloc];
  v5 = *(unsigned int **)(a1 + 40);
  if (*v5 <= a2) {
    __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke_cold_1();
  }
  v6 = [(_CHSWidgetRelevancePropertiesBuf *)v4 initWithBufRef:*(void *)(*(void *)(a1 + 32) + 8) cppPointer:(char *)&v5[a2 + 1] + v5[a2 + 1]];
  return v6;
}

void __60___CHSRelevanceCacheBuf_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 deepCopyUsingBufferBuilder:*(void *)(a1 + 40)];
  objc_msgSend(v2, "addObject:");
}

void __60___CHSRelevanceCacheBuf_deepCopyUsingBufferBuilder_changes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32)) {
    objc_msgSend(v3, "setArchivedObjects:");
  }
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v3, "setGroups:");
  }
}

uint64_t __41___CHSRelevanceCacheBuf_verifyUTF8Fields__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 verifyUTF8Fields];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

void __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke_cold_1()
{
}

@end