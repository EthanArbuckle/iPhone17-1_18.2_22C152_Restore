@interface AssistantVoiceMetrics
+ (BOOL)supportsSecureCoding;
+ (id)keyForLanguage:(id)a3 name:(id)a4;
- (AssistantVoiceMetrics)init;
- (AssistantVoiceMetrics)initWithCoder:(id)a3;
- (BOOL)downloadError;
- (BOOL)isCellularAllowed;
- (BOOL)previewedSuccessfully;
- (BOOL)sentOnce;
- (NSMutableSet)mutableUniqueVoicesPreviewed;
- (NSString)lastVoicePreviewedKey;
- (NSString)voiceDownloadKey;
- (double)_clockFactor;
- (double)downloadObservationDuration;
- (float)downloadObservationProgress;
- (id)description;
- (id)dictionaryMetrics;
- (int64_t)downloadObservationBeginTimestamp;
- (int64_t)downloadObservationEndTimestamp;
- (unint64_t)uniqueVoicesPreviewed;
- (unint64_t)voicesPreviewed;
- (void)beginDownloadObservation;
- (void)encodeWithCoder:(id)a3;
- (void)endDownloadObservation;
- (void)sendAnalyticsEvent;
- (void)setDownloadError:(BOOL)a3;
- (void)setDownloadObservationProgress:(float)a3;
- (void)setIsCellularAllowed:(BOOL)a3;
- (void)setMutableUniqueVoicesPreviewed:(id)a3;
- (void)setPreviewedSuccessfully:(BOOL)a3;
- (void)setSentOnce:(BOOL)a3;
- (void)setVoiceDownloadForLanguageCode:(id)a3 name:(id)a4;
- (void)setVoicePreviewedForLanguageCode:(id)a3 name:(id)a4;
@end

@implementation AssistantVoiceMetrics

- (void)setVoiceDownloadForLanguageCode:(id)a3 name:(id)a4
{
  self->_voiceDownloadKey = +[AssistantVoiceMetrics keyForLanguage:a3 name:a4];

  MEMORY[0x270F9A758]();
}

- (void)setVoicePreviewedForLanguageCode:(id)a3 name:(id)a4
{
  ++self->_voicesPreviewed;
  v5 = +[AssistantVoiceMetrics keyForLanguage:a3 name:a4];
  lastVoicePreviewedKey = self->_lastVoicePreviewedKey;
  self->_lastVoicePreviewedKey = v5;

  mutableUniqueVoicesPreviewed = self->_mutableUniqueVoicesPreviewed;
  v8 = self->_lastVoicePreviewedKey;

  [(NSMutableSet *)mutableUniqueVoicesPreviewed addObject:v8];
}

- (void)beginDownloadObservation
{
  self->_downloadObservationBeginTimestamp = mach_absolute_time();
}

- (void)endDownloadObservation
{
  self->_downloadObservationEndTimestamp = mach_absolute_time();
}

- (unint64_t)uniqueVoicesPreviewed
{
  return [(NSMutableSet *)self->_mutableUniqueVoicesPreviewed count];
}

- (AssistantVoiceMetrics)init
{
  v6.receiver = self;
  v6.super_class = (Class)AssistantVoiceMetrics;
  v2 = [(AssistantVoiceMetrics *)&v6 init];
  uint64_t v3 = [MEMORY[0x263EFF9C0] set];
  mutableUniqueVoicesPreviewed = v2->_mutableUniqueVoicesPreviewed;
  v2->_mutableUniqueVoicesPreviewed = (NSMutableSet *)v3;

  return v2;
}

- (id)description
{
  v2 = [(AssistantVoiceMetrics *)self dictionaryMetrics];
  uint64_t v3 = [v2 description];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  voiceDownloadKey = self->_voiceDownloadKey;
  id v6 = a3;
  [v6 encodeObject:voiceDownloadKey forKey:@"_voiceDownloadKey"];
  [v6 encodeObject:self->_lastVoicePreviewedKey forKey:@"_lastVoicePreviewedKey"];
  [v6 encodeInteger:self->_voicesPreviewed forKey:@"_voicesPreviewed"];
  v5 = [(NSMutableSet *)self->_mutableUniqueVoicesPreviewed allObjects];
  [v6 encodeObject:v5 forKey:@"_uniqueVoicesPreviewed"];

  [v6 encodeBool:self->_isCellularAllowed forKey:@"_isCellularAllowed"];
  [v6 encodeInt64:self->_downloadObservationBeginTimestamp forKey:@"_downloadObservationBeginTimestamp"];
  [v6 encodeInt64:self->_downloadObservationEndTimestamp forKey:@"_downloadObservationEndTimestamp"];
  [v6 encodeDouble:@"_downloadObservationProgress" forKey:self->_downloadObservationProgress];
  [v6 encodeBool:self->_downloadError forKey:@"_downloadError"];
}

- (AssistantVoiceMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AssistantVoiceMetrics;
  v5 = [(AssistantVoiceMetrics *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_voiceDownloadKey"];
    voiceDownloadKey = v5->_voiceDownloadKey;
    v5->_voiceDownloadKey = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_lastVoicePreviewedKey"];
    lastVoicePreviewedKey = v5->_lastVoicePreviewedKey;
    v5->_lastVoicePreviewedKey = (NSString *)v8;

    v5->_voicesPreviewed = [v4 decodeIntegerForKey:@"_voicesPreviewed"];
    v10 = (void *)MEMORY[0x263EFF9C0];
    v11 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"_uniqueVoicesPreviewed"];
    uint64_t v12 = [v10 setWithArray:v11];
    mutableUniqueVoicesPreviewed = v5->_mutableUniqueVoicesPreviewed;
    v5->_mutableUniqueVoicesPreviewed = (NSMutableSet *)v12;

    v5->_isCellularAllowed = [v4 decodeBoolForKey:@"_isCellularAllowed"];
    v5->_downloadObservationBeginTimestamp = [v4 decodeInt64ForKey:@"_downloadObservationBeginTimestamp"];
    v5->_downloadObservationEndTimestamp = [v4 decodeInt64ForKey:@"_downloadObservationEndTimestamp"];
    [v4 decodeDoubleForKey:@"_downloadObservationProgress"];
    *(float *)&double v14 = v14;
    v5->_downloadObservationProgress = *(float *)&v14;
    v5->_downloadError = [v4 decodeBoolForKey:@"_downloadError"];
  }

  return v5;
}

- (double)_clockFactor
{
  if (_clockFactor_onceToken != -1) {
    dispatch_once(&_clockFactor_onceToken, &__block_literal_global);
  }
  return *(double *)&_clockFactor_clockToSeconds;
}

double __37__AssistantVoiceMetrics__clockFactor__block_invoke()
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  double result = (double)v0 / (double)v1 / 1000000000.0;
  _clockFactor_clockToSeconds = *(void *)&result;
  return result;
}

+ (id)keyForLanguage:(id)a3 name:(id)a4
{
  return (id)[NSString stringWithFormat:@"%@:%@", a3, a4];
}

- (double)downloadObservationDuration
{
  int64_t downloadObservationBeginTimestamp = self->_downloadObservationBeginTimestamp;
  if (!downloadObservationBeginTimestamp) {
    return 0.0;
  }
  uint64_t downloadObservationEndTimestamp = self->_downloadObservationEndTimestamp;
  if (!downloadObservationEndTimestamp)
  {
    uint64_t downloadObservationEndTimestamp = mach_absolute_time();
    int64_t downloadObservationBeginTimestamp = self->_downloadObservationBeginTimestamp;
  }
  double v5 = (double)(downloadObservationEndTimestamp - downloadObservationBeginTimestamp);
  [(AssistantVoiceMetrics *)self _clockFactor];
  return v6 * v5;
}

- (id)dictionaryMetrics
{
  v17[9] = *MEMORY[0x263EF8340];
  lastVoicePreviewedKey = &stru_26D2AB140;
  v16[0] = @"voice";
  v16[1] = @"last_preview";
  voiceDownloadKey = (__CFString *)self->_voiceDownloadKey;
  if (!voiceDownloadKey) {
    voiceDownloadKey = &stru_26D2AB140;
  }
  if (self->_lastVoicePreviewedKey) {
    lastVoicePreviewedKey = (__CFString *)self->_lastVoicePreviewedKey;
  }
  v17[0] = voiceDownloadKey;
  v17[1] = lastVoicePreviewedKey;
  v16[2] = @"voices_previewed";
  double v5 = [NSNumber numberWithUnsignedInteger:self->_voicesPreviewed];
  v17[2] = v5;
  v16[3] = @"voices_previewed_unique";
  double v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[AssistantVoiceMetrics uniqueVoicesPreviewed](self, "uniqueVoicesPreviewed"));
  v17[3] = v6;
  v16[4] = @"allowing_cellular";
  v7 = [NSNumber numberWithBool:self->_isCellularAllowed];
  v17[4] = v7;
  v16[5] = @"download_duration";
  uint64_t v8 = NSNumber;
  [(AssistantVoiceMetrics *)self downloadObservationDuration];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  v17[5] = v9;
  v16[6] = @"download_progress";
  *(float *)&double v10 = self->_downloadObservationProgress;
  v11 = [NSNumber numberWithFloat:v10];
  v17[6] = v11;
  v16[7] = @"download_error";
  uint64_t v12 = [NSNumber numberWithBool:self->_downloadError];
  v17[7] = v12;
  v16[8] = @"previewed_successfully";
  v13 = [NSNumber numberWithBool:self->_previewedSuccessfully];
  v17[8] = v13;
  double v14 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:9];

  return v14;
}

- (void)sendAnalyticsEvent
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  v2 = "-[AssistantVoiceMetrics sendAnalyticsEvent]";
  __int16 v3 = 2112;
  id v4 = @"com.apple.siri.assistant-settings-support.voiceSelection";
  _os_log_error_impl(&dword_220C23000, log, OS_LOG_TYPE_ERROR, "%s CoreAnalytics eventName:%@ not sent. Event name must not be in current config", (uint8_t *)&v1, 0x16u);
}

uint64_t __43__AssistantVoiceMetrics_sendAnalyticsEvent__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dictionaryMetrics];
}

- (BOOL)previewedSuccessfully
{
  return self->_previewedSuccessfully;
}

- (void)setPreviewedSuccessfully:(BOOL)a3
{
  self->_previewedSuccessfully = a3;
}

- (BOOL)isCellularAllowed
{
  return self->_isCellularAllowed;
}

- (void)setIsCellularAllowed:(BOOL)a3
{
  self->_isCellularAllowed = a3;
}

- (float)downloadObservationProgress
{
  return self->_downloadObservationProgress;
}

- (void)setDownloadObservationProgress:(float)a3
{
  self->_downloadObservationProgress = a3;
}

- (BOOL)downloadError
{
  return self->_downloadError;
}

- (void)setDownloadError:(BOOL)a3
{
  self->_downloadError = a3;
}

- (NSString)voiceDownloadKey
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)lastVoicePreviewedKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (unint64_t)voicesPreviewed
{
  return self->_voicesPreviewed;
}

- (int64_t)downloadObservationBeginTimestamp
{
  return self->_downloadObservationBeginTimestamp;
}

- (int64_t)downloadObservationEndTimestamp
{
  return self->_downloadObservationEndTimestamp;
}

- (BOOL)sentOnce
{
  return self->_sentOnce;
}

- (void)setSentOnce:(BOOL)a3
{
  self->_sentOnce = a3;
}

- (NSMutableSet)mutableUniqueVoicesPreviewed
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMutableUniqueVoicesPreviewed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableUniqueVoicesPreviewed, 0);
  objc_storeStrong((id *)&self->_lastVoicePreviewedKey, 0);

  objc_storeStrong((id *)&self->_voiceDownloadKey, 0);
}

@end