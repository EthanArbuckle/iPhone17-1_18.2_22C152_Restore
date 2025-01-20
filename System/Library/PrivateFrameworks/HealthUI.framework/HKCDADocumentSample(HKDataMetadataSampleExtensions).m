@interface HKCDADocumentSample(HKDataMetadataSampleExtensions)
- (uint64_t)hasAssociatedReport;
- (void)fetchDetailedReportWithHealthStore:()HKDataMetadataSampleExtensions reportDataBlock:;
@end

@implementation HKCDADocumentSample(HKDataMetadataSampleExtensions)

- (uint64_t)hasAssociatedReport
{
  return 1;
}

- (void)fetchDetailedReportWithHealthStore:()HKDataMetadataSampleExtensions reportDataBlock:
{
  id v6 = a3;
  v7 = a4;
  v8 = [a1 document];
  v9 = v8;
  if (v8 && ([v8 documentData], (uint64_t v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = (void *)v10;
    v7[2](v7, v10, 0);
  }
  else
  {
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = __Block_byref_object_copy__5;
    v25[4] = __Block_byref_object_dispose__5;
    id v26 = 0;
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    v21 = __106__HKCDADocumentSample_HKDataMetadataSampleExtensions__fetchDetailedReportWithHealthStore_reportDataBlock___block_invoke;
    v22 = &unk_1E6D52638;
    v24 = v25;
    v23 = v7;
    v12 = _Block_copy(&v19);
    v13 = (void *)MEMORY[0x1E4F2B3C0];
    v14 = objc_msgSend(a1, "UUID", v19, v20, v21, v22);
    v15 = [v13 predicateForObjectWithUUID:v14];

    id v16 = objc_alloc(MEMORY[0x1E4F2AF70]);
    v17 = [MEMORY[0x1E4F2B2C0] documentTypeForIdentifier:*MEMORY[0x1E4F29A80]];
    v18 = (void *)[v16 initWithDocumentType:v17 predicate:v15 limit:0 sortDescriptors:0 includeDocumentData:1 resultsHandler:v12];

    [v6 executeQuery:v18];
    _Block_object_dispose(v25, 8);
  }
}

@end