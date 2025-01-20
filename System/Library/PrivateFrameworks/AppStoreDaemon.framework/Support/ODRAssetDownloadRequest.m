@interface ODRAssetDownloadRequest
- (ODRAssetDownloadRequest)init;
- (void)setExtractionProgress:(double)a3;
@end

@implementation ODRAssetDownloadRequest

- (ODRAssetDownloadRequest)init
{
  v16.receiver = self;
  v16.super_class = (Class)ODRAssetDownloadRequest;
  v2 = [(ODRAssetDownloadRequest *)&v16 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    completionPromise = v2->_completionPromise;
    v2->_completionPromise = (AMSMutablePromise *)v3;

    uint64_t v5 = +[NSProgress progressWithTotalUnitCount:1000];
    progress = v2->_progress;
    v2->_progress = (NSProgress *)v5;

    uint64_t v7 = objc_opt_new();
    lock = v2->_lock;
    v2->_lock = (NSLock *)v7;

    v9 = [[_TtC9appstored6LogKey alloc] initWithCode:@"ODR"];
    logKey = v2->_logKey;
    v2->_logKey = v9;

    objc_initWeak(&location, v2);
    v11 = v2->_progress;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10030E040;
    v13[3] = &unk_100525760;
    objc_copyWeak(&v14, &location);
    [(NSProgress *)v11 setCancellationHandler:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)setExtractionProgress:(double)a3
{
  [(NSProgress *)self->_progress setCompletedUnitCount:(uint64_t)(a3 * 1000.0)];
  outOfBandTransferPromise = self->_outOfBandTransferPromise;
  [(IXPromisedOutOfBandTransfer *)outOfBandTransferPromise setPercentComplete:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_completionPromise, 0);
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong((id *)&self->_uniqueKey, 0);
  objc_storeStrong((id *)&self->_tagsRequest, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_requestStartDate, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_identifierForInitialDataAttribution, 0);
  objc_storeStrong((id *)&self->_hashingData, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong((id *)&self->_coordinatorID, 0);
  objc_storeStrong((id *)&self->_contentHashDictionary, 0);
  objc_storeStrong((id *)&self->_bundleKey, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_assetPromise, 0);
  objc_storeStrong((id *)&self->_simulatedDownloadTimer, 0);
  objc_storeStrong((id *)&self->_outOfBandTransferPromise, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_evaluatedCellularAllowed, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_duplicateDownloads, 0);
}

@end