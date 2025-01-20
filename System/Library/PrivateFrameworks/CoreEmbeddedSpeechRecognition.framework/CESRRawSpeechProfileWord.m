@interface CESRRawSpeechProfileWord
- (CESRRawSpeechProfileWord)init;
- (CESRRawSpeechProfileWord)initWithSpeechWordDictionary:(id)a3;
- (NSString)orthography;
- (NSString)tagValue;
- (id)_extractOrthographyFromSpeechWord:(id)a3;
- (id)_extractTagFromSpeechWord:(id)a3;
- (int64_t)tagType;
@end

@implementation CESRRawSpeechProfileWord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagValue, 0);

  objc_storeStrong((id *)&self->_orthography, 0);
}

- (NSString)tagValue
{
  return self->_tagValue;
}

- (int64_t)tagType
{
  return self->_tagType;
}

- (NSString)orthography
{
  return self->_orthography;
}

- (id)_extractOrthographyFromSpeechWord:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKey:@"orthography"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
  }
  else
  {
    v6 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      v9 = "-[CESRRawSpeechProfileWord _extractOrthographyFromSpeechWord:]";
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_error_impl(&dword_1B8CCB000, v6, OS_LOG_TYPE_ERROR, "%s Missing orthography string value in speech word: %@", (uint8_t *)&v8, 0x16u);
    }
    id v5 = 0;
  }

  return v5;
}

- (id)_extractTagFromSpeechWord:(id)a3
{
  id v3 = [a3 objectForKey:@"tag"];
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 objectForKey:@"string"];
LABEL_6:
      id v5 = v4;
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = v3;
      goto LABEL_6;
    }
  }
  id v5 = 0;
LABEL_8:

  return v5;
}

- (CESRRawSpeechProfileWord)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"You must use -initWithSpeechWordDictionary" userInfo:MEMORY[0x1E4F1CC08]];
  objc_exception_throw(v2);
}

- (CESRRawSpeechProfileWord)initWithSpeechWordDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CESRRawSpeechProfileWord;
  id v5 = [(CESRRawSpeechProfileWord *)&v15 init];
  if (!v5) {
    goto LABEL_5;
  }
  if (!v4 || ![v4 count])
  {
    v13 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[CESRRawSpeechProfileWord initWithSpeechWordDictionary:]";
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_error_impl(&dword_1B8CCB000, v13, OS_LOG_TYPE_ERROR, "%s Cannot construct speech word from empty dictionary: %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  v6 = [(CESRRawSpeechProfileWord *)v5 _extractTagFromSpeechWord:v4];
  uint64_t v7 = [v6 copy];
  tagValue = v5->_tagValue;
  v5->_tagValue = (NSString *)v7;

  v5->_tagType = CESRRawSpeechProfileWordTagFromString(v5->_tagValue);
  v9 = [(CESRRawSpeechProfileWord *)v5 _extractOrthographyFromSpeechWord:v4];
  uint64_t v10 = [v9 copy];
  orthography = v5->_orthography;
  v5->_orthography = (NSString *)v10;

  if (!v5->_orthography)
  {
LABEL_8:
    uint64_t v12 = 0;
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v12 = v5;
LABEL_9:

  return v12;
}

@end