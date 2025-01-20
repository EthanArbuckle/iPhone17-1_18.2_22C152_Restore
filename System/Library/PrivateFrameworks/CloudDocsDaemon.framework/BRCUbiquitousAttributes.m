@interface BRCUbiquitousAttributes
+ (id)brc_attributesValues:(id)a3 localItem:(id)a4;
+ (void)brc_getterForAttribute:(id)a3;
@end

@implementation BRCUbiquitousAttributes

+ (void)brc_getterForAttribute:(id)a3
{
  uint64_t v3 = brc_getterForAttribute__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&brc_getterForAttribute__onceToken, &__block_literal_global);
  }
  v5 = [(id)brc_getterForAttribute__ubiquitousAttributeToFunction objectForKeyedSubscript:v4];

  v6 = (void *)[v5 pointerValue];
  return v6;
}

void __50__BRCUbiquitousAttributes_brc_getterForAttribute___block_invoke()
{
  v25[22] = *MEMORY[0x1E4F143B8];
  v24[0] = *MEMORY[0x1E4F1C768];
  v23 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousItemHasUnresolvedConflicts];
  v25[0] = v23;
  v24[1] = *MEMORY[0x1E4F1C778];
  v22 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousItemIsDownloading];
  v25[1] = v22;
  v24[2] = *MEMORY[0x1E4F1CB98];
  v21 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousItemIsDownloadRequested];
  v25[2] = v21;
  v24[3] = *MEMORY[0x1E4F1C738];
  v20 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousItemIsDownloadRequested];
  v25[3] = v20;
  v24[4] = *MEMORY[0x1E4F1C7A0];
  v19 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousItemUploadingError];
  v25[4] = v19;
  v24[5] = *MEMORY[0x1E4F1C740];
  v18 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousItemDownloadingError];
  v25[5] = v18;
  v24[6] = *MEMORY[0x1E4F1C788];
  v17 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousItemIsShared];
  v25[6] = v17;
  v24[7] = *MEMORY[0x1E4F1C7E8];
  v16 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousSharedItemRole];
  v25[7] = v16;
  v24[8] = *MEMORY[0x1E4F1C7B0];
  v15 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousSharedItemRole];
  v25[8] = v15;
  v24[9] = *MEMORY[0x1E4F1C7C8];
  v14 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousSharedItemOwnerName];
  v25[9] = v14;
  v24[10] = *MEMORY[0x1E4F1C7C0];
  v13 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousSharedItemOwnerNameComponents];
  v25[10] = v13;
  v24[11] = *MEMORY[0x1E4F1C7B8];
  v12 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousItemLastEditorNameComponents];
  v25[11] = v12;
  v24[12] = *MEMORY[0x1E4F1C7D0];
  v0 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousSharedItemOldPermissions];
  v25[12] = v0;
  v24[13] = *MEMORY[0x1E4F1C7A8];
  v1 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousSharedItemCurrentUserPermissions];
  v25[13] = v1;
  v24[14] = *MEMORY[0x1E4F1C798];
  v2 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousItemIsUploading];
  v25[14] = v2;
  v24[15] = *MEMORY[0x1E4F593E8];
  uint64_t v3 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousItemLastEditorDeviceName];
  v25[15] = v3;
  v24[16] = *MEMORY[0x1E4F593F0];
  id v4 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousItemLastEditorName];
  v25[16] = v4;
  v24[17] = *MEMORY[0x1E4F593E0];
  v5 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousItemIsConflicted];
  v25[17] = v5;
  v24[18] = *MEMORY[0x1E4F593D8];
  v6 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousItemIdentifier];
  v25[18] = v6;
  v24[19] = *MEMORY[0x1E4F593C8];
  v7 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousDocumentRecordID];
  v25[19] = v7;
  v24[20] = *MEMORY[0x1E4F59388];
  v8 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousEditedSinceShared];
  v25[20] = v8;
  v24[21] = *MEMORY[0x1E4F593D0];
  v9 = [MEMORY[0x1E4F29238] valueWithPointer:ubiquitousIsTopLevelSharedItem];
  v25[21] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:22];
  v11 = (void *)brc_getterForAttribute__ubiquitousAttributeToFunction;
  brc_getterForAttribute__ubiquitousAttributeToFunction = v10;
}

+ (id)brc_attributesValues:(id)a3 localItem:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    +[BRCUbiquitousAttributes brc_attributesValues:localItem:]();
  }

  id v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v30;
    *(void *)&long long v12 = 138412546;
    long long v27 = v12;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend(a1, "brc_getterForAttribute:", v16, v27);
        if (v17)
        {
          v18 = (void (*)(id, void *))v17;
          v19 = [v7 db];
          v20 = v18(v7, v19);

          if (v20)
          {
            [v28 setObject:v20 forKeyedSubscript:v16];
          }
          else
          {
            v22 = brc_bread_crumbs();
            v23 = brc_default_log();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v27;
              uint64_t v34 = v16;
              __int16 v35 = 2112;
              v36 = v22;
              _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] No value for attribute: %@%@", buf, 0x16u);
            }
          }
        }
        else
        {
          v20 = brc_bread_crumbs();
          v21 = brc_default_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v27;
            uint64_t v34 = v16;
            __int16 v35 = 2112;
            v36 = v20;
            _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] unsupported attribute: %@%@", buf, 0x16u);
          }
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v13);
  }

  v24 = brc_bread_crumbs();
  v25 = brc_default_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    +[BRCUbiquitousAttributes brc_attributesValues:localItem:]();
  }

  return v28;
}

+ (void)brc_attributesValues:localItem:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] returning %@%@");
}

+ (void)brc_attributesValues:localItem:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] localItem: %@%@");
}

@end