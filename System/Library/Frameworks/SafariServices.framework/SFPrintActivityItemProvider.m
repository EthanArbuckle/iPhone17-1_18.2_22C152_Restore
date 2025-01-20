@interface SFPrintActivityItemProvider
@end

@implementation SFPrintActivityItemProvider

uint64_t __47___SFPrintActivityItemProvider_pdfItemProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47___SFPrintActivityItemProvider_pdfItemProvider__block_invoke_2;
  v6[3] = &unk_1E5C73380;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  return 0;
}

void __47___SFPrintActivityItemProvider_pdfItemProvider__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 344);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47___SFPrintActivityItemProvider_pdfItemProvider__block_invoke_3;
  v3[3] = &unk_1E5C767B0;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 getPDFDataForUsage:1 withCompletion:v3];
}

void __47___SFPrintActivityItemProvider_pdfItemProvider__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 328), "setSize:", objc_msgSend(v3, "length"));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end