@interface CPLAssetChange
+ (id)ckPropertyForRelatedIdentifier;
+ (id)ckValueForRelatedRecord:(id)a3;
- (BOOL)shouldClearMissingResourcesInCKRecord;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillWithCKRecord:(id)a3;
- (void)setMostRecentAddedDateOnCKRecord:(id)a3 withCPLEnabledDate:(id)a4;
@end

@implementation CPLAssetChange

- (void)setMostRecentAddedDateOnCKRecord:(id)a3 withCPLEnabledDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(CPLAssetChange *)self addedDate];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000A92CC;
  v14[3] = &unk_10027A448;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v8;
  v9 = objc_retainBlock(v14);
  v10 = (void (**)(void))v9;
  if (v7 || !v8)
  {
    if (v7 && !v8)
    {
      id v12 = v7;
LABEL_12:
      [v6 setObject:v12 forKey:@"mostRecentAddedDate"];

      goto LABEL_13;
    }
    if ([v8 compare:v7] == (id)1)
    {
      v13 = v10[2](v10);
      id v12 = [v13 laterDate:v7];

      if (!v12) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    id v11 = v7;
  }
  else
  {
    ((void (*)(void *))v9[2])(v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v12 = v11;
  if (v11) {
    goto LABEL_12;
  }
LABEL_13:
}

+ (id)ckPropertyForRelatedIdentifier
{
  return @"masterRef";
}

+ (id)ckValueForRelatedRecord:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)CKReference) initWithRecord:v3 action:1];

  return v4;
}

- (void)fillWithCKRecord:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [v4 objectForKey:@"people"];
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v6 count]);
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v107 objects:v111 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v108;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v108 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v107 + 1) + 8 * i);
        id v14 = objc_alloc((Class)CPLPersonReference);
        id v15 = objc_msgSend(v14, "initWithSerializedString:", v13, (void)v107);
        [v7 addObject:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v107 objects:v111 count:16];
    }
    while (v10);
  }

  [(CPLAssetChange *)v5 setPeople:v7];
  v16 = [v4 objectForKey:@"syndicationId"];
  [(CPLAssetChange *)v5 setSyndicationIdentifier:v16];

  if (+[CPLAssetChange serverSupportsSharedLibrarySharingState])
  {
    objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"sharedSyncSharingStateEnc", objc_opt_class());
    v17 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17) {
      v17 = &off_100291E90;
    }
    -[CPLAssetChange setSharedLibrarySharingState:](v5, "setSharedLibrarySharingState:", objc_msgSend(v17, "longLongValue", (void)v107));
  }
  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"playCount", objc_opt_class());
  v19 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!v19) {
    v19 = &off_100291E90;
  }
  -[CPLAssetChange setPlayCount:](v5, "setPlayCount:", objc_msgSend(v19, "longLongValue", (void)v107));

  if (+[CPLAssetChange serverSupportsLastViewedDate])
  {
    v21 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"lastViewedDateEnc", objc_opt_class());
    [(CPLAssetChange *)v5 setLastViewedDate:v21];
  }
  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"viewCount", objc_opt_class());
  v22 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v22) {
    v22 = &off_100291E90;
  }
  -[CPLAssetChange setViewCount:](v5, "setViewCount:", [v22 longLongValue]);

  v24 = [v4 objectForKey:@"lastSharedDate"];
  [(CPLAssetChange *)v5 setLastSharedDate:v24];

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"shareCount", objc_opt_class());
  v25 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (!v25) {
    v25 = &off_100291E90;
  }
  -[CPLAssetChange setShareCount:](v5, "setShareCount:", [v25 longLongValue]);

  objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"viewPresentationTypeEnc", objc_opt_class());
  v27 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v27) {
    v27 = &off_100291EA8;
  }
  -[CPLAssetChange setViewPresentation:](v5, "setViewPresentation:", (__int16)[v27 integerValue]);

  v29 = [v4 objectForKeyedSubscript:@"computeStateVersion"];
  [(CPLAssetChange *)v5 setComputeStateVersion:v29];

  v30 = objc_msgSend(v4, "cpl_decryptedObjectForKey:validateClass:", @"computeStateAdjustmentFingerprintEnc", objc_opt_class());
  [(CPLAssetChange *)v5 setComputeStateAdjustmentFingerprint:v30];

  v31 = objc_msgSend(v4, "cpl_decryptedObjectForKey:validateClass:", @"computeStateLastUpdatedDateEnc", objc_opt_class());
  [(CPLAssetChange *)v5 setComputeStateLastUpdatedDate:v31];

  v32 = objc_msgSend(v4, "cpl_decryptedObjectForKey:validateClass:", @"assetDateEnc", objc_opt_class());
  v33 = v32;
  if (v32)
  {
    id v34 = v32;
  }
  else
  {
    id v34 = [v4 objectForKeyedSubscript:@"assetDate"];
  }
  v35 = v34;

  [(CPLAssetChange *)v5 setAssetDate:v35];
  v36 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"isHidden", objc_opt_class());
  v37 = v36;
  if (!v36) {
    v36 = &__kCFBooleanFalse;
  }
  -[CPLAssetChange setHidden:](v5, "setHidden:", [v36 BOOLValue]);

  v38 = objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"isFavorite", objc_opt_class());
  v39 = v38;
  if (!v38) {
    v38 = &__kCFBooleanFalse;
  }
  -[CPLAssetChange setFavorite:](v5, "setFavorite:", [v38 BOOLValue]);

  v40 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"captionEnc", objc_opt_class());
  [(CPLAssetChange *)v5 setCaption:v40];

  v41 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"keywordsEnc", objc_opt_class());
  [(CPLAssetChange *)v5 setKeywords:v41];

  v42 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"extendedDescEnc", objc_opt_class());
  [(CPLAssetChange *)v5 setExtendedDescription:v42];

  v43 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"accessibilityDescEnc", objc_opt_class());
  [(CPLAssetChange *)v5 setAccessibilityDescription:v43];

  v44 = [v4 objectForKey:@"masterRef"];
  v45 = [v44 recordID];
  v46 = [v45 recordName];

  [(CPLAssetChange *)v5 setMasterIdentifier:v46];
  v47 = [v4 objectForKey:@"addedDate"];
  [(CPLAssetChange *)v5 setAddedDate:v47];

  v48 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"locationEnc", objc_opt_class());
  v49 = +[CLLocation locationWithCPLLocationDictionary:v48];
  [(CPLAssetChange *)v5 setLocation:v49];

  if (+[CPLAssetChange serverSupportsDeletedByUserIdentifier])
  {
    v50 = [v4 objectForKey:@"deletedBy"];
    v51 = [v50 recordID];
    v52 = [v51 recordName];
    [(CPLAssetChange *)v5 setDeletedByUserIdentifier:v52];
  }
  v53 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"placeInfoEnc", objc_opt_class());
  v54 = +[CPLPlaceAnnotation placeAnnotationWithCPLPlaceAnnotationDictionary:v53];
  [(CPLAssetChange *)v5 setPlaceAnnotation:v54];

  v55 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"timeZoneNameEnc", objc_opt_class());
  [(CPLAssetChange *)v5 setTimeZoneName:v55];

  v56 = [v4 objectForKey:@"burstId"];
  [(CPLAssetChange *)v5 setBurstIdentifier:v56];

  v57 = [v4 objectForKey:@"mediaGroupId"];
  [(CPLAssetChange *)v5 setMediaGroupIdentifier:v57];

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"vidComplDurValue", objc_opt_class());
  v58 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (!v58) {
    v58 = &off_100291E90;
  }
  -[CPLAssetChange setVideoComplementDurationValue:](v5, "setVideoComplementDurationValue:", [v58 integerValue]);

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"vidComplDurScale", objc_opt_class());
  v60 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v61 = v60;
  if (!v60) {
    v60 = &off_100291E90;
  }
  -[CPLAssetChange setVideoComplementDurationTimescale:](v5, "setVideoComplementDurationTimescale:", [v60 integerValue]);

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"vidComplDispValue", objc_opt_class());
  v62 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v63 = v62;
  if (!v62) {
    v62 = &off_100291E90;
  }
  -[CPLAssetChange setVideoComplementImageDisplayValue:](v5, "setVideoComplementImageDisplayValue:", [v62 integerValue]);

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"vidComplDispScale", objc_opt_class());
  v64 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (!v64) {
    v64 = &off_100291E90;
  }
  -[CPLAssetChange setVideoComplementImageDisplayTimescale:](v5, "setVideoComplementImageDisplayTimescale:", [v64 integerValue]);

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"vidComplVisibilityState", objc_opt_class());
  v66 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v67 = v66;
  if (!v66) {
    v66 = &off_100291E90;
  }
  -[CPLAssetChange setVideoComplementVisibilityState:](v5, "setVideoComplementVisibilityState:", [v66 integerValue]);

  v68 = [v4 objectForKey:@"assetSubtypeV2"];
  v69 = v68;
  if (v68)
  {
    id v70 = [v68 unsignedIntegerValue];
  }
  else
  {
    v71 = [v4 objectForKey:@"assetSubtype"];
    id v70 = [v71 unsignedIntegerValue];
  }
  [(CPLAssetChange *)v5 setAssetSubtype:v70];

  v72 = [v4 objectForKey:@"burstFlags"];
  unint64_t v73 = (unint64_t)[v72 unsignedIntegerValue];

  v74 = [v4 objectForKey:@"burstFlagsExt"];
  v75 = v74;
  if (v74 && v73) {
    v73 |= (unint64_t)[v74 unsignedIntegerValue] & 0xFFFFFFFFFFFFFFE0;
  }
  [(CPLAssetChange *)v5 setBurstFlags:v73];

  v76 = [v4 objectForKey:@"timeZoneOffset"];
  [(CPLAssetChange *)v5 setTimeZoneOffset:v76];

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"assetHDRType", objc_opt_class());
  v77 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v78 = v77;
  if (!v77) {
    v77 = &off_100291E90;
  }
  -[CPLAssetChange setAssetHDRType:](v5, "setAssetHDRType:", [v77 unsignedIntegerValue]);

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"customRenderedValue", objc_opt_class());
  v79 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v80 = v79;
  if (!v79) {
    v79 = &off_100291EC0;
  }
  -[CPLAssetChange setCustomRenderedValue:](v5, "setCustomRenderedValue:", [v79 longLongValue]);

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"trashReason", objc_opt_class());
  v81 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v82 = v81;
  if (!v81) {
    v81 = &off_100291EC0;
  }
  -[CPLAssetChange setTrashedReason:](v5, "setTrashedReason:", (unsigned __int16)[v81 longLongValue]);

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"orientation", objc_opt_class());
  v83 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v84 = v83;
  if (!v83) {
    v83 = &off_100291E90;
  }
  -[CPLAssetChange setOrientation:](v5, "setOrientation:", [v83 integerValue]);

  v85 = [v4 objectForKey:@"adjustmentType"];
  if (v85)
  {
    id v86 = objc_alloc_init((Class)CPLAdjustments);
    [v86 setAdjustmentType:v85];
    v87 = [v4 objectForKey:@"adjustmentCompoundVersion"];
    [v86 setAdjustmentCompoundVersion:v87];

    v88 = [v4 objectForKey:@"adjustmentCreatorCode"];
    [v86 setAdjustmentCreatorCode:v88];

    v89 = [v4 objectForKey:@"adjustmentSourceType"];
    objc_msgSend(v86, "setAdjustmentSourceType:", objc_msgSend(v89, "integerValue"));

    v90 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"adjustmentSimpleDataEnc", objc_opt_class());
    [v86 setSimpleAdjustmentData:v90];

    v91 = [v4 objectForKey:@"similarToOriginalAdjustmentsFingerprint"];
    [v86 setSimilarToOriginalAdjustmentsFingerprint:v91];

    v92 = [v4 objectForKey:@"otherAdjustmentsFingerprint"];
    [v86 setOtherAdjustmentsFingerprint:v92];

    v93 = [v4 objectForKey:@"adjustmentRenderType"];
    objc_msgSend(v86, "setAdjustmentRenderTypes:", objc_msgSend(v93, "integerValue"));

    v94 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"adjustmentTimestampEnc", objc_opt_class());
    [v86 setAdjustmentTimestamp:v94];

    [(CPLAssetChange *)v5 setAdjustments:v86];
  }

  v95 = objc_msgSend(v4, "cpl_decryptedObjectForKey:validateClass:", @"durationEnc", objc_opt_class());
  v96 = v95;
  if (v95)
  {
    v97 = v95;
  }
  else
  {
    v97 = [v4 objectForKeyedSubscript:@"duration"];
  }
  v98 = v97;

  if (v98) {
    v99 = v98;
  }
  else {
    v99 = &off_100291E90;
  }
  -[CPLAssetChange setDuration:](v5, "setDuration:", [v99 integerValue]);

  objc_msgSend(v4, "cpl_objectForKey:validateClass:", @"originalChoice", objc_opt_class());
  v100 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v101 = v100;
  if (!v100) {
    v100 = &off_100291E90;
  }
  -[CPLAssetChange setOriginalChoice:](v5, "setOriginalChoice:", [v100 unsignedIntegerValue]);

  v102 = [v4 objectForKey:@"adjustedMediaMetaDataStrType"];
  [(CPLAssetChange *)v5 setAdjustedMediaMetaDataType:v102];

  v103 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"adjustedMediaMetaDataEnc", objc_opt_class());
  [(CPLAssetChange *)v5 setAdjustedMediaMetaData:v103];

  v104 = objc_msgSend(v4, "cpl_legacyDecryptedObjectForKey:validateClass:", @"faces", objc_opt_class());
  if ([v104 length]) {
    [(CPLAssetChange *)v5 setFacesData:v104];
  }
  v105 = [v4 objectForKey:@"facesVersion"];
  -[CPLAssetChange setFacesVersion:](v5, "setFacesVersion:", [v105 integerValue]);

  v106 = [v4 objectForKey:@"facesAdjustmentsFingerprint"];
  [(CPLAssetChange *)v5 setFacesAdjustmentsFingerprint:v106];
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = self;
  id v10 = [v8 fingerprintContext];
  if ([(CPLAssetChange *)v9 hasChangeType:2])
  {
    SEL v142 = a2;
    if ([(CPLAssetChange *)v9 isFullRecord])
    {
      id v11 = 0;
    }
    else
    {
      id v11 = [(CPLAssetChange *)v9 attachedDiffTracker];

      if (v11)
      {
        if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
          && ![v11 areObjectsDifferentOnProperty:@"people" changeType:2])
        {
          goto LABEL_22;
        }
        char v12 = 0;
LABEL_9:
        if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"people")])
        {
          id v140 = v11;
          v141 = v10;
          id v13 = v8;
          id v14 = +[NSMutableArray array];
          long long v143 = 0u;
          long long v144 = 0u;
          long long v145 = 0u;
          long long v146 = 0u;
          id v15 = [(CPLAssetChange *)v9 people];
          id v16 = [v15 countByEnumeratingWithState:&v143 objects:v151 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v144;
            do
            {
              for (i = 0; i != v17; i = (char *)i + 1)
              {
                if (*(void *)v144 != v18) {
                  objc_enumerationMutation(v15);
                }
                v20 = [*(id *)(*((void *)&v143 + 1) + 8 * i) serializedString];
                [v14 addObject:v20];
              }
              id v17 = [v15 countByEnumeratingWithState:&v143 objects:v151 count:16];
            }
            while (v17);
          }

          [v7 setObject:v14 forKey:@"people"];
          if (v12)
          {
            char v21 = 1;
            id v8 = v13;
            id v11 = v140;
            id v10 = v141;
            goto LABEL_25;
          }
          id v8 = v13;
          id v11 = v140;
          id v10 = v141;
        }
        else if (v12)
        {
          char v21 = 1;
          goto LABEL_25;
        }
LABEL_22:
        if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
          && ![v11 areObjectsDifferentOnProperty:@"syndicationIdentifier" changeType:2])
        {
          if ((+[CPLAssetChange serverSupportsSharedLibrarySharingState] & 1) == 0)goto LABEL_38; {
          goto LABEL_31;
          }
        }
        char v21 = 0;
LABEL_25:
        if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"syndicationIdentifier")])
        {
          v22 = [(CPLAssetChange *)v9 syndicationIdentifier];
          [v7 setObject:v22 forKey:@"syndicationId"];
        }
        if ((+[CPLAssetChange serverSupportsSharedLibrarySharingState] & 1) == 0)
        {
LABEL_36:
          if (v21)
          {
            char v24 = 1;
            goto LABEL_41;
          }
LABEL_38:
          if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
            && ![v11 areObjectsDifferentOnProperty:@"playCount" changeType:2])
          {
            if ((+[CPLAssetChange serverSupportsLastViewedDate] & 1) == 0)goto LABEL_54; {
            goto LABEL_47;
            }
          }
          char v24 = 0;
LABEL_41:
          if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"playCount")])
          {
            v25 = +[NSNumber numberWithLongLong:[(CPLAssetChange *)v9 playCount]];
            [v7 setObject:v25 forKey:@"playCount"];
          }
          if ((+[CPLAssetChange serverSupportsLastViewedDate] & 1) == 0)
          {
LABEL_52:
            if (v24)
            {
              char v27 = 1;
              goto LABEL_57;
            }
LABEL_54:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ![v11 areObjectsDifferentOnProperty:@"viewCount" changeType:2])
            {
              goto LABEL_61;
            }
            char v27 = 0;
LABEL_57:
            if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"viewCount")])
            {
              v28 = +[NSNumber numberWithLongLong:[(CPLAssetChange *)v9 viewCount]];
              [v7 setObject:v28 forKey:@"viewCount"];
            }
            if (v27)
            {
              char v29 = 1;
              goto LABEL_64;
            }
LABEL_61:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ![v11 areObjectsDifferentOnProperty:@"lastSharedDate" changeType:2])
            {
              goto LABEL_68;
            }
            char v29 = 0;
LABEL_64:
            if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"lastSharedDate")])
            {
              v30 = [(CPLAssetChange *)v9 lastSharedDate];
              [v7 setObject:v30 forKey:@"lastSharedDate"];
            }
            if (v29)
            {
              char v31 = 1;
              goto LABEL_71;
            }
LABEL_68:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ![v11 areObjectsDifferentOnProperty:@"shareCount" changeType:2])
            {
              goto LABEL_75;
            }
            char v31 = 0;
LABEL_71:
            if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"shareCount")])
            {
              v32 = +[NSNumber numberWithLongLong:[(CPLAssetChange *)v9 shareCount]];
              [v7 setObject:v32 forKey:@"shareCount"];
            }
            if (v31)
            {
              char v33 = 1;
              goto LABEL_78;
            }
LABEL_75:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ![v11 areObjectsDifferentOnProperty:@"viewPresentation" changeType:2])
            {
              goto LABEL_82;
            }
            char v33 = 0;
LABEL_78:
            if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"viewPresentation")])
            {
              id v34 = +[NSNumber numberWithShort:[(CPLAssetChange *)v9 viewPresentation]];
              [v7 setLegacyEncryptedObject:v34 forKey:@"viewPresentationTypeEnc"];
            }
            if (v33)
            {
              [(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"computeStateVersion")];
              char v35 = 1;
              goto LABEL_88;
            }
LABEL_82:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) != 0
              || [v11 areObjectsDifferentOnProperty:@"computeStateVersion" changeType:2])
            {
              [(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"computeStateVersion")];
            }
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ([v11 areObjectsDifferentOnProperty:@"computeStateAdjustmentFingerprint" changeType:2] & 1) == 0)
            {
              goto LABEL_90;
            }
            char v35 = 0;
LABEL_88:
            [(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"computeStateAdjustmentFingerprint")];
            if (v35)
            {
              [(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"computeStateLastUpdatedDate")];
              char v36 = 1;
              goto LABEL_96;
            }
LABEL_90:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) != 0
              || [v11 areObjectsDifferentOnProperty:@"computeStateLastUpdatedDate" changeType:2])
            {
              [(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"computeStateLastUpdatedDate")];
            }
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ([v11 areObjectsDifferentOnProperty:@"assetDate" changeType:2] & 1) == 0)
            {
              goto LABEL_111;
            }
            char v36 = 0;
LABEL_96:
            if (![(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"assetDate")])goto LABEL_109; {
            id v37 = [(CPLAssetChange *)v9 assetDate];
            }
            if (v37)
            {
              if ([(CPLAssetChange *)v9 shouldUseEncryptedPropertiesIfPossibleWithContext:v10])
              {
                id v38 = v37;
                +[NSDate date];
                v40 = id v39 = v8;
                [v40 timeIntervalSinceReferenceDate];
                double v42 = v41;
                [v38 timeIntervalSinceReferenceDate];
                double v44 = v43;
                double v45 = round(v43) + 1.0;
                uint32_t v46 = arc4random_uniform(0x3Bu);
                if (v45 + (double)v46 <= v42 || v44 >= v42) {
                  double v42 = v45 + (double)v46;
                }
                id v48 = v11;
                v49 = v10;
                id v50 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:v42];

                id v8 = v39;
                [v7 setObject:v50 forKey:@"assetDate"];

                id v10 = v49;
                id v11 = v48;
                uint64_t v51 = objc_opt_class();
                v52 = v7;
                id v53 = v38;
                goto LABEL_108;
              }
              [v7 setObject:v37 forKey:@"assetDate"];
            }
            else
            {
              [v7 setObject:0 forKey:@"assetDate"];
            }
            uint64_t v51 = objc_opt_class();
            v52 = v7;
            id v53 = 0;
LABEL_108:
            [v52 setEncryptedObject:v53 forKey:@"assetDateEnc" validateClass:v51];

LABEL_109:
            if (v36)
            {
              char v54 = 1;
              goto LABEL_114;
            }
LABEL_111:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ![v11 areObjectsDifferentOnProperty:@"hidden" changeType:2])
            {
              goto LABEL_118;
            }
            char v54 = 0;
LABEL_114:
            if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"hidden")])
            {
              v55 = +[NSNumber numberWithBool:[(CPLAssetChange *)v9 isHidden]];
              [v7 setObject:v55 forKey:@"isHidden"];
            }
            if (v54)
            {
              char v56 = 1;
              goto LABEL_121;
            }
LABEL_118:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ![v11 areObjectsDifferentOnProperty:@"favorite" changeType:2])
            {
              goto LABEL_125;
            }
            char v56 = 0;
LABEL_121:
            if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"favorite")])
            {
              v57 = +[NSNumber numberWithBool:[(CPLAssetChange *)v9 isFavorite]];
              [v7 setObject:v57 forKey:@"isFavorite"];
            }
            if (v56)
            {
              char v58 = 1;
              goto LABEL_128;
            }
LABEL_125:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ![v11 areObjectsDifferentOnProperty:@"caption" changeType:2])
            {
              goto LABEL_132;
            }
            char v58 = 0;
LABEL_128:
            if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"caption")])
            {
              v59 = [(CPLAssetChange *)v9 caption];
              [v7 setLegacyEncryptedObject:v59 forKey:@"captionEnc"];
            }
            if (v58)
            {
              char v60 = 1;
              goto LABEL_135;
            }
LABEL_132:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ![v11 areObjectsDifferentOnProperty:@"keywords" changeType:2])
            {
              goto LABEL_139;
            }
            char v60 = 0;
LABEL_135:
            if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"keywords")])
            {
              v61 = [(CPLAssetChange *)v9 keywords];
              [v7 setLegacyEncryptedObject:v61 forKey:@"keywordsEnc"];
            }
            if (v60)
            {
              char v62 = 1;
              goto LABEL_142;
            }
LABEL_139:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ![v11 areObjectsDifferentOnProperty:@"extendedDescription" changeType:2])
            {
              goto LABEL_146;
            }
            char v62 = 0;
LABEL_142:
            if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"extendedDescription")])
            {
              v63 = [(CPLAssetChange *)v9 extendedDescription];
              [v7 setLegacyEncryptedObject:v63 forKey:@"extendedDescEnc"];
            }
            if (v62)
            {
              char v64 = 1;
              goto LABEL_149;
            }
LABEL_146:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ![v11 areObjectsDifferentOnProperty:@"accessibilityDescription" changeType:2])
            {
              goto LABEL_153;
            }
            char v64 = 0;
LABEL_149:
            if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"accessibilityDescription")])
            {
              v65 = [(CPLAssetChange *)v9 accessibilityDescription];
              [v7 setLegacyEncryptedObject:v65 forKey:@"accessibilityDescEnc"];
            }
            if (v64)
            {
              char v66 = 1;
              goto LABEL_156;
            }
LABEL_153:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ![v11 areObjectsDifferentOnProperty:@"masterIdentifier" changeType:2])
            {
              goto LABEL_161;
            }
            char v66 = 0;
LABEL_156:
            if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"masterIdentifier")])
            {
              uint64_t v67 = [(CPLAssetChange *)v9 masterScopedIdentifier];
              if (!v67) {
                sub_1001CE794((uint64_t)v9, (uint64_t)v142);
              }
              v68 = (void *)v67;
              [v7 setCKReferenceWithScopedIdentifier:v67 forKey:@"masterRef" referenceAction:1];
            }
            if (v66)
            {
              char v69 = 1;
              goto LABEL_164;
            }
LABEL_161:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ![v11 areObjectsDifferentOnProperty:@"addedDate" changeType:2])
            {
              goto LABEL_168;
            }
            char v69 = 0;
LABEL_164:
            if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"addedDate")])
            {
              id v70 = [(CPLAssetChange *)v9 addedDate];
              [v7 setObject:v70 forKey:@"addedDate"];
            }
            if (v69)
            {
              char v71 = 1;
              goto LABEL_171;
            }
LABEL_168:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ![v11 areObjectsDifferentOnProperty:@"location" changeType:2])
            {
              if ((+[CPLAssetChange serverSupportsDeletedByUserIdentifier] & 1) == 0)goto LABEL_184; {
              goto LABEL_179;
              }
            }
            char v71 = 0;
LABEL_171:
            if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"location")])
            {
              v72 = [(CPLAssetChange *)v9 location];
              unint64_t v73 = [v72 cplLocationDictionary];
              [v7 setLegacyEncryptedObject:v73 forKey:@"locationEnc"];
            }
            if ((+[CPLAssetChange serverSupportsDeletedByUserIdentifier] & 1) == 0)
            {
              if (v71)
              {
LABEL_183:
                char v75 = 1;
                goto LABEL_187;
              }
LABEL_184:
              if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
                && ![v11 areObjectsDifferentOnProperty:@"placeAnnotation" changeType:2])
              {
                goto LABEL_191;
              }
              char v75 = 0;
LABEL_187:
              if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"placeAnnotation")])
              {
                v76 = [(CPLAssetChange *)v9 placeAnnotation];
                v77 = [v76 cplPlaceAnnotationDictionary];
                [v7 setLegacyEncryptedObject:v77 forKey:@"placeInfoEnc"];
              }
              if (v75)
              {
                char v78 = 1;
                goto LABEL_194;
              }
LABEL_191:
              if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
                && ![v11 areObjectsDifferentOnProperty:@"timeZoneName" changeType:2])
              {
                goto LABEL_198;
              }
              char v78 = 0;
LABEL_194:
              if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"timeZoneName")])
              {
                v79 = [(CPLAssetChange *)v9 timeZoneName];
                [v7 setLegacyEncryptedObject:v79 forKey:@"timeZoneNameEnc"];
              }
              if (v78)
              {
                char v80 = 1;
                goto LABEL_201;
              }
LABEL_198:
              if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
                && ![v11 areObjectsDifferentOnProperty:@"burstIdentifier" changeType:2])
              {
                goto LABEL_205;
              }
              char v80 = 0;
LABEL_201:
              if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"burstIdentifier")])
              {
                v81 = [(CPLAssetChange *)v9 burstIdentifier];
                [v7 setObject:v81 forKey:@"burstId"];
              }
              if (v80)
              {
                char v82 = 1;
                goto LABEL_208;
              }
LABEL_205:
              if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
                && ![v11 areObjectsDifferentOnProperty:@"mediaGroupIdentifier" changeType:2])
              {
                goto LABEL_212;
              }
              char v82 = 0;
LABEL_208:
              if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"mediaGroupIdentifier")])
              {
                v83 = [(CPLAssetChange *)v9 mediaGroupIdentifier];
                [v7 setObject:v83 forKey:@"mediaGroupId"];
              }
              if (v82)
              {
                char v84 = 1;
                goto LABEL_215;
              }
LABEL_212:
              if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
                && ![v11 areObjectsDifferentOnProperty:@"videoComplementDurationValue" changeType:2])
              {
                goto LABEL_219;
              }
              char v84 = 0;
LABEL_215:
              if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"videoComplementDurationValue")])
              {
                v85 = +[NSNumber numberWithInteger:[(CPLAssetChange *)v9 videoComplementDurationValue]];
                [v7 setObject:v85 forKey:@"vidComplDurValue"];
              }
              if (v84)
              {
                char v86 = 1;
                goto LABEL_222;
              }
LABEL_219:
              if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
                && ![v11 areObjectsDifferentOnProperty:@"videoComplementDurationTimescale" changeType:2])
              {
                goto LABEL_226;
              }
              char v86 = 0;
LABEL_222:
              if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"videoComplementDurationTimescale")])
              {
                v87 = +[NSNumber numberWithInteger:[(CPLAssetChange *)v9 videoComplementDurationTimescale]];
                [v7 setObject:v87 forKey:@"vidComplDurScale"];
              }
              if (v86)
              {
                char v88 = 1;
                goto LABEL_229;
              }
LABEL_226:
              if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
                && ![v11 areObjectsDifferentOnProperty:@"videoComplementImageDisplayValue" changeType:2])
              {
                goto LABEL_233;
              }
              char v88 = 0;
LABEL_229:
              if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"videoComplementImageDisplayValue")])
              {
                v89 = +[NSNumber numberWithInteger:[(CPLAssetChange *)v9 videoComplementImageDisplayValue]];
                [v7 setObject:v89 forKey:@"vidComplDispValue"];
              }
              if (v88)
              {
                char v90 = 1;
                goto LABEL_236;
              }
LABEL_233:
              if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
                && ![v11 areObjectsDifferentOnProperty:@"videoComplementImageDisplayTimescale" changeType:2])
              {
                goto LABEL_240;
              }
              char v90 = 0;
LABEL_236:
              if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"videoComplementImageDisplayTimescale")])
              {
                v91 = +[NSNumber numberWithInteger:[(CPLAssetChange *)v9 videoComplementImageDisplayTimescale]];
                [v7 setObject:v91 forKey:@"vidComplDispScale"];
              }
              if (v90)
              {
                char v92 = 1;
                goto LABEL_243;
              }
LABEL_240:
              if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
                && ![v11 areObjectsDifferentOnProperty:@"videoComplementVisibilityState" changeType:2])
              {
                goto LABEL_247;
              }
              char v92 = 0;
LABEL_243:
              if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"videoComplementVisibilityState")])
              {
                v93 = +[NSNumber numberWithUnsignedInteger:[(CPLAssetChange *)v9 videoComplementVisibilityState]];
                [v7 setObject:v93 forKey:@"vidComplVisibilityState"];
              }
              if (v92)
              {
                char v94 = 1;
                goto LABEL_250;
              }
LABEL_247:
              if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
                && ![v11 areObjectsDifferentOnProperty:@"assetSubtype" changeType:2])
              {
                goto LABEL_259;
              }
              char v94 = 0;
LABEL_250:
              if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"assetSubtype")])
              {
                v95 = (char *)[(CPLAssetChange *)v9 assetSubtype];
                if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:"assetSubtype"])
                {
                  v96 = +[NSNumber numberWithUnsignedInteger:v95];
                  [v7 setObject:v96 forKey:@"assetSubtypeV2"];
                }
                if ((unint64_t)(v95 - 100) >= 2 && (unint64_t)v95 > 1)
                {
                  [v7 setObject:&off_100291ED8 forKey:@"assetSubtype"];
                  if (v94) {
                    goto LABEL_257;
                  }
                  goto LABEL_259;
                }
                v97 = +[NSNumber numberWithUnsignedInteger:v95];
                [v7 setObject:v97 forKey:@"assetSubtype"];
              }
              if (v94)
              {
LABEL_257:
                char v98 = 1;
                goto LABEL_262;
              }
LABEL_259:
              if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
                && ![v11 areObjectsDifferentOnProperty:@"burstFlags" changeType:2])
              {
                goto LABEL_269;
              }
              char v98 = 0;
LABEL_262:
              if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"burstFlags")])
              {
                unint64_t v99 = (unint64_t)[(CPLAssetChange *)v9 burstFlags];
                unint64_t v100 = v99 & 0xFFFFFFFFFFFFFFE0;
                if ((v99 & 0xFFFFFFFFFFFFFFE0) != 0)
                {
                  v101 = +[NSNumber numberWithUnsignedInteger:v99 & 0x1F];
                  [v7 setObject:v101 forKey:@"burstFlags"];

                  v102 = +[NSNumber numberWithUnsignedInteger:v100];
                  CFStringRef v103 = @"burstFlagsExt";
                }
                else
                {
                  v102 = +[NSNumber numberWithUnsignedInteger:v99];
                  CFStringRef v103 = @"burstFlags";
                }
                [v7 setObject:v102 forKey:v103];
              }
              if (v98)
              {
                char v104 = 1;
                goto LABEL_272;
              }
LABEL_269:
              if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
                && ![v11 areObjectsDifferentOnProperty:@"timeZoneOffset" changeType:2])
              {
                goto LABEL_276;
              }
              char v104 = 0;
LABEL_272:
              if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"timeZoneOffset")])
              {
                v105 = [(CPLAssetChange *)v9 timeZoneOffset];
                [v7 setObject:v105 forKey:@"timeZoneOffset"];
              }
              if (v104)
              {
                char v106 = 1;
                goto LABEL_279;
              }
LABEL_276:
              if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
                && ![v11 areObjectsDifferentOnProperty:@"assetHDRType" changeType:2])
              {
                goto LABEL_283;
              }
              char v106 = 0;
LABEL_279:
              if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"assetHDRType")])
              {
                long long v107 = +[NSNumber numberWithUnsignedInteger:[(CPLAssetChange *)v9 assetHDRType]];
                [v7 setObject:v107 forKey:@"assetHDRType"];
              }
              if (v106)
              {
                char v108 = 1;
                goto LABEL_286;
              }
LABEL_283:
              if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
                && ![v11 areObjectsDifferentOnProperty:@"customRenderedValue" changeType:2])
              {
LABEL_289:
                if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
                  && ![v11 areObjectsDifferentOnProperty:@"trashedReason" changeType:2])
                {
LABEL_293:

                  goto LABEL_294;
                }
LABEL_291:
                if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"trashedReason")])
                {
                  long long v110 = +[NSNumber numberWithUnsignedShort:[(CPLAssetChange *)v9 trashedReason]];
                  [v7 setObject:v110 forKey:@"trashReason"];
                }
                goto LABEL_293;
              }
              char v108 = 0;
LABEL_286:
              if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"customRenderedValue")])
              {
                long long v109 = +[NSNumber numberWithLongLong:[(CPLAssetChange *)v9 customRenderedValue]];
                [v7 setObject:v109 forKey:@"customRenderedValue"];
              }
              if (v108) {
                goto LABEL_291;
              }
              goto LABEL_289;
            }
            if (v71)
            {
              char v74 = 1;
LABEL_182:
              [(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"deletedByUserIdentifier")];
              if (v74) {
                goto LABEL_183;
              }
              goto LABEL_184;
            }
LABEL_179:
            if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
              && ![v11 areObjectsDifferentOnProperty:@"deletedByUserIdentifier" changeType:2])
            {
              goto LABEL_184;
            }
            char v74 = 0;
            goto LABEL_182;
          }
          if (v24)
          {
            char v24 = 1;
LABEL_50:
            if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"lastViewedDate")])
            {
              v26 = [(CPLAssetChange *)v9 lastViewedDate];
              [v7 setLegacyEncryptedObject:v26 forKey:@"lastViewedDateEnc"];
            }
            goto LABEL_52;
          }
LABEL_47:
          if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
            && ![v11 areObjectsDifferentOnProperty:@"lastViewedDate" changeType:2])
          {
            goto LABEL_54;
          }
          char v24 = 0;
          goto LABEL_50;
        }
        if (v21)
        {
          char v21 = 1;
LABEL_34:
          if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"sharedLibrarySharingState")])
          {
            v23 = +[NSNumber numberWithLongLong:[(CPLAssetChange *)v9 sharedLibrarySharingState]];
            [v7 setLegacyEncryptedObject:v23 forKey:@"sharedSyncSharingStateEnc"];
          }
          goto LABEL_36;
        }
LABEL_31:
        if (([(CPLAssetChange *)v9 isFullRecord] & 1) == 0
          && ![v11 areObjectsDifferentOnProperty:@"sharedLibrarySharingState" changeType:2])
        {
          goto LABEL_38;
        }
        char v21 = 0;
        goto LABEL_34;
      }
    }
    char v12 = 1;
    goto LABEL_9;
  }
LABEL_294:
  if (![(CPLAssetChange *)v9 hasChangeType:8]) {
    goto LABEL_313;
  }
  if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"orientation")])
  {
    v111 = +[NSNumber numberWithInteger:[(CPLAssetChange *)v9 orientation]];
    [v7 setObject:v111 forKey:@"orientation"];
  }
  if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"adjustments")])
  {
    v112 = [(CPLAssetChange *)v9 adjustments];
    v113 = [v112 adjustmentType];
    [v7 setObject:v113 forKey:@"adjustmentType"];

    v114 = [v112 adjustmentCompoundVersion];
    [v7 setObject:v114 forKey:@"adjustmentCompoundVersion"];

    v115 = [v112 adjustmentCreatorCode];
    [v7 setObject:v115 forKey:@"adjustmentCreatorCode"];

    v116 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v112 adjustmentSourceType]);
    [v7 setObject:v116 forKey:@"adjustmentSourceType"];

    v117 = [v112 similarToOriginalAdjustmentsFingerprint];
    [v7 setObject:v117 forKey:@"similarToOriginalAdjustmentsFingerprint"];

    v118 = [v112 otherAdjustmentsFingerprint];
    [v7 setObject:v118 forKey:@"otherAdjustmentsFingerprint"];

    v119 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v112 adjustmentRenderTypes]);
    [v7 setObject:v119 forKey:@"adjustmentRenderType"];

    v120 = [v112 adjustmentTimestamp];
    [v7 setLegacyEncryptedObject:v120 forKey:@"adjustmentTimestampEnc"];

    v121 = [v112 simpleAdjustmentData];
    [v7 setLegacyEncryptedObject:v121 forKey:@"adjustmentSimpleDataEnc"];
  }
  if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"duration")])
  {
    id v122 = [(CPLAssetChange *)v9 duration];
    v123 = +[NSNumber numberWithInteger:v122];
    if (v123)
    {
      if ([(CPLAssetChange *)v9 shouldUseEncryptedPropertiesIfPossibleWithContext:v10])
      {
        v124 = +[NSNumber numberWithInteger:v122];
        [v7 setObject:v124 forKey:@"duration"];

        uint64_t v125 = objc_opt_class();
        v126 = v7;
        v127 = v123;
LABEL_306:
        [v126 setEncryptedObject:v127 forKey:@"durationEnc" validateClass:v125];

        goto LABEL_307;
      }
      v128 = v7;
      v129 = v123;
    }
    else
    {
      v128 = v7;
      v129 = 0;
    }
    [v128 setObject:v129 forKey:@"duration"];
    uint64_t v125 = objc_opt_class();
    v126 = v7;
    v127 = 0;
    goto LABEL_306;
  }
LABEL_307:
  if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"originalChoice")])
  {
    v130 = +[NSNumber numberWithUnsignedInteger:[(CPLAssetChange *)v9 originalChoice]];
    [v7 setObject:v130 forKey:@"originalChoice"];
  }
  if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"adjustedMediaMetaDataType")])
  {
    v131 = [(CPLAssetChange *)v9 adjustedMediaMetaDataType];
    [v7 setObject:v131 forKey:@"adjustedMediaMetaDataStrType"];
  }
  if ([(CPLAssetChange *)v9 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"adjustedMediaMetaData")])
  {
    v132 = [(CPLAssetChange *)v9 adjustedMediaMetaData];
    [v7 setLegacyEncryptedObject:v132 forKey:@"adjustedMediaMetaDataEnc"];
  }
LABEL_313:
  if ([(CPLAssetChange *)v9 hasChangeType:32])
  {
    v133 = v9;
    if ([&off_100294350 count])
    {
      long long v149 = 0u;
      long long v150 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      id v134 = [&off_100294350 countByEnumeratingWithState:&v147 objects:v152 count:16];
      if (!v134)
      {
LABEL_326:

        goto LABEL_327;
      }
      id v135 = v134;
      uint64_t v136 = *(void *)v148;
LABEL_317:
      uint64_t v137 = 0;
      while (1)
      {
        if (*(void *)v148 != v136) {
          objc_enumerationMutation(&off_100294350);
        }
        if ([(CPLAssetChange *)v133 shouldApplyPropertiesWithSelector:NSSelectorFromString(*(NSString **)(*((void *)&v147 + 1) + 8 * v137))])break; {
        if (v135 == (id)++v137)
        }
        {
          id v135 = [&off_100294350 countByEnumeratingWithState:&v147 objects:v152 count:16];
          if (v135) {
            goto LABEL_317;
          }
          goto LABEL_326;
        }
      }
    }

    if ([(CPLAssetChange *)v133 shouldApplyPropertiesWithSelector:"facesData"])
    {
      v138 = [(CPLAssetChange *)v133 facesData];
      [v7 setLegacyEncryptedObject:v138 forKey:@"faces"];

      v139 = +[NSNumber numberWithInteger:[(CPLAssetChange *)v133 facesVersion]];
      [v7 setObject:v139 forKey:@"facesVersion"];

      v133 = [(CPLAssetChange *)v133 facesAdjustmentsFingerprint];
      [v7 setObject:v133 forKey:@"facesAdjustmentsFingerprint"];
      goto LABEL_326;
    }
  }
LABEL_327:
}

- (BOOL)shouldClearMissingResourcesInCKRecord
{
  return 1;
}

@end