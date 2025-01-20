@interface MSSubscribeStreamsProtocol
- (MSSubscribeStreamsProtocol)initWithPersonID:(id)a3 baseURL:(id)a4;
- (id)_assetCollectionsFromCoreArray:(id)a3 personID:(id)a4 outError:(id *)a5;
- (id)_assetFromCoreDictionary:(id)a3 personID:(id)a4 outError:(id *)a5;
- (id)_invalidFieldErrorWithFieldName:(id)a3;
- (id)_invalidFieldErrorWithFieldName:(id)a3 suggestion:(id)a4;
- (id)_pathToChunkIndex:(int)a3;
- (id)delegate;
- (void)_chunkDidBeginStreamForPersonID:(id)a3 wasReset:(BOOL)a4 metadata:(id)a5;
- (void)_chunkDidEndStreamForPersonID:(id)a3 ctag:(id)a4;
- (void)_chunkDidFindSubscriptionGoneForPersonID:(id)a3;
- (void)_chunkDidFindSubscriptionTemporarilyUnavailableForPersonID:(id)a3;
- (void)_chunkDidParseAssetCollections:(id)a3 forPersonID:(id)a4;
- (void)_coreProtocolDidFailAuthentication:(id)a3;
- (void)_coreProtocolDidFinishError:(id)a3;
- (void)_coreProtocolDidGetDataChunk:(id)a3;
- (void)_parseChunks;
- (void)_parseNextChunk;
- (void)abort;
- (void)dealloc;
- (void)pollForSubscriptionUpdatesWithAccountAnchors:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MSSubscribeStreamsProtocol

- (void)abort
{
}

- (id)_assetCollectionsFromCoreArray:(id)a3 personID:(id)a4 outError:(id *)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v38 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v9 = v7;
  uint64_t v40 = [v9 countByEnumeratingWithState:&v55 objects:v60 count:16];
  if (!v40)
  {

LABEL_37:
    v34 = v38;
    id v35 = v38;
    id v10 = 0;
    goto LABEL_39;
  }
  id v10 = 0;
  uint64_t v41 = *(void *)v56;
  v39 = v9;
  while (2)
  {
    for (uint64_t i = 0; i != v40; ++i)
    {
      if (*(void *)v56 != v41) {
        objc_enumerationMutation(v9);
      }
      v12 = *(void **)(*((void *)&v55 + 1) + 8 * i);
      v13 = [v12 objectForKey:@"masterAsset"];
      if (v13)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v33 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"masterAsset"];

          id v10 = (id)v33;
          goto LABEL_34;
        }
      }
      id v54 = v10;
      v14 = [(MSSubscribeStreamsProtocol *)self _assetFromCoreDictionary:v13 personID:v8 outError:&v54];
      id v15 = v54;

      if (v15)
      {

        id v10 = v15;
        goto LABEL_35;
      }
      v46 = v13;
      uint64_t v16 = [v12 objectForKey:@"fileName"];
      uint64_t v45 = [v12 objectForKey:@"collId"];
      v17 = [v12 objectForKey:@"serverUploadedDate"];
      v18 = [v12 objectForKey:@"derivedAssets"];
      v47 = (void *)v16;
      v48 = v14;
      v44 = v18;
      if (v18)
      {
        v19 = v18;
        v42 = v17;
        uint64_t v43 = i;
        v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v18, "count"));
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v21 = v19;
        uint64_t v22 = [v21 countByEnumeratingWithState:&v50 objects:v59 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v51;
          while (2)
          {
            for (uint64_t j = 0; j != v23; ++j)
            {
              if (*(void *)v51 != v24) {
                objc_enumerationMutation(v21);
              }
              uint64_t v26 = *(void *)(*((void *)&v50 + 1) + 8 * j);
              id v49 = 0;
              v27 = [(MSSubscribeStreamsProtocol *)self _assetFromCoreDictionary:v26 personID:v8 outError:&v49];
              id v28 = v49;
              if (v28)
              {
                id v10 = v28;
                int v29 = 4;
                v17 = v42;
                uint64_t i = v43;
                v30 = (void *)v45;
                goto LABEL_26;
              }
              [v20 addObject:v27];
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v50 objects:v59 count:16];
            if (v23) {
              continue;
            }
            break;
          }
        }

        v17 = v42;
        uint64_t i = v43;
        v14 = v48;
      }
      else
      {
        v20 = 0;
      }
      id v21 = +[MSAssetCollection collectionWithMasterAsset:v14 fileName:v16 derivedAssets:v20];
      v27 = [v12 objectForKey:@"deleted"];
      v30 = (void *)v45;
      if (!v27) {
        goto LABEL_24;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v21 setWasDeleted:1];
LABEL_24:
        [v21 setAssetCollectionID:v45];
        [v17 doubleValue];
        v32 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:v31 / 1000.0];
        [v21 setServerUploadedDate:v32];
        [v38 addObject:v21];

        int v29 = 0;
        id v10 = 0;
        goto LABEL_26;
      }
      id v10 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"deleted"];
      int v29 = 4;
LABEL_26:

      if (v29)
      {
        id v9 = v39;
        goto LABEL_34;
      }
      id v9 = v39;
    }
    uint64_t v40 = [v39 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v40) {
      continue;
    }
    break;
  }
LABEL_34:

  if (!v10) {
    goto LABEL_37;
  }
LABEL_35:
  v34 = v38;
  if (a5)
  {
    id v10 = v10;
    id v35 = 0;
    *a5 = v10;
  }
  else
  {
    id v35 = 0;
  }
LABEL_39:

  return v35;
}

- (id)_assetFromCoreDictionary:(id)a3 personID:(id)a4 outError:(id *)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = +[MSAsset asset];
  v11 = [v8 objectForKey:@"fileHash"];
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"fileHash"];
      goto LABEL_110;
    }
    [v10 setFileHash:v11];
  }
  v12 = [v8 objectForKey:@"masterAssetHash"];
  if (!v12)
  {
LABEL_7:
    v13 = [v8 objectForKey:@"type"];
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"type"];
LABEL_108:

        goto LABEL_109;
      }
      [v10 setType:v13];
    }
    v14 = [v8 objectForKey:@"MMCSAccessHeader"];
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"MMCSAccessHeader"];
LABEL_107:

        goto LABEL_108;
      }
      [v10 setMMCSAccessHeader:v14];
    }
    uint64_t v15 = [v8 objectForKey:@"MMCSURL"];
    v75 = (void *)v15;
    if (v15)
    {
      uint64_t v16 = v15;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"MMCSURL"];
LABEL_106:

        goto LABEL_107;
      }
      [v10 setMMCSURL:v16];
    }
    uint64_t v17 = [v8 objectForKey:@"protocolFileSize"];
    v74 = (void *)v17;
    if (v17)
    {
      v18 = (void *)v17;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"protocolFileSize"];
LABEL_105:

        goto LABEL_106;
      }
      objc_msgSend(v10, "setProtocolFileSize:", objc_msgSend(v18, "unsignedLongLongValue"));
    }
    v19 = [v8 objectForKey:@"metadata"];
    if (v19)
    {
      v72 = v13;
      v20 = a5;
      id v21 = v9;
      uint64_t v22 = v14;
      uint64_t v23 = v19;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v71 = [MEMORY[0x1E4F1CA60] dictionary];
        id v73 = v23;
        uint64_t v24 = [v23 objectForKey:@"fileSize"];
        v14 = v22;
        id v9 = v21;
        a5 = v20;
        v13 = v72;
        v70 = (void *)v24;
        if (v24)
        {
          uint64_t v25 = v24;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"fileSize"];
LABEL_103:

            v19 = v73;
            goto LABEL_104;
          }
          [v71 setObject:v25 forKey:@"MSAssetMetadataFileSize"];
        }
        uint64_t v26 = [v73 objectForKey:@"pixelWidth"];
        v69 = (void *)v26;
        if (v26)
        {
          uint64_t v27 = v26;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"pixelWidth"];
LABEL_102:

            goto LABEL_103;
          }
          [v71 setObject:v27 forKey:@"MSAssetMetadataPixelWidth"];
        }
        uint64_t v28 = [v73 objectForKey:@"pixelHeight"];
        v68 = (void *)v28;
        if (v28)
        {
          uint64_t v29 = v28;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"pixelHeight"];
LABEL_101:

            goto LABEL_102;
          }
          [v71 setObject:v29 forKey:@"MSAssetMetadataPixelHeight"];
        }
        uint64_t v30 = [v73 objectForKey:@"deviceID"];
        v67 = (void *)v30;
        if (v30)
        {
          uint64_t v31 = v30;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"deviceID"];
LABEL_100:

            goto LABEL_101;
          }
          [v71 setObject:v31 forKey:@"MSAssetMetadataDeviceID"];
        }
        uint64_t v32 = [v73 objectForKey:@"dateContentModified"];
        v66 = (void *)v32;
        if (v32)
        {
          uint64_t v33 = v32;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"dateContentModified"];
LABEL_99:

            goto LABEL_100;
          }
          [v71 setObject:v33 forKey:@"MSAssetMetadataDateContentModified"];
        }
        uint64_t v34 = [v73 objectForKey:@"dateContentCreated"];
        v65 = (void *)v34;
        if (v34)
        {
          uint64_t v35 = v34;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"dateContentCreated"];
LABEL_98:

            goto LABEL_99;
          }
          [v71 setObject:v35 forKey:@"MSAssetMetadataDateContentCreated"];
        }
        uint64_t v36 = [v73 objectForKey:@"sourceLibraryID"];
        v64 = (void *)v36;
        if (v36)
        {
          uint64_t v37 = v36;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"sourceLibraryID"];
LABEL_97:

            goto LABEL_98;
          }
          [v71 setObject:v37 forKey:@"MSAssetMetadataSourceLibraryID"];
        }
        uint64_t v38 = [v73 objectForKey:@"sourceItemID"];
        v63 = (void *)v38;
        if (v38)
        {
          uint64_t v39 = v38;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"sourceItemID"];
LABEL_96:

            goto LABEL_97;
          }
          [v71 setObject:v39 forKey:@"MSAssetMetadataSourceItemID"];
        }
        uint64_t v40 = [v73 objectForKey:@"sourceContainerType"];
        v62 = (void *)v40;
        if (v40)
        {
          uint64_t v41 = v40;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"sourceContainerType"];
LABEL_95:

            goto LABEL_96;
          }
          [v71 setObject:v41 forKey:@"MSAssetMetadataSourceContainerTypeKey"];
        }
        uint64_t v42 = [v73 objectForKey:@"sourceContainerID"];
        uint64_t v61 = (void *)v42;
        if (v42)
        {
          uint64_t v43 = v42;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"sourceContainerID"];
LABEL_94:

            goto LABEL_95;
          }
          [v71 setObject:v43 forKey:@"MSAssetMetadataSourceContainerIDKey"];
        }
        uint64_t v44 = [v73 objectForKey:@"sourceContainerDisplayName"];
        v60 = (void *)v44;
        if (v44)
        {
          uint64_t v45 = v44;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"sourceContainerDisplayName"];
LABEL_93:

            goto LABEL_94;
          }
          [v71 setObject:v45 forKey:@"MSAssetMetadataSourceContainerDisplayNameKey"];
        }
        uint64_t v46 = [v73 objectForKey:@"deviceDisplayName"];
        v59 = (void *)v46;
        if (v46)
        {
          uint64_t v47 = v46;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"deviceDisplayName"];
LABEL_92:

            goto LABEL_93;
          }
          [v71 setObject:v47 forKey:@"MSAssetMetadataDeviceDisplayNameKey"];
        }
        long long v58 = [v73 objectForKey:@"rasterToDisplayRotationAngle"];
        if (v58)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"rasterToDisplayRotationAngle"];
LABEL_91:

            goto LABEL_92;
          }
          [v71 setObject:v58 forKey:@"MSAssetMetadataRasterToDisplayRotationAngleKey"];
        }
        uint64_t v48 = [v73 objectForKey:@"sourceiCloudPhotoLibraryEnabled"];
        long long v57 = (void *)v48;
        if (v48)
        {
          uint64_t v49 = v48;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"sourceiCloudPhotoLibraryEnabled"];
LABEL_90:

            goto LABEL_91;
          }
          [v71 setObject:v49 forKey:@"MSAssetMetadataSourceiCloudPhotoLibraryEnabledKey"];
        }
        if (v9) {
          [v71 setObject:v9 forKey:@"MSAssetMetadataStreamIDKey"];
        }
        if ([v71 count]) {
          [v10 setMetadata:v71];
        }
        long long v50 = 0;
        goto LABEL_90;
      }
      long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"metadata"];
      v19 = v23;
      v14 = v22;
      id v9 = v21;
      a5 = v20;
      v13 = v72;
    }
    else
    {
      long long v50 = 0;
    }
LABEL_104:

    goto LABEL_105;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v10 setMasterAssetHash:v12];
    goto LABEL_7;
  }
  long long v50 = [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:@"masterAssetHash"];
LABEL_109:

LABEL_110:
  if (v50)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      long long v52 = objc_opt_class();
      id v53 = v52;
      id v54 = [(MSStreamsProtocol *)self personID];
      long long v55 = [v50 MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      v77 = v52;
      __int16 v78 = 2112;
      v79 = v54;
      __int16 v80 = 2114;
      v81 = v55;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Cannot parse asset dictionary. Error: %{public}@", buf, 0x20u);

      if (a5) {
        goto LABEL_113;
      }
    }
    else if (a5)
    {
LABEL_113:
      id v51 = 0;
      *a5 = v50;
      goto LABEL_117;
    }
    id v51 = 0;
  }
  else
  {
    id v51 = v10;
  }
LABEL_117:

  return v51;
}

- (id)_invalidFieldErrorWithFieldName:(id)a3
{
  return [(MSSubscribeStreamsProtocol *)self _invalidFieldErrorWithFieldName:a3 suggestion:0];
}

- (id)_invalidFieldErrorWithFieldName:(id)a3 suggestion:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28C58];
  v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  id v9 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_GET_CONNECTION_INVALID_FIELD_P_NAME");
  id v10 = objc_msgSend(v6, "stringWithFormat:", v9, v8);

  v11 = [v5 MSErrorWithDomain:@"MSStreamsGetConnectionErrorDomain" code:2 description:v10 suggestion:v7];

  return v11;
}

- (void)_chunkDidFindSubscriptionTemporarilyUnavailableForPersonID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    id v7 = [(MSStreamsProtocol *)self personID];
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2112;
    v12 = v7;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Subscription temporarily unavailable for person ID %@", (uint8_t *)&v9, 0x20u);
  }
  id v8 = [(MSSubscribeStreamsProtocol *)self delegate];
  [v8 subscribeStreamsProtocol:self didFindTemporarilyUnavailableSubscriptionForPersonID:v4];
}

- (void)_chunkDidFindSubscriptionGoneForPersonID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    id v7 = [(MSStreamsProtocol *)self personID];
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2112;
    v12 = v7;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%{public}@ - %@ Subscription is gone for person ID %@", (uint8_t *)&v9, 0x20u);
  }
  id v8 = [(MSSubscribeStreamsProtocol *)self delegate];
  [v8 subscribeStreamsProtocol:self didFindDisappearedSubscriptionForPersonID:v4];
}

- (void)_chunkDidEndStreamForPersonID:(id)a3 ctag:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v9 = objc_opt_class();
    id v10 = v9;
    __int16 v11 = [(MSStreamsProtocol *)self personID];
    int v12 = 138543874;
    __int16 v13 = v9;
    __int16 v14 = 2112;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@- %@ Finished stream for personID: %@", (uint8_t *)&v12, 0x20u);
  }
  id v8 = [(MSSubscribeStreamsProtocol *)self delegate];
  [v8 subscribeStreamsProtocol:self didFinishReceivingUpdatesForPersonID:v6 ctag:v7];
}

- (void)_chunkDidParseAssetCollections:(id)a3 forPersonID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = objc_opt_class();
    id v16 = v15;
    id v17 = [(MSStreamsProtocol *)self personID];
    *(_DWORD *)buf = 138543874;
    v20 = v15;
    __int16 v21 = 2112;
    uint64_t v22 = v17;
    __int16 v23 = 2114;
    id v24 = v6;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Parsed asset collections: %{public}@", buf, 0x20u);
  }
  id v18 = 0;
  id v8 = [(MSSubscribeStreamsProtocol *)self _assetCollectionsFromCoreArray:v6 personID:v7 outError:&v18];
  id v9 = v18;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v10 = objc_opt_class();
      id v11 = v10;
      int v12 = [(MSStreamsProtocol *)self personID];
      __int16 v13 = [v9 MSVerboseDescription];
      *(_DWORD *)buf = 138543874;
      v20 = v10;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      __int16 v23 = 2114;
      id v24 = v13;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Could not create asset collections from response. Error: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    __int16 v14 = [(MSSubscribeStreamsProtocol *)self delegate];
    [v14 subscribeStreamsProtocol:self didReceiveAssetCollections:v8 forPersonID:v7];
  }
}

- (void)_chunkDidBeginStreamForPersonID:(id)a3 wasReset:(BOOL)a4 metadata:(id)a5
{
  BOOL v6 = a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v11 = objc_opt_class();
    id v12 = v11;
    __int16 v13 = [(MSStreamsProtocol *)self personID];
    int v14 = 138544386;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v13;
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 1024;
    BOOL v21 = v6;
    __int16 v22 = 2114;
    id v23 = v9;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Begin stream for personID: %@ - was reset: %d\nMetadata: %{public}@", (uint8_t *)&v14, 0x30u);
  }
  id v10 = [(MSSubscribeStreamsProtocol *)self delegate];
  [v10 subscribeStreamsProtocol:self willReceiveUpdatesForPersonID:v8 wasReset:v6 metadata:v9];
}

- (void)_parseNextChunk
{
  v27[2] = *MEMORY[0x1E4F143B8];
  if (self->_chunkIndex < 1)
  {
LABEL_10:
    id v8 = 0;
  }
  else
  {
    uint64_t v3 = 0;
    id v4 = MEMORY[0x1E4F14500];
    while (1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        id v11 = objc_opt_class();
        id v12 = v11;
        __int16 v13 = [(MSStreamsProtocol *)self personID];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v11;
        __int16 v24 = 2112;
        uint64_t v25 = v13;
        __int16 v26 = 1024;
        LODWORD(v27[0]) = v3;
        _os_log_debug_impl(&dword_1DC434000, v4, OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Parsing chunk number %d.", buf, 0x1Cu);
      }
      id v5 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      BOOL v6 = [(MSSubscribeStreamsProtocol *)self _pathToChunkIndex:v3];
      CFDataRef v7 = (const __CFData *)[v5 initWithContentsOfFile:v6];

      if (v7)
      {
        *(void *)buf = 0;
        MSSSPCChunkParsingParseNextChunk(&self->_parseContext->var0, v7, (CFErrorRef *)buf);
        id v8 = *(void **)buf;
      }
      else
      {
        id v9 = (void *)MEMORY[0x1E4F28C58];
        id v10 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_GET_CONNECTION_MISSING_CHUNK");
        id v8 = [v9 MSErrorWithDomain:@"MSStreamsGetConnectionErrorDomain" code:4 description:v10];
      }
      if (v8) {
        break;
      }
      uint64_t v3 = (v3 + 1);
      if ((int)v3 >= self->_chunkIndex) {
        goto LABEL_10;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v19 = objc_opt_class();
      id v20 = v19;
      BOOL v21 = [(MSStreamsProtocol *)self personID];
      __int16 v22 = [v8 MSVerboseDescription];
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v19;
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      __int16 v26 = 1024;
      LODWORD(v27[0]) = v3;
      WORD2(v27[0]) = 2114;
      *(void *)((char *)v27 + 6) = v22;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@- %@ Error found while parsing chunk number %d. Error: %{public}@", buf, 0x26u);
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = objc_opt_class();
    id v16 = v15;
    id v17 = [(MSStreamsProtocol *)self personID];
    __int16 v18 = [v8 MSVerboseDescription];
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v15;
    __int16 v24 = 2112;
    uint64_t v25 = v17;
    __int16 v26 = 2114;
    v27[0] = v18;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Finished parsing all chunks. Error: %{public}@", buf, 0x20u);
  }
  _resetChunkContext(&self->_parseContext->var0);
  free(self->_parseContext);
  self->_parseContext = 0;
  int v14 = [(MSSubscribeStreamsProtocol *)self delegate];
  [v14 subscribeStreamsProtocol:self didFinishError:v8];
}

- (void)_parseChunks
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (__MSSSPCChunkParsingContext *)malloc_type_malloc(0x58uLL, 0x10E0040CFB3EB4CuLL);
  self->_parseContext = v3;
  v3->var0 = self;
  self->_parseContext->var1 = _chunkBeginStreamCallback;
  self->_parseContext->var2 = _chunkAssetCollectionsCallback;
  self->_parseContext->var3 = _chunkEndStreamCallback;
  self->_parseContext->var4 = _chunkSubscriptionSourceGoneCallback;
  self->_parseContext->var5 = _chunkSubscriptionSourceTemporarilyUnavailableCallback;
  parseContext = self->_parseContext;
  *(_OWORD *)&parseContext->var6 = 0u;
  *(_OWORD *)&parseContext->var8 = 0u;
  parseContext->var10 = 0;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    CFDataRef v7 = [(MSStreamsProtocol *)self personID];
    int chunkIndex = self->_chunkIndex;
    int v9 = 138543874;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v7;
    __int16 v13 = 1024;
    int v14 = chunkIndex;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Starting to parse %d chunks.", (uint8_t *)&v9, 0x1Cu);
  }
  [(MSSubscribeStreamsProtocol *)self _parseNextChunk];
}

- (void)_coreProtocolDidFailAuthentication:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28CB8];
  id v5 = a3;
  id v6 = [v4 defaultManager];
  CFDataRef v7 = [(MSStreamsProtocol *)self personID];
  id v8 = MSPathSubscribeProtocolDirForPersonID(v7);
  [v6 removeItemAtPath:v8 error:0];

  id v9 = [(MSSubscribeStreamsProtocol *)self delegate];
  [v9 subscribeStreamsProtocol:self didReceiveAuthenticationError:v5];
}

- (void)_coreProtocolDidGetDataChunk:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138543362;
    id v8 = v5;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "Got chunk: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(MSSubscribeStreamsProtocol *)self _pathToChunkIndex:self->_chunkIndex];
  [v4 writeToFile:v6 atomically:0];

  ++self->_chunkIndex;
}

- (void)_coreProtocolDidFinishError:(id)a3
{
  id v8 = a3;
  if (v8)
  {
    id v4 = [(MSSubscribeStreamsProtocol *)self delegate];
    id v5 = v4;
    id v6 = self;
    id v7 = v8;
LABEL_3:
    [v4 subscribeStreamsProtocol:v6 didFinishError:v7];

    goto LABEL_6;
  }
  if (self->_chunkIndex < 1)
  {
    id v4 = [(MSSubscribeStreamsProtocol *)self delegate];
    id v5 = v4;
    id v6 = self;
    id v7 = 0;
    goto LABEL_3;
  }
  [(MSSubscribeStreamsProtocol *)self _parseChunks];
LABEL_6:
}

- (void)pollForSubscriptionUpdatesWithAccountAnchors:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    id v5 = objc_opt_class();
    id v6 = v5;
    id v7 = [(MSStreamsProtocol *)self personID];
    int v14 = 138543618;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ Requesting subscription updates...", (uint8_t *)&v14, 0x16u);
  }
  id v8 = [(MSStreamsProtocol *)self personID];
  uint64_t v9 = MSPathSubscribeProtocolDirForPersonID(v8);

  id v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  [v10 removeItemAtPath:v9 error:0];
  [v10 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:0];
  self->_int chunkIndex = 0;
  p_context = &self->_context;
  [(MSStreamsProtocol *)self _refreshAuthTokenForContext:&self->_context];
  id v12 = [(MSStreamsProtocol *)self getURL];
  CFDictionaryRef v13 = (const __CFDictionary *)MSPURLConnectionProperties();
  MSSSPCGetMetadataAsync(p_context, (uint64_t)v12, v13, v4);
}

- (id)_pathToChunkIndex:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = [(MSStreamsProtocol *)self personID];
  id v5 = MSPathSubscribeProtocolDirForPersonID(v4);
  id v6 = objc_msgSend(NSString, "stringWithFormat:", @"chunk_%04d.plist", v3);
  id v7 = [v5 stringByAppendingPathComponent:v6];

  return v7;
}

- (void)dealloc
{
  free(self->_parseContext);

  v3.receiver = self;
  v3.super_class = (Class)MSSubscribeStreamsProtocol;
  [(MSSubscribeStreamsProtocol *)&v3 dealloc];
}

- (MSSubscribeStreamsProtocol)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSSubscribeStreamsProtocol;
  id v7 = [(MSStreamsProtocol *)&v10 initWithPersonID:v6 baseURL:a4];
  id v8 = v7;
  if (v7)
  {
    v7->_context._super.owner = v7;
    v7->_context._super.personID = (__CFString *)v6;
    v8->_context._super.deviceInfo = [(MSStreamsProtocol *)v8 deviceInfoDict];
    v8->_context.finishedCallback = _finishedCallback;
    v8->_context.gotDataChunkCallback = _gotDataChunkCallback;
    v8->_context.authFailedCallback = _authenticationFailedCallback;
    v8->_context.didReceiveRetryAfterCallback = _protocolDidReceiveRetryAfterDate_981;
    v8->_context.didReceiveServerSideConfigurationVersionCallback = _didReceiveServerSideConfigurationVersion;
  }

  return v8;
}

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MSSubscribeStreamsProtocol;
  [(MSStreamsProtocol *)&v3 setDelegate:a3];
}

- (id)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)MSSubscribeStreamsProtocol;
  v2 = [(MSStreamsProtocol *)&v4 delegate];
  return v2;
}

@end