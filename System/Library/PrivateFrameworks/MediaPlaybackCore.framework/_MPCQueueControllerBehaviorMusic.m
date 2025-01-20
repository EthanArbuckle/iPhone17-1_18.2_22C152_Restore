@interface _MPCQueueControllerBehaviorMusic
+ (BOOL)canLoadQueue:(id)a3 reason:(id *)a4;
+ (BOOL)supportsSecureCoding;
+ (id)makeExtensionWithInvalidatable:(id)a3;
- (BOOL)_allDataSourcesSupportInsertionPositionLast;
- (BOOL)allowsQueueModifications;
- (BOOL)areRepresentationsAvailableForCatalog:(id)a3;
- (BOOL)autoPlayEnabled;
- (BOOL)autoPlayIsTriggered;
- (BOOL)canJumpToContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)canNextItemFromContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)canPreviousItemFromContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)canRemoveContentItemID:(id)a3 reason:(id *)a4;
- (BOOL)canUserChangeRepeatTypeWithReason:(id *)a3;
- (BOOL)canUserChangeShuffleModeWithReason:(id *)a3;
- (BOOL)canUserEnableAutoPlayWithReason:(id *)a3;
- (BOOL)containsRestorableContent;
- (BOOL)hasUserMutations;
- (BOOL)isAutoPlayContentItemID:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isExportableSessionType:(id)a3 forContentItemID:(id)a4 extension:(id)a5 reason:(id *)a6;
- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4;
- (BOOL)isSupportedInsertionPosition:(int64_t)a3 fromContentItemID:(id)a4 reason:(id *)a5;
- (BOOL)itemExistsForContentItemID:(id)a3;
- (MPCQueueControllerBehaviorHost)host;
- (MPCQueueControllerBehaviorMusicDelegate)musicBehaviorDelegate;
- (MPSectionedIdentifierList)autoPlayIdentifierList;
- (MPSectionedIdentifierListPosition)autoPlayEndPosition;
- (MPShuffleableSectionedIdentifierList)identifierList;
- (MRGroupSession)activeGroupSession;
- (NSMutableDictionary)dataSources;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)latestUpNextSectionID;
- (NSString)playNowInsertionContentItemID;
- (NSString)sessionID;
- (_MPCQueueControllerBehaviorMusic)initWithCoder:(id)a3;
- (_MPCQueueControllerBehaviorMusic)initWithSessionID:(id)a3;
- (id)_accountForAutoPlay;
- (id)_autoPlayUpNextSectionIdentifierForItem:(id)a3;
- (id)_componentsForContentItemID:(id)a3;
- (id)_idenitiferListForPosition:(int64_t)a3 afterContentItemID:(id)a4 existingUpNextSectionID:(id)a5 createdUpNextSectionID:(id)a6;
- (id)_identifierListForSection:(id)a3;
- (id)_itemForComponents:(id)a3;
- (id)_itemForContentItemID:(id)a3;
- (id)_stateDictionaryIncludingQueue:(BOOL)a3;
- (id)_tailInsertionComponentsForUpNextSectionID:(id)a3;
- (id)_upNextSectionIdentifierForItem:(id)a3;
- (id)_upNextSectionIdentifierForItem:(id)a3 shouldLookInBaseList:(BOOL)a4;
- (id)contentItemIDEnumeratorStartingAfterContentItemID:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5;
- (id)contentItemIDWithoutRepeatIteration:(id)a3;
- (id)copyContentItemID:(id)a3 repeatIteration:(int64_t)a4;
- (id)debugDescriptionForItem:(id)a3 inSection:(id)a4;
- (id)debugDescriptionForSection:(id)a3;
- (id)existingRepresentationForArtworkCatalog:(id)a3;
- (id)finalizeStateRestorationWithTargetContentItemID:(id)a3 completion:(id)a4;
- (id)lastSectionContentItemIDForTargetContentItemID:(id)a3;
- (id)performLoadCommand:(id)a3 completion:(id)a4;
- (id)queueReferencesWithMaxCount:(int64_t)a3;
- (id)tailInsertionContentItemIDForTargetContentItemID:(id)a3;
- (id)visualIdenticalityIdentifierForCatalog:(id)a3;
- (int64_t)_autoplayMode;
- (int64_t)_countOfItemsWithinSection:(id)a3 maxCount:(int64_t)a4;
- (int64_t)_privateListeningSourceForContext:(id)a3;
- (int64_t)autoPlayState;
- (int64_t)displayItemCount;
- (int64_t)playbackPositionRestorationPolicy;
- (int64_t)preferredUpcomingItemCount;
- (int64_t)repeatType;
- (int64_t)shuffleType;
- (int64_t)state;
- (unint64_t)_playbackContextOptions;
- (void)_addAutoPlayPlaybackContext:(id)a3 atPosition:(int64_t)a4 afterContentItemID:(id)a5 sectionIdentifier:(id)a6 actions:(unint64_t)a7 completion:(id)a8;
- (void)_addPlaybackContext:(id)a3 atPosition:(int64_t)a4 afterContentItemID:(id)a5 sectionIdentifier:(id)a6 actions:(unint64_t)a7 completion:(id)a8;
- (void)_emitEventsForAddingPlaybackContext:(id)a3 sectionIdentifier:(id)a4;
- (void)_emitEventsForPlaybackBehaviorChangeIfNeeded;
- (void)_evaluateLoadingDataSourceItemThresholds;
- (void)_initializeWithCoder:(id)a3;
- (void)_playNowIfPossible:(id)a3 completion:(id)a4;
- (void)_qfa_performInsertPlaybackContext:(id)a3 atPosition:(int64_t)a4 afterContentItemID:(id)a5 sectionIdentifier:(id)a6 actions:(unint64_t)a7 completion:(id)a8;
- (void)_setRepeatType:(int64_t)a3;
- (void)_setShuffleType:(int64_t)a3 startingContentItemID:(id)a4 randomSource:(id)a5;
- (void)_transitionToAutoPlayState:(int64_t)a3;
- (void)_updateGroupSessionParticipants:(id)a3 localParticipant:(id)a4;
- (void)activeItemFlagsDidChange:(unsigned __int16)a3;
- (void)canReuseQueue:(id)a3 completion:(id)a4;
- (void)clearAllItemsAfterContentItemID:(id)a3;
- (void)connectToHost:(id)a3;
- (void)currentItemDidChangeFromContentItemID:(id)a3 toContentItemID:(id)a4;
- (void)dealloc;
- (void)didConnectToHost:(id)a3;
- (void)didDequeueShuffledItemsInSectionedIdentifierList:(id)a3;
- (void)didReachEndOfQueueWithReason:(id)a3;
- (void)disconnectFromHost:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)findFirstContentItemIDForItemIntersectingIdentifierSet:(id)a3 completion:(id)a4;
- (void)getSharedQueueTracklistWithStartingContentItemID:(id)a3 completion:(id)a4;
- (void)groupSession:(id)a3 didInvalidateWithError:(id)a4;
- (void)groupSession:(id)a3 didUpdateParticipants:(id)a4;
- (void)groupSessionDidConnect:(id)a3;
- (void)loadAdditionalUpcomingItems:(int64_t)a3 completion:(id)a4;
- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4;
- (void)moveContentItemID:(id)a3 afterContentItemID:(id)a4 completion:(id)a5;
- (void)moveContentItemID:(id)a3 beforeContentItemID:(id)a4 completion:(id)a5;
- (void)performInsertCommand:(id)a3 targetContentItemID:(id)a4 completion:(id)a5;
- (void)prepareForCreateStationAfterContentItemID:(id)a3;
- (void)removeContentItemID:(id)a3 completion:(id)a4;
- (void)reshuffleWithTargetContentItemID:(id)a3 completion:(id)a4;
- (void)restoreWithSharedCoder:(id)a3 block:(id)a4;
- (void)sectionedIdentifierList:(id)a3 dataSourceDidAddItems:(id)a4 toSection:(id)a5;
- (void)sectionedIdentifierList:(id)a3 dataSourceDidChangeItems:(id)a4 inSection:(id)a5;
- (void)sectionedIdentifierList:(id)a3 dataSourceDidEndTransactionForSection:(id)a4;
- (void)sectionedIdentifierList:(id)a3 dataSourceDidMoveItems:(id)a4 inSection:(id)a5;
- (void)sectionedIdentifierList:(id)a3 dataSourceDidRemoveItems:(id)a4 fromSection:(id)a5;
- (void)sectionedIdentifierList:(id)a3 dataSourceDidUpdateItems:(id)a4 inSection:(id)a5;
- (void)sectionedIdentifierList:(id)a3 dataSourceDidUpdateSection:(id)a4;
- (void)setActiveGroupSession:(id)a3;
- (void)setAllowsQueueModifications:(BOOL)a3;
- (void)setAutoPlayEnabled:(BOOL)a3 targetContentItemID:(id)a4 completion:(id)a5;
- (void)setAutoPlayEndPosition:(id)a3;
- (void)setAutoPlayIdentifierList:(id)a3;
- (void)setAutoPlayIsTriggered:(BOOL)a3;
- (void)setAutoPlayState:(int64_t)a3;
- (void)setDataSources:(id)a3;
- (void)setHostingSharedSessionID:(id)a3 reason:(id)a4;
- (void)setIdentifierList:(id)a3;
- (void)setLatestUpNextSectionID:(id)a3;
- (void)setMusicBehaviorDelegate:(id)a3;
- (void)setPlayNowInsertionContentItemID:(id)a3;
- (void)setRepeatType:(int64_t)a3 completion:(id)a4;
- (void)setShuffleType:(int64_t)a3 targetContentItemID:(id)a4 completion:(id)a5;
@end

@implementation _MPCQueueControllerBehaviorMusic

- (BOOL)canPreviousItemFromContentItemID:(id)a3 reason:(id *)a4
{
  if (a3)
  {
    v6 = -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:");
    if ([v6 type] == 2)
    {
      if (a4)
      {
        v7 = @"section placeholder";
LABEL_10:
        *a4 = v7;
      }
    }
    else if ([v6 type] == 3)
    {
      if (a4)
      {
        v7 = @"tail placeholder";
        goto LABEL_10;
      }
    }
    else if (v6)
    {
      dataSources = self->_dataSources;
      v11 = [v6 sectionID];
      v12 = [(NSMutableDictionary *)dataSources objectForKeyedSubscript:v11];

      if (v12)
      {
        v13 = [v6 itemID];
        char v8 = [v12 canSkipItem:v13 reason:a4];
      }
      else
      {
        char v8 = 0;
        if (a4) {
          *a4 = @"sectionID not in dataSource";
        }
      }

      goto LABEL_12;
    }
    char v8 = 1;
LABEL_12:

    return v8;
  }
  char v8 = 0;
  if (a4) {
    *a4 = @"nil contentItemID";
  }
  return v8;
}

- (id)contentItemIDWithoutRepeatIteration:(id)a3
{
  v3 = MPCQueueControllerBehaviorMusicIdentifierComponentsFromContentItemID(a3);
  if ([v3 repeatIteration])
  {
    uint64_t v4 = [v3 copyWithRepeatIteration:0];

    v3 = (void *)v4;
  }
  v5 = [v3 contentItemID];

  return v5;
}

- (id)tailInsertionContentItemIDForTargetContentItemID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v6 = 0;
    goto LABEL_21;
  }
  v5 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v4];
  if (![v5 type])
  {
    v7 = [(_MPCQueueControllerBehaviorMusic *)self _upNextSectionIdentifierForItem:v5];
    char v8 = [(_MPCQueueControllerBehaviorMusic *)self _tailInsertionComponentsForUpNextSectionID:v7];
    id v9 = v4;
    id v10 = v9;
    if ([v5 repeatIteration])
    {
      v11 = (void *)[v5 copyWithRepeatIteration:0];
      id v10 = [v11 contentItemID];
    }
    id v12 = [v8 contentItemID];
    if (v10 == v12)
    {
    }
    else
    {
      int v13 = [v10 isEqual:v12];

      if (!v13) {
        goto LABEL_13;
      }
    }
    uint64_t v14 = [v5 repeatIteration];

    if (!v14) {
      goto LABEL_14;
    }
    id v12 = v8;
    char v8 = objc_msgSend(v8, "copyWithRepeatIteration:", objc_msgSend(v5, "repeatIteration"));
LABEL_13:

LABEL_14:
    id v15 = [v8 contentItemID];
    v6 = v15;
    if (v15 == v9)
    {
    }
    else
    {
      int v16 = [v15 isEqual:v9];

      if (!v16) {
        goto LABEL_19;
      }
    }

    v6 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v6 = 0;
LABEL_20:

LABEL_21:

  return v6;
}

- (id)_upNextSectionIdentifierForItem:(id)a3 shouldLookInBaseList:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 type])
  {
    char v8 = [MEMORY[0x263F08690] currentHandler];
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_MPCQueueControllerBehaviorMusic.m", 3476, @"unsupported components type: %d", objc_msgSend(v6, "type"));

    if (v4) {
      goto LABEL_3;
    }
  }
  else if (v4)
  {
LABEL_3:
    v7 = [(MPShuffleableSectionedIdentifierList *)self->_identifierList orderedSectionIdentifiers];
    goto LABEL_6;
  }
  v7 = 0;
LABEL_6:
  uint64_t v9 = [v7 count];
  if (v9 - 1 < 0)
  {
    int v12 = 0;
LABEL_12:
    id v11 = 0;
  }
  else
  {
    uint64_t v10 = v9;
    while (1)
    {
      id v11 = [v7 objectAtIndexedSubscript:--v10];
      int v12 = [v11 hasPrefix:@"UPNXT-"];
      if (v12) {
        break;
      }

      if (v10 <= 0) {
        goto LABEL_12;
      }
    }
  }
  int v13 = [(MPSectionedIdentifierList *)self->_autoPlayIdentifierList orderedSectionIdentifiers];

  uint64_t v14 = [v13 count];
  if (v14 - 1 < 0)
  {
LABEL_17:
    int v17 = 0;
    if (!v11) {
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v15 = v14;
    while (1)
    {
      int v16 = [v13 objectAtIndexedSubscript:--v15];
      if ([v16 hasPrefix:@"UPNXT-"]) {
        break;
      }

      if (v15 <= 0) {
        goto LABEL_17;
      }
    }

    int v12 = 0;
    int v17 = 1;
    id v11 = v16;
    if (!v16)
    {
LABEL_23:
      id v23 = 0;
      goto LABEL_56;
    }
  }
  if (!v6)
  {
    id v23 = v11;
    goto LABEL_56;
  }
  v18 = (void *)MEMORY[0x263F12210];
  v19 = [v6 itemID];
  v20 = [v6 sectionID];
  v63 = [v18 positionForItem:v19 inSection:v20];

  identifierList = self->_identifierList;
  v22 = [v6 sectionID];
  LODWORD(identifierList) = [(MPShuffleableSectionedIdentifierList *)identifierList hasSection:v22];

  if (identifierList)
  {
    if (v17)
    {
      id v23 = v11;
      goto LABEL_55;
    }
    v24 = [(MPShuffleableSectionedIdentifierList *)self->_identifierList enumeratorWithOptions:25 startPosition:v63 endPosition:0];
    uint64_t v25 = [v24 nextObject];
    if (v25)
    {
      v26 = (void *)v25;
      do
      {
        switch([v26 entryType])
        {
          case 0:
            v27 = [MEMORY[0x263F08690] currentHandler];
            v28 = v27;
            SEL v29 = a2;
            v30 = self;
            uint64_t v31 = 3546;
            v32 = @"Encountered unexpected Unknown entry while reverse enumerating";
            goto LABEL_36;
          case 1:
            goto LABEL_65;
          case 2:
            v33 = [v26 trackingEntryResult];
            id v34 = [v33 sectionIdentifier];
            if (v11 == v34)
            {

LABEL_65:
              id v23 = v11;
              goto LABEL_68;
            }
            v35 = v34;
            char v36 = [v11 isEqual:v34];

            if (v36) {
              goto LABEL_65;
            }
            break;
          case 4:
            v37 = [v26 trackingEntryResult];
            id v38 = [v37 sectionIdentifier];
            if (v11 == v38)
            {

LABEL_67:
              id v23 = 0;
LABEL_68:

              goto LABEL_55;
            }
            v39 = v38;
            char v40 = [v11 isEqual:v38];

            if (v40) {
              goto LABEL_67;
            }
            break;
          case 5:
            v27 = [MEMORY[0x263F08690] currentHandler];
            v28 = v27;
            SEL v29 = a2;
            v30 = self;
            uint64_t v31 = 3543;
            v32 = @"Encountered unexpected End entry while reverse enumerating";
LABEL_36:
            [v27 handleFailureInMethod:v29 object:v30 file:@"_MPCQueueControllerBehaviorMusic.m" lineNumber:v31 description:v32];

            break;
          default:
            break;
        }
        uint64_t v41 = [v24 nextObject];

        v26 = (void *)v41;
      }
      while (v41);
    }
  }
  autoPlayIdentifierList = self->_autoPlayIdentifierList;
  v43 = [v6 sectionID];
  LODWORD(autoPlayIdentifierList) = [(MPSectionedIdentifierList *)autoPlayIdentifierList hasSection:v43];

  if ((v12 | autoPlayIdentifierList ^ 1))
  {
LABEL_54:
    id v23 = 0;
    goto LABEL_55;
  }
  v44 = [(MPSectionedIdentifierList *)self->_autoPlayIdentifierList enumeratorWithOptions:25 startPosition:v63 endPosition:0];
  uint64_t v45 = [v44 nextObject];
  if (!v45)
  {
LABEL_53:

    goto LABEL_54;
  }
  v46 = (void *)v45;
  while (2)
  {
    switch([v46 entryType])
    {
      case 0:
        v47 = [MEMORY[0x263F08690] currentHandler];
        v48 = v47;
        SEL v49 = a2;
        v50 = self;
        uint64_t v51 = 3583;
        v52 = @"Encountered unexpected Unknown entry while reverse enumerating";
        goto LABEL_51;
      case 1:
        goto LABEL_60;
      case 2:
        v53 = [v46 trackingEntryResult];
        id v54 = [v53 sectionIdentifier];
        if (v11 == v54)
        {

LABEL_60:
          id v23 = v11;
          goto LABEL_63;
        }
        v55 = v54;
        char v56 = [v11 isEqual:v54];

        if (v56) {
          goto LABEL_60;
        }
        goto LABEL_52;
      case 4:
        v57 = [v46 trackingEntryResult];
        id v58 = [v57 sectionIdentifier];
        if (v11 != v58)
        {
          v59 = v58;
          char v60 = [v11 isEqual:v58];

          if (v60) {
            goto LABEL_62;
          }
LABEL_52:
          uint64_t v61 = [v44 nextObject];

          v46 = (void *)v61;
          if (!v61) {
            goto LABEL_53;
          }
          continue;
        }

LABEL_62:
        id v23 = 0;
LABEL_63:

LABEL_55:
LABEL_56:

        return v23;
      case 5:
        v47 = [MEMORY[0x263F08690] currentHandler];
        v48 = v47;
        SEL v49 = a2;
        v50 = self;
        uint64_t v51 = 3580;
        v52 = @"Encountered unexpected End entry while reverse enumerating";
LABEL_51:
        [v47 handleFailureInMethod:v49 object:v50 file:@"_MPCQueueControllerBehaviorMusic.m" lineNumber:v51 description:v52];

        goto LABEL_52;
      default:
        goto LABEL_52;
    }
  }
}

- (id)_upNextSectionIdentifierForItem:(id)a3
{
  return [(_MPCQueueControllerBehaviorMusic *)self _upNextSectionIdentifierForItem:a3 shouldLookInBaseList:1];
}

- (id)_tailInsertionComponentsForUpNextSectionID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v4];
    id v6 = [MEMORY[0x263F12210] positionForTailOfSection:v4];
    v7 = [v5 enumeratorWithOptions:9 startPosition:v6 endPosition:0];

    char v8 = 0;
    while (1)
    {
      uint64_t v9 = v8;
      char v8 = [v7 nextObject];

      if (!v8) {
        break;
      }
      if ([v8 entryType] == 3)
      {
        uint64_t v10 = [v8 itemResult];
        id v11 = [v10 sectionIdentifier];
        int v12 = [v8 itemResult];
        int v13 = [v12 itemIdentifier];
        uint64_t v14 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v11 itemID:v13];

        goto LABEL_8;
      }
    }
    uint64_t v14 = 0;
LABEL_8:
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)canNextItemFromContentItemID:(id)a3 reason:(id *)a4
{
  if (a3)
  {
    id v6 = -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:");
    if ([v6 type] == 2)
    {
      if (a4)
      {
        char v7 = 0;
        char v8 = @"section placeholder";
LABEL_10:
        *a4 = v8;
LABEL_19:

        return v7;
      }
    }
    else
    {
      if ([v6 type] != 3)
      {
        if (v6)
        {
          dataSources = self->_dataSources;
          uint64_t v10 = [v6 sectionID];
          id v11 = [(NSMutableDictionary *)dataSources objectForKeyedSubscript:v10];

          if (v11)
          {
            int v12 = [v6 itemID];
            char v7 = [v11 canSkipItem:v12 reason:a4];
          }
          else
          {
            char v7 = 0;
            if (a4) {
              *a4 = @"sectionID not in dataSource";
            }
          }
        }
        else
        {
          char v7 = 1;
        }
        goto LABEL_19;
      }
      if (a4)
      {
        char v7 = 0;
        char v8 = @"tail placeholder";
        goto LABEL_10;
      }
    }
    char v7 = 0;
    goto LABEL_19;
  }
  char v7 = 0;
  if (a4) {
    *a4 = @"nil contentItemID";
  }
  return v7;
}

- (id)_componentsForContentItemID:(id)a3
{
  id v5 = a3;
  if (![v5 length])
  {
    uint64_t v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_MPCQueueControllerBehaviorMusic.m", 3193, @"Invalid parameter not satisfying: %@", @"contentItemID.length > 0" object file lineNumber description];
  }
  id v6 = MPCQueueControllerBehaviorMusicIdentifierComponentsFromContentItemID(v5);
  autoPlayIdentifierList = self->_autoPlayIdentifierList;
  char v8 = [v6 sectionID];
  int v9 = [(MPSectionedIdentifierList *)autoPlayIdentifierList hasSection:v8];

  if ([v6 type] == 1)
  {
    uint64_t v10 = [v6 itemID];
    unsigned int v11 = [v10 isEqualToString:@"_PLACEHOLDER_AUTOPLAY_"];
  }
  else
  {
    unsigned int v11 = 0;
  }
  int v12 = (void *)[v6 copyWithBehaviorFlags:v9 | v11];

  return v12;
}

- (id)contentItemIDEnumeratorStartingAfterContentItemID:(id)a3 mode:(int64_t)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v9 = a3;
  uint64_t v10 = v9;
  if (a4 == 3)
  {
    if (self->_repeatType == 1) {
      uint64_t v11 = 5;
    }
    else {
      uint64_t v11 = 1;
    }
  }
  else
  {
    uint64_t v11 = 1;
  }
  uint64_t v12 = v5 & 1;
  if ([v9 length])
  {
    int v13 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v10];
    uint64_t v14 = [v13 type];
    if (!v12 && a4 == 1 && v14)
    {
      uint64_t v15 = [MEMORY[0x263EFFA68] objectEnumerator];
      goto LABEL_29;
    }
    int v17 = [v13 sectionID];
    v18 = [v13 itemID];
    switch([v13 type])
    {
      case 0:
        int v16 = [MEMORY[0x263F12210] positionForItem:v18 inSection:v17];
        goto LABEL_26;
      case 1:
        int v16 = [MEMORY[0x263F12210] positionForItem:v18 inSection:v17];
        v19 = [(NSMutableDictionary *)self->_dataSources objectForKeyedSubscript:v17];
        v20 = v19;
        if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 2 || !v19) {
          goto LABEL_25;
        }
        if ([v19 shouldUsePlaceholderForItem:v18 inSection:v17])
        {
          uint64_t v15 = [MEMORY[0x263EFFA68] objectEnumerator];

          goto LABEL_28;
        }
        uint64_t v11 = 5;
LABEL_25:

LABEL_26:
        break;
      case 2:
        int v16 = [MEMORY[0x263F12210] positionForHeadOfSection:v17];
        uint64_t v11 = 5;
        goto LABEL_26;
      case 3:
        v30 = v17;
        uint64_t v31 = v18;
        v21 = [v13 deferredNextContentItemID];

        if (!v21)
        {
          SEL v29 = [MEMORY[0x263F08690] currentHandler];
          objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_MPCQueueControllerBehaviorMusic.m", 668, @"Invalid identifier components (EndOfQueuePlaceHolder must have deferredNextContentItemID: %@"), v10;
        }
        v22 = [v13 deferredNextContentItemID];
        id v23 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v22];

        v24 = (void *)MEMORY[0x263F12210];
        uint64_t v25 = [v23 itemID];
        v26 = [v23 sectionID];
        int v16 = [v24 positionForItem:v25 inSection:v26];

        int v17 = v30;
        v18 = v31;
        goto LABEL_26;
      default:
        int v16 = 0;
        goto LABEL_26;
    }
  }
  else
  {
    int v16 = 0;
    int v13 = 0;
  }
  v27 = +[_MPCQueueControllerEnumerator enumeratorWithMusicBehavior:self mode:a4 options:v11 | (8 * v12) startPosition:v16 endPosition:0];
  uint64_t v15 = [[_MPCQueueControllerBehaviorMusicEnumerator alloc] initWithQueueEnumerator:v27 startingComponents:v13];

LABEL_28:
LABEL_29:

  return v15;
}

- (MPSectionedIdentifierList)autoPlayIdentifierList
{
  return self->_autoPlayIdentifierList;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)sessionID
{
  return (NSString *)[(MPShuffleableSectionedIdentifierList *)self->_identifierList identifier];
}

- (int64_t)playbackPositionRestorationPolicy
{
  return 1;
}

- (void)currentItemDidChangeFromContentItemID:(id)a3 toContentItemID:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  objc_storeStrong((id *)&self->_playNowInsertionContentItemID, a4);
  if (v6)
  {
    char v7 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v6];
    dataSources = self->_dataSources;
    id v9 = [v7 sectionID];
    uint64_t v10 = [(NSMutableDictionary *)dataSources objectForKeyedSubscript:v9];

    if (v19)
    {
      uint64_t v11 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v19];
      uint64_t v12 = [v11 sectionID];
      int v13 = [v7 sectionID];
      char v14 = [v12 isEqualToString:v13];

      if ((v14 & 1) == 0)
      {
        uint64_t v15 = self->_dataSources;
        int v16 = [v11 sectionID];
        int v17 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v16];

        [v17 itemDidBeginPlayback:0];
      }
    }
    if (![v7 type])
    {
      v18 = [(_MPCQueueControllerBehaviorMusic *)self _itemForContentItemID:v6];
      [v10 itemDidBeginPlayback:v18];
    }
  }
}

- (BOOL)allowsQueueModifications
{
  return [(MPShuffleableSectionedIdentifierList *)self->_identifierList automaticallyReversesNonDestructiveDataSourceEdits] ^ 1;
}

- (int64_t)shuffleType
{
  return self->_shuffleType;
}

- (BOOL)canUserEnableAutoPlayWithReason:(id *)a3
{
  int64_t autoPlayState = self->_autoPlayState;
  if ((unint64_t)(autoPlayState - 1) < 2)
  {
    if (a3)
    {
      id v4 = @"unsupported content";
      goto LABEL_10;
    }
    return 0;
  }
  if ((unint64_t)(autoPlayState - 4) < 2)
  {
    if (a3)
    {
      id v4 = @"waiting for items";
LABEL_10:
      BOOL result = 0;
      *a3 = v4;
      return result;
    }
    return 0;
  }
  if (!autoPlayState)
  {
    if (a3)
    {
      id v4 = @"unknown state";
      goto LABEL_10;
    }
    return 0;
  }
  return 1;
}

- (BOOL)isEmpty
{
  return [(_MPCQueueControllerBehaviorMusic *)self displayItemCount] == 0;
}

- (id)lastSectionContentItemIDForTargetContentItemID:(id)a3
{
  id v4 = [(_MPCQueueControllerBehaviorMusic *)self tailInsertionContentItemIDForTargetContentItemID:a3];
  if (v4)
  {
    char v5 = 0;
  }
  else
  {
    id v6 = [(MPShuffleableSectionedIdentifierList *)self->_identifierList orderedSectionIdentifiers];
    if ([v6 count] == 1)
    {
      char v7 = [v6 firstObject];
      char v8 = [(MPShuffleableSectionedIdentifierList *)self->_identifierList enumeratorWithOptions:24 startPosition:0 endPosition:0];
      id v9 = [v8 nextObject];
      char v5 = 0;
      if ([v9 entryType] == 3)
      {
        uint64_t v10 = [v9 itemResult];
        uint64_t v11 = [v10 itemIdentifier];

        uint64_t v12 = [v9 itemResult];
        int v13 = [v12 sectionIdentifier];

        char v14 = [(NSMutableDictionary *)self->_dataSources objectForKeyedSubscript:v7];
        uint64_t v15 = [v14 dataSource];
        int v16 = [v15 modelPlayEventForItem:v11 inSection:v13];

        if (([v16 itemType] & 0xFFFFFFFFFFFFFFFDLL) == 1)
        {
          +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v13 itemID:v11];
          int v17 = v19 = v11;
          char v5 = [v17 contentItemID];

          uint64_t v11 = v19;
        }
        else
        {
          char v5 = 0;
        }
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (id)_itemForComponents:(id)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5)
  {
    v43 = [MEMORY[0x263F08690] currentHandler];
    [v43 handleFailureInMethod:a2, self, @"_MPCQueueControllerBehaviorMusic.m", 3385, @"Invalid parameter not satisfying: %@", @"components != nil" object file lineNumber description];
  }
  id v6 = [(_MPCQueueControllerBehaviorMusic *)self host];
  char v7 = [v5 sectionID];
  char v8 = [v5 itemID];
  id v9 = [(NSMutableDictionary *)self->_dataSources objectForKeyedSubscript:v7];
  if ([v5 type] == 2)
  {
    uint64_t v10 = [v9 tailPlaceholderItem];
    uint64_t v11 = [v10 copy];

    if (!v11) {
      uint64_t v11 = objc_alloc_init(MEMORY[0x263F12150]);
    }
    uint64_t v12 = [v5 contentItemID];
    [v11 setContentItemID:v12 queueSectionID:v7 queueItemID:v8];

    int v13 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      char v14 = [v6 engineID];
      uint64_t v15 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
      *(_DWORD *)buf = 138543874;
      v53 = v14;
      __int16 v54 = 2114;
      v55 = v15;
      __int16 v56 = 2114;
      v57 = v11;
      int v16 = "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning placeholder [SectionPlaceholder] item=%{public}@";
LABEL_18:
      _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, v16, buf, 0x20u);

      goto LABEL_42;
    }
    goto LABEL_42;
  }
  if ([v5 type] != 3)
  {
    if ([v5 type] == 1)
    {
      uint64_t v11 = objc_alloc_init(MEMORY[0x263F12150]);
      id v19 = [v5 contentItemID];
      v20 = [v5 sectionID];
      v21 = [v5 itemID];
      [v11 setContentItemID:v19 queueSectionID:v20 queueItemID:v21];

      if ([v8 isEqualToString:@"_PLACEHOLDER_AUTOPLAY_"])
      {
        [v11 setAutoPlayItem:1];
        v51[0] = MEMORY[0x263EF8330];
        v51[1] = 3221225472;
        v51[2] = __55___MPCQueueControllerBehaviorMusic__itemForComponents___block_invoke;
        v51[3] = &unk_2643C5EC0;
        v51[4] = self;
        [v11 setArtworkCatalogBlock:v51];
      }
      int v13 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        char v14 = [v6 engineID];
        uint64_t v15 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        *(_DWORD *)buf = 138543874;
        v53 = v14;
        __int16 v54 = 2114;
        v55 = v15;
        __int16 v56 = 2114;
        v57 = v11;
        int v16 = "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning placeholder [ItemPlaceholder] item=%{public}@";
        goto LABEL_18;
      }
      goto LABEL_42;
    }
    int v13 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v7];
    int v22 = [v13 hasItem:v8 inSection:v7];
    int v23 = [v13 isDeletedItem:v8 inSection:v7];
    int v24 = v23;
    if (!v22 || (v23 & 1) != 0)
    {
      v50 = [v5 contentItemID];
      if (v13 == self->_identifierList)
      {
        v32 = @"base";
      }
      else if (v13 == self->_autoPlayIdentifierList)
      {
        v32 = @"auto";
      }
      else
      {
        v32 = @"null";
      }
      SEL v49 = [NSString stringWithFormat:@"[%@]=%@", v32, v13];
      v37 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v38)
        {
          [v6 engineID];
          v39 = v46 = v37;
          char v40 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
          *(_DWORD *)buf = 138544642;
          v53 = v39;
          __int16 v54 = 2114;
          v55 = v40;
          __int16 v56 = 2114;
          v57 = v50;
          __int16 v58 = 2114;
          v59 = v49;
          __int16 v60 = 1024;
          int v61 = v22;
          __int16 v62 = 1024;
          int v63 = v24;
          _os_log_impl(&dword_21BB87000, v46, OS_LOG_TYPE_ERROR, "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning nil [failed to create item] missingContentItemID=%{public}@ identifierList%{public}@ hasItem=%{BOOL}u isDeletedItem=%{BOOL}u", buf, 0x36u);

          v37 = v46;
        }
      }
      else if (v38)
      {
        v47 = [v6 engineID];
        uint64_t v41 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        *(_DWORD *)buf = 138544642;
        v53 = v47;
        __int16 v54 = 2114;
        v55 = v41;
        __int16 v56 = 2114;
        v57 = v50;
        __int16 v58 = 2114;
        v59 = v49;
        __int16 v60 = 1024;
        int v61 = v22;
        __int16 v62 = 1024;
        int v63 = v24;
        _os_log_impl(&dword_21BB87000, v37, OS_LOG_TYPE_ERROR, "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning nil [item missing datasource] missingContentItemID=%{public}@ identifierList%{public}@ hasItem=%{BOOL}u isDeletedItem=%{BOOL}u", buf, 0x36u);
      }
      uint64_t v11 = 0;
    }
    else
    {
      if (!v9)
      {
        v44 = [MEMORY[0x263F08690] currentHandler];
        [v44 handleFailureInMethod:a2, self, @"_MPCQueueControllerBehaviorMusic.m", 3428, @"Unexpected state: missing dataSourceState for section: %@ dataSources: %@", v7, self->_dataSources object file lineNumber description];
      }
      if (![v9 shouldUsePlaceholderForItem:v8 inSection:v7])
      {
        uint64_t v11 = [v9 itemForItem:v8 inSection:v7];
        v33 = [v5 contentItemID];
        [v11 setContentItemID:v33 queueSectionID:v7 queueItemID:v8];

        -[NSObject setAutoPlayItem:](v11, "setAutoPlayItem:", [v5 behaviorFlags] & 1);
        [v11 setIsHostingSharedSession:self->_activeHostingSharedSessionID != 0];
        id v34 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = [v6 engineID];
          char v36 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
          *(_DWORD *)buf = 138543874;
          v53 = v35;
          __int16 v54 = 2114;
          v55 = v36;
          __int16 v56 = 2114;
          v57 = v11;
          _os_log_impl(&dword_21BB87000, v34, OS_LOG_TYPE_DEFAULT, "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning item [] item=%{public}@", buf, 0x20u);
        }
        goto LABEL_41;
      }
      uint64_t v11 = objc_alloc_init(MEMORY[0x263F12150]);
      v50 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v7 itemID:v8];
      uint64_t v25 = (void *)[v50 copyAsPlaceholder];
      v26 = [v25 contentItemID];
      [v25 sectionID];
      uint64_t v45 = v6;
      v27 = v48 = v25;
      v28 = [v25 itemID];
      [v11 setContentItemID:v26 queueSectionID:v27 queueItemID:v28];

      id v6 = v45;
      [v11 setAutoPlayItem:v13 == self->_autoPlayIdentifierList];
      SEL v29 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = [v45 engineID];
        uint64_t v31 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        *(_DWORD *)buf = 138543874;
        v53 = v30;
        __int16 v54 = 2114;
        v55 = v31;
        __int16 v56 = 2114;
        v57 = v11;
        _os_log_impl(&dword_21BB87000, v29, OS_LOG_TYPE_DEFAULT, "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning placeholder [datasource specified placeholder] item=%{public}@", buf, 0x20u);
      }
    }
    id v34 = v50;
LABEL_41:

    goto LABEL_42;
  }
  int v17 = [v9 tailPlaceholderItem];
  uint64_t v11 = [v17 copy];

  if (!v11) {
    uint64_t v11 = objc_alloc_init(MEMORY[0x263F12150]);
  }
  v18 = [v5 contentItemID];
  [v11 setContentItemID:v18 queueSectionID:v7 queueItemID:v8];

  int v13 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    char v14 = [v6 engineID];
    uint64_t v15 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
    *(_DWORD *)buf = 138543874;
    v53 = v14;
    __int16 v54 = 2114;
    v55 = v15;
    __int16 v56 = 2114;
    v57 = v11;
    int v16 = "[ITFIT:%{public}@:%{public}@] _itemForComponents | returning placeholder [EndOfQueuePlaceholder] item=%{public}@";
    goto LABEL_18;
  }
LABEL_42:

  return v11;
}

- (NSMutableDictionary)dataSources
{
  return self->_dataSources;
}

- (BOOL)isExportableSessionType:(id)a3 forContentItemID:(id)a4 extension:(id)a5 reason:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v42 = [MEMORY[0x263F08690] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"_MPCQueueControllerBehaviorMusic.m", 998, @"unexpected extension: %@", v13 object file lineNumber description];
  }
  char v14 = [v13 infoForSessionType:v11];
  uint64_t v15 = v14;
  if (!v14)
  {
    if (!a6) {
      goto LABEL_17;
    }
    BOOL v21 = 0;
    int v22 = @"unknown sessionType [Music]";
LABEL_16:
    *a6 = v22;
    goto LABEL_47;
  }
  if (([v14 exportable] & 1) == 0)
  {
    if (a6)
    {
      v20 = [v15 exportableReason];
      goto LABEL_13;
    }
LABEL_17:
    BOOL v21 = 0;
    goto LABEL_47;
  }
  uint64_t v16 = [(MPShuffleableSectionedIdentifierList *)self->_identifierList itemCount];
  if (!v16)
  {
    if (!a6) {
      goto LABEL_17;
    }
    BOOL v21 = 0;
    int v22 = @"no items";
    goto LABEL_16;
  }
  uint64_t v17 = v16;
  v18 = [MEMORY[0x263F12178] standardUserDefaults];
  uint64_t v19 = [v18 maximumQueueHandOffSize];

  if ([(MPShuffleableSectionedIdentifierList *)self->_identifierList itemCount] <= v19)
  {
    int v23 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v12];
    if ([v23 isPlaceholder])
    {
      BOOL v21 = 0;
      if (a6) {
        *a6 = @"placeholder item";
      }
      goto LABEL_46;
    }
    int v24 = [v23 sectionID];
    uint64_t v25 = [v23 itemID];
    v26 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v24];
    if (([v26 hasItem:v25 inSection:v24] & 1) == 0)
    {
      if (a6)
      {
        BOOL v21 = 0;
        v27 = @"item does not exist";
        goto LABEL_27;
      }
LABEL_28:
      BOOL v21 = 0;
      goto LABEL_45;
    }
    if ([v26 isDeletedItem:v25 inSection:v24])
    {
      if (a6)
      {
        BOOL v21 = 0;
        v27 = @"item no longer exists";
LABEL_27:
        *a6 = v27;
LABEL_45:

LABEL_46:
        goto LABEL_47;
      }
      goto LABEL_28;
    }
    v47 = v26;
    v48 = [(NSMutableDictionary *)self->_dataSources objectForKeyedSubscript:v24];
    v28 = [v48 dataSource];
    char v29 = [v28 isExportableMediaTypeForItem:v25 inSection:v24];
    SEL v49 = v24;
    v30 = v25;
    char v31 = v29;

    if ((v31 & 1) == 0)
    {
      BOOL v38 = v48;
      BOOL v21 = 0;
      if (a6) {
        *a6 = @"item is non-exportable media type";
      }
      uint64_t v25 = v30;
      int v24 = v49;
      v26 = v47;
      goto LABEL_44;
    }
    v32 = [v48 dataSource];
    v43 = v30;
    v33 = [v32 accountIDForItem:v30 inSection:v49];

    uint64_t v45 = v33;
    MPCHashedDSIDFromDSID(v33);
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    v46 = [v15 account];
    id v35 = [v46 hashedDSID];
    int v24 = v49;
    v44 = v34;
    if (v35 == v34)
    {

      v26 = v47;
    }
    else
    {
      char v36 = v35;
      char v37 = [v35 isEqual:v34];

      v26 = v47;
      if ((v37 & 1) == 0)
      {
        BOOL v21 = 0;
        if (a6) {
          *a6 = @"sessionType account does not match item account";
        }
        uint64_t v25 = v43;
LABEL_43:

        BOOL v38 = v48;
LABEL_44:

        goto LABEL_45;
      }
    }
    uint64_t v57 = 0;
    __int16 v58 = &v57;
    uint64_t v59 = 0x2020000000;
    char v60 = 1;
    uint64_t v51 = 0;
    v52 = &v51;
    uint64_t v53 = 0x3032000000;
    __int16 v54 = __Block_byref_object_copy__5191;
    v55 = __Block_byref_object_dispose__5192;
    id v56 = 0;
    dataSources = self->_dataSources;
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __94___MPCQueueControllerBehaviorMusic_isExportableSessionType_forContentItemID_extension_reason___block_invoke;
    v50[3] = &unk_2643BFFD8;
    v50[4] = &v51;
    v50[5] = &v57;
    [(NSMutableDictionary *)dataSources enumerateKeysAndObjectsUsingBlock:v50];
    uint64_t v25 = v43;
    if (a6)
    {
      char v40 = (void *)v52[5];
      if (v40) {
        *a6 = v40;
      }
    }
    BOOL v21 = *((unsigned char *)v58 + 24) != 0;
    _Block_object_dispose(&v51, 8);

    _Block_object_dispose(&v57, 8);
    goto LABEL_43;
  }
  if (!a6) {
    goto LABEL_17;
  }
  v20 = objc_msgSend(NSString, "stringWithFormat:", @"items greater than maximum queue size (itemCount=%ld maximumSize=%ld"), v17, v19;
LABEL_13:
  BOOL v21 = 0;
  *a6 = v20;
LABEL_47:

  return v21;
}

- (id)_identifierListForSection:(id)a3
{
  id v4 = a3;
  p_identifierList = &self->_identifierList;
  if ([(MPShuffleableSectionedIdentifierList *)self->_identifierList hasSection:v4]) {
    goto LABEL_4;
  }
  autoPlayIdentifierList = self->_autoPlayIdentifierList;
  p_autoPlayIdentifierList = &self->_autoPlayIdentifierList;
  if ([(MPSectionedIdentifierList *)autoPlayIdentifierList hasSection:v4])
  {
    p_identifierList = p_autoPlayIdentifierList;
LABEL_4:
    char v8 = *p_identifierList;
    goto LABEL_6;
  }
  char v8 = 0;
LABEL_6:

  return v8;
}

- (int64_t)displayItemCount
{
  int64_t v3 = [(MPShuffleableSectionedIdentifierList *)self->_identifierList itemCount];
  if ([(_MPCQueueControllerBehaviorMusic *)self autoPlayEnabled]
    && ![(_MPCQueueControllerBehaviorMusic *)self repeatType])
  {
    v3 += [(MPSectionedIdentifierList *)self->_autoPlayIdentifierList itemCount];
  }
  return v3;
}

- (BOOL)autoPlayEnabled
{
  return (self->_autoPlayState < 0xAuLL) & (0x2D4u >> self->_autoPlayState);
}

- (MPSectionedIdentifierListPosition)autoPlayEndPosition
{
  return self->_autoPlayEndPosition;
}

- (int64_t)repeatType
{
  return self->_repeatType;
}

- (NSString)latestUpNextSectionID
{
  return self->_latestUpNextSectionID;
}

- (MPShuffleableSectionedIdentifierList)identifierList
{
  return self->_identifierList;
}

- (id)_itemForContentItemID:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_MPCQueueControllerBehaviorMusic *)self host];
  id v6 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v4];
  char v7 = [v6 sectionID];
  char v8 = [v6 itemID];
  id v9 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v7];
  if (v9)
  {
  }
  else if (([v8 isEqualToString:@"_PLACEHOLDER_AUTOPLAY_"] & 1) == 0)
  {
    id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = [v5 engineID];
      int v23 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
      *(_DWORD *)buf = 138544130;
      v27 = v22;
      __int16 v28 = 2114;
      char v29 = v23;
      __int16 v30 = 2114;
      id v31 = v4;
      __int16 v32 = 2114;
      id v33 = v7;
      _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[ITFIT:%{public}@:%{public}@] _itemForContentItemID | returning nil [unknown section ID] contentItemID=%{public}@ sectionID=%{public}@", buf, 0x2Au);
    }
    uint64_t v17 = 0;
    goto LABEL_16;
  }
  uint64_t v10 = [(_MPCQueueControllerBehaviorMusic *)self _itemForComponents:v6];
  id v11 = v10;
  if (!v10)
  {
LABEL_8:
    id v11 = v11;
    uint64_t v17 = v11;
    goto LABEL_16;
  }
  id v12 = [v10 contentItemID];
  id v13 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v12];

  char v14 = [v13 sectionID];
  uint64_t v25 = v8;
  if ([v14 isEqualToString:v7])
  {
    uint64_t v15 = [v13 itemID];
    char v16 = [v15 isEqualToString:v8];

    if (v16)
    {

      char v8 = v25;
      goto LABEL_8;
    }
  }
  else
  {
  }
  v18 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
  {
    uint64_t v19 = [v5 engineID];
    v20 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
    BOOL v21 = [v11 contentItemID];
    *(_DWORD *)buf = 138544130;
    v27 = v19;
    __int16 v28 = 2114;
    char v29 = v20;
    __int16 v30 = 2114;
    id v31 = v21;
    __int16 v32 = 2114;
    id v33 = v4;
    _os_log_impl(&dword_21BB87000, v18, OS_LOG_TYPE_FAULT, "[ITFIT:%{public}@:%{public}@] _itemForContentItemID | faulting [content item ID mismatch] item.contentItemID=%{public}@ - contentItemID=%{public}@", buf, 0x2Au);
  }
  uint64_t v17 = 0;
  char v8 = v25;
LABEL_16:

  return v17;
}

- (MPCQueueControllerBehaviorHost)host
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_host);

  return (MPCQueueControllerBehaviorHost *)WeakRetained;
}

- (void)setMusicBehaviorDelegate:(id)a3
{
}

- (void)didConnectToHost:(id)a3
{
  lastEmittedBehaviorMetadata = self->_lastEmittedBehaviorMetadata;
  self->_lastEmittedBehaviorMetadata = 0;

  [(_MPCQueueControllerBehaviorMusic *)self _emitEventsForPlaybackBehaviorChangeIfNeeded];
  dataSources = self->_dataSources;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53___MPCQueueControllerBehaviorMusic_didConnectToHost___block_invoke;
  v6[3] = &unk_2643BFE98;
  v6[4] = self;
  [(NSMutableDictionary *)dataSources enumerateKeysAndObjectsUsingBlock:v6];
}

- (void)_emitEventsForPlaybackBehaviorChangeIfNeeded
{
  v20[3] = *MEMORY[0x263EF8340];
  v19[0] = @"repeat-type";
  int64_t v3 = [NSNumber numberWithInteger:self->_repeatType];
  v20[0] = v3;
  v19[1] = @"shuffle-type";
  id v4 = [NSNumber numberWithInteger:self->_shuffleType];
  v20[1] = v4;
  v19[2] = @"autoplay-mode";
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:", -[_MPCQueueControllerBehaviorMusic _autoplayMode](self, "_autoplayMode"));
  v20[2] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];

  char v7 = self->_lastEmittedBehaviorMetadata;
  lastEmittedBehaviorMetadata = v6;
  if (v7 == v6)
  {
LABEL_8:

    goto LABEL_9;
  }
  id v9 = v7;
  char v10 = [(NSDictionary *)v7 isEqual:v6];

  if ((v10 & 1) == 0)
  {
    id v11 = [(_MPCQueueControllerBehaviorMusic *)self host];
    id v12 = [v11 eventStream];
    v17[0] = @"session-id";
    id v13 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
    char v14 = v13;
    if (!v13)
    {
      char v14 = [MEMORY[0x263EFF9D0] null];
    }
    v17[1] = @"playback-behavior-metadata";
    v18[0] = v14;
    v18[1] = v6;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    [v12 emitEventType:@"playback-behavior-changed" payload:v15];

    if (!v13) {
    char v16 = v6;
    }
    lastEmittedBehaviorMetadata = self->_lastEmittedBehaviorMetadata;
    self->_lastEmittedBehaviorMetadata = v16;
    goto LABEL_8;
  }
LABEL_9:
}

- (int64_t)_autoplayMode
{
  unint64_t autoPlayState = self->_autoPlayState;
  if (autoPlayState > 9) {
    return 1;
  }
  else {
    return qword_21BEF17D8[autoPlayState];
  }
}

- (id)finalizeStateRestorationWithTargetContentItemID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = [(_MPCQueueControllerBehaviorMusic *)self host];
  dispatch_group_t v9 = dispatch_group_create();
  char v10 = [MEMORY[0x263EFF980] array];
  if (v6)
  {
    id v11 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v6];
  }
  else
  {
    id v11 = 0;
  }
  id v12 = (void *)[(NSMutableDictionary *)self->_dataSources copy];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke;
  v23[3] = &unk_2643BFF88;
  id v24 = v8;
  uint64_t v25 = self;
  id v26 = v11;
  id v13 = v10;
  id v27 = v13;
  dispatch_group_t v28 = v9;
  char v14 = v9;
  id v15 = v11;
  id v16 = v8;
  [v12 enumerateKeysAndObjectsUsingBlock:v23];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __95___MPCQueueControllerBehaviorMusic_finalizeStateRestorationWithTargetContentItemID_completion___block_invoke_273;
  v20[3] = &unk_2643C5620;
  void v20[4] = self;
  id v21 = v13;
  id v22 = v7;
  id v17 = v7;
  id v18 = v13;
  dispatch_group_notify(v14, MEMORY[0x263EF83A0], v20);

  return 0;
}

- (BOOL)containsRestorableContent
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (![(NSMutableDictionary *)self->_dataSources count]
    || ![(MPShuffleableSectionedIdentifierList *)self->_identifierList itemCount])
  {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int64_t v3 = [(NSMutableDictionary *)self->_dataSources allValues];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = [*(id *)(*((void *)&v12 + 1) + 8 * i) dataSource];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          BOOL v10 = 0;
          goto LABEL_14;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_14:

  return v10;
}

- (BOOL)isSupportedInsertionPosition:(int64_t)a3 fromContentItemID:(id)a4 reason:(id *)a5
{
  id v9 = a4;
  if (!v9)
  {
    uint64_t v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_MPCQueueControllerBehaviorMusic.m", 1754, @"Invalid parameter not satisfying: %@", @"contentItemID" object file lineNumber description];
  }
  if ([(_MPCQueueControllerBehaviorMusic *)self canNextItemFromContentItemID:v9 reason:a5])
  {
    BOOL v10 = 1;
    switch(a3)
    {
      case 0:
      case 3:
        goto LABEL_31;
      case 1:
        if (!_os_feature_enabled_impl())
        {
          if (!a5) {
            goto LABEL_15;
          }
          BOOL v10 = 0;
          long long v13 = @"FF MediaPlayer/QueueFA is OFF";
          goto LABEL_30;
        }
        id v11 = [(_MPCQueueControllerBehaviorMusic *)self tailInsertionContentItemIDForTargetContentItemID:v9];
        if (v11) {
          goto LABEL_38;
        }
        if (self->_activeItemFlags)
        {
          if (a5)
          {
            BOOL v10 = 0;
            id v16 = @"active item from AutoPlay";
LABEL_36:
            *a5 = v16;
            goto LABEL_38;
          }
        }
        else
        {
          if ([(_MPCQueueControllerBehaviorMusic *)self _allDataSourcesSupportInsertionPositionLast])
          {
            long long v12 = [(_MPCQueueControllerBehaviorMusic *)self lastSectionContentItemIDForTargetContentItemID:v9];
            BOOL v10 = v12 != 0;
            if (a5 && !v12) {
              *a5 = @"no UpNext section, no LastSectionContentItemID";
            }

            goto LABEL_38;
          }
          if (a5)
          {
            BOOL v10 = 0;
            id v16 = @"data source does not support position Tail (interpretted as Last)";
            goto LABEL_36;
          }
        }
        BOOL v10 = 0;
LABEL_38:

        goto LABEL_31;
      case 2:
        if (_os_feature_enabled_impl())
        {
          if (!a5) {
            goto LABEL_15;
          }
          BOOL v10 = 0;
          long long v13 = @"FF MediaPlayer/QueueFA is ON";
          goto LABEL_30;
        }
        if (self->_activeItemFlags)
        {
          if (!a5) {
            goto LABEL_15;
          }
          BOOL v10 = 0;
          long long v13 = @"active item from AutoPlay";
          goto LABEL_30;
        }
        BOOL v14 = [(_MPCQueueControllerBehaviorMusic *)self _allDataSourcesSupportInsertionPositionLast];
        BOOL v10 = v14;
        if (a5 && !v14)
        {
          BOOL v10 = 0;
          long long v13 = @"data source does not support position Last";
          goto LABEL_30;
        }
        goto LABEL_31;
      default:
        if (!a5) {
          goto LABEL_15;
        }
        objc_msgSend(NSString, "stringWithFormat:", @"unsupported position: %ld", a3);
        BOOL v10 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
    }
  }
  if (a5 && !*a5)
  {
    BOOL v10 = 0;
    long long v13 = @"unskippable item";
LABEL_30:
    *a5 = v13;
  }
  else
  {
LABEL_15:
    BOOL v10 = 0;
  }
LABEL_31:

  return v10;
}

- (BOOL)_allDataSourcesSupportInsertionPositionLast
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int64_t v3 = [(MPShuffleableSectionedIdentifierList *)self->_identifierList allSectionIdentifiers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v3);
      }
      char v8 = [(NSMutableDictionary *)self->_dataSources objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * v7)];
      char v9 = ([v8 isFrozen] & 1) != 0 ? 0 : objc_msgSend(v8, "containsLiveStream");
      char v10 = [v8 shouldRequestAdditionalItemsAtTail];

      BOOL v11 = 0;
      if (v9 & 1) != 0 || (v10) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)canUserChangeRepeatTypeWithReason:(id *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (self->_activeItemFlags)
  {
    BOOL v12 = 0;
    if (a3) {
      *a3 = @"in autoplay";
    }
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v5 = [(MPShuffleableSectionedIdentifierList *)self->_identifierList allSectionIdentifiers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          BOOL v11 = [(NSMutableDictionary *)self->_dataSources objectForKeyedSubscript:v10];
          if ([v11 shouldRequestAdditionalItemsAtTail])
          {
            if (a3)
            {
              long long v13 = NSString;
              long long v14 = [v11 playbackContext];
              [v13 stringWithFormat:@"datasource %@ does not support repeat (infinite tracklist)", objc_opt_class()];
              goto LABEL_18;
            }
LABEL_19:

            BOOL v12 = 0;
            goto LABEL_20;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0
            && ([v11 section:v10 supportsShuffleType:1] & 1) == 0
            && ([v11 section:v10 supportsShuffleType:2] & 1) == 0)
          {
            if (a3)
            {
              long long v16 = NSString;
              long long v14 = [v11 playbackContext];
              [v16 stringWithFormat:@"datasource %@ does not support repeat", objc_opt_class()];
LABEL_18:
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }
            goto LABEL_19;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 1;
LABEL_20:
  }
  return v12;
}

- (BOOL)canUserChangeShuffleModeWithReason:(id *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (self->_activeItemFlags)
  {
    BOOL v12 = 0;
    if (a3) {
      *a3 = @"in autoplay";
    }
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [(MPShuffleableSectionedIdentifierList *)self->_identifierList allSectionIdentifiers];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          BOOL v11 = [(NSMutableDictionary *)self->_dataSources objectForKeyedSubscript:v10];
          if ((objc_opt_respondsToSelector() & 1) != 0
            && ([v11 section:v10 supportsShuffleType:1] & 1) == 0
            && ([v11 section:v10 supportsShuffleType:2] & 1) == 0)
          {
            if (a3)
            {
              long long v13 = NSString;
              long long v14 = [v11 playbackContext];
              *a3 = [v13 stringWithFormat:@"datasource %@ does not support shuffle", objc_opt_class()];
            }
            BOOL v12 = 0;
            goto LABEL_18;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v12 = 1;
LABEL_18:
  }
  return v12;
}

- (void)_emitEventsForAddingPlaybackContext:(id)a3 sectionIdentifier:(id)a4
{
  v108[0] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v89 = [(_MPCQueueControllerBehaviorMusic *)self host];
  uint64_t v8 = +[MPCPlaybackAccountManager sharedManager];
  char v9 = [v6 userIdentity];
  v84 = v8;
  uint64_t v10 = [v8 accountForUserIdentity:v9];

  v82 = v10;
  uint64_t v11 = [v10 hashedDSID];
  int64_t v80 = [(_MPCQueueControllerBehaviorMusic *)self _privateListeningSourceForContext:v6];
  v85 = v7;
  v83 = (void *)v11;
  if ([v6 conformsToProtocol:&unk_26CC28748])
  {
    id v12 = v6;
    long long v13 = [v12 playbackRequestEnvironment];
    uint64_t v14 = [v13 requestingBundleIdentifier];
    uint64_t v15 = [v13 requestingBundleVersion];
    long long v16 = [v13 delegationProperties];
    long long v17 = v16;
    v88 = (void *)v14;
    if (v16)
    {
      v93 = v12;
      uint64_t quot = [v16 storeAccountID];
      uint64_t v19 = quot;
      long long v20 = (char *)v108 + 1;
      do
      {
        lldiv_t v21 = lldiv(quot, 10);
        uint64_t quot = v21.quot;
        if (v21.rem >= 0) {
          LOBYTE(v22) = v21.rem;
        }
        else {
          uint64_t v22 = -v21.rem;
        }
        *(v20 - 2) = v22 + 48;
        int v23 = (const UInt8 *)(v20 - 2);
        --v20;
      }
      while (v21.quot);
      if (v19 < 0)
      {
        *(v20 - 2) = 45;
        int v23 = (const UInt8 *)(v20 - 2);
      }
      id v24 = (__CFString *)CFStringCreateWithBytes(0, v23, (char *)v108 - (char *)v23, 0x8000100u, 0);
      uint64_t v25 = [v84 accountForDSID:v24];

      v91 = v25;
      v99 = [v25 hashedDSID];
      v106[0] = @"device-guid";
      uint64_t v26 = [v17 deviceGUID];
      id v27 = (void *)v26;
      if (!v26)
      {
        uint64_t v26 = [MEMORY[0x263EFF9D0] null];
      }
      uint64_t v95 = v15;
      v97 = (void *)v26;
      v107[0] = v26;
      v106[1] = @"user-agent";
      dispatch_group_t v28 = [v17 requestUserAgent];
      char v29 = v28;
      if (!v28)
      {
        char v29 = [MEMORY[0x263EFF9D0] null];
      }
      v107[1] = v29;
      v106[2] = @"device-name";
      __int16 v30 = [v17 deviceName];
      id v31 = v30;
      if (!v30)
      {
        id v31 = [MEMORY[0x263EFF9D0] null];
      }
      v107[2] = v31;
      v106[3] = @"device-software-variant";
      unint64_t v32 = [v17 systemReleaseType] - 1;
      if (v32 <= 3)
      {
        id v33 = off_2643C02D8[v32];
      }
      else
      {
        id v33 = [MEMORY[0x263EFF9D0] null];
      }
      v107[3] = v33;
      v87 = [NSDictionary dictionaryWithObjects:v107 forKeys:v106 count:4];
      if (v32 >= 4) {

      }
      id v12 = v93;
      if (!v30) {

      }
      if (!v28) {
      uint64_t v15 = v95;
      }
      if (!v27) {

      }
      v104 = @"private-listening-enabled";
      uint64_t v34 = [v93 privateListeningOverride];
      id v35 = (void *)v34;
      uint64_t v36 = MEMORY[0x263EFFA88];
      if (v34) {
        uint64_t v36 = v34;
      }
      uint64_t v105 = v36;
      v98 = [NSDictionary dictionaryWithObjects:&v105 forKeys:&v104 count:1];

      id v7 = v85;
      uint64_t v11 = (uint64_t)v83;
    }
    else
    {
      v98 = 0;
      v99 = 0;
      v87 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
    v87 = 0;
    v88 = 0;
    v98 = 0;
    v99 = 0;
  }
  v94 = [v6 description];
  v92 = [v6 playActivityFeatureName];
  v96 = [v6 privateListeningOverride];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v37 = [v6 request];
    uint64_t v38 = [v6 startItemIdentifiers];
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v38 = 0;
  }
  v39 = NSString;
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = [v6 queueDescriptor];
  uint64_t v42 = objc_opt_class();
  v79 = (void *)v37;
  v90 = [v39 stringWithFormat:@"%@-%@-%@", v40, v42, objc_opt_class()];

  v86 = [v89 eventStream];
  v102[0] = @"queue-start-item-ids";
  uint64_t v43 = v38;
  if (!v38)
  {
    uint64_t v43 = [MEMORY[0x263EFF9D0] null];
  }
  v75 = (void *)v43;
  v103[0] = v43;
  v103[1] = v7;
  v102[1] = @"queue-section-id";
  v102[2] = @"account-id";
  uint64_t v44 = v11;
  uint64_t v45 = (void *)v15;
  if (!v11)
  {
    uint64_t v44 = [MEMORY[0x263EFF9D0] null];
  }
  v74 = (void *)v44;
  v103[2] = v44;
  v102[3] = @"queue-delegated-account-id";
  uint64_t v46 = (uint64_t)v99;
  if (!v99)
  {
    uint64_t v46 = [MEMORY[0x263EFF9D0] null];
  }
  v73 = (void *)v46;
  v103[3] = v46;
  v102[4] = @"queue-delegated-account-metadata";
  uint64_t v47 = (uint64_t)v98;
  if (!v98)
  {
    uint64_t v47 = [MEMORY[0x263EFF9D0] null];
  }
  v72 = (void *)v47;
  v103[4] = v47;
  v102[5] = @"queue-description";
  uint64_t v48 = (uint64_t)v94;
  if (!v94)
  {
    uint64_t v48 = [MEMORY[0x263EFF9D0] null];
  }
  v71 = (void *)v48;
  v103[5] = v48;
  v102[6] = @"private-listening-source";
  v77 = [NSNumber numberWithInteger:v80];
  v103[6] = v77;
  v102[7] = @"queue-reporting-metadata";
  v100[0] = @"queue-grouping-id";
  uint64_t v49 = [v6 playActivityQueueGroupingID];
  v50 = (void *)v49;
  if (!v49)
  {
    uint64_t v49 = [MEMORY[0x263EFF9D0] null];
  }
  v70 = (void *)v49;
  v101[0] = v49;
  v100[1] = @"feature-name";
  uint64_t v51 = (uint64_t)v92;
  if (!v92)
  {
    uint64_t v51 = [MEMORY[0x263EFF9D0] null];
  }
  v78 = (void *)v38;
  v69 = (void *)v51;
  v101[1] = v51;
  v100[2] = @"reco-data";
  uint64_t v52 = [v6 playActivityRecommendationData];
  v76 = (void *)v52;
  if (!v52)
  {
    uint64_t v52 = [MEMORY[0x263EFF9D0] null];
  }
  v68 = (void *)v52;
  v101[2] = v52;
  v100[3] = @"siri-ref-id";
  uint64_t v53 = [v6 siriReferenceIdentifier];
  __int16 v54 = (void *)v53;
  if (!v53)
  {
    uint64_t v53 = [MEMORY[0x263EFF9D0] null];
  }
  v67 = (void *)v53;
  v101[3] = v53;
  v100[4] = @"siri-wha-metrics";
  uint64_t v55 = [v6 siriWHAMetricsInfo];
  id v56 = (void *)v55;
  if (!v55)
  {
    uint64_t v55 = [MEMORY[0x263EFF9D0] null];
  }
  v66 = (void *)v55;
  v101[4] = v55;
  v100[5] = @"private-listening-enabled";
  uint64_t v57 = (uint64_t)v96;
  if (!v96)
  {
    uint64_t v57 = [MEMORY[0x263EFF9D0] null];
  }
  v65 = (void *)v57;
  v101[5] = v57;
  v100[6] = @"application-bundle-id";
  __int16 v58 = v88;
  if (!v88)
  {
    __int16 v58 = [MEMORY[0x263EFF9D0] null];
  }
  v101[6] = v58;
  v100[7] = @"application-version";
  uint64_t v59 = (void *)v15;
  if (!v15)
  {
    uint64_t v59 = [MEMORY[0x263EFF9D0] null];
  }
  v81 = v6;
  v101[7] = v59;
  v100[8] = @"playback-context-class-name";
  char v60 = v90;
  if (!v90)
  {
    char v60 = [MEMORY[0x263EFF9D0] null];
  }
  int v61 = v45;
  v101[8] = v60;
  v100[9] = @"device-metadata";
  __int16 v62 = v87;
  if (!v87)
  {
    __int16 v62 = [MEMORY[0x263EFF9D0] null];
  }
  v101[9] = v62;
  int v63 = [NSDictionary dictionaryWithObjects:v101 forKeys:v100 count:10];
  v103[7] = v63;
  uint64_t v64 = [NSDictionary dictionaryWithObjects:v103 forKeys:v102 count:8];
  [v86 emitEventType:@"queue-add" payload:v64];

  if (!v87) {
  if (!v90)
  }

  if (!v61) {
  if (!v88)
  }

  if (!v96) {
  if (!v56)
  }

  if (!v54) {
  if (!v76)
  }

  if (v92)
  {
    if (v50) {
      goto LABEL_84;
    }
  }
  else
  {

    if (v50) {
      goto LABEL_84;
    }
  }

LABEL_84:
  if (!v94) {

  }
  if (!v98) {
  if (v99)
  }
  {
    if (v83) {
      goto LABEL_90;
    }
LABEL_95:

    if (v78) {
      goto LABEL_91;
    }
LABEL_96:

    goto LABEL_91;
  }

  if (!v83) {
    goto LABEL_95;
  }
LABEL_90:
  if (!v78) {
    goto LABEL_96;
  }
LABEL_91:
}

- (int64_t)_privateListeningSourceForContext:(id)a3
{
  id v3 = a3;
  if (MSVDeviceIsAudioAccessory()
    && ([MEMORY[0x263F11DA0] isCurrentDeviceValidHomeAccessory] & 1) == 0
    && ([MEMORY[0x263F12178] standardUserDefaults],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 isDevicePrivateListeningEnabled],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 BOOLValue],
        v5,
        v4,
        (v6 & 1) != 0))
  {
    int64_t v7 = 1;
  }
  else
  {
    uint64_t v8 = [v3 privateListeningOverride];

    if (v8)
    {
      int64_t v7 = 3;
    }
    else
    {
      char v9 = [v3 userIdentity];

      if (v9) {
        int64_t v7 = 2;
      }
      else {
        int64_t v7 = 1;
      }
    }
  }

  return v7;
}

- (void)setHostingSharedSessionID:(id)a3 reason:(id)a4
{
  v29[3] = *MEMORY[0x263EF8340];
  int64_t v7 = (NSString *)a3;
  id v8 = a4;
  char v9 = self->_activeHostingSharedSessionID;
  if (v9 == v7)
  {
  }
  else
  {
    uint64_t v10 = v9;
    char v11 = [(NSString *)v9 isEqual:v7];

    if ((v11 & 1) == 0)
    {
      id v12 = [(_MPCQueueControllerBehaviorMusic *)self host];
      long long v13 = v12;
      if (self->_activeHostingSharedSessionID)
      {
        uint64_t v14 = [v12 eventStream];
        v28[0] = @"session-id";
        uint64_t v15 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        long long v16 = v15;
        if (!v15)
        {
          long long v16 = [MEMORY[0x263EFF9D0] null];
        }
        activeHostingSharedSessionID = self->_activeHostingSharedSessionID;
        v29[0] = v16;
        v29[1] = activeHostingSharedSessionID;
        v28[1] = @"shared-session-id";
        v28[2] = @"shared-session-event-reason";
        v29[2] = v8;
        long long v18 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];
        [v14 emitEventType:@"shared-session-end" payload:v18];

        if (!v15) {
      }
        }
      objc_storeStrong((id *)&self->_activeHostingSharedSessionID, a3);
      activeGroupSession = self->_activeGroupSession;
      self->_activeGroupSession = 0;

      if (v7)
      {
        long long v20 = [v13 eventStream];
        v26[0] = @"session-id";
        lldiv_t v21 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        uint64_t v22 = v21;
        if (!v21)
        {
          uint64_t v22 = [MEMORY[0x263EFF9D0] null];
        }
        v27[0] = v22;
        v27[1] = v7;
        v26[1] = @"shared-session-id";
        v26[2] = @"shared-session-type";
        v26[3] = @"shared-session-event-reason";
        v27[2] = &unk_26CC18E88;
        v27[3] = v8;
        int v23 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
        [v20 emitEventType:@"shared-session-begin" payload:v23];

        if (!v21) {
        id v24 = [MEMORY[0x263F548D0] remoteControlGroupSessionWithIdentifier:v7 delegate:self];
        }
        uint64_t v25 = self->_activeGroupSession;
        self->_activeGroupSession = v24;
      }
    }
  }
}

- (void)connectToHost:(id)a3
{
}

- (_MPCQueueControllerBehaviorMusic)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_MPCQueueControllerBehaviorMusic *)self init];
  char v6 = v5;
  if (v5) {
    [(_MPCQueueControllerBehaviorMusic *)v5 _initializeWithCoder:v4];
  }

  return v6;
}

- (void)_initializeWithCoder:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_wasDecoded = 1;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"il"];
  identifierList = self->_identifierList;
  self->_identifierList = v5;

  int64_t v7 = self->_identifierList;
  if (!v7)
  {
    id v33 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 2, @"Failed to decode identifierList");
    [v4 failWithError:v33];
LABEL_27:

    goto LABEL_28;
  }
  [(MPShuffleableSectionedIdentifierList *)v7 setDelegate:self];
  [(MPShuffleableSectionedIdentifierList *)self->_identifierList setAnnotationDelegate:self];
  id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"apil"];
  autoPlayIdentifierList = self->_autoPlayIdentifierList;
  self->_autoPlayIdentifierList = v8;

  [(MPSectionedIdentifierList *)self->_autoPlayIdentifierList setDelegate:self];
  [(MPSectionedIdentifierList *)self->_autoPlayIdentifierList setAnnotationDelegate:self];
  self->_repeatType = [v4 decodeIntegerForKey:@"rt"];
  self->_shuffleType = [v4 decodeIntegerForKey:@"st"];
  self->_unint64_t autoPlayState = [v4 decodeIntegerForKey:@"aps"];
  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"apep"];
  autoPlayEndPosition = self->_autoPlayEndPosition;
  self->_autoPlayEndPosition = v10;

  char v12 = [v4 decodeBoolForKey:@"apit"];
  self->_autoPlayIsTriggered = v12;
  if (self->_autoPlayIdentifierList && (v12 & 1) == 0)
  {
    long long v13 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
      *(_DWORD *)buf = 138543362;
      uint64_t v46 = v14;
      _os_log_impl(&dword_21BB87000, v13, OS_LOG_TYPE_DEFAULT, "[AOT:…:%{public}@] initializeWithCoder: | setting autoPlayIsTriggered = YES [decoded non-nil autoPlayIdentifierList]", buf, 0xCu);
    }
    self->_autoPlayIsTriggered = 1;
  }
  uint64_t v15 = (void *)MEMORY[0x263EFFA08];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  long long v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
  uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"ds"];
  dataSources = self->_dataSources;
  self->_dataSources = v19;

  if (!self->_dataSources)
  {
    lldiv_t v21 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      uint64_t v22 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
      int v23 = [v4 error];
      *(_DWORD *)buf = 138543618;
      uint64_t v46 = v22;
      __int16 v47 = 2114;
      uint64_t v48 = v23;
      _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_FAULT, "[PSP:…:%{public}@] initializeWithCoder: | error detected [dataSources failed to decode] decoder.error=%{public}@", buf, 0x16u);
    }
    id v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v25 = self->_dataSources;
    self->_dataSources = v24;
  }
  self->_hasUserMutations = [v4 decodeBoolForKey:@"hum"];
  [(MPShuffleableSectionedIdentifierList *)self->_identifierList setAutomaticallyReversesNonDestructiveDataSourceEdits:0];
  if (_os_feature_enabled_impl())
  {
    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lups"];
    p_latestUpNextSectionID = &self->_latestUpNextSectionID;
    latestUpNextSectionID = self->_latestUpNextSectionID;
    self->_latestUpNextSectionID = v26;

    if (!self->_latestUpNextSectionID)
    {
      char v29 = [(MPShuffleableSectionedIdentifierList *)self->_identifierList orderedSectionIdentifiers];
      uint64_t v30 = [(MPSectionedIdentifierList *)self->_autoPlayIdentifierList orderedSectionIdentifiers];
      id v31 = (void *)v30;
      if (v30) {
        uint64_t v32 = v30;
      }
      else {
        uint64_t v32 = MEMORY[0x263EFFA68];
      }
      id v33 = [v29 arrayByAddingObjectsFromArray:v32];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v34 = [v33 reverseObjectEnumerator];
      uint64_t v35 = [v34 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v41 != v37) {
              objc_enumerationMutation(v34);
            }
            v39 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            if ([v39 hasPrefix:@"UPNXT-"]) {
              objc_storeStrong((id *)p_latestUpNextSectionID, v39);
            }
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v36);
      }

      goto LABEL_27;
    }
  }
LABEL_28:
}

+ (id)makeExtensionWithInvalidatable:(id)a3
{
  id v3 = a3;
  id v4 = [[_MPCQueueControllerBehaviorMusicTransportableExtension alloc] initWithInvalidatable:v3];

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playNowInsertionContentItemID, 0);
  objc_storeStrong((id *)&self->_latestUpNextSectionID, 0);
  objc_storeStrong((id *)&self->_dataSources, 0);
  objc_storeStrong((id *)&self->_autoPlayEndPosition, 0);
  objc_storeStrong((id *)&self->_autoPlayIdentifierList, 0);
  objc_storeStrong((id *)&self->_identifierList, 0);
  objc_storeStrong((id *)&self->_activeGroupSession, 0);
  objc_destroyWeak((id *)&self->_musicBehaviorDelegate);
  objc_destroyWeak((id *)&self->_host);
  objc_storeStrong((id *)&self->_activeHostingSharedSessionID, 0);
  objc_storeStrong((id *)&self->_lastEmittedBehaviorMetadata, 0);

  objc_storeStrong(&self->_loadAdditionalItemsCompletion, 0);
}

- (void)setPlayNowInsertionContentItemID:(id)a3
{
}

- (NSString)playNowInsertionContentItemID
{
  return self->_playNowInsertionContentItemID;
}

- (void)setLatestUpNextSectionID:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setDataSources:(id)a3
{
}

- (void)setAutoPlayIsTriggered:(BOOL)a3
{
  self->_autoPlayIsTriggered = a3;
}

- (BOOL)autoPlayIsTriggered
{
  return self->_autoPlayIsTriggered;
}

- (void)setAutoPlayEndPosition:(id)a3
{
}

- (void)setAutoPlayState:(int64_t)a3
{
  self->_unint64_t autoPlayState = a3;
}

- (int64_t)autoPlayState
{
  return self->_autoPlayState;
}

- (void)setAutoPlayIdentifierList:(id)a3
{
}

- (void)setIdentifierList:(id)a3
{
}

- (void)setActiveGroupSession:(id)a3
{
}

- (MRGroupSession)activeGroupSession
{
  return self->_activeGroupSession;
}

- (BOOL)hasUserMutations
{
  return self->_hasUserMutations;
}

- (MPCQueueControllerBehaviorMusicDelegate)musicBehaviorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_musicBehaviorDelegate);

  return (MPCQueueControllerBehaviorMusicDelegate *)WeakRetained;
}

- (void)_updateGroupSessionParticipants:(id)a3 localParticipant:(id)a4
{
  v34[4] = *MEMORY[0x263EF8340];
  id v6 = a4;
  int64_t v7 = [a3 allObjects];
  id v8 = [v7 sortedArrayUsingComparator:&__block_literal_global_690];

  char v9 = objc_msgSend(v8, "msv_map:", &__block_literal_global_693);
  uint64_t v10 = v9;
  if (v6)
  {
    char v11 = (void *)[v9 mutableCopy];
    id v12 = v6;
    long long v13 = [MPCSharedSessionParticipant alloc];
    if (v13)
    {
      v32.receiver = v13;
      v32.super_class = (Class)MPCSharedSessionParticipant;
      uint64_t v14 = [(_MPCQueueControllerBehaviorMusic *)&v32 init];
      uint64_t v15 = v14;
      if (v14) {
        v14->_loadAdditionalItemsCompletion = (id)2;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    uint64_t v17 = [v12 identifier];
    if (v15) {
      objc_setProperty_nonatomic_copy(v15, v16, v17, 48);
    }

    long long v18 = [v12 identity];

    uint64_t v19 = [v18 identifier];
    lldiv_t v21 = v19;
    if (v15)
    {
      objc_setProperty_nonatomic_copy(v15, v20, v19, 56);

      v15->_wasDecoded = 1;
    }
    else
    {
    }
    [v11 addObject:v15];
    uint64_t v22 = [v11 copy];

    uint64_t v10 = (void *)v22;
  }
  if (self->_activeHostingSharedSessionID)
  {
    int v23 = [(_MPCQueueControllerBehaviorMusic *)self host];
    id v24 = [v23 eventStream];
    v33[0] = @"session-id";
    uint64_t v25 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
    uint64_t v26 = v25;
    if (!v25)
    {
      uint64_t v26 = [MEMORY[0x263EFF9D0] null];
    }
    activeHostingSharedSessionID = self->_activeHostingSharedSessionID;
    v34[0] = v26;
    v34[1] = activeHostingSharedSessionID;
    v33[1] = @"shared-session-id";
    v33[2] = @"participants";
    dispatch_group_t v28 = v10;
    if (!v10)
    {
      dispatch_group_t v28 = [MEMORY[0x263EFF9D0] null];
    }
    v34[2] = v28;
    v33[3] = @"shared-session-event-route-type";
    activeGroupSession = self->_activeGroupSession;
    if (activeGroupSession) {
      objc_msgSend(NSNumber, "numberWithUnsignedChar:", -[MRGroupSession routeType](activeGroupSession, "routeType"));
    }
    else {
    uint64_t v30 = [MEMORY[0x263EFF9D0] null];
    }
    v34[3] = v30;
    id v31 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
    [v24 emitEventType:@"shared-session-participants-changed" payload:v31];

    if (v10)
    {
      if (v25)
      {
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {

      if (v25) {
        goto LABEL_20;
      }
    }

    goto LABEL_20;
  }
LABEL_21:
}

- (void)_transitionToAutoPlayState:(int64_t)a3
{
  uint64_t v5 = self;
  uint64_t v82 = *MEMORY[0x263EF8340];
  int v6 = [(_MPCQueueControllerBehaviorMusic *)self autoPlayEnabled];
  int v7 = 0;
  int64_t v8 = a3 | (v5->_autoPlayState << 16);
  if (v8 <= 393216)
  {
    if (v8 <= 0x40000)
    {
      if (v8 > 0x20000)
      {
        if (v8 <= 196608)
        {
          int v9 = 0;
          int v10 = 0;
          int v11 = 0;
          LOBYTE(v12) = 0;
          if (v8 == 131073) {
            goto LABEL_43;
          }
          uint64_t v13 = 131081;
LABEL_39:
          if (v8 == v13)
          {
            int v7 = 0;
            int v9 = 0;
            int v10 = 0;
            int v11 = 1;
            goto LABEL_41;
          }
          goto LABEL_89;
        }
        __int16 v14 = 0;
        if (v8 != 196609)
        {
          uint64_t v13 = 196617;
          goto LABEL_39;
        }
LABEL_42:
        int v9 = 0;
        int v11 = 0;
        int v10 = v7;
        LOWORD(v12) = v14 | v5->_activeItemFlags;
        int v7 = 1;
        goto LABEL_43;
      }
      BOOL v15 = (unint64_t)v8 > 5 || ((1 << a3) & 0x32) == 0;
LABEL_28:
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      LOBYTE(v12) = 0;
      if (!v15) {
        goto LABEL_43;
      }
      goto LABEL_89;
    }
    if (v8 > 327680)
    {
      unint64_t v16 = v8 - 327681;
      BOOL v15 = v16 > 3 || v16 == 1;
      goto LABEL_28;
    }
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    LOBYTE(v12) = 0;
    if ((unint64_t)(v8 - 262145) < 2) {
      goto LABEL_43;
    }
    if (v8 != 262147)
    {
      uint64_t v13 = 262153;
      goto LABEL_39;
    }
LABEL_24:
    int v7 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
LABEL_41:
    LOBYTE(v12) = 1;
    goto LABEL_43;
  }
  if (v8 <= 524290)
  {
    if (v8 <= 458752)
    {
      switch(v8)
      {
        case 393217:
        case 393219:
          goto LABEL_34;
        case 393218:
          __int16 v14 = 0;
          int v7 = 1;
          goto LABEL_42;
        case 393223:
          goto LABEL_24;
        default:
          goto LABEL_89;
      }
    }
    if (v8 == 458753)
    {
LABEL_34:
      int v7 = 1;
      __int16 v14 = 1;
      goto LABEL_42;
    }
    if (v8 != 458755)
    {
      if (v8 != 458760)
      {
LABEL_89:
        uint64_t v59 = [MEMORY[0x263F08690] currentHandler];
        unint64_t autoPlayState = v5->_autoPlayState;
        if (autoPlayState >= 0xA)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedState:%ld", v5->_autoPlayState);
          int v61 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          int v61 = off_2643C02F8[autoPlayState];
        }
        if ((unint64_t)a3 >= 0xA)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedState:%ld", a3);
          __int16 v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          __int16 v62 = off_2643C02F8[a3];
        }
        [v59 handleFailureInMethod:a2, v5, @"_MPCQueueControllerBehaviorMusic.m", 3785, @"Unexpected state transition from: %@ to: %@", v61, v62 object file lineNumber description];

        int v7 = 0;
        int v9 = 0;
        int v10 = 0;
        int v11 = 0;
        LOBYTE(v12) = 0;
        goto LABEL_43;
      }
      goto LABEL_24;
    }
LABEL_35:
    int v7 = 0;
    int v9 = 0;
    int v11 = 0;
LABEL_36:
    int v10 = 1;
    goto LABEL_41;
  }
  if (v8 <= 589824)
  {
    if (v8 != 524291 && v8 != 524295)
    {
      uint64_t v13 = 524297;
      goto LABEL_39;
    }
    goto LABEL_35;
  }
  __int16 v14 = 0;
  switch(v8)
  {
    case 589825:
      goto LABEL_42;
    case 589827:
      goto LABEL_24;
    case 589830:
      int v7 = 0;
      int v11 = 0;
      int v9 = 1;
      goto LABEL_36;
    case 589833:
      int v7 = 0;
      int v9 = 0;
      int v10 = 0;
      LOBYTE(v12) = 0;
      int v11 = 1;
      break;
    default:
      goto LABEL_89;
  }
LABEL_43:
  int v65 = v10;
  int v67 = v9;
  int v64 = v11;
  uint64_t v17 = [(_MPCQueueControllerBehaviorMusic *)v5 host];
  long long v18 = NSString;
  unint64_t v19 = v5->_autoPlayState;
  if (v19 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedState:%ld", v5->_autoPlayState);
    long long v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    long long v20 = off_2643C02F8[v19];
  }
  if ((unint64_t)a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedState:%ld", a3);
    lldiv_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    lldiv_t v21 = off_2643C02F8[a3];
  }
  uint64_t v22 = [v18 stringWithFormat:@"[ %@ --> %@ ]", v20, v21];

  int v23 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [v17 engineID];
    [(_MPCQueueControllerBehaviorMusic *)v5 sessionID];
    int v63 = v5;
    int v25 = v7;
    int64_t v26 = a3;
    char v27 = (char)v12;
    id v12 = a2;
    dispatch_group_t v28 = v17;
    v30 = int v29 = v6;
    *(_DWORD *)buf = 138543874;
    v77 = v24;
    __int16 v78 = 2114;
    v79 = v30;
    __int16 v80 = 2114;
    v81 = v22;
    _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] _transitionToAutoPlayState:… | updating state [] transition=%{public}@", buf, 0x20u);

    int v6 = v29;
    uint64_t v17 = v28;
    a2 = v12;
    LOBYTE(v12) = v27;
    a3 = v26;
    int v7 = v25;
    uint64_t v5 = v63;
  }
  v5->_unint64_t autoPlayState = a3;
  if (v65)
  {
    autoPlayEndPosition = v5->_autoPlayEndPosition;
    v5->_autoPlayEndPosition = 0;
  }
  if (v7)
  {
    autoPlayIdentifierList = v5->_autoPlayIdentifierList;
    v5->_autoPlayIdentifierList = 0;
  }
  if (v67)
  {
    if (!v5->_autoPlayIdentifierList
      && [(MPShuffleableSectionedIdentifierList *)v5->_identifierList itemCount] >= 1)
    {
      int v66 = v6;
      char v68 = (char)v12;
      uint64_t v46 = (MPSectionedIdentifierList *)objc_alloc_init(MEMORY[0x263F12208]);
      __int16 v47 = v5->_autoPlayIdentifierList;
      v5->_autoPlayIdentifierList = v46;

      [(MPSectionedIdentifierList *)v5->_autoPlayIdentifierList setDelegate:v5];
      [(MPSectionedIdentifierList *)v5->_autoPlayIdentifierList setAnnotationDelegate:v5];
      uint64_t v48 = v5->_autoPlayIdentifierList;
      uint64_t v49 = [(_MPCQueueControllerBehaviorMusic *)v5 _accountForAutoPlay];
      v50 = +[MPCPlaybackIntent continueListeningRadioPlaybackIntent];
      uint64_t v51 = [v49 bag];
      uint64_t v52 = [v51 radioConfiguration];

      if ([v52 isContinueListeningAvailable])
      {
        v69[0] = MEMORY[0x263EF8330];
        v69[1] = 3221225472;
        v69[2] = __63___MPCQueueControllerBehaviorMusic__transitionToAutoPlayState___block_invoke;
        v69[3] = &unk_2643C0230;
        SEL v75 = a2;
        v69[4] = v5;
        id v70 = v49;
        id v71 = v52;
        id v72 = v17;
        id v73 = v22;
        v74 = v48;
        [v50 getRemotePlaybackQueueWithDestination:1 completion:v69];
      }
      else
      {
        id v56 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v57 = [v17 engineID];
          __int16 v58 = [(_MPCQueueControllerBehaviorMusic *)v5 sessionID];
          *(_DWORD *)buf = 138543874;
          v77 = v57;
          __int16 v78 = 2114;
          v79 = v58;
          __int16 v80 = 2114;
          v81 = v22;
          _os_log_impl(&dword_21BB87000, v56, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] _transitionToAutoPlayState:… | disabling autoplay [disabled in bag] transition=%{public}@", buf, 0x20u);
        }
        if (v5->_autoPlayState != 2) {
          [(_MPCQueueControllerBehaviorMusic *)v5 _transitionToAutoPlayState:2];
        }
      }

      int v6 = v66;
      if ((v68 & 1) == 0) {
        goto LABEL_63;
      }
      goto LABEL_59;
    }
    [(_MPCQueueControllerBehaviorMusic *)v5 _transitionToAutoPlayState:7];
  }
  if ((v12 & 1) == 0)
  {
LABEL_63:
    int v38 = [(_MPCQueueControllerBehaviorMusic *)v5 autoPlayEnabled];
    if (v6 != v38)
    {
      int v39 = v38;
      id WeakRetained = objc_loadWeakRetained((id *)&v5->_musicBehaviorDelegate);
      long long v41 = WeakRetained;
      if (v39) {
        uint64_t v42 = 3;
      }
      else {
        uint64_t v42 = 2;
      }
      [WeakRetained behavior:v5 didChangeActionAtQueueEnd:v42];
    }
    [(_MPCQueueControllerBehaviorMusic *)v5 _emitEventsForPlaybackBehaviorChangeIfNeeded];
    if (v64 && v5->_autoPlayIsTriggered && v5->_autoPlayState != 6)
    {
      long long v43 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v44 = [v17 engineID];
        uint64_t v45 = [(_MPCQueueControllerBehaviorMusic *)v5 sessionID];
        *(_DWORD *)buf = 138543874;
        v77 = v44;
        __int16 v78 = 2114;
        v79 = v45;
        __int16 v80 = 2114;
        v81 = v22;
        _os_log_impl(&dword_21BB87000, v43, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] _transitionToAutoPlayState:… | loading autoplay [triggered] transition=%{public}@", buf, 0x20u);
      }
      [(_MPCQueueControllerBehaviorMusic *)v5 _transitionToAutoPlayState:6];
    }
    [v17 behaviorDidChange];
    goto LABEL_75;
  }
LABEL_59:
  if (v5->_state)
  {
    id v33 = [NSString stringWithFormat:@"BehaviorMusic-transitionToAutoPlayState%@", v22];
    uint64_t v34 = [v17 beginEditWithReason:v33];

    uint64_t v35 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = [v17 engineID];
      uint64_t v37 = [(_MPCQueueControllerBehaviorMusic *)v5 sessionID];
      *(_DWORD *)buf = 138543874;
      v77 = v36;
      __int16 v78 = 2114;
      v79 = v37;
      __int16 v80 = 2114;
      v81 = v22;
      _os_log_impl(&dword_21BB87000, v35, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] _transitionToAutoPlayState:… | committing edit [invalidateQueue] transition=%{public}@", buf, 0x20u);
    }
    [v34 commit];

    goto LABEL_63;
  }
  uint64_t v53 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v54 = [v17 engineID];
    uint64_t v55 = [(_MPCQueueControllerBehaviorMusic *)v5 sessionID];
    *(_DWORD *)buf = 138543874;
    v77 = v54;
    __int16 v78 = 2114;
    v79 = v55;
    __int16 v80 = 2114;
    v81 = v22;
    _os_log_impl(&dword_21BB87000, v53, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] _transitionToAutoPlayState:… | ignoring SIL change [state: Loading] transition=%{public}@", buf, 0x20u);
  }
LABEL_75:
}

- (void)_setShuffleType:(int64_t)a3 startingContentItemID:(id)a4 randomSource:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v9 = a4;
  id v10 = a5;
  if (a3 == 1000)
  {
    lldiv_t v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"_MPCQueueControllerBehaviorMusic.m" lineNumber:3640 description:@"User default should be resolved before setting on queue controller."];
  }
  if (self->_shuffleType != a3)
  {
    self->_shuffleType = a3;
    if (v9)
    {
      int v11 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v9];
    }
    else
    {
      int v11 = 0;
    }
    id v12 = [v11 sectionID];
    uint64_t v13 = [v11 itemID];
    if ([v11 type] == 3 || objc_msgSend(v11, "type") == 2)
    {

      uint64_t v13 = 0;
      id v12 = 0;
    }
    id v24 = v9;
    __int16 v14 = [(_MPCQueueControllerBehaviorMusic *)self host];
    BOOL v15 = [v14 beginEditWithReason:@"BehaviorMusic-setShuffleType"];
    [(MPShuffleableSectionedIdentifierList *)self->_identifierList setShuffleType:a3 startingItem:v13 inSection:v12 randomSource:v10];
    unint64_t v16 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      [v14 engineID];
      uint64_t v17 = v22 = v15;
      long long v18 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
      MPShuffleTypeDescription();
      v19 = id v23 = v10;
      *(_DWORD *)buf = 138544386;
      int64_t v26 = v17;
      __int16 v27 = 2114;
      dispatch_group_t v28 = v18;
      __int16 v29 = 2114;
      uint64_t v30 = v19;
      __int16 v31 = 2114;
      objc_super v32 = v13;
      __int16 v33 = 2114;
      uint64_t v34 = v12;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _setShuffleType:startingContentItemID:randomSource: | committing edit [queue order changed] shuffleType=%{public}@ startItem=%{public}@ startSection=%{public}@", buf, 0x34u);

      BOOL v15 = v22;
      id v10 = v23;
    }

    [v15 commit];
    [(_MPCQueueControllerBehaviorMusic *)self _emitEventsForPlaybackBehaviorChangeIfNeeded];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_musicBehaviorDelegate);
    [WeakRetained behavior:self didChangeShuffleType:a3];

    id v9 = v24;
  }
}

- (void)_setRepeatType:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_repeatType != a3)
  {
    self->_repeatType = a3;
    uint64_t v5 = [(_MPCQueueControllerBehaviorMusic *)self host];
    int v6 = [v5 beginEditWithReason:@"BehaviorMusic-setRepeatType"];
    int v7 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v8 = [v5 engineID];
      id v9 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
      id v10 = MPNSStringFromRepeatType();
      int v12 = 138543874;
      uint64_t v13 = v8;
      __int16 v14 = 2114;
      BOOL v15 = v9;
      __int16 v16 = 2114;
      uint64_t v17 = v10;
      _os_log_impl(&dword_21BB87000, v7, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _setRepeatType: | committing edit [repeatType changed] repeatType=%{public}@", (uint8_t *)&v12, 0x20u);
    }
    [v6 commit];
    [(_MPCQueueControllerBehaviorMusic *)self _emitEventsForPlaybackBehaviorChangeIfNeeded];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_musicBehaviorDelegate);
    [WeakRetained behavior:self didChangeRepeatType:a3];
  }
}

- (unint64_t)_playbackContextOptions
{
  BOOL v2 = self->_activeHostingSharedSessionID != 0;
  return MSVDeviceSupportsDelegatedIdentities() | (unint64_t)(2 * v2);
}

- (id)_autoPlayUpNextSectionIdentifierForItem:(id)a3
{
  return [(_MPCQueueControllerBehaviorMusic *)self _upNextSectionIdentifierForItem:a3 shouldLookInBaseList:0];
}

- (void)_evaluateLoadingDataSourceItemThresholds
{
  id v3 = [(_MPCQueueControllerBehaviorMusic *)self host];
  dataSources = self->_dataSources;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76___MPCQueueControllerBehaviorMusic__evaluateLoadingDataSourceItemThresholds__block_invoke;
  v6[3] = &unk_2643C0000;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [(NSMutableDictionary *)dataSources enumerateKeysAndObjectsUsingBlock:v6];
}

- (int64_t)_countOfItemsWithinSection:(id)a3 maxCount:(int64_t)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x263F12210] positionForHeadOfSection:v6];
  int64_t v8 = [MEMORY[0x263F12210] positionForTailOfSection:v6];
  id v9 = +[_MPCQueueControllerEnumerator enumeratorWithMusicBehavior:self mode:0 options:16 startPosition:v7 endPosition:v8];

  int64_t v10 = 0;
  if (a4 <= 1) {
    int64_t v11 = 1;
  }
  else {
    int64_t v11 = a4;
  }
  while (1)
  {
    int v12 = [v9 nextObject];

    if (!v12) {
      break;
    }
    if (v11 == ++v10)
    {
      int64_t v10 = v11;
      break;
    }
  }

  return v10;
}

- (void)_addAutoPlayPlaybackContext:(id)a3 atPosition:(int64_t)a4 afterContentItemID:(id)a5 sectionIdentifier:(id)a6 actions:(unint64_t)a7 completion:(id)a8
{
  char v131 = a7;
  uint64_t v152 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v133 = a5;
  id v132 = a6;
  __int16 v14 = (void (**)(id, MPSectionedIdentifierList *))a8;
  BOOL v15 = (void *)[v13 copy];
  __int16 v16 = [(_MPCQueueControllerBehaviorMusic *)self host];
  if (a4 != 1)
  {
    uint64_t v22 = [NSString stringWithFormat:@"BehaviorMusic-addAutoPlayPlaybackContext-<%@: %p>", objc_opt_class(), v15];
    v130 = [v16 beginEditWithReason:v22];

    v128 = self;
    if (a4)
    {
      if (a4 != 3)
      {
        p_autoPlayIdentifierList = &self->_autoPlayIdentifierList;
        uint64_t v48 = self->_autoPlayIdentifierList;
        goto LABEL_25;
      }
      id v23 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v133];
      if ([v23 type] != 3) {
        goto LABEL_19;
      }
      id v24 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        int v25 = [v16 engineID];
        int64_t v26 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        [v23 deferredNextContentItemID];
        __int16 v27 = v23;
        dispatch_group_t v28 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v143 = v25;
        __int16 v144 = 2114;
        v145 = v26;
        __int16 v146 = 2114;
        v147 = v28;
        _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | converting PositionSpecified item to deferredNextContentItem [specified placeholder item] deferredNextContentItem=%{public}@", buf, 0x20u);

        id v23 = v27;
      }

      __int16 v29 = [v23 deferredNextContentItemID];

      if (!v29)
      {
        lldiv_t v21 = v130;
        [(MPSectionedIdentifierList *)v130 rollback];
        uint64_t v30 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = [v16 engineID];
          objc_super v32 = self;
          __int16 v33 = v23;
          uint64_t v34 = (void *)v31;
          [(_MPCQueueControllerBehaviorMusic *)v32 sessionID];
          uint64_t v36 = v35 = v15;
          *(_DWORD *)buf = 138543618;
          v143 = v34;
          __int16 v144 = 2114;
          v145 = v36;
          _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | failed to convert to deferredNextContentItem PositionSpecified [deferredNextContentItemID is nil]", buf, 0x16u);

          BOOL v15 = v35;
          id v23 = v33;
        }

        uint64_t v37 = (void *)MEMORY[0x263F087E8];
        int v38 = @"The specified insertion position [specified] was unsupported because the specified item is a placeholder and there is no deferredNextContentItemAnchorID.";
LABEL_67:
        objc_msgSend(v37, "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, v38);
        uint64_t v48 = (MPSectionedIdentifierList *)objc_claimAutoreleasedReturnValue();
        v14[2](v14, v48);
        goto LABEL_62;
      }
    }
    else
    {
      id v23 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v133];
      if ([v23 type] != 3)
      {
        a4 = 0;
LABEL_22:
        p_autoPlayIdentifierList = &self->_autoPlayIdentifierList;
        uint64_t v48 = self->_autoPlayIdentifierList;
        if (v23)
        {
          uint64_t v49 = v16;
          v50 = [v23 itemID];
          uint64_t v51 = v23;
          uint64_t v52 = [v23 sectionID];
          char v53 = [(MPSectionedIdentifierList *)v48 hasItem:v50 inSection:v52];

          if ((v53 & 1) == 0)
          {
            lldiv_t v21 = v130;
            [(MPSectionedIdentifierList *)v130 rollback];
            v87 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
            if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            {
              v88 = [v49 engineID];
              v89 = [(_MPCQueueControllerBehaviorMusic *)v128 sessionID];
              [v51 sectionID];
              v124 = v15;
              v90 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              v91 = [v51 itemID];
              *(_DWORD *)buf = 138544130;
              v143 = v88;
              __int16 v144 = 2114;
              v145 = v89;
              __int16 v146 = 2114;
              v147 = v90;
              __int16 v148 = 2114;
              id v149 = v91;
              _os_log_impl(&dword_21BB87000, v87, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | rolling back edit [autoPlayIdentifierList does not contain afterItem] afterSection=%{public}@ afterItem=%{public}@", buf, 0x2Au);

              lldiv_t v21 = v130;
              BOOL v15 = v124;
            }
            v92 = (void *)MEMORY[0x263F087E8];
            id v71 = [v51 contentItemID];
            v93 = v92;
            id v23 = v51;
            objc_msgSend(v93, "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, @"Cannot insert after unknown item (in autoplay identifier list): %@", v71);
            v94 = (MPSectionedIdentifierList *)objc_claimAutoreleasedReturnValue();
            v14[2](v14, v94);
            __int16 v16 = v49;
            goto LABEL_61;
          }
          __int16 v16 = v49;
LABEL_26:
          v127 = v16;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v54 = v15;
            if ([v54 continueListeningStation]) {
              [v54 setContinueListeningQueueProvider:v128];
            }
          }
          v120 = v48;
          v122 = v51;
          uint64_t v55 = [[_MPCQueueControllerBehaviorMusicDataSourceState alloc] initWithPlaybackContext:v15];
          id v56 = v128;
          dataSources = v128->_dataSources;
          __int16 v58 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v55 sectionIdentifier];
          uint64_t v59 = [(NSMutableDictionary *)dataSources objectForKeyedSubscript:v58];

          if (v59)
          {
            v117 = [MEMORY[0x263F08690] currentHandler];
            [v117 handleFailureInMethod:a2 object:v128 file:@"_MPCQueueControllerBehaviorMusic.m" lineNumber:3064 description:@"Attempting to add datasource for an already existing section."];
          }
          __int16 v16 = v127;
          char v60 = [v127 eventStream];
          [(_MPCQueueControllerBehaviorMusicDataSourceState *)v55 setEventStream:v60];

          int v61 = [v127 playerID];
          [(_MPCQueueControllerBehaviorMusicDataSourceState *)v55 setPlayerID:v61];

          __int16 v62 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            int v63 = [v127 engineID];
            int v64 = [(_MPCQueueControllerBehaviorMusic *)v128 sessionID];
            [(_MPCQueueControllerBehaviorMusicDataSourceState *)v55 sectionIdentifier];
            v66 = id v65 = v13;
            *(_DWORD *)buf = 138544130;
            v143 = v63;
            __int16 v144 = 2114;
            v145 = v64;
            __int16 v146 = 2048;
            v147 = v55;
            __int16 v148 = 2114;
            id v149 = v66;
            _os_log_impl(&dword_21BB87000, v62, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | adding dataSource [] dataSource=%p section=%{public}@", buf, 0x2Au);

            id v13 = v65;
            id v56 = v128;

            __int16 v16 = v127;
          }

          int v67 = v56->_dataSources;
          char v68 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v55 sectionIdentifier];
          [(NSMutableDictionary *)v67 setObject:v55 forKeyedSubscript:v68];

          v69 = [(MPSectionedIdentifierList *)v56->_autoPlayIdentifierList identifier];
          id v70 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v55 sectionIdentifier];
          [(_MPCQueueControllerBehaviorMusic *)v56 _emitEventsForAddingPlaybackContext:v13 sectionIdentifier:v70];

          aBlock[0] = MEMORY[0x263EF8330];
          aBlock[1] = 3221225472;
          aBlock[2] = __131___MPCQueueControllerBehaviorMusic__addAutoPlayPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke;
          aBlock[3] = &unk_2643C0168;
          id v118 = v69;
          id v135 = v118;
          v136 = v56;
          id v121 = v16;
          id v137 = v121;
          id v71 = v55;
          v138 = v71;
          v139 = v130;
          v140 = v14;
          char v141 = v131 & 1;
          v123 = _Block_copy(aBlock);
          id v72 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v71 playbackContext];
          [v72 setShuffleType:0];

          if ((v131 & 1) == 0)
          {
            id v73 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v71 playbackContext];
            [v73 clearStartItem];
          }
          uint64_t v48 = v120;
          switch(a4)
          {
            case 0:
              id v129 = v13;
              v74 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
              if (!os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_53;
              }
              v126 = [v121 engineID];
              SEL v75 = [(_MPCQueueControllerBehaviorMusic *)v56 sessionID];
              v76 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v71 sectionIdentifier];
              v77 = [v122 itemID];
              __int16 v78 = [v122 sectionID];
              *(_DWORD *)buf = 138544386;
              v143 = v126;
              __int16 v144 = 2114;
              v145 = v75;
              __int16 v146 = 2114;
              v147 = v76;
              __int16 v148 = 2114;
              id v149 = v77;
              __int16 v150 = 2114;
              v151 = v78;
              v79 = "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | adding data source [] position=Head sect"
                    "ion=%{public}@ afterItem=%{public}@ inSection=%{public}@";
              goto LABEL_52;
            case 1:
              goto LABEL_46;
            case 2:
              uint64_t v95 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
              {
                v96 = [v121 engineID];
                v97 = [(_MPCQueueControllerBehaviorMusic *)v56 sessionID];
                [(_MPCQueueControllerBehaviorMusicDataSourceState *)v71 sectionIdentifier];
                id v98 = v13;
                v99 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v143 = v96;
                __int16 v144 = 2114;
                v145 = v97;
                __int16 v146 = 2114;
                v147 = v99;
                _os_log_impl(&dword_21BB87000, v95, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | adding data source [] position=Last section=%{public}@", buf, 0x20u);

                id v13 = v98;
                uint64_t v48 = v120;
                id v56 = v128;

                __int16 v16 = v127;
              }

              v100 = *p_autoPlayIdentifierList;
              v86 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v71 sectionIdentifier];
              [(MPSectionedIdentifierList *)v100 addDataSourceAtEnd:v71 section:v86 completion:v123];
              goto LABEL_57;
            case 3:
              id v129 = v13;
              v74 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
              if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
              {
                v126 = [v121 engineID];
                SEL v75 = [(_MPCQueueControllerBehaviorMusic *)v56 sessionID];
                v76 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v71 sectionIdentifier];
                v77 = [v122 itemID];
                __int16 v78 = [v122 sectionID];
                *(_DWORD *)buf = 138544386;
                v143 = v126;
                __int16 v144 = 2114;
                v145 = v75;
                __int16 v146 = 2114;
                v147 = v76;
                __int16 v148 = 2114;
                id v149 = v77;
                __int16 v150 = 2114;
                v151 = v78;
                v79 = "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | adding data source [] position=Specifi"
                      "ed section=%{public}@ afterItem=%{public}@ inSection=%{public}@";
LABEL_52:
                _os_log_impl(&dword_21BB87000, v74, OS_LOG_TYPE_DEFAULT, v79, buf, 0x34u);
              }
LABEL_53:

              v101 = *p_autoPlayIdentifierList;
              v86 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v71 sectionIdentifier];
              v102 = [v122 itemID];
              v103 = [v122 sectionID];
              [(MPSectionedIdentifierList *)v101 addDataSource:v71 section:v86 afterItem:v102 inSection:v103 completion:v123];

              __int16 v16 = v127;
              id v13 = v129;
              goto LABEL_57;
            case 4:
              v104 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
              if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v105 = [v121 engineID];
                v106 = [(_MPCQueueControllerBehaviorMusic *)v56 sessionID];
                [(_MPCQueueControllerBehaviorMusicDataSourceState *)v71 sectionIdentifier];
                id v107 = v13;
                v108 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v143 = v105;
                __int16 v144 = 2114;
                v145 = v106;
                __int16 v146 = 2114;
                v147 = v108;
                _os_log_impl(&dword_21BB87000, v104, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | adding data source [] position=Start section=%{public}@", buf, 0x20u);

                id v13 = v107;
                uint64_t v48 = v120;
                id v56 = v128;

                __int16 v16 = v127;
              }

              v109 = *p_autoPlayIdentifierList;
              v86 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v71 sectionIdentifier];
              [(MPSectionedIdentifierList *)v109 addDataSourceAtStart:v71 section:v86 completion:v123];
              goto LABEL_57;
            default:
              uint64_t v48 = v120;
              if (a4 == 100)
              {
                __int16 v80 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
                if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
                {
                  v81 = [v121 engineID];
                  uint64_t v82 = [(_MPCQueueControllerBehaviorMusic *)v56 sessionID];
                  [(_MPCQueueControllerBehaviorMusicDataSourceState *)v71 sectionIdentifier];
                  id v83 = v13;
                  v84 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138544130;
                  v143 = v81;
                  __int16 v144 = 2114;
                  v145 = v82;
                  __int16 v146 = 2114;
                  v147 = v84;
                  __int16 v148 = 2114;
                  id v149 = v132;
                  _os_log_impl(&dword_21BB87000, v80, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | adding data source [] position=AfterSection section=%{public}@ afterSection=%{public}@", buf, 0x2Au);

                  id v13 = v83;
                  uint64_t v48 = v120;
                  id v56 = v128;

                  __int16 v16 = v127;
                }

                v85 = *p_autoPlayIdentifierList;
                v86 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v71 sectionIdentifier];
                [(MPSectionedIdentifierList *)v85 addDataSource:v71 section:v86 afterTailOfSection:v132 completion:v123];
              }
              else
              {
LABEL_46:
                v86 = [MEMORY[0x263F08690] currentHandler];
                objc_msgSend(v86, "handleFailureInMethod:object:file:lineNumber:description:", a2, v56, @"_MPCQueueControllerBehaviorMusic.m", 3141, @"Unsupported insertion position %d for %s | ", a4, "-[_MPCQueueControllerBehaviorMusic _addAutoPlayPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:]");
              }
LABEL_57:

              lldiv_t v21 = v130;
              if ((v131 & 0x10) == 0 && !v56->_hasUserMutations) {
                v56->_hasUserMutations = 1;
              }
              [v121 behaviorDidChange];

              id v23 = v122;
              v94 = (MPSectionedIdentifierList *)v118;
              break;
          }
LABEL_61:

LABEL_62:
          goto LABEL_63;
        }
LABEL_25:
        uint64_t v51 = 0;
        goto LABEL_26;
      }
      int v39 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        long long v40 = [v16 engineID];
        long long v41 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        [v23 deferredNextContentItemID];
        uint64_t v42 = v23;
        long long v43 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v143 = v40;
        __int16 v144 = 2114;
        v145 = v41;
        __int16 v146 = 2114;
        v147 = v43;
        _os_log_impl(&dword_21BB87000, v39, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | converting PositionHead to PositionSpecified after deferredNextContentItem [head (current item was placeholder)] deferredNextContentItem=%{public}@", buf, 0x20u);

        id v23 = v42;
      }

      uint64_t v44 = [v23 deferredNextContentItemID];

      if (!v44)
      {
        lldiv_t v21 = v130;
        [(MPSectionedIdentifierList *)v130 rollback];
        v110 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        {
          uint64_t v111 = [v16 engineID];
          v112 = self;
          v113 = v23;
          v114 = (void *)v111;
          [(_MPCQueueControllerBehaviorMusic *)v112 sessionID];
          v116 = v115 = v15;
          *(_DWORD *)buf = 138543618;
          v143 = v114;
          __int16 v144 = 2114;
          v145 = v116;
          _os_log_impl(&dword_21BB87000, v110, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | failed to convert to deferredNextContentItem PositionSpecified [deferredNextContentItemID is nil]", buf, 0x16u);

          BOOL v15 = v115;
          id v23 = v113;
        }

        uint64_t v37 = (void *)MEMORY[0x263F087E8];
        int v38 = @"The specified insertion position [head] was unsupported because the current item is a placeholder and there is no deferredNextContentItemAnchorID.";
        goto LABEL_67;
      }
    }
    uint64_t v45 = [v23 deferredNextContentItemID];
    uint64_t v46 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v45];
    __int16 v47 = v23;
    id v23 = (void *)v46;

LABEL_19:
    a4 = 3;
    goto LABEL_22;
  }
  uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = [v16 engineID];
    [(_MPCQueueControllerBehaviorMusic *)self sessionID];
    v20 = unint64_t v19 = v16;
    *(_DWORD *)buf = 138543618;
    v143 = v18;
    __int16 v144 = 2114;
    v145 = v20;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _addAutoPlayPlaybackContext: | failed [insert at Tail is not supported -- MediaPlayer/QueueFA is OFF]", buf, 0x16u);

    __int16 v16 = v19;
  }

  objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, @"Cannot insert at Tail [MediaPlayer/QueueFA is OFF");
  lldiv_t v21 = (MPSectionedIdentifierList *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, v21);
LABEL_63:
}

- (void)_addPlaybackContext:(id)a3 atPosition:(int64_t)a4 afterContentItemID:(id)a5 sectionIdentifier:(id)a6 actions:(unint64_t)a7 completion:(id)a8
{
  uint64_t v182 = *MEMORY[0x263EF8340];
  id v158 = a3;
  id v157 = a5;
  id v156 = a6;
  BOOL v15 = (void (**)(id, void *))a8;
  __int16 v16 = [(_MPCQueueControllerBehaviorMusic *)self host];
  if (a4 != 1)
  {
    SEL v140 = a2;
    long long v20 = (void *)[v158 copy];
    lldiv_t v21 = [NSString stringWithFormat:@"BehaviorMusic-addPlaybackContext-<%@: %p>", objc_opt_class(), v20];
    v155 = [v16 beginEditWithReason:v21];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_musicBehaviorDelegate);
    if (a4 == 3)
    {
      uint64_t v22 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v157];
      if ([v22 type] != 3)
      {
        int64_t v143 = 3;
        goto LABEL_23;
      }
      uint64_t v36 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v37 = [v16 engineID];
        int v38 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        [v22 deferredNextContentItemID];
        unint64_t v150 = a7;
        int v39 = self;
        long long v40 = v22;
        long long v41 = v20;
        uint64_t v42 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v173 = v37;
        __int16 v174 = 2114;
        v175 = v38;
        __int16 v176 = 2114;
        v177 = v42;
        _os_log_impl(&dword_21BB87000, v36, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | converting PositionSpecified item to deferredNextContentItem [specified placeholder item] deferredNextContentItem=%{public}@", buf, 0x20u);

        long long v20 = v41;
        uint64_t v22 = v40;
        self = v39;
        a7 = v150;
      }
      long long v43 = [v22 deferredNextContentItemID];

      if (!v43)
      {
        char v131 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v131, OS_LOG_TYPE_DEFAULT))
        {
          id v132 = [v16 engineID];
          id v133 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
          *(_DWORD *)buf = 138543874;
          v173 = v132;
          __int16 v174 = 2114;
          v175 = v133;
          __int16 v176 = 2114;
          v177 = v155;
          _os_log_impl(&dword_21BB87000, v131, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | failed to convert to deferredNextContentItem PositionSpecified [deferredNextContentItemID is nil] edit=%{public}@", buf, 0x20u);
        }
        [(_MPCQueueControllerBehaviorMusicDataSourceState *)v155 rollback];
        uint64_t v34 = (void *)MEMORY[0x263F087E8];
        uint64_t v35 = @"The specified insertion position [specified] was unsupported because the specified item is a placeholder and there is no deferredNextContentItemAnchorID.";
        goto LABEL_93;
      }
    }
    else
    {
      if (a4)
      {
        p_identifierList = &self->_identifierList;
        uint64_t v152 = self->_identifierList;
        if (a4 == 2)
        {
          dataSources = self->_dataSources;
          v169[0] = MEMORY[0x263EF8330];
          v169[1] = 3221225472;
          v169[2] = __123___MPCQueueControllerBehaviorMusic__addPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke;
          v169[3] = &unk_2643C0000;
          id v170 = v16;
          v171 = self;
          [(NSMutableDictionary *)dataSources enumerateKeysAndObjectsUsingBlock:v169];

          uint64_t v22 = 0;
          int64_t v143 = 2;
        }
        else
        {
          int64_t v143 = a4;
          uint64_t v22 = 0;
        }
        goto LABEL_29;
      }
      uint64_t v22 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v157];
      if ([v22 type] != 3)
      {
        int64_t v143 = 0;
        goto LABEL_23;
      }
      id v23 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [v16 engineID];
        int v25 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        [v22 deferredNextContentItemID];
        unint64_t v149 = a7;
        int64_t v26 = self;
        __int16 v27 = v22;
        dispatch_group_t v28 = v20;
        __int16 v29 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v173 = v24;
        __int16 v174 = 2114;
        v175 = v25;
        __int16 v176 = 2114;
        v177 = v29;
        _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | converting PositionHead to PositionSpecified after deferredNextContentItem [head (current item was placeholder)] deferredNextContentItem=%{public}@", buf, 0x20u);

        long long v20 = v28;
        uint64_t v22 = v27;
        self = v26;
        a7 = v149;
      }
      uint64_t v30 = [v22 deferredNextContentItemID];

      if (!v30)
      {
        uint64_t v31 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          objc_super v32 = [v16 engineID];
          __int16 v33 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
          *(_DWORD *)buf = 138543874;
          v173 = v32;
          __int16 v174 = 2114;
          v175 = v33;
          __int16 v176 = 2114;
          v177 = v155;
          _os_log_impl(&dword_21BB87000, v31, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | failed to convert to deferredNextContentItem PositionSpecified [deferredNextContentItemID is nil] edit=%{public}@", buf, 0x20u);
        }
        [(_MPCQueueControllerBehaviorMusicDataSourceState *)v155 rollback];
        uint64_t v34 = (void *)MEMORY[0x263F087E8];
        uint64_t v35 = @"The specified insertion position [head] was unsupported because the current item is a placeholder and there is no deferredNextContentItemAnchorID.";
LABEL_93:
        v130 = objc_msgSend(v34, "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, v35);
        v15[2](v15, v130);
        goto LABEL_88;
      }
    }
    uint64_t v44 = [v22 deferredNextContentItemID];
    uint64_t v45 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v44];

    int64_t v143 = 3;
    uint64_t v22 = (void *)v45;
LABEL_23:
    p_identifierList = &self->_identifierList;
    __int16 v47 = self->_identifierList;
    uint64_t v152 = v47;
    if (v22)
    {
      uint64_t v48 = v47;
      uint64_t v49 = [v22 itemID];
      v50 = [v22 sectionID];
      LOBYTE(v48) = [(MPShuffleableSectionedIdentifierList *)v48 hasItem:v49 inSection:v50];

      if ((v48 & 1) == 0)
      {
        uint64_t v51 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          uint64_t v52 = [v16 engineID];
          char v53 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
          [v22 sectionID];
          __int16 v144 = v20;
          id v54 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
          [v22 itemID];
          uint64_t v55 = v22;
          v57 = id v56 = v15;
          *(_DWORD *)buf = 138544386;
          v173 = v52;
          __int16 v174 = 2114;
          v175 = v53;
          __int16 v176 = 2114;
          v177 = v54;
          __int16 v178 = 2114;
          id v179 = v57;
          __int16 v180 = 2114;
          v181 = v155;
          _os_log_impl(&dword_21BB87000, v51, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | rolling back edit [identifierList does not contain afterItem] afterSection=%{public}@ afterItem=%{public}@ edit=%{public}@", buf, 0x34u);

          BOOL v15 = v56;
          uint64_t v22 = v55;

          long long v20 = v144;
        }

        [(_MPCQueueControllerBehaviorMusicDataSourceState *)v155 rollback];
        __int16 v58 = (void *)MEMORY[0x263F087E8];
        uint64_t v59 = [v22 contentItemID];
        char v60 = objc_msgSend(v58, "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, @"Cannot insert after unknown item (in identifier list): %@", v59);
        v15[2](v15, v60);
LABEL_87:
        v130 = v152;

LABEL_88:
        goto LABEL_89;
      }
    }
LABEL_29:
    uint64_t v61 = [v20 shuffleType];
    if (v61 == 1000)
    {
      __int16 v62 = [MEMORY[0x263F12178] standardUserDefaults];
      uint64_t v61 = [v62 musicShuffleType];

      [v20 setShuffleType:v61];
    }
    v153 = v22;
    if ((a7 & 2) != 0 && !v61 && self->_shuffleType)
    {
      self->_shuffleType = 0;
      int v63 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        int v64 = [v16 engineID];
        id v65 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        MPShuffleTypeDescription();
        int v66 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v173 = v64;
        __int16 v174 = 2114;
        v175 = v65;
        __int16 v176 = 2114;
        v177 = v66;
        _os_log_impl(&dword_21BB87000, v63, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | setting SIL shuffle type [first data source] shuffleType=%{public}@", buf, 0x20u);
      }
      [(MPShuffleableSectionedIdentifierList *)self->_identifierList setShuffleType:0];
      [(_MPCQueueControllerBehaviorMusic *)self _emitEventsForPlaybackBehaviorChangeIfNeeded];
      [WeakRetained behavior:self didChangeShuffleType:0];
    }
    int64_t v67 = [v20 repeatType];
    if (v67 == 3)
    {
      char v68 = [MEMORY[0x263F12178] standardUserDefaults];
      int64_t v67 = [v68 musicRepeatType];

      [v20 setRepeatType:v67];
    }
    if ((a7 & 4) != 0 && self->_repeatType != v67)
    {
      self->_repeatType = v67;
      [(_MPCQueueControllerBehaviorMusic *)self _emitEventsForPlaybackBehaviorChangeIfNeeded];
      [WeakRetained behavior:self didChangeRepeatType:v67];
    }
    if ([(id)objc_opt_class() supportsAutoPlay])
    {
      uint64_t v69 = [v20 queueEndAction];
      if (v69 == 1000)
      {
        id v70 = [v20 userIdentity];
        id v71 = [MEMORY[0x263F12178] standardUserDefaults];
        int v72 = [v71 autoPlayEnabledForUserIdentity:v70];

        if (v72) {
          uint64_t v69 = 3;
        }
        else {
          uint64_t v69 = 2;
        }
        [v20 setQueueEndAction:v69];
      }
      if ((a7 & 0x20) == 0 || self->_autoPlayState) {
        goto LABEL_58;
      }
      if (v69 == 3) {
        uint64_t v73 = 4;
      }
      else {
        uint64_t v73 = 5;
      }
    }
    else
    {
      if (self->_autoPlayState == 1)
      {
LABEL_58:
        v77 = [[_MPCQueueControllerBehaviorMusicDataSourceState alloc] initWithPlaybackContext:v20];
        __int16 v78 = self->_dataSources;
        v79 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v77 sectionIdentifier];
        __int16 v80 = [(NSMutableDictionary *)v78 objectForKeyedSubscript:v79];

        if (v80)
        {
          v134 = [MEMORY[0x263F08690] currentHandler];
          [v134 handleFailureInMethod:v140 object:self file:@"_MPCQueueControllerBehaviorMusic.m" lineNumber:2906 description:@"Attempting to add datasource for an already existing section."];
        }
        v81 = [v16 eventStream];
        [(_MPCQueueControllerBehaviorMusicDataSourceState *)v77 setEventStream:v81];

        uint64_t v82 = [v16 playerID];
        [(_MPCQueueControllerBehaviorMusicDataSourceState *)v77 setPlayerID:v82];

        id v83 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        unint64_t v151 = a7;
        if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
        {
          v84 = [v16 engineID];
          [(_MPCQueueControllerBehaviorMusic *)self sessionID];
          v86 = v85 = self;
          [(_MPCQueueControllerBehaviorMusicDataSourceState *)v77 sectionIdentifier];
          uint64_t v87 = v61;
          v88 = v20;
          v89 = v16;
          v91 = v90 = v15;
          *(_DWORD *)buf = 138544130;
          v173 = v84;
          __int16 v174 = 2114;
          v175 = v86;
          __int16 v176 = 2048;
          v177 = v77;
          __int16 v178 = 2114;
          id v179 = v91;
          _os_log_impl(&dword_21BB87000, v83, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | adding dataSource [] dataSource=%p section=%{public}@", buf, 0x2Au);

          BOOL v15 = v90;
          __int16 v16 = v89;
          long long v20 = v88;
          uint64_t v61 = v87;

          self = v85;
          a7 = v151;
        }
        v92 = self->_dataSources;
        v93 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v77 sectionIdentifier];
        [(NSMutableDictionary *)v92 setObject:v77 forKeyedSubscript:v93];

        v94 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v77 sectionIdentifier];
        [(_MPCQueueControllerBehaviorMusic *)self _emitEventsForAddingPlaybackContext:v158 sectionIdentifier:v94];

        aBlock[0] = MEMORY[0x263EF8330];
        aBlock[1] = 3221225472;
        aBlock[2] = __123___MPCQueueControllerBehaviorMusic__addPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_609;
        aBlock[3] = &unk_2643C0118;
        unint64_t v166 = a7;
        uint64_t v167 = v61;
        id v95 = v16;
        id v160 = v95;
        v161 = self;
        uint64_t v59 = v77;
        v162 = v59;
        id v163 = WeakRetained;
        char v168 = a7 & 1;
        v164 = v155;
        v165 = v15;
        v96 = _Block_copy(aBlock);
        if ((a7 & 2) == 0)
        {
          v97 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v59 playbackContext];
          [v97 setShuffleType:0];
        }
        if ((a7 & 1) == 0)
        {
          id v98 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v59 playbackContext];
          [v98 clearStartItem];
        }
        switch(v143)
        {
          case 0:
            v145 = v20;
            char v141 = v15;
            v99 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
            if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
            {
              v138 = [v95 engineID];
              v136 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
              v100 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v59 sectionIdentifier];
              id v135 = [v153 itemID];
              [v153 sectionID];
              a7 = (unint64_t)self;
              v101 = v96;
              v102 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v173 = v138;
              __int16 v174 = 2114;
              v175 = v136;
              __int16 v176 = 2114;
              v177 = v100;
              __int16 v178 = 2114;
              id v179 = v135;
              __int16 v180 = 2114;
              v181 = v102;
              _os_log_impl(&dword_21BB87000, v99, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | adding data source [] position=Head section=%{public}@ afterItem=%{public}@ inSection=%{public}@", buf, 0x34u);

              v96 = v101;
              self = (_MPCQueueControllerBehaviorMusic *)a7;
              LOBYTE(a7) = v151;
            }
            goto LABEL_79;
          case 1:
            goto LABEL_73;
          case 2:
            v110 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
            if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v111 = [v95 engineID];
              [(_MPCQueueControllerBehaviorMusic *)self sessionID];
              v112 = a7 = (unint64_t)v20;
              [(_MPCQueueControllerBehaviorMusicDataSourceState *)v59 sectionIdentifier];
              v147 = v16;
              v113 = v15;
              v114 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v173 = v111;
              __int16 v174 = 2114;
              v175 = v112;
              __int16 v176 = 2114;
              v177 = v114;
              _os_log_impl(&dword_21BB87000, v110, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | adding data source [] position=Last section=%{public}@", buf, 0x20u);

              BOOL v15 = v113;
              __int16 v16 = v147;

              long long v20 = (void *)a7;
              LOBYTE(a7) = v151;
            }
            v115 = *p_identifierList;
            v109 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v59 sectionIdentifier];
            [(MPShuffleableSectionedIdentifierList *)v115 addDataSourceAtEnd:v59 section:v109 sequentially:1 completion:v96];
            goto LABEL_83;
          case 3:
            v145 = v20;
            char v141 = v15;
            v99 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
            if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
            {
              v116 = [v95 engineID];
              id v137 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
              v117 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v59 sectionIdentifier];
              [v153 itemID];
              id v118 = v139 = v95;
              [v153 sectionID];
              a7 = (unint64_t)self;
              v119 = v96;
              v120 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544386;
              v173 = v116;
              __int16 v174 = 2114;
              v175 = v137;
              __int16 v176 = 2114;
              v177 = v117;
              __int16 v178 = 2114;
              id v179 = v118;
              __int16 v180 = 2114;
              v181 = v120;
              _os_log_impl(&dword_21BB87000, v99, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | adding data source [] position=Specified section=%{public}@ afterItem=%{public}@ inSection=%{public}@", buf, 0x34u);

              v96 = v119;
              self = (_MPCQueueControllerBehaviorMusic *)a7;
              LOBYTE(a7) = v151;

              id v95 = v139;
            }
LABEL_79:

            id v121 = *p_identifierList;
            v109 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v59 sectionIdentifier];
            v122 = [v153 itemID];
            v123 = [v153 sectionID];
            [(MPShuffleableSectionedIdentifierList *)v121 addDataSource:v59 section:v109 sequentially:1 afterItem:v122 inSection:v123 completion:v96];

            BOOL v15 = v141;
            long long v20 = v145;
            goto LABEL_83;
          case 4:
            v124 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
            if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
            {
              v125 = [v95 engineID];
              [(_MPCQueueControllerBehaviorMusic *)self sessionID];
              v126 = a7 = (unint64_t)v20;
              [(_MPCQueueControllerBehaviorMusicDataSourceState *)v59 sectionIdentifier];
              __int16 v148 = v16;
              v127 = v15;
              v128 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v173 = v125;
              __int16 v174 = 2114;
              v175 = v126;
              __int16 v176 = 2114;
              v177 = v128;
              _os_log_impl(&dword_21BB87000, v124, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | adding data source [] position=Start section=%{public}@", buf, 0x20u);

              BOOL v15 = v127;
              __int16 v16 = v148;

              long long v20 = (void *)a7;
              LOBYTE(a7) = v151;
            }
            id v129 = *p_identifierList;
            v109 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v59 sectionIdentifier];
            [(MPShuffleableSectionedIdentifierList *)v129 addDataSourceAtStart:v59 section:v109 completion:v96];
            goto LABEL_83;
          default:
            if (v143 == 100)
            {
              v103 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
              if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
              {
                v104 = [v95 engineID];
                [(_MPCQueueControllerBehaviorMusic *)self sessionID];
                uint64_t v105 = a7 = (unint64_t)v20;
                [(_MPCQueueControllerBehaviorMusicDataSourceState *)v59 sectionIdentifier];
                __int16 v146 = v16;
                v106 = v15;
                id v107 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v173 = v104;
                __int16 v174 = 2114;
                v175 = v105;
                __int16 v176 = 2114;
                v177 = v107;
                __int16 v178 = 2114;
                id v179 = v156;
                _os_log_impl(&dword_21BB87000, v103, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | adding data source [] position=AfterSection section=%{public}@ afterSection=%{public}@", buf, 0x2Au);

                BOOL v15 = v106;
                __int16 v16 = v146;

                long long v20 = (void *)a7;
                LOBYTE(a7) = v151;
              }
              v108 = *p_identifierList;
              v109 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v59 sectionIdentifier];
              [(MPShuffleableSectionedIdentifierList *)v108 addDataSource:v59 section:v109 sequentially:1 afterTailOfSection:v156 completion:v96];
            }
            else
            {
LABEL_73:
              v109 = [MEMORY[0x263F08690] currentHandler];
              objc_msgSend(v109, "handleFailureInMethod:object:file:lineNumber:description:", v140, self, @"_MPCQueueControllerBehaviorMusic.m", 2987, @"Unsupported insertion position %d for %s | ", v143, "-[_MPCQueueControllerBehaviorMusic _addPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:]");
            }
LABEL_83:

            if ((a7 & 0x10) == 0 && !self->_hasUserMutations) {
              self->_hasUserMutations = 1;
            }
            [v95 behaviorDidChange];

            char v60 = v160;
            uint64_t v22 = v153;
            break;
        }
        goto LABEL_87;
      }
      v74 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        SEL v75 = [v16 engineID];
        v76 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        *(_DWORD *)buf = 138543618;
        v173 = v75;
        __int16 v174 = 2114;
        v175 = v76;
        _os_log_impl(&dword_21BB87000, v74, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | disabling auto play [data source unsupported]", buf, 0x16u);
      }
      uint64_t v73 = 1;
    }
    [(_MPCQueueControllerBehaviorMusic *)self _transitionToAutoPlayState:v73];
    goto LABEL_58;
  }
  uint64_t v17 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = [v16 engineID];
    unint64_t v19 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
    *(_DWORD *)buf = 138543618;
    v173 = v18;
    __int16 v174 = 2114;
    v175 = v19;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _addPlaybackContext: | failed [insert at Tail is not supported -- MediaPlayer/QueueFA is OFF]", buf, 0x16u);
  }
  long long v20 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, @"Cannot insert at Tail [MediaPlayer/QueueFA is OFF]");
  v15[2](v15, v20);
LABEL_89:
}

- (id)_accountForAutoPlay
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = +[MPCPlaybackAccountManager sharedManager];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(MPShuffleableSectionedIdentifierList *)self->_identifierList allSectionIdentifiers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [(NSMutableDictionary *)self->_dataSources objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        int64_t v10 = [v9 playbackContext];
        int64_t v11 = [v10 userIdentity];
        if (v11)
        {
          int v12 = [v3 accountForUserIdentity:v11];
          if ([v12 canAutoPlay])
          {

            goto LABEL_13;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  int v12 = 0;
LABEL_13:

  return v12;
}

- (id)queueReferencesWithMaxCount:(int64_t)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = [(_MPCQueueControllerBehaviorMusic *)self host];
  uint64_t v45 = self;
  uint64_t v5 = [(_MPCQueueControllerBehaviorMusic *)self _accountForAutoPlay];

  uint64_t v6 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int64_t v8 = [v4 engineID];
      id v9 = [(_MPCQueueControllerBehaviorMusic *)v45 sessionID];
      *(_DWORD *)buf = 138543874;
      __int16 v47 = v8;
      __int16 v48 = 2114;
      uint64_t v49 = v9;
      __int16 v50 = 2048;
      int64_t v51 = a3;
      _os_log_impl(&dword_21BB87000, v6, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] queueReferencesWithMaxCount: | enumerating items [] maxCount=%ld", buf, 0x20u);
    }
    long long v41 = v4;

    uint64_t v6 = [MEMORY[0x263EFF980] arrayWithCapacity:a3];
    long long v43 = +[_MPCQueueControllerEnumerator enumeratorWithMusicBehavior:v45 mode:1 options:8 startPosition:0 endPosition:0];
    uint64_t v10 = [v43 nextObject];
    if (v10)
    {
      int64_t v11 = (void *)v10;
      uint64_t v42 = v6;
      while (1)
      {
        if ([v6 count] >= (unint64_t)a3)
        {
LABEL_17:

          goto LABEL_18;
        }
        int v12 = (void *)MEMORY[0x21D49E0F0]();
        dataSources = v45->_dataSources;
        long long v14 = [v11 itemResult];
        long long v15 = [v14 sectionIdentifier];
        long long v16 = [(NSMutableDictionary *)dataSources objectForKeyedSubscript:v15];

        long long v17 = [v16 dataSource];
        uint64_t v18 = [v11 itemResult];
        uint64_t v19 = [v18 itemIdentifier];
        long long v20 = [v11 itemResult];
        lldiv_t v21 = [v20 sectionIdentifier];
        int v22 = [v17 supportsAutoPlayForItem:v19 inSection:v21];

        if (v22) {
          break;
        }
LABEL_16:

        uint64_t v35 = [v43 nextObject];

        int64_t v11 = (void *)v35;
        if (!v35) {
          goto LABEL_17;
        }
      }
      id v23 = [v11 itemResult];
      id v24 = [v23 sectionIdentifier];
      int v25 = [v11 itemResult];
      int64_t v26 = [v25 itemIdentifier];
      __int16 v27 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v24 itemID:v26];

      dispatch_group_t v28 = [(_MPCQueueControllerBehaviorMusic *)v45 _itemForComponents:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v29 = v28;
        uint64_t v30 = [v29 trackInfo];
        if ([v30 count])
        {
          uint64_t v31 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v29, "storeItemInt64ID"));
          objc_super v32 = +[MPCModelRadioContentReference referenceWithStoreIdentifier:v31 trackInfo:v30];

          uint64_t v6 = v42;
          if (v32) {
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
      __int16 v33 = [v28 modelGenericObject];
      uint64_t v34 = [v28 modelPlayEvent];
      objc_super v32 = +[MPCModelRadioContentReference referenceWithMPModelObject:v33 containerModelPlayEvent:v34];

      uint64_t v6 = v42;
      if (!v32)
      {
LABEL_15:

        goto LABEL_16;
      }
LABEL_14:
      [v6 insertObject:v32 atIndex:0];

      goto LABEL_15;
    }
LABEL_18:
    id v36 = [v6 copy];

    id v4 = v41;
  }
  else
  {
    if (v7)
    {
      uint64_t v37 = [v4 engineID];
      [(_MPCQueueControllerBehaviorMusic *)v45 sessionID];
      v39 = int v38 = v6;
      *(_DWORD *)buf = 138543618;
      __int16 v47 = v37;
      __int16 v48 = 2114;
      uint64_t v49 = v39;
      _os_log_impl(&dword_21BB87000, v38, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] queueReferencesWithMaxCount: | returning no items [_accountForAutoPlay was nil]", buf, 0x16u);

      uint64_t v6 = v38;
    }
    id v36 = (id)MEMORY[0x263EFFA68];
  }

  return v36;
}

- (void)didDequeueShuffledItemsInSectionedIdentifierList:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85___MPCQueueControllerBehaviorMusic_didDequeueShuffledItemsInSectionedIdentifierList___block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidUpdateSection:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __87___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidUpdateSection___block_invoke;
  v7[3] = &unk_2643C5EE8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidChangeItems:(id)a4 inSection:(id)a5
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidChangeItems_inSection___block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidUpdateItems:(id)a4 inSection:(id)a5
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __95___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidUpdateItems_inSection___block_invoke;
  block[3] = &unk_2643C5FC8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidAddItems:(id)a4 toSection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __92___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidAddItems_toSection___block_invoke;
  v14[3] = &unk_2643C36A8;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidRemoveItems:(id)a4 fromSection:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __97___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidRemoveItems_fromSection___block_invoke;
  v14[3] = &unk_2643C36A8;
  v14[4] = self;
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidMoveItems:(id)a4 inSection:(id)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v8 = a4;
  id v23 = a5;
  long long v20 = self;
  id v9 = [(_MPCQueueControllerBehaviorMusic *)self host];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v24 objects:v38 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v15 = [v9 eventStream];
        v36[0] = @"queue-section-id";
        v36[1] = @"queue-item-id";
        v37[0] = v23;
        v37[1] = v14;
        id v16 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
        [v15 emitEventType:@"queue-item-reorder" payload:v16];
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v24 objects:v38 count:16];
    }
    while (v11);
  }

  id v17 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v9 engineID];
    uint64_t v19 = [(_MPCQueueControllerBehaviorMusic *)v20 sessionID];
    *(_DWORD *)buf = 138544130;
    id v29 = v18;
    __int16 v30 = 2114;
    uint64_t v31 = v19;
    __int16 v32 = 2048;
    id v33 = v21;
    __int16 v34 = 2114;
    id v35 = v23;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] sectionedIdentifierList:%p dataSourceDidMoveItems:inSection:%{public}@ | editing [data source moved items]", buf, 0x2Au);
  }
}

- (void)sectionedIdentifierList:(id)a3 dataSourceDidEndTransactionForSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __98___MPCQueueControllerBehaviorMusic_sectionedIdentifierList_dataSourceDidEndTransactionForSection___block_invoke;
  block[3] = &unk_2643C6660;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

- (id)debugDescriptionForItem:(id)a3 inSection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v7];
  if ([v8 hasItem:v6 inSection:v7]
    && ([v8 isDeletedItem:v6 inSection:v7] & 1) == 0)
  {
    uint64_t v10 = +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:v7 itemID:v6];
    id v11 = [v10 contentItemID];
    id v12 = [(_MPCQueueControllerBehaviorMusic *)self _itemForContentItemID:v11];
    id v13 = [v12 contentItemID];

    uint64_t v14 = [v10 type];
    id v15 = NSString;
    if ((v14 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
      id v16 = @"⏳";
    }
    else {
      id v16 = @"▫️";
    }
    id v17 = [v12 mainTitle];
    id v9 = [v15 stringWithFormat:@"%@ %@", v16, v17];
  }
  else
  {
    id v9 = @"▫️ (null)";
  }

  return v9;
}

- (id)debugDescriptionForSection:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = [(NSMutableDictionary *)self->_dataSources objectForKeyedSubscript:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 playbackContext];
    id v6 = [v5 descriptionComponents];
    unint64_t v7 = [v4 state];
    if (v7 > 4) {
      id v8 = @"▫️";
    }
    else {
      id v8 = off_2643C02B0[v7];
    }
    if ([v4 isFrozen])
    {
      id v8 = [(__CFString *)v8 stringByAppendingString:@"❄️"];
    }
    uint64_t v10 = (void *)MEMORY[0x263F089D8];
    int v22 = v5;
    id v11 = [(id)objc_opt_class() description];
    id v21 = v8;
    id v9 = [v10 stringWithFormat:@"%@ %@", v8, v11];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = [v6 allKeys];
    id v13 = [v12 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v19 = [v6 objectForKeyedSubscript:v18];
          [v9 appendFormat:@" %@=%@", v18, v19];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)visualIdenticalityIdentifierForCatalog:(id)a3
{
  return @"AutoPlayPlaceholderArtworkVisualIdenticality";
}

- (void)loadRepresentationForArtworkCatalog:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __90___MPCQueueControllerBehaviorMusic_loadRepresentationForArtworkCatalog_completionHandler___block_invoke;
  v7[3] = &unk_2643C55A8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

- (BOOL)isRepresentation:(id)a3 bestRepresentationForArtworkCatalog:(id)a4
{
  return a3 != 0;
}

- (id)existingRepresentationForArtworkCatalog:(id)a3
{
  return 0;
}

- (BOOL)areRepresentationsAvailableForCatalog:(id)a3
{
  return 1;
}

- (void)clearAllItemsAfterContentItemID:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_MPCQueueControllerBehaviorMusic *)self host];
  id v6 = [(_MPCQueueControllerBehaviorMusic *)self tailInsertionContentItemIDForTargetContentItemID:v4];
  if (v6)
  {
    int v38 = v5;
    uint64_t v37 = [v5 beginEditWithReason:@"BehaviorMusic-clearUpNext"];
    id v39 = v4;
    unint64_t v7 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v4];
    id v8 = (void *)MEMORY[0x263F12210];
    id v9 = [v7 itemID];
    id v36 = v7;
    uint64_t v10 = [v7 sectionID];
    uint64_t v11 = [v8 positionForItem:v9 inSection:v10];

    id v12 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v6];
    id v13 = (void *)MEMORY[0x263F12210];
    uint64_t v14 = [v12 itemID];
    uint64_t v15 = [v12 sectionID];
    uint64_t v16 = [v13 positionForItem:v14 inSection:v15];

    __int16 v34 = (void *)v16;
    id v35 = (void *)v11;
    id v17 = +[_MPCQueueControllerEnumerator enumeratorWithMusicBehavior:self mode:1 options:64 startPosition:v11 endPosition:v16];
    uint64_t v18 = [v17 nextObject];
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      do
      {
        long long v20 = [v19 itemResult];
        id v21 = [v20 sectionIdentifier];
        int v22 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v21];

        long long v23 = [v19 itemResult];
        long long v24 = [v23 itemIdentifier];
        long long v25 = [v19 itemResult];
        long long v26 = [v25 sectionIdentifier];
        [v22 removeItem:v24 fromSection:v26];

        uint64_t v27 = [v17 nextObject];

        uint64_t v19 = (void *)v27;
      }
      while (v27);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68___MPCQueueControllerBehaviorMusic_clearAllItemsAfterContentItemID___block_invoke;
    block[3] = &unk_2643C5FC8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    if (!self->_hasUserMutations) {
      self->_hasUserMutations = 1;
    }
    uint64_t v28 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    id v5 = v38;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = [v38 engineID];
      __int16 v30 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v29;
      __int16 v43 = 2114;
      uint64_t v44 = v30;
      _os_log_impl(&dword_21BB87000, v28, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] clearAllItemsAfterContentItemID: | committing edit [queue updated]", buf, 0x16u);
    }
    uint64_t v31 = v37;
    [v37 commit];

    id v4 = v39;
  }
  else
  {
    uint64_t v31 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v32 = [v5 engineID];
      id v33 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
      *(_DWORD *)buf = 138543618;
      uint64_t v42 = v32;
      __int16 v43 = 2114;
      uint64_t v44 = v33;
      _os_log_impl(&dword_21BB87000, v31, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] clearAllItemsAfterContentItemID: | ignoring [tailInsertionContentItemID is nil]", buf, 0x16u);
    }
  }
}

- (void)removeContentItemID:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = (void (**)(id, void))a4;
  unint64_t v7 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:a3];
  id v8 = [v7 sectionID];
  id v9 = [v7 itemID];
  uint64_t v10 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v8];
  if ([v10 hasItem:v9 inSection:v8])
  {
    uint64_t v11 = [(_MPCQueueControllerBehaviorMusic *)self host];
    id v12 = [v11 beginEditWithReason:@"BehaviorMusic-removeItem"];
    id v13 = [(NSMutableDictionary *)self->_dataSources objectForKeyedSubscript:v8];
    int v14 = [v13 containsLiveStream];

    if (v14)
    {
      uint64_t v15 = [(NSMutableDictionary *)self->_dataSources objectForKeyedSubscript:v8];
      [v15 setFrozen:1];
    }
    [v10 removeItem:v9 fromSection:v8];
    if (!self->_hasUserMutations) {
      self->_hasUserMutations = 1;
    }
    uint64_t v16 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v11 engineID];
      [(_MPCQueueControllerBehaviorMusic *)self sessionID];
      id v21 = v11;
      uint64_t v19 = v18 = v12;
      *(_DWORD *)buf = 138543618;
      long long v24 = v17;
      __int16 v25 = 2114;
      long long v26 = v19;
      _os_log_impl(&dword_21BB87000, v16, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] removeContentItemID:completion: | committing edit [update removed item]", buf, 0x16u);

      id v12 = v18;
      uint64_t v11 = v21;
    }
    [v12 commit];
    [(_MPCQueueControllerBehaviorMusic *)self _evaluateLoadingDataSourceItemThresholds];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __67___MPCQueueControllerBehaviorMusic_removeContentItemID_completion___block_invoke;
    block[3] = &unk_2643C5FC8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    v6[2](v6, 0);
  }
  else
  {
    long long v20 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 5, @"Requested removing content item that is not in the queue.");
    ((void (**)(id, void *))v6)[2](v6, v20);
  }
}

- (BOOL)canRemoveContentItemID:(id)a3 reason:(id *)a4
{
  return 1;
}

- (void)moveContentItemID:(id)a3 beforeContentItemID:(id)a4 completion:(id)a5
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v9 = (void (**)(id, void))a5;
  id v10 = a4;
  uint64_t v11 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:a3];
  id v12 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v10];

  id v13 = [v11 sectionID];
  int v14 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v13];

  uint64_t v15 = [v11 itemID];
  uint64_t v16 = [v11 sectionID];
  char v17 = [v14 hasItem:v15 inSection:v16];

  if (v17)
  {
    uint64_t v18 = [v12 sectionID];
    uint64_t v19 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v18];

    long long v20 = [v12 itemID];
    id v21 = [v12 sectionID];
    char v22 = [v19 hasItem:v20 inSection:v21];

    if (v22)
    {
      if (v14 == v19)
      {
        uint64_t v45 = v19;
        __int16 v48 = [(_MPCQueueControllerBehaviorMusic *)self host];
        __int16 v47 = [v48 beginEditWithReason:@"BehaviorMusic-moveItemBeforeItem"];
        uint64_t v27 = (void *)MEMORY[0x263F12210];
        uint64_t v28 = [v12 itemID];
        id v29 = [v12 sectionID];
        __int16 v30 = [v27 positionForItem:v28 inSection:v29];
        uint64_t v31 = [v14 enumeratorWithOptions:9 startPosition:v30 endPosition:0];

        uint64_t v46 = v31;
        __int16 v32 = [v31 nextObject];
        switch([v32 entryType])
        {
          case 0:
          case 1:
          case 5:
            id v33 = [MEMORY[0x263F08690] currentHandler];
            objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_MPCQueueControllerBehaviorMusic.m", 2375, @"Unexpected entry type when reverse enumerating for before item: %d", objc_msgSend(v32, "entryType"));
            goto LABEL_16;
          case 2:
            id v33 = [v11 itemID];
            __int16 v34 = [v11 sectionID];
            id v35 = [v32 trackingEntryResult];
            id v36 = [v35 sectionIdentifier];
            [v14 moveItem:v33 fromSection:v34 afterHeadOfSection:v36];
            goto LABEL_15;
          case 3:
            id v33 = [v11 itemID];
            uint64_t v44 = [v11 sectionID];
            __int16 v43 = [v32 itemResult];
            uint64_t v37 = [v43 itemIdentifier];
            int v38 = [v32 itemResult];
            id v39 = [v38 sectionIdentifier];
            [v14 moveItem:v33 fromSection:v44 afterItem:v37 inSection:v39];

            goto LABEL_16;
          case 4:
            id v33 = [v11 itemID];
            __int16 v34 = [v11 sectionID];
            id v35 = [v32 trackingEntryResult];
            id v36 = [v35 sectionIdentifier];
            [v14 moveItem:v33 fromSection:v34 afterTailOfSection:v36];
LABEL_15:

LABEL_16:
            break;
          default:
            break;
        }
        if (!self->_hasUserMutations) {
          self->_hasUserMutations = 1;
        }
        long long v40 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        uint64_t v19 = v45;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          long long v41 = [v48 engineID];
          uint64_t v42 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
          *(_DWORD *)buf = 138543618;
          int64_t v51 = v41;
          __int16 v52 = 2114;
          char v53 = v42;
          _os_log_impl(&dword_21BB87000, v40, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] moveContentItemID:beforeContentItemID:completion: | committing edit [update for move before]", buf, 0x16u);
        }
        [v47 commit];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __85___MPCQueueControllerBehaviorMusic_moveContentItemID_beforeContentItemID_completion___block_invoke;
        block[3] = &unk_2643C5FC8;
        block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
        [(_MPCQueueControllerBehaviorMusic *)self _evaluateLoadingDataSourceItemThresholds];
        v9[2](v9, 0);

        goto LABEL_8;
      }
      long long v23 = (void *)MEMORY[0x263F087E8];
      long long v24 = @"Received a move command but the source and target lists are not the same. Moving items between auto play and the queue is not supported.";
    }
    else
    {
      long long v23 = (void *)MEMORY[0x263F087E8];
      long long v24 = @"Received a move command but the target is not available in the queue.";
    }
    long long v26 = objc_msgSend(v23, "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 5, v24);
    ((void (**)(id, void *))v9)[2](v9, v26);

LABEL_8:
    goto LABEL_9;
  }
  __int16 v25 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 5, @"Received a move command but the source is not available in the queue.");
  ((void (**)(id, void *))v9)[2](v9, v25);

LABEL_9:
}

- (void)moveContentItemID:(id)a3 afterContentItemID:(id)a4 completion:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = (void (**)(id, void))a5;
  id v9 = a4;
  id v10 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:a3];
  uint64_t v11 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v9];

  id v12 = [v10 sectionID];
  id v13 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v12];

  int v14 = [v10 itemID];
  uint64_t v15 = [v10 sectionID];
  char v16 = [v13 hasItem:v14 inSection:v15];

  if (v16)
  {
    char v17 = [v11 sectionID];
    uint64_t v18 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v17];

    uint64_t v19 = [v11 itemID];
    long long v20 = [v11 sectionID];
    char v21 = [v18 hasItem:v19 inSection:v20];

    if (v21)
    {
      if (v13 == v18)
      {
        __int16 v34 = [(_MPCQueueControllerBehaviorMusic *)self host];
        id v33 = [v34 beginEditWithReason:@"BehaviorMusic-moveItemAfterItem"];
        long long v26 = [v10 itemID];
        uint64_t v27 = [v10 sectionID];
        uint64_t v28 = [v11 itemID];
        id v29 = [v11 sectionID];
        [v13 moveItem:v26 fromSection:v27 afterItem:v28 inSection:v29];

        if (!self->_hasUserMutations) {
          self->_hasUserMutations = 1;
        }
        __int16 v30 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = [v34 engineID];
          __int16 v32 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
          *(_DWORD *)buf = 138543618;
          uint64_t v37 = v31;
          __int16 v38 = 2114;
          id v39 = v32;
          _os_log_impl(&dword_21BB87000, v30, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] moveContentItemID:afterContentItemID:completion: | committing edit [update for move after]", buf, 0x16u);
        }
        [v33 commit];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __84___MPCQueueControllerBehaviorMusic_moveContentItemID_afterContentItemID_completion___block_invoke;
        block[3] = &unk_2643C5FC8;
        block[4] = self;
        dispatch_async(MEMORY[0x263EF83A0], block);
        [(_MPCQueueControllerBehaviorMusic *)self _evaluateLoadingDataSourceItemThresholds];
        v8[2](v8, 0);

        goto LABEL_8;
      }
      char v22 = (void *)MEMORY[0x263F087E8];
      long long v23 = @"Received a move command but the source and target lists are not the same. Moving items between auto play and the queue is not supported.";
    }
    else
    {
      char v22 = (void *)MEMORY[0x263F087E8];
      long long v23 = @"Received a move command but the target is not available in the queue.";
    }
    __int16 v25 = objc_msgSend(v22, "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 5, v23);
    ((void (**)(id, void *))v8)[2](v8, v25);

LABEL_8:
    goto LABEL_9;
  }
  long long v24 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 5, @"Received a move command but the source is not available in the queue.");
  ((void (**)(id, void *))v8)[2](v8, v24);

LABEL_9:
}

- (id)_idenitiferListForPosition:(int64_t)a3 afterContentItemID:(id)a4 existingUpNextSectionID:(id)a5 createdUpNextSectionID:(id)a6
{
  id v11 = a4;
  unint64_t v12 = (unint64_t)a5;
  unint64_t v13 = (unint64_t)a6;
  int v14 = (void *)v13;
  if (a3 == 2)
  {
LABEL_2:
    uint64_t v15 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v11];
    char v16 = [v15 sectionID];
    char v17 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v16];
  }
  else
  {
    if (!(v12 | v13))
    {
      long long v23 = [MEMORY[0x263F08690] currentHandler];
      [v23 handleFailureInMethod:a2, self, @"_MPCQueueControllerBehaviorMusic.m", 2266, @"Missing upNextSectionID for position: %ld afterContentItemID: %@", a3, v11 object file lineNumber description];
    }
    switch(a3)
    {
      case 0:
      case 3:
        if (v12) {
          goto LABEL_2;
        }
        uint64_t v18 = self;
        uint64_t v19 = v14;
        goto LABEL_12;
      case 1:
        if (v12) {
          uint64_t v19 = (void *)v12;
        }
        else {
          uint64_t v19 = v14;
        }
        uint64_t v18 = self;
LABEL_12:
        long long v20 = [(_MPCQueueControllerBehaviorMusic *)v18 _identifierListForSection:v19];
        goto LABEL_15;
      case 4:
        long long v20 = self->_identifierList;
LABEL_15:
        char v17 = v20;
        break;
      default:
        char v21 = [MEMORY[0x263F08690] currentHandler];
        objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"_MPCQueueControllerBehaviorMusic.m", 2291, @"Unsupported insertion position %d for %s | ", a3, "-[_MPCQueueControllerBehaviorMusic _idenitiferListForPosition:afterContentItemID:existingUpNextSectionID:createdUpNextSectionID:]");

        char v17 = 0;
        break;
    }
  }

  return v17;
}

- (void)_qfa_performInsertPlaybackContext:(id)a3 atPosition:(int64_t)a4 afterContentItemID:(id)a5 sectionIdentifier:(id)a6 actions:(unint64_t)a7 completion:(id)a8
{
  uint64_t v232 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v208 = a5;
  id v16 = a6;
  v207 = (void (**)(id, void, void *))a8;
  v209 = [(_MPCQueueControllerBehaviorMusic *)self host];
  if (a4 != 2 || (a7 & 0x40) == 0)
  {
    unint64_t v206 = a7;
    SEL v195 = a2;
    if (a4 == 3)
    {
      long long v20 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v208];
      if ([v20 type] != 3)
      {
        a4 = 3;
        goto LABEL_23;
      }
      __int16 v32 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        id v33 = [v209 engineID];
        __int16 v34 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        [v20 deferredNextContentItemID];
        id v35 = v15;
        id v36 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v221 = v33;
        __int16 v222 = 2114;
        uint64_t v223 = (uint64_t)v34;
        __int16 v224 = 2114;
        v225 = v36;
        _os_log_impl(&dword_21BB87000, v32, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | converting PositionSpecified item to deferredNextContentItem [specified placeholder item] deferredNextContentItem=%{public}@", buf, 0x20u);

        id v15 = v35;
      }

      uint64_t v37 = [v20 deferredNextContentItemID];

      if (!v37)
      {
        id v71 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        {
          int v72 = [v209 engineID];
          uint64_t v73 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
          *(_DWORD *)buf = 138543618;
          v221 = v72;
          __int16 v222 = 2114;
          uint64_t v223 = (uint64_t)v73;
          _os_log_impl(&dword_21BB87000, v71, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | failed to convert to deferredNextContentItem PositionSpecified [deferredNextContentItemID is nil]", buf, 0x16u);
        }
        __int16 v30 = (void *)MEMORY[0x263F087E8];
        uint64_t v31 = @"The specified insertion position [specified] was unsupported because the specified item is a placeholder and there is no deferredNextContentItemAnchorID.";
        goto LABEL_40;
      }
    }
    else
    {
      if (a4)
      {
        long long v20 = 0;
        goto LABEL_23;
      }
      long long v20 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v208];
      if ([v20 type] != 3)
      {
        a4 = 0;
        goto LABEL_23;
      }
      char v21 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        char v22 = [v209 engineID];
        long long v23 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        [v20 deferredNextContentItemID];
        id v24 = v15;
        __int16 v25 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v221 = v22;
        __int16 v222 = 2114;
        uint64_t v223 = (uint64_t)v23;
        __int16 v224 = 2114;
        v225 = v25;
        _os_log_impl(&dword_21BB87000, v21, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | converting PositionHead to PositionSpecified after deferredNextContentItem [head (current item was placeholder)] deferredNextContentItem=%{public}@", buf, 0x20u);

        id v15 = v24;
      }

      long long v26 = [v20 deferredNextContentItemID];

      if (!v26)
      {
        uint64_t v27 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          uint64_t v28 = [v209 engineID];
          id v29 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
          *(_DWORD *)buf = 138543618;
          v221 = v28;
          __int16 v222 = 2114;
          uint64_t v223 = (uint64_t)v29;
          _os_log_impl(&dword_21BB87000, v27, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | failed to convert to deferredNextContentItem PositionSpecified [deferredNextContentItemID is nil]", buf, 0x16u);
        }
        __int16 v30 = (void *)MEMORY[0x263F087E8];
        uint64_t v31 = @"The specified insertion position [head] was unsupported because the current item is a placeholder and there is no deferredNextContentItemAnchorID.";
LABEL_40:
        uint64_t v40 = objc_msgSend(v30, "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, v31);
        v207[2](v207, 0, v40);
LABEL_151:

        goto LABEL_152;
      }
    }
    __int16 v38 = [v20 deferredNextContentItemID];
    uint64_t v39 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v38];

    a4 = 3;
    long long v20 = (void *)v39;
LABEL_23:
    uint64_t v40 = (void *)[v15 copy];
    long long v41 = [NSString stringWithFormat:@"BehaviorMusic-insertPlaybackContext-<%@: %p>", objc_opt_class(), v40];
    v205 = [v209 beginEditWithReason:v41];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_musicBehaviorDelegate);
    uint64_t v42 = [(_MPCQueueControllerBehaviorMusic *)self tailInsertionContentItemIDForTargetContentItemID:v208];
    v203 = (void *)v42;
    if ((a7 & 0x40) == 0 || v42)
    {
      __int16 v43 = [(_MPCQueueControllerBehaviorMusic *)self _upNextSectionIdentifierForItem:v20];
      uint64_t v49 = 0;
    }
    else
    {
      __int16 v43 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v208];
      char v44 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v43 behaviorFlags];
      char v45 = v44;
      if (a4 == 1 && (v44 & 1) != 0)
      {
        [v205 rollback];
        uint64_t v46 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          __int16 v47 = [v209 engineID];
          __int16 v48 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
          *(_DWORD *)buf = 138543618;
          v221 = v47;
          __int16 v222 = 2114;
          uint64_t v223 = (uint64_t)v48;
          _os_log_impl(&dword_21BB87000, v46, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | rolling back edit [cannot insert at end of autoPlayIdentifierList]", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, @"Cannot insert at end of autoPlayIdentifierList [no existing UpNextSection]");
        uint64_t v49 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        v207[2](v207, 0, v49);
        goto LABEL_150;
      }
      v197 = v40;
      id v192 = v15;
      __int16 v50 = MSVNanoIDCreateTaggedPointer();
      uint64_t v49 = [@"UPNXT-" stringByAppendingString:v50];

      objc_storeStrong((id *)&self->_latestUpNextSectionID, v49);
      int64_t v51 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v52 = [v209 engineID];
        [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        char v53 = v49;
        v55 = uint64_t v54 = v43;
        *(_DWORD *)buf = 138543874;
        v221 = v52;
        __int16 v222 = 2114;
        uint64_t v223 = (uint64_t)v55;
        __int16 v224 = 2114;
        v225 = v53;
        _os_log_impl(&dword_21BB87000, v51, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | creating new UpNext section [] upNextSectionIdentifier=%{public}@", buf, 0x20u);

        __int16 v43 = v54;
        uint64_t v49 = v53;
      }
      id v56 = objc_opt_new();
      [v56 setLabel:@"Up Next"];
      [v56 setOverrideSILSectionID:v49];
      uint64_t v57 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)[_MPCQueueControllerDataSourceState alloc] initWithPlaybackContext:v56];
      [(NSMutableDictionary *)self->_dataSources setObject:v57 forKeyedSubscript:v49];
      if (v45)
      {
        autoPlayIdentifierList = self->_autoPlayIdentifierList;
        [(_MPCQueueControllerBehaviorMusicDataSourceState *)v43 itemID];
        v67 = int v66 = v43;
        [(_MPCQueueControllerBehaviorMusicDataSourceState *)v66 sectionID];
        v201 = self;
        char v68 = v20;
        id v70 = v69 = v16;
        [(MPSectionedIdentifierList *)autoPlayIdentifierList addDataSource:v57 section:v49 afterItem:v67 inSection:v70 completion:&__block_literal_global_472];

        id v16 = v69;
        long long v20 = v68;
        self = v201;

        __int16 v43 = v66;
      }
      else
      {
        identifierList = self->_identifierList;
        if (a4 == 1)
        {
          [(MPShuffleableSectionedIdentifierList *)self->_identifierList addDataSourceAtEnd:v57 section:v49 sequentially:1 completion:&__block_literal_global_474];
        }
        else
        {
          [(_MPCQueueControllerBehaviorMusicDataSourceState *)v43 itemID];
          uint64_t v59 = v49;
          v61 = char v60 = v43;
          [(_MPCQueueControllerBehaviorMusicDataSourceState *)v60 sectionID];
          v200 = self;
          __int16 v62 = v20;
          v64 = id v63 = v16;
          [(MPShuffleableSectionedIdentifierList *)identifierList addDataSource:v57 section:v59 sequentially:1 afterItem:v61 inSection:v64 completion:&__block_literal_global_476];

          id v16 = v63;
          long long v20 = v62;
          self = v200;

          __int16 v43 = v60;
          uint64_t v49 = v59;
        }
      }

      __int16 v43 = 0;
      id v15 = v192;
      uint64_t v40 = v197;
    }
    v74 = [(_MPCQueueControllerBehaviorMusic *)self _idenitiferListForPosition:a4 afterContentItemID:v208 existingUpNextSectionID:v43 createdUpNextSectionID:v49];
    SEL v75 = v74;
    v202 = v43;
    if (!v74)
    {
      v81 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      {
        uint64_t v82 = [v209 engineID];
        id v83 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        *(_DWORD *)buf = 138544386;
        v221 = v82;
        __int16 v222 = 2114;
        uint64_t v223 = (uint64_t)v83;
        __int16 v224 = 2114;
        v225 = v202;
        __int16 v226 = 2114;
        v227 = v49;
        __int16 v228 = 2114;
        uint64_t v229 = (uint64_t)v205;
        _os_log_impl(&dword_21BB87000, v81, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | rolling back edit [no valid identifierList] latestUpNextSectionID=%{public}@ newUpNextSectionIdentifier=%{public}@ edit=%{public}@", buf, 0x34u);

        __int16 v43 = v202;
      }

      [v205 rollback];
      v79 = (void *)MEMORY[0x263F087E8];
      if (v43) {
        v84 = v43;
      }
      else {
        v84 = v49;
      }
      v183 = v84;
      __int16 v80 = @"Cannot find UpNextSection in either identifier list: %@";
      goto LABEL_55;
    }
    if (v74 != self->_identifierList)
    {
      if (a4 == 4)
      {
        [v205 rollback];
        v76 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          v77 = [v209 engineID];
          __int16 v78 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
          *(_DWORD *)buf = 138543618;
          v221 = v77;
          __int16 v222 = 2114;
          uint64_t v223 = (uint64_t)v78;
          _os_log_impl(&dword_21BB87000, v76, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | rolling back edit [cannot insert at start of autoPlayIdentifierList]", buf, 0x16u);

          __int16 v43 = v202;
        }

        v79 = (void *)MEMORY[0x263F087E8];
        __int16 v80 = @"Cannot insert at start of autoPlayIdentifierList";
LABEL_55:
        objc_msgSend(v79, "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, v80, v183);
        v85 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        v207[2](v207, 0, v85);
LABEL_149:

LABEL_150:
        goto LABEL_151;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v102 = v40;
        if ([v102 continueListeningStation]) {
          [v102 setContinueListeningQueueProvider:self];
        }
      }
LABEL_82:
      id v188 = v16;
      v199 = v40;
      v108 = [[_MPCQueueControllerBehaviorMusicDataSourceState alloc] initWithPlaybackContext:v40];
      dataSources = self->_dataSources;
      v110 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v108 sectionIdentifier];
      uint64_t v111 = [(NSMutableDictionary *)dataSources objectForKeyedSubscript:v110];

      if (v111)
      {
        __int16 v178 = [MEMORY[0x263F08690] currentHandler];
        [v178 handleFailureInMethod:v195 object:self file:@"_MPCQueueControllerBehaviorMusic.m" lineNumber:2100 description:@"Attempting to add datasource for an already existing section."];
      }
      v112 = [v209 eventStream];
      [(_MPCQueueControllerBehaviorMusicDataSourceState *)v108 setEventStream:v112];

      v113 = [v209 playerID];
      [(_MPCQueueControllerBehaviorMusicDataSourceState *)v108 setPlayerID:v113];

      v114 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
      {
        v115 = [v209 engineID];
        v116 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        [(_MPCQueueControllerBehaviorMusicDataSourceState *)v108 sectionIdentifier];
        v193 = v20;
        v117 = self;
        id v118 = v15;
        v119 = (_MPCQueueControllerBehaviorMusicDataSourceState *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v221 = v115;
        __int16 v222 = 2114;
        uint64_t v223 = (uint64_t)v116;
        __int16 v224 = 2048;
        v225 = v108;
        __int16 v226 = 2114;
        v227 = v119;
        _os_log_impl(&dword_21BB87000, v114, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding dataSource [] dataSource=%p section=%{public}@", buf, 0x2Au);

        id v15 = v118;
        self = v117;
        long long v20 = v193;
      }
      v120 = self->_dataSources;
      id v121 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v108 sectionIdentifier];
      [(NSMutableDictionary *)v120 setObject:v108 forKeyedSubscript:v121];

      v122 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v108 sectionIdentifier];
      [(_MPCQueueControllerBehaviorMusic *)self _emitEventsForAddingPlaybackContext:v15 sectionIdentifier:v122];

      if ((v206 & 2) == 0)
      {
        v123 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v108 playbackContext];
        [v123 setShuffleType:0];
      }
      uint64_t v40 = v199;
      if ((v206 & 4) == 0)
      {
        v124 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v108 playbackContext];
        [v124 setRepeatType:0];
      }
      id v194 = v15;
      if ((v206 & 1) == 0)
      {
        v125 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v108 playbackContext];
        [v125 clearStartItem];
      }
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __137___MPCQueueControllerBehaviorMusic__qfa_performInsertPlaybackContext_atPosition_afterContentItemID_sectionIdentifier_actions_completion___block_invoke_487;
      aBlock[3] = &unk_2643C00C8;
      unint64_t v218 = v206;
      id v211 = v199;
      id v191 = v209;
      id v212 = v191;
      v213 = self;
      v85 = v108;
      v214 = v85;
      id v215 = WeakRetained;
      char v219 = v206 & 1;
      id v216 = v205;
      v217 = v207;
      v187 = _Block_copy(aBlock);
      v126 = self->_identifierList;
      v127 = @"auto";
      if (v75 == v126) {
        v127 = @"base";
      }
      v190 = v127;
      __int16 v43 = v202;
      switch(a4)
      {
        case 0:
          if (v202)
          {
            v128 = _MPCLogCategoryMusicBehavior();
            if (!os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_122;
            }
            v196 = [v191 engineID];
            uint64_t v184 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
            v186 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
            uint64_t v129 = [v20 itemID];
            uint64_t v130 = [v20 sectionID];
            *(_DWORD *)buf = 138544642;
            v221 = v196;
            __int16 v222 = 2114;
            char v131 = (void *)v184;
            uint64_t v223 = v184;
            __int16 v224 = 2114;
            v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
            __int16 v226 = 2114;
            v227 = v186;
            __int16 v228 = 2114;
            uint64_t v229 = v129;
            id v132 = (void *)v129;
            __int16 v230 = 2114;
            uint64_t v231 = v130;
            id v133 = (void *)v130;
            v134 = "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ po"
                   "sition=Head section=%{public}@ afterItem=%{public}@ inSection=%{public}@";
            goto LABEL_121;
          }
          if (!v49)
          {
            __int16 v180 = [MEMORY[0x263F08690] currentHandler];
            [v180 handleFailureInMethod:v195 object:self file:@"_MPCQueueControllerBehaviorMusic.m" lineNumber:2172 description:@"Attempt to insert at Head without creating UpNext section"];
          }
          v169 = _MPCLogCategoryMusicBehavior();
          if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
          {
            id v170 = [v191 engineID];
            v171 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
            v172 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
            *(_DWORD *)buf = 138544386;
            v221 = v170;
            __int16 v222 = 2114;
            uint64_t v223 = (uint64_t)v171;
            __int16 v224 = 2114;
            v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
            __int16 v226 = 2114;
            v227 = v172;
            __int16 v228 = 2114;
            uint64_t v229 = (uint64_t)v49;
            v173 = "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ po"
                   "sition=Head section=%{public}@ upNextSection=%{public}@";
            goto LABEL_140;
          }
          goto LABEL_141;
        case 1:
          if (v202)
          {
            uint64_t v152 = _MPCLogCategoryMusicBehavior();
            if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
            {
              v153 = [v191 engineID];
              v154 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
              v155 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
              *(_DWORD *)buf = 138544386;
              v221 = v153;
              __int16 v222 = 2114;
              uint64_t v223 = (uint64_t)v154;
              __int16 v224 = 2114;
              v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
              __int16 v226 = 2114;
              v227 = v155;
              __int16 v228 = 2114;
              uint64_t v229 = (uint64_t)v202;
              _os_log_impl(&dword_21BB87000, v152, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ position=Tail section=%{public}@ upNextSection=%{public}@", buf, 0x34u);

              uint64_t v40 = v199;
            }

            id v16 = v188;
            if (v75 == v126)
            {
              __int16 v176 = self->_identifierList;
              SEL v140 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
              v177 = v176;
              __int16 v43 = v202;
              char v141 = v187;
              [(MPShuffleableSectionedIdentifierList *)v177 addDataSource:v85 section:v140 sequentially:1 beforeTailOfSection:v202 completion:v187];
            }
            else
            {
              id v156 = self->_autoPlayIdentifierList;
              SEL v140 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
              id v157 = v156;
              __int16 v43 = v202;
              char v141 = v187;
              [(MPSectionedIdentifierList *)v157 addDataSource:v85 section:v140 beforeTailOfSection:v202 completion:v187];
            }
            goto LABEL_145;
          }
          if (!v49)
          {
            v181 = [MEMORY[0x263F08690] currentHandler];
            [v181 handleFailureInMethod:v195 object:self file:@"_MPCQueueControllerBehaviorMusic.m" lineNumber:2233 description:@"Attempt to insert at Tail without creating UpNext section"];
          }
          v169 = _MPCLogCategoryMusicBehavior();
          if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
          {
            id v170 = [v191 engineID];
            v171 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
            v172 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
            *(_DWORD *)buf = 138544386;
            v221 = v170;
            __int16 v222 = 2114;
            uint64_t v223 = (uint64_t)v171;
            __int16 v224 = 2114;
            v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
            __int16 v226 = 2114;
            v227 = v172;
            __int16 v228 = 2114;
            uint64_t v229 = (uint64_t)v49;
            v173 = "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ po"
                   "sition=Tail section=%{public}@ upNextSection=%{public}@";
            goto LABEL_140;
          }
          goto LABEL_141;
        case 2:
          v142 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
          if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v143 = [v191 engineID];
            __int16 v144 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
            v145 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
            *(_DWORD *)buf = 138544130;
            v221 = v143;
            __int16 v222 = 2114;
            uint64_t v223 = (uint64_t)v144;
            __int16 v224 = 2114;
            v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
            __int16 v226 = 2114;
            v227 = v145;
            _os_log_impl(&dword_21BB87000, v142, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ position=Last section=%{public}@", buf, 0x2Au);

            uint64_t v40 = v199;
          }

          id v16 = v188;
          if (v75 == v126)
          {
            char v168 = self->_identifierList;
            SEL v140 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
            char v141 = v187;
            [(MPShuffleableSectionedIdentifierList *)v168 addDataSourceAtEnd:v85 section:v140 sequentially:1 completion:v187];
          }
          else
          {
            __int16 v146 = self->_autoPlayIdentifierList;
            SEL v140 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
            char v141 = v187;
            [(MPSectionedIdentifierList *)v146 addDataSourceAtEnd:v85 section:v140 completion:v187];
          }
          goto LABEL_144;
        case 3:
          if (v202)
          {
            v128 = _MPCLogCategoryMusicBehavior();
            if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
            {
              v196 = [v191 engineID];
              uint64_t v185 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
              v186 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
              uint64_t v158 = [v20 itemID];
              uint64_t v159 = [v20 sectionID];
              *(_DWORD *)buf = 138544642;
              v221 = v196;
              __int16 v222 = 2114;
              char v131 = (void *)v185;
              uint64_t v223 = v185;
              __int16 v224 = 2114;
              v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
              __int16 v226 = 2114;
              v227 = v186;
              __int16 v228 = 2114;
              uint64_t v229 = v158;
              id v132 = (void *)v158;
              __int16 v230 = 2114;
              uint64_t v231 = v159;
              id v133 = (void *)v159;
              v134 = "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ "
                     "position=Specified section=%{public}@ afterItem=%{public}@ inSection=%{public}@";
LABEL_121:
              _os_log_impl(&dword_21BB87000, v128, OS_LOG_TYPE_DEFAULT, v134, buf, 0x3Eu);

              uint64_t v40 = v199;
            }
LABEL_122:

            if (v75 == v126)
            {
              v165 = self->_identifierList;
              SEL v140 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
              v161 = [v20 itemID];
              v162 = [v20 sectionID];
              unint64_t v166 = v165;
              v164 = v187;
              [(MPShuffleableSectionedIdentifierList *)v166 addDataSource:v85 section:v140 sequentially:1 afterItem:v161 inSection:v162 completion:v187];
            }
            else
            {
              id v160 = self->_autoPlayIdentifierList;
              SEL v140 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
              v161 = [v20 itemID];
              v162 = [v20 sectionID];
              id v163 = v160;
              v164 = v187;
              [(MPSectionedIdentifierList *)v163 addDataSource:v85 section:v140 afterItem:v161 inSection:v162 completion:v187];
            }

            char v141 = v164;
            id v16 = v188;
          }
          else
          {
            if (!v49)
            {
              uint64_t v182 = [MEMORY[0x263F08690] currentHandler];
              [v182 handleFailureInMethod:v195 object:self file:@"_MPCQueueControllerBehaviorMusic.m" lineNumber:2195 description:@"Attempt to insert at Specified without creating UpNext section"];
            }
            v169 = _MPCLogCategoryMusicBehavior();
            if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
            {
              id v170 = [v191 engineID];
              v171 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
              v172 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
              *(_DWORD *)buf = 138544386;
              v221 = v170;
              __int16 v222 = 2114;
              uint64_t v223 = (uint64_t)v171;
              __int16 v224 = 2114;
              v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
              __int16 v226 = 2114;
              v227 = v172;
              __int16 v228 = 2114;
              uint64_t v229 = (uint64_t)v49;
              v173 = "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ "
                     "position=Specified section=%{public}@ upNextSection=%{public}@";
LABEL_140:
              _os_log_impl(&dword_21BB87000, v169, OS_LOG_TYPE_DEFAULT, v173, buf, 0x34u);

              uint64_t v40 = v199;
            }
LABEL_141:

            id v16 = v188;
            if (v75 == v126)
            {
              v175 = self->_identifierList;
              SEL v140 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
              char v141 = v187;
              [(MPShuffleableSectionedIdentifierList *)v175 addDataSource:v85 section:v140 sequentially:1 beforeTailOfSection:v49 completion:v187];
            }
            else
            {
              __int16 v174 = self->_autoPlayIdentifierList;
              SEL v140 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
              char v141 = v187;
              [(MPSectionedIdentifierList *)v174 addDataSource:v85 section:v140 beforeTailOfSection:v49 completion:v187];
            }
          }
          goto LABEL_144;
        case 4:
          v147 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
          if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v148 = [v191 engineID];
            unint64_t v149 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
            unint64_t v150 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
            *(_DWORD *)buf = 138544130;
            v221 = v148;
            __int16 v222 = 2114;
            uint64_t v223 = (uint64_t)v149;
            __int16 v224 = 2114;
            v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
            __int16 v226 = 2114;
            v227 = v150;
            _os_log_impl(&dword_21BB87000, v147, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ position=Start section=%{public}@", buf, 0x2Au);

            uint64_t v40 = v199;
          }

          id v16 = v188;
          if (v75 != v126)
          {
            id v179 = [MEMORY[0x263F08690] currentHandler];
            [v179 handleFailureInMethod:v195 object:self file:@"_MPCQueueControllerBehaviorMusic.m" lineNumber:2218 description:@"Cannot insert at Start of AutoPlay SIL"];
          }
          unint64_t v151 = self->_identifierList;
          SEL v140 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
          char v141 = v187;
          [(MPShuffleableSectionedIdentifierList *)v151 addDataSourceAtStart:v85 section:v140 completion:v187];
          goto LABEL_144;
        default:
          if (a4 == 100)
          {
            id v135 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
            if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
            {
              v136 = [v191 engineID];
              id v137 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
              v138 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
              *(_DWORD *)buf = 138544386;
              v221 = v136;
              __int16 v222 = 2114;
              uint64_t v223 = (uint64_t)v137;
              __int16 v224 = 2114;
              v225 = (_MPCQueueControllerBehaviorMusicDataSourceState *)v190;
              __int16 v226 = 2114;
              v227 = v138;
              __int16 v228 = 2114;
              uint64_t v229 = (uint64_t)v188;
              _os_log_impl(&dword_21BB87000, v135, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | adding data source [] sil=%{public}@ position=AfterSection section=%{public}@ afterSection=%{public}@", buf, 0x34u);

              uint64_t v40 = v199;
            }

            if (v75 == v126)
            {
              uint64_t v167 = self->_identifierList;
              SEL v140 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
              char v141 = v187;
              id v16 = v188;
              [(MPShuffleableSectionedIdentifierList *)v167 addDataSource:v85 section:v140 sequentially:1 afterTailOfSection:v188 completion:v187];
            }
            else
            {
              id v139 = self->_autoPlayIdentifierList;
              SEL v140 = [(_MPCQueueControllerBehaviorMusicDataSourceState *)v85 sectionIdentifier];
              char v141 = v187;
              id v16 = v188;
              [(MPSectionedIdentifierList *)v139 addDataSource:v85 section:v140 afterTailOfSection:v188 completion:v187];
            }
LABEL_144:
            __int16 v43 = v202;
          }
          else
          {
            SEL v140 = [MEMORY[0x263F08690] currentHandler];
            objc_msgSend(v140, "handleFailureInMethod:object:file:lineNumber:description:", v195, self, @"_MPCQueueControllerBehaviorMusic.m", 2254, @"Unsupported insertion position %d for %s | ", a4, "-[_MPCQueueControllerBehaviorMusic _qfa_performInsertPlaybackContext:atPosition:afterContentItemID:sectionIdentifier:actions:completion:]");
            char v141 = v187;
            id v16 = v188;
          }
LABEL_145:

          if ((v206 & 0x10) == 0 && !self->_hasUserMutations) {
            self->_hasUserMutations = 1;
          }
          [v191 behaviorDidChange];

          id v15 = v194;
          break;
      }
      goto LABEL_149;
    }
    if ([v40 shuffleType] == 1000)
    {
      v86 = [MEMORY[0x263F12178] standardUserDefaults];
      uint64_t v87 = [v86 musicShuffleType];

      [v40 setShuffleType:v87];
    }
    int64_t v88 = [v40 repeatType];
    if (v88 == 3)
    {
      v89 = [MEMORY[0x263F12178] standardUserDefaults];
      int64_t v88 = [v89 musicRepeatType];

      [v40 setRepeatType:v88];
    }
    if ((v206 & 4) != 0 && self->_repeatType != v88)
    {
      self->_repeatType = v88;
      [(_MPCQueueControllerBehaviorMusic *)self _emitEventsForPlaybackBehaviorChangeIfNeeded];
      [WeakRetained behavior:self didChangeRepeatType:v88];
    }
    if ([(id)objc_opt_class() supportsAutoPlay])
    {
      uint64_t v90 = [v40 queueEndAction];
      if (v90 == 1000)
      {
        uint64_t v91 = [v40 userIdentity];
        v92 = [MEMORY[0x263F12178] standardUserDefaults];
        v189 = v75;
        v93 = (void *)v91;
        int v94 = [v92 autoPlayEnabledForUserIdentity:v91];
        id v95 = v40;
        v96 = v20;
        id v97 = v16;
        int v98 = v94;

        BOOL v99 = v98 == 0;
        id v16 = v97;
        long long v20 = v96;
        uint64_t v40 = v95;
        if (v99) {
          uint64_t v90 = 2;
        }
        else {
          uint64_t v90 = 3;
        }
        [v95 setQueueEndAction:v90];

        SEL v75 = v189;
      }
      if ((v206 & 0x20) == 0 || self->_autoPlayState) {
        goto LABEL_82;
      }
      v100 = self;
      if (v90 == 3) {
        uint64_t v101 = 4;
      }
      else {
        uint64_t v101 = 5;
      }
    }
    else
    {
      if (self->_autoPlayState == 1) {
        goto LABEL_82;
      }
      v103 = _MPCLogCategoryMusicBehavior();
      if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
      {
        v104 = [v209 engineID];
        [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        v198 = v40;
        uint64_t v105 = v20;
        id v107 = v106 = v16;
        *(_DWORD *)buf = 138543618;
        v221 = v104;
        __int16 v222 = 2114;
        uint64_t v223 = (uint64_t)v107;
        _os_log_impl(&dword_21BB87000, v103, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | disabling auto play [data source unsupported]", buf, 0x16u);

        id v16 = v106;
        long long v20 = v105;
        uint64_t v40 = v198;
      }
      v100 = self;
      uint64_t v101 = 1;
    }
    [(_MPCQueueControllerBehaviorMusic *)v100 _transitionToAutoPlayState:v101];
    goto LABEL_82;
  }
  char v17 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    uint64_t v18 = [v209 engineID];
    uint64_t v19 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
    *(_DWORD *)buf = 138543618;
    v221 = v18;
    __int16 v222 = 2114;
    uint64_t v223 = (uint64_t)v19;
    _os_log_impl(&dword_21BB87000, v17, OS_LOG_TYPE_ERROR, "[BMUS:%{public}@:%{public}@] _performInsertPlaybackContext: | failed [insert at Last is not supported -- MediaPlayer/QueueFA is ON]", buf, 0x16u);
  }
  long long v20 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, @"Cannot insert at Last [MediaPlayer/QueueFA is ON]");
  v207[2](v207, 0, v20);
LABEL_152:
}

- (void)performInsertCommand:(id)a3 targetContentItemID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 playbackQueue];
  unint64_t v12 = [(_MPCQueueControllerBehaviorMusic *)self _playbackContextOptions];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  void v17[2] = __88___MPCQueueControllerBehaviorMusic_performInsertCommand_targetContentItemID_completion___block_invoke;
  v17[3] = &unk_2643C0078;
  id v21 = v9;
  id v22 = v10;
  id v18 = v11;
  id v19 = v8;
  long long v20 = self;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  id v16 = v10;
  [v15 getMusicPlaybackContextWithOptions:v12 completion:v17];
}

- (void)setAllowsQueueModifications:(BOOL)a3
{
}

- (void)canReuseQueue:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(id)objc_opt_class() canLoadQueue:v6 reason:0])
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __61___MPCQueueControllerBehaviorMusic_canReuseQueue_completion___block_invoke;
    v8[3] = &unk_2643C0050;
    id v10 = v7;
    v8[4] = self;
    id v9 = v6;
    [(_MPCQueueControllerBehaviorMusic *)self _playNowIfPossible:v9 completion:v8];
  }
  else
  {
    (*((void (**)(id, void, void, void, void))v7 + 2))(v7, 0, 0, 0, 0);
  }
}

- (void)_playNowIfPossible:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    if (!self->_playNowInsertionContentItemID)
    {
      (*((void (**)(id, void, void, void, void))v7 + 2))(v7, 0, 0, 0, 0);
      goto LABEL_21;
    }
    id v8 = -[_MPCQueueControllerBehaviorMusic tailInsertionContentItemIDForTargetContentItemID:](self, "tailInsertionContentItemIDForTargetContentItemID:");
    if (!v8)
    {
      (*((void (**)(id, void, void, void, void))v7 + 2))(v7, 0, 0, 0, 0);
LABEL_20:

      goto LABEL_21;
    }
    id v9 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:self->_playNowInsertionContentItemID];
    id v10 = [(_MPCQueueControllerBehaviorMusic *)self _upNextSectionIdentifierForItem:v9];
    if (v10)
    {
      id v11 = [v6 mediaRemoteOptions];
      unint64_t v12 = [v11 objectForKeyedSubscript:@"kMRMediaRemoteOptionDialogOptions"];

      if (v12)
      {
        id v13 = [v12 objectForKeyedSubscript:@"selectedAction"];
        if (![v13 isEqualToString:@"clearQueue"])
        {

LABEL_18:
          unint64_t v17 = [(_MPCQueueControllerBehaviorMusic *)self _playbackContextOptions];
          v18[0] = MEMORY[0x263EF8330];
          v18[1] = 3221225472;
          void v18[2] = __66___MPCQueueControllerBehaviorMusic__playNowIfPossible_completion___block_invoke;
          v18[3] = &unk_2643C3E98;
          v18[4] = self;
          id v19 = v7;
          [v6 getMusicPlaybackContextWithOptions:v17 completion:v18];

          goto LABEL_19;
        }
      }
      else
      {
        if ([v6 replaceIntent] != 1) {
          goto LABEL_18;
        }
        id v13 = [(_MPCQueueControllerBehaviorMusic *)self host];
        id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [v13 engineID];
          id v16 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
          *(_DWORD *)buf = 138543618;
          id v21 = v15;
          __int16 v22 = 2114;
          long long v23 = v16;
          _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] _playNowIfPossible: | deferring to SetQueue [replaceIntent = .clearUpNext]", buf, 0x16u);
        }
      }
      (*((void (**)(id, void, void, void, void))v7 + 2))(v7, 0, 0, 0, 0);
    }
    else
    {
      unint64_t v12 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 4, @"playNowInsertionContentItemID is non-nil, but upNextSectionID is nil");
      (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0, 0, 0, v12);
    }
LABEL_19:

    goto LABEL_20;
  }
  (*((void (**)(id, void, void, void, void))v7 + 2))(v7, 0, 0, 0, 0);
LABEL_21:
}

- (void)groupSession:(id)a3 didUpdateParticipants:(id)a4
{
  id v5 = a3;
  id v7 = [v5 participants];
  id v6 = [v5 host];

  [(_MPCQueueControllerBehaviorMusic *)self _updateGroupSessionParticipants:v7 localParticipant:v6];
}

- (void)groupSession:(id)a3 didInvalidateWithError:(id)a4
{
  activeGroupSession = self->_activeGroupSession;
  self->_activeGroupSession = 0;
}

- (void)groupSessionDidConnect:(id)a3
{
  id v4 = a3;
  id v6 = [v4 participants];
  id v5 = [v4 host];

  [(_MPCQueueControllerBehaviorMusic *)self _updateGroupSessionParticipants:v6 localParticipant:v5];
}

- (void)prepareForCreateStationAfterContentItemID:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(_MPCQueueControllerBehaviorMusic *)self host];
  uint64_t v27 = [v5 beginEditWithReason:@"BehaviorMusic-prepareForCreateStation"];
  [(_MPCQueueControllerBehaviorMusic *)self _setRepeatType:0];
  uint64_t v28 = v4;
  id v6 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v4];
  id v7 = (void *)MEMORY[0x263F12210];
  id v8 = [v6 itemID];
  id v9 = [v6 sectionID];
  id v10 = [v7 positionForItem:v8 inSection:v9];
  id v11 = +[_MPCQueueControllerEnumerator enumeratorWithMusicBehavior:self mode:0 options:0 startPosition:v10 endPosition:0];

  uint64_t v12 = [v11 nextObject];
  if (v12)
  {
    id v13 = (void *)v12;
    do
    {
      id v14 = [v13 itemResult];
      id v15 = [v14 sectionIdentifier];
      id v16 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v15];

      unint64_t v17 = [v13 itemResult];
      id v18 = [v17 itemIdentifier];
      id v19 = [v13 itemResult];
      long long v20 = [v19 sectionIdentifier];
      [v16 removeItem:v18 fromSection:v20];

      uint64_t v21 = [v11 nextObject];

      id v13 = (void *)v21;
    }
    while (v21);
  }
  dataSources = self->_dataSources;
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __78___MPCQueueControllerBehaviorMusic_prepareForCreateStationAfterContentItemID___block_invoke;
  v29[3] = &unk_2643C0000;
  id v23 = v5;
  id v30 = v23;
  uint64_t v31 = self;
  [(NSMutableDictionary *)dataSources enumerateKeysAndObjectsUsingBlock:v29];
  if (!self->_hasUserMutations) {
    self->_hasUserMutations = 1;
  }
  uint64_t v24 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v25 = [v23 engineID];
    long long v26 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
    *(_DWORD *)buf = 138543618;
    id v33 = v25;
    __int16 v34 = 2114;
    id v35 = v26;
    _os_log_impl(&dword_21BB87000, v24, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] prepareForCreateStationAfterContentItemID: | committing edit [queue updated]", buf, 0x16u);
  }
  [v27 commit];
}

- (id)copyContentItemID:(id)a3 repeatIteration:(int64_t)a4
{
  id v5 = MPCQueueControllerBehaviorMusicIdentifierComponentsFromContentItemID(a3);
  if ([v5 repeatIteration] != a4)
  {
    uint64_t v6 = [v5 copyWithRepeatIteration:a4];

    id v5 = (void *)v6;
  }
  id v7 = [v5 contentItemID];

  return v7;
}

- (void)findFirstContentItemIDForItemIntersectingIdentifierSet:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__5191;
  unint64_t v17 = __Block_byref_object_dispose__5192;
  id v18 = 0;
  dataSources = self->_dataSources;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __102___MPCQueueControllerBehaviorMusic_findFirstContentItemIDForItemIntersectingIdentifierSet_completion___block_invoke;
  v10[3] = &unk_2643BFEC0;
  id v9 = v6;
  id v11 = v9;
  uint64_t v12 = &v13;
  [(NSMutableDictionary *)dataSources enumerateKeysAndObjectsUsingBlock:v10];
  v7[2](v7, v14[5], 0);

  _Block_object_dispose(&v13, 8);
}

- (void)getSharedQueueTracklistWithStartingContentItemID:(id)a3 completion:(id)a4
{
  id v80 = a3;
  id v6 = a4;
  id v7 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v80];
  id v8 = +[_MPCQueueControllerEnumerator enumeratorWithMusicBehavior:self mode:0 options:1 startPosition:0 endPosition:0];
  id v9 = objc_alloc_init(MEMORY[0x263F54EF8]);
  id v10 = 0;
  id v11 = 0;
  v79 = 0;
  while (1)
  {
    uint64_t v12 = v11;
    id v11 = [v8 nextObject];

    if (!v11) {
      break;
    }
    uint64_t v13 = [v11 entryType];
    switch(v13)
    {
      case 2:
        autoPlayIdentifierList = self->_autoPlayIdentifierList;
        id v23 = [v11 trackingEntryResult];
        uint64_t v24 = [v23 sectionIdentifier];
        LODWORD(autoPlayIdentifierList) = [(MPSectionedIdentifierList *)autoPlayIdentifierList hasSection:v24];

        if (autoPlayIdentifierList) {
          goto LABEL_50;
        }
        break;
      case 4:
        __int16 v25 = [v11 trackingEntryResult];
        dataSources = self->_dataSources;
        uint64_t v27 = [v25 sectionIdentifier];
        uint64_t v28 = [(NSMutableDictionary *)dataSources objectForKeyedSubscript:v27];

        LOBYTE(v27) = [v28 shouldRequestAdditionalItemsAtTail];
        if (v27) {
          goto LABEL_50;
        }
        break;
      case 3:
        id v14 = [v11 itemResult];
        uint64_t v15 = self->_dataSources;
        id v16 = [v14 sectionIdentifier];
        unint64_t v17 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v16];
        v77 = [v17 dataSource];

        id v18 = [v14 sectionIdentifier];
        id v19 = [v79 identifier];
        SEL v75 = v7;
        v76 = v9;
        int v72 = v14;
        if (v18 != v19)
        {
          long long v20 = v19;
          char v21 = [v18 isEqual:v19];

          if (v21)
          {
            id v9 = v76;
            goto LABEL_31;
          }
          id v30 = [v14 itemIdentifier];
          uint64_t v31 = [v14 sectionIdentifier];
          id v29 = [v77 modelPlayEventForItem:v30 inSection:v31];

          uint64_t v32 = [v29 itemType];
          if (v32 == 4)
          {
            uint64_t v39 = [v29 radioStation];
            uint64_t v40 = [v39 identifiers];
            long long v41 = [v40 radio];
            id v35 = [v41 stationStringID];

            if (!v35) {
              goto LABEL_28;
            }
            uint64_t v42 = self->_autoPlayIdentifierList;
            __int16 v43 = [v72 sectionIdentifier];
            int v44 = [(MPSectionedIdentifierList *)v42 hasSection:v43];

            char v45 = (void *)MEMORY[0x263F892F0];
            uint64_t v37 = [v29 featureName];
            if (v44) {
              [v45 autoPlayContainerWithMediaIdentifier:v35 featureName:v37];
            }
            else {
            uint64_t v38 = [v45 radioContainerWithMediaIdentifier:v35 featureName:v37];
            }
          }
          else
          {
            if (v32 != 3)
            {
              if (v32 == 1)
              {
                id v33 = [v29 album];
                __int16 v34 = [v33 identifiers];
                id v35 = [v34 preferredStoreStringIdentifierForPersonID:0];

                if (v35)
                {
                  uint64_t v36 = (void *)MEMORY[0x263F892F0];
                  uint64_t v37 = [v29 featureName];
                  uint64_t v38 = [v36 albumContainerWithMediaIdentifier:v35 featureName:v37];
                  goto LABEL_27;
                }
              }
LABEL_28:
              __int16 v50 = (void *)MEMORY[0x263F892F0];
              int64_t v51 = [v29 featureName];
              uint64_t v49 = [v50 groupWithFeatureName:v51];

LABEL_29:
              __int16 v52 = [v72 sectionIdentifier];
              [v49 setIdentifier:v52];

              [v76 appendSection:v49];
              id v18 = v79;
              v79 = v49;
              id v9 = v76;
              id v14 = v72;
              goto LABEL_30;
            }
            uint64_t v46 = [v29 playlist];
            __int16 v47 = [v46 identifiers];
            id v35 = [v47 preferredStoreStringIdentifierForPersonID:0];

            if (!v35) {
              goto LABEL_28;
            }
            __int16 v48 = (void *)MEMORY[0x263F892F0];
            uint64_t v37 = [v29 featureName];
            uint64_t v38 = [v48 playlistContainerWithMediaIdentifier:v35 featureName:v37];
          }
LABEL_27:
          uint64_t v49 = (void *)v38;

          if (!v49) {
            goto LABEL_28;
          }
          goto LABEL_29;
        }

        id v29 = v18;
LABEL_30:

LABEL_31:
        char v53 = [v14 itemIdentifier];
        uint64_t v54 = [v14 sectionIdentifier];
        uint64_t v55 = [v77 identifiersForItem:v53 inSection:v54];

        uint64_t v73 = v55;
        uint64_t v56 = [v55 preferredStoreStringIdentifierForPersonID:0];
        id v71 = (void *)v56;
        if (v56)
        {
          uint64_t v57 = [MEMORY[0x263F892F8] itemWithMediaIdentifier:v56];
          __int16 v58 = [v14 itemIdentifier];
          [v57 setIdentifier:v58];

          v74 = v57;
          [v9 appendItem:v57];
        }
        else
        {
          v74 = 0;
        }
        id v7 = v75;
        id v59 = [v75 sectionID];
        id v60 = [v14 sectionIdentifier];
        if (v59 == v60)
        {
        }
        else
        {
          char v61 = [v59 isEqual:v60];

          if ((v61 & 1) == 0)
          {

            char v62 = 1;
            goto LABEL_47;
          }
        }
        id v63 = [v75 itemID];
        id v64 = [v14 itemIdentifier];
        if (v63 == v64)
        {

LABEL_42:
          id v7 = v75;
          if (v74)
          {
            uint64_t v67 = [v76 numberOfSections] - 1;
            uint64_t v68 = [v76 numberOfItemsInSection:v67];
            id v14 = v72;
            if (v10)
            {
              id v69 = [MEMORY[0x263F08690] currentHandler];
              [v69 handleFailureInMethod:a2 object:self file:@"_MPCQueueControllerBehaviorMusic.m" lineNumber:1405 description:@"Start item was found multiple times while building shared queue tracklist."];
            }
            objc_msgSend(MEMORY[0x263F088C8], "msv_indexPathForItem:inSection:", v68 - 1, v67);
            id v59 = v10;
            id v10 = v62 = 1;
          }
          else
          {
            objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 3, @"Start item was missing a media identifier while building shared queue tracklist: startingContentItemID=%@ identifiers=%@", v80, v73);
            id v59 = (id)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void, void, id))v6 + 2))(v6, 0, 0, v59);
            char v62 = 0;
            id v14 = v72;
          }
LABEL_47:

          id v9 = v76;
          goto LABEL_48;
        }
        id v65 = v64;
        char v66 = [v63 isEqual:v64];

        if (v66) {
          goto LABEL_42;
        }
        char v62 = 1;
        id v7 = v75;
        id v9 = v76;
        id v14 = v72;
LABEL_48:

        if ((v62 & 1) == 0) {
          goto LABEL_53;
        }
        break;
    }
  }
LABEL_50:
  if (v10)
  {
    (*((void (**)(id, id, void *, void))v6 + 2))(v6, v9, v10, 0);
  }
  else
  {
    id v70 = objc_msgSend(MEMORY[0x263F087E8], "msv_errorWithDomain:code:debugDescription:", @"MPCMusicBehaviorError", 3, @"Failed to find the start item in the shared queue tracklist.");
    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0, 0, v70);
  }
LABEL_53:
}

- (BOOL)isAutoPlayContentItemID:(id)a3
{
  if (a3)
  {
    id v3 = -[_MPCQueueControllerBehaviorMusic _componentsForContentItemID:](self, "_componentsForContentItemID:");
    BOOL v4 = [v3 behaviorFlags] & 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)setAutoPlayEnabled:(BOOL)a3 targetContentItemID:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v10 = [(_MPCQueueControllerBehaviorMusic *)self host];
  if (v6) {
    [(_MPCQueueControllerBehaviorMusic *)self _setRepeatType:0];
  }
  switch(self->_autoPlayState)
  {
    case 0:
    case 1:
      id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v10 engineID];
        uint64_t v13 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        unint64_t autoPlayState = self->_autoPlayState;
        if (autoPlayState >= 0xA)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedState:%ld", self->_autoPlayState);
          uint64_t v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v15 = off_2643C02F8[autoPlayState];
        }
        *(_DWORD *)buf = 138544130;
        uint64_t v27 = v12;
        __int16 v28 = 2114;
        id v29 = v13;
        __int16 v30 = 2114;
        uint64_t v31 = v15;
        __int16 v32 = 1024;
        BOOL v33 = v6;
        _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] setAutoPlayEnabled:targetContentItemID:completion: | ignoring setter [autoPlayState=%{public}@] autoPlayEnabled:%{BOOL}u", buf, 0x26u);
      }
      goto LABEL_32;
    case 2:
      if (v6) {
        goto LABEL_25;
      }
      if (self->_activeItemFlags) {
        goto LABEL_21;
      }
      uint64_t v16 = 1;
      goto LABEL_28;
    case 3:
      if (v6) {
        goto LABEL_25;
      }
      if ((self->_activeItemFlags & 1) == 0) {
        goto LABEL_32;
      }
      goto LABEL_21;
    case 4:
      if (v6) {
        goto LABEL_32;
      }
      uint64_t v16 = 5;
      goto LABEL_28;
    case 5:
      if (!v6) {
        goto LABEL_19;
      }
      uint64_t v16 = 4;
      goto LABEL_28;
    case 6:
    case 7:
    case 9:
      if (v6) {
        goto LABEL_32;
      }
LABEL_19:
      if ((self->_activeItemFlags & 1) == 0) {
        goto LABEL_20;
      }
LABEL_21:
      unint64_t v17 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v8];
      id v18 = (void *)MEMORY[0x263F12210];
      id v19 = [v17 itemID];
      long long v20 = [v17 sectionID];
      char v21 = [v18 positionForItem:v19 inSection:v20];
      autoPlayEndPosition = self->_autoPlayEndPosition;
      self->_autoPlayEndPosition = v21;

      uint64_t v16 = 8;
      goto LABEL_28;
    case 8:
      if (v6)
      {
        if (self->_autoPlayIdentifierList)
        {
          uint64_t v16 = 7;
        }
        else
        {
LABEL_25:
          id v23 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v24 = [v10 engineID];
            __int16 v25 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
            *(_DWORD *)buf = 138543618;
            uint64_t v27 = v24;
            __int16 v28 = 2114;
            id v29 = v25;
            _os_log_impl(&dword_21BB87000, v23, OS_LOG_TYPE_DEFAULT, "[AOT:%{public}@:%{public}@] setAutoPlayEnabled:targetContentItemID:completion: | autoplay waiting for trigger [set enabled]", buf, 0x16u);
          }
          uint64_t v16 = 9;
        }
        goto LABEL_28;
      }
      if ((self->_activeItemFlags & 1) == 0)
      {
LABEL_20:
        uint64_t v16 = 3;
LABEL_28:
        [(_MPCQueueControllerBehaviorMusic *)self _transitionToAutoPlayState:v16];
      }
LABEL_32:
      v9[2](v9, 0);

      return;
    default:
      goto LABEL_32;
  }
}

- (void)reshuffleWithTargetContentItemID:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = (void (**)(id, void))a4;
  BOOL v6 = [(_MPCQueueControllerBehaviorMusic *)self host];
  id v7 = [v6 beginEditWithReason:@"BehaviorMusic-reshuffle"];
  int64_t shuffleType = self->_shuffleType;
  if (shuffleType) {
    [(MPShuffleableSectionedIdentifierList *)self->_identifierList setShuffleType:0];
  }
  self->_int64_t shuffleType = 1;
  [(MPShuffleableSectionedIdentifierList *)self->_identifierList setShuffleType:1];
  id v9 = [(_MPCQueueControllerBehaviorMusic *)self contentItemIDEnumeratorStartingAfterContentItemID:0 mode:2 options:0];
  id v10 = [v9 nextObject];
  [v7 setSuggestedContentItemIDForStart:v10];
  id v11 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v6 engineID];
    uint64_t v13 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
    int v15 = 138543874;
    uint64_t v16 = v12;
    __int16 v17 = 2114;
    id v18 = v13;
    __int16 v19 = 2114;
    long long v20 = v10;
    _os_log_impl(&dword_21BB87000, v11, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] reshuffleWithTargetContentItemID:completion: | committing edit [update after reshuffle] sugggestedStartingContentItemID=%{public}@", (uint8_t *)&v15, 0x20u);
  }
  [v7 commit];
  if (!shuffleType)
  {
    [(_MPCQueueControllerBehaviorMusic *)self _emitEventsForPlaybackBehaviorChangeIfNeeded];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_musicBehaviorDelegate);
    [WeakRetained behavior:self didChangeShuffleType:1];
  }
  v5[2](v5, 0);
}

- (void)setShuffleType:(int64_t)a3 targetContentItemID:(id)a4 completion:(id)a5
{
  id v8 = (void (**)(id, void))a5;
  [(_MPCQueueControllerBehaviorMusic *)self _setShuffleType:a3 startingContentItemID:a4 randomSource:0];
  v8[2](v8, 0);
}

- (void)setRepeatType:(int64_t)a3 completion:(id)a4
{
  id v8 = (void (**)(id, void))a4;
  if (a3 == 3)
  {
    id v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_MPCQueueControllerBehaviorMusic.m" lineNumber:1113 description:@"User default should be resolved before setting on queue controller."];
  }
  [(_MPCQueueControllerBehaviorMusic *)self _setRepeatType:a3];
  v8[2](v8, 0);
}

- (void)didReachEndOfQueueWithReason:(id)a3
{
  if (self->_autoPlayState == 8) {
    [(_MPCQueueControllerBehaviorMusic *)self _transitionToAutoPlayState:3];
  }
}

- (void)loadAdditionalUpcomingItems:(int64_t)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = [(_MPCQueueControllerBehaviorMusic *)self host];
  uint64_t v24 = 0;
  __int16 v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  dispatch_group_t v8 = dispatch_group_create();
  dataSources = self->_dataSources;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __75___MPCQueueControllerBehaviorMusic_loadAdditionalUpcomingItems_completion___block_invoke;
  void v19[3] = &unk_2643BFF10;
  v19[4] = self;
  id v10 = v8;
  long long v20 = v10;
  int64_t v23 = a3;
  id v11 = v7;
  id v21 = v11;
  __int16 v22 = &v24;
  [(NSMutableDictionary *)dataSources enumerateKeysAndObjectsUsingBlock:v19];
  if (!*((unsigned char *)v25 + 24)
    || (v17[0] = MEMORY[0x263EF8330],
        v17[1] = 3221225472,
        void v17[2] = __75___MPCQueueControllerBehaviorMusic_loadAdditionalUpcomingItems_completion___block_invoke_199,
        v17[3] = &unk_2643C54B8,
        id v18 = v6,
        dispatch_group_notify(v10, MEMORY[0x263EF83A0], v17),
        v18,
        !*((unsigned char *)v25 + 24)))
  {
    if (self->_autoPlayState == 9)
    {
      uint64_t v12 = _Block_copy(v6);
      id loadAdditionalItemsCompletion = self->_loadAdditionalItemsCompletion;
      self->_id loadAdditionalItemsCompletion = v12;

      self->_autoPlayIsTriggered = 1;
      id v14 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = [v11 engineID];
        uint64_t v16 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
        *(_DWORD *)buf = 138543618;
        id v29 = v15;
        __int16 v30 = 2114;
        uint64_t v31 = v16;
        _os_log_impl(&dword_21BB87000, v14, OS_LOG_TYPE_DEFAULT, "[ECATS:%{public}@:%{public}@] loadAdditionalUpcomingItems:completion: | evaluating autoPlayIsTriggered [loadAdditionalUpcomingItems called while WaitingForTriggerToEnable] triggered=YES", buf, 0x16u);
      }
      [(_MPCQueueControllerBehaviorMusic *)self _transitionToAutoPlayState:9];
    }
  }

  _Block_object_dispose(&v24, 8);
}

- (int64_t)preferredUpcomingItemCount
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  dataSources = self->_dataSources;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __62___MPCQueueControllerBehaviorMusic_preferredUpcomingItemCount__block_invoke;
  v12[3] = &unk_2643BFEC0;
  v12[4] = self;
  v12[5] = &v13;
  [(NSMutableDictionary *)dataSources enumerateKeysAndObjectsUsingBlock:v12];
  if (self->_autoPlayState == 9)
  {
    BOOL v4 = [(_MPCQueueControllerBehaviorMusic *)self _accountForAutoPlay];
    id v5 = [v4 bag];
    id v6 = [v5 radioConfiguration];

    uint64_t v7 = v14[3];
    uint64_t v8 = [v6 continueListeningMaxUpcomingTracksSizeToMaintain];
    if (v7 <= v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v7;
    }
    v14[3] = v9;
  }
  int64_t v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

- (id)_stateDictionaryIncludingQueue:(BOOL)a3
{
  BOOL v3 = a3;
  v33[11] = *MEMORY[0x263EF8340];
  uint64_t v5 = [NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self, @"__obj"];
  id v6 = (void *)v5;
  if (self->_state == 1) {
    uint64_t v7 = @"Ready";
  }
  else {
    uint64_t v7 = @"Loading";
  }
  v33[0] = v5;
  v33[1] = v7;
  v32[1] = @"_state";
  v32[2] = @"_allowsQueueModifications";
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_MPCQueueControllerBehaviorMusic allowsQueueModifications](self, "allowsQueueModifications"));
  v33[2] = v8;
  v32[3] = @"_repeatType";
  uint64_t v9 = MPRepeatTypeDescription();
  v33[3] = v9;
  v32[4] = @"_shuffleType";
  int64_t v10 = MPShuffleTypeDescription();
  void v33[4] = v10;
  v32[5] = @"_hasUserMutations";
  id v11 = [NSNumber numberWithBool:self->_hasUserMutations];
  v33[5] = v11;
  v32[6] = @"_autoPlayState";
  unint64_t autoPlayState = self->_autoPlayState;
  if (autoPlayState >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"UnexpectedState:%ld", self->_autoPlayState);
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = off_2643C02F8[autoPlayState];
  }
  autoPlayEndPosition = self->_autoPlayEndPosition;
  if (!autoPlayEndPosition) {
    autoPlayEndPosition = (MPSectionedIdentifierListPosition *)@"@";
  }
  v33[6] = v13;
  v33[7] = autoPlayEndPosition;
  v32[7] = @"_autoPlayEndPosition";
  v32[8] = @"__wasDecoded";
  uint64_t v15 = [NSNumber numberWithBool:self->_wasDecoded];
  uint64_t v16 = (void *)v15;
  latestUpNextSectionID = (__CFString *)self->_latestUpNextSectionID;
  playNowInsertionContentItemID = self->_playNowInsertionContentItemID;
  if (!latestUpNextSectionID) {
    latestUpNextSectionID = @"@";
  }
  v33[8] = v15;
  v33[9] = latestUpNextSectionID;
  v32[9] = @"_latestUpNextSectionID";
  v32[10] = @"_playNowInsertionContentItemID";
  if (playNowInsertionContentItemID) {
    __int16 v19 = (__CFString *)playNowInsertionContentItemID;
  }
  else {
    __int16 v19 = @"@";
  }
  v33[10] = v19;
  long long v20 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:11];

  if (v3)
  {
    id v21 = (void *)[v20 mutableCopy];
    __int16 v22 = objc_msgSend(NSNumber, "numberWithInteger:", -[MPShuffleableSectionedIdentifierList itemCount](self->_identifierList, "itemCount"));
    [v21 setObject:v22 forKeyedSubscript:@"~_identifierListItemCount"];

    int64_t v23 = [(MPShuffleableSectionedIdentifierList *)self->_identifierList debugDescription];
    uint64_t v24 = [v23 componentsSeparatedByString:@"\n"];
    __int16 v25 = (void *)v24;
    if (v24) {
      uint64_t v26 = (__CFString *)v24;
    }
    else {
      uint64_t v26 = @"@";
    }
    [v21 setObject:v26 forKeyedSubscript:@"~identifierList"];

    char v27 = objc_msgSend(NSNumber, "numberWithInteger:", -[MPSectionedIdentifierList itemCount](self->_autoPlayIdentifierList, "itemCount"));
    [v21 setObject:v27 forKeyedSubscript:@"~_autoPlayIdentifierListItemCount"];

    __int16 v28 = [(MPSectionedIdentifierList *)self->_autoPlayIdentifierList debugDescription];
    id v29 = [v28 componentsSeparatedByString:@"\n"];
    [v21 setObject:v29 forKeyedSubscript:@"~autoPlayIdentifierList"];

    uint64_t v30 = [v21 copy];
    long long v20 = (void *)v30;
  }

  return v20;
}

- (BOOL)canJumpToContentItemID:(id)a3 reason:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v6];
  uint64_t v8 = [v7 itemID];
  uint64_t v9 = [v7 sectionID];
  int64_t v10 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v9];
  if ([v10 hasItem:v8 inSection:v9]
    && ([v10 isDeletedItem:v8 inSection:v9] & 1) == 0)
  {
    uint64_t v12 = [(NSMutableDictionary *)self->_dataSources objectForKeyedSubscript:v9];
    char v11 = [v12 canJumpToItem:v8 reason:a4];
  }
  else if (a4)
  {
    [NSString stringWithFormat:@"contentItemID (%@) not found", v6];
    char v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)itemExistsForContentItemID:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v5];
  uint64_t v7 = [v6 sectionID];
  uint64_t v8 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v7];

  uint64_t v9 = [v6 type];
  if (v8)
  {
    switch(v9)
    {
      case 0:
        int64_t v10 = [v6 itemID];
        char v11 = [v6 sectionID];
        if ([v8 hasItem:v10 inSection:v11])
        {
          uint64_t v12 = [v6 itemID];
          uint64_t v13 = [v6 sectionID];
          int v14 = [v8 isDeletedItem:v12 inSection:v13] ^ 1;
        }
        else
        {
          LOBYTE(v14) = 0;
        }

        goto LABEL_42;
      case 1:
        __int16 v17 = [v6 itemID];
        id v18 = [v6 sectionID];
        if (([v8 hasItem:v17 inSection:v18] & 1) == 0)
        {

          goto LABEL_38;
        }
        __int16 v19 = [v6 itemID];
        long long v20 = [v6 sectionID];
        char v21 = [v8 isDeletedItem:v19 inSection:v20];

        if (v21) {
          goto LABEL_38;
        }
        dataSources = self->_dataSources;
        int64_t v23 = [v6 sectionID];
        uint64_t v24 = [(NSMutableDictionary *)dataSources objectForKeyedSubscript:v23];

        if (!v24)
        {
          char v45 = [MEMORY[0x263F08690] currentHandler];
          uint64_t v46 = [v6 sectionID];
          [v45 handleFailureInMethod:a2, self, @"_MPCQueueControllerBehaviorMusic.m", 504, @"DataSource does not exists for section: %@ [ItemPlaceholder] contentItemID: %@", v46, v5 object file lineNumber description];
        }
        __int16 v25 = [v6 itemID];
        uint64_t v26 = [v6 sectionID];
        LOBYTE(v14) = [v24 shouldUsePlaceholderForItem:v25 inSection:v26];

        goto LABEL_23;
      case 2:
        char v27 = self->_dataSources;
        __int16 v28 = [v6 sectionID];
        uint64_t v15 = [(NSMutableDictionary *)v27 objectForKeyedSubscript:v28];

        if (v15)
        {
          BOOL v16 = [v15 state] == 1;
          goto LABEL_15;
        }
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        uint64_t v38 = [(NSMutableDictionary *)self->_dataSources allValues];
        uint64_t v39 = [v38 countByEnumeratingWithState:&v48 objects:v52 count:16];
        if (!v39) {
          goto LABEL_36;
        }
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v49;
        break;
      case 3:
        id v29 = [v6 deferredNextContentItemID];
        uint64_t v24 = [(_MPCQueueControllerBehaviorMusic *)self _componentsForContentItemID:v29];

        uint64_t v30 = [v24 sectionID];
        uint64_t v31 = [(_MPCQueueControllerBehaviorMusic *)self _identifierListForSection:v30];

        uint64_t v32 = [v24 itemID];
        BOOL v33 = [v24 sectionID];
        int v14 = [v31 hasItem:v32 inSection:v33];

        if (v14)
        {
          uint64_t v34 = self->_dataSources;
          id v35 = [v6 sectionID];
          uint64_t v36 = [(NSMutableDictionary *)v34 objectForKeyedSubscript:v35];

          if (!v36)
          {
            int v44 = [MEMORY[0x263F08690] currentHandler];
            __int16 v47 = [v6 sectionID];
            [v44 handleFailureInMethod:a2, self, @"_MPCQueueControllerBehaviorMusic.m", 535, @"DataSource does not exists for section: %@ [ItemPlaceholder] contentItemID: %@", v47, v5 object file lineNumber description];
          }
          uint64_t v37 = [v36 state];

          if (v37 != 2)
          {

            goto LABEL_38;
          }
        }

LABEL_23:
        goto LABEL_42;
      default:
        goto LABEL_38;
    }
    while (2)
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v49 != v41) {
          objc_enumerationMutation(v38);
        }
        if ([*(id *)(*((void *)&v48 + 1) + 8 * i) state] != 1)
        {
          LOBYTE(v14) = 0;
          goto LABEL_40;
        }
      }
      uint64_t v40 = [v38 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v40) {
        continue;
      }
      break;
    }
LABEL_36:
    LOBYTE(v14) = 1;
LABEL_40:

    goto LABEL_41;
  }
  if (v9 == 1)
  {
    uint64_t v15 = [v6 itemID];
    if ([v15 isEqualToString:@"_PLACEHOLDER_AUTOPLAY_"])
    {
      BOOL v16 = self->_autoPlayState == 9;
LABEL_15:
      LOBYTE(v14) = v16;
    }
    else
    {
      LOBYTE(v14) = 0;
    }
LABEL_41:

    goto LABEL_42;
  }
LABEL_38:
  LOBYTE(v14) = 0;
LABEL_42:

  return v14;
}

- (void)activeItemFlagsDidChange:(unsigned __int16)a3
{
  if (a3) {
    [(_MPCQueueControllerBehaviorMusic *)self _setRepeatType:0];
  }
  self->_activeItemFlags = a3;
}

- (id)performLoadCommand:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_class();
  int64_t v10 = [v7 playbackQueue];
  id v25 = 0;
  char v11 = [v9 canLoadQueue:v10 reason:&v25];
  id v12 = v25;

  if ((v11 & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_MPCQueueControllerBehaviorMusic.m", 424, @"unsupported playback queue: %@", v12 object file lineNumber description];
  }
  int v14 = [v7 playbackQueue];
  unint64_t v15 = [(_MPCQueueControllerBehaviorMusic *)self _playbackContextOptions];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __66___MPCQueueControllerBehaviorMusic_performLoadCommand_completion___block_invoke;
  v21[3] = &unk_2643C3C70;
  int64_t v23 = self;
  id v24 = v8;
  id v22 = v7;
  id v16 = v7;
  id v17 = v8;
  [v14 getMusicPlaybackContextWithOptions:v15 completion:v21];

  id v18 = [(_MPCQueueControllerBehaviorMusic *)self contentItemIDEnumeratorStartingAfterContentItemID:0 mode:2 options:0];
  __int16 v19 = [v18 nextObject];

  return v19;
}

- (void)disconnectFromHost:(id)a3
{
}

- (void)dealloc
{
  [(MPShuffleableSectionedIdentifierList *)self->_identifierList setDelegate:0];
  [(MPShuffleableSectionedIdentifierList *)self->_identifierList setAnnotationDelegate:0];
  [(MPSectionedIdentifierList *)self->_autoPlayIdentifierList setDelegate:0];
  [(MPSectionedIdentifierList *)self->_autoPlayIdentifierList setAnnotationDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)_MPCQueueControllerBehaviorMusic;
  [(_MPCQueueControllerBehaviorMusic *)&v3 dealloc];
}

- (_MPCQueueControllerBehaviorMusic)initWithSessionID:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_MPCQueueControllerBehaviorMusic;
  id v5 = [(_MPCQueueControllerBehaviorMusic *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F12240]) initWithIdentifier:v4];
    identifierList = v5->_identifierList;
    v5->_identifierList = (MPShuffleableSectionedIdentifierList *)v6;

    [(MPShuffleableSectionedIdentifierList *)v5->_identifierList setDelegate:v5];
    [(MPShuffleableSectionedIdentifierList *)v5->_identifierList setAnnotationDelegate:v5];
    v5->_repeatType = 0;
    autoPlayIdentifierList = v5->_autoPlayIdentifierList;
    v5->_autoPlayIdentifierList = 0;
    v5->_unint64_t autoPlayState = 0;

    v5->_autoPlayIsTriggered = 0;
    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dataSources = v5->_dataSources;
    v5->_dataSources = v9;
  }
  return v5;
}

- (void)restoreWithSharedCoder:(id)a3 block:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, id))a4;
  id v7 = a3;
  [(_MPCQueueControllerBehaviorMusic *)self _initializeWithCoder:v7];
  id v8 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"nci"];

  if (!v8)
  {
LABEL_7:
    id v9 = 0;
    goto LABEL_8;
  }
  if (![(_MPCQueueControllerBehaviorMusic *)self itemExistsForContentItemID:v8])
  {
    int64_t v10 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      char v11 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
      int v12 = 138543618;
      uint64_t v13 = v11;
      __int16 v14 = 2114;
      unint64_t v15 = v8;
      _os_log_impl(&dword_21BB87000, v10, OS_LOG_TYPE_DEFAULT, "[PSP:…:%{public}@] restoreWithSharedCoder:block: | ignoring nextContentItemID [item does not exist] nextContentItemID=%{public}@", (uint8_t *)&v12, 0x16u);
    }
    goto LABEL_7;
  }
  id v9 = v8;
LABEL_8:
  v6[2](v6, v9);
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!self->_dataSources)
  {
    uint64_t v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"_MPCQueueControllerBehaviorMusic.m" lineNumber:282 description:@"Attempt to encode BehaviorMusic without _dataSources"];

    id v5 = v7;
  }
  [v5 encodeObject:self->_identifierList forKey:@"il"];
  [v7 encodeObject:self->_autoPlayIdentifierList forKey:@"apil"];
  [v7 encodeObject:self->_dataSources forKey:@"ds"];
  [v7 encodeInteger:self->_repeatType forKey:@"rt"];
  [v7 encodeInteger:self->_shuffleType forKey:@"st"];
  [v7 encodeBool:self->_hasUserMutations forKey:@"hum"];
  [v7 encodeInteger:self->_autoPlayState forKey:@"aps"];
  [v7 encodeObject:self->_autoPlayEndPosition forKey:@"apep"];
  [v7 encodeBool:self->_autoPlayIsTriggered forKey:@"apit"];
  if (_os_feature_enabled_impl()) {
    [v7 encodeObject:self->_latestUpNextSectionID forKey:@"lups"];
  }
}

- (NSString)debugDescription
{
  objc_super v3 = [MEMORY[0x263F089D8] string];
  id v4 = [(_MPCQueueControllerBehaviorMusic *)self sessionID];
  [v3 appendFormat:@"## BehaviorMusic <%p> [%@]\n", self, v4];

  id v5 = [(_MPCQueueControllerBehaviorMusic *)self identifierList];
  uint64_t v6 = [v5 debugDescription];

  if ([(_MPCQueueControllerBehaviorMusic *)self autoPlayEnabled])
  {
    id v7 = [(_MPCQueueControllerBehaviorMusic *)self autoPlayIdentifierList];
    id v8 = [v7 debugDescription];
  }
  id v9 = [(_MPCQueueControllerBehaviorMusic *)self _stateDictionaryIncludingQueue:0];

  return (NSString *)v3;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p identifierList=%@>", objc_opt_class(), self, self->_identifierList];
}

+ (BOOL)canLoadQueue:(id)a3 reason:(id *)a4
{
  v12[5] = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_3;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [v5 trackIdentifiers];
    id v9 = objc_msgSend(v8, "msv_firstWhere:", &__block_literal_global_5405);
    char v6 = v9 == 0;

    if (a4 && v9)
    {
      char v6 = 0;
      *a4 = @"GenericTracklist contains URLs";
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v10 = [v5 identifier];
      v12[0] = @"InProcess-com.apple.mediaplayer.playbackcontext";
      v12[1] = @"com.apple.music.playbackqueue.tracklist";
      v12[2] = @"com.apple.music.playbackqueue.radio";
      v12[3] = @"com.apple.mediaplayer.playbackcontext";
      v12[4] = @"com.apple.MediaPlaybackCore.playbackContextArchive-v1.opack";
      char v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:5];
      char v6 = [v11 containsObject:v10];

      if (a4 && (v6 & 1) == 0)
      {
        *a4 = [NSString stringWithFormat:@"Unsupported custom data playback queue: %@", v10];
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_3:
        char v6 = 1;
        goto LABEL_4;
      }
      if (a4)
      {
        [NSString stringWithFormat:@"Unsupported playback queue: %@", objc_opt_class()];
        char v6 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        char v6 = 0;
      }
    }
  }
LABEL_4:

  return v6;
}

@end