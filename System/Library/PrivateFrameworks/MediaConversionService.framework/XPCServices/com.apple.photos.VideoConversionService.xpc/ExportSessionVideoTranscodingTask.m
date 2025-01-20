@interface ExportSessionVideoTranscodingTask
+ (id)videoDateFormatter;
- (AVAssetExportSession)exportSession;
- (BOOL)hasProgress;
- (double)currentFractionCompleted;
- (id)exportPresetName;
- (id)exportSessionCompletionHandler;
- (id)exportSessionForInputAsset:(id)a3 presetName:(id)a4;
- (id)metadataItemsFromOptionsAndInputAsset:(id)a3;
- (id)outputFileTypeForExportSession:(id)a3;
- (void)addOutputMetadataFromOptionsAndInputAsset:(id)a3 toExportSession:(id)a4;
- (void)cancelTranscode;
- (void)configureOutputForExportSession:(id)a3 outputFileType:(id)a4;
- (void)dumpStatistics;
- (void)performExport;
- (void)performMetadataTrackExtractionConversion;
- (void)performPassthroughConversion;
- (void)setExportSession:(id)a3;
- (void)startExportSession:(id)a3;
@end

@implementation ExportSessionVideoTranscodingTask

+ (id)videoDateFormatter
{
  if (qword_10004A0B0 != -1) {
    dispatch_once(&qword_10004A0B0, &stru_100041650);
  }
  v2 = (void *)qword_10004A0B8;
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setExportSession:(id)a3
{
}

- (AVAssetExportSession)exportSession
{
  return (AVAssetExportSession *)objc_getProperty(self, a2, 152, 1);
}

- (void)dumpStatistics
{
  v3 = [(VideoConversionTask *)self conversionEndTime];
  v4 = [(VideoConversionTask *)self conversionStartTime];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  v7 = [(VideoConversionTask *)self asset];
  v8 = v7;
  if (v7) {
    [v7 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);
  v10 = +[PFMediaUtilities tracksWithMediaType:AVMediaTypeVideo forAsset:v8];
  v11 = [v10 firstObject];
  [v11 nominalFrameRate];
  float v13 = v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    double v14 = v13;
    float v15 = Seconds * v14 / v6;
    float v16 = v6 / Seconds;
    v17 = [(VideoConversionTask *)self identifier];
    v18 = [(ExportSessionVideoTranscodingTask *)self exportSession];
    id v19 = [v18 status];
    *(_DWORD *)buf = 138544898;
    v22 = v17;
    __int16 v23 = 2048;
    id v24 = v19;
    __int16 v25 = 2048;
    double v26 = v6;
    __int16 v27 = 2048;
    double v28 = Seconds;
    __int16 v29 = 2048;
    double v30 = v14;
    __int16 v31 = 2048;
    double v32 = v16;
    __int16 v33 = 2048;
    double v34 = v15;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Export session for conversion task %{public}@ finished, status %ld, conversion duration %.1fs, input asset duration %.1fs (%.1ffps), %.1f x realtime (%.1ffps)", buf, 0x48u);
  }
}

- (id)outputFileTypeForExportSession:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    double v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2, self, @"VideoConversionService.m", 1149, @"Invalid parameter not satisfying: %@", @"exportSession" object file lineNumber description];
  }
  double v6 = [(VideoConversionTask *)self options];
  v7 = [v6 objectForKey:@"PAMediaConversionServiceOptionOutputFileTypeKey"];

  v8 = [v5 supportedFileTypes];
  v9 = v8;
  if (!v7 || ([v8 containsObject:v7] & 1) == 0)
  {
    uint64_t v10 = [v9 firstObject];

    v7 = (void *)v10;
    if (!v10)
    {
      [(VideoConversionTask *)self setStatus:2];
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      CFStringRef v16 = @"Unable to determine export output file type";
      v11 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      float v12 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:3 userInfo:v11];
      [(VideoConversionTask *)self setError:v12];

      [(VideoTranscodingTask *)self callCompletionHandler];
      v7 = 0;
    }
  }

  return v7;
}

- (id)exportPresetName
{
  v2 = [(VideoConversionTask *)self options];
  v3 = [v2 objectForKey:@"PAMediaConversionServiceOptionExportPresetNameKey"];

  if (!v3) {
    v3 = AVAssetExportPreset1280x720;
  }
  return v3;
}

- (id)metadataItemsFromOptionsAndInputAsset:(id)a3
{
  v4 = [a3 metadata];
  id v5 = [(VideoConversionTask *)self options];
  double v6 = objc_opt_new();
  v7 = [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataIncludeLocationKey"];
  unsigned int v8 = [v7 BOOLValue];

  uint64_t v9 = [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataLocationKey"];
  uint64_t v10 = (void *)v9;
  if (!v8 || v9)
  {
    [v6 addObject:AVMetadataIdentifierQuickTimeMetadataLocationISO6709];
    [v6 addObject:AVMetadataIdentifierQuickTimeUserDataLocationISO6709];
    [v6 addObject:AVMetadataIdentifier3GPUserDataLocation];
  }
  v11 = [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataIncludeDescriptionKey"];
  unsigned int v12 = [v11 BOOLValue];

  uint64_t v13 = [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataDescriptionKey"];
  double v14 = (void *)v13;
  if (!v12 || v13)
  {
    [v6 addObject:AVMetadataCommonIdentifierDescription];
    [v6 addObject:AVMetadataIdentifierQuickTimeMetadataDescription];
    [v6 addObject:AVMetadataIdentifierQuickTimeUserDataDescription];
    [v6 addObject:AVMetadataIdentifier3GPUserDataDescription];
  }
  v54 = v14;
  NSErrorUserInfoKey v15 = [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataIncludeAccessibilityDescriptionKey"];
  unsigned int v16 = [v15 BOOLValue];

  uint64_t v17 = [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataAccessibilityDescriptionKey"];
  v18 = (void *)v17;
  if (!v16 || v17) {
    [v6 addObject:AVMetadataCommonKeyAccessibilityDescription];
  }
  v56 = [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataKeywordsKey"];
  if (v56) {
    [v6 addObject:AVMetadataIdentifierQuickTimeMetadataKeywords];
  }
  v55 = [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataContentCreationDateKey"];
  if (v55)
  {
    [v6 addObject:AVMetadataCommonIdentifierCreationDate];
    [v6 addObject:AVMetadataIdentifierQuickTimeUserDataCreationDate];
    [v6 addObject:AVMetadataIdentifierQuickTimeMetadataCreationDate];
  }
  v52 = v18;
  uint64_t v19 = [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataTitleKey"];
  if (v19) {
    [v6 addObject:AVMetadataIdentifierQuickTimeMetadataTitle];
  }
  v20 = +[NSMutableArray array];
  v57 = (void *)v19;
  v53 = v10;
  if ([v4 count])
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    v51 = v4;
    id v21 = v4;
    id v22 = [v21 countByEnumeratingWithState:&v62 objects:v67 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v63;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v63 != v24) {
            objc_enumerationMutation(v21);
          }
          double v26 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          __int16 v27 = objc_msgSend(v26, "identifier", v51);
          unsigned __int8 v28 = [v6 containsObject:v27];

          if ((v28 & 1) == 0) {
            [v20 addObject:v26];
          }
        }
        id v23 = [v21 countByEnumeratingWithState:&v62 objects:v67 count:16];
      }
      while (v23);
    }

    v4 = v51;
    uint64_t v10 = v53;
    uint64_t v19 = (uint64_t)v57;
  }
  if (v10)
  {
    __int16 v29 = [v10 iso6709Notation];
    double v30 = +[AVMutableMetadataItem metadataItem];
    [v30 setKeySpace:AVMetadataKeySpaceCommon];
    [v30 setKey:AVMetadataCommonKeyLocation];
    [v30 setValue:v29];
    __int16 v31 = +[NSLocale currentLocale];
    [v30 setLocale:v31];

    [v20 addObject:v30];
    uint64_t v19 = (uint64_t)v57;
  }
  if (objc_msgSend(v56, "count", v51))
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v32 = v56;
    id v33 = [v32 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v59;
LABEL_32:
      uint64_t v36 = 0;
      while (1)
      {
        if (*(void *)v59 != v35) {
          objc_enumerationMutation(v32);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
        if (v34 == (id)++v36)
        {
          id v34 = [v32 countByEnumeratingWithState:&v58 objects:v66 count:16];
          if (v34) {
            goto LABEL_32;
          }
          goto LABEL_38;
        }
      }
    }
    else
    {
LABEL_38:

      id v32 = [v32 componentsJoinedByString:@","];
      v37 = +[AVMutableMetadataItem metadataItem];
      [v37 setIdentifier:AVMetadataIdentifierQuickTimeMetadataKeywords];
      [v37 setValue:v32];
      [v20 addObject:v37];
    }
    uint64_t v10 = v53;
    uint64_t v19 = (uint64_t)v57;
  }
  if (v55)
  {
    v38 = +[AVMutableMetadataItem metadataItem];
    [v38 setKeySpace:AVMetadataKeySpaceCommon];
    [v38 setKey:AVMetadataCommonKeyCreationDate];
    v39 = [(id)objc_opt_class() videoDateFormatter];
    v40 = [v5 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataContentCreationDateTimeZoneOffsetKey"];
    v41 = v40;
    if (v40)
    {
      v42 = +[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", [v40 integerValue]);
      [v39 setTimeZone:v42];
    }
    v43 = [v39 stringFromDate:v55];
    [v38 setValue:v43];
    [v20 addObject:v38];

    uint64_t v19 = (uint64_t)v57;
  }
  if (v19)
  {
    v44 = +[AVMutableMetadataItem metadataItem];
    [v44 setIdentifier:AVMetadataIdentifierQuickTimeMetadataTitle];
    [v44 setValue:v19];
    [v20 addObject:v44];
  }
  if (v54)
  {
    v45 = +[AVMutableMetadataItem metadataItem];
    [v45 setKeySpace:AVMetadataKeySpaceCommon];
    [v45 setKey:AVMetadataCommonKeyDescription];
    [v45 setValue:v54];
    [v20 addObject:v45];
  }
  if (v52)
  {
    v46 = +[AVMutableMetadataItem metadataItem];
    [v46 setKeySpace:AVMetadataKeySpaceCommon];
    [v46 setKey:AVMetadataCommonKeyAccessibilityDescription];
    [v46 setValue:v52];
    [v20 addObject:v46];
  }
  v47 = objc_opt_class();
  id v48 = [v20 copy];
  v49 = [v47 metadataItemsByApplyingSignatureMetadataFromOptions:v5 toMetadataItems:v48];

  return v49;
}

- (void)addOutputMetadataFromOptionsAndInputAsset:(id)a3 toExportSession:(id)a4
{
  id v11 = a4;
  double v6 = [(ExportSessionVideoTranscodingTask *)self metadataItemsFromOptionsAndInputAsset:a3];
  [v11 setMetadata:v6];

  v7 = [(VideoConversionTask *)self options];
  unsigned int v8 = [v7 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVMetadataIncludeLocationKey"];
  unsigned __int8 v9 = [v8 BOOLValue];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = +[AVMetadataItemFilter metadataItemFilterForSharing];
    [v11 setMetadataItemFilter:v10];
  }
}

- (id)exportSessionForInputAsset:(id)a3 presetName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)AVAssetExportSession) initWithAsset:v6 presetName:v7];

  if (!v8)
  {
    [(VideoConversionTask *)self setStatus:2];
    unsigned __int8 v9 = [(VideoConversionTask *)self identifier];
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    uint64_t v10 = +[NSString stringWithFormat:@"Unable to create export session for job %@", v9];
    uint64_t v19 = v10;
    id v11 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    unsigned int v12 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:3 userInfo:v11];
    [(VideoConversionTask *)self setError:v12];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543619;
      NSErrorUserInfoKey v15 = v9;
      __int16 v16 = 2113;
      id v17 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create export session for job %{public}@, asset %{private}@", buf, 0x16u);
    }
    [(VideoTranscodingTask *)self callCompletionHandler];
  }
  return v8;
}

- (void)performMetadataTrackExtractionConversion
{
  v3 = [(VideoConversionTask *)self identifier];
  v4 = [(VideoConversionTask *)self asset];
  id v5 = +[PFMediaUtilities tracksWithMediaType:AVMediaTypeMetadata forAsset:v4];

  if ([v5 count])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      id v6 = [v5 count];
      id v7 = [(VideoConversionTask *)self asset];
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Metadata track extraction job %{public}@: found %lu input metadata tracks in asset %@", buf, 0x20u);
    }
    unsigned __int8 v28 = v3;
    __int16 v29 = self;
    id v8 = objc_opt_new();
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    __int16 v27 = v5;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v34;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          NSErrorUserInfoKey v15 = [v8 addMutableTrackWithMediaType:AVMediaTypeMetadata preferredTrackID:0];
          long long v42 = 0u;
          memset(buf, 0, sizeof(buf));
          if (v14) {
            [v14 timeRange];
          }
          *(_OWORD *)v39 = *(_OWORD *)buf;
          *(_OWORD *)&v39[16] = *(_OWORD *)&buf[16];
          long long v40 = v42;
          long long v30 = *(_OWORD *)buf;
          uint64_t v31 = *(void *)&buf[16];
          id v32 = 0;
          unsigned __int8 v16 = [v15 insertTimeRange:v39 ofTrack:v14 atTime:&v30 error:&v32];
          id v17 = v32;
          NSErrorUserInfoKey v18 = v17;
          if ((v16 & 1) == 0)
          {
            [(VideoConversionTask *)v29 setStatus:2];
            v37[0] = NSLocalizedDescriptionKey;
            v3 = v28;
            uint64_t v19 = +[NSString stringWithFormat:@"Unable to create export session for job %@", v28];
            v37[1] = NSUnderlyingErrorKey;
            v38[0] = v19;
            v38[1] = v18;
            v20 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
            id v21 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:8 userInfo:v20];
            [(VideoConversionTask *)v29 setError:v21];

            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              double v26 = [(VideoConversionTask *)v29 asset];
              *(_DWORD *)v39 = 138544130;
              *(void *)&v39[4] = v28;
              *(_WORD *)&v39[12] = 2114;
              *(void *)&v39[14] = v14;
              *(_WORD *)&v39[22] = 2112;
              *(void *)&v39[24] = v26;
              LOWORD(v40) = 2114;
              *(void *)((char *)&v40 + 2) = v18;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Metadata track extraction job %{public}@: Unable to insert metadata track %{public}@ of input asset %@: %{public}@", v39, 0x2Au);
            }
            [(VideoTranscodingTask *)v29 callCompletionHandler];

            goto LABEL_21;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v33 objects:v43 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v9 = [(ExportSessionVideoTranscodingTask *)v29 exportSessionForInputAsset:v8 presetName:AVAssetExportPresetPassthrough];
    if (v9)
    {
      NSErrorUserInfoKey v15 = [(ExportSessionVideoTranscodingTask *)v29 outputFileTypeForExportSession:v9];
      if (v15)
      {
        [(ExportSessionVideoTranscodingTask *)v29 configureOutputForExportSession:v9 outputFileType:v15];
        [(ExportSessionVideoTranscodingTask *)v29 startExportSession:v9];
      }
      v3 = v28;
LABEL_21:
      id v5 = v27;
    }
    else
    {
      id v5 = v27;
      v3 = v28;
    }
  }
  else
  {
    [(VideoConversionTask *)self setStatus:2];
    NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
    id v22 = +[NSString stringWithFormat:@"Metadata track extraction for job %@ failed because the input video has no metadata tracks", v3];
    v45 = v22;
    id v23 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    uint64_t v24 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:7 userInfo:v23];
    [(VideoConversionTask *)self setError:v24];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v25 = [(VideoConversionTask *)self asset];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v25;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Metadata track extraction job %{public}@: input asset has no metadata tracks: %@", buf, 0x16u);
    }
    [(VideoTranscodingTask *)self callCompletionHandler];
  }
}

- (void)performPassthroughConversion
{
  v3 = [(VideoConversionTask *)self asset];
  uint64_t v6 = [(ExportSessionVideoTranscodingTask *)self exportSessionForInputAsset:v3 presetName:AVAssetExportPresetPassthrough];

  if (v6)
  {
    v4 = [(ExportSessionVideoTranscodingTask *)self outputFileTypeForExportSession:v6];
    if (v4)
    {
      id v5 = [(VideoConversionTask *)self asset];
      [(ExportSessionVideoTranscodingTask *)self addOutputMetadataFromOptionsAndInputAsset:v5 toExportSession:v6];

      [(ExportSessionVideoTranscodingTask *)self configureOutputForExportSession:v6 outputFileType:v4];
      [(ExportSessionVideoTranscodingTask *)self startExportSession:v6];
    }
  }
  _objc_release_x1();
}

- (void)cancelTranscode
{
  v4 = [(ExportSessionVideoTranscodingTask *)self exportSession];

  if (!v4)
  {
    id v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"VideoConversionService.m" lineNumber:909 description:@"Unexpected missing video export session with job in running state"];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(VideoConversionTask *)self identifier];
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cancelling export session conversion task %{public}@", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v6 = [(ExportSessionVideoTranscodingTask *)self exportSession];
  [v6 cancelExport];
}

- (double)currentFractionCompleted
{
  v3 = [(ExportSessionVideoTranscodingTask *)self exportSession];
  [v3 progress];
  double v5 = v4;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(VideoConversionTask *)self identifier];
    id v7 = [(ExportSessionVideoTranscodingTask *)self exportSession];
    int v9 = 138543874;
    id v10 = v6;
    __int16 v11 = 2048;
    id v12 = [v7 status];
    __int16 v13 = 2048;
    double v14 = v5 * 100.0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Export session export status for conversion task %{public}@: %ld, progress %.1f", (uint8_t *)&v9, 0x20u);
  }
  return v5;
}

- (BOOL)hasProgress
{
  v2 = [(ExportSessionVideoTranscodingTask *)self exportSession];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)exportSessionCompletionHandler
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001EB30;
  v4[3] = &unk_1000415B8;
  v4[4] = self;
  v2 = objc_retainBlock(v4);
  return v2;
}

- (void)startExportSession:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001EF84;
  v4[3] = &unk_1000416A0;
  double v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(VideoTranscodingTask *)v5 transitionToRunningStateAndConditionallyRunBlock:v4];
}

- (void)configureOutputForExportSession:(id)a3 outputFileType:(id)a4
{
  id v6 = a3;
  [v6 setOutputFileType:a4];
  id v7 = [(VideoConversionTask *)self outputMainResourceURL];
  [v6 setOutputURL:v7];
}

- (void)performExport
{
  id v3 = [(VideoConversionTask *)self asset];
  if (!v3)
  {
    [(VideoConversionTask *)self setStatus:2];
    [(VideoTranscodingTask *)self callCompletionHandler];
    goto LABEL_32;
  }
  if (![(VideoConversionTask *)self isMetadataTrackExtractionConversion])
  {
    if ([(VideoConversionTask *)self isPassthroughConversion])
    {
      [(ExportSessionVideoTranscodingTask *)self performPassthroughConversion];
      goto LABEL_32;
    }
    float v4 = [(ExportSessionVideoTranscodingTask *)self exportPresetName];
    if (!v4)
    {
      NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
      CFStringRef v54 = @"Unable to determine export preset";
      __int16 v13 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      double v14 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:3 userInfo:v13];
      [(VideoConversionTask *)self setError:v14];

      [(VideoConversionTask *)self setStatus:2];
      [(VideoTranscodingTask *)self callCompletionHandler];
LABEL_31:

      goto LABEL_32;
    }
    double v5 = +[PFMediaUtilities tracksWithMediaType:AVMediaTypeVideo forAsset:v3];
    id v6 = [v5 firstObject];

    if (!v6)
    {
      [(VideoConversionTask *)self setStatus:2];
      NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
      CFStringRef v52 = @"Unable to get input asset video track";
      NSErrorUserInfoKey v15 = +[NSDictionary dictionaryWithObjects:&v52 forKeys:&v51 count:1];
      unsigned __int8 v16 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:3 userInfo:v15];
      [(VideoConversionTask *)self setError:v16];

      [(VideoTranscodingTask *)self callCompletionHandler];
LABEL_30:

      goto LABEL_31;
    }
    uint64_t v41 = 0;
    long long v42 = &v41;
    uint64_t v43 = 0x3032000000;
    NSErrorUserInfoKey v44 = sub_10001BDF4;
    v45 = sub_10001BE04;
    id v7 = v3;
    id v46 = v7;
    uint64_t v35 = 0;
    long long v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = sub_10001BDF4;
    v39 = sub_10001BE04;
    id v40 = 0;
    if ([(VideoTranscodingTask *)self hasSlowMotionAdjustments])
    {
      int v8 = [(VideoConversionTask *)self options];
      int v9 = [v8 objectForKeyedSubscript:@"PAMediaConversionServiceOptionVideoAdjustmentsPropertyListKey"];

      id v10 = [objc_alloc((Class)PFVideoAdjustments) initWithPropertyListDictionary:v9];
      if (!v10)
      {
        id v30 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          id v32 = [(VideoConversionTask *)self identifier];
          *(_DWORD *)buf = 138543618;
          id v48 = v32;
          __int16 v49 = 2114;
          v50 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to create adjustments for conversion task %{public}@ from property list %{public}@", buf, 0x16u);
        }
        uint64_t v31 = +[NSError errorWithDomain:@"PAMediaConversionServiceErrorDomain" code:6 userInfo:0];
        [(VideoConversionTask *)self setError:v31];

        [(VideoTranscodingTask *)self callCompletionHandler];
        goto LABEL_28;
      }
      id v11 = objc_alloc((Class)PFVideoAVObjectBuilder);
      id v12 = [v11 initWithVideoAsset:v42[5] videoAdjustments:v10];
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10001F6E8;
      v34[3] = &unk_100041678;
      v34[4] = self;
      v34[5] = &v35;
      v34[6] = &v41;
      [v12 requestExportSessionWithExportPreset:v4 resultHandler:v34];
    }
    else
    {
      uint64_t v17 = [(ExportSessionVideoTranscodingTask *)self exportSessionForInputAsset:v42[5] presetName:v4];
      int v9 = (void *)v36[5];
      v36[5] = v17;
    }

    if (!v36[5])
    {
LABEL_29:
      _Block_object_dispose(&v35, 8);

      _Block_object_dispose(&v41, 8);
      goto LABEL_30;
    }
    NSErrorUserInfoKey v18 = objc_opt_class();
    uint64_t v19 = [(VideoConversionTask *)self options];
    v20 = (void *)v42[5];
    if (v20) {
      [v20 duration];
    }
    else {
      memset(&v33, 0, sizeof(v33));
    }
    double Seconds = CMTimeGetSeconds(&v33);
    id v22 = [(VideoConversionTask *)self identifier];
    id v23 = [v18 shouldMaximizeVideoConversionPowerEfficiencyForOptions:v19 inputAssetDuration:v22 taskIdentifier:Seconds];
    [(id)v36[5] setMaximizePowerEfficiency:v23];

    int v9 = [(ExportSessionVideoTranscodingTask *)self outputFileTypeForExportSession:v36[5]];
    if (v9)
    {
      uint64_t v24 = [(VideoConversionTask *)self options];
      __int16 v25 = [v24 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAudioTrackGroupHandlingKey"];

      if (v25)
      {
        id v26 = [v25 integerValue];
        [(id)v36[5] setAudioTrackGroupHandling:v26];
      }
      __int16 v27 = [(VideoConversionTask *)self options];
      unsigned __int8 v28 = [v27 objectForKeyedSubscript:@"PAMediaConversionServiceOptionAVIncludeMetadataKey"];
      unsigned int v29 = [v28 BOOLValue];

      if (v29) {
        [(ExportSessionVideoTranscodingTask *)self addOutputMetadataFromOptionsAndInputAsset:v7 toExportSession:v36[5]];
      }
      [(id)v36[5] setShouldOptimizeForNetworkUse:1];
      [(id)v36[5] setAudioTimePitchAlgorithm:AVAudioTimePitchAlgorithmVarispeed];
      [(ExportSessionVideoTranscodingTask *)self configureOutputForExportSession:v36[5] outputFileType:v9];
      [(ExportSessionVideoTranscodingTask *)self startExportSession:v36[5]];
    }
LABEL_28:

    goto LABEL_29;
  }
  [(ExportSessionVideoTranscodingTask *)self performMetadataTrackExtractionConversion];
LABEL_32:
}

@end