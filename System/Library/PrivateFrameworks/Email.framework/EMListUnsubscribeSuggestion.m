@interface EMListUnsubscribeSuggestion
+ (NSString)suggestionDismissActionTitle;
+ (NSString)suggestionPrimaryActionString;
+ (NSString)unsubscribeTitleAlertString;
+ (id)unsubscribeSuggestionComparator;
- (BOOL)isEqual:(id)a3;
- (EMListUnsubscribeCommand)listUnsubscribeCommand;
- (NSString)unsubscribeMessageAlertString;
- (SGSuggestionDelegate)suggestionDelegate;
- (SGSuggestionPresenter)suggestionPresenter;
- (id)suggestionCategoryImage;
- (id)suggestionCategoryLocalizedCountOfItems:(id)a3;
- (id)suggestionCategorySubtitleForItems:(id)a3;
- (id)suggestionCategoryTitle;
- (id)suggestionCategoryTitleForItems:(id)a3;
- (id)suggestionComparator;
- (id)suggestionDismissAction;
- (id)suggestionPrimaryAction;
- (id)suggestionTitle;
- (unint64_t)hash;
- (void)_sendAnalyticsForUnsubscribe:(int64_t)a3;
- (void)ignore;
- (void)setListUnsubscribeCommand:(id)a3;
- (void)setSuggestionDelegate:(id)a3;
- (void)setSuggestionPresenter:(id)a3;
- (void)unsubscribe;
@end

@implementation EMListUnsubscribeSuggestion

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(EMListUnsubscribeSuggestion *)self listUnsubscribeCommand];
    v6 = [v4 listUnsubscribeCommand];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(EMListUnsubscribeSuggestion *)self listUnsubscribeCommand];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (NSString)suggestionPrimaryActionString
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)suggestionDismissActionTitle
{
  return (NSString *)_EFLocalizedString();
}

+ (NSString)unsubscribeTitleAlertString
{
  return (NSString *)_EFLocalizedString();
}

- (NSString)unsubscribeMessageAlertString
{
  v2 = [(EMListUnsubscribeSuggestion *)self listUnsubscribeCommand];
  [v2 isMailtoOperation];

  unint64_t v3 = _EFLocalizedString();
  return (NSString *)v3;
}

- (id)suggestionPrimaryAction
{
}

- (id)suggestionDismissAction
{
}

- (id)suggestionTitle
{
  return (id)_EFLocalizedString();
}

- (id)suggestionCategoryImage
{
}

- (id)suggestionCategoryLocalizedCountOfItems:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  v5 = NSString;
  v6 = _EFLocalizedString();
  char v7 = objc_msgSend(MEMORY[0x1E4F28EE0], "ef_formatInteger:withGrouping:", v4, 0);
  v8 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v4, v7);

  return v8;
}

- (id)suggestionCategorySubtitleForItems:(id)a3
{
  return &stru_1F1A3DFB0;
}

- (id)suggestionCategoryTitle
{
  return (id)_EFLocalizedString();
}

- (id)suggestionCategoryTitleForItems:(id)a3
{
  id v3 = [(EMListUnsubscribeSuggestion *)self suggestionTitle];
  return v3;
}

- (id)suggestionComparator
{
  v2 = objc_opt_class();
  return (id)[v2 unsubscribeSuggestionComparator];
}

- (void)unsubscribe
{
  id v3 = [(EMListUnsubscribeSuggestion *)self suggestionPresenter];
  uint64_t v4 = [(EMListUnsubscribeSuggestion *)self suggestion];
  [v3 removeSuggestion:v4];

  [(EMListUnsubscribeSuggestion *)self _sendAnalyticsForUnsubscribe:1];
}

- (void)ignore
{
  id v3 = [(EMListUnsubscribeSuggestion *)self suggestionPresenter];
  uint64_t v4 = [(EMListUnsubscribeSuggestion *)self suggestion];
  [v3 removeSuggestion:v4];

  [(EMListUnsubscribeSuggestion *)self _sendAnalyticsForUnsubscribe:0];
}

+ (id)unsubscribeSuggestionComparator
{
  return &__block_literal_global_22;
}

uint64_t __62__EMListUnsubscribeSuggestion_unsubscribeSuggestionComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  int v7 = objc_opt_isKindOfClass();
  if ((isKindOfClass ^ 1 | v7)) {
    uint64_t v8 = (uint64_t)((unint64_t)(v7 & (isKindOfClass ^ 1u)) << 63) >> 63;
  }
  else {
    uint64_t v8 = 1;
  }

  return v8;
}

- (void)_sendAnalyticsForUnsubscribe:(int64_t)a3
{
  id v3 = [(EMListUnsubscribeSuggestion *)self listUnsubscribeCommand];
  [v3 headerUnsubscribeTypes];

  AnalyticsSendEventLazy();
}

id __60__EMListUnsubscribeSuggestion__sendAnalyticsForUnsubscribe___block_invoke(uint64_t a1)
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CC38];
  id v3 = (void *)MEMORY[0x1E4F1CC28];
  if (*(void *)(a1 + 32)) {
    id v4 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    id v4 = (void *)MEMORY[0x1E4F1CC28];
  }
  id v5 = v4;
  if ((*(void *)(a1 + 32) & 2) != 0) {
    v6 = v2;
  }
  else {
    v6 = v3;
  }
  id v7 = v6;
  if ((*(void *)(a1 + 32) & 4) != 0) {
    uint64_t v8 = v2;
  }
  else {
    uint64_t v8 = v3;
  }
  id v9 = v8;
  v13[0] = @"unsubscribeReason";
  v10 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v14[0] = v10;
  v14[1] = v5;
  v13[1] = @"mailto";
  v13[2] = @"https";
  v13[3] = @"post";
  v14[2] = v7;
  v14[3] = v9;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];

  return v11;
}

- (SGSuggestionDelegate)suggestionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->suggestionDelegate);
  return (SGSuggestionDelegate *)WeakRetained;
}

- (void)setSuggestionDelegate:(id)a3
{
}

- (EMListUnsubscribeCommand)listUnsubscribeCommand
{
  return self->_listUnsubscribeCommand;
}

- (void)setListUnsubscribeCommand:(id)a3
{
}

- (SGSuggestionPresenter)suggestionPresenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionPresenter);
  return (SGSuggestionPresenter *)WeakRetained;
}

- (void)setSuggestionPresenter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_suggestionPresenter);
  objc_storeStrong((id *)&self->_listUnsubscribeCommand, 0);
  objc_destroyWeak((id *)&self->suggestionDelegate);
}

@end