@interface BLML3TrackImporter
- (BOOL)importLibraryItems:(id)a3 toMusicLibrary:(id)a4 importedItemPids:(id)a5;
- (id)_absoluteTimeValueForDateValue:(id)a3;
- (id)_currentTrackChapterDataForTrackPid:(int64_t)a3 libraryItem:(id)a4 usingLibrary:(id)a5;
- (id)_currentTrackMovieInfoFromMetadata:(id)a3;
- (id)_extendedContentRatingStringForLibraryItem:(id)a3;
- (id)_importPropertiesFromLibraryItem:(id)a3 fromAccount:(id)a4 usingLibrary:(id)a5;
- (id)_storeArtworkTokenFromLibraryItem:(id)a3 metadata:(id)a4;
- (id)_stringValueForURLValue:(id)a3;
@end

@implementation BLML3TrackImporter

- (BOOL)importLibraryItems:(id)a3 toMusicLibrary:(id)a4 importedItemPids:(id)a5
{
  id v31 = a3;
  id v8 = a4;
  id v30 = a5;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 1;
  v9 = +[BUAccountsProvider sharedProvider];
  v10 = [v9 activeStoreAccount];

  if ([v31 count])
  {
    v11 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v31 count]);
    long long v43 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v40 = 0u;
    id v12 = v31;
    id v13 = [v12 countByEnumeratingWithState:&v40 objects:v54 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v41;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(v12);
          }
          v16 = [(BLML3TrackImporter *)self _importPropertiesFromLibraryItem:*(void *)(*((void *)&v40 + 1) + 8 * i) fromAccount:v10 usingLibrary:v8];
          [v11 addObject:v16];
        }
        id v13 = [v12 countByEnumeratingWithState:&v40 objects:v54 count:16];
      }
      while (v13);
    }

    CFStringRef v52 = @"track_items";
    v53 = v11;
    +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    v27 = uint64_t v39 = 0;
    v29 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:");
    id v17 = 0;
    if (v17)
    {
      v18 = BLServiceLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v49 = v19;
        __int16 v50 = 2112;
        id v51 = v17;
        id v20 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@: Failed to archive track items. Error =  %@", buf, 0x16u);
      }
    }
    dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
    dispatch_get_global_queue(-32768, 0);
    v22 = v28 = v17;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100067958;
    block[3] = &unk_1001A3018;
    v38 = &v44;
    id v33 = v29;
    v34 = self;
    id v35 = v30;
    id v36 = v12;
    dispatch_semaphore_t v37 = v21;
    v23 = v21;
    id v24 = v29;
    dispatch_async(v22, block);

    dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
  }
  BOOL v25 = *((unsigned char *)v45 + 24) != 0;

  _Block_object_dispose(&v44, 8);
  return v25;
}

- (id)_importPropertiesFromLibraryItem:(id)a3 fromAccount:(id)a4 usingLibrary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v160 = a5;
  v10 = +[NSMutableDictionary dictionaryWithCapacity:100];
  v11 = [v8 itemMetadata];
  uint64_t v12 = +[BLMLImporterItem mediaTypeForStoreDownload:v11];
  if ([v8 libraryPersistentIdentifier])
  {
    id v13 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v8 libraryPersistentIdentifier]);
    [v10 setObject:v13 forKeyedSubscript:&off_1001AF8E0];
  }
  else
  {
    uint64_t v14 = [v8 itemDownloadIdentifier];

    if (!v14) {
      goto LABEL_8;
    }
    v15 = [v8 itemDownloadIdentifier];
    id v13 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyDownloadIdentifier equalToValue:v15];

    v16 = +[ML3Track anyInLibrary:v160 predicate:v13];
    id v17 = v16;
    if (v16)
    {
      v18 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v16 persistentID]);
      [v10 setObject:v18 forKeyedSubscript:&off_1001AF8E0];
    }
  }

LABEL_8:
  v19 = +[NSNumber numberWithUnsignedInt:v12];
  [v10 setObject:v19 forKey:&off_1001AF8F8];

  id v20 = [v11 collectionIndexInCollectionGroup];

  if (v20)
  {
    dispatch_semaphore_t v21 = [v11 collectionIndexInCollectionGroup];
    [v10 setObject:v21 forKey:&off_1001AF910];
  }
  v22 = [v11 indexInCollection];

  if (v22)
  {
    v23 = [v11 indexInCollection];
    [v10 setObject:v23 forKey:&off_1001AF928];
  }
  id v24 = [v11 episodeSortIdentifier];

  if (v24)
  {
    BOOL v25 = [v11 episodeSortIdentifier];
    [v10 setObject:v25 forKey:&off_1001AF940];
  }
  [v10 setObject:&off_1001AF958 forKey:&off_1001AF970];
  [v10 setObject:&__kCFBooleanFalse forKey:&off_1001AF988];
  v26 = [v11 artistName];

  if (v26)
  {
    v27 = [v11 artistName];
    [v10 setObject:v27 forKey:&off_1001AF9A0];
  }
  v28 = [v11 seriesName];

  if (v28)
  {
    v29 = [v11 seriesName];
    [v10 setObject:v29 forKey:&off_1001AF9B8];
  }
  id v30 = [v11 collectionArtistName];

  if (v30)
  {
    id v31 = [v11 collectionArtistName];
    [v10 setObject:v31 forKey:&off_1001AF9D0];
  }
  v32 = [v11 genre];

  if (v32)
  {
    id v33 = [v11 genre];
    [v10 setObject:v33 forKey:&off_1001AF9E8];
  }
  v34 = [v8 itemMediaPath];

  if (v34)
  {
    id v35 = [v8 itemMediaPath];
    [v10 setObject:v35 forKey:&off_1001AFA00];
  }
  id v36 = [v11 collectionName];

  if (v36)
  {
    dispatch_semaphore_t v37 = [v11 collectionName];
    [v10 setObject:v37 forKey:&off_1001AFA18];
  }
  v38 = [v11 composerName];

  if (v38)
  {
    uint64_t v39 = [v11 composerName];
    [v10 setObject:v39 forKey:&off_1001AFA30];
  }
  long long v40 = [v11 showComposer];

  if (v40)
  {
    long long v41 = [v11 showComposer];
    [v10 setObject:v41 forKey:&off_1001AFA48];
  }
  if ([v11 isMusicShow])
  {
    long long v42 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isMusicShow]);
    [v10 setObject:v42 forKey:&off_1001AFA60];
  }
  long long v43 = [v11 title];

  if (v43)
  {
    uint64_t v44 = [v11 title];
    [v10 setObject:v44 forKey:&off_1001AFA78];
  }
  v45 = [v11 numberOfCollectionsInCollectionGroup];

  if (v45)
  {
    uint64_t v46 = [v11 numberOfCollectionsInCollectionGroup];
    [v10 setObject:v46 forKey:&off_1001AFA90];
  }
  char v47 = [v11 numberOfItemsInCollection];

  if (v47)
  {
    v48 = [v11 numberOfItemsInCollection];
    [v10 setObject:v48 forKey:&off_1001AFAA8];
  }
  v49 = [v11 releaseYear];

  if (v49)
  {
    __int16 v50 = [v11 releaseYear];
    [v10 setObject:v50 forKey:&off_1001AFAC0];
  }
  [v10 setObject:&off_1001AF958 forKey:&off_1001AFAD8];
  id v51 = +[NSNumber numberWithBool:(v12 >> 1) & 1];
  [v10 setObject:v51 forKey:&off_1001AFAF0];

  CFStringRef v52 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isCompilation]);
  [v10 setObject:v52 forKey:&off_1001AFB08];

  v53 = [v11 purchaseDate];
  v54 = [(BLML3TrackImporter *)self _absoluteTimeValueForDateValue:v53];
  [v10 setObject:v54 forKey:&off_1001AFB20];

  [v10 setObject:&off_1001B0298 forKey:&off_1001AFB38];
  unsigned __int8 v55 = [v11 isExplicitContent];
  if (v55)
  {
    uint64_t v56 = 1;
  }
  else
  {
    v53 = [v11 contentRating];
    uint64_t v56 = (uint64_t)[v53 rank];
  }
  v57 = +[NSNumber numberWithInteger:v56];
  [v10 setObject:v57 forKey:&off_1001AFB50];

  if ((v55 & 1) == 0) {
  v58 = [v11 contentRating];
  }
  v59 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v58 rank]);
  [v10 setObject:v59 forKey:&off_1001AFB68];

  [v10 setObject:&__kCFBooleanFalse forKey:&off_1001AFB80];
  v60 = [v11 durationInMilliseconds];

  if (v60)
  {
    v61 = [v11 durationInMilliseconds];
    [v10 setObject:v61 forKey:&off_1001AFB98];
  }
  [v10 setObject:&off_1001AF958 forKey:&off_1001AFBB0];
  [v10 setObject:&off_1001AF958 forKey:&off_1001AFBC8];
  v62 = [v11 shortDescription];

  if (v62)
  {
    v63 = [v11 shortDescription];
    [v10 setObject:v63 forKey:&off_1001AFBE0];
  }
  v64 = [v11 longDescription];

  if (v64)
  {
    v65 = [v11 longDescription];
    [v10 setObject:v65 forKey:&off_1001AFBF8];
  }
  v66 = [v11 longSeasonDescription];

  if (v66)
  {
    v67 = [v11 longSeasonDescription];
    [v10 setObject:v67 forKey:&off_1001AFC10];
  }
  v68 = [v11 copyright];

  if (v68)
  {
    v69 = [v11 copyright];
    [v10 setObject:v69 forKey:&off_1001AFC28];
  }
  [v10 setObject:&off_1001AF958 forKey:&off_1001AFC40];
  v70 = +[NSNumber numberWithUnsignedInt:v12];
  [v10 setObject:v70 forKey:&off_1001AFC58];

  v71 = [v11 workName];

  if (v71)
  {
    v72 = [v11 workName];
    [v10 setObject:v72 forKey:&off_1001AFC70];
  }
  v73 = [v11 movementName];

  if (v73)
  {
    v74 = [v11 movementName];
    [v10 setObject:v74 forKey:&off_1001AFC88];
  }
  v75 = [v11 movementNumber];

  if (v75)
  {
    v76 = [v11 movementNumber];
    [v10 setObject:v76 forKey:&off_1001AFCA0];
  }
  v77 = [v11 movementCount];

  if (v77)
  {
    v78 = [v11 movementCount];
    [v10 setObject:v78 forKey:&off_1001AFCB8];
  }
  [v10 setObject:&off_1001AF958 forKey:&off_1001AFCD0];
  [v10 setObject:&off_1001AF958 forKey:&off_1001AFCE8];
  v79 = +[NSNumber numberWithBool:(v12 & 0xFF00) != 0];
  [v10 setObject:v79 forKey:&off_1001AFD00];

  [v10 setObject:&off_1001B02A8 forKey:&off_1001AFD18];
  [v10 setObject:&off_1001AF958 forKey:&off_1001AFD30];
  v80 = [v11 durationInMilliseconds];

  if (v80)
  {
    v81 = [v11 durationInMilliseconds];
    [v10 setObject:v81 forKey:&off_1001AFD48];
  }
  [v10 setObject:&off_1001AF958 forKey:&off_1001AFD60];
  v82 = [v8 itemDownloadIdentifier];

  if (v82)
  {
    v83 = [v8 itemDownloadIdentifier];
    [v10 setObject:v83 forKey:&off_1001AFD78];
  }
  [v10 setObject:&off_1001AF958 forKey:&off_1001AFD90];
  [v10 setObject:&off_1001AF958 forKey:&off_1001AFDA8];
  [v10 setObject:&__kCFBooleanFalse forKey:&off_1001AFDC0];
  +[NSDate timeIntervalSinceReferenceDate];
  v84 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v10 setObject:v84 forKey:&off_1001AFDD8];

  [v10 setObject:&off_1001AF958 forKey:&off_1001AFDF0];
  [v10 setObject:&off_1001AF958 forKey:&off_1001AFE08];
  v85 = +[NSNumber numberWithBool:ML3ImportDefaultRememberBookmarkTime()];
  [v10 setObject:v85 forKey:&off_1001AFE20];

  [v10 setObject:&off_1001AF958 forKey:&off_1001AFE38];
  [v10 setObject:&__kCFBooleanFalse forKey:&off_1001AFE50];
  if ([v11 itemIdentifier])
  {
    v86 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v11 itemIdentifier]);
    [v10 setObject:v86 forKey:&off_1001AFE68];
  }
  if ([v11 composerIdentifier])
  {
    v87 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v11 composerIdentifier]);
    [v10 setObject:v87 forKey:&off_1001AFE80];
  }
  if ([v11 genreIdentifier])
  {
    v88 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v11 genreIdentifier]);
    [v10 setObject:v88 forKey:&off_1001AFE98];
  }
  if ([v11 collectionIdentifier])
  {
    v89 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v11 collectionIdentifier]);
    [v10 setObject:v89 forKey:&off_1001AFEB0];
  }
  [v10 setObject:&off_1001AF958 forKey:&off_1001AFEC8];
  v90 = [v11 redownloadActionParameters];

  if (v90)
  {
    v91 = [v11 redownloadActionParameters];
    [v10 setObject:v91 forKey:&off_1001AFEE0];
  }
  v92 = [v11 cloudIdentifier];
  v93 = +[NSNumber numberWithUnsignedLongLong:BLGetItemIdentifierFromValue()];
  [v10 setObject:v93 forKey:&off_1001AFEF8];

  [v10 setObject:&off_1001AF958 forKey:&off_1001AFF10];
  if ([v8 protectionType] != (id)2) {
    [v10 setObject:&__kCFBooleanTrue forKey:&off_1001AFF28];
  }
  [v10 setObject:&off_1001AF958 forKey:&off_1001AFF40];
  v94 = objc_msgSend(v11, "bl_purchaserAccountIdentifier");
  v161 = v8;
  v158 = v9;
  if (v94)
  {
    id v95 = v94;
  }
  else
  {
    objc_msgSend(v9, "ams_DSID");
    id v95 = (id)objc_claimAutoreleasedReturnValue();

    if (!v95) {
      goto LABEL_83;
    }
  }
  [v10 setObject:v95 forKey:&off_1001AFF58];
LABEL_83:
  v157 = v95;
  v96 = objc_msgSend(v11, "bl_downloaderAccountIdentifier");
  if (v96)
  {
    id v97 = v96;

LABEL_86:
    v156 = v97;
    [v10 setObject:v97 forKey:&off_1001AFF70];
    goto LABEL_87;
  }
  objc_msgSend(v9, "ams_DSID");
  id v97 = (id)objc_claimAutoreleasedReturnValue();

  if (v97) {
    goto LABEL_86;
  }
  v156 = 0;
LABEL_87:
  objc_opt_class();
  v98 = [v8 additionalEntityProperties];
  v99 = [v98 objectForKeyedSubscript:ML3TrackPropertyStoreFamilyAccountID];
  uint64_t v100 = BUDynamicCast();

  v159 = (void *)v100;
  if (v100) {
    [v10 setObject:v100 forKey:&off_1001AFF88];
  }
  v101 = [v11 purchaseDate];
  v102 = [(BLML3TrackImporter *)self _absoluteTimeValueForDateValue:v101];
  [v10 setObject:v102 forKey:&off_1001AFFA0];

  v103 = [v11 releaseDate];
  v104 = [(BLML3TrackImporter *)self _absoluteTimeValueForDateValue:v103];
  [v10 setObject:v104 forKey:&off_1001AFFB8];

  v105 = [v11 podcastEpisodeGUID];

  if (v105)
  {
    v106 = [v11 podcastEpisodeGUID];
    [v10 setObject:v106 forKey:&off_1001AFFD0];
  }
  v107 = [v11 podcastFeedURL];
  v108 = [(BLML3TrackImporter *)self _stringValueForURLValue:v107];

  if (v108)
  {
    v109 = [v11 podcastFeedURL];
    v110 = [(BLML3TrackImporter *)self _stringValueForURLValue:v109];
    [v10 setObject:v110 forKey:&off_1001AFFE8];
  }
  v111 = [v11 viewStoreItemURL];
  v112 = [(BLML3TrackImporter *)self _stringValueForURLValue:v111];

  if (v112)
  {
    v113 = [v11 viewStoreItemURL];
    v114 = [(BLML3TrackImporter *)self _stringValueForURLValue:v113];
    [v10 setObject:v114 forKey:&off_1001B0000];
  }
  v115 = [v11 valueForMetadataKey:@"xid"];

  if (v115)
  {
    v116 = [v11 valueForMetadataKey:@"xid"];
    [v10 setObject:v116 forKey:&off_1001B0018];
  }
  v117 = [v11 valueForMetadataKey:@"flavor"];

  if (v117)
  {
    v118 = [v11 valueForMetadataKey:@"flavor"];
    [v10 setObject:v118 forKey:&off_1001B0030];
  }
  v119 = [v11 launchExtrasUrl];

  if (v119)
  {
    v120 = [v11 launchExtrasUrl];
    [v10 setObject:v120 forKey:&off_1001B0048];
  }
  v121 = [v11 rentalID];

  if (v121)
  {
    v122 = [v11 rentalID];
    [v10 setObject:v122 forKey:&off_1001B0060];
  }
  v123 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isHighDefinition]);
  [v10 setObject:v123 forKey:&off_1001B0078];

  v124 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v11 isRental]);
  [v10 setObject:v124 forKey:&off_1001B0090];

  if (v8)
  {
    v117 = [v8 chapters];
    BOOL v125 = v117 != 0;
  }
  else
  {
    BOOL v125 = 0;
  }
  v126 = +[NSNumber numberWithBool:v125];
  [v10 setObject:v126 forKey:&off_1001B00A8];

  if (v8) {
  v127 = [v11 seasonNumber];
  }

  if (v127)
  {
    v128 = [v11 seasonNumber];
    [v10 setObject:v128 forKey:&off_1001B00C0];
  }
  v129 = [v11 episodeIdentifier];

  if (v129)
  {
    v130 = [v11 episodeIdentifier];
    [v10 setObject:v130 forKey:&off_1001B00D8];
  }
  v131 = [v11 networkName];

  if (v131)
  {
    v132 = [v11 networkName];
    [v10 setObject:v132 forKey:&off_1001B00F0];
  }
  v133 = [(BLML3TrackImporter *)self _currentTrackMovieInfoFromMetadata:v11];

  if (v133)
  {
    v134 = [(BLML3TrackImporter *)self _currentTrackMovieInfoFromMetadata:v11];
    [v10 setObject:v134 forKey:&off_1001B0108];
  }
  v135 = self;
  v136 = [(BLML3TrackImporter *)self _extendedContentRatingStringForLibraryItem:v8];
  v155 = v136;
  if ([v136 length]) {
    [v10 setObject:v136 forKey:&off_1001B0120];
  }
  v137 = [v11 hlsPlaylistURL];

  if (v137)
  {
    v138 = [v11 hlsPlaylistURL];
    v139 = [v138 absoluteString];
    [v10 setObject:v139 forKey:&off_1001B0138];
  }
  v140 = [v11 valueForMetadataKey:BLDownloadMetadataKeyIsHLS];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v140 BOOLValue]) {
    [v10 setObject:&__kCFBooleanTrue forKey:&off_1001B0150];
  }
  v141 = [v11 valueForMetadataKey:BLDownloadMetadataKeyHasHDR];
  if (objc_opt_respondsToSelector()) {
    unsigned int v142 = [v141 BOOLValue];
  }
  else {
    unsigned int v142 = 0;
  }
  v143 = [v11 valueForMetadataKey:BLDownloadMetadataKeyHasDolbyVision];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((v142 & 1) == 0) {
      goto LABEL_135;
    }
    uint64_t v145 = 1;
LABEL_134:
    v146 = +[NSNumber numberWithInteger:v145];
    [v10 setObject:v146 forKey:&off_1001B0168];

    goto LABEL_135;
  }
  unsigned int v144 = [v143 BOOLValue];
  if (v144) {
    uint64_t v145 = v142 | 2;
  }
  else {
    uint64_t v145 = 1;
  }
  if ((v144 | v142) == 1) {
    goto LABEL_134;
  }
LABEL_135:
  v147 = [v11 valueForMetadataKey:BLDownloadMetadataKeyHas4K];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v147 BOOLValue]) {
    [v10 setObject:&off_1001B0180 forKey:&off_1001B0198];
  }
  v148 = [(BLML3TrackImporter *)self _storeArtworkTokenFromLibraryItem:v161 metadata:v11];
  if (v148) {
    [v10 setObject:v148 forKey:&off_1001B01B0];
  }
  v149 = [v10 objectForKey:&off_1001AF8E0];
  v150 = v149;
  if (v149)
  {
    v151 = -[BLML3TrackImporter _currentTrackChapterDataForTrackPid:libraryItem:usingLibrary:](v135, "_currentTrackChapterDataForTrackPid:libraryItem:usingLibrary:", [v149 longLongValue], v161, v160);
    if (v151) {
      [v10 setObject:v151 forKey:&off_1001B01C8];
    }
  }
  if ([v11 artistIdentifier])
  {
    v152 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v11 artistIdentifier]);
    [v10 setObject:v152 forKey:&off_1001B01E0];
  }
  id v153 = v10;

  return v153;
}

- (id)_absoluteTimeValueForDateValue:(id)a3
{
  id v3 = a3;
  [v3 timeIntervalSinceReferenceDate];
  v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");

  return v4;
}

- (id)_stringValueForURLValue:(id)a3
{
  id v3 = [a3 absoluteString];

  return v3;
}

- (id)_currentTrackMovieInfoFromMetadata:(id)a3
{
  id v3 = [a3 videoDetailsDictionary];
  if (v3)
  {
    v4 = +[NSPropertyListSerialization dataWithPropertyList:v3 format:100 options:0 error:0];
    if (v4) {
      id v5 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4];
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_storeArtworkTokenFromLibraryItem:(id)a3 metadata:(id)a4
{
  id v5 = a4;
  if (![a3 hasItemArtwork])
  {
    id v8 = 0;
    goto LABEL_8;
  }
  id v6 = [v5 collectionIdentifier];
  if (v6)
  {
    uint64_t v7 = +[NSString stringWithFormat:@"store_collection_id=%llu", v6];
LABEL_7:
    id v8 = (void *)v7;
    goto LABEL_8;
  }
  id v9 = [v5 itemIdentifier];
  if (v9)
  {
    uint64_t v7 = +[NSString stringWithFormat:@"store_item_id=%llu", v9];
    goto LABEL_7;
  }
  v11 = +[NSUUID UUID];
  id v8 = [v11 UUIDString];

LABEL_8:

  return v8;
}

- (id)_currentTrackChapterDataForTrackPid:(int64_t)a3 libraryItem:(id)a4 usingLibrary:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (!a3) {
    a3 = (int64_t)[v7 libraryPersistentIdentifier];
  }
  id v9 = [v7 chapters];
  v10 = +[ML3Track flattenedChapterDataWithImportChapters:v9 library:v8 trackPersistentID:a3];

  return v10;
}

- (id)_extendedContentRatingStringForLibraryItem:(id)a3
{
  id v3 = [a3 itemMetadata];
  v4 = [v3 contentRating];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 rank];
    id v7 = [v5 ratingLabel];
    id v8 = +[BLItemContentRating stringForRatingSystem:](BLItemContentRating, "stringForRatingSystem:", [v5 ratingSystem]);
    id v9 = [v5 ratingDescription];
    if ([v8 length] && objc_msgSend(v7, "length"))
    {
      CFStringRef v10 = &stru_1001ABB60;
      if (v9) {
        CFStringRef v10 = v9;
      }
      v11 = +[NSString stringWithFormat:@"%@|%@|%ld|%@", v8, v7, v6, v10];
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end