@interface CPNowPlayingTemplate
+ (BOOL)supportsSecureCoding;
+ (CPNowPlayingTemplate)sharedTemplate;
- (BOOL)isAlbumArtistButtonEnabled;
- (BOOL)isUpNextButtonEnabled;
- (CARObserverHashTable)nowPlayingObservers;
- (CPNowPlayingTemplate)init;
- (CPNowPlayingTemplate)initWithCoder:(id)a3;
- (NSArray)nowPlayingButtons;
- (NSString)upNextTitle;
- (id)_updateLowerRegionButtons:(id)a3;
- (id)leadingNavigationBarButtons;
- (id)trailingNavigationBarButtons;
- (void)_updateNowPlayingTemplateWithThrottle:(BOOL)a3;
- (void)addObserver:(id)observer;
- (void)albumArtistButtonTapped;
- (void)encodeWithCoder:(id)a3;
- (void)handleAction:(int64_t)a3 forControlIdentifier:(id)a4;
- (void)handleActionForControlIdentifier:(id)a3;
- (void)removeObserver:(id)observer;
- (void)setAlbumArtistButtonEnabled:(BOOL)albumArtistButtonEnabled;
- (void)setLeadingNavigationBarButtons:(id)a3;
- (void)setNowPlayingObservers:(id)a3;
- (void)setTrailingNavigationBarButtons:(id)a3;
- (void)setUpNextButtonEnabled:(BOOL)upNextButtonEnabled;
- (void)setUpNextTitle:(NSString *)upNextTitle;
- (void)upNextButtonTapped;
- (void)updateNowPlayingButtons:(NSArray *)nowPlayingButtons;
@end

@implementation CPNowPlayingTemplate

- (CPNowPlayingTemplate)init
{
  v7.receiver = self;
  v7.super_class = (Class)CPNowPlayingTemplate;
  v2 = [(CPTemplate *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F30E18]);
    uint64_t v4 = [v3 initWithProtocol:&unk_26C97E9C0 callbackQueue:MEMORY[0x263EF83A0]];
    nowPlayingObservers = v2->_nowPlayingObservers;
    v2->_nowPlayingObservers = (CARObserverHashTable *)v4;
  }
  return v2;
}

+ (CPNowPlayingTemplate)sharedTemplate
{
  if (sharedTemplate_onceToken != -1) {
    dispatch_once(&sharedTemplate_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sharedTemplate___template;

  return (CPNowPlayingTemplate *)v2;
}

uint64_t __38__CPNowPlayingTemplate_sharedTemplate__block_invoke()
{
  sharedTemplate___template = objc_alloc_init(CPNowPlayingTemplate);

  return MEMORY[0x270F9A758]();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPNowPlayingTemplate)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CPNowPlayingTemplate;
  v5 = [(CPTemplate *)&v20 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    v14 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"kCPTemplateLowerRegionButtons"];
    nowPlayingButtons = v5->_nowPlayingButtons;
    v5->_nowPlayingButtons = (NSArray *)v15;

    v5->_upNextButtonEnabled = [v4 decodeBoolForKey:@"kCPTemplateUpNextEnabledKey"];
    v5->_albumArtistButtonEnabled = [v4 decodeBoolForKey:@"kCPTemplateAlbumArtistButtonEnabledKey"];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kCPTemplateUpNextTitleKey"];
    upNextTitle = v5->_upNextTitle;
    v5->_upNextTitle = (NSString *)v17;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CPNowPlayingTemplate;
  id v4 = a3;
  [(CPTemplate *)&v9 encodeWithCoder:v4];
  v5 = [(CPNowPlayingTemplate *)self nowPlayingButtons];
  [v4 encodeObject:v5 forKey:@"kCPTemplateLowerRegionButtons"];

  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[CPNowPlayingTemplate isUpNextButtonEnabled](self, "isUpNextButtonEnabled"));
  [v4 encodeObject:v6 forKey:@"kCPTemplateUpNextEnabledKey"];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[CPNowPlayingTemplate isAlbumArtistButtonEnabled](self, "isAlbumArtistButtonEnabled"));
  [v4 encodeObject:v7 forKey:@"kCPTemplateAlbumArtistButtonEnabledKey"];

  uint64_t v8 = [(CPNowPlayingTemplate *)self upNextTitle];
  [v4 encodeObject:v8 forKey:@"kCPTemplateUpNextTitleKey"];
}

- (void)addObserver:(id)observer
{
  id v4 = observer;
  id v5 = [(CPNowPlayingTemplate *)self nowPlayingObservers];
  [v5 registerObserver:v4];
}

- (void)removeObserver:(id)observer
{
  id v4 = observer;
  id v5 = [(CPNowPlayingTemplate *)self nowPlayingObservers];
  [v5 unregisterObserver:v4];
}

- (void)updateNowPlayingButtons:(NSArray *)nowPlayingButtons
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = [(CPNowPlayingTemplate *)self _updateLowerRegionButtons:nowPlayingButtons];
  id v5 = self->_nowPlayingButtons;
  self->_nowPlayingButtons = v4;

  v6 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [(CPNowPlayingTemplate *)self nowPlayingButtons];
    int v8 = 138412546;
    objc_super v9 = self;
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl(&dword_2181A5000, v6, OS_LOG_TYPE_DEFAULT, "%@: Update now playing buttons %@", (uint8_t *)&v8, 0x16u);
  }
  [(CPNowPlayingTemplate *)self _updateNowPlayingTemplateWithThrottle:1];
}

- (void)setUpNextButtonEnabled:(BOOL)upNextButtonEnabled
{
  if (self->_upNextButtonEnabled != upNextButtonEnabled)
  {
    self->_upNextButtonEnabled = upNextButtonEnabled;
    [(CPNowPlayingTemplate *)self _updateNowPlayingTemplateWithThrottle:0];
  }
}

- (void)setUpNextTitle:(NSString *)upNextTitle
{
  id v5 = upNextTitle;
  if (!-[NSString isEqualToString:](self->_upNextTitle, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_upNextTitle, upNextTitle);
    [(CPNowPlayingTemplate *)self _updateNowPlayingTemplateWithThrottle:0];
  }
}

- (void)setAlbumArtistButtonEnabled:(BOOL)albumArtistButtonEnabled
{
  if (self->_albumArtistButtonEnabled != albumArtistButtonEnabled)
  {
    self->_albumArtistButtonEnabled = albumArtistButtonEnabled;
    [(CPNowPlayingTemplate *)self _updateNowPlayingTemplateWithThrottle:0];
  }
}

- (void)handleAction:(int64_t)a3 forControlIdentifier:(id)a4
{
  id v6 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CPNowPlayingTemplate_handleAction_forControlIdentifier___block_invoke;
  block[3] = &unk_26430A4F8;
  block[4] = self;
  id v9 = v6;
  int64_t v10 = a3;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__CPNowPlayingTemplate_handleAction_forControlIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v2 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = [v3 nowPlayingButtons];
    *(_DWORD *)buf = 138412802;
    v28 = v3;
    __int16 v29 = 2112;
    uint64_t v30 = v4;
    __int16 v31 = 2112;
    v32 = v5;
    _os_log_impl(&dword_2181A5000, v2, OS_LOG_TYPE_DEFAULT, "%@: handle action for identifier %@ in now playing buttons %@", buf, 0x20u);
  }
  id v6 = [*(id *)(a1 + 32) nowPlayingButtons];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __58__CPNowPlayingTemplate_handleAction_forControlIdentifier___block_invoke_93;
  v18 = &unk_26430A4D0;
  id v19 = *(id *)(a1 + 40);
  objc_super v20 = &v21;
  [v6 enumerateObjectsUsingBlock:&v15];

  if (v22[5])
  {
    id v7 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = v22[5];
      id v9 = *(void **)(a1 + 32);
      int64_t v10 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v28 = v9;
      __int16 v29 = 2112;
      uint64_t v30 = v8;
      __int16 v31 = 2112;
      v32 = v10;
      _os_log_impl(&dword_2181A5000, v7, OS_LOG_TYPE_DEFAULT, "%@: Activated button: %@ for control identifier: %@", buf, 0x20u);
    }

    uint64_t v11 = *(void *)(a1 + 48);
    if (v11 == 2)
    {
      objc_msgSend((id)v22[5], "handlePressesEnd", v15, v16, v17, v18);
    }
    else if (v11 == 1)
    {
      objc_msgSend((id)v22[5], "handlePressesStart", v15, v16, v17, v18);
    }
    else
    {
      objc_msgSend((id)v22[5], "handlePrimaryAction", v15, v16, v17, v18);
    }
  }
  else
  {
    uint64_t v12 = CarPlayFrameworkGeneralLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void **)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v28 = v13;
      __int16 v29 = 2112;
      uint64_t v30 = v14;
      _os_log_impl(&dword_2181A5000, v12, OS_LOG_TYPE_DEFAULT, "%@: No available button for identifier %@", buf, 0x16u);
    }
  }
  _Block_object_dispose(&v21, 8);
}

void __58__CPNowPlayingTemplate_handleAction_forControlIdentifier___block_invoke_93(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = [v9 identifier];
  int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (void)upNextButtonTapped
{
  id v3 = [(CPNowPlayingTemplate *)self nowPlayingObservers];
  [v3 nowPlayingTemplateUpNextButtonTapped:self];
}

- (void)albumArtistButtonTapped
{
  id v3 = [(CPNowPlayingTemplate *)self nowPlayingObservers];
  [v3 nowPlayingTemplateAlbumArtistButtonTapped:self];
}

- (void)handleActionForControlIdentifier:(id)a3
{
}

- (id)leadingNavigationBarButtons
{
  return 0;
}

- (void)setLeadingNavigationBarButtons:(id)a3
{
}

- (id)trailingNavigationBarButtons
{
  return 0;
}

- (void)setTrailingNavigationBarButtons:(id)a3
{
}

- (id)_updateLowerRegionButtons:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 count] < 6)
  {
    id v6 = v4;
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x263F088D0], "indexSetWithIndexesInRange:", 0, 5);
    id v6 = [v4 objectsAtIndexes:v5];
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__CPNowPlayingTemplate__updateLowerRegionButtons___block_invoke;
  v8[3] = &unk_26430A520;
  v8[4] = self;
  [v6 enumerateObjectsUsingBlock:v8];

  return v6;
}

uint64_t __50__CPNowPlayingTemplate__updateLowerRegionButtons___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setDelegate:*(void *)(a1 + 32)];
}

- (void)_updateNowPlayingTemplateWithThrottle:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  id v5 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_loadWeakRetained(&location);
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl(&dword_2181A5000, v5, OS_LOG_TYPE_DEFAULT, "%@: Updating now playing template", buf, 0xCu);
  }
  id v7 = [(CPTemplate *)self templateProviderFuture];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__CPNowPlayingTemplate__updateNowPlayingTemplateWithThrottle___block_invoke;
  v9[3] = &unk_26430A548;
  objc_copyWeak(&v10, &location);
  BOOL v11 = a3;
  id v8 = (id)[v7 addSuccessBlock:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __62__CPNowPlayingTemplate__updateNowPlayingTemplateWithThrottle___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CarPlayFrameworkGeneralLogging();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v11 = 138412290;
    id v12 = WeakRetained;
    _os_log_impl(&dword_2181A5000, v4, OS_LOG_TYPE_DEFAULT, "%@: Executing Future success block", (uint8_t *)&v11, 0xCu);
  }
  id v6 = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = NSNumber;
  uint64_t v8 = *(unsigned __int8 *)(a1 + 40);
  id v9 = v6;
  id v10 = [v7 numberWithBool:v8];
  [v3 updateNowPlayingTemplate:v9 withProxyDelegate:v9 canThrottle:v10];
}

- (NSArray)nowPlayingButtons
{
  return self->_nowPlayingButtons;
}

- (BOOL)isUpNextButtonEnabled
{
  return self->_upNextButtonEnabled;
}

- (NSString)upNextTitle
{
  return self->_upNextTitle;
}

- (BOOL)isAlbumArtistButtonEnabled
{
  return self->_albumArtistButtonEnabled;
}

- (CARObserverHashTable)nowPlayingObservers
{
  return self->_nowPlayingObservers;
}

- (void)setNowPlayingObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nowPlayingObservers, 0);
  objc_storeStrong((id *)&self->_upNextTitle, 0);

  objc_storeStrong((id *)&self->_nowPlayingButtons, 0);
}

@end