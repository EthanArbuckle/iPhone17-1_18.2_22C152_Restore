@interface FlexSong
+ (BOOL)_transitionIsPossibleFromSegment:(id)a3 toSegment:(id)a4 forBodyClipPlaylist:(id)a5;
+ (id)loadSongInFolderWithPath:(id)a3;
+ (id)numberToString:(int64_t)a3;
+ (id)outroInfoForClipPlaylist:(id)a3;
+ (int64_t)_durationInSamplesToReserveForOutroSegment:(id)a3 withOptions:(id)a4;
+ (int64_t)_findEarlyFadeStartOffsetInSamplesForOutroSegment:(id)a3 withOptions:(id)a4;
+ (int64_t)_findMaxLengthInSamplesToReserveForOutroSegment:(id)a3 withOptions:(id)a4;
+ (int64_t)_findMinLengthInSamplesForEarlyFadeOutForOutroSegment:(id)a3 withOptions:(id)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration;
- (BOOL)_addBodySegmentsForAssemblyList:(id)a3 forDuration:(int64_t)a4 unusedDuration:(int64_t *)a5 testingContext:(id)a6 timedOut:(BOOL *)a7;
- (BOOL)_addIntroSegmentsToAssemblyList:(id)a3 forDuration:(int64_t)a4 testingContext:(id)a5;
- (BOOL)_addOutroSegmentsToAssemblyList:(id)a3 forDuration:(int64_t)a4 allowTrim:(BOOL)a5 testingContext:(id)a6;
- (BOOL)_addSegment:(id)a3 withDuration:(int64_t)a4 toAssemblyList:(id)a5 indexOfNewSegment:(int64_t *)a6;
- (BOOL)_addSegment:(id)a3 withDuration:(int64_t)a4 toAssemblyList:(id)a5 timeRemaining:(int64_t)a6 reusedSegment:(id *)a7 indexofNewSegment:(int64_t *)a8;
- (BOOL)_buildIntroAndOutroOnlySegmentAssemblyList:(id)a3 forDuration:(int64_t)a4 testingContext:(id)a5;
- (BOOL)_buildSegmentAssemblyList:(id)a3 forDuration:(int64_t)a4 withOptions:(id)a5 testingContext:(id)a6;
- (BOOL)_rebuildBodySegmentsInAssemblyList:(id)a3 forDuration:(int64_t)a4 unusedDuration:(int64_t *)a5 testingContext:(id)a6;
- (BOOL)_removeUnpermittedTransitionsInAssemblyList:(id)a3 final:(BOOL)a4 testingContext:(id)a5 removedIndexes:(id)a6;
- (BOOL)_removeUnpermittedTransitionsInAssemblyList:(id)a3 final:(BOOL)a4 testingContext:(id)a5 removedIndexes:(id)a6 conflictList:(id)a7;
- (BOOL)_updateTransitionBodySegmentsForAssemblyList:(id)a3 usingNewSegment:(id)a4 indexOfNewTransitionSegment:(id)a5;
- (BOOL)_validateAuthoringIssuesInRendition:(id)a3 failureReason:(id *)a4;
- (BOOL)_validateStructureForRendition:(id)a3 failureReason:(id *)a4;
- (BOOL)_validateTransitionsInRendition:(id)a3 failureReason:(id *)a4;
- (BOOL)_verifyAssetsForSegment:(id)a3 withFailureReason:(id *)a4;
- (BOOL)canPlay;
- (BOOL)isLoaded;
- (BOOL)verifyAssetsWithFailureReason:(id *)a3;
- (BOOL)verifyRendition:(id)a3 forDuration:(id *)a4 failureReason:(id *)a5;
- (FlexSong)initWithDictionary:(id)a3 assets:(id)a4;
- (FlexSong)initWithUID:(id)a3 songName:(id)a4 artistName:(id)a5 tagIDs:(id)a6 keywords:(id)a7 weightedKeywords:(id)a8 hidden:(BOOL)a9 sampleRate:(int64_t)a10 mainSegments:(id)a11 crossFadeSegments:(id)a12 assets:(id)a13 audioFileExtension:(id)a14 audioEncoderPresetName:(id)a15 metadataVersion:(int64_t)a16 customOptions:(id)a17;
- (FlexSongAssetProviderProtocol)assetProvider;
- (NSArray)bodySegments;
- (NSArray)crossFadeSegments;
- (NSArray)introSegments;
- (NSArray)outroSegments;
- (NSArray)transSegments;
- (NSString)audioFileExtension;
- (id)_cacheObjectForKey:(id)a3;
- (id)_clipPlaylistForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5;
- (id)_decodedMainSegmentsFromCache;
- (id)_fullSongLoopedClipPlaylistForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5;
- (id)_longestSegmentForType:(unint64_t)a3;
- (id)_longestSegmentsForType:(unint64_t)a3;
- (id)_mainSegmentsFromCache;
- (id)_metadataDictFromCache;
- (id)_naturalDurationAssemblyList;
- (id)_segmentsForIndex:(unint64_t)a3 andType:(unint64_t)a4;
- (id)_segmentsforType:(unint64_t)a3;
- (id)_shortestSegmentForType:(unint64_t)a3;
- (id)_shortestSegmentsForType:(unint64_t)a3;
- (id)_sortFlexSegmentsShortestToLongest:(id)a3;
- (id)_transitionSegmentForSegmentInfo:(id)a3 fromBarIndex:(int64_t)a4 inSegmentList:(id)a5;
- (id)_transitionSegmentForSegmentInfo:(id)a3 toSegmentInfo:(id)a4 fromBarIndex:(int64_t)a5 inSegmentList:(id)a6;
- (id)analysisData;
- (id)description;
- (id)encodeAsDictionary;
- (id)idealDurations;
- (id)initCommonWithUID:(id)a3 songName:(id)a4 artistName:(id)a5 tagIDs:(id)a6 keywords:(id)a7 weightedKeywords:(id)a8 hidden:(BOOL)a9 sampleRate:(int64_t)a10 mainSegments:(id)a11 crossFadeSegments:(id)a12 audioFileExtension:(id)a13 audioEncoderPresetName:(id)a14 metadataVersion:(int64_t)a15 customOptions:(id)a16;
- (id)renditionForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5;
- (id)timedMetadataItemsWithIdentifier:(id)a3 forRendition:(id)a4;
- (int64_t)_actualOutroDurationForAssemblyList:(id)a3 currentDuration:(int64_t)a4;
- (int64_t)_maxIntroDuration;
- (int64_t)_maxOutroDuration;
- (int64_t)_minBodySegmentDuration;
- (int64_t)_minIntroDuration;
- (int64_t)_minOutroDuration;
- (int64_t)_minimumPermittedIntroAndOutroDuration;
- (int64_t)_sampleDurationOfClipPlaylist:(id)a3;
- (int64_t)_samplesForDuration:(id *)a3;
- (unint64_t)_highestIndexForSegmentType:(unint64_t)a3;
- (void)_destroyCache;
- (void)_loadAnalysisData;
- (void)_populateCache;
- (void)_removeSegmentInfo:(id)a3 fromAssemblyList:(id)a4;
- (void)_sequenceBodySegmentList:(id)a3 forIndexes:(id)a4;
- (void)_setupInitialAssets:(id)a3;
@end

@implementation FlexSong

- (id)initCommonWithUID:(id)a3 songName:(id)a4 artistName:(id)a5 tagIDs:(id)a6 keywords:(id)a7 weightedKeywords:(id)a8 hidden:(BOOL)a9 sampleRate:(int64_t)a10 mainSegments:(id)a11 crossFadeSegments:(id)a12 audioFileExtension:(id)a13 audioEncoderPresetName:(id)a14 metadataVersion:(int64_t)a15 customOptions:(id)a16
{
  id v45 = a3;
  id v44 = a4;
  id v47 = a5;
  id v21 = a6;
  id v22 = a7;
  id v23 = a8;
  id v43 = a11;
  id v42 = a12;
  v24 = v21;
  id v41 = a13;
  id v46 = a14;
  id v29 = a16;
  v30 = v21;
  if (!v21)
  {
    v30 = objc_msgSend_set(MEMORY[0x263EFFA08], v25, v26, v27, v28);
  }
  v31 = v22;
  if (!v22)
  {
    v31 = objc_msgSend_set(MEMORY[0x263EFFA08], v25, v26, v27, v28);
  }
  v32 = v23;
  if (!v23)
  {
    v32 = objc_msgSend_dictionary(NSDictionary, v25, v26, v27, v28);
  }
  v48.receiver = self;
  v48.super_class = (Class)FlexSong;
  v33 = -[FlexSongBackend initWithUID:songName:artistName:tagIDs:keywords:weightedKeywords:hidden:recalled:audioEncoderPresetName:metadataVersion:songFormat:sampleRate:customOptions:](&v48, sel_initWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_recalled_audioEncoderPresetName_metadataVersion_songFormat_sampleRate_customOptions_, v45, v44, v47, v30, v31, v32, a9, v46, a15, @"LG", a10, v29);
  if (v23)
  {
    if (v22) {
      goto LABEL_9;
    }
LABEL_15:

    if (v24) {
      goto LABEL_10;
    }
LABEL_16:

    goto LABEL_10;
  }

  if (!v22) {
    goto LABEL_15;
  }
LABEL_9:
  if (!v24) {
    goto LABEL_16;
  }
LABEL_10:
  if (v33)
  {
    objc_storeStrong((id *)v33 + 19, a13);
    uint64_t v38 = MEMORY[0x263F01090];
    *(_OWORD *)(v33 + 120) = *MEMORY[0x263F01090];
    *((void *)v33 + 17) = *(void *)(v38 + 16);
    if (v43) {
      objc_msgSend__cacheSegmentsByType(v33, v34, v35, v36, v37);
    }
  }

  return v33;
}

- (FlexSong)initWithUID:(id)a3 songName:(id)a4 artistName:(id)a5 tagIDs:(id)a6 keywords:(id)a7 weightedKeywords:(id)a8 hidden:(BOOL)a9 sampleRate:(int64_t)a10 mainSegments:(id)a11 crossFadeSegments:(id)a12 assets:(id)a13 audioFileExtension:(id)a14 audioEncoderPresetName:(id)a15 metadataVersion:(int64_t)a16 customOptions:(id)a17
{
  id v22 = a13;
  inited = (FlexSong *)objc_msgSend_initCommonWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_sampleRate_mainSegments_crossFadeSegments_audioFileExtension_audioEncoderPresetName_metadataVersion_customOptions_(self, v23, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a9, a10, a11, a12, a14, a15, a16, a17);
  uint64_t v28 = inited;
  if (inited) {
    objc_msgSend__setupInitialAssets_(inited, v25, (uint64_t)v22, v26, v27);
  }

  return v28;
}

- (FlexSong)initWithDictionary:(id)a3 assets:(id)a4
{
  id v5 = a3;
  id v62 = a4;
  v65 = objc_msgSend_objectForKey_(v5, v6, @"uuid", v7, v8);
  v64 = objc_msgSend_objectForKey_(v5, v9, @"songName", v10, v11);
  v63 = objc_msgSend_objectForKey_(v5, v12, @"artistName", v13, v14);
  v18 = objc_msgSend_objectForKey_(v5, v15, @"sampleRate", v16, v17);
  uint64_t v23 = (int)objc_msgSend_intValue(v18, v19, v20, v21, v22);

  uint64_t v27 = objc_msgSend_objectForKey_(v5, v24, @"tagIDs", v25, v26);
  v32 = objc_msgSend_firstObject(v27, v28, v29, v30, v31);

  if (v32)
  {
    uint64_t v36 = objc_msgSend_setWithArray_(MEMORY[0x263EFFA08], v33, (uint64_t)v27, v34, v35);
  }
  else
  {
    uint64_t v36 = 0;
  }
  uint64_t v37 = objc_msgSend_objectForKey_(v5, v33, @"audioEncoderPresetName", v34, v35);
  id v41 = objc_msgSend_objectForKey_(v5, v38, @"audioFileExtension", v39, v40);
  id v45 = objc_msgSend_objectForKey_(v5, v42, @"customOptions", v43, v44);
  v49 = objc_msgSend_objectForKey_(v5, v46, @"crossFadeSegments", v47, v48);
  uint64_t v50 = objc_opt_class();
  v53 = objc_msgSend_decodeItemsInArray_asClass_(FlexUtilities, v51, (uint64_t)v49, v50, v52);
  inited = (FlexSong *)objc_msgSend_initCommonWithUID_songName_artistName_tagIDs_keywords_weightedKeywords_hidden_sampleRate_mainSegments_crossFadeSegments_audioFileExtension_audioEncoderPresetName_metadataVersion_customOptions_(self, v54, (uint64_t)v65, (uint64_t)v64, (uint64_t)v63, v36, 0, 0, 0, v23, 0, v53, v41, v37, 0, v45);
  v59 = inited;
  if (inited) {
    objc_msgSend__setupInitialAssets_(inited, v56, (uint64_t)v62, v57, v58);
  }

  return v59;
}

- (void)_setupInitialAssets:(id)a3
{
  objc_msgSend_updateAssets_(self, a2, (uint64_t)a3, v3, v4);
  v9 = objc_msgSend_existingAssetWithID_(self, v6, @"FMSongBundleAssetID", v7, v8);
  id v31 = v9;
  if (v9)
  {
    v18 = objc_msgSend_localURL(v9, v10, v11, v12, v13);
    if (v18)
    {
      uint64_t v19 = objc_msgSend_audioFileExtension(self, v14, v15, v16, v17);
      if (v19) {
        uint64_t v20 = (__CFString *)v19;
      }
      else {
        uint64_t v20 = @"m4a";
      }
      uint64_t v21 = [FlexSongAssetProvider_V2 alloc];
      uint64_t v26 = objc_msgSend_path(v18, v22, v23, v24, v25);
      uint64_t v29 = (FlexSongAssetProviderProtocol *)objc_msgSend_initWithFolderPath_audioFileExtension_(v21, v27, (uint64_t)v26, (uint64_t)v20, v28);
    }
    else
    {
      uint64_t v29 = 0;
    }
  }
  else
  {
    uint64_t v29 = 0;
  }
  assetProvider = self->_assetProvider;
  self->_assetProvider = v29;
}

- (void)_loadAnalysisData
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  v76 = (NSDictionary *)objc_opt_new();
  v78 = self;
  v79 = objc_msgSend_existingAssetWithID_(self, v3, @"FMSongBundleAssetID", v4, v5);
  v77 = objc_msgSend_localURL(v79, v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_path(v77, v10, v11, v12, v13);
  v18 = objc_msgSend_stringByAppendingPathComponent_(v14, v15, @"ANALYSIS", v16, v17);

  v75 = v18;
  uint64_t v22 = objc_msgSend_stringByAppendingPathComponent_(v18, v19, @"ONSET", v20, v21);
  uint64_t v27 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v23, v24, v25, v26);
  uint64_t v30 = objc_msgSend_contentsOfDirectoryAtPath_error_(v27, v28, (uint64_t)v22, 0, v29);

  v80 = objc_opt_new();
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = v30;
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v85, (uint64_t)v89, 16);
  if (v32)
  {
    uint64_t v36 = v32;
    uint64_t v37 = *(void *)v86;
    uint64_t v81 = *(void *)v86;
    do
    {
      uint64_t v38 = 0;
      uint64_t v82 = v36;
      do
      {
        if (*(void *)v86 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v39 = *(void **)(*((void *)&v85 + 1) + 8 * v38);
        uint64_t v40 = objc_msgSend_stringByAppendingPathComponent_(v22, v33, (uint64_t)v39, v34, v35);
        id v84 = 0;
        id v42 = objc_msgSend_stringWithContentsOfFile_encoding_error_(NSString, v41, (uint64_t)v40, 4, (uint64_t)&v84);
        id v46 = v84;
        if (!v46)
        {
          uint64_t v47 = v22;
          uint64_t v48 = objc_msgSend_componentsSeparatedByString_(v42, v43, @"\n", v44, v45);
          v53 = objc_msgSend_mutableCopy(v48, v49, v50, v51, v52);

          uint64_t v57 = objc_msgSend_indexesOfObjectsPassingTest_(v53, v54, (uint64_t)&unk_26C7FE828, v55, v56);
          objc_msgSend_removeObjectsAtIndexes_(v53, v58, (uint64_t)v57, v59, v60);
          v65 = objc_msgSend_stringByDeletingPathExtension(v39, v61, v62, v63, v64);
          v68 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v65, v66, @"_onset", (uint64_t)&stru_26C7FED08, v67);

          if (v53) {
            BOOL v71 = v68 == 0;
          }
          else {
            BOOL v71 = 1;
          }
          if (!v71) {
            objc_msgSend_setObject_forKey_(v80, v69, (uint64_t)v53, (uint64_t)v68, v70);
          }

          uint64_t v22 = v47;
          uint64_t v37 = v81;
          uint64_t v36 = v82;
        }

        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v85, (uint64_t)v89, 16);
    }
    while (v36);
  }

  objc_msgSend_setObject_forKey_(v76, v72, (uint64_t)v80, @"onsets", v73);
  analysisData = v78->_analysisData;
  v78->_analysisData = v76;
}

- (id)analysisData
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_analysisData) {
    objc_msgSend__loadAnalysisData(v2, v3, v4, v5, v6);
  }
  objc_sync_exit(v2);

  analysisData = v2->_analysisData;
  return analysisData;
}

- (BOOL)canPlay
{
  return 1;
}

- (BOOL)isLoaded
{
  return 1;
}

- (id)encodeAsDictionary
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], a2, v2, v3, v4);
  uint64_t v11 = objc_msgSend_uid(self, v7, v8, v9, v10);
  objc_msgSend_setValue_forKey_(v6, v12, (uint64_t)v11, @"uuid", v13);

  v18 = objc_msgSend_songName(self, v14, v15, v16, v17);
  objc_msgSend_setValue_forKey_(v6, v19, (uint64_t)v18, @"songName", v20);

  uint64_t v25 = objc_msgSend_artistName(self, v21, v22, v23, v24);
  objc_msgSend_setValue_forKey_(v6, v26, (uint64_t)v25, @"artistName", v27);

  uint64_t v28 = NSNumber;
  uint64_t v33 = objc_msgSend_sampleRate(self, v29, v30, v31, v32);
  uint64_t v37 = objc_msgSend_numberWithInteger_(v28, v34, v33, v35, v36);
  objc_msgSend_setValue_forKey_(v6, v38, (uint64_t)v37, @"sampleRate", v39);

  uint64_t v44 = objc_msgSend__decodedMainSegmentsFromCache(self, v40, v41, v42, v43);
  uint64_t v48 = objc_msgSend_encodeItemsInArray_(FlexUtilities, v45, (uint64_t)v44, v46, v47);
  objc_msgSend__destroyCache(self, v49, v50, v51, v52);
  if (v48) {
    objc_msgSend_setValue_forKey_(v6, v53, (uint64_t)v48, @"mainSegments", v56);
  }
  uint64_t v57 = objc_msgSend_tagIDs(self, v53, v54, v55, v56);
  uint64_t v62 = objc_msgSend_anyObject(v57, v58, v59, v60, v61);

  if (v62)
  {
    uint64_t v67 = objc_msgSend_tagIDs(self, v63, v64, v65, v66);
    v72 = objc_msgSend_allObjects(v67, v68, v69, v70, v71);
    objc_msgSend_setValue_forKey_(v6, v73, (uint64_t)v72, @"tagIDs", v74);
  }
  v75 = objc_msgSend_assetProvider(self, v63, v64, v65, v66);
  v80 = objc_msgSend_audioFileExtension(v75, v76, v77, v78, v79);

  if (v80) {
    objc_msgSend_setValue_forKey_(v6, v81, (uint64_t)v80, @"audioFileExtension", v84);
  }
  long long v88 = objc_msgSend_audioEncoderPresetName(self, v81, v82, v83, v84);
  if (v88) {
    objc_msgSend_setValue_forKey_(v6, v85, (uint64_t)v88, @"audioEncoderPresetName", v87);
  }
  v89 = objc_msgSend_existingAssetWithID_(self, v85, @"FMSongBundleAssetID", v86, v87);
  v94 = v89;
  if (v89)
  {
    v95 = NSNumber;
    uint64_t v96 = objc_msgSend_contentVersion(v89, v90, v91, v92, v93);
    v100 = objc_msgSend_numberWithInteger_(v95, v97, v96, v98, v99);
    objc_msgSend_setValue_forKey_(v6, v101, (uint64_t)v100, @"contentVersion", v102);

    v103 = NSNumber;
    uint64_t v108 = objc_msgSend_compatibilityVersion(v94, v104, v105, v106, v107);
    v112 = objc_msgSend_numberWithInteger_(v103, v109, v108, v110, v111);
    objc_msgSend_setValue_forKey_(v6, v113, (uint64_t)v112, @"compatibilityVersion", v114);
  }
  v117 = objc_msgSend_customOptions(self, v90, v91, v92, v93);
  if (v117) {
    objc_msgSend_setValue_forKey_(v6, v115, (uint64_t)v117, @"customOptions", v116);
  }

  return v6;
}

- (id)description
{
  uint64_t v6 = NSString;
  uint64_t v7 = objc_msgSend_songName(self, a2, v2, v3, v4);
  uint64_t v12 = objc_msgSend_artistName(self, v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_stringWithFormat_(v6, v13, @"%@ by %@", v14, v15, v7, v12);

  return v16;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration
{
  int64_t v8 = 6 * objc_msgSend_sampleRate(self, a3, v3, v4, v5);
  int32_t v13 = objc_msgSend_sampleRate(self, v9, v10, v11, v12);
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, v8, v13);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration
{
  uint64_t v4 = self;
  objc_sync_enter(v4);
  p_cachedNaturalDuration = &v4->_cachedNaturalDuration;
  if ((v4->_cachedNaturalDuration.flags & 1) == 0)
  {
    uint64_t v10 = objc_msgSend__naturalDurationAssemblyList(v4, v5, v6, v7, v8);
    uint64_t v14 = objc_msgSend__sampleDurationOfClipPlaylist_(v4, v11, (uint64_t)v10, v12, v13);

    int32_t v19 = objc_msgSend_sampleRate(v4, v15, v16, v17, v18);
    CMTimeMake(&v22, 9600 * vcvtpd_s64_f64((double)v14 / 9600.0), v19);
    long long v20 = *(_OWORD *)&v22.value;
    v4->_cachedNaturalDuration.epoch = v22.epoch;
    *(_OWORD *)&p_cachedNaturalDuration->value = v20;
  }
  objc_sync_exit(v4);

  *(_OWORD *)&retstr->var0 = *(_OWORD *)&p_cachedNaturalDuration->value;
  retstr->var3 = v4->_cachedNaturalDuration.epoch;
  return result;
}

- (id)idealDurations
{
  return (id)MEMORY[0x263EFFA68];
}

- (void)_populateCache
{
  uint64_t v3 = (void *)MEMORY[0x21D453880](self, a2);
  uint64_t v7 = objc_msgSend_existingAssetWithID_(self, v4, @"FMSongBundleAssetID", v5, v6);
  uint64_t v12 = objc_msgSend_localURL(v7, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_path(v12, v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_stringByAppendingPathComponent_(v17, v18, @"metadata.smm", v19, v20);

  uint64_t v25 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x263EFF8F8], v22, (uint64_t)v21, v23, v24);
  id v43 = 0;
  uint64_t v27 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x263F08900], v26, (uint64_t)v25, 0, (uint64_t)&v43);
  id v31 = v43;
  if (!v31)
  {
    uint64_t v32 = objc_msgSend_objectForKey_(v27, v28, @"mainSegments", v29, v30);
    uint64_t v33 = objc_opt_class();
    uint64_t v36 = objc_msgSend_decodeItemsInArray_asClass_(FlexUtilities, v34, (uint64_t)v32, v33, v35);
    objc_msgSend_setObject_forKey_(self->_segmentCache, v37, (uint64_t)v27, @"metadataDict", v38);
    objc_msgSend_setObject_forKey_(self->_segmentCache, v39, (uint64_t)v36, @"decodedMainSegments", v40);
    objc_msgSend_setObject_forKey_(self->_segmentCache, v41, (uint64_t)v32, @"mainSegments", v42);
  }
}

- (id)_cacheObjectForKey:(id)a3
{
  id v7 = a3;
  segmentCache = self->_segmentCache;
  if (!segmentCache)
  {
    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    uint64_t v10 = self->_segmentCache;
    self->_segmentCache = v9;

    objc_msgSend__populateCache(self, v11, v12, v13, v14);
    segmentCache = self->_segmentCache;
  }
  uint64_t v19 = objc_msgSend_objectForKey_(segmentCache, v4, (uint64_t)v7, v5, v6);
  if (!v19)
  {
    objc_msgSend__populateCache(self, v15, v16, v17, v18);
    uint64_t v19 = objc_msgSend_objectForKey_(self->_segmentCache, v20, (uint64_t)v7, v21, v22);
  }

  return v19;
}

- (id)_metadataDictFromCache
{
  return (id)((uint64_t (*)(FlexSong *, char *, __CFString *))MEMORY[0x270F9A6D0])(self, sel__cacheObjectForKey_, @"metadataDict");
}

- (id)_decodedMainSegmentsFromCache
{
  return (id)((uint64_t (*)(FlexSong *, char *, __CFString *))MEMORY[0x270F9A6D0])(self, sel__cacheObjectForKey_, @"decodedMainSegments");
}

- (id)_mainSegmentsFromCache
{
  return (id)((uint64_t (*)(FlexSong *, char *, __CFString *))MEMORY[0x270F9A6D0])(self, sel__cacheObjectForKey_, @"mainSegments");
}

- (void)_destroyCache
{
  objc_msgSend_removeAllObjects(self->_segmentCache, a2, v2, v3, v4);
  segmentCache = self->_segmentCache;
  self->_segmentCache = 0;
}

- (id)_segmentsforType:(unint64_t)a3
{
  uint64_t v11 = objc_msgSend__metadataDictFromCache(self, a2, a3, v3, v4);
  if (!v11)
  {
    uint64_t v12 = FlexLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217A2F000, v12, OS_LOG_TYPE_DEFAULT, "flex: missing metadataDict!", buf, 2u);
    }
  }
  uint64_t v15 = objc_msgSend__decodedMainSegmentsFromCache(self, v7, v8, v9, v10);
  if (!v15)
  {
    uint64_t v16 = FlexLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_217A2F000, v16, OS_LOG_TYPE_DEFAULT, "flex: missing decodedMainSegments!", v19, 2u);
    }
  }
  if (a3 - 1 > 3)
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = objc_msgSend_segmentsWithType_inSegments_(FlexSegment, v13, a3, (uint64_t)v15, v14);
  }

  return v17;
}

- (id)_segmentsForIndex:(unint64_t)a3 andType:(unint64_t)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend__segmentsforType_(self, a2, a4, a4, v4);
  uint64_t v11 = objc_msgSend_array(MEMORY[0x263EFF980], v7, v8, v9, v10);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v6;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v14)
  {
    uint64_t v19 = v14;
    uint64_t v20 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(v12);
        }
        uint64_t v22 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v23 = objc_msgSend_nameIndex(v22, v15, v16, v17, v18, (void)v30);
        uint64_t v28 = objc_msgSend_integerValue(v23, v24, v25, v26, v27);

        if (v28 == a3) {
          objc_msgSend_addObject_(v11, v15, (uint64_t)v22, v17, v18);
        }
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v19);
  }

  return v11;
}

- (id)_shortestSegmentsForType:(unint64_t)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v7 = objc_msgSend_array(MEMORY[0x263EFF980], a2, a3, v3, v4);
  unint64_t v13 = objc_msgSend__highestIndexForSegmentType_(self, v8, a3, v9, v10);
  unint64_t v14 = 0;
  do
  {
    uint64_t v15 = objc_msgSend__segmentsForIndex_andType_(self, v11, v14, a3, v12);
    uint64_t v19 = objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v16, (uint64_t)v15, v17, v18);

    if (objc_msgSend_count(v19, v20, v21, v22, v23))
    {
      uint64_t v28 = objc_msgSend_firstObject(v19, v24, v25, v26, v27);
      objc_msgSend_addObject_(v7, v29, (uint64_t)v28, v30, v31);
    }
    ++v14;
  }
  while (v14 <= v13);
  if (a3 == 2)
  {
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v33 = objc_msgSend__segmentsforType_(self, v11, 2, v32, v12, 0);
    uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v45, (uint64_t)v49, 16);
    if (v35)
    {
      uint64_t v40 = v35;
      uint64_t v41 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v40; ++i)
        {
          if (*(void *)v46 != v41) {
            objc_enumerationMutation(v33);
          }
          id v43 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          if (objc_msgSend_sliceable(v43, v36, v37, v38, v39)) {
            objc_msgSend_addObject_(v7, v36, (uint64_t)v43, v38, v39);
          }
        }
        uint64_t v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v45, (uint64_t)v49, 16);
      }
      while (v40);
    }
  }
  return v7;
}

- (id)_shortestSegmentForType:(unint64_t)a3
{
  uint64_t v6 = objc_msgSend__shortestSegmentsForType_(self, a2, a3, v3, v4);
  uint64_t v10 = objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v7, (uint64_t)v6, v8, v9);

  uint64_t v15 = objc_msgSend_firstObject(v10, v11, v12, v13, v14);

  return v15;
}

- (id)_longestSegmentsForType:(unint64_t)a3
{
  id v7 = objc_msgSend_array(MEMORY[0x263EFF980], a2, a3, v3, v4);
  unint64_t v13 = objc_msgSend__highestIndexForSegmentType_(self, v8, a3, v9, v10);
  unint64_t v14 = 0;
  do
  {
    uint64_t v15 = objc_msgSend__segmentsForIndex_andType_(self, v11, v14, a3, v12);
    uint64_t v19 = objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v16, (uint64_t)v15, v17, v18);

    if (objc_msgSend_count(v19, v20, v21, v22, v23))
    {
      uint64_t v28 = objc_msgSend_lastObject(v19, v24, v25, v26, v27);
      objc_msgSend_addObject_(v7, v29, (uint64_t)v28, v30, v31);
    }
    ++v14;
  }
  while (v14 <= v13);
  return v7;
}

- (id)_longestSegmentForType:(unint64_t)a3
{
  uint64_t v6 = objc_msgSend__segmentsforType_(self, a2, a3, v3, v4);
  uint64_t v10 = objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v7, (uint64_t)v6, v8, v9);

  uint64_t v15 = objc_msgSend_lastObject(v10, v11, v12, v13, v14);

  return v15;
}

- (unint64_t)_highestIndexForSegmentType:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend__segmentsforType_(self, a2, a3, v3, v4);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v7)
  {
    uint64_t v12 = v7;
    unint64_t v13 = 0;
    uint64_t v14 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v14) {
          objc_enumerationMutation(v5);
        }
        uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_nameIndex(v16, v8, v9, v10, v11);
        if (objc_msgSend_integerValue(v17, v18, v19, v20, v21) > v13)
        {
          uint64_t v26 = objc_msgSend_nameIndex(v16, v22, v23, v24, v25);
          unint64_t v13 = objc_msgSend_integerValue(v26, v27, v28, v29, v30);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v32, (uint64_t)v36, 16);
    }
    while (v12);
  }
  else
  {
    unint64_t v13 = 0;
  }

  return v13;
}

- (id)_sortFlexSegmentsShortestToLongest:(id)a3
{
  return (id)objc_msgSend_sortedArrayUsingComparator_(a3, a2, (uint64_t)&unk_26C7FE868, v3, v4);
}

- (id)_transitionSegmentForSegmentInfo:(id)a3 fromBarIndex:(int64_t)a4 inSegmentList:(id)a5
{
  return (id)objc_msgSend__transitionSegmentForSegmentInfo_toSegmentInfo_fromBarIndex_inSegmentList_(self, a2, (uint64_t)a3, 0, a4, a5);
}

- (id)_transitionSegmentForSegmentInfo:(id)a3 toSegmentInfo:(id)a4 fromBarIndex:(int64_t)a5 inSegmentList:(id)a6
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  unint64_t v16 = objc_msgSend_indexOfObject_(v12, v13, (uint64_t)v10, v14, v15);
  if (v16 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t v21 = v16, v16 >= objc_msgSend_count(v12, v17, v18, v19, v20) - 1))
  {
    uint64_t v30 = 0;
  }
  else
  {
    id v80 = v11;
    if (v11)
    {
      id v25 = v11;
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(v12, v22, v21 + 1, v23, v24);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v31 = v25;
    long long v32 = objc_msgSend_segment(v10, v26, v27, v28, v29);
    uint64_t v79 = v31;
    uint64_t v37 = objc_msgSend_segment(v31, v33, v34, v35, v36);
    uint64_t v42 = objc_msgSend_name(v37, v38, v39, v40, v41);
    long long v45 = objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v32, v43, (uint64_t)v42, a5, v44);

    uint64_t v50 = objc_msgSend_transitionSegmentName(v45, v46, v47, v48, v49);

    if (v50)
    {
      id v77 = v12;
      id v78 = v10;
      uint64_t v54 = objc_msgSend__segmentsforType_(self, v51, 3, v52, v53);
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      uint64_t v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v55, (uint64_t)&v81, (uint64_t)v85, 16);
      if (v56)
      {
        uint64_t v61 = v56;
        uint64_t v30 = 0;
        uint64_t v62 = *(void *)v82;
        do
        {
          for (uint64_t i = 0; i != v61; ++i)
          {
            if (*(void *)v82 != v62) {
              objc_enumerationMutation(v54);
            }
            uint64_t v64 = *(void **)(*((void *)&v81 + 1) + 8 * i);
            uint64_t v65 = objc_msgSend_name(v64, v57, v58, v59, v60);
            uint64_t v70 = objc_msgSend_transitionSegmentName(v45, v66, v67, v68, v69);
            int isEqualToString = objc_msgSend_isEqualToString_(v65, v71, (uint64_t)v70, v72, v73);

            if (isEqualToString)
            {
              id v75 = v64;

              uint64_t v30 = v75;
            }
          }
          uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v54, v57, (uint64_t)&v81, (uint64_t)v85, 16);
        }
        while (v61);
      }
      else
      {
        uint64_t v30 = 0;
      }

      id v12 = v77;
      id v10 = v78;
    }
    else
    {
      uint64_t v30 = 0;
    }

    id v11 = v80;
  }

  return v30;
}

- (int64_t)_sampleDurationOfClipPlaylist:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v5)
  {
    uint64_t v10 = v5;
    int64_t v11 = 0;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v3);
        }
        v11 += objc_msgSend_duration(*(void **)(*((void *)&v15 + 1) + 8 * i), v6, v7, v8, v9);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v15, (uint64_t)v19, 16);
    }
    while (v10);
  }
  else
  {
    int64_t v11 = 0;
  }

  return v11;
}

- (int64_t)_minBodySegmentDuration
{
  uint64_t v4 = objc_msgSend__shortestSegmentForType_(self, a2, 2, v2, v3);
  int64_t v9 = objc_msgSend_sampleCount(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)_maxIntroDuration
{
  uint64_t v4 = objc_msgSend__longestSegmentForType_(self, a2, 1, v2, v3);
  int64_t v9 = objc_msgSend_sampleCount(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)_minIntroDuration
{
  uint64_t v4 = objc_msgSend__shortestSegmentForType_(self, a2, 1, v2, v3);
  int64_t v9 = objc_msgSend_sampleCount(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)_maxOutroDuration
{
  uint64_t v4 = objc_msgSend__longestSegmentForType_(self, a2, 4, v2, v3);
  int64_t v9 = objc_msgSend_sampleCount(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)_minOutroDuration
{
  uint64_t v4 = objc_msgSend__shortestSegmentForType_(self, a2, 4, v2, v3);
  int64_t v9 = objc_msgSend_sampleCount(v4, v5, v6, v7, v8);

  return v9;
}

- (int64_t)_actualOutroDurationForAssemblyList:(id)a3 currentDuration:(int64_t)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (objc_msgSend_indexOfObjectPassingTest_(v6, v7, (uint64_t)&unk_26C7FE888, v8, v9) == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v13 = FlexLogForCategory(1uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_217A5895C(v13);
    }
    int64_t v14 = 0;
  }
  else
  {
    long long v15 = objc_msgSend__segmentsforType_(self, v10, 4, v11, v12);
    if (objc_msgSend_count(v15, v16, v17, v18, v19) == 1)
    {
      unint64_t v13 = objc_msgSend_lastObject(v15, v20, v21, v22, v23);
      uint64_t v28 = objc_msgSend_sampleCount(v13, v24, v25, v26, v27);
    }
    else
    {
      v67[0] = 0;
      v67[1] = v67;
      v67[2] = 0x3032000000;
      v67[3] = sub_217A4E590;
      v67[4] = sub_217A4E5A0;
      objc_msgSend_lastObject(v6, v20, v21, v22, v23);
      id v68 = (id)objc_claimAutoreleasedReturnValue();
      v66[0] = MEMORY[0x263EF8330];
      v66[1] = 3221225472;
      v66[2] = sub_217A4E5A8;
      v66[3] = &unk_2642B77E8;
      v66[4] = v67;
      uint64_t v32 = objc_msgSend_indexesOfObjectsPassingTest_(v15, v29, (uint64_t)v66, v30, v31);
      uint64_t v36 = objc_msgSend_objectsAtIndexes_(v15, v33, v32, v34, v35);
      uint64_t v61 = (void *)v32;
      if (objc_msgSend_count(v36, v37, v38, v39, v40) == 1)
      {
        unint64_t v13 = objc_msgSend_firstObject(v36, v41, v42, v43, v44);
      }
      else
      {
        objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v41, (uint64_t)v36, v43, v44);
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v45 = (id)objc_claimAutoreleasedReturnValue();
        unint64_t v13 = 0;
        uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v62, (uint64_t)v69, 16);
        if (v51)
        {
          uint64_t v52 = *(void *)v63;
          while (2)
          {
            uint64_t v53 = 0;
            uint64_t v54 = v13;
            do
            {
              if (*(void *)v63 != v52) {
                objc_enumerationMutation(v45);
              }
              uint64_t v55 = *(void **)(*((void *)&v62 + 1) + 8 * v53);
              if (objc_msgSend_sampleCount(v55, v47, v48, v49, v50) > a4)
              {
                unint64_t v13 = v54;
                goto LABEL_19;
              }
              unint64_t v13 = v55;

              ++v53;
              uint64_t v54 = v13;
            }
            while (v51 != v53);
            uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v47, (uint64_t)&v62, (uint64_t)v69, 16);
            if (v51) {
              continue;
            }
            break;
          }
        }
LABEL_19:
      }
      _Block_object_dispose(v67, 8);

      uint64_t v28 = objc_msgSend_sampleCount(v13, v56, v57, v58, v59);
    }
    int64_t v14 = v28;
  }
  return v14;
}

- (int64_t)_minimumPermittedIntroAndOutroDuration
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  objc_msgSend__shortestSegmentsForType_(self, a2, 1, v2, v3);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v39, (uint64_t)v44, 16);
  if (v33)
  {
    uint64_t v31 = *(void *)v40;
    int64_t v8 = -1;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v40 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = v9;
        uint64_t v10 = *(void **)(*((void *)&v39 + 1) + 8 * v9);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        uint64_t v11 = objc_msgSend__shortestSegmentsForType_(self, v5, 4, v6, v7);
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v35, (uint64_t)v43, 16);
        if (v13)
        {
          uint64_t v15 = v13;
          uint64_t v16 = *(void *)v36;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v36 != v16) {
                objc_enumerationMutation(v11);
              }
              uint64_t v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              if (objc_msgSend_canTransitionFromSegment_toSegment_fromBarIndex_checkIfPrevented_(FlexSegment, v14, (uint64_t)v10, (uint64_t)v18, 0, 1))
              {
                uint64_t v22 = objc_msgSend_sampleCount(v10, v14, v19, v20, v21);
                uint64_t v27 = objc_msgSend_sampleCount(v18, v23, v24, v25, v26);
                if (v27 + v22 < v8 || v8 == -1) {
                  int64_t v8 = v27 + v22;
                }
              }
            }
            uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v35, (uint64_t)v43, 16);
          }
          while (v15);
        }

        uint64_t v9 = v34 + 1;
      }
      while (v34 + 1 != v33);
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v39, (uint64_t)v44, 16);
    }
    while (v33);
  }
  else
  {
    int64_t v8 = -1;
  }

  return v8;
}

+ (id)numberToString:(int64_t)a3
{
  if (qword_26ABF5FC0 != -1) {
    dispatch_once(&qword_26ABF5FC0, &unk_26C7FE8A8);
  }
  if ((unint64_t)a3 > 0x63) {
    objc_msgSend_stringWithFormat_(NSString, a2, @"%ld", v3, v4, a3);
  }
  else {
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_((void *)qword_26ABF5FC8, a2, a3, v3, v4);
  }
  return v6;
}

- (id)_naturalDurationAssemblyList
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v3 = objc_opt_new();
  objc_msgSend__segmentsforType_(self, v4, 2, v5, v6);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v55, (uint64_t)v59, 16);
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v55 + 1) + 8 * i);
        int64_t v14 = objc_alloc_init(FlexSegmentAssemblyInfo);
        objc_msgSend_setSegment_(v14, v15, (uint64_t)v13, v16, v17);
        uint64_t v22 = objc_msgSend_assetProvider(self, v18, v19, v20, v21);
        uint64_t v26 = objc_msgSend_urlToAudioForSegment_(v22, v23, (uint64_t)v13, v24, v25);
        objc_msgSend_setUrl_(v14, v27, (uint64_t)v26, v28, v29);

        uint64_t v34 = objc_msgSend_sampleCount(v13, v30, v31, v32, v33);
        objc_msgSend_setDuration_(v14, v35, v34, v36, v37);
        uint64_t v42 = objc_msgSend_bars(v13, v38, v39, v40, v41);
        objc_msgSend_setBarsUsed_(v14, v43, v42, v44, v45);
        objc_msgSend_addObject_(v3, v46, (uint64_t)v14, v47, v48);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v55, (uint64_t)v59, 16);
    }
    while (v10);
  }
  if (objc_msgSend__updateTransitionBodySegmentsForAssemblyList_usingNewSegment_indexOfNewTransitionSegment_(self, v9, (uint64_t)v3, 0, 0))
  {
    memset(&v54, 0, sizeof(v54));
    CMTimeMakeWithSeconds(&v54, 30.0, 48000);
    if (objc_msgSend__addOutroSegmentsToAssemblyList_forDuration_allowTrim_testingContext_(self, v50, (uint64_t)v3, v54.value, 0, 0))objc_msgSend__addIntroSegmentsToAssemblyList_forDuration_testingContext_(self, v51, (uint64_t)v3, v54.value, 0); {
  }
    }

  return v3;
}

- (void)_sequenceBodySegmentList:(id)a3 forIndexes:(id)a4
{
  uint64_t v404 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v340 = a4;
  if ((unint64_t)objc_msgSend_count(v6, v7, v8, v9, v10) >= 2)
  {
    unint64_t v339 = objc_msgSend__highestIndexForSegmentType_(self, v11, 2, v12, v13);
    uint64_t v21 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v14, v15, v16, v17);
    uint64_t v22 = 0;
    v341 = v6;
    v346 = v21;
    while (1)
    {
      uint64_t v23 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v18, v22, v19, v20);
      char v27 = objc_msgSend_containsObject_(v340, v24, (uint64_t)v23, v25, v26);

      if ((v27 & 1) == 0)
      {
        uint64_t v111 = v22;
        v361 = objc_msgSend_numberToString_(FlexSong, v28, v22, v30, v31);
        v351 = objc_msgSend_array(MEMORY[0x263EFF980], v112, v113, v114, v115);
        long long v393 = 0u;
        long long v394 = 0u;
        long long v395 = 0u;
        long long v396 = 0u;
        id v116 = v6;
        uint64_t v118 = objc_msgSend_countByEnumeratingWithState_objects_count_(v116, v117, (uint64_t)&v393, (uint64_t)v403, 16);
        if (v118)
        {
          uint64_t v123 = v118;
          LOBYTE(isEqualToString) = 0;
          uint64_t v125 = *(void *)v394;
          do
          {
            uint64_t v126 = 0;
            char v127 = isEqualToString;
            do
            {
              if (*(void *)v394 != v125) {
                objc_enumerationMutation(v116);
              }
              v128 = *(void **)(*((void *)&v393 + 1) + 8 * v126);
              v129 = objc_msgSend_segment(v128, v119, v120, v121, v122);
              v134 = objc_msgSend_nameIndex(v129, v130, v131, v132, v133);
              int isEqualToString = objc_msgSend_isEqualToString_(v134, v135, (uint64_t)v361, v136, v137);

              if (isEqualToString)
              {
                objc_msgSend_addObject_(v351, v119, (uint64_t)v128, v121, v122);
                uint64_t v21 = v346;
              }
              else
              {
                uint64_t v21 = v346;
                if (v127) {
                  goto LABEL_37;
                }
              }
              ++v126;
              char v127 = isEqualToString;
            }
            while (v123 != v126);
            uint64_t v123 = objc_msgSend_countByEnumeratingWithState_objects_count_(v116, v119, (uint64_t)&v393, (uint64_t)v403, 16);
          }
          while (v123);
        }
LABEL_37:

        if (objc_msgSend_count(v351, v138, v139, v140, v141)) {
          objc_msgSend_setObject_forKey_(v21, v142, (uint64_t)v351, (uint64_t)v361, v143);
        }
        id v6 = v341;
        unint64_t v144 = v339;
        uint64_t v145 = v111;
        goto LABEL_93;
      }
      uint64_t v352 = v22;
      v361 = objc_msgSend_array(MEMORY[0x263EFF980], v28, v29, v30, v31);
      v351 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v32, v33, v34, v35);
      long long v389 = 0u;
      long long v390 = 0u;
      long long v391 = 0u;
      long long v392 = 0u;
      id v36 = v6;
      uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v389, (uint64_t)v402, 16);
      if (v38)
      {
        uint64_t v43 = v38;
        uint64_t v44 = *(void *)v390;
        do
        {
          for (uint64_t i = 0; i != v43; ++i)
          {
            if (*(void *)v390 != v44) {
              objc_enumerationMutation(v36);
            }
            long long v46 = *(void **)(*((void *)&v389 + 1) + 8 * i);
            uint64_t v47 = objc_msgSend_segment(v46, v39, v40, v41, v42);
            uint64_t v52 = objc_msgSend_nameIndex(v47, v48, v49, v50, v51);

            long long v56 = objc_msgSend_numberToString_(FlexSong, v53, v352, v54, v55);
            if (objc_msgSend_isEqualToString_(v52, v57, (uint64_t)v56, v58, v59))
            {
              objc_msgSend_addObject_(v361, v60, (uint64_t)v46, v61, v62);
              uint64_t v67 = objc_msgSend_segment(v46, v63, v64, v65, v66);
              uint64_t v72 = objc_msgSend_nameSuffix(v67, v68, v69, v70, v71);

              v76 = objc_msgSend_objectForKeyedSubscript_(v351, v73, (uint64_t)v72, v74, v75);

              if (v76)
              {
                id v80 = objc_msgSend_objectForKeyedSubscript_(v351, v77, (uint64_t)v72, v78, v79);
                long long v81 = NSNumber;
                int v86 = objc_msgSend_intValue(v80, v82, v83, v84, v85);
                uint64_t v90 = objc_msgSend_numberWithInt_(v81, v87, (v86 + 1), v88, v89);
              }
              else
              {
                uint64_t v90 = &unk_26C807090;
              }
              objc_msgSend_setObject_forKey_(v351, v77, (uint64_t)v90, (uint64_t)v72, v79);
            }
          }
          uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v389, (uint64_t)v402, 16);
        }
        while (v43);
      }

      long long v387 = 0u;
      long long v388 = 0u;
      long long v385 = 0u;
      long long v386 = 0u;
      v95 = objc_msgSend_allKeys(v351, v91, v92, v93, v94);
      uint64_t v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v96, (uint64_t)&v385, (uint64_t)v401, 16);
      if (v97)
      {
        uint64_t v101 = v97;
        v353 = 0;
        char v102 = 0;
        uint64_t v103 = *(void *)v386;
        do
        {
          for (uint64_t j = 0; j != v101; ++j)
          {
            if (*(void *)v386 != v103) {
              objc_enumerationMutation(v95);
            }
            uint64_t v105 = *(void **)(*((void *)&v385 + 1) + 8 * j);
            if (objc_msgSend_localizedCaseInsensitiveContainsString_(v105, v98, @"to", v99, v100))
            {
              id v106 = v105;

              char v102 = 1;
              v353 = v106;
            }
          }
          uint64_t v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v98, (uint64_t)&v385, (uint64_t)v401, 16);
        }
        while (v101);

        uint64_t v110 = (uint64_t)v353;
        if (v353)
        {
          objc_msgSend_removeObjectForKey_(v351, v107, (uint64_t)v353, v108, v109);
          goto LABEL_42;
        }
      }
      else
      {

        char v102 = 0;
      }
      v353 = 0;
LABEL_42:
      v344 = objc_msgSend_array(MEMORY[0x263EFF980], v107, v110, v108, v109);
      char v342 = v102;
      if (v102)
      {
        v384[0] = MEMORY[0x263EF8330];
        v384[1] = 3221225472;
        v384[2] = sub_217A4F884;
        v384[3] = &unk_2642B7808;
        v384[4] = v352;
        v150 = objc_msgSend_indexesOfObjectsPassingTest_(v36, v146, (uint64_t)v384, v148, v149);
        v154 = objc_msgSend_objectsAtIndexes_(v36, v151, (uint64_t)v150, v152, v153);
        objc_msgSend_addObjectsFromArray_(v344, v155, (uint64_t)v154, v156, v157);

        long long v382 = 0u;
        long long v383 = 0u;
        long long v380 = 0u;
        long long v381 = 0u;
        id v158 = v344;
        uint64_t v160 = objc_msgSend_countByEnumeratingWithState_objects_count_(v158, v159, (uint64_t)&v380, (uint64_t)v400, 16);
        if (v160)
        {
          uint64_t v164 = v160;
          uint64_t v165 = *(void *)v381;
          do
          {
            for (uint64_t k = 0; k != v164; ++k)
            {
              if (*(void *)v381 != v165) {
                objc_enumerationMutation(v158);
              }
              objc_msgSend_removeObject_(v361, v161, *(void *)(*((void *)&v380 + 1) + 8 * k), v162, v163);
            }
            uint64_t v164 = objc_msgSend_countByEnumeratingWithState_objects_count_(v158, v161, (uint64_t)&v380, (uint64_t)v400, 16);
          }
          while (v164);
        }
      }
      v356 = objc_msgSend_array(MEMORY[0x263EFF980], v146, v147, v148, v149);
      unint64_t v347 = objc_msgSend_count(v361, v167, v168, v169, v170);
      unint64_t v362 = 0;
      uint64_t v175 = 1;
      do
      {
        if (!objc_msgSend_count(v361, v171, v172, v173, v174) || v362 >= v347) {
          break;
        }
        uint64_t v349 = v175;
        v177 = objc_msgSend_allKeys(v351, v171, v176, v173, v174);
        v181 = objc_msgSend_sortedArrayUsingSelector_(v177, v178, (uint64_t)sel_localizedCaseInsensitiveCompare_, v179, v180);

        long long v378 = 0u;
        long long v379 = 0u;
        long long v376 = 0u;
        long long v377 = 0u;
        id obj = v181;
        uint64_t v359 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v182, (uint64_t)&v376, (uint64_t)v399, 16);
        if (v359)
        {
          uint64_t v357 = *(void *)v377;
          do
          {
            for (uint64_t m = 0; m != v359; ++m)
            {
              if (*(void *)v377 != v357) {
                objc_enumerationMutation(obj);
              }
              uint64_t v184 = *(void *)(*((void *)&v376 + 1) + 8 * m);
              long long v372 = 0u;
              long long v373 = 0u;
              long long v374 = 0u;
              long long v375 = 0u;
              id v185 = v361;
              uint64_t v187 = objc_msgSend_countByEnumeratingWithState_objects_count_(v185, v186, (uint64_t)&v372, (uint64_t)v398, 16);
              if (!v187)
              {
LABEL_67:
                id v206 = 0;
                goto LABEL_69;
              }
              uint64_t v192 = v187;
              uint64_t v193 = *(void *)v373;
LABEL_61:
              uint64_t v194 = 0;
              while (1)
              {
                if (*(void *)v373 != v193) {
                  objc_enumerationMutation(v185);
                }
                v195 = *(void **)(*((void *)&v372 + 1) + 8 * v194);
                v196 = objc_msgSend_segment(v195, v188, v189, v190, v191);
                v201 = objc_msgSend_nameSuffix(v196, v197, v198, v199, v200);
                int v205 = objc_msgSend_isEqualToString_(v201, v202, v184, v203, v204);

                if (v205) {
                  break;
                }
                if (v192 == ++v194)
                {
                  uint64_t v192 = objc_msgSend_countByEnumeratingWithState_objects_count_(v185, v188, (uint64_t)&v372, (uint64_t)v398, 16);
                  if (!v192) {
                    goto LABEL_67;
                  }
                  goto LABEL_61;
                }
              }
              objc_msgSend_addObject_(v356, v188, (uint64_t)v195, v190, v191);
              id v206 = v195;
              ++v362;
LABEL_69:

              objc_msgSend_removeObject_(v185, v207, (uint64_t)v206, v208, v209);
            }
            uint64_t v359 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v210, (uint64_t)&v376, (uint64_t)v399, 16);
          }
          while (v359);
        }

        uint64_t v175 = v349 + 1;
      }
      while (v349 != 1000);
      v211 = v344;
      id v6 = v341;
      uint64_t v21 = v346;
      unint64_t v212 = 0x2642B6000;
      if ((v342 & (v344 != 0)) != 1) {
        goto LABEL_92;
      }
      long long v370 = 0u;
      long long v371 = 0u;
      long long v368 = 0u;
      long long v369 = 0u;
      id v213 = v344;
      uint64_t v363 = objc_msgSend_countByEnumeratingWithState_objects_count_(v213, v214, (uint64_t)&v368, (uint64_t)v397, 16);
      if (!v363) {
        goto LABEL_91;
      }
      uint64_t v360 = *(void *)v369;
      id v343 = v213;
      do
      {
        for (uint64_t n = 0; n != v363; ++n)
        {
          if (*(void *)v369 != v360) {
            objc_enumerationMutation(v213);
          }
          v220 = *(void **)(*((void *)&v368 + 1) + 8 * n);
          v221 = objc_msgSend_segment(v220, v215, v216, v217, v218);
          v226 = objc_msgSend_nameSuffix(v221, v222, v223, v224, v225);

          v231 = objc_msgSend_segment(v220, v227, v228, v229, v230);
          v236 = objc_msgSend_nameIndex(v231, v232, v233, v234, v235);

          v241 = objc_msgSend_lowercaseString(v226, v237, v238, v239, v240);
          v246 = objc_msgSend_lowercaseString(@"to", v242, v243, v244, v245);
          if (objc_msgSend_hasPrefix_(v241, v247, (uint64_t)v246, v248, v249))
          {
            uint64_t v254 = objc_msgSend_count(v213, v250, v251, v252, v253);

            if (v254 == 1)
            {
              objc_msgSend_addObject_(v356, v255, (uint64_t)v220, v257, v258);
              goto LABEL_88;
            }
          }
          else
          {
          }
          unint64_t v212 = 0x2642B6000;
          if ((unint64_t)objc_msgSend_length(v226, v255, v256, v257, v258) < 2) {
            goto LABEL_89;
          }
          v262 = objc_msgSend_substringToIndex_(v226, v259, 1, v260, v261);
          v266 = objc_msgSend_stringWithFormat_(NSString, v263, @"%@%@", v264, v265, v236, v262);
          v364[0] = MEMORY[0x263EF8330];
          v364[1] = 3221225472;
          v364[2] = sub_217A4F930;
          v364[3] = &unk_2642B7830;
          id v267 = v356;
          id v365 = v267;
          id v358 = v266;
          id v366 = v358;
          v367 = v220;
          unint64_t v271 = objc_msgSend_indexOfObjectPassingTest_(v267, v268, (uint64_t)v364, v269, v270);
          if (v271 < objc_msgSend_count(v267, v272, v273, v274, v275) - 1)
          {
            id obja = v262;
            uint64_t v345 = v271 + 1;
            v350 = objc_msgSend_objectAtIndexedSubscript_(v267, v276, v271 + 1, v277, v278);
            v283 = objc_msgSend_segment(v350, v279, v280, v281, v282);
            v287 = objc_msgSend_componentsSeparatedByString_(v226, v284, @"to", v285, v286);
            v348 = objc_msgSend_lastObject(v287, v288, v289, v290, v291);

            v296 = objc_msgSend_name(v283, v292, v293, v294, v295);
            v301 = objc_msgSend_namePrefix(v283, v297, v298, v299, v300);
            v304 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v296, v302, (uint64_t)v301, (uint64_t)&stru_26C7FED08, v303);

            v309 = objc_msgSend_nameStem(v283, v305, v306, v307, v308);
            v312 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v304, v310, (uint64_t)v309, (uint64_t)&stru_26C7FED08, v311);

            if (objc_msgSend_isEqualToString_(v348, v313, (uint64_t)v312, v314, v315)) {
              objc_msgSend_insertObject_atIndex_(v267, v316, (uint64_t)v220, v345, v317);
            }

            uint64_t v21 = v346;
            id v213 = v343;
            v211 = v344;
            v262 = obja;
          }

LABEL_88:
          unint64_t v212 = 0x2642B6000uLL;
LABEL_89:
        }
        uint64_t v363 = objc_msgSend_countByEnumeratingWithState_objects_count_(v213, v215, (uint64_t)&v368, (uint64_t)v397, 16);
      }
      while (v363);
LABEL_91:

      id v6 = v341;
LABEL_92:
      uint64_t v145 = v352;
      v318 = objc_msgSend_numberToString_(*(void **)(v212 + 2880), v171, v352, v173, v174);
      objc_msgSend_setObject_forKey_(v21, v319, (uint64_t)v356, (uint64_t)v318, v320);

      unint64_t v144 = v339;
LABEL_93:

      uint64_t v22 = v145 + 1;
      if (v145 + 1 > v144)
      {
        v325 = objc_msgSend_array(MEMORY[0x263EFF980], v18, v321, v19, v20);
        unint64_t v326 = 0;
        do
        {
          v327 = objc_msgSend_numberToString_(FlexSong, v322, v326, v323, v324);
          v331 = objc_msgSend_objectForKeyedSubscript_(v21, v328, (uint64_t)v327, v329, v330);
          objc_msgSend_addObjectsFromArray_(v325, v332, (uint64_t)v331, v333, v334);

          ++v326;
        }
        while (v326 <= v339);
        id v6 = v341;
        objc_msgSend_removeAllObjects(v341, v322, v335, v323, v324);
        objc_msgSend_addObjectsFromArray_(v341, v336, (uint64_t)v325, v337, v338);

        break;
      }
    }
  }
}

- (BOOL)_addSegment:(id)a3 withDuration:(int64_t)a4 toAssemblyList:(id)a5 indexOfNewSegment:(int64_t *)a6
{
  return objc_msgSend__addSegment_withDuration_toAssemblyList_timeRemaining_reusedSegment_indexofNewSegment_(self, a2, (uint64_t)a3, a4, (uint64_t)a5, 0, 0, a6);
}

- (BOOL)_addSegment:(id)a3 withDuration:(int64_t)a4 toAssemblyList:(id)a5 timeRemaining:(int64_t)a6 reusedSegment:(id *)a7 indexofNewSegment:(int64_t *)a8
{
  uint64_t v195 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  uint64_t v18 = v13;
  if (v12 && a4 && v13)
  {
    uint64_t v19 = objc_msgSend_assetProvider(self, v14, v15, v16, v17);
    uint64_t v23 = objc_msgSend_urlToAudioForSegment_(v19, v20, (uint64_t)v12, v21, v22);

    if (!v23)
    {
      int v92 = 0;
LABEL_46:

      BOOL v94 = v92 != 0;
      goto LABEL_47;
    }
    uint64_t v180 = a7;
    int64_t v28 = 0;
    uint64_t v29 = 1;
    do
    {
      uint64_t v30 = v29;
      if (v28 > a4) {
        break;
      }
      if (objc_msgSend_bars(v12, v24, v25, v26, v27) <= v29) {
        break;
      }
      v28 += objc_msgSend_barDurationForBarIndex_(v12, v24, v30 - 1, v26, v27);
      uint64_t v29 = v30 + 1;
    }
    while (v28 < a4);
    if (objc_msgSend_sliceable(v12, v24, v25, v26, v27))
    {
      v178 = v23;
      uint64_t v179 = a8;
      v191[0] = MEMORY[0x263EF8330];
      v191[1] = 3221225472;
      v191[2] = sub_217A50164;
      v191[3] = &unk_2642B7858;
      id v192 = v12;
      uint64_t v34 = objc_msgSend_indexesOfObjectsPassingTest_(v18, v31, (uint64_t)v191, v32, v33);
      objc_msgSend_objectsAtIndexes_(v18, v35, (uint64_t)v34, v36, v37);
      long long v187 = 0u;
      long long v188 = 0u;
      long long v189 = 0u;
      long long v190 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v187, (uint64_t)v194, 16);
      if (v39)
      {
        uint64_t v44 = v39;
        uint64_t v175 = v34;
        int64_t v176 = a4;
        id v177 = v12;
        uint64_t v185 = *(void *)v188;
        v181 = v18;
        while (2)
        {
          for (uint64_t i = 0; i != v44; ++i)
          {
            if (*(void *)v188 != v185) {
              objc_enumerationMutation(obj);
            }
            long long v46 = *(void **)(*((void *)&v187 + 1) + 8 * i);
            uint64_t v47 = objc_msgSend_barsUsed(v46, v40, v41, v42, v43, v175, v176);
            uint64_t v52 = objc_msgSend_segment(v46, v48, v49, v50, v51);
            uint64_t v57 = objc_msgSend_bars(v52, v53, v54, v55, v56);

            uint64_t v62 = objc_msgSend_barsUsed(v46, v58, v59, v60, v61);
            uint64_t v67 = objc_msgSend_segment(v46, v63, v64, v65, v66);
            uint64_t v72 = objc_msgSend_bars(v67, v68, v69, v70, v71);

            if (v47 != v57 && v62 + v30 <= v72)
            {
              if (objc_msgSend_barsUsed(v46, v40, v41, v42, v43) <= -(uint64_t)v30)
              {
                uint64_t v79 = 0;
              }
              else
              {
                uint64_t v78 = 0;
                uint64_t v79 = 0;
                do
                {
                  id v80 = objc_msgSend_segment(v46, v74, v75, v76, v77);
                  v79 += objc_msgSend_barDurationForBarIndex_(v80, v81, v78, v82, v83);

                  ++v78;
                }
                while (objc_msgSend_barsUsed(v46, v84, v85, v86, v87) + v30 > v78);
              }
              objc_msgSend__sampleDurationOfClipPlaylist_(self, v74, (uint64_t)v181, v76, v77);
              if (v79 - objc_msgSend_duration(v46, v88, v89, v90, v91) <= a6)
              {
                uint64_t v111 = objc_msgSend_barsUsed(v46, v40, v41, v42, v43);
                objc_msgSend_setBarsUsed_(v46, v112, v111 + v30, v113, v114);
                uint64_t v93 = v46;
                objc_msgSend_setDuration_(v93, v115, v79, v116, v117);
                if (v180)
                {
                  objc_msgSend_segment(v93, v118, v119, v120, v121);
                  *uint64_t v180 = (id)objc_claimAutoreleasedReturnValue();
                }
                uint64_t v18 = v181;
                int v186 = 0;
                a8 = v179;
                *uint64_t v179 = objc_msgSend_indexOfObject_(v181, v118, (uint64_t)v93, v120, v121);
                int v92 = 1;
                id v12 = v177;
                goto LABEL_38;
              }
            }
          }
          uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v187, (uint64_t)v194, 16);
          if (v44) {
            continue;
          }
          break;
        }
        int v92 = 0;
        uint64_t v93 = 0;
        int v186 = 1;
        id v12 = v177;
        uint64_t v18 = v181;
        a8 = v179;
LABEL_38:
        uint64_t v23 = v178;
        uint64_t v34 = v175;
        a4 = v176;
      }
      else
      {
        int v92 = 0;
        uint64_t v93 = 0;
        int v186 = 1;
      }

      if (!v186) {
        goto LABEL_45;
      }
    }
    else
    {
      uint64_t v93 = 0;
    }
    uint64_t v122 = v93;
    uint64_t v93 = objc_alloc_init(FlexSegmentAssemblyInfo);

    objc_msgSend_setSegment_(v93, v123, (uint64_t)v12, v124, v125);
    objc_msgSend_setUrl_(v93, v126, (uint64_t)v23, v127, v128);
    objc_msgSend_setDuration_(v93, v129, a4, v130, v131);
    objc_msgSend_setBarsUsed_(v93, v132, v30, v133, v134);
    if (objc_msgSend_type(v12, v135, v136, v137, v138) == 2 || objc_msgSend_type(v12, v139, v140, v141, v142) == 3)
    {
      objc_msgSend_addObject_(v18, v139, (uint64_t)v93, v141, v142);
      unint64_t v144 = NSNumber;
      uint64_t v149 = objc_msgSend_nameIndex(v12, v145, v146, v147, v148);
      uint64_t v154 = objc_msgSend_integerValue(v149, v150, v151, v152, v153);
      id v158 = objc_msgSend_numberWithInteger_(v144, v155, v154, v156, v157);
      uint64_t v193 = v158;
      v161 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v159, (uint64_t)&v193, 1, v160);
      objc_msgSend__sequenceBodySegmentList_forIndexes_(self, v162, (uint64_t)v18, (uint64_t)v161, v163);
    }
    else if (objc_msgSend_type(v12, v139, v143, v141, v142) == 1)
    {
      objc_msgSend_insertObject_atIndex_(v18, v168, (uint64_t)v93, 0, v171);
    }
    else
    {
      if (objc_msgSend_type(v12, v168, v169, v170, v171) != 4)
      {
        int v92 = 0;
        goto LABEL_45;
      }
      objc_msgSend_addObject_(v18, v172, (uint64_t)v93, v173, v174);
    }
    *a8 = objc_msgSend_indexOfObject_(v18, v164, (uint64_t)v93, v165, v166);
    int v92 = 1;
LABEL_45:

    goto LABEL_46;
  }
  BOOL v94 = 0;
  if (!v12 && a4 && v13)
  {
    v95 = objc_alloc_init(FlexSegmentAssemblyInfo);
    objc_msgSend_setSegment_(v95, v96, 0, v97, v98);
    objc_msgSend_setUrl_(v95, v99, 0, v100, v101);
    objc_msgSend_setDuration_(v95, v102, a4, v103, v104);
    BOOL v94 = 1;
    objc_msgSend_setBarsUsed_(v95, v105, 1, v106, v107);
    objc_msgSend_addObject_(v18, v108, (uint64_t)v95, v109, v110);
  }
LABEL_47:

  return v94;
}

- (void)_removeSegmentInfo:(id)a3 fromAssemblyList:(id)a4
{
  if (a3) {
    objc_msgSend_removeObject_(a4, a2, (uint64_t)a3, (uint64_t)a4, v4);
  }
}

- (BOOL)_updateTransitionBodySegmentsForAssemblyList:(id)a3 usingNewSegment:(id)a4 indexOfNewTransitionSegment:(id)a5
{
  uint64_t v261 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v237 = a5;
  if (!objc_msgSend_count(v8, v10, v11, v12, v13))
  {
    char v33 = 1;
    v227 = v237;
    goto LABEL_67;
  }
  id v236 = v9;
  uint64_t v18 = objc_msgSend_set(MEMORY[0x263EFF9C0], v14, v15, v16, v17);
  uint64_t v23 = objc_msgSend_set(MEMORY[0x263EFF9C0], v19, v20, v21, v22);
  uint64_t v32 = objc_msgSend_set(MEMORY[0x263EFF9C0], v24, v25, v26, v27);
  int v239 = 0;
  char v33 = 1;
  uint64_t v240 = v23;
  v241 = v18;
  do
  {
LABEL_3:
    objc_msgSend_removeAllObjects(v23, v28, v29, v30, v31);
    objc_msgSend_removeAllObjects(v18, v34, v35, v36, v37);
    if (!objc_msgSend_count(v8, v38, v39, v40, v41)) {
      goto LABEL_26;
    }
    long long v46 = 0;
    while (1)
    {
      uint64_t v47 = objc_msgSend_objectAtIndexedSubscript_(v8, v42, (uint64_t)v46, v44, v45);
      unint64_t v48 = (unint64_t)(v46 + 1);
      if ((unint64_t)(v46 + 1) < objc_msgSend_count(v8, v49, v50, v51, v52)) {
        break;
      }
      if (v48 != objc_msgSend_count(v8, v53, v54, v55, v56)) {
        goto LABEL_24;
      }
      char v102 = objc_msgSend_segment(v47, v98, v99, v100, v101);
      uint64_t v107 = objc_msgSend_type(v102, v103, v104, v105, v106);

      if (v107 == 3) {
        objc_msgSend_addObject_(v241, v108, (uint64_t)v47, v109, v110);
      }
LABEL_21:

      long long v46 = (char *)v48;
      if (v48 >= objc_msgSend_count(v8, v163, v164, v165, v166)) {
        goto LABEL_25;
      }
    }
    v242 = v46 + 1;
    uint64_t v57 = objc_msgSend_objectAtIndexedSubscript_(v8, v53, (uint64_t)(v46 + 1), v55, v56);
    uint64_t v62 = objc_msgSend_segment(v47, v58, v59, v60, v61);
    uint64_t v244 = v57;
    objc_msgSend_segment(v57, v63, v64, v65, v66);
    v68 = uint64_t v67 = v47;
    uint64_t v73 = objc_msgSend_name(v68, v69, v70, v71, v72);
    uint64_t v78 = objc_msgSend_barsUsed(v67, v74, v75, v76, v77);
    long long v81 = objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v62, v79, (uint64_t)v73, v78 - 1, v80);

    uint64_t v243 = v81;
    uint64_t v86 = objc_msgSend_transitionSegmentName(v81, v82, v83, v84, v85);

    if (!v86)
    {
      uint64_t v111 = objc_msgSend_segment(v67, v87, v88, v89, v90);
      uint64_t v116 = objc_msgSend_type(v111, v112, v113, v114, v115);

      uint64_t v47 = v67;
      int v92 = v244;
      if (v116 != 3)
      {
LABEL_20:

        unint64_t v48 = (unint64_t)v242;
        goto LABEL_21;
      }
      if (v46)
      {
        objc_msgSend_objectAtIndexedSubscript_(v8, v117, (uint64_t)(v46 - 1), v119, v120);
        long long v46 = (char *)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v121 = objc_msgSend_segment(v46, v117, v118, v119, v120);
      uint64_t v126 = objc_msgSend_segment(v244, v122, v123, v124, v125);
      uint64_t v131 = objc_msgSend_name(v126, v127, v128, v129, v130);
      uint64_t v136 = objc_msgSend_barsUsed(v46, v132, v133, v134, v135);
      uint64_t v139 = objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v121, v137, (uint64_t)v131, v136 - 1, v138);

      unint64_t v144 = objc_msgSend_transitionSegmentName(v139, v140, v141, v142, v143);

      uint64_t v47 = v67;
      if (!v144) {
        goto LABEL_17;
      }
      uint64_t v149 = objc_msgSend_transitionSegmentName(v139, v145, v146, v147, v148);
      uint64_t v154 = objc_msgSend_segment(v67, v150, v151, v152, v153);
      v159 = objc_msgSend_name(v154, v155, v156, v157, v158);
      char isEqualToString = objc_msgSend_isEqualToString_(v149, v160, (uint64_t)v159, v161, v162);

      uint64_t v47 = v67;
      if ((isEqualToString & 1) == 0) {
LABEL_17:
      }
        objc_msgSend_addObject_(v241, v145, (uint64_t)v47, v147, v148);

      int v92 = v244;
LABEL_19:

      goto LABEL_20;
    }
    uint64_t v91 = objc_msgSend_barsUsed(v67, v87, v88, v89, v90);
    int v92 = v244;
    uint64_t v94 = objc_msgSend__transitionSegmentForSegmentInfo_toSegmentInfo_fromBarIndex_inSegmentList_(self, v93, (uint64_t)v67, (uint64_t)v244, v91 - 1, v8);
    uint64_t v47 = v67;
    if (v94)
    {
      long long v46 = (char *)v94;
      objc_msgSend_addObject_(v240, v95, v94, v96, v97);
      goto LABEL_19;
    }

    char v33 = 0;
LABEL_24:

LABEL_25:
    uint64_t v23 = v240;
    uint64_t v18 = v241;
LABEL_26:
    if (objc_msgSend_count(v23, v42, v43, v44, v45))
    {
      long long v256 = 0u;
      long long v257 = 0u;
      long long v254 = 0u;
      long long v255 = 0u;
      id v171 = v23;
      uint64_t v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v171, v172, (uint64_t)&v254, (uint64_t)v260, 16);
      if (v173)
      {
        uint64_t v178 = v173;
        uint64_t v179 = *(void *)v255;
        do
        {
          for (uint64_t i = 0; i != v178; ++i)
          {
            if (*(void *)v255 != v179) {
              objc_enumerationMutation(v171);
            }
            v181 = objc_msgSend_copy(*(void **)(*((void *)&v254 + 1) + 8 * i), v174, v175, v176, v177);
            uint64_t v253 = 0x7FFFFFFFFFFFFFFFLL;
            uint64_t v186 = objc_msgSend_sampleCount(v181, v182, v183, v184, v185);
            int v188 = objc_msgSend__addSegment_withDuration_toAssemblyList_indexOfNewSegment_(self, v187, (uint64_t)v181, v186, (uint64_t)v8, &v253);
            char v33 = v188;
            if (v188) {
              BOOL v192 = v253 == 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              BOOL v192 = 1;
            }
            if (!v192)
            {
              v196 = objc_msgSend_objectAtIndex_(v8, v189, v253, v190, v191);
              if (v196) {
                objc_msgSend_addObject_(v32, v193, (uint64_t)v196, v194, v195);
              }
            }
          }
          uint64_t v178 = objc_msgSend_countByEnumeratingWithState_objects_count_(v171, v174, (uint64_t)&v254, (uint64_t)v260, 16);
        }
        while (v178);
        uint64_t v23 = v240;
        uint64_t v18 = v241;
      }
    }
    if (objc_msgSend_count(v18, v167, v168, v169, v170))
    {
      long long v251 = 0u;
      long long v252 = 0u;
      long long v249 = 0u;
      long long v250 = 0u;
      id v201 = v18;
      uint64_t v203 = objc_msgSend_countByEnumeratingWithState_objects_count_(v201, v202, (uint64_t)&v249, (uint64_t)v259, 16);
      if (v203)
      {
        uint64_t v206 = v203;
        uint64_t v207 = *(void *)v250;
        do
        {
          for (uint64_t j = 0; j != v206; ++j)
          {
            if (*(void *)v250 != v207) {
              objc_enumerationMutation(v201);
            }
            uint64_t v209 = *(void *)(*((void *)&v249 + 1) + 8 * j);
            objc_msgSend__removeSegmentInfo_fromAssemblyList_(self, v204, v209, (uint64_t)v8, v205);
            if (objc_msgSend_containsObject_(v32, v210, v209, v211, v212)) {
              objc_msgSend_removeObject_(v32, v204, v209, v213, v205);
            }
          }
          uint64_t v206 = objc_msgSend_countByEnumeratingWithState_objects_count_(v201, v204, (uint64_t)&v249, (uint64_t)v259, 16);
        }
        while (v206);
      }

      uint64_t v18 = v241;
    }
    if (v239 == 10) {
      break;
    }
    ++v239;
    v214 = objc_msgSend_anyObject(v23, v197, v198, v199, v200);
    if (v214)
    {

      goto LABEL_3;
    }
    v219 = objc_msgSend_anyObject(v18, v215, v216, v217, v218);
  }
  while (v219);
  v220 = v18;
  long long v247 = 0u;
  long long v248 = 0u;
  long long v245 = 0u;
  long long v246 = 0u;
  id v221 = v32;
  uint64_t v223 = objc_msgSend_countByEnumeratingWithState_objects_count_(v221, v222, (uint64_t)&v245, (uint64_t)v258, 16);
  id v9 = v236;
  v227 = v237;
  if (v223)
  {
    uint64_t v228 = v223;
    uint64_t v229 = *(void *)v246;
    do
    {
      for (uint64_t k = 0; k != v228; ++k)
      {
        if (*(void *)v246 != v229) {
          objc_enumerationMutation(v221);
        }
        uint64_t v231 = objc_msgSend_indexOfObject_(v8, v224, *(void *)(*((void *)&v245 + 1) + 8 * k), v225, v226);
        objc_msgSend_addIndex_(v237, v232, v231, v233, v234);
      }
      uint64_t v228 = objc_msgSend_countByEnumeratingWithState_objects_count_(v221, v224, (uint64_t)&v245, (uint64_t)v258, 16);
    }
    while (v228);
  }

LABEL_67:
  return v33 & 1;
}

- (BOOL)_removeUnpermittedTransitionsInAssemblyList:(id)a3 final:(BOOL)a4 testingContext:(id)a5 removedIndexes:(id)a6
{
  return objc_msgSend__removeUnpermittedTransitionsInAssemblyList_final_testingContext_removedIndexes_conflictList_(self, a2, (uint64_t)a3, a4, (uint64_t)a5, a6, 0);
}

- (BOOL)_removeUnpermittedTransitionsInAssemblyList:(id)a3 final:(BOOL)a4 testingContext:(id)a5 removedIndexes:(id)a6 conflictList:(id)a7
{
  BOOL v439 = a4;
  uint64_t v473 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v441 = a5;
  id v12 = a6;
  id v440 = a7;
  uint64_t v21 = objc_msgSend_array(MEMORY[0x263EFF980], v13, v14, v15, v16);
  int v22 = 0;
  BOOL v23 = 0;
  id v447 = v12;
  v444 = v21;
  do
  {
    BOOL v443 = v23;
    if (v23) {
      break;
    }
    int v445 = v22;
    uint64_t v24 = objc_msgSend_count(v11, v17, v18, v19, v20);
    if (!v24) {
      goto LABEL_79;
    }
    uint64_t v29 = v24;
    unint64_t v30 = 0;
    unint64_t v31 = v24 - 1;
    uint64_t v457 = 1;
    uint64_t v449 = v24 - 1;
    while (1)
    {
      uint64_t v32 = objc_msgSend_objectAtIndexedSubscript_(v11, v25, v30, v27, v28);
      uint64_t v37 = objc_msgSend_segment(v32, v33, v34, v35, v36);
      uint64_t v42 = objc_msgSend_type(v37, v38, v39, v40, v41);

      if (v42 != 3) {
        break;
      }
LABEL_35:

      ++v30;
      ++v457;
      if (v30 == v29) {
        goto LABEL_79;
      }
    }
    if (v30 >= v31)
    {
      uint64_t v55 = 0;
      if (v30 != v31)
      {
LABEL_34:

        goto LABEL_35;
      }
      unint64_t v452 = v30;
      v448 = 0;
      int v446 = 0;
LABEL_22:
      uint64_t v106 = objc_msgSend__segmentsforType_(self, v43, 4, v44, v45);
      long long v467 = 0u;
      long long v468 = 0u;
      long long v469 = 0u;
      long long v470 = 0u;
      id obj = v106;
      uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v107, (uint64_t)&v467, (uint64_t)v472, 16);
      if (v108)
      {
        uint64_t v113 = v108;
        uint64_t v461 = *(void *)v468;
LABEL_24:
        uint64_t v114 = 0;
        while (1)
        {
          if (*(void *)v468 != v461) {
            objc_enumerationMutation(obj);
          }
          uint64_t v115 = *(void **)(*((void *)&v467 + 1) + 8 * v114);
          uint64_t v116 = objc_msgSend_segment(v32, v109, v110, v111, v112);
          uint64_t v121 = objc_msgSend_name(v115, v117, v118, v119, v120);
          uint64_t v126 = objc_msgSend_barsUsed(v32, v122, v123, v124, v125);
          uint64_t v129 = objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v116, v127, (uint64_t)v121, v126 - 1, v128);

          if (!v129) {
            break;
          }
          int v134 = objc_msgSend_prevented(v129, v130, v131, v132, v133);

          if (!v134) {
            break;
          }
          if (v113 == ++v114)
          {
            uint64_t v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v109, (uint64_t)&v467, (uint64_t)v472, 16);
            if (v113) {
              goto LABEL_24;
            }

            id v135 = v32;
            uint64_t v140 = objc_msgSend_removedConflicts(v441, v136, v137, v138, v139);
            uint64_t v141 = NSString;
            uint64_t v146 = objc_msgSend_segment(v135, v142, v143, v144, v145);
            uint64_t v151 = objc_msgSend_name(v146, v147, v148, v149, v150);
            v155 = objc_msgSend_stringWithFormat_(v141, v152, @"supply an outro for %@", v153, v154, v151);
            objc_msgSend_addObject_(v140, v156, (uint64_t)v155, v157, v158);

            v159 = NSString;
            uint64_t v164 = objc_msgSend_segment(v135, v160, v161, v162, v163);
            uint64_t v169 = objc_msgSend_name(v164, v165, v166, v167, v168);
            uint64_t v173 = objc_msgSend_stringWithFormat_(v159, v170, @"supply an outro for %@", v171, v172, v169);
            objc_msgSend_addObject_(v440, v174, (uint64_t)v173, v175, v176);

            id v177 = v135;
            id v12 = v447;
            uint64_t v55 = v448;
            int v105 = v446;
            if (v135) {
              goto LABEL_77;
            }
            goto LABEL_39;
          }
        }
      }

      id v12 = v447;
      uint64_t v55 = v448;
      unint64_t v31 = v449;
      unint64_t v30 = v452;
      goto LABEL_34;
    }
    unint64_t v452 = v30;
    long long v46 = objc_msgSend_objectAtIndexedSubscript_(v11, v43, v30 + 1, v44, v45);
    v459 = objc_msgSend_segment(v46, v47, v48, v49, v50);
    uint64_t v54 = v457;
    while (1)
    {
      uint64_t v55 = objc_msgSend_objectAtIndexedSubscript_(v11, v51, v54, v52, v53);
      uint64_t v60 = objc_msgSend_segment(v55, v56, v57, v58, v59);
      uint64_t v65 = objc_msgSend_type(v60, v61, v62, v63, v64);

      if (v65 == 2) {
        break;
      }

      if (v29 == ++v54)
      {
        uint64_t v55 = v46;
        uint64_t v71 = v459;
        goto LABEL_14;
      }
    }
    uint64_t v71 = objc_msgSend_segment(v55, v66, v67, v68, v69);

LABEL_14:
    uint64_t v72 = objc_msgSend_segment(v32, v51, v70, v52, v53);
    int v77 = objc_msgSend_sliceable(v72, v73, v74, v75, v76);

    if (v77) {
      uint64_t v82 = objc_msgSend_barsUsed(v32, v78, v79, v80, v81) - 1;
    }
    else {
      uint64_t v82 = 0;
    }
    uint64_t v83 = objc_msgSend_lastObject(v11, v78, v79, v80, v81);

    id objb = (id)objc_msgSend_type(v71, v84, v85, v86, v87);
    int v92 = objc_msgSend_segment(v32, v88, v89, v90, v91);
    v460 = v71;
    uint64_t v97 = objc_msgSend_name(v71, v93, v94, v95, v96);
    uint64_t v100 = objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v92, v98, (uint64_t)v97, v82, v99);

    if (objb == (id)3 && v55 == v83)
    {

LABEL_40:
      v181 = v55;
      goto LABEL_41;
    }
    int v105 = objc_msgSend_prevented(v100, v101, v102, v103, v104);

    unint64_t v31 = v449;
    unint64_t v30 = v452;
    if (v452 == v449 && (v105 & 1) == 0)
    {
      int v446 = v105;
      v448 = v55;
      goto LABEL_22;
    }
    if ((v105 & 1) == 0) {
      goto LABEL_34;
    }
LABEL_39:
    if (v105) {
      goto LABEL_40;
    }
    v181 = 0;
LABEL_41:
    id v182 = v181;
    uint64_t v186 = objc_msgSend__segmentsforType_(self, v183, 2, v184, v185);
    uint64_t v190 = objc_msgSend_indexesOfObjectsPassingTest_(v186, v187, (uint64_t)&unk_26C7FE8C8, v188, v189);
    uint64_t v194 = objc_msgSend_objectsAtIndexes_(v186, v191, v190, v192, v193);
    id obja = (id)v190;
    v458 = v186;
    v453 = v194;
    if (objc_msgSend_count(v194, v195, v196, v197, v198) == 1)
    {
      uint64_t v203 = objc_msgSend_firstObject(v194, v199, v200, v201, v202);
      objc_msgSend_name(v203, v204, v205, v206, v207);
      v209 = id v208 = v182;
      objc_msgSend_segment(v32, v210, v211, v212, v213);
      v214 = v55;
      uint64_t v216 = v215 = v32;
      id v221 = objc_msgSend_name(v216, v217, v218, v219, v220);
      int isEqualToString = objc_msgSend_isEqualToString_(v209, v222, (uint64_t)v221, v223, v224);

      uint64_t v32 = v215;
      uint64_t v55 = v214;

      id v182 = v208;
    }
    else
    {
      int isEqualToString = 0;
    }
    id v462 = v182;
    v442 = v32;
    uint64_t v225 = objc_msgSend_segment(v32, v199, v200, v201, v202);
    uint64_t v230 = objc_msgSend_name(v225, v226, v227, v228, v229);
    uint64_t v235 = objc_msgSend_segment(v182, v231, v232, v233, v234);
    uint64_t v240 = objc_msgSend_name(v235, v236, v237, v238, v239);
    int v244 = objc_msgSend_isEqualToString_(v230, v241, (uint64_t)v240, v242, v243);

    long long v245 = v182;
    uint64_t v32 = v442;
    if (!v244) {
      goto LABEL_70;
    }
    long long v250 = objc_msgSend_segment(v442, v246, v247, v248, v249);
    if (objc_msgSend_sliceable(v250, v251, v252, v253, v254))
    {
      uint64_t v259 = objc_msgSend_barsUsed(v442, v255, v256, v257, v258);
      uint64_t v264 = objc_msgSend_segment(v442, v260, v261, v262, v263);
      BOOL v269 = v259 != objc_msgSend_bars(v264, v265, v266, v267, v268);
    }
    else
    {
      BOOL v269 = 0;
    }

    uint64_t v274 = objc_msgSend_segment(v245, v270, v271, v272, v273);
    if (objc_msgSend_sliceable(v274, v275, v276, v277, v278))
    {
      uint64_t v283 = objc_msgSend_barsUsed(v245, v279, v280, v281, v282);
      v288 = objc_msgSend_segment(v245, v284, v285, v286, v287);
      uint64_t v293 = objc_msgSend_bars(v288, v289, v290, v291, v292);

      BOOL v294 = v283 != v293;
      if (v283 != v293 && v269)
      {
        uint64_t v296 = objc_msgSend_barsUsed(v442, v246, v247, v248, v249);
        uint64_t v301 = objc_msgSend_barsUsed(v245, v297, v298, v299, v300);
        uint64_t v306 = v442;
        BOOL v307 = v296 < v301;
        uint64_t v32 = v442;
        if (v307) {
          goto LABEL_69;
        }
        uint64_t v308 = objc_msgSend_barsUsed(v442, v302, v303, v304, v305);
        uint64_t v313 = objc_msgSend_barsUsed(v245, v309, v310, v311, v312);
        uint64_t v306 = v245;
        BOOL v307 = v308 <= v313;
        uint64_t v32 = v442;
        if (!v307) {
          goto LABEL_69;
        }
        goto LABEL_70;
      }
    }
    else
    {

      BOOL v294 = 0;
    }
    uint64_t v32 = v442;
    if (!v269 && !v294) {
      goto LABEL_70;
    }
    if (v269) {
      uint64_t v306 = v442;
    }
    else {
      uint64_t v306 = v245;
    }
    if (!v439) {
      uint64_t v306 = v442;
    }
    if (v269) {
      uint64_t v314 = v245;
    }
    else {
      uint64_t v314 = v442;
    }
    if (isEqualToString) {
      uint64_t v306 = v314;
    }
LABEL_69:
    id v177 = v306;
    if (!v177)
    {
LABEL_70:
      uint64_t v315 = objc_msgSend_segment(v32, v246, v247, v248, v249);
      uint64_t v320 = objc_msgSend_priority(v315, v316, v317, v318, v319);
      v325 = objc_msgSend_segment(v245, v321, v322, v323, v324);
      BOOL v307 = v320 <= objc_msgSend_priority(v325, v326, v327, v328, v329);
      uint64_t v32 = v442;
      if (v307) {
        uint64_t v330 = v442;
      }
      else {
        uint64_t v330 = v245;
      }
      id v177 = v330;
    }
    v331 = objc_msgSend_segment(v245, v246, v247, v248, v249);
    uint64_t v336 = objc_msgSend_type(v331, v332, v333, v334, v335);

    if (v336 != 3)
    {
      v341 = objc_msgSend_removedConflicts(v441, v337, v338, v339, v340);
      char v342 = NSString;
      unint64_t v347 = objc_msgSend_segment(v32, v343, v344, v345, v346);
      uint64_t v352 = objc_msgSend_name(v347, v348, v349, v350, v351);
      objc_msgSend_segment(v55, v353, v354, v355, v356);
      uint64_t v357 = v451 = v177;
      unint64_t v362 = objc_msgSend_name(v357, v358, v359, v360, v361);
      id v366 = objc_msgSend_stringWithFormat_(v342, v363, @"%@ -> %@", v364, v365, v352, v362);
      objc_msgSend_addObject_(v341, v367, (uint64_t)v366, v368, v369);

      long long v245 = v462;
      long long v370 = NSString;
      long long v375 = objc_msgSend_segment(v442, v371, v372, v373, v374);
      long long v380 = objc_msgSend_name(v375, v376, v377, v378, v379);
      long long v385 = objc_msgSend_segment(v55, v381, v382, v383, v384);
      long long v390 = objc_msgSend_name(v385, v386, v387, v388, v389);
      long long v394 = objc_msgSend_stringWithFormat_(v370, v391, @"%@ -> %@", v392, v393, v380, v390);
      objc_msgSend_addObject_(v440, v395, (uint64_t)v394, v396, v397);

      uint64_t v32 = v442;
      id v177 = v451;
    }
    if (v177)
    {
LABEL_77:
      objc_msgSend_addObject_(v444, v178, (uint64_t)v177, v179, v180);
    }
LABEL_79:
    uint64_t v21 = v444;
    if (objc_msgSend_count(v444, v25, v26, v27, v28))
    {
      long long v465 = 0u;
      long long v466 = 0u;
      long long v463 = 0u;
      long long v464 = 0u;
      id v402 = v444;
      uint64_t v404 = objc_msgSend_countByEnumeratingWithState_objects_count_(v402, v403, (uint64_t)&v463, (uint64_t)v471, 16);
      if (v404)
      {
        uint64_t v407 = v404;
        uint64_t v408 = *(void *)v464;
        do
        {
          for (uint64_t i = 0; i != v407; ++i)
          {
            if (*(void *)v464 != v408) {
              objc_enumerationMutation(v402);
            }
            v410 = *(void **)(*((void *)&v463 + 1) + 8 * i);
            objc_msgSend__removeSegmentInfo_fromAssemblyList_(self, v405, (uint64_t)v410, (uint64_t)v11, v406);
            v411 = NSNumber;
            v416 = objc_msgSend_segment(v410, v412, v413, v414, v415);
            v421 = objc_msgSend_nameIndex(v416, v417, v418, v419, v420);
            uint64_t v426 = objc_msgSend_integerValue(v421, v422, v423, v424, v425);
            v430 = objc_msgSend_numberWithInteger_(v411, v427, v426, v428, v429);
            objc_msgSend_addObject_(v12, v431, (uint64_t)v430, v432, v433);
          }
          uint64_t v407 = objc_msgSend_countByEnumeratingWithState_objects_count_(v402, v405, (uint64_t)&v463, (uint64_t)v471, 16);
        }
        while (v407);
      }

      objc_msgSend_removeAllObjects(v402, v434, v435, v436, v437);
      BOOL v23 = 0;
      uint64_t v21 = v444;
    }
    else
    {
      BOOL v23 = objc_msgSend_count(v444, v398, v399, v400, v401) == 0;
    }
    int v22 = v445 + 1;
  }
  while (v445 != 100);
  objc_msgSend_addObject_(v440, v17, @"-", v19, v20);

  return v443;
}

- (BOOL)_addBodySegmentsForAssemblyList:(id)a3 forDuration:(int64_t)a4 unusedDuration:(int64_t *)a5 testingContext:(id)a6 timedOut:(BOOL *)a7
{
  uint64_t v433 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  uint64_t v15 = objc_msgSend__segmentsforType_(self, v12, 2, v13, v14);
  uint64_t v388 = objc_msgSend_sortedArrayUsingComparator_(v15, v16, (uint64_t)&unk_26C7FE8E8, v17, v18);
  char updated = objc_msgSend_count(v388, v19, v20, v21, v22) != 0;
  uint64_t v414 = self;
  uint64_t v26 = objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v23, (uint64_t)v15, v24, v25);
  uint64_t v387 = objc_msgSend_firstObject(v26, v27, v28, v29, v30);

  objc_msgSend_indexesOfObjectsPassingTest_(v15, v31, (uint64_t)&unk_26C7FE908, v32, v33);
  uint64_t v383 = v397 = v15;
  objc_msgSend_objectsAtIndexes_(v15, v34, (uint64_t)v383, v35, v36);
  long long v426 = 0u;
  long long v427 = 0u;
  long long v428 = 0u;
  long long v429 = 0u;
  id v37 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v426, (uint64_t)v432, 16);
  id obj = v37;
  if (v39)
  {
    uint64_t v44 = v39;
    id v45 = v11;
    uint64_t v46 = *(void *)v427;
    uint64_t v47 = -1;
    do
    {
      for (uint64_t i = 0; i != v44; ++i)
      {
        if (*(void *)v427 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = *(void **)(*((void *)&v426 + 1) + 8 * i);
        if (objc_msgSend_bars(v49, v40, v41, v42, v43) >= 2)
        {
          uint64_t v50 = 0;
          do
          {
            uint64_t v51 = objc_msgSend_barDurationForBarIndex_(v49, v40, v50, v42, v43);
            if (v51 < v47 || v47 == -1) {
              uint64_t v47 = v51;
            }
            ++v50;
          }
          while (objc_msgSend_bars(v49, v52, v53, v54, v55) - 1 > v50);
        }
      }
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v426, (uint64_t)v432, 16);
    }
    while (v44);

    id v11 = v45;
    if (v47 != -1 && v47 < objc_msgSend_sampleCount(v387, v57, v58, v59, v60)) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v47 = objc_msgSend_sampleCount(v387, v57, v58, v59, v60);
LABEL_21:
  *a7 = 0;
  uint64_t v61 = objc_msgSend_array(MEMORY[0x263EFF980], v57, v58, v59, v60);
  uint64_t v66 = objc_msgSend_array(MEMORY[0x263EFF980], v62, v63, v64, v65);
  unint64_t v389 = 0;
  unsigned int v71 = 0;
  long long v395 = (void *)v66;
  int64_t v386 = a4 + 1;
  int64_t v72 = a4;
  int64_t v399 = a4;
  uint64_t v73 = v414;
  uint64_t v413 = v61;
  uint64_t v410 = (uint64_t)v11;
  do
  {
    unsigned int v391 = v71;
    if ((updated & 1) == 0 || v47 > v72) {
      goto LABEL_147;
    }
    int64_t v411 = v72;
    context = (void *)MEMORY[0x21D453880]();
    if (objc_msgSend_count(v395, v74, v75, v76, v77))
    {
      uint64_t v82 = objc_msgSend_arrayWithArray_(MEMORY[0x263EFF8C0], v78, (uint64_t)v395, v80, v81);
      objc_msgSend_addObject_(v61, v83, (uint64_t)v82, v84, v85);
    }
    objc_msgSend_removeAllObjects(v395, v78, v79, v80, v81);
    uint64_t v90 = objc_msgSend_lastObject(v61, v86, v87, v88, v89);
    uint64_t v95 = objc_msgSend_count(v61, v91, v92, v93, v94);
    uint64_t v99 = v95 - 2;
    uint64_t v396 = (void *)v90;
    if (v95 - 2 < 0) {
      goto LABEL_42;
    }
    uint64_t v100 = v95 - 1;
    while (1)
    {
      uint64_t v101 = objc_msgSend_objectAtIndexedSubscript_(v61, v96, v99, v97, v98);
      if (objc_msgSend_isEqualToArray_(v101, v102, v90, v103, v104)) {
        break;
      }
LABEL_37:

      --v100;
      BOOL v228 = v99-- <= 0;
      if (v228) {
        goto LABEL_41;
      }
    }
    uint64_t v109 = objc_msgSend_array(MEMORY[0x263EFF980], v105, v106, v107, v108);
    for (unint64_t j = objc_msgSend_count(v61, v110, v111, v112, v113) - 1; j > v99; --j)
    {
      uint64_t v119 = objc_msgSend_objectAtIndexedSubscript_(v61, v114, j, v116, v117);
      objc_msgSend_addObject_(v109, v120, (uint64_t)v119, v121, v122);
    }
    uint64_t v127 = v99 - objc_msgSend_count(v109, v114, v115, v116, v117) + 1;
    if (v127 < 0) {
      goto LABEL_36;
    }
    uint64_t v131 = objc_msgSend_array(MEMORY[0x263EFF980], v123, v124, v125, v126);
    uint64_t v132 = v100;
    if (v99 >= v127)
    {
      do
      {
        uint64_t v133 = objc_msgSend_objectAtIndexedSubscript_(v61, v128, --v132, v129, v130);
        objc_msgSend_addObject_(v131, v134, (uint64_t)v133, v135, v136);

        uint64_t v61 = v413;
      }
      while (v132 > v127);
    }
    char isEqualToArray = objc_msgSend_isEqualToArray_(v131, v128, (uint64_t)v109, v129, v130);

    if ((isEqualToArray & 1) == 0)
    {
LABEL_36:

      id v11 = (id)v410;
      uint64_t v90 = (uint64_t)v396;
      goto LABEL_37;
    }
    ++v389;

    id v11 = (id)v410;
LABEL_41:
    a4 = v399;
    uint64_t v73 = v414;
LABEL_42:
    long long v424 = 0u;
    long long v425 = 0u;
    long long v422 = 0u;
    long long v423 = 0u;
    id v138 = v388;
    int64_t v72 = v411;
    uint64_t v407 = objc_msgSend_countByEnumeratingWithState_objects_count_(v138, v139, (uint64_t)&v422, (uint64_t)v431, 16);
    if (!v407)
    {
      char v394 = 0;
      char updated = 1;
      goto LABEL_143;
    }
    char v394 = 0;
    uint64_t v402 = *(void *)v423;
    char updated = 1;
    id v400 = v138;
    while (2)
    {
      uint64_t v144 = 0;
      while (2)
      {
        uint64_t v145 = v72;
        if (*(void *)v423 != v402) {
          objc_enumerationMutation(v138);
        }
        uint64_t v412 = v144;
        uint64_t v146 = *(void **)(*((void *)&v422 + 1) + 8 * v144);
        uint64_t v147 = objc_msgSend_sampleCount(v146, v140, v141, v142, v143);
        uint64_t v152 = objc_msgSend_name(v146, v148, v149, v150, v151);
        int v156 = objc_msgSend_containsString_(v152, v153, @"drm_", v154, v155);

        if (!v156)
        {
          int isEqualToString = 1;
          uint64_t v73 = v414;
          goto LABEL_60;
        }
        uint64_t v161 = objc_msgSend_lastObject(v10, v157, v158, v159, v160);
        objc_msgSend_lastObject(v397, v162, v163, v164, v165);
        id v408 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v397, v166, v167, v168, v169);
        v405 = v403 = v161;
        uint64_t v174 = objc_msgSend_segment(v161, v170, v171, v172, v173);
        uint64_t v179 = objc_msgSend_nameSuffix(v174, v175, v176, v177, v178);
        uint64_t v184 = objc_msgSend_nameSuffix(v146, v180, v181, v182, v183);
        int isEqualToString = 1;
        uint64_t v188 = objc_msgSend_compare_options_(v179, v186, (uint64_t)v184, 1, v187);

        if (v188 == -1)
        {
          a4 = v399;
          id v138 = v400;
          uint64_t v73 = v414;
LABEL_58:
          uint64_t v197 = v403;
          goto LABEL_59;
        }
        a4 = v399;
        id v138 = v400;
        uint64_t v73 = v414;
        if (!objc_msgSend_count(v10, v189, v190, v191, v192)) {
          goto LABEL_56;
        }
        if (!v188)
        {
          int isEqualToString = 0;
          goto LABEL_58;
        }
        if (v188 != 1)
        {
LABEL_56:
          int isEqualToString = 1;
          goto LABEL_58;
        }
        uint64_t v197 = v403;
        uint64_t v393 = objc_msgSend_segment(v403, v193, v194, v195, v196);
        uint64_t v202 = objc_msgSend_name(v393, v198, v199, v200, v201);
        objc_msgSend_name(v408, v203, v204, v205, v206);
        v207 = uint64_t v392 = v202;
        if (objc_msgSend_isEqualToString_(v202, v208, (uint64_t)v207, v209, v210))
        {
          v215 = objc_msgSend_name(v146, v211, v212, v213, v214);
          uint64_t v220 = objc_msgSend_name(v405, v216, v217, v218, v219);
          int isEqualToString = objc_msgSend_isEqualToString_(v215, v221, (uint64_t)v220, v222, v223);

          uint64_t v197 = v403;
          uint64_t v73 = v414;
        }
        else
        {
          int isEqualToString = 0;
        }

        a4 = v399;
LABEL_59:

LABEL_60:
        if (v147 <= v145 && isEqualToString != 0)
        {
          uint64_t v231 = objc_msgSend_sampleCount(v146, v157, v158, v159, v160);
          goto LABEL_71;
        }
        int64_t v72 = v145;
        BOOL v228 = (objc_msgSend_sliceable(v146, v157, v158, v159, v160) & isEqualToString) != 1 || v145 < 1;
        if (v228)
        {
          uint64_t v229 = 0;
          uint64_t v61 = v413;
          goto LABEL_93;
        }
        uint64_t v288 = objc_msgSend_bars(v146, v230, v225, v226, v227);
        if (v288 < 1)
        {
          uint64_t v293 = 0;
          char v292 = 1;
        }
        else
        {
          uint64_t v231 = 0;
          uint64_t v291 = 0;
          char v292 = 1;
          do
          {
            uint64_t v293 = v231;
            v231 += objc_msgSend_barDurationForBarIndex_(v146, v230, v291, v289, v290);
            if (v231 > v145) {
              break;
            }
            if (v231 >= v145)
            {
              uint64_t v73 = v414;
              goto LABEL_71;
            }
            ++v291;
            char v292 = 0;
            uint64_t v293 = v231;
          }
          while (objc_msgSend_bars(v146, v230, v294, v295, v296) > v291);
        }
        uint64_t v231 = v293;
        uint64_t v73 = v414;
        if ((v292 & 1) == 0)
        {
LABEL_71:
          id v420 = 0;
          uint64_t v421 = 0x7FFFFFFFFFFFFFFFLL;
          int v232 = objc_msgSend__addSegment_withDuration_toAssemblyList_timeRemaining_reusedSegment_indexofNewSegment_(v73, v230, (uint64_t)v146, v231, (uint64_t)v10, v145, &v420, &v421);
          id v233 = v420;
          if (v232)
          {
            id v409 = v233;
            uint64_t v229 = objc_msgSend_objectAtIndex_(v10, v234, v421, v235, v236);
            v419[0] = MEMORY[0x263EF8330];
            v419[1] = 3221225472;
            v419[2] = sub_217A5224C;
            v419[3] = &unk_2642B78A0;
            v419[4] = v146;
            unint64_t v240 = objc_msgSend_indexOfObjectPassingTest_(v138, v237, (uint64_t)v419, v238, v239);
            if (v240 == 0x7FFFFFFFFFFFFFFFLL)
            {

              char updated = 0;
              uint64_t v61 = v413;
              id v11 = (id)v410;
              int64_t v72 = v145;
LABEL_142:

              goto LABEL_143;
            }
            unint64_t v245 = v240;
            if (v240 < objc_msgSend_count(v138, v241, v242, v243, v244) - 1) {
              objc_msgSend_objectAtIndexedSubscript_(v138, v246, v245 + 1, v247, v248);
            }
            else {
            uint64_t v249 = objc_msgSend_objectAtIndexedSubscript_(v138, v246, 0, v247, v248);
            }
            uint64_t v254 = v145 - objc_msgSend_sampleCount(v146, v250, v251, v252, v253);
            uint64_t v406 = v249;
            if (v254 <= objc_msgSend_sampleCount(v249, v255, v256, v257, v258))
            {
              uint64_t v259 = objc_opt_new();
              int v261 = objc_msgSend__removeUnpermittedTransitionsInAssemblyList_final_testingContext_removedIndexes_conflictList_(v73, v260, (uint64_t)v10, 0, v410, v259, v395);
              if (objc_msgSend_count(v259, v262, v263, v264, v265))
              {
                uint64_t v270 = objc_msgSend_allObjects(v259, v266, v267, v268, v269);
                objc_msgSend__sequenceBodySegmentList_forIndexes_(v73, v271, (uint64_t)v10, (uint64_t)v270, v272);
              }
              if (objc_msgSend_indexOfObject_(v10, v266, (uint64_t)v229, v268, v269) == 0x7FFFFFFFFFFFFFFFLL)
              {
                uint64_t v277 = objc_msgSend_indexSet(MEMORY[0x263F089C8], v273, v274, v275, v276);
                objc_msgSend__updateTransitionBodySegmentsForAssemblyList_usingNewSegment_indexOfNewTransitionSegment_(v73, v278, (uint64_t)v10, 0, (uint64_t)v277);
                uint64_t v282 = objc_msgSend__sampleDurationOfClipPlaylist_(v73, v279, (uint64_t)v10, v280, v281);
                uint64_t v404 = v259;
                if (a4 - v282 < 0)
                {
                  v341 = objc_msgSend_indexSet(MEMORY[0x263F089C8], v283, v284, v285, v286);
                  uint64_t Index = objc_msgSend_firstIndex(v277, v342, v343, v344, v345);
                  uint64_t v287 = v406;
                  if (Index != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    for (uint64_t k = Index;
                          k != 0x7FFFFFFFFFFFFFFFLL;
                          uint64_t k = objc_msgSend_indexGreaterThanIndex_(v277, v352, k, v353, v354))
                    {
                      if (k + 1 <= (unint64_t)(objc_msgSend_count(v10, v347, v348, v349, v350) - 1)) {
                        objc_msgSend_addIndex_(v341, v352, k + 1, v353, v354);
                      }
                    }
                  }
                  objc_msgSend_addIndexes_(v341, v347, (uint64_t)v277, v349, v350);
                  objc_msgSend_removeObjectsAtIndexes_(v10, v355, (uint64_t)v341, v356, v357);
                  uint64_t v73 = v414;
                  int64_t v72 = a4 - objc_msgSend__sampleDurationOfClipPlaylist_(v414, v358, (uint64_t)v10, v359, v360);
                }
                else
                {
                  int64_t v72 = a4 - v282;
                  uint64_t v287 = v406;
                }

                uint64_t v61 = v413;
                id v11 = (id)v410;
                id v138 = v400;
                goto LABEL_128;
              }

              if (!v261)
              {
                uint64_t v61 = v413;
                id v11 = (id)v410;
                id v138 = v400;
                int64_t v72 = v145;
                uint64_t v287 = v406;
                goto LABEL_129;
              }
            }
            uint64_t v404 = objc_opt_new();
            if (objc_msgSend__updateTransitionBodySegmentsForAssemblyList_usingNewSegment_indexOfNewTransitionSegment_(v73, v297, (uint64_t)v10, (uint64_t)v146, (uint64_t)v404))
            {
              int64_t v305 = a4 - objc_msgSend__sampleDurationOfClipPlaylist_(v73, v298, (uint64_t)v10, v299, v300);
              id v11 = (id)v410;
              id v138 = v400;
              if (v305 >= 0)
              {
                uint64_t v61 = v413;
LABEL_98:
                a4 = v399;
                int64_t v72 = v399 - objc_msgSend__sampleDurationOfClipPlaylist_(v73, v301, (uint64_t)v10, v303, v304);
                char v394 = 1;
                char updated = 1;
                goto LABEL_100;
              }
              int64_t v72 = v145;
              if (objc_msgSend_sliceable(v146, v301, v302, v303, v304)
                && objc_msgSend_barsUsed(v229, v306, v307, v308, v309) >= 2)
              {
                uint64_t v310 = objc_msgSend_barsUsed(v229, v306, v307, v308, v309);
                while (1)
                {
                  BOOL v228 = v310-- <= 1;
                  if (v228) {
                    break;
                  }
                  uint64_t v311 = 0;
                  uint64_t v312 = 0;
                  do
                  {
                    uint64_t v313 = objc_msgSend_segment(v229, v306, v307, v308, v309);
                    v312 += objc_msgSend_barDurationForBarIndex_(v313, v314, v311, v315, v316);

                    ++v311;
                  }
                  while (v310 != v311);
                  uint64_t v73 = v414;
                  int64_t v72 = v145;
                  if (v305 - v312 + objc_msgSend_duration(v229, v306, v307, v308, v309) >= 1)
                  {
                    objc_msgSend_setBarsUsed_(v229, v306, v310, v308, v309);
                    objc_msgSend_setDuration_(v229, v317, v312, v318, v319);
                    uint64_t v47 = v386 - objc_msgSend__sampleDurationOfClipPlaylist_(v414, v320, (uint64_t)v10, v321, v322);
                    uint64_t v61 = v413;
                    id v11 = (id)v410;
                    goto LABEL_98;
                  }
                }
              }
              a4 = v399;
              if (objc_msgSend_count(v404, v306, v307, v308, v309))
              {
                unint64_t v326 = objc_msgSend_objectsAtIndexes_(v10, v323, (uint64_t)v404, v324, v325);
                objc_msgSend__removeSegmentInfo_fromAssemblyList_(v73, v327, (uint64_t)v229, (uint64_t)v10, v328);
                long long v417 = 0u;
                long long v418 = 0u;
                long long v415 = 0u;
                long long v416 = 0u;
                id v329 = v326;
                uint64_t v331 = objc_msgSend_countByEnumeratingWithState_objects_count_(v329, v330, (uint64_t)&v415, (uint64_t)v430, 16);
                uint64_t v287 = v406;
                if (v331)
                {
                  uint64_t v334 = v331;
                  uint64_t v335 = *(void *)v416;
                  do
                  {
                    for (uint64_t m = 0; m != v334; ++m)
                    {
                      if (*(void *)v416 != v335) {
                        objc_enumerationMutation(v329);
                      }
                      objc_msgSend__removeSegmentInfo_fromAssemblyList_(v414, v332, *(void *)(*((void *)&v415 + 1) + 8 * m), (uint64_t)v10, v333);
                    }
                    uint64_t v334 = objc_msgSend_countByEnumeratingWithState_objects_count_(v329, v332, (uint64_t)&v415, (uint64_t)v430, 16);
                  }
                  while (v334);
                }

                uint64_t v73 = v414;
                objc_msgSend__updateTransitionBodySegmentsForAssemblyList_usingNewSegment_indexOfNewTransitionSegment_(v414, v337, (uint64_t)v10, 0, 0);
                int64_t v72 = v399 - objc_msgSend__sampleDurationOfClipPlaylist_(v414, v338, (uint64_t)v10, v339, v340);

                uint64_t v61 = v413;
                id v11 = (id)v410;
LABEL_128:

LABEL_129:
                id v233 = v409;
LABEL_130:

                goto LABEL_131;
              }
              objc_msgSend__removeSegmentInfo_fromAssemblyList_(v73, v323, (uint64_t)v229, (uint64_t)v10, v325);
              uint64_t v61 = v413;
              id v11 = (id)v410;
            }
            else
            {
              uint64_t v61 = v413;
              id v11 = (id)v410;
              id v138 = v400;
              int64_t v72 = v145;
            }
LABEL_100:
            uint64_t v287 = v406;
            goto LABEL_128;
          }
          uint64_t v229 = 0;
          uint64_t v61 = v413;
          int64_t v72 = v145;
          id v11 = (id)v410;
          goto LABEL_130;
        }
        uint64_t v229 = 0;
        uint64_t v61 = v413;
        int64_t v72 = v145;
LABEL_93:
        id v11 = (id)v410;
LABEL_131:
        if (v72 < v47)
        {
          objc_msgSend__removeUnpermittedTransitionsInAssemblyList_final_testingContext_removedIndexes_(v73, v230, (uint64_t)v10, 1, (uint64_t)v11, 0);
          char updated = objc_msgSend__updateTransitionBodySegmentsForAssemblyList_usingNewSegment_indexOfNewTransitionSegment_(v73, v361, (uint64_t)v10, 0, 0);
          int64_t v72 = a4 - objc_msgSend__sampleDurationOfClipPlaylist_(v73, v362, (uint64_t)v10, v363, v364);
          if (v72 < 0)
          {
            objc_msgSend__removeSegmentInfo_fromAssemblyList_(v73, v365, (uint64_t)v229, (uint64_t)v10, v366);
            objc_msgSend__updateTransitionBodySegmentsForAssemblyList_usingNewSegment_indexOfNewTransitionSegment_(v73, v367, (uint64_t)v10, 0, 0);
            objc_msgSend__removeUnpermittedTransitionsInAssemblyList_final_testingContext_removedIndexes_(v73, v368, (uint64_t)v10, 1, (uint64_t)v11, 0);
            int64_t v72 = a4 - objc_msgSend__sampleDurationOfClipPlaylist_(v73, v369, (uint64_t)v10, v370, v371);
          }
          if (v72 < v47) {
            goto LABEL_142;
          }
        }

        uint64_t v144 = v412 + 1;
        if (v412 + 1 != v407) {
          continue;
        }
        break;
      }
      uint64_t v372 = objc_msgSend_countByEnumeratingWithState_objects_count_(v138, v140, (uint64_t)&v422, (uint64_t)v431, 16);
      uint64_t v407 = v372;
      if (v372) {
        continue;
      }
      break;
    }
LABEL_143:

    if (v389 > 1) {
      break;
    }
    unsigned int v71 = v391 + 1;
  }
  while ((v394 & 1) != 0);
  if (v389 >= 2)
  {
    *a7 = 1;
    objc_msgSend__removeUnpermittedTransitionsInAssemblyList_final_testingContext_removedIndexes_(v73, v67, (uint64_t)v10, 1, (uint64_t)v11, 0);
    objc_msgSend__updateTransitionBodySegmentsForAssemblyList_usingNewSegment_indexOfNewTransitionSegment_(v73, v373, (uint64_t)v10, 0, 0);
  }
LABEL_147:
  if (objc_msgSend_maxPassesToFit(v11, v67, v68, v69, v70) >= v391) {
    uint64_t v378 = objc_msgSend_maxPassesToFit(v11, v374, v375, v376, v377);
  }
  else {
    uint64_t v378 = v391;
  }
  objc_msgSend_setMaxPassesToFit_(v11, v374, v378, v376, v377);
  *a5 = a4 - objc_msgSend__sampleDurationOfClipPlaylist_(v73, v379, (uint64_t)v10, v380, v381);

  return updated & 1;
}

- (BOOL)_addIntroSegmentsToAssemblyList:(id)a3 forDuration:(int64_t)a4 testingContext:(id)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v11 = objc_msgSend__segmentsforType_(self, v8, 1, v9, v10);
  objc_msgSend_sortedArrayUsingComparator_(v11, v12, (uint64_t)&unk_26C7FE928, v13, v14);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v43, (uint64_t)v47, 16);
  if (v17)
  {
    uint64_t v22 = v17;
    uint64_t v41 = v11;
    uint64_t v23 = *(void *)v44;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v15);
        }
        uint64_t v25 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        if (objc_msgSend_sampleCount(v25, v18, v19, v20, v21) <= a4)
        {
          uint64_t v26 = objc_msgSend_firstObject(v7, v18, v19, v20, v21);
          unint64_t v31 = objc_msgSend_segment(v26, v27, v28, v29, v30);

          if (!v31
            || (objc_msgSend_canTransitionFromSegment_toSegment_fromBarIndex_checkIfPrevented_(FlexSegment, v32, (uint64_t)v25, (uint64_t)v31, 0, 1) & 1) != 0)
          {
            id v33 = v25;

            if (v33)
            {
              uint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
              uint64_t v38 = objc_msgSend_sampleCount(v33, v34, v35, v36, v37);
              objc_msgSend__addSegment_withDuration_toAssemblyList_indexOfNewSegment_(self, v39, (uint64_t)v33, v38, (uint64_t)v7, &v42);
            }
            goto LABEL_15;
          }
        }
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v43, (uint64_t)v47, 16);
      if (v22) {
        continue;
      }
      break;
    }

    id v33 = 0;
LABEL_15:
    id v11 = v41;
  }
  else
  {

    id v33 = 0;
  }

  return 1;
}

- (BOOL)_addOutroSegmentsToAssemblyList:(id)a3 forDuration:(int64_t)a4 allowTrim:(BOOL)a5 testingContext:(id)a6
{
  BOOL v100 = a5;
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v101 = a6;
  uint64_t v13 = objc_msgSend__segmentsforType_(self, v10, 4, v11, v12);
  if (objc_msgSend_count(v13, v14, v15, v16, v17))
  {
    if (objc_msgSend_count(v13, v18, v19, v20, v21) == 1)
    {
      uint64_t v26 = objc_msgSend_firstObject(v13, v22, v23, v24, v25);
      unint64_t v31 = v26;
      if (v100 || objc_msgSend_sampleCount(v26, v27, v28, v29, v30) <= a4)
      {
        objc_msgSend_lastObject(v13, v27, v28, v29, v30);
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        int v33 = 1;
      }
      else
      {
        id v32 = 0;
        int v33 = 0;
      }
    }
    else
    {
      if (objc_msgSend_count(v9, v22, v23, v24, v25))
      {
        v111[0] = 0;
        v111[1] = v111;
        v111[2] = 0x3032000000;
        v111[3] = sub_217A4E590;
        v111[4] = sub_217A4E5A0;
        objc_msgSend_lastObject(v9, v35, v36, v37, v38);
        id v112 = (id)objc_claimAutoreleasedReturnValue();
        v110[0] = MEMORY[0x263EF8330];
        v110[1] = 3221225472;
        v110[2] = sub_217A529F0;
        v110[3] = &unk_2642B77E8;
        v110[4] = v111;
        uint64_t v42 = objc_msgSend_indexesOfObjectsPassingTest_(v13, v39, (uint64_t)v110, v40, v41);
        long long v46 = objc_msgSend_objectsAtIndexes_(v13, v43, v42, v44, v45);
        uint64_t v99 = (void *)v42;
        if (objc_msgSend_count(v46, v47, v48, v49, v50) == 1)
        {
          objc_msgSend_firstObject(v46, v51, v52, v53, v54);
          id v32 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v98 = v46;
          objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v51, (uint64_t)v46, v53, v54);
          long long v108 = 0u;
          long long v109 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          id v79 = (id)objc_claimAutoreleasedReturnValue();
          id v32 = 0;
          uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v80, (uint64_t)&v106, (uint64_t)v114, 16);
          if (v85)
          {
            uint64_t v86 = *(void *)v107;
            while (2)
            {
              uint64_t v87 = 0;
              uint64_t v88 = v32;
              do
              {
                if (*(void *)v107 != v86) {
                  objc_enumerationMutation(v79);
                }
                uint64_t v89 = *(void **)(*((void *)&v106 + 1) + 8 * v87);
                if (objc_msgSend_sampleCount(v89, v81, v82, v83, v84) > a4)
                {
                  if (!v100 || v88 && objc_msgSend_sampleCount(v88, v90, v91, v92, v93) >= a4)
                  {
                    id v32 = v88;
                  }
                  else
                  {
                    id v32 = v89;
                  }
                  goto LABEL_41;
                }
                id v32 = v89;

                ++v87;
                uint64_t v88 = v32;
              }
              while (v85 != v87);
              uint64_t v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(v79, v81, (uint64_t)&v106, (uint64_t)v114, 16);
              if (v85) {
                continue;
              }
              break;
            }
          }
LABEL_41:

          long long v46 = v98;
        }

        _Block_object_dispose(v111, 8);
      }
      else
      {
        uint64_t v59 = objc_msgSend__segmentsforType_(self, v35, 4, v37, v38);
        uint64_t v63 = objc_msgSend__sortFlexSegmentsShortestToLongest_(self, v60, (uint64_t)v59, v61, v62);

        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        id v64 = v63;
        id v32 = 0;
        uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v65, (uint64_t)&v102, (uint64_t)v113, 16);
        if (v70)
        {
          uint64_t v71 = *(void *)v103;
          while (2)
          {
            uint64_t v72 = 0;
            uint64_t v73 = v32;
            do
            {
              if (*(void *)v103 != v71) {
                objc_enumerationMutation(v64);
              }
              uint64_t v74 = *(void **)(*((void *)&v102 + 1) + 8 * v72);
              if (objc_msgSend_sampleCount(v74, v66, v67, v68, v69) > a4)
              {
                if (!v100 || v73 && objc_msgSend_sampleCount(v73, v75, v76, v77, v78) >= a4)
                {
                  id v32 = v73;
                }
                else
                {
                  id v32 = v74;
                }
                goto LABEL_39;
              }
              id v32 = v74;

              ++v72;
              uint64_t v73 = v32;
            }
            while (v70 != v72);
            uint64_t v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v64, v66, (uint64_t)&v102, (uint64_t)v113, 16);
            if (v70) {
              continue;
            }
            break;
          }
        }
LABEL_39:
      }
      int v33 = 1;
    }
    BOOL v34 = v32 != 0;
    if (v33 && v32)
    {
      int64_t v94 = objc_msgSend_sampleCount(v32, v55, v56, v57, v58);
      if (v94 >= a4) {
        int64_t v96 = a4;
      }
      else {
        int64_t v96 = v94;
      }
      v111[0] = 0x7FFFFFFFFFFFFFFFLL;
      LOBYTE(v33) = objc_msgSend__addSegment_withDuration_toAssemblyList_indexOfNewSegment_(self, v95, (uint64_t)v32, v96, (uint64_t)v9, v111);
      BOOL v34 = 1;
    }
  }
  else
  {
    BOOL v34 = 0;
    id v32 = 0;
    LOBYTE(v33) = 0;
  }

  return v34 & v33;
}

- (BOOL)_rebuildBodySegmentsInAssemblyList:(id)a3 forDuration:(int64_t)a4 unusedDuration:(int64_t *)a5 testingContext:(id)a6
{
  id v10 = a6;
  id v11 = a3;
  objc_msgSend_removeAllObjects(v11, v12, v13, v14, v15);
  char v18 = 0;
  LOBYTE(a5) = objc_msgSend__addBodySegmentsForAssemblyList_forDuration_unusedDuration_testingContext_timedOut_(self, v16, (uint64_t)v11, a4, (uint64_t)a5, v10, &v18);

  return (char)a5;
}

- (BOOL)_buildIntroAndOutroOnlySegmentAssemblyList:(id)a3 forDuration:(int64_t)a4 testingContext:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  char v14 = 0;
  if (objc_msgSend__addOutroSegmentsToAssemblyList_forDuration_allowTrim_testingContext_(self, v10, (uint64_t)v8, a4, 0, v9))
  {
    uint64_t v15 = objc_msgSend__sampleDurationOfClipPlaylist_(self, v11, (uint64_t)v8, v12, v13);
    char v14 = objc_msgSend__addIntroSegmentsToAssemblyList_forDuration_testingContext_(self, v16, (uint64_t)v8, a4 - v15, (uint64_t)v9);
  }

  return v14;
}

+ (int64_t)_findMaxLengthInSamplesToReserveForOutroSegment:(id)a3 withOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v10 = objc_msgSend_objectForKey_(v6, v7, @"OutroCanBeShortened", v8, v9);
  int v15 = objc_msgSend_BOOLValue(v10, v11, v12, v13, v14);

  if (v15)
  {
    uint64_t v19 = objc_msgSend_objectForKey_(v6, v16, @"MaxOutroLengthToReserve", v17, v18);
    uint64_t v24 = v19;
    if (v19 && (objc_msgSend_floatValue(v19, v20, v21, v22, v23), v29 >= 0.0)) {
      int64_t v30 = (uint64_t)(float)(v29 * (float)objc_msgSend_sampleRate(v5, v25, v26, v27, v28));
    }
    else {
      int64_t v30 = 0;
    }
  }
  else
  {
    int64_t v30 = 0;
  }

  return v30;
}

+ (int64_t)_findMinLengthInSamplesForEarlyFadeOutForOutroSegment:(id)a3 withOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int64_t v11 = objc_msgSend_sampleRate(v5, v7, v8, v9, v10);
  int v15 = objc_msgSend_objectForKey_(v6, v12, @"MinLengthForEarlyFade", v13, v14);

  if (v15)
  {
    objc_msgSend_floatValue(v15, v16, v17, v18, v19);
    if (v24 > 0.0) {
      int64_t v11 = (uint64_t)(float)(v24 * (float)objc_msgSend_sampleRate(v5, v20, v21, v22, v23));
    }
  }

  return v11;
}

+ (int64_t)_findEarlyFadeStartOffsetInSamplesForOutroSegment:(id)a3 withOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_objectForKey_(v6, v7, @"IgnoreEarlyFadeMarker", v8, v9);
  char v15 = objc_msgSend_BOOLValue(v10, v11, v12, v13, v14);

  if ((v15 & 1) == 0)
  {
    uint64_t v20 = objc_msgSend_markers(v5, v16, v17, v18, v19);
    float v24 = objc_msgSend_objectForKey_(v20, v21, @"OUTRO_EARLY_FADE", v22, v23);

    if (v24)
    {
      uint64_t v29 = objc_msgSend_integerValue(v24, v25, v26, v27, v28);
      if ((v29 & 0x8000000000000000) == 0)
      {
        int64_t v34 = v29;
        if (v29 < objc_msgSend_sampleCount(v5, v30, v31, v32, v33)) {
          goto LABEL_22;
        }
      }
    }
  }
  uint64_t v35 = objc_msgSend_objectForKey_(v6, v16, @"IgnoreStingerMarkerForShortening", v18, v19);
  char v40 = objc_msgSend_BOOLValue(v35, v36, v37, v38, v39);

  if (v40)
  {
    uint64_t v45 = 0;
  }
  else
  {
    long long v46 = objc_msgSend_markers(v5, v41, v42, v43, v44);
    uint64_t v50 = objc_msgSend_objectForKey_(v46, v47, @"OUTRO_STINGER", v48, v49);

    if (!v50 || (uint64_t v55 = objc_msgSend_integerValue(v50, v51, v52, v53, v54), v55 < 0))
    {
      uint64_t v45 = 0;
    }
    else
    {
      uint64_t v45 = v55;
      if (v55 >= objc_msgSend_sampleCount(v5, v56, v57, v58, v59)) {
        uint64_t v45 = 0;
      }
    }
  }
  uint64_t v60 = objc_msgSend_sampleRate(v5, v41, v42, v43, v44);
  if (v60 >= 0) {
    uint64_t v64 = v60;
  }
  else {
    uint64_t v64 = v60 + 1;
  }
  uint64_t v65 = v64 >> 1;
  uint64_t v66 = objc_msgSend_objectForKey_(v6, v61, @"DefaultEarlyFadeStartFromStinger", v62, v63);
  float v24 = v66;
  if (v66)
  {
    objc_msgSend_floatValue(v66, v67, v68, v69, v70);
    if (v75 >= 0.0) {
      uint64_t v65 = (uint64_t)(float)(v75 * (float)objc_msgSend_sampleRate(v5, v71, v72, v73, v74));
    }
  }
  int64_t v34 = v65 + v45;
LABEL_22:

  return v34;
}

+ (int64_t)_durationInSamplesToReserveForOutroSegment:(id)a3 withOptions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int64_t v11 = objc_msgSend_sampleCount(v5, v7, v8, v9, v10);
  char v15 = objc_msgSend_objectForKey_(v6, v12, @"OutroCanBeShortened", v13, v14);
  int v20 = objc_msgSend_BOOLValue(v15, v16, v17, v18, v19);

  if (v20)
  {
    uint64_t MaxLengthInSamplesToReserveForOutroSegment_withOptions = objc_msgSend__findMaxLengthInSamplesToReserveForOutroSegment_withOptions_(FlexSong, v21, (uint64_t)v5, (uint64_t)v6, v22);
    if (v11 >= MaxLengthInSamplesToReserveForOutroSegment_withOptions) {
      int64_t v26 = MaxLengthInSamplesToReserveForOutroSegment_withOptions;
    }
    else {
      int64_t v26 = v11;
    }
    if (MaxLengthInSamplesToReserveForOutroSegment_withOptions <= 0)
    {
      uint64_t EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions = objc_msgSend__findEarlyFadeStartOffsetInSamplesForOutroSegment_withOptions_(FlexSong, v24, (uint64_t)v5, (uint64_t)v6, v25);
      uint64_t MinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions = objc_msgSend__findMinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions_(FlexSong, v28, (uint64_t)v5, (uint64_t)v6, v29);
      if (MinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions
         + EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions < v11)
        int64_t v11 = MinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions
            + EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions;
    }
    else
    {
      int64_t v11 = v26;
    }
  }

  return v11;
}

- (BOOL)_buildSegmentAssemblyList:(id)a3 forDuration:(int64_t)a4 withOptions:(id)a5 testingContext:(id)a6
{
  uint64_t v144 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = 9600 * (a4 / 9600);
  if (v13 >= objc_msgSend__minOutroDuration(self, v14, v15, v16, v17))
  {
    objc_msgSend_naturalDuration(self, v18, v19, v20, v21);
    if (v142 == a4)
    {
      int64_t v26 = objc_msgSend__naturalDurationAssemblyList(self, v22, v23, v24, v25);
      objc_msgSend_addObjectsFromArray_(v10, v27, (uint64_t)v26, v28, v29);

      goto LABEL_4;
    }
    int64_t v34 = objc_msgSend_objectForKey_(v11, v22, @"OutroCanBeShortened", v24, v25);
    unsigned int v39 = objc_msgSend_BOOLValue(v34, v35, v36, v37, v38);

    uint64_t v135 = 9600 * (a4 / 9600);
    unsigned int v134 = v39;
    if (v39)
    {
      id v133 = v12;
      uint64_t v44 = objc_msgSend__segmentsforType_(self, v40, 4, v42, v43);
      long long v138 = 0u;
      long long v139 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v45, (uint64_t)&v138, (uint64_t)v143, 16);
      if (v46)
      {
        uint64_t v49 = v46;
        uint64_t v50 = 0;
        uint64_t v51 = *(void *)v139;
        do
        {
          for (uint64_t i = 0; i != v49; ++i)
          {
            if (*(void *)v139 != v51) {
              objc_enumerationMutation(v44);
            }
            uint64_t v53 = objc_msgSend__durationInSamplesToReserveForOutroSegment_withOptions_(FlexSong, v47, *(void *)(*((void *)&v138 + 1) + 8 * i), (uint64_t)v11, v48);
            if (v53 > v50) {
              uint64_t v50 = v53;
            }
          }
          uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v47, (uint64_t)&v138, (uint64_t)v143, 16);
        }
        while (v49);
      }
      else
      {
        uint64_t v50 = 0;
      }

      id v12 = v133;
      uint64_t v13 = 9600 * (a4 / 9600);
    }
    else
    {
      uint64_t v50 = objc_msgSend__maxOutroDuration(self, v40, v41, v42, v43);
    }
    uint64_t v57 = v13 - v50;
    uint64_t v137 = 0;
    char v136 = 0;
    if (v13 - v50 < 1)
    {
      uint64_t v59 = 0;
      BOOL v60 = 0;
      int v58 = 0;
    }
    else
    {
      int v58 = objc_msgSend__addBodySegmentsForAssemblyList_forDuration_unusedDuration_testingContext_timedOut_(self, v54, (uint64_t)v10, v57, (uint64_t)&v137, v12, &v136);
      uint64_t v59 = v137;
      BOOL v60 = v136 != 0;
    }
    if (v60 || v59 > 192000)
    {
      uint64_t v61 = -v50 - 48000 + v135;
      int v62 = 6;
      do
      {
        objc_msgSend_removeAllObjects(v10, v54, v55, v57, v56);
        int v58 = objc_msgSend__addBodySegmentsForAssemblyList_forDuration_unusedDuration_testingContext_timedOut_(self, v63, (uint64_t)v10, v61, (uint64_t)&v137, v12, &v136);
        if (!--v62) {
          break;
        }
        v61 -= 48000;
        BOOL v64 = !v136 && v137 <= 192000;
      }
      while (!v64);
    }
    if (objc_msgSend_count(v10, v54, v55, v57, v56))
    {
      if (!v58) {
        goto LABEL_36;
      }
      uint64_t v68 = objc_msgSend__sampleDurationOfClipPlaylist_(self, v65, (uint64_t)v10, v66, v67);
      if ((objc_msgSend__addOutroSegmentsToAssemblyList_forDuration_allowTrim_testingContext_(self, v69, (uint64_t)v10, v135 - v68, v134, v12) & 1) == 0)goto LABEL_36; {
      uint64_t v73 = objc_msgSend__sampleDurationOfClipPlaylist_(self, v70, (uint64_t)v10, v71, v72);
      }
      if (!objc_msgSend__addIntroSegmentsToAssemblyList_forDuration_testingContext_(self, v74, (uint64_t)v10, v135 - v73, (uint64_t)v12))goto LABEL_36; {
    }
      }
    else if ((objc_msgSend__buildIntroAndOutroOnlySegmentAssemblyList_forDuration_testingContext_(self, v65, (uint64_t)v10, v135, (uint64_t)v12) & 1) == 0)
    {
LABEL_36:
      char v33 = 0;
      goto LABEL_47;
    }
    int64_t v78 = objc_msgSend__sampleDurationOfClipPlaylist_(self, v75, (uint64_t)v10, v76, v77);
    BOOL v64 = a4 <= v78;
    uint64_t v32 = a4 - v78;
    if (!v64)
    {
      if (!v134) {
        goto LABEL_5;
      }
      uint64_t v81 = objc_msgSend_outroInfoForClipPlaylist_(FlexSong, v31, (uint64_t)v10, v79, v80);
      uint64_t v86 = v81;
      if (!v81) {
        goto LABEL_48;
      }
      uint64_t v87 = objc_msgSend_offset(v81, v82, v83, v84, v85);
      id v92 = v12;
      uint64_t v93 = objc_msgSend_duration(v86, v88, v89, v90, v91) + v87;
      uint64_t v98 = objc_msgSend_segment(v86, v94, v95, v96, v97);
      uint64_t v103 = objc_msgSend_sampleCount(v98, v99, v100, v101, v102);

      BOOL v64 = v93 < v103;
      id v12 = v92;
      if (!v64)
      {
LABEL_48:

        goto LABEL_5;
      }
      long long v108 = objc_msgSend_segment(v86, v104, v105, v106, v107);
      uint64_t v113 = objc_msgSend_sampleCount(v108, v109, v110, v111, v112);
      uint64_t v118 = objc_msgSend_offset(v86, v114, v115, v116, v117);
      uint64_t v123 = v113 - (v118 + objc_msgSend_duration(v86, v119, v120, v121, v122));

      if (v123 >= v32) {
        uint64_t v123 = v32;
      }
      uint64_t v128 = objc_msgSend_duration(v86, v124, v125, v126, v127);
      objc_msgSend_setDuration_(v86, v129, v128 + v123, v130, v131);
      v32 -= v123;
      id v12 = v92;

      if (v32 >= 1) {
        goto LABEL_5;
      }
    }
LABEL_46:
    char v33 = 1;
    goto LABEL_47;
  }
LABEL_4:
  int64_t v30 = objc_msgSend__sampleDurationOfClipPlaylist_(self, v18, (uint64_t)v10, v20, v21);
  BOOL v64 = a4 <= v30;
  uint64_t v32 = a4 - v30;
  if (v64) {
    goto LABEL_46;
  }
LABEL_5:
  uint64_t v137 = 0x7FFFFFFFFFFFFFFFLL;
  char v33 = objc_msgSend__addSegment_withDuration_toAssemblyList_indexOfNewSegment_(self, v31, 0, v32, (uint64_t)v10, &v137);
LABEL_47:

  return v33;
}

- (id)_fullSongLoopedClipPlaylistForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5
{
  v139[2] = *MEMORY[0x263EF8340];
  id v131 = a4;
  id v8 = a5;
  objc_msgSend_setSequencingLongSong_(v8, v9, 1, v10, v11);
  int32_t v16 = objc_msgSend_sampleRate(self, v12, v13, v14, v15);
  CMTime time = *(CMTime *)a3;
  CMTimeConvertScale(&v137, &time, v16, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  CMTimeValue value = v137.value;
  uint64_t v18 = objc_opt_new();
  uint64_t v19 = objc_opt_new();
  uint64_t v20 = objc_opt_new();
  memset(&time, 0, sizeof(time));
  objc_msgSend_naturalDuration(self, v21, v22, v23, v24);
  CMTimeValue v129 = value;
  int64_t v25 = time.value;
  double v26 = (double)value / (double)time.value;
  int v27 = vcvtmd_s64_f64(v26);
  double v28 = (v26 - (double)v27) * 1.5;
  v138[0] = @"IgnoreStingerMarkerForShortening";
  v138[1] = @"IgnoreEarlyFadeMarker";
  v139[0] = MEMORY[0x263EFFA88];
  v139[1] = MEMORY[0x263EFFA88];
  int64_t v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v29, (uint64_t)v139, (uint64_t)v138, 2);
  uint64_t v35 = 0;
  uint64_t v130 = v20;
  if (v27 >= 2)
  {
    uint64_t v128 = v18;
    uint64_t v35 = 0;
    int v36 = v27 - 1;
    do
    {
      uint64_t v37 = v35;
      id v42 = v34;
      if (v36 == 1 && v28 < 0.25)
      {
        id v43 = v131;

        id v42 = v43;
      }
      int32_t v44 = objc_msgSend_sampleRate(self, v38, v39, v40, v41, v128);
      CMTimeMake(&v135, v25, v44);
      uint64_t v35 = objc_msgSend__clipPlaylistForDuration_withOptions_testingContext_(self, v45, (uint64_t)&v135, (uint64_t)v42, (uint64_t)v8);

      objc_msgSend_addObjectsFromArray_(v19, v46, (uint64_t)v35, v47, v48);
      --v36;
    }
    while (v36);
    uint64_t v52 = objc_msgSend_indexesOfObjectsPassingTest_(v19, v49, (uint64_t)&unk_26C7FE948, v50, v51);
    uint64_t v56 = objc_msgSend_objectsAtIndexes_(v19, v53, (uint64_t)v52, v54, v55);
    objc_msgSend_removeObjectsAtIndexes_(v19, v57, (uint64_t)v52, v58, v59);
    objc_msgSend__sampleDurationOfClipPlaylist_(self, v60, (uint64_t)v56, v61, v62);

    uint64_t v18 = v128;
    uint64_t v20 = v130;
  }
  if (v28 < 0.25)
  {
    int64_t v102 = v129 - objc_msgSend__sampleDurationOfClipPlaylist_(self, v30, (uint64_t)v19, v32, v33);
    int32_t v107 = objc_msgSend_sampleRate(self, v103, v104, v105, v106);
    CMTimeMake(&v134, v102, v107);
    uint64_t v101 = objc_msgSend__clipPlaylistForDuration_withOptions_testingContext_(self, v108, (uint64_t)&v134, (uint64_t)v34, (uint64_t)v8);

    objc_msgSend_addObjectsFromArray_(v20, v109, (uint64_t)v101, v110, v111);
    uint64_t v72 = objc_msgSend_indexesOfObjectsPassingTest_(v20, v112, (uint64_t)&unk_26C7FE968, v113, v114);
    uint64_t v97 = objc_msgSend_objectsAtIndexes_(v20, v115, (uint64_t)v72, v116, v117);
    objc_msgSend_removeObjectsAtIndexes_(v20, v118, (uint64_t)v72, v119, v120);
    objc_msgSend_addObjectsFromArray_(v18, v121, (uint64_t)v20, v122, v123);
    objc_msgSend_addObjectsFromArray_(v18, v124, (uint64_t)v19, v125, v126);
    uint64_t v76 = (void *)v97;
    uint64_t v95 = v131;
  }
  else
  {
    int32_t v63 = objc_msgSend_sampleRate(self, v30, v31, v32, v33);
    CMTimeMake(&v133, v25, v63);
    uint64_t v65 = objc_msgSend__clipPlaylistForDuration_withOptions_testingContext_(self, v64, (uint64_t)&v133, (uint64_t)v34, (uint64_t)v8);

    objc_msgSend_addObjectsFromArray_(v18, v66, (uint64_t)v65, v67, v68);
    uint64_t v72 = objc_msgSend_indexesOfObjectsPassingTest_(v18, v69, (uint64_t)&unk_26C7FE988, v70, v71);
    uint64_t v76 = objc_msgSend_objectsAtIndexes_(v18, v73, (uint64_t)v72, v74, v75);
    objc_msgSend_removeObjectsAtIndexes_(v18, v77, (uint64_t)v72, v78, v79);
    objc_msgSend__sampleDurationOfClipPlaylist_(self, v80, (uint64_t)v76, v81, v82);
    objc_msgSend_addObjectsFromArray_(v18, v83, (uint64_t)v19, v84, v85);
    int64_t v89 = v129 - objc_msgSend__sampleDurationOfClipPlaylist_(self, v86, (uint64_t)v18, v87, v88);
    int32_t v94 = objc_msgSend_sampleRate(self, v90, v91, v92, v93);
    CMTimeMake(&v132, v89, v94);
    uint64_t v95 = v131;
    uint64_t v97 = objc_msgSend__clipPlaylistForDuration_withOptions_testingContext_(self, v96, (uint64_t)&v132, (uint64_t)v131, (uint64_t)v8);

    uint64_t v20 = v130;
    uint64_t v101 = (void *)v97;
  }
  objc_msgSend_addObjectsFromArray_(v18, v98, v97, v99, v100);

  return v18;
}

- (id)renditionForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = FlexLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CMTime time = (CMTime)*a3;
    Float64 Seconds = CMTimeGetSeconds(&time);
    LODWORD(time.value) = 134217984;
    *(Float64 *)((char *)&time.value + 4) = Seconds;
    _os_log_impl(&dword_217A2F000, v10, OS_LOG_TYPE_DEFAULT, "flex: Requesting legacy format rendition for duration %.2f", (uint8_t *)&time, 0xCu);
  }

  id v12 = v8;
  uint64_t v17 = objc_msgSend_customOptions(self, v13, v14, v15, v16);

  uint64_t v22 = v12;
  if (v17)
  {
    uint64_t v90 = a3;
    id v91 = v9;
    uint64_t v92 = objc_msgSend_mutableCopy(v12, v18, v19, v20, v21);
    uint64_t v93 = self;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    int v27 = objc_msgSend_customOptions(self, v23, v24, v25, v26);
    uint64_t v32 = objc_msgSend_allKeys(v27, v28, v29, v30, v31);

    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v97, (uint64_t)v101, 16);
    if (v34)
    {
      uint64_t v38 = v34;
      uint64_t v39 = *(void *)v98;
      do
      {
        for (uint64_t i = 0; i != v38; ++i)
        {
          if (*(void *)v98 != v39) {
            objc_enumerationMutation(v32);
          }
          if (objc_msgSend_isEqualToString_(*(void **)(*((void *)&v97 + 1) + 8 * i), v35, @"OutroCanBeShortened", v36, v37))
          {
            objc_msgSend_objectForKeyedSubscript_(v12, v35, @"OutroCanBeShortened", v36, v37);
            v42 = id v41 = v12;
            int v47 = objc_msgSend_BOOLValue(v42, v43, v44, v45, v46);

            uint64_t v52 = objc_msgSend_customOptions(v93, v48, v49, v50, v51);
            uint64_t v56 = objc_msgSend_objectForKeyedSubscript_(v52, v53, @"OutroCanBeShortened", v54, v55);
            unsigned int v61 = objc_msgSend_BOOLValue(v56, v57, v58, v59, v60);

            id v12 = v41;
            uint64_t v65 = objc_msgSend_numberWithBool_(NSNumber, v62, v47 & v61, v63, v64);
            objc_msgSend_setObject_forKey_(v92, v66, (uint64_t)v65, @"OutroCanBeShortened", v67);
          }
        }
        uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v97, (uint64_t)v101, 16);
      }
      while (v38);
    }

    uint64_t v22 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v68, (uint64_t)v92, v69, v70);

    a3 = v90;
    id v9 = v91;
    self = v93;
  }
  memset(&time, 0, sizeof(time));
  objc_msgSend_naturalDuration(self, v18, v19, v20, v21);
  CMTimeMultiplyByFloat64(&time, &v96, 1.5);
  CMTime time1 = (CMTime)*a3;
  CMTime time2 = time;
  if (CMTimeCompare(&time1, &time2) < 0
    || (objc_msgSend_objectForKeyedSubscript_(v22, v71, @"LoopSongForLongDurations", v72, v73),
        uint64_t v74 = objc_claimAutoreleasedReturnValue(),
        int v79 = objc_msgSend_BOOLValue(v74, v75, v76, v77, v78),
        v74,
        !v79))
  {
    CMTime time1 = (CMTime)*a3;
    uint64_t v80 = objc_msgSend__clipPlaylistForDuration_withOptions_testingContext_(self, v71, (uint64_t)&time1, (uint64_t)v22, (uint64_t)v9);
  }
  else
  {
    CMTime time1 = (CMTime)*a3;
    uint64_t v80 = objc_msgSend__fullSongLoopedClipPlaylistForDuration_withOptions_testingContext_(self, v71, (uint64_t)&time1, (uint64_t)v22, (uint64_t)v9);
  }
  uint64_t v81 = (void *)v80;
  if (v80)
  {
    uint64_t v82 = [FlexLegacySongRendition alloc];
    uint64_t v84 = objc_msgSend_initWithSong_segments_withOptions_(v82, v83, (uint64_t)self, (uint64_t)v81, (uint64_t)v22);
    objc_msgSend__destroyCache(self, v85, v86, v87, v88);
  }
  else
  {
    uint64_t v84 = 0;
  }

  return v84;
}

- (id)_clipPlaylistForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if ((a3->var2 & 1) != 0
    && (time1 = (CMTime)*a3, CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x263F010E0], CMTimeCompare(&time1, &time2)))
  {
    uint64_t v14 = objc_msgSend_array(MEMORY[0x263EFF980], v10, v11, v12, v13);
    int32_t v19 = objc_msgSend_sampleRate(self, v15, v16, v17, v18);
    CMTime time1 = (CMTime)*a3;
    CMTimeConvertScale(&v22, &time1, v19, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    objc_msgSend__buildSegmentAssemblyList_forDuration_withOptions_testingContext_(self, v20, (uint64_t)v14, v22.value, (uint64_t)v8, v9);
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

- (BOOL)_validateStructureForRendition:(id)a3 failureReason:(id *)a4
{
  uint64_t v406 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v11 = objc_msgSend_segments(v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_firstObject(v11, v12, v13, v14, v15);
  BOOL v381 = v16 != 0;

  if (!v16) {
    *a4 = @"empty playlist!";
  }
  uint64_t v382 = a4;
  uint64_t v21 = objc_msgSend_duration(v6, v17, v18, v19, v20);
  objc_msgSend_naturalDuration(self, v22, v23, v24, v25);
  uint64_t v383 = v6;
  uint64_t v380 = self;
  if (v21 == v402)
  {
    uint64_t v379 = v16;
    uint64_t v26 = objc_opt_new();
    objc_msgSend__segmentsforType_(self, v27, 2, v28, v29);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v26, v30, (uint64_t)obj, v31, v32);
    long long v400 = 0u;
    long long v401 = 0u;
    long long v398 = 0u;
    long long v399 = 0u;
    uint64_t v37 = objc_msgSend__naturalDurationAssemblyList(self, v33, v34, v35, v36);
    uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v398, (uint64_t)v405, 16);
    if (v39)
    {
      uint64_t v44 = v39;
      uint64_t v45 = *(void *)v399;
      do
      {
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v399 != v45) {
            objc_enumerationMutation(v37);
          }
          int v47 = *(void **)(*((void *)&v398 + 1) + 8 * i);
          uint64_t v48 = objc_msgSend_segment(v47, v40, v41, v42, v43);
          uint64_t v53 = objc_msgSend_type(v48, v49, v50, v51, v52);

          if (v53 == 2)
          {
            v397[0] = MEMORY[0x263EF8330];
            v397[1] = 3221225472;
            v397[2] = sub_217A54B88;
            v397[3] = &unk_2642B78A0;
            v397[4] = v47;
            uint64_t v54 = objc_msgSend_indexOfObjectPassingTest_(v26, v40, (uint64_t)v397, v42, v43);
            if (v54 == 0x7FFFFFFFFFFFFFFFLL)
            {

LABEL_41:
              char v142 = 0;
              long long v141 = v383;
              *uint64_t v382 = @"invalid default duration playlist. there's a bug in the sequencer";
              goto LABEL_83;
            }
            objc_msgSend_removeObjectAtIndex_(v26, v55, v54, v56, v57);
          }
        }
        uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v398, (uint64_t)v405, 16);
      }
      while (v44);
    }

    if (!v379 || objc_msgSend_count(v26, v58, v59, v60, v61)) {
      goto LABEL_41;
    }
  }
  uint64_t v26 = objc_opt_new();
  long long v393 = 0u;
  long long v394 = 0u;
  long long v395 = 0u;
  long long v396 = 0u;
  uint64_t v66 = objc_msgSend_segments(v6, v62, v63, v64, v65);
  uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v393, (uint64_t)v404, 16);
  if (!v68) {
    goto LABEL_34;
  }
  uint64_t v73 = v68;
  uint64_t v74 = *(void *)v394;
  do
  {
    uint64_t v75 = 0;
    do
    {
      if (*(void *)v394 != v74) {
        objc_enumerationMutation(v66);
      }
      uint64_t v76 = *(void **)(*((void *)&v393 + 1) + 8 * v75);
      uint64_t v77 = objc_msgSend_segment(v76, v69, v70, v71, v72);
      if (objc_msgSend_type(v77, v78, v79, v80, v81) == 1) {
        goto LABEL_27;
      }
      uint64_t v86 = objc_msgSend_segment(v76, v82, v83, v84, v85);
      if (objc_msgSend_type(v86, v87, v88, v89, v90) == 2) {
        goto LABEL_26;
      }
      uint64_t v95 = objc_msgSend_segment(v76, v91, v92, v93, v94);
      if (objc_msgSend_type(v95, v96, v97, v98, v99) == 4)
      {

LABEL_26:
LABEL_27:

LABEL_28:
        objc_msgSend_addObject_(v26, v69, (uint64_t)v76, v71, v72);
        goto LABEL_29;
      }
      uint64_t v104 = objc_msgSend_segment(v76, v100, v101, v102, v103);

      if (!v104) {
        goto LABEL_28;
      }
LABEL_29:
      ++v75;
    }
    while (v73 != v75);
    uint64_t v105 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v69, (uint64_t)&v393, (uint64_t)v404, 16);
    uint64_t v73 = v105;
  }
  while (v105);
LABEL_34:

  if (objc_msgSend_count(v26, v106, v107, v108, v109) == 1)
  {
    uint64_t v114 = objc_msgSend_lastObject(v26, v110, v111, v112, v113);
    uint64_t v119 = objc_msgSend_segment(v114, v115, v116, v117, v118);

    if (!v119)
    {
      uint64_t v143 = objc_msgSend_lastObject(v26, v110, v111, v112, v113);
      uint64_t v148 = objc_msgSend_duration(v143, v144, v145, v146, v147);
      if (v148 > objc_msgSend__minOutroDuration(v380, v149, v150, v151, v152))
      {
        uint64_t v157 = NSString;
        uint64_t v158 = objc_msgSend_sampleRate(v380, v153, v154, v155, v156);
        objc_msgSend_stringWithFormat_(v157, v159, @"excessive silence: %fs - check allowed transitions, priorities and which segments are sliceable.", v160, v161, (float)((float)v148 / (float)v158));
        BOOL v381 = 0;
        *uint64_t v382 = (id)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_45;
    }
  }
  if (objc_msgSend_count(v26, v110, v111, v112, v113) != 1
    || (objc_msgSend_lastObject(v26, v120, v121, v122, v123),
        uint64_t v124 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_segment(v124, v125, v126, v127, v128),
        CMTimeValue v129 = objc_claimAutoreleasedReturnValue(),
        v129,
        v124,
        !v129))
  {
LABEL_45:
    long long v141 = v383;
    goto LABEL_46;
  }
  uint64_t v130 = objc_msgSend_lastObject(v26, v120, v121, v122, v123);
  CMTime v135 = objc_msgSend_segment(v130, v131, v132, v133, v134);
  uint64_t v140 = objc_msgSend_type(v135, v136, v137, v138, v139);

  long long v141 = v383;
  if (v140 == 4)
  {
    char v142 = 1;
    goto LABEL_84;
  }
LABEL_46:
  long long v391 = 0u;
  long long v392 = 0u;
  long long v389 = 0u;
  long long v390 = 0u;
  objc_msgSend_segments(v141, v120, v121, v122, v123);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v162, (uint64_t)&v389, (uint64_t)v403, 16);
  if (!v163)
  {
    uint64_t v169 = 0;
    uint64_t v170 = 0;
    BOOL v171 = 0;
    BOOL v172 = 0;
    int v173 = 0;
    goto LABEL_66;
  }
  uint64_t v168 = v163;
  uint64_t v169 = 0;
  uint64_t v170 = 0;
  BOOL v171 = 0;
  BOOL v172 = 0;
  int v173 = 0;
  uint64_t v174 = *(void *)v390;
  while (2)
  {
    uint64_t v175 = 0;
    while (2)
    {
      if (*(void *)v390 != v174) {
        objc_enumerationMutation(obj);
      }
      objc_msgSend_segment(*(void **)(*((void *)&v389 + 1) + 8 * v175), v164, v165, v166, v167);
      uint64_t v176 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_type(v176, v177, v178, v179, v180) == 1)
      {
        BOOL v171 = v169 == 0;
        if ((objc_msgSend_sliceable(v176, v181, v182, v183, v184) & 1) == 0)
        {
          ++v169;
          goto LABEL_62;
        }
        id v233 = @"Intro Segments cannot be marked as sliceable";
LABEL_80:
        char v142 = 0;
        *uint64_t v382 = v233;
        goto LABEL_81;
      }
      if (objc_msgSend_type(v176, v181, v182, v183, v184) == 4)
      {
        BOOL v172 = v170 == 0;
        if (objc_msgSend_sliceable(v176, v185, v186, v187, v188))
        {
          id v233 = @"Outro Segments cannot be marked as sliceable";
          goto LABEL_80;
        }
        ++v170;
      }
      else if (objc_msgSend_type(v176, v185, v186, v187, v188) == 3)
      {
        if (objc_msgSend_sliceable(v176, v189, v190, v191, v192))
        {
          id v233 = @"Transitions cannot be marked as sliceable";
          goto LABEL_80;
        }
      }
      else if (objc_msgSend_type(v176, v189, v190, v191, v192) == 2)
      {
        objc_msgSend_sliceable(v176, v193, v194, v195, v196);
        int v173 = 1;
      }
LABEL_62:

      if (v168 != ++v175) {
        continue;
      }
      break;
    }
    uint64_t v168 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v164, (uint64_t)&v389, (uint64_t)v403, 16);
    if (v168) {
      continue;
    }
    break;
  }
LABEL_66:

  if (!v381)
  {
    char v142 = 0;
    long long v141 = v383;
    goto LABEL_84;
  }
  long long v141 = v383;
  uint64_t v201 = objc_msgSend_duration(v383, v197, v198, v199, v200);
  objc_msgSend_lastObject(v26, v202, v203, v204, v205);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v210 = objc_msgSend_segment(obj, v206, v207, v208, v209);

  if (!v210) {
    v201 -= objc_msgSend_duration(obj, v211, v212, v213, v214);
  }
  if (v201 < objc_msgSend__minOutroDuration(v380, v211, v212, v213, v214))
  {
    if (v171)
    {
      objc_msgSend_stringByAppendingString_(&stru_26C7FED08, v215, @"intro added when we should have silence\n", v217, v218);
      uint64_t v219 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_87;
    }
    if ((v172 | v173))
    {
      uint64_t v219 = &stru_26C7FED08;
LABEL_87:
      if (v172)
      {
        uint64_t v235 = objc_msgSend_stringByAppendingString_(v219, v215, @"outro added when we should have silence\n", v217, v218);

        uint64_t v219 = (__CFString *)v235;
      }
      if (v173)
      {
        objc_msgSend_stringByAppendingString_(v219, v215, @"body added when we should have silence\n", v217, v218);
        uint64_t v236 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_103;
      }
    }
    else
    {
      objc_msgSend_firstObject(v26, v215, v216, v217, v218);
      uint64_t v219 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v285 = objc_msgSend_segment(v219, v281, v282, v283, v284);
      if (v285)
      {

        uint64_t v236 = &stru_26C7FED08;
LABEL_103:

        uint64_t v219 = v236;
      }
      else
      {
        uint64_t v358 = objc_msgSend_count(v26, v286, v287, v288, v289);

        if (v358 == 1)
        {
          char v142 = 1;
          goto LABEL_83;
        }
        uint64_t v219 = &stru_26C7FED08;
      }
    }
    uint64_t v290 = objc_msgSend_firstObject(v26, v215, v216, v217, v218);
    uint64_t v295 = objc_msgSend_segment(v290, v291, v292, v293, v294);

    if (v295)
    {
      uint64_t v300 = objc_msgSend_stringByAppendingString_(v219, v296, @"unexpected first object - should be nil segment\n", v298, v299);

      uint64_t v219 = (__CFString *)v300;
    }
    if (objc_msgSend_count(v26, v296, v297, v298, v299) != 1)
    {
      objc_msgSend_stringByAppendingString_(v219, v301, @"too many playlist items - there's a bug in the playback sequencing algorithm \n", v302, v303);
      goto LABEL_108;
    }
LABEL_109:
    uint64_t v176 = v219;
    char v142 = 0;
    *uint64_t v382 = v176;
    goto LABEL_82;
  }
  if (objc_msgSend_count(v26, v215, v216, v217, v218) == 2)
  {
    uint64_t v224 = objc_msgSend_lastObject(v26, v220, v221, v222, v223);
    uint64_t v229 = objc_msgSend_segment(v224, v225, v226, v227, v228);

    if (v229)
    {
      char v142 = (v173 | v171) & v172;
      if ((v142 & 1) == 0)
      {
        if (v171)
        {
          uint64_t v219 = &stru_26C7FED08;
        }
        else
        {
          objc_msgSend_stringByAppendingString_(&stru_26C7FED08, v230, @"intro expected but not found\n", v231, v232);
          uint64_t v219 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        if (!v172)
        {
          uint64_t v359 = objc_msgSend_stringByAppendingString_(v219, v230, @"outro expected but not found\n", v231, v232);

          uint64_t v219 = (__CFString *)v359;
        }
        if ((v173 & 1) == 0) {
          goto LABEL_109;
        }
        objc_msgSend_stringByAppendingString_(v219, v230, @"body added when we should have only intro and outro segments\n", v231, v232);
        uint64_t v304 = LABEL_108:;

        uint64_t v219 = (__CFString *)v304;
        goto LABEL_109;
      }
    }
    else
    {
      char v142 = v172 & (v173 ^ 1);
      if ((v142 & 1) == 0)
      {
        if (v172)
        {
          uint64_t v219 = &stru_26C7FED08;
        }
        else
        {
          objc_msgSend_stringByAppendingString_(&stru_26C7FED08, v230, @"outro expected but not found\n", v231, v232);
          uint64_t v219 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        if ((v173 & 1) == 0) {
          goto LABEL_109;
        }
        objc_msgSend_stringByAppendingString_(v219, v230, @"body added when we should have only outro and silent segments\n", v231, v232);
        goto LABEL_108;
      }
    }
LABEL_132:
    uint64_t v176 = &stru_26C7FED08;
    goto LABEL_82;
  }
  if (objc_msgSend_count(v26, v220, v221, v222, v223) == 3)
  {
    if ((v173 | v171) & v172)
    {
      uint64_t v241 = objc_msgSend_count(v26, v237, v238, v239, v240);
      if (v241 - 1 >= 1)
      {
        uint64_t v245 = v241;
        uint64_t v176 = &stru_26C7FED08;
        char v142 = 1;
        while (1)
        {
          long long v246 = objc_msgSend_objectAtIndexedSubscript_(v26, v242, --v245, v243, v244);
          uint64_t v251 = objc_msgSend_segment(v246, v247, v248, v249, v250);

          if (v251)
          {
            uint64_t v256 = objc_msgSend_segment(v246, v252, v253, v254, v255);
            uint64_t v261 = objc_msgSend_type(v256, v257, v258, v259, v260);

            if (v261 == 4) {
              goto LABEL_162;
            }
            uint64_t v266 = objc_msgSend_segment(v246, v262, v263, v264, v265);
            if (objc_msgSend_type(v266, v267, v268, v269, v270) == 2) {
              goto LABEL_163;
            }
            uint64_t v275 = objc_msgSend_segment(v246, v271, v272, v273, v274);
            uint64_t v280 = objc_msgSend_type(v275, v276, v277, v278, v279);

            if (v280 == 1) {
              goto LABEL_164;
            }
          }

          if (v245 <= 1) {
            goto LABEL_81;
          }
        }
      }
      goto LABEL_131;
    }
    if (v171)
    {
      uint64_t v219 = &stru_26C7FED08;
    }
    else
    {
      objc_msgSend_stringByAppendingString_(&stru_26C7FED08, v237, @"intro expected but not found\n", v239, v240);
      uint64_t v219 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (!v172)
    {
      uint64_t v361 = objc_msgSend_stringByAppendingString_(v219, v237, @"outro expected but not found\n", v239, v240);

      uint64_t v219 = (__CFString *)v361;
    }
    if (v173)
    {
      objc_msgSend_stringByAppendingString_(v219, v237, @"body added when we should have only intro and outro segments\n", v239, v240);
      uint64_t v362 = LABEL_154:;

      uint64_t v219 = (__CFString *)v362;
    }
    goto LABEL_155;
  }
  int64_t v305 = objc_msgSend_options(v383, v237, v238, v239, v240);
  uint64_t v309 = objc_msgSend_objectForKey_(v305, v306, @"LoopSongForLongDurations", v307, v308);
  int v314 = objc_msgSend_BOOLValue(v309, v310, v311, v312, v313);

  if (v314)
  {
    memset(&v388, 0, sizeof(v388));
    objc_msgSend_naturalDuration(v380, v237, v238, v239, v240);
    CMTimeMultiplyByFloat64(&v388, &time, 1.5);
    int64_t v319 = objc_msgSend_duration(v383, v315, v316, v317, v318);
    CMTimeMake(&time1, v319, 48000);
    CMTime time2 = v388;
    long long v141 = v383;
    if (CMTimeCompare(&time1, &time2) < 0 && (v172 & v173 & 1) == 0)
    {
LABEL_113:
      if (v171)
      {
        uint64_t v219 = &stru_26C7FED08;
      }
      else
      {
        if (v169) {
          objc_msgSend_stringByAppendingString_(&stru_26C7FED08, v237, @"Too many intros added\n", v239, v240);
        }
        else {
          objc_msgSend_stringByAppendingString_(&stru_26C7FED08, v237, @"No intro segments\n", v239, v240);
        }
        uint64_t v219 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      if (!v172)
      {
        if (v170) {
          objc_msgSend_stringByAppendingString_(v219, v237, @"Too many outros added\n", v239, v240);
        }
        else {
        uint64_t v360 = objc_msgSend_stringByAppendingString_(v219, v237, @"No outro segments\n", v239, v240);
        }

        uint64_t v219 = (__CFString *)v360;
      }
      if ((v173 & 1) == 0)
      {
        objc_msgSend_stringByAppendingString_(v219, v237, @"expected a body segment\n", v239, v240);
        goto LABEL_154;
      }
LABEL_155:
      if (objc_msgSend_count(v26, v237, v238, v239, v240) != 1) {
        goto LABEL_109;
      }
      v367 = objc_msgSend_firstObject(v26, v363, v364, v365, v366);
      uint64_t v372 = objc_msgSend_segment(v367, v368, v369, v370, v371);

      if (v372) {
        goto LABEL_109;
      }
      objc_msgSend_stringByAppendingString_(v219, v373, @"There is a bug in the smart song or playback sequencing algorithm!\n", v374, v375);
      goto LABEL_108;
    }
  }
  else
  {
    long long v141 = v383;
    if ((v172 & v173 & 1) == 0) {
      goto LABEL_113;
    }
  }
  uint64_t v320 = objc_msgSend_count(v26, v237, v238, v239, v240);
  if (v320 - 1 < 1)
  {
LABEL_131:
    char v142 = 1;
    goto LABEL_132;
  }
  uint64_t v324 = v320;
  uint64_t v176 = &stru_26C7FED08;
  char v142 = 1;
  while (2)
  {
    long long v246 = objc_msgSend_objectAtIndexedSubscript_(v26, v321, --v324, v322, v323);
    id v329 = objc_msgSend_segment(v246, v325, v326, v327, v328);

    if (!v329)
    {
LABEL_127:

      if (v324 <= 1) {
        goto LABEL_81;
      }
      continue;
    }
    break;
  }
  uint64_t v334 = objc_msgSend_segment(v246, v330, v331, v332, v333);
  uint64_t v339 = objc_msgSend_type(v334, v335, v336, v337, v338);

  if (v339 == 4)
  {
LABEL_162:

    char v142 = 1;
    uint64_t v176 = &stru_26C7FED08;
    goto LABEL_81;
  }
  uint64_t v266 = objc_msgSend_segment(v246, v340, v341, v342, v343);
  if (objc_msgSend_type(v266, v344, v345, v346, v347) != 2)
  {
    uint64_t v352 = objc_msgSend_segment(v246, v348, v349, v350, v351);
    uint64_t v357 = objc_msgSend_type(v352, v353, v354, v355, v356);

    if (v357 == 1) {
      goto LABEL_164;
    }
    goto LABEL_127;
  }
LABEL_163:

LABEL_164:
  uint64_t v176 = &stru_26C7FED08;
  objc_msgSend_stringByAppendingString_(&stru_26C7FED08, v376, @"Outro segment is not after all Intro & Body segments", v377, v378);
  char v142 = 0;
  *uint64_t v382 = (id)objc_claimAutoreleasedReturnValue();
LABEL_81:
  long long v141 = v383;
LABEL_82:

LABEL_83:
LABEL_84:

  return v142 & 1;
}

+ (id)outroInfoForClipPlaylist:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = sub_217A4E590;
  uint64_t v13 = sub_217A4E5A0;
  id v14 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = sub_217A54D0C;
  v8[3] = &unk_2642B78C8;
  v8[4] = &v9;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v3, v4, 2, (uint64_t)v8, v5);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (BOOL)_validateTransitionsInRendition:(id)a3 failureReason:(id *)a4
{
  id v5 = a3;
  uint64_t v10 = objc_msgSend_segments(v5, v6, v7, v8, v9);
  unint64_t v15 = objc_msgSend_count(v10, v11, v12, v13, v14);

  if (v15 >= 3)
  {
    uint64_t v413 = a4;
    uint64_t v21 = objc_msgSend_segments(v5, v16, v17, v18, v19);
    int64_t v411 = objc_msgSend_outroInfoForClipPlaylist_(FlexSong, v22, (uint64_t)v21, v23, v24);

    unint64_t v29 = 0;
    unint64_t v420 = v15 - 1;
    unint64_t v30 = v15 - 2;
    uint64_t v31 = 1;
    uint64_t v32 = 2;
    char v414 = 1;
    unint64_t v412 = v15;
    while (1)
    {
      uint64_t v33 = objc_msgSend_segments(v5, v25, v26, v27, v28);
      uint64_t v37 = objc_msgSend_objectAtIndexedSubscript_(v33, v34, v29, v35, v36);

      uint64_t v42 = objc_msgSend_segment(v37, v38, v39, v40, v41);
      int v47 = v42;
      if (!v42) {
        goto LABEL_25;
      }
      if (objc_msgSend_type(v42, v43, v44, v45, v46) != 2) {
        break;
      }
      uint64_t v422 = v32;
      if (v29 >= v420)
      {
LABEL_11:
        uint64_t v62 = 0;
        objc_msgSend_name(0, v48, v49, v50, v51);
      }
      else
      {
        uint64_t v52 = v31;
        while (1)
        {
          uint64_t v53 = objc_msgSend_segments(v5, v48, v49, v50, v51);
          uint64_t v57 = objc_msgSend_objectAtIndexedSubscript_(v53, v54, v52, v55, v56);

          uint64_t v62 = objc_msgSend_segment(v57, v58, v59, v60, v61);
          if (objc_msgSend_type(v62, v63, v64, v65, v66) == 2 || objc_msgSend_type(v62, v67, v68, v69, v70) == 4) {
            break;
          }

          if (v15 == ++v52) {
            goto LABEL_11;
          }
        }

        objc_msgSend_name(v62, v150, v151, v152, v153);
      uint64_t v154 = };
      long long v424 = v37;
      uint64_t v159 = objc_msgSend_barsUsed(v37, v155, v156, v157, v158);
      uint64_t v162 = objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v47, v160, (uint64_t)v154, v159 - 1, v161);

      uint64_t v421 = v162;
      int v167 = objc_msgSend_prevented(v162, v163, v164, v165, v166);
      if (v62)
      {
        if (v167)
        {
          BOOL v172 = objc_msgSend_nameIndex(v47, v168, v169, v170, v171);
          uint64_t v177 = objc_msgSend_nameIndex(v62, v173, v174, v175, v176);
          int isEqualToString = objc_msgSend_isEqualToString_(v172, v178, (uint64_t)v177, v179, v180);

          if (isEqualToString)
          {
            uint64_t v182 = objc_msgSend_nameSuffix(v47, v168, v169, v170, v171);
            if (v182)
            {
              uint64_t v183 = (void *)v182;
              uint64_t v184 = objc_msgSend_nameSuffix(v62, v168, v169, v170, v171);

              if (v184)
              {
                uint64_t v185 = objc_msgSend_nameSuffix(v47, v168, v169, v170, v171);
                uint64_t v190 = objc_msgSend_nameSuffix(v62, v186, v187, v188, v189);
                uint64_t v193 = objc_msgSend_compare_options_(v185, v191, (uint64_t)v190, 1, v192);

                if (v193)
                {
                  if (v193 == -1)
                  {
                    uint64_t v194 = objc_msgSend_nameSuffix(v47, v168, v169, v170, v171);
                    int v198 = objc_msgSend_characterAtIndex_(v194, v195, 0, v196, v197);

                    uint64_t v203 = objc_msgSend_nameSuffix(v62, v199, v200, v201, v202);
                    int v207 = objc_msgSend_characterAtIndex_(v203, v204, 0, v205, v206);

                    if (v207 - v198 == 1)
                    {
                      uint64_t v208 = objc_msgSend_name(v62, v168, v169, v170, v171);
                      int v212 = objc_msgSend_linkedPerBarTransitionsToSegmentNamed_(v47, v209, (uint64_t)v208, v210, v211);

                      if (v212) {
                        uint64_t v217 = objc_msgSend_bars(v62, v213, v214, v215, v216) - 1;
                      }
                      else {
                        uint64_t v217 = 0;
                      }
                      uint64_t v37 = v424;
                      if (v217 < objc_msgSend_bars(v62, v213, v214, v215, v216))
                      {
                        while ((objc_msgSend_canTransitionFromSegment_toSegment_fromBarIndex_checkIfPrevented_(FlexSegment, v369, (uint64_t)v47, (uint64_t)v62, v217, 1) & 1) == 0)
                        {
                          if (++v217 >= objc_msgSend_bars(v62, v373, v374, v375, v376)) {
                            goto LABEL_88;
                          }
                        }
                        char v414 = 1;
                        goto LABEL_76;
                      }
LABEL_88:
                      objc_msgSend_song(v5, v369, v370, v371, v372);
                      id v251 = (id)objc_claimAutoreleasedReturnValue();
                      BOOL v381 = objc_msgSend_uid(v251, v377, v378, v379, v380);
                      if (objc_msgSend_isEqualToString_(v381, v382, @"89EE9F2B-CEB7-4B06-8388-D12A7BFF78A8", v383, v384))
                      {

                        char v414 = 1;
                        goto LABEL_74;
                      }
                      uint64_t v410 = objc_msgSend_song(v5, v385, v386, v387, v388);
                      long long v393 = objc_msgSend_uid(v410, v389, v390, v391, v392);
                      char v417 = objc_msgSend_isEqualToString_(v393, v394, @"0B84454E-B24A-44BC-9068-F88B899EDD2F", v395, v396);

                      if (v417)
                      {
                        char v414 = 1;
                        goto LABEL_75;
                      }
                      long long v401 = NSString;
                      objc_msgSend_name(v47, v397, v398, v399, v400);
                      id v251 = (id)objc_claimAutoreleasedReturnValue();
                      uint64_t v256 = objc_msgSend_name(v62, v402, v403, v404, v405);
                      objc_msgSend_stringWithFormat_(v401, v406, @"transition from %@ to %@ should be permitted but is not. successive segments in the clipPlaylist should transition into another.", v407, v408, v251, v256);
LABEL_55:
                      *uint64_t v413 = (id)objc_claimAutoreleasedReturnValue();

                      char v414 = 0;
                      goto LABEL_74;
                    }
                  }
                }
                else
                {
                  uint64_t v227 = objc_msgSend_segments(v5, v168, v169, v170, v171);
                  v427[0] = MEMORY[0x263EF8330];
                  v427[1] = 3221225472;
                  v427[2] = sub_217A55958;
                  v427[3] = &unk_2642B7858;
                  id v228 = v47;
                  id v428 = v228;
                  uint64_t v232 = objc_msgSend_indexesOfObjectsPassingTest_(v227, v229, (uint64_t)v427, v230, v231);

                  if (objc_msgSend_sliceable(v62, v233, v234, v235, v236))
                  {
                    objc_msgSend_count(v232, v237, v238, v239, v240);
                  }
                  else
                  {
                    int v351 = objc_msgSend_sliceable(v228, v237, v238, v239, v240);
                    if (objc_msgSend_count(v232, v352, v353, v354, v355) && !v351)
                    {
                      long long v416 = NSString;
                      uint64_t v360 = objc_msgSend_name(v228, v356, v357, v358, v359);
                      uint64_t v365 = objc_msgSend_name(v62, v361, v362, v363, v364);
                      objc_msgSend_stringWithFormat_(v416, v366, @"transition from %@ to %@ should not occur. there is a problem with the playback sequencing algorithm.", v367, v368, v360, v365);
                      *uint64_t v413 = (id)objc_claimAutoreleasedReturnValue();

                      char v414 = 0;
                      id v251 = v428;
                      goto LABEL_74;
                    }
                  }
                }
              }
            }
          }
        }
      }
      uint64_t v241 = v421;
      if (objc_msgSend_fadeOut(v421, v168, v169, v170, v171) < 1
        || (objc_msgSend_prevented(v421, v242, v243, v244, v245) & 1) != 0)
      {
        if (objc_msgSend_fadeOut(v421, v242, v243, v244, v245) >= 1
          && objc_msgSend_prevented(v421, v246, v247, v248, v249))
        {
          uint64_t v250 = NSString;
          objc_msgSend_name(v47, v246, v247, v248, v249);
          id v251 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v256 = objc_msgSend_name(v62, v252, v253, v254, v255);
          objc_msgSend_stringWithFormat_(v250, v257, @"transition sequenced from %@ to %@ but not allowed. algorithm bug? ", v258, v259, v251, v256);
          goto LABEL_55;
        }
      }
      else
      {
        uint64_t v260 = objc_msgSend_segments(v5, v242, v243, v244, v245);
        objc_msgSend_objectAtIndexedSubscript_(v260, v261, v29 + 1, v262, v263);
        id v251 = (id)objc_claimAutoreleasedReturnValue();

        uint64_t v268 = objc_msgSend_segment(v251, v264, v265, v266, v267);
        uint64_t v273 = objc_msgSend_type(v268, v269, v270, v271, v272);

        if (v273 == 5)
        {
          char v414 = 0;
          *uint64_t v413 = @"there should be no crossfade segments when using real-time crossfades.";
          goto LABEL_74;
        }

        uint64_t v241 = v421;
      }
      uint64_t v274 = objc_msgSend_transitionSegmentName(v241, v246, v247, v248, v249);

      if (v274)
      {
        if (v29 + 1 >= v420)
        {
          id v251 = 0;
        }
        else
        {
          uint64_t v279 = v47;
          uint64_t v280 = 0;
          while (1)
          {
            uint64_t v281 = objc_msgSend_segments(v5, v275, v276, v277, v278);
            objc_msgSend_objectAtIndexedSubscript_(v281, v282, v31 + v280, v283, v284);
            id v251 = (id)objc_claimAutoreleasedReturnValue();

            uint64_t v289 = objc_msgSend_segment(v251, v285, v286, v287, v288);
            uint64_t v294 = objc_msgSend_type(v289, v290, v291, v292, v293);

            if (v294 == 3) {
              break;
            }

            if (v30 == ++v280)
            {
              id v251 = 0;
              break;
            }
          }
          int v47 = v279;
        }
        uint64_t v295 = objc_msgSend_segment(v251, v275, v276, v277, v278);
        uint64_t v300 = objc_msgSend_type(v295, v296, v297, v298, v299);

        if (v300 != 3)
        {
          uint64_t v324 = NSString;
          uint64_t v325 = objc_msgSend_name(v47, v301, v302, v303, v304);
          uint64_t v330 = objc_msgSend_name(v62, v326, v327, v328, v329);
          objc_msgSend_stringWithFormat_(v324, v331, @"transition segment specified for %@ to %@ but not found", v332, v333, v325, v330);
          *uint64_t v413 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_73;
        }
        uint64_t v419 = v47;
        int64_t v305 = objc_msgSend_segment(v251, v301, v302, v303, v304);
        uint64_t v310 = objc_msgSend_name(v305, v306, v307, v308, v309);
        uint64_t v315 = objc_msgSend_transitionSegmentName(v421, v311, v312, v313, v314);
        char v319 = objc_msgSend_isEqualToString_(v310, v316, (uint64_t)v315, v317, v318);

        if ((v319 & 1) == 0)
        {
          long long v415 = NSString;
          uint64_t v325 = objc_msgSend_name(v419, v320, v321, v322, v323);
          uint64_t v330 = objc_msgSend_name(v62, v334, v335, v336, v337);
          uint64_t v342 = objc_msgSend_segment(v251, v338, v339, v340, v341);
          uint64_t v347 = objc_msgSend_name(v342, v343, v344, v345, v346);
          objc_msgSend_stringWithFormat_(v415, v348, @"transition segment specified for %@ to %@ but incorrect segment %@ was found instead. playback sequencing algorithm issue?", v349, v350, v325, v330, v347);
          *uint64_t v413 = (id)objc_claimAutoreleasedReturnValue();

          int v47 = v419;
LABEL_73:

          char v414 = 0;
          unint64_t v15 = v412;
LABEL_74:

LABEL_75:
          uint64_t v37 = v424;
LABEL_76:

          LODWORD(v138) = 0;
          goto LABEL_77;
        }

        unint64_t v15 = v412;
        int v47 = v419;
        uint64_t v241 = v421;
      }

      LODWORD(v138) = 1;
      uint64_t v37 = v424;
LABEL_77:

      uint64_t v32 = v422;
LABEL_78:

      if (v138)
      {
        ++v29;
        ++v32;
        ++v31;
        --v30;
        if (v29 != v15) {
          continue;
        }
      }

      char v20 = v414;
      goto LABEL_95;
    }
    if (objc_msgSend_type(v47, v48, v49, v50, v51) == 3)
    {
      long long v423 = v37;
      long long v418 = v47;
      if ((uint64_t)(v29 - 1) < 0)
      {
LABEL_17:
        uint64_t v76 = 0;
      }
      else
      {
        uint64_t v71 = v29;
        while (1)
        {
          --v71;
          uint64_t v72 = objc_msgSend_segments(v5, v43, v44, v45, v46);
          uint64_t v76 = objc_msgSend_objectAtIndexedSubscript_(v72, v73, v71, v74, v75);

          uint64_t v81 = objc_msgSend_segment(v76, v77, v78, v79, v80);
          uint64_t v86 = objc_msgSend_type(v81, v82, v83, v84, v85);

          if (v86 == 2) {
            break;
          }

          if (v71 <= 0) {
            goto LABEL_17;
          }
        }
      }
      uint64_t v422 = v32;
      if (v29 + 1 >= v420)
      {
LABEL_22:
        uint64_t v62 = 0;
      }
      else
      {
        uint64_t v87 = v32;
        while (1)
        {
          uint64_t v88 = objc_msgSend_segments(v5, v43, v44, v45, v46);
          uint64_t v62 = objc_msgSend_objectAtIndexedSubscript_(v88, v89, v87 - 1, v90, v91);

          CMTime v96 = objc_msgSend_segment(v62, v92, v93, v94, v95);
          uint64_t v101 = objc_msgSend_type(v96, v97, v98, v99, v100);

          if (v101 == 2) {
            break;
          }

          if (v15 == ++v87) {
            goto LABEL_22;
          }
        }
      }
      uint64_t v102 = objc_msgSend_segment(v76, v43, v44, v45, v46);
      uint64_t v107 = objc_msgSend_segment(v62, v103, v104, v105, v106);
      uint64_t v112 = objc_msgSend_name(v107, v108, v109, v110, v111);
      uint64_t v117 = objc_msgSend_barsUsed(v423, v113, v114, v115, v116);
      uint64_t v120 = objc_msgSend_transitionToSegmentNamed_fromBarIndex_(v102, v118, (uint64_t)v112, v117 - 1, v119);

      uint64_t v125 = objc_msgSend_transitionSegmentName(v120, v121, v122, v123, v124);
      uint64_t v130 = objc_msgSend_name(v418, v126, v127, v128, v129);
      LODWORD(v112) = objc_msgSend_isEqualToString_(v125, v131, (uint64_t)v130, v132, v133);

      if (v112)
      {

        LODWORD(v138) = 1;
      }
      else
      {
        uint64_t v138 = NSString;
        uint64_t v218 = objc_msgSend_segment(v76, v134, v135, v136, v137);
        uint64_t v223 = objc_msgSend_name(v218, v219, v220, v221, v222);
        objc_msgSend_stringWithFormat_(v138, v224, @"incorrect transition segment found after %@. Bug in sequencing algorithm", v225, v226, v223);
        *uint64_t v413 = (id)objc_claimAutoreleasedReturnValue();

        LODWORD(v138) = 0;
        char v414 = 0;
      }
      unint64_t v15 = v412;
      uint64_t v37 = v423;
      int v47 = v418;
      goto LABEL_77;
    }
LABEL_25:
    uint64_t v139 = v47;
    uint64_t v140 = objc_msgSend_segments(v5, v43, v44, v45, v46);
    uint64_t v145 = objc_msgSend_lastObject(v140, v141, v142, v143, v144);

    if (v37 != v145)
    {
      LODWORD(v138) = 1;
      int v47 = v139;
      goto LABEL_78;
    }
    int v47 = v139;
    if (v37 == v411)
    {
      LODWORD(v138) = 0;
LABEL_46:
      char v414 = 1;
      goto LABEL_78;
    }
    uint64_t v138 = objc_msgSend_segment(v37, v146, v147, v148, v149);

    if (!v138) {
      goto LABEL_46;
    }
    uint64_t v422 = v32;
    uint64_t v62 = FlexLogForCategory(1uLL);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG)) {
      sub_217A589A0(&buf, v426, v62);
    }
    LODWORD(v138) = 0;
    char v414 = 0;
    goto LABEL_77;
  }
  char v20 = 1;
LABEL_95:

  return v20 & 1;
}

+ (BOOL)_transitionIsPossibleFromSegment:(id)a3 toSegment:(id)a4 forBodyClipPlaylist:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v13 = objc_msgSend_sortedArrayUsingComparator_(v9, v10, (uint64_t)&unk_26C7FE9A8, v11, v12);
  unint64_t v17 = objc_msgSend_indexOfObject_(v13, v14, (uint64_t)v7, v15, v16);
  unint64_t v21 = objc_msgSend_indexOfObject_(v13, v18, (uint64_t)v8, v19, v20);
  uint64_t v26 = objc_msgSend_array(MEMORY[0x263EFF980], v22, v23, v24, v25);
  unint64_t v30 = v26;
  BOOL v31 = 0;
  if (v17 != 0x7FFFFFFFFFFFFFFFLL && v21 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v17 >= v21)
    {
      if (v17 <= v21)
      {
        if (v17 == v21) {
          objc_msgSend_addObject_(v26, v27, (uint64_t)v8, v28, v29);
        }
        char v65 = 1;
      }
      else
      {
        uint64_t v102 = v8;
        uint64_t v103 = v26;
        id v100 = v9;
        uint64_t v66 = v17 - 1;
        while (1)
        {
          uint64_t v67 = v66;
          BOOL v68 = v66-- < 1;
          char v65 = v68;
          if (v68) {
            break;
          }
          uint64_t v69 = objc_msgSend_objectAtIndexedSubscript_(v13, v27, v67, v28, v29);
          uint64_t v74 = objc_msgSend_name(v7, v70, v71, v72, v73);
          uint64_t v79 = objc_msgSend_name(v69, v75, v76, v77, v78);
          uint64_t v82 = objc_msgSend_compare_options_(v74, v80, (uint64_t)v79, 65, v81);

          uint64_t v87 = objc_msgSend_name(v102, v83, v84, v85, v86);
          uint64_t v92 = objc_msgSend_name(v69, v88, v89, v90, v91);
          uint64_t v95 = objc_msgSend_compare_options_(v87, v93, (uint64_t)v92, 65, v94);

          if (v82 == -1 && v95 == 1)
          {
            if (v67 > 0)
            {
              id v8 = v102;
              goto LABEL_12;
            }
            break;
          }
        }
        id v8 = v102;
        unint64_t v30 = v103;
        objc_msgSend_addObject_(v103, v27, (uint64_t)v102, v28, v29, v100);
        id v9 = v101;
      }
    }
    else
    {
      uint64_t v103 = v26;
      id v100 = v9;
      id v32 = 0;
      unint64_t v33 = v17 + 1;
      do
      {
        uint64_t v34 = objc_msgSend_objectAtIndexedSubscript_(v13, v27, v33, v28, v29, v100);
        uint64_t v39 = objc_msgSend_name(v7, v35, v36, v37, v38);
        uint64_t v44 = objc_msgSend_name(v34, v40, v41, v42, v43);
        uint64_t v47 = objc_msgSend_compare_options_(v39, v45, (uint64_t)v44, 65, v46);

        if (v47 == -1)
        {
          if (!v32) {
            id v32 = v34;
          }
          uint64_t v52 = objc_msgSend_name(v32, v48, v49, v50, v51);
          uint64_t v57 = objc_msgSend_name(v34, v53, v54, v55, v56);
          unint64_t v60 = objc_msgSend_compare_options_(v52, v58, (uint64_t)v57, 65, v59);

          if (v60 <= 1)
          {
            id v61 = v34;

            objc_msgSend_addObject_(v103, v62, (uint64_t)v61, v63, v64);
            id v32 = v61;
          }
        }

        ++v33;
      }
      while (v33 <= v21);

      char v65 = 1;
LABEL_12:
      id v9 = v100;
      unint64_t v30 = v103;
    }
    v104[0] = MEMORY[0x263EF8330];
    v104[1] = 3221225472;
    v104[2] = sub_217A55DE8;
    v104[3] = &unk_2642B78A0;
    id v105 = v8;
    if (objc_msgSend_indexOfObjectPassingTest_(v30, v96, (uint64_t)v104, v97, v98) == 0x7FFFFFFFFFFFFFFFLL) {
      BOOL v31 = 0;
    }
    else {
      BOOL v31 = v65;
    }
  }
  return v31;
}

- (BOOL)_validateAuthoringIssuesInRendition:(id)a3 failureReason:(id *)a4
{
  uint64_t v167 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v10 = objc_msgSend_segments(v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_firstObject(v10, v11, v12, v13, v14);
  BOOL v16 = v15 != 0;

  if (!v15) {
    *a4 = @"empty playlist!";
  }
  unint64_t v21 = objc_msgSend_segments(v5, v17, v18, v19, v20);
  uint64_t v26 = objc_msgSend_firstObject(v21, v22, v23, v24, v25);

  BOOL v31 = objc_msgSend_segment(v26, v27, v28, v29, v30);
  uint64_t v36 = v31;
  if (v31) {
    uint64_t v37 = objc_msgSend_sampleRate(v31, v32, v33, v34, v35);
  }
  else {
    uint64_t v37 = -1;
  }
  uint64_t v38 = objc_msgSend_segments(v5, v32, v33, v34, v35);
  uint64_t v43 = objc_msgSend_count(v38, v39, v40, v41, v42);

  if (v36 || v43 != 1)
  {
    uint64_t v159 = v26;
    id v160 = v5;
    uint64_t v161 = a4;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    uint64_t v48 = objc_msgSend_segments(v5, v44, v45, v46, v47);
    uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v162, (uint64_t)v166, 16);
    if (!v50) {
      goto LABEL_45;
    }
    uint64_t v55 = v50;
    uint64_t v56 = *(void *)v163;
    while (1)
    {
      uint64_t v57 = 0;
      do
      {
        if (*(void *)v163 != v56) {
          objc_enumerationMutation(v48);
        }
        uint64_t v58 = objc_msgSend_segment(*(void **)(*((void *)&v162 + 1) + 8 * v57), v51, v52, v53, v54);
        uint64_t v63 = v58;
        if (!v58) {
          goto LABEL_33;
        }
        if (objc_msgSend_samplesPerBar(v58, v59, v60, v61, v62) == -1)
        {
          BOOL v68 = objc_msgSend_customBarMarkers(v63, v64, v65, v66, v67);
          uint64_t v73 = objc_msgSend_count(v68, v69, v70, v71, v72);

          if (!v73)
          {
            uint64_t v147 = NSString;
            uint64_t v155 = objc_msgSend_name(v63, v74, v75, v76, v77);
            objc_msgSend_stringWithFormat_(v147, v148, @"samplesPerBar is -1, customBarMarkers.count should be > 0 please fix %@", v149, v150, v155);
            goto LABEL_44;
          }
          uint64_t v78 = objc_msgSend_customBarMarkers(v63, v74, v75, v76, v77);
          uint64_t v83 = objc_msgSend_count(v78, v79, v80, v81, v82);
          uint64_t v88 = objc_msgSend_bars(v63, v84, v85, v86, v87);

          if (v83 != v88)
          {
            uint64_t v151 = NSString;
            uint64_t v155 = objc_msgSend_name(v63, v89, v90, v91, v92);
            uint64_t v158 = v155;
            uint64_t v156 = @"samplesPerBar is -1, customBarMarkers.count should equal segment.bars please fix %@";
            goto LABEL_43;
          }
          uint64_t v93 = objc_msgSend_customBarMarkers(v63, v89, v90, v91, v92);
          uint64_t v98 = objc_msgSend_count(v93, v94, v95, v96, v97);

          if (v98)
          {
            unint64_t v103 = 0;
            while (1)
            {
              uint64_t v104 = objc_msgSend_barDurationForBarIndex_(v63, v99, v103, v101, v102);
              if (v104 >= objc_msgSend_sampleCount(v63, v105, v106, v107, v108)) {
                break;
              }
              ++v103;
              uint64_t v113 = objc_msgSend_customBarMarkers(v63, v109, v110, v111, v112);
              unint64_t v118 = objc_msgSend_count(v113, v114, v115, v116, v117);

              if (v103 >= v118) {
                goto LABEL_27;
              }
            }
            long long v141 = NSString;
            uint64_t v142 = objc_msgSend_name(v63, v109, v110, v111, v112);
            objc_msgSend_stringWithFormat_(v141, v143, @"custom barDuration should be less than sampleCount. please fix %@", v144, v145, v142);
            id *v161 = (id)objc_claimAutoreleasedReturnValue();

            BOOL v16 = 0;
            goto LABEL_33;
          }
          goto LABEL_27;
        }
        if (objc_msgSend_bars(v63, v64, v65, v66, v67) >= 2)
        {
          uint64_t v123 = objc_msgSend_samplesPerBar(v63, v119, v120, v121, v122);
          if (v123 >= objc_msgSend_sampleCount(v63, v124, v125, v126, v127))
          {
            uint64_t v151 = NSString;
            uint64_t v155 = objc_msgSend_name(v63, v99, v100, v101, v102);
            uint64_t v158 = v155;
            uint64_t v156 = @"samplesPerBar should be less than sampleCount if we have more than one bar. please fix %@";
            goto LABEL_43;
          }
LABEL_27:
          BOOL v16 = 1;
          goto LABEL_28;
        }
        if (objc_msgSend_bars(v63, v119, v120, v121, v122) == 1)
        {
          uint64_t v132 = objc_msgSend_samplesPerBar(v63, v128, v129, v130, v131);
          if (v132 != objc_msgSend_sampleCount(v63, v133, v134, v135, v136))
          {
            uint64_t v151 = NSString;
            uint64_t v155 = objc_msgSend_name(v63, v99, v100, v101, v102);
            uint64_t v158 = v155;
            uint64_t v156 = @"samplesPerBar should equal sampleCount if we only have one bar. please fix %@";
LABEL_43:
            objc_msgSend_stringWithFormat_(v151, v152, (uint64_t)v156, v153, v154, v158);
LABEL_44:
            id *v161 = (id)objc_claimAutoreleasedReturnValue();

            BOOL v16 = 0;
            goto LABEL_45;
          }
          goto LABEL_27;
        }
        if (!objc_msgSend_bars(v63, v128, v129, v130, v131))
        {
          uint64_t v151 = NSString;
          uint64_t v155 = objc_msgSend_name(v63, v99, v100, v101, v102);
          uint64_t v158 = v155;
          uint64_t v156 = @"samplesPerBar should not be 0. please fix %@";
          goto LABEL_43;
        }
LABEL_28:
        if (v16 && v37 >= 1)
        {
          if (objc_msgSend_sampleRate(v63, v99, v100, v101, v102) != v37)
          {
            uint64_t v151 = NSString;
            uint64_t v155 = objc_msgSend_name(v63, v137, v138, v139, v140);
            uint64_t v158 = v155;
            uint64_t v156 = @"sample rates must be the same for all segments. please fix %@";
            goto LABEL_43;
          }
          BOOL v16 = 1;
        }
LABEL_33:

        ++v57;
      }
      while (v57 != v55);
      uint64_t v146 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v51, (uint64_t)&v162, (uint64_t)v166, 16);
      uint64_t v55 = v146;
      if (!v146)
      {
LABEL_45:

        uint64_t v26 = v159;
        id v5 = v160;
        break;
      }
    }
  }

  return v16;
}

- (int64_t)_samplesForDuration:(id *)a3
{
  int32_t v6 = objc_msgSend_sampleRate(self, a2, (uint64_t)a3, v3, v4);
  CMTime v8 = *(CMTime *)a3;
  CMTimeConvertScale(&v9, &v8, v6, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
  return v9.value;
}

- (BOOL)verifyRendition:(id)a3 forDuration:(id *)a4 failureReason:(id *)a5
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    v58.receiver = self;
    v58.super_class = (Class)FlexSong;
    long long v56 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    if (![(FlexSongBackend *)&v58 verifyRendition:v9 forDuration:&v56 failureReason:a5])goto LABEL_9; {
    uint64_t v14 = objc_msgSend_segments(v9, v10, v11, v12, v13);
    }

    if (!v14)
    {
      char v36 = 0;
      *a5 = @"no playlist! The playback algorithm could not generate a playlist for this duration or there is an issue with the authoring tool";
      goto LABEL_12;
    }
    long long v56 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    uint64_t v18 = objc_msgSend__samplesForDuration_(self, v15, (uint64_t)&v56, v16, v17);
    uint64_t v23 = objc_msgSend_segments(v9, v19, v20, v21, v22);
    uint64_t v27 = objc_msgSend__sampleDurationOfClipPlaylist_(self, v24, (uint64_t)v23, v25, v26);

    if (v18 != v27)
    {
      uint64_t v45 = NSString;
      double v46 = (double)v18 / (double)objc_msgSend_sampleRate(self, v28, v29, v30, v31);
      uint64_t v51 = objc_msgSend_sampleRate(self, v47, v48, v49, v50);
      objc_msgSend_stringWithFormat_(v45, v52, @"expected duration (%.2fs, %lld) does not match duration (%.2fs, %lld) of clipPlaylist! Possibly no valid intro or outro valid for this duration?", v53, v54, *(void *)&v46, v18, (double)v27 / (double)v51, v27);
      char v36 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (objc_msgSend__validateAuthoringIssuesInRendition_failureReason_(self, v28, (uint64_t)v9, (uint64_t)a5, v31)&& objc_msgSend__validateStructureForRendition_failureReason_(self, v32, (uint64_t)v9, (uint64_t)a5, v33))
    {
      char v36 = objc_msgSend__validateTransitionsInRendition_failureReason_(self, v34, (uint64_t)v9, (uint64_t)a5, v35);
    }
    else
    {
LABEL_9:
      char v36 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v37 = NSString;
  uint64_t v38 = (objc_class *)objc_opt_class();
  uint64_t v39 = NSStringFromClass(v38);
  uint64_t v40 = (objc_class *)objc_opt_class();
  uint64_t v41 = NSStringFromClass(v40);
  objc_msgSend_stringWithFormat_(v37, v42, @"Expected a %@ class but found a %@", v43, v44, v39, v41);
  *a5 = (id)objc_claimAutoreleasedReturnValue();

  char v36 = 0;
LABEL_13:

  return v36;
}

- (BOOL)_verifyAssetsForSegment:(id)a3 withFailureReason:(id *)a4
{
  v184[1] = *MEMORY[0x263EF8340];
  id v10 = a3;
  if (v10)
  {
    uint64_t v11 = objc_msgSend_assetProvider(self, v6, v7, v8, v9);
    uint64_t v15 = objc_msgSend_urlToAudioForSegment_(v11, v12, (uint64_t)v10, v13, v14);

    if (v15)
    {
      unsigned __int8 v176 = 0;
      uint64_t v20 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v16, v17, v18, v19);
      uint64_t v25 = objc_msgSend_path(v15, v21, v22, v23, v24);
      int isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v20, v26, (uint64_t)v25, (uint64_t)&v176, v27);
      int v29 = v176;

      if (isDirectory && !v29)
      {
        uint64_t v34 = objc_msgSend_path(v15, v30, v31, v32, v33);
        uint64_t v38 = objc_msgSend_readInfoFromAudioFileAtPath_(FlexSegment, v35, (uint64_t)v34, v36, v37);

        if (v38)
        {
          uint64_t v43 = objc_msgSend_sampleRate(v10, v39, v40, v41, v42);
          if (v43 == objc_msgSend_sampleRate(v38, v44, v45, v46, v47))
          {
            uint64_t v52 = objc_msgSend_sampleCount(v10, v48, v49, v50, v51);
            if (v52 == objc_msgSend_sampleCount(v38, v53, v54, v55, v56)) {
              goto LABEL_12;
            }
            uint64_t v61 = objc_msgSend_sampleCount(v10, v57, v58, v59, v60);
            if (v61 == objc_msgSend_sampleCount(v38, v62, v63, v64, v65) - 1)
            {
              uint64_t v70 = FlexLogForCategory(1uLL);
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG)) {
                sub_217A589E0(v15, (char *)v10, v70, v71, v72);
              }

LABEL_12:
              uint64_t v73 = (void *)MEMORY[0x263EFA8D0];
              uint64_t v183 = *MEMORY[0x263EFA288];
              v184[0] = MEMORY[0x263EFFA88];
              uint64_t v74 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v57, (uint64_t)v184, (uint64_t)&v183, 1);
              uint64_t v77 = objc_msgSend_URLAssetWithURL_options_(v73, v75, (uint64_t)v15, (uint64_t)v74, v76);

              dispatch_semaphore_t v78 = dispatch_semaphore_create(0);
              v174[0] = MEMORY[0x263EF8330];
              v174[1] = 3221225472;
              v174[2] = sub_217A56B54;
              v174[3] = &unk_2642B6D78;
              uint64_t v79 = v78;
              uint64_t v175 = v79;
              objc_msgSend_loadValuesAsynchronouslyForKeys_completionHandler_(v77, v80, (uint64_t)&unk_26C806FE8, (uint64_t)v174, v81);
              dispatch_time_t v82 = dispatch_time(0, 20000000000);
              if (dispatch_semaphore_wait(v79, v82))
              {
                if (a4)
                {
                  uint64_t v87 = NSString;
                  uint64_t v88 = objc_msgSend_lastPathComponent(v15, v83, v84, v85, v86);
                  objc_msgSend_stringWithFormat_(v87, v89, @"Timed out waiting for %@ to load", v90, v91, v88);
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                }
                goto LABEL_15;
              }
              memset(&v173, 0, sizeof(v173));
              if (v77) {
                objc_msgSend_duration(v77, v83, v84, v85, v86);
              }
              else {
                memset(&time, 0, sizeof(time));
              }
              int32_t v133 = objc_msgSend_sampleRate(v10, v83, v84, v85, v86);
              BOOL v92 = 1;
              CMTimeConvertScale(&v173, &time, v133, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
              uint64_t v138 = objc_msgSend_sampleCount(v10, v134, v135, v136, v137);
              if (v138 == v173.value) {
                goto LABEL_40;
              }
              uint64_t v143 = objc_msgSend_sampleCount(v10, v139, v140, v141, v142);
              BOOL v92 = v143 == v173.value - 1;
              if (v143 == v173.value - 1)
              {
                uint64_t v148 = FlexLogForCategory(1uLL);
                if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v153 = objc_msgSend_lastPathComponent(v15, v149, v150, v151, v152);
                  CMTimeValue value = v173.value;
                  uint64_t v159 = objc_msgSend_sampleCount(v10, v155, v156, v157, v158);
                  *(_DWORD *)uint8_t buf = 138412802;
                  uint64_t v178 = v153;
                  __int16 v179 = 2048;
                  CMTimeValue v180 = value;
                  __int16 v181 = 2048;
                  uint64_t v182 = v159;
                  _os_log_debug_impl(&dword_217A2F000, v148, OS_LOG_TYPE_DEBUG, "%@: asset.duration %lld is 1 sample longer than segment.sampleCount %lld", buf, 0x20u);
                }
              }
              else
              {
                if (!a4)
                {
LABEL_15:
                  BOOL v92 = 0;
LABEL_40:

                  goto LABEL_41;
                }
                id v160 = NSString;
                uint64_t v148 = objc_msgSend_lastPathComponent(v15, v144, v145, v146, v147);
                CMTimeValue v161 = v173.value;
                uint64_t v166 = objc_msgSend_sampleCount(v10, v162, v163, v164, v165);
                objc_msgSend_stringWithFormat_(v160, v167, @"%@: asset.duration (%lld) does not match segment.sampleCount (%lld)", v168, v169, v148, v161, v166);
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }

              goto LABEL_40;
            }
            if (a4)
            {
              uint64_t v120 = NSString;
              uint64_t v77 = objc_msgSend_lastPathComponent(v15, v66, v67, v68, v69);
              uint64_t v125 = objc_msgSend_sampleCount(v38, v121, v122, v123, v124);
              uint64_t v171 = objc_msgSend_sampleCount(v10, v126, v127, v128, v129);
              objc_msgSend_stringWithFormat_(v120, v130, @"%@: kExtAudioFileProperty_FileLengthFrames (%lld) does not match segment.sampleCount (%lld)", v131, v132, v77, v125, v171);
              goto LABEL_30;
            }
            goto LABEL_31;
          }
          if (a4)
          {
            uint64_t v106 = NSString;
            uint64_t v107 = objc_msgSend_sampleRate(v38, v48, v49, v50, v51);
            uint64_t v112 = objc_msgSend_sampleRate(v10, v108, v109, v110, v111);
            uint64_t v77 = objc_msgSend_lastPathComponent(v15, v113, v114, v115, v116);
            objc_msgSend_stringWithFormat_(v106, v117, @"audio file sample rate (%ld) does not match sample rate (%ld) of \"%@\"", v118, v119, v107, v112, v77);
            goto LABEL_30;
          }
        }
        else if (a4)
        {
          uint64_t v102 = NSString;
          uint64_t v77 = objc_msgSend_path(v15, v39, v40, v41, v42);
          objc_msgSend_stringWithFormat_(v102, v103, @"could not read info for audio file: \"%@\"", v104, v105, v77);
LABEL_30:
          BOOL v92 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

          goto LABEL_42;
        }
LABEL_31:
        BOOL v92 = 0;
        goto LABEL_42;
      }
      if (a4)
      {
        uint64_t v98 = NSString;
        uint64_t v38 = objc_msgSend_name(v10, v30, v31, v32, v33);
        objc_msgSend_stringWithFormat_(v98, v99, @"audio file does not exist for segment \"%@\"", v100, v101, v38);
        BOOL v92 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_42:

        goto LABEL_43;
      }
    }
    else if (a4)
    {
      uint64_t v93 = NSString;
      uint64_t v94 = objc_msgSend_name(v10, v16, v17, v18, v19);
      objc_msgSend_stringWithFormat_(v93, v95, @"could not determine url for segment \"%@\"", v96, v97, v94);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v92 = 0;
LABEL_43:

    goto LABEL_44;
  }
  BOOL v92 = 1;
LABEL_44:

  return v92;
}

- (BOOL)verifyAssetsWithFailureReason:(id *)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v11 = objc_msgSend__metadataDictFromCache(self, a2, (uint64_t)a3, v3, v4);
  if (!v11)
  {
    uint64_t v12 = FlexLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl(&dword_217A2F000, v12, OS_LOG_TYPE_DEFAULT, "flex: missing metadataDict!", buf, 2u);
    }
  }
  uint64_t v17 = objc_msgSend__decodedMainSegmentsFromCache(self, v7, v8, v9, v10);
  if (!v17)
  {
    uint64_t v18 = FlexLogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t buf = 0;
      _os_log_impl(&dword_217A2F000, v18, OS_LOG_TYPE_DEFAULT, "flex: missing decodedMainSegments!", buf, 2u);
    }
  }
  objc_msgSend__destroyCache(self, v13, v14, v15, v16);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v19 = v17;
  uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v29, (uint64_t)v34, 16);
  if (v21)
  {
    uint64_t v24 = v21;
    uint64_t v25 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v19);
        }
        if (!objc_msgSend__verifyAssetsForSegment_withFailureReason_(self, v22, *(void *)(*((void *)&v29 + 1) + 8 * i), (uint64_t)a3, v23, (void)v29))
        {
          BOOL v27 = 0;
          goto LABEL_19;
        }
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v29, (uint64_t)v34, 16);
      if (v24) {
        continue;
      }
      break;
    }
  }
  BOOL v27 = 1;
LABEL_19:

  return v27;
}

- (id)timedMetadataItemsWithIdentifier:(id)a3 forRendition:(id)a4
{
  uint64_t v730 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  v632 = v7;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v316 = (id)MEMORY[0x263EFFA68];
    goto LABEL_227;
  }
  id v633 = v7;
  uint64_t v12 = objc_msgSend_array(MEMORY[0x263EFF980], v8, v9, v10, v11);
  uint64_t v644 = (uint64_t)v6;
  v678 = self;
  v679 = v12;
  if ((objc_msgSend_isEqualToString_(v6, v13, @"FMTimedMetadataIdentifierSection", v14, v15) & 1) != 0
    || objc_msgSend_isEqualToString_(v6, v16, @"FMTimedMetadataIdentifierSegment", v17, v18))
  {
    int isEqualToString = objc_msgSend_isEqualToString_(v6, v16, @"FMTimedMetadataIdentifierSection", v17, v18);
    uint64_t v24 = objc_msgSend_segments(v633, v20, v21, v22, v23);
    objc_msgSend_lastObject(v24, v25, v26, v27, v28);
    id v637 = (id)objc_claimAutoreleasedReturnValue();

    long long v719 = 0u;
    long long v718 = 0u;
    long long v717 = 0u;
    long long v716 = 0u;
    objc_msgSend_segments(v633, v29, v30, v31, v32);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v640 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v716, (uint64_t)v729, 16);
    if (v640)
    {
      v645 = 0;
      id v39 = 0;
      int64_t v40 = 0;
      uint64_t v639 = *(void *)v717;
      if (isEqualToString) {
        uint64_t v41 = @"SILENCE";
      }
      else {
        uint64_t v41 = @"silence";
      }
      v634 = v41;
      unint64_t v42 = 0x2642B6000uLL;
      int v636 = isEqualToString;
      id obj = v33;
      while (1)
      {
        uint64_t v43 = 0;
        uint64_t v44 = v39;
        do
        {
          if (*(void *)v717 != v639) {
            objc_enumerationMutation(obj);
          }
          id v45 = *(id *)(*((void *)&v716 + 1) + 8 * v43);
          uint64_t v46 = objc_msgSend_segment(v45, v35, v36, v37, v38);
          uint64_t v51 = v46;
          v657 = v44;
          v661 = v45;
          if (!v46)
          {
            uint64_t v61 = v634;
            if (isEqualToString)
            {
              id v66 = 0;
              id v67 = 0;
              v675 = 0;
              v647 = 0;
              v649 = 0;
              v651 = 0;
              v654 = 0;
              id v665 = 0;
              uint64_t v68 = @"SILENCE";
              v667 = @"SILENCE";
              v669 = 0;
            }
            else
            {
              objc_msgSend_numberWithInt_(NSNumber, v62, 1, v64, v65);
              v649 = v647 = 0;
              id v66 = 0;
              id v67 = 0;
              v675 = 0;
              v651 = 0;
              v654 = 0;
              id v665 = 0;
              v667 = @"SILENCE";
              v669 = 0;
              uint64_t v68 = @"silence";
            }
            id v671 = v68;
            goto LABEL_51;
          }
          if (objc_msgSend_type(v46, v47, v48, v49, v50) == 1
            || objc_msgSend_type(v51, v52, v53, v54, v55) == 4
            || objc_msgSend_type(v51, v52, v53, v54, v55) == 3)
          {
            if (isEqualToString)
            {
              uint64_t v56 = *(void **)(v42 + 2856);
              uint64_t v57 = objc_msgSend_type(v51, v52, v53, v54, v55);
              objc_msgSend_longLabelForSegmentType_(v56, v58, v57, v59, v60);
            }
            else
            {
              objc_msgSend_name(v51, v52, v53, v54, v55);
            }
            id v671 = (id)objc_claimAutoreleasedReturnValue();

            uint64_t v69 = *(void **)(v42 + 2856);
            uint64_t v74 = objc_msgSend_type(v51, v70, v71, v72, v73);
            objc_msgSend_longLabelForSegmentType_(v69, v75, v74, v76, v77);
            v667 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_type(v51, v78, v79, v80, v81) == 4)
            {
              uint64_t v86 = objc_msgSend_offset(v45, v82, v83, v84, v85);
              uint64_t v91 = objc_msgSend_duration(v45, v87, v88, v89, v90);
              uint64_t v96 = objc_msgSend_sampleCount(v51, v92, v93, v94, v95);
              uint64_t v101 = objc_msgSend_markers(v51, v97, v98, v99, v100);
              uint64_t v105 = objc_msgSend_objectForKey_(v101, v102, @"OUTRO_STINGER", v103, v104);

              if (!v105 || (uint64_t v110 = objc_msgSend_integerValue(v105, v106, v107, v108, v109), v110 < 0))
              {
                unint64_t v112 = 0;
              }
              else
              {
                uint64_t v111 = v110;
                if (v110 >= objc_msgSend_sampleCount(v51, v106, v107, v108, v109)) {
                  unint64_t v112 = 0;
                }
                else {
                  unint64_t v112 = v111;
                }
              }
              int isEqualToString = v636;
              uint64_t v113 = v91 + v86;
              uint64_t v114 = v40 - objc_msgSend_offset(v661, v106, v107, v108, v109);
              v669 = objc_msgSend_numberWithLongLong_(NSNumber, v115, v114 + v112, v116, v117);
              if (v113 >= v96)
              {
                v675 = 0;
              }
              else
              {
                uint64_t v122 = objc_msgSend_options(v633, v118, v119, v120, v121);
                uint64_t MaxLengthInSamplesToReserveForOutroSegment_withOptions = objc_msgSend__findMaxLengthInSamplesToReserveForOutroSegment_withOptions_(FlexSong, v123, (uint64_t)v51, (uint64_t)v122, v124);

                uint64_t v132 = objc_msgSend_options(v633, v126, v127, v128, v129);
                if (MaxLengthInSamplesToReserveForOutroSegment_withOptions < 1)
                {
                  uint64_t EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions = objc_msgSend__findEarlyFadeStartOffsetInSamplesForOutroSegment_withOptions_(FlexSong, v130, (uint64_t)v51, (uint64_t)v132, v131);
                }
                else
                {
                  uint64_t MinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions = objc_msgSend__findMinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions_(FlexSong, v130, (uint64_t)v51, (uint64_t)v132, v131);

                  uint64_t v138 = objc_msgSend_offset(v661, v134, v135, v136, v137);
                  uint64_t EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions = v138
                                                                           - MinLengthInSamplesForEarlyFadeOutForOutroSegment_withOptions
                                                                           + objc_msgSend_duration(v661, v139, v140, v141, v142);
                }
                unint64_t v172 = EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions & ~(EarlyFadeStartOffsetInSamplesForOutroSegment_withOptions >> 63);
                v675 = objc_msgSend_numberWithLongLong_(NSNumber, v143, v172 + v114, v144, v145);
                self = v678;
                int isEqualToString = v636;
                if (v112 >= v172)
                {
                  uint64_t v176 = objc_msgSend_numberWithLongLong_(NSNumber, v173, v114, v174, v175);

                  v669 = (void *)v176;
                }
              }
              id v45 = v661;
            }
            else
            {
              v675 = 0;
              v669 = 0;
            }
            v651 = 0;
            v654 = 0;
            id v665 = 0;
          }
          else
          {
            if (objc_msgSend_type(v51, v52, v53, v54, v55) != 2)
            {
              objc_msgSend_type(v51, v147, v148, v149, v150);
LABEL_108:
              id v671 = 0;
              v675 = 0;
              v667 = 0;
              v669 = 0;
              v651 = 0;
              v654 = 0;
              id v665 = 0;
              int v177 = 0;
              goto LABEL_45;
            }
            if (isEqualToString)
            {
              uint64_t v151 = objc_msgSend_nameIndex(v51, v147, v148, v149, v150);

              if (v151 == v645) {
                goto LABEL_108;
              }
              uint64_t v153 = NSString;
              uint64_t v154 = *(void **)(v42 + 2856);
              uint64_t v155 = objc_msgSend_type(v51, v82, v152, v84, v85);
              uint64_t v159 = objc_msgSend_longLabelForSegmentType_(v154, v156, v155, v157, v158);
              uint64_t v164 = objc_msgSend_nameIndex(v51, v160, v161, v162, v163);
              objc_msgSend_stringWithFormat_(v153, v165, @"%@ %@", v166, v167, v159, v164);
              id v671 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend_name(v51, v147, v148, v149, v150);
              id v671 = (id)objc_claimAutoreleasedReturnValue();
            }
            uint64_t v285 = *(void **)(v42 + 2856);
            uint64_t v286 = objc_msgSend_type(v51, v168, v169, v170, v171);
            objc_msgSend_longLabelForSegmentType_(v285, v287, v286, v288, v289);
            v667 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v290 = NSNumber;
            uint64_t v295 = objc_msgSend_nameIndex(v51, v291, v292, v293, v294);
            uint64_t v300 = objc_msgSend_intValue(v295, v296, v297, v298, v299);
            objc_msgSend_numberWithInt_(v290, v301, v300, v302, v303);
            id v665 = (id)objc_claimAutoreleasedReturnValue();

            uint64_t v304 = NSNumber;
            id v45 = v661;
            uint64_t v309 = objc_msgSend_barsUsed(v661, v305, v306, v307, v308);
            v654 = objc_msgSend_numberWithInteger_(v304, v310, v309, v311, v312);
            if (isEqualToString)
            {
              v675 = 0;
              v669 = 0;
              v651 = 0;
            }
            else
            {
              v651 = objc_msgSend_nameSuffix(v51, v82, v313, v84, v85);
              v675 = 0;
              v669 = 0;
            }
          }
          int v177 = 1;
LABEL_45:
          objc_msgSend_metadataValueForKey_(v51, v82, @"PeakValue", v84, v85);
          id v67 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_metadataValueForKey_(v51, v178, @"Loudness", v179, v180);
          id v66 = (id)objc_claimAutoreleasedReturnValue();
          if (!v177)
          {
            v647 = 0;
            v649 = 0;
            goto LABEL_100;
          }
          if (isEqualToString)
          {
            v647 = 0;
            v649 = 0;
          }
          else
          {
            __int16 v181 = NSNumber;
            uint64_t v182 = objc_msgSend_priority(v51, v62, v63, v64, v65);
            v649 = objc_msgSend_numberWithInteger_(v181, v183, v182, v184, v185);
            uint64_t v190 = objc_msgSend_analysisData(self, v186, v187, v188, v189);
            uint64_t v194 = objc_msgSend_objectForKeyedSubscript_(v190, v191, @"energy", v192, v193);
            v647 = objc_msgSend_objectForKey_(v194, v195, (uint64_t)v671, v196, v197);

            id v45 = v661;
          }
          uint64_t v44 = v657;
LABEL_51:
          int64_t v198 = v40;
          if (v44) {
            int64_t v198 = v40 - objc_msgSend_duration(v44, v62, v63, v64, v65);
          }
          memset(&v715, 0, sizeof(v715));
          if (v45 == v637)
          {
            int64_t v203 = objc_msgSend_duration(v637, v62, v63, v64, v65);
            if (v44) {
              v203 += objc_msgSend_duration(v44, v199, v200, v201, v202);
            }
            int32_t v204 = objc_msgSend_sampleRate(self, v199, v200, v201, v202);
            CMTimeMake(&v715, v203, v204);
          }
          else
          {
            CMTime v715 = *(CMTime *)*(void *)&MEMORY[0x263F010E0];
          }
          memset(&v714, 0, sizeof(v714));
          int32_t v205 = objc_msgSend_sampleRate(self, v62, v63, v64, v65);
          CMTimeMake(&start, v198, v205);
          duration.CMTime start = v715;
          CMTimeRangeMake(&v714, &start, &duration.start);
          uint64_t v210 = objc_msgSend_dictionary(MEMORY[0x263EFF9A0], v206, v207, v208, v209);
          uint64_t v214 = v210;
          if (isEqualToString)
          {
            if (v667) {
              objc_msgSend_setObject_forKey_(v210, v211, (uint64_t)v667, @"SectionType", v213);
            }
            if (v665) {
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v665, @"BodyNumber", v213);
            }
            if (v669) {
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v669, @"OutroStinger", v213);
            }
            if (v675) {
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v675, @"OutroEarlyFade", v213);
            }
          }
          else
          {
            if (v667) {
              objc_msgSend_setObject_forKey_(v210, v211, (uint64_t)v667, @"SegmentType", v213);
            }
            if (v649) {
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v649, @"Priority", v213);
            }
            if (v665) {
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v665, @"BodyNumber", v213);
            }
            if (v651) {
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v651, @"BodyLetter", v213);
            }
            if (v654) {
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v654, @"BarsUsed", v213);
            }
            if (v647) {
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v647, @"Energy", v213);
            }
            uint64_t v215 = (uint64_t)v669;
            if (v669) {
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v669, @"OutroStinger", v213);
            }
            if (v675) {
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v675, @"OutroEarlyFade", v213);
            }
            if (v44)
            {
              uint64_t v216 = objc_msgSend_segment(v44, v211, v215, v212, v213);
              uint64_t v220 = objc_msgSend_metadataValueForKey_(v216, v217, @"PeakValue", v218, v219);

              uint64_t v225 = objc_msgSend_segment(v44, v221, v222, v223, v224);
              uint64_t v229 = objc_msgSend_metadataValueForKey_(v225, v226, @"Loudness", v227, v228);

              if (v220)
              {
                if (v67)
                {
                  uint64_t v234 = v67;
                  objc_msgSend_doubleValue(v220, v230, v231, v232, v233);
                  double v236 = v235;
                  objc_msgSend_doubleValue(v67, v237, v238, v239, v240);
                  if (v236 > v241)
                  {
                    id v67 = v220;
                  }
                }
                else
                {
                  id v67 = v220;
                }
              }
              if (v229)
              {
                if (v66)
                {
                  objc_msgSend_doubleValue(v229, v230, v231, v232, v233);
                  double v243 = v242;
                  uint64_t v248 = objc_msgSend_duration(v657, v244, v245, v246, v247);
                  objc_msgSend_doubleValue(v66, v249, v250, v251, v252);
                  double v254 = v253;
                  uint64_t v259 = objc_msgSend_duration(v661, v255, v256, v257, v258);
                  uint64_t v264 = objc_msgSend_numberWithDouble_(NSNumber, v260, v261, v262, v263, (v254 * (double)v259 + v243 * (double)v248) / (double)(v259 + v248));

                  id v66 = (id)v264;
                }
                else
                {
                  id v66 = v229;
                }
              }

              int isEqualToString = v636;
            }
            if (v67) {
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v67, @"PeakValue", v213);
            }
            if (v66) {
              objc_msgSend_setObject_forKey_(v214, v211, (uint64_t)v66, @"Loudness", v213);
            }
          }
          uint64_t v265 = [FMTimedMetadataItem alloc];
          uint64_t v269 = objc_msgSend_dictionaryWithDictionary_(NSDictionary, v266, (uint64_t)v214, v267, v268);
          duratiouint64_t n = v714;
          uint64_t v271 = objc_msgSend_initWithIdentifier_name_timeRange_values_(v265, v270, v644, (uint64_t)v671, (uint64_t)&duration, v269);

          objc_msgSend_addObject_(v679, v272, (uint64_t)v271, v273, v274);
          if (!v51)
          {

            v645 = 0;
            uint64_t v280 = 0;
            id v45 = v661;
            goto LABEL_105;
          }
          id v45 = v661;
LABEL_100:
          objc_msgSend_nameIndex(v51, v62, v63, v64, v65);
          id v275 = (id)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend_type(v51, v276, v277, v278, v279) == 5) {
            uint64_t v280 = v45;
          }
          else {
            uint64_t v280 = 0;
          }
          v645 = v275;
LABEL_105:
          id v39 = v280;

          v40 += objc_msgSend_duration(v45, v281, v282, v283, v284);
          ++v43;
          uint64_t v44 = v39;
          unint64_t v42 = 0x2642B6000;
        }
        while (v640 != v43);
        id v33 = obj;
        uint64_t v314 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v716, (uint64_t)v729, 16);
        uint64_t v640 = v314;
        if (!v314)
        {

          uint64_t v12 = v679;
          uint64_t v315 = v637;
          id v6 = (id)v644;
          goto LABEL_185;
        }
      }
    }
LABEL_184:
    uint64_t v315 = v637;
LABEL_185:

    goto LABEL_186;
  }
  if (objc_msgSend_isEqualToString_(v6, v16, @"FMTimedMetadataIdentifierBar", v17, v18))
  {
    long long v710 = 0u;
    long long v711 = 0u;
    long long v708 = 0u;
    long long v709 = 0u;
    uint64_t v315 = objc_msgSend_segments(v633, v317, v318, v319, v320);
    uint64_t v655 = objc_msgSend_countByEnumeratingWithState_objects_count_(v315, v321, (uint64_t)&v708, (uint64_t)v728, 16);
    if (v655)
    {
      id v33 = 0;
      int64_t v326 = 0;
      uint64_t v652 = *(void *)v709;
      id v638 = v315;
      while (1)
      {
        uint64_t v327 = 0;
        uint64_t v328 = v33;
        do
        {
          if (*(void *)v709 != v652) {
            objc_enumerationMutation(v315);
          }
          v676 = *(void **)(*((void *)&v708 + 1) + 8 * v327);
          uint64_t v333 = objc_msgSend_segment(v676, v322, v323, v324, v325);
          if (!v333)
          {
            uint64_t v345 = 0;
            goto LABEL_146;
          }
          uint64_t v662 = v327;
          int64_t v334 = v326;
          if (v328) {
            int64_t v334 = v326 - objc_msgSend_duration(v328, v329, v330, v331, v332);
          }
          v658 = v328;
          uint64_t v335 = objc_msgSend_duration(v676, v329, v330, v331, v332);
          if (objc_msgSend_type(v333, v336, v337, v338, v339) == 2
            || objc_msgSend_type(v333, v340, v341, v342, v343) == 3
            || objc_msgSend_type(v333, v340, v341, v342, v343) == 4)
          {
            if (objc_msgSend_type(v333, v340, v341, v342, v343) == 4)
            {
              uint64_t v344 = 1;
LABEL_132:
              uint64_t v346 = 0;
              uint64_t v347 = 0;
              int64_t v672 = v334;
              do
              {
                uint64_t v348 = objc_msgSend_offset(v676, v340, v341, v342, v343);
                if (objc_msgSend_type(v333, v349, v350, v351, v352) == 4) {
                  uint64_t v357 = 1;
                }
                else {
                  uint64_t v357 = objc_msgSend_beatsPerBar(v333, v353, v354, v355, v356);
                }
                uint64_t v358 = v347 - v348;
                int64_t v359 = v347 - v348 + v326;
                if (v359 >= v334 && v358 < v335)
                {
                  memset(&v714, 0, sizeof(v714));
                  int32_t v361 = objc_msgSend_sampleRate(v678, v353, v354, v355, v356);
                  CMTimeMake(&v707, v359, v361);
                  *(_OWORD *)&duration.start.CMTimeValue value = *MEMORY[0x263F010E0];
                  duration.start.epoch = *(void *)(MEMORY[0x263F010E0] + 16);
                  CMTimeRangeMake(&v714, &v707, &duration.start);
                  uint64_t v362 = NSString;
                  uint64_t v367 = objc_msgSend_name(v333, v363, v364, v365, v366);
                  uint64_t v371 = objc_msgSend_stringWithFormat_(v362, v368, @"%@ BarIndex %d", v369, v370, v367, v346);

                  v726[0] = @"BarIndex";
                  uint64_t v372 = v335;
                  uint64_t v376 = objc_msgSend_numberWithInt_(NSNumber, v373, v346, v374, v375);
                  v727[0] = v376;
                  v726[1] = @"BeatsPerBar";
                  uint64_t v380 = objc_msgSend_numberWithInteger_(NSNumber, v377, v357, v378, v379);
                  v727[1] = v380;
                  objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v381, (uint64_t)v727, (uint64_t)v726, 2);
                  v383 = int64_t v382 = v326;

                  uint64_t v384 = [FMTimedMetadataItem alloc];
                  duratiouint64_t n = v714;
                  uint64_t v386 = objc_msgSend_initWithIdentifier_name_timeRange_values_(v384, v385, @"FMTimedMetadataIdentifierBar", (uint64_t)v371, (uint64_t)&duration, v383);
                  objc_msgSend_addObject_(v679, v387, (uint64_t)v386, v388, v389);

                  int64_t v334 = v672;
                  int64_t v326 = v382;
                  uint64_t v335 = v372;
                }
                v347 += objc_msgSend_barDurationForBarIndex_(v333, v353, v346++, v355, v356);
              }
              while (v344 != v346);
              goto LABEL_143;
            }
            uint64_t v344 = objc_msgSend_bars(v333, v340, v341, v342, v343);
            if (v344 >= 1) {
              goto LABEL_132;
            }
          }
LABEL_143:
          uint64_t v390 = objc_msgSend_type(v333, v340, v341, v342, v343);
          uint64_t v345 = v676;
          if (v390 != 5) {
            uint64_t v345 = 0;
          }
          id v6 = (id)v644;
          uint64_t v315 = v638;
          uint64_t v328 = v658;
          uint64_t v327 = v662;
LABEL_146:
          id v33 = v345;

          v326 += objc_msgSend_duration(v676, v391, v392, v393, v394);
          ++v327;
          uint64_t v328 = v33;
        }
        while (v327 != v655);
        uint64_t v655 = objc_msgSend_countByEnumeratingWithState_objects_count_(v315, v322, (uint64_t)&v708, (uint64_t)v728, 16);
        if (!v655)
        {
          uint64_t v12 = v679;
          goto LABEL_185;
        }
      }
    }
LABEL_186:

    goto LABEL_187;
  }
  if (objc_msgSend_isEqualToString_(v6, v317, @"FMTimedMetadataIdentifierBeat", v319, v320))
  {
    long long v705 = 0u;
    long long v706 = 0u;
    long long v703 = 0u;
    long long v704 = 0u;
    objc_msgSend_segments(v633, v395, v396, v397, v398);
    id v637 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v642 = objc_msgSend_countByEnumeratingWithState_objects_count_(v637, v399, (uint64_t)&v703, (uint64_t)v725, 16);
    if (v642)
    {
      id v33 = 0;
      int64_t v404 = 0;
      uint64_t v641 = *(void *)v704;
      while (1)
      {
        uint64_t v405 = 0;
        uint64_t v406 = v33;
        do
        {
          if (*(void *)v704 != v641) {
            objc_enumerationMutation(v637);
          }
          uint64_t v407 = *(void **)(*((void *)&v703 + 1) + 8 * v405);
          uint64_t v408 = objc_msgSend_segment(v407, v400, v401, v402, v403);
          uint64_t v413 = v408;
          if (v408)
          {
            v646 = v406;
            uint64_t v643 = v405;
            long long v418 = v408;
            if (objc_msgSend_beatsPerBar(v408, v409, v410, v411, v412) >= 1)
            {
              int64_t v419 = v404;
              if (v646) {
                int64_t v419 = v404 - objc_msgSend_duration(v646, v414, v415, v416, v417);
              }
              uint64_t v420 = objc_msgSend_duration(v407, v414, v415, v416, v417);
              if (objc_msgSend_type(v413, v421, v422, v423, v424) == 2
                || objc_msgSend_type(v413, v414, v415, v416, v417) == 3
                || objc_msgSend_type(v413, v414, v415, v416, v417) == 4)
              {
                if (objc_msgSend_type(v413, v414, v415, v416, v417) == 4)
                {
                  uint64_t v653 = 1;
LABEL_166:
                  uint64_t v426 = 0;
                  uint64_t v427 = 0;
                  int64_t v677 = v420 + v404;
                  v648 = v407;
                  int64_t v650 = v404;
                  while (2)
                  {
                    uint64_t v428 = objc_msgSend_offset(v407, v414, v415, v416, v417);
                    if (objc_msgSend_type(v418, v429, v430, v431, v432) == 4)
                    {
                      uint64_t v437 = objc_msgSend_barDurationForBarIndex_(v418, v433, v426, v435, v436);
                      uint64_t v656 = v437;
                      uint64_t v438 = 1;
LABEL_171:
                      uint64_t v443 = 0;
                      uint64_t v659 = v427;
                      uint64_t v663 = v426;
                      int64_t v444 = v427 + v404 - v428;
                      uint64_t v673 = v426;
                      do
                      {
                        if (v444 >= v419 && v444 < v677)
                        {
                          memset(&v714, 0, sizeof(v714));
                          uint64_t v445 = v437;
                          int32_t v446 = objc_msgSend_sampleRate(self, v414, v415, v416, v417);
                          CMTimeMake(&v702, v444, v446);
                          *(_OWORD *)&duration.start.CMTimeValue value = *MEMORY[0x263F010E0];
                          duration.start.epoch = *(void *)(MEMORY[0x263F010E0] + 16);
                          CMTimeRangeMake(&v714, &v702, &duration.start);
                          id v447 = NSString;
                          unint64_t v452 = objc_msgSend_name(v418, v448, v449, v450, v451);
                          v456 = objc_msgSend_stringWithFormat_(v447, v453, @"%@ BarIndex %d BeatIndex %d", v454, v455, v452, v673, v443, v632);

                          v723[0] = @"BarIndex";
                          int64_t v457 = v419;
                          v458 = v418;
                          id v462 = objc_msgSend_numberWithInt_(NSNumber, v459, v673, v460, v461);
                          v724[0] = v462;
                          v723[1] = @"BeatIndex";
                          long long v466 = objc_msgSend_numberWithInteger_(NSNumber, v463, v443, v464, v465);
                          v724[1] = v466;
                          long long v468 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v467, (uint64_t)v724, (uint64_t)v723, 2);

                          uint64_t v12 = v679;
                          long long v469 = [FMTimedMetadataItem alloc];
                          duratiouint64_t n = v714;
                          v471 = objc_msgSend_initWithIdentifier_name_timeRange_values_(v469, v470, @"FMTimedMetadataIdentifierBeat", (uint64_t)v456, (uint64_t)&duration, v468);
                          objc_msgSend_addObject_(v679, v472, (uint64_t)v471, v473, v474);

                          self = v678;
                          long long v418 = v458;
                          int64_t v419 = v457;

                          uint64_t v437 = v445;
                        }
                        ++v443;
                        v444 += v437;
                      }
                      while (v438 != v443);
                      uint64_t v407 = v648;
                      int64_t v404 = v650;
                      uint64_t v427 = v659;
                      uint64_t v426 = v663;
                      uint64_t v442 = v656;
                    }
                    else
                    {
                      uint64_t v438 = objc_msgSend_beatsPerBar(v418, v433, v434, v435, v436);
                      uint64_t v442 = objc_msgSend_barDurationForBarIndex_(v418, v439, v426, v440, v441);
                      if (v438 >= 1)
                      {
                        uint64_t v656 = v442;
                        uint64_t v437 = v442 / v438;
                        goto LABEL_171;
                      }
                    }
                    v427 += v442;
                    if (++v426 == v653) {
                      goto LABEL_178;
                    }
                    continue;
                  }
                }
                uint64_t v653 = objc_msgSend_bars(v413, v414, v415, v416, v417);
                if (v653 >= 1) {
                  goto LABEL_166;
                }
              }
            }
LABEL_178:
            if (objc_msgSend_type(v418, v414, v415, v416, v417) == 5) {
              long long v425 = v407;
            }
            else {
              long long v425 = 0;
            }
            uint64_t v413 = v418;
            uint64_t v405 = v643;
            id v6 = (id)v644;
            uint64_t v406 = v646;
          }
          else
          {
            long long v425 = 0;
          }
          id v33 = v425;

          v404 += objc_msgSend_duration(v407, v475, v476, v477, v478);
          ++v405;
          uint64_t v406 = v33;
        }
        while (v405 != v642);
        uint64_t v642 = objc_msgSend_countByEnumeratingWithState_objects_count_(v637, v400, (uint64_t)&v703, (uint64_t)v725, 16);
        if (!v642) {
          goto LABEL_184;
        }
      }
    }
    uint64_t v315 = v637;
    goto LABEL_186;
  }
LABEL_187:
  if (objc_msgSend_isEqualToString_(v6, v395, @"FMTimedMetadataIdentifierOnset", v397, v398))
  {
    long long v700 = 0u;
    long long v701 = 0u;
    long long v698 = 0u;
    long long v699 = 0u;
    objc_msgSend_segments(v633, v479, v480, v481, v482);
    id v666 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v484 = objc_msgSend_countByEnumeratingWithState_objects_count_(v666, v483, (uint64_t)&v698, (uint64_t)v722, 16);
    if (v484)
    {
      uint64_t v489 = v484;
      int64_t v490 = 0;
      uint64_t v491 = *(void *)v699;
      uint64_t v492 = MEMORY[0x263F010E0];
      uint64_t v493 = MEMORY[0x263EFFA78];
      uint64_t v660 = *(void *)v699;
      do
      {
        uint64_t v494 = 0;
        uint64_t v664 = v489;
        do
        {
          if (*(void *)v699 != v491) {
            objc_enumerationMutation(v666);
          }
          v674 = *(void **)(*((void *)&v698 + 1) + 8 * v494);
          v495 = objc_msgSend_segment(v674, v485, v486, v487, v488);
          if (objc_msgSend_type(v495, v496, v497, v498, v499) == 2)
          {
            uint64_t v670 = v494;
            v504 = objc_msgSend_objectForKeyedSubscript_(v678->_analysisData, v500, @"onsets", v502, v503);
            v668 = v495;
            v509 = objc_msgSend_name(v495, v505, v506, v507, v508);
            v513 = objc_msgSend_objectForKey_(v504, v510, (uint64_t)v509, v511, v512);

            long long v696 = 0u;
            long long v697 = 0u;
            long long v694 = 0u;
            long long v695 = 0u;
            id v514 = v513;
            uint64_t v516 = objc_msgSend_countByEnumeratingWithState_objects_count_(v514, v515, (uint64_t)&v694, (uint64_t)v721, 16);
            if (v516)
            {
              uint64_t v521 = v516;
              uint64_t v522 = *(void *)v695;
              do
              {
                for (uint64_t i = 0; i != v521; ++i)
                {
                  if (*(void *)v695 != v522) {
                    objc_enumerationMutation(v514);
                  }
                  v524 = *(void **)(*((void *)&v694 + 1) + 8 * i);
                  memset(&v715, 0, sizeof(v715));
                  int32_t v525 = objc_msgSend_sampleRate(v678, v517, v518, v519, v520);
                  CMTimeMake(&v715, v490, v525);
                  v714.CMTime start = v715;
                  float Seconds = CMTimeGetSeconds(&v714.start);
                  objc_msgSend_floatValue(v524, v527, v528, v529, v530);
                  memset(&v714, 0, sizeof(v714));
                  Float64 v532 = (float)(v531 + Seconds);
                  int32_t v537 = objc_msgSend_sampleRate(v678, v533, v534, v535, v536);
                  CMTimeMakeWithSeconds(&v693, v532, v537);
                  *(_OWORD *)&duration.start.CMTimeValue value = *(_OWORD *)v492;
                  duration.start.epoch = *(void *)(v492 + 16);
                  CMTimeRangeMake(&v714, &v693, &duration.start);
                  v538 = [FMTimedMetadataItem alloc];
                  v542 = objc_msgSend_stringWithFormat_(NSString, v539, @"onset @ %f", v540, v541, *(void *)&v532);
                  duratiouint64_t n = v714;
                  v544 = objc_msgSend_initWithIdentifier_name_timeRange_values_(v538, v543, @"FMTimedMetadataIdentifierOnset", (uint64_t)v542, (uint64_t)&duration, v493);

                  uint64_t v12 = v679;
                  objc_msgSend_addObject_(v679, v545, (uint64_t)v544, v546, v547);
                }
                uint64_t v521 = objc_msgSend_countByEnumeratingWithState_objects_count_(v514, v517, (uint64_t)&v694, (uint64_t)v721, 16);
              }
              while (v521);
            }

            id v6 = (id)v644;
            uint64_t v491 = v660;
            uint64_t v489 = v664;
            v495 = v668;
            uint64_t v494 = v670;
          }
          v490 += objc_msgSend_duration(v674, v500, v501, v502, v503);

          ++v494;
        }
        while (v494 != v489);
        uint64_t v489 = objc_msgSend_countByEnumeratingWithState_objects_count_(v666, v485, (uint64_t)&v698, (uint64_t)v722, 16);
      }
      while (v489);
    }
  }
  else if (objc_msgSend_isEqualToString_(v6, v479, @"FMTimedMetadataIdentifierLoopPoints", v481, v482))
  {
    long long v691 = 0u;
    long long v692 = 0u;
    long long v689 = 0u;
    long long v690 = 0u;
    v552 = objc_msgSend_segments(v633, v548, v549, v550, v551);
    uint64_t v554 = objc_msgSend_countByEnumeratingWithState_objects_count_(v552, v553, (uint64_t)&v689, (uint64_t)v720, 16);
    if (v554)
    {
      uint64_t v559 = v554;
      int64_t v560 = 0;
      uint64_t v561 = *(void *)v690;
      uint64_t v562 = MEMORY[0x263F010E0];
      do
      {
        for (uint64_t j = 0; j != v559; ++j)
        {
          if (*(void *)v690 != v561) {
            objc_enumerationMutation(v552);
          }
          v564 = *(void **)(*((void *)&v689 + 1) + 8 * j);
          v565 = objc_msgSend_segment(v564, v555, v556, v557, v558);
          if (objc_msgSend_type(v565, v566, v567, v568, v569) == 4)
          {
            memset(&v715, 0, sizeof(v715));
            int64_t v574 = objc_msgSend_duration(v564, v570, v571, v572, v573);
            int32_t v579 = objc_msgSend_sampleRate(v678, v575, v576, v577, v578);
            CMTimeMake(&v715, v574, v579);
            memset(&v688, 0, sizeof(v688));
            int32_t v584 = objc_msgSend_sampleRate(v678, v580, v581, v582, v583);
            CMTimeMake(&v688, v560, v584);
            memset(&v687, 0, sizeof(v687));
            v714.CMTime start = v688;
            duration.CMTime start = v715;
            CMTimeAdd(&v687, &v714.start, &duration.start);
            v714.CMTime start = v687;
            float v585 = CMTimeGetSeconds(&v714.start);
            memset(&v714, 0, sizeof(v714));
            Float64 v586 = v585;
            int32_t v591 = objc_msgSend_sampleRate(v678, v587, v588, v589, v590);
            CMTimeMakeWithSeconds(&v686, v586, v591);
            *(_OWORD *)&duration.start.CMTimeValue value = *(_OWORD *)v562;
            duration.start.epoch = *(void *)(v562 + 16);
            CMTimeRangeMake(&v714, &v686, &duration.start);
            v592 = [FMTimedMetadataItem alloc];
            v596 = objc_msgSend_stringWithFormat_(NSString, v593, @"loop point @ %f", v594, v595, *(void *)&v586);
            duratiouint64_t n = v714;
            v598 = objc_msgSend_initWithIdentifier_name_timeRange_values_(v592, v597, @"FMTimedMetadataIdentifierOnset", (uint64_t)v596, (uint64_t)&duration, MEMORY[0x263EFFA78]);

            uint64_t v12 = v679;
            objc_msgSend_addObject_(v679, v599, (uint64_t)v598, v600, v601);
          }
          v560 += objc_msgSend_duration(v564, v570, v571, v572, v573);
        }
        uint64_t v559 = objc_msgSend_countByEnumeratingWithState_objects_count_(v552, v555, (uint64_t)&v689, (uint64_t)v720, 16);
      }
      while (v559);
    }

    objc_msgSend_removeLastObject(v12, v602, v603, v604, v605);
    id v6 = (id)v644;
  }
  if (objc_msgSend_count(v12, v548, v549, v550, v551) && objc_msgSend_count(v12, v606, v607, v608, v609) != 1)
  {
    unint64_t v613 = 0;
    do
    {
      v614 = objc_msgSend_objectAtIndex_(v12, v610, v613, v611, v612);
      v618 = objc_msgSend_objectAtIndex_(v12, v615, ++v613, v616, v617);
      v623 = v618;
      memset(&v714, 0, 24);
      if (v618)
      {
        objc_msgSend_timeRange(v618, v619, v620, v621, v622);
      }
      else
      {
        long long v683 = 0u;
        long long v684 = 0u;
        long long v682 = 0u;
      }
      *(_OWORD *)&lhs.CMTimeValue value = v682;
      lhs.epoch = v683;
      if (v614) {
        objc_msgSend_timeRange(v614, v619, v620, v621, v622);
      }
      else {
        memset(&v680, 0, sizeof(v680));
      }
      CMTime rhs = v680;
      CMTimeSubtract(&v714.start, &lhs, &rhs);
      *(_OWORD *)&duration.start.CMTimeValue value = *(_OWORD *)&v714.start.value;
      duration.start.epoch = v714.start.epoch;
      objc_msgSend_adjustDurationTo_(v614, v624, (uint64_t)&duration, v625, v626);
    }
    while (v613 < objc_msgSend_count(v12, v627, v628, v629, v630) - 1);
  }
  id v316 = v12;

LABEL_227:
  return v316;
}

+ (id)loadSongInFolderWithPath:(id)a3
{
  id v7 = a3;
  if (!v7
    || ((unsigned __int8 v19 = 0,
         objc_msgSend_defaultManager(MEMORY[0x263F08850], v3, v4, v5, v6),
         uint64_t v8 = objc_claimAutoreleasedReturnValue(),
         int isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v8, v9, (uint64_t)v7, (uint64_t)&v19, v10),
         int v12 = v19,
         v8,
         isDirectory)
      ? (BOOL v16 = v12 == 0)
      : (BOOL v16 = 1),
        v16))
  {
    uint64_t v17 = 0;
  }
  else
  {
    uint64_t v17 = objc_msgSend_songAtPath_(FlexSongMetaDataReader_V2, v13, (uint64_t)v7, v14, v15);
  }

  return v17;
}

- (NSArray)crossFadeSegments
{
  return (NSArray *)objc_msgSend__segmentsforType_(self, a2, 5, v2, v3);
}

- (NSArray)introSegments
{
  return (NSArray *)objc_msgSend__segmentsforType_(self, a2, 1, v2, v3);
}

- (NSArray)outroSegments
{
  return (NSArray *)objc_msgSend__segmentsforType_(self, a2, 4, v2, v3);
}

- (NSArray)transSegments
{
  return (NSArray *)objc_msgSend__segmentsforType_(self, a2, 3, v2, v3);
}

- (NSString)audioFileExtension
{
  return self->_audioFileExtension;
}

- (FlexSongAssetProviderProtocol)assetProvider
{
  return self->_assetProvider;
}

- (NSArray)bodySegments
{
  return self->_bodySegments;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodySegments, 0);
  objc_storeStrong((id *)&self->_assetProvider, 0);
  objc_storeStrong((id *)&self->_audioFileExtension, 0);
  objc_storeStrong((id *)&self->_segmentCache, 0);
  objc_storeStrong((id *)&self->_analysisData, 0);
}

@end