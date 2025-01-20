@interface _BLPrepareDownloadOperation
+ (BOOL)_allowsCellularAccessForAsset:(id)a3 policy:(id)a4 isCellularAllowedForRestores:(BOOL)a5;
+ (BOOL)_isDTServiceHubIssuedRequest:(id)a3;
+ (id)_newDownloadKeyCookieWithValue:(id)a3 URL:(id)a4;
+ (int64_t)_URLSessionTaskPriorityForDownload:(id)a3;
+ (int64_t)_URLSessionTaskPriorityForDownloadPriority:(int64_t)a3;
- (BLDownload)download;
- (BLPrepareDownloadOperation)operation;
- (BOOL)_assetNeedsDecryption:(id)a3;
- (BOOL)_requiresPoweredPluggedIn;
- (BOOL)_sendsStoreHeadersForAsset;
- (BOOL)_shouldCancelDownload;
- (BOOL)_shouldFailForDiskSpaceWithAsset:(id)a3 dataConsumer:(id)a4;
- (BOOL)_usesStreamingZipDataConsumerForAsset:(id)a3;
- (BOOL)allowsCellularAccess;
- (BOOL)isCellularAllowedForRestores;
- (NSString)downloadIdentifier;
- (double)_transferProgressFractionWithAsset:(id)a3;
- (id)_bookManifest;
- (id)_bookPathForBookWithKind:(id)a3 adamID:(id)a4 publicationVersion:(id)a5;
- (id)_bookPathWithKind:(id)a3 permaLink:(id)a4;
- (id)_clientIdentifier;
- (id)_downloadKeyCookieWithAsset:(id)a3;
- (id)_initWithOperation:(id)a3 download:(id)a4 policy:(id)a5;
- (id)_newDataConsumerWithAsset:(id)a3 destinationPath:(id)a4;
- (id)_newURLRequestWithAsset:(id)a3;
- (id)outputBlock;
- (int64_t)_assetSizeFromURLResponse:(id)a3;
- (int64_t)_loadSizeIfNecessaryForAsset:(id)a3;
- (void)dq_action_requestCachedURL;
- (void)run;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setDownload:(id)a3;
- (void)setIsCellularAllowedForRestores:(BOOL)a3;
- (void)setOperation:(id)a3;
- (void)setOutputBlock:(id)a3;
@end

@implementation _BLPrepareDownloadOperation

- (id)_initWithOperation:(id)a3 download:(id)a4 policy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_BLPrepareDownloadOperation;
  v11 = [(_BLPrepareDownloadOperation *)&v17 init];
  p_isa = (id *)&v11->super.isa;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_operation, v8);
    objc_storeStrong(p_isa + 4, a4);
    v13 = [v9 isRestore];
    unsigned int v14 = [v13 BOOLValue];

    if (v14)
    {
      v15 = +[BLRestoreManager sharedInstance];
      objc_msgSend(p_isa, "setIsCellularAllowedForRestores:", objc_msgSend(v15, "isCellularAllowed"));
    }
    objc_msgSend(p_isa, "setAllowsCellularAccess:", +[_BLPrepareDownloadOperation _allowsCellularAccessForAsset:policy:isCellularAllowedForRestores:](_BLPrepareDownloadOperation, "_allowsCellularAccessForAsset:policy:isCellularAllowedForRestores:", v9, v10, objc_msgSend(p_isa, "isCellularAllowedForRestores")));
  }

  return p_isa;
}

- (NSString)downloadIdentifier
{
  v2 = [(_BLPrepareDownloadOperation *)self download];
  v3 = [v2 downloadID];

  return (NSString *)v3;
}

- (id)outputBlock
{
  id v2 = [self->_outputBlock copy];

  return v2;
}

- (void)setOutputBlock:(id)a3
{
  if (self->_outputBlock != a3)
  {
    self->_outputBlock = [a3 copy];
    _objc_release_x1();
  }
}

- (id)_bookManifest
{
  if (+[BLLibraryUtility _isMultiUser]) {
    +[BLBookManifest sharedPurchasedBookManifest];
  }
  else {
  id v2 = +[BLBookManifest purchasedBookManifest];
  }

  return v2;
}

- (id)_bookPathForBookWithKind:(id)a3 adamID:(id)a4 publicationVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([BLDownloadKindEBook isEqualToString:v8])
  {
    v11 = [(_BLPrepareDownloadOperation *)self _bookManifest];
    v12 = [v11 bookPathForAdamID:v9 withPublicationVersion:v10];
  }
  else if ([BLDownloadKindAudiobook isEqualToString:v8])
  {
    v12 = +[BLMediaLibraryUtilities pathOfAudiobookTrackWithStoreIdentifier:v9];
  }
  else
  {
    v12 = 0;
  }
  if ([v12 length])
  {
    v13 = BLServiceLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412802;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v10;
      __int16 v19 = 2112;
      v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[Prepare]: Store book (%@ v%@) already exists on file system at %@. Skipping download and installation.", (uint8_t *)&v15, 0x20u);
    }
  }

  return v12;
}

- (id)_bookPathWithKind:(id)a3 permaLink:(id)a4
{
  id v6 = a4;
  if ([BLDownloadKindEBook isEqualToString:a3])
  {
    v7 = [(_BLPrepareDownloadOperation *)self _bookManifest];
    id v8 = [v7 bookPathPermalink:v6];
  }
  else
  {
    id v8 = 0;
  }
  if ([v8 length])
  {
    id v9 = BLServiceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      unsigned int v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[Prepare]: iTunesU book (%@) already exists on file system at %@. Skipping download and installation.", (uint8_t *)&v11, 0x16u);
    }
  }

  return v8;
}

- (void)run
{
  v3 = [BLPrepareDownloadResponse alloc];
  v4 = [(_BLPrepareDownloadOperation *)self download];
  v5 = [(BLPrepareDownloadResponse *)v3 initWithDownload:v4];

  [(BLPrepareDownloadResponse *)v5 setResult:0];
  id v6 = [(_BLPrepareDownloadOperation *)self downloadIdentifier];
  v7 = BLServiceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v57 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Prepare]: Preparing download", buf, 0xCu);
  }

  if ([(BLPrepareDownloadResponse *)v5 isLocalCacheServer]) {
    [(_BLPrepareDownloadOperation *)self dq_action_requestCachedURL];
  }
  id v8 = [(_BLPrepareDownloadOperation *)self download];
  id v9 = [v8 permlink];
  [(BLPrepareDownloadResponse *)v5 setPermLink:v9];

  id v10 = [(_BLPrepareDownloadOperation *)self download];
  int v11 = [v10 storeIdentifier];

  id v12 = [(_BLPrepareDownloadOperation *)self download];
  __int16 v13 = [v12 permlink];

  unsigned int v14 = [(_BLPrepareDownloadOperation *)self download];
  int v15 = [v14 publicationVersion];

  if (v11 && [v11 longLongValue])
  {
    id v16 = [(_BLPrepareDownloadOperation *)self download];
    __int16 v17 = [v16 kind];
    uint64_t v18 = [(_BLPrepareDownloadOperation *)self _bookPathForBookWithKind:v17 adamID:v11 publicationVersion:v15];
LABEL_10:
    __int16 v19 = (void *)v18;

    goto LABEL_12;
  }
  if ([v13 length])
  {
    id v16 = [(_BLPrepareDownloadOperation *)self download];
    __int16 v17 = [v16 kind];
    uint64_t v18 = [(_BLPrepareDownloadOperation *)self _bookPathWithKind:v17 permaLink:v13];
    goto LABEL_10;
  }
  __int16 v19 = 0;
LABEL_12:
  id v20 = [v19 length];
  if ([(_BLPrepareDownloadOperation *)self _shouldCancelDownload])
  {
    v21 = BLServiceLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v57 = v6;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Prepare]: Cancel invalid automatic download", buf, 0xCu);
    }

    v22 = v5;
    uint64_t v23 = 1;
LABEL_24:
    [(BLPrepareDownloadResponse *)v22 setResult:v23];
    goto LABEL_25;
  }
  v24 = [(_BLPrepareDownloadOperation *)self download];

  if (!v24)
  {
    v26 = BLServiceLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v57 = v6;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Prepare]: Skip prepare for download with no media asset", buf, 0xCu);
    }

    v22 = v5;
    uint64_t v23 = 4;
    goto LABEL_24;
  }
  if (v20)
  {
    v25 = BLServiceLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v57 = v6;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Prepare]: Flagging download as \"finish only\", already have asset", buf, 0xCu);
    }

    v22 = v5;
    uint64_t v23 = 3;
    goto LABEL_24;
  }
  [0 isFileURL];
  v29 = [(_BLPrepareDownloadOperation *)self download];
  uint64_t v30 = [(_BLPrepareDownloadOperation *)self _loadSizeIfNecessaryForAsset:v29];

  if (v30 >= 1) {
    [(BLPrepareDownloadResponse *)v5 setMediaAssetSize:v30];
  }
  v31 = [(_BLPrepareDownloadOperation *)self download];
  uint64_t v32 = [v31 assetPath];

  [(BLPrepareDownloadResponse *)v5 setDestinationPath:v32];
  if ([(BLPrepareDownloadResponse *)v5 isRestore]) {
    [(BLPrepareDownloadResponse *)v5 setIsCellularAllowedForRestores:[(_BLPrepareDownloadOperation *)self isCellularAllowedForRestores]];
  }
  [(BLPrepareDownloadResponse *)v5 setAllowsCellularAccess:[(_BLPrepareDownloadOperation *)self allowsCellularAccess]];
  v33 = [(_BLPrepareDownloadOperation *)self download];
  id v34 = [(_BLPrepareDownloadOperation *)self _newURLRequestWithAsset:v33];

  uint64_t v53 = v32;
  v55 = v34;
  if (v34)
  {
    v35 = [(_BLPrepareDownloadOperation *)self download];
    id v36 = [(_BLPrepareDownloadOperation *)self _newDataConsumerWithAsset:v35 destinationPath:v32];

    if ([(id)objc_opt_class() _isDTServiceHubIssuedRequest:v34])
    {
      v37 = BLServiceLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v57 = v6;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Prepare]: Asking data consumer to override progress value", buf, 0xCu);
      }

      [v36 setOverrideProgress:1];
    }
    -[BLPrepareDownloadResponse setDataConsumer:](v5, "setDataConsumer:", v36, v53);
  }
  -[BLPrepareDownloadResponse setURLRequest:](v5, "setURLRequest:", v34, v53);
  v38 = [(_BLPrepareDownloadOperation *)self download];
  v39 = [(BLPrepareDownloadResponse *)v5 dataConsumer];
  unsigned int v40 = [(_BLPrepareDownloadOperation *)self _shouldFailForDiskSpaceWithAsset:v38 dataConsumer:v39];

  if (v40)
  {
    v41 = BLServiceLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v57 = v6;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Prepare]: Fail download without enough disk space", buf, 0xCu);
    }

    v42 = sub_10004B6AC(103, 0, 0);
    [(BLPrepareDownloadResponse *)v5 setError:v42];

    [(BLPrepareDownloadResponse *)v5 setResult:2];
    v43 = [(BLPrepareDownloadResponse *)v5 dataConsumer];
    v44 = v43;
    v45 = v54;
    if (v43)
    {
      [v43 suspend];
      [(BLPrepareDownloadResponse *)v5 setDataConsumer:0];
    }
  }
  else
  {
    v46 = [(_BLPrepareDownloadOperation *)self _clientIdentifier];
    [(BLPrepareDownloadResponse *)v5 setClientIdentifier:v46];

    [(BLPrepareDownloadResponse *)v5 setRequiresPowerPluggedIn:[(_BLPrepareDownloadOperation *)self _requiresPoweredPluggedIn]];
    v47 = [(_BLPrepareDownloadOperation *)self download];
    [(_BLPrepareDownloadOperation *)self _transferProgressFractionWithAsset:v47];
    -[BLPrepareDownloadResponse setTransferProgressFraction:](v5, "setTransferProgressFraction:");

    v48 = [(_BLPrepareDownloadOperation *)self download];
    v49 = [v48 isAutomaticDownload];
    unsigned int v50 = [v49 BOOLValue];

    [(BLPrepareDownloadResponse *)v5 setAutomaticType:v50];
    [(BLPrepareDownloadResponse *)v5 setDiscretionary:0];
    v51 = [(_BLPrepareDownloadOperation *)self download];
    LODWORD(v48) = +[BLDownloadInfo shouldBeDiscretionary:v51];

    if (v48) {
      [(BLPrepareDownloadResponse *)v5 setDiscretionary:1];
    }
    v52 = objc_opt_class();
    v44 = [(_BLPrepareDownloadOperation *)self download];
    -[BLPrepareDownloadResponse setTaskPriority:](v5, "setTaskPriority:", [v52 _URLSessionTaskPriorityForDownload:v44]);
    v45 = v54;
  }

LABEL_25:
  if (+[BLLibraryUtility _isMultiUser]) {
    [(BLPrepareDownloadResponse *)v5 result];
  }
  v27 = [(_BLPrepareDownloadOperation *)self outputBlock];
  if (v27)
  {
    v28 = [(_BLPrepareDownloadOperation *)self operation];
    ((void (**)(void, void *, BLPrepareDownloadResponse *))v27)[2](v27, v28, v5);

    [(_BLPrepareDownloadOperation *)self setOutputBlock:0];
  }
}

+ (BOOL)_isDTServiceHubIssuedRequest:(id)a3
{
  v3 = [a3 URL];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 host];
    unsigned __int8 v5 = [v4 isEqualToString:@"localhost"];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (BOOL)_allowsCellularAccessForAsset:(id)a3 policy:(id)a4 isCellularAllowedForRestores:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 downloadID];
  id v10 = +[BLNetworkMonitor defaultMonitor];
  id v33 = 0;
  id v11 = [v10 copyCellularNetworkIdentityWithError:&v33];
  id v12 = v33;

  if (v12)
  {
    __int16 v13 = BLServiceLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v35 = v9;
      __int16 v36 = 2112;
      v37 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Prepare]: Error determining cellular identity, error: %@", buf, 0x16u);
    }
  }
  unsigned int v14 = +[BUCellularSettings settingsForIdentity:v11];
  unsigned int v15 = [v14 allowAutomaticDownloads];
  id v16 = [v7 isAutomaticDownload];
  unsigned int v17 = [v16 BOOLValue];

  if (!v17 || v15)
  {
    uint64_t v18 = [v7 isRestore];
    unsigned __int8 v19 = [v18 BOOLValue];

    if ((v19 & 1) == 0)
    {
      if ([v8 hasCellularResult])
      {
        unint64_t v20 = (unint64_t)[v8 cellularResult];
        a5 = (v20 & 0xFFFFFFFFFFFFFFFDLL) == 1;
        v21 = BLServiceLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v35 = v9;
          __int16 v36 = 2048;
          v37 = v20;
          __int16 v38 = 1024;
          LODWORD(v39) = (v20 & 0xFFFFFFFFFFFFFFFDLL) == 1;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Prepare]: Cellular evaluation result is %ld, setting allowsCellularAccess to %d", buf, 0x1Cu);
        }
      }
      else
      {
        v22 = BLServiceLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v35 = v9;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Prepare]: Cellular evaluation result not found, fallback to use hard download limit for cellular", buf, 0xCu);
        }

        id v23 = [v7 fileSize];
        v21 = [v7 kind];
        if (v21)
        {
          uint64_t v30 = +[BUBag defaultBag];
          v24 = +[AMSNetworkConstraints networkConstraintsForMediaType:withBag:](AMSNetworkConstraints, "networkConstraintsForMediaType:withBag:", v21);
          id v32 = 0;
          v25 = [v24 resultWithError:&v32];
          id v31 = v32;
          if (v25)
          {
            id v26 = [v25 sizeLimitForNetworkType:AMSNetworkTypeCellular];
            a5 = v26 != (id)AMSSizeLimitDisabled && (v26 == (id)AMSSizeLimitNoLimit || (uint64_t)v23 <= (uint64_t)v26);
          }
          else
          {
            v27 = BLServiceLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              v35 = v9;
              __int16 v36 = 2114;
              v37 = v21;
              __int16 v38 = 2112;
              id v39 = v31;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Prepare]: Constraints not found in bag, downloadKind: %{public}@, error:  %@", buf, 0x20u);
            }

            a5 = 1;
          }
        }
        else
        {
          a5 = 1;
        }
      }
    }
  }
  else
  {
    a5 = 0;
  }

  return a5;
}

- (BOOL)_assetNeedsDecryption:(id)a3
{
  v3 = [a3 dpInfo];
  BOOL v4 = v3 != 0;

  return v4;
}

- (int64_t)_assetSizeFromURLResponse:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    unsigned __int8 v5 = (char *)[v4 statusCode];
    if (v5 == (char *)206)
    {
      id v6 = [v4 allHeaderFields];
      id v7 = [v6 objectForKey:@"Content-Range"];

      if (!v7
        || (+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", @"/"), id v8 = objc_claimAutoreleasedReturnValue(), v9 = [v7 rangeOfCharacterFromSet:v8], v8, v9 == (id)0x7FFFFFFFFFFFFFFFLL)|| (v10 = (unint64_t)v9 + 1, v10 >= (unint64_t)objc_msgSend(v7, "length")))
      {
        int64_t v12 = -1;
      }
      else
      {
        id v11 = [v7 substringFromIndex:v10];
        int64_t v12 = (int64_t)[v11 longLongValue];
      }
    }
    else if ((unint64_t)(v5 - 200) > 0x63)
    {
      int64_t v12 = -1;
    }
    else
    {
      int64_t v12 = (int64_t)[v4 expectedContentLength];
    }
  }
  else
  {
    int64_t v12 = -1;
  }

  return v12;
}

- (void)dq_action_requestCachedURL
{
  id v2 = [(_BLPrepareDownloadOperation *)self download];
  id v3 = [v2 url];

  if (v3)
  {
    id v4 = [objc_alloc((Class)NSURL) initWithString:v3];
    if (v4)
    {
      unsigned __int8 v5 = v4;
      dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
      id v8 = v3;
      id v7 = v6;
      ACSLocateCachingServer();
      dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
}

- (id)_clientIdentifier
{
  return @"com.apple.iBooks";
}

+ (id)_newDownloadKeyCookieWithValue:(id)a3 URL:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  id v8 = +[NSNumber numberWithInteger:604800];
  [v7 setObject:v8 forKey:NSHTTPCookieMaximumAge];

  id v9 = [v5 host];
  [v7 setObject:v9 forKey:NSHTTPCookieDomain];

  [v7 setObject:@"downloadKey" forKey:NSHTTPCookieName];
  unint64_t v10 = [v5 path];
  [v7 setObject:v10 forKey:NSHTTPCookiePath];

  [v7 setObject:v5 forKey:NSHTTPCookieOriginURL];
  [v7 setObject:v6 forKey:NSHTTPCookieValue];

  id v11 = [objc_alloc((Class)NSHTTPCookie) initWithProperties:v7];
  return v11;
}

- (id)_downloadKeyCookieWithAsset:(id)a3
{
  id v3 = a3;
  id v4 = [v3 url];
  if (v4)
  {
    id v5 = [v3 downloadKey];
    if ([v5 length])
    {
      id v6 = [objc_alloc((Class)NSURL) initWithString:v4];
      id v7 = [(id)objc_opt_class() _newDownloadKeyCookieWithValue:v5 URL:v6];
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (int64_t)_loadSizeIfNecessaryForAsset:(id)a3
{
  id v4 = a3;
  if ((uint64_t)[v4 fileSize] <= 0)
  {
    id v6 = [v4 url];
    if (!v6)
    {
      int64_t v5 = -1;
LABEL_22:

      goto LABEL_23;
    }
    id v7 = BLServiceLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v4 downloadID];
      *(_DWORD *)buf = 138543362;
      __int16 v36 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Prepare]: Prepare request to load asset size", buf, 0xCu);
    }
    id v9 = objc_alloc((Class)AMSURLRequest);
    unint64_t v10 = +[NSURL URLWithString:v6];
    id v11 = [v9 initWithURL:v10];

    [v11 setHTTPMethod:@"HEAD"];
    [v11 setCachePolicy:1];
    [v11 setTimeoutInterval:30.0];
    [v11 setValue:@"identity" forHTTPHeaderField:@"Accept-Encoding"];
    int64_t v12 = [(_BLPrepareDownloadOperation *)self _downloadKeyCookieWithAsset:v4];
    if (v12)
    {
      id v13 = objc_alloc((Class)NSString);
      unsigned int v14 = [v12 name];
      unsigned int v15 = [v12 value];
      id v16 = [v13 initWithFormat:@"%@=%@", v14, v15];

      [v11 setValue:v16 forHTTPHeaderField:AMSHTTPHeaderCookie];
    }
    id v17 = objc_alloc_init((Class)AMSURLRequestEncoder);
    [v17 setUrlKnownToBeTrusted:1];
    uint64_t v18 = [v17 requestByEncodingRequest:v11 parameters:0];
    id v34 = 0;
    unsigned __int8 v19 = [v18 resultWithError:&v34];
    id v20 = v34;

    if (!v20)
    {
      id v20 = +[AMSURLSession defaultSession];
      id v32 = v19;
      v21 = [v20 dataTaskPromiseWithRequest:v19];
      id v33 = 0;
      v22 = [v21 resultWithError:&v33];
      id v23 = v33;
      if (!v23)
      {
        id v31 = [v22 response];
        int64_t v5 = [(_BLPrepareDownloadOperation *)self _assetSizeFromURLResponse:v31];

        unsigned __int8 v19 = v32;
LABEL_14:

        id v26 = BLServiceLog();
        BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
        if (v5 < 1)
        {
          if (v27)
          {
            v29 = [v4 downloadID];
            *(_DWORD *)buf = 138543362;
            __int16 v36 = v29;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Prepare]: Failed to find size for download", buf, 0xCu);
          }
        }
        else
        {
          if (v27)
          {
            v28 = [v4 downloadID];
            *(_DWORD *)buf = 138543618;
            __int16 v36 = v28;
            __int16 v37 = 2048;
            int64_t v38 = v5;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Prepare]: Found size: %lld for download", buf, 0x16u);
          }
          [v4 setFileSize:v5];
        }
        goto LABEL_22;
      }
      id v24 = v23;

      id v20 = v24;
      unsigned __int8 v19 = v32;
    }
    v21 = BLServiceLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v25 = [v4 downloadID];
      *(_DWORD *)buf = 138543874;
      __int16 v36 = v25;
      __int16 v37 = 2114;
      int64_t v38 = (int64_t)v6;
      __int16 v39 = 2112;
      id v40 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Prepare]: Error sending HEAD request to %{public}@ for download. error:  %@", buf, 0x20u);
    }
    int64_t v5 = -1;
    goto LABEL_14;
  }
  int64_t v5 = -1;
LABEL_23:

  return v5;
}

- (id)_newDataConsumerWithAsset:(id)a3 destinationPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (uint64_t)[v6 numberOfBytesToHash];
  if (v8 < 1)
  {
    unint64_t v10 = 0;
  }
  else
  {
    id v9 = [v6 md5HashStrings];
    unint64_t v10 = [v9 componentsSeparatedByString:@","];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v10 count])
    {

      unint64_t v10 = 0;
      uint64_t v8 = 0;
    }
  }
  if ([(_BLPrepareDownloadOperation *)self _usesStreamingZipDataConsumerForAsset:v6])
  {
    id v11 = [v6 hashType];
    int64_t v12 = +[BLStreamingZipHandler optionsWithHashes:v10 type:v11 size:v8];

    id v13 = [[BLStreamingZipDownloadDataConsumer alloc] initWithPath:v7 options:v12];
  }
  else
  {
    id v13 = [[BLFilesystemDownloadDataConsumer alloc] initWithPath:v7 MD5Hashes:v10 numberOfBytesToHash:v8];
  }

  return v13;
}

- (id)_newURLRequestWithAsset:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 url];
  if (v5)
  {
    id v6 = [objc_alloc((Class)NSURL) initWithString:v5];
    id v7 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v6];
    [v7 setCachePolicy:1];
    BOOL v8 = [(_BLPrepareDownloadOperation *)self allowsCellularAccess];
    id v9 = BLServiceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = [v4 downloadID];
      int v18 = 138543618;
      unsigned __int8 v19 = v10;
      __int16 v20 = 1024;
      BOOL v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Prepare] allowsCellularAccess = %d", (uint8_t *)&v18, 0x12u);
    }
    [v7 setAllowsCellularAccess:v8];
    id v11 = [v4 isRestore];
    unsigned int v12 = [v11 BOOLValue];

    if (v12 & v8) {
      [v7 setAllowsExpensiveNetworkAccess:0];
    }
    uint64_t v13 = AMSHTTPHeaderUserAgent;
    unsigned int v14 = [v7 valueForHTTPHeaderField:AMSHTTPHeaderUserAgent];

    if (!v14)
    {
      unsigned int v15 = +[AMSProcessInfo currentProcess];
      id v16 = +[AMSUserAgent userAgentForProcessInfo:v15];

      if (v16) {
        [v7 setValue:v16 forHTTPHeaderField:v13];
      }
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (BOOL)_requiresPoweredPluggedIn
{
  return 0;
}

- (BOOL)_sendsStoreHeadersForAsset
{
  id v2 = [(_BLPrepareDownloadOperation *)self download];
  id v3 = [v2 storeIdentifier];
  BOOL v4 = [v3 longLongValue] != 0;

  return v4;
}

- (BOOL)_shouldCancelDownload
{
  id v3 = +[BURestrictionsProvider sharedInstance];
  unsigned __int8 v4 = [v3 isBookStoreAllowed];

  if (v4) {
    return 0;
  }
  id v6 = [(_BLPrepareDownloadOperation *)self download];
  id v7 = [v6 isPurchase];
  unsigned __int8 v8 = [v7 BOOLValue];

  return v8;
}

- (BOOL)_shouldFailForDiskSpaceWithAsset:(id)a3 dataConsumer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  unsigned __int8 v8 = (char *)[v6 fileSize];
  id v9 = [(_BLPrepareDownloadOperation *)self downloadIdentifier];
  unint64_t v10 = +[NSUserDefaults standardUserDefaults];
  unsigned int v11 = [v10 BOOLForKey:@"BKSimulateDeviceOutOfSpace"];

  if (v11)
  {
    unsigned int v12 = BLServiceLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Prepare]: Simulating a device out of space situation", buf, 0xCu);
    }

    BOOL v13 = 1;
    *((unsigned char *)v31 + 24) = 1;
  }
  else
  {
    unsigned int v14 = BLServiceLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v35 = v9;
      __int16 v36 = 2048;
      __int16 v37 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Prepare]: Determined asset size to be %llu bytes", buf, 0x16u);
    }

    if (v7)
    {
      unsigned int v15 = (char *)[v7 diskUsage];
      id v16 = v15;
      if (v15 <= v8) {
        unint64_t v17 = (unint64_t)v15;
      }
      else {
        unint64_t v17 = 0;
      }
      int v18 = BLServiceLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v35 = v9;
        __int16 v36 = 2048;
        __int16 v37 = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Prepare]: Discovered %llu bytes already transfered", buf, 0x16u);
      }

      v8 -= v17;
    }
    uint64_t v19 = [v6 assetPath];
    __int16 v20 = (void *)v19;
    if (v8 && v19)
    {
      BOOL v21 = +[NSURL fileURLWithPath:v19];
      dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
      id v23 = +[BLStorage sharedInstance];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10003AF00;
      v26[3] = &unk_1001A21D8;
      v29 = &v30;
      id v27 = v9;
      id v24 = v22;
      v28 = v24;
      [v23 requestFreeSpace:v8 atPath:v21 withOptions:0 completionBlock:v26];

      dispatch_semaphore_wait(v24, 0xFFFFFFFFFFFFFFFFLL);
    }

    BOOL v13 = *((unsigned char *)v31 + 24) != 0;
  }

  _Block_object_dispose(&v30, 8);
  return v13;
}

- (double)_transferProgressFractionWithAsset:(id)a3
{
  [a3 transferProgressFraction];
  return result;
}

+ (int64_t)_URLSessionTaskPriorityForDownload:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 isRestore];
  unsigned __int8 v6 = [v5 BOOLValue];

  if (v6)
  {
    uint64_t v7 = -2;
  }
  else
  {
    unsigned __int8 v8 = [v4 isAutomaticDownload];
    id v9 = [v8 BOOLValue];

    uint64_t v7 = (uint64_t)((void)v9 << 63) >> 63;
  }
  id v10 = [a1 _URLSessionTaskPriorityForDownloadPriority:v7];

  return (int64_t)v10;
}

+ (int64_t)_URLSessionTaskPriorityForDownloadPriority:(int64_t)a3
{
  if ((unint64_t)(a3 + 2) >= 4) {
    return 400;
  }
  else {
    return -100 * (a3 + 2) + 500;
  }
}

- (BOOL)_usesStreamingZipDataConsumerForAsset:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 isZipStreamable];
  unsigned __int8 v6 = v5;
  if (v5)
  {
    LOBYTE(v7) = [v5 BOOLValue];
  }
  else
  {
    unsigned __int8 v8 = [(_BLPrepareDownloadOperation *)self download];
    id v9 = [v8 storeIdentifier];
    id v10 = [v9 integerValue];

    if (v10)
    {
      unsigned int v11 = (void *)BLDownloadKindAudiobook;
      unsigned int v12 = [(_BLPrepareDownloadOperation *)self download];
      BOOL v13 = [v12 kind];
      unsigned int v7 = [v11 isEqualToString:v13] ^ 1;
    }
    else
    {
      LOBYTE(v7) = 0;
    }
  }
  char v14 = v7 & ~[(_BLPrepareDownloadOperation *)self _assetNeedsDecryption:v4];

  return v14;
}

- (BLPrepareDownloadOperation)operation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);

  return (BLPrepareDownloadOperation *)WeakRetained;
}

- (void)setOperation:(id)a3
{
}

- (BLDownload)download
{
  return self->_download;
}

- (void)setDownload:(id)a3
{
}

- (BOOL)isCellularAllowedForRestores
{
  return self->_isCellularAllowedForRestores;
}

- (void)setIsCellularAllowedForRestores:(BOOL)a3
{
  self->_isCellularAllowedForRestores = a3;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_download, 0);
  objc_destroyWeak((id *)&self->_operation);

  objc_storeStrong(&self->_outputBlock, 0);
}

@end