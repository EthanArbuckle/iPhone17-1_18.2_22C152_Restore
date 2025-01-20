@interface EKCalendarItemLocationInlineEditItem
- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4;
- (BOOL)editItemViewControllerSave:(id)a3;
- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4;
- (BOOL)isInline;
- (BOOL)isSaveable;
- (BOOL)isSubitemAtIndexSaveable:(unint64_t)a3;
- (BOOL)saveAndDismissWithForce:(BOOL)a3;
- (BOOL)textFieldShouldClear:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3;
- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4;
- (EKCalendarItemLocationInlineEditItem)init;
- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4;
- (id)cellForSubitemAtIndex:(unint64_t)a3;
- (id)cellForSubitemAtIndex:(unint64_t)a3 inEditor:(id)a4;
- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4;
- (id)searchStringForEventAutocomplete;
- (unint64_t)_supportedSearchTypesForSubitemAtIndex:(unint64_t)a3;
- (unint64_t)numberOfSubitems;
- (unint64_t)onSaveEditItemsToRefresh;
- (unint64_t)onSaveEditorReloadBehavior;
- (void)_clearButtonTapped:(id)a3;
- (void)_clearLocationAtIndex:(unint64_t)a3;
- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4;
- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6;
- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5;
- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4;
- (void)_setEditor:(id)a3 andUpdateScribbleInteractionOnCell:(id)a4 addScribbleInteraction:(BOOL)a5;
- (void)_updateClearButtonAndMakeVisible:(id)a3 index:(unint64_t)a4;
- (void)_updateMapLocationCell:(id)a3 index:(unint64_t)a4 location:(id)a5;
- (void)_updateVirtualConferenceCell:(id)a3 index:(unint64_t)a4 virtualConference:(id)a5;
- (void)dealloc;
- (void)didTapAddSuggestedLocationCell:(id)a3 disambiguatedLocation:(id)a4;
- (void)didTapDismissSuggestedLocationCell:(id)a3;
- (void)editItemPendingVideoConferenceCompleted:(id)a3;
- (void)refreshFromCalendarItemAndStore;
- (void)reset;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation EKCalendarItemLocationInlineEditItem

- (EKCalendarItemLocationInlineEditItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)EKCalendarItemLocationInlineEditItem;
  v2 = [(EKCalendarItemLocationInlineEditItem *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(EKUILocationEditItemModel);
    viewModel = v2->_viewModel;
    v2->_viewModel = v3;
  }
  return v2;
}

- (void)dealloc
{
  [(EKUILocationEditItemModel *)self->_viewModel reset];
  v3.receiver = self;
  v3.super_class = (Class)EKCalendarItemLocationInlineEditItem;
  [(EKCalendarItemLocationInlineEditItem *)&v3 dealloc];
}

- (void)refreshFromCalendarItemAndStore
{
}

- (double)defaultCellHeightForSubitemAtIndex:(unint64_t)a3 forWidth:(double)a4
{
  if (EKUIUsesLargeTextLayout(0)) {
    return *MEMORY[0x1E4FB2F28];
  }
  v7 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
  unint64_t v8 = [v7 count];

  if (v8 > a3)
  {
    v9 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
    v10 = [v9 objectAtIndex:a3];

    v11 = [v10 cell];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v13 = [v10 cell];
      v14 = [v13 bannerView];
      [v14 intrinsicContentSize];
      double v6 = v15;

      return v6;
    }
  }
  v17 = objc_opt_class();

  [v17 scaledHeightOfSystemTableViewCell];
  return result;
}

- (BOOL)isInline
{
  return 1;
}

- (void)reset
{
}

- (unint64_t)numberOfSubitems
{
  BOOL v3 = [(EKUILocationEditItemModel *)self->_viewModel displaysPlaceholder];
  v4 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
  unint64_t v5 = [v4 count] + v3;

  return v5;
}

- (BOOL)isSaveable
{
  if ([(EKCalendarItemLocationInlineEditItem *)self numberOfSubitems])
  {
    unint64_t v3 = 0;
    do
      [(EKCalendarItemLocationInlineEditItem *)self isSubitemAtIndexSaveable:v3++];
    while (v3 < [(EKCalendarItemLocationInlineEditItem *)self numberOfSubitems]);
  }
  return 1;
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  return [(EKCalendarItemLocationInlineEditItem *)self cellForSubitemAtIndex:a3 inEditor:0];
}

- (id)cellForSubitemAtIndex:(unint64_t)a3 inEditor:(id)a4
{
  id v7 = a4;
  unint64_t v8 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
  unint64_t v9 = [v8 count];

  if (v9 <= a3)
  {
    p_super = [[EKUITableViewCell alloc] initWithStyle:0 reuseIdentifier:0];
    v19 = [(EKUILocationEditItemModel *)self->_viewModel placeholderCellText];
    v20 = [(EKUITableViewCell *)p_super textLabel];
    [v20 setText:v19];

    v21 = objc_opt_new();
    v22 = [v21 _placeholderColor];
    v23 = [(EKUITableViewCell *)p_super textLabel];
    [v23 setTextColor:v22];

    [(EKCalendarItemLocationInlineEditItem *)self _setEditor:v7 andUpdateScribbleInteractionOnCell:p_super addScribbleInteraction:1];
  }
  else
  {
    v10 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
    v11 = [v10 objectAtIndex:a3];

    switch([v11 locationType])
    {
      case 0:
        viewModel = self->_viewModel;
        v13 = [(EKEventEditItem *)self event];
        BOOL v14 = [(EKUILocationEditItemModel *)viewModel shouldDisplayRowModelWithConferenceCell:v11 event:v13];

        double v15 = [v11 cell];
        v16 = v15;
        if (v14)
        {

          if (v16)
          {
            v17 = [v11 cell];
          }
          else
          {
            v17 = [[EKUILocationEditItemCell alloc] initWithStyle:0 reuseIdentifier:0];
          }
          p_super = (EKUITableViewCell *)v17;
          v44 = self->_viewModel;
          v45 = [(EKEventEditItem *)self event];
          [(EKUILocationEditItemModel *)v44 refreshConferenceRoomCell:p_super event:v45];

          v43 = [(EKUITableViewCell *)p_super clearButton];
          [(EKCalendarItemLocationInlineEditItem *)self _updateClearButtonAndMakeVisible:v43 index:a3];
        }
        else
        {
          if (v15
            && ([v11 cell],
                v37 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                char isKindOfClass = objc_opt_isKindOfClass(),
                v37,
                v16,
                (isKindOfClass & 1) != 0))
          {
            v39 = [v11 cell];
          }
          else
          {
            v39 = [[EKUIClearButtonCell alloc] initWithStyle:3 reuseIdentifier:0];
          }
          p_super = &v39->super;
          v43 = [v11 location];
          [(EKCalendarItemLocationInlineEditItem *)self _updateMapLocationCell:p_super index:a3 location:v43];
        }
        goto LABEL_36;
      case 1:
        v24 = [v11 cell];

        if (v24)
        {
          v25 = [v11 cell];
          objc_opt_class();
          char v26 = objc_opt_isKindOfClass();

          if ((v26 & 1) == 0)
          {
            v47 = [MEMORY[0x1E4F28B00] currentHandler];
            [v47 handleFailureInMethod:a2 object:self file:@"EKCalendarItemLocationInlineEditItem.m" lineNumber:209 description:@"Map location model has wrong cell type"];
          }
          v27 = [v11 cell];
        }
        else
        {
          v27 = [[EKUIClearButtonCell alloc] initWithStyle:3 reuseIdentifier:0];
        }
        p_super = &v27->super;
        v40 = [v11 location];
        [(EKCalendarItemLocationInlineEditItem *)self _updateMapLocationCell:p_super index:a3 location:v40];

        [(EKCalendarItemLocationInlineEditItem *)self _setEditor:v7 andUpdateScribbleInteractionOnCell:p_super addScribbleInteraction:1];
        goto LABEL_37;
      case 2:
        v28 = [v11 conference];

        if (v28)
        {
          v29 = [v11 cell];

          if (v29)
          {
            v30 = [v11 cell];
            objc_opt_class();
            char v31 = objc_opt_isKindOfClass();

            if ((v31 & 1) == 0)
            {
              v49 = [MEMORY[0x1E4F28B00] currentHandler];
              [v49 handleFailureInMethod:a2 object:self file:@"EKCalendarItemLocationInlineEditItem.m" lineNumber:186 description:@"Virtual conference model has wrong cell type"];
            }
            v32 = [v11 cell];
          }
          else
          {
            v32 = [[EKUIClearButtonCell alloc] initWithStyle:3 reuseIdentifier:0];
          }
          p_super = &v32->super;
          v41 = [v11 conference];
          [(EKCalendarItemLocationInlineEditItem *)self _updateVirtualConferenceCell:p_super index:a3 virtualConference:v41];
        }
        else
        {
          p_super = [[EKUIPendingVideoConferenceCell alloc] initWithStyle:0 reuseIdentifier:0];
          v41 = [(EKUITableViewCell *)p_super clearButton];
          [(EKCalendarItemLocationInlineEditItem *)self _updateClearButtonAndMakeVisible:v41 index:a3];
        }

        v43 = [v11 conference];
        -[EKCalendarItemLocationInlineEditItem _setEditor:andUpdateScribbleInteractionOnCell:addScribbleInteraction:](self, "_setEditor:andUpdateScribbleInteractionOnCell:addScribbleInteraction:", v7, p_super, [v43 isWritable]);
LABEL_36:

        goto LABEL_37;
      case 3:
        v33 = [v11 cell];

        if (v33)
        {
          v34 = [v11 cell];
          objc_opt_class();
          char v35 = objc_opt_isKindOfClass();

          if ((v35 & 1) == 0)
          {
            v48 = [MEMORY[0x1E4F28B00] currentHandler];
            [v48 handleFailureInMethod:a2 object:self file:@"EKCalendarItemLocationInlineEditItem.m" lineNumber:167 description:@"Suggested location model has wrong cell type"];
          }
          v36 = [v11 cell];
        }
        else
        {
          v36 = [[EKEventDetailSuggestedLocationCell alloc] initWithInlineStyle:1];
        }
        p_super = (EKUITableViewCell *)v36;
        [(EKEventDetailSuggestedLocationCell *)v36 setDelegate:self];
        v42 = [(EKEventEditItem *)self event];
        [(EKUITableViewCell *)p_super setEvent:v42];

LABEL_37:
        [v11 setCell:p_super];
        break;
      default:
        p_super = 0;
        break;
    }
  }
  [(EKUITableViewCell *)p_super setTag:a3];

  return p_super;
}

- (void)_updateMapLocationCell:(id)a3 index:(unint64_t)a4 location:(id)a5
{
  id v22 = a5;
  id v8 = a3;
  unint64_t v9 = [v8 defaultContentConfiguration];
  if (![v22 isStructured])
  {
    v13 = [v22 title];
    BOOL v14 = _StringWithLineEndingsRemoved(v13);
    [v9 setText:v14];

    goto LABEL_8;
  }
  v10 = [v22 contactLabel];

  if (v10)
  {
    uint64_t v11 = [v22 contactLabel];
  }
  else
  {
    v12 = [v22 title];
    if (v12) {
      goto LABEL_7;
    }
    uint64_t v11 = [v22 address];
  }
  v12 = (void *)v11;
LABEL_7:
  [v9 setText:v12];

  double v15 = [v22 address];
  v16 = _StringWithLineEndingsRemoved(v15);

  v13 = [v16 _stringByReplacingCharactersInSet:CFCharacterSetGetPredefined(kCFCharacterSetNewline) withCharacter:32];

  [v9 setSecondaryText:v13];
LABEL_8:

  v17 = [MEMORY[0x1E4FB1618] labelColor];
  v18 = [v9 textProperties];
  [v18 setColor:v17];

  v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v20 = [v9 secondaryTextProperties];
  [v20 setColor:v19];

  [v8 setTitleSubtitleContentConfiguration:v9];
  v21 = [v8 clearButton];

  [(EKCalendarItemLocationInlineEditItem *)self _updateClearButtonAndMakeVisible:v21 index:a4];
}

- (void)_updateClearButtonAndMakeVisible:(id)a3 index:(unint64_t)a4
{
  id v6 = a3;
  [v6 setTag:a4];
  [v6 addTarget:self action:sel__clearButtonTapped_ forControlEvents:64];
  [v6 setHidden:0];
}

- (void)_updateVirtualConferenceCell:(id)a3 index:(unint64_t)a4 virtualConference:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (v9 && ![v9 isWritable])
  {
    uint64_t v11 = [v8 clearButton];
    [v11 setHidden:1];
  }
  else
  {
    uint64_t v11 = [v8 clearButton];
    [(EKCalendarItemLocationInlineEditItem *)self _updateClearButtonAndMakeVisible:v11 index:a4];
  }

  v12 = (void *)MEMORY[0x1E4F57B50];
  v13 = [v10 joinMethods];
  BOOL v14 = [v13 firstObject];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__EKCalendarItemLocationInlineEditItem__updateVirtualConferenceCell_index_virtualConference___block_invoke;
  v17[3] = &unk_1E608AEB8;
  id v18 = v8;
  id v19 = v10;
  v20 = self;
  id v15 = v10;
  id v16 = v8;
  [v12 displayDetailsForJoinMethod:v14 completionHandler:v17];
}

void __93__EKCalendarItemLocationInlineEditItem__updateVirtualConferenceCell_index_virtualConference___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __93__EKCalendarItemLocationInlineEditItem__updateVirtualConferenceCell_index_virtualConference___block_invoke_2;
  v8[3] = &unk_1E60890B0;
  id v9 = *(id *)(a1 + 32);
  id v10 = v4;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v11 = v5;
  uint64_t v12 = v6;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __93__EKCalendarItemLocationInlineEditItem__updateVirtualConferenceCell_index_virtualConference___block_invoke_2(uint64_t a1)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) defaultContentConfiguration];
  [v2 setText:*(void *)(a1 + 40)];
  unint64_t v3 = (void *)MEMORY[0x1E4FB0870];
  id v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"video"];
  id v5 = [v4 imageWithRenderingMode:2];
  uint64_t v6 = [v3 textAttachmentWithImage:v5];

  id v7 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v6];
  id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v7];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
  [v8 appendAttributedString:v9];

  id v10 = EventKitUIBundle();
  id v11 = [v10 localizedStringForKey:@"Video Call" value:&stru_1F0CC2140 table:0];

  uint64_t v12 = [MEMORY[0x1E4F57B50] subtitleForVirtualConference:*(void *)(a1 + 48) displayedWithTitle:*(void *)(a1 + 40)];
  v13 = (void *)v12;
  if (v12) {
    BOOL v14 = (void *)v12;
  }
  else {
    BOOL v14 = v11;
  }
  id v15 = v14;

  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v15];
  [v8 appendAttributedString:v16];

  uint64_t v19 = *MEMORY[0x1E4FB0700];
  v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v20[0] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
  objc_msgSend(v8, "addAttributes:range:", v18, 0, objc_msgSend(v8, "length"));

  [v2 setSecondaryAttributedText:v8];
  [*(id *)(a1 + 32) setTitleSubtitleContentConfiguration:v2];
  [*(id *)(a1 + 56) notifyRequiresHeightChange];
}

- (void)_setEditor:(id)a3 andUpdateScribbleInteractionOnCell:(id)a4 addScribbleInteraction:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (a3)
  {
    objc_storeWeak((id *)&self->_editor, a3);
    id v9 = [v8 interactions];
    id v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_60];
    id v11 = [v9 filteredArrayUsingPredicate:v10];

    if (v5)
    {
      if (![v11 count])
      {
        id v12 = objc_alloc_init((Class)getPKScribbleInteractionClass());
        [v12 setDelegate:self];
        [v12 setElementSource:self];
        [v8 addInteraction:v12];
      }
    }
    else
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v13 = v11;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v19;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            objc_msgSend(v8, "removeInteraction:", *(void *)(*((void *)&v18 + 1) + 8 * v17++), (void)v18);
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v15);
      }
    }
  }
}

uint64_t __109__EKCalendarItemLocationInlineEditItem__setEditor_andUpdateScribbleInteractionOnCell_addScribbleInteraction___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  getPKScribbleInteractionClass();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)editor:(id)a3 canSelectSubitem:(unint64_t)a4
{
  uint64_t v6 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
  unint64_t v7 = [v6 count];

  if (v7 <= a4) {
    return 1;
  }
  id v8 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
  id v9 = [v8 objectAtIndex:a4];

  BOOL v10 = [v9 locationType] != 0;
  return v10;
}

- (BOOL)usesDetailViewControllerForSubitem:(unint64_t)a3
{
  return 1;
}

- (id)detailViewControllerWithFrame:(CGRect)a3 forSubitemAtIndex:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v32[1] = *MEMORY[0x1E4F143B8];
  unint64_t v10 = -[EKCalendarItemLocationInlineEditItem _supportedSearchTypesForSubitemAtIndex:](self, "_supportedSearchTypesForSubitemAtIndex:");
  id v11 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
  unint64_t v12 = [v11 count];

  if (v12 <= a4)
  {
    uint64_t v14 = 0;
  }
  else
  {
    id v13 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
    uint64_t v14 = [v13 objectAtIndex:a4];
  }
  uint64_t v15 = [EKLocationEditItemViewController alloc];
  uint64_t v16 = [(EKCalendarItemEditItem *)self calendarItem];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._store);
  long long v18 = -[EKLocationEditItemViewController initWithFrame:calendarItem:eventStore:](v15, "initWithFrame:calendarItem:eventStore:", v16, WeakRetained, x, y, width, height);

  [(EKEditItemViewController *)v18 setEditDelegate:self];
  [(EKEditItemViewController *)v18 setModal:1];
  [(EKEditItemViewController *)v18 setShowsDoneButton:0];
  [(EKLocationEditItemViewController *)v18 setSupportedSearchTypes:v10];
  long long v19 = [(EKUILocationEditItemModel *)self->_viewModel mapLocationRowModel];
  [(EKLocationEditItemViewController *)v18 setLocationViewModel:v19];

  long long v20 = [(EKUILocationEditItemModel *)self->_viewModel virtualConferenceRowModel];
  [(EKLocationEditItemViewController *)v18 setConferenceViewModel:v20];

  if (v14)
  {
    long long v21 = [(EKUILocationEditItemModel *)self->_viewModel virtualConferenceRowModel];
    [(EKLocationEditItemViewController *)v18 setConferenceTextFieldSelected:v14 == v21];
  }
  else
  {
    [(EKLocationEditItemViewController *)v18 setConferenceTextFieldSelected:0];
  }
  id v22 = [(EKUILocationEditItemModel *)self->_viewModel virtualConferenceRowModel];
  if (v22)
  {
    uint64_t v23 = [(EKUILocationEditItemModel *)self->_viewModel virtualConferenceRowModel];
    v24 = [v23 conference];
    -[EKLocationEditItemViewController setDisableConferenceTextField:](v18, "setDisableConferenceTextField:", [v24 isWritable] ^ 1);
  }
  else
  {
    [(EKLocationEditItemViewController *)v18 setDisableConferenceTextField:0];
  }

  objc_storeStrong((id *)&self->_currentLocationEditController, v18);
  v25 = v18;
  char v26 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v25 action:sel_cancel];
  id v27 = objc_alloc(MEMORY[0x1E4FB14B8]);
  v32[0] = v26;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  v29 = (void *)[v27 initWithBarButtonItems:v28 representativeItem:0];

  v30 = [(EKLocationEditItemViewController *)v25 navigationItem];
  objc_msgSend(v30, "_dci_setFixedTrailingGroup:", v29);

  return v25;
}

- (unint64_t)_supportedSearchTypesForSubitemAtIndex:(unint64_t)a3
{
  BOOL v5 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
  unint64_t v6 = [v5 count];

  if (v6 <= a3) {
    return 2047;
  }
  unint64_t v7 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
  id v8 = [v7 objectAtIndex:a3];

  if ([v8 locationType] == 2)
  {
    id v9 = [v8 conference];
    int v10 = [v9 isWritable];

    if (v10) {
      unint64_t v11 = 1536;
    }
    else {
      unint64_t v11 = 511;
    }
  }
  else
  {
    unint64_t v11 = 511;
  }

  return v11;
}

- (void)_clearButtonTapped:(id)a3
{
  uint64_t v4 = [a3 tag];

  [(EKCalendarItemLocationInlineEditItem *)self _clearLocationAtIndex:v4];
}

- (void)_clearLocationAtIndex:(unint64_t)a3
{
  BOOL v5 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
  unint64_t v6 = [v5 count];

  if (v6 > a3)
  {
    unint64_t v7 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
    id v11 = [v7 objectAtIndex:a3];

    if ([v11 locationType] == 2)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_editor);
      [WeakRetained setPendingVideoConference:0];
    }
    viewModel = self->_viewModel;
    int v10 = [(EKEventEditItem *)self event];
    [(EKUILocationEditItemModel *)viewModel removeRowModelAtIndex:a3 event:v10];

    [(EKCalendarItemEditItem *)self notifySubitemDidSave:a3];
  }
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  return 1;
}

- (unint64_t)onSaveEditorReloadBehavior
{
  return 2;
}

- (unint64_t)onSaveEditItemsToRefresh
{
  return 9;
}

- (BOOL)isSubitemAtIndexSaveable:(unint64_t)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(EKCalendarItemEditItem *)self calendarItem];
  unint64_t v6 = [v5 location];

  unint64_t v7 = [(EKCalendarItemLocationInlineEditItem *)self cellForSubitemAtIndex:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v7 configuration];
    id v9 = [v8 text];

    char v10 = [v9 isEqualToString:v6];
    if (v9) {
      BOOL v11 = v6 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    char v12 = !v11;
    if (v10) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = v12;
    }
LABEL_26:

    goto LABEL_27;
  }
  uint64_t v14 = [v7 textLabel];

  if (v14)
  {
    uint64_t v15 = [v7 editableTextField];
    if (v15)
    {
      id v9 = v15;
      uint64_t v16 = [v15 text];
      if ([v16 isEqualToString:v6])
      {
        BOOL v13 = 0;
      }
      else
      {
        long long v18 = [v9 text];
        if (v18) {
          BOOL v19 = v6 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        BOOL v13 = !v19;
      }
      goto LABEL_26;
    }
  }
  uint64_t v17 = kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_ERROR))
  {
    int v21 = 136315138;
    id v22 = "-[EKCalendarItemLocationInlineEditItem isSubitemAtIndexSaveable:]";
    _os_log_impl(&dword_1B3F4C000, v17, OS_LOG_TYPE_ERROR, "%s - Location Inline Edit Item didn't have a text label on its non conference location cell; will return NO",
      (uint8_t *)&v21,
      0xCu);
  }
  BOOL v13 = 0;
LABEL_27:

  return v13;
}

- (BOOL)editItemViewControllerSave:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if (![v5 needsSave])
    {
LABEL_33:

      goto LABEL_34;
    }
    uint64_t v6 = [v5 locationViewModel];
    uint64_t v7 = [v5 selectedConferenceRoom];
    uint64_t v8 = [v5 selectedLocation];
    if ([v5 locationViewModelRemoved])
    {
      id v9 = kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v35 = v6;
        _os_log_impl(&dword_1B3F4C000, v9, OS_LOG_TYPE_DEBUG, "Removing row view model from view model: [%@]", buf, 0xCu);
      }
      viewModel = self->_viewModel;
      BOOL v11 = [(EKEventEditItem *)self event];
      [(EKUILocationEditItemModel *)viewModel removeRowModel:v6 event:v11];
    }
    else
    {
      if (v7 || !v8)
      {
        if (v7 && !v8)
        {
          v28 = kEKUILogEventEditorHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v35 = v7;
            _os_log_impl(&dword_1B3F4C000, v28, OS_LOG_TYPE_DEBUG, "Updating event with selected conference room: [%@]", buf, 0xCu);
          }
          [(EKUILocationEditItemModel *)self->_viewModel updateRowModel:v6 withConferenceRoom:v7 editItem:self];
        }
LABEL_13:
        v33 = (void *)v6;
        uint64_t v14 = (void *)v7;
        uint64_t v15 = objc_msgSend(v5, "conferenceViewModel", v8);
        uint64_t v16 = [v5 selectedVirtualConference];
        uint64_t v17 = [v5 pendingVirtualConference];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_editor);
        [WeakRetained setPendingVideoConference:v17];

        id v19 = objc_loadWeakRetained((id *)&self->_editor);
        LODWORD(v17) = [v19 pendingVideoConference];

        if (v17)
        {
          long long v20 = kEKUILogEventEditorHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v35 = (uint64_t)v16;
            _os_log_impl(&dword_1B3F4C000, v20, OS_LOG_TYPE_DEBUG, "Updating event with pending virtual conference: [%@]", buf, 0xCu);
          }
          int v21 = self->_viewModel;
          id v22 = [(EKEventEditItem *)self event];
          uint64_t v23 = v21;
          v24 = v15;
          v25 = 0;
        }
        else
        {
          if ([v5 conferenceViewModelRemoved])
          {
            char v26 = kEKUILogEventEditorHandle;
            if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v35 = (uint64_t)v15;
              _os_log_impl(&dword_1B3F4C000, v26, OS_LOG_TYPE_DEBUG, "Removing row view model from view model: [%@]", buf, 0xCu);
            }
            id v27 = self->_viewModel;
            id v22 = [(EKEventEditItem *)self event];
            [(EKUILocationEditItemModel *)v27 removeRowModel:v15 event:v22];
            goto LABEL_31;
          }
          if (!v16)
          {
LABEL_32:

            goto LABEL_33;
          }
          v29 = kEKUILogEventEditorHandle;
          if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v35 = (uint64_t)v16;
            _os_log_impl(&dword_1B3F4C000, v29, OS_LOG_TYPE_DEBUG, "Updating event with selected virtual conference: [%@]", buf, 0xCu);
          }
          v30 = self->_viewModel;
          id v22 = [(EKEventEditItem *)self event];
          uint64_t v23 = v30;
          v24 = v15;
          v25 = v16;
        }
        [(EKUILocationEditItemModel *)v23 updateRowModel:v24 withVirtualConference:v25 event:v22];
LABEL_31:

        goto LABEL_32;
      }
      char v12 = kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v35 = v8;
        _os_log_impl(&dword_1B3F4C000, v12, OS_LOG_TYPE_DEBUG, "Updating event with selected structured location: [%@]", buf, 0xCu);
      }
      BOOL v13 = self->_viewModel;
      BOOL v11 = [(EKEventEditItem *)self event];
      [(EKUILocationEditItemModel *)v13 updateRowModel:v6 withMapLocation:v8 event:v11];
    }

    goto LABEL_13;
  }
LABEL_34:
  [(EKUILocationEditItemModel *)self->_viewModel reorderRowModels];
  [(EKCalendarItemEditItem *)self notifySubitemDidSave:0];

  return 1;
}

- (void)editItemPendingVideoConferenceCompleted:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_19:
    [(EKUILocationEditItemModel *)self->_viewModel reorderRowModels];
    [(EKCalendarItemEditItem *)self notifySubitemDidSave:0];
    goto LABEL_20;
  }
  v34 = [(EKUILocationEditItemModel *)self->_viewModel virtualConferenceRowModel];
  id v5 = v4;
  uint64_t v6 = [v5 selectedVirtualConference];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editor);
  char v8 = [WeakRetained pendingVideoConference];

  if (v8)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_editor);
    [v9 setPendingVideoConference:0];

    char v10 = [v5 pendingVirtualConferenceError];

    if (v10)
    {
      BOOL v11 = EventKitUIBundle();
      char v12 = [v11 localizedStringForKey:@"Unable to Add Video Call Link" value:&stru_1F0CC2140 table:0];

      BOOL v13 = EventKitUIBundle();
      uint64_t v14 = [v13 localizedStringForKey:@"The request timed out. Try adding the video call link again." value:&stru_1F0CC2140 table:0];

      uint64_t v15 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v12 message:v14 preferredStyle:1];
      uint64_t v16 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:&__block_literal_global_73];
      [v15 addAction:v16];

      id v17 = objc_loadWeakRetained((id *)&self->_editor);
      [v17 presentViewController:v15 animated:1 completion:0];

      viewModel = self->_viewModel;
      id v19 = [(EKEventEditItem *)self event];
      long long v20 = viewModel;
      int v21 = v34;
      [(EKUILocationEditItemModel *)v20 removeRowModel:v34 event:v19];
    }
    else if (v6)
    {
      v29 = kEKUILogEventEditorHandle;
      if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v6;
        _os_log_impl(&dword_1B3F4C000, v29, OS_LOG_TYPE_DEBUG, "Updating event with selected virtual conference: [%@]", buf, 0xCu);
      }
      v30 = self->_viewModel;
      char v12 = [(EKEventEditItem *)self event];
      char v31 = v30;
      int v21 = v34;
      [(EKUILocationEditItemModel *)v31 updateRowModel:v34 withVirtualConference:v6 event:v12];
    }
    else
    {
      v32 = self->_viewModel;
      char v12 = [(EKEventEditItem *)self event];
      v33 = v32;
      int v21 = v34;
      [(EKUILocationEditItemModel *)v33 removeRowModel:v34 event:v12];
    }

    [(EKLocationEditItemViewController *)self->_currentLocationEditController pendingVideoConferenceUpdated:v6];
    goto LABEL_19;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v22 = [v6 joinMethods];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v36;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = (void *)MEMORY[0x1E4F25510];
        v28 = [*(id *)(*((void *)&v35 + 1) + 8 * v26) URL];
        [v27 invalidateConferenceURL:v28];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v24);
  }

LABEL_20:
}

- (void)didTapAddSuggestedLocationCell:(id)a3 disambiguatedLocation:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  if ([WeakRetained isNew])
  {
    uint64_t v7 = 3;
  }
  else
  {
    id v8 = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
    if ([v8 _hasChangesForKey:@"location"]) {
      uint64_t v7 = 3;
    }
    else {
      uint64_t v7 = 7;
    }
  }
  id v9 = (void *)MEMORY[0x1E4F25638];
  id v10 = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  BOOL v11 = [v10 preferredLocation];
  char v12 = [v11 predictedLOI];
  [v9 userInteractionWithPredictedLocationOfInterest:v12 interaction:v7];

  int64_t v13 = [(EKUILocationEditItemModel *)self->_viewModel indexOfPredictedLocation];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v35 = v13;
    long long v36 = v5;
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v15 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v38 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = [*(id *)(*((void *)&v37 + 1) + 8 * i) location];
          uint64_t v21 = [v20 title];
          id v22 = (void *)v21;
          if (v21) {
            uint64_t v23 = (__CFString *)v21;
          }
          else {
            uint64_t v23 = &stru_1F0CC2140;
          }
          [v14 addObject:v23];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v17);
    }

    id v5 = v36;
    uint64_t v24 = [v36 title];
    [v14 addObject:v24];

    uint64_t v25 = [v36 title];
    uint64_t v26 = [MEMORY[0x1E4F25538] _locationStringForLocations:v14];
    [v36 setTitle:v26];

    id v27 = [(EKEventEditItem *)self event];
    [v27 confirmPredictedLocation:v36];

    [v36 setTitle:v25];
    v28 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
    v29 = [v28 objectAtIndex:v35];

    viewModel = self->_viewModel;
    char v31 = [(EKEventEditItem *)self event];
    [(EKUILocationEditItemModel *)viewModel updateRowModel:v29 withMapLocation:v36 event:v31];

    v32 = [(EKCalendarItemEditItem *)self delegate];
    v33 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", -[EKCalendarItemLocationInlineEditItem numberOfSubitems](self, "numberOfSubitems"));
    v34 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v35];
    [v32 editItem:self wantsRowInsertions:0 rowDeletions:v33 rowReloads:v34];

    [(EKCalendarItemEditItem *)self notifySubitemDidSave:v35];
  }
}

- (void)didTapDismissSuggestedLocationCell:(id)a3
{
  id v4 = [(EKEventEditItem *)self event];
  [v4 rejectPredictedLocation];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  if ([WeakRetained isNew])
  {
    uint64_t v6 = 4;
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
    if ([v7 _hasChangesForKey:@"location"]) {
      uint64_t v6 = 4;
    }
    else {
      uint64_t v6 = 8;
    }
  }
  id v8 = (void *)MEMORY[0x1E4F25638];
  id v9 = objc_loadWeakRetained((id *)&self->super.super._calendarItem);
  id v10 = [v9 preferredLocation];
  BOOL v11 = [v10 predictedLOI];
  [v8 userInteractionWithPredictedLocationOfInterest:v11 interaction:v6];

  int64_t v12 = [(EKUILocationEditItemModel *)self->_viewModel indexOfPredictedLocation];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(EKCalendarItemLocationInlineEditItem *)self _clearLocationAtIndex:v12];
  }
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  [v6 addObserver:self selector:sel_textFieldDidChange_ name:*MEMORY[0x1E4FB3018] object:v5];

  [(EKCalendarItemEditItem *)self setSelectedResponder:v5];

  [(EKCalendarItemEditItem *)self notifyDidStartEditing];
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28EB8];
  id v5 = a3;
  uint64_t v6 = [v4 defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4FB3018] object:v5];

  [(EKCalendarItemEditItem *)self notifyDidEndEditing];

  [(EKCalendarItemEditItem *)self setSelectedResponder:0];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 0;
}

- (BOOL)textFieldShouldClear:(id)a3
{
  return 1;
}

- (id)searchStringForEventAutocomplete
{
  id v2 = [(EKCalendarItemLocationInlineEditItem *)self cellForSubitemAtIndex:0];
  unint64_t v3 = [v2 textLabel];
  id v4 = [v3 text];

  return v4;
}

- (BOOL)_scribbleInteraction:(id)a3 focusWillTransformElement:(id)a4
{
  return 1;
}

- (void)_scribbleInteraction:(id)a3 willBeginWritingInElement:(id)a4
{
  id v9 = [a3 view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v9;
    id v5 = [v4 clearButton];
    [v5 setHidden:1];

    uint64_t v6 = [v4 defaultContentConfiguration];
    [v4 setTitleSubtitleContentConfiguration:v6];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v9 textLabel];
      [v7 setText:0];

      id v8 = [v9 detailTextLabel];
      [v8 setText:0];

      [v9 setAccessoryView:0];
    }
  }
}

- (void)_scribbleInteraction:(id)a3 didFinishWritingInElement:(id)a4
{
  id v15 = [a3 view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v6 = [v15 tag];
    id v7 = [(EKUILocationEditItemModel *)self->_viewModel rowModels];
    unint64_t v8 = [v7 count];

    viewModel = self->_viewModel;
    if (v6 >= v8)
    {
      BOOL v11 = [(EKUILocationEditItemModel *)viewModel placeholderCellText];
      int64_t v12 = [v15 textLabel];
      [v12 setText:v11];
    }
    else
    {
      id v10 = [(EKUILocationEditItemModel *)viewModel rowModels];
      BOOL v11 = [v10 objectAtIndex:v6];

      if ([v11 locationType] == 1 || !objc_msgSend(v11, "locationType"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          int64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInMethod:a2 object:self file:@"EKCalendarItemLocationInlineEditItem.m" lineNumber:669 description:@"Map or conference room location has wrong cell type"];
        }
        int64_t v12 = [v11 location];
        [(EKCalendarItemLocationInlineEditItem *)self _updateMapLocationCell:v15 index:v6 location:v12];
      }
      else
      {
        if ([v11 locationType] != 2)
        {
LABEL_14:

          goto LABEL_15;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
          [v14 handleFailureInMethod:a2 object:self file:@"EKCalendarItemLocationInlineEditItem.m" lineNumber:672 description:@"Virtual conference has wrong cell type"];
        }
        int64_t v12 = [v11 conference];
        [(EKCalendarItemLocationInlineEditItem *)self _updateVirtualConferenceCell:v15 index:v6 virtualConference:v12];
      }
    }

    goto LABEL_14;
  }
LABEL_15:
}

- (void)_scribbleInteraction:(id)a3 requestElementsInRect:(CGRect)a4 completion:(id)a5
{
}

- (CGRect)_scribbleInteraction:(id)a3 frameForElement:(id)a4
{
  id v4 = [a3 view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)_scribbleInteraction:(id)a3 focusElement:(id)a4 initialFocusSelectionReferencePoint:(CGPoint)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_editor);

  if (WeakRetained)
  {
    double v11 = [v8 view];
    uint64_t v12 = [v11 tag];

    id v13 = objc_loadWeakRetained((id *)&self->_editor);
    double v14 = [v13 view];
    [v14 frame];
    double v15 = -[EKCalendarItemLocationInlineEditItem detailViewControllerWithFrame:forSubitemAtIndex:](self, "detailViewControllerWithFrame:forSubitemAtIndex:", v12);

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v15;
      [v16 setAutoFillSelectedTextField:0];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      void v20[2] = __121__EKCalendarItemLocationInlineEditItem__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke;
      v20[3] = &unk_1E608AF00;
      id v21 = v9;
      [v16 setViewAppearedBlock:v20];
    }
    id v17 = objc_loadWeakRetained((id *)&self->_editor);
    [(EKCalendarItemEditItem *)self showViewController:v15 editor:v17 animated:1];
  }
  else
  {
    uint64_t v18 = kEKUILogEventEditorHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl(&dword_1B3F4C000, v18, OS_LOG_TYPE_ERROR, "_Editor was nil, so couldn't call callback in focusElement.", v19, 2u);
    }
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
}

uint64_t __121__EKCalendarItemLocationInlineEditItem__scribbleInteraction_focusElement_initialFocusSelectionReferencePoint_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocationEditController, 0);
  objc_destroyWeak((id *)&self->_editor);

  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end