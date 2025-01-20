@interface CAMPanoramaConfiguration
+ (id)sharedInstance;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumFramerate;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFramerate;
- (CAMPanoramaConfiguration)initWithACTConfiguration:(id)a3;
- (CAMPanoramaConfiguration)initWithCoder:(id)a3;
- (NSDictionary)_maxWidthPerDevice;
- (int)ringBufferSize;
- (int64_t)maxWidth;
- (int64_t)maxWidthForDevice:(int64_t)a3;
- (int64_t)sampleBufferHeight;
- (int64_t)sampleBufferWidth;
- (void)encodeWithCoder:(id)a3;
- (void)set_maxWidthPerDevice:(id)a3;
@end

@implementation CAMPanoramaConfiguration

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

void __42__CAMPanoramaConfiguration_sharedInstance__block_invoke()
{
  id v2 = (id)ACT_CopyDefaultConfigurationForPanorama();
  v0 = [[CAMPanoramaConfiguration alloc] initWithACTConfiguration:v2];
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;
}

- (CAMPanoramaConfiguration)initWithACTConfiguration:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)CAMPanoramaConfiguration;
  v5 = [(CAMPanoramaConfiguration *)&v19 init];
  if (v5)
  {
    v6 = [v4 objectForKey:*MEMORY[0x263F20798]];
    v5->_sampleBufferWidth = [v6 integerValue];

    v7 = [v4 objectForKey:*MEMORY[0x263F20790]];
    v5->_sampleBufferHeight = [v7 integerValue];

    v8 = [v4 objectForKey:*MEMORY[0x263F207C8]];
    int32_t v9 = [v8 intValue];

    CMTimeMake(&v18, 1, v9);
    v5->_minimumFramerate = ($95D729B680665BEAEFA1D6FCA8238556)v18;
    v10 = [v4 objectForKey:*MEMORY[0x263F207A8]];
    int32_t v11 = [v10 intValue];

    CMTimeMake(&v18, 1, v11);
    v5->_maximumFramerate = ($95D729B680665BEAEFA1D6FCA8238556)v18;
    v12 = [v4 objectForKey:*MEMORY[0x263F20770]];
    v5->_ringBufferSize = [v12 intValue];

    v13 = [v4 objectForKeyedSubscript:*MEMORY[0x263F207C0]];
    v5->_maxWidth = [v13 integerValue];

    uint64_t v14 = [v4 objectForKey:*MEMORY[0x263F207B8]];
    maxWidthPerDevice = v5->__maxWidthPerDevice;
    v5->__maxWidthPerDevice = (NSDictionary *)v14;

    v16 = v5;
  }

  return v5;
}

- (int64_t)maxWidthForDevice:(int64_t)a3
{
  int64_t v5 = [(CAMPanoramaConfiguration *)self maxWidth];
  v6 = +[CAMCaptureConversions AVCaptureDeviceTypeForCAMCaptureDevice:a3];
  v7 = [(CAMPanoramaConfiguration *)self _maxWidthPerDevice];

  if (v7 && v6)
  {
    v8 = [(CAMPanoramaConfiguration *)self _maxWidthPerDevice];
    int32_t v9 = [v8 objectForKeyedSubscript:v6];

    if (v9) {
      int64_t v5 = [v9 integerValue];
    }
  }
  return v5;
}

- (CAMPanoramaConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAMPanoramaConfiguration;
  int64_t v5 = [(CAMPanoramaConfiguration *)&v13 init];
  if (v5)
  {
    v5->_ringBufferSize = [v4 decodeInt32ForKey:@"CAMPanoramaConfigurationRingBufferSize"];
    v5->_sampleBufferWidth = [v4 decodeIntegerForKey:@"CAMPanoramaConfigurationSampleBufferWidth"];
    v5->_sampleBufferHeight = [v4 decodeIntegerForKey:@"CAMPanoramaConfigurationSampleBufferHeight"];
    CFDictionaryRef v6 = [v4 decodeObjectForKey:@"CAMPanoramaConfigurationMinimumFramerate"];
    CMTimeMakeFromDictionary(&v12, v6);
    v5->_minimumFramerate = ($95D729B680665BEAEFA1D6FCA8238556)v12;
    CFDictionaryRef v7 = [v4 decodeObjectForKey:@"CAMPanoramaConfigurationMaximumFramerate"];
    CMTimeMakeFromDictionary(&v12, v7);
    v5->_maximumFramerate = ($95D729B680665BEAEFA1D6FCA8238556)v12;
    v5->_maxWidth = [v4 decodeIntegerForKey:@"CAMPanoramaConfigurationMaxWidth"];
    uint64_t v8 = [v4 decodeObjectForKey:@"CAMPanoramaConfigurationMaxWidthPerDevice"];
    maxWidthPerDevice = v5->__maxWidthPerDevice;
    v5->__maxWidthPerDevice = (NSDictionary *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t ringBufferSize = self->_ringBufferSize;
  id v5 = a3;
  [v5 encodeInt32:ringBufferSize forKey:@"CAMPanoramaConfigurationRingBufferSize"];
  [v5 encodeInteger:self->_sampleBufferWidth forKey:@"CAMPanoramaConfigurationSampleBufferWidth"];
  [v5 encodeInteger:self->_sampleBufferHeight forKey:@"CAMPanoramaConfigurationSampleBufferHeight"];
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  $95D729B680665BEAEFA1D6FCA8238556 minimumFramerate = self->_minimumFramerate;
  CFDictionaryRef v7 = CMTimeCopyAsDictionary((CMTime *)&minimumFramerate, v6);
  [v5 encodeObject:v7 forKey:@"CAMPanoramaConfigurationMinimumFramerate"];
  $95D729B680665BEAEFA1D6FCA8238556 minimumFramerate = self->_maximumFramerate;
  CFDictionaryRef v8 = CMTimeCopyAsDictionary((CMTime *)&minimumFramerate, v6);
  [v5 encodeObject:v8 forKey:@"CAMPanoramaConfigurationMaximumFramerate"];
  [v5 encodeInteger:self->_maxWidth forKey:@"CAMPanoramaConfigurationMaxWidth"];
  [v5 encodeObject:self->__maxWidthPerDevice forKey:@"CAMPanoramaConfigurationMaxWidthPerDevice"];
}

- (int64_t)sampleBufferWidth
{
  return self->_sampleBufferWidth;
}

- (int64_t)sampleBufferHeight
{
  return self->_sampleBufferHeight;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minimumFramerate
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maximumFramerate
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (int)ringBufferSize
{
  return self->_ringBufferSize;
}

- (int64_t)maxWidth
{
  return self->_maxWidth;
}

- (NSDictionary)_maxWidthPerDevice
{
  return self->__maxWidthPerDevice;
}

- (void)set_maxWidthPerDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end