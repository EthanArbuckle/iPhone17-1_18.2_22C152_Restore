@interface HKCDADocumentSample
@end

@implementation HKCDADocumentSample

void __106__HKCDADocumentSample_HKDataMetadataSampleExtensions__fetchDetailedReportWithHealthStore_reportDataBlock___block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v22 = a2;
  id v9 = a3;
  id v10 = a5;
  if (v9)
  {
    if (a4)
    {
      v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      if (!v11) {
        goto LABEL_10;
      }
      uint64_t v12 = [v11 document];
      if (!v12) {
        goto LABEL_10;
      }
      v13 = (void *)v12;
      v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) document];
      v15 = [v14 documentData];

      if (v15)
      {
        v16 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) document];
        v17 = [v16 documentData];

        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      else
      {
LABEL_10:
        v21 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"CDA sample missing document");
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      }
    }
    else if ([v9 count] == 1)
    {
      uint64_t v18 = [v9 objectAtIndex:0];
      uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
      v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

@end