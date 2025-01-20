@interface CSOnDeviceCompilationHandler
+ (id)sharedHandler;
- (CSOnDeviceCompilationHandler)init;
- (id)_compileModelAndAddToCacheWithConfigFiles:(id)a3 compileDirectoryPath:(id)a4 locale:(id)a5 assetVersion:(id)a6 hashToUse:(id)a7 modelType:(int64_t)a8 compilationFramework:(int64_t)a9;
- (id)_compileModelWithModelListInAsset:(id)a3 modelType:(id)a4 compileDirectoryPath:(id)a5 locale:(id)a6 compilationFramework:(int64_t)a7;
- (void)compileAndUpdateDeviceCachesWithAsset:(id)a3 assetType:(unint64_t)a4 endpointId:(id)a5 errOut:(id *)a6;
- (void)compileAndUpdateDeviceCachesWithAsset:(id)a3 assetType:(unint64_t)a4 modelType:(id)a5 deviceId:(id)a6 currentLocale:(id)a7 compileDirectory:(id)a8 errOut:(id *)a9;
- (void)compileUsingConfig:(id)a3 locale:(id)a4 compileDirectory:(id)a5 modelType:(int64_t)a6 errOut:(id *)a7;
@end

@implementation CSOnDeviceCompilationHandler

- (void).cxx_destruct
{
}

- (id)_compileModelAndAddToCacheWithConfigFiles:(id)a3 compileDirectoryPath:(id)a4 locale:(id)a5 assetVersion:(id)a6 hashToUse:(id)a7 modelType:(int64_t)a8 compilationFramework:(int64_t)a9
{
  v70[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v51 = a4;
  id v50 = a5;
  id v49 = a6;
  id v48 = a7;
  if (!v14)
  {
    v41 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v69 = *MEMORY[0x1E4F28568];
    v42 = [NSString stringWithFormat:@"config files passed in for compilation is nil"];
    v70[0] = v42;
    v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v70 forKeys:&v69 count:1];
    v18 = [v41 errorWithDomain:@"com.apple.corespeech" code:2255 userInfo:v43];

    goto LABEL_27;
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v54 objects:v68 count:16];
  if (!v15)
  {
    v18 = 0;
    goto LABEL_27;
  }
  uint64_t v17 = v15;
  v18 = 0;
  unint64_t v19 = 0x1E61FE000uLL;
  uint64_t v53 = *(void *)v55;
  uint64_t v47 = *MEMORY[0x1E4F28568];
  *(void *)&long long v16 = 136315138;
  long long v46 = v16;
  do
  {
    uint64_t v20 = 0;
    uint64_t v52 = v17;
    do
    {
      if (*(void *)v55 != v53) {
        objc_enumerationMutation(v14);
      }
      v21 = *(void **)(*((void *)&v54 + 1) + 8 * v20);
      v22 = objc_msgSend(*(id *)(v19 + 2528), "readMilFilePathFromConfig:modelType:", v21, a8, v46);
      v23 = [*(id *)(v19 + 2528) getModelNameFromMilFilePath:v22];
      uint64_t v24 = [*(id *)(v19 + 2528) getBackendTypeFromModelFile:v22];
      if (v24 == 2)
      {
        int64_t v28 = a8;
        id v29 = v14;
        v30 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v66 = v47;
        v31 = [NSString stringWithFormat:@"not avaiable for E5ML"];
        v67 = v31;
        v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        uint64_t v33 = [v30 errorWithDomain:@"com.apple.corespeech" code:2254 userInfo:v32];

        v34 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v46;
          v59 = "-[CSOnDeviceCompilationHandler _compileModelAndAddToCacheWithConfigFiles:compileDirectoryPath:locale:ass"
                "etVersion:hashToUse:modelType:compilationFramework:]";
          _os_log_fault_impl(&dword_1BA1A5000, v34, OS_LOG_TYPE_FAULT, "%s Not implemented", buf, 0xCu);
        }
        v26 = 0;
        v18 = (void *)v33;
        id v14 = v29;
        a8 = v28;
        uint64_t v17 = v52;
        unint64_t v19 = 0x1E61FE000;
      }
      else if (v24 == 1)
      {
        v25 = [*(id *)(v19 + 2528) getIrNameFromModelNameForCompile:v23 locale:v50 assetVersion:v49 hashToUse:v48];
        v26 = [v51 stringByAppendingPathComponent:v25];

        uint64_t v27 = +[CSMil2BnnsUtils compileModelWithMilFile:v22 bnnsIrCachePath:v26 compilationFramework:a9];

        v18 = (void *)v27;
      }
      else
      {
        v35 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v59 = "-[CSOnDeviceCompilationHandler _compileModelAndAddToCacheWithConfigFiles:compileDirectoryPath:locale:ass"
                "etVersion:hashToUse:modelType:compilationFramework:]";
          __int16 v60 = 2112;
          v61 = v22;
          __int16 v62 = 2112;
          v63 = v21;
          _os_log_impl(&dword_1BA1A5000, v35, OS_LOG_TYPE_DEFAULT, "%s No Valid backend for compilation is found for model file: %@ from config: %@", buf, 0x20u);
        }
        v26 = 0;
      }
      uint64_t v36 = CSLogContextFacilityCoreSpeech;
      BOOL v37 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (!v37) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 136315650;
        v59 = "-[CSOnDeviceCompilationHandler _compileModelAndAddToCacheWithConfigFiles:compileDirectoryPath:locale:asset"
              "Version:hashToUse:modelType:compilationFramework:]";
        __int16 v60 = 2112;
        v61 = v22;
        __int16 v62 = 2112;
        v63 = v18;
        v38 = v36;
        v39 = "%s mil2Bnns compilation failed for modelFile: %@ with error: %@";
        uint32_t v40 = 32;
      }
      else
      {
        if (!v37) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 136315906;
        v59 = "-[CSOnDeviceCompilationHandler _compileModelAndAddToCacheWithConfigFiles:compileDirectoryPath:locale:asset"
              "Version:hashToUse:modelType:compilationFramework:]";
        __int16 v60 = 2112;
        v61 = v22;
        __int16 v62 = 2112;
        v63 = v26;
        __int16 v64 = 2112;
        uint64_t v65 = 0;
        v38 = v36;
        v39 = "%s Compilation done for modelFile: %@, output cacheIrPath: %@ with error: %@";
        uint32_t v40 = 42;
      }
      _os_log_impl(&dword_1BA1A5000, v38, OS_LOG_TYPE_DEFAULT, v39, buf, v40);
LABEL_22:

      ++v20;
    }
    while (v17 != v20);
    uint64_t v17 = [v14 countByEnumeratingWithState:&v54 objects:v68 count:16];
  }
  while (v17);
LABEL_27:
  id v44 = v18;

  return v44;
}

- (id)_compileModelWithModelListInAsset:(id)a3 modelType:(id)a4 compileDirectoryPath:(id)a5 locale:(id)a6 compilationFramework:(int64_t)a7
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (v11)
  {
    uint64_t v15 = +[CSOnDeviceCompilationModelListDecoder decodeConfigFrom:v11];
    long long v16 = [v15 objectForKeyedSubscript:v12];

    if (v16)
    {
      uint64_t v17 = [v15 objectForKeyedSubscript:v12];
      int64_t v31 = a7;
      v18 = v13;
      v30 = +[CSOnDeviceCompilationUtils getModelNameFromMilFilePath:v17];
      unint64_t v19 = [v11 configVersion];
      uint64_t v20 = [v11 hashFromResourcePath];
      v21 = +[CSOnDeviceCompilationUtils getIrNameFromModelNameForCompile:v30 locale:v14 assetVersion:v19 hashToUse:v20];
      [v18 stringByAppendingPathComponent:v21];
      id v22 = v12;
      uint64_t v24 = v23 = v14;

      id v13 = v18;
      v25 = +[CSMil2BnnsUtils compileModelWithMilFile:v17 bnnsIrCachePath:v24 compilationFramework:v31];

      id v14 = v23;
      id v12 = v22;
    }
    else
    {
      uint64_t v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      uint64_t v17 = [NSString stringWithFormat:@"model type not found in compilation list"];
      uint64_t v33 = v17;
      int64_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      v25 = [v27 errorWithDomain:@"com.apple.corespeech" code:2262 userInfo:v28];
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    uint64_t v15 = [NSString stringWithFormat:@"asset being nil"];
    v35[0] = v15;
    uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
    v25 = [v26 errorWithDomain:@"com.apple.corespeech" code:2263 userInfo:v17];
  }

  return v25;
}

- (void)compileUsingConfig:(id)a3 locale:(id)a4 compileDirectory:(id)a5 modelType:(int64_t)a6 errOut:(id *)a7
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  int64_t v28 = __Block_byref_object_copy__10997;
  id v29 = __Block_byref_object_dispose__10998;
  id v30 = 0;
  if (v12)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__CSOnDeviceCompilationHandler_compileUsingConfig_locale_compileDirectory_modelType_errOut___block_invoke;
    block[3] = &unk_1E6200CE8;
    id v23 = &v25;
    int64_t v24 = a6;
    block[4] = self;
    id v20 = v12;
    id v21 = v14;
    id v22 = v13;
    dispatch_sync(queue, block);
    if (a7) {
      *a7 = (id) v26[5];
    }
  }
  else if (a7)
  {
    long long v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    uint64_t v17 = [NSString stringWithFormat:@"configfileNil"];
    v32[0] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    *a7 = [v16 errorWithDomain:@"com.apple.corespeech" code:2255 userInfo:v18];
  }
  _Block_object_dispose(&v25, 8);
}

void __92__CSOnDeviceCompilationHandler_compileUsingConfig_locale_compileDirectory_modelType_errOut___block_invoke(void *a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  if ((a1[9] & 0xFFFFFFFFFFFFFFFELL) == 2) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  v3 = (void *)a1[4];
  v14[0] = a1[5];
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v5 = [v3 _compileModelAndAddToCacheWithConfigFiles:v4 compileDirectoryPath:a1[6] locale:a1[7] assetVersion:@"override" hashToUse:@"defaultHash" modelType:a1[9] compilationFramework:v2];
  uint64_t v6 = *(void *)(a1[8] + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  v8 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(a1[8] + 8) + 40);
    *(_DWORD *)buf = 136315394;
    id v11 = "-[CSOnDeviceCompilationHandler compileUsingConfig:locale:compileDirectory:modelType:errOut:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s model compilation finished with error %@: ", buf, 0x16u);
  }
}

- (void)compileAndUpdateDeviceCachesWithAsset:(id)a3 assetType:(unint64_t)a4 modelType:(id)a5 deviceId:(id)a6 currentLocale:(id)a7 compileDirectory:(id)a8 errOut:(id *)a9
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  uint64_t v17 = (__CFString *)a6;
  id v18 = a7;
  id v19 = a8;
  if (v17)
  {
    if (+[CSOnDeviceCompilationUtils shouldCompileForAssetType:a4])
    {
      uint64_t v67 = 0;
      v68 = &v67;
      uint64_t v69 = 0x3032000000;
      v70 = __Block_byref_object_copy__10997;
      v71 = __Block_byref_object_dispose__10998;
      id v72 = 0;
      long long v46 = v18;
      uint64_t v47 = v15;
      if (a4 == 6
        && (([v16 isEqual:&unk_1F13B8428] & 1) != 0
         || [v16 isEqual:&unk_1F13B8440]))
      {
        uint64_t v20 = 2;
      }
      else
      {
        uint64_t v20 = 1;
      }
      int64_t v24 = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __137__CSOnDeviceCompilationHandler_compileAndUpdateDeviceCachesWithAsset_assetType_modelType_deviceId_currentLocale_compileDirectory_errOut___block_invoke;
      block[3] = &unk_1E6200C70;
      uint64_t v65 = &v67;
      block[4] = self;
      id v25 = v47;
      id v61 = v25;
      id v26 = v16;
      id v62 = v26;
      id v43 = v19;
      id v63 = v43;
      id v45 = v46;
      id v64 = v45;
      uint64_t v66 = v20;
      dispatch_sync(v24, block);
      if (v68[5])
      {
        if (a4)
        {
          int v27 = !+[CSUtils isDarwinOS];
          if (a4 == 5) {
            char v28 = v27;
          }
          else {
            char v28 = 1;
          }
        }
        else
        {
          char v28 = 0;
        }
        if ([v26 intValue] == 1) {
          char v29 = v28;
        }
        else {
          char v29 = 1;
        }
        if (v29)
        {
          id v30 = +[CSOnDeviceCompilationUtils getModelConfigsWithAsset:modelType:](CSOnDeviceCompilationUtils, "getModelConfigsWithAsset:modelType:", v25, (int)[v26 intValue]);
          queue = self->_queue;
          v48[0] = MEMORY[0x1E4F143A8];
          v48[1] = 3221225472;
          v48[2] = __137__CSOnDeviceCompilationHandler_compileAndUpdateDeviceCachesWithAsset_assetType_modelType_deviceId_currentLocale_compileDirectory_errOut___block_invoke_24;
          v48[3] = &unk_1E6200CC0;
          v53[1] = &v67;
          v48[4] = self;
          id v49 = v30;
          v42 = &v50;
          id v50 = v43;
          id v44 = &v51;
          id v51 = v45;
          uint64_t v31 = &v52;
          id v52 = v25;
          uint64_t v32 = (id *)v53;
          uint64_t v33 = &v49;
          v53[0] = v26;
          v53[2] = v20;
          id v34 = v30;
          dispatch_sync(queue, v48);
        }
        else
        {
          if (v17 == @"Hub")
          {
            uint64_t v38 = +[CSVoiceTriggerSecondPassConfigDecoder fetchAllVoiceTriggerSecondPassRecognizer:v25];
          }
          else
          {
            v35 = +[CSVoiceTriggerSecondPassConfigDecoder decodeConfigFrom:v25 forFirstPassSource:7];
            uint64_t v36 = v35;
            if (v35)
            {
              BOOL v37 = [v35 configPathRecognizer];
              v73 = v37;
              uint64_t v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
            }
            else
            {
              uint64_t v38 = 0;
            }
          }
          v39 = self->_queue;
          v54[0] = MEMORY[0x1E4F143A8];
          v54[1] = 3221225472;
          v54[2] = __137__CSOnDeviceCompilationHandler_compileAndUpdateDeviceCachesWithAsset_assetType_modelType_deviceId_currentLocale_compileDirectory_errOut___block_invoke_23;
          v54[3] = &unk_1E6200C98;
          v59[1] = &v67;
          uint64_t v33 = (id *)&v55;
          v54[4] = self;
          uint64_t v55 = v38;
          v42 = &v56;
          id v56 = v43;
          id v44 = &v57;
          id v57 = v45;
          uint32_t v40 = (void *)v38;
          uint64_t v31 = &v58;
          id v58 = v25;
          uint64_t v32 = (id *)v59;
          v59[0] = v26;
          id v34 = v40;
          dispatch_sync(v39, v54);
        }

        if (a9) {
          *a9 = (id) v68[5];
        }
      }

      id v18 = v46;
      id v15 = v47;

      _Block_object_dispose(&v67, 8);
    }
  }
  else if (a9)
  {
    id v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v74 = *MEMORY[0x1E4F28568];
    id v22 = [NSString stringWithFormat:@"deviceId specified as nil"];
    v75[0] = v22;
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v75 forKeys:&v74 count:1];
    *a9 = [v21 errorWithDomain:@"com.apple.corespeech" code:2254 userInfo:v23];
  }
}

void __137__CSOnDeviceCompilationHandler_compileAndUpdateDeviceCachesWithAsset_assetType_modelType_deviceId_currentLocale_compileDirectory_errOut___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _compileModelWithModelListInAsset:*(void *)(a1 + 40) modelType:*(void *)(a1 + 48) compileDirectoryPath:*(void *)(a1 + 56) locale:*(void *)(a1 + 64) compilationFramework:*(void *)(a1 + 80)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  if (v5 && [v5 code] != 2262)
  {
    uint64_t v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      int v9 = 136315650;
      v10 = "-[CSOnDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:assetType:modelType:deviceId:currentLoc"
            "ale:compileDirectory:errOut:]_block_invoke";
      __int16 v11 = 2112;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s compilation with onDeviceCompilation list finished with error: %@ with modelType: %@", (uint8_t *)&v9, 0x20u);
    }
  }
}

void __137__CSOnDeviceCompilationHandler_compileAndUpdateDeviceCachesWithAsset_assetType_modelType_deviceId_currentLocale_compileDirectory_errOut___block_invoke_23(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = [*(id *)(a1 + 64) configVersion];
  uint64_t v7 = [*(id *)(a1 + 64) hashFromResourcePath];
  uint64_t v8 = objc_msgSend(v2, "_compileModelAndAddToCacheWithConfigFiles:compileDirectoryPath:locale:assetVersion:hashToUse:modelType:compilationFramework:", v3, v4, v5, v6, v7, (int)objc_msgSend(*(id *)(a1 + 72), "intValue"), 1);
  uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  __int16 v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[CSOnDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:assetType:modelType:deviceId:currentLocal"
          "e:compileDirectory:errOut:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s second pass model compilation finished with error %@: ", buf, 0x16u);
  }
}

void __137__CSOnDeviceCompilationHandler_compileAndUpdateDeviceCachesWithAsset_assetType_modelType_deviceId_currentLocale_compileDirectory_errOut___block_invoke_24(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v6 = [*(id *)(a1 + 64) configVersion];
  uint64_t v7 = [*(id *)(a1 + 64) hashFromResourcePath];
  uint64_t v8 = objc_msgSend(v2, "_compileModelAndAddToCacheWithConfigFiles:compileDirectoryPath:locale:assetVersion:hashToUse:modelType:compilationFramework:", v3, v4, v5, v6, v7, (int)objc_msgSend(*(id *)(a1 + 72), "intValue"), *(void *)(a1 + 88));
  uint64_t v9 = *(void *)(*(void *)(a1 + 80) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  __int16 v11 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    *(_DWORD *)buf = 136315394;
    uint64_t v14 = "-[CSOnDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:assetType:modelType:deviceId:currentLocal"
          "e:compileDirectory:errOut:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v12;
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s second pass model compilation finished with error %@: ", buf, 0x16u);
  }
}

- (void)compileAndUpdateDeviceCachesWithAsset:(id)a3 assetType:(unint64_t)a4 endpointId:(id)a5 errOut:(id *)a6
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v9 = a5;
  v10 = v9;
  if (v9)
  {
    id v34 = (__CFString *)v9;
    +[CSUtils getSiriLanguageWithEndpointId:fallbackLanguage:](CSUtils, "getSiriLanguageWithEndpointId:fallbackLanguage:");
  }
  else
  {
    id v34 = @"Hub";
    __int16 v11 = @"Hub";
    +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  uint64_t v33 = };
  uint64_t v12 = +[CSFPreferences sharedPreferences];
  uint64_t v13 = [v12 getOnDeviceCompilationCacheDirectory];

  uint64_t v32 = (void *)v13;
  if (v13)
  {
    uint64_t v14 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v45 = "-[CSOnDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:]";
      __int16 v46 = 2048;
      unint64_t v47 = a4;
      _os_log_impl(&dword_1BA1A5000, v14, OS_LOG_TYPE_DEFAULT, "%s compiling for modelType: %lu", buf, 0x16u);
    }
    if (a4)
    {
      if (a4 == 3)
      {
        id v19 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          id v45 = "-[CSOnDeviceCompilationHandler compileAndUpdateDeviceCachesWithAsset:assetType:endpointId:errOut:]";
          _os_log_impl(&dword_1BA1A5000, v19, OS_LOG_TYPE_DEFAULT, "%s compiling for modelType forCSSpeakerRecognitionAssetType", buf, 0xCu);
        }
        __int16 v15 = &CSOnDeviceCompileSupportedSpeakerRecognitionModelTypes;
      }
      else
      {
        if (a4 != 6)
        {
          if (a6)
          {
            char v28 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v42 = *MEMORY[0x1E4F28568];
            char v29 = objc_msgSend(NSString, "stringWithFormat:", @"asset type is not supported: %lu", a4);
            id v43 = v29;
            id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
            *a6 = [v28 errorWithDomain:@"com.apple.corespeech" code:2265 userInfo:v30];
          }
          id v18 = 0;
          id v17 = 0;
          goto LABEL_32;
        }
        __int16 v15 = &CSOnDeviceCompileSupportedMitigationModelTypes;
      }
    }
    else
    {
      __int16 v15 = (uint64_t *)&CSOnDeviceCompileSupportedVoiceTriggerModelTypes;
    }
    id v20 = (id)*v15;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v18 = v20;
    uint64_t v21 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      id v17 = 0;
      uint64_t v23 = *(void *)v38;
      do
      {
        uint64_t v24 = 0;
        id v25 = v17;
        do
        {
          if (*(void *)v38 != v23) {
            objc_enumerationMutation(v18);
          }
          id v26 = *(void **)(*((void *)&v37 + 1) + 8 * v24);
          int v27 = +[CSOnDeviceCompilationUtils getModelCompiledDirWithModelType:basePath:](CSOnDeviceCompilationUtils, "getModelCompiledDirWithModelType:basePath:", (int)[v26 intValue], v32);
          id v36 = v25;
          [(CSOnDeviceCompilationHandler *)self compileAndUpdateDeviceCachesWithAsset:v35 assetType:a4 modelType:v26 deviceId:v34 currentLocale:v33 compileDirectory:v27 errOut:&v36];
          id v17 = v36;

          ++v24;
          id v25 = v17;
        }
        while (v22 != v24);
        uint64_t v22 = [v18 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v22);
    }
    else
    {
      id v17 = 0;
    }

    if (a6)
    {
      id v17 = v17;
      *a6 = v17;
    }
LABEL_32:

    goto LABEL_33;
  }
  if (a6)
  {
    uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v48 = *MEMORY[0x1E4F28568];
    id v17 = [NSString stringWithFormat:@"cached ir directory is nil"];
    v49[0] = v17;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
    *a6 = [v16 errorWithDomain:@"com.apple.corespeech" code:2264 userInfo:v18];
    goto LABEL_32;
  }
LABEL_33:
}

- (CSOnDeviceCompilationHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSOnDeviceCompilationHandler;
  uint64_t v2 = [(CSOnDeviceCompilationHandler *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSOnDeviceCompilationHanlder", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

+ (id)sharedHandler
{
  if (sharedHandler_onceToken != -1) {
    dispatch_once(&sharedHandler_onceToken, &__block_literal_global_11042);
  }
  uint64_t v2 = (void *)sharedHandler_sharedHandler;
  return v2;
}

uint64_t __45__CSOnDeviceCompilationHandler_sharedHandler__block_invoke()
{
  sharedHandler_sharedHandler = objc_alloc_init(CSOnDeviceCompilationHandler);
  return MEMORY[0x1F41817F8]();
}

@end