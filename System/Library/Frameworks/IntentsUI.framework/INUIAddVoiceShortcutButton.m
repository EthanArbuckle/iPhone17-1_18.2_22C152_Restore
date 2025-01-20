@interface INUIAddVoiceShortcutButton
- (BOOL)_shouldUseLargerFont;
- (CAFilter)highlightFilter;
- (CGFloat)cornerRadius;
- (CGSize)intrinsicContentSize;
- (INShortcut)shortcut;
- (INUIAddVoiceShortcutButton)initWithCoder:(id)a3;
- (INUIAddVoiceShortcutButton)initWithStyle:(INUIAddVoiceShortcutButtonStyle)style;
- (INUIAddVoiceShortcutButtonStyle)style;
- (INVoiceShortcut)voiceShortcut;
- (NSLayoutConstraint)addToSiriLeadingConstraint;
- (NSLayoutConstraint)addedToSiriLeadingConstraint;
- (NSLayoutConstraint)checkmarkHeightConstraint;
- (UIImageView)checkmarkImageView;
- (UIImageView)sphiriImageView;
- (UILabel)addToSiriLabel;
- (UILabel)phraseLabel;
- (double)INUIAddVoiceShortcutDefaultCornerRadius;
- (double)INUIAddVoiceShortcutDefaultHeight;
- (double)INUIAddVoiceShortcutDefaultHorizontalMargin;
- (double)INUIAddVoiceShortcutDefaultHorizontalPadding;
- (double)INUIAddVoiceShortcutIconWidthHeight;
- (double)_cornerRadius;
- (double)_strokeWidthForStyle:(unint64_t)a3;
- (double)metricsScale;
- (id)_addToSiriFont;
- (id)_addToSiriText;
- (id)_addedToSiriText;
- (id)_backgroundColorForStyle:(unint64_t)a3;
- (id)_checkmarkImage;
- (id)_darkSphiriImage;
- (id)_dynamicBlackColor;
- (id)_dynamicDarkSphiriImage;
- (id)_dynamicLightSphiriImage;
- (id)_dynamicWhiteColor;
- (id)_lightSphiriImage;
- (id)_phraseFont;
- (id)_phraseText;
- (id)_sphiriImageForStyle:(unint64_t)a3;
- (id)_strokeColorForStyle:(unint64_t)a3;
- (id)_textColorForStyle:(unint64_t)a3;
- (id)accessibilityLabel;
- (id)delegate;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (void)_checkAndUpdateForShortcut;
- (void)_configureWithStyle:(unint64_t)a3;
- (void)_createHighlightFilterIfNecessary;
- (void)_didTapButton;
- (void)_updateColors;
- (void)_updateContent;
- (void)_updatePhraseVisibility;
- (void)dealloc;
- (void)layoutSubviews;
- (void)prepareForInterfaceBuilder;
- (void)setAddToSiriLabel:(id)a3;
- (void)setAddToSiriLeadingConstraint:(id)a3;
- (void)setAddedToSiriLeadingConstraint:(id)a3;
- (void)setCheckmarkHeightConstraint:(id)a3;
- (void)setCheckmarkImageView:(id)a3;
- (void)setCornerRadius:(CGFloat)cornerRadius;
- (void)setDelegate:(id)delegate;
- (void)setHighlightFilter:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setPhraseLabel:(id)a3;
- (void)setShortcut:(INShortcut *)shortcut;
- (void)setSphiriImageView:(id)a3;
- (void)setStyle:(INUIAddVoiceShortcutButtonStyle)style;
- (void)setVoiceShortcut:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation INUIAddVoiceShortcutButton

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addedToSiriLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_addToSiriLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_checkmarkHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_phraseLabel);
  objc_destroyWeak((id *)&self->_addToSiriLabel);
  objc_destroyWeak((id *)&self->_checkmarkImageView);
  objc_destroyWeak((id *)&self->_sphiriImageView);
  objc_storeStrong((id *)&self->_highlightFilter, 0);
  objc_storeStrong((id *)&self->_voiceShortcut, 0);
  objc_storeStrong((id *)&self->_shortcut, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAddedToSiriLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)addedToSiriLeadingConstraint
{
  return self->_addedToSiriLeadingConstraint;
}

- (void)setAddToSiriLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)addToSiriLeadingConstraint
{
  return self->_addToSiriLeadingConstraint;
}

- (void)setCheckmarkHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)checkmarkHeightConstraint
{
  return self->_checkmarkHeightConstraint;
}

- (void)setPhraseLabel:(id)a3
{
}

- (UILabel)phraseLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_phraseLabel);

  return (UILabel *)WeakRetained;
}

- (void)setAddToSiriLabel:(id)a3
{
}

- (UILabel)addToSiriLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_addToSiriLabel);

  return (UILabel *)WeakRetained;
}

- (void)setCheckmarkImageView:(id)a3
{
}

- (UIImageView)checkmarkImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_checkmarkImageView);

  return (UIImageView *)WeakRetained;
}

- (void)setSphiriImageView:(id)a3
{
}

- (UIImageView)sphiriImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sphiriImageView);

  return (UIImageView *)WeakRetained;
}

- (void)setHighlightFilter:(id)a3
{
}

- (CAFilter)highlightFilter
{
  return self->_highlightFilter;
}

- (INVoiceShortcut)voiceShortcut
{
  return self->_voiceShortcut;
}

- (INShortcut)shortcut
{
  return self->_shortcut;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (INUIAddVoiceShortcutButtonStyle)style
{
  return self->_style;
}

- (CGFloat)cornerRadius
{
  return self->_cornerRadius;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  v5 = [(INUIAddVoiceShortcutButton *)self shortcut];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F088E0]);
    v7 = [(INUIAddVoiceShortcutButton *)self shortcut];
    v8 = (void *)[v6 initWithObject:v7];

    v9 = (void *)[objc_alloc(MEMORY[0x263F1C5E0]) initWithItemProvider:v8];
    v12[0] = v9;
    v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  }
  else
  {
    v10 = (void *)MEMORY[0x263EFFA68];
  }

  return v10;
}

- (void)prepareForInterfaceBuilder
{
  v3.receiver = self;
  v3.super_class = (Class)INUIAddVoiceShortcutButton;
  [(INUIAddVoiceShortcutButton *)&v3 prepareForInterfaceBuilder];
  [(INUIAddVoiceShortcutButton *)self _configureWithStyle:0];
}

- (id)accessibilityLabel
{
  objc_super v3 = [(INUIAddVoiceShortcutButton *)self voiceShortcut];

  if (v3)
  {
    v4 = NSString;
    v5 = [(INUIAddVoiceShortcutButton *)self _phraseText];
    id v6 = [v4 localizedStringWithFormat:@"Added to Siri with phrase: %@", v5];
  }
  else
  {
    id v6 = [(INUIAddVoiceShortcutButton *)self _addToSiriText];
  }

  return v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INUIAddVoiceShortcutButton;
  [(INUIAddVoiceShortcutButton *)&v15 traitCollectionDidChange:v4];
  v5 = [(INUIAddVoiceShortcutButton *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(INUIAddVoiceShortcutButton *)self _updateColors];
  }
  v8 = [(INUIAddVoiceShortcutButton *)self traitCollection];
  v9 = [v8 preferredContentSizeCategory];
  v10 = [v4 preferredContentSizeCategory];

  if (v9 != v10)
  {
    v11 = [(INUIAddVoiceShortcutButton *)self addToSiriLabel];
    v12 = [(INUIAddVoiceShortcutButton *)self _addToSiriFont];
    [v11 setFont:v12];

    v13 = [(INUIAddVoiceShortcutButton *)self phraseLabel];
    v14 = [(INUIAddVoiceShortcutButton *)self _phraseFont];
    [v13 setFont:v14];
  }
}

- (void)_checkAndUpdateForShortcut
{
  objc_super v3 = [MEMORY[0x263F100D8] sharedCenter];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__INUIAddVoiceShortcutButton__checkAndUpdateForShortcut__block_invoke;
  v4[3] = &unk_263FD6DE0;
  v4[4] = self;
  [v3 getAllVoiceShortcutsWithCompletion:v4];
}

void __56__INUIAddVoiceShortcutButton__checkAndUpdateForShortcut__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v7 = &v46;
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  if (v9)
  {
    v10 = (void *)*MEMORY[0x263F0F810];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F0F810], OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      v12 = [v9 localizedDescription];
      *(_DWORD *)buf = 136315394;
      v52 = "-[INUIAddVoiceShortcutButton _checkAndUpdateForShortcut]_block_invoke";
      __int16 v53 = 2112;
      v54 = v12;
      _os_log_error_impl(&dword_20A3EB000, v11, OS_LOG_TYPE_ERROR, "%s Failed to get shortcuts in INUIAddVoiceShortcutButton: %@", buf, 0x16u);
    }
    goto LABEL_28;
  }
  v13 = [*(id *)(a1 + 32) shortcut];
  v14 = [v13 userActivity];

  uint64_t v32 = a1;
  objc_super v15 = [*(id *)(a1 + 32) shortcut];
  v16 = [v15 intent];

  long long v49 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v46 = 0u;
  id v33 = v8;
  id obj = v8;
  uint64_t v41 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v41)
  {
    uint64_t v40 = *(void *)v47;
    BOOL v34 = v14 != 0;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v47 != v40) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v46 + 1) + 8 * v17);
        if (!v14) {
          goto LABEL_13;
        }
        id v4 = [v14 activityType];
        uint64_t v7 = [v18 shortcut];
        objc_super v3 = [v7 userActivity];
        objc_super v15 = [v3 activityType];
        if ([v4 isEqualToString:v15])
        {
          v19 = [v14 userInfo];
          v38 = [v18 shortcut];
          v37 = [v38 userActivity];
          [v37 userInfo];
          v36 = v39 = v19;
          LODWORD(v20) = 1;
          if (objc_msgSend(v19, "isEqualToDictionary:"))
          {
            BOOL v21 = 1;
            goto LABEL_15;
          }
          if (!v16)
          {
            BOOL v21 = 0;
LABEL_15:

            if ((v20 & 1) == 0) {
              goto LABEL_16;
            }
            goto LABEL_19;
          }
        }
        else
        {
LABEL_13:
          LODWORD(v20) = 0;
          BOOL v21 = 0;
          if (!v16) {
            goto LABEL_18;
          }
        }
        int v42 = v20;
        uint64_t v22 = [v16 _indexingHash];
        uint64_t v20 = [v18 shortcut];
        [(id)v20 intent];
        uint64_t v43 = v17;
        v23 = v18;
        v24 = v15;
        v25 = v14;
        v26 = v3;
        v27 = v7;
        v28 = v4;
        v30 = v29 = v16;
        BOOL v21 = v22 == [v30 _indexingHash];

        v16 = v29;
        id v4 = v28;
        uint64_t v7 = v27;
        objc_super v3 = v26;
        v14 = v25;
        objc_super v15 = v24;
        v18 = v23;
        uint64_t v17 = v43;

        LOBYTE(v20) = v34;
        if (v42) {
          goto LABEL_15;
        }
LABEL_18:
        if (!v14)
        {
LABEL_16:
          if (v21) {
            goto LABEL_26;
          }
          goto LABEL_20;
        }
LABEL_19:

        if (v21)
        {
LABEL_26:
          v45[0] = MEMORY[0x263EF8330];
          v45[1] = 3221225472;
          v45[2] = __56__INUIAddVoiceShortcutButton__checkAndUpdateForShortcut__block_invoke_62;
          v45[3] = &unk_263FD6E08;
          v45[4] = *(void *)(v32 + 32);
          v45[5] = v18;
          dispatch_async(MEMORY[0x263EF83A0], v45);

          goto LABEL_27;
        }
LABEL_20:
        ++v17;
      }
      while (v41 != v17);
      uint64_t v31 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
      uint64_t v41 = v31;
    }
    while (v31);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__INUIAddVoiceShortcutButton__checkAndUpdateForShortcut__block_invoke_2;
  block[3] = &unk_263FD6DB8;
  block[4] = *(void *)(v32 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
LABEL_27:

  id v9 = 0;
  id v8 = v33;
LABEL_28:
}

uint64_t __56__INUIAddVoiceShortcutButton__checkAndUpdateForShortcut__block_invoke_62(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVoiceShortcut:*(void *)(a1 + 40)];
}

uint64_t __56__INUIAddVoiceShortcutButton__checkAndUpdateForShortcut__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setVoiceShortcut:0];
}

- (void)_didTapButton
{
  id v10 = [(INUIAddVoiceShortcutButton *)self delegate];
  objc_super v3 = [(INUIAddVoiceShortcutButton *)self voiceShortcut];

  if (v3)
  {
    id v4 = [INUIEditVoiceShortcutViewController alloc];
    v5 = [(INUIAddVoiceShortcutButton *)self voiceShortcut];
    uint64_t v6 = [(INUIEditVoiceShortcutViewController *)v4 initWithVoiceShortcut:v5];

    [v10 presentEditVoiceShortcutViewController:v6 forAddVoiceShortcutButton:self];
  }
  else
  {
    uint64_t v7 = [(INUIAddVoiceShortcutButton *)self shortcut];

    if (!v7) {
      goto LABEL_6;
    }
    id v8 = [INUIAddVoiceShortcutViewController alloc];
    id v9 = [(INUIAddVoiceShortcutButton *)self shortcut];
    uint64_t v6 = [(INUIAddVoiceShortcutViewController *)v8 initWithShortcut:v9];

    [v10 presentAddVoiceShortcutViewController:v6 forAddVoiceShortcutButton:self];
  }

LABEL_6:
}

- (void)_updatePhraseVisibility
{
  objc_super v3 = [(INUIAddVoiceShortcutButton *)self voiceShortcut];
  if (v3)
  {
    [(INUIAddVoiceShortcutButton *)self bounds];
    BOOL v4 = CGRectGetHeight(v9) >= 36.0;
  }
  else
  {
    BOOL v4 = 0;
  }

  v5 = [(INUIAddVoiceShortcutButton *)self phraseLabel];
  [v5 setHidden:v4 ^ 1];

  uint64_t v6 = [(INUIAddVoiceShortcutButton *)self addToSiriLeadingConstraint];
  [v6 setActive:v4 ^ 1];

  id v7 = [(INUIAddVoiceShortcutButton *)self addedToSiriLeadingConstraint];
  [v7 setActive:v4];
}

- (void)_updateContent
{
  objc_super v3 = [(INUIAddVoiceShortcutButton *)self voiceShortcut];

  BOOL v4 = [(INUIAddVoiceShortcutButton *)self addToSiriLabel];
  if (v3) {
    [(INUIAddVoiceShortcutButton *)self _addedToSiriText];
  }
  else {
  v5 = [(INUIAddVoiceShortcutButton *)self _addToSiriText];
  }
  objc_msgSend(v4, "_inui_setText:", v5);

  uint64_t v6 = [(INUIAddVoiceShortcutButton *)self phraseLabel];
  id v7 = v6;
  if (v3)
  {
    id v8 = [(INUIAddVoiceShortcutButton *)self _phraseText];
    objc_msgSend(v7, "_inui_setText:", v8);
  }
  else
  {
    objc_msgSend(v6, "_inui_setText:", 0);
  }
  BOOL v9 = v3 == 0;
  BOOL v10 = v3 == 0;
  uint64_t v11 = !v9;

  v12 = [(INUIAddVoiceShortcutButton *)self sphiriImageView];
  [v12 setHidden:v11];

  v13 = [(INUIAddVoiceShortcutButton *)self checkmarkImageView];
  [v13 setHidden:v10];

  [(INUIAddVoiceShortcutButton *)self _updatePhraseVisibility];

  [(INUIAddVoiceShortcutButton *)self invalidateIntrinsicContentSize];
}

- (id)_dynamicBlackColor
{
  v2 = (void *)MEMORY[0x263F1C550];
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v4 = objc_msgSend(v2, "_inui_colorNamed:bundle:", @"ColorDark", v3);

  return v4;
}

- (id)_dynamicWhiteColor
{
  v2 = (void *)MEMORY[0x263F1C550];
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v4 = objc_msgSend(v2, "_inui_colorNamed:bundle:", @"ColorLight", v3);

  return v4;
}

- (id)_checkmarkImage
{
  v2 = (void *)MEMORY[0x263F1C6B0];
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v4 = objc_msgSend(v2, "_inui_imageNamed:inBundle:", @"Checkmark", v3);

  return v4;
}

- (id)_dynamicDarkSphiriImage
{
  objc_super v3 = [(INUIAddVoiceShortcutButton *)self _darkSphiriImage];
  BOOL v4 = [(INUIAddVoiceShortcutButton *)self _lightSphiriImage];
  v5 = objc_msgSend(MEMORY[0x263F1C6B0], "_inui_imageWithLightModeImage:darkModeImage:", v3, v4);

  return v5;
}

- (id)_dynamicLightSphiriImage
{
  objc_super v3 = [(INUIAddVoiceShortcutButton *)self _lightSphiriImage];
  BOOL v4 = [(INUIAddVoiceShortcutButton *)self _darkSphiriImage];
  v5 = objc_msgSend(MEMORY[0x263F1C6B0], "_inui_imageWithLightModeImage:darkModeImage:", v3, v4);

  return v5;
}

- (id)_darkSphiriImage
{
  v2 = (void *)MEMORY[0x263F1C6B0];
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v4 = objc_msgSend(v2, "_inui_imageNamed:inBundle:", @"SphiriDark", v3);

  return v4;
}

- (id)_lightSphiriImage
{
  v2 = (void *)MEMORY[0x263F1C6B0];
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v4 = objc_msgSend(v2, "_inui_imageNamed:inBundle:", @"SphiriLight", v3);

  return v4;
}

- (BOOL)_shouldUseLargerFont
{
  [(INUIAddVoiceShortcutButton *)self bounds];
  return CGRectGetHeight(v3) >= 44.0;
}

- (id)_phraseFont
{
  v2 = (void *)MEMORY[0x263F1C658];
  BOOL v3 = [(INUIAddVoiceShortcutButton *)self _shouldUseLargerFont];
  BOOL v4 = (uint64_t *)MEMORY[0x263F1D280];
  if (!v3) {
    BOOL v4 = (uint64_t *)MEMORY[0x263F1D278];
  }
  uint64_t v5 = *v4;

  return (id)objc_msgSend(v2, "_inui_preferredFontForTextStyle:", v5);
}

- (id)_addToSiriFont
{
  v2 = (void *)MEMORY[0x263F1C660];
  BOOL v3 = [(INUIAddVoiceShortcutButton *)self _shouldUseLargerFont];
  BOOL v4 = (void *)MEMORY[0x263F1D2C0];
  if (!v3) {
    BOOL v4 = (void *)MEMORY[0x263F1D280];
  }
  uint64_t v5 = objc_msgSend(v2, "_inui_preferredFontDescriptorWithTextStyle:", *v4);
  uint64_t v6 = [v5 fontDescriptorWithSymbolicTraits:2];
  id v7 = [MEMORY[0x263F1C658] fontWithDescriptor:v6 size:0.0];

  return v7;
}

- (id)_phraseText
{
  v2 = [(INUIAddVoiceShortcutButton *)self voiceShortcut];
  BOOL v3 = [v2 invocationPhrase];

  BOOL v4 = NSString;
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"“%@”" value:&stru_26BE4DC38 table:0];
  id v7 = objc_msgSend(v4, "localizedStringWithFormat:", v6, v3);

  return v7;
}

- (id)_addedToSiriText
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"Added to Siri" value:&stru_26BE4DC38 table:0];

  return v3;
}

- (id)_addToSiriText
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"Add to Siri" value:&stru_26BE4DC38 table:0];

  return v3;
}

- (void)_createHighlightFilterIfNecessary
{
  v10[1] = *MEMORY[0x263EF8340];
  if (!self->_highlightFilter)
  {
    BOOL v3 = [(INUIAddVoiceShortcutButton *)self layer];
    id v4 = objc_alloc(MEMORY[0x263F157C8]);
    uint64_t v5 = (CAFilter *)[v4 initWithType:*MEMORY[0x263F15D20]];
    highlightFilter = self->_highlightFilter;
    self->_highlightFilter = v5;

    [(CAFilter *)self->_highlightFilter setName:@"highlightFilter"];
    id v7 = self->_highlightFilter;
    id v8 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:1.0];
    -[CAFilter setValue:forKey:](v7, "setValue:forKey:", [v8 CGColor], @"inputColor");

    v10[0] = self->_highlightFilter;
    BOOL v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    [v3 setFilters:v9];
  }
}

- (double)_strokeWidthForStyle:(unint64_t)a3
{
  double result = 0.0;
  if (a3 - 1 <= 4) {
    return dbl_20A3FD6B8[a3 - 1];
  }
  return result;
}

- (id)_strokeColorForStyle:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      BOOL v3 = (void *)MEMORY[0x263F1C550];
      double v4 = 0.0;
      break;
    case 5uLL:
      uint64_t v6 = [(INUIAddVoiceShortcutButton *)self _dynamicBlackColor];
      id v7 = [v6 colorWithAlphaComponent:0.3];

      goto LABEL_10;
    case 3uLL:
      BOOL v3 = (void *)MEMORY[0x263F1C550];
      double v4 = 1.0;
      break;
    default:
      uint64_t v5 = [MEMORY[0x263F1C550] clearColor];
      goto LABEL_9;
  }
  uint64_t v5 = [v3 colorWithWhite:v4 alpha:0.3];
LABEL_9:
  id v7 = (void *)v5;
LABEL_10:

  return v7;
}

- (id)_textColorForStyle:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      objc_msgSend(MEMORY[0x263F1C550], "blackColor", v3);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2uLL:
    case 3uLL:
      objc_msgSend(MEMORY[0x263F1C550], "whiteColor", v3);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4uLL:
      self = [(INUIAddVoiceShortcutButton *)self _dynamicWhiteColor];
      goto LABEL_9;
    case 5uLL:
      self = [(INUIAddVoiceShortcutButton *)self _dynamicBlackColor];
LABEL_9:
      break;
    default:
      break;
  }
  return self;
}

- (id)_backgroundColorForStyle:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      objc_msgSend(MEMORY[0x263F1C550], "whiteColor", v3);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2uLL:
    case 3uLL:
      objc_msgSend(MEMORY[0x263F1C550], "blackColor", v3);
      self = (INUIAddVoiceShortcutButton *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4uLL:
      self = [(INUIAddVoiceShortcutButton *)self _dynamicBlackColor];
      goto LABEL_9;
    case 5uLL:
      self = [(INUIAddVoiceShortcutButton *)self _dynamicWhiteColor];
LABEL_9:
      break;
    default:
      break;
  }
  return self;
}

- (id)_sphiriImageForStyle:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      self = [(INUIAddVoiceShortcutButton *)self _lightSphiriImage];
      goto LABEL_9;
    case 2uLL:
    case 3uLL:
      self = [(INUIAddVoiceShortcutButton *)self _darkSphiriImage];
      goto LABEL_9;
    case 4uLL:
      self = [(INUIAddVoiceShortcutButton *)self _dynamicDarkSphiriImage];
      goto LABEL_9;
    case 5uLL:
      self = [(INUIAddVoiceShortcutButton *)self _dynamicLightSphiriImage];
LABEL_9:
      break;
    default:
      break;
  }
  return self;
}

- (void)_updateColors
{
  INUIAddVoiceShortcutButtonStyle v3 = [(INUIAddVoiceShortcutButton *)self style];
  uint64_t v4 = [(INUIAddVoiceShortcutButton *)self layer];
  id v5 = [(INUIAddVoiceShortcutButton *)self _backgroundColorForStyle:v3];
  objc_msgSend(v4, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

  uint64_t v6 = [(INUIAddVoiceShortcutButton *)self layer];
  id v7 = [(INUIAddVoiceShortcutButton *)self _strokeColorForStyle:v3];
  objc_msgSend(v6, "setBorderColor:", objc_msgSend(v7, "CGColor"));

  id v8 = [(INUIAddVoiceShortcutButton *)self layer];
  [(INUIAddVoiceShortcutButton *)self _strokeWidthForStyle:v3];
  objc_msgSend(v8, "setBorderWidth:");

  BOOL v9 = [(INUIAddVoiceShortcutButton *)self checkmarkImageView];
  BOOL v10 = [(INUIAddVoiceShortcutButton *)self _textColorForStyle:v3];
  objc_msgSend(v9, "_inui_setTintColor:", v10);

  id v12 = [(INUIAddVoiceShortcutButton *)self addToSiriLabel];
  uint64_t v11 = [(INUIAddVoiceShortcutButton *)self _textColorForStyle:v3];
  [v12 setTextColor:v11];
}

- (CGSize)intrinsicContentSize
{
  INUIAddVoiceShortcutButtonStyle v3 = objc_msgSend(MEMORY[0x263F1C768], "_inui_labelWithText:", 0);
  uint64_t v4 = [(INUIAddVoiceShortcutButton *)self voiceShortcut];

  if (v4) {
    [(INUIAddVoiceShortcutButton *)self _addedToSiriText];
  }
  else {
  id v5 = [(INUIAddVoiceShortcutButton *)self _addToSiriText];
  }
  objc_msgSend(v3, "_inui_setText:", v5);

  uint64_t v6 = [(INUIAddVoiceShortcutButton *)self _addToSiriFont];
  [v3 setFont:v6];

  [(INUIAddVoiceShortcutButton *)self INUIAddVoiceShortcutDefaultHorizontalMargin];
  double v8 = v7;
  [(INUIAddVoiceShortcutButton *)self INUIAddVoiceShortcutDefaultHorizontalPadding];
  double v10 = v9 + v8 * 2.0;
  [(INUIAddVoiceShortcutButton *)self INUIAddVoiceShortcutIconWidthHeight];
  double v12 = v10 + v11;
  [v3 intrinsicContentSize];
  double v14 = v12 + v13;
  [(INUIAddVoiceShortcutButton *)self INUIAddVoiceShortcutDefaultHeight];
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (double)_cornerRadius
{
  [(INUIAddVoiceShortcutButton *)self frame];
  double Height = CGRectGetHeight(v5);
  [(INUIAddVoiceShortcutButton *)self cornerRadius];
  if (result >= Height * 0.5) {
    return Height * 0.5;
  }
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)INUIAddVoiceShortcutButton;
  [(INUIAddVoiceShortcutButton *)&v4 layoutSubviews];
  INUIAddVoiceShortcutButtonStyle v3 = [(INUIAddVoiceShortcutButton *)self layer];
  [(INUIAddVoiceShortcutButton *)self _cornerRadius];
  objc_msgSend(v3, "setCornerRadius:");

  [(INUIAddVoiceShortcutButton *)self _updatePhraseVisibility];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INUIAddVoiceShortcutButton;
  -[INUIAddVoiceShortcutButton setHighlighted:](&v15, sel_setHighlighted_);
  [(INUIAddVoiceShortcutButton *)self _createHighlightFilterIfNecessary];
  CGRect v5 = [(INUIAddVoiceShortcutButton *)self layer];
  double v6 = 0.6;
  if (!v3) {
    double v6 = 1.0;
  }
  double v7 = objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", v6);
  double v8 = (void *)MEMORY[0x263F1C550];
  double v9 = [v5 valueForKeyPath:@"filters.highlightFilter.inputColor"];
  double v10 = [v8 colorWithCGColor:v9];

  id v11 = v7;
  objc_msgSend(v5, "setValue:forKeyPath:", objc_msgSend(v11, "CGColor"), @"filters.highlightFilter.inputColor");
  double v12 = [MEMORY[0x263F15760] animationWithKeyPath:@"filters.highlightFilter.inputColor"];
  [v12 setDuration:0.15];
  [v12 setFillMode:*MEMORY[0x263F15AB0]];
  id v13 = v10;
  objc_msgSend(v12, "setFromValue:", objc_msgSend(v13, "CGColor"));
  id v14 = v11;
  objc_msgSend(v12, "setToValue:", objc_msgSend(v14, "CGColor"));
  [v5 addAnimation:v12 forKey:@"filters.highlightFilter.inputColor"];
}

- (void)setVoiceShortcut:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_voiceShortcut] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_voiceShortcut, a3);
    [(INUIAddVoiceShortcutButton *)self _updateContent];
  }
}

- (void)setShortcut:(INShortcut *)shortcut
{
  id v5 = shortcut;
  p_shortcut = &self->_shortcut;
  if (self->_shortcut != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_shortcut, shortcut);
    p_shortcut = (INShortcut **)[(INUIAddVoiceShortcutButton *)self _checkAndUpdateForShortcut];
    id v5 = v7;
  }

  MEMORY[0x270F9A758](p_shortcut, v5);
}

- (void)setDelegate:(id)delegate
{
  id obj = delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    [(INUIAddVoiceShortcutButton *)self removeTarget:self action:sel__didTapButton forControlEvents:64];
    id v5 = obj;
    if (obj)
    {
      [(INUIAddVoiceShortcutButton *)self addTarget:self action:sel__didTapButton forControlEvents:64];
      id v5 = obj;
    }
  }
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
  self->_cornerRadius = cornerRadius;
  [(UIView *)self _inui_setNeedsLayout];
}

- (void)setStyle:(INUIAddVoiceShortcutButtonStyle)style
{
  if (self->_style != style)
  {
    self->_style = style;
    [(INUIAddVoiceShortcutButton *)self _updateColors];
  }
}

- (double)INUIAddVoiceShortcutDefaultCornerRadius
{
  return 13.0;
}

- (double)INUIAddVoiceShortcutDefaultHorizontalPadding
{
  [(INUIAddVoiceShortcutButton *)self metricsScale];
  return v2 * 10.0;
}

- (double)INUIAddVoiceShortcutDefaultHorizontalMargin
{
  [(INUIAddVoiceShortcutButton *)self metricsScale];
  return v2 * 16.0;
}

- (double)INUIAddVoiceShortcutIconWidthHeight
{
  [(INUIAddVoiceShortcutButton *)self metricsScale];
  return v2 * 29.0;
}

- (double)INUIAddVoiceShortcutDefaultHeight
{
  [(INUIAddVoiceShortcutButton *)self metricsScale];
  return v2 * 50.0;
}

- (double)metricsScale
{
  return 1.0;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"com.apple.IntentsUI.INUIAddVoiceShortcutViewController.didAddVoiceShortcut" object:0];

  objc_super v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:@"com.apple.IntentsUI.INUIEditVoiceShortcutViewController.didUpdateVoiceShortcut" object:0];

  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 removeObserver:self name:@"com.apple.IntentsUI.INUIEditVoiceShortcutViewController.didDeleteVoiceShortcut" object:0];

  v6.receiver = self;
  v6.super_class = (Class)INUIAddVoiceShortcutButton;
  [(INUIAddVoiceShortcutButton *)&v6 dealloc];
}

- (void)_configureWithStyle:(unint64_t)a3
{
  v116[2] = *MEMORY[0x263EF8340];
  self->_style = a3;
  [(INUIAddVoiceShortcutButton *)self INUIAddVoiceShortcutDefaultCornerRadius];
  self->_cornerRadius = v5;
  objc_super v6 = [(INUIAddVoiceShortcutButton *)self layer];
  id v7 = [(INUIAddVoiceShortcutButton *)self _backgroundColorForStyle:a3];
  objc_msgSend(v6, "setBackgroundColor:", objc_msgSend(v7, "CGColor"));

  double v8 = [(INUIAddVoiceShortcutButton *)self layer];
  [v8 setMasksToBounds:1];

  double v9 = [(INUIAddVoiceShortcutButton *)self layer];
  id v10 = [(INUIAddVoiceShortcutButton *)self _strokeColorForStyle:a3];
  objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

  id v11 = [(INUIAddVoiceShortcutButton *)self layer];
  [(INUIAddVoiceShortcutButton *)self _strokeWidthForStyle:a3];
  objc_msgSend(v11, "setBorderWidth:");

  double v12 = [(INUIAddVoiceShortcutButton *)self layer];
  [v12 setCornerCurve:*MEMORY[0x263F15A20]];

  LODWORD(v13) = 1148846080;
  [(UIView *)self _inui_setContentHuggingPriority:0 forAxis:v13];
  LODWORD(v14) = 1148846080;
  [(UIView *)self _inui_setContentHuggingPriority:1 forAxis:v14];
  objc_super v15 = (void *)MEMORY[0x263F1C6D0];
  double v16 = [(INUIAddVoiceShortcutButton *)self _sphiriImageForStyle:a3];
  double v17 = objc_msgSend(v15, "_inui_imageViewWithImage:", v16);

  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v17 setAccessibilityIgnoresInvertColors:1];
  [(INUIAddVoiceShortcutButton *)self addSubview:v17];
  double v18 = v17;
  objc_storeWeak((id *)&self->_sphiriImageView, v17);
  id v19 = objc_alloc_init(MEMORY[0x263F1C778]);
  [(INUIAddVoiceShortcutButton *)self addLayoutGuide:"addLayoutGuide:"];
  uint64_t v20 = (void *)MEMORY[0x263F1C6D0];
  BOOL v21 = [(INUIAddVoiceShortcutButton *)self _checkmarkImage];
  uint64_t v22 = objc_msgSend(v20, "_inui_imageViewWithImage:", v21);

  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  v23 = [(INUIAddVoiceShortcutButton *)self _textColorForStyle:a3];
  objc_msgSend(v22, "_inui_setTintColor:", v23);

  [v22 setHidden:1];
  [(INUIAddVoiceShortcutButton *)self addSubview:v22];
  objc_storeWeak((id *)&self->_checkmarkImageView, v22);
  v24 = (void *)MEMORY[0x263F1C768];
  v25 = [(INUIAddVoiceShortcutButton *)self _addToSiriText];
  v26 = objc_msgSend(v24, "_inui_labelWithText:", v25);

  v27 = v26;
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
  v28 = [(INUIAddVoiceShortcutButton *)self _textColorForStyle:a3];
  [v27 setTextColor:v28];

  v29 = [(INUIAddVoiceShortcutButton *)self _addToSiriFont];
  [v27 setFont:v29];

  v112 = v27;
  objc_storeWeak((id *)&self->_addToSiriLabel, v27);
  v111 = objc_msgSend(MEMORY[0x263F1C768], "_inui_labelWithText:", 0);
  [v111 setTranslatesAutoresizingMaskIntoConstraints:0];
  v30 = [MEMORY[0x263F1C550] grayColor];
  [v111 setTextColor:v30];

  uint64_t v31 = [(INUIAddVoiceShortcutButton *)self _phraseFont];
  [v111 setFont:v31];

  [v111 setHidden:1];
  objc_storeWeak((id *)&self->_phraseLabel, v111);
  uint64_t v32 = (void *)MEMORY[0x263F1C9B8];
  v116[0] = v27;
  v116[1] = v111;
  id v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v116 count:2];
  BOOL v34 = objc_msgSend(v32, "_inui_stackViewWithArrangedSubviews:userInteractionEnabled:", v33, 0);

  [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v34, "_inui_setAxis:", 1);
  [v34 setAlignment:1];
  v35 = v34;
  [(INUIAddVoiceShortcutButton *)self addSubview:v34];
  id v36 = objc_alloc_init(MEMORY[0x263F1C778]);
  [(INUIAddVoiceShortcutButton *)self addLayoutGuide:v36];
  v37 = [v18 heightAnchor];
  v38 = [v18 widthAnchor];
  v39 = [v37 constraintEqualToAnchor:v38];

  v104 = v39;
  LODWORD(v40) = 1148846080;
  [v39 setPriority:v40];
  uint64_t v41 = [v22 heightAnchor];
  int v42 = [v22 widthAnchor];
  v114 = [v41 constraintEqualToAnchor:v42];

  LODWORD(v43) = 1148846080;
  [v114 setPriority:v43];
  v44 = v36;
  v45 = [v36 leadingAnchor];
  long long v46 = [v18 trailingAnchor];
  long long v47 = [v45 constraintEqualToAnchor:v46];

  addToSiriLeadingConstraint = self->_addToSiriLeadingConstraint;
  self->_addToSiriLeadingConstraint = v47;
  v113 = v47;

  v90 = (void *)MEMORY[0x263F08938];
  v109 = [v19 leadingAnchor];
  v108 = [(INUIAddVoiceShortcutButton *)self leadingAnchor];
  [(INUIAddVoiceShortcutButton *)self INUIAddVoiceShortcutDefaultHorizontalMargin];
  v107 = objc_msgSend(v109, "constraintGreaterThanOrEqualToAnchor:constant:", v108);
  v115[0] = v107;
  v105 = [v19 trailingAnchor];
  v103 = [(INUIAddVoiceShortcutButton *)self trailingAnchor];
  [(INUIAddVoiceShortcutButton *)self INUIAddVoiceShortcutDefaultHorizontalMargin];
  v102 = [v105 constraintLessThanOrEqualToAnchor:v103 constant:-v49];
  v115[1] = v102;
  v101 = [v19 centerXAnchor];
  v100 = [(INUIAddVoiceShortcutButton *)self centerXAnchor];
  v98 = [v101 constraintEqualToAnchor:v100];
  v115[2] = v98;
  v97 = [v19 centerYAnchor];
  v96 = [(INUIAddVoiceShortcutButton *)self centerYAnchor];
  v95 = [v97 constraintEqualToAnchor:v96];
  v115[3] = v95;
  v94 = [v35 topAnchor];
  v93 = [v19 topAnchor];
  v92 = [v94 constraintEqualToAnchor:v93];
  v115[4] = v92;
  v91 = [v35 leadingAnchor];
  v50 = v44;
  v80 = v44;
  v89 = [v44 trailingAnchor];
  v88 = [v91 constraintEqualToAnchor:v89];
  v115[5] = v88;
  v110 = v35;
  v87 = [v35 bottomAnchor];
  v86 = [v19 bottomAnchor];
  v85 = [v87 constraintEqualToAnchor:v86];
  v115[6] = v85;
  v84 = [v35 trailingAnchor];
  v51 = v19;
  v82 = [v19 trailingAnchor];
  v81 = [v84 constraintEqualToAnchor:v82];
  v115[7] = v81;
  v79 = [v18 centerYAnchor];
  v78 = [v19 centerYAnchor];
  v77 = [v79 constraintEqualToAnchor:v78];
  v115[8] = v77;
  v106 = v18;
  v76 = [v18 heightAnchor];
  [(INUIAddVoiceShortcutButton *)self INUIAddVoiceShortcutIconWidthHeight];
  v75 = objc_msgSend(v76, "constraintEqualToConstant:");
  v115[9] = v75;
  v115[10] = v39;
  v74 = [v18 leadingAnchor];
  v99 = v19;
  v73 = [v19 leadingAnchor];
  v72 = [v74 constraintEqualToAnchor:v73];
  v115[11] = v72;
  v71 = [v22 centerYAnchor];
  v70 = [(INUIAddVoiceShortcutButton *)self centerYAnchor];
  v52 = [v71 constraintEqualToAnchor:v70];
  v115[12] = v52;
  v83 = v22;
  __int16 v53 = [v22 heightAnchor];
  [(INUIAddVoiceShortcutButton *)self INUIAddVoiceShortcutIconWidthHeight];
  v54 = objc_msgSend(v53, "constraintEqualToConstant:");
  v115[13] = v54;
  v115[14] = v114;
  uint64_t v55 = [v22 leadingAnchor];
  v56 = [v51 leadingAnchor];
  v57 = [v55 constraintEqualToAnchor:v56];
  v115[15] = v57;
  v115[16] = v113;
  v58 = [v50 widthAnchor];
  [(INUIAddVoiceShortcutButton *)self INUIAddVoiceShortcutDefaultHorizontalPadding];
  v59 = objc_msgSend(v58, "constraintEqualToConstant:");
  v115[17] = v59;
  v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v115 count:18];
  [v90 activateConstraints:v60];

  v61 = [v80 leadingAnchor];
  v62 = [v83 trailingAnchor];
  v63 = [v61 constraintEqualToAnchor:v62];
  addedToSiriLeadingConstraint = self->_addedToSiriLeadingConstraint;
  self->_addedToSiriLeadingConstraint = v63;

  v65 = [MEMORY[0x263F08A00] defaultCenter];
  [v65 addObserver:self selector:sel__handleVoiceShortcutUpdateNotification_ name:@"com.apple.IntentsUI.INUIAddVoiceShortcutViewController.didAddVoiceShortcut" object:0];

  v66 = [MEMORY[0x263F08A00] defaultCenter];
  [v66 addObserver:self selector:sel__handleVoiceShortcutUpdateNotification_ name:@"com.apple.IntentsUI.INUIEditVoiceShortcutViewController.didUpdateVoiceShortcut" object:0];

  v67 = [MEMORY[0x263F08A00] defaultCenter];
  [v67 addObserver:self selector:sel__handleVoiceShortcutUpdateNotification_ name:@"com.apple.IntentsUI.INUIEditVoiceShortcutViewController.didDeleteVoiceShortcut" object:0];

  id v68 = objc_alloc(MEMORY[0x263F1C5D8]);
  v69 = (void *)[v68 initWithDelegate:self];
  [(INUIAddVoiceShortcutButton *)self addInteraction:v69];
}

- (INUIAddVoiceShortcutButton)initWithCoder:(id)a3
{
  return [(INUIAddVoiceShortcutButton *)self initWithStyle:0];
}

- (INUIAddVoiceShortcutButton)initWithStyle:(INUIAddVoiceShortcutButtonStyle)style
{
  v8.receiver = self;
  v8.super_class = (Class)INUIAddVoiceShortcutButton;
  objc_super v4 = -[INUIAddVoiceShortcutButton initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  double v5 = v4;
  if (v4)
  {
    [(INUIAddVoiceShortcutButton *)v4 _configureWithStyle:style];
    objc_super v6 = v5;
  }

  return v5;
}

@end