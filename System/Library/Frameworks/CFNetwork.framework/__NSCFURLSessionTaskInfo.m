@interface __NSCFURLSessionTaskInfo
+ (BOOL)supportsSecureCoding;
- (AVAssetDownloadConfiguration)downloadConfig;
- (AVURLAsset)AVURLAsset;
- (BOOL)_doesSZExtractorConsumeExtractedData;
- (BOOL)_hasSZExtractor;
- (BOOL)_updatedStreamingZipModificationDate;
- (BOOL)basePrioritySetExplicitly;
- (BOOL)disablesRetry;
- (BOOL)enableSPIDelegateCallbacks;
- (BOOL)establishedConnection;
- (BOOL)expectingResumeCallback;
- (BOOL)hasStarted;
- (BOOL)initializedWithAVAsset;
- (BOOL)isDiscretionary;
- (BOOL)mayBeDemotedToDiscretionary;
- (BOOL)respondedToWillBeginDelayedRequestCallback;
- (BOOL)resumedAndWaitingForEarliestBeginDate;
- (BOOL)shouldCancelOnDisconnect;
- (BOOL)startedUserInitiated;
- (NSData)assetArtworkData;
- (NSData)resumableUploadData;
- (NSDate)earliestBeginDate;
- (NSDictionary)_backgroundTrailers;
- (NSDictionary)additionalProperties;
- (NSDictionary)assetOptionsPlist;
- (NSDictionary)options;
- (NSDictionary)resolvedMediaSelectionPlist;
- (NSError)error;
- (NSError)retryError;
- (NSString)assetTitle;
- (NSString)avAssetDownloadChildDownloadSessionIdentifier;
- (NSString)bundleID;
- (NSString)pathToDownloadTaskFile;
- (NSString)personaUniqueString;
- (NSString)sessionID;
- (NSString)storagePartitionIdentifier;
- (NSString)taskDescription;
- (NSURL)AVAssetURL;
- (NSURL)URL;
- (NSURL)destinationURL;
- (NSURL)downloadFileURL;
- (NSURL)fileURL;
- (NSURL)temporaryDestinationURL;
- (NSURLRequest)currentRequest;
- (NSURLRequest)originalRequest;
- (NSURLResponse)response;
- (NSUUID)uniqueIdentifier;
- (STExtractor)_extractor;
- (__CFN_TaskMetrics)taskMetrics;
- (__NSCFURLSessionTaskInfo)initWithAVAggregateAssetDownloadChildDownloadSessionIdentifier:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6 taskIdentifier:(unint64_t)a7 uniqueIdentifier:(id)a8 bundleID:(id)a9 sessionID:(id)a10;
- (__NSCFURLSessionTaskInfo)initWithAVAggregateDownloadTaskNoChildTaskKindWithURL:(id)a3 destinationURL:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 taskIdentifier:(unint64_t)a8 uniqueIdentifier:(id)a9 bundleID:(id)a10 sessionID:(id)a11 enableSPIDelegateCallbacks:(BOOL)a12;
- (__NSCFURLSessionTaskInfo)initWithAVAssetDownloadURL:(id)a3 destinationURL:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 taskIdentifier:(unint64_t)a8 uniqueIdentifier:(id)a9 bundleID:(id)a10 sessionID:(id)a11 downloadConfig:(id)a12;
- (__NSCFURLSessionTaskInfo)initWithCoder:(id)a3;
- (__NSCFURLSessionTaskInfo)initWithDataTask:(id)a3 uniqueIdentifier:(id)a4 bundleID:(id)a5 sessionID:(id)a6;
- (__NSCFURLSessionTaskInfo)initWithDownloadTask:(id)a3 uniqueIdentifier:(id)a4 bundleID:(id)a5 sessionID:(id)a6;
- (__NSCFURLSessionTaskInfo)initWithUploadTask:(id)a3 uniqueIdentifier:(id)a4 bundleID:(id)a5 sessionID:(id)a6;
- (double)creationTime;
- (double)loadingPriority;
- (id)_loggableDescription;
- (id)initWithTask:(void *)a3 uniqueIdentifier:(void *)a4 bundleID:(void *)a5 sessionID:;
- (int64_t)basePriority;
- (int64_t)bytesPerSecondLimit;
- (int64_t)countOfBytesClientExpectsToReceive;
- (int64_t)countOfBytesClientExpectsToSend;
- (int64_t)countOfBytesExpectedToReceive;
- (int64_t)countOfBytesExpectedToSend;
- (int64_t)countOfBytesReceived;
- (int64_t)countOfBytesSent;
- (int64_t)discretionaryOverride;
- (int64_t)state;
- (unint64_t)AVAssetDownloadToken;
- (unint64_t)expectedProgressTarget;
- (unint64_t)identifier;
- (unint64_t)lowThroughputTimerRetryCount;
- (unint64_t)retryCount;
- (unint64_t)suspendCount;
- (unint64_t)taskKind;
- (unsigned)_TLSMaximumSupportedProtocolVersion;
- (unsigned)_TLSMinimumSupportedProtocolVersion;
- (unsigned)qos;
- (void)_logTaskUUIDMapping;
- (void)encodeWithCoder:(id)a3;
- (void)setAVAssetDownloadToken:(unint64_t)a3;
- (void)setAVAssetURL:(id)a3;
- (void)setAVURLAsset:(id)a3;
- (void)setAdditionalProperties:(id)a3;
- (void)setAssetArtworkData:(id)a3;
- (void)setAssetOptionsPlist:(id)a3;
- (void)setAssetTitle:(id)a3;
- (void)setAvAssetDownloadChildDownloadSessionIdentifier:(id)a3;
- (void)setBasePriority:(int64_t)a3;
- (void)setBasePrioritySetExplicitly:(BOOL)a3;
- (void)setBundleID:(id)a3;
- (void)setBytesPerSecondLimit:(int64_t)a3;
- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3;
- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3;
- (void)setCountOfBytesExpectedToReceive:(int64_t)a3;
- (void)setCountOfBytesExpectedToSend:(int64_t)a3;
- (void)setCountOfBytesReceived:(int64_t)a3;
- (void)setCountOfBytesSent:(int64_t)a3;
- (void)setCreationTime:(double)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setDestinationURL:(id)a3;
- (void)setDisablesRetry:(BOOL)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setDiscretionaryOverride:(int64_t)a3;
- (void)setDownloadConfig:(id)a3;
- (void)setDownloadFileURL:(id)a3;
- (void)setEarliestBeginDate:(id)a3;
- (void)setEnableSPIDelegateCallbacks:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setEstablishedConnection:(BOOL)a3;
- (void)setExpectedProgressTarget:(unint64_t)a3;
- (void)setExpectingResumeCallback:(BOOL)a3;
- (void)setFileURL:(id)a3;
- (void)setHasStarted:(BOOL)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setInitializedWithAVAsset:(BOOL)a3;
- (void)setLoadingPriority:(double)a3;
- (void)setLowThroughputTimerRetryCount:(unint64_t)a3;
- (void)setMayBeDemotedToDiscretionary:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setOriginalRequest:(id)a3;
- (void)setPathToDownloadTaskFile:(id)a3;
- (void)setPersonaUniqueString:(id)a3;
- (void)setQos:(unsigned int)a3;
- (void)setResolvedMediaSelectionPlist:(id)a3;
- (void)setRespondedToWillBeginDelayedRequestCallback:(BOOL)a3;
- (void)setResponse:(id)a3;
- (void)setResumableUploadData:(id)a3;
- (void)setResumedAndWaitingForEarliestBeginDate:(BOOL)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setRetryError:(id)a3;
- (void)setSessionID:(id)a3;
- (void)setShouldCancelOnDisconnect:(BOOL)a3;
- (void)setStartedUserInitiated:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setStoragePartitionIdentifier:(id)a3;
- (void)setSuspendCount:(unint64_t)a3;
- (void)setTaskDescription:(id)a3;
- (void)setTaskKind:(unint64_t)a3;
- (void)setTaskMetrics:(id)a3;
- (void)setTemporaryDestinationURL:(id)a3;
- (void)setURL:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3;
- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3;
- (void)set_backgroundTrailers:(id)a3;
- (void)set_doesSZExtractorConsumeExtractedData:(BOOL)a3;
- (void)set_extractor:(id)a3;
- (void)set_hasSZExtractor:(BOOL)a3;
- (void)set_updatedStreamingZipModificationDate:(BOOL)a3;
@end

@implementation __NSCFURLSessionTaskInfo

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (NSDictionary)assetOptionsPlist
{
  return (NSDictionary *)objc_getProperty(self, a2, 344, 1);
}

- (__NSCFURLSessionTaskInfo)initWithDataTask:(id)a3 uniqueIdentifier:(id)a4 bundleID:(id)a5 sessionID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (__NSCFURLSessionTaskInfo *)-[__NSCFURLSessionTaskInfo initWithTask:uniqueIdentifier:bundleID:sessionID:](self, v10, v11, v12, v13);
  v15 = v14;
  if (v14) {
    [(__NSCFURLSessionTaskInfo *)v14 setTaskKind:2];
  }
  [(__NSCFURLSessionTaskInfo *)v15 _logTaskUUIDMapping];

  return v15;
}

- (__NSCFURLSessionTaskInfo)initWithUploadTask:(id)a3 uniqueIdentifier:(id)a4 bundleID:(id)a5 sessionID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = (__NSCFURLSessionTaskInfo *)-[__NSCFURLSessionTaskInfo initWithTask:uniqueIdentifier:bundleID:sessionID:](self, v10, v11, v12, v13);
  v15 = v14;
  if (v14) {
    [(__NSCFURLSessionTaskInfo *)v14 setTaskKind:1];
  }
  [(__NSCFURLSessionTaskInfo *)v15 _logTaskUUIDMapping];

  return v15;
}

- (id)initWithTask:(void *)a3 uniqueIdentifier:(void *)a4 bundleID:(void *)a5 sessionID:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    v23.receiver = a1;
    v23.super_class = (Class)__NSCFURLSessionTaskInfo;
    a1 = objc_msgSendSuper2(&v23, sel_init);
    if (a1)
    {
      objc_msgSend(a1, "setIdentifier:", objc_msgSend(v9, "taskIdentifier"));
      [a1 setState:0];
      id v13 = [v9 taskDescription];
      [a1 setTaskDescription:v13];

      v14 = [v9 originalRequest];
      [a1 setOriginalRequest:v14];

      v15 = [v9 currentRequest];
      [a1 setCurrentRequest:v15];

      v16 = [v9 response];
      [a1 setResponse:v16];

      v17 = [v9 earliestBeginDate];
      [a1 setEarliestBeginDate:v17];

      objc_msgSend(a1, "setCountOfBytesClientExpectsToSend:", objc_msgSend(v9, "countOfBytesClientExpectsToSend"));
      objc_msgSend(a1, "setCountOfBytesClientExpectsToReceive:", objc_msgSend(v9, "countOfBytesClientExpectsToReceive"));
      [a1 setRespondedToWillBeginDelayedRequestCallback:0];
      v18 = [v9 error];
      [a1 setError:v18];

      [a1 setBundleID:v11];
      [a1 setSessionID:v12];
      objc_msgSend(a1, "setState:", objc_msgSend(v9, "state"));
      [a1 setHasStarted:0];
      [a1 setUniqueIdentifier:v10];
      [a1 setRetryCount:0];
      [a1 setRetryError:0];
      objc_msgSend(a1, "setBytesPerSecondLimit:", objc_msgSend(v9, "_bytesPerSecondLimit"));
      objc_msgSend(a1, "setExpectedProgressTarget:", objc_msgSend(v9, "_expectedProgressTarget"));
      [a1 setQos:qos_class_self()];
      [v9 _loadingPriority];
      objc_msgSend(a1, "setLoadingPriority:");
      objc_msgSend(a1, "setDiscretionaryOverride:", objc_msgSend(v9, "_discretionaryOverride"));
      [a1 setStoragePartitionIdentifier:0];
      objc_msgSend(a1, "set_TLSMinimumSupportedProtocolVersion:", objc_msgSend(v9, "_TLSMinimumSupportedProtocolVersion"));
      objc_msgSend(a1, "set_TLSMaximumSupportedProtocolVersion:", objc_msgSend(v9, "_TLSMaximumSupportedProtocolVersion"));
      objc_msgSend(a1, "set_extractor:", 0);
      objc_msgSend(a1, "set_hasSZExtractor:", 0);
      objc_msgSend(a1, "set_doesSZExtractorConsumeExtractedData:", 0);
      objc_msgSend(a1, "set_updatedStreamingZipModificationDate:", 0);
      v19 = [v9 _pathToDownloadTaskFile];
      [a1 setPathToDownloadTaskFile:v19];

      [a1 setStartedUserInitiated:0];
      v20 = [v9 resumableUploadState];
      v21 = [v20 createResumeDataForTaskInfo];
      [a1 setResumableUploadData:v21];
    }
  }

  return a1;
}

- (__NSCFURLSessionTaskInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)__NSCFURLSessionTaskInfo;
  v5 = [(__NSCFURLSessionTaskInfo *)&v53 init];
  if (v5)
  {
    -[__NSCFURLSessionTaskInfo setIdentifier:](v5, "setIdentifier:", [v4 decodeIntegerForKey:@"identifier"]);
    -[__NSCFURLSessionTaskInfo setTaskKind:](v5, "setTaskKind:", [v4 decodeIntegerForKey:@"taskKind"]);
    [v4 decodeDoubleForKey:@"creationTime"];
    -[__NSCFURLSessionTaskInfo setCreationTime:](v5, "setCreationTime:");
    -[__NSCFURLSessionTaskInfo setState:](v5, "setState:", [v4 decodeIntegerForKey:@"state"]);
    -[__NSCFURLSessionTaskInfo setSuspendCount:](v5, "setSuspendCount:", [v4 decodeIntegerForKey:@"suspendCount"]);
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskDescription"];
    [(__NSCFURLSessionTaskInfo *)v5 setTaskDescription:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalRequest"];
    [(__NSCFURLSessionTaskInfo *)v5 setOriginalRequest:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentRequest"];
    [(__NSCFURLSessionTaskInfo *)v5 setCurrentRequest:v8];

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"response"];
    [(__NSCFURLSessionTaskInfo *)v5 setResponse:v9];

    id v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"earliestBeginDate"];
    [(__NSCFURLSessionTaskInfo *)v5 setEarliestBeginDate:v10];

    -[__NSCFURLSessionTaskInfo setRespondedToWillBeginDelayedRequestCallback:](v5, "setRespondedToWillBeginDelayedRequestCallback:", [v4 decodeBoolForKey:@"respondedToWillBeginDelayedRequestCallback"]);
    id v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
    [(__NSCFURLSessionTaskInfo *)v5 setError:v11];

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"retryError"];
    [(__NSCFURLSessionTaskInfo *)v5 setRetryError:v12];

    id v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileURL"];
    [(__NSCFURLSessionTaskInfo *)v5 setFileURL:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"downloadFileURL"];
    [(__NSCFURLSessionTaskInfo *)v5 setDownloadFileURL:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    [(__NSCFURLSessionTaskInfo *)v5 setBundleID:v15];

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
    [(__NSCFURLSessionTaskInfo *)v5 setSessionID:v16];

    -[__NSCFURLSessionTaskInfo setHasStarted:](v5, "setHasStarted:", [v4 decodeBoolForKey:@"hasStarted"]);
    -[__NSCFURLSessionTaskInfo setShouldCancelOnDisconnect:](v5, "setShouldCancelOnDisconnect:", [v4 decodeBoolForKey:@"shouldCancelOnDisconnect"]);
    -[__NSCFURLSessionTaskInfo setBasePriority:](v5, "setBasePriority:", [v4 decodeInt64ForKey:@"basePriority"]);
    -[__NSCFURLSessionTaskInfo setBasePrioritySetExplicitly:](v5, "setBasePrioritySetExplicitly:", [v4 decodeBoolForKey:@"basePrioritySetExplicitly"]);
    -[__NSCFURLSessionTaskInfo setDiscretionary:](v5, "setDiscretionary:", [v4 decodeBoolForKey:@"discretionary"]);
    -[__NSCFURLSessionTaskInfo setDiscretionaryOverride:](v5, "setDiscretionaryOverride:", [v4 decodeIntegerForKey:@"discretionaryOverride"]);
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifierUUID"];
    [(__NSCFURLSessionTaskInfo *)v5 setUniqueIdentifier:v17];

    v18 = [(__NSCFURLSessionTaskInfo *)v5 uniqueIdentifier];

    if (!v18)
    {
      v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueIdentifier"];
      if (v19)
      {
        uint64_t v20 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v19];
      }
      else
      {
        uint64_t v20 = [MEMORY[0x1E4F29128] UUID];
      }
      v21 = (void *)v20;
      [(__NSCFURLSessionTaskInfo *)v5 setUniqueIdentifier:v20];
    }
    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storagePartitionIdentifier"];
    [(__NSCFURLSessionTaskInfo *)v5 setStoragePartitionIdentifier:v22];

    objc_super v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    [(__NSCFURLSessionTaskInfo *)v5 setURL:v23];

    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationURL"];
    [(__NSCFURLSessionTaskInfo *)v5 setDestinationURL:v24];

    v25 = [v4 decodePropertyListForKey:@"options"];
    [(__NSCFURLSessionTaskInfo *)v5 setOptions:v25];

    if ([v4 decodeBoolForKey:@"initializedFromToken"]) {
      uint64_t v26 = 1;
    }
    else {
      uint64_t v26 = [v4 decodeBoolForKey:@"initializedWithAVAsset"];
    }
    [(__NSCFURLSessionTaskInfo *)v5 setInitializedWithAVAsset:v26];
    v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"temporaryDestinationURL"];
    [(__NSCFURLSessionTaskInfo *)v5 setTemporaryDestinationURL:v27];

    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetTitle"];
    [(__NSCFURLSessionTaskInfo *)v5 setAssetTitle:v28];

    v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetArtworkData"];
    [(__NSCFURLSessionTaskInfo *)v5 setAssetArtworkData:v29];

    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AVAssetURL"];
    [(__NSCFURLSessionTaskInfo *)v5 setAVAssetURL:v30];

    -[__NSCFURLSessionTaskInfo setAVAssetDownloadToken:](v5, "setAVAssetDownloadToken:", [v4 decodeInt64ForKey:@"AVAssetDownloadToken"]);
    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AVAssetDownloadChildDownloadSessionIdentifier"];
    [(__NSCFURLSessionTaskInfo *)v5 setAvAssetDownloadChildDownloadSessionIdentifier:v31];

    -[__NSCFURLSessionTaskInfo setEnableSPIDelegateCallbacks:](v5, "setEnableSPIDelegateCallbacks:", [v4 decodeBoolForKey:@"enableSPIDelegateCallbacks"]);
    gotLoadHelper_x21__OBJC_CLASS___AVAssetDownloadConfiguration(v32);
    if (objc_opt_class())
    {
      v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AVAssetDownloadConfiguration"];
      [(__NSCFURLSessionTaskInfo *)v5 setDownloadConfig:v33];
    }
    -[__NSCFURLSessionTaskInfo setCountOfBytesClientExpectsToSend:](v5, "setCountOfBytesClientExpectsToSend:", [v4 decodeInt64ForKey:@"countOfBytesClientExpectsToSend"]);
    -[__NSCFURLSessionTaskInfo setCountOfBytesClientExpectsToReceive:](v5, "setCountOfBytesClientExpectsToReceive:", [v4 decodeInt64ForKey:@"countOfBytesClientExpectsToReceive"]);
    -[__NSCFURLSessionTaskInfo setCountOfBytesReceived:](v5, "setCountOfBytesReceived:", [v4 decodeInt64ForKey:@"countOfBytesReceived"]);
    -[__NSCFURLSessionTaskInfo setCountOfBytesSent:](v5, "setCountOfBytesSent:", [v4 decodeInt64ForKey:@"countOfBytesSent"]);
    -[__NSCFURLSessionTaskInfo setCountOfBytesExpectedToSend:](v5, "setCountOfBytesExpectedToSend:", [v4 decodeInt64ForKey:@"countOfBytesExpectedToSend"]);
    -[__NSCFURLSessionTaskInfo setCountOfBytesExpectedToReceive:](v5, "setCountOfBytesExpectedToReceive:", [v4 decodeInt64ForKey:@"countOfBytesExpectedToReceive"]);
    -[__NSCFURLSessionTaskInfo setBytesPerSecondLimit:](v5, "setBytesPerSecondLimit:", [v4 decodeInt64ForKey:@"bytesPerSecondLimit"]);
    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaUniqueString"];
    [(__NSCFURLSessionTaskInfo *)v5 setPersonaUniqueString:v34];

    -[__NSCFURLSessionTaskInfo setExpectedProgressTarget:](v5, "setExpectedProgressTarget:", [v4 decodeInt64ForKey:@"expectedProgressTarget"]);
    -[__NSCFURLSessionTaskInfo setMayBeDemotedToDiscretionary:](v5, "setMayBeDemotedToDiscretionary:", [v4 decodeBoolForKey:@"mayBeDemotedToDiscretionary"]);
    int v35 = [v4 containsValueForKey:@"_TLSMinimumSupportedProtocolVersion"];
    if (v35) {
      LOWORD(v35) = [v4 decodeInt32ForKey:@"_TLSMinimumSupportedProtocolVersion"];
    }
    [(__NSCFURLSessionTaskInfo *)v5 set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)v35];
    int v36 = [v4 containsValueForKey:@"_TLSMaximumSupportedProtocolVersion"];
    if (v36) {
      LOWORD(v36) = [v4 decodeInt32ForKey:@"_TLSMaximumSupportedProtocolVersion"];
    }
    [(__NSCFURLSessionTaskInfo *)v5 set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)v36];
    -[__NSCFURLSessionTaskInfo set_hasSZExtractor:](v5, "set_hasSZExtractor:", [v4 decodeBoolForKey:@"hasSZExtractor"]);
    -[__NSCFURLSessionTaskInfo set_doesSZExtractorConsumeExtractedData:](v5, "set_doesSZExtractorConsumeExtractedData:", [v4 decodeBoolForKey:@"doesSZExtractorConsumeExtractedData"]);
    -[__NSCFURLSessionTaskInfo set_updatedStreamingZipModificationDate:](v5, "set_updatedStreamingZipModificationDate:", [v4 decodeBoolForKey:@"updatedStreamingZipModificationDate"]);
    -[__NSCFURLSessionTaskInfo setStartedUserInitiated:](v5, "setStartedUserInitiated:", [v4 decodeBoolForKey:@"startedUserInitiated"]);
    v37 = (void *)MEMORY[0x1E4F28DC0];
    if (additionalPropertiesClasses(void)::onceToken != -1) {
      dispatch_once(&additionalPropertiesClasses(void)::onceToken, &__block_literal_global_14357);
    }
    id v38 = (id)additionalPropertiesClasses(void)::additionalPropertiesClasses;
    v39 = [v4 decodeObjectForKey:@"additionalProperties"];
    v40 = [v37 unarchivedObjectOfClasses:v38 fromData:v39 error:0];
    [(__NSCFURLSessionTaskInfo *)v5 setAdditionalProperties:v40];

    v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pathToDownloadTaskFile"];
    [(__NSCFURLSessionTaskInfo *)v5 setPathToDownloadTaskFile:v41];

    [(__NSCFURLSessionTaskInfo *)v5 setRetryCount:0];
    int v42 = [v4 containsValueForKey:@"loadingPriority"];
    double v43 = 0.5;
    if (v42) {
      objc_msgSend(v4, "decodeDoubleForKey:", @"loadingPriority", 0.5);
    }
    [(__NSCFURLSessionTaskInfo *)v5 setLoadingPriority:v43];
    if ([v4 containsValueForKey:@"qos"])
    {
      v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"qos"];
      -[__NSCFURLSessionTaskInfo setQos:](v5, "setQos:", [v44 unsignedIntValue]);
    }
    else
    {
      [(__NSCFURLSessionTaskInfo *)v5 setQos:qos_class_self()];
    }
    v45 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v46 = objc_opt_class();
    uint64_t v47 = objc_opt_class();
    v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundTrailers"];
    v49 = [v45 unarchivedDictionaryWithKeysOfClass:v46 objectsOfClass:v47 fromData:v48 error:0];
    [(__NSCFURLSessionTaskInfo *)v5 set_backgroundTrailers:v49];

    v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"taskMetrics"];
    [(__NSCFURLSessionTaskInfo *)v5 setTaskMetrics:v50];

    v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resumableUploadData"];
    [(__NSCFURLSessionTaskInfo *)v5 setResumableUploadData:v51];
  }
  [(__NSCFURLSessionTaskInfo *)v5 _logTaskUUIDMapping];

  return v5;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setError:(id)a3
{
}

- (void)set_backgroundTrailers:(id)a3
{
}

- (void)setTaskMetrics:(id)a3
{
}

- (void)set_hasSZExtractor:(BOOL)a3
{
  self->__hasSZExtractor = a3;
}

- (void)set_doesSZExtractorConsumeExtractedData:(BOOL)a3
{
  self->__doesSZExtractorConsumeExtractedData = a3;
}

- (void)setTaskDescription:(id)a3
{
}

- (void)setCountOfBytesSent:(int64_t)a3
{
  self->_countOfBytesSent = a3;
}

- (void)setCountOfBytesReceived:(int64_t)a3
{
  self->_countOfBytesReceived = a3;
}

- (void)setCountOfBytesExpectedToSend:(int64_t)a3
{
  self->_countOfBytesExpectedToSend = a3;
}

- (void)setCountOfBytesExpectedToReceive:(int64_t)a3
{
  self->_countOfBytesExpectedToReceive = a3;
}

- (void)setSuspendCount:(unint64_t)a3
{
  self->_suspendCount = a3;
}

- (void)setQos:(unsigned int)a3
{
  self->_qos = a3;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (void)setCurrentRequest:(id)a3
{
}

- (void)setMayBeDemotedToDiscretionary:(BOOL)a3
{
  self->_mayBeDemotedToDiscretionary = a3;
}

- (void)setStartedUserInitiated:(BOOL)a3
{
  self->_startedUserInitiated = a3;
}

- (void)setHasStarted:(BOOL)a3
{
  self->_hasStarted = a3;
}

- (void)set_updatedStreamingZipModificationDate:(BOOL)a3
{
  self->__updatedStreamingZipModificationDate = a3;
}

- (void)set_TLSMaximumSupportedProtocolVersion:(unsigned __int16)a3
{
  self->__TLSMaximumSupportedProtocolVersion = a3;
}

- (void)setPersonaUniqueString:(id)a3
{
}

- (void)setOriginalRequest:(id)a3
{
}

- (void)setCreationTime:(double)a3
{
  self->_creationTime = a3;
}

- (void)setAdditionalProperties:(id)a3
{
}

- (void)set_TLSMinimumSupportedProtocolVersion:(unsigned __int16)a3
{
  self->__TLSMinimumSupportedProtocolVersion = a3;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (void)setStoragePartitionIdentifier:(id)a3
{
}

- (void)setSessionID:(id)a3
{
}

- (void)setRetryError:(id)a3
{
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (void)setResumableUploadData:(id)a3
{
}

- (void)setResponse:(id)a3
{
}

- (void)setRespondedToWillBeginDelayedRequestCallback:(BOOL)a3
{
  self->_respondedToWillBeginDelayedRequestCallback = a3;
}

- (void)setPathToDownloadTaskFile:(id)a3
{
}

- (void)setLoadingPriority:(double)a3
{
  self->_loadingPriority = a3;
}

- (void)setExpectedProgressTarget:(unint64_t)a3
{
  self->_expectedProgressTarget = a3;
}

- (void)setEarliestBeginDate:(id)a3
{
}

- (void)setDiscretionaryOverride:(int64_t)a3
{
  self->_discretionaryOverride = a3;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3
{
  self->_countOfBytesClientExpectsToSend = a3;
}

- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3
{
  self->_countOfBytesClientExpectsToReceive = a3;
}

- (void)setBytesPerSecondLimit:(int64_t)a3
{
  self->_bytesPerSecondLimit = a3;
}

- (void)setBundleID:(id)a3
{
}

- (void)setBasePriority:(int64_t)a3
{
  self->_basePriority = a3;
}

- (void)setTaskKind:(unint64_t)a3
{
  self->_taskKind = a3;
}

- (void)setShouldCancelOnDisconnect:(BOOL)a3
{
  self->_shouldCancelOnDisconnect = a3;
}

- (void)setFileURL:(id)a3
{
}

- (void)setURL:(id)a3
{
}

- (void)setTemporaryDestinationURL:(id)a3
{
}

- (void)setOptions:(id)a3
{
}

- (void)setInitializedWithAVAsset:(BOOL)a3
{
  self->_initializedWithAVAsset = a3;
}

- (void)setEnableSPIDelegateCallbacks:(BOOL)a3
{
  self->_enableSPIDelegateCallbacks = a3;
}

- (void)setDownloadFileURL:(id)a3
{
}

- (void)setDownloadConfig:(id)a3
{
}

- (void)setDestinationURL:(id)a3
{
}

- (void)setBasePrioritySetExplicitly:(BOOL)a3
{
  self->_basePrioritySetExplicitly = a3;
}

- (void)setAvAssetDownloadChildDownloadSessionIdentifier:(id)a3
{
}

- (void)setAssetTitle:(id)a3
{
}

- (void)setAssetArtworkData:(id)a3
{
}

- (void)setAVAssetURL:(id)a3
{
}

- (void)setAVAssetDownloadToken:(unint64_t)a3
{
  self->_AVAssetDownloadToken = a3;
}

- (__CFN_TaskMetrics)taskMetrics
{
  return (__CFN_TaskMetrics *)objc_getProperty(self, a2, 432, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v47 = a3;
  objc_msgSend(v47, "encodeInteger:forKey:", -[__NSCFURLSessionTaskInfo identifier](self, "identifier"), @"identifier");
  objc_msgSend(v47, "encodeInteger:forKey:", -[__NSCFURLSessionTaskInfo taskKind](self, "taskKind"), @"taskKind");
  [(__NSCFURLSessionTaskInfo *)self creationTime];
  objc_msgSend(v47, "encodeDouble:forKey:", @"creationTime");
  objc_msgSend(v47, "encodeInteger:forKey:", -[__NSCFURLSessionTaskInfo state](self, "state"), @"state");
  objc_msgSend(v47, "encodeInteger:forKey:", -[__NSCFURLSessionTaskInfo suspendCount](self, "suspendCount"), @"suspendCount");
  id v4 = [(__NSCFURLSessionTaskInfo *)self taskDescription];
  [v47 encodeObject:v4 forKey:@"taskDescription"];

  v5 = [(__NSCFURLSessionTaskInfo *)self originalRequest];
  [v47 encodeObject:v5 forKey:@"originalRequest"];

  v6 = [(__NSCFURLSessionTaskInfo *)self currentRequest];
  [v47 encodeObject:v6 forKey:@"currentRequest"];

  v7 = [(__NSCFURLSessionTaskInfo *)self response];
  [v47 encodeObject:v7 forKey:@"response"];

  v8 = [(__NSCFURLSessionTaskInfo *)self earliestBeginDate];
  [v47 encodeObject:v8 forKey:@"earliestBeginDate"];

  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo respondedToWillBeginDelayedRequestCallback](self, "respondedToWillBeginDelayedRequestCallback"), @"respondedToWillBeginDelayedRequestCallback");
  id v9 = [(__NSCFURLSessionTaskInfo *)self error];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v10 = (void *)MEMORY[0x1E4F290A8];
      id v11 = [v9 domain];
      uint64_t v12 = [v9 code];
      id v13 = [v9 userInfo];
      uint64_t v14 = [v10 errorWithDomain:v11 code:v12 userInfo:v13];

      id v9 = (void *)v14;
    }
  }
  [v47 encodeObject:v9 forKey:@"error"];
  v15 = [(__NSCFURLSessionTaskInfo *)self retryError];
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = (void *)MEMORY[0x1E4F290A8];
      v17 = [v15 domain];
      uint64_t v18 = [v15 code];
      v19 = [v15 userInfo];
      uint64_t v20 = [v16 errorWithDomain:v17 code:v18 userInfo:v19];

      v15 = (void *)v20;
    }
  }
  [v47 encodeObject:v15 forKey:@"retryError"];
  v21 = [(__NSCFURLSessionTaskInfo *)self fileURL];
  [v47 encodeObject:v21 forKey:@"fileURL"];

  v22 = [(__NSCFURLSessionTaskInfo *)self downloadFileURL];
  [v47 encodeObject:v22 forKey:@"downloadFileURL"];

  objc_super v23 = [(__NSCFURLSessionTaskInfo *)self bundleID];
  [v47 encodeObject:v23 forKey:@"bundleID"];

  v24 = [(__NSCFURLSessionTaskInfo *)self sessionID];
  [v47 encodeObject:v24 forKey:@"sessionID"];

  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo hasStarted](self, "hasStarted"), @"hasStarted");
  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo shouldCancelOnDisconnect](self, "shouldCancelOnDisconnect"), @"shouldCancelOnDisconnect");
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo basePriority](self, "basePriority"), @"basePriority");
  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo basePrioritySetExplicitly](self, "basePrioritySetExplicitly"), @"basePrioritySetExplicitly");
  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo isDiscretionary](self, "isDiscretionary"), @"discretionary");
  objc_msgSend(v47, "encodeInteger:forKey:", -[__NSCFURLSessionTaskInfo discretionaryOverride](self, "discretionaryOverride"), @"discretionaryOverride");
  v25 = [(__NSCFURLSessionTaskInfo *)self uniqueIdentifier];
  [v47 encodeObject:v25 forKey:@"uniqueIdentifierUUID"];

  uint64_t v26 = [(__NSCFURLSessionTaskInfo *)self storagePartitionIdentifier];
  [v47 encodeObject:v26 forKey:@"storagePartitionIdentifier"];

  v27 = [(__NSCFURLSessionTaskInfo *)self URL];
  [v47 encodeObject:v27 forKey:@"URL"];

  v28 = [(__NSCFURLSessionTaskInfo *)self destinationURL];
  [v47 encodeObject:v28 forKey:@"destinationURL"];

  v29 = [(__NSCFURLSessionTaskInfo *)self options];
  [v47 encodeObject:v29 forKey:@"options"];

  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo initializedWithAVAsset](self, "initializedWithAVAsset"), @"initializedWithAVAsset");
  v30 = [(__NSCFURLSessionTaskInfo *)self temporaryDestinationURL];
  [v47 encodeObject:v30 forKey:@"temporaryDestinationURL"];

  v31 = [(__NSCFURLSessionTaskInfo *)self assetTitle];
  [v47 encodeObject:v31 forKey:@"assetTitle"];

  double v32 = [(__NSCFURLSessionTaskInfo *)self assetArtworkData];
  [v47 encodeObject:v32 forKey:@"assetArtworkData"];

  v33 = [(__NSCFURLSessionTaskInfo *)self AVAssetURL];
  [v47 encodeObject:v33 forKey:@"AVAssetURL"];

  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo AVAssetDownloadToken](self, "AVAssetDownloadToken"), @"AVAssetDownloadToken");
  v34 = [(__NSCFURLSessionTaskInfo *)self avAssetDownloadChildDownloadSessionIdentifier];
  [v47 encodeObject:v34 forKey:@"AVAssetDownloadChildDownloadSessionIdentifier"];

  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo enableSPIDelegateCallbacks](self, "enableSPIDelegateCallbacks"), @"enableSPIDelegateCallbacks");
  int v35 = [(__NSCFURLSessionTaskInfo *)self downloadConfig];
  [v47 encodeObject:v35 forKey:@"AVAssetDownloadConfiguration"];

  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo countOfBytesClientExpectsToSend](self, "countOfBytesClientExpectsToSend"), @"countOfBytesClientExpectsToSend");
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo countOfBytesClientExpectsToReceive](self, "countOfBytesClientExpectsToReceive"), @"countOfBytesClientExpectsToReceive");
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo countOfBytesReceived](self, "countOfBytesReceived"), @"countOfBytesReceived");
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo countOfBytesSent](self, "countOfBytesSent"), @"countOfBytesSent");
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo countOfBytesExpectedToSend](self, "countOfBytesExpectedToSend"), @"countOfBytesExpectedToSend");
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo countOfBytesExpectedToReceive](self, "countOfBytesExpectedToReceive"), @"countOfBytesExpectedToReceive");
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo bytesPerSecondLimit](self, "bytesPerSecondLimit"), @"bytesPerSecondLimit");
  objc_msgSend(v47, "encodeInt64:forKey:", -[__NSCFURLSessionTaskInfo expectedProgressTarget](self, "expectedProgressTarget"), @"expectedProgressTarget");
  int v36 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[__NSCFURLSessionTaskInfo qos](self, "qos"));
  [v47 encodeObject:v36 forKey:@"qos"];

  v37 = [(__NSCFURLSessionTaskInfo *)self personaUniqueString];
  [v47 encodeObject:v37 forKey:@"personaUniqueString"];

  [(__NSCFURLSessionTaskInfo *)self loadingPriority];
  objc_msgSend(v47, "encodeDouble:forKey:", @"loadingPriority");
  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo mayBeDemotedToDiscretionary](self, "mayBeDemotedToDiscretionary"), @"mayBeDemotedToDiscretionary");
  objc_msgSend(v47, "encodeInt32:forKey:", -[__NSCFURLSessionTaskInfo _TLSMinimumSupportedProtocolVersion](self, "_TLSMinimumSupportedProtocolVersion"), @"_TLSMinimumSupportedProtocolVersion");
  objc_msgSend(v47, "encodeInt32:forKey:", -[__NSCFURLSessionTaskInfo _TLSMaximumSupportedProtocolVersion](self, "_TLSMaximumSupportedProtocolVersion"), @"_TLSMaximumSupportedProtocolVersion");
  id v38 = (void *)MEMORY[0x1E4F28DB0];
  v39 = [(__NSCFURLSessionTaskInfo *)self additionalProperties];
  v40 = [v38 archivedDataWithRootObject:v39 requiringSecureCoding:1 error:0];
  [v47 encodeObject:v40 forKey:@"additionalProperties"];

  v41 = (void *)MEMORY[0x1E4F28DB0];
  int v42 = [(__NSCFURLSessionTaskInfo *)self _backgroundTrailers];
  double v43 = [v41 archivedDataWithRootObject:v42 requiringSecureCoding:1 error:0];
  [v47 encodeObject:v43 forKey:@"backgroundTrailers"];

  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo _hasSZExtractor](self, "_hasSZExtractor"), @"hasSZExtractor");
  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo _doesSZExtractorConsumeExtractedData](self, "_doesSZExtractorConsumeExtractedData"), @"doesSZExtractorConsumeExtractedData");
  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo _updatedStreamingZipModificationDate](self, "_updatedStreamingZipModificationDate"), @"updatedStreamingZipModificationDate");
  v44 = [(__NSCFURLSessionTaskInfo *)self pathToDownloadTaskFile];
  [v47 encodeObject:v44 forKey:@"pathToDownloadTaskFile"];

  objc_msgSend(v47, "encodeBool:forKey:", -[__NSCFURLSessionTaskInfo startedUserInitiated](self, "startedUserInitiated"), @"startedUserInitiated");
  v45 = [(__NSCFURLSessionTaskInfo *)self taskMetrics];
  [v47 encodeObject:v45 forKey:@"taskMetrics"];

  uint64_t v46 = [(__NSCFURLSessionTaskInfo *)self resumableUploadData];
  [v47 encodeObject:v46 forKey:@"resumableUploadData"];
}

- (NSURL)downloadFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 152, 1);
}

- (NSDictionary)additionalProperties
{
  return (NSDictionary *)objc_getProperty(self, a2, 424, 1);
}

- (NSURLRequest)currentRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 88, 1);
}

- (NSURLRequest)originalRequest
{
  return (NSURLRequest *)objc_getProperty(self, a2, 80, 1);
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 128, 1);
}

- (NSDictionary)_backgroundTrailers
{
  return (NSDictionary *)objc_getProperty(self, a2, 416, 1);
}

- (NSData)assetArtworkData
{
  return (NSData *)objc_getProperty(self, a2, 312, 1);
}

- (NSString)pathToDownloadTaskFile
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)taskDescription
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)isDiscretionary
{
  return self->_discretionary;
}

- (int64_t)state
{
  return self->_state;
}

- (id)_loggableDescription
{
  v3 = NSString;
  id v4 = [(__NSCFURLSessionTaskInfo *)self uniqueIdentifier];
  v5 = [v3 stringWithFormat:@"Task <%@>.<%lu>", v4, -[__NSCFURLSessionTaskInfo identifier](self, "identifier")];

  return v5;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (NSUUID)uniqueIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 216, 1);
}

- (NSURLResponse)response
{
  return (NSURLResponse *)objc_getProperty(self, a2, 96, 1);
}

- (NSDate)earliestBeginDate
{
  return (NSDate *)objc_getProperty(self, a2, 104, 1);
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

- (int64_t)countOfBytesExpectedToSend
{
  return self->_countOfBytesExpectedToSend;
}

- (int64_t)countOfBytesExpectedToReceive
{
  return self->_countOfBytesExpectedToReceive;
}

- (int64_t)countOfBytesClientExpectsToSend
{
  return self->_countOfBytesClientExpectsToSend;
}

- (int64_t)countOfBytesClientExpectsToReceive
{
  return self->_countOfBytesClientExpectsToReceive;
}

- (BOOL)_hasSZExtractor
{
  return self->__hasSZExtractor;
}

- (BOOL)_doesSZExtractorConsumeExtractedData
{
  return self->__doesSZExtractorConsumeExtractedData;
}

- (NSString)personaUniqueString
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (unsigned)qos
{
  return self->_qos;
}

- (int64_t)discretionaryOverride
{
  return self->_discretionaryOverride;
}

- (BOOL)startedUserInitiated
{
  return self->_startedUserInitiated;
}

- (unint64_t)suspendCount
{
  return self->_suspendCount;
}

- (NSString)storagePartitionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (int64_t)basePriority
{
  return self->_basePriority;
}

- (BOOL)hasStarted
{
  return self->_hasStarted;
}

- (NSURL)temporaryDestinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 352, 1);
}

- (BOOL)shouldCancelOnDisconnect
{
  return self->_shouldCancelOnDisconnect;
}

- (NSError)retryError
{
  return (NSError *)objc_getProperty(self, a2, 136, 1);
}

- (NSData)resumableUploadData
{
  return (NSData *)objc_getProperty(self, a2, 272, 1);
}

- (BOOL)respondedToWillBeginDelayedRequestCallback
{
  return self->_respondedToWillBeginDelayedRequestCallback;
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 320, 1);
}

- (BOOL)mayBeDemotedToDiscretionary
{
  return self->_mayBeDemotedToDiscretionary;
}

- (double)loadingPriority
{
  return self->_loadingPriority;
}

- (BOOL)initializedWithAVAsset
{
  return self->_initializedWithAVAsset;
}

- (unint64_t)expectedProgressTarget
{
  return self->_expectedProgressTarget;
}

- (BOOL)enableSPIDelegateCallbacks
{
  return self->_enableSPIDelegateCallbacks;
}

- (AVAssetDownloadConfiguration)downloadConfig
{
  return (AVAssetDownloadConfiguration *)objc_getProperty(self, a2, 368, 1);
}

- (NSURL)destinationURL
{
  return (NSURL *)objc_getProperty(self, a2, 296, 1);
}

- (int64_t)bytesPerSecondLimit
{
  return self->_bytesPerSecondLimit;
}

- (BOOL)basePrioritySetExplicitly
{
  return self->_basePrioritySetExplicitly;
}

- (NSString)avAssetDownloadChildDownloadSessionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 376, 1);
}

- (NSString)assetTitle
{
  return (NSString *)objc_getProperty(self, a2, 304, 1);
}

- (BOOL)_updatedStreamingZipModificationDate
{
  return self->__updatedStreamingZipModificationDate;
}

- (unsigned)_TLSMinimumSupportedProtocolVersion
{
  return self->__TLSMinimumSupportedProtocolVersion;
}

- (unsigned)_TLSMaximumSupportedProtocolVersion
{
  return self->__TLSMaximumSupportedProtocolVersion;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 288, 1);
}

- (NSURL)AVAssetURL
{
  return (NSURL *)objc_getProperty(self, a2, 336, 1);
}

- (unint64_t)AVAssetDownloadToken
{
  return self->_AVAssetDownloadToken;
}

- (double)creationTime
{
  return self->_creationTime;
}

- (void)_logTaskUUIDMapping
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (CFNLog::onceToken != -1) {
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
  }
  v3 = (id)CFNLog::logger;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(__NSCFURLSessionTaskInfo *)self _loggableDescription];
    v5 = [(__NSCFURLSessionTaskInfo *)self bundleID];
    v6 = [(__NSCFURLSessionTaskInfo *)self sessionID];
    int v7 = 138544130;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2048;
    unint64_t v14 = [(__NSCFURLSessionTaskInfo *)self identifier];
    _os_log_impl(&dword_184085000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ is for <%@>.<%@>.<%lu>", (uint8_t *)&v7, 0x2Au);
  }
}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (unint64_t)taskKind
{
  return self->_taskKind;
}

- (void)set_extractor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskMetrics, 0);
  objc_storeStrong((id *)&self->_additionalProperties, 0);
  objc_storeStrong((id *)&self->__backgroundTrailers, 0);
  objc_storeStrong((id *)&self->_avAssetDownloadChildDownloadSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_downloadConfig, 0);
  objc_storeStrong((id *)&self->_resolvedMediaSelectionPlist, 0);
  objc_storeStrong((id *)&self->_temporaryDestinationURL, 0);
  objc_storeStrong((id *)&self->_assetOptionsPlist, 0);
  objc_storeStrong((id *)&self->_AVAssetURL, 0);
  objc_storeStrong((id *)&self->_AVURLAsset, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetArtworkData, 0);
  objc_storeStrong((id *)&self->_assetTitle, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_resumableUploadData, 0);
  objc_storeStrong((id *)&self->__extractor, 0);
  objc_storeStrong((id *)&self->_pathToDownloadTaskFile, 0);
  objc_storeStrong((id *)&self->_storagePartitionIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_downloadFileURL, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_retryError, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_earliestBeginDate, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);

  objc_storeStrong((id *)&self->_taskDescription, 0);
}

- (BOOL)resumedAndWaitingForEarliestBeginDate
{
  return self->_resumedAndWaitingForEarliestBeginDate;
}

- (void)setDisablesRetry:(BOOL)a3
{
  self->_disablesRetry = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (__NSCFURLSessionTaskInfo)initWithDownloadTask:(id)a3 uniqueIdentifier:(id)a4 bundleID:(id)a5 sessionID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unint64_t v14 = (__NSCFURLSessionTaskInfo *)-[__NSCFURLSessionTaskInfo initWithTask:uniqueIdentifier:bundleID:sessionID:](self, v10, v11, v12, v13);
  uint64_t v15 = v14;
  if (v14) {
    [(__NSCFURLSessionTaskInfo *)v14 setTaskKind:0];
  }
  [(__NSCFURLSessionTaskInfo *)v15 _logTaskUUIDMapping];

  return v15;
}

- (void)setResolvedMediaSelectionPlist:(id)a3
{
}

- (NSDictionary)resolvedMediaSelectionPlist
{
  return (NSDictionary *)objc_getProperty(self, a2, 360, 1);
}

- (void)setAssetOptionsPlist:(id)a3
{
}

- (void)setAVURLAsset:(id)a3
{
}

- (AVURLAsset)AVURLAsset
{
  return (AVURLAsset *)objc_getProperty(self, a2, 328, 1);
}

- (STExtractor)_extractor
{
  return self->__extractor;
}

- (BOOL)disablesRetry
{
  return self->_disablesRetry;
}

- (void)setLowThroughputTimerRetryCount:(unint64_t)a3
{
  self->_lowThroughputTimerRetryCount = a3;
}

- (unint64_t)lowThroughputTimerRetryCount
{
  return self->_lowThroughputTimerRetryCount;
}

- (void)setEstablishedConnection:(BOOL)a3
{
  self->_establishedConnection = a3;
}

- (BOOL)establishedConnection
{
  return self->_establishedConnection;
}

- (void)setExpectingResumeCallback:(BOOL)a3
{
  self->_expectingResumeCallback = a3;
}

- (BOOL)expectingResumeCallback
{
  return self->_expectingResumeCallback;
}

- (void)setResumedAndWaitingForEarliestBeginDate:(BOOL)a3
{
  self->_resumedAndWaitingForEarliestBeginDate = a3;
}

- (__NSCFURLSessionTaskInfo)initWithAVAggregateAssetDownloadChildDownloadSessionIdentifier:(id)a3 assetTitle:(id)a4 assetArtworkData:(id)a5 options:(id)a6 taskIdentifier:(unint64_t)a7 uniqueIdentifier:(id)a8 bundleID:(id)a9 sessionID:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  objc_super v23 = (__NSCFURLSessionTaskInfo *)-[__NSCFURLSessionTaskInfo initWithTask:uniqueIdentifier:bundleID:sessionID:](self, 0, v20, v21, v22);
  v24 = v23;
  if (v23)
  {
    [(__NSCFURLSessionTaskInfo *)v23 setTaskKind:4];
    [(__NSCFURLSessionTaskInfo *)v24 setAssetTitle:v17];
    [(__NSCFURLSessionTaskInfo *)v24 setAssetArtworkData:v18];
    [(__NSCFURLSessionTaskInfo *)v24 setOptions:v19];
    [(__NSCFURLSessionTaskInfo *)v24 setIdentifier:a7];
    [(__NSCFURLSessionTaskInfo *)v24 setAvAssetDownloadChildDownloadSessionIdentifier:v16];
  }
  [(__NSCFURLSessionTaskInfo *)v24 _logTaskUUIDMapping];

  return v24;
}

- (__NSCFURLSessionTaskInfo)initWithAVAggregateDownloadTaskNoChildTaskKindWithURL:(id)a3 destinationURL:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 taskIdentifier:(unint64_t)a8 uniqueIdentifier:(id)a9 bundleID:(id)a10 sessionID:(id)a11 enableSPIDelegateCallbacks:(BOOL)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  v25 = (__NSCFURLSessionTaskInfo *)-[__NSCFURLSessionTaskInfo initWithTask:uniqueIdentifier:bundleID:sessionID:](self, 0, v22, v23, v24);
  uint64_t v26 = v25;
  if (v25)
  {
    [(__NSCFURLSessionTaskInfo *)v25 setTaskKind:5];
    [(__NSCFURLSessionTaskInfo *)v26 setURL:v17];
    [(__NSCFURLSessionTaskInfo *)v26 setDestinationURL:v18];
    [(__NSCFURLSessionTaskInfo *)v26 setAssetTitle:v19];
    [(__NSCFURLSessionTaskInfo *)v26 setAssetArtworkData:v20];
    [(__NSCFURLSessionTaskInfo *)v26 setOptions:v21];
    [(__NSCFURLSessionTaskInfo *)v26 setIdentifier:a8];
    [(__NSCFURLSessionTaskInfo *)v26 setEnableSPIDelegateCallbacks:a12];
  }
  [(__NSCFURLSessionTaskInfo *)v26 _logTaskUUIDMapping];

  return v26;
}

- (__NSCFURLSessionTaskInfo)initWithAVAssetDownloadURL:(id)a3 destinationURL:(id)a4 assetTitle:(id)a5 assetArtworkData:(id)a6 options:(id)a7 taskIdentifier:(unint64_t)a8 uniqueIdentifier:(id)a9 bundleID:(id)a10 sessionID:(id)a11 downloadConfig:(id)a12
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  v25 = (__NSCFURLSessionTaskInfo *)-[__NSCFURLSessionTaskInfo initWithTask:uniqueIdentifier:bundleID:sessionID:](self, 0, v21, v22, v23);
  uint64_t v26 = v25;
  if (v25)
  {
    [(__NSCFURLSessionTaskInfo *)v25 setTaskKind:3];
    [(__NSCFURLSessionTaskInfo *)v26 setURL:v16];
    [(__NSCFURLSessionTaskInfo *)v26 setDestinationURL:v17];
    [(__NSCFURLSessionTaskInfo *)v26 setAssetTitle:v18];
    [(__NSCFURLSessionTaskInfo *)v26 setAssetArtworkData:v19];
    [(__NSCFURLSessionTaskInfo *)v26 setOptions:v20];
    [(__NSCFURLSessionTaskInfo *)v26 setIdentifier:a8];
    [(__NSCFURLSessionTaskInfo *)v26 setDownloadConfig:v24];
  }
  [(__NSCFURLSessionTaskInfo *)v26 _logTaskUUIDMapping];

  return v26;
}

@end