@interface PFUbiquityRecordImportOperation
@end

@implementation PFUbiquityRecordImportOperation

PFUbiquityKnowledgeVector *__40___PFUbiquityRecordImportOperation_main__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    v3 = *(void **)(v2 + 264);
  }
  else {
    v3 = 0;
  }
  result = -[PFUbiquityKnowledgeVector initWithStoreKnowledgeVectorDictionary:]([PFUbiquityKnowledgeVector alloc], "initWithStoreKnowledgeVectorDictionary:", -[NSSQLCore fetchUbiquityKnowledgeVector](v3));
  *(void *)(*(void *)(a1 + 32) + 384) = result;
  return result;
}

void __40___PFUbiquityRecordImportOperation_main__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    v3 = *(void **)(v2 + 264);
  }
  else {
    v3 = 0;
  }
  id v9 = (id)objc_msgSend((id)objc_msgSend(v3, "metadata"), "mutableCopy");
  [v9 setObject:MEMORY[0x1E4F1CC38] forKey:@"PFUbiquitySetupCheckForFork"];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    v5 = *(void **)(v4 + 264);
  }
  else {
    v5 = 0;
  }
  [v5 setMetadata:v9];
  v6 = objc_alloc_init(NSSaveChangesRequest);
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    v8 = *(void **)(v7 + 264);
  }
  else {
    v8 = 0;
  }
  [v8 executeRequest:v6 withContext:0 error:0];
}

void __40___PFUbiquityRecordImportOperation_main__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    v3 = *(void **)(v2 + 264);
  }
  else {
    v3 = 0;
  }
  id v9 = (id)objc_msgSend((id)objc_msgSend(v3, "metadata"), "mutableCopy");
  [v9 setObject:MEMORY[0x1E4F1CC38] forKey:@"PFUbiquitySetupCheckForFork"];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    v5 = *(void **)(v4 + 264);
  }
  else {
    v5 = 0;
  }
  [v5 setMetadata:v9];
  v6 = objc_alloc_init(NSSaveChangesRequest);
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    v8 = *(void **)(v7 + 264);
  }
  else {
    v8 = 0;
  }
  [v8 executeRequest:v6 withContext:0 error:0];
}

uint64_t __87___PFUbiquityRecordImportOperation_processObjects_withState_andImportContext_outError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = (void *)[a2 transactionDate];
  uint64_t v5 = [a3 transactionDate];

  return [v4 compare:v5];
}

uint64_t __87___PFUbiquityRecordImportOperation_processObjects_withState_andImportContext_outError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    uint64_t v3 = 0;
    if (!a2) {
      return -[PFUbiquityKnowledgeVector conflictsWithKnowledgeVector:](v3, (id *)a2);
    }
    goto LABEL_3;
  }
  uint64_t v3 = *(void *)(v2 + 32);
  if (a2) {
LABEL_3:
  }
    a2 = *(void *)(a2 + 56);
  return -[PFUbiquityKnowledgeVector conflictsWithKnowledgeVector:](v3, (id *)a2);
}

@end