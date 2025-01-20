@interface FigCaptureRecordingSettings
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxDuration;
- (FigCaptureRecordingSettings)init;
- (FigCaptureRecordingSettings)initWithCoder:(id)a3;
- (NSString)outputFileType;
- (NSURL)outputURL;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)maxFileSize;
- (int64_t)minFreeDiskSpaceLimit;
- (int64_t)settingsID;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setMaxDuration:(id *)a3;
- (void)setMaxFileSize:(int64_t)a3;
- (void)setMinFreeDiskSpaceLimit:(int64_t)a3;
- (void)setOutputFileType:(id)a3;
- (void)setOutputURL:(id)a3;
- (void)setSettingsID:(int64_t)a3;
@end

@implementation FigCaptureRecordingSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureRecordingSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureRecordingSettings;
  return [(FigCaptureRecordingSettings *)&v3 init];
}

- (FigCaptureRecordingSettings)initWithCoder:(id)a3
{
  v4 = [(FigCaptureRecordingSettings *)self init];
  if (v4)
  {
    -[FigCaptureRecordingSettings setSettingsID:](v4, "setSettingsID:", [a3 decodeInt64ForKey:@"settingsID"]);
    -[FigCaptureRecordingSettings setOutputURL:](v4, "setOutputURL:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"outputURL"]);
    -[FigCaptureRecordingSettings setOutputFileType:](v4, "setOutputFileType:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"outputFileType"]);
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    CFDictionaryRef v8 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0), @"maxDuration");
    if (v8)
    {
      CMTimeMakeFromDictionary(&v11, v8);
      CMTime v10 = v11;
      [(FigCaptureRecordingSettings *)v4 setMaxDuration:&v10];
    }
    -[FigCaptureRecordingSettings setMaxFileSize:](v4, "setMaxFileSize:", [a3 decodeInt64ForKey:@"maxFileSize"]);
    -[FigCaptureRecordingSettings setMinFreeDiskSpaceLimit:](v4, "setMinFreeDiskSpaceLimit:", [a3 decodeInt64ForKey:@"minFreeDiskSpaceLimit"]);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", -[FigCaptureRecordingSettings settingsID](self, "settingsID"), @"settingsID");
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureRecordingSettings outputURL](self, "outputURL"), @"outputURL");
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureRecordingSettings outputFileType](self, "outputFileType"), @"outputFileType");
  if (self) {
    [(FigCaptureRecordingSettings *)self maxDuration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CFDictionaryRef v5 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  [a3 encodeObject:v5 forKey:@"maxDuration"];
  CFRelease(v5);
  objc_msgSend(a3, "encodeInt64:forKey:", -[FigCaptureRecordingSettings maxFileSize](self, "maxFileSize"), @"maxFileSize");
  objc_msgSend(a3, "encodeInt64:forKey:", -[FigCaptureRecordingSettings minFreeDiskSpaceLimit](self, "minFreeDiskSpaceLimit"), @"minFreeDiskSpaceLimit");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v4 setSettingsID:self->_settingsID];
  [v4 setOutputURL:self->_outputURL];
  [v4 setOutputFileType:self->_outputFileType];
  $95D729B680665BEAEFA1D6FCA8238556 maxDuration = self->_maxDuration;
  [v4 setMaxDuration:&maxDuration];
  [v4 setMaxFileSize:self->_maxFileSize];
  [v4 setMinFreeDiskSpaceLimit:self->_minFreeDiskSpaceLimit];
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureRecordingSettings;
  [(FigCaptureRecordingSettings *)&v3 dealloc];
}

- (int64_t)settingsID
{
  return self->_settingsID;
}

- (void)setSettingsID:(int64_t)a3
{
  self->_settingsID = a3;
}

- (NSURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
}

- (NSString)outputFileType
{
  return self->_outputFileType;
}

- (void)setOutputFileType:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)maxDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (void)setMaxDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_maxDuration.epoch = a3->var3;
  *(_OWORD *)&self->_maxDuration.value = v3;
}

- (int64_t)maxFileSize
{
  return self->_maxFileSize;
}

- (void)setMaxFileSize:(int64_t)a3
{
  self->_maxFileSize = a3;
}

- (int64_t)minFreeDiskSpaceLimit
{
  return self->_minFreeDiskSpaceLimit;
}

- (void)setMinFreeDiskSpaceLimit:(int64_t)a3
{
  self->_minFreeDiskSpaceLimit = a3;
}

@end