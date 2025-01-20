@interface CESRRawSpeechProfileItemConverterMediaEntity
- (CESRRawSpeechProfileItemConverterMediaEntity)init;
- (id)speechCategoryId;
- (id)vocabularyItemFromSpeechWords:(id)a3 speechNamespace:(id)a4 error:(id *)a5;
@end

@implementation CESRRawSpeechProfileItemConverterMediaEntity

- (void).cxx_destruct
{
}

- (id)vocabularyItemFromSpeechWords:(id)a3 speechNamespace:(id)a4 error:(id *)a5
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8 && [v8 count])
  {
    if ([v8 count] == 1)
    {
      id v10 = v9;
      if ([v10 isEqualToString:@"artist"])
      {
        uint64_t v11 = 202;
        goto LABEL_16;
      }
      if ([v10 isEqualToString:@"playlist"])
      {
        uint64_t v11 = 216;
LABEL_16:

        v13 = +[CESRRawSpeechProfileTools placeholderItemIdWithCategoryName:v10];
        builder = self->_builder;
        id v40 = 0;
        id v23 = (id)[(KVItemBuilder *)builder setItemType:5 itemId:v13 error:&v40];
        id v24 = v40;
        v25 = [v8 firstObject];
        v26 = [v25 orthography];

        v27 = self->_builder;
        id v39 = v24;
        v28 = [(KVItemBuilder *)v27 addFieldWithType:v11 value:v26 error:&v39];
        id v15 = v39;

        if (!v28) {
          goto LABEL_18;
        }
        v29 = self->_builder;
        id v38 = v15;
        v16 = [(KVItemBuilder *)v29 buildItemWithError:&v38];
        id v30 = v38;

        id v15 = v30;
        if (!v16)
        {
LABEL_18:
          v31 = (void *)MEMORY[0x1E4F28C58];
          v41[0] = *MEMORY[0x1E4F28228];
          v32 = [NSString stringWithFormat:@"failed to process word: \"%@\" due to builder error.", v26];
          v41[1] = *MEMORY[0x1E4F28A50];
          v42[0] = v32;
          v42[1] = v15;
          v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:2];
          v34 = [v31 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:6 userInfo:v33];
          v35 = v34;
          if (a5 && v34) {
            *a5 = v34;
          }

          v16 = 0;
        }

        goto LABEL_23;
      }

      v37 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v43 = *MEMORY[0x1E4F28228];
      v13 = [NSString stringWithFormat:@"Unexpected namespace: %@ for category: %@", v10, @"com.apple.media.entities"];
      v44 = v13;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      v18 = v37;
      uint64_t v19 = 3;
    }
    else
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v45 = *MEMORY[0x1E4F28228];
      v13 = [NSString stringWithFormat:@"rawSpeechProfile contains a MediaEntity item with an unexpected number of speech words (expected only 1): %@ namespace: %@", v8, v9];
      v46 = v13;
      id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      v18 = v17;
      uint64_t v19 = 1;
    }
    v20 = [v18 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:v19 userInfo:v15];
    v21 = v20;
    if (a5 && v20) {
      *a5 = v20;
    }

    v16 = 0;
  }
  else
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28228];
    v48[0] = @"rawSpeechProfile contains a MediaEntity item missing speech words.";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    v14 = [v12 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:1 userInfo:v13];
    id v15 = v14;
    v16 = 0;
    if (a5 && v14)
    {
      id v15 = v14;
      v16 = 0;
      *a5 = v15;
    }
  }
LABEL_23:

  return v16;
}

- (id)speechCategoryId
{
  return @"com.apple.media.entities";
}

- (CESRRawSpeechProfileItemConverterMediaEntity)init
{
  v6.receiver = self;
  v6.super_class = (Class)CESRRawSpeechProfileItemConverterMediaEntity;
  v2 = [(CESRRawSpeechProfileItemConverterMediaEntity *)&v6 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x1E4F71FF8]);
    builder = v2->_builder;
    v2->_builder = v3;
  }
  return v2;
}

@end