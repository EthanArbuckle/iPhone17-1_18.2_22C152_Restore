@interface CKTranscriptSharingSuggestion
+ (id)bannerWithState:(int64_t)a3;
- (BOOL)suggestionProminentActionButton;
- (CKTranscriptSharingSuggestion)initWithState:(int64_t)a3;
- (CKTranscriptSharingSuggestionDelegate)delegate;
- (SGSuggestionDelegate)suggestionDelegate;
- (id)suggestionCategoryId;
- (id)suggestionCategoryImage;
- (id)suggestionCategoryLocalizedCountOfItems:(id)a3;
- (id)suggestionCategorySubtitleForItems:(id)a3;
- (id)suggestionCategoryTitle;
- (id)suggestionCategoryTitleForItems:(id)a3;
- (id)suggestionDismissAction;
- (id)suggestionImageSGView;
- (id)suggestionPrimaryAction;
- (id)suggestionSubtitle;
- (id)suggestionTitle;
- (int64_t)state;
- (int64_t)suggestionActionButtonType;
- (void)setDelegate:(id)a3;
- (void)setSuggestionDelegate:(id)a3;
@end

@implementation CKTranscriptSharingSuggestion

+ (id)bannerWithState:(int64_t)a3
{
  v3 = [[CKTranscriptSharingSuggestion alloc] initWithState:a3];

  return v3;
}

- (CKTranscriptSharingSuggestion)initWithState:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKTranscriptSharingSuggestion;
  result = [(CKTranscriptSharingSuggestion *)&v5 init];
  if (result) {
    result->_state = a3;
  }
  return result;
}

- (id)suggestionPrimaryAction
{
  if (self->_state == 1)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__CKTranscriptSharingSuggestion_suggestionPrimaryAction__block_invoke;
    aBlock[3] = &unk_1E56298F8;
    aBlock[4] = self;
    v2 = _Block_copy(aBlock);
    v3 = (void *)MEMORY[0x1E4F5DFF8];
    v4 = CKFrameworkBundle();
    objc_super v5 = [v4 localizedStringForKey:@"TS_STOP_SHARING_ACTION_BANNER" value:&stru_1EDE4CA38 table:@"TranscriptSharing-SYDROB_FEATURES"];
    v6 = [v3 actionWithTitle:v5 handler:v2];
  }
  else
  {
    v6 = 0;
    v2 = 0;
  }

  return v6;
}

void __56__CKTranscriptSharingSuggestion_suggestionPrimaryAction__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 transcriptStopSharingButtonTapped:*(void *)(a1 + 32)];
  }
}

- (id)suggestionDismissAction
{
  if (self->_state == 3
    && ([(CKTranscriptSharingSuggestion *)self delegate],
        char v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = objc_opt_respondsToSelector(),
        v3,
        (v4 & 1) != 0))
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__CKTranscriptSharingSuggestion_suggestionDismissAction__block_invoke;
    v7[3] = &unk_1E56298F8;
    v7[4] = self;
    objc_super v5 = [MEMORY[0x1E4F5DFF8] actionWithTitle:&stru_1EDE4CA38 handler:v7];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

void __56__CKTranscriptSharingSuggestion_suggestionDismissAction__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 transcriptSharingBannerWillDismiss:*(void *)(a1 + 32)];
}

- (id)suggestionSubtitle
{
  return 0;
}

- (id)suggestionImageSGView
{
  id v2 = [MEMORY[0x1E4F42A80] systemImageNamed:@"person.crop.circle.fill"];
  char v3 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v2];
  char v4 = [MEMORY[0x1E4F428B8] systemGray2Color];
  [v3 setTintColor:v4];

  return v3;
}

- (id)suggestionTitle
{
  int64_t v2 = [(CKTranscriptSharingSuggestion *)self state];
  if ((unint64_t)(v2 - 1) < 2)
  {
    char v3 = CKFrameworkBundle();
    char v4 = v3;
    objc_super v5 = @"TS_CURRENTLY_SHARING";
LABEL_5:
    v6 = [v3 localizedStringForKey:v5 value:&stru_1EDE4CA38 table:@"TranscriptSharing-SYDROB_FEATURES"];

    goto LABEL_7;
  }
  if (v2 == 3)
  {
    char v3 = CKFrameworkBundle();
    char v4 = v3;
    objc_super v5 = @"TS_NO_LONGER_SHARING";
    goto LABEL_5;
  }
  v6 = &stru_1EDE4CA38;
LABEL_7:

  return v6;
}

- (id)suggestionCategoryId
{
  int64_t v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)suggestionCategoryImage
{
  return (id)[MEMORY[0x1E4F42A80] imageNamed:&stru_1EDE4CA38];
}

- (id)suggestionCategoryLocalizedCountOfItems:(id)a3
{
  return &stru_1EDE4CA38;
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  return 0;
}

- (id)suggestionCategoryTitle
{
  return &stru_1EDE4CA38;
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  return &stru_1EDE4CA38;
}

- (int64_t)suggestionActionButtonType
{
  return 0;
}

- (BOOL)suggestionProminentActionButton
{
  return 1;
}

- (SGSuggestionDelegate)suggestionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->suggestionDelegate);

  return (SGSuggestionDelegate *)WeakRetained;
}

- (void)setSuggestionDelegate:(id)a3
{
}

- (CKTranscriptSharingSuggestionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKTranscriptSharingSuggestionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->suggestionDelegate);
}

@end