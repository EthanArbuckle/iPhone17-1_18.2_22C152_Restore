@interface NSError
@end

@implementation NSError

uint64_t __47__NSError_BacklightServices__bls_loggingString__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__NSError_BacklightServices__bls_loggingString__block_invoke_2;
  v3[3] = &unk_1E6106F58;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 appendCustomFormatWithName:0 block:v3];
}

void __47__NSError_BacklightServices__bls_loggingString__block_invoke_2(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 localizedFailureReason];
  v6 = *(void **)(a1 + 32);
  id v12 = (id)v5;
  if (v5)
  {
    uint64_t v7 = [v6 code];
    v8 = [*(id *)(a1 + 32) domain];
    v9 = [*(id *)(a1 + 32) localizedDescription];
    [v4 appendFormat:@"%@ (%ld:%@) \"%@\"", v12, v7, v8, v9];
  }
  else
  {
    v8 = [v6 localizedDescription];
    uint64_t v10 = [*(id *)(a1 + 32) code];
    v9 = [*(id *)(a1 + 32) domain];
    [v4 appendFormat:@"%@ (%ld:%@)", v8, v10, v9, v11];
  }
}

void __47__NSError_BacklightServices__bls_loggingString__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "bls_shortLoggingString");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = (id)[v2 appendObject:v4 withName:0];
}

void __52__NSError_BacklightServices__bls_shortLoggingString__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v3 localizedFailureReason];
  id v9 = v5;
  if (!v5)
  {
    uint64_t v5 = [*(id *)(a1 + 32) localizedDescription];
  }
  uint64_t v6 = [*(id *)(a1 + 32) code];
  uint64_t v7 = [*(id *)(a1 + 32) domain];
  [v4 appendFormat:@"\"%@\"(%ld:%@)", v5, v6, v7];

  v8 = v9;
  if (!v9)
  {

    v8 = 0;
  }
}

@end