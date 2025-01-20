@interface AVOutputSettingsAssistant
+ (AVOutputSettingsAssistant)outputSettingsAssistantWithPreset:(AVOutputSettingsPreset)presetIdentifier;
+ (BOOL)validatesSourceVideoMinFrameDuration;
+ (NSArray)availableOutputSettingsPresets;
+ (id)_allOutputSettingsPresets;
+ (id)baseSettingsProviderForPreset:(id)a3;
+ (id)videoEncoderCapabilities;
+ (id)videoSettingsAdjusterForPreset:(id)a3;
- (AVFileType)outputFileType;
- (AVOutputSettingsAssistant)init;
- (AVOutputSettingsAssistant)initWithPreset:(id)a3;
- (CMAudioFormatDescriptionRef)sourceAudioFormat;
- (CMTime)sourceVideoAverageFrameDuration;
- (CMTime)sourceVideoMinFrameDuration;
- (CMVideoFormatDescriptionRef)sourceVideoFormat;
- (NSDictionary)audioSettings;
- (NSDictionary)videoSettings;
- (id)videoEncoderSpecification;
- (void)dealloc;
- (void)setSourceAudioFormat:(CMAudioFormatDescriptionRef)sourceAudioFormat;
- (void)setSourceVideoAverageFrameDuration:(CMTime *)sourceVideoAverageFrameDuration;
- (void)setSourceVideoFormat:(CMVideoFormatDescriptionRef)sourceVideoFormat;
- (void)setSourceVideoMinFrameDuration:(CMTime *)sourceVideoMinFrameDuration;
- (void)setVideoEncoderSpecification:(id)a3;
@end

@implementation AVOutputSettingsAssistant

+ (id)_allOutputSettingsPresets
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"AVOutputSettingsPreset640x480", @"AVOutputSettingsPreset960x540", @"AVOutputSettingsPreset1280x720", @"AVOutputSettingsPreset1920x1080", @"AVOutputSettingsPreset3840x2160", @"AVOutputSettingsPresetHEVC1920x1080", @"AVOutputSettingsPresetHEVC1920x1080WithAlpha", @"AVOutputSettingsPresetHEVC3840x2160", @"AVOutputSettingsPresetHEVC3840x2160WithAlpha", 0);
}

+ (NSArray)availableOutputSettingsPresets
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = objc_msgSend(a1, "_allOutputSettingsPresets", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        if ([(id)objc_opt_class() baseSettingsProviderForPreset:v9]) {
          [(NSArray *)v3 addObject:v9];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

+ (AVOutputSettingsAssistant)outputSettingsAssistantWithPreset:(AVOutputSettingsPreset)presetIdentifier
{
  v3 = (void *)[objc_alloc((Class)a1) initWithPreset:presetIdentifier];
  return (AVOutputSettingsAssistant *)v3;
}

- (AVOutputSettingsAssistant)init
{
  return [(AVOutputSettingsAssistant *)self initWithPreset:0];
}

- (AVOutputSettingsAssistant)initWithPreset:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AVOutputSettingsAssistant;
  v4 = [(AVOutputSettingsAssistant *)&v10 init];
  if (v4)
  {
    uint64_t v5 = objc_alloc_init(AVOutputSettingsAssistantInternal);
    v4->_internal = v5;
    if (v5
      && (CFRetain(v5),
          v4->_internal->baseSettingsProvider = (AVOutputSettingsAssistantBaseSettingsProvider *)(id)[(id)objc_opt_class() baseSettingsProviderForPreset:a3],
          v4->_internal->videoSettingsAdjuster = (AVOutputSettingsAssistantVideoSettingsAdjuster *)(id)[(id)objc_opt_class() videoSettingsAdjusterForPreset:a3],
          uint64_t v6 = v4->_internal,
          v6->baseSettingsProvider)
      && v6->videoSettingsAdjuster)
    {
      CMTimeMake(&v9, 1, 30);
      v6->sourceVideoAverageFrameDuration = ($95D729B680665BEAEFA1D6FCA8238556)v9;
      internal = (CMTime *)v4->_internal;
      CMTimeMake(&v9, 1, 30);
      internal[3] = v9;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {

    v4 = self->_internal;
    sourceVideoFormat = v4->sourceVideoFormat;
    if (sourceVideoFormat) {
      CFRelease(sourceVideoFormat);
    }
    sourceAudioFormat = v4->sourceAudioFormat;
    if (sourceAudioFormat) {
      CFRelease(sourceAudioFormat);
    }

    CFRelease(v4);
  }
  v7.receiver = self;
  v7.super_class = (Class)AVOutputSettingsAssistant;
  [(AVOutputSettingsAssistant *)&v7 dealloc];
}

- (AVFileType)outputFileType
{
  return (AVFileType)@"com.apple.quicktime-movie";
}

- (NSDictionary)audioSettings
{
  v3 = (NSDictionary *)[(AVOutputSettingsAssistantBaseSettingsProvider *)self->_internal->baseSettingsProvider baseAudioSettings];
  if ([(AVOutputSettingsAssistant *)self sourceAudioFormat])
  {
    v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v3];
    *(void *)&v15[0] = 0;
    inSpecifier = 0;
    uint64_t RichestDecodableFormatAndChannelLayout = FigAudioFormatDescriptionGetRichestDecodableFormatAndChannelLayout();
    uint64_t v5 = *MEMORY[0x1E4F15270];
    objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", *MEMORY[0x1E4F15270]), "doubleValue");
    if (v6 > *(double *)RichestDecodableFormatAndChannelLayout) {
      double v6 = *(double *)RichestDecodableFormatAndChannelLayout;
    }
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", v6, *(void *)&v15[0]), v5);
    uint64_t v9 = *(unsigned int *)(RichestDecodableFormatAndChannelLayout + 28);
    uint64_t v10 = *MEMORY[0x1E4F15228];
    uint64_t v11 = objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", *MEMORY[0x1E4F15228]), "integerValue");
    uint64_t v7 = [MEMORY[0x1E4F1C9B8] data];
    if (v11 == v9) {
      uint64_t v8 = objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", v10), "integerValue");
    }
    else {
      uint64_t v8 = *(unsigned int *)(RichestDecodableFormatAndChannelLayout + 28);
    }
  }
  else
  {
    v15[0] = xmmword_194C5FED0;
    v15[1] = unk_194C5FEE0;
    uint64_t v7 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v15 length:32];
    uint64_t v8 = 2;
  }
  uint64_t v12 = *MEMORY[0x1E4F15198];
  if (![(NSDictionary *)v3 objectForKey:*MEMORY[0x1E4F15198]])
  {
    v3 = (NSDictionary *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v3];
    [(NSDictionary *)v3 setObject:v7 forKey:v12];
    uint64_t v13 = [MEMORY[0x1E4F28ED0] numberWithInteger:v8];
    [(NSDictionary *)v3 setObject:v13 forKey:*MEMORY[0x1E4F15228]];
  }
  return v3;
}

- (NSDictionary)videoSettings
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[AVOutputSettingsAssistantBaseSettingsProvider baseVideoSettings](self->_internal->baseSettingsProvider, "baseVideoSettings"));
  v4 = [(AVOutputSettingsAssistant *)self sourceVideoFormat];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t Dimensions = (uint64_t)CMVideoFormatDescriptionGetDimensions(v4);
    uint64_t v7 = objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", @"AVVideoWidthKey"), "integerValue");
    uint64_t v8 = objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", @"AVVideoHeightKey"), "integerValue");
    double v9 = (double)SHIDWORD(Dimensions);
    double v10 = (double)(int)Dimensions * (double)v8 / (double)SHIDWORD(Dimensions);
    if (v7 * (Dimensions >> 32) >= v8 * (int)Dimensions)
    {
      double v11 = (double)v8;
    }
    else
    {
      double v10 = (double)v7;
      double v11 = v9 * (double)v7 / (double)(int)Dimensions;
    }
    BOOL v12 = v10 > (double)(int)Dimensions;
    if (v11 > v9) {
      BOOL v12 = 1;
    }
    if (v12) {
      double v13 = (double)(int)Dimensions;
    }
    else {
      double v13 = v10;
    }
    if (v12) {
      double v14 = (double)SHIDWORD(Dimensions);
    }
    else {
      double v14 = v11;
    }
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", [MEMORY[0x1E4F28ED0] numberWithDouble:v13], @"AVVideoWidthKey");
    -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", [MEMORY[0x1E4F28ED0] numberWithDouble:v14], @"AVVideoHeightKey");
    if (objc_msgSend(-[NSDictionary objectForKey:](v3, "objectForKey:", @"AVVideoCodecKey"), "isEqualToString:", @"hvc1"))
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D510]);
      CFArrayAppendValue(Mutable, v5);
      if ((int)FigExportSettings_GetMaximumBitsPerComponent() <= 9) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = *MEMORY[0x1E4F452A8];
      }
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
    else
    {
      uint64_t v16 = 0;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  v17 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[NSDictionary objectForKey:](v3, "objectForKey:", @"AVVideoCompressionPropertiesKey"));
  if (v5)
  {
    [(AVOutputSettingsAssistant *)self sourceVideoAverageFrameDuration];
    double v18 = 1.0 / CMTimeGetSeconds(&time);
    *(float *)&double v18 = v18;
    uint64_t v19 = [(AVOutputSettingsAssistantVideoSettingsAdjuster *)self->_internal->videoSettingsAdjuster averageBitRateForSourceFormatDescription:v5 andTargetFrameRate:self->_internal->videoEncoderSpecification andEncoderSpecification:v18];
    objc_msgSend(v17, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", v19), @"AverageBitRate");
  }
  [(AVOutputSettingsAssistant *)self sourceVideoMinFrameDuration];
  objc_msgSend(v17, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", 1.0 / CMTimeGetSeconds(&v25)), @"ExpectedFrameRate");
  if (objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "videoEncoderCapabilities"), "averageNonDroppableFrameIntervalIsSupportedByDefaultEncoderForVideoCodec:", -[NSDictionary objectForKey:](v3, "objectForKey:", @"AVVideoCodecKey")))
  {
    [(AVOutputSettingsAssistant *)self sourceVideoMinFrameDuration];
    CMTimeMake(&v23, 1, 30);
    if (CMTimeCompare(&time1, &v23) < 0) {
      objc_msgSend(v17, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", 30), @"AverageNonDroppableFrameRate");
    }
  }
  if (v16) {
    [v17 setObject:v16 forKey:@"ProfileLevel"];
  }
  [(NSDictionary *)v3 setObject:v17 forKey:@"AVVideoCompressionPropertiesKey"];
  if (v5)
  {
    v27[0] = v5;
    uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  }
  else
  {
    uint64_t v20 = 0;
  }
  uint64_t v21 = [(AVOutputSettingsAssistantVideoSettingsAdjuster *)self->_internal->videoSettingsAdjuster colorSpaceFromSourceFormatDescriptions:v20 andRendererColorSpace:0];
  if (v21) {
    [(NSDictionary *)v3 setObject:v21 forKey:@"AVVideoColorPropertiesKey"];
  }
  return v3;
}

- (CMAudioFormatDescriptionRef)sourceAudioFormat
{
  return self->_internal->sourceAudioFormat;
}

- (void)setSourceAudioFormat:(CMAudioFormatDescriptionRef)sourceAudioFormat
{
  internal = self->_internal;
  v4 = internal->sourceAudioFormat;
  internal->sourceAudioFormat = sourceAudioFormat;
  if (sourceAudioFormat) {
    CFRetain(sourceAudioFormat);
  }
  if (v4)
  {
    CFRelease(v4);
  }
}

- (CMVideoFormatDescriptionRef)sourceVideoFormat
{
  return self->_internal->sourceVideoFormat;
}

- (void)setSourceVideoFormat:(CMVideoFormatDescriptionRef)sourceVideoFormat
{
  internal = self->_internal;
  v4 = internal->sourceVideoFormat;
  internal->sourceVideoFormat = sourceVideoFormat;
  if (sourceVideoFormat) {
    CFRetain(sourceVideoFormat);
  }
  if (v4)
  {
    CFRelease(v4);
  }
}

- (CMTime)sourceVideoAverageFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(void *)&self->timescale
                                                                                      + 48);
  return self;
}

- (void)setSourceVideoAverageFrameDuration:(CMTime *)sourceVideoAverageFrameDuration
{
  if ((sourceVideoAverageFrameDuration->flags & 0x1D) != 1)
  {
    double v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v15 = "CMTIME_IS_NUMERIC(sourceVideoAverageFrameDuration)";
    goto LABEL_6;
  }
  CMTime time1 = *sourceVideoAverageFrameDuration;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  if (CMTimeCompare(&time1, &time2) <= 0)
  {
    double v13 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v14 = *MEMORY[0x1E4F1C3C8];
    v15 = "CMTIME_COMPARE_INLINE(sourceVideoAverageFrameDuration, >, kCMTimeZero)";
LABEL_6:
    uint64_t v16 = (void *)[v13 exceptionWithName:v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)v15), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  internal = self->_internal;
  long long v12 = *(_OWORD *)&sourceVideoAverageFrameDuration->value;
  internal->sourceVideoAverageFrameDuration.epoch = sourceVideoAverageFrameDuration->epoch;
  *(_OWORD *)&internal->sourceVideoAverageFrameDuration.value = v12;
}

- (CMTime)sourceVideoMinFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(void *)&self->timescale
                                                                                      + 72);
  return self;
}

- (void)setSourceVideoMinFrameDuration:(CMTime *)sourceVideoMinFrameDuration
{
  if ([(id)objc_opt_class() validatesSourceVideoMinFrameDuration])
  {
    if ((sourceVideoMinFrameDuration->flags & 0x1D) == 1)
    {
      CMTime time1 = *sourceVideoMinFrameDuration;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
      if (CMTimeCompare(&time1, &time2) > 0) {
        goto LABEL_4;
      }
      double v13 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v14 = *MEMORY[0x1E4F1C3C8];
      v15 = "CMTIME_COMPARE_INLINE(sourceVideoMinFrameDuration, >, kCMTimeZero)";
    }
    else
    {
      double v13 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v14 = *MEMORY[0x1E4F1C3C8];
      v15 = "CMTIME_IS_NUMERIC(sourceVideoMinFrameDuration)";
    }
    uint64_t v16 = (void *)[v13 exceptionWithName:v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v6, v7, v8, v9, v10, (uint64_t)v15), 0 reason userInfo];
    objc_exception_throw(v16);
  }
LABEL_4:
  internal = self->_internal;
  long long v12 = *(_OWORD *)&sourceVideoMinFrameDuration->value;
  internal->sourceVideoMinFrameDuration.epoch = sourceVideoMinFrameDuration->epoch;
  *(_OWORD *)&internal->sourceVideoMinFrameDuration.value = v12;
}

- (void)setVideoEncoderSpecification:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F45648];
  if (a3 && [a3 objectForKeyedSubscript:*MEMORY[0x1E4F45648]])
  {
    internal = self->_internal;
    p_internal = &self->_internal;
    videoEncoderSpecification = internal->videoEncoderSpecification;
    if (videoEncoderSpecification == a3) {
      return;
    }

    uint64_t v9 = (NSDictionary *)[a3 copy];
  }
  else
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
    [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v5];
    double v11 = self->_internal;
    p_internal = &self->_internal;

    uint64_t v9 = v10;
  }
  (*p_internal)->videoEncoderSpecification = v9;
}

- (id)videoEncoderSpecification
{
  return self->_internal->videoEncoderSpecification;
}

+ (id)baseSettingsProviderForPreset:(id)a3
{
  uint64_t v3 = [[AVExportSettingsOutputSettingsAssistantBaseSettings alloc] initWithOutputSettingsPreset:a3];
  return v3;
}

+ (id)videoSettingsAdjusterForPreset:(id)a3
{
  uint64_t v3 = [[AVExportSettingsOutputSettingsAssistantVideoSettingsAdjuster alloc] initWithOutputSettingsPreset:a3];
  return v3;
}

+ (id)videoEncoderCapabilities
{
  v2 = objc_alloc_init(AVIOKitOutputSettingsAssistantVideoEncoderCapabilities);
  return v2;
}

+ (BOOL)validatesSourceVideoMinFrameDuration
{
  return 0;
}

@end