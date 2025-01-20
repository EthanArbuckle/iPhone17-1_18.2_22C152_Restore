@interface CESRRawSpeechProfileItemConverterCustomTerm
- (CESRRawSpeechProfileItemConverterCustomTerm)init;
- (id)speechCategoryId;
- (id)vocabularyItemFromSpeechWords:(id)a3 speechNamespace:(id)a4 error:(id *)a5;
@end

@implementation CESRRawSpeechProfileItemConverterCustomTerm

- (void).cxx_destruct
{
}

- (id)vocabularyItemFromSpeechWords:(id)a3 speechNamespace:(id)a4 error:(id *)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!v8 || ![v8 count])
  {
    v20 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v59 = "-[CESRRawSpeechProfileItemConverterCustomTerm vocabularyItemFromSpeechWords:speechNamespace:error:]";
      __int16 v60 = 2112;
      id v61 = v9;
      _os_log_debug_impl(&dword_1B8CCB000, v20, OS_LOG_TYPE_DEBUG, "%s rawSpeechProfile contains a SiriKit custom vocabulary item missing speech words. namespace: %@", buf, 0x16u);
    }
    goto LABEL_36;
  }
  if ([v8 count] != 1)
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v56 = *MEMORY[0x1E4F28228];
    v22 = [NSString stringWithFormat:@"rawSpeechProfile contains a SiriKit custom vocabulary item with an unexpected number of speech words (expected only 1): %@ namespace: %@", v8, v9];
    v57 = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
    v24 = [v21 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:1 userInfo:v23];
    v25 = v24;
    if (a5 && v24) {
      *a5 = v24;
    }

LABEL_36:
    v38 = 0;
    goto LABEL_37;
  }
  id v10 = v9;
  if (_reverseLookupFieldTypeFromOntologyLabel_onceToken != -1) {
    dispatch_once(&_reverseLookupFieldTypeFromOntologyLabel_onceToken, &__block_literal_global_173);
  }
  v11 = [(id)_reverseLookupFieldTypeFromOntologyLabel_lookupCache objectForKey:v10];
  if (([v11 BOOLValue] & 1) == 0)
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v12 = (id)_reverseLookupFieldTypeFromOntologyLabel_validFieldTypes;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:buf count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v46 = self;
      uint64_t v15 = *(void *)v51;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v51 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          unint64_t v18 = KVFieldTypeFromNumber() - 1;
          if (v18 > 0x10) {
            v19 = 0;
          }
          else {
            v19 = off_1E61C2B48[v18];
          }
          if ([v10 isEqualToString:v19])
          {
            id v26 = v17;

            [(id)_reverseLookupFieldTypeFromOntologyLabel_lookupCache setObject:v26 forKey:v10];
            v11 = v26;
            goto LABEL_26;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:buf count:16];
        if (v14) {
          continue;
        }
        break;
      }
LABEL_26:
      self = v46;
    }
  }
  uint64_t v27 = KVFieldTypeFromNumber();

  if (!KVFieldTypeIsValid()) {
    goto LABEL_36;
  }
  v28 = +[CESRRawSpeechProfileTools placeholderItemIdWithCategoryName:@"customterm"];
  builder = self->_builder;
  id v49 = 0;
  id v30 = (id)[(KVItemBuilder *)builder setItemType:1 itemId:v28 error:&v49];
  id v31 = v49;
  v32 = [v8 firstObject];
  v33 = [v32 orthography];

  v34 = self->_builder;
  id v48 = v31;
  v35 = [(KVItemBuilder *)v34 addFieldWithType:v27 value:v33 error:&v48];
  id v36 = v48;

  if (!v35) {
    goto LABEL_31;
  }
  v37 = self->_builder;
  id v47 = v36;
  v38 = [(KVItemBuilder *)v37 buildItemWithError:&v47];
  id v39 = v47;

  id v36 = v39;
  if (!v38)
  {
LABEL_31:
    v40 = (void *)MEMORY[0x1E4F28C58];
    v54[0] = *MEMORY[0x1E4F28228];
    v41 = [NSString stringWithFormat:@"failed to process word: \"%@\" due to builder error.", v33];
    v54[1] = *MEMORY[0x1E4F28A50];
    v55[0] = v41;
    v55[1] = v36;
    v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:v54 count:2];
    v43 = [v40 errorWithDomain:@"com.apple.siri.speech-profile.tools" code:6 userInfo:v42];
    v44 = v43;
    if (a5 && v43) {
      *a5 = v43;
    }

    v38 = 0;
  }

LABEL_37:

  return v38;
}

- (id)speechCategoryId
{
  return @"com.apple.siri.vocabularyupdates";
}

- (CESRRawSpeechProfileItemConverterCustomTerm)init
{
  v6.receiver = self;
  v6.super_class = (Class)CESRRawSpeechProfileItemConverterCustomTerm;
  v2 = [(CESRRawSpeechProfileItemConverterCustomTerm *)&v6 init];
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x1E4F71FF8]);
    builder = v2->_builder;
    v2->_builder = v3;
  }
  return v2;
}

@end