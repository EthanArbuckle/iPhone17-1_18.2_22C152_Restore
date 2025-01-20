@interface HKMedicationsBarcodeExtractor
+ (id)extractedBarcodesFromRequestHandler:(id)a3 error:(id *)a4;
@end

@implementation HKMedicationsBarcodeExtractor

+ (id)extractedBarcodesFromRequestHandler:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263F1EE68]);
  v26[0] = v6;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:1];
  LODWORD(a4) = [v5 performRequests:v7 error:a4];

  if (a4)
  {
    v8 = [v6 results];
    id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          v16 = objc_msgSend(v15, "payloadStringValue", (void)v21);
          v17 = [v9 objectForKeyedSubscript:v16];

          if (!v17)
          {
            v18 = [v15 payloadStringValue];
            [v9 setObject:v15 forKeyedSubscript:v18];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    v19 = [v9 allValues];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end