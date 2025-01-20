@interface AVMediaSelectionMenuController
+ (id)_displayNameForEnhanceDialogueLevel:(uint64_t)a1;
- (AVMediaSelectionMenuController)initWithAudibleOptions:(id)a3 legibleOptions:(id)a4;
- (AVMediaSelectionMenuController)initWithAudibleOptions:(id)a3 legibleOptions:(id)a4 enhanceDialogueOptions:(id)a5;
- (AVMediaSelectionMenuDelegate)delegate;
- (BOOL)shouldEnableEnhanceDialogueOptions;
- (NSArray)audibleOptions;
- (NSArray)enhanceDialogueOptions;
- (NSArray)legibleOptions;
- (UIMenu)audibleOptionsMenu;
- (UIMenu)audibleOptionsOverflowMenu;
- (UIMenu)legibleOptionsMenu;
- (id)_elementsForMediaSelectionOptions:(void *)a1;
- (int64_t)currentEnhanceDialogueOption;
- (uint64_t)_reloadAudibleOptionsMenu;
- (unint64_t)currentAudibleOptionIndex;
- (unint64_t)currentLegibleOptionIndex;
- (void)_reloadAudioTrackMenuDisplayingInline:(void *)a1;
- (void)_reloadLegibleOptionsMenu;
- (void)_updateEnablementForMenu:(int)a3 enabled:;
- (void)_updateSelectionForEnhanceDialogueMenu;
- (void)_updateSelectionForMenu:(uint64_t)a3 selectedIndex:;
- (void)_updateSubtitleForEnhanceDialogueMenu;
- (void)setAudibleOptions:(id)a3;
- (void)setCurrentAudibleOptionIndex:(unint64_t)a3;
- (void)setCurrentEnhanceDialogueOption:(int64_t)a3;
- (void)setCurrentLegibleOptionIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setEnhanceDialogueOptions:(id)a3;
- (void)setLegibleOptions:(id)a3;
- (void)setShouldEnableEnhanceDialogueOptions:(BOOL)a3;
@end

@implementation AVMediaSelectionMenuController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_legibleOptions, 0);
  objc_storeStrong((id *)&self->_enhanceDialogueOptions, 0);
  objc_storeStrong((id *)&self->_audibleOptions, 0);
  objc_storeStrong((id *)&self->_legibleOptionsMenu, 0);
  objc_storeStrong((id *)&self->_enhanceDialogueMenu, 0);
  objc_storeStrong((id *)&self->_audioTrackMenu, 0);
  objc_storeStrong((id *)&self->_audibleOptionsOverflowMenu, 0);
  objc_storeStrong((id *)&self->_audibleOptionsMenu, 0);

  objc_storeStrong((id *)&self->_adjustmentsMenu, 0);
}

- (void)setDelegate:(id)a3
{
}

- (AVMediaSelectionMenuDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMediaSelectionMenuDelegate *)WeakRetained;
}

- (BOOL)shouldEnableEnhanceDialogueOptions
{
  return self->_shouldEnableEnhanceDialogueOptions;
}

- (unint64_t)currentLegibleOptionIndex
{
  return self->_currentLegibleOptionIndex;
}

- (int64_t)currentEnhanceDialogueOption
{
  return self->_currentEnhanceDialogueOption;
}

- (unint64_t)currentAudibleOptionIndex
{
  return self->_currentAudibleOptionIndex;
}

- (NSArray)legibleOptions
{
  return self->_legibleOptions;
}

- (NSArray)enhanceDialogueOptions
{
  return self->_enhanceDialogueOptions;
}

- (NSArray)audibleOptions
{
  return self->_audibleOptions;
}

- (UIMenu)legibleOptionsMenu
{
  return self->_legibleOptionsMenu;
}

- (UIMenu)audibleOptionsOverflowMenu
{
  return self->_audibleOptionsOverflowMenu;
}

- (UIMenu)audibleOptionsMenu
{
  return self->_audibleOptionsMenu;
}

- (void)setShouldEnableEnhanceDialogueOptions:(BOOL)a3
{
  if (self->_shouldEnableEnhanceDialogueOptions != a3)
  {
    self->_shouldEnableEnhanceDialogueOptions = a3;
    -[AVMediaSelectionMenuController _updateEnablementForMenu:enabled:]((uint64_t)self, self->_enhanceDialogueMenu, a3);
  }
}

- (void)_updateEnablementForMenu:(int)a3 enabled:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v4 = [a2 children];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v10 = v9;
            [v10 setAttributes:[v10 attributes] & 0xFFFFFFFFFFFFFFFELL | a3 ^ 1u];
          }
          else
          {
            v10 = _AVLog();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v11 = 0;
              _os_log_error_impl(&dword_1B05B7000, v10, OS_LOG_TYPE_ERROR, "We expect all menu elements in this menu to be UIActions.", v11, 2u);
            }
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (void)setCurrentLegibleOptionIndex:(unint64_t)a3
{
  if (self->_currentLegibleOptionIndex != a3)
  {
    self->_currentLegibleOptionIndex = a3;
    -[AVMediaSelectionMenuController _updateSelectionForMenu:selectedIndex:]((uint64_t)self, self->_legibleOptionsMenu, a3);
  }
}

- (void)_updateSelectionForMenu:(uint64_t)a3 selectedIndex:
{
  if (a1)
  {
    v4 = [a2 children];
    if ([v4 count])
    {
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = [v4 objectAtIndexedSubscript:v5];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v6 setState:a3 == v5];
        }
        else
        {
          uint64_t v7 = _AVLog();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)uint64_t v8 = 0;
            _os_log_error_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_ERROR, "We expect all menu elements in this menu to be UIActions.", v8, 2u);
          }
        }
        ++v5;
      }
      while (v5 < [v4 count]);
    }
  }
}

- (void)setCurrentEnhanceDialogueOption:(int64_t)a3
{
  if (self->_currentEnhanceDialogueOption != a3)
  {
    self->_currentEnhanceDialogueOption = a3;
    -[AVMediaSelectionMenuController _updateSelectionForEnhanceDialogueMenu](self);
    -[AVMediaSelectionMenuController _updateSubtitleForEnhanceDialogueMenu]((id *)&self->super.isa);
  }
}

- (void)_updateSelectionForEnhanceDialogueMenu
{
  if (a1)
  {
    v2 = [a1 enhanceDialogueOptions];
    v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "currentEnhanceDialogueOption"));
    int v4 = [v2 containsObject:v3];

    if (v4)
    {
      unint64_t v5 = [a1 enhanceDialogueOptions];
      uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "currentEnhanceDialogueOption"));
      uint64_t v7 = [v5 indexOfObject:v6];
    }
    else
    {
      uint64_t v7 = -1;
    }
    uint64_t v8 = (void *)a1[5];
    -[AVMediaSelectionMenuController _updateSelectionForMenu:selectedIndex:]((uint64_t)a1, v8, v7);
  }
}

- (void)_updateSubtitleForEnhanceDialogueMenu
{
  if (a1)
  {
    +[AVMediaSelectionMenuController _displayNameForEnhanceDialogueLevel:]((uint64_t)AVMediaSelectionMenuController, [a1 currentEnhanceDialogueOption]);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [a1[5] setSubtitle:v2];
  }
}

+ (id)_displayNameForEnhanceDialogueLevel:(uint64_t)a1
{
  self;
  switch(a2)
  {
    case 0:
      v3 = @"ENHANCE_DIALOGUE_OPTION_OFF";
      goto LABEL_9;
    case 1:
      v3 = @"ENHANCE_DIALOGUE_OPTION_ENHANCE";
      goto LABEL_9;
    case 2:
      v3 = @"ENHANCE_DIALOGUE_OPTION_ENHANCE_MORE";
      goto LABEL_9;
    case 3:
      v3 = @"ENHANCE_DIALOGUE_OPTION_ISOLATE";
LABEL_9:
      unint64_t v5 = AVLocalizedString(v3);
      break;
    default:
      int v4 = _AVLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_error_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_ERROR, "Encountered unknown Enhance Dialogue level.", v7, 2u);
      }

      unint64_t v5 = 0;
      break;
  }

  return v5;
}

- (void)setCurrentAudibleOptionIndex:(unint64_t)a3
{
  if (self->_currentAudibleOptionIndex != a3)
  {
    self->_currentAudibleOptionIndex = a3;
    -[AVMediaSelectionMenuController _updateSelectionForMenu:selectedIndex:]((uint64_t)self, self->_audioTrackMenu, a3);
  }
}

- (void)setLegibleOptions:(id)a3
{
  if (self->_legibleOptions != a3)
  {
    int v4 = (NSArray *)[a3 copy];
    legibleOptions = self->_legibleOptions;
    self->_legibleOptions = v4;

    -[AVMediaSelectionMenuController _reloadLegibleOptionsMenu](self);
  }
}

- (void)_reloadLegibleOptionsMenu
{
  if (a1)
  {
    id v2 = [a1 legibleOptions];
    unint64_t v3 = [v2 count];

    if (v3 > 1)
    {
      unint64_t v5 = (void *)MEMORY[0x1E4FB1970];
      uint64_t v6 = AVLocalizedString(@"OVERFLOW_MENU_SUBTITLES_TITLE");
      uint64_t v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"captions.bubble"];
      uint64_t v8 = [a1 legibleOptions];
      v9 = -[AVMediaSelectionMenuController _elementsForMediaSelectionOptions:](a1, v8);
      uint64_t v10 = [v5 menuWithTitle:v6 image:v7 identifier:@"AVSubtitlesMenu" options:0 children:v9];
      v11 = (void *)a1[6];
      a1[6] = v10;

      long long v12 = (void *)a1[6];
      uint64_t v13 = [a1 currentLegibleOptionIndex];
      -[AVMediaSelectionMenuController _updateSelectionForMenu:selectedIndex:]((uint64_t)a1, v12, v13);
    }
    else
    {
      int v4 = (void *)a1[6];
      a1[6] = 0;
    }
  }
}

- (id)_elementsForMediaSelectionOptions:(void *)a1
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v23 = [MEMORY[0x1E4F1CA48] array];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v4)
  {
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(id *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v7 = [a1 delegate];
        char v8 = objc_opt_respondsToSelector();

        if ((v8 & 1) == 0
          || ([a1 delegate],
              v9 = objc_claimAutoreleasedReturnValue(),
              [v9 mediaSelectionMenuController:a1 displayNameForMediaSelectionOption:v6],
              uint64_t v10 = objc_claimAutoreleasedReturnValue(),
              v9,
              !v10))
        {
          uint64_t v10 = [v6 localizedDisplayName];
        }

        objc_initWeak(&location, a1);
        v11 = (void *)MEMORY[0x1E4FB13F0];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __68__AVMediaSelectionMenuController__elementsForMediaSelectionOptions___block_invoke;
        v24[3] = &unk_1E5FC34B8;
        v24[4] = v6;
        objc_copyWeak(&v25, &location);
        long long v12 = [v11 actionWithTitle:v10 image:0 identifier:0 handler:v24];
        objc_msgSend(MEMORY[0x1E4F16540], "avkit_autoOption");
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v14 = v13 == v6;

        if (v14)
        {
          long long v15 = [a1 delegate];
          char v16 = objc_opt_respondsToSelector();

          if (v16)
          {
            uint64_t v17 = [a1 delegate];
            char v18 = [v17 shouldApplyLegibleMediaSelectionCriteriaAutomaticallyForMediaSelectionMenuController:a1];

            if (v18) {
              [v12 setAttributes:1];
            }
          }
        }
        [v23 addObject:v12];

        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v4);
  }

  v19 = (void *)[v23 copy];

  return v19;
}

void __68__AVMediaSelectionMenuController__elementsForMediaSelectionOptions___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = _AVLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v10 = 136315394;
    v11 = "-[AVMediaSelectionMenuController _elementsForMediaSelectionOptions:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1B05B7000, v2, OS_LOG_TYPE_DEFAULT, "%s Did select media selection option: %@", (uint8_t *)&v10, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unint64_t v5 = [WeakRetained delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));
    char v8 = [v7 delegate];
    id v9 = objc_loadWeakRetained((id *)(a1 + 40));
    [v8 mediaSelectionMenuController:v9 didSelectOption:*(void *)(a1 + 32)];
  }
}

- (void)setEnhanceDialogueOptions:(id)a3
{
  if (self->_enhanceDialogueOptions != a3)
  {
    uint64_t v4 = (NSArray *)[a3 copy];
    enhanceDialogueOptions = self->_enhanceDialogueOptions;
    self->_enhanceDialogueOptions = v4;

    -[AVMediaSelectionMenuController _reloadAudibleOptionsMenu]((uint64_t)self);
  }
}

- (uint64_t)_reloadAudibleOptionsMenu
{
  v51[16] = *MEMORY[0x1E4F143B8];
  val = (id *)result;
  if (result)
  {
    v1 = +[AVKitGlobalSettings shared];
    char v2 = [v1 enhanceDialogueEnabled];

    if (v2)
    {
      uint64_t v3 = [val enhanceDialogueOptions];
      unint64_t v4 = [v3 count];

      if (v4 > 1)
      {
        v36 = (void *)MEMORY[0x1E4FB1970];
        v38 = AVLocalizedString(@"ENHANCE_DIALOGUE_FEATURE_TITLE");
        id v37 = [val enhanceDialogueOptions];
        id v9 = [MEMORY[0x1E4F1CA48] array];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id obj = [val enhanceDialogueOptions];
        uint64_t v10 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v48;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v48 != v11) {
                objc_enumerationMutation(obj);
              }
              uint64_t v13 = *(void **)(*((void *)&v47 + 1) + 8 * i);
              uint64_t v14 = +[AVMediaSelectionMenuController _displayNameForEnhanceDialogueLevel:]((uint64_t)AVMediaSelectionMenuController, [v13 unsignedIntegerValue]);
              objc_initWeak(&location, val);
              long long v15 = (void *)MEMORY[0x1E4FB13F0];
              v42[0] = MEMORY[0x1E4F143A8];
              v42[1] = 3221225472;
              v42[2] = __69__AVMediaSelectionMenuController__elementsForEnhanceDialogueOptions___block_invoke;
              v42[3] = &unk_1E5FC21C8;
              id v16 = v14;
              id v43 = v16;
              objc_copyWeak(&v45, &location);
              v44 = v13;
              uint64_t v17 = [v15 actionWithTitle:v16 image:0 identifier:0 handler:v42];
              objc_msgSend(v17, "setAttributes:", objc_msgSend(v17, "attributes") | 8);
              [v9 addObject:v17];

              objc_destroyWeak(&v45);
              objc_destroyWeak(&location);
            }
            uint64_t v10 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
          }
          while (v10);
        }

        char v18 = (void *)[v9 copy];
        uint64_t v19 = [v36 menuWithTitle:v38 image:0 identifier:@"AVEnhanceDialogueMenu" options:0 children:v18];
        unint64_t v5 = val;
        id v20 = val[5];
        val[5] = (id)v19;

        -[AVMediaSelectionMenuController _updateSelectionForEnhanceDialogueMenu](val);
        -[AVMediaSelectionMenuController _updateSubtitleForEnhanceDialogueMenu](val);
        -[AVMediaSelectionMenuController _updateEnablementForMenu:enabled:]((uint64_t)val, val[5], [val shouldEnableEnhanceDialogueOptions]);
      }
      else
      {
        unint64_t v5 = val;
        id v6 = val[5];
        val[5] = 0;
      }
      if (v5[5])
      {
        v21 = (void *)MEMORY[0x1E4FB1970];
        uint64_t v22 = AVLocalizedString(@"OVERFLOW_MENU_AUDIO_ADJUSTMENTS_TITLE");
        v51[0] = val[5];
        v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:1];
        uint64_t v24 = [v21 menuWithTitle:v22 image:0 identifier:@"AVAdjustmentsMenu" options:1 children:v23];
        id v25 = val[1];
        val[1] = (id)v24;

        unint64_t v5 = val;
      }
      else
      {
        id v26 = v5[1];
        v5[1] = 0;
      }
      -[AVMediaSelectionMenuController _reloadAudioTrackMenuDisplayingInline:](v5, 1u);
      if (v5[1] || v5[4])
      {
        id obja = [MEMORY[0x1E4F1CA48] array];
        if (val[1]) {
          objc_msgSend(obja, "addObject:");
        }
        id v27 = obja;
        if (val[4])
        {
          objc_msgSend(obja, "addObject:");
          id v27 = obja;
        }
        uint64_t v28 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F09185C8 image:0 identifier:@"AVAudioMenu" options:0 children:v27];
        id v29 = val[2];
        val[2] = (id)v28;

        long long v30 = (void *)MEMORY[0x1E4FB1970];
        v31 = AVLocalizedString(@"OVERFLOW_MENU_AUDIO_TITLE");
        uint64_t v32 = [MEMORY[0x1E4FB1818] systemImageNamed:@"waveform.circle"];
        uint64_t v33 = [v30 menuWithTitle:v31 image:v32 identifier:@"AVAudioMenu" options:0 children:obja];
        id v34 = val[3];
        val[3] = (id)v33;

        id v8 = obja;
      }
      else
      {
        id v35 = v5[2];
        v5[2] = 0;

        id v8 = v5[3];
        v5[3] = 0;
      }
    }
    else
    {
      -[AVMediaSelectionMenuController _reloadAudioTrackMenuDisplayingInline:](val, 0);
      objc_storeStrong(val + 2, val[4]);
      id v7 = val[4];
      id v8 = val[3];
      val[3] = v7;
    }
    return MEMORY[0x1F41817F8](v7, v8);
  }
  return result;
}

- (void)_reloadAudioTrackMenuDisplayingInline:(void *)a1
{
  unint64_t v4 = [a1 audibleOptions];
  unint64_t v5 = [v4 count];

  if (v5 > 1)
  {
    id v7 = (void *)MEMORY[0x1E4FB1970];
    id v8 = AVLocalizedString(@"OVERFLOW_MENU_AUDIOTRACK_TITLE");
    if (a2)
    {
      id v9 = 0;
      uint64_t v10 = @"AVAudioTrackMenu";
    }
    else
    {
      id v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"waveform.circle"];
      uint64_t v10 = @"AVAudioMenu";
    }
    uint64_t v11 = [a1 audibleOptions];
    __int16 v12 = -[AVMediaSelectionMenuController _elementsForMediaSelectionOptions:](a1, v11);
    uint64_t v13 = [v7 menuWithTitle:v8 image:v9 identifier:v10 options:a2 children:v12];
    uint64_t v14 = (void *)a1[4];
    a1[4] = v13;

    if ((a2 & 1) == 0) {
    long long v15 = (void *)a1[4];
    }
    uint64_t v16 = [a1 currentAudibleOptionIndex];
    -[AVMediaSelectionMenuController _updateSelectionForMenu:selectedIndex:]((uint64_t)a1, v15, v16);
  }
  else
  {
    id v6 = (void *)a1[4];
    a1[4] = 0;
  }
}

void __69__AVMediaSelectionMenuController__elementsForEnhanceDialogueOptions___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v2 = _AVLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v10 = 136315394;
    uint64_t v11 = "-[AVMediaSelectionMenuController _elementsForEnhanceDialogueOptions:]_block_invoke";
    __int16 v12 = 2112;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1B05B7000, v2, OS_LOG_TYPE_DEFAULT, "%s Did select enhance dialogue option: %@", (uint8_t *)&v10, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unint64_t v5 = [WeakRetained delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 48));
    id v8 = [v7 delegate];
    id v9 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v8, "mediaSelectionMenuController:didSelectEnhanceDialogueOption:", v9, objc_msgSend(*(id *)(a1 + 40), "unsignedIntegerValue"));
  }
}

- (void)setAudibleOptions:(id)a3
{
  if (self->_audibleOptions != a3)
  {
    unint64_t v4 = (NSArray *)[a3 copy];
    audibleOptions = self->_audibleOptions;
    self->_audibleOptions = v4;

    -[AVMediaSelectionMenuController _reloadAudibleOptionsMenu]((uint64_t)self);
  }
}

- (AVMediaSelectionMenuController)initWithAudibleOptions:(id)a3 legibleOptions:(id)a4 enhanceDialogueOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)AVMediaSelectionMenuController;
  uint64_t v11 = [(AVMediaSelectionMenuController *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    audibleOptions = v11->_audibleOptions;
    v11->_audibleOptions = (NSArray *)v12;

    uint64_t v14 = [v10 copy];
    enhanceDialogueOptions = v11->_enhanceDialogueOptions;
    v11->_enhanceDialogueOptions = (NSArray *)v14;

    uint64_t v16 = [v9 copy];
    legibleOptions = v11->_legibleOptions;
    v11->_legibleOptions = (NSArray *)v16;

    v11->_currentAudibleOptionIndex = 0;
    v11->_currentEnhanceDialogueOption = 0;
    v11->_currentLegibleOptionIndex = 0;
    -[AVMediaSelectionMenuController _reloadAudibleOptionsMenu]((uint64_t)v11);
    -[AVMediaSelectionMenuController _reloadLegibleOptionsMenu](v11);
  }

  return v11;
}

- (AVMediaSelectionMenuController)initWithAudibleOptions:(id)a3 legibleOptions:(id)a4
{
  return [(AVMediaSelectionMenuController *)self initWithAudibleOptions:a3 legibleOptions:a4 enhanceDialogueOptions:0];
}

@end