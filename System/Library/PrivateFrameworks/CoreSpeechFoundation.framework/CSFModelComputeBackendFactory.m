@interface CSFModelComputeBackendFactory
+ (id)provideComputeBackendWithModelFile:(id)a3 separateWeight:(id)a4 error:(id *)a5;
@end

@implementation CSFModelComputeBackendFactory

+ (id)provideComputeBackendWithModelFile:(id)a3 separateWeight:(id)a4 error:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([v7 hasSuffix:@"bnns.mil"])
  {
    v9 = +[CSFBnnsIrLookUp getBnnsIrPathFromMilFile:v7];
    v10 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v26 = "+[CSFModelComputeBackendFactory provideComputeBackendWithModelFile:separateWeight:error:]";
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v7;
      _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s obtained lookup bnnsIrPath : %@ for mil path: %@", buf, 0x20u);
    }
    id v22 = 0;
    v11 = [[CSFMil2bnnsComputeBackend alloc] initWithModelFile:v7 bnnsIrPath:v9 errOut:&v22];
    id v12 = v22;

    if (!v11) {
      goto LABEL_14;
    }
LABEL_11:
    if (!v12)
    {
      v11 = v11;
      v14 = v11;
      goto LABEL_19;
    }
    goto LABEL_14;
  }
  if ([v7 hasSuffix:@"bnnsir"])
  {
    v21 = 0;
    v11 = [[CSFMil2bnnsComputeBackend alloc] initWithBnnsIrFile:v7 weightPath:v8 errOut:&v21];
    v13 = v21;
  }
  else
  {
    if (![v7 hasSuffix:@"mlmodelc"])
    {
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v23 = *MEMORY[0x1E4F28568];
      v16 = [NSString stringWithFormat:@"Backend not supported"];
      v24 = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v12 = [v15 errorWithDomain:@"com.apple.corespeech" code:2457 userInfo:v17];

      v11 = 0;
      goto LABEL_14;
    }
    v20 = 0;
    v11 = [[CSFCoreMLComputeBackend alloc] initWithModelFile:v7 error:&v20];
    v13 = v20;
  }
  id v12 = v13;
  if (v11) {
    goto LABEL_11;
  }
LABEL_14:
  v18 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v26 = "+[CSFModelComputeBackendFactory provideComputeBackendWithModelFile:separateWeight:error:]";
    __int16 v27 = 2112;
    id v28 = v7;
    __int16 v29 = 2112;
    id v30 = v12;
    _os_log_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_DEFAULT, "%s model: %@ init with error: %@", buf, 0x20u);
  }
  if (a5)
  {
    id v12 = v12;
    v14 = 0;
    *a5 = v12;
  }
  else
  {
    v14 = 0;
  }
LABEL_19:

  return v14;
}

@end