@interface CNContactSuggestionsViewController
+ (id)os_log;
- (BOOL)allowsMultiSelection;
- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4;
- (BOOL)useAccessibleLayout;
- (CGSize)avatarSize;
- (CNAvatarImageRenderer)avatarRenderer;
- (CNContactSuggestionsViewController)init;
- (CNContactSuggestionsViewControllerDelegate)delegate;
- (NSArray)contacts;
- (NSArray)ignoredContactIdentifiers;
- (NSArray)interactionDomains;
- (NSArray)overrideSuggestedContacts;
- (NSArray)selectedContacts;
- (NSDirectionalEdgeInsets)sectionInsets;
- (NSMutableArray)fetchedContacts;
- (NSMutableDictionary)identifiersToIndexPath;
- (NSString)suggestionsHeaderTitle;
- (UICollectionView)collectionView;
- (UICollectionViewDiffableDataSource)diffableDataSource;
- (UICollectionViewLayout)layout;
- (_PSContactSuggester)contactSuggester;
- (double)estimatedHeaderHeight;
- (double)estimatedHeight;
- (double)horizontalSectionPadding;
- (double)verticalSpacing;
- (id)compositionalLayout;
- (id)filterResults:(id)a3;
- (void)buildCollectionView;
- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)fetchContacts;
- (void)fetchContactsIfNeeded;
- (void)fetchIgnoredContactIdentifiersIfNeeded;
- (void)imageForContact:(id)a3 imageUpdateBlock:(id)a4;
- (void)prepareForReuse;
- (void)setAllowsMultiSelection:(BOOL)a3;
- (void)setAvatarRenderer:(id)a3;
- (void)setCellStateSelected:(BOOL)a3 forContact:(id)a4 animated:(BOOL)a5;
- (void)setCollectionView:(id)a3;
- (void)setContacts:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDiffableDataSource:(id)a3;
- (void)setFetchedContacts:(id)a3;
- (void)setIdentifiersToIndexPath:(id)a3;
- (void)setIgnoredContactIdentifiers:(id)a3;
- (void)setInteractionDomains:(id)a3;
- (void)setLayout:(id)a3;
- (void)setOverrideSuggestedContacts:(id)a3;
- (void)setSuggestionsHeaderTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CNContactSuggestionsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSuggester, 0);
  objc_storeStrong((id *)&self->_avatarRenderer, 0);
  objc_storeStrong((id *)&self->_identifiersToIndexPath, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_fetchedContacts, 0);
  objc_storeStrong((id *)&self->_ignoredContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_interactionDomains, 0);
  objc_storeStrong((id *)&self->_suggestionsHeaderTitle, 0);
  objc_storeStrong((id *)&self->_overrideSuggestedContacts, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (_PSContactSuggester)contactSuggester
{
  return (_PSContactSuggester *)objc_getProperty(self, a2, 1080, 1);
}

- (void)setAvatarRenderer:(id)a3
{
}

- (CNAvatarImageRenderer)avatarRenderer
{
  return self->_avatarRenderer;
}

- (void)setIdentifiersToIndexPath:(id)a3
{
}

- (NSMutableDictionary)identifiersToIndexPath
{
  return self->_identifiersToIndexPath;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setFetchedContacts:(id)a3
{
}

- (NSMutableArray)fetchedContacts
{
  return self->_fetchedContacts;
}

- (void)setIgnoredContactIdentifiers:(id)a3
{
}

- (NSArray)ignoredContactIdentifiers
{
  return self->_ignoredContactIdentifiers;
}

- (void)setLayout:(id)a3
{
}

- (UICollectionViewLayout)layout
{
  return self->_layout;
}

- (void)setDiffableDataSource:(id)a3
{
}

- (UICollectionViewDiffableDataSource)diffableDataSource
{
  return self->_diffableDataSource;
}

- (void)setInteractionDomains:(id)a3
{
}

- (NSArray)interactionDomains
{
  return self->_interactionDomains;
}

- (BOOL)allowsMultiSelection
{
  return self->_allowsMultiSelection;
}

- (void)setSuggestionsHeaderTitle:(id)a3
{
}

- (NSString)suggestionsHeaderTitle
{
  return self->_suggestionsHeaderTitle;
}

- (void)setOverrideSuggestedContacts:(id)a3
{
}

- (NSArray)overrideSuggestedContacts
{
  return self->_overrideSuggestedContacts;
}

- (void)setCollectionView:(id)a3
{
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setDelegate:(id)a3
{
}

- (CNContactSuggestionsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNContactSuggestionsViewControllerDelegate *)WeakRetained;
}

- (void)collectionView:(id)a3 didDeselectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  v6 = [(CNContactSuggestionsViewController *)self contacts];
  uint64_t v7 = [v5 item];

  id v9 = [v6 objectAtIndexedSubscript:v7];

  v8 = [(CNContactSuggestionsViewController *)self delegate];
  [v8 suggestionsController:self didDeselectContact:v9];
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(CNContactSuggestionsViewController *)self contacts];
  v8 = objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));

  id v9 = [(CNContactSuggestionsViewController *)self delegate];
  [v9 suggestionsController:self didSelectContact:v8];

  if (![(CNContactSuggestionsViewController *)self allowsMultiSelection]) {
    [v10 deselectItemAtIndexPath:v6 animated:1];
  }
}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(CNContactSuggestionsViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(CNContactSuggestionsViewController *)self contacts];
    id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v5, "item"));

    id v10 = [(CNContactSuggestionsViewController *)self delegate];
    char v11 = [v10 suggestionsController:self shouldSelectContact:v9 atIndexPath:v5];
  }
  else
  {
    char v11 = 1;
  }

  return v11;
}

- (void)setCellStateSelected:(BOOL)a3 forContact:(id)a4 animated:(BOOL)a5
{
  if (a4)
  {
    BOOL v5 = a5;
    BOOL v6 = a3;
    id v8 = a4;
    id v9 = [(CNContactSuggestionsViewController *)self identifiersToIndexPath];
    id v10 = [v8 identifier];

    id v13 = [v9 objectForKeyedSubscript:v10];

    if (v13)
    {
      char v11 = [(CNContactSuggestionsViewController *)self collectionView];
      v12 = v11;
      if (v6) {
        [v11 selectItemAtIndexPath:v13 animated:v5 scrollPosition:0];
      }
      else {
        [v11 deselectItemAtIndexPath:v13 animated:v5];
      }
    }
  }
}

- (NSArray)selectedContacts
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(CNContactSuggestionsViewController *)self collectionView];
  BOOL v5 = [v4 indexPathsForSelectedItems];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        char v11 = [(CNContactSuggestionsViewController *)self contacts];
        v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v10, "item"));
        [v3 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (void)imageForContact:(id)a3 imageUpdateBlock:(id)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CNContactSuggestionsViewController *)self avatarRenderer];

  if (!v8)
  {
    id v9 = [CNAvatarImageRenderer alloc];
    id v10 = +[CNAvatarImageRendererSettings defaultSettingsWithCacheSize:8];
    char v11 = [(CNAvatarImageRenderer *)v9 initWithSettings:v10];
    [(CNContactSuggestionsViewController *)self setAvatarRenderer:v11];
  }
  [(CNContactSuggestionsViewController *)self avatarSize];
  double v13 = v12;
  double v15 = v14;
  long long v16 = [(CNContactSuggestionsViewController *)self traitCollection];
  BOOL v17 = [v16 layoutDirection] == 1;

  v18 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v18 scale];
  v20 = +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v17, 0, v13, v15, v19);

  v21 = [(CNContactSuggestionsViewController *)self avatarRenderer];
  v27[0] = v6;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__CNContactSuggestionsViewController_imageForContact_imageUpdateBlock___block_invoke;
  v25[3] = &unk_1E5499AB0;
  id v26 = v7;
  id v23 = v7;
  id v24 = (id)[v21 renderAvatarsForContacts:v22 scope:v20 imageHandler:v25];
}

void __71__CNContactSuggestionsViewController_imageForContact_imageUpdateBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F5A4E8] mainThreadScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__CNContactSuggestionsViewController_imageForContact_imageUpdateBlock___block_invoke_2;
  v7[3] = &unk_1E549B710;
  id v5 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  [v4 performBlock:v7];
}

uint64_t __71__CNContactSuggestionsViewController_imageForContact_imageUpdateBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (double)horizontalSectionPadding
{
  [(CNContactSuggestionsViewController *)self sectionInsets];
  return v2 + v3;
}

- (NSDirectionalEdgeInsets)sectionInsets
{
  double v2 = 10.0;
  double v3 = 10.0;
  double v4 = 10.0;
  double v5 = 20.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (double)verticalSpacing
{
  if ([(CNContactSuggestionsViewController *)self useAccessibleLayout]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 4.0;
  }
  double v4 = [(CNContactSuggestionsViewController *)self contacts];
  double v5 = ceil((double)(unint64_t)[v4 count] / v3);

  [(CNContactSuggestionsViewController *)self sectionInsets];
  double v7 = v6;
  double v9 = v8;
  if (v5 <= 1.0) {
    double v10 = 0.0;
  }
  else {
    double v10 = (v5 + -1.0) * 20.0;
  }
  if ([(CNContactSuggestionsViewController *)self useAccessibleLayout]) {
    double v11 = 0.0;
  }
  else {
    double v11 = v10;
  }
  return v9 + v7 + v11;
}

- (double)estimatedHeaderHeight
{
  double v2 = +[CNUIFontRepository contactSuggestionsHeaderTitleFont];
  [v2 lineHeight];
  double v4 = ceil(v3);

  return v4 + 15.0 + 5.0;
}

- (CGSize)avatarSize
{
  double v3 = +[CNUIFontRepository contactSuggestionsNameFont];
  [v3 lineHeight];
  double v5 = ceil(v4 + v4) + 3.0;

  if ([(CNContactSuggestionsViewController *)self useAccessibleLayout]) {
    double v6 = 1.0;
  }
  else {
    double v6 = 4.0;
  }
  double v7 = [(CNContactSuggestionsViewController *)self contacts];
  double v8 = ceil((double)(unint64_t)[v7 count] / v6);

  double v9 = v5 + 10.0;
  if ([(CNContactSuggestionsViewController *)self useAccessibleLayout]) {
    double v9 = 44.0;
  }
  double v10 = [(CNContactSuggestionsViewController *)self view];
  [v10 bounds];
  CGFloat v11 = CGRectGetHeight(v26) - v9 * v8;
  [(CNContactSuggestionsViewController *)self verticalSpacing];
  CGFloat v13 = v11 - v12;
  [(CNContactSuggestionsViewController *)self estimatedHeaderHeight];
  double v15 = (v13 - v14) / v8;

  double v16 = 0.0;
  if (v6 <= 1.0) {
    double v17 = 0.0;
  }
  else {
    double v17 = (v6 + -1.0) * 20.0;
  }
  if (![(CNContactSuggestionsViewController *)self useAccessibleLayout]) {
    double v16 = v17;
  }
  v18 = [(CNContactSuggestionsViewController *)self view];
  [v18 bounds];
  CGFloat v19 = CGRectGetWidth(v27) - v16;
  [(CNContactSuggestionsViewController *)self horizontalSectionPadding];
  double v21 = (v19 - v20) / v6;

  if (v21 >= v15) {
    double v21 = v15;
  }
  BOOL v22 = [(CNContactSuggestionsViewController *)self useAccessibleLayout];
  double v23 = 80.0;
  if (v22) {
    double v23 = 60.0;
  }
  if (v21 < v23) {
    double v23 = v21;
  }
  double v24 = v23;
  result.height = v24;
  result.width = v23;
  return result;
}

- (double)estimatedHeight
{
  uint64_t v3 = *MEMORY[0x1E4F5A258];
  double v4 = [(CNContactSuggestionsViewController *)self contacts];
  LOBYTE(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  double result = 0.0;
  if ((v3 & 1) == 0)
  {
    if ([(CNContactSuggestionsViewController *)self useAccessibleLayout]) {
      double v6 = 1.0;
    }
    else {
      double v6 = 4.0;
    }
    double v7 = [(CNContactSuggestionsViewController *)self contacts];
    double v8 = ceil((double)(unint64_t)[v7 count] / v6);

    double v9 = +[CNUIFontRepository contactSuggestionsNameFont];
    [v9 lineHeight];
    double v11 = ceil(v10 + v10) + 3.0;

    double v12 = fmax(v11, 104.0);
    if (v6 <= 1.0) {
      double v13 = 0.0;
    }
    else {
      double v13 = (v6 + -1.0) * 20.0;
    }
    double v14 = [(CNContactSuggestionsViewController *)self view];
    [v14 bounds];
    CGFloat v15 = CGRectGetWidth(v22) - v13;
    [(CNContactSuggestionsViewController *)self horizontalSectionPadding];
    double v17 = (v15 - v16) / v6;

    double v18 = v11 + fmin(v17, 80.0) + 10.0;
    if ([(CNContactSuggestionsViewController *)self useAccessibleLayout]) {
      double v18 = v12;
    }
    [(CNContactSuggestionsViewController *)self verticalSpacing];
    double v20 = v19 + v18 * v8;
    [(CNContactSuggestionsViewController *)self estimatedHeaderHeight];
    return v21 + v20;
  }
  return result;
}

- (void)setContacts:(id)a3
{
  v19[1] = *MEMORY[0x1E4F143B8];
  double v5 = (NSArray *)a3;
  if (self->_contacts != v5)
  {
    objc_storeStrong((id *)&self->_contacts, a3);
    double v6 = [(CNContactSuggestionsViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      double v8 = [(CNContactSuggestionsViewController *)self delegate];
      [(CNContactSuggestionsViewController *)self estimatedHeight];
      objc_msgSend(v8, "suggestionsController:didChangeToHeight:", self);
    }
    double v9 = [(CNContactSuggestionsViewController *)self identifiersToIndexPath];
    [v9 removeAllObjects];

    if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0 && [(NSArray *)v5 count])
    {
      unint64_t v10 = 0;
      do
      {
        double v11 = [(NSArray *)v5 objectAtIndexedSubscript:v10];
        double v12 = [MEMORY[0x1E4F28D58] indexPathForRow:v10 inSection:0];
        double v13 = [(CNContactSuggestionsViewController *)self identifiersToIndexPath];
        double v14 = [v11 identifier];
        [v13 setObject:v12 forKeyedSubscript:v14];

        ++v10;
      }
      while (v10 < [(NSArray *)v5 count]);
    }
    id v15 = objc_alloc_init(MEMORY[0x1E4FB1360]);
    if ([(NSArray *)v5 count])
    {
      v19[0] = @"Main";
      double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      [v15 appendSectionsWithIdentifiers:v16];

      double v17 = [(CNContactSuggestionsViewController *)self contacts];
      [v15 appendItemsWithIdentifiers:v17];
    }
    double v18 = [(CNContactSuggestionsViewController *)self diffableDataSource];
    [v18 applySnapshot:v15 animatingDifferences:1 completion:0];
  }
}

- (id)filterResults:(id)a3
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __52__CNContactSuggestionsViewController_filterResults___block_invoke;
  v13[3] = &unk_1E549C040;
  v13[4] = self;
  double v4 = objc_msgSend(a3, "_cn_filter:", v13);
  [(CNContactSuggestionsViewController *)self fetchIgnoredContactIdentifiersIfNeeded];
  uint64_t v5 = [(CNContactSuggestionsViewController *)self ignoredContactIdentifiers];
  if (v5)
  {
    double v6 = (void *)v5;
    char v7 = [(CNContactSuggestionsViewController *)self ignoredContactIdentifiers];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __52__CNContactSuggestionsViewController_filterResults___block_invoke_2;
      v12[3] = &unk_1E549C040;
      v12[4] = self;
      uint64_t v9 = objc_msgSend(v4, "_cn_filter:", v12);

      double v4 = (void *)v9;
    }
  }
  unint64_t v10 = objc_msgSend(v4, "_cn_take:", 8);

  return v10;
}

uint64_t __52__CNContactSuggestionsViewController_filterResults___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [*(id *)(a1 + 32) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [*(id *)(a1 + 32) delegate];
    uint64_t v7 = [v6 suggestionsController:*(void *)(a1 + 32) canSelectContact:v3];
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

uint64_t __52__CNContactSuggestionsViewController_filterResults___block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  double v4 = [v2 ignoredContactIdentifiers];
  char v5 = [v3 identifier];

  uint64_t v6 = [v4 containsObject:v5] ^ 1;
  return v6;
}

- (void)fetchIgnoredContactIdentifiersIfNeeded
{
  uint64_t v3 = [(CNContactSuggestionsViewController *)self ignoredContactIdentifiers];
  if (!v3
    || (double v4 = (void *)v3,
        [(CNContactSuggestionsViewController *)self ignoredContactIdentifiers],
        char v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v4,
        !v6))
  {
    uint64_t v7 = [(CNContactSuggestionsViewController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v10 = [(CNContactSuggestionsViewController *)self delegate];
      uint64_t v9 = [v10 ignoredContactIdentifiersForSuggestionsController:self];
      [(CNContactSuggestionsViewController *)self setIgnoredContactIdentifiers:v9];
    }
  }
}

- (void)fetchContacts
{
  uint64_t v3 = [(CNContactSuggestionsViewController *)self overrideSuggestedContacts];

  if (v3)
  {
    id v15 = [(CNContactSuggestionsViewController *)self overrideSuggestedContacts];
    double v4 = [(CNContactSuggestionsViewController *)self filterResults:v15];
    [(CNContactSuggestionsViewController *)self setContacts:v4];
  }
  else
  {
    [(CNContactSuggestionsViewController *)self fetchIgnoredContactIdentifiersIfNeeded];
    char v5 = [(CNContactSuggestionsViewController *)self ignoredContactIdentifiers];
    if (v5)
    {
      uint64_t v6 = [(CNContactSuggestionsViewController *)self ignoredContactIdentifiers];
      uint64_t v7 = [v6 count];
    }
    else
    {
      uint64_t v7 = 0;
    }

    char v8 = self->_contactSuggester;
    uint64_t v21 = 0;
    CGRect v22 = &v21;
    uint64_t v23 = 0x3032000000;
    double v24 = __Block_byref_object_copy__28994;
    v25 = __Block_byref_object_dispose__28995;
    id v26 = 0;
    uint64_t v9 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    id v10 = [v9 schedulerProvider];
    double v11 = [v10 immediateScheduler];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __51__CNContactSuggestionsViewController_fetchContacts__block_invoke;
    v16[3] = &unk_1E549ABE0;
    double v19 = &v21;
    double v12 = v8;
    uint64_t v20 = v7;
    double v17 = v12;
    double v18 = self;
    [v11 performBlock:v16 qualityOfService:4];

    if (v22[5]) {
      uint64_t v13 = v22[5];
    }
    else {
      uint64_t v13 = MEMORY[0x1E4F1CBF0];
    }
    double v14 = [(CNContactSuggestionsViewController *)self filterResults:v13];
    [(CNContactSuggestionsViewController *)self setContacts:v14];

    _Block_object_dispose(&v21, 8);
  }
}

void __51__CNContactSuggestionsViewController_fetchContacts__block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56) + 20;
  double v4 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v10[0] = v4;
  char v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v6 = [*(id *)(a1 + 40) interactionDomains];
  uint64_t v7 = [v2 contactSuggestionsWithMaxSuggestions:v3 contactKeysTofetch:v5 interactionDomains:v6 appleUsersOnly:0];
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (void)fetchContactsIfNeeded
{
  uint64_t v3 = [(CNContactSuggestionsViewController *)self contacts];

  if (!v3)
  {
    [(CNContactSuggestionsViewController *)self fetchContacts];
  }
}

- (void)setAllowsMultiSelection:(BOOL)a3
{
  if (self->_allowsMultiSelection != a3)
  {
    BOOL v3 = a3;
    self->_allowsMultiSelection = a3;
    char v5 = [(CNContactSuggestionsViewController *)self collectionView];

    if (v5)
    {
      id v6 = [(CNContactSuggestionsViewController *)self collectionView];
      [v6 setAllowsMultipleSelection:v3];
    }
  }
}

- (void)buildCollectionView
{
  BOOL v3 = [(CNContactSuggestionsViewController *)self compositionalLayout];
  [(CNContactSuggestionsViewController *)self setLayout:v3];

  id v4 = objc_alloc(MEMORY[0x1E4FB1568]);
  char v5 = [(CNContactSuggestionsViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(CNContactSuggestionsViewController *)self layout];
  id v15 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v14, v7, v9, v11, v13);

  [v15 setDelegate:self];
  objc_initWeak(&location, self);
  id v16 = objc_alloc(MEMORY[0x1E4FB1598]);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__CNContactSuggestionsViewController_buildCollectionView__block_invoke;
  v25[3] = &unk_1E5498B48;
  objc_copyWeak(&v26, &location);
  double v17 = (void *)[v16 initWithCollectionView:v15 cellProvider:v25];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __57__CNContactSuggestionsViewController_buildCollectionView__block_invoke_3;
  v24[3] = &unk_1E5498B70;
  v24[4] = self;
  [v17 setSupplementaryViewProvider:v24];
  [(CNContactSuggestionsViewController *)self setDiffableDataSource:v17];
  [v15 setDataSource:v17];
  [v15 setClipsToBounds:0];
  uint64_t v18 = objc_opt_class();
  double v19 = +[CNContactSuggestionsCollectionViewCell cellIdentifier];
  [v15 registerClass:v18 forCellWithReuseIdentifier:v19];

  uint64_t v20 = objc_opt_class();
  uint64_t v21 = +[CNContactSuggestionsViewSectionHeader reuseIdentifier];
  [v15 registerClass:v20 forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:v21];

  CGRect v22 = +[CNUIColorRepository contactSuggestionsBackgroundColor];
  [v15 setBackgroundColor:v22];

  [v15 setScrollEnabled:0];
  objc_msgSend(v15, "setAllowsMultipleSelection:", -[CNContactSuggestionsViewController allowsMultiSelection](self, "allowsMultiSelection"));
  uint64_t v23 = [(CNContactSuggestionsViewController *)self view];
  [v23 addSubview:v15];

  [v15 setAutoresizingMask:18];
  [(CNContactSuggestionsViewController *)self setCollectionView:v15];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

id __57__CNContactSuggestionsViewController_buildCollectionView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  double v8 = +[CNContactSuggestionsCollectionViewCell cellIdentifier];
  double v9 = [v6 dequeueReusableCellWithReuseIdentifier:v8 forIndexPath:v5];

  double v10 = [WeakRetained contacts];
  uint64_t v11 = [v5 item];

  double v12 = [v10 objectAtIndexedSubscript:v11];

  double v13 = [MEMORY[0x1E4F1B910] stringFromContact:v12 style:0];
  [v9 setDisplayString:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57__CNContactSuggestionsViewController_buildCollectionView__block_invoke_2;
  v16[3] = &unk_1E5498B20;
  id v14 = v9;
  id v17 = v14;
  [WeakRetained imageForContact:v12 imageUpdateBlock:v16];

  return v14;
}

id __57__CNContactSuggestionsViewController_buildCollectionView__block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ((id)*MEMORY[0x1E4FB2770] == v8)
  {
    uint64_t v11 = +[CNContactSuggestionsViewSectionHeader reuseIdentifier];
    id v10 = [v7 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:v11 forIndexPath:v9];

    double v12 = [*(id *)(a1 + 32) suggestionsHeaderTitle];
    double v13 = [v10 titleLabel];
    [v13 setText:v12];
  }
  else
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1560]);
  }

  return v10;
}

uint64_t __57__CNContactSuggestionsViewController_buildCollectionView__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setImage:a2];
}

- (id)compositionalLayout
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if ([(CNContactSuggestionsViewController *)self useAccessibleLayout]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.25;
  }
  if ([(CNContactSuggestionsViewController *)self useAccessibleLayout]) {
    double v4 = 96.0;
  }
  else {
    double v4 = 140.0;
  }
  id v5 = (void *)MEMORY[0x1E4FB1338];
  id v6 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:v3];
  id v7 = [MEMORY[0x1E4FB1308] estimatedDimension:v4];
  id v8 = [v5 sizeWithWidthDimension:v6 heightDimension:v7];

  id v9 = (void *)MEMORY[0x1E4FB1338];
  id v10 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  uint64_t v11 = [MEMORY[0x1E4FB1308] estimatedDimension:v4];
  double v12 = [v9 sizeWithWidthDimension:v10 heightDimension:v11];

  double v13 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v8];
  objc_msgSend(v13, "setContentInsets:", 10.0, 5.0, 10.0, 5.0);
  id v14 = (void *)MEMORY[0x1E4FB1318];
  v27[0] = v13;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  id v16 = [v14 horizontalGroupWithLayoutSize:v12 subitems:v15];

  id v17 = [MEMORY[0x1E4FB1330] sectionWithGroup:v16];
  [(CNContactSuggestionsViewController *)self sectionInsets];
  objc_msgSend(v17, "setContentInsets:");
  uint64_t v18 = (void *)MEMORY[0x1E4FB1338];
  double v19 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  uint64_t v20 = [MEMORY[0x1E4FB1308] estimatedDimension:44.0];
  uint64_t v21 = [v18 sizeWithWidthDimension:v19 heightDimension:v20];

  CGRect v22 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v21 elementKind:*MEMORY[0x1E4FB2770] alignment:1];
  objc_msgSend(v22, "setContentInsets:", 0.0, 3.0, 0.0, 3.0);
  id v26 = v22;
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  [v17 setBoundarySupplementaryItems:v23];

  double v24 = (void *)[objc_alloc(MEMORY[0x1E4FB1580]) initWithSection:v17];

  return v24;
}

- (void)prepareForReuse
{
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CNContactSuggestionsViewController;
  id v7 = a4;
  -[CNContactSuggestionsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__CNContactSuggestionsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5498AF8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __89__CNContactSuggestionsViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    double v4 = [*(id *)(a1 + 32) delegate];
    id v5 = *(void **)(a1 + 32);
    id v6 = [v5 view];
    [v6 bounds];
    [v4 suggestionsController:v5 didChangeToHeight:CGRectGetHeight(v9)];
  }
  id v7 = [*(id *)(a1 + 32) collectionView];
  [v7 reloadData];
}

- (void)traitCollectionDidChange:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CNContactSuggestionsViewController;
  id v4 = a3;
  [(CNContactSuggestionsViewController *)&v16 traitCollectionDidChange:v4];
  id v5 = [(CNContactSuggestionsViewController *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  id v7 = [v4 preferredContentSizeCategory];

  if (v6 != v7)
  {
    id v8 = [(CNContactSuggestionsViewController *)self delegate];
    char v9 = objc_opt_respondsToSelector();

    if (v9)
    {
      id v10 = [(CNContactSuggestionsViewController *)self delegate];
      [(CNContactSuggestionsViewController *)self estimatedHeight];
      objc_msgSend(v10, "suggestionsController:didChangeToHeight:", self);
    }
    uint64_t v11 = [(CNContactSuggestionsViewController *)self compositionalLayout];
    [(CNContactSuggestionsViewController *)self setLayout:v11];

    double v12 = [(CNContactSuggestionsViewController *)self collectionView];
    double v13 = [(CNContactSuggestionsViewController *)self layout];
    [v12 setCollectionViewLayout:v13 animated:1];

    id v14 = [(CNContactSuggestionsViewController *)self collectionView];
    objc_msgSend(v14, "setContentOffset:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

    id v15 = [(CNContactSuggestionsViewController *)self collectionView];
    [v15 reloadData];
  }
}

- (BOOL)useAccessibleLayout
{
  v9[5] = *MEMORY[0x1E4F143B8];
  double v2 = [(CNContactSuggestionsViewController *)self traitCollection];
  uint64_t v3 = *MEMORY[0x1E4FB2790];
  v9[0] = *MEMORY[0x1E4FB2798];
  v9[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4FB2780];
  v9[2] = *MEMORY[0x1E4FB2788];
  v9[3] = v4;
  v9[4] = *MEMORY[0x1E4FB2778];
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];
  id v6 = [v2 preferredContentSizeCategory];
  char v7 = [v5 containsObject:v6];

  return v7;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)CNContactSuggestionsViewController;
  [(CNContactSuggestionsViewController *)&v8 viewDidLoad];
  uint64_t v3 = +[CNUIColorRepository contactSuggestionsBackgroundColor];
  uint64_t v4 = [(CNContactSuggestionsViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [(CNContactSuggestionsViewController *)self view];
  [v5 setInsetsLayoutMarginsFromSafeArea:0];

  id v6 = [(CNContactSuggestionsViewController *)self view];
  [v6 setClipsToBounds:1];

  char v7 = [(CNContactSuggestionsViewController *)self view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(CNContactSuggestionsViewController *)self buildCollectionView];
  [(CNContactSuggestionsViewController *)self fetchContactsIfNeeded];
}

- (CNContactSuggestionsViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)CNContactSuggestionsViewController;
  double v2 = [(CNContactSuggestionsViewController *)&v9 init];
  if (v2)
  {
    uint64_t v3 = (_PSContactSuggester *)objc_alloc_init(get_PSContactSuggesterClass());
    contactSuggester = v2->_contactSuggester;
    v2->_contactSuggester = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    identifiersToIndexPath = v2->_identifiersToIndexPath;
    v2->_identifiersToIndexPath = v5;

    char v7 = v2;
  }

  return v2;
}

+ (id)os_log
{
  if (os_log_cn_once_token_2 != -1) {
    dispatch_once(&os_log_cn_once_token_2, &__block_literal_global_29025);
  }
  double v2 = (void *)os_log_cn_once_object_2;

  return v2;
}

void __44__CNContactSuggestionsViewController_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contactsui", "SuggestionsViewController");
  v1 = (void *)os_log_cn_once_object_2;
  os_log_cn_once_object_2 = (uint64_t)v0;
}

@end