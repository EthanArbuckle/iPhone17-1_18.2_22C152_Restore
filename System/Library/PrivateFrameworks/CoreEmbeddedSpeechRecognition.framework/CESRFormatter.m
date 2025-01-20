@interface CESRFormatter
- (CESRFormatter)initWithAssetConfig:(id)a3;
- (id)formatSpeechTokensWithAutoPunctuation:(id)a3;
@end

@implementation CESRFormatter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetConfig, 0);

  objc_storeStrong((id *)&self->_formatter, 0);
}

- (id)formatSpeechTokensWithAutoPunctuation:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[CESRUtilities earTokensForAFTokens:v4 appendedAutoPunctuation:0];
  if (objc_opt_respondsToSelector())
  {
    v6 = [(_EARFormatter *)self->_formatter formatWords:v5 task:@"Dictation" autoPunctuate:1 recognizeEmoji:1];
    id v7 = +[CESRUtilities afTokensForEARTokens:v6 removeSpaceBefore:0];
  }
  else
  {
    v8 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315138;
      v11 = "-[CESRFormatter formatSpeechTokensWithAutoPunctuation:]";
      _os_log_error_impl(&dword_1B8CCB000, v8, OS_LOG_TYPE_ERROR, "%s Method 'formatWords' not found in EARFormatter", (uint8_t *)&v10, 0xCu);
    }
    id v7 = v4;
  }

  return v7;
}

- (CESRFormatter)initWithAssetConfig:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CESRFormatter;
  v6 = [(CESRFormatter *)&v18 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetConfig, a3);
    v8 = [MEMORY[0x1E4F3C268] sharedInstance];
    v9 = [v8 installedAssetWithConfig:v7->_assetConfig];

    if (v9 && [v9 length])
    {
      int v10 = [v9 stringByAppendingPathComponent:@"mini.json"];
      if (_os_feature_enabled_impl()) {
        uint64_t v11 = AFIsUODCapableHorsemanDevice() ^ 1;
      }
      else {
        uint64_t v11 = 0;
      }
      id v13 = objc_alloc(MEMORY[0x1E4F60FD0]);
      v14 = [(SFEntitledAssetConfig *)v7->_assetConfig language];
      uint64_t v15 = [v13 initWithQuasarConfig:v10 overrideConfigFiles:0 supportEmojiRecognition:v11 language:v14];
      formatter = v7->_formatter;
      v7->_formatter = (_EARFormatter *)v15;

      uint64_t v12 = v7;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

@end