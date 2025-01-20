@interface CSOnDeviceCompilationModelListDecoder
+ (id)decodeConfigFrom:(id)a3;
@end

@implementation CSOnDeviceCompilationModelListDecoder

+ (id)decodeConfigFrom:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 dictionary];
  v5 = [v4 objectForKeyedSubscript:@"OnDeviceCompilationModelList"];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v7 = [v3 dictionary];
    v8 = [v7 objectForKeyedSubscript:@"OnDeviceCompilationModelList"];

    v9 = v8;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (!v10) {
      goto LABEL_23;
    }
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v30;
    *(void *)&long long v11 = 136315138;
    long long v28 = v11;
    while (1)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = *(void **)(*((void *)&v29 + 1) + 8 * v14);
        v16 = objc_msgSend(v3, "dictionary", v28);
        v17 = [v16 objectForKeyedSubscript:@"OnDeviceCompilationModelList"];
        v18 = [v17 objectForKeyedSubscript:v15];

        if ([v15 isEqualToString:@"SecondpassChecker"])
        {
          v19 = [v3 resourcePath];
          v20 = [v19 stringByAppendingPathComponent:v18];
          v21 = v6;
          v22 = v20;
          v23 = &unk_1F13B8188;
LABEL_17:
          [v21 setObject:v22 forKeyedSubscript:v23];

          goto LABEL_18;
        }
        if ([v15 isEqualToString:@"SpeakerRecognition"])
        {
          v19 = [v3 resourcePath];
          v20 = [v19 stringByAppendingPathComponent:v18];
          v21 = v6;
          v22 = v20;
          v23 = &unk_1F13B81A0;
          goto LABEL_17;
        }
        if ([v15 isEqualToString:@"AFTM"])
        {
          v19 = [v3 resourcePath];
          v20 = [v19 stringByAppendingPathComponent:v18];
          v21 = v6;
          v22 = v20;
          v23 = &unk_1F13B81D0;
          goto LABEL_17;
        }
        if ([v15 isEqualToString:@"ODLD"])
        {
          v19 = [v3 resourcePath];
          v20 = [v19 stringByAppendingPathComponent:v18];
          v21 = v6;
          v22 = v20;
          v23 = &unk_1F13B81B8;
          goto LABEL_17;
        }
        if ([v15 isEqualToString:@"NC"])
        {
          v19 = [v3 resourcePath];
          v20 = [v19 stringByAppendingPathComponent:v18];
          v21 = v6;
          v22 = v20;
          v23 = &unk_1F13B81E8;
          goto LABEL_17;
        }
        v24 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v28;
          v35 = "+[CSOnDeviceCompilationModelListDecoder decodeConfigFrom:]";
          _os_log_error_impl(&dword_1BA1A5000, v24, OS_LOG_TYPE_ERROR, "%s modelType specified in onDeviceCompilation list is not supported", buf, 0xCu);
        }
LABEL_18:

        ++v14;
      }
      while (v12 != v14);
      uint64_t v25 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      uint64_t v12 = v25;
      if (!v25)
      {
LABEL_23:

        goto LABEL_27;
      }
    }
  }
  v26 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v35 = "+[CSOnDeviceCompilationModelListDecoder decodeConfigFrom:]";
    _os_log_impl(&dword_1BA1A5000, v26, OS_LOG_TYPE_DEFAULT, "%s Cannot find onDeviceCompilationModelList in asset json", buf, 0xCu);
  }
  id v6 = 0;
LABEL_27:

  return v6;
}

@end