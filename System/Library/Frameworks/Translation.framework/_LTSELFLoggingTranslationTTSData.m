@interface _LTSELFLoggingTranslationTTSData
+ (BOOL)supportsSecureCoding;
- (BOOL)isAutoplayTranslation;
- (_LTSELFLoggingTranslationTTSData)initWithCoder:(id)a3;
- (_LTSELFLoggingTranslationTTSData)initWithSourceOrTargetLanguage:(int64_t)a3 isAutoplayTranslation:(BOOL)a4 ttsPlaybackSpeed:(int64_t)a5 audioChannel:(int64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)audioChannel;
- (int64_t)playbackSpeed;
- (int64_t)sourceOrTargetLanguage;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioChannel:(int64_t)a3;
- (void)setIsAutoplayTranslation:(BOOL)a3;
- (void)setPlaybackSpeed:(int64_t)a3;
- (void)setSourceOrTargetLanguage:(int64_t)a3;
@end

@implementation _LTSELFLoggingTranslationTTSData

- (_LTSELFLoggingTranslationTTSData)initWithSourceOrTargetLanguage:(int64_t)a3 isAutoplayTranslation:(BOOL)a4 ttsPlaybackSpeed:(int64_t)a5 audioChannel:(int64_t)a6
{
  v14.receiver = self;
  v14.super_class = (Class)_LTSELFLoggingTranslationTTSData;
  v10 = [(_LTSELFLoggingTranslationTTSData *)&v14 init];
  v11 = v10;
  if (v10)
  {
    v10->_isAutoplayTranslation = a4;
    v10->_audioChannel = a6;
    v10->_playbackSpeed = a5;
    v10->_sourceOrTargetLanguage = a3;
    v12 = v10;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t sourceOrTargetLanguage = self->_sourceOrTargetLanguage;
  id v5 = a3;
  [v5 encodeInteger:sourceOrTargetLanguage forKey:@"sourceOrTargetLanguage"];
  [v5 encodeBool:self->_isAutoplayTranslation forKey:@"isAutoplayTranslation"];
  [v5 encodeInteger:self->_audioChannel forKey:@"audioChannel"];
  [v5 encodeInteger:self->_playbackSpeed forKey:@"playbackSpeed"];
}

- (_LTSELFLoggingTranslationTTSData)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_LTSELFLoggingTranslationTTSData;
  id v5 = [(_LTSELFLoggingTranslationTTSData *)&v8 init];
  if (v5)
  {
    v5->_int64_t sourceOrTargetLanguage = [v4 decodeIntegerForKey:@"sourceOrTargetLanguage"];
    v5->_isAutoplayTranslation = [v4 decodeBoolForKey:@"isAutoplayTranslation"];
    v5->_audioChannel = [v4 decodeIntegerForKey:@"audioChannel"];
    v5->_playbackSpeed = [v4 decodeIntegerForKey:@"playbackSpeed"];
    v6 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_LTSELFLoggingTranslationTTSData alloc];
  int64_t v5 = [(_LTSELFLoggingTranslationTTSData *)self sourceOrTargetLanguage];
  BOOL v6 = [(_LTSELFLoggingTranslationTTSData *)self isAutoplayTranslation];
  int64_t v7 = [(_LTSELFLoggingTranslationTTSData *)self playbackSpeed];
  int64_t v8 = [(_LTSELFLoggingTranslationTTSData *)self audioChannel];

  return [(_LTSELFLoggingTranslationTTSData *)v4 initWithSourceOrTargetLanguage:v5 isAutoplayTranslation:v6 ttsPlaybackSpeed:v7 audioChannel:v8];
}

- (int64_t)sourceOrTargetLanguage
{
  return self->_sourceOrTargetLanguage;
}

- (void)setSourceOrTargetLanguage:(int64_t)a3
{
  self->_int64_t sourceOrTargetLanguage = a3;
}

- (BOOL)isAutoplayTranslation
{
  return self->_isAutoplayTranslation;
}

- (void)setIsAutoplayTranslation:(BOOL)a3
{
  self->_isAutoplayTranslation = a3;
}

- (int64_t)audioChannel
{
  return self->_audioChannel;
}

- (void)setAudioChannel:(int64_t)a3
{
  self->_audioChannel = a3;
}

- (int64_t)playbackSpeed
{
  return self->_playbackSpeed;
}

- (void)setPlaybackSpeed:(int64_t)a3
{
  self->_playbackSpeed = a3;
}

@end