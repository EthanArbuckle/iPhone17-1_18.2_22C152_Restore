@interface CNCombinedVisualIdentityEditorViewController
+ (id)log;
- (CNCombinedVisualIdentityEditorViewController)initWithProviderItem:(id)a3 dataSource:(id)a4;
- (CNPhotoPickerDataSource)dataSource;
- (CNVisualIdentityAvatarStyleEditorViewController)emojiEditor;
- (CNVisualIdentityAvatarStyleEditorViewController)selectedEditor;
- (CNVisualIdentityAvatarStyleEditorViewController)textEditor;
- (CNVisualIdentityItemEditorViewControllerDelegate)delegate;
- (UISegmentedControl)segmentedControl;
- (id)_newStyleEditorWithItem:(id)a3;
- (id)updatedProviderItem;
- (void)_segmentedControlDidChange:(id)a3;
- (void)_updateEditorsVisibility;
- (void)didTapCancel;
- (void)didTapDone;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEmojiEditor:(id)a3;
- (void)setSegmentedControl:(id)a3;
- (void)setSelectedEditor:(id)a3;
- (void)setTextEditor:(id)a3;
- (void)setupBarButtonItems;
- (void)setupEditors;
- (void)setupSegmentedControl;
- (void)updateDoneButtonEnabledState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CNCombinedVisualIdentityEditorViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedEditor, 0);
  objc_storeStrong((id *)&self->_emojiEditor, 0);
  objc_storeStrong((id *)&self->_textEditor, 0);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setSelectedEditor:(id)a3
{
}

- (CNVisualIdentityAvatarStyleEditorViewController)selectedEditor
{
  return self->_selectedEditor;
}

- (void)setEmojiEditor:(id)a3
{
}

- (CNVisualIdentityAvatarStyleEditorViewController)emojiEditor
{
  return self->_emojiEditor;
}

- (void)setTextEditor:(id)a3
{
}

- (CNVisualIdentityAvatarStyleEditorViewController)textEditor
{
  return self->_textEditor;
}

- (void)setSegmentedControl:(id)a3
{
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setDataSource:(id)a3
{
}

- (CNPhotoPickerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDelegate:(id)a3
{
}

- (CNVisualIdentityItemEditorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNVisualIdentityItemEditorViewControllerDelegate *)WeakRetained;
}

- (id)updatedProviderItem
{
  v3 = [(CNCombinedVisualIdentityEditorViewController *)self selectedEditor];
  v4 = [v3 providerItem];
  if ([v4 conformsToProtocol:&unk_1ED9A0450]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [(CNCombinedVisualIdentityEditorViewController *)self selectedEditor];
  v8 = v7;
  if (v6)
  {
    v9 = [v7 editableAvatarViewController];
    v10 = [v9 text];
    v11 = [v6 updatedProviderItemWithText:v10];
  }
  else
  {
    v9 = [v7 providerItem];
    v11 = (void *)[v9 copy];
  }

  return v11;
}

- (void)didTapDone
{
  v3 = [(CNCombinedVisualIdentityEditorViewController *)self delegate];

  if (v3)
  {
    id v5 = [(CNCombinedVisualIdentityEditorViewController *)self updatedProviderItem];
    v4 = [(CNCombinedVisualIdentityEditorViewController *)self delegate];
    [v4 visualIdentityEditorController:self didFinishWithProviderItem:v5];
  }
  else
  {
    [(CNCombinedVisualIdentityEditorViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)didTapCancel
{
  v3 = [(CNCombinedVisualIdentityEditorViewController *)self delegate];

  if (v3)
  {
    id v4 = [(CNCombinedVisualIdentityEditorViewController *)self delegate];
    [v4 visualIdentityEditorControllerDidCancel:self];
  }
  else
  {
    [(CNCombinedVisualIdentityEditorViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_updateEditorsVisibility
{
  v3 = [(CNCombinedVisualIdentityEditorViewController *)self selectedEditor];
  emojiEditor = self->_emojiEditor;
  BOOL v5 = v3 == emojiEditor;
  BOOL v6 = v3 != emojiEditor;

  v7 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_emojiEditor view];
  [v7 setHidden:v6];

  id v8 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_textEditor view];
  [v8 setHidden:v5];
}

- (void)setupEditors
{
  v51[8] = *MEMORY[0x1E4F143B8];
  v3 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_textEditor view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_textEditor view];
  [v4 setHidden:1];

  BOOL v5 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_emojiEditor view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  BOOL v6 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_emojiEditor view];
  [v6 setHidden:1];

  [(CNCombinedVisualIdentityEditorViewController *)self addChildViewController:self->_textEditor];
  v7 = [(CNCombinedVisualIdentityEditorViewController *)self view];
  id v8 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_textEditor view];
  [v7 addSubview:v8];

  [(CNVisualIdentityAvatarStyleEditorViewController *)self->_textEditor didMoveToParentViewController:self];
  [(CNCombinedVisualIdentityEditorViewController *)self addChildViewController:self->_emojiEditor];
  v9 = [(CNCombinedVisualIdentityEditorViewController *)self view];
  v10 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_emojiEditor view];
  [v9 addSubview:v10];

  [(CNVisualIdentityAvatarStyleEditorViewController *)self->_emojiEditor didMoveToParentViewController:self];
  v50 = [(CNCombinedVisualIdentityEditorViewController *)self view];
  v49 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_textEditor view];
  v48 = [v49 topAnchor];
  v47 = [(UISegmentedControl *)self->_segmentedControl bottomAnchor];
  v46 = [v48 constraintEqualToAnchor:v47 constant:0.0];
  v51[0] = v46;
  v45 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_textEditor view];
  v43 = [v45 bottomAnchor];
  v44 = [(CNCombinedVisualIdentityEditorViewController *)self view];
  v42 = [v44 bottomAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:0.0];
  v51[1] = v41;
  v40 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_textEditor view];
  v38 = [v40 leadingAnchor];
  v39 = [(CNCombinedVisualIdentityEditorViewController *)self view];
  v37 = [v39 leadingAnchor];
  v36 = [v38 constraintEqualToAnchor:v37 constant:0.0];
  v51[2] = v36;
  v35 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_textEditor view];
  v33 = [v35 trailingAnchor];
  v34 = [(CNCombinedVisualIdentityEditorViewController *)self view];
  v32 = [v34 trailingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32 constant:0.0];
  v51[3] = v31;
  v30 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_emojiEditor view];
  v29 = [v30 topAnchor];
  v28 = [(UISegmentedControl *)self->_segmentedControl bottomAnchor];
  v27 = [v29 constraintEqualToAnchor:v28 constant:0.0];
  v51[4] = v27;
  v26 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_emojiEditor view];
  v24 = [v26 bottomAnchor];
  v25 = [(CNCombinedVisualIdentityEditorViewController *)self view];
  v23 = [v25 bottomAnchor];
  v22 = [v24 constraintEqualToAnchor:v23 constant:0.0];
  v51[5] = v22;
  v21 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_emojiEditor view];
  v20 = [v21 leadingAnchor];
  v11 = [(CNCombinedVisualIdentityEditorViewController *)self view];
  v12 = [v11 leadingAnchor];
  v13 = [v20 constraintEqualToAnchor:v12 constant:0.0];
  v51[6] = v13;
  v14 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_emojiEditor view];
  v15 = [v14 trailingAnchor];
  v16 = [(CNCombinedVisualIdentityEditorViewController *)self view];
  v17 = [v16 trailingAnchor];
  v18 = [v15 constraintEqualToAnchor:v17 constant:0.0];
  v51[7] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:8];
  [v50 addConstraints:v19];

  [(CNCombinedVisualIdentityEditorViewController *)self _updateEditorsVisibility];
}

- (void)_segmentedControlDidChange:(id)a3
{
  NSInteger v4 = [(UISegmentedControl *)self->_segmentedControl selectedSegmentIndex];
  BOOL v5 = &OBJC_IVAR___CNCombinedVisualIdentityEditorViewController__emojiEditor;
  if (!v4) {
    BOOL v5 = &OBJC_IVAR___CNCombinedVisualIdentityEditorViewController__textEditor;
  }
  objc_storeStrong((id *)&self->_selectedEditor, *(id *)((char *)&self->super.super.super.isa + *v5));
  [(CNCombinedVisualIdentityEditorViewController *)self _updateEditorsVisibility];
  BOOL v6 = [(CNCombinedVisualIdentityEditorViewController *)self selectedEditor];
  [v6 beginEditingAvatar];

  [(CNCombinedVisualIdentityEditorViewController *)self updateDoneButtonEnabledState];
}

- (void)setupSegmentedControl
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4FB1C10]);
  NSInteger v4 = CNContactsUIBundle();
  BOOL v5 = [v4 localizedStringForKey:@"PHOTO_TEXT_STYLE_EDITOR_TEXT_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  v28[0] = v5;
  BOOL v6 = CNContactsUIBundle();
  v7 = [v6 localizedStringForKey:@"PHOTO_TEXT_STYLE_EDITOR_EMOJI_LABEL" value:&stru_1ED8AC728 table:@"Localized"];
  v28[1] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v9 = (UISegmentedControl *)[v3 initWithItems:v8];
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v9;

  v11 = [(CNCombinedVisualIdentityEditorViewController *)self selectedEditor];
  [(UISegmentedControl *)self->_segmentedControl setSelectedSegmentIndex:v11 != self->_textEditor];

  [(UISegmentedControl *)self->_segmentedControl addTarget:self action:sel__segmentedControlDidChange_ forControlEvents:4096];
  [(UISegmentedControl *)self->_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [(CNCombinedVisualIdentityEditorViewController *)self view];
  [v12 addSubview:self->_segmentedControl];

  v13 = [(CNCombinedVisualIdentityEditorViewController *)self view];
  v25 = [(UISegmentedControl *)self->_segmentedControl topAnchor];
  v26 = [(CNCombinedVisualIdentityEditorViewController *)self view];
  v24 = [v26 topAnchor];
  v23 = [v25 constraintEqualToAnchor:v24 constant:86.0];
  v27[0] = v23;
  v14 = [(UISegmentedControl *)self->_segmentedControl leadingAnchor];
  v15 = [(CNCombinedVisualIdentityEditorViewController *)self view];
  v16 = [v15 leadingAnchor];
  v17 = [v14 constraintEqualToAnchor:v16 constant:16.0];
  v27[1] = v17;
  v18 = [(UISegmentedControl *)self->_segmentedControl trailingAnchor];
  v19 = [(CNCombinedVisualIdentityEditorViewController *)self view];
  v20 = [v19 trailingAnchor];
  v21 = [v18 constraintEqualToAnchor:v20 constant:-16.0];
  v27[2] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
  [v13 addConstraints:v22];
}

- (void)updateDoneButtonEnabledState
{
  id v3 = [(CNCombinedVisualIdentityEditorViewController *)self selectedEditor];
  id v10 = [v3 providerItem];

  if ([v10 conformsToProtocol:&unk_1ED9A0450])
  {
    NSInteger v4 = [v10 itemText];
  }
  else
  {
    NSInteger v4 = 0;
  }
  uint64_t v5 = *MEMORY[0x1E4F5A2A0];
  BOOL v6 = objc_msgSend(v4, "_cn_trimmedString");
  uint64_t v7 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  id v8 = [(CNCombinedVisualIdentityEditorViewController *)self navigationItem];
  v9 = [v8 rightBarButtonItem];
  [v9 setEnabled:v7];
}

- (void)setupBarButtonItems
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_didTapCancel];
  NSInteger v4 = [(CNCombinedVisualIdentityEditorViewController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];

  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_didTapDone];
  BOOL v6 = [(CNCombinedVisualIdentityEditorViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  uint64_t v7 = CNContactsUIBundle();
  id v8 = [v7 localizedStringForKey:@"EDIT_PHOTO" value:&stru_1ED8AC728 table:@"Localized"];
  uint64_t v9 = [(CNCombinedVisualIdentityEditorViewController *)self navigationItem];
  [(id)v9 setTitle:v8];

  id v10 = [(CNCombinedVisualIdentityEditorViewController *)self navigationItem];
  [v10 setStyle:0];

  v11 = [(CNCombinedVisualIdentityEditorViewController *)self navigationItem];
  [v11 _setBackgroundHidden:1];

  v12 = [(CNCombinedVisualIdentityEditorViewController *)self navigationController];
  v13 = [v12 navigationBar];
  LOBYTE(v9) = [v13 isTranslucent];

  if ((v9 & 1) == 0)
  {
    [(CNCombinedVisualIdentityEditorViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNCombinedVisualIdentityEditorViewController;
  [(CNCombinedVisualIdentityEditorViewController *)&v5 viewDidAppear:a3];
  NSInteger v4 = [(CNVisualIdentityAvatarStyleEditorViewController *)self->_selectedEditor editableAvatarViewController];
  [v4 beginEditing];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CNCombinedVisualIdentityEditorViewController;
  [(CNCombinedVisualIdentityEditorViewController *)&v5 viewDidLoad];
  [(CNCombinedVisualIdentityEditorViewController *)self setupBarButtonItems];
  [(CNCombinedVisualIdentityEditorViewController *)self setupSegmentedControl];
  [(CNCombinedVisualIdentityEditorViewController *)self setupEditors];
  id v3 = +[CNUIColorRepository visualIdentityEditorBackgroundColor];
  NSInteger v4 = [(CNCombinedVisualIdentityEditorViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(CNCombinedVisualIdentityEditorViewController *)self updateDoneButtonEnabledState];
}

- (id)_newStyleEditorWithItem:(id)a3
{
  id v4 = a3;
  objc_super v5 = [CNVisualIdentityAvatarStyleEditorViewController alloc];
  BOOL v6 = [(CNPhotoPickerDataSource *)self->_dataSource variantsManager];
  uint64_t v7 = [(CNVisualIdentityAvatarStyleEditorViewController *)v5 initWithProviderItem:v4 variantsManager:v6];

  [(CNVisualIdentityAvatarStyleEditorViewController *)v7 setDelegate:self];
  return v7;
}

- (CNCombinedVisualIdentityEditorViewController)initWithProviderItem:(id)a3 dataSource:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CNCombinedVisualIdentityEditorViewController;
  id v8 = [(CNCombinedVisualIdentityEditorViewController *)&v23 initWithNibName:0 bundle:0];
  uint64_t v9 = v8;
  if (!v8) {
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v8->_dataSource, a4);
  id v10 = [(CNCombinedVisualIdentityEditorViewController *)v9 _newStyleEditorWithItem:v6];
  if ([v6 imageType] == 4)
  {
    uint64_t v11 = 1008;
  }
  else
  {
    if ([v6 imageType] != 2)
    {
      p_super = [(id)objc_opt_class() log];
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v6;
        _os_log_error_impl(&dword_18B625000, p_super, OS_LOG_TYPE_ERROR, "Unsupported provider item type: %@", buf, 0xCu);
      }
      goto LABEL_9;
    }
    uint64_t v11 = 1000;
  }
  v12 = (id *)((char *)&v9->super.super.super.isa + v11);
  objc_storeStrong((id *)((char *)&v9->super.super.super.isa + v11), v10);
  v13 = (CNVisualIdentityAvatarStyleEditorViewController *)*v12;
  p_super = &v9->_selectedEditor->super.super.super;
  v9->_selectedEditor = v13;
LABEL_9:

  if (!v9->_emojiEditor)
  {
    +[CNVisualIdentityPickerViewController defaultItemSize];
    v15 = +[CNPhotoPickerEmojiProviderItem addNewEmojiProviderItemWithSize:](CNPhotoPickerEmojiProviderItem, "addNewEmojiProviderItemWithSize:");
    uint64_t v16 = [(CNCombinedVisualIdentityEditorViewController *)v9 _newStyleEditorWithItem:v15];
    emojiEditor = v9->_emojiEditor;
    v9->_emojiEditor = (CNVisualIdentityAvatarStyleEditorViewController *)v16;
  }
  if (!v9->_textEditor)
  {
    v18 = [(CNCombinedVisualIdentityEditorViewController *)v9 dataSource];
    +[CNVisualIdentityPickerViewController defaultItemSize];
    v19 = objc_msgSend(v18, "monogramProviderMonogramItemWithSize:");

    uint64_t v20 = [(CNCombinedVisualIdentityEditorViewController *)v9 _newStyleEditorWithItem:v19];
    textEditor = v9->_textEditor;
    v9->_textEditor = (CNVisualIdentityAvatarStyleEditorViewController *)v20;
  }
LABEL_14:

  return v9;
}

+ (id)log
{
  if (log_cn_once_token_2_50459 != -1) {
    dispatch_once(&log_cn_once_token_2_50459, &__block_literal_global_50460);
  }
  v2 = (void *)log_cn_once_object_2_50461;

  return v2;
}

void __51__CNCombinedVisualIdentityEditorViewController_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "CNVisualIdentityAvatarStyleEditorViewController");
  v1 = (void *)log_cn_once_object_2_50461;
  log_cn_once_object_2_50461 = (uint64_t)v0;
}

@end