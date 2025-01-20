@interface FlexSongBackend
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration;
- (BOOL)_verifyClips:(id)a3 inRendition:(id)a4 failureReason:(id *)a5;
- (BOOL)_verifyKeyFrames:(id)a3 failureReason:(id *)a4;
- (BOOL)canPlay;
- (BOOL)hidden;
- (BOOL)isLoaded;
- (BOOL)recalled;
- (BOOL)verifyRendition:(id)a3 forDuration:(id *)a4 failureReason:(id *)a5;
- (FlexSongBackend)initWithUID:(id)a3 songName:(id)a4 artistName:(id)a5 tagIDs:(id)a6 keywords:(id)a7 weightedKeywords:(id)a8 hidden:(BOOL)a9 recalled:(BOOL)a10 audioEncoderPresetName:(id)a11 metadataVersion:(int64_t)a12 songFormat:(id)a13 sampleRate:(int64_t)a14 customOptions:(id)a15;
- (NSArray)assets;
- (NSDictionary)customOptions;
- (NSDictionary)weightedKeywords;
- (NSSet)keywords;
- (NSSet)tagIDs;
- (NSString)artistName;
- (NSString)audioEncoderPresetName;
- (NSString)songFormat;
- (NSString)songName;
- (NSString)uid;
- (id)existingAssetWithID:(id)a3;
- (id)idealDurations;
- (id)renditionForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5;
- (id)timedMetadataItemsWithIdentifier:(id)a3 forRendition:(id)a4;
- (int64_t)metadataVersion;
- (int64_t)sampleRate;
- (void)setArtistName:(id)a3;
- (void)setAssets:(id)a3;
- (void)setAudioEncoderPresetName:(id)a3;
- (void)setCustomOptions:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setKeywords:(id)a3;
- (void)setMetadataVersion:(int64_t)a3;
- (void)setRecalled:(BOOL)a3;
- (void)setSampleRate:(int64_t)a3;
- (void)setSongFormat:(id)a3;
- (void)setSongName:(id)a3;
- (void)setTagIDs:(id)a3;
- (void)setUid:(id)a3;
- (void)setWeightedKeywords:(id)a3;
- (void)updateAssets:(id)a3;
- (void)updateSampleRate:(int64_t)a3;
- (void)updateSongArtist:(id)a3 title:(id)a4 tags:(id)a5 keywords:(id)a6 weightedKeywords:(id)a7 hidden:(BOOL)a8 recalled:(BOOL)a9 metadataVersion:(int64_t)a10;
- (void)updateUID:(id)a3;
@end

@implementation FlexSongBackend

- (FlexSongBackend)initWithUID:(id)a3 songName:(id)a4 artistName:(id)a5 tagIDs:(id)a6 keywords:(id)a7 weightedKeywords:(id)a8 hidden:(BOOL)a9 recalled:(BOOL)a10 audioEncoderPresetName:(id)a11 metadataVersion:(int64_t)a12 songFormat:(id)a13 sampleRate:(int64_t)a14 customOptions:(id)a15
{
  id v35 = a3;
  id v34 = a4;
  id obj = a5;
  id v22 = a5;
  id v32 = a6;
  id v23 = a6;
  id v37 = a7;
  id v33 = a8;
  id v36 = a8;
  id v24 = a11;
  id v25 = a13;
  id v26 = a15;
  v38.receiver = self;
  v38.super_class = (Class)FlexSongBackend;
  v27 = [(FlexSongBackend *)&v38 init];
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_uid, a3);
    objc_storeStrong((id *)&v28->_songName, a4);
    objc_storeStrong((id *)&v28->_artistName, obj);
    objc_storeStrong((id *)&v28->_tagIDs, v32);
    objc_storeStrong((id *)&v28->_keywords, a7);
    objc_storeStrong((id *)&v28->_weightedKeywords, v33);
    v28->_hidden = a9;
    v28->_recalled = a10;
    objc_storeStrong((id *)&v28->_audioEncoderPresetName, a11);
    objc_storeStrong((id *)&v28->_songFormat, a13);
    v28->_sampleRate = a14;
    v28->_metadataVersion = a12;
    objc_storeStrong((id *)&v28->_customOptions, a15);
    assets = v28->_assets;
    v28->_assets = 0;
  }
  return v28;
}

- (void)updateUID:(id)a3
{
}

- (void)updateSampleRate:(int64_t)a3
{
  self->_sampleRate = a3;
}

- (void)updateAssets:(id)a3
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v4 = a3;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v54, (uint64_t)v59, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v55 != v11) {
          objc_enumerationMutation(v4);
        }
        v13 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v14 = objc_msgSend_uid(self, v6, v7, v8, v9);
        objc_msgSend_setSongUID_(v13, v15, (uint64_t)v14, v16, v17);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v54, (uint64_t)v59, 16);
    }
    while (v10);
  }

  v18 = self;
  objc_sync_enter(v18);
  id obj = v18;
  v27 = objc_msgSend_assets(v18, v19, v20, v21, v22);
  if (v27)
  {
    v28 = objc_msgSend_assets(v18, v23, v24, v25, v26);
    id v33 = (NSArray *)objc_msgSend_mutableCopy(v28, v29, v30, v31, v32);
  }
  else
  {
    objc_msgSend_array(MEMORY[0x263EFF980], v23, v24, v25, v26);
    id v33 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }

  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v34 = v4;
  uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v35, (uint64_t)&v50, (uint64_t)v58, 16);
  if (v39)
  {
    uint64_t v40 = *(void *)v51;
    do
    {
      for (uint64_t j = 0; j != v39; ++j)
      {
        if (*(void *)v51 != v40) {
          objc_enumerationMutation(v34);
        }
        uint64_t v42 = *(void *)(*((void *)&v50 + 1) + 8 * j);
        v49[0] = MEMORY[0x263EF8330];
        v49[1] = 3221225472;
        v49[2] = sub_217A308B4;
        v49[3] = &unk_2642B6D00;
        v49[4] = v42;
        uint64_t v44 = objc_msgSend_indexOfObjectPassingTest_(v33, v36, (uint64_t)v49, v37, v38);
        if (v44 == 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend_addObject_(v33, v43, v42, v45, v46);
        }
        else {
          objc_msgSend_replaceObjectAtIndex_withObject_(v33, v43, v44, v42, v46);
        }
      }
      uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v34, v36, (uint64_t)&v50, (uint64_t)v58, 16);
    }
    while (v39);
  }

  assets = obj->_assets;
  obj->_assets = v33;

  objc_sync_exit(obj);
}

- (id)existingAssetWithID:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v10 = objc_msgSend_assets(v5, v6, v7, v8, v9, 0);
  id v16 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v16)
  {
    uint64_t v17 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v10);
        }
        v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend_assetID(v19, v12, v13, v14, v15);
        int isEqualToString = objc_msgSend_isEqualToString_(v20, v21, (uint64_t)v4, v22, v23);

        if (isEqualToString)
        {
          id v16 = v19;
          goto LABEL_11;
        }
      }
      id v16 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v26, (uint64_t)v30, 16);
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v5);
  return v16;
}

- (BOOL)canPlay
{
  return 0;
}

- (BOOL)isLoaded
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)naturalDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x263F01090];
  return self;
}

- (id)idealDurations
{
  return (id)MEMORY[0x263EFFA68];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x263F01090];
  return self;
}

- (id)timedMetadataItemsWithIdentifier:(id)a3 forRendition:(id)a4
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)renditionForDuration:(id *)a3 withOptions:(id)a4 testingContext:(id)a5
{
  return 0;
}

- (void)updateSongArtist:(id)a3 title:(id)a4 tags:(id)a5 keywords:(id)a6 weightedKeywords:(id)a7 hidden:(BOOL)a8 recalled:(BOOL)a9 metadataVersion:(int64_t)a10
{
  uint64_t v15 = (NSString *)a3;
  id v16 = (NSString *)a4;
  uint64_t v17 = (NSSet *)a5;
  v18 = (NSSet *)a6;
  v19 = (NSDictionary *)a7;
  artistName = self->_artistName;
  self->_artistName = v15;
  uint64_t v21 = v15;

  songName = self->_songName;
  self->_songName = v16;
  uint64_t v23 = v16;

  tagIDs = self->_tagIDs;
  self->_tagIDs = v17;
  uint64_t v25 = v17;

  keywords = self->_keywords;
  self->_keywords = v18;
  long long v27 = v18;

  weightedKeywords = self->_weightedKeywords;
  self->_weightedKeywords = v19;

  self->_hidden = a8;
  self->_recalled = a9;
  self->_metadataVersion = a10;
}

- (BOOL)verifyRendition:(id)a3 forDuration:(id *)a4 failureReason:(id *)a5
{
  id v7 = a3;
  v12 = v7;
  if (!v7)
  {
    BOOL v89 = 0;
    v90 = @"no rendition! The playback algorithm could not generate a rendition for this duration or there is an issue with the authoring tool";
LABEL_13:
    *a5 = v90;
    goto LABEL_18;
  }
  uint64_t v13 = objc_msgSend_trackA(v7, v8, v9, v10, v11);

  if (!v13)
  {
    BOOL v89 = 0;
    v90 = @"trackA is not present in rendition.";
    goto LABEL_13;
  }
  v18 = objc_msgSend_trackB(v12, v14, v15, v16, v17);

  if (!v18)
  {
    BOOL v89 = 0;
    v90 = @"trackB is not present in rendition.";
    goto LABEL_13;
  }
  uint64_t v23 = objc_msgSend_durationOfMusic(v12, v19, v20, v21, v22);
  uint64_t v28 = objc_msgSend_durationOfSilence(v12, v24, v25, v26, v27) + v23;
  if (v28 != objc_msgSend_duration(v12, v29, v30, v31, v32))
  {
    v91 = NSString;
    v92 = NSNumber;
    uint64_t v93 = objc_msgSend_durationOfMusic(v12, v33, v34, v35, v36);
    uint64_t v37 = objc_msgSend_numberWithLongLong_(v92, v94, v93, v95, v96);
    v97 = NSNumber;
    uint64_t v102 = objc_msgSend_durationOfSilence(v12, v98, v99, v100, v101);
    uint64_t v42 = objc_msgSend_numberWithLongLong_(v97, v103, v102, v104, v105);
    v106 = NSNumber;
    uint64_t v111 = objc_msgSend_duration(v12, v107, v108, v109, v110);
    v68 = objc_msgSend_numberWithLongLong_(v106, v112, v111, v113, v114);
    objc_msgSend_stringWithFormat_(v91, v115, @"rendition.durationOfMusic (%@) + rendition.durationOfSilence (%@) should equal rendition.duration %@", v116, v117, v37, v42, v68);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  uint64_t v37 = objc_msgSend_trackA(v12, v33, v34, v35, v36);
  uint64_t v42 = objc_msgSend_clips(v37, v38, v39, v40, v41);
  if ((objc_msgSend__verifyClips_inRendition_failureReason_(self, v43, (uint64_t)v42, (uint64_t)v12, (uint64_t)a5) & 1) == 0)
  {
LABEL_16:

    goto LABEL_17;
  }
  v48 = objc_msgSend_trackB(v12, v44, v45, v46, v47);
  long long v53 = objc_msgSend_clips(v48, v49, v50, v51, v52);
  int v55 = objc_msgSend__verifyClips_inRendition_failureReason_(self, v54, (uint64_t)v53, (uint64_t)v12, (uint64_t)a5);

  if (!v55)
  {
LABEL_17:
    BOOL v89 = 0;
    goto LABEL_18;
  }
  uint64_t v37 = objc_msgSend_trackA(v12, v56, v57, v58, v59);
  uint64_t v42 = objc_msgSend_mixParameters(v37, v60, v61, v62, v63);
  v68 = objc_msgSend_volumeKeyFrames(v42, v64, v65, v66, v67);
  if ((objc_msgSend__verifyKeyFrames_failureReason_(self, v69, (uint64_t)v68, (uint64_t)a5, v70) & 1) == 0)
  {
LABEL_15:

    goto LABEL_16;
  }
  v75 = objc_msgSend_trackB(v12, v71, v72, v73, v74);
  v80 = objc_msgSend_mixParameters(v75, v76, v77, v78, v79);
  v85 = objc_msgSend_volumeKeyFrames(v80, v81, v82, v83, v84);
  char v88 = objc_msgSend__verifyKeyFrames_failureReason_(self, v86, (uint64_t)v85, (uint64_t)a5, v87);

  if ((v88 & 1) == 0) {
    goto LABEL_17;
  }
  BOOL v89 = 1;
LABEL_18:

  return v89;
}

- (BOOL)_verifyClips:(id)a3 inRendition:(id)a4 failureReason:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v13 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v9, v10, v11, v12);
  if (!objc_msgSend_count(v7, v14, v15, v16, v17))
  {
LABEL_13:
    int v101 = 2;
    goto LABEL_24;
  }
  unint64_t v21 = 0;
  while (1)
  {
    uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(v7, v18, v21, v19, v20);
    if (objc_msgSend_duration(v22, v23, v24, v25, v26) <= 0)
    {
      v145 = @"Found an invalid clip.duration in rendition. The duration must be > 0.";
      goto LABEL_19;
    }
    uint64_t v31 = objc_msgSend_count(v7, v27, v28, v29, v30) - 1;
    uint64_t v36 = objc_msgSend_url(v22, v32, v33, v34, v35);
    uint64_t v41 = objc_msgSend_path(v36, v37, v38, v39, v40);
    char v45 = objc_msgSend_fileExistsAtPath_(v13, v42, (uint64_t)v41, v43, v44);

    if ((v45 & 1) != 0 || v21 != v31)
    {
      uint64_t v58 = objc_msgSend_url(v22, v46, v47, v48, v49);
      uint64_t v63 = objc_msgSend_path(v58, v59, v60, v61, v62);
      char v67 = objc_msgSend_fileExistsAtPath_(v13, v64, (uint64_t)v63, v65, v66);

      if ((v67 & 1) == 0)
      {
        v146 = NSString;
        v69 = objc_msgSend_url(v22, v55, v68, v56, v57);
        v151 = objc_msgSend_path(v69, v147, v148, v149, v150);
        objc_msgSend_stringWithFormat_(v146, v152, @"Clip url path %@ does not exist.", v153, v154, v151);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_21;
      }
    }
    else
    {
      uint64_t v50 = objc_msgSend_duration(v22, v46, v47, v48, v49);
      if (v50 != objc_msgSend_durationOfSilence(v8, v51, v52, v53, v54))
      {
        v145 = @"Clip duration must equal the duration of silence if it is the last clip in the track.";
LABEL_19:
        *a5 = v145;
        goto LABEL_22;
      }
    }
    if (v21 == v31)
    {
      int v101 = 2;
      goto LABEL_23;
    }
    v69 = objc_msgSend_objectAtIndexedSubscript_(v7, v55, ++v21, v56, v57);
    uint64_t v74 = objc_msgSend_position(v22, v70, v71, v72, v73);
    if (v74 > objc_msgSend_position(v69, v75, v76, v77, v78))
    {
      uint64_t v102 = NSString;
      v103 = NSNumber;
      uint64_t v104 = objc_msgSend_position(v22, v79, v80, v81, v82);
      uint64_t v108 = objc_msgSend_numberWithLongLong_(v103, v105, v104, v106, v107);
      uint64_t v109 = NSNumber;
      uint64_t v114 = objc_msgSend_position(v69, v110, v111, v112, v113);
      v118 = objc_msgSend_numberWithLongLong_(v109, v115, v114, v116, v117);
      objc_msgSend_stringWithFormat_(v102, v119, @"Current clip's position: %@ should not begin after the position: %@ of its following clip within the track.", v120, v121, v108, v118);
      goto LABEL_18;
    }
    uint64_t v83 = objc_msgSend_position(v22, v79, v80, v81, v82);
    uint64_t v88 = objc_msgSend_duration(v22, v84, v85, v86, v87) + v83;
    if (v88 > objc_msgSend_position(v69, v89, v90, v91, v92)) {
      break;
    }

    if (v21 >= objc_msgSend_count(v7, v97, v98, v99, v100)) {
      goto LABEL_13;
    }
  }
  v122 = NSString;
  v123 = NSNumber;
  uint64_t v124 = objc_msgSend_position(v22, v93, v94, v95, v96);
  uint64_t v129 = objc_msgSend_duration(v22, v125, v126, v127, v128);
  uint64_t v108 = objc_msgSend_numberWithLongLong_(v123, v130, v129 + v124, v131, v132);
  v133 = NSNumber;
  uint64_t v138 = objc_msgSend_position(v69, v134, v135, v136, v137);
  v118 = objc_msgSend_numberWithLongLong_(v133, v139, v138, v140, v141);
  objc_msgSend_stringWithFormat_(v122, v142, @"Current clip's position + duration %@ should not exceed the position %@ of its following clip within the track.", v143, v144, v108, v118);
LABEL_18:
  *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_21:
LABEL_22:
  int v101 = 1;
LABEL_23:

LABEL_24:
  return v101 == 2;
}

- (BOOL)_verifyKeyFrames:(id)a3 failureReason:(id *)a4
{
  id v5 = a3;
  if (objc_msgSend_count(v5, v6, v7, v8, v9) == 1)
  {
LABEL_5:
    BOOL v35 = 1;
  }
  else
  {
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = objc_msgSend_objectAtIndexedSubscript_(v5, v10, v13, v11, v12);
      v18 = objc_msgSend_objectAtIndexedSubscript_(v5, v15, ++v13, v16, v17);
      uint64_t v23 = objc_msgSend_sampleTime(v14, v19, v20, v21, v22);
      if (v23 >= objc_msgSend_sampleTime(v18, v24, v25, v26, v27)) {
        break;
      }

      if (v13 >= objc_msgSend_count(v5, v31, v32, v33, v34) - 1) {
        goto LABEL_5;
      }
    }
    objc_msgSend_stringWithFormat_(NSString, v28, @"Keyframe %@ sampleTime must be less than its following keyframe %@", v29, v30, v14, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    BOOL v35 = 0;
  }

  return v35;
}

- (NSString)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
}

- (NSString)audioEncoderPresetName
{
  return self->_audioEncoderPresetName;
}

- (void)setAudioEncoderPresetName:(id)a3
{
}

- (NSString)songName
{
  return self->_songName;
}

- (void)setSongName:(id)a3
{
}

- (NSString)artistName
{
  return self->_artistName;
}

- (void)setArtistName:(id)a3
{
}

- (NSSet)tagIDs
{
  return self->_tagIDs;
}

- (void)setTagIDs:(id)a3
{
}

- (NSSet)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
}

- (NSDictionary)weightedKeywords
{
  return self->_weightedKeywords;
}

- (void)setWeightedKeywords:(id)a3
{
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
}

- (NSString)songFormat
{
  return self->_songFormat;
}

- (void)setSongFormat:(id)a3
{
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(int64_t)a3
{
  self->_sampleRate = a3;
}

- (BOOL)hidden
{
  return self->_hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->_hidden = a3;
}

- (BOOL)recalled
{
  return self->_recalled;
}

- (void)setRecalled:(BOOL)a3
{
  self->_recalled = a3;
}

- (int64_t)metadataVersion
{
  return self->_metadataVersion;
}

- (void)setMetadataVersion:(int64_t)a3
{
  self->_metadataVersion = a3;
}

- (NSDictionary)customOptions
{
  return self->_customOptions;
}

- (void)setCustomOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customOptions, 0);
  objc_storeStrong((id *)&self->_songFormat, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_weightedKeywords, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_tagIDs, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_songName, 0);
  objc_storeStrong((id *)&self->_audioEncoderPresetName, 0);
  objc_storeStrong((id *)&self->_uid, 0);
}

@end