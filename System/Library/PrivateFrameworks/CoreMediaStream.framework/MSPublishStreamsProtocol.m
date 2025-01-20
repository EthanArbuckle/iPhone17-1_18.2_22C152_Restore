@interface MSPublishStreamsProtocol
- (BOOL)_insertInfoAboutAsset:(id)a3 intoDictionary:(id)a4 outError:(id *)a5;
- (MSPublishStreamsProtocol)initWithPersonID:(id)a3 baseURL:(id)a4;
- (id)_metadataDictForAsset:(id)a3 outError:(id *)a4;
- (id)_metadataDictForAssetCollection:(id)a3 outError:(id *)a4;
- (id)_missingAssetFieldErrorWithFieldName:(id)a3;
- (id)delegate;
- (void)_coreProtocolDidFailAuthenticationError:(id)a3;
- (void)_coreProtocolDidFinishResponse:(id)a3 error:(id)a4;
- (void)_coreProtocolDidFinishUCResults:(id)a3 error:(id)a4;
- (void)_resetConnectionVariables;
- (void)abort;
- (void)dealloc;
- (void)sendMetadataForAssetCollections:(id)a3;
- (void)sendUploadCompleteForAssetCollections:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MSPublishStreamsProtocol

- (void).cxx_destruct
{
}

- (void)_coreProtocolDidFinishUCResults:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_opt_class();
    id v10 = v9;
    v11 = [(MSStreamsProtocol *)self personID];
    v12 = [v7 MSVerboseDescription];
    int v13 = 138543874;
    v14 = v9;
    __int16 v15 = 2112;
    v16 = v11;
    __int16 v17 = 2114;
    v18 = v12;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Upload complete connection has failed. Error: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  v8 = [(MSPublishStreamsProtocol *)self delegate];
  [v8 publishStreamsProtocol:self didFinishSendingUploadCompleteError:v7];
}

- (void)_coreProtocolDidFailAuthenticationError:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v6 = objc_opt_class();
    id v7 = v6;
    v8 = [(MSStreamsProtocol *)self personID];
    v9 = [v4 MSVerboseDescription];
    int v10 = 138543874;
    v11 = v6;
    __int16 v12 = 2112;
    int v13 = v8;
    __int16 v14 = 2114;
    __int16 v15 = v9;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Failed authentication. Error: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [(MSPublishStreamsProtocol *)self _resetConnectionVariables];
  v5 = [(MSPublishStreamsProtocol *)self delegate];
  [v5 publishStreamsProtocol:self didReceiveAuthenticationError:v4];
}

- (void)_coreProtocolDidFinishResponse:(id)a3 error:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      int v13 = objc_opt_class();
      id v14 = v13;
      __int16 v15 = [(MSStreamsProtocol *)self personID];
      uint64_t v16 = [v7 MSVerboseDescription];
      int v17 = 138543874;
      v18 = v13;
      __int16 v19 = 2112;
      v20 = v15;
      __int16 v21 = 2114;
      v22 = v16;
      _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Put connection has failed. Error: %{public}@", (uint8_t *)&v17, 0x20u);
    }
    [(MSPublishStreamsProtocol *)self _resetConnectionVariables];
    v8 = [(MSPublishStreamsProtocol *)self delegate];
    v9 = v8;
    int v10 = self;
    id v11 = v6;
    id v12 = v7;
  }
  else
  {
    v8 = [(MSPublishStreamsProtocol *)self delegate];
    v9 = v8;
    int v10 = self;
    id v11 = v6;
    id v12 = 0;
  }
  [v8 publishStreamsProtocol:v10 didFinishUploadingMetadataResponse:v11 error:v12];
}

- (void)abort
{
  MSSPCCancelHTTPTransaction((uint64_t)&self->_context);
  MSSPCCancelHTTPTransaction((uint64_t)&self->_UCContext);
}

- (void)sendUploadCompleteForAssetCollections:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    id v7 = [(MSStreamsProtocol *)self personID];
    *(_DWORD *)buf = 138543618;
    v24 = v5;
    __int16 v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ Sending upload complete...", buf, 0x16u);
  }
  v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = -[MSPublishStreamsProtocol _metadataDictForAssetCollection:outError:](self, "_metadataDictForAssetCollection:outError:", *(void *)(*((void *)&v18 + 1) + 8 * v13), 0, (void)v18);
        if (v14) {
          [v8 addObject:v14];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  p_UCContext = &self->_UCContext;
  [(MSStreamsProtocol *)self _refreshAuthTokenForContext:&self->_UCContext];
  uint64_t v16 = [(MSStreamsProtocol *)self uploadCompleteURL];
  CFDictionaryRef v17 = (const __CFDictionary *)MSPURLConnectionProperties();
  MSPSPCUCSendUploadCompleteAsync(p_UCContext, (uint64_t)v16, v17, (CFArrayRef)v8);
}

- (void)sendMetadataForAssetCollections:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v5 = objc_opt_class();
    id v6 = v5;
    id v7 = [(MSStreamsProtocol *)self personID];
    *(_DWORD *)buf = 138543618;
    v53 = v5;
    __int16 v54 = 2112;
    v55 = v7;
    _os_log_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%{public}@ - %@ Sending metadata to Streams server...", buf, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  CFArrayRef theArray = (CFArrayRef)objc_claimAutoreleasedReturnValue();
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0x1E4F1C000uLL;
    uint64_t v12 = *(void *)v49;
    uint64_t v40 = *(void *)v49;
    id v41 = v8;
    do
    {
      uint64_t v13 = 0;
      uint64_t v42 = v10;
      do
      {
        if (*(void *)v49 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v48 + 1) + 8 * v13);
        __int16 v15 = objc_msgSend(*(id *)(v11 + 2656), "dictionary", v40, v41);
        uint64_t v16 = [v14 masterAsset];

        if (v16)
        {
          CFDictionaryRef v17 = [v14 masterAsset];
          long long v18 = [(MSPublishStreamsProtocol *)self _metadataDictForAsset:v17 outError:0];

          if (!v18) {
            goto LABEL_28;
          }
          [v15 setObject:v18 forKey:@"masterAsset"];
        }
        long long v19 = [v14 derivedAssets];
        uint64_t v20 = [v19 count];

        if (v20)
        {
          long long v21 = (void *)MEMORY[0x1E4F1CA48];
          v22 = [v14 derivedAssets];
          uint64_t v23 = objc_msgSend(v21, "arrayWithCapacity:", objc_msgSend(v22, "count"));

          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          v24 = [v14 derivedAssets];
          uint64_t v25 = [v24 countByEnumeratingWithState:&v44 objects:v58 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v45;
            do
            {
              uint64_t v28 = 0;
              do
              {
                if (*(void *)v45 != v27) {
                  objc_enumerationMutation(v24);
                }
                v29 = [(MSPublishStreamsProtocol *)self _metadataDictForAsset:*(void *)(*((void *)&v44 + 1) + 8 * v28) outError:0];
                if (v29) {
                  [v23 addObject:v29];
                }

                ++v28;
              }
              while (v26 != v28);
              uint64_t v26 = [v24 countByEnumeratingWithState:&v44 objects:v58 count:16];
            }
            while (v26);
          }

          if ([v23 count]) {
            [v15 setObject:v23 forKey:@"derivedAssets"];
          }

          uint64_t v12 = v40;
          id v8 = v41;
          unint64_t v11 = 0x1E4F1C000;
          uint64_t v10 = v42;
        }
        [(__CFArray *)theArray addObject:v15];
        v30 = [v14 fileName];

        if (v30)
        {
          v31 = [v14 fileName];
          [v15 setObject:v31 forKey:@"fileName"];
        }
        v32 = [v14 assetCollectionID];

        if (v32)
        {
          v33 = [v14 assetCollectionID];
          [v15 setObject:v33 forKey:@"collId"];
        }
LABEL_28:

        ++v13;
      }
      while (v13 != v10);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v59 count:16];
    }
    while (v10);
  }

  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    v37 = objc_opt_class();
    id v38 = v37;
    v39 = [(MSStreamsProtocol *)self personID];
    *(_DWORD *)buf = 138543874;
    v53 = v37;
    __int16 v54 = 2112;
    v55 = v39;
    __int16 v56 = 2114;
    CFArrayRef v57 = theArray;
    _os_log_debug_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Sending metadata for asset collections: %{public}@", buf, 0x20u);
  }
  p_context = &self->_context;
  [(MSStreamsProtocol *)self _refreshAuthTokenForContext:&self->_context];
  v35 = [(MSStreamsProtocol *)self putURL];
  CFDictionaryRef v36 = (const __CFDictionary *)MSPURLConnectionProperties();
  MSPSPCSendMetadataAsync(p_context, (uint64_t)v35, v36, theArray);
}

- (id)_metadataDictForAssetCollection:(id)a3 outError:(id *)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 assetCollectionID];

  if (v7)
  {
    id v7 = [v6 masterAsset];

    if (v7)
    {
      id v7 = [MEMORY[0x1E4F1CA60] dictionary];
      id v8 = [v6 assetCollectionID];
      [v7 setObject:v8 forKey:@"collId"];

      uint64_t v9 = [v6 fileName];

      if (v9)
      {
        uint64_t v10 = [v6 fileName];
        [v7 setObject:v10 forKey:@"fileName"];
      }
      unint64_t v11 = [v6 masterAsset];
      id v37 = 0;
      uint64_t v12 = [(MSPublishStreamsProtocol *)self _metadataDictForAsset:v11 outError:&v37];
      id v13 = v37;

      if (!v13)
      {
        [v7 setObject:v12 forKey:@"masterAsset"];
        id v13 = [v6 derivedAssets];

        if (v13)
        {
          v30 = v12;
          v31 = a4;
          id v14 = [MEMORY[0x1E4F1CA48] array];
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          __int16 v15 = [v6 derivedAssets];
          uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v46 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v34;
            while (2)
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v34 != v18) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v20 = *(void *)(*((void *)&v33 + 1) + 8 * i);
                id v32 = 0;
                long long v21 = [(MSPublishStreamsProtocol *)self _metadataDictForAsset:v20 outError:&v32];
                id v22 = v32;
                if (v22)
                {
                  id v13 = v22;

                  goto LABEL_23;
                }
                [v14 addObject:v21];
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v46 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }

          [v7 setObject:v14 forKey:@"derivedAssets"];
          id v13 = 0;
LABEL_23:

          uint64_t v12 = v30;
          a4 = v31;
        }
      }

      if (!v13) {
        goto LABEL_25;
      }
      goto LABEL_19;
    }
    uint64_t v23 = @"masterAsset";
  }
  else
  {
    uint64_t v23 = @"assetCollectionID";
  }
  id v13 = [(MSPublishStreamsProtocol *)self _missingAssetFieldErrorWithFieldName:v23];
  if (!v13)
  {
LABEL_25:
    id v24 = v7;
    goto LABEL_28;
  }
LABEL_19:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    uint64_t v25 = objc_opt_class();
    id v26 = v25;
    uint64_t v27 = [(MSStreamsProtocol *)self personID];
    uint64_t v28 = [v13 MSVerboseDescription];
    *(_DWORD *)buf = 138544130;
    v39 = v25;
    __int16 v40 = 2112;
    id v41 = v27;
    __int16 v42 = 2114;
    id v43 = v6;
    __int16 v44 = 2114;
    long long v45 = v28;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Rejecting asset collection %{public}@\nReason: %{public}@", buf, 0x2Au);

    if (a4) {
      goto LABEL_21;
    }
  }
  else if (a4)
  {
LABEL_21:
    id v24 = 0;
    *a4 = v13;
    goto LABEL_28;
  }
  id v24 = 0;
LABEL_28:

  return v24;
}

- (id)_metadataDictForAsset:(id)a3 outError:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 fileHash];

  if (v7)
  {
    id v7 = [v6 type];

    if (v7)
    {
      id v8 = [v6 metadata];
      uint64_t v9 = [v8 objectForKey:@"MSAssetMetadataPixelWidth"];
      uint64_t v10 = [v8 objectForKey:@"MSAssetMetadataPixelHeight"];
      unint64_t v11 = (void *)v10;
      if (v9)
      {
        if (v10)
        {
          id v7 = [MEMORY[0x1E4F1CA60] dictionary];
          uint64_t v12 = [v6 fileHash];
          [v7 setObject:v12 forKey:@"fileHash"];

          id v13 = [v6 type];
          [v7 setObject:v13 forKey:@"type"];

          id v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "protocolFileSize"));
          [v7 setObject:v14 forKey:@"protocolFileSize"];

          __int16 v15 = [v6 MMCSReceipt];
          if (v15) {
            [v7 setObject:v15 forKey:@"MMCSReceipt"];
          }
          uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
          [v16 setObject:v9 forKey:@"pixelWidth"];
          [v16 setObject:v11 forKey:@"pixelHeight"];
          uint64_t v17 = [v8 objectForKey:@"MSAssetMetadataFileSize"];
          if (v17) {
            [v16 setObject:v17 forKey:@"fileSize"];
          }

          uint64_t v18 = [v8 objectForKey:@"MSAssetMetadataSHA1HashKey"];
          if (v18) {
            [v16 setObject:v18 forKey:@"SHA1"];
          }

          long long v19 = [v8 objectForKey:@"MSAssetMetadataDateContentModified"];
          if (v19) {
            [v16 setObject:v19 forKey:@"dateContentModified"];
          }

          uint64_t v20 = [v8 objectForKey:@"MSAssetMetadataDateContentCreated"];
          if (v20) {
            [v16 setObject:v20 forKey:@"dateContentCreated"];
          }

          long long v21 = [v8 objectForKey:@"MSAssetMetadataSourceLibraryID"];
          if (v21) {
            [v16 setObject:v21 forKey:@"sourceLibraryID"];
          }

          id v22 = [v8 objectForKey:@"MSAssetMetadataSourceItemID"];
          if (v22) {
            [v16 setObject:v22 forKey:@"sourceItemID"];
          }

          uint64_t v23 = [v8 objectForKey:@"MSAssetMetadataSourceContainerTypeKey"];
          if (v23) {
            [v16 setObject:v23 forKey:@"sourceContainerType"];
          }

          id v24 = [v8 objectForKey:@"MSAssetMetadataSourceContainerIDKey"];
          if (v24) {
            [v16 setObject:v24 forKey:@"sourceContainerID"];
          }

          uint64_t v25 = [v8 objectForKey:@"MSAssetMetadataSourceContainerDisplayNameKey"];
          if (v25) {
            [v16 setObject:v25 forKey:@"sourceContainerDisplayName"];
          }

          id v26 = [v8 objectForKey:@"MSAssetMetadataDeviceDisplayNameKey"];
          if (v26) {
            [v16 setObject:v26 forKey:@"deviceDisplayName"];
          }

          uint64_t v27 = [v8 objectForKey:@"MSAssetMetadataRasterToDisplayRotationAngleKey"];
          if (v27) {
            [v16 setObject:v27 forKey:@"rasterToDisplayRotationAngle"];
          }

          uint64_t v28 = [v8 objectForKey:@"MSAssetMetadataSourceiCloudPhotoLibraryEnabledKey"];
          if (v28) {
            [v16 setObject:v28 forKey:@"sourceiCloudPhotoLibraryEnabled"];
          }

          [v7 setObject:v16 forKey:@"metadata"];
          v29 = 0;
LABEL_41:

          if (!v29) {
            goto LABEL_42;
          }
          goto LABEL_35;
        }
        id v32 = @"height";
      }
      else
      {
        id v32 = @"width";
      }
      v29 = [(MSPublishStreamsProtocol *)self _missingAssetFieldErrorWithFieldName:v32];
      id v7 = 0;
      goto LABEL_41;
    }
    v30 = @"type";
  }
  else
  {
    v30 = @"fileHash";
  }
  v29 = [(MSPublishStreamsProtocol *)self _missingAssetFieldErrorWithFieldName:v30];
  if (!v29)
  {
LABEL_42:
    id v31 = v7;
    goto LABEL_45;
  }
LABEL_35:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v33 = objc_opt_class();
    id v34 = v33;
    long long v35 = [(MSStreamsProtocol *)self personID];
    long long v36 = [v29 MSVerboseDescription];
    int v38 = 138544130;
    v39 = v33;
    __int16 v40 = 2112;
    id v41 = v35;
    __int16 v42 = 2114;
    id v43 = v6;
    __int16 v44 = 2114;
    long long v45 = v36;
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Rejecting asset %{public}@\nReason: %{public}@", (uint8_t *)&v38, 0x2Au);

    if (a4) {
      goto LABEL_37;
    }
  }
  else if (a4)
  {
LABEL_37:
    id v31 = 0;
    *a4 = v29;
    goto LABEL_45;
  }
  id v31 = 0;
LABEL_45:

  return v31;
}

- (void)_resetConnectionVariables
{
  self->_assetCollectionsInFlight = 0;
  MEMORY[0x1F41817F8]();
}

- (BOOL)_insertInfoAboutAsset:(id)a3 intoDictionary:(id)a4 outError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 fileHash];

  if (v10)
  {
    unint64_t v11 = [v8 type];

    if (v11)
    {
      uint64_t v12 = [v8 metadata];
      id v13 = [v12 objectForKey:@"MSAssetMetadataPixelWidth"];
      uint64_t v14 = [v12 objectForKey:@"MSAssetMetadataPixelHeight"];
      __int16 v15 = (void *)v14;
      if (v13)
      {
        if (v14)
        {
          uint64_t v16 = [v8 fileHash];
          uint64_t v17 = [v16 MSHexString];
          [v9 setObject:v17 forKey:@"fingerprint"];

          uint64_t v18 = [v8 type];
          [v9 setObject:v18 forKey:@"type"];

          long long v19 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", objc_msgSend(v8, "protocolFileSize"));
          [v9 setObject:v19 forKey:@"size"];

          uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v13, "unsignedLongValue"));
          [v9 setObject:v20 forKey:@"width"];

          long long v21 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v15, "unsignedLongValue"));
          [v9 setObject:v21 forKey:@"height"];

          id v22 = 0;
          goto LABEL_13;
        }
        id v24 = @"height";
      }
      else
      {
        id v24 = @"width";
      }
      id v22 = [(MSPublishStreamsProtocol *)self _missingAssetFieldErrorWithFieldName:v24];
LABEL_13:

      if (!a5) {
        goto LABEL_16;
      }
      goto LABEL_14;
    }
    uint64_t v23 = @"type";
  }
  else
  {
    uint64_t v23 = @"fileHash";
  }
  id v22 = [(MSPublishStreamsProtocol *)self _missingAssetFieldErrorWithFieldName:v23];
  if (!a5) {
    goto LABEL_16;
  }
LABEL_14:
  if (v22) {
    *a5 = v22;
  }
LABEL_16:

  return v22 == 0;
}

- (id)_missingAssetFieldErrorWithFieldName:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28C58];
  id v4 = NSString;
  id v5 = a3;
  id v6 = (__CFString *)MSCFCopyLocalizedString(@"ERROR_PUT_CONNECTION_MISSING_ASSET_FIELD_P_FIELD");
  id v7 = objc_msgSend(v4, "stringWithFormat:", v6, v5);

  id v8 = [v3 MSErrorWithDomain:@"MSStreamsPutConnectionErrorDomain" code:5 description:v7];

  return v8;
}

- (void)dealloc
{
  p_context = &self->_context;

  v4.receiver = self;
  v4.super_class = (Class)MSPublishStreamsProtocol;
  [(MSPublishStreamsProtocol *)&v4 dealloc];
}

- (MSPublishStreamsProtocol)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSPublishStreamsProtocol;
  id v7 = [(MSStreamsProtocol *)&v11 initWithPersonID:v6 baseURL:a4];
  id v8 = v7;
  if (v7)
  {
    v7->_context._super.owner = v7;
    id v9 = (__CFString *)v6;
    v8->_context._super.personID = v9;
    v8->_context._super.deviceInfo = [(MSStreamsProtocol *)v8 deviceInfoDict];
    v8->_context._super.connectionTimeout = 0.0;
    v8->_context.finishedCallback = _protocolDidFinish;
    v8->_context.authFailedCallback = _protocolDidFailAuthentication;
    v8->_context.didReceiveRetryAfterCallback = _protocolDidReceiveRetryAfterDate;
    v8->_context.didReceiveServerSideConfigurationVersionCallback = _protocolDidReceiveServerSideConfigurationVersion;
    v8->_UCContext._super.owner = v8;
    v8->_UCContext._super.personID = v9;
    v8->_UCContext._super.deviceInfo = [(MSStreamsProtocol *)v8 deviceInfoDict];
    v8->_UCContext._super.connectionTimeout = 0.0;
    v8->_UCContext.finishedCallback = _protocolDidFinishUC;
    v8->_UCContext.authFailedCallback = _protocolDidFailAuthenticationUC;
    v8->_UCContext.didReceiveServerSideConfigurationVersionCallback = _protocolDidReceiveServerSideConfigurationVersionUC;
  }

  return v8;
}

- (void)setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MSPublishStreamsProtocol;
  [(MSStreamsProtocol *)&v3 setDelegate:a3];
}

- (id)delegate
{
  v4.receiver = self;
  v4.super_class = (Class)MSPublishStreamsProtocol;
  v2 = [(MSStreamsProtocol *)&v4 delegate];
  return v2;
}

@end