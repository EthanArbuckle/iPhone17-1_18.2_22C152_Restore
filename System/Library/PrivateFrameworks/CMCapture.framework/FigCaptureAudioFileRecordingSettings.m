@interface FigCaptureAudioFileRecordingSettings
+ (BOOL)supportsSecureCoding;
- (FigCaptureAudioFileRecordingSettings)init;
- (FigCaptureAudioFileRecordingSettings)initWithCoder:(id)a3;
- (NSArray)metadata;
- (NSDictionary)audioSettings;
- (NSDictionary)cinematicAudioSettings;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioSettings:(id)a3;
- (void)setCinematicAudioSettings:(id)a3;
- (void)setMetadata:(id)a3;
@end

@implementation FigCaptureAudioFileRecordingSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureAudioFileRecordingSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureAudioFileRecordingSettings;
  return [(FigCaptureRecordingSettings *)&v3 init];
}

- (FigCaptureAudioFileRecordingSettings)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigCaptureAudioFileRecordingSettings;
  v4 = -[FigCaptureRecordingSettings initWithCoder:](&v7, sel_initWithCoder_);
  if (v4)
  {
    -[FigCaptureAudioFileRecordingSettings setAudioSettings:](v4, "setAudioSettings:", [a3 decodePropertyListForKey:@"audioSettings"]);
    -[FigCaptureAudioFileRecordingSettings setCinematicAudioSettings:](v4, "setCinematicAudioSettings:", [a3 decodePropertyListForKey:@"cinematicAudioSettings"]);
    AllowedClassSetForMetadataItems = (void *)FigCaptureMetadataUtilitiesCreateAllowedClassSetForMetadataItems();
    -[FigCaptureAudioFileRecordingSettings setMetadata:](v4, "setMetadata:", [a3 decodeObjectOfClasses:AllowedClassSetForMetadataItems forKey:@"metadata"]);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FigCaptureAudioFileRecordingSettings;
  -[FigCaptureRecordingSettings encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureAudioFileRecordingSettings audioSettings](self, "audioSettings"), @"audioSettings");
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureAudioFileRecordingSettings cinematicAudioSettings](self, "cinematicAudioSettings"), @"cinematicAudioSettings");
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureAudioFileRecordingSettings metadata](self, "metadata"), @"metadata");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FigCaptureAudioFileRecordingSettings;
  id v4 = [(FigCaptureRecordingSettings *)&v6 copyWithZone:a3];
  [v4 setAudioSettings:self->_audioSettings];
  [v4 setCinematicAudioSettings:self->_cinematicAudioSettings];
  [v4 setMetadata:self->_metadata];
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureAudioFileRecordingSettings;
  [(FigCaptureRecordingSettings *)&v3 dealloc];
}

- (id)description
{
  audioSettings = self->_audioSettings;
  if (audioSettings)
  {
    unsigned int v16 = bswap32(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](audioSettings, "objectForKeyedSubscript:", 0x1EFA48D60), "intValue"));
    id v4 = NSString;
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_audioSettings, "objectForKeyedSubscript:", 0x1EFA48D80), "floatValue");
    objc_super v6 = (__CFString *)objc_msgSend(v4, "stringWithFormat:", @" A:{%.4s %f}", &v16, v5);
  }
  else
  {
    objc_super v6 = 0;
  }
  cinematicAudioSettings = self->_cinematicAudioSettings;
  if (cinematicAudioSettings)
  {
    unsigned int v16 = bswap32(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](cinematicAudioSettings, "objectForKeyedSubscript:", 0x1EFA48D60), "intValue"));
    v8 = NSString;
    if (!v6) {
      objc_super v6 = &stru_1EFA403E0;
    }
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_cinematicAudioSettings, "objectForKeyedSubscript:", 0x1EFA48D80), "floatValue");
    objc_super v6 = (__CFString *)[v8 stringWithFormat:@"%@ CA:{%.4s %f}", v6, &v16, v9];
  }
  v10 = NSString;
  uint64_t v11 = objc_opt_class();
  int64_t v12 = [(FigCaptureRecordingSettings *)self settingsID];
  v13 = [(NSURL *)[(FigCaptureRecordingSettings *)self outputURL] lastPathComponent];
  [(FigCaptureRecordingSettings *)self maxDuration];
  return (id)[v10 stringWithFormat:@"%@ %p: captureID:%lld URL:%@ maxDur:%f maxSize:%lld diskLim:%lld%@", v11, self, v12, v13, CMTimeGetSeconds(&time), -[FigCaptureRecordingSettings maxFileSize](self, "maxFileSize"), -[FigCaptureRecordingSettings minFreeDiskSpaceLimit](self, "minFreeDiskSpaceLimit"), v6];
}

- (NSDictionary)audioSettings
{
  return self->_audioSettings;
}

- (void)setAudioSettings:(id)a3
{
}

- (NSDictionary)cinematicAudioSettings
{
  return self->_cinematicAudioSettings;
}

- (void)setCinematicAudioSettings:(id)a3
{
}

- (NSArray)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

@end