@interface MUPersonalizedSuggestionSectionArbiter
- (BOOL)shouldShowHikingTipSection;
- (BOOL)shouldShowPlaceCallToActionSection;
- (BOOL)shouldShowPlaceNotesSection;
- (MUHikingTipSectionController)hikingTipSectionController;
- (MUPassiveCallToActionSectionController)placeCallToActionSectionController;
- (_TtC6MapsUI29MUPlaceNotesSectionController)placeNotesSectionController;
- (int64_t)bestSuggestionSectionType;
- (void)setHikingTipSectionController:(id)a3;
- (void)setPlaceCallToActionSectionController:(id)a3;
- (void)setPlaceNotesSectionController:(id)a3;
@end

@implementation MUPersonalizedSuggestionSectionArbiter

- (int64_t)bestSuggestionSectionType
{
  v3 = [(MUPersonalizedSuggestionSectionArbiter *)self placeNotesSectionController];
  char v4 = [v3 hasContentBeforePersonalizedSuggestionArbitration];

  if (v4) {
    return 1;
  }
  v6 = [(MUPersonalizedSuggestionSectionArbiter *)self placeCallToActionSectionController];
  char v7 = [v6 hasContentBeforePersonalizedSuggestionArbitration];

  if (v7) {
    return 2;
  }
  v8 = [(MUPersonalizedSuggestionSectionArbiter *)self hikingTipSectionController];
  int v9 = [v8 hasContentBeforePersonalizedSuggestionArbitration];

  if (v9) {
    return 3;
  }
  else {
    return 0;
  }
}

- (BOOL)shouldShowPlaceNotesSection
{
  return [(MUPersonalizedSuggestionSectionArbiter *)self bestSuggestionSectionType] == 1;
}

- (BOOL)shouldShowPlaceCallToActionSection
{
  return [(MUPersonalizedSuggestionSectionArbiter *)self bestSuggestionSectionType] == 2;
}

- (BOOL)shouldShowHikingTipSection
{
  return [(MUPersonalizedSuggestionSectionArbiter *)self bestSuggestionSectionType] == 3;
}

- (_TtC6MapsUI29MUPlaceNotesSectionController)placeNotesSectionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeNotesSectionController);
  return (_TtC6MapsUI29MUPlaceNotesSectionController *)WeakRetained;
}

- (void)setPlaceNotesSectionController:(id)a3
{
}

- (MUPassiveCallToActionSectionController)placeCallToActionSectionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_placeCallToActionSectionController);
  return (MUPassiveCallToActionSectionController *)WeakRetained;
}

- (void)setPlaceCallToActionSectionController:(id)a3
{
}

- (MUHikingTipSectionController)hikingTipSectionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hikingTipSectionController);
  return (MUHikingTipSectionController *)WeakRetained;
}

- (void)setHikingTipSectionController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hikingTipSectionController);
  objc_destroyWeak((id *)&self->_placeCallToActionSectionController);
  objc_destroyWeak((id *)&self->_placeNotesSectionController);
}

@end