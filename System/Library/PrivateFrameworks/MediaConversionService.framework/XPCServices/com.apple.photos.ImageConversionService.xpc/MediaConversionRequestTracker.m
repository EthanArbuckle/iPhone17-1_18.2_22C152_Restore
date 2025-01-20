@interface MediaConversionRequestTracker
- (BOOL)_valueIsSimpleScalarType:(id)a3;
- (BOOL)copyDuplicateRequestOutputFromOriginalRequestTracker:(id)a3 error:(id *)a4;
- (BOOL)isDuplicateOfRequestWithRequestTracker:(id)a3 identicalDestinationURL:(BOOL *)a4;
- (BOOL)shouldDump;
- (MediaConversionRequestTracker)initWithRequestOptions:(id)a3 requestNumber:(unint64_t)a4;
- (NSData)outputData;
- (NSDate)dequeueAndStartProcessingTime;
- (NSDate)endTime;
- (NSDate)enqueueTime;
- (NSDictionary)cachedPerfCheckInformation;
- (NSDictionary)outputInformation;
- (NSDictionary)requestCompletionPerfCheckExtraInformation;
- (NSDictionary)requestOptions;
- (NSDictionary)serviceInformation;
- (NSError)error;
- (NSMutableArray)coreImageGraphDumpPaths;
- (NSSet)coreImageGraphDumpURLsAtStart;
- (NSString)originalRequestIdentifier;
- (NSString)outputTypeIdentifier;
- (NSString)requestIdentifier;
- (NSString)requestOptionsSignatureString;
- (NSString)sourceURLFilenameOnlySummary;
- (NSURL)debugDumpDirectoryURL;
- (NSURL)outputURL;
- (OS_os_transaction)transaction;
- (PAMediaConversionServiceResourceURLCollection)destinationURLCollection;
- (PAMediaConversionServiceResourceURLCollection)sourceURLCollection;
- (double)initialProcessMemoryPeak;
- (id)destinationURLsSignature;
- (id)graphDumpURLsForCurrentProcessIdentifier;
- (id)requestCompletionPerfCheckExtraInformationLogString;
- (id)sourceURLCollectionSignature;
- (int)clientProcessIdentifier;
- (int64_t)compare:(id)a3;
- (int64_t)effectivePriority;
- (pc_session)pc_session;
- (unint64_t)hashForObject:(id)a3;
- (unint64_t)requestNumber;
- (unint64_t)signpostId;
- (void)addCoreImageGraphDumpPath:(id)a3;
- (void)cacheDestinationBookmarkCollectionSignature;
- (void)cacheSourceBookmarkCollectionSignatureAndFilename;
- (void)copyCoreImageGraphDumpsToURL:(id)a3;
- (void)didCompleteRequest;
- (void)didDequeueAndStartProcessingRequest;
- (void)dumpResourceURLCollection:(id)a3 toParentDirectory:(id)a4 directoryName:(id)a5 updatingDebugInformation:(id)a6;
- (void)markAsCompletedWithInitialRequestIdentifier:(id)a3;
- (void)setCachedPerfCheckInformation:(id)a3;
- (void)setClientProcessIdentifier:(int)a3;
- (void)setCoreImageGraphDumpPaths:(id)a3;
- (void)setCoreImageGraphDumpURLsAtStart:(id)a3;
- (void)setDebugDumpDirectoryURL:(id)a3;
- (void)setDequeueAndStartProcessingTime:(id)a3;
- (void)setDestinationURLCollection:(id)a3;
- (void)setEffectivePriority:(int64_t)a3;
- (void)setEndTime:(id)a3;
- (void)setEnqueueTime:(id)a3;
- (void)setError:(id)a3;
- (void)setInitialProcessMemoryPeak:(double)a3;
- (void)setOriginalRequestIdentifier:(id)a3;
- (void)setOutputData:(id)a3;
- (void)setOutputInformation:(id)a3;
- (void)setOutputTypeIdentifier:(id)a3;
- (void)setOutputURL:(id)a3;
- (void)setPc_session:(pc_session *)a3;
- (void)setRequestNumber:(unint64_t)a3;
- (void)setRequestOptions:(id)a3;
- (void)setServiceInformation:(id)a3;
- (void)setSignpostId:(unint64_t)a3;
- (void)setSourceURLCollection:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setupCoreImageGraphDumpCapture;
- (void)setupPerfCheck;
- (void)storeDebugDump;
- (void)storeDebugDumpInputInformationToURL:(id)a3 updatingDebugInformation:(id)a4;
- (void)storeDebugDumpOutputInformationToURL:(id)a3 updatingDebugInformation:(id)a4;
@end

@implementation MediaConversionRequestTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_coreImageGraphDumpURLsAtStart, 0);
  objc_storeStrong((id *)&self->_cachedPerfCheckInformation, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_debugDumpDirectoryURL, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_coreImageGraphDumpPaths, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_dequeueAndStartProcessingTime, 0);
  objc_storeStrong((id *)&self->_enqueueTime, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_serviceInformation, 0);
  objc_storeStrong((id *)&self->_outputInformation, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_outputTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_outputData, 0);
  objc_storeStrong((id *)&self->_destinationURLCollection, 0);
  objc_storeStrong((id *)&self->_sourceURLCollection, 0);
  objc_storeStrong((id *)&self->_cachedDestinationURLCollectionSignature, 0);
  objc_storeStrong((id *)&self->_cachedSourceURLCollectionSignature, 0);
  objc_storeStrong((id *)&self->_cachedSourceURLFilenameOnlySummary, 0);
  objc_storeStrong((id *)&self->_cachedRequestOptionsSignature, 0);
}

- (void)setOriginalRequestIdentifier:(id)a3
{
}

- (NSString)originalRequestIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setCoreImageGraphDumpURLsAtStart:(id)a3
{
}

- (NSSet)coreImageGraphDumpURLsAtStart
{
  return (NSSet *)objc_getProperty(self, a2, 216, 1);
}

- (void)setCachedPerfCheckInformation:(id)a3
{
}

- (NSDictionary)cachedPerfCheckInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setInitialProcessMemoryPeak:(double)a3
{
  self->_initialProcessMemoryPeak = a3;
}

- (double)initialProcessMemoryPeak
{
  return self->_initialProcessMemoryPeak;
}

- (void)setPc_session:(pc_session *)a3
{
  self->_pc_session = a3;
}

- (pc_session)pc_session
{
  return self->_pc_session;
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDebugDumpDirectoryURL:(id)a3
{
}

- (NSURL)debugDumpDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 176, 1);
}

- (void)setRequestOptions:(id)a3
{
}

- (NSDictionary)requestOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setClientProcessIdentifier:(int)a3
{
  self->_clientProcessIdentifier = a3;
}

- (int)clientProcessIdentifier
{
  return self->_clientProcessIdentifier;
}

- (void)setRequestNumber:(unint64_t)a3
{
  self->_requestNumber = a3;
}

- (unint64_t)requestNumber
{
  return self->_requestNumber;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setCoreImageGraphDumpPaths:(id)a3
{
}

- (NSMutableArray)coreImageGraphDumpPaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 144, 1);
}

- (void)setEffectivePriority:(int64_t)a3
{
  self->_effectivePriority = a3;
}

- (int64_t)effectivePriority
{
  return self->_effectivePriority;
}

- (void)setEndTime:(id)a3
{
}

- (NSDate)endTime
{
  return (NSDate *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDequeueAndStartProcessingTime:(id)a3
{
}

- (NSDate)dequeueAndStartProcessingTime
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setEnqueueTime:(id)a3
{
}

- (NSDate)enqueueTime
{
  return (NSDate *)objc_getProperty(self, a2, 112, 1);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 104, 1);
}

- (void)setServiceInformation:(id)a3
{
}

- (NSDictionary)serviceInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setOutputInformation:(id)a3
{
}

- (NSDictionary)outputInformation
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOutputURL:(id)a3
{
}

- (NSURL)outputURL
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOutputTypeIdentifier:(id)a3
{
}

- (NSString)outputTypeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setOutputData:(id)a3
{
}

- (NSData)outputData
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDestinationURLCollection:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)destinationURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSourceURLCollection:(id)a3
{
}

- (PAMediaConversionServiceResourceURLCollection)sourceURLCollection
{
  return (PAMediaConversionServiceResourceURLCollection *)objc_getProperty(self, a2, 48, 1);
}

- (void)storeDebugDumpOutputInformationToURL:(id)a3 updatingDebugInformation:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[NSFileManager defaultManager];
  v10 = [(MediaConversionRequestTracker *)self outputData];

  if (v10)
  {
    v11 = [(MediaConversionRequestTracker *)self outputTypeIdentifier];

    if (!v11)
    {
      v35 = +[NSAssertionHandler currentHandler];
      [v35 handleFailureInMethod:a2 object:self file:@"MediaConversionDebugUtilities.m" lineNumber:548 description:@"Unexpected nil result data UTI"];
    }
    v12 = [(MediaConversionRequestTracker *)self outputTypeIdentifier];
    v13 = +[UTType typeWithIdentifier:v12];
    v14 = [v13 preferredFilenameExtension];

    v15 = [@"outputData" stringByAppendingPathExtension:v14];
    v16 = [v7 URLByAppendingPathComponent:v15];
    v17 = [(MediaConversionRequestTracker *)self outputData];
    id v37 = 0;
    unsigned int v18 = [v17 writeToURL:v16 options:1 error:&v37];
    id v19 = v37;

    if (v18)
    {
      v20 = [v16 lastPathComponent];
      [v8 setObject:v20 forKeyedSubscript:@"outputFilename"];
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v39 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to write result data to debug dump: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v21 = [(MediaConversionRequestTracker *)self outputURL];

    if (!v21) {
      goto LABEL_14;
    }
    v22 = [(MediaConversionRequestTracker *)self outputURL];
    v23 = [v22 pathExtension];
    v24 = [@"output" stringByAppendingPathExtension:v23];
    v14 = [v7 URLByAppendingPathComponent:v24];

    v25 = [(MediaConversionRequestTracker *)self outputURL];
    id v36 = 0;
    LODWORD(v24) = [v9 copyItemAtURL:v25 toURL:v14 error:&v36];
    id v19 = v36;

    if (!v24)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v39 = v19;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to copy output file url to debug dump: %{public}@", buf, 0xCu);
      }
      goto LABEL_13;
    }
    v15 = [v14 lastPathComponent];
    [v8 setObject:v15 forKeyedSubscript:@"outputFilename"];
  }

LABEL_13:
LABEL_14:
  v26 = [(MediaConversionRequestTracker *)self outputInformation];

  if (v26)
  {
    v27 = [(MediaConversionRequestTracker *)self outputInformation];
    id v28 = [v27 mutableCopy];

    v29 = [v28 objectForKeyedSubscript:@"PAMediaConversionServiceResultDataKey"];
    v30 = v29;
    if (v29)
    {
      v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<output data (%lu bytes) removed>", [v29 length]);
      [v28 setObject:v31 forKeyedSubscript:@"PAMediaConversionServiceResultDataKey"];
    }
    [v8 setObject:v28 forKeyedSubscript:@"outputInformation"];
  }
  v32 = [(MediaConversionRequestTracker *)self error];

  if (v32)
  {
    v33 = [(MediaConversionRequestTracker *)self error];
    v34 = [v33 description];
    [v8 setObject:v34 forKeyedSubscript:@"error"];
  }
}

- (void)dumpResourceURLCollection:(id)a3 toParentDirectory:(id)a4 directoryName:(id)a5 updatingDebugInformation:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v18 = 0;
  v12 = [v9 urlForDebugDumpWithDirectoryName:v10 inExistingParentDirectory:a4 error:&v18];
  id v13 = v18;
  if (v12)
  {
    v14 = [v12 path];
    v15 = [@"resourceDumpPath-" stringByAppendingString:v10];
    [v11 setObject:v14 forKeyedSubscript:v15];

    v16 = [v9 logMessageSummary];
    v17 = [@"resourceURLCollectionSummary-" stringByAppendingString:v10];
    [v11 setObject:v16 forKeyedSubscript:v17];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = v10;
    __int16 v21 = 2114;
    id v22 = v13;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to dump resources %{public}@ to debug dump: %{public}@", buf, 0x16u);
  }
}

- (void)storeDebugDumpInputInformationToURL:(id)a3 updatingDebugInformation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MediaConversionRequestTracker *)self requestOptions];
  id v9 = [v8 description];
  [v7 setObject:v9 forKeyedSubscript:@"requestOptionsDescription"];

  id v10 = [(MediaConversionRequestTracker *)self requestOptions];
  id v23 = 0;
  id v11 = +[NSKeyedArchiver archivedDataWithRootObject:v10 requiringSecureCoding:0 error:&v23];
  id v12 = v23;

  if (v11)
  {
    id v13 = [v6 URLByAppendingPathComponent:@"request-options.keyedarchive"];
    id v22 = v12;
    unsigned __int8 v14 = [v11 writeToURL:v13 options:1 error:&v22];
    id v15 = v22;

    if ((v14 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to write request options: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to serialize request options: %{public}@", buf, 0xCu);
    }
    id v15 = v12;
  }
  v16 = [(MediaConversionRequestTracker *)self sourceURLCollection];
  id v17 = [v16 urlCount];

  if (v17)
  {
    id v18 = [(MediaConversionRequestTracker *)self sourceURLCollection];
    [(MediaConversionRequestTracker *)self dumpResourceURLCollection:v18 toParentDirectory:v6 directoryName:@"sourceResourceURLCollection" updatingDebugInformation:v7];
  }
  id v19 = [(MediaConversionRequestTracker *)self destinationURLCollection];
  id v20 = [v19 urlCount];

  if (v20)
  {
    __int16 v21 = [(MediaConversionRequestTracker *)self destinationURLCollection];
    [(MediaConversionRequestTracker *)self dumpResourceURLCollection:v21 toParentDirectory:v6 directoryName:@"destinationResourceURLCollection" updatingDebugInformation:v7];
  }
}

- (void)addCoreImageGraphDumpPath:(id)a3
{
  id v4 = a3;
  coreImageGraphDumpPaths = self->_coreImageGraphDumpPaths;
  id v8 = v4;
  if (!coreImageGraphDumpPaths)
  {
    id v6 = +[NSMutableArray array];
    id v7 = self->_coreImageGraphDumpPaths;
    self->_coreImageGraphDumpPaths = v6;

    id v4 = v8;
    coreImageGraphDumpPaths = self->_coreImageGraphDumpPaths;
  }
  [(NSMutableArray *)coreImageGraphDumpPaths addObject:v4];
}

- (id)graphDumpURLsForCurrentProcessIdentifier
{
  id v36 = +[NSFileManager defaultManager];
  v2 = +[NSString stringWithFormat:@"^%d_.+_program_graph.*\\.pdf$", getpid()];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v53[0] = @"/tmp";
  v3 = NSTemporaryDirectory();
  v53[1] = v3;
  id v4 = +[NSArray arrayWithObjects:v53 count:2];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v44 objects:v54 count:16];
  if (!v5)
  {
    id v7 = 0;
    goto LABEL_33;
  }
  id v6 = v5;
  id v7 = 0;
  uint64_t v35 = *(void *)v45;
  while (2)
  {
    id v8 = 0;
    id v31 = v6;
    do
    {
      if (*(void *)v45 != v35) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void *)(*((void *)&v44 + 1) + 8 * (void)v8);
      id v10 = +[NSURL fileURLWithPath:v9];
      id v11 = [v10 URLByResolvingSymlinksInPath];

      id v43 = 0;
      id v12 = [v36 contentsOfDirectoryAtURL:v11 includingPropertiesForKeys:0 options:7 error:&v43];
      id v13 = v43;
      unsigned __int8 v14 = v13;
      if (v12)
      {
        v38 = v11;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        id v15 = v12;
        id v16 = [v15 countByEnumeratingWithState:&v39 objects:v48 count:16];
        if (v16)
        {
          id v17 = v16;
          id v37 = v12;
          v33 = v8;
          v34 = v14;
          char v18 = 0;
          uint64_t v19 = *(void *)v40;
          do
          {
            for (i = 0; i != v17; i = (char *)i + 1)
            {
              if (*(void *)v40 != v19) {
                objc_enumerationMutation(v15);
              }
              __int16 v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
              id v22 = [v21 lastPathComponent];
              if ([v22 rangeOfString:v2 options:1024] != (id)0x7FFFFFFFFFFFFFFFLL)
              {
                if (!v7)
                {
                  id v7 = +[NSMutableSet set];
                }
                [v7 addObject:v21];
                char v18 = 1;
              }
            }
            id v17 = [v15 countByEnumeratingWithState:&v39 objects:v48 count:16];
          }
          while (v17);

          if (v18)
          {

            goto LABEL_33;
          }
          id v6 = v31;
          id v8 = v33;
          unsigned __int8 v14 = v34;
          id v12 = v37;
          id v11 = v38;
        }
        else
        {

          id v11 = v38;
        }
      }
      else
      {
        id v23 = [v13 domain];
        if ([v23 isEqualToString:NSCocoaErrorDomain])
        {
          id v24 = [v14 code];
          id v25 = v14;
          v26 = v11;
          v27 = v8;
          id v28 = v24;

          BOOL v29 = v28 == (id)257;
          id v8 = v27;
          id v11 = v26;
          unsigned __int8 v14 = v25;
          id v12 = 0;
          if (v29) {
            goto LABEL_28;
          }
        }
        else
        {
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v50 = v9;
          __int16 v51 = 2114;
          v52 = v14;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to enumerate contents of temp directory %{public}@: %{public}@", buf, 0x16u);
        }
      }
LABEL_28:

      id v8 = (char *)v8 + 1;
    }
    while (v8 != v6);
    id v6 = [obj countByEnumeratingWithState:&v44 objects:v54 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_33:

  return v7;
}

- (void)copyCoreImageGraphDumpsToURL:(id)a3
{
  id v4 = a3;
  id v5 = +[NSFileManager defaultManager];
  id v6 = [(MediaConversionRequestTracker *)self graphDumpURLsForCurrentProcessIdentifier];
  id v7 = +[NSMutableSet setWithSet:v6];

  id v20 = self;
  [v7 minusSet:self->_coreImageGraphDumpURLsAtStart];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v24;
    *(void *)&long long v9 = 138543874;
    long long v19 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        unsigned __int8 v14 = objc_msgSend(v13, "lastPathComponent", v19);
        id v15 = [v4 URLByAppendingPathComponent:v14];
        id v22 = 0;
        unsigned int v16 = [v5 copyItemAtURL:v13 toURL:v15 error:&v22];
        id v17 = v22;
        if (v16)
        {
          char v18 = [v15 path];
          [(MediaConversionRequestTracker *)v20 addCoreImageGraphDumpPath:v18];
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v19;
          id v28 = v13;
          __int16 v29 = 2114;
          v30 = v15;
          __int16 v31 = 2114;
          id v32 = v17;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to copy core image graph dump file %{public}@ to %{public}@: %{public}@", buf, 0x20u);
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v23 objects:v33 count:16];
    }
    while (v10);
  }
}

- (void)storeDebugDump
{
  if ([(MediaConversionRequestTracker *)self shouldDump])
  {
    unsetenv("CI_PRINT_TREE");
    v3 = [(MediaConversionRequestTracker *)self requestIdentifier];
    id v4 = NSTemporaryDirectory();
    id v5 = [v4 stringByAppendingPathComponent:@"MediaConversionServiceDebugging"];
    id v6 = +[NSURL fileURLWithPath:v5 isDirectory:1];

    id v7 = [v6 URLByAppendingPathComponent:v3];
    id v8 = +[NSFileManager defaultManager];
    id v28 = 0;
    unsigned __int8 v9 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v28];
    id v10 = v28;
    if (v9)
    {
      [(MediaConversionRequestTracker *)self setDebugDumpDirectoryURL:v7];
      uint64_t v11 = +[NSMutableDictionary dictionary];
      [(MediaConversionRequestTracker *)self storeDebugDumpInputInformationToURL:v7 updatingDebugInformation:v11];
      [(MediaConversionRequestTracker *)self storeDebugDumpOutputInformationToURL:v7 updatingDebugInformation:v11];
      [(MediaConversionRequestTracker *)self copyCoreImageGraphDumpsToURL:v7];
      id v12 = [(MediaConversionRequestTracker *)self endTime];
      id v13 = [(MediaConversionRequestTracker *)self enqueueTime];
      [v12 timeIntervalSinceDate:v13];
      unsigned __int8 v14 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v11 setObject:v14 forKeyedSubscript:@"requestDurationSeconds"];

      id v15 = [(MediaConversionRequestTracker *)self endTime];
      unsigned int v16 = [(MediaConversionRequestTracker *)self dequeueAndStartProcessingTime];
      [v15 timeIntervalSinceDate:v16];
      id v17 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v11 setObject:v17 forKeyedSubscript:@"processingDurationSeconds"];

      [v11 setObject:self->_serviceInformation forKeyedSubscript:@"serviceInformation"];
      char v18 = +[NSNumber numberWithInt:getpid()];
      [v11 setObject:v18 forKeyedSubscript:@"processIdentifier"];

      long long v19 = +[NSString stringWithUTF8String:getprogname()];
      [v11 setObject:v19 forKeyedSubscript:@"processName"];

      id v20 = [(MediaConversionRequestTracker *)self requestCompletionPerfCheckExtraInformation];
      [v11 setObject:v20 forKeyedSubscript:@"perfCheckInformation"];

      __int16 v21 = [(MediaConversionRequestTracker *)self requestOptionsSignatureString];
      [v11 setObject:v21 forKeyedSubscript:@"requestOptionsSignature"];

      id v22 = [v7 URLByAppendingPathComponent:@"debug-info.plist"];
      id v27 = 0;
      long long v23 = +[NSPropertyListSerialization dataWithPropertyList:v11 format:100 options:0 error:&v27];
      id v24 = v27;

      if (v23)
      {
        id v26 = v24;
        unsigned __int8 v25 = [v23 writeToURL:v22 options:1 error:&v26];
        id v10 = v26;

        if ((v25 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v30 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to write debug dump info property list: %{public}@", buf, 0xCu);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v30 = v24;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to serialize debug dump info property list: %{public}@", buf, 0xCu);
        }
        id v10 = v24;
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v3;
      __int16 v31 = 2112;
      id v32 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create dump directory for media conversion request %@: %@", buf, 0x16u);
    }
  }
}

- (id)requestCompletionPerfCheckExtraInformationLogString
{
  v2 = [(MediaConversionRequestTracker *)self requestCompletionPerfCheckExtraInformation];
  v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKeyedSubscript:@"processMemoryPeakKiloBytesInitial"];
    [v4 doubleValue];
    uint64_t v6 = v5;
    id v7 = [v3 objectForKeyedSubscript:@"processMemoryPeakKiloBytesAfterRequest"];
    [v7 doubleValue];
    uint64_t v9 = v8;
    id v10 = [v3 objectForKeyedSubscript:@"cpuTimeMilliSeconds"];
    [v10 doubleValue];
    uint64_t v12 = v11;
    id v13 = [v3 objectForKeyedSubscript:@"cpuMillionInstructions"];
    [v13 doubleValue];
    id v15 = +[NSString stringWithFormat:@", dirty memory peak before/after request: %.0f/%.0f KB, CPU time %.0fms, instructions %.1fM", v6, v9, v12, v14];
  }
  else
  {
    id v15 = @" (error getting perf check info)";
  }

  return v15;
}

- (NSDictionary)requestCompletionPerfCheckExtraInformation
{
  p_cachedPerfCheckInformation = &self->_cachedPerfCheckInformation;
  cachedPerfCheckInformation = self->_cachedPerfCheckInformation;
  if (cachedPerfCheckInformation)
  {
    id v4 = cachedPerfCheckInformation;
  }
  else
  {
    if (self->_pc_session)
    {
      int v6 = pc_session_end();
      if (v6)
      {
        int v7 = v6;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&uint8_t buf[4] = strerror(v7);
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to end performance check session: %s", buf, 0xCu);
        }
        id v4 = 0;
      }
      else
      {
        *(void *)buf = 0;
        pc_session_get_value();
        pc_session_get_value();
        pc_session_get_value();
        v14[0] = @"processMemoryPeakKiloBytesInitial";
        uint64_t v8 = +[NSNumber numberWithDouble:self->_initialProcessMemoryPeak];
        v15[0] = v8;
        v14[1] = @"processMemoryPeakKiloBytesAfterRequest";
        uint64_t v9 = +[NSNumber numberWithDouble:0.0];
        v15[1] = v9;
        v14[2] = @"cpuTimeMilliSeconds";
        id v10 = +[NSNumber numberWithDouble:0.0 / 1000000.0];
        v15[2] = v10;
        v14[3] = @"cpuMillionInstructions";
        uint64_t v11 = +[NSNumber numberWithDouble:0.0 / 1000000.0];
        v15[3] = v11;
        id v4 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:4];
      }
      pc_session_destroy();
      self->_pc_session = 0;
    }
    else
    {
      id v4 = 0;
    }
    objc_storeStrong((id *)p_cachedPerfCheckInformation, v4);
  }
  return v4;
}

- (void)didCompleteRequest
{
  v3 = +[NSDate date];
  [(MediaConversionRequestTracker *)self setEndTime:v3];

  id v4 = &_os_log_default;
  os_signpost_id_t signpostId = self->_signpostId;
  if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_SIGNPOST_INTERVAL_END, signpostId, "com.apple.photos.mediaconversion.service.processing", "", buf, 2u);
  }

  int v6 = [(MediaConversionRequestTracker *)self requestIdentifier];
  int v7 = [(MediaConversionRequestTracker *)self requestCompletionPerfCheckExtraInformationLogString];
  [(MediaConversionRequestTracker *)self storeDebugDump];
  uint64_t v8 = [(MediaConversionRequestTracker *)self debugDumpDirectoryURL];

  if (v8)
  {
    uint64_t v9 = [(MediaConversionRequestTracker *)self debugDumpDirectoryURL];
    id v10 = [v9 path];
    uint64_t v11 = +[NSString stringWithFormat:@", debug dump saved to %@ because %@ user default is set", v10, @"MediaConversionServiceKeepTemporaryFiles"];
  }
  else
  {
    uint64_t v11 = &stru_100036EE8;
  }
  if (self->_originalRequestIdentifier)
  {
    uint64_t v12 = +[NSString stringWithFormat:@" (duplicate of %@)", self->_originalRequestIdentifier];
    id v13 = @"(omitted)";
  }
  else
  {
    uint64_t v14 = [(MediaConversionRequestTracker *)self sourceURLCollection];
    id v13 = [v14 logMessageSummary];

    uint64_t v12 = &stru_100036EE8;
  }
  id v15 = [(MediaConversionRequestTracker *)self endTime];
  unsigned int v16 = [(MediaConversionRequestTracker *)self enqueueTime];
  [v15 timeIntervalSinceDate:v16];
  uint64_t v18 = v17;

  long long v19 = [(MediaConversionRequestTracker *)self dequeueAndStartProcessingTime];
  id v20 = [(MediaConversionRequestTracker *)self enqueueTime];
  [v19 timeIntervalSinceDate:v20];
  uint64_t v22 = v21;

  long long v23 = [(MediaConversionRequestTracker *)self endTime];
  id v24 = [(MediaConversionRequestTracker *)self dequeueAndStartProcessingTime];
  [v23 timeIntervalSinceDate:v24];
  uint64_t v26 = v25;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    id v27 = [(MediaConversionRequestTracker *)self error];
    *(_DWORD *)buf = 138545411;
    __int16 v29 = v6;
    __int16 v30 = 2114;
    __int16 v31 = v12;
    __int16 v32 = 2113;
    v33 = v13;
    __int16 v34 = 2048;
    uint64_t v35 = v18;
    __int16 v36 = 2048;
    uint64_t v37 = v22;
    __int16 v38 = 2048;
    uint64_t v39 = v26;
    __int16 v40 = 2114;
    long long v41 = v27;
    __int16 v42 = 2114;
    id v43 = v7;
    __int16 v44 = 2114;
    long long v45 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Completed media conversion for job %{public}@%{public}@, source URL Collection \"%{private}@\", request duration %.3fs (%.3fs enqueued/waiting, %.3fs processing), error = %{public}@%{public}@%{public}@", buf, 0x5Cu);
  }
}

- (void)markAsCompletedWithInitialRequestIdentifier:(id)a3
{
  long long v19 = (NSMutableArray *)a3;
  [(MediaConversionRequestTracker *)self didCompleteRequest];
  uint64_t v5 = [(MediaConversionRequestTracker *)self outputInformation];
  id v6 = [v5 mutableCopy];

  if (v6)
  {
    if (!self->_enqueueTime)
    {
      unsigned int v16 = +[NSAssertionHandler currentHandler];
      [v16 handleFailureInMethod:a2 object:self file:@"MediaConversionDebugUtilities.m" lineNumber:306 description:@"Unexpected missing enqueue time"];
    }
    if (!self->_dequeueAndStartProcessingTime)
    {
      uint64_t v17 = +[NSAssertionHandler currentHandler];
      [v17 handleFailureInMethod:a2 object:self file:@"MediaConversionDebugUtilities.m" lineNumber:307 description:@"Unexpected missing dequeue time"];
    }
    if (!self->_endTime)
    {
      uint64_t v18 = +[NSAssertionHandler currentHandler];
      [v18 handleFailureInMethod:a2 object:self file:@"MediaConversionDebugUtilities.m" lineNumber:308 description:@"Unexpected missing end time"];
    }
    [v6 setObject:self->_enqueueTime forKeyedSubscript:@"PAMediaConversionServiceConversionStartDateKey"];
    [v6 setObject:self->_dequeueAndStartProcessingTime forKeyedSubscript:@"PAMediaConversionServiceConversionDequeueAndStartProcessingDateKey"];
    [v6 setObject:self->_endTime forKeyedSubscript:@"PAMediaConversionServiceConversionEndDateKey"];
    [(NSDate *)self->_endTime timeIntervalSinceDate:self->_enqueueTime];
    int v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v6 setObject:v7 forKeyedSubscript:@"PAMediaConversionServiceConversionTotalDurationTimeIntervalServiceSideKey"];

    if (v19
      && ([(MediaConversionRequestTracker *)self requestIdentifier],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v9 = [(NSMutableArray *)v19 isEqualToString:v8],
          v8,
          (v9 & 1) == 0))
    {
      CFStringRef v12 = @"PAMediaConversionServiceDeduplicatedAgainstOriginalRequestIdentifierKey";
      id v13 = v6;
      coreImageGraphDumpPaths = v19;
    }
    else
    {
      id v10 = [(MediaConversionRequestTracker *)self requestCompletionPerfCheckExtraInformation];
      [v6 setObject:v10 forKeyedSubscript:@"PAMediaConversionServiceConversionPerfCheckDataKey"];

      coreImageGraphDumpPaths = self->_coreImageGraphDumpPaths;
      CFStringRef v12 = @"PAMediaConversionServiceUnitTestSupportCoreImageGraphDumpPathsKey";
      id v13 = v6;
    }
    [v13 setObject:coreImageGraphDumpPaths forKeyedSubscript:v12];
    [(MediaConversionRequestTracker *)self setOutputInformation:v6];
  }
  else
  {
    uint64_t v14 = [(MediaConversionRequestTracker *)self error];

    if (!v14)
    {
      id v15 = +[NSAssertionHandler currentHandler];
      [v15 handleFailureInMethod:a2 object:self file:@"MediaConversionDebugUtilities.m" lineNumber:303 description:@"Unexpected nil result information and error"];
    }
  }
}

- (void)didDequeueAndStartProcessingRequest
{
  v3 = +[NSDate date];
  dequeueAndStartProcessingTime = self->_dequeueAndStartProcessingTime;
  self->_dequeueAndStartProcessingTime = v3;

  id v5 = &_os_log_default;
  os_signpost_id_t signpostId = self->_signpostId;
  if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
  {
    LOWORD(v10) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_SIGNPOST_INTERVAL_END, signpostId, "com.apple.photos.mediaconversion.service.enqueue", "", (uint8_t *)&v10, 2u);
  }

  id v7 = &_os_log_default;
  os_signpost_id_t v8 = self->_signpostId;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
  {
    unsigned __int8 v9 = [(NSDictionary *)self->_requestOptions objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];
    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_SIGNPOST_INTERVAL_BEGIN, v8, "com.apple.photos.mediaconversion.service.processing", "Media conversion request %{public}@", (uint8_t *)&v10, 0xCu);
  }
}

- (BOOL)_valueIsSimpleScalarType:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (unint64_t)hashForObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v6 = [v5 allKeys];
    id v7 = [v6 sortedArrayUsingComparator:&stru_100035488];

    id v8 = [v7 countByEnumeratingWithState:&v27 objects:v34 count:16];
    if (v8)
    {
      id v9 = v8;
      unint64_t v10 = 0;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v7);
          }
          id v13 = [v5 objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          v10 ^= [(MediaConversionRequestTracker *)self hashForObject:v13];
        }
        id v9 = [v7 countByEnumeratingWithState:&v27 objects:v34 count:16];
      }
      while (v9);
    }
    else
    {
      unint64_t v10 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (![(MediaConversionRequestTracker *)self _valueIsSimpleScalarType:v4])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v22 = 0;
          uint64_t v18 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v22];
          id v5 = v22;
          if (v18)
          {
            unint64_t v10 = (unint64_t)[v18 hash];
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v5;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to archive metadata policy: %@", buf, 0xCu);
            }
            unint64_t v10 = 0;
          }

          goto LABEL_25;
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          id v20 = (objc_class *)objc_opt_class();
          uint64_t v21 = NSStringFromClass(v20);
          *(_DWORD *)buf = 138412290;
          id v32 = v21;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unexpected options dictionary value class: %@", buf, 0xCu);
        }
      }
      unint64_t v10 = (unint64_t)[v4 hash];
      goto LABEL_26;
    }
    id v5 = v4;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v14 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v14)
    {
      id v15 = v14;
      unint64_t v10 = 0;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v5);
          }
          v10 ^= [(MediaConversionRequestTracker *)self hashForObject:*(void *)(*((void *)&v23 + 1) + 8 * (void)j)];
        }
        id v15 = [v5 countByEnumeratingWithState:&v23 objects:v33 count:16];
      }
      while (v15);
    }
    else
    {
      unint64_t v10 = 0;
    }
  }
LABEL_25:

LABEL_26:
  return v10;
}

- (BOOL)copyDuplicateRequestOutputFromOriginalRequestTracker:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 1;
  id v7 = [(MediaConversionRequestTracker *)self destinationURLCollection];
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x3032000000;
  long long v26 = sub_10001E758;
  long long v27 = sub_10001E768;
  id v28 = 0;
  id v8 = +[NSFileManager defaultManager];
  id v9 = [v6 destinationURLCollection];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001E770;
  v16[3] = &unk_100035448;
  id v10 = v7;
  id v17 = v10;
  id v11 = v6;
  id v18 = v11;
  long long v19 = self;
  uint64_t v21 = &v29;
  id v22 = &v23;
  id v12 = v8;
  id v20 = v12;
  [v9 enumerateResourceURLs:v16];

  int v13 = *((unsigned __int8 *)v30 + 24);
  if (a4 && !*((unsigned char *)v30 + 24))
  {
    *a4 = (id) v24[5];
    int v13 = *((unsigned __int8 *)v30 + 24);
  }
  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v14;
}

- (BOOL)isDuplicateOfRequestWithRequestTracker:(id)a3 identicalDestinationURL:(BOOL *)a4
{
  id v7 = a3;
  if (v7)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a2, self, @"MediaConversionDebugUtilities.m", 196, @"Invalid parameter not satisfying: %@", @"otherRequestTracker" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  id v20 = +[NSAssertionHandler currentHandler];
  [v20 handleFailureInMethod:a2, self, @"MediaConversionDebugUtilities.m", 197, @"Invalid parameter not satisfying: %@", @"identicalDestinationURL" object file lineNumber description];

LABEL_3:
  id v8 = [(MediaConversionRequestTracker *)self requestOptionsSignatureString];
  id v9 = [v8 componentsSeparatedByString:@"-"];

  if ([v9 count] != (id)3)
  {
    uint64_t v21 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MediaConversionDebugUtilities.m", 200, @"Unexpected self signature component count %lu", objc_msgSend(v9, "count"));
  }
  id v10 = [v7 requestOptionsSignatureString];
  id v11 = [v10 componentsSeparatedByString:@"-"];

  if ([v11 count] != (id)3)
  {
    id v22 = +[NSAssertionHandler currentHandler];
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MediaConversionDebugUtilities.m", 203, @"Unexpected other signature component count %lu", objc_msgSend(v9, "count"));
  }
  id v12 = [v9 objectAtIndexedSubscript:0];
  int v13 = [v11 objectAtIndexedSubscript:0];
  unsigned int v14 = [v12 isEqualToString:v13];
  if (v14)
  {
    id v15 = [v9 objectAtIndexedSubscript:1];
    uint64_t v16 = [v11 objectAtIndexedSubscript:1];
    unsigned int v17 = [v15 isEqualToString:v16];

    if (!v17)
    {
      LOBYTE(v14) = 0;
      goto LABEL_12;
    }
    id v12 = [v9 objectAtIndexedSubscript:2];
    int v13 = [v11 objectAtIndexedSubscript:2];
    *a4 = [v12 isEqualToString:v13];
  }

LABEL_12:
  return v14;
}

- (NSString)requestOptionsSignatureString
{
  cachedRequestOptionsSignature = self->_cachedRequestOptionsSignature;
  if (!cachedRequestOptionsSignature)
  {
    v12[0] = @"PAMediaConversionServiceJobIdentifierKey";
    v12[1] = @"PAMediaConversionServiceSourceBookmarkCollectionKey";
    v12[2] = @"PAMediaConversionServiceDestinationBookmarkCollectionKey";
    v12[3] = @"PAMediaConversionServiceOptionRequestReasonKey";
    v12[4] = @"PAMediaConversionServiceOptionJobPriorityKey";
    id v4 = +[NSArray arrayWithObjects:v12 count:5];
    id v5 = [(NSDictionary *)self->_requestOptions mutableCopy];
    [v5 removeObjectsForKeys:v4];
    id v6 = [(MediaConversionRequestTracker *)self sourceURLCollectionSignature];
    unint64_t v7 = [(MediaConversionRequestTracker *)self hashForObject:v5];
    id v8 = [(MediaConversionRequestTracker *)self destinationURLsSignature];
    id v9 = +[NSString stringWithFormat:@"%@-%lx-%@", v6, v7, v8];
    id v10 = self->_cachedRequestOptionsSignature;
    self->_cachedRequestOptionsSignature = v9;

    cachedRequestOptionsSignature = self->_cachedRequestOptionsSignature;
  }
  return cachedRequestOptionsSignature;
}

- (id)destinationURLsSignature
{
  return self->_cachedDestinationURLCollectionSignature;
}

- (void)cacheDestinationBookmarkCollectionSignature
{
  id v3 = [(NSDictionary *)self->_requestOptions objectForKeyedSubscript:@"PAMediaConversionServiceDestinationBookmarkCollectionKey"];
  if (v3)
  {
    id v10 = 0;
    id v11 = 0;
    id v4 = [(NSDictionary *)self->_requestOptions objectForKeyedSubscript:@"PAMediaConversionServiceDestinationBookmarkCollectionKey"];
    +[PAMediaConversionServiceResourceURLCollection getSignatureString:&v11 filenameSummary:&v10 forDictionaryRepresentation:v4];
    id v5 = (NSString *)v11;
    id v6 = v10;

    cachedDestinationURLCollectionSignature = self->_cachedDestinationURLCollectionSignature;
    self->_cachedDestinationURLCollectionSignature = v5;
    id v8 = v5;
  }
  else
  {
    id v9 = self->_cachedDestinationURLCollectionSignature;
    self->_cachedDestinationURLCollectionSignature = (NSString *)@"nsdata";
  }
}

- (id)sourceURLCollectionSignature
{
  cachedSourceURLCollectionSignature = self->_cachedSourceURLCollectionSignature;
  if (!cachedSourceURLCollectionSignature)
  {
    [(MediaConversionRequestTracker *)self cacheSourceBookmarkCollectionSignatureAndFilename];
    cachedSourceURLCollectionSignature = self->_cachedSourceURLCollectionSignature;
  }
  return cachedSourceURLCollectionSignature;
}

- (NSString)sourceURLFilenameOnlySummary
{
  cachedSourceURLFilenameOnlySummary = self->_cachedSourceURLFilenameOnlySummary;
  if (!cachedSourceURLFilenameOnlySummary)
  {
    [(MediaConversionRequestTracker *)self cacheSourceBookmarkCollectionSignatureAndFilename];
    cachedSourceURLFilenameOnlySummary = self->_cachedSourceURLFilenameOnlySummary;
  }
  return cachedSourceURLFilenameOnlySummary;
}

- (void)cacheSourceBookmarkCollectionSignatureAndFilename
{
  if (!self->_sourceURLCollection)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"MediaConversionDebugUtilities.m" lineNumber:136 description:@"Source URL collection has not been set yet"];
  }
  id v12 = 0;
  id v3 = [(NSDictionary *)self->_requestOptions objectForKeyedSubscript:@"PAMediaConversionServiceSourceBookmarkCollectionKey", 0];
  +[PAMediaConversionServiceResourceURLCollection getSignatureString:&v12 filenameSummary:&v11 forDictionaryRepresentation:v3];
  id v4 = (NSString *)v12;
  id v5 = (NSString *)v11;

  cachedSourceURLCollectionSignature = self->_cachedSourceURLCollectionSignature;
  self->_cachedSourceURLCollectionSignature = v4;
  unint64_t v7 = v4;

  cachedSourceURLFilenameOnlySummary = self->_cachedSourceURLFilenameOnlySummary;
  self->_cachedSourceURLFilenameOnlySummary = v5;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MediaConversionRequestTracker *)self effectivePriority];
  id v6 = [v4 effectivePriority];
  if (v5 <= (uint64_t)v6)
  {
    if (v5 < (uint64_t)v6)
    {
      int64_t v7 = 1;
    }
    else
    {
      id v8 = [(MediaConversionRequestTracker *)self enqueueTime];
      id v9 = [v4 enqueueTime];
      int64_t v10 = (int64_t)[v8 compare:v9];

      if (v5 <= 0) {
        int64_t v7 = v10;
      }
      else {
        int64_t v7 = -v10;
      }
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (BOOL)shouldDump
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:@"MediaConversionServiceKeepTemporaryFiles"];

  return v3;
}

- (NSString)requestIdentifier
{
  v2 = [(MediaConversionRequestTracker *)self requestOptions];
  unsigned __int8 v3 = [v2 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];

  return (NSString *)v3;
}

- (void)setupCoreImageGraphDumpCapture
{
  if ([(MediaConversionRequestTracker *)self shouldDump])
  {
    setenv("CI_PRINT_TREE", "4 pdf", 1);
    self->_coreImageGraphDumpURLsAtStart = [(MediaConversionRequestTracker *)self graphDumpURLsForCurrentProcessIdentifier];
    _objc_release_x1();
  }
}

- (void)setupPerfCheck
{
  unsigned __int8 v3 = (pc_session *)pc_session_create();
  self->_pc_session = v3;
  if (v3)
  {
    getpid();
    pc_session_set_procpid();
    int v4 = pc_session_begin();
    if (v4)
    {
      int v5 = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = strerror(v5);
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to begin performance check session: %s", buf, 0xCu);
      }
      pc_session_destroy();
      self->_pc_session = 0;
    }
    else
    {
      pc_session_get_value();
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = strerror(0);
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create performance check session: %s", buf, 0xCu);
  }
}

- (MediaConversionRequestTracker)initWithRequestOptions:(id)a3 requestNumber:(unint64_t)a4
{
  id v8 = a3;
  id v9 = [v8 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];

  if (!v9)
  {
    long long v24 = +[NSAssertionHandler currentHandler];
    [v24 handleFailureInMethod:a2, self, @"MediaConversionDebugUtilities.m", 46, @"Invalid parameter not satisfying: %@", @"requestOptions[PAMediaConversionServiceJobIdentifierKey]" object file lineNumber description];
  }
  v25.receiver = self;
  v25.super_class = (Class)MediaConversionRequestTracker;
  int64_t v10 = [(MediaConversionRequestTracker *)&v25 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_requestOptions, a3);
    v11->_requestNumber = a4;
    uint64_t v12 = +[NSDate date];
    enqueueTime = v11->_enqueueTime;
    v11->_enqueueTime = (NSDate *)v12;

    uint64_t v14 = os_transaction_create();
    transaction = v11->_transaction;
    v11->_transaction = (OS_os_transaction *)v14;

    uint64_t v16 = +[NSXPCConnection currentConnection];
    unsigned int v17 = [v16 _xpcConnection];
    v11->_clientProcessIdentifier = xpc_connection_get_pid(v17);

    id v18 = [v8 objectForKeyedSubscript:@"PAMediaConversionServiceOptionJobPriorityKey"];
    v11->_effectivePriority = (int64_t)[v18 integerValue];

    v11->_os_signpost_id_t signpostId = os_signpost_id_make_with_pointer((os_log_t)&_os_log_default, v11);
    id v19 = &_os_log_default;
    os_signpost_id_t signpostId = v11->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)&_os_log_default))
    {
      uint64_t v21 = [v8 objectForKeyedSubscript:@"PAMediaConversionServiceJobIdentifierKey"];
      id v22 = [v8 objectForKeyedSubscript:@"PAMediaConversionServiceOptionRequestReasonKey"];
      *(_DWORD *)buf = 138543618;
      long long v27 = v21;
      __int16 v28 = 2112;
      uint64_t v29 = v22;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "com.apple.photos.mediaconversion.service.enqueue", "Media conversion request %{public}@, reason: %@", buf, 0x16u);
    }
    [(MediaConversionRequestTracker *)v11 setupPerfCheck];
    [(MediaConversionRequestTracker *)v11 setupCoreImageGraphDumpCapture];
    [(MediaConversionRequestTracker *)v11 cacheDestinationBookmarkCollectionSignature];
  }

  return v11;
}

@end