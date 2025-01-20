@interface CESRRawSpeechProfileItemConverterContact
- (CESRRawSpeechProfileItemConverterContact)init;
- (id)_companyContactFromSpeechWords:(id)a3 error:(id *)a4;
- (id)_standardContactFromSpeechWords:(id)a3 error:(id *)a4;
- (id)speechCategoryId;
- (id)vocabularyItemFromSpeechWords:(id)a3 speechNamespace:(id)a4 error:(id *)a5;
@end

@implementation CESRRawSpeechProfileItemConverterContact

- (void).cxx_destruct
{
}

- (id)_companyContactFromSpeechWords:(id)a3 error:(id *)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (![v6 count])
  {
    v14 = 0;
    goto LABEL_17;
  }
  if ((unint64_t)[v6 count] >= 2)
  {
    v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28228];
    v8 = NSString;
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    id v10 = [v8 stringWithFormat:@"rawSpeechProfile contains unexpected number of company speech words. Expected: 1 found: %@", v9];
    v34[0] = v10;
    v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    v12 = [v7 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:1 userInfo:v11];
    id v13 = v12;
    if (a4 && v12)
    {
      id v13 = v12;
      *a4 = v13;
    }
LABEL_15:

    v14 = 0;
    goto LABEL_16;
  }
  v9 = +[CESRRawSpeechProfileTools placeholderItemIdWithCategoryName:@"contacts"];
  builder = self->_builder;
  id v30 = 0;
  id v16 = (id)[(KVItemBuilder *)builder setItemType:2 itemId:v9 error:&v30];
  id v17 = v30;
  v18 = [v6 firstObject];
  v11 = [v18 orthography];

  v19 = self->_builder;
  id v29 = v17;
  v20 = [(KVItemBuilder *)v19 addFieldWithType:64 value:v11 error:&v29];
  id v21 = v29;

  if (!v20)
  {
    id v10 = v21;
    goto LABEL_11;
  }
  v22 = self->_builder;
  id v28 = v21;
  v14 = [(KVItemBuilder *)v22 buildItemWithError:&v28];
  id v10 = v28;

  if (!v14)
  {
LABEL_11:
    v23 = (void *)MEMORY[0x1E4F28C58];
    v31[0] = *MEMORY[0x1E4F28228];
    id v13 = [NSString stringWithFormat:@"failed to process word: \"%@\" due to builder error.", v11];
    v31[1] = *MEMORY[0x1E4F28A50];
    v32[0] = v13;
    v32[1] = v10;
    v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:2];
    v25 = [v23 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:6 userInfo:v24];
    v26 = v25;
    if (a4 && v25) {
      *a4 = v25;
    }

    goto LABEL_15;
  }
LABEL_16:

LABEL_17:

  return v14;
}

- (id)_standardContactFromSpeechWords:(id)a3 error:(id *)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = +[CESRRawSpeechProfileTools placeholderItemIdWithCategoryName:@"contacts"];
  builder = self->_builder;
  id v49 = 0;
  id v8 = (id)[(KVItemBuilder *)builder setItemType:2 itemId:v6 error:&v49];
  id v9 = v49;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
  if (!v10) {
    goto LABEL_10;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v46;
  v40 = v6;
  while (2)
  {
    uint64_t v13 = 0;
    v14 = v9;
    do
    {
      if (*(void *)v46 != v12) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v45 + 1) + 8 * v13);
      unint64_t v16 = [v15 tagType] - 1;
      if (v16 >= 6)
      {
        id v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v54 = *MEMORY[0x1E4F28228];
        id v30 = NSString;
        id v28 = [v15 tagValue];
        v31 = [v30 stringWithFormat:@"rawSpeechProfile contains unrecognized tag: \"%@\" in contact speech words", v28];
        v55 = v31;
        v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
        uint64_t v33 = [v29 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:1 userInfo:v32];
        id v34 = v33;
        if (a4 && v33)
        {
          id v34 = v33;
          *a4 = v34;
        }
        id v9 = v14;
        goto LABEL_22;
      }
      uint64_t v17 = qword_1B8E17AD8[v16];
      v18 = self->_builder;
      v19 = [v15 orthography];
      id v44 = v14;
      v20 = [(KVItemBuilder *)v18 addFieldWithType:v17 value:v19 error:&v44];
      id v9 = v44;

      if (!v20)
      {
        v35 = (void *)MEMORY[0x1E4F28C58];
        v52[0] = *MEMORY[0x1E4F28228];
        v36 = NSString;
        id v28 = [v15 orthography];
        v31 = [v15 tagValue];
        v32 = [v36 stringWithFormat:@"failed to process word: \"%@\" with tag: \"%@\" due to builder error.", v28, v31];
        v52[1] = *MEMORY[0x1E4F28A50];
        v53[0] = v32;
        v53[1] = v9;
        id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:2];
        v37 = [v35 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:6 userInfo:v34];
        v38 = v37;
        if (a4 && v37) {
          *a4 = v37;
        }

LABEL_22:
        id v6 = v40;

        v26 = obj;
        goto LABEL_23;
      }
      ++v13;
      v14 = v9;
    }
    while (v11 != v13);
    uint64_t v11 = [obj countByEnumeratingWithState:&v45 objects:v56 count:16];
    id v6 = v40;
    if (v11) {
      continue;
    }
    break;
  }
LABEL_10:
  id v21 = v9;

  v22 = self->_builder;
  id v43 = v9;
  v23 = [(KVItemBuilder *)v22 buildItemWithError:&v43];
  id v9 = v43;

  if (!v23)
  {
    v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F28A50];
    v50[0] = *MEMORY[0x1E4F28228];
    v50[1] = v25;
    v51[0] = @"failed to build item";
    v51[1] = v9;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:2];
    v27 = [v24 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:6 userInfo:v26];
    id v28 = v27;
    if (a4 && v27)
    {
      id v28 = v27;
      *a4 = v28;
    }
LABEL_23:

    v23 = 0;
  }

  return v23;
}

- (id)vocabularyItemFromSpeechWords:(id)a3 speechNamespace:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8 && [v8 count])
  {
    if ([v9 isEqualToString:@"contacts"])
    {
      uint64_t v10 = [(CESRRawSpeechProfileItemConverterContact *)self _standardContactFromSpeechWords:v8 error:a5];
LABEL_7:
      uint64_t v11 = (void *)v10;
      goto LABEL_13;
    }
    if ([v9 isEqualToString:@"company"])
    {
      uint64_t v10 = [(CESRRawSpeechProfileItemConverterContact *)self _companyContactFromSpeechWords:v8 error:a5];
      goto LABEL_7;
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28228];
    uint64_t v13 = [NSString stringWithFormat:@"Unexpected namespace: %@ expected: %@", v9, @"contacts"];
    v19[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    v15 = [v12 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:3 userInfo:v14];
    unint64_t v16 = v15;
    if (a5 && v15) {
      *a5 = v15;
    }
  }
  uint64_t v11 = 0;
LABEL_13:

  return v11;
}

- (id)speechCategoryId
{
  return @"com.apple.contact.people";
}

- (CESRRawSpeechProfileItemConverterContact)init
{
  v6.receiver = self;
  v6.super_class = (Class)CESRRawSpeechProfileItemConverterContact;
  v2 = [(CESRRawSpeechProfileItemConverterContact *)&v6 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x1E4F71FF8]);
    builder = v2->_builder;
    v2->_builder = v3;
  }
  return v2;
}

@end