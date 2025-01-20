@interface _SFReaderFontOptionsGroupController
- (BOOL)isSelectedValue:(id)a3;
- (BOOL)shouldSelectValue:(id)a3 forItem:(id)a4 groupItem:(id)a5;
- (NSArray)values;
- (SFReaderContext)readerContext;
- (_SFReaderFontOptionsGroupController)initWithReaderContext:(id)a3;
- (id)_attributedStringForReaderFont:(id)a3;
- (id)_downloadAccessoryForNotification:(id)a3;
- (id)_fontForFontNotification:(id)a3;
- (id)_itemForNotification:(id)a3;
- (id)_viewForNotification:(id)a3;
- (id)textStyleForValue:(id)a3;
- (void)_fontDownloadDidBegin:(id)a3;
- (void)_fontDownloadDidFail:(id)a3;
- (void)_fontDownloadDidFinish:(id)a3;
- (void)_fontDownloadProgressDidChange:(id)a3;
- (void)prepareView:(id)a3 forItem:(id)a4 value:(id)a5;
- (void)setSelectedValue:(id)a3;
@end

@implementation _SFReaderFontOptionsGroupController

- (_SFReaderFontOptionsGroupController)initWithReaderContext:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_SFReaderFontOptionsGroupController;
  v6 = [(_SFReaderFontOptionsGroupController *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_readerContext, a3);
    v8 = [MEMORY[0x1E4FB17A0] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2998]];
    [v8 pointSize];
    v7->_fontSize = v9;

    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    fontToItemDictionary = v7->_fontToItemDictionary;
    v7->_fontToItemDictionary = (NSMutableDictionary *)v10;

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
    fontToViewDictionary = v7->_fontToViewDictionary;
    v7->_fontToViewDictionary = (NSMutableDictionary *)v12;

    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v7 selector:sel__fontDownloadDidBegin_ name:*MEMORY[0x1E4F993E0] object:0];
    [v14 addObserver:v7 selector:sel__fontDownloadDidFail_ name:*MEMORY[0x1E4F993E8] object:0];
    [v14 addObserver:v7 selector:sel__fontDownloadDidFinish_ name:*MEMORY[0x1E4F993F0] object:0];
    [v14 addObserver:v7 selector:sel__fontDownloadProgressDidChange_ name:*MEMORY[0x1E4F99400] object:0];
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.SafariServices.ReaderFontInstallationStatusQueue", 0);
    fontInstallationStatusQueue = v7->_fontInstallationStatusQueue;
    v7->_fontInstallationStatusQueue = (OS_dispatch_queue *)v15;

    v17 = v7;
  }

  return v7;
}

- (NSArray)values
{
  v2 = [(SFReaderContext *)self->_readerContext fontManager];
  v3 = [v2 possibleFonts];

  return (NSArray *)v3;
}

- (BOOL)isSelectedValue:(id)a3
{
  readerContext = self->_readerContext;
  id v5 = a3;
  v6 = [(SFReaderContext *)readerContext configurationManager];
  v7 = [(SFReaderContext *)self->_readerContext fontManager];
  v8 = [v7 languageTag];
  double v9 = [v6 fontForLanguageTag:v8];
  uint64_t v10 = [v9 familyName];

  v11 = [v5 familyName];

  LOBYTE(v6) = [v11 isEqualToString:v10];
  return (char)v6;
}

- (void)setSelectedValue:(id)a3
{
}

- (BOOL)shouldSelectValue:(id)a3 forItem:(id)a4 groupItem:(id)a5
{
  return 1;
}

- (void)prepareView:(id)a3 forItem:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = v10;
  [(NSMutableDictionary *)self->_fontToItemDictionary setObject:v9 forKeyedSubscript:v11];
  [(NSMutableDictionary *)self->_fontToViewDictionary setObject:v8 forKeyedSubscript:v11];
  if ([v11 isReadyToUse])
  {
    [v9 setEnabled:1];
  }
  else
  {
    [v9 setEnabled:0];
    uint64_t v12 = [_SFReaderFontDownloadAccessory alloc];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke;
    v21[3] = &unk_1E5C74F58;
    id v13 = v11;
    id v22 = v13;
    v14 = [(_SFReaderFontDownloadAccessory *)v12 initWithTappedDownloadBlock:v21];
    [v8 setAccessoryView:v14];
    fontInstallationStatusQueue = self->_fontInstallationStatusQueue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __65___SFReaderFontOptionsGroupController_prepareView_forItem_value___block_invoke_2;
    v16[3] = &unk_1E5C74FD0;
    id v17 = v13;
    objc_copyWeak(&v20, &location);
    id v18 = v9;
    id v19 = v8;
    dispatch_async(fontInstallationStatusQueue, v16);

    objc_destroyWeak(&v20);
  }

  objc_destroyWeak(&location);
}

- (id)textStyleForValue:(id)a3
{
  return (id)*MEMORY[0x1E4FB2998];
}

- (id)_attributedStringForReaderFont:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  double fontSize = self->_fontSize;
  id v5 = a3;
  v6 = [v5 fontOfSize:fontSize];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB1798] systemFontOfSize:self->_fontSize];
  }
  id v9 = v8;

  uint64_t v10 = *MEMORY[0x1E4FB12B8];
  v17[0] = *MEMORY[0x1E4FB12B0];
  v17[1] = v10;
  v18[0] = v9;
  id v11 = [MEMORY[0x1E4FB1618] labelColor];
  v18[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];

  id v13 = objc_alloc(MEMORY[0x1E4F28B18]);
  v14 = [v5 displayName];

  dispatch_queue_t v15 = (void *)[v13 initWithString:v14 attributes:v12];

  return v15;
}

- (id)_fontForFontNotification:(id)a3
{
  v3 = [a3 userInfo];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F993F8]];

  return v4;
}

- (id)_itemForNotification:(id)a3
{
  fontToItemDictionary = self->_fontToItemDictionary;
  v4 = [(_SFReaderFontOptionsGroupController *)self _fontForFontNotification:a3];
  id v5 = [(NSMutableDictionary *)fontToItemDictionary objectForKeyedSubscript:v4];

  return v5;
}

- (id)_viewForNotification:(id)a3
{
  fontToViewDictionary = self->_fontToViewDictionary;
  v4 = [(_SFReaderFontOptionsGroupController *)self _fontForFontNotification:a3];
  id v5 = [(NSMutableDictionary *)fontToViewDictionary objectForKeyedSubscript:v4];

  return v5;
}

- (id)_downloadAccessoryForNotification:(id)a3
{
  v3 = [(_SFReaderFontOptionsGroupController *)self _viewForNotification:a3];
  v4 = [v3 accessoryView];

  return v4;
}

- (void)_fontDownloadDidBegin:(id)a3
{
  id v4 = [(_SFReaderFontOptionsGroupController *)self _downloadAccessoryForNotification:a3];
  [v4 setDownloading:1];
  v3 = [v4 progressView];
  [v3 setProgress:0.0];
}

- (void)_fontDownloadDidFinish:(id)a3
{
  id v4 = a3;
  id v10 = [(_SFReaderFontOptionsGroupController *)self _fontForFontNotification:v4];
  id v5 = [(_SFReaderFontOptionsGroupController *)self _itemForNotification:v4];
  v6 = [(_SFReaderFontOptionsGroupController *)self _attributedStringForReaderFont:v10];
  [v5 setAttributedTitle:v6];

  [v5 setEnabled:1];
  v7 = [(_SFReaderFontOptionsGroupController *)self _viewForNotification:v4];

  [v7 setAccessoryView:0];
  readerContext = self->_readerContext;
  id v9 = [v10 familyName];
  [(SFReaderContext *)readerContext activateFont:v9];
}

- (void)_fontDownloadDidFail:(id)a3
{
  id v3 = [(_SFReaderFontOptionsGroupController *)self _downloadAccessoryForNotification:a3];
  [v3 setDownloading:0];
}

- (void)_fontDownloadProgressDidChange:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F98D68];
  id v5 = a3;
  v6 = [v4 sharedManager];
  v7 = [(_SFReaderFontOptionsGroupController *)self _fontForFontNotification:v5];
  [v6 downloadProgressForFont:v7];
  double v9 = v8 / 100.0;

  id v12 = [(_SFReaderFontOptionsGroupController *)self _downloadAccessoryForNotification:v5];

  id v10 = [v12 progressView];
  *(float *)&double v9 = v9;
  LODWORD(v11) = LODWORD(v9);
  [v10 setProgress:v11];
}

- (SFReaderContext)readerContext
{
  return self->_readerContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerContext, 0);
  objc_storeStrong((id *)&self->_fontInstallationStatusQueue, 0);
  objc_storeStrong((id *)&self->_fontToViewDictionary, 0);

  objc_storeStrong((id *)&self->_fontToItemDictionary, 0);
}

@end