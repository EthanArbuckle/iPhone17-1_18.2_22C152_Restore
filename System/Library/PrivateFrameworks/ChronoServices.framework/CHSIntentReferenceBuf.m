@interface CHSIntentReferenceBuf
@end

@implementation CHSIntentReferenceBuf

id __36___CHSIntentReferenceBuf_intentData__block_invoke(uint64_t a1, unsigned int a2)
{
  v2 = *(unsigned int **)(a1 + 32);
  if (*v2 <= a2) {
    __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke_cold_1();
  }
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithLongLong:*((unsigned __int8 *)v2 + a2 + 4)];
  return v3;
}

id __36___CHSIntentReferenceBuf_schemaData__block_invoke(uint64_t a1, unsigned int a2)
{
  v2 = *(unsigned int **)(a1 + 32);
  if (*v2 <= a2) {
    __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke_cold_1();
  }
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithLongLong:*((unsigned __int8 *)v2 + a2 + 4)];
  return v3;
}

id __43___CHSIntentReferenceBuf_partialIntentData__block_invoke(uint64_t a1, unsigned int a2)
{
  v2 = *(unsigned int **)(a1 + 32);
  if (*v2 <= a2) {
    __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke_cold_1();
  }
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithLongLong:*((unsigned __int8 *)v2 + a2 + 4)];
  return v3;
}

void __61___CHSIntentReferenceBuf_deepCopyUsingBufferBuilder_changes___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    if (*(unsigned char *)(v3 + 8) == 1)
    {
      uint64_t v4 = *(void *)(v3 + 16);
      goto LABEL_6;
    }
    if (*(unsigned char *)(v3 + 8)) {
      goto LABEL_7;
    }
  }
  uint64_t v4 = [*(id *)(a1 + 40) stableHash];
LABEL_6:
  [v5 setStableHash:v4];
LABEL_7:
  if (*(void *)(a1 + 48)) {
    objc_msgSend(v5, "setIntentData:");
  }
  if (*(void *)(a1 + 56)) {
    objc_msgSend(v5, "setSchemaData:");
  }
  if (*(void *)(a1 + 64)) {
    objc_msgSend(v5, "setPartialIntentData:");
  }
}

@end