@interface CSLPRFAppViewChoiceCell
+ (double)preferredCellHeight;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (CSLPRFAppViewChoiceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSString)bundleID;
- (id)bundle;
- (id)localize:(id)a3;
- (void)launcherViewModeSettingChanged;
- (void)layoutSubviews;
- (void)retrieveImageForLauncherViewMode:(int64_t)a3 size:(CGSize)a4 completion:(id)a5;
- (void)watchChooser:(id)a3 madeChoice:(int64_t)a4;
@end

@implementation CSLPRFAppViewChoiceCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appViewSetting, 0);
  objc_storeStrong((id *)&self->_appViewChoiceView, 0);
}

- (void)retrieveImageForLauncherViewMode:(int64_t)a3 size:(CGSize)a4 completion:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a5;
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3893;
  v19 = __Block_byref_object_dispose__3894;
  v20 = objc_alloc_init(CSLPRFAppViewImageProvider);
  v10 = (void *)v16[5];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __76__CSLPRFAppViewChoiceCell_retrieveImageForLauncherViewMode_size_completion___block_invoke;
  v12[3] = &unk_264A0B770;
  v12[4] = self;
  v14 = &v15;
  id v11 = v9;
  id v13 = v11;
  objc_msgSend(v10, "retrieveImageForLauncherViewMode:size:completion:", a3, v12, width, height);

  _Block_object_dispose(&v15, 8);
}

void __76__CSLPRFAppViewChoiceCell_retrieveImageForLauncherViewMode_size_completion___block_invoke(void *a1, UIImage *image)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = UIImagePNGRepresentation(image);
  v4 = [MEMORY[0x263F827E8] imageWithData:v3 scale:2.0];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
    int v10 = 138412802;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    _os_log_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_INFO, ">>>> %@ %@ retrieved %@", (uint8_t *)&v10, 0x20u);
  }
  uint64_t v7 = a1[5];
  if (v7) {
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v4);
  }
  uint64_t v8 = *(void *)(a1[6] + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

- (void)launcherViewModeSettingChanged
{
  appViewChoiceView = self->_appViewChoiceView;
  int64_t v3 = [(CSLPRFLauncherViewModeSetting *)self->_appViewSetting launcherViewMode];
  [(CSLPRFAppViewChoiceView *)appViewChoiceView setWatchChoice:v3];
}

- (void)watchChooser:(id)a3 madeChoice:(int64_t)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v6;
    __int16 v9 = 1024;
    int v10 = a4;
    _os_log_impl(&dword_22F4EA000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, ">>>> watchChoiceProvider %@ madeChoice %d", (uint8_t *)&v7, 0x12u);
  }
  if ([(CSLPRFLauncherViewModeSetting *)self->_appViewSetting launcherViewMode] != a4) {
    [(CSLPRFLauncherViewModeSetting *)self->_appViewSetting setLauncherViewMode:a4 reason:2];
  }
}

- (NSString)bundleID
{
  v2 = [(CSLPRFAppViewChoiceCell *)self bundle];
  int64_t v3 = [v2 bundleIdentifier];

  return (NSString *)v3;
}

- (id)localize:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CSLPRFAppViewChoiceCell *)self bundle];
  id v6 = [v5 localizedStringForKey:v4 value:0 table:@"CarouselAppViewChoice"];

  if (!v6)
  {
    int v7 = [(CSLPRFAppViewChoiceCell *)self bundle];
    id v6 = [v7 localizedStringForKey:v4 value:0 table:@"CarouselAppViewChoice"];
  }
  return v6;
}

- (id)bundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 bundleForClass:v3];
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)CSLPRFAppViewChoiceCell;
  [(PSTableCell *)&v9 layoutSubviews];
  uint64_t v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 bounds];
  double v5 = v4;
  id v6 = [(CSLPRFAppViewChoiceCell *)self contentView];
  [v6 bounds];
  double v8 = (v5 - v7) * 0.5;

  [(CSLPRFAppViewChoiceView *)self->_appViewChoiceView setHorizontalOffset:v8];
  [(CSLPRFAppViewChoiceView *)self->_appViewChoiceView setNeedsLayout];
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  -[CSLPRFAppViewChoiceView systemLayoutSizeFittingSize:](self->_appViewChoiceView, "systemLayoutSizeFittingSize:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[CSLPRFAppViewChoiceCell systemLayoutSizeFittingSize:](self, "systemLayoutSizeFittingSize:", *MEMORY[0x263F83810], *(double *)(MEMORY[0x263F83810] + 8));
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CSLPRFAppViewChoiceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v35[4] = *MEMORY[0x263EF8340];
  v34.receiver = self;
  v34.super_class = (Class)CSLPRFAppViewChoiceCell;
  double v4 = [(CSLPRFAppViewChoiceCell *)&v34 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    double v5 = objc_alloc_init(CSLPRFLauncherViewModeSetting);
    appViewSetting = v4->_appViewSetting;
    v4->_appViewSetting = v5;

    [(CSLPRFLauncherViewModeSetting *)v4->_appViewSetting setDelegate:v4];
    v31 = +[CSLPRFWatchChoice watchChoices];
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __57__CSLPRFAppViewChoiceCell_initWithStyle_reuseIdentifier___block_invoke;
    v32[3] = &unk_264A0B748;
    double v7 = v4;
    v33 = v7;
    [v31 enumerateObjectsUsingBlock:v32];
    double v8 = [[CSLPRFAppViewChoiceView alloc] initWithDelegate:v7 horizontalOffset:v31 choices:0.0];
    id v9 = v7[149];
    v7[149] = v8;

    [v7[149] setTranslatesAutoresizingMaskIntoConstraints:0];
    int v10 = [v7 contentView];
    [v10 addSubview:v7[149]];

    uint64_t v11 = [v7 contentView];
    __int16 v12 = [MEMORY[0x263F825C8] blackColor];
    [v11 setBackgroundColor:v12];

    v29 = [v7[149] topAnchor];
    v30 = [v7 contentView];
    v28 = [v30 topAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v35[0] = v27;
    v25 = [v7[149] leadingAnchor];
    v26 = [v7 contentView];
    v24 = [v26 leadingAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v35[1] = v23;
    v22 = [v7[149] trailingAnchor];
    uint64_t v13 = [v7 contentView];
    __int16 v14 = [v13 trailingAnchor];
    uint64_t v15 = [v22 constraintEqualToAnchor:v14];
    v35[2] = v15;
    uint64_t v16 = [v7[149] bottomAnchor];
    uint64_t v17 = [v7 contentView];
    v18 = [v17 bottomAnchor];
    v19 = [v16 constraintEqualToAnchor:v18];
    v35[3] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:4];

    [MEMORY[0x263F08938] activateConstraints:v20];
    [v7 launcherViewModeSettingChanged];
  }
  return v4;
}

void __57__CSLPRFAppViewChoiceCell_initWithStyle_reuseIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v3 = +[CSLPRFAppViewImageCache getImageForLauncherMode:](CSLPRFAppViewImageCache, "getImageForLauncherMode:", [v4 choice]);
  if (v3) {
    [v4 setScreenImage:v3];
  }
  if ([v4 choice] == 2) {
    [v4 setImageProvider:*(void *)(a1 + 32)];
  }
}

+ (double)preferredCellHeight
{
  return 380.0;
}

@end