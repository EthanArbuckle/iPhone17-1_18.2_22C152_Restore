@interface CSAttSiriAssetDownloadPromptIOS
- (BOOL)_requireNewAssetsForJSGivenCurrentVTAsset:(id)a3 mitigationAsset:(id)a4;
- (BOOL)_requireNewAssetsForMagusGivenCurrentAsset:(id)a3;
- (BOOL)checkIfNewAssetRequiredGivenCurrentVTAsset:(id)a3 mitigationAsset:(id)a4;
- (CSAttSiriAssetDownloadPromptIOS)initWithDelegate:(id)a3;
- (CSAttSiriAssetDownloadPromptIOSDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation CSAttSiriAssetDownloadPromptIOS

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (CSAttSiriAssetDownloadPromptIOSDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSAttSiriAssetDownloadPromptIOSDelegate *)WeakRetained;
}

- (BOOL)_requireNewAssetsForJSGivenCurrentVTAsset:(id)a3 mitigationAsset:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  unsigned __int8 v8 = +[CSUtils supportMph];
  unsigned __int8 v9 = +[CSUtils supportsMphForLanguageCode:v7];
  v10 = +[CSVoiceTriggerSecondPassConfigDecoder decodeConfigFrom:v6 forFirstPassSource:1];

  v11 = [v10 phraseConfigs];
  id v12 = [v11 count];

  unsigned int v13 = [v5 isJSSupported] ^ 1;
  if ((unint64_t)v12 < 2) {
    char v14 = 1;
  }
  else {
    char v14 = v13;
  }
  char v15 = v8 & v9 & v14;

  return v15;
}

- (BOOL)_requireNewAssetsForMagusGivenCurrentAsset:(id)a3
{
  id v3 = a3;
  v4 = +[CSUtils getSiriLanguageWithFallback:@"en-US"];
  unsigned __int8 v5 = +[CSUtils isIOSDeviceSupportingBargeIn];
  unsigned __int8 v6 = +[CSUtils supportsMagusForLanguageCode:v4];
  unsigned __int8 v7 = [v3 isMagusSupported];

  unsigned __int8 v8 = +[CSFPreferences sharedPreferences];
  unsigned __int8 v9 = [v8 isFlexibleFollowupsUserDisabled];

  return (v5 & v6 ^ 1 | v7 | v9) ^ 1;
}

- (BOOL)checkIfNewAssetRequiredGivenCurrentVTAsset:(id)a3 mitigationAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CSAttSiriAssetDownloadPromptIOS *)self _requireNewAssetsForJSGivenCurrentVTAsset:v6 mitigationAsset:v7]|| [(CSAttSiriAssetDownloadPromptIOS *)self _requireNewAssetsForMagusGivenCurrentAsset:v7])
  {
    unsigned __int8 v8 = (void *)CSLogCategoryAsset;
    if (os_log_type_enabled(CSLogCategoryAsset, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v9 = v8;
      v10 = [v6 configVersion];
      v11 = [v7 configVersion];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      int v21 = 136315906;
      v22 = "-[CSAttSiriAssetDownloadPromptIOS checkIfNewAssetRequiredGivenCurrentVTAsset:mitigationAsset:]";
      __int16 v23 = 2112;
      v24 = v10;
      __int16 v25 = 2112;
      v26 = v11;
      __int16 v27 = 2112;
      id v28 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Requesting asset update, VT asset version: %@ Mitigation asset version: %@, sending to delegate %@", (uint8_t *)&v21, 0x2Au);
    }
    p_delegate = &self->_delegate;
    id v14 = objc_loadWeakRetained((id *)p_delegate);
    if (v14)
    {
      char v15 = v14;
      id v16 = objc_loadWeakRetained((id *)p_delegate);
      char v17 = objc_opt_respondsToSelector();

      if (v17)
      {
        id v18 = objc_loadWeakRetained((id *)p_delegate);
        [v18 assetUpdatedRequired];
      }
    }
    BOOL v19 = 1;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (CSAttSiriAssetDownloadPromptIOS)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSAttSiriAssetDownloadPromptIOS;
  unsigned __int8 v5 = [(CSAttSiriAssetDownloadPromptIOS *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

@end