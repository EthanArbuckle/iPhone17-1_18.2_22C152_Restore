@interface AVMediaSelectionTableViewController
- (AVMediaSelectionTableViewController)initWithStyle:(int64_t)a3;
- (AVPlayerController)playerController;
- (BOOL)_isSelectedOrCurrentAudioMediaSelectionOption:(id)a3;
- (BOOL)_isSelectedOrCurrentLegibleMediaSelectionOption:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)dealloc;
- (void)playerControllerMediaSelectionChanged:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AVMediaSelectionTableViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_selectedLegibleMediaSelectionOption, 0);

  objc_storeStrong((id *)&self->_selectedAudioMediaSelectionOption, 0);
}

- (void)setPlayerController:(id)a3
{
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v9 = [(AVMediaSelectionTableViewController *)self playerController];
  [v8 removeObserver:self name:@"AVPlayerControllerSelectedMediaOptionDidChangeNotification" object:v9];

  v10 = self;
  v11 = [(AVMediaSelectionTableViewController *)self playerController];
  if (v11)
  {
    v12 = [v6 cellForRowAtIndexPath:v7];
    uint64_t v13 = [v12 representedObject];

    v14 = v11;
    v32 = (void *)v13;
    id v33 = v7;
    if ([v11 hasAudioMediaSelectionOptions] && !objc_msgSend(v7, "section"))
    {
      selectedAudioMediaSelectionOption = v10->_selectedAudioMediaSelectionOption;
      v10->_selectedAudioMediaSelectionOption = 0;

      [v11 setCurrentAudioMediaSelectionOption:v13];
    }
    else
    {
      selectedLegibleMediaSelectionOption = v10->_selectedLegibleMediaSelectionOption;
      v10->_selectedLegibleMediaSelectionOption = 0;

      [v11 setCurrentLegibleMediaSelectionOption:v13];
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = [v6 visibleCells];
    uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v36;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(obj);
          }
          v20 = *(void **)(*((void *)&v35 + 1) + 8 * v19);
          v21 = [v20 representedObject];
          if (![v14 hasAudioMediaSelectionOptions]) {
            goto LABEL_12;
          }
          [v6 indexPathForCell:v20];
          v22 = v14;
          v24 = id v23 = v6;
          uint64_t v25 = [v24 section];

          id v6 = v23;
          v14 = v22;
          if (!v25) {
            BOOL v26 = [(AVMediaSelectionTableViewController *)v10 _isSelectedOrCurrentAudioMediaSelectionOption:v21];
          }
          else {
LABEL_12:
          }
            BOOL v26 = [(AVMediaSelectionTableViewController *)v10 _isSelectedOrCurrentLegibleMediaSelectionOption:v21];
          if (v26) {
            uint64_t v27 = 3;
          }
          else {
            uint64_t v27 = 0;
          }
          [v20 setAccessoryType:v27];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        uint64_t v17 = v28;
      }
      while (v28);
    }

    id v7 = v33;
    v11 = v14;
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
  v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v30 = [(AVMediaSelectionTableViewController *)v10 playerController];
  [v29 addObserver:v10 selector:sel_playerControllerMediaSelectionChanged_ name:@"AVPlayerControllerSelectedMediaOptionDidChangeNotification" object:v30];
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v6 = a4;
  v5 = [v6 textLabel];
  +[AVBackdropView applySecondaryGlyphTintToView:v5];

  +[AVBackdropView applySecondaryGlyphTintToView:v6];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  v5 = [(AVMediaSelectionTableViewController *)self playerController];
  id v6 = v5;
  if (v5)
  {
    if (((a4 == 0) & [v5 hasAudioMediaSelectionOptions]) != 0) {
      id v7 = @"MEDIA_SELECTION_VIEW_CONTROLLER_AUDIO_OPTIONS_HEADER_TITLE";
    }
    else {
      id v7 = @"MEDIA_SELECTION_VIEW_CONTROLLER_LEGIBLE_OPTIONS_HEADER_TITLE";
    }
    v8 = AVLocalizedString(v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(AVMediaSelectionTableViewController *)self playerController];
  v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 hasAudioMediaSelectionOptions];
    int64_t v6 = [v4 hasLegibleMediaSelectionOptions] + (unint64_t)v5;
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"AVMediaSelectionViewControllerCellReuseIdentifier" forIndexPath:v6];
  v8 = [(AVMediaSelectionTableViewController *)self playerController];
  v9 = v8;
  if (v8)
  {
    if ([v8 hasAudioMediaSelectionOptions] && !objc_msgSend(v6, "section"))
    {
      v10 = [v9 audioMediaSelectionOptions];
      v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      BOOL v12 = [(AVMediaSelectionTableViewController *)self _isSelectedOrCurrentAudioMediaSelectionOption:v11];
    }
    else
    {
      v10 = [v9 legibleMediaSelectionOptions];
      v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
      BOOL v12 = [(AVMediaSelectionTableViewController *)self _isSelectedOrCurrentLegibleMediaSelectionOption:v11];
    }
    BOOL v13 = v12;

    v14 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0745098039 alpha:0.75];
    [v7 setBackgroundColor:v14];

    if (v13) {
      uint64_t v15 = 3;
    }
    else {
      uint64_t v15 = 0;
    }
    [v7 setAccessoryType:v15];
    [v7 setRepresentedObject:v11];
    uint64_t v16 = [v7 textLabel];
    uint64_t v17 = [v11 localizedDisplayName];
    [v16 setText:v17];

    uint64_t v18 = [MEMORY[0x1E4FB1618] whiteColor];
    [v7 setTintColor:v18];
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unsigned int v5 = [(AVMediaSelectionTableViewController *)self playerController];
  id v6 = v5;
  if (v5)
  {
    int v7 = [v5 hasAudioMediaSelectionOptions];
    if (a4 || !v7)
    {
      v8 = [v6 legibleMediaSelectionOptions];
    }
    else
    {
      v8 = [v6 audioMediaSelectionOptions];
    }
    v10 = v8;
    int64_t v9 = [v8 count];
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_isSelectedOrCurrentLegibleMediaSelectionOption:(id)a3
{
  v4 = (AVMediaSelectionOption *)a3;
  p_selectedLegibleMediaSelectionOption = &self->_selectedLegibleMediaSelectionOption;
  selectedLegibleMediaSelectionOption = self->_selectedLegibleMediaSelectionOption;
  if (selectedLegibleMediaSelectionOption)
  {
    int v7 = selectedLegibleMediaSelectionOption;
  }
  else
  {
    v8 = [(AVMediaSelectionTableViewController *)self playerController];
    int v7 = [v8 currentLegibleMediaSelectionOption];
  }
  objc_storeStrong((id *)p_selectedLegibleMediaSelectionOption, v7);
  if (v7 == v4) {
    char v9 = 1;
  }
  else {
    char v9 = [(AVMediaSelectionOption *)v4 isEqual:v7];
  }

  return v9;
}

- (BOOL)_isSelectedOrCurrentAudioMediaSelectionOption:(id)a3
{
  v4 = (AVMediaSelectionOption *)a3;
  p_selectedAudioMediaSelectionOption = &self->_selectedAudioMediaSelectionOption;
  selectedAudioMediaSelectionOption = self->_selectedAudioMediaSelectionOption;
  if (selectedAudioMediaSelectionOption)
  {
    int v7 = selectedAudioMediaSelectionOption;
  }
  else
  {
    v8 = [(AVMediaSelectionTableViewController *)self playerController];
    int v7 = [v8 currentAudioMediaSelectionOption];
  }
  objc_storeStrong((id *)p_selectedAudioMediaSelectionOption, v7);
  if (v7 == v4) {
    char v9 = 1;
  }
  else {
    char v9 = [(AVMediaSelectionOption *)v4 isEqual:v7];
  }

  return v9;
}

- (void)playerControllerMediaSelectionChanged:(id)a3
{
  selectedAudioMediaSelectionOption = self->_selectedAudioMediaSelectionOption;
  self->_selectedAudioMediaSelectionOption = 0;

  selectedLegibleMediaSelectionOption = self->_selectedLegibleMediaSelectionOption;
  self->_selectedLegibleMediaSelectionOption = 0;

  id v6 = [(AVMediaSelectionTableViewController *)self tableView];
  [v6 reloadData];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVMediaSelectionTableViewController;
  [(AVMediaSelectionTableViewController *)&v5 viewDidAppear:a3];
  v4 = [(AVMediaSelectionTableViewController *)self tableView];
  [v4 flashScrollIndicators];
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)AVMediaSelectionTableViewController;
  -[AVMediaSelectionTableViewController viewWillAppear:](&v15, sel_viewWillAppear_);
  objc_super v5 = [(AVMediaSelectionTableViewController *)self tableView];
  uint64_t v6 = [v5 numberOfSections];

  if (v6)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__AVMediaSelectionTableViewController_viewWillAppear___block_invoke;
    v13[3] = &unk_1E5FC33E0;
    v13[4] = self;
    BOOL v14 = a3;
    int v7 = (void (**)(void))MEMORY[0x1B3E963E0](v13);
    v8 = [(AVMediaSelectionTableViewController *)self transitionCoordinator];
    char v9 = v8;
    if (v8 && [v8 initiallyInteractive])
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __54__AVMediaSelectionTableViewController_viewWillAppear___block_invoke_2;
      v10[3] = &unk_1E5FC3018;
      id v11 = v9;
      BOOL v12 = v7;
      [v11 notifyWhenInteractionChangesUsingBlock:v10];
    }
    else
    {
      v7[2](v7);
    }
  }
  else
  {
    int v7 = [(AVMediaSelectionTableViewController *)self tableView];
    [v7 reloadData];
  }
}

void __54__AVMediaSelectionTableViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "tableView", 0);
  v3 = [v2 indexPathsForSelectedRows];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        char v9 = [*(id *)(a1 + 32) tableView];
        [v9 deselectRowAtIndexPath:v8 animated:*(unsigned __int8 *)(a1 + 40)];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

uint64_t __54__AVMediaSelectionTableViewController_viewWillAppear___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (void)viewDidLoad
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)AVMediaSelectionTableViewController;
  [(AVMediaSelectionTableViewController *)&v25 viewDidLoad];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = [(AVMediaSelectionTableViewController *)self playerController];
  [v3 addObserver:self selector:sel_playerControllerMediaSelectionChanged_ name:@"AVPlayerControllerSelectedMediaOptionDidChangeNotification" object:v4];

  uint64_t v5 = [MEMORY[0x1E4FB1620] colorEffectSaturate:1.8];
  uint64_t v6 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:30.0];
  uint64_t v7 = (void *)MEMORY[0x1E4FB1EF8];
  v26[0] = v6;
  v26[1] = v5;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  char v9 = [v7 effectCombiningEffects:v8];

  long long v10 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v9];
  id v11 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v11 setAutoresizingMask:18];
  long long v12 = (void *)MEMORY[0x1E4FB2400];
  long long v13 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0901960784 alpha:1.0];
  BOOL v14 = [v12 layerWithFillColor:v13 opacity:*MEMORY[0x1E4F3A320] filterType:0.5];

  uint64_t v15 = [MEMORY[0x1E4FB23F8] configWithContentConfig:v14];
  uint64_t v16 = [v15 contentConfig];
  [v16 configureLayerView:v11];

  uint64_t v17 = [v10 contentView];
  [v17 addSubview:v11];

  uint64_t v18 = [(AVMediaSelectionTableViewController *)self tableView];
  [v18 setBackgroundView:v10];

  uint64_t v19 = [(AVMediaSelectionTableViewController *)self tableView];
  [v19 registerClass:objc_opt_class() forCellReuseIdentifier:@"AVMediaSelectionViewControllerCellReuseIdentifier"];

  v20 = [(AVMediaSelectionTableViewController *)self tableView];
  v21 = [MEMORY[0x1E4FB1618] clearColor];
  [v20 setBackgroundColor:v21];

  v22 = [(AVMediaSelectionTableViewController *)self tableView];
  id v23 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v23 lineHeight];
  objc_msgSend(v22, "setEstimatedRowHeight:");

  v24 = [(AVMediaSelectionTableViewController *)self tableView];
  [v24 setSeparatorStyle:1];
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v8 = "-[AVMediaSelectionTableViewController dealloc]";
    __int16 v9 = 1024;
    int v10 = 93;
    __int16 v11 = 2048;
    long long v12 = self;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v5 = [(AVMediaSelectionTableViewController *)self playerController];
  [v4 removeObserver:self name:@"AVPlayerControllerSelectedMediaOptionDidChangeNotification" object:v5];

  v6.receiver = self;
  v6.super_class = (Class)AVMediaSelectionTableViewController;
  [(AVMediaSelectionTableViewController *)&v6 dealloc];
}

- (AVMediaSelectionTableViewController)initWithStyle:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v11 = "-[AVMediaSelectionTableViewController initWithStyle:]";
    __int16 v12 = 1024;
    int v13 = 79;
    __int16 v14 = 2048;
    uint64_t v15 = self;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v9.receiver = self;
  v9.super_class = (Class)AVMediaSelectionTableViewController;
  objc_super v6 = [(AVMediaSelectionTableViewController *)&v9 initWithStyle:a3];
  if (v6)
  {
    uint64_t v7 = AVLocalizedString(@"MEDIA_SELECTION_VIEW_CONTROLLER_NAVIGATION_ITEM_TITLE");
    [(AVMediaSelectionTableViewController *)v6 setTitle:v7];
  }
  return v6;
}

@end