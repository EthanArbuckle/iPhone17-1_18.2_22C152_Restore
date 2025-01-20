@interface CNStarkContactViewController
+ (BOOL)enablesTransportButtons;
+ (int64_t)tableViewStyle;
- (BOOL)hasTableViewHeaderFirstSection;
- (BOOL)isGeminiAvailable;
- (BOOL)isScrollViewControllingHeaderResizeAnimation:(id)a3;
- (BOOL)shouldDisplayAvatarHeaderView;
- (BOOL)shouldShowGameCenter;
- (CGSize)setupTableHeaderView;
- (CNCardiMessageEmailGroup)iMessageEmailGroup;
- (CNPropertyBestIDSValueQuery)bestiMessageQuery;
- (CNStarkContactNameView)contactNameView;
- (CNStarkContactViewController)initWithContact:(id)a3;
- (NSArray)activatedConstraints;
- (id)applyContactStyle;
- (id)displayHeaderView;
- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5;
- (id)title;
- (void)_initiateBestiMessagePropertyQuery;
- (void)dealloc;
- (void)loadContactViewControllerViews;
- (void)queryComplete;
- (void)setActivatedConstraints:(id)a3;
- (void)setBestiMessageQuery:(id)a3;
- (void)setContactNameView:(id)a3;
- (void)setIMessageEmailGroup:(id)a3;
- (void)setupConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CNStarkContactViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactNameView, 0);
  objc_storeStrong((id *)&self->_activatedConstraints, 0);
  objc_storeStrong((id *)&self->_iMessageEmailGroup, 0);

  objc_storeStrong((id *)&self->_bestiMessageQuery, 0);
}

- (void)setContactNameView:(id)a3
{
}

- (CNStarkContactNameView)contactNameView
{
  return self->_contactNameView;
}

- (void)setActivatedConstraints:(id)a3
{
}

- (NSArray)activatedConstraints
{
  return self->_activatedConstraints;
}

- (void)setIMessageEmailGroup:(id)a3
{
}

- (CNCardiMessageEmailGroup)iMessageEmailGroup
{
  return self->_iMessageEmailGroup;
}

- (void)setBestiMessageQuery:(id)a3
{
}

- (CNPropertyBestIDSValueQuery)bestiMessageQuery
{
  return self->_bestiMessageQuery;
}

- (void)queryComplete
{
  v3 = [(CNStarkContactViewController *)self bestiMessageQuery];
  id v23 = [v3 bestIDSProperty];

  v4 = [v23 property];
  if ([v4 isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {
    v5 = [(CNContactContentUnitaryViewController *)self displayGroups];
    v6 = [(CNStarkContactViewController *)self iMessageEmailGroup];
    char v7 = [v5 containsObject:v6];

    if (v7) {
      goto LABEL_15;
    }
    v8 = [(CNContactContentUnitaryViewController *)self displayGroups];
    v9 = [(CNContactContentUnitaryViewController *)self cardFaceTimeGroup];
    if ([v8 containsObject:v9])
    {
      v4 = [(CNContactContentUnitaryViewController *)self cardFaceTimeGroup];
    }
    else
    {
      v10 = [(CNContactContentUnitaryViewController *)self propertyGroups];
      v4 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1AEE0]];
    }
    v11 = [(CNStarkContactViewController *)self iMessageEmailGroup];

    if (!v11)
    {
      [v23 setAllowsIMessage:1];
      [v23 setAllowsEmail:0];
      v12 = [CNCardiMessageEmailGroup alloc];
      v13 = [(CNContactContentUnitaryViewController *)self contact];
      v14 = [(CNCardiMessageEmailGroup *)v12 initWithContact:v13 propertyItem:v23];
      [(CNStarkContactViewController *)self setIMessageEmailGroup:v14];
    }
    if (v4)
    {
      v15 = [(CNStarkContactViewController *)self iMessageEmailGroup];
      [(CNContactContentUnitaryViewController *)self addCardGroup:v15 afterGroup:v4];
    }
    v16 = [(CNContactContentUnitaryViewController *)self displayGroups];
    uint64_t v17 = [v16 indexOfObject:v4];

    if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = v17 + 1;
    }
    v19 = [(CNContactContentUnitaryViewController *)self contactView];
    [v19 beginUpdates];
    v20 = [(CNContactContentUnitaryViewController *)self displayGroups];
    v21 = [(CNStarkContactViewController *)self iMessageEmailGroup];
    [v20 insertObject:v21 atIndex:v18];

    v22 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v18];
    [v19 insertSections:v22 withRowAnimation:6];

    [v19 endUpdates];
  }

LABEL_15:
}

- (void)_initiateBestiMessagePropertyQuery
{
  v3 = [(CNContactContentUnitaryViewController *)self propertyGroups];
  id v15 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1AEE0]];

  v4 = [(CNContactContentUnitaryViewController *)self propertyGroups];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1ADC8]];

  v6 = [MEMORY[0x1E4F1CA48] array];
  char v7 = [v15 displayItems];

  if (v7)
  {
    v8 = [v15 displayItems];
    [v6 addObjectsFromArray:v8];
  }
  v9 = [v5 displayItems];

  if (v9)
  {
    v10 = [v5 displayItems];
    [v6 addObjectsFromArray:v10];
  }
  v11 = [CNPropertyBestIDSValueQuery alloc];
  v12 = getIDSServiceNameiMessage_42136();
  v13 = [(CNPropertyBestIDSValueQuery *)v11 initWithPropertyItems:v6 service:v12];
  [(CNStarkContactViewController *)self setBestiMessageQuery:v13];

  v14 = [(CNStarkContactViewController *)self bestiMessageQuery];
  [v14 setDelegate:self];
}

- (BOOL)isScrollViewControllingHeaderResizeAnimation:(id)a3
{
  return 0;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNStarkContactViewController;
  [(CNContactContentUnitaryViewController *)&v8 viewWillAppear:a3];
  v4 = +[CNUIColorRepository carPlayTableViewBackgroundColor];
  v5 = [(CNStarkContactViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = +[CNUIColorRepository carPlayTableViewBackgroundColor];
  char v7 = [(CNContactContentUnitaryViewController *)self contactView];
  [v7 setBackgroundColor:v6];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CNStarkContactViewController;
  [(CNContactContentUnitaryViewController *)&v3 viewDidLoad];
  [(CNStarkContactViewController *)self _initiateBestiMessagePropertyQuery];
}

- (void)setupConstraints
{
  v32[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F28DC8];
  v4 = [(CNStarkContactViewController *)self activatedConstraints];
  [v3 deactivateConstraints:v4];

  v31 = [(CNContactContentUnitaryViewController *)self contactView];
  v29 = [v31 widthAnchor];
  v30 = [(CNStarkContactViewController *)self view];
  v28 = [v30 safeAreaLayoutGuide];
  v27 = [v28 widthAnchor];
  v26 = [v29 constraintEqualToAnchor:v27];
  v32[0] = v26;
  v25 = [(CNContactContentUnitaryViewController *)self contactView];
  id v23 = [v25 heightAnchor];
  v24 = [(CNStarkContactViewController *)self view];
  v22 = [v24 safeAreaLayoutGuide];
  v21 = [v22 heightAnchor];
  v20 = [v23 constraintEqualToAnchor:v21];
  v32[1] = v20;
  v19 = [(CNContactContentUnitaryViewController *)self contactView];
  uint64_t v17 = [v19 topAnchor];
  uint64_t v18 = [(CNStarkContactViewController *)self view];
  v16 = [v18 safeAreaLayoutGuide];
  v5 = [v16 topAnchor];
  v6 = [v17 constraintEqualToAnchor:v5];
  v32[2] = v6;
  char v7 = [(CNContactContentUnitaryViewController *)self contactView];
  objc_super v8 = [v7 leftAnchor];
  v9 = [(CNStarkContactViewController *)self view];
  v10 = [v9 safeAreaLayoutGuide];
  v11 = [v10 leftAnchor];
  v12 = [v8 constraintEqualToAnchor:v11];
  v32[3] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
  [(CNStarkContactViewController *)self setActivatedConstraints:v13];

  v14 = (void *)MEMORY[0x1E4F28DC8];
  id v15 = [(CNStarkContactViewController *)self activatedConstraints];
  [v14 activateConstraints:v15];
}

- (void)loadContactViewControllerViews
{
  v33[3] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(CNContactContentUnitaryViewController *)self contactView];
  v4 = [(CNStarkContactViewController *)self view];
  [v4 addSubview:v3];

  [v3 setCellsLayoutCachingEnabled:0];
  [v3 setBackgroundView:0];
  [v3 setTableHeaderView:0];
  [v3 setShouldUseMapTiles:0];
  [v3 setLayoutMarginsFollowReadableWidth:0];
  uint64_t v30 = *MEMORY[0x1E4FB06F8];
  uint64_t v5 = v30;
  v6 = +[CNUIFontRepository carPlayTableViewCellTitleFont];
  v33[0] = v6;
  uint64_t v31 = *MEMORY[0x1E4FB0700];
  uint64_t v7 = v31;
  objc_super v8 = +[CNUIColorRepository carPlayTableViewCellTitleTextColor];
  v33[1] = v8;
  v32 = @"ABHilightedColorAttributeName";
  v9 = +[CNUIColorRepository carPlayTableViewCellTitleTextHighlightedColor];
  v33[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v30 count:3];
  [v3 setLabelTextAttributes:v10];

  v28[0] = v5;
  v11 = +[CNUIFontRepository carPlayTableViewCellSubtitleFont];
  v29[0] = v11;
  v28[1] = v7;
  v12 = +[CNUIColorRepository carPlayTableViewCellSubtitleTextColor];
  v29[1] = v12;
  v28[2] = @"ABHilightedColorAttributeName";
  v13 = +[CNUIColorRepository carPlayTableViewCellSubtitleTextHighlightedColor];
  v29[2] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];
  [v3 setValueTextAttributes:v14];

  [v3 setDataSource:self];
  [v3 setDelegate:self];
  uint64_t v15 = objc_opt_class();
  v16 = +[CNContactView cellIdentifierForProperty:0];
  [v3 registerClass:v15 forCellReuseIdentifier:v16];

  uint64_t v17 = objc_opt_class();
  uint64_t v18 = +[CNContactView cellIdentifierForProperty:*MEMORY[0x1E4F1AEE0]];
  [v3 registerClass:v17 forCellReuseIdentifier:v18];

  uint64_t v19 = objc_opt_class();
  v20 = +[CNContactView cellIdentifierForProperty:*MEMORY[0x1E4F1ADC8]];
  [v3 registerClass:v19 forCellReuseIdentifier:v20];

  uint64_t v21 = objc_opt_class();
  v22 = +[CNContactView cellIdentifierForFaceTimeGroup];
  [v3 registerClass:v21 forCellReuseIdentifier:v22];

  uint64_t v23 = objc_opt_class();
  v24 = +[CNContactView cellIdentifierForProperty:*MEMORY[0x1E4F1AF10]];
  [v3 registerClass:v23 forCellReuseIdentifier:v24];

  v25 = [CNStarkContactNameView alloc];
  v26 = [(CNContactContentUnitaryViewController *)self contact];
  v27 = [(CNStarkContactNameView *)v25 initWithName:v26];
  [(CNStarkContactViewController *)self setContactNameView:v27];
}

- (id)applyContactStyle
{
  return 0;
}

- (id)displayHeaderView
{
  return 0;
}

- (BOOL)hasTableViewHeaderFirstSection
{
  return 0;
}

- (CGSize)setupTableHeaderView
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldDisplayAvatarHeaderView
{
  return 0;
}

- (BOOL)shouldShowGameCenter
{
  return 0;
}

- (BOOL)isGeminiAvailable
{
  return 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNStarkContactViewController;
  [(CNContactContentUnitaryViewController *)&v5 viewWillDisappear:a3];
  v4 = [(CNContactContentUnitaryViewController *)self contactView];
  [v4 resignFirstResponder];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNStarkContactViewController;
  [(CNContactContentUnitaryViewController *)&v5 viewDidAppear:a3];
  v4 = [(CNContactContentUnitaryViewController *)self contactView];
  [v4 becomeFirstResponder];
}

- (void)viewWillLayoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)CNStarkContactViewController;
  [(CNContactContentUnitaryViewController *)&v21 viewWillLayoutSubviews];
  double v3 = [(CNStarkContactViewController *)self contactNameView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;

  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  double Width = CGRectGetWidth(v22);
  v13 = [(CNStarkContactViewController *)self view];
  [v13 frame];
  double v14 = CGRectGetWidth(v23) * 0.6;

  if (Width >= v14) {
    double Width = v14;
  }
  uint64_t v15 = [(CNStarkContactViewController *)self contactNameView];
  objc_msgSend(v15, "setFrame:", v5, v7, Width, v11);

  v16 = [(CNStarkContactViewController *)self contactNameView];
  [v16 setNeedsLayout];

  id v17 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v18 = [(CNStarkContactViewController *)self contactNameView];
  uint64_t v19 = (void *)[v17 initWithCustomView:v18];
  v20 = [(CNStarkContactViewController *)self navigationItem];
  [v20 setRightBarButtonItem:v19];
}

- (id)title
{
  return 0;
}

- (void)dealloc
{
  double v3 = [(CNStarkContactViewController *)self bestiMessageQuery];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)CNStarkContactViewController;
  [(CNContactContentUnitaryViewController *)&v4 dealloc];
}

- (CNStarkContactViewController)initWithContact:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNStarkContactViewController;
  double v3 = [(CNContactContentUnitaryViewController *)&v8 initWithContact:a3];
  objc_super v4 = v3;
  if (v3)
  {
    [(CNContactContentUnitaryViewController *)v3 setAllowsActions:1];
    [(CNContactContentUnitaryViewController *)v4 setAllowsCardActions:0];
    [(CNContactContentUnitaryViewController *)v4 setAllowsEditing:0];
    [(CNContactContentUnitaryViewController *)v4 setAllowsAddingToAddressBook:0];
    [(CNContactContentUnitaryViewController *)v4 setAllowsSharing:0];
    [(CNContactContentUnitaryViewController *)v4 setAllowsAddToFavorites:0];
    double v5 = +[CNCapabilitiesManager defaultCapabilitiesManager];
    -[CNContactContentUnitaryViewController setAllowsConferencing:](v4, "setAllowsConferencing:", [v5 isFaceTimeAudioAvailable]);

    double v6 = v4;
  }

  return v4;
}

+ (BOOL)enablesTransportButtons
{
  return 0;
}

+ (int64_t)tableViewStyle
{
  return 0;
}

@end