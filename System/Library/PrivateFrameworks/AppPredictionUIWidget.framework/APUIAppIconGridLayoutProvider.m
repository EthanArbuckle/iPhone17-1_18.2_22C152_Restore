@interface APUIAppIconGridLayoutProvider
- (APUIAppIconGridLayoutProvider)initWithLargeIconsEnabled:(BOOL)a3;
- (BOOL)isLargeIconsEnabled;
- (id)layoutForIconLocation:(id)a3;
- (unint64_t)mode;
- (void)setMode:(unint64_t)a3;
@end

@implementation APUIAppIconGridLayoutProvider

- (APUIAppIconGridLayoutProvider)initWithLargeIconsEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)APUIAppIconGridLayoutProvider;
  result = [(APUIAppIconGridLayoutProvider *)&v5 init];
  if (result) {
    result->_largeIconsEnabled = a3;
  }
  return result;
}

- (id)layoutForIconLocation:(id)a3
{
  id v4 = a3;
  if ([(APUIAppIconGridLayoutProvider *)self isLargeIconsEnabled]) {
    uint64_t v5 = 24;
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2050000000;
  v6 = (void *)getSBHDefaultIconListLayoutProviderClass_softClass;
  uint64_t v37 = getSBHDefaultIconListLayoutProviderClass_softClass;
  if (!getSBHDefaultIconListLayoutProviderClass_softClass)
  {
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __getSBHDefaultIconListLayoutProviderClass_block_invoke;
    v32 = &unk_264764990;
    v33 = &v34;
    __getSBHDefaultIconListLayoutProviderClass_block_invoke((uint64_t)&v29);
    v6 = (void *)v35[3];
  }
  v7 = v6;
  _Block_object_dispose(&v34, 8);
  v8 = (void *)[[v7 alloc] initWithLayoutOptions:v5];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  v9 = (void *)getSBIconLocationRootSymbolLoc_ptr;
  uint64_t v37 = getSBIconLocationRootSymbolLoc_ptr;
  if (!getSBIconLocationRootSymbolLoc_ptr)
  {
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __getSBIconLocationRootSymbolLoc_block_invoke;
    v32 = &unk_264764990;
    v33 = &v34;
    v10 = (void *)SpringBoardHomeLibrary();
    v11 = dlsym(v10, "SBIconLocationRoot");
    *(void *)(v33[1] + 24) = v11;
    getSBIconLocationRootSymbolLoc_ptr = *(void *)(v33[1] + 24);
    v9 = (void *)v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v9)
  {
    v28 = (_Unwind_Exception *)-[APUIAppIconGridLayoutProvider layoutForIconLocation:]();
    _Block_object_dispose(&v34, 8);
    _Unwind_Resume(v28);
  }
  v12 = [v8 makeLayoutForIconLocation:*v9];
  v13 = [v12 layoutConfiguration];
  [v13 setNumberOfPortraitColumns:4];

  v14 = [v12 layoutConfiguration];
  [v14 setNumberOfLandscapeColumns:4];

  v15 = [v12 layoutConfiguration];
  [v15 setNumberOfPortraitRows:2];

  v16 = [v12 layoutConfiguration];
  [v16 setNumberOfLandscapeRows:2];

  v17 = [v12 layoutConfiguration];
  [v17 portraitLayoutInsets];
  double v19 = v18;
  double v21 = v20;

  if (self->_mode == 1)
  {
    double v21 = 12.0;
    double v19 = 12.0;
    double v22 = 12.0;
  }
  else
  {
    double v22 = 0.0;
  }
  v23 = [v12 layoutConfiguration];
  objc_msgSend(v23, "setPortraitLayoutInsets:", v22, v19, v22, v21);

  v24 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v25 = [v24 userInterfaceIdiom];

  if ((v25 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v26 = [v12 layoutConfiguration];
    objc_msgSend(v26, "setLandscapeLayoutInsets:", 12.0, 12.0, 12.0, 12.0);
  }
  return v12;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (BOOL)isLargeIconsEnabled
{
  return self->_largeIconsEnabled;
}

- (uint64_t)layoutForIconLocation:.cold.1()
{
  return __getSBHDefaultIconListLayoutProviderClass_block_invoke_cold_1();
}

@end