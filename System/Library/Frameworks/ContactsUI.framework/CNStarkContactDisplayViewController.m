@interface CNStarkContactDisplayViewController
+ (int64_t)tableViewStyle;
- (BOOL)hasTableViewHeaderFirstSection;
- (BOOL)isGeminiAvailable;
- (BOOL)isScrollViewControllingHeaderResizeAnimation:(id)a3;
- (BOOL)shouldDisplayAvatarHeaderView;
- (CGSize)setupTableHeaderView;
- (CNCardiMessageEmailGroup)iMessageEmailGroup;
- (CNPropertyBestIDSValueQuery)bestiMessageQuery;
- (CNStarkContactDisplayViewController)initWithContact:(id)a3 contactViewConfiguration:(id)a4;
- (CNStarkContactNameView)contactNameView;
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

@implementation CNStarkContactDisplayViewController

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
  v3 = [(CNStarkContactDisplayViewController *)self bestiMessageQuery];
  id v22 = [v3 bestIDSProperty];

  v4 = [v22 property];
  if ([v4 isEqualToString:*MEMORY[0x1E4F1ADC8]])
  {
    v5 = [(CNContactContentDisplayViewController *)self displayGroups];
    v6 = [(CNStarkContactDisplayViewController *)self iMessageEmailGroup];
    char v7 = [v5 containsObject:v6];

    if (v7) {
      goto LABEL_13;
    }
    v8 = [(CNContactContentDisplayViewController *)self displayGroups];
    v9 = [(CNContactContentDisplayViewController *)self cardFaceTimeGroup];
    if ([v8 containsObject:v9])
    {
      v4 = [(CNContactContentDisplayViewController *)self cardFaceTimeGroup];
    }
    else
    {
      v10 = [(CNContactContentDisplayViewController *)self propertyGroups];
      v4 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1AEE0]];
    }
    v11 = [(CNStarkContactDisplayViewController *)self iMessageEmailGroup];

    if (!v11)
    {
      [v22 setAllowsIMessage:1];
      [v22 setAllowsEmail:0];
      v12 = [CNCardiMessageEmailGroup alloc];
      v13 = [(CNContactContentDisplayViewController *)self contact];
      v14 = [(CNCardiMessageEmailGroup *)v12 initWithContact:v13 propertyItem:v22];
      [(CNStarkContactDisplayViewController *)self setIMessageEmailGroup:v14];
    }
    v15 = [(CNContactContentDisplayViewController *)self displayGroups];
    uint64_t v16 = [v15 indexOfObject:v4];

    if (v16 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v17 = 0;
    }
    else {
      uint64_t v17 = v16 + 1;
    }
    v18 = [(CNContactContentDisplayViewController *)self contactView];
    [v18 beginUpdates];
    v19 = [(CNContactContentDisplayViewController *)self displayGroups];
    v20 = [(CNStarkContactDisplayViewController *)self iMessageEmailGroup];
    [v19 insertObject:v20 atIndex:v17];

    v21 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v17];
    [v18 insertSections:v21 withRowAnimation:6];

    [v18 endUpdates];
  }

LABEL_13:
}

- (void)_initiateBestiMessagePropertyQuery
{
  v3 = [(CNContactContentDisplayViewController *)self propertyGroups];
  id v15 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1AEE0]];

  v4 = [(CNContactContentDisplayViewController *)self propertyGroups];
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
  v12 = getIDSServiceNameiMessage_51450();
  v13 = [(CNPropertyBestIDSValueQuery *)v11 initWithPropertyItems:v6 service:v12];
  [(CNStarkContactDisplayViewController *)self setBestiMessageQuery:v13];

  v14 = [(CNStarkContactDisplayViewController *)self bestiMessageQuery];
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
  v8.super_class = (Class)CNStarkContactDisplayViewController;
  [(CNContactContentDisplayViewController *)&v8 viewWillAppear:a3];
  v4 = +[CNUIColorRepository carPlayTableViewBackgroundColor];
  v5 = [(CNStarkContactDisplayViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = +[CNUIColorRepository carPlayTableViewBackgroundColor];
  char v7 = [(CNContactContentDisplayViewController *)self contactView];
  [v7 setBackgroundColor:v6];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)CNStarkContactDisplayViewController;
  [(CNContactContentDisplayViewController *)&v3 viewDidLoad];
  [(CNStarkContactDisplayViewController *)self _initiateBestiMessagePropertyQuery];
}

- (void)setupConstraints
{
  v30[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)MEMORY[0x1E4F28DC8];
  v4 = [(CNStarkContactDisplayViewController *)self activatedConstraints];
  [v3 deactivateConstraints:v4];

  v5 = [(CNContactContentDisplayViewController *)self contactView];
  v28 = [v5 widthAnchor];
  v29 = [(CNStarkContactDisplayViewController *)self view];
  v27 = [v29 safeAreaLayoutGuide];
  v26 = [v27 widthAnchor];
  v25 = [v28 constraintEqualToAnchor:v26];
  v30[0] = v25;
  id v22 = [v5 heightAnchor];
  v24 = [(CNStarkContactDisplayViewController *)self view];
  v21 = [v24 safeAreaLayoutGuide];
  v20 = [v21 heightAnchor];
  v19 = [v22 constraintEqualToAnchor:v20];
  v30[1] = v19;
  v23 = v5;
  uint64_t v17 = [v5 topAnchor];
  v18 = [(CNStarkContactDisplayViewController *)self view];
  v6 = [v18 safeAreaLayoutGuide];
  char v7 = [v6 topAnchor];
  objc_super v8 = [v17 constraintEqualToAnchor:v7];
  v30[2] = v8;
  v9 = [v5 leftAnchor];
  v10 = [(CNStarkContactDisplayViewController *)self view];
  v11 = [v10 safeAreaLayoutGuide];
  v12 = [v11 leftAnchor];
  v13 = [v9 constraintEqualToAnchor:v12];
  v30[3] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  [(CNStarkContactDisplayViewController *)self setActivatedConstraints:v14];

  id v15 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v16 = [(CNStarkContactDisplayViewController *)self activatedConstraints];
  [v15 activateConstraints:v16];
}

- (void)loadContactViewControllerViews
{
  v33[3] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(CNContactContentDisplayViewController *)self contactView];
  v4 = [(CNStarkContactDisplayViewController *)self view];
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
  uint64_t v16 = +[CNContactView cellIdentifierForProperty:0];
  [v3 registerClass:v15 forCellReuseIdentifier:v16];

  uint64_t v17 = objc_opt_class();
  v18 = +[CNContactView cellIdentifierForProperty:*MEMORY[0x1E4F1AEE0]];
  [v3 registerClass:v17 forCellReuseIdentifier:v18];

  uint64_t v19 = objc_opt_class();
  v20 = +[CNContactView cellIdentifierForProperty:*MEMORY[0x1E4F1ADC8]];
  [v3 registerClass:v19 forCellReuseIdentifier:v20];

  uint64_t v21 = objc_opt_class();
  id v22 = +[CNContactView cellIdentifierForFaceTimeGroup];
  [v3 registerClass:v21 forCellReuseIdentifier:v22];

  uint64_t v23 = objc_opt_class();
  v24 = +[CNContactView cellIdentifierForProperty:*MEMORY[0x1E4F1AF10]];
  [v3 registerClass:v23 forCellReuseIdentifier:v24];

  v25 = [CNStarkContactNameView alloc];
  v26 = [(CNContactContentDisplayViewController *)self contact];
  v27 = [(CNStarkContactNameView *)v25 initWithName:v26];
  [(CNStarkContactDisplayViewController *)self setContactNameView:v27];
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

- (BOOL)isGeminiAvailable
{
  return 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNStarkContactDisplayViewController;
  [(CNContactContentDisplayViewController *)&v5 viewWillDisappear:a3];
  v4 = [(CNStarkContactDisplayViewController *)self view];
  [v4 resignFirstResponder];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNStarkContactDisplayViewController;
  [(CNContactContentDisplayViewController *)&v5 viewDidAppear:a3];
  v4 = [(CNStarkContactDisplayViewController *)self view];
  [v4 becomeFirstResponder];
}

- (void)viewWillLayoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)CNStarkContactDisplayViewController;
  [(CNContactContentDisplayViewController *)&v21 viewWillLayoutSubviews];
  double v3 = [(CNStarkContactDisplayViewController *)self contactNameView];
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
  v13 = [(CNStarkContactDisplayViewController *)self view];
  [v13 frame];
  double v14 = CGRectGetWidth(v23) * 0.6;

  if (Width >= v14) {
    double Width = v14;
  }
  uint64_t v15 = [(CNStarkContactDisplayViewController *)self contactNameView];
  objc_msgSend(v15, "setFrame:", v5, v7, Width, v11);

  uint64_t v16 = [(CNStarkContactDisplayViewController *)self contactNameView];
  [v16 setNeedsLayout];

  id v17 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v18 = [(CNStarkContactDisplayViewController *)self contactNameView];
  uint64_t v19 = (void *)[v17 initWithCustomView:v18];
  v20 = [(CNStarkContactDisplayViewController *)self navigationItem];
  [v20 setRightBarButtonItem:v19];
}

- (id)title
{
  return 0;
}

- (void)dealloc
{
  double v3 = [(CNStarkContactDisplayViewController *)self bestiMessageQuery];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)CNStarkContactDisplayViewController;
  [(CNContactContentDisplayViewController *)&v4 dealloc];
}

- (CNStarkContactDisplayViewController)initWithContact:(id)a3 contactViewConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v6 setAllowsActions:1];
  [v6 setAllowsCardActions:0];
  [v6 setAllowsEditing:0];
  [v6 setAllowsAddingToAddressBook:0];
  [v6 setAllowsSharing:0];
  [v6 setAllowsAddToFavorites:0];
  double v8 = +[CNCapabilitiesManager defaultCapabilitiesManager];
  objc_msgSend(v6, "setAllowsConferencing:", objc_msgSend(v8, "isFaceTimeAudioAvailable"));

  v12.receiver = self;
  v12.super_class = (Class)CNStarkContactDisplayViewController;
  CGFloat v9 = [(CNContactContentDisplayViewController *)&v12 initWithContact:v7 contactViewConfiguration:v6];

  if (v9) {
    double v10 = v9;
  }

  return v9;
}

+ (int64_t)tableViewStyle
{
  return 0;
}

@end