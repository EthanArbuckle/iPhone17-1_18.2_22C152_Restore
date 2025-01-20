@interface CESRRawSpeechProfileItemConverterFindMy
- (CESRRawSpeechProfileItemConverterFindMy)init;
- (id)speechCategoryId;
- (id)vocabularyItemFromSpeechWords:(id)a3 speechNamespace:(id)a4 error:(id *)a5;
@end

@implementation CESRRawSpeechProfileItemConverterFindMy

- (void).cxx_destruct
{
}

- (id)vocabularyItemFromSpeechWords:(id)a3 speechNamespace:(id)a4 error:(id *)a5
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8 && [v8 count])
  {
    if ([v8 count] == 1)
    {
      if ([v9 isEqualToString:@"deviceNames"])
      {
        v10 = +[CESRRawSpeechProfileTools placeholderItemIdWithCategoryName:v9];
        builder = self->_builder;
        id v38 = 0;
        id v12 = (id)[(KVItemBuilder *)builder setItemType:21 itemId:v10 error:&v38];
        id v13 = v38;
        v14 = [v8 firstObject];
        v15 = [v14 orthography];

        v16 = self->_builder;
        id v37 = v13;
        v17 = [(KVItemBuilder *)v16 addFieldWithType:950 value:v15 error:&v37];
        id v18 = v37;

        if (!v17) {
          goto LABEL_7;
        }
        v19 = self->_builder;
        id v36 = v18;
        v20 = [(KVItemBuilder *)v19 buildItemWithError:&v36];
        id v21 = v36;

        id v18 = v21;
        if (!v20)
        {
LABEL_7:
          v22 = (void *)MEMORY[0x1E4F28C58];
          v39[0] = *MEMORY[0x1E4F28228];
          v23 = [NSString stringWithFormat:@"failed to process word: \"%@\" due to builder error.", v15];
          v39[1] = *MEMORY[0x1E4F28A50];
          v40[0] = v23;
          v40[1] = v18;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:2];
          v25 = [v22 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:6 userInfo:v24];
          v26 = v25;
          if (a5 && v25) {
            *a5 = v25;
          }

          v20 = 0;
        }

        goto LABEL_21;
      }
      v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28228];
      v10 = [NSString stringWithFormat:@"Unexpected namespace: %@ for category: %@", v9, @"com.apple.icloud.fmip"];
      v42 = v10;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      v30 = v32;
      uint64_t v31 = 3;
    }
    else
    {
      v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F28228];
      v10 = [NSString stringWithFormat:@"rawSpeechProfile contains a FindMy item with an unexpected number of speech words (expected only 1): %@ namespace: %@", v8, v9];
      v44 = v10;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      v30 = v29;
      uint64_t v31 = 1;
    }
    v33 = [v30 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:v31 userInfo:v18];
    v34 = v33;
    if (a5 && v33) {
      *a5 = v33;
    }

    v20 = 0;
  }
  else
  {
    v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28228];
    v46[0] = @"rawSpeechProfile contains a FindMy item missing speech words.";
    v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
    v28 = [v27 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:1 userInfo:v10];
    id v18 = v28;
    v20 = 0;
    if (a5 && v28)
    {
      id v18 = v28;
      v20 = 0;
      *a5 = v18;
    }
  }
LABEL_21:

  return v20;
}

- (id)speechCategoryId
{
  return @"com.apple.icloud.fmip";
}

- (CESRRawSpeechProfileItemConverterFindMy)init
{
  v6.receiver = self;
  v6.super_class = (Class)CESRRawSpeechProfileItemConverterFindMy;
  v2 = [(CESRRawSpeechProfileItemConverterFindMy *)&v6 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x1E4F71FF8]);
    builder = v2->_builder;
    v2->_builder = v3;
  }
  return v2;
}

@end