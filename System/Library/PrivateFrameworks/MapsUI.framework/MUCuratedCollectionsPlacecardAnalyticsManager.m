@interface MUCuratedCollectionsPlacecardAnalyticsManager
- (MUCuratedCollectionsPlacecardAnalyticsManager)init;
- (void)cleanUp;
- (void)logEvent;
- (void)placecardCollectionTapped:(id)a3 atIndex:(unint64_t)a4 isCurrentlySaved:(BOOL)a5;
- (void)placecardCollectionsScrollBackward;
- (void)placecardCollectionsScrollForward;
- (void)placecardCollectionsSeeAllTapped;
- (void)placecardExploreGuidesButtonTapped;
@end

@implementation MUCuratedCollectionsPlacecardAnalyticsManager

- (MUCuratedCollectionsPlacecardAnalyticsManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)MUCuratedCollectionsPlacecardAnalyticsManager;
  v2 = [(MUCuratedCollectionsPlacecardAnalyticsManager *)&v8 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_event.target = 0xE000000C9;
    verticalIndex = v2->_event.verticalIndex;
    v2->_event.verticalIndex = 0;

    possibleActions = v3->_event.possibleActions;
    v3->_event.possibleActions = 0;

    impossibleActions = v3->_event.impossibleActions;
    v3->_event.impossibleActions = 0;
  }
  return v3;
}

- (void)placecardCollectionsScrollBackward
{
  [(MUCuratedCollectionsPlacecardAnalyticsManager *)self cleanUp];
  self->_event.action = 9037;
  [(MUCuratedCollectionsPlacecardAnalyticsManager *)self logEvent];
}

- (void)placecardCollectionsScrollForward
{
  [(MUCuratedCollectionsPlacecardAnalyticsManager *)self cleanUp];
  self->_event.action = 9036;
  [(MUCuratedCollectionsPlacecardAnalyticsManager *)self logEvent];
}

- (void)placecardCollectionTapped:(id)a3 atIndex:(unint64_t)a4 isCurrentlySaved:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(MUCuratedCollectionsPlacecardAnalyticsManager *)self cleanUp];
  self->_event.action = 2099;
  v9 = NSNumber;
  uint64_t v10 = [v8 muid];

  v11 = [v9 numberWithUnsignedLongLong:v10];
  collectionId = self->_event.collectionId;
  self->_event.collectionId = v11;

  v13 = [NSNumber numberWithBool:v5];
  collectionCurrentlySaved = self->_event.collectionCurrentlySaved;
  self->_event.collectionCurrentlySaved = v13;

  v15 = [NSNumber numberWithUnsignedInteger:a4];
  horizontalIndex = self->_event.horizontalIndex;
  self->_event.horizontalIndex = v15;

  [(MUCuratedCollectionsPlacecardAnalyticsManager *)self logEvent];
}

- (void)placecardCollectionsSeeAllTapped
{
  [(MUCuratedCollectionsPlacecardAnalyticsManager *)self cleanUp];
  self->_event.action = 2094;
  [(MUCuratedCollectionsPlacecardAnalyticsManager *)self logEvent];
}

- (void)placecardExploreGuidesButtonTapped
{
  [(MUCuratedCollectionsPlacecardAnalyticsManager *)self cleanUp];
  self->_event.action = 180;
  [(MUCuratedCollectionsPlacecardAnalyticsManager *)self logEvent];
}

- (void)logEvent
{
  v16[1] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F643A8] moduleFromModuleType:31];
  unsigned int action = self->_event.action;
  value = self->_event.value;
  v14 = (void *)MEMORY[0x1E4F63E30];
  collectionId = self->_event.collectionId;
  verticalIndex = self->_event.verticalIndex;
  collectionCurrentlySaved = self->_event.collectionCurrentlySaved;
  horizontalIndex = self->_event.horizontalIndex;
  uint64_t target = self->_event.target;
  v9 = [NSNumber numberWithInt:self->_event.cardType];
  possibleActions = self->_event.possibleActions;
  impossibleActions = self->_event.impossibleActions;
  v16[0] = v3;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
  [v14 captureCuratedCollectionUserAction:action target:target value:value publisherId:0 following:0 collectionId:collectionId collectionCategory:0 collectionCurrentlySaved:collectionCurrentlySaved verticalIndex:verticalIndex horizontalIndex:horizontalIndex placeCardType:v9 possibleActions:possibleActions impossibleActions:impossibleActions modules:v12];
}

- (void)cleanUp
{
  self->_event.unsigned int action = 0;
  value = self->_event.value;
  self->_event.value = 0;

  collectionId = self->_event.collectionId;
  self->_event.collectionId = 0;

  collectionCurrentlySaved = self->_event.collectionCurrentlySaved;
  self->_event.collectionCurrentlySaved = 0;

  horizontalIndex = self->_event.horizontalIndex;
  self->_event.horizontalIndex = 0;
}

- (void).cxx_destruct
{
  verticalIndex = self->_event.verticalIndex;
}

@end