@interface LCFCoreMLFeatureProviderUtils
+ (id)toMultiArrayTypeBatchProvider:(id)a3 srcFeatureNames:(id)a4 srcLabelName:(id)a5 destFeatureName:(id)a6 destLabelName:(id)a7;
+ (id)toMultiArrayTypeFeatureProvider:(id)a3 srcFeatureNames:(id)a4 srcLabelName:(id)a5 destFeatureName:(id)a6 destLabelName:(id)a7;
@end

@implementation LCFCoreMLFeatureProviderUtils

+ (id)toMultiArrayTypeFeatureProvider:(id)a3 srcFeatureNames:(id)a4 srcLabelName:(id)a5 destFeatureName:(id)a6 destLabelName:(id)a7
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v47 = a5;
  id v49 = a6;
  id v48 = a7;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = v12;
  uint64_t v13 = 0;
  uint64_t v14 = [v12 countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v67;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v67 != v15) {
          objc_enumerationMutation(obj);
        }
        v17 = objc_msgSend(v11, "featureValueForName:", *(void *)(*((void *)&v66 + 1) + 8 * v16), v47);
        if ([v17 type] == 1 || objc_msgSend(v17, "type") == 2)
        {
          ++v13;
        }
        else if ([v17 type] == 5)
        {
          v18 = [v17 multiArrayValue];
          v19 = [v18 shape];
          v20 = [v19 objectAtIndexedSubscript:0];
          int v21 = [v20 intValue];

          v13 += v21;
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v22 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
      uint64_t v14 = v22;
    }
    while (v22);
  }
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  v65 = 0;
  v65 = malloc_type_malloc(8 * v13, 0x100004000313F17uLL);
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  int v61 = 0;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v23 = obj;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v54 objects:v73 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v55;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v55 != v25) {
          objc_enumerationMutation(v23);
        }
        v27 = objc_msgSend(v11, "featureValueForName:", *(void *)(*((void *)&v54 + 1) + 8 * v26), v47);
        if ([v27 type] == 1)
        {
          double v28 = (double)[v27 int64Value];
LABEL_23:
          uint64_t v29 = v63[3];
          uint64_t v30 = *((int *)v59 + 6);
          *((_DWORD *)v59 + 6) = v30 + 1;
          *(double *)(v29 + 8 * v30) = v28;
          goto LABEL_24;
        }
        if ([v27 type] == 2)
        {
          [v27 doubleValue];
          goto LABEL_23;
        }
        if ([v27 type] == 5)
        {
          v31 = [v27 multiArrayValue];
          v53[0] = MEMORY[0x263EF8330];
          v53[1] = 3221225472;
          v53[2] = __124__LCFCoreMLFeatureProviderUtils_toMultiArrayTypeFeatureProvider_srcFeatureNames_srcLabelName_destFeatureName_destLabelName___block_invoke;
          v53[3] = &unk_2653AFFC8;
          v53[4] = &v62;
          v53[5] = &v58;
          [v31 getBytesWithHandler:v53];
        }
LABEL_24:

        ++v26;
      }
      while (v24 != v26);
      uint64_t v32 = [v23 countByEnumeratingWithState:&v54 objects:v73 count:16];
      uint64_t v24 = v32;
    }
    while (v32);
  }

  v33 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "count"));
  v72 = v33;
  v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v72 count:1];

  id v35 = objc_alloc(MEMORY[0x263F00DA8]);
  uint64_t v36 = v63[3];
  id v51 = 0;
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __124__LCFCoreMLFeatureProviderUtils_toMultiArrayTypeFeatureProvider_srcFeatureNames_srcLabelName_destFeatureName_destLabelName___block_invoke_53;
  v52[3] = &unk_2653AFFF0;
  v52[4] = &v62;
  v37 = (void *)[v35 initWithDataPointer:v36 shape:v34 dataType:65600 strides:&unk_2703E7678 deallocator:v52 error:&v51];
  id v38 = v51;
  v70[0] = v49;
  v39 = [MEMORY[0x263F00D50] featureValueWithMultiArray:v37];
  v70[1] = v48;
  v71[0] = v39;
  v40 = [v11 featureValueForName:v47];
  v71[1] = v40;
  v41 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];

  v42 = +[LCFCoreMLFeatureProvider fromMLProvider:v11];
  v43 = [v42 featureStoreKey];
  v44 = [v42 timestamp];
  id v45 = [[LCFCoreMLFeatureProvider alloc] init:v43 timestamp:v44 featureValues:v41];

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

  return v45;
}

void *__124__LCFCoreMLFeatureProviderUtils_toMultiArrayTypeFeatureProvider_srcFeatureNames_srcLabelName_destFeatureName_destLabelName___block_invoke(uint64_t a1, const void *a2, size_t a3)
{
  int v3 = a3;
  result = memcpy((void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)+ 8 * *(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)), a2, a3);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v3;
  return result;
}

void __124__LCFCoreMLFeatureProviderUtils_toMultiArrayTypeFeatureProvider_srcFeatureNames_srcLabelName_destFeatureName_destLabelName___block_invoke_53(uint64_t a1)
{
}

+ (id)toMultiArrayTypeBatchProvider:(id)a3 srcFeatureNames:(id)a4 srcLabelName:(id)a5 destFeatureName:(id)a6 destLabelName:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([v11 count] >= 1)
  {
    uint64_t v17 = 0;
    do
    {
      v18 = [v11 featuresAtIndex:v17];
      v19 = +[LCFCoreMLFeatureProviderUtils toMultiArrayTypeFeatureProvider:v18 srcFeatureNames:v12 srcLabelName:v13 destFeatureName:v14 destLabelName:v15];
      [v16 addObject:v19];

      ++v17;
    }
    while ([v11 count] > v17);
  }
  v20 = +[LCFCoreMLBatchProvider fromMLProvider:v11];
  int v21 = [v20 featureStoreKey];
  id v22 = [[LCFCoreMLBatchProvider alloc] init:v21 featureProviders:v16];

  return v22;
}

@end