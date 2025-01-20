@interface CDPSerializedDataHarvester
@end

@implementation CDPSerializedDataHarvester

void __72___CDPSerializedDataHarvester_loadWithLimit_dataPointReader_completion___block_invoke(uint64_t a1)
{
  v2 = NSString;
  v3 = [*(id *)(a1 + 32) url];
  v4 = [v3 path];
  id v25 = 0;
  v5 = [v2 stringWithContentsOfFile:v4 encoding:4 error:&v25];
  id v6 = v25;

  if (v6 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __72___CDPSerializedDataHarvester_loadWithLimit_dataPointReader_completion___block_invoke_cold_1((uint64_t)v6);
  }
  v7 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
  v8 = [v5 componentsSeparatedByCharactersInSet:v7];

  v9 = objc_alloc_init(_CDPSimpleDataPoint);
  v23 = v6;
  v24 = v5;
  if ((unint64_t)[v8 count] <= *(void *)(a1 + 56)) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = (int)([v8 count] - *(_DWORD *)(a1 + 56));
  }
  for (; [v8 count] > v10; ++v10)
  {
    v11 = [v8 objectAtIndexedSubscript:v10];
    v12 = [v11 componentsSeparatedByString:@" "];
    if ([v12 count] && (unint64_t)objc_msgSend(v11, "length") >= 0xA)
    {
      v13 = [v12 firstObject];
      -[_CDPSimpleDataPoint setUserIsSender:](v9, "setUserIsSender:", [v13 isEqualToString:@"YES"]);

      v14 = [v12 objectAtIndexedSubscript:1];
      -[_CDPSimpleDataPoint setUserIsThreadInitiator:](v9, "setUserIsThreadInitiator:", [v14 isEqualToString:@"YES"]);

      v15 = (void *)MEMORY[0x1E4F1C9C8];
      v16 = [v12 objectAtIndexedSubscript:2];
      [v16 doubleValue];
      v17 = objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
      [(_CDPSimpleDataPoint *)v9 setTimestamp:v17];

      v18 = [MEMORY[0x1E4F1CA48] array];
      if ((unint64_t)[v12 count] >= 4)
      {
        uint64_t v19 = 3;
        do
        {
          unint64_t v20 = v19 + 1;
          v21 = objc_msgSend(v12, "objectAtIndexedSubscript:");
          [v18 addObject:v21];

          unint64_t v22 = [v12 count];
          uint64_t v19 = v20;
        }
        while (v22 > v20);
      }
      [(_CDPSimpleDataPoint *)v9 setPeopleIdentifiers:v18];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __72___CDPSerializedDataHarvester_loadWithLimit_dataPointReader_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_18ECEB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

@end