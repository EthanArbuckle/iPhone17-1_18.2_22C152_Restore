@interface SinglePassVideoTranscodingTask
+ (BOOL)supportsDeduplication;
- (BOOL)hasProgress;
- (PFSinglePassVideoExportItem)singlePassExportItem;
- (double)currentFractionCompleted;
- (void)cancelTranscode;
- (void)performExport;
- (void)setSinglePassExportItem:(id)a3;
@end

@implementation SinglePassVideoTranscodingTask

+ (BOOL)supportsDeduplication
{
  return 0;
}

- (void).cxx_destruct
{
}

- (void)setSinglePassExportItem:(id)a3
{
}

- (PFSinglePassVideoExportItem)singlePassExportItem
{
  return (PFSinglePassVideoExportItem *)objc_getProperty(self, a2, 152, 1);
}

- (void)cancelTranscode
{
  v4 = [(SinglePassVideoTranscodingTask *)self singlePassExportItem];

  if (!v4)
  {
    v10 = +[NSAssertionHandler currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"VideoConversionService.m" lineNumber:1270 description:@"Unexpected missing single pass export session with job in running state"];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(VideoConversionTask *)self identifier];
    v6 = [(SinglePassVideoTranscodingTask *)self singlePassExportItem];
    v7 = [v6 identifier];
    int v11 = 138543618;
    v12 = v5;
    __int16 v13 = 2114;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cancelling single pass conversion task %{public}@ (export item %{public}@)", (uint8_t *)&v11, 0x16u);
  }
  v8 = [(SinglePassVideoTranscodingTask *)self singlePassExportItem];
  v9 = [v8 progress];
  [v9 cancel];
}

- (double)currentFractionCompleted
{
  v3 = [(SinglePassVideoTranscodingTask *)self singlePassExportItem];
  v4 = [v3 progress];

  [v4 fractionCompleted];
  double v6 = v5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v7 = [(VideoConversionTask *)self identifier];
    v8 = [(SinglePassVideoTranscodingTask *)self singlePassExportItem];
    v9 = [v8 identifier];
    int v11 = 138544130;
    v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    __int16 v15 = 2048;
    double v16 = v6 * 100.0;
    __int16 v17 = 2048;
    id v18 = [v4 completedUnitCount];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Single pass export conversion task %{public}@ (export item %{public}@) progress %.1f (%lld bytes)", (uint8_t *)&v11, 0x2Au);
  }
  return v6;
}

- (BOOL)hasProgress
{
  v2 = [(SinglePassVideoTranscodingTask *)self singlePassExportItem];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)performExport
{
  BOOL v3 = [(VideoConversionTask *)self options];
  v4 = [v3 objectForKeyedSubscript:@"PAMediaConversionServiceOptionTargetFileSizeKey"];
  id v5 = [v4 unsignedLongLongValue];

  double v6 = [(VideoConversionTask *)self sourceMainResourceURL];
  v7 = [(VideoConversionTask *)self outputMainResourceURL];
  id v54 = 0;
  v8 = +[PFVideoExport singlePassExportItemForAssetAtFileURL:v6 destinationURL:v7 targetFileSize:v5 error:&v54];
  id v38 = v54;

  if (v8)
  {
    v9 = objc_opt_class();
    v10 = [(VideoConversionTask *)self options];
    int v11 = [v9 metadataItemsByApplyingSignatureMetadataFromOptions:v10 toMetadataItems:&__NSArray0__struct];

    if ([v11 count]) {
      [v8 setAdditionalMetadata:v11];
    }
    v12 = objc_opt_class();
    __int16 v13 = [(VideoConversionTask *)self options];
    [v8 inputAssetDuration];
    double v15 = v14;
    double v16 = [(VideoConversionTask *)self identifier];
    objc_msgSend(v8, "setMaximizePowerEfficiency:", objc_msgSend(v12, "shouldMaximizeVideoConversionPowerEfficiencyForOptions:inputAssetDuration:taskIdentifier:", v13, v16, v15));

    __int16 v17 = [v8 identifier];
    id v18 = [v8 progress];
    v19 = [v18 cancellationHandler];

    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1000200BC;
    v50[3] = &unk_1000416C8;
    id v20 = v17;
    id v51 = v20;
    v52 = self;
    id v21 = v19;
    id v53 = v21;
    v22 = [v8 progress];
    [v22 setCancellationHandler:v50];

    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10002019C;
    v48[3] = &unk_1000416F0;
    v48[4] = self;
    id v23 = v20;
    id v49 = v23;
    v24 = objc_retainBlock(v48);
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    char v47 = 0;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100020404;
    v39[3] = &unk_100041718;
    v39[4] = self;
    id v40 = v8;
    v43 = &v44;
    v25 = v24;
    id v42 = v25;
    id v26 = v23;
    id v41 = v26;
    [(VideoTranscodingTask *)self transitionToRunningStateAndConditionallyRunBlock:v39];
    id v27 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v28 = [(VideoConversionTask *)self identifier];
      v29 = [(VideoConversionTask *)self sourceMainResourceURL];
      v30 = [v29 path];
      v31 = [(VideoConversionTask *)self outputMainResourceURL];
      v32 = [v31 path];
      int v33 = *((unsigned __int8 *)v45 + 24);
      *(_DWORD *)buf = 138544386;
      id v56 = v26;
      __int16 v57 = 2114;
      v58 = v28;
      __int16 v59 = 2112;
      v60 = v30;
      __int16 v61 = 2112;
      v62 = v32;
      __int16 v63 = 1024;
      int v64 = v33;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Single pass video export item %{public}@ for conversion task %{public}@ exporting %@ to %@ didStart: %d", buf, 0x30u);
    }
    _Block_object_dispose(&v44, 8);
  }
  else
  {
    [(VideoConversionTask *)self setStatus:2];
    NSErrorUserInfoKey v65 = NSLocalizedDescriptionKey;
    v34 = [(VideoConversionTask *)self sourceMainResourceURL];
    v35 = +[NSString stringWithFormat:@"Unable to create single pass export item for source %@", v34];
    v66 = v35;
    v36 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    v37 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:3 userInfo:v36];
    [(VideoConversionTask *)self setError:v37];

    [(VideoTranscodingTask *)self callCompletionHandler];
  }
}

@end