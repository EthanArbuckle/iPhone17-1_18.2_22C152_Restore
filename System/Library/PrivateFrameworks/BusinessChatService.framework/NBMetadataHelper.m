@interface NBMetadataHelper
@end

@implementation NBMetadataHelper

uint64_t __39___NBMetadataHelper_phoneNumberDataMap__block_invoke(uint64_t a1)
{
  _MergedGlobals_32 = [*(id *)(a1 + 32) jsonObjectFromZippedDataWithBytes:&kPhoneNumberMetaData compressedLength:47081 expandedLength:315645];

  return MEMORY[0x270F9A758]();
}

void __32___NBMetadataHelper_CCode2CNMap__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v1 = [*(id *)(a1 + 32) CN2CCodeMap];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = (void *)qword_26ACEFC68;
  qword_26ACEFC68 = (uint64_t)v2;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = v1;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v10 = [v4 objectForKeyedSubscript:v9];
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v16;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v16 != v13) {
                objc_enumerationMutation(v10);
              }
              [(id)qword_26ACEFC68 setObject:v9 forKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * j)];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }
}

@end