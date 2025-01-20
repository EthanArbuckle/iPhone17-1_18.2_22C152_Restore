@interface DPToolCommand
@end

@implementation DPToolCommand

void __35___DPToolCommand_supportedCommands__block_invoke()
{
  v2[11] = *MEMORY[0x1E4F143B8];
  v2[0] = @"recordnumbers";
  v2[1] = @"recordnumbersvectors";
  v2[2] = @"recordbitvalues";
  v2[3] = @"recordbitvectors";
  v2[4] = @"recordfloatvectors";
  v2[5] = @"recordstrings";
  v2[6] = @"recordwords";
  v2[7] = @"query";
  v2[8] = @"submitrecords";
  v2[9] = @"listreports";
  v2[10] = @"listkeys";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:11];
  v1 = (void *)_DPToolSupportedCommands;
  _DPToolSupportedCommands = v0;
}

void __39___DPToolCommand_supportedMetadataKeys__block_invoke()
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = @"CountryCode";
  v2[1] = @"State";
  v2[2] = @"VersionHash";
  v2[3] = @"AlgorithmParameters";
  v2[4] = @"DediscoTaskConfig";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];
  v1 = (void *)_DPToolSupportedMetadataKeys;
  _DPToolSupportedMetadataKeys = v0;
}

void __30___DPToolCommand_queryForKey___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v8 = a3;
  id v9 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v10 = +[_DPLog tool];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __30___DPToolCommand_queryForKey___block_invoke_cold_1(a1, (uint64_t)v9, v10);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __30___DPToolCommand_queryForKey___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  OUTLINED_FUNCTION_2_4();
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_1DC55E000, a3, OS_LOG_TYPE_ERROR, "%@: record fetch failed with %@", v6, 0x16u);
}

@end