@interface MUWebBasedPlacecardSectionControllerConfiguration
- (BOOL)canShowDownloadOffline;
- (BOOL)canShowOpenFindMyAction;
- (BOOL)canShowRequestLocation;
- (BOOL)placeInShortcuts;
- (BOOL)showMoreButton;
- (BOOL)userCanEdit;
- (CNContact)contact;
- (MUAMSResultProvider)amsResultProvider;
- (MUARPSuggestionViewModel)userARPSuggestion;
- (MUExternalActionHandling)externalActionHandler;
- (MUTimeExpirableLRUCache)artworkCache;
- (NSArray)userARPRatings;
- (NSArray)userGuides;
- (NSString)options;
- (NSURL)userARPPhoto;
- (UIImage)userIcon;
- (unint64_t)numberOfReportsInReview;
- (void)setAmsResultProvider:(id)a3;
- (void)setArtworkCache:(id)a3;
- (void)setCanShowDownloadOffline:(BOOL)a3;
- (void)setCanShowOpenFindMyAction:(BOOL)a3;
- (void)setCanShowRequestLocation:(BOOL)a3;
- (void)setContact:(id)a3;
- (void)setExternalActionHandler:(id)a3;
- (void)setNumberOfReportsInReview:(unint64_t)a3;
- (void)setOptions:(id)a3;
- (void)setPlaceInShortcuts:(BOOL)a3;
- (void)setShowMoreButton:(BOOL)a3;
- (void)setUserARPPhoto:(id)a3;
- (void)setUserARPRatings:(id)a3;
- (void)setUserARPSuggestion:(id)a3;
- (void)setUserCanEdit:(BOOL)a3;
- (void)setUserGuides:(id)a3;
- (void)setUserIcon:(id)a3;
@end

@implementation MUWebBasedPlacecardSectionControllerConfiguration

- (MUExternalActionHandling)externalActionHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_externalActionHandler);
  return (MUExternalActionHandling *)WeakRetained;
}

- (void)setExternalActionHandler:(id)a3
{
}

- (MUTimeExpirableLRUCache)artworkCache
{
  return self->_artworkCache;
}

- (void)setArtworkCache:(id)a3
{
}

- (MUAMSResultProvider)amsResultProvider
{
  return self->_amsResultProvider;
}

- (void)setAmsResultProvider:(id)a3
{
}

- (NSArray)userGuides
{
  return self->_userGuides;
}

- (void)setUserGuides:(id)a3
{
}

- (BOOL)placeInShortcuts
{
  return self->_placeInShortcuts;
}

- (void)setPlaceInShortcuts:(BOOL)a3
{
  self->_placeInShortcuts = a3;
}

- (NSArray)userARPRatings
{
  return self->_userARPRatings;
}

- (void)setUserARPRatings:(id)a3
{
}

- (NSURL)userARPPhoto
{
  return self->_userARPPhoto;
}

- (void)setUserARPPhoto:(id)a3
{
}

- (MUARPSuggestionViewModel)userARPSuggestion
{
  return self->_userARPSuggestion;
}

- (void)setUserARPSuggestion:(id)a3
{
}

- (unint64_t)numberOfReportsInReview
{
  return self->_numberOfReportsInReview;
}

- (void)setNumberOfReportsInReview:(unint64_t)a3
{
  self->_numberOfReportsInReview = a3;
}

- (UIImage)userIcon
{
  return self->_userIcon;
}

- (void)setUserIcon:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (NSString)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)userCanEdit
{
  return self->_userCanEdit;
}

- (void)setUserCanEdit:(BOOL)a3
{
  self->_userCanEdit = a3;
}

- (BOOL)canShowOpenFindMyAction
{
  return self->_canShowOpenFindMyAction;
}

- (void)setCanShowOpenFindMyAction:(BOOL)a3
{
  self->_canShowOpenFindMyAction = a3;
}

- (BOOL)canShowRequestLocation
{
  return self->_canShowRequestLocation;
}

- (void)setCanShowRequestLocation:(BOOL)a3
{
  self->_canShowRequestLocation = a3;
}

- (BOOL)showMoreButton
{
  return self->_showMoreButton;
}

- (void)setShowMoreButton:(BOOL)a3
{
  self->_showMoreButton = a3;
}

- (BOOL)canShowDownloadOffline
{
  return self->_canShowDownloadOffline;
}

- (void)setCanShowDownloadOffline:(BOOL)a3
{
  self->_canShowDownloadOffline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_userIcon, 0);
  objc_storeStrong((id *)&self->_userARPSuggestion, 0);
  objc_storeStrong((id *)&self->_userARPPhoto, 0);
  objc_storeStrong((id *)&self->_userARPRatings, 0);
  objc_storeStrong((id *)&self->_userGuides, 0);
  objc_storeStrong((id *)&self->_amsResultProvider, 0);
  objc_storeStrong((id *)&self->_artworkCache, 0);
  objc_destroyWeak((id *)&self->_externalActionHandler);
}

@end