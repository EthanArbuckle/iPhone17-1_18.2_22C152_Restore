@interface HUVoiceSelectionDataManager
- (HUVoiceSelectionDataManager)initWithInputLanguageCode:(id)a3 listOfVoices:(id)a4;
- (NSArray)listOfVoices;
- (NSString)inputLanguageCode;
- (id)voicesForRecognitionLanguageCode:(id)a3 outputLanguageCode:(id)a4;
- (void)setInputLanguageCode:(id)a3;
- (void)setListOfVoices:(id)a3;
@end

@implementation HUVoiceSelectionDataManager

- (HUVoiceSelectionDataManager)initWithInputLanguageCode:(id)a3 listOfVoices:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUVoiceSelectionDataManager;
  v9 = [(SUICVoiceSelectionDefaultDataManager *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_inputLanguageCode, a3);
    objc_storeStrong((id *)&v10->_listOfVoices, a4);
  }

  return v10;
}

- (id)voicesForRecognitionLanguageCode:(id)a3 outputLanguageCode:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  v9 = [(HUVoiceSelectionDataManager *)self listOfVoices];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  v18 = __83__HUVoiceSelectionDataManager_voicesForRecognitionLanguageCode_outputLanguageCode___block_invoke;
  v19 = &unk_1E6388D08;
  id v20 = v6;
  v21 = self;
  id v22 = v7;
  id v10 = v8;
  id v23 = v10;
  id v11 = v7;
  id v12 = v6;
  objc_msgSend(v9, "na_each:", &v16);

  v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v10;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "Returning matchingVoices = %@", buf, 0xCu);
  }

  v14 = objc_msgSend(v10, "copy", v16, v17, v18, v19);

  return v14;
}

void __83__HUVoiceSelectionDataManager_voicesForRecognitionLanguageCode_outputLanguageCode___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = *(void **)(a1 + 32);
  v4 = [*(id *)(a1 + 40) inputLanguageCode];
  if ([v3 isEqualToString:v4])
  {
    v5 = *(void **)(a1 + 48);
    id v6 = [v8 languageCode];
    LODWORD(v5) = [v5 isEqualToString:v6];

    id v7 = v8;
    if (!v5) {
      goto LABEL_6;
    }
    [*(id *)(a1 + 56) addObject:v8];
  }
  else
  {
  }
  id v7 = v8;
LABEL_6:
}

- (NSArray)listOfVoices
{
  return self->_listOfVoices;
}

- (void)setListOfVoices:(id)a3
{
}

- (NSString)inputLanguageCode
{
  return self->_inputLanguageCode;
}

- (void)setInputLanguageCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputLanguageCode, 0);

  objc_storeStrong((id *)&self->_listOfVoices, 0);
}

@end