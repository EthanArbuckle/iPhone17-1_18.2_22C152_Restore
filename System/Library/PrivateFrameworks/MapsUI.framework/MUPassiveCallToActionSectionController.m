@interface MUPassiveCallToActionSectionController
- (BOOL)hasContent;
- (BOOL)hasContentBeforePersonalizedSuggestionArbitration;
- (BOOL)isImpressionable;
- (id)sectionView;
- (int)analyticsModuleType;
- (void)_instrumentUserAction:(int)a3;
- (void)_loadContentIfNeeded;
- (void)_unloadContent;
- (void)updateSuggestionView;
@end

@implementation MUPassiveCallToActionSectionController

- (id)sectionView
{
  [(MUPassiveCallToActionSectionController *)self _loadContentIfNeeded];
  sectionView = self->_sectionView;
  return sectionView;
}

- (BOOL)hasContentBeforePersonalizedSuggestionArbitration
{
  return self->_suggestionView != 0;
}

- (BOOL)hasContent
{
  v3 = [(MUPlaceSectionController *)self personalizedSuggestionsArbiterDelegate];

  if (v3)
  {
    v4 = [(MUPlaceSectionController *)self personalizedSuggestionsArbiterDelegate];
    char v5 = [v4 shouldShowPlaceCallToActionSection];

    return v5;
  }
  else
  {
    return [(MUPassiveCallToActionSectionController *)self hasContentBeforePersonalizedSuggestionArbitration];
  }
}

- (void)updateSuggestionView
{
  v3 = [(MUCallToActionSectionController *)self callToActionDelegate];
  obj = [v3 suggestionViewForCallToActionSectionController:self];

  if (obj != self->_suggestionView)
  {
    [(MUPassiveCallToActionSectionController *)self _unloadContent];
    objc_storeStrong((id *)&self->_suggestionView, obj);
    [(MUPassiveCallToActionSectionController *)self _loadContentIfNeeded];
    v4 = [(MUPlaceSectionController *)self delegate];
    [v4 placeSectionControllerDidUpdateContent:self];
  }
}

- (void)_unloadContent
{
  self->_sectionView = 0;
  MEMORY[0x1F41817F8]();
}

- (void)_loadContentIfNeeded
{
  if (!self->_sectionView)
  {
    suggestionView = self->_suggestionView;
    if (suggestionView) {
      goto LABEL_5;
    }
    v4 = [(MUCallToActionSectionController *)self callToActionDelegate];
    char v5 = [v4 suggestionViewForCallToActionSectionController:self];
    v6 = self->_suggestionView;
    self->_suggestionView = v5;

    suggestionView = self->_suggestionView;
    if (suggestionView)
    {
LABEL_5:
      v7 = +[MUPlaceSectionView cardShadowSectionViewForContentView:suggestionView sectionHeaderViewModel:0];
      sectionView = self->_sectionView;
      self->_sectionView = v7;

      v9 = self->_sectionView;
      [(MUPlaceSectionView *)v9 configureWithSectionController:self];
    }
  }
}

- (void)_instrumentUserAction:(int)a3
{
}

- (int)analyticsModuleType
{
  return 41;
}

- (BOOL)isImpressionable
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestionView, 0);
  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end