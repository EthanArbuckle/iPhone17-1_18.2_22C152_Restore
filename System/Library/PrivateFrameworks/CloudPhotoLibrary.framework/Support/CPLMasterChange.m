@interface CPLMasterChange
- (BOOL)shouldClearMissingResourcesInCKRecord;
- (BOOL)shouldProtectResourceTypeFromClearing:(unint64_t)a3;
- (id)dropExpungedResources:(id)a3 withExpungeableResourceStates:(id)a4;
- (id)expungeableResourceStatesFromCKRecord:(id)a3;
- (void)addExpungeableResourceStateToCKRecord:(id)a3;
- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4;
- (void)fillWithCKRecord:(id)a3;
@end

@implementation CPLMasterChange

- (void)addExpungeableResourceStateToCKRecord:(id)a3
{
  id v4 = a3;
  v5 = [(CPLMasterChange *)self expungeableResourceStates];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = sub_1000961D8((uint64_t)CPLCloudKitResourceKeys, (uint64_t)[v10 resourceType]);
        if (v11
          && +[CPLResource resourceTypeSupportsResourceExpunge:](CPLResource, "resourceTypeSupportsResourceExpunge:", [v10 resourceType]))
        {
          if ([v10 expungedState])
          {
            v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 expungedState]);
            v13 = sub_10009678C((uint64_t)v11);
            [v4 setObject:v12 forKey:v13];
          }
          else
          {
            v12 = sub_10009678C((uint64_t)v11);
            [v4 setObject:0 forKey:v12];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
}

- (id)expungeableResourceStatesFromCKRecord:(id)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_1000A8CF4;
  v13 = sub_1000A8D04;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000A8D0C;
  v6[3] = &unk_10027A420;
  v6[4] = self;
  id v3 = a3;
  id v7 = v3;
  uint64_t v8 = &v9;
  +[CPLResource enumerateResourceTypesWithBlock:v6];
  id v4 = [(id)v10[5] copy];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)dropExpungedResources:(id)a3 withExpungeableResourceStates:(id)a4
{
  id v5 = a3;
  id v23 = a4;
  id v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v5;
  id v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v8 = v23;
        id v9 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v26;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v8);
              }
              v13 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
              id v14 = [v13 resourceType];
              if (v14 == [v7 resourceType])
              {
                if ([v13 expungedState] == (id)2
                  || ([v13 expungedDate],
                      long long v15 = objc_claimAutoreleasedReturnValue(),
                      +[NSDate date],
                      long long v16 = objc_claimAutoreleasedReturnValue(),
                      id v17 = [v15 compare:v16],
                      v16,
                      v15,
                      v17 == (id)-1))
                {

                  goto LABEL_18;
                }
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v10) {
              continue;
            }
            break;
          }
        }

        [v20 addObject:v7];
LABEL_18:
        ;
      }
      id v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v24);
  }

  id v18 = [v20 copy];
  return v18;
}

- (BOOL)shouldProtectResourceTypeFromClearing:(unint64_t)a3
{
  return (a3 < 0x19) & (0x1C60702u >> a3);
}

- (void)fillWithCKRecord:(id)a3
{
  id v4 = self;
  id v5 = a3;
  id v6 = [v5 objectForKey:@"itemType"];
  [(CPLMasterChange *)v4 setItemType:v6];

  id v7 = objc_msgSend(v5, "cpl_legacyDecryptedObjectForKey:validateClass:", @"filenameEnc", objc_opt_class());
  [(CPLMasterChange *)v4 setFilename:v7];

  id v8 = [v5 objectForKey:@"originalCreationDate"];
  [(CPLMasterChange *)v4 setCreationDate:v8];

  id v9 = [v5 objectForKey:@"importDate"];
  [(CPLMasterChange *)v4 setImportDate:v9];

  id v10 = [v5 objectForKey:@"importGroupId"];
  [(CPLMasterChange *)v4 setImportGroupIdentifier:v10];

  uint64_t v11 = [v5 objectForKey:@"mediaMetaDataType"];
  [(CPLMasterChange *)v4 setMediaMetaDataType:v11];

  v12 = objc_msgSend(v5, "cpl_legacyDecryptedObjectForKey:validateClass:", @"mediaMetaDataEnc", objc_opt_class());
  [(CPLMasterChange *)v4 setMediaMetaData:v12];

  objc_msgSend(v5, "cpl_objectForKey:validateClass:", @"originalOrientation", objc_opt_class());
  v13 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  id v14 = v13;
  if (!v13) {
    v13 = &off_100291E90;
  }
  -[CPLMasterChange setOriginalOrientation:](v4, "setOriginalOrientation:", [v13 integerValue]);

  objc_msgSend(v5, "cpl_objectForKey:validateClass:", @"fullSizeJPEGSource", objc_opt_class());
  long long v15 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  long long v16 = v15;
  if (!v15) {
    long long v15 = &off_100291E90;
  }
  -[CPLMasterChange setFullSizeJPEGSource:](v4, "setFullSizeJPEGSource:", [v15 unsignedIntegerValue]);

  id v17 = [v5 objectForKey:@"originatingFingerprint"];
  [(CPLMasterChange *)v4 setOriginatingFingerprint:v17];

  objc_msgSend(v5, "cpl_objectForKey:validateClass:", @"importedBy", objc_opt_class());
  id v18 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (!v18) {
    id v18 = &off_100291E90;
  }
  -[CPLMasterChange setImportedBy:](v4, "setImportedBy:", (__int16)[v18 integerValue]);

  id v20 = objc_msgSend(v5, "cpl_legacyDecryptedObjectForKey:validateClass:", @"importedByBundleIdentifierEnc", objc_opt_class());
  [(CPLMasterChange *)v4 setImportedByBundleIdentifier:v20];

  v21 = objc_msgSend(v5, "cpl_legacyDecryptedObjectForKey:validateClass:", @"importedByDisplayNameEnc", objc_opt_class());
  [(CPLMasterChange *)v4 setImportedByDisplayName:v21];

  objc_msgSend(v5, "cpl_objectForKey:validateClass:", @"videoFrameRate", objc_opt_class());
  uint64_t v22 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  id v23 = v22;
  if (!v22) {
    uint64_t v22 = &off_100291E90;
  }
  -[CPLMasterChange setVideoFrameRate:](v4, "setVideoFrameRate:", (__int16)[v22 integerValue]);

  id v24 = [v5 objectForKey:@"codec"];
  [(CPLMasterChange *)v4 setCodec:v24];

  long long v25 = [(CPLMasterChange *)v4 expungeableResourceStatesFromCKRecord:v5];

  [(CPLMasterChange *)v4 setExpungeableResourceStates:v25];
  id v28 = [(CPLMasterChange *)v4 resources];
  long long v26 = [(CPLMasterChange *)v4 expungeableResourceStates];
  long long v27 = [(CPLMasterChange *)v4 dropExpungedResources:v28 withExpungeableResourceStates:v26];
  [(CPLMasterChange *)v4 setResources:v27];
}

- (void)fillCKRecordBuilder:(id)a3 scopeProvider:(id)a4
{
  id v44 = a3;
  id v6 = a4;
  id v7 = self;
  id v8 = [v6 fingerprintContext];
  if ([(CPLMasterChange *)v7 hasChangeType:2])
  {
    if ([(CPLMasterChange *)v7 isFullRecord])
    {
      id v9 = 0;
    }
    else
    {
      id v9 = [(CPLMasterChange *)v7 attachedDiffTracker];

      if (v9)
      {
        if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
          && ![v9 areObjectsDifferentOnProperty:@"itemType" changeType:2])
        {
          goto LABEL_12;
        }
        char v10 = 0;
LABEL_9:
        if ([(CPLMasterChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"itemType")]&& ([(CPLMasterChange *)v7 itemType], uint64_t v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
        {
          v12 = [(CPLMasterChange *)v7 itemType];
          [v44 setObject:v12 forKey:@"itemType"];

          v13 = +[NSNumber numberWithUnsignedInteger:[(CPLMasterChange *)v7 dataClassType]];
          [v44 setObject:v13 forKey:@"dataClassType"];

          if ((v10 & 1) == 0) {
            goto LABEL_12;
          }
        }
        else if ((v10 & 1) == 0)
        {
LABEL_12:
          if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
            && ![v9 areObjectsDifferentOnProperty:@"filename" changeType:2])
          {
            goto LABEL_20;
          }
          char v14 = 0;
LABEL_17:
          if (-[CPLMasterChange shouldApplyPropertiesWithSelector:](v7, "shouldApplyPropertiesWithSelector:", NSSelectorFromString(@"filename"))&& (-[CPLMasterChange filename](v7, "filename"), long long v15 = objc_claimAutoreleasedReturnValue(), v16 = [v15 length], v15, v16))
          {
            id v17 = [(CPLMasterChange *)v7 filename];
            [v44 setLegacyEncryptedObject:v17 forKey:@"filenameEnc"];

            if ((v14 & 1) == 0) {
              goto LABEL_20;
            }
          }
          else if ((v14 & 1) == 0)
          {
LABEL_20:
            if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
              && ![v9 areObjectsDifferentOnProperty:@"creationDate" changeType:2])
            {
              goto LABEL_29;
            }
            char v18 = 0;
LABEL_25:
            if ([(CPLMasterChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"creationDate")])
            {
              v19 = [(CPLMasterChange *)v7 creationDate];
              [v44 setObject:v19 forKey:@"originalCreationDate"];

              if (v18)
              {
LABEL_27:
                char v20 = 1;
                goto LABEL_32;
              }
            }
            else if (v18)
            {
              goto LABEL_27;
            }
LABEL_29:
            if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
              && ![v9 areObjectsDifferentOnProperty:@"importDate" changeType:2])
            {
              goto LABEL_36;
            }
            char v20 = 0;
LABEL_32:
            if ([(CPLMasterChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"importDate")])
            {
              v21 = [(CPLMasterChange *)v7 importDate];
              [v44 setObject:v21 forKey:@"importDate"];

              if (v20)
              {
LABEL_34:
                char v22 = 1;
                goto LABEL_39;
              }
            }
            else if (v20)
            {
              goto LABEL_34;
            }
LABEL_36:
            if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
              && ![v9 areObjectsDifferentOnProperty:@"importGroupIdentifier" changeType:2])
            {
              goto LABEL_43;
            }
            char v22 = 0;
LABEL_39:
            if ([(CPLMasterChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"importGroupIdentifier")])
            {
              id v23 = [(CPLMasterChange *)v7 importGroupIdentifier];
              [v44 setObject:v23 forKey:@"importGroupId"];

              if (v22)
              {
LABEL_41:
                char v24 = 1;
                goto LABEL_46;
              }
            }
            else if (v22)
            {
              goto LABEL_41;
            }
LABEL_43:
            if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
              && ![v9 areObjectsDifferentOnProperty:@"mediaMetaDataType" changeType:2])
            {
              goto LABEL_50;
            }
            char v24 = 0;
LABEL_46:
            if ([(CPLMasterChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"mediaMetaDataType")])
            {
              long long v25 = [(CPLMasterChange *)v7 mediaMetaDataType];
              [v44 setObject:v25 forKey:@"mediaMetaDataType"];

              if (v24)
              {
LABEL_48:
                char v26 = 1;
                goto LABEL_53;
              }
            }
            else if (v24)
            {
              goto LABEL_48;
            }
LABEL_50:
            if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
              && ![v9 areObjectsDifferentOnProperty:@"mediaMetaData" changeType:2])
            {
              goto LABEL_57;
            }
            char v26 = 0;
LABEL_53:
            if ([(CPLMasterChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"mediaMetaData")])
            {
              long long v27 = [(CPLMasterChange *)v7 mediaMetaData];
              [v44 setLegacyEncryptedObject:v27 forKey:@"mediaMetaDataEnc"];

              if (v26)
              {
LABEL_55:
                char v28 = 1;
                goto LABEL_60;
              }
            }
            else if (v26)
            {
              goto LABEL_55;
            }
LABEL_57:
            if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
              && ![v9 areObjectsDifferentOnProperty:@"originalOrientation" changeType:2])
            {
              goto LABEL_64;
            }
            char v28 = 0;
LABEL_60:
            if ([(CPLMasterChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"originalOrientation")])
            {
              long long v29 = +[NSNumber numberWithInteger:[(CPLMasterChange *)v7 originalOrientation]];
              [v44 setObject:v29 forKey:@"originalOrientation"];

              if (v28)
              {
LABEL_62:
                char v30 = 1;
                goto LABEL_67;
              }
            }
            else if (v28)
            {
              goto LABEL_62;
            }
LABEL_64:
            if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
              && ![v9 areObjectsDifferentOnProperty:@"fullSizeJPEGSource" changeType:2])
            {
              goto LABEL_71;
            }
            char v30 = 0;
LABEL_67:
            if ([(CPLMasterChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"fullSizeJPEGSource")])
            {
              long long v31 = +[NSNumber numberWithUnsignedInteger:[(CPLMasterChange *)v7 fullSizeJPEGSource]];
              [v44 setObject:v31 forKey:@"fullSizeJPEGSource"];

              if (v30)
              {
LABEL_69:
                char v32 = 1;
                goto LABEL_74;
              }
            }
            else if (v30)
            {
              goto LABEL_69;
            }
LABEL_71:
            if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
              && ![v9 areObjectsDifferentOnProperty:@"originatingFingerprint" changeType:2])
            {
              goto LABEL_78;
            }
            char v32 = 0;
LABEL_74:
            if ([(CPLMasterChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"originatingFingerprint")])
            {
              v33 = [(CPLMasterChange *)v7 originatingFingerprint];
              [v44 setObject:v33 forKey:@"originatingFingerprint"];

              if (v32)
              {
LABEL_76:
                char v34 = 1;
                goto LABEL_81;
              }
            }
            else if (v32)
            {
              goto LABEL_76;
            }
LABEL_78:
            if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
              && ![v9 areObjectsDifferentOnProperty:@"importedBy" changeType:2])
            {
              goto LABEL_85;
            }
            char v34 = 0;
LABEL_81:
            if ([(CPLMasterChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"importedBy")])
            {
              v35 = +[NSNumber numberWithShort:[(CPLMasterChange *)v7 importedBy]];
              [v44 setObject:v35 forKey:@"importedBy"];

              if (v34)
              {
LABEL_83:
                char v36 = 1;
                goto LABEL_88;
              }
            }
            else if (v34)
            {
              goto LABEL_83;
            }
LABEL_85:
            if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
              && ![v9 areObjectsDifferentOnProperty:@"importedByBundleIdentifier" changeType:2])
            {
              goto LABEL_92;
            }
            char v36 = 0;
LABEL_88:
            if ([(CPLMasterChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"importedByBundleIdentifier")])
            {
              v37 = [(CPLMasterChange *)v7 importedByBundleIdentifier];
              [v44 setLegacyEncryptedObject:v37 forKey:@"importedByBundleIdentifierEnc"];

              if (v36)
              {
LABEL_90:
                char v38 = 1;
                goto LABEL_95;
              }
            }
            else if (v36)
            {
              goto LABEL_90;
            }
LABEL_92:
            if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
              && ![v9 areObjectsDifferentOnProperty:@"importedByDisplayName" changeType:2])
            {
              goto LABEL_99;
            }
            char v38 = 0;
LABEL_95:
            if ([(CPLMasterChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"importedByDisplayName")])
            {
              v39 = [(CPLMasterChange *)v7 importedByDisplayName];
              [v44 setLegacyEncryptedObject:v39 forKey:@"importedByDisplayNameEnc"];

              if (v38)
              {
LABEL_97:
                char v40 = 1;
                goto LABEL_102;
              }
            }
            else if (v38)
            {
              goto LABEL_97;
            }
LABEL_99:
            if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
              && ![v9 areObjectsDifferentOnProperty:@"videoFrameRate" changeType:2])
            {
              goto LABEL_106;
            }
            char v40 = 0;
LABEL_102:
            if ([(CPLMasterChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"videoFrameRate")])
            {
              v41 = +[NSNumber numberWithShort:[(CPLMasterChange *)v7 videoFrameRate]];
              [v44 setObject:v41 forKey:@"videoFrameRate"];

              if (v40)
              {
LABEL_104:
                char v42 = 1;
                goto LABEL_109;
              }
            }
            else if (v40)
            {
              goto LABEL_104;
            }
LABEL_106:
            if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
              && ![v9 areObjectsDifferentOnProperty:@"codec" changeType:2])
            {
LABEL_112:
              if (([(CPLMasterChange *)v7 isFullRecord] & 1) == 0
                && ![v9 areObjectsDifferentOnProperty:@"expungeableResourceStates" changeType:2])
              {
LABEL_116:

                goto LABEL_117;
              }
LABEL_114:
              if ([(CPLMasterChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"expungeableResourceStates")])[(CPLMasterChange *)v7 addExpungeableResourceStateToCKRecord:v44]; {
              goto LABEL_116;
              }
            }
            char v42 = 0;
LABEL_109:
            if ([(CPLMasterChange *)v7 shouldApplyPropertiesWithSelector:NSSelectorFromString(@"codec")])
            {
              v43 = [(CPLMasterChange *)v7 codec];
              [v44 setObject:v43 forKey:@"codec"];
            }
            if (v42) {
              goto LABEL_114;
            }
            goto LABEL_112;
          }
          char v18 = 1;
          goto LABEL_25;
        }
        char v14 = 1;
        goto LABEL_17;
      }
    }
    char v10 = 1;
    goto LABEL_9;
  }
LABEL_117:
}

- (BOOL)shouldClearMissingResourcesInCKRecord
{
  return 0;
}

@end