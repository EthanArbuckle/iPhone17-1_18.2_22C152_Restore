@interface CESRRawSpeechProfileItemConverterAppInfo
- (CESRRawSpeechProfileItemConverterAppInfo)init;
- (id)speechCategoryId;
- (id)vocabularyItemFromSpeechWords:(id)a3 speechNamespace:(id)a4 error:(id *)a5;
@end

@implementation CESRRawSpeechProfileItemConverterAppInfo

- (void).cxx_destruct
{
}

- (id)vocabularyItemFromSpeechWords:(id)a3 speechNamespace:(id)a4 error:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8 || ![v8 count])
  {
    v27 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[CESRRawSpeechProfileItemConverterAppInfo vocabularyItemFromSpeechWords:speechNamespace:error:]";
      _os_log_debug_impl(&dword_1B8CCB000, v27, OS_LOG_TYPE_DEBUG, "%s rawSpeechProfile contains an AppInfo item missing speech words.", buf, 0xCu);
    }
    goto LABEL_20;
  }
  if ([v8 count] != 1)
  {
    v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v44 = *MEMORY[0x1E4F28228];
    v29 = [NSString stringWithFormat:@"rawSpeechProfile contains an AppInfo item with an unexpected number of speech words (expected only 1): %@", v8];
    v45 = v29;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    v31 = v28;
    uint64_t v32 = 1;
    goto LABEL_16;
  }
  if (([v9 isEqualToString:@"appname"] & 1) == 0)
  {
    v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28228];
    v29 = [NSString stringWithFormat:@"Unexpected namespace: %@ expected: %@", v9, @"appname"];
    v43 = v29;
    v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    v31 = v33;
    uint64_t v32 = 3;
LABEL_16:
    v34 = [v31 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:v32 userInfo:v30];
    v35 = v34;
    if (a5 && v34) {
      *a5 = v34;
    }

LABEL_20:
    v20 = 0;
    goto LABEL_21;
  }
  v10 = +[CESRRawSpeechProfileTools placeholderItemIdWithCategoryName:@"appinfo"];
  v11 = [v8 firstObject];
  v12 = [v11 orthography];

  builder = self->_builder;
  id v39 = 0;
  id v14 = (id)[(KVItemBuilder *)builder setItemType:3 itemId:v10 error:&v39];
  id v15 = v39;
  v16 = self->_builder;
  id v38 = v15;
  v17 = [(KVItemBuilder *)v16 addFieldWithType:102 value:v12 error:&v38];
  id v18 = v38;

  if (!v17) {
    goto LABEL_7;
  }
  v19 = self->_builder;
  id v37 = v18;
  v20 = [(KVItemBuilder *)v19 buildItemWithError:&v37];
  id v21 = v37;

  id v18 = v21;
  if (!v20)
  {
LABEL_7:
    v22 = (void *)MEMORY[0x1E4F28C58];
    v40[0] = *MEMORY[0x1E4F28228];
    v23 = [NSString stringWithFormat:@"failed to process word: \"%@\" due to builder error.", v12];
    v40[1] = *MEMORY[0x1E4F28A50];
    v41[0] = v23;
    v41[1] = v18;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:v40 count:2];
    v25 = [v22 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:6 userInfo:v24];
    v26 = v25;
    if (a5 && v25) {
      *a5 = v25;
    }

    v20 = 0;
  }

LABEL_21:

  return v20;
}

- (id)speechCategoryId
{
  return @"com.apple.siri.applications";
}

- (CESRRawSpeechProfileItemConverterAppInfo)init
{
  v6.receiver = self;
  v6.super_class = (Class)CESRRawSpeechProfileItemConverterAppInfo;
  v2 = [(CESRRawSpeechProfileItemConverterAppInfo *)&v6 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x1E4F71FF8]);
    builder = v2->_builder;
    v2->_builder = v3;
  }
  return v2;
}

@end