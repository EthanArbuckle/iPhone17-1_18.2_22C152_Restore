@interface PHVideoRequestBehaviorSpec
+ (BOOL)supportsSecureCoding;
- ($AC64C642040120CEEAD84DEEACA9A5CE)timeRange;
- (BOOL)hasValidTimeRange;
- (BOOL)isExplicitUserAction;
- (BOOL)isMediumHighQualityAllowed;
- (BOOL)isNetworkAccessAllowed;
- (BOOL)isStreamingAllowed;
- (BOOL)isVideoComplementAllowed;
- (BOOL)restrictToEncryptedStream;
- (BOOL)restrictToPlayableOnCurrentDevice;
- (BOOL)restrictToStreamable;
- (BOOL)streamingIntentAllowsFallbackToDownload;
- (PHVideoRequestBehaviorSpec)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)shortDescription;
- (int64_t)deliveryMode;
- (int64_t)downloadIntent;
- (int64_t)downloadPriority;
- (int64_t)streamingVideoIntent;
- (int64_t)version;
- (int64_t)videoDeliveryMode;
- (int64_t)videoVersion;
- (void)encodeWithCoder:(id)a3;
- (void)setDeliveryMode:(int64_t)a3;
- (void)setDownloadIntent:(int64_t)a3;
- (void)setDownloadPriority:(int64_t)a3;
- (void)setMediumHighQualityAllowed:(BOOL)a3;
- (void)setNetworkAccessAllowed:(BOOL)a3;
- (void)setRestrictToEncryptedStream:(BOOL)a3;
- (void)setRestrictToPlayableOnCurrentDevice:(BOOL)a3;
- (void)setRestrictToStreamable:(BOOL)a3;
- (void)setStreamingAllowed:(BOOL)a3;
- (void)setStreamingVideoIntent:(int64_t)a3;
- (void)setTimeRange:(id *)a3;
- (void)setVersion:(int64_t)a3;
- (void)setVideoComplementAllowed:(BOOL)a3;
@end

@implementation PHVideoRequestBehaviorSpec

- (void)setRestrictToEncryptedStream:(BOOL)a3
{
  self->_restrictToEncryptedStream = a3;
}

- (BOOL)restrictToEncryptedStream
{
  return self->_restrictToEncryptedStream;
}

- (void)setRestrictToStreamable:(BOOL)a3
{
  self->_restrictToStreamable = a3;
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

- (void)setMediumHighQualityAllowed:(BOOL)a3
{
  self->_mediumHighQualityAllowed = a3;
}

- (BOOL)isMediumHighQualityAllowed
{
  return self->_mediumHighQualityAllowed;
}

- (void)setVideoComplementAllowed:(BOOL)a3
{
  self->_videoComplementAllowed = a3;
}

- (BOOL)isVideoComplementAllowed
{
  return self->_videoComplementAllowed;
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
  long long v3 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var3;
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

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setDeliveryMode:(int64_t)a3
{
  self->_deliveryMode = a3;
}

- (int64_t)deliveryMode
{
  return self->_deliveryMode;
}

- (BOOL)isExplicitUserAction
{
  return (self->_downloadIntent < 0xDuLL) & (0x238u >> self->_downloadIntent);
}

- (BOOL)streamingIntentAllowsFallbackToDownload
{
  return (unint64_t)(self->_streamingVideoIntent - 7) < 0xFFFFFFFFFFFFFFFBLL;
}

- (BOOL)hasValidTimeRange
{
  [(PHVideoRequestBehaviorSpec *)self timeRange];
  if ((v7 & 1) == 0) {
    return 0;
  }
  [(PHVideoRequestBehaviorSpec *)self timeRange];
  if ((v6 & 1) == 0) {
    return 0;
  }
  [(PHVideoRequestBehaviorSpec *)self timeRange];
  if (v5) {
    return 0;
  }
  [(PHVideoRequestBehaviorSpec *)self timeRange];
  return v4 >= 0;
}

- (PHVideoRequestBehaviorSpec)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PHVideoRequestBehaviorSpec;
  uint64_t v5 = [(PHVideoRequestBehaviorSpec *)&v10 init];
  if (v5)
  {
    *((void *)v5 + 2) = [v4 decodeInt64ForKey:@"deliveryMode"];
    *((void *)v5 + 3) = [v4 decodeInt64ForKey:@"version"];
    v5[8] = [v4 decodeBoolForKey:@"networkAccessAllowed"];
    v5[9] = [v4 decodeBoolForKey:@"streamingAllowed"];
    *((void *)v5 + 4) = [v4 decodeInt64ForKey:@"streamingVideoIntent"];
    v5[10] = [v4 decodeBoolForKey:@"videoComplementAllowed"];
    v5[11] = [v4 decodeBoolForKey:@"mediumHighQualityAllowed"];
    v5[12] = [v4 decodeBoolForKey:@"restrictToPlayableOnCurrentDevice"];
    v5[13] = [v4 decodeBoolForKey:@"restrictToStreamable"];
    v5[14] = [v4 decodeBoolForKey:@"restrictToEncryptedStream"];
    *((void *)v5 + 5) = [v4 decodeIntegerForKey:@"downloadIntent"];
    *((void *)v5 + 6) = [v4 decodeIntegerForKey:@"downloadPriority"];
    if (v4)
    {
      [v4 decodeCMTimeRangeForKey:@"timeRange"];
    }
    else
    {
      long long v8 = 0u;
      long long v9 = 0u;
      long long v7 = 0u;
    }
    *(_OWORD *)(v5 + 56) = v7;
    *(_OWORD *)(v5 + 72) = v8;
    *(_OWORD *)(v5 + 88) = v9;
  }

  return (PHVideoRequestBehaviorSpec *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t deliveryMode = self->_deliveryMode;
  id v5 = a3;
  [v5 encodeInt64:deliveryMode forKey:@"deliveryMode"];
  [v5 encodeInt64:self->_version forKey:@"version"];
  [v5 encodeBool:self->_networkAccessAllowed forKey:@"networkAccessAllowed"];
  [v5 encodeBool:self->_streamingAllowed forKey:@"streamingAllowed"];
  [v5 encodeInt64:self->_streamingVideoIntent forKey:@"streamingVideoIntent"];
  [v5 encodeBool:self->_videoComplementAllowed forKey:@"videoComplementAllowed"];
  [v5 encodeBool:self->_mediumHighQualityAllowed forKey:@"mediumHighQualityAllowed"];
  [v5 encodeBool:self->_restrictToPlayableOnCurrentDevice forKey:@"restrictToPlayableOnCurrentDevice"];
  [v5 encodeBool:self->_restrictToStreamable forKey:@"restrictToStreamable"];
  [v5 encodeBool:self->_restrictToEncryptedStream forKey:@"restrictToEncryptedStream"];
  [v5 encodeInteger:self->_downloadIntent forKey:@"downloadIntent"];
  [v5 encodeInteger:self->_downloadPriority forKey:@"downloadPriority"];
  long long v6 = *(_OWORD *)&self->_timeRange.start.epoch;
  v7[0] = *(_OWORD *)&self->_timeRange.start.value;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  [v5 encodeCMTimeRange:v7 forKey:@"timeRange"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PHVideoRequestBehaviorSpec);
  [(PHVideoRequestBehaviorSpec *)v4 setDeliveryMode:[(PHVideoRequestBehaviorSpec *)self deliveryMode]];
  [(PHVideoRequestBehaviorSpec *)v4 setVersion:[(PHVideoRequestBehaviorSpec *)self version]];
  [(PHVideoRequestBehaviorSpec *)v4 setNetworkAccessAllowed:[(PHVideoRequestBehaviorSpec *)self isNetworkAccessAllowed]];
  [(PHVideoRequestBehaviorSpec *)v4 setStreamingAllowed:[(PHVideoRequestBehaviorSpec *)self isStreamingAllowed]];
  [(PHVideoRequestBehaviorSpec *)v4 setStreamingVideoIntent:[(PHVideoRequestBehaviorSpec *)self streamingVideoIntent]];
  [(PHVideoRequestBehaviorSpec *)v4 setVideoComplementAllowed:[(PHVideoRequestBehaviorSpec *)self isVideoComplementAllowed]];
  [(PHVideoRequestBehaviorSpec *)v4 setMediumHighQualityAllowed:[(PHVideoRequestBehaviorSpec *)self isMediumHighQualityAllowed]];
  [(PHVideoRequestBehaviorSpec *)v4 setRestrictToPlayableOnCurrentDevice:[(PHVideoRequestBehaviorSpec *)self restrictToPlayableOnCurrentDevice]];
  [(PHVideoRequestBehaviorSpec *)v4 setRestrictToStreamable:[(PHVideoRequestBehaviorSpec *)self restrictToStreamable]];
  [(PHVideoRequestBehaviorSpec *)v4 setRestrictToEncryptedStream:[(PHVideoRequestBehaviorSpec *)self restrictToEncryptedStream]];
  [(PHVideoRequestBehaviorSpec *)v4 setDownloadIntent:[(PHVideoRequestBehaviorSpec *)self downloadIntent]];
  [(PHVideoRequestBehaviorSpec *)v4 setDownloadPriority:[(PHVideoRequestBehaviorSpec *)self downloadPriority]];
  [(PHVideoRequestBehaviorSpec *)self timeRange];
  v6[0] = v6[3];
  v6[1] = v6[4];
  v6[2] = v6[5];
  [(PHVideoRequestBehaviorSpec *)v4 setTimeRange:v6];
  return v4;
}

- (int64_t)videoVersion
{
  int64_t version = self->_version;
  if (version == 8) {
    return 2;
  }
  else {
    return version == 1;
  }
}

- (int64_t)videoDeliveryMode
{
  unint64_t deliveryMode = self->_deliveryMode;
  if (deliveryMode > 4) {
    return 2;
  }
  else {
    return qword_19B2CCD38[deliveryMode];
  }
}

- (id)shortDescription
{
  if (self->_networkAccessAllowed) {
    long long v3 = @"Y";
  }
  else {
    long long v3 = @"N";
  }
  v22 = v3;
  v23 = NSString;
  if (self->_streamingAllowed) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  v21 = v4;
  id v5 = _PHStreamingVideoIntentName(self->_streamingVideoIntent);
  long long v6 = _PHDownloadIntentName(self->_downloadIntent);
  long long v7 = _PHDownloadPriorityName(self->_downloadPriority);
  int64_t version = self->_version;
  switch(version)
  {
    case 8:
      long long v9 = @"penult";
      goto LABEL_13;
    case 1:
      long long v9 = @"orig";
      goto LABEL_13;
    case 0:
      long long v9 = @"curr";
LABEL_13:
      v20 = v9;
      goto LABEL_15;
  }
  v20 = 0;
LABEL_15:
  if (self->_restrictToPlayableOnCurrentDevice) {
    objc_super v10 = @"Y";
  }
  else {
    objc_super v10 = @"N";
  }
  v11 = @"auto";
  switch(self->_deliveryMode)
  {
    case 0:
      break;
    case 1:
      v11 = @"high";
      break;
    case 2:
      if (self->_mediumHighQualityAllowed) {
        v12 = @"med-hi";
      }
      else {
        v12 = @"med";
      }
      v11 = v12;
      break;
    case 3:
      v11 = @"fast";
      break;
    case 4:
      v11 = @"large";
      break;
    default:
      v11 = @"unknown";
      break;
  }
  BOOL v13 = [(PHVideoRequestBehaviorSpec *)self hasValidTimeRange];
  if (v13)
  {
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    [(PHVideoRequestBehaviorSpec *)self timeRange];
    v15 = (__CFString *)CMTimeRangeCopyDescription(v14, &range);
  }
  else
  {
    v15 = @"none";
  }
  if (self->_restrictToStreamable) {
    v16 = @"Y";
  }
  else {
    v16 = @"N";
  }
  if (self->_restrictToEncryptedStream) {
    v17 = @"Y";
  }
  else {
    v17 = @"N";
  }
  v18 = [v23 stringWithFormat:@"net: %@, stream: %@, streamingIntent: %@, downloadIntent: %@, downloadPriority: %@, ver: %@, playable: %@, delivery: %@, timeRange: %@ streamOnly: %@ encryptedOnly: %@", v22, v21, v5, v6, v7, v20, v10, v11, v15, v16, v17];
  if (v13) {

  }
  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end