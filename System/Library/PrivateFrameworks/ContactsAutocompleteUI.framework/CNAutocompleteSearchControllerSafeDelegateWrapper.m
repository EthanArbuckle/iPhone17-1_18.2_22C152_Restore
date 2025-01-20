@interface CNAutocompleteSearchControllerSafeDelegateWrapper
+ (id)log;
- (BOOL)searchController:(id)a3 imageDataForRecipient:(id)a4 imageUpdateBlock:(id)a5;
- (BOOL)searchController:(id)a3 supplementalGroupsForSearchQuery:(id)a4 completionHandler:(id)a5;
- (CNAutocompleteSearchControllerInternalDelegate)delegate;
- (CNAutocompleteSearchControllerSafeDelegateWrapper)initWithDelegate:(id)a3;
- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4;
- (id)searchController:(id)a3 contextMenuConfigurationForRecipient:(id)a4;
- (id)searchController:(id)a3 preferredRecipientForRecipient:(id)a4;
- (id)searchController:(id)a3 tintColorForRecipient:(id)a4;
- (unint64_t)searchController:(id)a3 presentationOptionsForRecipient:(id)a4;
- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3;
- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4;
- (void)searchController:(id)a3 didAddRecipient:(id)a4;
- (void)searchController:(id)a3 didAddRecipientByResultsController:(id)a4;
- (void)searchController:(id)a3 didAddRecipientBySuggestionsController:(id)a4;
- (void)searchController:(id)a3 didEndDisplayingRowForRecipient:(id)a4;
- (void)searchController:(id)a3 didHideResultsView:(id)a4;
- (void)searchController:(id)a3 didRemoveRecipient:(id)a4;
- (void)searchController:(id)a3 didShowResultsView:(id)a4;
- (void)searchController:(id)a3 didTapTableAccessoryForRecipient:(id)a4;
- (void)searchController:(id)a3 textViewDidChangeSize:(CGSize)a4;
- (void)searchController:(id)a3 textViewTextDidChange:(id)a4;
- (void)searchController:(id)a3 textViewWillChangeSize:(CGSize)a4;
- (void)searchController:(id)a3 willDisplayRowForRecipient:(id)a4;
- (void)searchController:(id)a3 willHideResultsView:(id)a4;
- (void)searchController:(id)a3 willShowResultsView:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CNAutocompleteSearchControllerSafeDelegateWrapper

- (CNAutocompleteSearchControllerSafeDelegateWrapper)initWithDelegate:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)CNAutocompleteSearchControllerSafeDelegateWrapper;
  v5 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)&v54 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);

    v8 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v9 = 2;
    }
    else {
      int v9 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFFFD | v9);

    v10 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v11 = 128;
    }
    else {
      int v11 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFF7F | v11);

    v12 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v13 = 4;
    }
    else {
      int v13 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFFFB | v13);

    v14 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v15 = 8;
    }
    else {
      int v15 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFFF7 | v15);

    v16 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v17 = 16;
    }
    else {
      int v17 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFFEF | v17);

    v18 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v19 = 32;
    }
    else {
      int v19 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFFDF | v19);

    v20 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v21 = 64;
    }
    else {
      int v21 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFFBF | v21);

    v22 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v23 = 256;
    }
    else {
      int v23 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFEFF | v23);

    v24 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v25 = 512;
    }
    else {
      int v25 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFDFF | v25);

    v26 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v27 = 1024;
    }
    else {
      int v27 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFFBFF | v27);

    v28 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v29 = 2048;
    }
    else {
      int v29 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFF7FF | v29);

    v30 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v31 = 4096;
    }
    else {
      int v31 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFEFFF | v31);

    v32 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v33 = 0x2000;
    }
    else {
      int v33 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFDFFF | v33);

    v34 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v35 = 0x4000;
    }
    else {
      int v35 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFFBFFF | v35);

    v36 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v37 = 0x8000;
    }
    else {
      int v37 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFF7FFF | v37);

    v38 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v39 = 0x10000;
    }
    else {
      int v39 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFEFFFF | v39);

    v40 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v41 = 0x20000;
    }
    else {
      int v41 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFDFFFF | v41);

    v42 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v43 = 0x40000;
    }
    else {
      int v43 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFFBFFFF | v43);

    v44 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v45 = 0x80000;
    }
    else {
      int v45 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFF7FFFF | v45);

    v46 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v47 = 0x100000;
    }
    else {
      int v47 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFEFFFFF | v47);

    v48 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v49 = 0x200000;
    }
    else {
      int v49 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFDFFFFF | v49);

    v50 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)v6 delegate];
    if (objc_opt_respondsToSelector()) {
      int v51 = 0x400000;
    }
    else {
      int v51 = 0;
    }
    v6->_delegateFlags = ($15C177CB5BC07E11AE80B5DA72E5CCC4)(*(_DWORD *)&v6->_delegateFlags & 0xFFBFFFFF | v51);

    v52 = v6;
  }

  return v6;
}

+ (id)log
{
  if (log_cn_once_token_1 != -1) {
    dispatch_once(&log_cn_once_token_1, &__block_literal_global_13);
  }
  v2 = (void *)log_cn_once_object_1;

  return v2;
}

uint64_t __56__CNAutocompleteSearchControllerSafeDelegateWrapper_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.autocomplete.ui", "delegate wrapper");
  uint64_t v1 = log_cn_once_object_1;
  log_cn_once_object_1 = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)searchController:(id)a3 didAddRecipient:(id)a4
{
  if (*(unsigned char *)&self->_delegateFlags)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    [v8 searchController:v7 didAddRecipient:v6];
  }
}

- (void)searchController:(id)a3 didRemoveRecipient:(id)a4
{
  if ((*(unsigned char *)&self->_delegateFlags & 2) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    [v8 searchController:v7 didRemoveRecipient:v6];
  }
}

- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4
{
  if ((*(unsigned char *)&self->_delegateFlags & 4) != 0)
  {
    id v7 = a4;
    id v8 = a3;
    int v9 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    id v4 = [v9 searchController:v8 composeRecipientForAddress:v7];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)searchController:(id)a3 willShowResultsView:(id)a4
{
  if ((*(unsigned char *)&self->_delegateFlags & 8) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    [v8 searchController:v7 willShowResultsView:v6];
  }
}

- (void)searchController:(id)a3 didShowResultsView:(id)a4
{
  if ((*(unsigned char *)&self->_delegateFlags & 0x10) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    [v8 searchController:v7 didShowResultsView:v6];
  }
}

- (void)searchController:(id)a3 willHideResultsView:(id)a4
{
  if ((*(unsigned char *)&self->_delegateFlags & 0x20) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    [v8 searchController:v7 willHideResultsView:v6];
  }
}

- (void)searchController:(id)a3 didHideResultsView:(id)a4
{
  if ((*(unsigned char *)&self->_delegateFlags & 0x40) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    [v8 searchController:v7 didHideResultsView:v6];
  }
}

- (void)searchController:(id)a3 textViewTextDidChange:(id)a4
{
  if ((*(unsigned char *)&self->_delegateFlags & 0x80) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    [v8 searchController:v7 textViewTextDidChange:v6];
  }
}

- (unint64_t)searchController:(id)a3 presentationOptionsForRecipient:(id)a4
{
  if ((*((unsigned char *)&self->_delegateFlags + 1) & 1) == 0) {
    return 0;
  }
  id v7 = a4;
  id v8 = a3;
  int v9 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
  unint64_t v10 = [v9 searchController:v8 presentationOptionsForRecipient:v7];

  return v10;
}

- (id)searchController:(id)a3 preferredRecipientForRecipient:(id)a4
{
  if ((*((unsigned char *)&self->_delegateFlags + 1) & 2) != 0)
  {
    id v7 = a4;
    id v8 = a3;
    int v9 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    id v4 = [v9 searchController:v8 preferredRecipientForRecipient:v7];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)searchController:(id)a3 tintColorForRecipient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F428B8] systemBlueColor];
  if ((*((unsigned char *)&self->_delegateFlags + 1) & 4) != 0)
  {
    int v9 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    uint64_t v10 = [v9 searchController:v6 tintColorForRecipient:v7];

    id v8 = (void *)v10;
  }

  return v8;
}

- (void)searchController:(id)a3 textViewWillChangeSize:(CGSize)a4
{
  if ((*((unsigned char *)&self->_delegateFlags + 1) & 8) != 0)
  {
    double height = a4.height;
    double width = a4.width;
    id v7 = a3;
    id v8 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    objc_msgSend(v8, "searchController:textViewWillChangeSize:", v7, width, height);
  }
}

- (void)searchController:(id)a3 textViewDidChangeSize:(CGSize)a4
{
  if ((*((unsigned char *)&self->_delegateFlags + 1) & 0x10) != 0)
  {
    double height = a4.height;
    double width = a4.width;
    id v7 = a3;
    id v8 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    objc_msgSend(v8, "searchController:textViewDidChangeSize:", v7, width, height);
  }
}

- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3
{
  if ((*((unsigned char *)&self->_delegateFlags + 1) & 0x20) != 0)
  {
    id v4 = a3;
    id v5 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    [v5 didTapTextViewAccessoryButtonForSearchController:v4];
  }
}

- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4
{
  id v9 = a4;
  $15C177CB5BC07E11AE80B5DA72E5CCC4 delegateFlags = self->_delegateFlags;
  id v7 = a3;
  if ((*(_WORD *)&delegateFlags & 0x4000) != 0)
  {
    id v8 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    [v8 didTapTextViewAccessoryButtonForSearchController:v7 anchoredToView:v9];

    id v7 = v8;
  }
  else
  {
    [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self didTapTextViewAccessoryButtonForSearchController:v7];
  }
}

- (void)searchController:(id)a3 didTapTableAccessoryForRecipient:(id)a4
{
  if ((*((unsigned char *)&self->_delegateFlags + 1) & 0x80) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    [v8 searchController:v7 didTapTableAccessoryForRecipient:v6];
  }
}

- (id)searchController:(id)a3 contextMenuConfigurationForRecipient:(id)a4
{
  if (*((unsigned char *)&self->_delegateFlags + 2))
  {
    id v7 = a4;
    id v8 = a3;
    id v9 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    id v4 = [v9 searchController:v8 contextMenuConfigurationForRecipient:v7];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)searchController:(id)a3 supplementalGroupsForSearchQuery:(id)a4 completionHandler:(id)a5
{
  if ((*((unsigned char *)&self->_delegateFlags + 2) & 2) == 0) {
    return 0;
  }
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
  char v13 = [v12 searchController:v11 supplementalGroupsForSearchQuery:v10 completionHandler:v9];

  return v13;
}

- (BOOL)searchController:(id)a3 imageDataForRecipient:(id)a4 imageUpdateBlock:(id)a5
{
  if ((*((unsigned char *)&self->_delegateFlags + 2) & 4) == 0) {
    return 0;
  }
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
  char v13 = [v12 searchController:v11 imageDataForRecipient:v10 imageUpdateBlock:v9];

  return v13;
}

- (void)searchController:(id)a3 willDisplayRowForRecipient:(id)a4
{
  id v6 = a4;
  if ((*((unsigned char *)&self->_delegateFlags + 2) & 8) != 0)
  {
    id v7 = a3;
    id v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CNAutocompleteSearchControllerSafeDelegateWrapper searchController:willDisplayRowForRecipient:]((uint64_t)v6, v8);
    }

    id v9 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    [v9 searchController:v7 willDisplayRowForRecipient:v6];
  }
}

- (void)searchController:(id)a3 didEndDisplayingRowForRecipient:(id)a4
{
  id v6 = a4;
  if ((*((unsigned char *)&self->_delegateFlags + 2) & 0x10) != 0)
  {
    id v7 = a3;
    id v8 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[CNAutocompleteSearchControllerSafeDelegateWrapper searchController:didEndDisplayingRowForRecipient:]((uint64_t)v6, v8);
    }

    id v9 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    [v9 searchController:v7 didEndDisplayingRowForRecipient:v6];
  }
}

- (void)searchController:(id)a3 didAddRecipientByResultsController:(id)a4
{
  if ((*((unsigned char *)&self->_delegateFlags + 2) & 0x20) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    [v8 searchController:v7 didAddRecipientByResultsController:v6];
  }
}

- (void)searchController:(id)a3 didAddRecipientBySuggestionsController:(id)a4
{
  if ((*((unsigned char *)&self->_delegateFlags + 2) & 0x40) != 0)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(CNAutocompleteSearchControllerSafeDelegateWrapper *)self delegate];
    [v8 searchController:v7 didAddRecipientBySuggestionsController:v6];
  }
}

- (CNAutocompleteSearchControllerInternalDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAutocompleteSearchControllerInternalDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)searchController:(uint64_t)a1 willDisplayRowForRecipient:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B5AF5000, a2, OS_LOG_TYPE_DEBUG, "willDisplayRowForRecipient for %@", (uint8_t *)&v2, 0xCu);
}

- (void)searchController:(uint64_t)a1 didEndDisplayingRowForRecipient:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B5AF5000, a2, OS_LOG_TYPE_DEBUG, "didEndDisplayingRowForRecipient for %@", (uint8_t *)&v2, 0xCu);
}

@end