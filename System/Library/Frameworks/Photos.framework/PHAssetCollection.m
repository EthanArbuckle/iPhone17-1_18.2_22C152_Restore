@interface PHAssetCollection
+ (BOOL)_defaultKeyAssetsAtEndForType:(int64_t)a3 subtype:(int64_t)a4;
+ (BOOL)managedObjectSupportsTrashedState;
+ (NSArray)defaultTitleFontNames;
+ (PHAssetCollection)transientAssetCollectionWithAssetFetchResult:(PHFetchResult *)fetchResult title:(NSString *)title;
+ (PHAssetCollection)transientAssetCollectionWithAssets:(NSArray *)assets title:(NSString *)title;
+ (PHFetchResult)fetchAssetCollectionsContainingAsset:(PHAsset *)asset withType:(PHAssetCollectionType)type options:(PHFetchOptions *)options;
+ (PHFetchResult)fetchAssetCollectionsWithALAssetGroupURLs:(NSArray *)assetGroupURLs options:(PHFetchOptions *)options;
+ (PHFetchResult)fetchAssetCollectionsWithLocalIdentifiers:(NSArray *)identifiers options:(PHFetchOptions *)options;
+ (PHFetchResult)fetchAssetCollectionsWithType:(PHAssetCollectionType)type subtype:(PHAssetCollectionSubtype)subtype options:(PHFetchOptions *)options;
+ (PHFetchResult)fetchMomentsInMomentList:(PHCollectionList *)momentList options:(PHFetchOptions *)options;
+ (PHFetchResult)fetchMomentsWithOptions:(PHFetchOptions *)options;
+ (id)_composePropertiesToFetchWithHint:(unint64_t)a3;
+ (id)assetCollectionDuplicateTypeMappingForAssetCollectionUUIDs:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
+ (id)assetsMetadataFromAssets:(id)a3;
+ (id)corePropertiesToFetch;
+ (id)descriptionForSubtype:(int64_t)a3;
+ (id)descriptionForType:(int64_t)a3;
+ (id)descriptionOfTitleCategory:(int64_t)a3;
+ (id)entityKeyMap;
+ (id)fetchAllTripHighlightsContainingAssetsWithUUIDs:(id)a3 options:(id)a4;
+ (id)fetchAssetCollectionsContainingAssets:(id)a3 withType:(int64_t)a4 options:(id)a5;
+ (id)fetchAssetCollectionsForReferences:(id)a3 photoLibrary:(id)a4;
+ (id)fetchAssetCollectionsWithObjectIDs:(id)a3 options:(id)a4;
+ (id)fetchAssetCollectionsWithType:(int64_t)a3 localIdentifiers:(id)a4 options:(id)a5;
+ (id)fetchMomentsBackingMemory:(id)a3 options:(id)a4;
+ (id)fetchMomentsBackingSuggestion:(id)a3 options:(id)a4;
+ (id)fetchMomentsInHighlight:(id)a3 options:(id)a4;
+ (id)fetchPhotosHighlightsContainingMoments:(id)a3 options:(id)a4;
+ (id)fetchRecentContentSyndicationAssetCollectionsWithOptions:(id)a3 maxNumberOfStacks:(int64_t)a4 maxNumberOfAssetsPerStack:(int64_t)a5;
+ (id)fetchSuggestedContributionsForAssetsFetchResult:(id)a3 options:(id)a4;
+ (id)fetchSuggestedContributionsForAssetsMetadata:(id)a3 options:(id)a4;
+ (id)fetchSuggestedContributionsForFileURLs:(id)a3 options:(id)a4;
+ (id)fetchType;
+ (id)fetchUserLibraryAlbumWithOptions:(id)a3;
+ (id)fetchUtilityCollectionsWithOptions:(id)a3;
+ (id)fetchUtilityCollectionsWithType:(unsigned __int16)a3 options:(id)a4;
+ (id)graphOptionsForTransientAssetCollection:(id)a3 needsCompleteMomentsInfo:(BOOL)a4 options:(id)a5;
+ (id)identifierCode;
+ (id)managedEntityName;
+ (id)pl_PHAssetCollectionForAssetContainer:(id)a3 photoLibrary:(id)a4;
+ (id)pl_PHAssetCollectionForAssetContainer:(id)a3 photoLibrary:(id)a4 includeTrash:(BOOL)a5;
+ (id)pl_albumsForAssetCollections:(id)a3;
+ (id)posterImageForAssetCollection:(id)a3;
+ (id)propertiesToFetchWithHint:(unint64_t)a3;
+ (id)titleFontNameForTitleCategory:(int64_t)a3;
+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4;
+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 subtype:(int64_t)a4;
+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 title:(id)a4 identifier:(id)a5;
+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 title:(id)a4 subtitle:(id)a5 identifier:(id)a6 startDate:(id)a7 endDate:(id)a8;
+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 title:(id)a4 subtitle:(id)a5 titleFontName:(id)a6;
+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 title:(id)a4 subtype:(int64_t)a5;
+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 type:(int64_t)a4 subtype:(int64_t)a5 title:(id)a6 subtitle:(id)a7 titleFontName:(id)a8;
+ (id)transientAssetCollectionWithAssets:(id)a3 subtype:(int64_t)a4 identifier:(id)a5 startDate:(id)a6 endDate:(id)a7 title:(id)a8;
+ (id)transientAssetCollectionWithAssets:(id)a3 title:(id)a4 identifier:(id)a5 photoLibrary:(id)a6;
+ (id)transientAssetCollectionWithFetchOptions:(id)a3 title:(id)a4 subtitle:(id)a5 titleFontName:(id)a6 identifier:(id)a7;
+ (id)transientAssetCollectionWithOptions:(id)a3;
+ (int64_t)titleCategoryForTitleFontName:(id)a3;
+ (unint64_t)titleFontNameHashFromDate:(id)a3;
+ (unint64_t)titleFontNameHashFromHash:(unint64_t)a3 andHash:(unint64_t)a4;
+ (unint64_t)titleFontNameHashFromString:(id)a3;
- (BOOL)_canShowCloudComments;
- (BOOL)_shouldFetchDatesIfNeeded;
- (BOOL)alwaysRecalculateCounts;
- (BOOL)canContainAssets;
- (BOOL)canContainCustomKeyAssets;
- (BOOL)canContributeToCloudSharedAlbum;
- (BOOL)canPerformEditOperation:(int64_t)a3;
- (BOOL)canShowAvalancheStacks;
- (BOOL)canShowComments;
- (BOOL)collectionHasFixedOrder;
- (BOOL)containsPrivateContent;
- (BOOL)hasLocationInfo;
- (BOOL)hasUnseenContentBoolValue;
- (BOOL)isAlbumContentSort;
- (BOOL)isAlbumContentTitleSort;
- (BOOL)isCameraRoll;
- (BOOL)isCloudSharedAlbum;
- (BOOL)isLastImportedAlbum;
- (BOOL)isLibrary;
- (BOOL)isMultipleContributorCloudSharedAlbum;
- (BOOL)isOwnedCloudSharedAlbum;
- (BOOL)isPanoramasCollection;
- (BOOL)isPendingPhotoStreamAlbum;
- (BOOL)isPhotoStreamCollection;
- (BOOL)isPlacesAlbum;
- (BOOL)isPrivacySensitiveAlbum;
- (BOOL)isSmartCollection;
- (BOOL)isTrashBin;
- (BOOL)isUserSmartAlbum;
- (BOOL)keyAssetsAtEnd;
- (BOOL)shouldDeleteWhenEmpty;
- (BOOL)supportsFastKeyAssetCuration;
- (BOOL)transientKeyAssetsAtEnd;
- (CLLocation)approximateLocation;
- (Class)changeRequestClass;
- (NSArray)assetOids;
- (NSArray)assets;
- (NSArray)localizedLocationNames;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)cloudGUID;
- (NSString)importSessionID;
- (NSString)title;
- (NSString)titleFontName;
- (NSString)transientIdentifier;
- (NSString)transientSubtitle;
- (NSUInteger)estimatedAssetCount;
- (NSURL)groupURL;
- (PHAssetCollection)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5;
- (PHAssetCollectionSubtype)assetCollectionSubtype;
- (PHAssetCollectionType)assetCollectionType;
- (PHQuery)query;
- (PLQuery)userQuery;
- (id)_fetchAggregateDatesForSmartAlbum;
- (id)_fetchedEndDate;
- (id)_fetchedStartDate;
- (id)_initTransientWithAssets:(id)a3 orFetchResult:(id)a4 orQuery:(id)a5 title:(id)a6 subtitle:(id)a7 titleFontName:(id)a8 identifier:(id)a9 keyAssetsAtEnd:(BOOL)a10 albumKind:(int)a11 type:(int64_t)a12 subtype:(int64_t)a13 startDate:(id)a14 endDate:(id)a15 photoLibrary:(id)a16;
- (id)description;
- (id)effectiveCustomSortDescriptors;
- (id)identifier;
- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 orQuery:(id)a5 title:(id)a6 subtitle:(id)a7 titleFontName:(id)a8 identifier:(id)a9 albumKind:(int)a10 subtype:(int64_t)a11 photoLibrary:(id)a12;
- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 orQuery:(id)a5 title:(id)a6 subtitle:(id)a7 titleFontName:(id)a8 identifier:(id)a9 albumKind:(int)a10 subtype:(int64_t)a11 startDate:(id)a12 endDate:(id)a13 photoLibrary:(id)a14;
- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 title:(id)a5 identifier:(id)a6;
- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 title:(id)a5 identifier:(id)a6 albumKind:(int)a7;
- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 title:(id)a5 identifier:(id)a6 albumKind:(int)a7 subtype:(int64_t)a8;
- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 title:(id)a5 subtitle:(id)a6 titleFontName:(id)a7 identifier:(id)a8 albumKind:(int)a9 subtype:(int64_t)a10 photoLibrary:(id)a11;
- (id)localizedSharedByLabelAllowsEmail:(BOOL)a3;
- (id)localizedSubtitle;
- (id)localizedTitle;
- (id)objectReference;
- (id)parentFolderID;
- (id)pl_assetContainer;
- (id)sortingComparator;
- (int)pendingItemsCount;
- (int)pendingItemsType;
- (int)plAlbumKind;
- (int64_t)privacyState;
- (int64_t)titleCategory;
- (unint64_t)approximateCount;
- (unint64_t)approximatePhotosCount;
- (unint64_t)approximateVideosCount;
- (unint64_t)collectionFixedOrderPriority;
- (unint64_t)estimatedPhotosCount;
- (unint64_t)estimatedVideosCount;
- (unint64_t)titleFontNameHash;
- (void)_datesLock_fetchDatesIfNeeded;
- (void)_setCanShowCloudComments:(BOOL)a3;
- (void)setUserQuery:(id)a3;
@end

@implementation PHAssetCollection

- (id)identifier
{
  transientIdentifier = self->_transientIdentifier;
  if (transientIdentifier)
  {
    v3 = transientIdentifier;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PHAssetCollection;
    v3 = [(PHObject *)&v5 identifier];
  }

  return v3;
}

- (PHAssetCollection)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8 = a3;
  v39.receiver = self;
  v39.super_class = (Class)PHAssetCollection;
  v9 = [(PHCollection *)&v39 initWithFetchDictionary:v8 propertyHint:a4 photoLibrary:a5];
  if (!v9) {
    goto LABEL_64;
  }
  uint64_t v10 = [v8 objectForKeyedSubscript:@"importSessionID"];
  importSessionID = v9->_importSessionID;
  v9->_importSessionID = (NSString *)v10;

  uint64_t v12 = [v8 objectForKeyedSubscript:@"cloudGUID"];
  cloudGUID = v9->_cloudGUID;
  v9->_cloudGUID = (NSString *)v12;

  v14 = [v8 objectForKeyedSubscript:@"kind"];
  v9->_int plAlbumKind = [v14 shortValue];

  int plAlbumKind = v9->_plAlbumKind;
  if (plAlbumKind <= 1549)
  {
    if (plAlbumKind > 1499)
    {
      if (plAlbumKind > 1506)
      {
        if (plAlbumKind == 1507)
        {
          v9->_assetCollectionType = 2;
          uint64_t v16 = 1000000204;
        }
        else
        {
          if (plAlbumKind != 1510) {
            goto LABEL_58;
          }
          v9->_assetCollectionType = 1;
          uint64_t v16 = 1000000601;
        }
      }
      else if (plAlbumKind == 1500)
      {
        v9->_assetCollectionType = 1;
        uint64_t v16 = 100;
      }
      else
      {
        if (plAlbumKind != 1505) {
          goto LABEL_58;
        }
        v9->_assetCollectionType = 1;
        uint64_t v16 = 101;
      }
    }
    else if (plAlbumKind > 14)
    {
      if (plAlbumKind == 15)
      {
        v9->_assetCollectionType = 1;
        uint64_t v16 = 4;
      }
      else
      {
        if (plAlbumKind != 1000) {
          goto LABEL_58;
        }
        v9->_assetCollectionType = 1;
        uint64_t v16 = 1000000001;
      }
    }
    else if (plAlbumKind == 2)
    {
      v9->_assetCollectionType = 1;
      uint64_t v16 = 2;
    }
    else
    {
      if (plAlbumKind != 12) {
        goto LABEL_58;
      }
LABEL_9:
      v9->_assetCollectionType = 1;
      uint64_t v16 = 6;
    }
  }
  else
  {
    switch(plAlbumKind)
    {
      case 1603:
      case 1604:
        goto LABEL_9;
      case 1605:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 201;
        break;
      case 1606:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 202;
        break;
      case 1607:
      case 1608:
      case 1625:
      case 1629:
      case 1633:
      case 1635:
      case 1637:
      case 1638:
        goto LABEL_58;
      case 1609:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 203;
        break;
      case 1610:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 204;
        break;
      case 1611:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 205;
        break;
      case 1612:
        v9->_assetCollectionType = 2;
        uint64_t v17 = 200;
        goto LABEL_56;
      case 1613:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 209;
        break;
      case 1614:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 207;
        break;
      case 1615:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 208;
        break;
      case 1616:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 206;
        break;
      case 1617:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 210;
        break;
      case 1618:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 211;
        break;
      case 1619:
        v9->_assetCollectionType = 2;
        uint64_t v17 = 202;
        goto LABEL_56;
      case 1620:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 212;
        break;
      case 1621:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 213;
        break;
      case 1622:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 214;
        break;
      case 1623:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 215;
        break;
      case 1624:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 216;
        break;
      case 1626:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 1000000206;
        break;
      case 1627:
        v9->_assetCollectionType = 2;
        uint64_t v17 = 206;
        goto LABEL_56;
      case 1628:
        v9->_assetCollectionType = 2;
        uint64_t v17 = 204;
        goto LABEL_56;
      case 1630:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 217;
        break;
      case 1631:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 218;
        break;
      case 1632:
        v9->_assetCollectionType = 2;
        uint64_t v17 = 210;
        goto LABEL_56;
      case 1634:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 1000000212;
        break;
      case 1636:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 1000000214;
        break;
      case 1639:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 219;
        break;
      case 1640:
        v9->_assetCollectionType = 2;
        uint64_t v16 = 1000000218;
        break;
      case 1641:
        v9->_assetCollectionType = 2;
        uint64_t v17 = 218;
LABEL_56:
        uint64_t v16 = v17 | 0x3B9ACA01;
        break;
      default:
        if (plAlbumKind == 1550)
        {
          v9->_assetCollectionType = 1;
          uint64_t v16 = 5;
        }
        else
        {
          if (plAlbumKind != 1551) {
            goto LABEL_58;
          }
          v9->_assetCollectionType = 1;
          uint64_t v16 = 3;
        }
        break;
    }
  }
  v9->_assetCollectionSubtype = v16;
LABEL_58:
  if (v9->_assetCollectionType == 2)
  {
    v9->_approximateCount = 0x7FFFFFFFFFFFFFFFLL;
    v9->_approximatePhotosCount = 0x7FFFFFFFFFFFFFFFLL;
    v9->_approximateVideosCount = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v18 = [v8 objectForKeyedSubscript:@"cachedCount"];
    v9->_approximateCount = [v18 unsignedIntegerValue];

    v19 = [v8 objectForKeyedSubscript:@"cachedPhotosCount"];
    v9->_approximatePhotosCount = [v19 unsignedIntegerValue];

    v20 = [v8 objectForKeyedSubscript:@"cachedVideosCount"];
    v9->_approximateVideosCount = [v20 unsignedIntegerValue];
  }
  v21 = [v8 objectForKeyedSubscript:@"pendingItemsCount"];
  v9->_pendingItemsCount = [v21 intValue];

  v22 = [v8 objectForKeyedSubscript:@"pendingItemsType"];
  v9->_pendingItemsType = [v22 intValue];

  if ([(PHAssetCollection *)v9 plAlbumKind] != 1500)
  {
    uint64_t v23 = [v8 objectForKeyedSubscript:@"title"];
    title = v9->_title;
    v9->_title = (NSString *)v23;
  }
  localizedLocationNames = v9->_localizedLocationNames;
  v9->_localizedLocationNames = (NSArray *)MEMORY[0x1E4F1CBF0];

  v26 = [v8 objectForKeyedSubscript:@"userQueryData"];
  uint64_t v27 = [MEMORY[0x1E4F8AB08] constructQueryFromData:v26];
  userQuery = v9->_userQuery;
  v9->_userQuery = (PLQuery *)v27;

  uint64_t v29 = [v8 objectForKeyedSubscript:@"parentFolder"];
  parentFolderObjectID = v9->_parentFolderObjectID;
  v9->_parentFolderObjectID = (NSManagedObjectID *)v29;

  uint64_t v31 = [v8 objectForKeyedSubscript:@"startDate"];
  startDate = v9->_startDate;
  v9->_startDate = (NSDate *)v31;

  uint64_t v33 = [v8 objectForKeyedSubscript:@"endDate"];
  endDate = v9->_endDate;
  v9->_endDate = (NSDate *)v33;

  v9->_datesLock._os_unfair_lock_opaque = 0;
  v9->_datesLock_didFetchDates = 0;
  datesLock_fetchedStartDate = v9->_datesLock_fetchedStartDate;
  v9->_datesLock_fetchedStartDate = 0;

  datesLock_fetchedEndDate = v9->_datesLock_fetchedEndDate;
  v9->_datesLock_fetchedEndDate = 0;

  v37 = [v8 objectForKeyedSubscript:@"privacyState"];
  v9->_privacyState = (int)[v37 intValue];

LABEL_64:
  return v9;
}

- (int)plAlbumKind
{
  return self->_plAlbumKind;
}

+ (id)managedEntityName
{
  return (id)[MEMORY[0x1E4F8A848] entityName];
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken_4187 != -1) {
    dispatch_once(&propertiesToFetchWithHint__onceToken_4187, &__block_literal_global_82);
  }
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__3921;
  v9 = __Block_byref_object_dispose__3922;
  id v10 = 0;
  pl_dispatch_sync();
  id v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

- (unint64_t)estimatedPhotosCount
{
  return self->_approximatePhotosCount;
}

- (unint64_t)estimatedVideosCount
{
  return self->_approximateVideosCount;
}

- (NSString)transientIdentifier
{
  return self->_transientIdentifier;
}

- (BOOL)isUserSmartAlbum
{
  return self->_assetCollectionSubtype == 1000000204;
}

- (BOOL)supportsFastKeyAssetCuration
{
  PHAssetCollectionType v3 = [(PHAssetCollection *)self assetCollectionType];
  BOOL v4 = 1;
  if (v3 != 4 && v3 != 6)
  {
    if (v3 == 5)
    {
      uint64_t v5 = [(PHAssetCollection *)self highlightLocalIdentifier];
      BOOL v4 = v5 != 0;
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

- (id)effectiveCustomSortDescriptors
{
  uint64_t v3 = [(PHCollection *)self customSortKey];
  if (v3)
  {
    BOOL v4 = objc_msgSend(MEMORY[0x1E4F8A848], "sortDescriptorsForAssetsInAlbumWithSortKey:ascending:", v3, -[PHCollection customSortAscending](self, "customSortAscending"));
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (PHAssetCollectionType)assetCollectionType
{
  return self->_assetCollectionType;
}

- (PHAssetCollectionSubtype)assetCollectionSubtype
{
  return self->_assetCollectionSubtype;
}

+ (BOOL)managedObjectSupportsTrashedState
{
  return 1;
}

+ (id)identifierCode
{
  return @"040";
}

- (id)localizedSubtitle
{
  uint64_t v3 = [(PHAssetCollection *)self transientSubtitle];
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)PHAssetCollection;
    uint64_t v3 = [(PHCollection *)&v5 localizedSubtitle];
  }

  return v3;
}

- (NSString)transientSubtitle
{
  return self->_transientSubtitle;
}

- (BOOL)alwaysRecalculateCounts
{
  BOOL v3 = [(PHObject *)self isTransient];
  if (v3) {
    LOBYTE(v3) = self->_query != 0;
  }
  return v3;
}

- (BOOL)containsPrivateContent
{
  int v2 = [(PHAssetCollection *)self isPrivacySensitiveAlbum];
  if (v2)
  {
    LOBYTE(v2) = MEMORY[0x1F413FE38]();
  }
  return v2;
}

- (BOOL)isPrivacySensitiveAlbum
{
  int64_t assetCollectionSubtype = self->_assetCollectionSubtype;
  if (assetCollectionSubtype == 205 || assetCollectionSubtype == 1000000201) {
    return 1;
  }
  return assetCollectionSubtype == 1000000219 || self->_privacyState == 1;
}

- (BOOL)canContainCustomKeyAssets
{
  int v2 = (void *)MEMORY[0x1E4F8A848];
  uint64_t v3 = [(PHAssetCollection *)self plAlbumKind];

  return [v2 supportsCustomKeyAssetWithAlbumKind:v3];
}

id __67__PHAssetCollection_fetchAssetCollectionsWithType_subtype_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v3 object:0];
  objc_super v5 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v3 photoLibrary:v4];

  [v5 setChunkSizeForFetch:2000];
  v6 = +[PHQuery queryForAssetCollectionsWithType:*(void *)(a1 + 32) subtype:*(void *)(a1 + 40) options:v5];
  uint64_t v7 = [v6 executeQuery];

  return v7;
}

+ (id)transientAssetCollectionWithAssets:(id)a3 title:(id)a4 identifier:(id)a5 photoLibrary:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  LODWORD(v15) = 2;
  id v13 = [[PHAssetCollection alloc] initTransientWithAssets:v12 orFetchResult:0 title:v11 subtitle:0 titleFontName:0 identifier:v10 albumKind:v15 subtype:200 photoLibrary:v9];

  return v13;
}

- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 title:(id)a5 subtitle:(id)a6 titleFontName:(id)a7 identifier:(id)a8 albumKind:(int)a9 subtype:(int64_t)a10 photoLibrary:(id)a11
{
  LODWORD(v12) = a9;
  return [(PHAssetCollection *)self initTransientWithAssets:a3 orFetchResult:a4 orQuery:0 title:a5 subtitle:a6 titleFontName:a7 identifier:a8 albumKind:v12 subtype:a10 photoLibrary:a11];
}

- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 orQuery:(id)a5 title:(id)a6 subtitle:(id)a7 titleFontName:(id)a8 identifier:(id)a9 albumKind:(int)a10 subtype:(int64_t)a11 photoLibrary:(id)a12
{
  LODWORD(v13) = a10;
  return [(PHAssetCollection *)self initTransientWithAssets:a3 orFetchResult:a4 orQuery:a5 title:a6 subtitle:a7 titleFontName:a8 identifier:a9 albumKind:v13 subtype:a11 startDate:0 endDate:0 photoLibrary:a12];
}

- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 orQuery:(id)a5 title:(id)a6 subtitle:(id)a7 titleFontName:(id)a8 identifier:(id)a9 albumKind:(int)a10 subtype:(int64_t)a11 startDate:(id)a12 endDate:(id)a13 photoLibrary:(id)a14
{
  id v32 = a14;
  id v30 = a13;
  id v19 = a12;
  id v27 = a9;
  id v29 = a8;
  id v26 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  HIDWORD(v25) = a10;
  LOBYTE(v25) = [(id)objc_opt_class() _defaultKeyAssetsAtEndForType:2 subtype:a11];
  id v33 = -[PHAssetCollection _initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:keyAssetsAtEnd:albumKind:type:subtype:startDate:endDate:photoLibrary:](self, "_initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:keyAssetsAtEnd:albumKind:type:subtype:startDate:endDate:photoLibrary:", v23, v22, v21, v20, v26, v29, v27, v25, 2, a11, v19, v30, v32);

  return v33;
}

+ (BOOL)_defaultKeyAssetsAtEndForType:(int64_t)a3 subtype:(int64_t)a4
{
  BOOL v4 = a4 != 200;
  BOOL v5 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 100;
  if (a3 != 1) {
    BOOL v5 = 0;
  }
  if (a3 != 2) {
    BOOL v4 = v5;
  }
  return a3 == 9 || v4;
}

- (id)_initTransientWithAssets:(id)a3 orFetchResult:(id)a4 orQuery:(id)a5 title:(id)a6 subtitle:(id)a7 titleFontName:(id)a8 identifier:(id)a9 keyAssetsAtEnd:(BOOL)a10 albumKind:(int)a11 type:(int64_t)a12 subtype:(int64_t)a13 startDate:(id)a14 endDate:(id)a15 photoLibrary:(id)a16
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v89 = a6;
  id v88 = a7;
  id v24 = a8;
  uint64_t v25 = v22;
  id v86 = a9;
  id v26 = a14;
  id v85 = a15;
  id v90 = a16;
  uint64_t v27 = [v25 query];
  v28 = (void *)v27;
  if (v27) {
    id v29 = (void *)v27;
  }
  else {
    id v29 = v23;
  }
  id v30 = v29;

  v84 = v23;
  v87 = v24;
  if (v30)
  {
    uint64_t v31 = [v30 fetchType];
    int v32 = [v31 isEqualToString:@"PHAsset"];

    if (v32)
    {
      BOOL v33 = v25 != 0;
      goto LABEL_12;
    }
LABEL_56:
    v75 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v76 = *MEMORY[0x1E4F1C3C8];
    v77 = @"The fetch result must return PHAsset objects";
LABEL_57:
    id v78 = [v75 exceptionWithName:v76 reason:v77 userInfo:0];
    objc_exception_throw(v78);
  }
  if (v25)
  {
    v34 = [v25 firstObject];
    if (v34)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_56;
      }
    }
    uint64_t v35 = [v25 fetchedObjects];

    BOOL v33 = 1;
    id v21 = (id)v35;
  }
  else
  {
    BOOL v33 = 0;
  }
LABEL_12:
  v91 = v30;
  v36 = [MEMORY[0x1E4F1CA60] dictionary];
  v37 = [NSNumber numberWithUnsignedInt:a11];
  [v36 setObject:v37 forKeyedSubscript:@"kind"];

  v38 = [MEMORY[0x1E4F29128] UUID];
  objc_super v39 = [v38 UUIDString];
  [v36 setObject:v39 forKeyedSubscript:@"uuid"];

  v40 = v89;
  if (v89) {
    [v36 setObject:v89 forKeyedSubscript:@"title"];
  }
  v41 = [v21 firstObject];
  objc_opt_class();
  v42 = v90;
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v41 photoLibrary], (id v43 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v44 = [v25 photoLibrary];
    v45 = v44;
    if (v44)
    {
      id v46 = v44;
    }
    else
    {
      id v46 = [v91 photoLibrary];
    }
    id v43 = v46;
  }
  if (v90 && v43 && v43 != v90)
  {
    v75 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v76 = *MEMORY[0x1E4F1C3C8];
    v77 = @"The photoLibrary parameter doesn't match the library associated with the assets or fetch result";
    goto LABEL_57;
  }
  id v47 = v43;
  v81 = v47;
  if (!v43)
  {
    id v48 = v90;
    if (!v90)
    {
      id v48 = +[PHPhotoLibrary sharedPhotoLibrary];
    }
    id v47 = v48;
  }
  v82 = v41;
  v49 = [(PHAssetCollection *)self initWithFetchDictionary:v36 propertyHint:2 photoLibrary:v47];
  if (v49)
  {
    uint64_t v50 = [v91 copy];
    query = v49->_query;
    v49->_query = (PHQuery *)v50;

    if (!v91)
    {
      if (v33)
      {
        uint64_t v52 = [v25 fetchedObjectIDs];
        assetOids = v49->_assetOids;
        v49->_assetOids = (NSArray *)v52;
LABEL_33:

        goto LABEL_34;
      }
      if (v21)
      {
        assetOids = NSStringFromSelector(sel_objectID);
        uint64_t v54 = [v21 valueForKey:assetOids];
        v55 = v49->_assetOids;
        v49->_assetOids = (NSArray *)v54;

        goto LABEL_33;
      }
    }
LABEL_34:
    uint64_t v56 = [v21 copy];
    assets = v49->_assets;
    v49->_assets = (NSArray *)v56;

    uint64_t v58 = [v86 copy];
    transientIdentifier = v49->_transientIdentifier;
    v49->_transientIdentifier = (NSString *)v58;

    uint64_t v60 = [v88 copy];
    transientSubtitle = v49->_transientSubtitle;
    v49->_transientSubtitle = (NSString *)v60;

    if (v87)
    {
      uint64_t v62 = [v87 copy];
      titleFontName = v49->_titleFontName;
      v49->_titleFontName = (NSString *)v62;
    }
    v49->_transientKeyAssetsAtEnd = a10;
    v49->_assetCollectionType = a12;
    v49->_int64_t assetCollectionSubtype = a13;
    if (v26 && v85)
    {
      objc_storeStrong((id *)&v49->_startDate, a14);
      objc_storeStrong((id *)&v49->_endDate, a15);
    }
    v42 = v90;
    if (v49->_query)
    {
      uint64_t v64 = 0x7FFFFFFFFFFFFFFFLL;
      if (v33) {
        uint64_t v64 = [v25 count];
      }
      v49->_approximateCount = v64;
      v49->_approximatePhotosCount = 0x7FFFFFFFFFFFFFFFLL;
      v49->_approximateVideosCount = 0x7FFFFFFFFFFFFFFFLL;
      v40 = v89;
    }
    else
    {
      id obj = v25;
      v49->_approximateCount = [v21 count];
      v49->_approximatePhotosCount = 0;
      v49->_approximateVideosCount = 0;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      id v80 = v21;
      id v65 = v21;
      uint64_t v66 = [v65 countByEnumeratingWithState:&v92 objects:v96 count:16];
      if (v66)
      {
        uint64_t v67 = v66;
        uint64_t v68 = *(void *)v93;
        do
        {
          for (uint64_t i = 0; i != v67; ++i)
          {
            if (*(void *)v93 != v68) {
              objc_enumerationMutation(v65);
            }
            v70 = *(void **)(*((void *)&v92 + 1) + 8 * i);
            char v71 = [v70 isPhoto];
            p_approximatePhotosCount = &v49->_approximatePhotosCount;
            if ((v71 & 1) == 0)
            {
              int v73 = [v70 isVideo];
              p_approximatePhotosCount = &v49->_approximateVideosCount;
              if (!v73) {
                continue;
              }
            }
            ++*p_approximatePhotosCount;
          }
          uint64_t v67 = [v65 countByEnumeratingWithState:&v92 objects:v96 count:16];
        }
        while (v67);
      }

      uint64_t v25 = obj;
      id v21 = v80;
      v40 = v89;
      v42 = v90;
    }
  }

  return v49;
}

- (BOOL)keyAssetsAtEnd
{
  if ([(PHObject *)self isTransient]) {
    return self->_transientKeyAssetsAtEnd;
  }
  BOOL v4 = objc_opt_class();
  PHAssetCollectionType v5 = [(PHAssetCollection *)self assetCollectionType];
  PHAssetCollectionSubtype v6 = [(PHAssetCollection *)self assetCollectionSubtype];

  return [v4 _defaultKeyAssetsAtEndForType:v5 subtype:v6];
}

- (PHQuery)query
{
  return self->_query;
}

- (NSArray)assetOids
{
  return self->_assetOids;
}

+ (id)fetchUtilityCollectionsWithType:(unsigned __int16)a3 options:(id)a4
{
  uint64_t v4 = a3;
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  PHAssetCollectionSubtype v6 = [[PHUtilityCollection alloc] initWithType:v4 fetchOptions:v5];
  uint64_t v7 = [PHManualFetchResult alloc];
  v12[0] = v6;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  id v9 = [v5 photoLibrary];

  id v10 = [(PHManualFetchResult *)v7 initWithObjects:v8 photoLibrary:v9 fetchType:0 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  return v10;
}

+ (id)transientAssetCollectionWithOptions:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 type];
  uint64_t v5 = [v3 subtype];
  uint64_t v6 = [v3 keyAssetsPosition];
  uint64_t v21 = v5;
  uint64_t v22 = v4;
  if (v6 == 2)
  {
    char v20 = 1;
  }
  else if (v6)
  {
    char v20 = 0;
  }
  else
  {
    char v20 = [(id)objc_opt_class() _defaultKeyAssetsAtEndForType:v4 subtype:v5];
  }
  id v19 = objc_alloc((Class)[v3 assetCollectionClass]);
  v18 = [v3 fetchResult];
  uint64_t v7 = [v3 query];
  id v8 = [v3 title];
  id v9 = [v3 subtitle];
  id v10 = [v3 titleFontName];
  id v11 = [v3 identifier];
  uint64_t v12 = [v3 startDate];
  uint64_t v13 = [v3 endDate];
  v14 = [v3 photoLibrary];
  HIDWORD(v17) = 2;
  LOBYTE(v17) = v20;
  uint64_t v15 = objc_msgSend(v19, "_initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:keyAssetsAtEnd:albumKind:type:subtype:startDate:endDate:photoLibrary:", 0, v18, v7, v8, v9, v10, v11, v17, v22, v21, v12, v13, v14);

  return v15;
}

- (id)localizedTitle
{
  id v3 = [(PHAssetCollection *)self title];
  if (!v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F8A848];
    uint64_t v5 = [(PHAssetCollection *)self plAlbumKind];
    uint64_t v6 = [(PHObject *)self photoLibrary];
    id v3 = objc_msgSend(v4, "localizedTitleForAlbumKind:cplEnabled:", v5, objc_msgSend(v6, "isCloudPhotoLibraryEnabled"));
  }

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (NSDate)endDate
{
  if ([(PHAssetCollection *)self _shouldFetchDatesIfNeeded])
  {
    id v3 = [(PHAssetCollection *)self _fetchedEndDate];
  }
  else
  {
    id v3 = self->_endDate;
  }

  return v3;
}

- (NSDate)startDate
{
  if ([(PHAssetCollection *)self _shouldFetchDatesIfNeeded])
  {
    id v3 = [(PHAssetCollection *)self _fetchedStartDate];
  }
  else
  {
    id v3 = self->_startDate;
  }

  return v3;
}

- (BOOL)_shouldFetchDatesIfNeeded
{
  return 0;
}

- (NSUInteger)estimatedAssetCount
{
  return self->_approximateCount;
}

+ (PHFetchResult)fetchAssetCollectionsWithType:(PHAssetCollectionType)type subtype:(PHAssetCollectionSubtype)subtype options:(PHFetchOptions *)options
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__PHAssetCollection_fetchAssetCollectionsWithType_subtype_options___block_invoke;
  v7[3] = &__block_descriptor_48_e39___PHFetchResult_16__0__PHFetchOptions_8l;
  v7[4] = type;
  v7[5] = subtype;
  uint64_t v5 = +[PHObject authorizationAwareFetchResultWithOptions:options fetchBlock:v7];

  return (PHFetchResult *)v5;
}

+ (id)_composePropertiesToFetchWithHint:(unint64_t)a3
{
  char v3 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  if (v3)
  {
    uint64_t v6 = [a1 identifierPropertiesToFetch];
    [v5 addObjectsFromArray:v6];
  }
  if ((v3 & 2) != 0)
  {
    uint64_t v7 = [a1 corePropertiesToFetch];
    [v5 addObjectsFromArray:v7];
  }

  return v5;
}

+ (id)corePropertiesToFetch
{
  pl_dispatch_once();
  int v2 = (void *)corePropertiesToFetch_pl_once_object_15;

  return v2;
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  int v2 = (void *)entityKeyMap_pl_once_object_16;

  return v2;
}

void __47__PHAssetCollection_propertiesToFetchWithHint___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionary];
  v1 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint;
  propertiesToFetchWithHint__propertiesToFetchByHint = v0;

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.photos.assetcollectionpropertyhints", 0);
  char v3 = (void *)propertiesToFetchWithHint__propertyQueue;
  propertiesToFetchWithHint__propertyQueue = (uint64_t)v2;
}

void __42__PHAssetCollection_corePropertiesToFetch__block_invoke()
{
  v3[17] = *MEMORY[0x1E4F143B8];
  v3[0] = @"cloudGUID";
  v3[1] = @"cachedCount";
  v3[2] = @"cachedPhotosCount";
  v3[3] = @"cachedVideosCount";
  v3[4] = @"customSortAscending";
  v3[5] = @"customSortKey";
  v3[6] = @"importSessionID";
  v3[7] = @"kind";
  v3[8] = @"pendingItemsCount";
  v3[9] = @"pendingItemsType";
  v3[10] = @"trashedState";
  v3[11] = @"title";
  v3[12] = @"userQueryData";
  v3[13] = @"parentFolder";
  v3[14] = @"startDate";
  v3[15] = @"endDate";
  v3[16] = @"privacyState";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:17];
  uint64_t v1 = [v0 copy];
  dispatch_queue_t v2 = (void *)corePropertiesToFetch_pl_once_object_15;
  corePropertiesToFetch_pl_once_object_15 = v1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importSessionID, 0);
  objc_storeStrong(&self->_sortingComparator, 0);
  objc_storeStrong((id *)&self->_groupURL, 0);
  objc_storeStrong((id *)&self->_cloudGUID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_assetOids, 0);
  objc_storeStrong((id *)&self->_transientSubtitle, 0);
  objc_storeStrong((id *)&self->_titleFontName, 0);
  objc_storeStrong((id *)&self->_userQuery, 0);
  objc_storeStrong((id *)&self->_datesLock_fetchedEndDate, 0);
  objc_storeStrong((id *)&self->_datesLock_fetchedStartDate, 0);
  objc_storeStrong((id *)&self->_parentFolderObjectID, 0);
  objc_storeStrong((id *)&self->_transientIdentifier, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_localizedLocationNames, 0);
  objc_storeStrong((id *)&self->_approximateLocation, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);

  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

- (BOOL)canContributeToCloudSharedAlbum
{
  return self->_canContributeToCloudSharedAlbum;
}

- (BOOL)hasUnseenContentBoolValue
{
  return self->_hasUnseenContentBoolValue;
}

- (int)pendingItemsType
{
  return self->_pendingItemsType;
}

- (int)pendingItemsCount
{
  return self->_pendingItemsCount;
}

- (NSString)importSessionID
{
  return self->_importSessionID;
}

- (id)sortingComparator
{
  return self->_sortingComparator;
}

- (NSURL)groupURL
{
  return self->_groupURL;
}

- (BOOL)isSmartCollection
{
  return self->_isSmartCollection;
}

- (int64_t)privacyState
{
  return self->_privacyState;
}

- (BOOL)isMultipleContributorCloudSharedAlbum
{
  return self->_isMultipleContributorCloudSharedAlbum;
}

- (BOOL)isOwnedCloudSharedAlbum
{
  return self->_isOwnedCloudSharedAlbum;
}

- (BOOL)isCloudSharedAlbum
{
  return self->_isCloudSharedAlbum;
}

- (BOOL)isPhotoStreamCollection
{
  return self->_isPhotoStreamCollection;
}

- (BOOL)isPanoramasCollection
{
  return self->_isPanoramasCollection;
}

- (BOOL)isCameraRoll
{
  return self->_isCameraRoll;
}

- (BOOL)isLibrary
{
  return self->_isLibrary;
}

- (unint64_t)approximateVideosCount
{
  return self->_approximateVideosCount;
}

- (unint64_t)approximatePhotosCount
{
  return self->_approximatePhotosCount;
}

- (unint64_t)approximateCount
{
  return self->_approximateCount;
}

- (NSString)cloudGUID
{
  return self->_cloudGUID;
}

- (BOOL)shouldDeleteWhenEmpty
{
  return self->_shouldDeleteWhenEmpty;
}

- (BOOL)isPendingPhotoStreamAlbum
{
  return self->_isPendingPhotoStreamAlbum;
}

- (NSArray)assets
{
  return self->_assets;
}

- (BOOL)transientKeyAssetsAtEnd
{
  return self->_transientKeyAssetsAtEnd;
}

- (void)setUserQuery:(id)a3
{
}

- (PLQuery)userQuery
{
  return self->_userQuery;
}

- (void)_setCanShowCloudComments:(BOOL)a3
{
  self->_canShowCloudComments = a3;
}

- (BOOL)_canShowCloudComments
{
  return self->_canShowCloudComments;
}

- (NSArray)localizedLocationNames
{
  return self->_localizedLocationNames;
}

- (CLLocation)approximateLocation
{
  return self->_approximateLocation;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)PHAssetCollection;
  char v3 = [(PHCollection *)&v6 description];
  uint64_t v4 = objc_msgSend(v3, "stringByAppendingFormat:", @" assetCollectionType=%ld/%ld", -[PHAssetCollection assetCollectionType](self, "assetCollectionType"), -[PHAssetCollection assetCollectionSubtype](self, "assetCollectionSubtype"));

  return v4;
}

- (unint64_t)titleFontNameHash
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (![(PHAssetCollection *)self _shouldFetchDatesIfNeeded])
  {
    char v3 = [(PHAssetCollection *)self startDate];
    if (v3) {
      goto LABEL_8;
    }
  }
  char v3 = [(PHCollection *)self creationDate];
  if (v3) {
    goto LABEL_8;
  }
  if ([(PHAssetCollection *)self assetCollectionType] != PHAssetCollectionTypeSmartAlbum)
  {
    uint64_t v5 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:0 orObject:self];
    objc_super v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v11[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    [v5 setSortDescriptors:v7];

    [v5 setFetchLimit:1];
    id v8 = +[PHAsset fetchAssetsInAssetCollection:self options:v5];
    id v9 = [v8 firstObject];

    char v3 = [v9 creationDate];

    goto LABEL_8;
  }
  PHAssetCollectionSubtype v4 = [(PHAssetCollection *)self assetCollectionSubtype];
  if (!v4)
  {
    char v3 = 0;
LABEL_8:
    PHAssetCollectionSubtype v4 = +[PHAssetCollection titleFontNameHashFromDate:v3];
  }
  return v4;
}

- (NSString)titleFontName
{
  titleFontName = self->_titleFontName;
  if (!titleFontName)
  {
    objc_msgSend((id)objc_opt_class(), "titleFontNameForTitleCategory:", -[PHAssetCollection titleCategory](self, "titleCategory"));
    PHAssetCollectionSubtype v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = self->_titleFontName;
    self->_titleFontName = v4;

    titleFontName = self->_titleFontName;
    if (!titleFontName)
    {
      objc_super v6 = [(id)objc_opt_class() defaultTitleFontNames];
      objc_msgSend(v6, "objectAtIndexedSubscript:", -[PHAssetCollection titleFontNameHash](self, "titleFontNameHash") % objc_msgSend(v6, "count"));
      uint64_t v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v8 = self->_titleFontName;
      self->_titleFontName = v7;

      titleFontName = self->_titleFontName;
    }
  }

  return titleFontName;
}

- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 title:(id)a5 identifier:(id)a6 albumKind:(int)a7 subtype:(int64_t)a8
{
  LODWORD(v9) = a7;
  return [(PHAssetCollection *)self initTransientWithAssets:a3 orFetchResult:a4 title:a5 subtitle:0 titleFontName:0 identifier:a6 albumKind:v9 subtype:a8 photoLibrary:0];
}

- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 title:(id)a5 identifier:(id)a6 albumKind:(int)a7
{
  return [(PHAssetCollection *)self initTransientWithAssets:a3 orFetchResult:a4 title:a5 identifier:a6 albumKind:*(void *)&a7 subtype:200];
}

- (id)initTransientWithAssets:(id)a3 orFetchResult:(id)a4 title:(id)a5 identifier:(id)a6
{
  return [(PHAssetCollection *)self initTransientWithAssets:a3 orFetchResult:a4 title:a5 identifier:a6 albumKind:2];
}

- (BOOL)hasLocationInfo
{
  dispatch_queue_t v2 = [(PHAssetCollection *)self localizedLocationNames];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)canShowComments
{
  int64_t assetCollectionSubtype = self->_assetCollectionSubtype;
  BOOL result = [(PHAssetCollection *)self _canShowCloudComments];
  if (assetCollectionSubtype == 101) {
    return 1;
  }
  return result;
}

- (BOOL)canShowAvalancheStacks
{
  int64_t assetCollectionSubtype = self->_assetCollectionSubtype;
  return (unint64_t)(assetCollectionSubtype - 200) <= 9
      && ((1 << (assetCollectionSubtype + 56)) & 0x2C1) != 0
      || assetCollectionSubtype == 1000000201
      || assetCollectionSubtype == 1000000205;
}

- (BOOL)canContainAssets
{
  return 1;
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  int64_t assetCollectionType = self->_assetCollectionType;
  if ((unint64_t)(assetCollectionType - 8) < 2) {
    return a3 == 1;
  }
  if (assetCollectionType != 1)
  {
    if (assetCollectionType != 2) {
      return 0;
    }
    if (self->_assetCollectionSubtype == 1000000204) {
      return (a3 & 0xFFFFFFFFFFFFFFFELL) == 6;
    }
    return a3 == 1;
  }
  BOOL result = 0;
  int64_t assetCollectionSubtype = self->_assetCollectionSubtype;
  if (assetCollectionSubtype <= 99)
  {
    if (assetCollectionSubtype == 2) {
      return 1;
    }
    if (assetCollectionSubtype == 6) {
      return a3 == 1;
    }
  }
  else
  {
    if (assetCollectionSubtype == 100) {
      return a3 == 1;
    }
    if (assetCollectionSubtype == 1000000212 || assetCollectionSubtype == 1000000601) {
      return a3 == 1;
    }
  }
  return result;
}

- (BOOL)isAlbumContentTitleSort
{
  return [(PHCollection *)self customSortKey] == 101
      || [(PHCollection *)self customSortKey] == 5;
}

- (BOOL)isAlbumContentSort
{
  return 1;
}

- (id)parentFolderID
{
  return self->_parentFolderObjectID;
}

- (BOOL)isPlacesAlbum
{
  return [(PHAssetCollection *)self plAlbumKind] == 1619;
}

- (BOOL)isTrashBin
{
  return self->_assetCollectionSubtype == 1000000201;
}

- (BOOL)isLastImportedAlbum
{
  return [(PHAssetCollection *)self plAlbumKind] == 1603;
}

- (unint64_t)collectionFixedOrderPriority
{
  dispatch_queue_t v2 = (void *)MEMORY[0x1E4F8A948];
  uint64_t v3 = [(PHAssetCollection *)self plAlbumKind];

  return [v2 priorityForAlbumKind:v3];
}

- (BOOL)collectionHasFixedOrder
{
  dispatch_queue_t v2 = (void *)MEMORY[0x1E4F8A948];
  uint64_t v3 = [(PHAssetCollection *)self plAlbumKind];

  return [v2 albumKindHasFixedOrder:v3];
}

- (id)localizedSharedByLabelAllowsEmail:(BOOL)a3
{
  return &stru_1EEAC1950;
}

- (void)_datesLock_fetchDatesIfNeeded
{
  os_unfair_lock_assert_owner(&self->_datesLock);
  if (!self->_datesLock_didFetchDates
    && [(PHAssetCollection *)self _shouldFetchDatesIfNeeded])
  {
    self->_datesLock_didFetchDates = 1;
    id v7 = [(PHAssetCollection *)self _fetchAggregateDatesForSmartAlbum];
    uint64_t v3 = [v7 objectForKeyedSubscript:@"startDate"];
    datesLock_fetchedStartDate = self->_datesLock_fetchedStartDate;
    self->_datesLock_fetchedStartDate = v3;

    uint64_t v5 = [v7 objectForKeyedSubscript:@"endDate"];
    datesLock_fetchedEndDate = self->_datesLock_fetchedEndDate;
    self->_datesLock_fetchedEndDate = v5;
  }
}

- (id)_fetchedEndDate
{
  p_datesLock = &self->_datesLock;
  os_unfair_lock_lock(&self->_datesLock);
  datesLock_fetchedEndDate = self->_datesLock_fetchedEndDate;
  if (!datesLock_fetchedEndDate)
  {
    [(PHAssetCollection *)self _datesLock_fetchDatesIfNeeded];
    datesLock_fetchedEndDate = self->_datesLock_fetchedEndDate;
  }
  uint64_t v5 = datesLock_fetchedEndDate;
  os_unfair_lock_unlock(p_datesLock);

  return v5;
}

- (id)_fetchedStartDate
{
  p_datesLock = &self->_datesLock;
  os_unfair_lock_lock(&self->_datesLock);
  datesLock_fetchedStartDate = self->_datesLock_fetchedStartDate;
  if (!datesLock_fetchedStartDate)
  {
    [(PHAssetCollection *)self _datesLock_fetchDatesIfNeeded];
    datesLock_fetchedStartDate = self->_datesLock_fetchedStartDate;
  }
  uint64_t v5 = datesLock_fetchedStartDate;
  os_unfair_lock_unlock(p_datesLock);

  return v5;
}

- (id)_fetchAggregateDatesForSmartAlbum
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if ([(PHObject *)self isTransient]
    && ([(PHAssetCollection *)self query], PHAssetCollectionSubtype v4 = objc_claimAutoreleasedReturnValue(),
                                                   v4,
                                                   v4))
  {
    uint64_t v5 = [(PHAssetCollection *)self query];
    objc_super v6 = [v5 fetchRequest];
  }
  else
  {
    id v7 = [(PHObject *)self photoLibrary];
    uint64_t v5 = [v7 librarySpecificFetchOptions];

    id v8 = +[PHQuery queryForAssetsInAssetCollection:self options:v5];
    objc_super v6 = [v8 fetchRequest];
  }
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__3921;
  v38 = __Block_byref_object_dispose__3922;
  id v39 = (id)MEMORY[0x1E4F1CC08];
  if (v6)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1C0D0];
    id v10 = [v6 entityName];
    id v11 = [v9 fetchRequestWithEntityName:v10];

    uint64_t v12 = [v6 predicate];
    [v11 setPredicate:v12];

    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C68], "expressionWithFormat:", @"@min.%K", @"dateCreated");
    id v14 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v14 setName:@"startDate"];
    [v14 setExpression:v13];
    [v14 setExpressionResultType:900];
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C68], "expressionWithFormat:", @"@max.%K", @"dateCreated");
    id v16 = objc_alloc_init(MEMORY[0x1E4F1C0B8]);
    [v16 setName:@"endDate"];
    [v16 setExpression:v15];
    [v16 setExpressionResultType:900];
    [v11 setResultType:2];
    v40[0] = v14;
    v40[1] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
    [v11 setPropertiesToFetch:v17];

    v18 = [(PHObject *)self photoLibrary];
    id v19 = [v18 managedObjectContextForCurrentQueueQoS];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __54__PHAssetCollection__fetchAggregateDatesForSmartAlbum__block_invoke;
    v28[3] = &unk_1E5844880;
    id v20 = v19;
    id v29 = v20;
    id v21 = v11;
    int v32 = &v34;
    SEL v33 = a2;
    id v30 = v21;
    uint64_t v31 = self;
    [v20 performBlockAndWait:v28];
  }
  else
  {
    uint64_t v13 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      BOOL v22 = [(PHObject *)self isTransient];
      uint64_t v23 = [(PHAssetCollection *)self query];
      id v24 = (void *)v23;
      uint64_t v25 = @"NO";
      *(_DWORD *)buf = 138413058;
      uint64_t v42 = 0;
      __int16 v43 = 2112;
      if (v22) {
        uint64_t v25 = @"YES";
      }
      v44 = self;
      __int16 v45 = 2112;
      id v46 = v25;
      __int16 v47 = 2112;
      uint64_t v48 = v23;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_ERROR, "queryFetchRequest is nil. fetchRequest: %@ self : %@ isTransient : %@ query: %@", buf, 0x2Au);
    }
    id v21 = 0;
  }

  id v26 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  return v26;
}

void __54__PHAssetCollection__fetchAggregateDatesForSmartAlbum__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v11 = 0;
  PHAssetCollectionSubtype v4 = [v2 executeFetchRequest:v3 error:&v11];
  id v5 = v11;
  if (v4)
  {
    uint64_t v6 = [v4 firstObject];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(NSObject **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    id v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v10 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "%@ failed to fetch aggregate dates for %@ %@", buf, 0x20u);
    }
  }
}

- (int64_t)titleCategory
{
  return 0;
}

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

+ (id)descriptionOfTitleCategory:(int64_t)a3
{
  if ((unint64_t)a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"? (%i)", a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E5842620[a3];
  }

  return v3;
}

+ (id)descriptionForSubtype:(int64_t)a3
{
  if (a3 <= 1000000000)
  {
    if (a3 <= 199)
    {
      PHAssetCollectionSubtype v4 = @"albumRegular";
      switch(a3)
      {
        case 2:
          goto LABEL_156;
        case 3:
          PHAssetCollectionSubtype v4 = @"albumSyncedEvent";
          return v4;
        case 4:
          PHAssetCollectionSubtype v4 = @"albumSyncedFaces";
          return v4;
        case 5:
          PHAssetCollectionSubtype v4 = @"albumSyncedAlbum";
          return v4;
        case 6:
          PHAssetCollectionSubtype v4 = @"albumImported";
          return v4;
        default:
          if (a3 == 100)
          {
            PHAssetCollectionSubtype v4 = @"albumMyPhotoStream";
          }
          else
          {
            if (a3 != 101) {
              goto LABEL_155;
            }
            PHAssetCollectionSubtype v4 = @"albumCloudShared";
          }
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 200:
          PHAssetCollectionSubtype v4 = @"smartAlbumGeneric";
          break;
        case 201:
          PHAssetCollectionSubtype v4 = @"smartAlbumPanoramas";
          break;
        case 202:
          PHAssetCollectionSubtype v4 = @"smartAlbumVideos";
          break;
        case 203:
          PHAssetCollectionSubtype v4 = @"smartAlbumFavorites";
          break;
        case 204:
          PHAssetCollectionSubtype v4 = @"smartAlbumTimelapses";
          break;
        case 205:
          PHAssetCollectionSubtype v4 = @"smartAlbumAllHidden";
          break;
        case 206:
          PHAssetCollectionSubtype v4 = @"smartAlbumRecentlyAdded";
          break;
        case 207:
          PHAssetCollectionSubtype v4 = @"smartAlbumBursts";
          break;
        case 208:
          PHAssetCollectionSubtype v4 = @"smartAlbumSlomoVideos";
          break;
        case 209:
          PHAssetCollectionSubtype v4 = @"smartAlbumUserLibrary";
          break;
        case 210:
          PHAssetCollectionSubtype v4 = @"smartAlbumSelfPortraits";
          break;
        case 211:
          PHAssetCollectionSubtype v4 = @"smartAlbumScreenshots";
          break;
        case 212:
          PHAssetCollectionSubtype v4 = @"smartAlbumDepthEffect";
          break;
        case 213:
          PHAssetCollectionSubtype v4 = @"smartAlbumLivePhotos";
          break;
        case 214:
          PHAssetCollectionSubtype v4 = @"smartAlbumAnimated";
          break;
        case 215:
          PHAssetCollectionSubtype v4 = @"smartAlbumLongExposures";
          break;
        case 216:
          PHAssetCollectionSubtype v4 = @"smartAlbumUnableToUpload";
          break;
        case 217:
          PHAssetCollectionSubtype v4 = @"smartAlbumRAW";
          break;
        case 218:
          PHAssetCollectionSubtype v4 = @"smartAlbumCinematic";
          break;
        case 219:
          PHAssetCollectionSubtype v4 = @"smartAlbumSpatial";
          break;
        default:
          goto LABEL_155;
      }
    }
    return v4;
  }
  if (a3 <= 1000000300)
  {
    switch(a3)
    {
      case 1000000201:
        PHAssetCollectionSubtype v4 = @"smartAlbumTrashBin";
        break;
      case 1000000202:
      case 1000000208:
      case 1000000209:
      case 1000000210:
      case 1000000213:
      case 1000000216:
      case 1000000217:
        goto LABEL_155;
      case 1000000203:
        PHAssetCollectionSubtype v4 = @"smartAlbumPlaces";
        break;
      case 1000000204:
        PHAssetCollectionSubtype v4 = @"smartAlbumUserSmartAlbum";
        break;
      case 1000000205:
        PHAssetCollectionSubtype v4 = @"smartAlbumAllPhotos";
        break;
      case 1000000206:
        PHAssetCollectionSubtype v4 = @"smartAlbumRecentlyEdited";
        break;
      case 1000000207:
        PHAssetCollectionSubtype v4 = @"smartAlbumScreenRecordings";
        break;
      case 1000000211:
        PHAssetCollectionSubtype v4 = @"smartAlbumProRes";
        break;
      case 1000000212:
        goto LABEL_37;
      case 1000000214:
        PHAssetCollectionSubtype v4 = @"smartAlbumSharedLibrarySharingSuggestions";
        break;
      case 1000000215:
        PHAssetCollectionSubtype v4 = @"smartAlbumActionCam";
        break;
      case 1000000218:
        PHAssetCollectionSubtype v4 = @"recentlySaved";
        break;
      case 1000000219:
        PHAssetCollectionSubtype v4 = @"smartAlbumRecovered";
        break;
      default:
        if (a3 != 1000000001) {
          goto LABEL_155;
        }
        PHAssetCollectionSubtype v4 = @"albumCameraRoll";
        break;
    }
    return v4;
  }
  if (a3 <= 1000000400)
  {
    switch(a3)
    {
      case 1000000301:
        PHAssetCollectionSubtype v4 = @"photosHighlightDay";
        break;
      case 1000000302:
        PHAssetCollectionSubtype v4 = @"photosHighlightMonth";
        break;
      case 1000000303:
        PHAssetCollectionSubtype v4 = @"photosHighlightYear";
        break;
      case 1000000304:
        PHAssetCollectionSubtype v4 = @"photosHighlightDayGroup";
        break;
      default:
        goto LABEL_155;
    }
    return v4;
  }
  if (a3 > 1000000600)
  {
    if (a3 == 1000000601)
    {
LABEL_37:
      PHAssetCollectionSubtype v4 = @"duplicates";
      return v4;
    }
    if (a3 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_155;
    }
    PHAssetCollectionSubtype v4 = @"any";
  }
  else
  {
    if (a3 != 1000000401)
    {
      if (a3 == 1000000501)
      {
        PHAssetCollectionSubtype v4 = @"contentSyndication";
        return v4;
      }
LABEL_155:
      objc_msgSend(NSString, "stringWithFormat:", @"unexpectedSubtype_%li", a3);
      PHAssetCollectionSubtype v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_156:
      return v4;
    }
    PHAssetCollectionSubtype v4 = @"screenSaverActivityCollection";
  }
  return v4;
}

+ (id)descriptionForType:(int64_t)a3
{
  if ((unint64_t)a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unexpectedType_%li", a3);
    uint64_t v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v3 = off_1E58425C0[a3];
  }

  return v3;
}

+ (id)fetchUtilityCollectionsWithOptions:(id)a3
{
  id v3 = a3;
  PHAssetCollectionSubtype v4 = [MEMORY[0x1E4F1CA48] array];
  unsigned __int16 v5 = 1;
  do
  {
    unsigned int v6 = v5;
    uint64_t v7 = [[PHUtilityCollection alloc] initWithType:v5 fetchOptions:v3];
    if (v7) {
      [v4 addObject:v7];
    }

    ++v5;
  }
  while (v6 < 5);
  id v8 = [PHManualFetchResult alloc];
  uint64_t v9 = [v3 photoLibrary];
  uint64_t v10 = [(PHManualFetchResult *)v8 initWithObjects:v4 photoLibrary:v9 fetchType:0 fetchPropertySets:0 identifier:0 registerIfNeeded:0];

  return v10;
}

+ (id)assetCollectionDuplicateTypeMappingForAssetCollectionUUIDs:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  id v39 = __Block_byref_object_copy__3921;
  v40 = __Block_byref_object_dispose__3922;
  id v41 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  SEL v33 = __Block_byref_object_copy__3921;
  uint64_t v34 = __Block_byref_object_dispose__3922;
  id v35 = 0;
  if ([v8 count])
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1C0D0];
    id v11 = [MEMORY[0x1E4F8A7E0] entityName];
    uint64_t v12 = [v10 fetchRequestWithEntityName:v11];

    uint64_t v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", @"uuid", v8];
    [v12 setPredicate:v13];

    [v12 setResultType:2];
    v42[0] = @"uuid";
    v42[1] = @"duplicateType";
    __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    [v12 setPropertiesToFetch:v14];

    uint64_t v15 = [v9 managedObjectContextForCurrentQueueQoS];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __99__PHAssetCollection_assetCollectionDuplicateTypeMappingForAssetCollectionUUIDs_photoLibrary_error___block_invoke;
    v24[3] = &unk_1E5848368;
    id v16 = v15;
    id v25 = v16;
    id v17 = v12;
    id v26 = v17;
    uint64_t v27 = &v30;
    v28 = &v36;
    SEL v29 = a2;
    [v16 performBlockAndWait:v24];
  }
  uint64_t v18 = (void *)v31[5];
  id v19 = v18;
  id v20 = v19;
  if (v18) {
    BOOL v21 = a5 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  if (!v21) {
    *a5 = v19;
  }

  id v22 = (id)v37[5];
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);

  return v22;
}

void __99__PHAssetCollection_assetCollectionDuplicateTypeMappingForAssetCollectionUUIDs_photoLibrary_error___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v4 + 40);
  unsigned __int16 v5 = [v2 executeFetchRequest:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  if (v5)
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    void v12[2] = __99__PHAssetCollection_assetCollectionDuplicateTypeMappingForAssetCollectionUUIDs_photoLibrary_error___block_invoke_2;
    v12[3] = &unk_1E5842570;
    v12[4] = *(void *)(a1 + 56);
    [v5 enumerateObjectsUsingBlock:v12];
  }
  else
  {
    id v9 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "%{public}@ failed to fetch duplicate album types. Error: %@", buf, 0x16u);
    }
  }
}

void __99__PHAssetCollection_assetCollectionDuplicateTypeMappingForAssetCollectionUUIDs_photoLibrary_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [v3 objectForKeyedSubscript:@"duplicateType"];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"uuid"];

  if (v6 && v4)
  {
    id v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v6];
    if (!v5)
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v5 forKeyedSubscript:v6];
    }
    [v5 addObject:v4];
  }
}

+ (unint64_t)titleFontNameHashFromHash:(unint64_t)a3 andHash:(unint64_t)a4
{
  return (3 * a3) ^ a4;
}

+ (unint64_t)titleFontNameHashFromString:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [v3 length];
  if (v4 >= 0x1E) {
    unint64_t v5 = 30;
  }
  else {
    unint64_t v5 = v4;
  }
  objc_msgSend(v3, "getCharacters:range:", v12, 0, v5);
  unint64_t v6 = 0;
  unint64_t v7 = 0;
  if (v5 >= 5)
  {
    uint64_t v8 = 0;
    unint64_t v6 = 0;
    do
    {
      unint64_t v6 = 67503105 * v6
         + 16974593 * (unsigned __int16)v12[v8]
         + 66049 * (unsigned __int16)v12[v8 + 1]
         + 257 * (unsigned __int16)v12[v8 + 2]
         + (unsigned __int16)v12[v8 + 3];
      unint64_t v9 = v8 + 8;
      v8 += 4;
    }
    while (v9 < v5);
    unint64_t v7 = ((v5 - 5) & 0xFFFFFFFFFFFFFFFCLL) + 4;
  }
  uint64_t v10 = v7 | 1;
  if ((v7 | 1) < v5)
  {
    do
    {
      unint64_t v6 = 257 * v6 + (unsigned __int16)v12[v7];
      unint64_t v7 = v10++;
    }
    while (v5 != v10);
  }

  return v6;
}

+ (unint64_t)titleFontNameHashFromDate:(id)a3
{
  [a3 timeIntervalSince1970];
  return (unint64_t)fmod(v3, 30240.0);
}

+ (int64_t)titleCategoryForTitleFontName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Baskerville-Bold"])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isEqualToString:@"FaktSlabStencilPro-Medium"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"Rockwell-Bold"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"BebasNeue"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"AmericanTypewriter-Semibold"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@".SFUIDisplay-Semibold"])
  {
    int64_t v4 = 6;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

+ (id)titleFontNameForTitleCategory:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5) {
    return 0;
  }
  else {
    return off_1E5842590[a3 - 1];
  }
}

+ (NSArray)defaultTitleFontNames
{
  if (defaultTitleFontNames_onceToken != -1) {
    dispatch_once(&defaultTitleFontNames_onceToken, &__block_literal_global_199);
  }
  dispatch_queue_t v2 = (void *)defaultTitleFontNames_defaultTitleFontNames;

  return (NSArray *)v2;
}

void __42__PHAssetCollection_defaultTitleFontNames__block_invoke()
{
  uint64_t v0 = (void *)defaultTitleFontNames_defaultTitleFontNames;
  defaultTitleFontNames_defaultTitleFontNames = (uint64_t)&unk_1EEB26868;
}

+ (id)graphOptionsForTransientAssetCollection:(id)a3 needsCompleteMomentsInfo:(BOOL)a4 options:(id)a5
{
  BOOL v6 = a4;
  v54[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  unint64_t v9 = objc_opt_new();
  uint64_t v10 = [v7 photoLibrary];
  __int16 v43 = v8;
  uint64_t v11 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v8 photoLibrary:v10];

  v54[0] = @"PHAssetPropertySetIdentifier";
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
  [v11 setFetchPropertySets:v12];

  [v11 setWantsIncrementalChangeDetails:0];
  [v11 setSortDescriptors:MEMORY[0x1E4F1CBF0]];
  [v11 setChunkSizeForFetch:2000];
  uint64_t v13 = +[PHAsset fetchAssetsInAssetCollection:v7 options:v11];
  __int16 v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v48 + 1) + 8 * i) localIdentifier];
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v17);
  }

  if ([v14 count]) {
    [v9 setObject:v14 forKeyedSubscript:@"PHPhotosGraphOptionAssetIdentifiers"];
  }
  if (v6)
  {
    uint64_t v21 = [v7 assetCollectionType];
    unint64_t v22 = 0x1E4F28000;
    if (v21 != 1)
    {
      uint64_t v23 = v21;
      if (v21 == 3)
      {
        uint64_t v26 = 1;
        goto LABEL_38;
      }
      if (v21 != 2 || [v7 assetCollectionSubtype] == 200)
      {
        id v24 = objc_getAssociatedObject(v7, "phIsCompleteMoments");
        id v25 = v24;
        if (v24)
        {
          uint64_t v26 = [v24 BOOLValue];
LABEL_37:

          goto LABEL_38;
        }
        if (v23 == 4)
        {
          uint64_t v27 = [v7 photosGraphProperties];
          if (v27)
          {
            v28 = v27;
            SEL v29 = [v27 objectForKeyedSubscript:@"info"];
            uint64_t v30 = [v29 objectForKeyedSubscript:@"sourceType"];

            if (v30)
            {
              uint64_t v42 = v28;
              if (([v30 isEqualToString:@"Moment"] & 1) != 0
                || ([v30 isEqualToString:@"Contiguous Moments"] & 1) != 0)
              {
                uint64_t v26 = 1;
              }
              else
              {
                uint64_t v26 = [v30 isEqualToString:@"Disjoint Moments"] ^ 1;
              }
LABEL_36:

              id v39 = [*(id *)(v22 + 3792) numberWithBool:v26];
              objc_setAssociatedObject(v7, "phIsCompleteMoments", v39, (void *)1);

              goto LABEL_37;
            }
          }
        }
        uint64_t v31 = [v15 photoLibrary];
        uint64_t v32 = [v15 firstObject];
        uint64_t v33 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:v31 orObject:v32];

        uint64_t v42 = (void *)v33;
        uint64_t v30 = +[PHAssetCollection fetchAssetCollectionsContainingAssets:v15 withType:3 options:v33];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        uint64_t v34 = [v30 countByEnumeratingWithState:&v44 objects:v52 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = 0;
          uint64_t v37 = *(void *)v45;
          do
          {
            for (uint64_t j = 0; j != v35; ++j)
            {
              if (*(void *)v45 != v37) {
                objc_enumerationMutation(v30);
              }
              v36 += [*(id *)(*((void *)&v44 + 1) + 8 * j) estimatedAssetCount];
            }
            uint64_t v35 = [v30 countByEnumeratingWithState:&v44 objects:v52 count:16];
          }
          while (v35);
        }
        else
        {
          uint64_t v36 = 0;
        }
        uint64_t v26 = v36 == [v15 count];
        unint64_t v22 = 0x1E4F28000uLL;
        id v25 = 0;
        goto LABEL_36;
      }
    }
    uint64_t v26 = 0;
LABEL_38:
    v40 = [*(id *)(v22 + 3792) numberWithBool:v26];
    [v9 setObject:v40 forKeyedSubscript:@"PHPhotosGraphOptionIsCompleteMoments"];
  }

  return v9;
}

+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 title:(id)a4 identifier:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[PHAssetCollection alloc] initTransientWithAssets:0 orFetchResult:v9 title:v8 identifier:v7];

  return v10;
}

+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 title:(id)a4 subtype:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[PHAssetCollection alloc] initTransientWithAssets:0 orFetchResult:v8 title:v7 identifier:0 albumKind:2 subtype:a5];

  return v9;
}

+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 subtype:(int64_t)a4
{
  return +[PHAssetCollection transientAssetCollectionWithAssetFetchResult:a3 title:0 subtype:a4];
}

+ (id)transientAssetCollectionWithFetchOptions:(id)a3 title:(id)a4 subtitle:(id)a5 titleFontName:(id)a6 identifier:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = +[PHQuery queryForAssetsWithOptions:a3];
  LODWORD(v18) = 2;
  id v16 = [[PHAssetCollection alloc] initTransientWithAssets:0 orFetchResult:0 orQuery:v15 title:v14 subtitle:v13 titleFontName:v12 identifier:v11 albumKind:v18 subtype:200 photoLibrary:0];

  return v16;
}

+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 type:(int64_t)a4 subtype:(int64_t)a5 title:(id)a6 subtitle:(id)a7 titleFontName:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a3;
  HIDWORD(v19) = 2;
  LOBYTE(v19) = [(id)objc_opt_class() _defaultKeyAssetsAtEndForType:a4 subtype:a5];
  id v17 = -[PHAssetCollection _initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:keyAssetsAtEnd:albumKind:type:subtype:startDate:endDate:photoLibrary:]([PHAssetCollection alloc], "_initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:keyAssetsAtEnd:albumKind:type:subtype:startDate:endDate:photoLibrary:", 0, v16, 0, v15, v14, v13, 0, v19, a4, a5, 0, 0, 0);

  return v17;
}

+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 title:(id)a4 subtitle:(id)a5 titleFontName:(id)a6
{
  return +[PHAssetCollection transientAssetCollectionWithAssetFetchResult:a3 type:2 subtype:200 title:a4 subtitle:a5 titleFontName:a6];
}

+ (id)transientAssetCollectionWithAssetFetchResult:(id)a3 title:(id)a4 subtitle:(id)a5 identifier:(id)a6 startDate:(id)a7 endDate:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  char v19 = [(id)objc_opt_class() _defaultKeyAssetsAtEndForType:1 subtype:2];
  id v20 = [PHAssetCollection alloc];
  uint64_t v21 = [v18 photoLibrary];
  HIDWORD(v24) = 2;
  LOBYTE(v24) = v19;
  id v22 = -[PHAssetCollection _initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:keyAssetsAtEnd:albumKind:type:subtype:startDate:endDate:photoLibrary:](v20, "_initTransientWithAssets:orFetchResult:orQuery:title:subtitle:titleFontName:identifier:keyAssetsAtEnd:albumKind:type:subtype:startDate:endDate:photoLibrary:", 0, v18, 0, v17, v16, 0, v15, v24, 1, 2, v14, v13, v21);

  return v22;
}

+ (PHAssetCollection)transientAssetCollectionWithAssetFetchResult:(PHFetchResult *)fetchResult title:(NSString *)title
{
  unint64_t v5 = title;
  BOOL v6 = fetchResult;
  id v7 = [[PHAssetCollection alloc] initTransientWithAssets:0 orFetchResult:v6 title:v5 identifier:0];

  return (PHAssetCollection *)v7;
}

+ (id)transientAssetCollectionWithAssets:(id)a3 subtype:(int64_t)a4 identifier:(id)a5 startDate:(id)a6 endDate:(id)a7 title:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a3;
  LODWORD(v20) = 2;
  id v18 = [[PHAssetCollection alloc] initTransientWithAssets:v17 orFetchResult:0 orQuery:0 title:v13 subtitle:0 titleFontName:0 identifier:v16 albumKind:v20 subtype:a4 startDate:v15 endDate:v14 photoLibrary:0];

  return v18;
}

+ (PHAssetCollection)transientAssetCollectionWithAssets:(NSArray *)assets title:(NSString *)title
{
  unint64_t v5 = title;
  BOOL v6 = assets;
  id v7 = [[PHAssetCollection alloc] initTransientWithAssets:v6 orFetchResult:0 title:v5 identifier:0];

  return (PHAssetCollection *)v7;
}

+ (id)fetchMomentsInHighlight:(id)a3 options:(id)a4
{
  id v5 = a4;
  BOOL v6 = +[PHQuery queryForMomentsInPhotosHighlight:a3];
  [v6 setFetchOptions:v5];

  id v7 = [v6 executeQuery];

  return v7;
}

+ (id)fetchPhotosHighlightsContainingMoments:(id)a3 options:(id)a4
{
  id v5 = a4;
  BOOL v6 = +[PHQuery queryForPhotosHighlightsContainingMoments:a3];
  [v6 setFetchOptions:v5];

  id v7 = [v6 executeQuery];

  return v7;
}

+ (id)fetchMomentsBackingSuggestion:(id)a3 options:(id)a4
{
  id v5 = a4;
  BOOL v6 = +[PHQuery queryForMomentsBackingSuggestion:a3];
  [v6 setFetchOptions:v5];

  id v7 = [v6 executeQuery];

  return v7;
}

+ (id)fetchMomentsBackingMemory:(id)a3 options:(id)a4
{
  id v5 = a4;
  BOOL v6 = +[PHQuery queryForMomentsBackingMemory:a3];
  [v6 setFetchOptions:v5];

  id v7 = [v6 executeQuery];

  return v7;
}

+ (PHFetchResult)fetchMomentsWithOptions:(PHFetchOptions *)options
{
  return (PHFetchResult *)+[PHObject authorizationAwareFetchResultWithOptions:options fetchBlock:&__block_literal_global_165];
}

id __45__PHAssetCollection_fetchMomentsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = [v2 sortDescriptors];
  if (!v3 || (v4 = (void *)v3, uint64_t v5 = [v2 chunkSizeForFetch], v4, !v5))
  {
    if (v2)
    {
      uint64_t v6 = [v2 copy];

      id v2 = (id)v6;
    }
    else
    {
      id v2 = (id)objc_opt_new();
    }
    id v7 = [v2 sortDescriptors];

    if (!v7)
    {
      id v8 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:1];
      v13[0] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
      [v2 setSortDescriptors:v9];
    }
    if (![v2 chunkSizeForFetch]) {
      [v2 setChunkSizeForFetch:2000];
    }
  }
  id v10 = +[PHQuery queryForMomentsWithOptions:v2];
  id v11 = [v10 executeQuery];

  return v11;
}

+ (PHFetchResult)fetchMomentsInMomentList:(PHCollectionList *)momentList options:(PHFetchOptions *)options
{
  uint64_t v5 = momentList;
  uint64_t v6 = options;
  id v7 = v6;
  if (v5)
  {
    if (![(PHFetchOptions *)v6 chunkSizeForFetch])
    {
      id v8 = [(PHObject *)v5 photoLibrary];
      id v9 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:v7 photoLibrary:v8];

      [(PHFetchOptions *)v9 setChunkSizeForFetch:2000];
      id v7 = v9;
    }
    id v10 = +[PHQuery queryForMomentsInMomentList:v5 options:v7];
    id v11 = [v10 executeQuery];
  }
  else
  {
    id v11 = 0;
  }

  return (PHFetchResult *)v11;
}

+ (id)fetchSuggestedContributionsForAssetsMetadata:(id)a3 options:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 photoLibrary];
  if (!v7)
  {
    id v15 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"You must specify a PHPhotoLibrary in the fetch options" userInfo:0];
    objc_exception_throw(v15);
  }
  id v8 = v7;
  id v9 = [v7 photoAnalysisClient];
  id v16 = 0;
  id v10 = [v9 requestSuggestedContributionsForAssetsMetadata:v5 error:&v16];
  id v11 = v16;
  if (v11)
  {
    id v12 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v5;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, "Can't request suggestion contributions for assets metadata %@: %@", buf, 0x16u);
    }

    goto LABEL_6;
  }
  if (![v10 count])
  {
LABEL_6:
    id v13 = 0;
    goto LABEL_9;
  }
  id v13 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v10 options:v6];
LABEL_9:

  return v13;
}

+ (id)fetchSuggestedContributionsForFileURLs:(id)a3 options:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v37 = a4;
  uint64_t v36 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  id v7 = objc_alloc_init(PHValidator);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v6;
  uint64_t v39 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v39)
  {
    id v34 = a1;
    id v8 = 0;
    uint64_t v38 = *(void *)v44;
    while (1)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v44 != v38) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v43 + 1) + 8 * v9);
        id v42 = v8;
        BOOL v11 = [(PHValidator *)v7 validateURL:v10 withOptions:16 error:&v42];
        id v12 = v42;

        if (v11)
        {
          id v8 = v12;
LABEL_11:
          id v16 = [MEMORY[0x1E4F1CA60] dictionary];
          id v17 = objc_alloc(MEMORY[0x1E4F8CC48]);
          id v18 = [v37 photoLibrary];
          __int16 v19 = [v18 photoLibraryBundle];
          id v20 = [v19 timeZoneLookup];
          uint64_t v21 = (void *)[v17 initWithMediaURL:v10 timeZoneLookup:v20];

          id v22 = [v21 utcCreationDate];
          if (v22) {
            [v16 setObject:v22 forKeyedSubscript:@"PHSuggestedContributionsAssetsMetadataCreationDateKey"];
          }
          uint64_t v23 = [v21 gpsLocation];
          uint64_t v24 = v23;
          if (v23)
          {
            id v25 = NSNumber;
            [v23 coordinate];
            uint64_t v26 = objc_msgSend(v25, "numberWithDouble:");
            [v16 setObject:v26 forKeyedSubscript:@"PHSuggestedContributionsAssetsMetadataLatitudeKey"];

            uint64_t v27 = NSNumber;
            [v24 coordinate];
            SEL v29 = [v27 numberWithDouble:v28];
            [v16 setObject:v29 forKeyedSubscript:@"PHSuggestedContributionsAssetsMetadataLongitudeKey"];
          }
          if ([v16 count])
          {
            [v36 addObject:v16];
          }
          else
          {
            uint64_t v30 = PLPhotoKitGetLog();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v48 = v10;
              _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_DEFAULT, "+[PHAssetCollection() fetchSuggestedContributionsForFileURLs:options:]: No metadata (date or location) found for asset at url: %@", buf, 0xCu);
            }
          }
          goto LABEL_21;
        }
        id v41 = v12;
        BOOL v13 = [(PHValidator *)v7 validateURL:v10 withOptions:32 error:&v41];
        id v14 = v41;

        if (v13)
        {
          id v8 = v14;
          goto LABEL_11;
        }
        id v40 = v14;
        BOOL v15 = [(PHValidator *)v7 validateURL:v10 withOptions:64 error:&v40];
        id v8 = v40;

        if (v15) {
          goto LABEL_11;
        }
        id v16 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v48 = v10;
          _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "+[PHAssetCollection() fetchSuggestedContributionsForFileURLs:options:]: No valid asset for url: %@", buf, 0xCu);
        }
LABEL_21:

        ++v9;
      }
      while (v39 != v9);
      uint64_t v31 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
      uint64_t v39 = v31;
      if (!v31)
      {

        a1 = v34;
        break;
      }
    }
  }

  uint64_t v32 = [a1 fetchSuggestedContributionsForAssetsMetadata:v36 options:v37];

  return v32;
}

+ (id)assetsMetadataFromAssets:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v27 = [MEMORY[0x1E4F1CA48] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0x1E4F1C000uLL;
    uint64_t v7 = *(void *)v29;
    id v8 = @"PHSuggestedContributionsAssetsMetadataCreationDateKey";
    do
    {
      uint64_t v9 = 0;
      uint64_t v25 = v5;
      do
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * v9);
        BOOL v11 = [*(id *)(v6 + 2656) dictionary];
        id v12 = [v10 location];
        BOOL v13 = v12;
        if (v12)
        {
          [v12 coordinate];
          double latitude = v35.latitude;
          double longitude = v35.longitude;
          if (CLLocationCoordinate2DIsValid(v35))
          {
            id v16 = [NSNumber numberWithDouble:latitude];
            [v11 setObject:v16 forKeyedSubscript:@"PHSuggestedContributionsAssetsMetadataLatitudeKey"];

            id v17 = [NSNumber numberWithDouble:longitude];
            [v11 setObject:v17 forKeyedSubscript:@"PHSuggestedContributionsAssetsMetadataLongitudeKey"];

            id v18 = NSNumber;
            [v10 coarseLocationProperties];
            __int16 v19 = v8;
            v21 = unint64_t v20 = v6;
            [v21 gpsHorizontalAccuracy];
            id v22 = objc_msgSend(v18, "numberWithDouble:");
            [v11 setObject:v22 forKeyedSubscript:@"PHSuggestedContributionsAssetsMetadataHorizontalAccuracyKey"];

            unint64_t v6 = v20;
            id v8 = v19;
            uint64_t v5 = v25;
          }
        }
        uint64_t v23 = [v10 creationDate];
        [v11 setObject:v23 forKeyedSubscript:v8];
        [v27 addObject:v11];

        ++v9;
      }
      while (v5 != v9);
      uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v5);
  }

  return v27;
}

+ (id)fetchSuggestedContributionsForAssetsFetchResult:(id)a3 options:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a1 assetsMetadataFromAssets:a3];
  id v8 = [a1 fetchSuggestedContributionsForAssetsMetadata:v7 options:v6];

  return v8;
}

+ (id)fetchRecentContentSyndicationAssetCollectionsWithOptions:(id)a3 maxNumberOfStacks:(int64_t)a4 maxNumberOfAssetsPerStack:(int64_t)a5
{
  v77[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v56 = a4;
  int64_t v8 = a5 * a4;
  v53 = +[PHFetchOptions effectivePhotoLibraryForFetchOptions:v7 object:0];
  uint64_t v54 = v7;
  uint64_t v9 = +[PHFetchOptions fetchOptionsCopyFromNullableFetchOptions:photoLibrary:](PHFetchOptions, "fetchOptionsCopyFromNullableFetchOptions:photoLibrary:", v7);
  uint64_t v10 = +[PHAsset filterPredicateToExcludeNoSyndicationAssets];
  uint64_t v11 = +[PHAsset filterPredicateToIncludeOnlyReceivedSyndicatedAssets];
  uint64_t v12 = [v9 internalPredicate];
  BOOL v13 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v50 = (void *)v10;
  if (v12)
  {
    id v14 = (void *)v12;
    v77[0] = v12;
    v77[1] = v10;
    v77[2] = v11;
    BOOL v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:3];
    uint64_t v16 = [v13 andPredicateWithSubpredicates:v15];
  }
  else
  {
    v76[0] = v10;
    v76[1] = v11;
    BOOL v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
    uint64_t v16 = [v13 andPredicateWithSubpredicates:v15];
  }
  long long v49 = (void *)v11;

  uint64_t v48 = (void *)v16;
  [v9 setInternalPredicate:v16];
  if (v8 >= 2)
  {
    id v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"addedDate" ascending:0];
    v75 = v17;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:1];
    [v9 setInternalSortDescriptors:v18];
  }
  v74 = @"PHAssetPropertySetCuration";
  __int16 v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
  [v9 addFetchPropertySets:v19];

  [v9 setFetchLimit:v8];
  uint64_t v52 = v9;
  long long v47 = +[PHQuery queryForAssetsWithOptions:v9];
  unint64_t v20 = [v47 executeQuery];
  v61 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v56];
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v21 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v56];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v68 objects:v73 count:16];
  v55 = v22;
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v69;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v69 != v25) {
          objc_enumerationMutation(v22);
        }
        id v27 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        long long v28 = [v27 curationProperties];
        long long v29 = [v28 syndicationIdentifier];

        long long v30 = PLSearchableIdentifierFromMessagesSyndicationID();
        if (v30)
        {
          long long v31 = [v61 objectForKeyedSubscript:v30];
          if (v31)
          {
LABEL_13:
            if ([v31 count] < (unint64_t)a5) {
              [v31 addObject:v27];
            }
          }
          else if ([v61 count] >= v56)
          {
            long long v31 = 0;
            id v22 = v55;
          }
          else
          {
            long long v31 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:a5];
            [v61 setObject:v31 forKeyedSubscript:v30];
            [v21 addObject:v30];
            id v22 = v55;
            if (v31) {
              goto LABEL_13;
            }
          }
        }
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v68 objects:v73 count:16];
    }
    while (v24);
  }
  int64_t v51 = a5;

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id obj = v21;
  uint64_t v60 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (v60)
  {
    uint64_t v58 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v60; ++j)
      {
        if (*(void *)v65 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = *(void *)(*((void *)&v64 + 1) + 8 * j);
        id v34 = [NSNumber numberWithUnsignedInteger:PLSearchableUniqueIdentifierHashFromSearchableIdentifier()];
        uint64_t v62 = [v34 stringValue];

        v63 = [v61 objectForKeyedSubscript:v33];
        CLLocationCoordinate2D v35 = [v63 allObjects];
        uint64_t v36 = [v35 sortedArrayUsingComparator:&__block_literal_global_144_4163];

        id v37 = [v36 firstObject];
        uint64_t v38 = [v36 lastObject];
        uint64_t v39 = [v37 curationProperties];
        id v40 = [v39 addedDate];
        id v41 = [v38 curationProperties];
        id v42 = [v41 addedDate];
        long long v43 = +[PHAssetCollection transientAssetCollectionWithAssets:v36 subtype:1000000501 identifier:v62 startDate:v40 endDate:v42 title:0];

        [v59 addObject:v43];
      }
      uint64_t v60 = [obj countByEnumeratingWithState:&v64 objects:v72 count:16];
    }
    while (v60);
  }

  LOBYTE(v46) = 1;
  long long v44 = [[PHRecentContentSyndicationCollectionsResult alloc] initWithObjects:v59 photoLibrary:v53 fetchOptions:v52 maxNumberOfStacks:v56 maxNumberOfAssetsPerStack:v51 fetchType:@"PHAssetCollection" fetchPropertySets:0 identifier:0 registerIfNeeded:v46];

  return v44;
}

uint64_t __122__PHAssetCollection_fetchRecentContentSyndicationAssetCollectionsWithOptions_maxNumberOfStacks_maxNumberOfAssetsPerStack___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 curationProperties];
  id v6 = [v5 syndicationIdentifier];
  uint64_t v7 = PLAttachmentIndexFromMessagesSyndicationID();

  int64_t v8 = [v4 curationProperties];

  uint64_t v9 = [v8 syndicationIdentifier];
  uint64_t v10 = PLAttachmentIndexFromMessagesSyndicationID();

  uint64_t v11 = [NSNumber numberWithUnsignedInteger:v7];
  uint64_t v12 = [NSNumber numberWithUnsignedInteger:v10];
  uint64_t v13 = [v11 compare:v12];

  return v13;
}

+ (id)fetchUserLibraryAlbumWithOptions:(id)a3
{
  return (id)[a1 fetchAssetCollectionsWithType:2 subtype:209 options:a3];
}

+ (id)fetchAssetCollectionsWithObjectIDs:(id)a3 options:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__PHAssetCollection_fetchAssetCollectionsWithObjectIDs_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  id v6 = v5;
  uint64_t v7 = +[PHObject authorizationAwareFetchResultWithOptions:a4 fetchBlock:v9];

  return v7;
}

id __64__PHAssetCollection_fetchAssetCollectionsWithObjectIDs_options___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[PHQuery queryForAssetCollectionsWithObjectIDs:*(void *)(a1 + 32) options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (PHFetchResult)fetchAssetCollectionsWithALAssetGroupURLs:(NSArray *)assetGroupURLs options:(PHFetchOptions *)options
{
  id v5 = assetGroupURLs;
  id v6 = options;
  if (![(NSArray *)v5 count]) {
    goto LABEL_3;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__PHAssetCollection_fetchAssetCollectionsWithALAssetGroupURLs_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  uint64_t v7 = +[PHObject authorizationAwareFetchResultWithOptions:v6 fetchBlock:v9];

  if (!v7) {
LABEL_3:
  }
    uint64_t v7 = objc_alloc_init(PHFetchResult);

  return v7;
}

id __71__PHAssetCollection_fetchAssetCollectionsWithALAssetGroupURLs_options___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(MEMORY[0x1E4F8A848], "uuidFromGroupURL:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if ([v4 count])
  {
    uint64_t v11 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v4 options:v3];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (PHFetchResult)fetchAssetCollectionsWithLocalIdentifiers:(NSArray *)identifiers options:(PHFetchOptions *)options
{
  id v5 = identifiers;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__PHAssetCollection_fetchAssetCollectionsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E5849048;
  id v10 = v5;
  uint64_t v6 = v5;
  uint64_t v7 = +[PHObject authorizationAwareFetchResultWithOptions:options fetchBlock:v9];

  return (PHFetchResult *)v7;
}

id __71__PHAssetCollection_fetchAssetCollectionsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[PHQuery queryForAssetCollectionsWithLocalIdentifiers:*(void *)(a1 + 32) options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchAssetCollectionsWithType:(int64_t)a3 localIdentifiers:(id)a4 options:(id)a5
{
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __76__PHAssetCollection_fetchAssetCollectionsWithType_localIdentifiers_options___block_invoke;
  v11[3] = &unk_1E5842528;
  id v12 = v7;
  int64_t v13 = a3;
  id v8 = v7;
  uint64_t v9 = +[PHObject authorizationAwareFetchResultWithOptions:a5 fetchBlock:v11];

  return v9;
}

id __76__PHAssetCollection_fetchAssetCollectionsWithType_localIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = +[PHQuery queryForAssetCollectionsWithType:*(void *)(a1 + 40) localIdentifiers:*(void *)(a1 + 32) options:a2];
  id v3 = [v2 executeQuery];

  return v3;
}

+ (id)fetchAssetCollectionsContainingAssets:(id)a3 withType:(int64_t)a4 options:(id)a5
{
  if (a3)
  {
    id v5 = +[PHQuery queryForAssetCollectionsContainingAssets:a3 withType:a4 options:a5];
    uint64_t v6 = [v5 executeQuery];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (PHFetchResult)fetchAssetCollectionsContainingAsset:(PHAsset *)asset withType:(PHAssetCollectionType)type options:(PHFetchOptions *)options
{
  if (asset)
  {
    id v5 = +[PHQuery queryForAssetCollectionsContainingAsset:asset withType:type options:options];
    uint64_t v6 = [v5 executeQuery];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (PHFetchResult *)v6;
}

+ (id)fetchAllTripHighlightsContainingAssetsWithUUIDs:(id)a3 options:(id)a4
{
  if (a3)
  {
    id v4 = +[PHQuery queryForAllTripHighlightsContainingAssetUUIDs:a3 options:a4];
    id v5 = [v4 executeQuery];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__PHAssetCollection_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_4169 != -1) {
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_4169, block);
  }
  if ([(id)transformValueExpression_forKeyPath___passThroughSet_4170 containsObject:v7]) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

void __57__PHAssetCollection_transformValueExpression_forKeyPath___block_invoke()
{
  v4[6] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"localizedTitle";
  v4[1] = @"title";
  v4[2] = @"estimatedAssetCount";
  v4[3] = @"startDate";
  v4[4] = @"endDate";
  v4[5] = @"cloudGUID";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_4170;
  transformValueExpression_forKeyPath___passThroughSet_4170 = v2;
}

void __33__PHAssetCollection_entityKeyMap__block_invoke()
{
  v23[9] = *MEMORY[0x1E4F143B8];
  id v12 = [PHEntityKeyMap alloc];
  uint64_t v21 = @"uuid";
  v22[0] = @"uuid";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  v23[0] = v0;
  v22[1] = @"title";
  v20[0] = @"localizedTitle";
  v20[1] = @"title";
  uint64_t v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
  v23[1] = v1;
  v22[2] = @"cachedCount";
  __int16 v19 = @"estimatedAssetCount";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  v23[2] = v2;
  v22[3] = @"customSortAscending";
  uint64_t v18 = @"customSortAscending";
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  v23[3] = v3;
  v22[4] = @"customSortKey";
  id v17 = @"customSortKey";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  v23[4] = v4;
  v22[5] = @"startDate";
  long long v16 = @"startDate";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  v23[5] = v5;
  v22[6] = @"endDate";
  long long v15 = @"endDate";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  v23[6] = v6;
  v22[7] = @"cloudGUID";
  long long v14 = @"cloudGUID";
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
  v23[7] = v7;
  v22[8] = @"privacyState";
  int64_t v13 = @"privacyState";
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  v23[8] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:9];
  uint64_t v10 = [(PHEntityKeyMap *)v12 initWithPropertyKeysByEntityKey:v9];
  uint64_t v11 = (void *)entityKeyMap_pl_once_object_16;
  entityKeyMap_pl_once_object_16 = v10;
}

+ (id)fetchType
{
  uint64_t v2 = @"PHAssetCollection";
  return @"PHAssetCollection";
}

void __47__PHAssetCollection_propertiesToFetchWithHint___block_invoke_85(uint64_t a1)
{
  uint64_t v2 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint;
  id v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v4 = [v2 objectForKey:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v7 = [*(id *)(a1 + 48) _composePropertiesToFetchWithHint:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = (void *)propertiesToFetchWithHint__propertiesToFetchByHint;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithArray:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    [v10 setObject:v12 forKey:v11];
  }
}

- (id)pl_assetContainer
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    id v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"PHAdoptionUtilities.m" lineNumber:70 description:@"This is only callable on the main thread"];
  }
  if ([(PHAssetCollection *)self assetCollectionType] == PHAssetCollectionTypeMoment)
  {
    uint64_t v4 = (void *)MEMORY[0x19F389B10]();
    uint64_t v5 = [(PHObject *)self photoLibrary];
    id v6 = [v5 mainQueueConcurrencyPhotoLibrary];
    uint64_t v7 = [v6 managedObjectContext];

    uint64_t v8 = [(PHObject *)self objectID];
    id v23 = 0;
    uint64_t v9 = [v7 existingObjectWithID:v8 error:&v23];
    id v10 = v23;

    if (!v9 && v10)
    {
      uint64_t v11 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v10;
        _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEFAULT, "Failed to fetch moment: %@", buf, 0xCu);
      }
    }
  }
  else if ([(PHObject *)self isTransient])
  {
    id v12 = [(PHObject *)self photoLibrary];
    int64_t v13 = [v12 librarySpecificFetchOptions];

    [v13 setIncludeHiddenAssets:1];
    long long v14 = +[PHAsset fetchAssetsInAssetCollection:self options:v13];
    if ([v14 count])
    {
      uint64_t v9 = objc_msgSend(v14, "pl_photoLibraryObject");
    }
    else
    {
      id v19 = objc_alloc(MEMORY[0x1E4F8ABE0]);
      unint64_t v20 = [MEMORY[0x1E4F1CAA0] orderedSet];
      uint64_t v9 = (void *)[v19 initWithTitle:&stru_1EEAC1950 assets:v20];
    }
  }
  else
  {
    long long v15 = (void *)MEMORY[0x1E4F8A848];
    long long v16 = [(PHObject *)self objectID];
    id v17 = [(PHObject *)self photoLibrary];
    uint64_t v18 = [v17 mainQueueConcurrencyPhotoLibrary];
    uint64_t v9 = [v15 albumWithObjectID:v16 inLibrary:v18];
  }

  return v9;
}

+ (id)posterImageForAssetCollection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 assetCollectionType];
  uint64_t v5 = [v3 assetCollectionSubtype];
  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 3)
  {
    id v6 = 0;
    goto LABEL_20;
  }
  if (v4 == 1)
  {
    if ((unint64_t)(v5 - 100) < 2)
    {
      if (![v3 estimatedAssetCount])
      {
        uint64_t v7 = PLPhotoLibraryServicesFrameworkBundle();
        uint64_t v8 = v7;
        uint64_t v9 = @"PLEmptyPhotoStream";
        goto LABEL_10;
      }
    }
    else
    {
      if (v5 == 4)
      {
        uint64_t v8 = objc_msgSend(v3, "pl_assetContainer");
        id v6 = [v8 posterImage];
LABEL_12:

        if (v6) {
          goto LABEL_20;
        }
        goto LABEL_13;
      }
      if (v5 == 205)
      {
        uint64_t v7 = PLPhotoLibraryServicesFrameworkBundle();
        uint64_t v8 = v7;
        uint64_t v9 = @"PLEmptyAlbum";
LABEL_10:
        id v10 = [v7 pathForResource:v9 ofType:@"png"];
        id v6 = DCIM_newPLImageWithContentsOfFile();

        goto LABEL_12;
      }
    }
  }
LABEL_13:
  if ([v3 estimatedAssetCount]) {
    goto LABEL_14;
  }
  uint64_t v21 = PLPhotoLibraryServicesFrameworkBundle();
  id v22 = [v21 pathForResource:@"PLEmptyAlbum" ofType:@"png"];
  id v6 = DCIM_newPLImageWithContentsOfFile();

  if (!v6)
  {
LABEL_14:
    uint64_t v11 = [v3 photoLibrary];
    id v12 = +[PHFetchOptions fetchOptionsWithInclusiveDefaultsForPhotoLibrary:v11];
    int64_t v13 = +[PHAsset fetchKeyAssetsInAssetCollection:v3 options:v12];
    long long v14 = [v13 firstObject];

    if (v14)
    {
      long long v15 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
      [v15 posterThumbnailSize];
      double v17 = v16;
      double v19 = v18;

      unint64_t v20 = +[PHImageManager defaultManager];
      id v6 = objc_msgSend(v20, "synchronousImageForAsset:targetSize:contentMode:options:", v14, 0, 0, v17, v19);
    }
    else
    {
      id v6 = 0;
    }
  }
LABEL_20:

  return v6;
}

+ (id)pl_PHAssetCollectionForAssetContainer:(id)a3 photoLibrary:(id)a4 includeTrash:(BOOL)a5
{
  uint64_t v5 = +[PHFetchResult pl_fetchResultContainingAssetContainer:a3 photoLibrary:a4 includeTrash:a5];
  id v6 = [v5 firstObject];

  return v6;
}

+ (id)pl_PHAssetCollectionForAssetContainer:(id)a3 photoLibrary:(id)a4
{
  return +[PHAssetCollection pl_PHAssetCollectionForAssetContainer:a3 photoLibrary:a4 includeTrash:0];
}

+ (id)pl_albumsForAssetCollections:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, a1, @"PHAdoptionUtilities.m", 100, @"Invalid parameter not satisfying: %@", @"NSThread.isMainThread" object file lineNumber description];
  }
  if ([v5 count])
  {
    id v6 = [v5 firstObject];
    uint64_t v7 = [v6 photoLibrary];
    uint64_t v8 = [v7 mainQueueConcurrencyPhotoLibrary];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = (void *)MEMORY[0x1E4F8A848];
          double v16 = [*(id *)(*((void *)&v20 + 1) + 8 * i) objectID];
          double v17 = [v15 albumWithObjectID:v16 inLibrary:v8];

          if (v17) {
            [v9 addObject:v17];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (id)objectReference
{
  return +[PHAssetCollectionReference referenceForAssetCollection:self];
}

+ (id)fetchAssetCollectionsForReferences:(id)a3 photoLibrary:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = +[PHAssetCollection fetchType];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __88__PHAssetCollection_PHObjectReference__fetchAssetCollectionsForReferences_photoLibrary___block_invoke;
  v11[3] = &unk_1E5846B50;
  id v12 = v5;
  id v8 = v5;
  id v9 = PHCollectionReferenceFetchCollectionsForReferences((uint64_t)v6, v8, v7, v11);

  return v9;
}

id __88__PHAssetCollection_PHObjectReference__fetchAssetCollectionsForReferences_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 librarySpecificFetchOptions];
  [v4 setIncludeUserSmartAlbums:1];
  [v4 setIncludeTrashedAssets:1];
  id v5 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v3 options:v4];

  return v5;
}

@end