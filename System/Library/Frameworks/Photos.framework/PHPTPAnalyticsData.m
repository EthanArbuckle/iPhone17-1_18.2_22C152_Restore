@interface PHPTPAnalyticsData
- (NSString)buildVersion;
- (NSString)platform;
- (NSString)platformVersion;
- (NSString)transport;
- (NSString)uuid;
- (NSString)vendor;
- (PHPTPAnalyticsData)init;
- (double)timeConnected;
- (double)timeDisconnected;
- (id)cplStateString;
- (id)description;
- (int64_t)cplState;
- (unint64_t)deferredRenderCount;
- (unint64_t)downloadedCount;
- (unint64_t)imageTranscodedCount;
- (unint64_t)libraryAssetCount;
- (unint64_t)videoTranscodedCount;
- (void)incrementConversionCountForAssetType:(signed __int16)a3;
- (void)report;
- (void)setBuildVersion:(id)a3;
- (void)setCplState:(int64_t)a3;
- (void)setDeferredRenderCount:(unint64_t)a3;
- (void)setDownloadedCount:(unint64_t)a3;
- (void)setImageTranscodedCount:(unint64_t)a3;
- (void)setLibraryAssetCount:(unint64_t)a3;
- (void)setPlatform:(id)a3;
- (void)setPlatformVersion:(id)a3;
- (void)setTimeConnected:(double)a3;
- (void)setTimeDisconnected:(double)a3;
- (void)setTransport:(id)a3;
- (void)setUuid:(id)a3;
- (void)setVendor:(id)a3;
- (void)setVideoTranscodedCount:(unint64_t)a3;
- (void)updateWithPlatformInformation:(id)a3;
@end

@implementation PHPTPAnalyticsData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_platformVersion, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_vendor, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setTimeDisconnected:(double)a3
{
  self->_timeDisconnected = a3;
}

- (double)timeDisconnected
{
  return self->_timeDisconnected;
}

- (void)setTimeConnected:(double)a3
{
  self->_timeConnected = a3;
}

- (double)timeConnected
{
  return self->_timeConnected;
}

- (void)setDeferredRenderCount:(unint64_t)a3
{
  self->_deferredRenderCount = a3;
}

- (unint64_t)deferredRenderCount
{
  return self->_deferredRenderCount;
}

- (void)setDownloadedCount:(unint64_t)a3
{
  self->_downloadedCount = a3;
}

- (unint64_t)downloadedCount
{
  return self->_downloadedCount;
}

- (void)setImageTranscodedCount:(unint64_t)a3
{
  self->_imageTranscodedCount = a3;
}

- (unint64_t)imageTranscodedCount
{
  return self->_imageTranscodedCount;
}

- (void)setVideoTranscodedCount:(unint64_t)a3
{
  self->_videoTranscodedCount = a3;
}

- (unint64_t)videoTranscodedCount
{
  return self->_videoTranscodedCount;
}

- (void)setLibraryAssetCount:(unint64_t)a3
{
  self->_libraryAssetCount = a3;
}

- (unint64_t)libraryAssetCount
{
  return self->_libraryAssetCount;
}

- (void)setCplState:(int64_t)a3
{
  self->_cplState = a3;
}

- (int64_t)cplState
{
  return self->_cplState;
}

- (void)setTransport:(id)a3
{
}

- (NSString)transport
{
  return self->_transport;
}

- (void)setBuildVersion:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setPlatformVersion:(id)a3
{
}

- (NSString)platformVersion
{
  return self->_platformVersion;
}

- (void)setPlatform:(id)a3
{
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setVendor:(id)a3
{
}

- (NSString)vendor
{
  return self->_vendor;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)description
{
  v3 = NSString;
  long long v9 = *(_OWORD *)&self->_vendor;
  platformVersion = self->_platformVersion;
  transport = self->_transport;
  v6 = [(PHPTPAnalyticsData *)self cplStateString];
  v7 = [v3 stringWithFormat:@"make: %@, os: %@, os_version: %@, transport: %@, clp_state: %@, library_asset_count: %lu, deferred_renders: %lu, videos_trancoded: %lu, images_transcoded: %lu, downloaded: %lu, duration: %g", v9, platformVersion, transport, v6, self->_libraryAssetCount, self->_deferredRenderCount, self->_videoTranscodedCount, self->_imageTranscodedCount, self->_downloadedCount, (self->_timeDisconnected - self->_timeConnected) / 1000000000.0];

  return v7;
}

- (void)report
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = PLPTPGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v13 = 138412290;
    v14 = self;
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "PTP Analytics:\n%@", (uint8_t *)&v13, 0xCu);
  }

  id v4 = objc_alloc_init(MEMORY[0x1E4F8B8C0]);
  uint64_t v5 = *MEMORY[0x1E4F8C0F8];
  [v4 setPayloadValue:self->_uuid forKey:*MEMORY[0x1E4F8C108] onEventWithName:*MEMORY[0x1E4F8C0F8]];
  [v4 setPayloadValue:self->_vendor forKey:*MEMORY[0x1E4F8C138] onEventWithName:v5];
  [v4 setPayloadValue:self->_platform forKey:*MEMORY[0x1E4F8C140] onEventWithName:v5];
  [v4 setPayloadValue:self->_platformVersion forKey:*MEMORY[0x1E4F8C148] onEventWithName:v5];
  [v4 setPayloadValue:self->_transport forKey:*MEMORY[0x1E4F8C150] onEventWithName:v5];
  v6 = [(PHPTPAnalyticsData *)self cplStateString];
  [v4 setPayloadValue:v6 forKey:*MEMORY[0x1E4F8C100] onEventWithName:v5];

  v7 = [NSNumber numberWithUnsignedInteger:self->_libraryAssetCount];
  [v4 setPayloadValue:v7 forKey:*MEMORY[0x1E4F8C130] onEventWithName:v5];

  v8 = [NSNumber numberWithUnsignedInteger:self->_deferredRenderCount];
  [v4 setPayloadValue:v8 forKey:*MEMORY[0x1E4F8C110] onEventWithName:v5];

  long long v9 = [NSNumber numberWithUnsignedInteger:self->_imageTranscodedCount];
  [v4 setPayloadValue:v9 forKey:*MEMORY[0x1E4F8C128] onEventWithName:v5];

  v10 = [NSNumber numberWithUnsignedInteger:self->_videoTranscodedCount];
  [v4 setPayloadValue:v10 forKey:*MEMORY[0x1E4F8C158] onEventWithName:v5];

  v11 = [NSNumber numberWithUnsignedInteger:self->_downloadedCount];
  [v4 setPayloadValue:v11 forKey:*MEMORY[0x1E4F8C118] onEventWithName:v5];

  v12 = [NSNumber numberWithDouble:self->_timeDisconnected - self->_timeConnected];
  [v4 setPayloadValue:v12 forKey:*MEMORY[0x1E4F8C120] onEventWithName:v5];

  [v4 publishEventWithName:v5];
}

- (id)cplStateString
{
  unint64_t cplState = self->_cplState;
  if (cplState > 2) {
    return @"Unknown";
  }
  else {
    return off_1E5841F08[cplState];
  }
}

- (void)incrementConversionCountForAssetType:(signed __int16)a3
{
  int v3 = a3;
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ((a3 - 2) < 2)
  {
    id v4 = PLPTPGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_ERROR, "Unexpected asset type for transcode: %d", (uint8_t *)v5, 8u);
    }
  }
  else if (a3 == 1)
  {
    ++self->_videoTranscodedCount;
  }
  else if (!a3)
  {
    ++self->_imageTranscodedCount;
  }
}

- (void)updateWithPlatformInformation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v29 = v4;
    uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F8CEE8]];
    uint64_t v5 = v29;
    if (!v6 || (v7 = self->_vendor, v6, uint64_t v5 = v29, !v7))
    {
      v8 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F8CF38]];
      long long v9 = v8;
      v10 = (void *)MEMORY[0x1E4F8CF40];
      if (!v8
        || ([v8 isEqualToString:*MEMORY[0x1E4F8CF40]] & 1) == 0
        && ([v9 isEqualToString:*MEMORY[0x1E4F8CF48]] & 1) == 0)
      {
        id v11 = (id)*MEMORY[0x1E4F8CF50];

        long long v9 = v11;
      }
      uint64_t v12 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F8CF10]];
      int v13 = (void *)v12;
      uint64_t v14 = *MEMORY[0x1E4F8CF20];
      if (v12) {
        uint64_t v15 = (void *)v12;
      }
      else {
        uint64_t v15 = (void *)*MEMORY[0x1E4F8CF20];
      }
      id v16 = v15;

      if (![v16 isEqualToString:v14]) {
        goto LABEL_17;
      }
      if ([v9 isEqualToString:*v10])
      {
        v17 = (id *)MEMORY[0x1E4F8CF18];
      }
      else
      {
        if (![v9 isEqualToString:*MEMORY[0x1E4F8CF48]])
        {
LABEL_17:
          vendor = self->_vendor;
          self->_vendor = (NSString *)v9;
          id v20 = v9;

          platform = self->_platform;
          self->_platform = (NSString *)v16;
          id v22 = v16;

          v23 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F8CF58]];
          platformVersion = self->_platformVersion;
          self->_platformVersion = v23;

          v25 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F8CF08]];
          buildVersion = self->_buildVersion;
          self->_buildVersion = v25;

          v27 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F8CF30]];
          transport = self->_transport;
          self->_transport = v27;

          uint64_t v5 = v29;
          goto LABEL_18;
        }
        v17 = (id *)MEMORY[0x1E4F8CF28];
      }
      id v18 = *v17;

      id v16 = v18;
      goto LABEL_17;
    }
  }
LABEL_18:
}

- (PHPTPAnalyticsData)init
{
  v7.receiver = self;
  v7.super_class = (Class)PHPTPAnalyticsData;
  v2 = [(PHPTPAnalyticsData *)&v7 init];
  if (v2)
  {
    int v3 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v4 = [v3 UUIDString];
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v4;
  }
  return v2;
}

@end