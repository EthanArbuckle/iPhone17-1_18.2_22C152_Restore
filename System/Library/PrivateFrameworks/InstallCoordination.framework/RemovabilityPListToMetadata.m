@interface RemovabilityPListToMetadata
@end

@implementation RemovabilityPListToMetadata

void ___RemovabilityPListToMetadata_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  id v9 = v7;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (v10)
  {
    objc_opt_class();
    v11 = v8;
    if (objc_opt_isKindOfClass())
    {
      if (v11)
      {
        v12 = [[IXApplicationIdentity alloc] initWithPlistKeySerialization:v9];
        if (v12)
        {
          uint64_t v13 = *(void *)(a1 + 40);
          v14 = v11;
          v15 = v12;
          if (v13 == 2)
          {
            v17 = [[IXAppRemovabilityMetadata alloc] initWithMetadataDictionary:v14];
            v16 = [[IXAppRemovabilityMetadataList alloc] initWithInitialRemovabilityMetadata:v17];
          }
          else if (v13 == 3)
          {
            v16 = [[IXAppRemovabilityMetadataList alloc] initWithSerializedDictionary:v14];
          }
          else
          {
            v18 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
              ___RemovabilityPListToMetadata_block_invoke_cold_4();
            }

            v16 = 0;
          }

          [*(id *)(a1 + 32) setObject:v16 forKeyedSubscript:v15];
        }
        else
        {
          IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          v16 = (IXAppRemovabilityMetadataList *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR)) {
            ___RemovabilityPListToMetadata_block_invoke_cold_3();
          }
        }

        goto LABEL_24;
      }
    }
    else
    {
    }
    v11 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      ___RemovabilityPListToMetadata_block_invoke_cold_2();
    }
  }
  else
  {
    v11 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      ___RemovabilityPListToMetadata_block_invoke_cold_1();
    }
  }
LABEL_24:

  *a4 = 0;
}

void ___RemovabilityPListToMetadata_block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v0, (uint64_t)v0, "%s: Deserialized key for removability entry is not string %@ : %@", (uint8_t *)v1);
}

void ___RemovabilityPListToMetadata_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to get removability dictionary for entry: %@", v2, v3, v4, v5, 2u);
}

void ___RemovabilityPListToMetadata_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(&dword_1A7B2D000, v0, v1, "%s: Failed to deserialize removability entry: %@", v2, v3, v4, v5, 2u);
}

void ___RemovabilityPListToMetadata_block_invoke_cold_4()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_0_0();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_5_0(&dword_1A7B2D000, v1, (uint64_t)v1, "%s: Failed to deserialize removability metadata for identity %@, version %lu", (uint8_t *)v2);
}

@end