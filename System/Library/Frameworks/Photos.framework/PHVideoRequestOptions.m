@interface PHVideoRequestOptions
- ($AC64C642040120CEEAD84DEEACA9A5CE)timeRange;
- (BOOL)hasValidTimeRange;
- (BOOL)includeTimeRangeMapper;
- (BOOL)isCurrentVersion;
- (BOOL)isMediumHighQualityAllowed;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isStreamingAllowed;
- (BOOL)isSynchronous;
- (BOOL)isValidConfigurationWithError:(id *)a3;
- (BOOL)isVideoComplementAllowed;
- (BOOL)liveRenderAndOnDemandRenderVideoConcurrently;
- (BOOL)liveRenderVideoIfNeeded;
- (BOOL)restrictToEncryptedStream;
- (BOOL)restrictToPlayableOnCurrentDevice;
- (BOOL)restrictToStreamable;
- (CGSize)targetSize;
- (NSString)description;
- (OS_dispatch_queue)resultHandlerQueue;
- (PHAssetVideoProgressHandler)progressHandler;
- (PHVideoRequestOptions)init;
- (PHVideoRequestOptionsDeliveryMode)deliveryMode;
- (PHVideoRequestOptionsVersion)version;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)contentMode;
- (int64_t)downloadIntent;
- (int64_t)downloadPriority;
- (int64_t)streamingVideoIntent;
- (void)setAllowMediumHighQuality:(BOOL)a3;
- (void)setContentMode:(int64_t)a3;
- (void)setDeliveryMode:(PHVideoRequestOptionsDeliveryMode)deliveryMode;
- (void)setDownloadIntent:(int64_t)a3;
- (void)setDownloadPriority:(int64_t)a3;
- (void)setIncludeTimeRangeMapper:(BOOL)a3;
- (void)setLiveRenderAndOnDemandRenderVideoConcurrently:(BOOL)a3;
- (void)setLiveRenderVideoIfNeeded:(BOOL)a3;
- (void)setNetworkAccessAllowed:(BOOL)networkAccessAllowed;
- (void)setProgressHandler:(PHAssetVideoProgressHandler)progressHandler;
- (void)setRestrictToEncryptedStream:(BOOL)a3;
- (void)setRestrictToPlayableOnCurrentDevice:(BOOL)a3;
- (void)setRestrictToStreamable:(BOOL)a3;
- (void)setResultHandlerQueue:(id)a3;
- (void)setStreamingAllowed:(BOOL)a3;
- (void)setStreamingVideoIntent:(int64_t)a3;
- (void)setTargetSize:(CGSize)a3;
- (void)setTimeRange:(id *)a3;
- (void)setVersion:(PHVideoRequestOptionsVersion)version;
- (void)setVideoComplementAllowed:(BOOL)a3;
@end

@implementation PHVideoRequestOptions

- (BOOL)isCurrentVersion
{
  return [(PHVideoRequestOptions *)self version] == PHVideoRequestOptionsVersionCurrent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);

  objc_storeStrong(&self->_progressHandler, 0);
}

- (void)setIncludeTimeRangeMapper:(BOOL)a3
{
  self->_includeTimeRangeMapper = a3;
}

- (BOOL)includeTimeRangeMapper
{
  return self->_includeTimeRangeMapper;
}

- (void)setTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_timeRange.start.epoch = v4;
  *(_OWORD *)&self->_timeRange.start.value = v3;
}

- ($AC64C642040120CEEAD84DEEACA9A5CE)timeRange
{
  long long v3 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var3;
  return self;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (void)setResultHandlerQueue:(id)a3
{
}

- (OS_dispatch_queue)resultHandlerQueue
{
  return self->_resultHandlerQueue;
}

- (void)setLiveRenderAndOnDemandRenderVideoConcurrently:(BOOL)a3
{
  self->_liveRenderAndOnDemandRenderVideoConcurrently = a3;
}

- (BOOL)liveRenderAndOnDemandRenderVideoConcurrently
{
  return self->_liveRenderAndOnDemandRenderVideoConcurrently;
}

- (void)setLiveRenderVideoIfNeeded:(BOOL)a3
{
  self->_liveRenderVideoIfNeeded = a3;
}

- (BOOL)liveRenderVideoIfNeeded
{
  return self->_liveRenderVideoIfNeeded;
}

- (void)setRestrictToEncryptedStream:(BOOL)a3
{
  self->_restrictToEncryptedStream = a3;
}

- (BOOL)restrictToEncryptedStream
{
  return self->_restrictToEncryptedStream;
}

- (BOOL)restrictToStreamable
{
  return self->_restrictToStreamable;
}

- (void)setRestrictToPlayableOnCurrentDevice:(BOOL)a3
{
  self->_restrictToPlayableOnCurrentDevice = a3;
}

- (BOOL)restrictToPlayableOnCurrentDevice
{
  return self->_restrictToPlayableOnCurrentDevice;
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (void)setTargetSize:(CGSize)a3
{
  self->_targetSize = a3;
}

- (CGSize)targetSize
{
  double width = self->_targetSize.width;
  double height = self->_targetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setAllowMediumHighQuality:(BOOL)a3
{
  self->_allowMediumHighQuality = a3;
}

- (BOOL)isMediumHighQualityAllowed
{
  return self->_allowMediumHighQuality;
}

- (void)setVideoComplementAllowed:(BOOL)a3
{
  self->_videoComplementAllowed = a3;
}

- (BOOL)isVideoComplementAllowed
{
  return self->_videoComplementAllowed;
}

- (void)setStreamingVideoIntent:(int64_t)a3
{
  self->_streamingVideoIntent = a3;
}

- (int64_t)streamingVideoIntent
{
  return self->_streamingVideoIntent;
}

- (void)setStreamingAllowed:(BOOL)a3
{
  self->_streamingAllowed = a3;
}

- (BOOL)isStreamingAllowed
{
  return self->_streamingAllowed;
}

- (void)setProgressHandler:(PHAssetVideoProgressHandler)progressHandler
{
}

- (PHAssetVideoProgressHandler)progressHandler
{
  return self->_progressHandler;
}

- (void)setDeliveryMode:(PHVideoRequestOptionsDeliveryMode)deliveryMode
{
  self->_deliveryMode = deliveryMode;
}

- (PHVideoRequestOptionsDeliveryMode)deliveryMode
{
  return self->_deliveryMode;
}

- (void)setVersion:(PHVideoRequestOptionsVersion)version
{
  self->_version = version;
}

- (PHVideoRequestOptionsVersion)version
{
  return self->_version;
}

- (void)setNetworkAccessAllowed:(BOOL)networkAccessAllowed
{
  self->_networkAccessAllowed = networkAccessAllowed;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (BOOL)hasValidTimeRange
{
  [(PHVideoRequestOptions *)self timeRange];
  if ((v7 & 1) == 0) {
    return 0;
  }
  [(PHVideoRequestOptions *)self timeRange];
  if ((v6 & 1) == 0) {
    return 0;
  }
  [(PHVideoRequestOptions *)self timeRange];
  if (v5) {
    return 0;
  }
  [(PHVideoRequestOptions *)self timeRange];
  return v4 >= 0;
}

- (NSString)description
{
  long long v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendString:@"version="];
  if ([(PHVideoRequestOptions *)self version] == PHVideoRequestOptionsVersionOriginal)
  {
    uint64_t v4 = @"orig";
LABEL_3:
    [v3 appendString:v4];
    goto LABEL_5;
  }
  if ([(PHVideoRequestOptions *)self version] == PHVideoRequestOptionsVersionCurrent)
  {
    [v3 appendString:@"curr"];
    if ([(PHVideoRequestOptions *)self deliveryMode] == PHVideoRequestOptionsDeliveryModeAutomatic)
    {
      uint64_t v4 = @"+auto";
      goto LABEL_3;
    }
    if ([(PHVideoRequestOptions *)self deliveryMode] == PHVideoRequestOptionsDeliveryModeHighQualityFormat)
    {
      uint64_t v4 = @"+high";
      goto LABEL_3;
    }
    if ([(PHVideoRequestOptions *)self deliveryMode] == PHVideoRequestOptionsDeliveryModeMediumQualityFormat)
    {
      uint64_t v4 = @"+med";
      goto LABEL_3;
    }
    if ([(PHVideoRequestOptions *)self deliveryMode] == PHVideoRequestOptionsDeliveryModeFastFormat)
    {
      uint64_t v4 = @"+fst";
      goto LABEL_3;
    }
    if ([(PHVideoRequestOptions *)self deliveryMode] == 4)
    {
      uint64_t v4 = @"+large";
      goto LABEL_3;
    }
  }
LABEL_5:
  if ([(PHVideoRequestOptions *)self isMediumHighQualityAllowed]) {
    [v3 appendString:@"+HQ"];
  }
  if ([(PHVideoRequestOptions *)self isStreamingAllowed]) {
    [v3 appendString:@"+stream"];
  }
  unint64_t v5 = [(PHVideoRequestOptions *)self streamingVideoIntent];
  if (v5)
  {
    char v6 = _PHStreamingVideoIntentName(v5);
    [v3 appendFormat:@"+streamingIntent:%@", v6];
  }
  unint64_t v7 = [(PHVideoRequestOptions *)self downloadIntent];
  if (v7)
  {
    v8 = _PHDownloadIntentName(v7);
    v9 = _PHDownloadPriorityName([(PHVideoRequestOptions *)self downloadPriority]);
    [v3 appendFormat:@"+downloadIntent:%@+downloadPriority:%@", v8, v9];
  }
  if ([(PHVideoRequestOptions *)self isNetworkAccessAllowed]) {
    [v3 appendString:@"+network"];
  }
  if ([(PHVideoRequestOptions *)self hasValidTimeRange])
  {
    CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    [(PHVideoRequestOptions *)self timeRange];
    v11 = (__CFString *)CMTimeRangeCopyDescription(v10, &range);
    [v3 appendString:@"+timeRange="];
    [v3 appendString:v11];
  }
  if ([(PHVideoRequestOptions *)self includeTimeRangeMapper]) {
    [v3 appendString:@"+timeRangeMapper"];
  }
  if ([(PHVideoRequestOptions *)self restrictToStreamable]) {
    [v3 appendString:@"+streamOnly"];
  }
  if ([(PHVideoRequestOptions *)self restrictToEncryptedStream]) {
    [v3 appendString:@"+encrypted"];
  }

  return (NSString *)v3;
}

- (void)setRestrictToStreamable:(BOOL)a3
{
  self->_restrictToStreamable = a3;
  if (a3)
  {
    [(PHVideoRequestOptions *)self setStreamingAllowed:1];
    [(PHVideoRequestOptions *)self setNetworkAccessAllowed:1];
  }
}

- (BOOL)isValidConfigurationWithError:(id *)a3
{
  if ([(PHVideoRequestOptions *)self restrictToStreamable])
  {
    if ([(PHVideoRequestOptions *)self isNetworkAccessAllowed])
    {
      if ([(PHVideoRequestOptions *)self isStreamingAllowed]) {
        goto LABEL_4;
      }
      v8 = @"Restricting to streamable assets with streamable disallowed";
    }
    else
    {
      v8 = @"Restricting to streamable assets with network access disallowed";
    }
    unint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_errorWithCode:localizedDescription:", 3306, v8);
    BOOL v6 = 0;
    if (!a3) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_4:
  unint64_t v5 = 0;
  BOOL v6 = 1;
  if (a3) {
LABEL_5:
  }
    *a3 = v5;
LABEL_6:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setVersion:", -[PHVideoRequestOptions version](self, "version"));
  objc_msgSend(v4, "setDeliveryMode:", -[PHVideoRequestOptions deliveryMode](self, "deliveryMode"));
  objc_msgSend(v4, "setNetworkAccessAllowed:", -[PHVideoRequestOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  objc_msgSend(v4, "setStreamingAllowed:", -[PHVideoRequestOptions isStreamingAllowed](self, "isStreamingAllowed"));
  objc_msgSend(v4, "setStreamingVideoIntent:", -[PHVideoRequestOptions streamingVideoIntent](self, "streamingVideoIntent"));
  objc_msgSend(v4, "setVideoComplementAllowed:", -[PHVideoRequestOptions isVideoComplementAllowed](self, "isVideoComplementAllowed"));
  unint64_t v5 = [(PHVideoRequestOptions *)self progressHandler];
  [v4 setProgressHandler:v5];

  [(PHVideoRequestOptions *)self targetSize];
  objc_msgSend(v4, "setTargetSize:");
  objc_msgSend(v4, "setContentMode:", -[PHVideoRequestOptions contentMode](self, "contentMode"));
  objc_msgSend(v4, "setRestrictToPlayableOnCurrentDevice:", -[PHVideoRequestOptions restrictToPlayableOnCurrentDevice](self, "restrictToPlayableOnCurrentDevice"));
  objc_msgSend(v4, "setRestrictToStreamable:", -[PHVideoRequestOptions restrictToStreamable](self, "restrictToStreamable"));
  objc_msgSend(v4, "setRestrictToEncryptedStream:", -[PHVideoRequestOptions restrictToEncryptedStream](self, "restrictToEncryptedStream"));
  objc_msgSend(v4, "setAllowMediumHighQuality:", -[PHVideoRequestOptions isMediumHighQualityAllowed](self, "isMediumHighQualityAllowed"));
  BOOL v6 = [(PHVideoRequestOptions *)self resultHandlerQueue];
  [v4 setResultHandlerQueue:v6];

  objc_msgSend(v4, "setLiveRenderVideoIfNeeded:", -[PHVideoRequestOptions liveRenderVideoIfNeeded](self, "liveRenderVideoIfNeeded"));
  objc_msgSend(v4, "setLiveRenderAndOnDemandRenderVideoConcurrently:", -[PHVideoRequestOptions liveRenderAndOnDemandRenderVideoConcurrently](self, "liveRenderAndOnDemandRenderVideoConcurrently"));
  objc_msgSend(v4, "setDownloadIntent:", -[PHVideoRequestOptions downloadIntent](self, "downloadIntent"));
  objc_msgSend(v4, "setDownloadPriority:", -[PHVideoRequestOptions downloadPriority](self, "downloadPriority"));
  [(PHVideoRequestOptions *)self timeRange];
  [v4 setTimeRange:&v8];
  objc_msgSend(v4, "setIncludeTimeRangeMapper:", -[PHVideoRequestOptions includeTimeRangeMapper](self, "includeTimeRangeMapper"));
  return v4;
}

- (PHVideoRequestOptions)init
{
  v6.receiver = self;
  v6.super_class = (Class)PHVideoRequestOptions;
  v2 = [(PHVideoRequestOptions *)&v6 init];
  long long v3 = v2;
  if (v2)
  {
    v2->_includeTimeRangeMapper = 0;
    *(_WORD *)&v2->_networkAccessAllowed = 0;
    v2->_allowMediumHighQuality = 0;
    v2->_version = 0;
    v2->_deliveryMode = 0;
    id progressHandler = v2->_progressHandler;
    v2->_id progressHandler = 0;

    *(_WORD *)&v3->_restrictToPlayableOnCurrentDevice = 1;
    v3->_restrictToEncryptedStream = 0;
  }
  return v3;
}

- (BOOL)isSynchronous
{
  return 0;
}

@end