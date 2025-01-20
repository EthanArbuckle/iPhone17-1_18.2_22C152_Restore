@interface HDQuantitySampleSeriesEntityEncoder
@end

@implementation HDQuantitySampleSeriesEntityEncoder

uint64_t __78___HDQuantitySampleSeriesEntityEncoder_addSeriesDataForHFDKey_toSample_error___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  v7 = *(void **)(a1 + 32);
  v8 = objc_alloc_init(HDCodableQuantitySeriesDatum);
  [(HDCodableQuantitySeriesDatum *)v8 setValue:a3];
  if (a4 != -1.0)
  {
    [(HDCodableQuantitySeriesDatum *)v8 setStartDate:a2];
    a2 = a2 + a4;
  }
  [(HDCodableQuantitySeriesDatum *)v8 setEndDate:a2];
  [v7 addQuantitySeriesData:v8];

  return 1;
}

uint64_t __127___HDQuantitySampleSeriesEntityEncoder_generateCodableRepresentationsForHFDKey_sample_maxBytesPerRepresentation_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setCount:a2];
}

uint64_t __127___HDQuantitySampleSeriesEntityEncoder_generateCodableRepresentationsForHFDKey_sample_maxBytesPerRepresentation_error_handler___block_invoke_2(uint64_t a1, double a2, double a3, double a4)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 32 > *(void *)(a1 + 88))
  {
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setFinal:0];
    uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
    if (!*(unsigned char *)(v8 + 24))
    {
      *(unsigned char *)(v8 + 24) = 1;
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      uint64_t v10 = *(void *)(a1 + 88);
      id v11 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      _HKInitializeLogging();
      v12 = (id)*MEMORY[0x1E4F29F18];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = [v11 sample];
        [v11 valueInCanonicalUnit];
        uint64_t v15 = v14;
        uint64_t v16 = [v11 count];
        int v17 = [v11 frozen];
        int v18 = [v11 final];
        v19 = [v11 quantitySeriesDatas];
        *(_DWORD *)buf = 138545154;
        v41 = v13;
        __int16 v42 = 2048;
        uint64_t v43 = v15;
        __int16 v44 = 2048;
        uint64_t v45 = v16;
        __int16 v46 = 1024;
        int v47 = v17;
        __int16 v48 = 1024;
        int v49 = v18;
        __int16 v50 = 2048;
        uint64_t v51 = [v19 count];
        __int16 v52 = 2048;
        uint64_t v53 = v9 + 32;
        __int16 v54 = 2048;
        uint64_t v55 = v10;
        _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "Non-final quantity sample generated %{public}@, value=%f, count=%lld, frozen=%{BOOL}d, final=%{BOOL}d, datumsCount=%lu, estimatedSize=%ld, maxSize=%ld", buf, 0x4Au);
      }
      v20 = (void *)MEMORY[0x1E4F2B3B8];
      v21 = [v11 sample];
      v22 = objc_msgSend(v20, "dataTypeWithCode:", objc_msgSend(v21, "dataType"));

      uint64_t v23 = [v22 dataObjectClass];
      uint64_t v24 = [v11 count];
      v25 = [v11 quantitySeriesDatas];
      +[HDAutoBugCaptureReporter reportNotFinalSeriesSampleWithClass:count:datumCount:reason:](HDAutoBugCaptureReporter, "reportNotFinalSeriesSampleWithClass:count:datumCount:reason:", v23, v24, [v25 count], @"generate");
    }
    uint64_t v26 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    id v27 = 0;
    uint64_t v28 = *(void *)(*(void *)(a1 + 56) + 8);
    v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = 0;

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    if (v26 == 1) {
      goto LABEL_11;
    }
    if (v26 == 2)
    {
      uint64_t v30 = *(void *)(*(void *)(a1 + 72) + 8);
      v33 = *(void **)(v30 + 40);
      v32 = (id *)(v30 + 40);
      id v31 = v33;
      if (v27) {
        id v31 = v27;
      }
      objc_storeStrong(v32, v31);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
LABEL_11:

      return 0;
    }
  }
  v35 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (!v35)
  {
    uint64_t v36 = [*(id *)(a1 + 32) copy];
    uint64_t v37 = *(void *)(*(void *)(a1 + 56) + 8);
    v38 = *(void **)(v37 + 40);
    *(void *)(v37 + 40) = v36;

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(a1 + 96);
    v35 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  }
  v39 = objc_alloc_init(HDCodableQuantitySeriesDatum);
  [(HDCodableQuantitySeriesDatum *)v39 setValue:a3];
  if (a4 != -1.0)
  {
    [(HDCodableQuantitySeriesDatum *)v39 setStartDate:a2];
    a2 = a2 + a4;
  }
  [(HDCodableQuantitySeriesDatum *)v39 setEndDate:a2];
  [v35 addQuantitySeriesData:v39];

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += 32;
  return 1;
}

@end