@interface AMUIPhotosLabelView
- (AMUIPhotosLabelView)initWithSymbolName:(id)a3 title:(id)a4;
- (NSString)symbolName;
- (NSString)title;
- (double)preferredBottomMargin;
- (double)preferredLeadingMargin;
- (double)preferredTopMargin;
- (id)_symbolImageConfiguration;
- (id)viewForLastBaselineLayout;
- (void)_noteWindowWillRotate:(id)a3;
- (void)_updateForAmbientDisplayStyle;
- (void)_updateForAmbientDisplayStyleAnimated:(BOOL)a3;
- (void)_updateForInterfaceOrientation:(int64_t)a3;
- (void)_updateForWindow:(id)a3;
- (void)didMoveToWindow;
- (void)setSymbolName:(id)a3;
- (void)setTitle:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)willMoveToWindow:(id)a3;
@end

@implementation AMUIPhotosLabelView

- (AMUIPhotosLabelView)initWithSymbolName:(id)a3 title:(id)a4
{
  v60[10] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v58.receiver = self;
  v58.super_class = (Class)AMUIPhotosLabelView;
  v8 = [(AMUIPhotosLabelView *)&v58 init];
  if (v8)
  {
    uint64_t v9 = +[AMUIPosterSwitcherDomain rootSettings];
    settings = v8->_settings;
    v8->_settings = (AMUIPosterSwitcherSettings *)v9;

    [(PTSettings *)v8->_settings addKeyObserver:v8];
    v56 = [MEMORY[0x263F1C658] systemFontOfSize:*MEMORY[0x263F1D200] weight:42.0 design:*MEMORY[0x263F1D318]];
    id v11 = objc_alloc_init(MEMORY[0x263F1C768]);
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v11 setFont:v56];
    v55 = v11;
    [v11 setText:v7];
    v12 = [MEMORY[0x263F1C550] whiteColor];
    [v11 setTextColor:v12];

    [(AMUIPhotosLabelView *)v8 addSubview:v11];
    objc_storeStrong((id *)&v8->_titleLabel, v11);
    id v13 = objc_alloc(MEMORY[0x263F1CB98]);
    v14 = [MEMORY[0x263F1C480] effectWithStyle:6];
    v15 = (void *)[v13 initWithEffect:v14];

    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v15 _setCornerRadius:37.0];
    [v15 setOverrideUserInterfaceStyle:1];
    [(AMUIPhotosLabelView *)v8 addSubview:v15];
    id v54 = objc_alloc_init(MEMORY[0x263F1C6D0]);
    [v54 setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = [v15 contentView];
    [v16 addSubview:v54];

    objc_storeStrong((id *)&v8->_symbolImageView, v54);
    [(AMUIPhotosLabelView *)v8 setSymbolName:v6];
    v41 = (void *)MEMORY[0x263F08938];
    v53 = [(AMUIPhotosLabelView *)v8 leadingAnchor];
    v52 = [v15 leadingAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v60[0] = v51;
    v50 = [(AMUIPhotosLabelView *)v8 trailingAnchor];
    v49 = [(UILabel *)v8->_titleLabel trailingAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v60[1] = v48;
    v47 = [(AMUIPhotosLabelView *)v8 topAnchor];
    v46 = [v15 topAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v60[2] = v45;
    v44 = [(AMUIPhotosLabelView *)v8 bottomAnchor];
    v43 = [v15 bottomAnchor];
    v42 = [v44 constraintEqualToAnchor:v43];
    v60[3] = v42;
    v40 = [v15 widthAnchor];
    v39 = [v40 constraintEqualToConstant:74.0];
    v60[4] = v39;
    v38 = [v15 heightAnchor];
    v37 = [v15 widthAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v60[5] = v36;
    v35 = [(UIImageView *)v8->_symbolImageView centerXAnchor];
    v34 = [v15 centerXAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v60[6] = v33;
    v32 = [(UIImageView *)v8->_symbolImageView centerYAnchor];
    v31 = [v15 centerYAnchor];
    v30 = [v32 constraintEqualToAnchor:v31];
    v60[7] = v30;
    v17 = [(UIImageView *)v8->_symbolImageView firstBaselineAnchor];
    v18 = [(UILabel *)v8->_titleLabel firstBaselineAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v60[8] = v19;
    [(UILabel *)v8->_titleLabel leadingAnchor];
    v20 = id v57 = v7;
    v21 = [v15 trailingAnchor];
    [v20 constraintEqualToAnchor:v21 constant:12.0];
    v23 = id v22 = v6;
    v60[9] = v23;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v60 count:10];
    [v41 activateConstraints:v24];

    id v6 = v22;
    id v7 = v57;

    v25 = [MEMORY[0x263F08A00] defaultCenter];
    [v25 addObserver:v8 selector:sel__noteWindowWillRotate_ name:*MEMORY[0x263F1D840] object:0];

    v26 = self;
    v59 = v26;
    v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v59 count:1];
    id v28 = (id)[(AMUIPhotosLabelView *)v8 registerForTraitChanges:v27 withAction:sel__updateForAmbientDisplayStyle];

    [(AMUIPhotosLabelView *)v8 _updateForAmbientDisplayStyleAnimated:0];
  }

  return v8;
}

- (void)setSymbolName:(id)a3
{
  id v9 = a3;
  if ((BSEqualStrings() & 1) == 0)
  {
    v4 = (NSString *)[v9 copy];
    symbolName = self->_symbolName;
    self->_symbolName = v4;

    id v6 = (void *)MEMORY[0x263F1C6B0];
    id v7 = [(AMUIPhotosLabelView *)self _symbolImageConfiguration];
    v8 = [v6 systemImageNamed:v9 withConfiguration:v7];

    [(UIImageView *)self->_symbolImageView setImage:v8];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
}

- (double)preferredLeadingMargin
{
  return 32.0;
}

- (double)preferredTopMargin
{
  return 28.0;
}

- (double)preferredBottomMargin
{
  return 28.0;
}

- (id)viewForLastBaselineLayout
{
  return self->_titleLabel;
}

- (void)willMoveToWindow:(id)a3
{
  if (a3) {
    -[AMUIPhotosLabelView _updateForWindow:](self, "_updateForWindow:");
  }
}

- (void)didMoveToWindow
{
  uint64_t v3 = [(AMUIPhotosLabelView *)self window];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v3 = [(AMUIPhotosLabelView *)self _updateForWindow:v3];
    uint64_t v4 = v5;
  }

  MEMORY[0x270F9A758](v3, v4);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if ([a4 isEqualToString:@"photoSymbolHugsEdge"])
  {
    id v5 = [(AMUIPhotosLabelView *)self window];
    [(AMUIPhotosLabelView *)self _updateForWindow:v5];
  }
}

- (id)_symbolImageConfiguration
{
  v2 = [MEMORY[0x263F1C6C8] configurationWithPointSize:7 weight:1 scale:42.0];
  uint64_t v3 = (void *)MEMORY[0x263F1C6C8];
  uint64_t v4 = [MEMORY[0x263F1C550] whiteColor];
  id v5 = [v3 configurationWithHierarchicalColor:v4];
  id v6 = [v2 configurationByApplyingConfiguration:v5];

  return v6;
}

- (void)_noteWindowWillRotate:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [v13 object];
  id v5 = [(AMUIPhotosLabelView *)self window];

  if (v4 == v5)
  {
    id v6 = [v13 userInfo];
    id v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F1D828]];
    uint64_t v8 = objc_opt_class();
    id v9 = v7;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        v10 = v9;
      }
      else {
        v10 = 0;
      }
    }
    else
    {
      v10 = 0;
    }
    id v11 = v10;

    uint64_t v12 = [v11 integerValue];
    [(AMUIPhotosLabelView *)self _updateForInterfaceOrientation:v12];
  }
}

- (void)_updateForWindow:(id)a3
{
  uint64_t v4 = [a3 _windowInterfaceOrientation];

  [(AMUIPhotosLabelView *)self _updateForInterfaceOrientation:v4];
}

- (void)_updateForInterfaceOrientation:(int64_t)a3
{
  BOOL v5 = [(AMUIPosterSwitcherSettings *)self->_settings photoSymbolHugsEdge];
  uint64_t v6 = 3;
  if (a3 != 4) {
    uint64_t v6 = 0;
  }
  if (a3 == 3) {
    uint64_t v6 = 4;
  }
  if (v5) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }

  [(AMUIPhotosLabelView *)self setSemanticContentAttribute:v7];
}

- (void)_updateForAmbientDisplayStyle
{
}

- (void)_updateForAmbientDisplayStyleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(AMUIPhotosLabelView *)self traitCollection];
  uint64_t v6 = self;
  [v5 valueForNSIntegerTrait:v6];
  int IsRedMode = AMUIAmbientDisplayStyleIsRedMode();

  if (IsRedMode)
  {
    [(AMUIPhotosLabelView *)self amui_applyRedModeFilterAnimated:v3 withCompletion:0];
  }
  else
  {
    [(AMUIPhotosLabelView *)self amui_clearRedModeFilterAnimated:v3 withCompletion:0];
  }
}

- (NSString)symbolName
{
  return self->_symbolName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolName, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_symbolImageView, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end