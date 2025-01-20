@interface FigCaptureMovieFileRecordingSettings
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval;
- ($57AEF30BA5BDD2E68F6742A1266F0E8C)bravoCameraSelectionConfigurationForRecording;
- (BOOL)audioMixWithOthersEnabled;
- (BOOL)audioWasPlayingDuringCapture;
- (BOOL)debugMetadataSidecarFileEnabled;
- (BOOL)isIrisMovieRecording;
- (BOOL)isIrisRecording;
- (BOOL)metadataIdentifiersEnabled;
- (BOOL)personSegmentationRenderingEnabled;
- (BOOL)recordVideoOrientationAndMirroringChanges;
- (BOOL)sendPreviewIOSurface;
- (BOOL)smartStyleRenderingBypassed;
- (BOOL)smartStyleReversibilitySupported;
- (BOOL)usesVirtualCaptureCard;
- (BOOL)videoMirrored;
- (BOOL)videoSTFEnabled;
- (FigCaptureMovieFileRecordingSettings)init;
- (FigCaptureMovieFileRecordingSettings)initWithCoder:(id)a3;
- (FigCaptureSmartStyle)smartStyle;
- (NSArray)movieLevelMetadata;
- (NSArray)spatialOverCaptureMovieLevelMetadata;
- (NSData)personSegmentationBackgroundColorCube;
- (NSData)personSegmentationForegroundColorCube;
- (NSDictionary)audioSettings;
- (NSDictionary)cinematicAudioSettings;
- (NSDictionary)videoSettings;
- (NSURL)spatialOverCaptureMovieURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)videoOrientation;
- (unint64_t)movieStartTimeOverride;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAudioMixWithOthersEnabled:(BOOL)a3;
- (void)setAudioSettings:(id)a3;
- (void)setAudioWasPlayingDuringCapture:(BOOL)a3;
- (void)setBravoCameraSelectionConfigurationForRecording:(id *)a3;
- (void)setCinematicAudioSettings:(id)a3;
- (void)setDebugMetadataSidecarFileEnabled:(BOOL)a3;
- (void)setIrisMovieRecording:(BOOL)a3;
- (void)setIrisRecording:(BOOL)a3;
- (void)setMetadataIdentifiersEnabled:(BOOL)a3;
- (void)setMovieFragmentInterval:(id *)a3;
- (void)setMovieLevelMetadata:(id)a3;
- (void)setMovieStartTimeOverride:(unint64_t)a3;
- (void)setPersonSegmentationBackgroundColorCube:(id)a3;
- (void)setPersonSegmentationForegroundColorCube:(id)a3;
- (void)setPersonSegmentationRenderingEnabled:(BOOL)a3;
- (void)setRecordVideoOrientationAndMirroringChanges:(BOOL)a3;
- (void)setSendPreviewIOSurface:(BOOL)a3;
- (void)setSmartStyle:(id)a3;
- (void)setSmartStyleRenderingBypassed:(BOOL)a3;
- (void)setSmartStyleReversibilitySupported:(BOOL)a3;
- (void)setSpatialOverCaptureMovieLevelMetadata:(id)a3;
- (void)setSpatialOverCaptureMovieURL:(id)a3;
- (void)setUsesVirtualCaptureCard:(BOOL)a3;
- (void)setVideoMirrored:(BOOL)a3;
- (void)setVideoOrientation:(int)a3;
- (void)setVideoSTFEnabled:(BOOL)a3;
- (void)setVideoSettings:(id)a3;
@end

@implementation FigCaptureMovieFileRecordingSettings

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (FigCaptureMovieFileRecordingSettings)init
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileRecordingSettings;
  return [(FigCaptureRecordingSettings *)&v3 init];
}

- (FigCaptureMovieFileRecordingSettings)initWithCoder:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)FigCaptureMovieFileRecordingSettings;
  v4 = -[FigCaptureRecordingSettings initWithCoder:](&v13, sel_initWithCoder_);
  if (v4)
  {
    AllowedClassSetForMetadataItems = (void *)FigCaptureMetadataUtilitiesCreateAllowedClassSetForMetadataItems();
    -[FigCaptureMovieFileRecordingSettings setVideoSettings:](v4, "setVideoSettings:", [a3 decodePropertyListForKey:@"videoSettings"]);
    -[FigCaptureMovieFileRecordingSettings setVideoMirrored:](v4, "setVideoMirrored:", [a3 decodeBoolForKey:@"videoMirrored"]);
    -[FigCaptureMovieFileRecordingSettings setVideoOrientation:](v4, "setVideoOrientation:", [a3 decodeInt32ForKey:@"videoOrientation"]);
    -[FigCaptureMovieFileRecordingSettings setRecordVideoOrientationAndMirroringChanges:](v4, "setRecordVideoOrientationAndMirroringChanges:", [a3 decodeBoolForKey:@"recordVideoOrientationAndMirroringChanges"]);
    -[FigCaptureMovieFileRecordingSettings setAudioSettings:](v4, "setAudioSettings:", [a3 decodePropertyListForKey:@"audioSettings"]);
    -[FigCaptureMovieFileRecordingSettings setCinematicAudioSettings:](v4, "setCinematicAudioSettings:", [a3 decodePropertyListForKey:@"cinematicAudioSettings"]);
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    CFDictionaryRef v9 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0), @"movieFragmentInterval");
    if (v9)
    {
      CMTimeMakeFromDictionary(&v12, v9);
      CMTime v11 = v12;
      [(FigCaptureMovieFileRecordingSettings *)v4 setMovieFragmentInterval:&v11];
    }
    -[FigCaptureMovieFileRecordingSettings setMovieLevelMetadata:](v4, "setMovieLevelMetadata:", [a3 decodeObjectOfClasses:AllowedClassSetForMetadataItems forKey:@"movieLevelMetadata"]);
    -[FigCaptureMovieFileRecordingSettings setSendPreviewIOSurface:](v4, "setSendPreviewIOSurface:", [a3 decodeBoolForKey:@"sendPreviewIOSurface"]);
    -[FigCaptureMovieFileRecordingSettings setIrisRecording:](v4, "setIrisRecording:", [a3 decodeBoolForKey:@"irisRecording"]);
    -[FigCaptureMovieFileRecordingSettings setDebugMetadataSidecarFileEnabled:](v4, "setDebugMetadataSidecarFileEnabled:", [a3 decodeBoolForKey:@"debugMetadataSidecarFilesAreSupported"]);
    -[FigCaptureMovieFileRecordingSettings setMetadataIdentifiersEnabled:](v4, "setMetadataIdentifiersEnabled:", [a3 decodeBoolForKey:@"metadataIdentifiersEnabled"]);
    objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"bravoCameraSelectionConfigurationForRecording"), "getBytes:length:", &v4->_metadataIdentifiersEnabled + 1, 20);
    -[FigCaptureMovieFileRecordingSettings setIrisMovieRecording:](v4, "setIrisMovieRecording:", [a3 decodeBoolForKey:@"irisMovieRecording"]);
    -[FigCaptureMovieFileRecordingSettings setSpatialOverCaptureMovieURL:](v4, "setSpatialOverCaptureMovieURL:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"spatialOverCaptureMovieURL"]);
    -[FigCaptureMovieFileRecordingSettings setSpatialOverCaptureMovieLevelMetadata:](v4, "setSpatialOverCaptureMovieLevelMetadata:", [a3 decodeObjectOfClasses:AllowedClassSetForMetadataItems forKey:@"spatialOverCaptureMovieLevelMetadata"]);
    -[FigCaptureMovieFileRecordingSettings setMovieStartTimeOverride:](v4, "setMovieStartTimeOverride:", [a3 decodeInt64ForKey:@"movieStartTimeOverride"]);
    -[FigCaptureMovieFileRecordingSettings setUsesVirtualCaptureCard:](v4, "setUsesVirtualCaptureCard:", [a3 decodeBoolForKey:@"usesVirtualCaptureCard"]);
    -[FigCaptureMovieFileRecordingSettings setSmartStyle:](v4, "setSmartStyle:", [a3 decodeObjectOfClass:objc_opt_class() forKey:@"smartStyle"]);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FigCaptureMovieFileRecordingSettings;
  -[FigCaptureRecordingSettings encodeWithCoder:](&v7, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureMovieFileRecordingSettings videoSettings](self, "videoSettings"), @"videoSettings");
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings videoMirrored](self, "videoMirrored"), @"videoMirrored");
  objc_msgSend(a3, "encodeInt32:forKey:", -[FigCaptureMovieFileRecordingSettings videoOrientation](self, "videoOrientation"), @"videoOrientation");
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings recordVideoOrientationAndMirroringChanges](self, "recordVideoOrientationAndMirroringChanges"), @"recordVideoOrientationAndMirroringChanges");
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureMovieFileRecordingSettings audioSettings](self, "audioSettings"), @"audioSettings");
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureMovieFileRecordingSettings cinematicAudioSettings](self, "cinematicAudioSettings"), @"cinematicAudioSettings");
  if (self) {
    [(FigCaptureMovieFileRecordingSettings *)self movieFragmentInterval];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CFDictionaryRef v5 = CMTimeCopyAsDictionary(&time, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  [a3 encodeObject:v5 forKey:@"movieFragmentInterval"];
  CFRelease(v5);
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureMovieFileRecordingSettings movieLevelMetadata](self, "movieLevelMetadata"), @"movieLevelMetadata");
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings sendPreviewIOSurface](self, "sendPreviewIOSurface"), @"sendPreviewIOSurface");
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings isIrisRecording](self, "isIrisRecording"), @"irisRecording");
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings debugMetadataSidecarFileEnabled](self, "debugMetadataSidecarFileEnabled"), @"debugMetadataSidecarFilesAreSupported");
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings metadataIdentifiersEnabled](self, "metadataIdentifiersEnabled"), @"metadataIdentifiersEnabled");
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", &self->_metadataIdentifiersEnabled + 1, 20), @"bravoCameraSelectionConfigurationForRecording");
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings isIrisMovieRecording](self, "isIrisMovieRecording"), @"irisMovieRecording");
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureMovieFileRecordingSettings spatialOverCaptureMovieURL](self, "spatialOverCaptureMovieURL"), @"spatialOverCaptureMovieURL");
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureMovieFileRecordingSettings spatialOverCaptureMovieLevelMetadata](self, "spatialOverCaptureMovieLevelMetadata"), @"spatialOverCaptureMovieLevelMetadata");
  objc_msgSend(a3, "encodeInt64:forKey:", -[FigCaptureMovieFileRecordingSettings movieStartTimeOverride](self, "movieStartTimeOverride"), @"movieStartTimeOverride");
  objc_msgSend(a3, "encodeBool:forKey:", -[FigCaptureMovieFileRecordingSettings usesVirtualCaptureCard](self, "usesVirtualCaptureCard"), @"usesVirtualCaptureCard");
  objc_msgSend(a3, "encodeObject:forKey:", -[FigCaptureMovieFileRecordingSettings smartStyle](self, "smartStyle"), @"smartStyle");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)FigCaptureMovieFileRecordingSettings;
  id v4 = [(FigCaptureRecordingSettings *)&v10 copyWithZone:a3];
  [v4 setVideoSettings:self->_videoSettings];
  [v4 setVideoMirrored:self->_videoMirrored];
  [v4 setVideoOrientation:self->_videoOrientation];
  [v4 setRecordVideoOrientationAndMirroringChanges:self->_recordVideoOrientationAndMirroringChanges];
  [v4 setAudioSettings:self->_audioSettings];
  [v4 setCinematicAudioSettings:self->_cinematicAudioSettings];
  long long v8 = *(_OWORD *)(&self->_recordVideoOrientationAndMirroringChanges + 4);
  uint64_t v9 = *(void *)&self->_movieFragmentInterval.flags;
  [v4 setMovieFragmentInterval:&v8];
  [v4 setMovieLevelMetadata:self->_movieLevelMetadata];
  [v4 setSendPreviewIOSurface:self->_sendPreviewIOSurface];
  [v4 setIrisRecording:self->_irisRecording];
  [v4 setDebugMetadataSidecarFileEnabled:self->_debugMetadataSidecarFileEnabled];
  [v4 setMetadataIdentifiersEnabled:self->_metadataIdentifiersEnabled];
  long long v6 = *(_OWORD *)(&self->_metadataIdentifiersEnabled + 1);
  int selectionBehavior_high = HIDWORD(self->_bravoCameraSelectionConfigurationForRecording.selectionBehavior);
  [v4 setBravoCameraSelectionConfigurationForRecording:&v6];
  [v4 setIrisMovieRecording:LOBYTE(self->_bravoCameraSelectionConfigurationForRecording.restrictedSelectionConditions)];
  [v4 setSpatialOverCaptureMovieURL:*(void *)&self->_irisMovieRecording];
  [v4 setSpatialOverCaptureMovieLevelMetadata:self->_spatialOverCaptureMovieURL];
  [v4 setMovieStartTimeOverride:self->_spatialOverCaptureMovieLevelMetadata];
  [v4 setPersonSegmentationRenderingEnabled:LOBYTE(self->_movieStartTimeOverride)];
  [v4 setPersonSegmentationForegroundColorCube:*(void *)&self->_personSegmentationRenderingEnabled];
  [v4 setPersonSegmentationBackgroundColorCube:self->_personSegmentationForegroundColorCube];
  [v4 setVideoSTFEnabled:LOBYTE(self->_personSegmentationBackgroundColorCube)];
  [v4 setUsesVirtualCaptureCard:BYTE1(self->_personSegmentationBackgroundColorCube)];
  [v4 setSmartStyle:*(void *)&self->_smartStyleReversibilitySupported];
  [v4 setSmartStyleReversibilitySupported:LOBYTE(self->smartStyle)];
  [v4 setSmartStyleRenderingBypassed:BYTE3(self->smartStyle)];
  [v4 setAudioWasPlayingDuringCapture:BYTE1(self->smartStyle)];
  [v4 setAudioMixWithOthersEnabled:BYTE2(self->smartStyle)];
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileRecordingSettings;
  [(FigCaptureRecordingSettings *)&v3 dealloc];
}

- (id)description
{
  videoSettings = self->_videoSettings;
  if (videoSettings) {
    v27 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" V:{%@ %dx%d O:%d M:%d trackOM:%d Prev:%d}", -[NSDictionary objectForKeyedSubscript:](videoSettings, "objectForKeyedSubscript:", @"AVVideoCodecKey"), objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_videoSettings, "objectForKeyedSubscript:", @"AVVideoWidthKey"), "intValue"), objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_videoSettings, "objectForKeyedSubscript:", @"AVVideoHeightKey"), "intValue"),
  }
                          self->_videoOrientation,
                          self->_videoMirrored,
                          self->_recordVideoOrientationAndMirroringChanges,
                          self->_sendPreviewIOSurface);
  else {
    v27 = &stru_1EFA403E0;
  }
  audioSettings = self->_audioSettings;
  if (audioSettings)
  {
    LODWORD(v28.value) = bswap32(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](audioSettings, "objectForKeyedSubscript:", 0x1EFA48D60), "intValue"));
    CFDictionaryRef v5 = NSString;
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_audioSettings, "objectForKeyedSubscript:", 0x1EFA48D80), "floatValue");
    objc_super v7 = (__CFString *)objc_msgSend(v5, "stringWithFormat:", @" A:{%.4s %f}", &v28, v6);
  }
  else
  {
    objc_super v7 = 0;
  }
  cinematicAudioSettings = self->_cinematicAudioSettings;
  if (cinematicAudioSettings)
  {
    LODWORD(v28.value) = bswap32(objc_msgSend(-[NSDictionary objectForKeyedSubscript:](cinematicAudioSettings, "objectForKeyedSubscript:", 0x1EFA48D60), "intValue"));
    uint64_t v9 = NSString;
    if (!v7) {
      objc_super v7 = &stru_1EFA403E0;
    }
    objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_cinematicAudioSettings, "objectForKeyedSubscript:", 0x1EFA48D80), "floatValue");
    objc_super v7 = (__CFString *)[v9 stringWithFormat:@"%@ CA:{%.4s %f}", v7, &v28, v10];
  }
  CMTime v11 = *(void **)&self->_irisMovieRecording;
  if (v11) {
    v26 = (__CFString *)[NSString stringWithFormat:@" overCaptureURL: %@", objc_msgSend(v11, "lastPathComponent")];
  }
  else {
    v26 = &stru_1EFA403E0;
  }
  if (LOBYTE(self->_bravoCameraSelectionConfigurationForRecording.restrictedSelectionConditions)) {
    CMTime v12 = @" isIrisMovie";
  }
  else {
    CMTime v12 = &stru_1EFA403E0;
  }
  if (LOBYTE(self->smartStyle)) {
    objc_super v13 = @" supportsReversibility";
  }
  else {
    objc_super v13 = &stru_1EFA403E0;
  }
  uint64_t v14 = [NSString stringWithFormat:@"%@ smartStyle: %@%@", v12, *(void *)&self->_smartStyleReversibilitySupported, v13];
  v15 = NSString;
  uint64_t v16 = objc_opt_class();
  int64_t v17 = [(FigCaptureRecordingSettings *)self settingsID];
  v18 = [(NSURL *)[(FigCaptureRecordingSettings *)self outputURL] lastPathComponent];
  [(FigCaptureRecordingSettings *)self maxDuration];
  Float64 Seconds = CMTimeGetSeconds(&time);
  int64_t v20 = [(FigCaptureRecordingSettings *)self maxFileSize];
  v21 = &stru_1EFA403E0;
  int64_t v22 = [(FigCaptureRecordingSettings *)self minFreeDiskSpaceLimit];
  CMTime v28 = *(CMTime *)(&self->_recordVideoOrientationAndMirroringChanges + 4);
  Float64 v23 = CMTimeGetSeconds(&v28);
  if (self->_irisRecording) {
    v21 = @" isIris";
  }
  if ([(FigCaptureMovieFileRecordingSettings *)self usesVirtualCaptureCard]) {
    v24 = "YES";
  }
  else {
    v24 = "NO";
  }
  return (id)[v15 stringWithFormat:@"%@ %p: captureID:%lld URL:%@ maxDur:%f maxSize:%lld diskLim:%lld frag:%f%@%@%@%@%@ usesVCC:%s", v16, self, v17, v18, *(void *)&Seconds, v20, v22, *(void *)&v23, v27, v7, v21, v14, v26, v24];
}

- (void)setVideoSettings:(id)a3
{
  if ((-[NSDictionary isEqual:](self->_videoSettings, "isEqual:") & 1) == 0)
  {

    self->_videoSettings = (NSDictionary *)[a3 copy];
  }
}

- (NSDictionary)videoSettings
{
  return self->_videoSettings;
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

- (BOOL)videoMirrored
{
  return self->_videoMirrored;
}

- (void)setVideoMirrored:(BOOL)a3
{
  self->_videoMirrored = a3;
}

- (int)videoOrientation
{
  return self->_videoOrientation;
}

- (void)setVideoOrientation:(int)a3
{
  self->_videoOrientation = a3;
}

- (BOOL)recordVideoOrientationAndMirroringChanges
{
  return self->_recordVideoOrientationAndMirroringChanges;
}

- (void)setRecordVideoOrientationAndMirroringChanges:(BOOL)a3
{
  self->_recordVideoOrientationAndMirroringChanges = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)movieFragmentInterval
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[4].var2;
  retstr->var3 = *(int64_t *)((char *)&self[5].var0 + 4);
  return self;
}

- (void)setMovieFragmentInterval:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)(&self->_recordVideoOrientationAndMirroringChanges + 4) = *(_OWORD *)&a3->var0;
  *(void *)&self->_movieFragmentInterval.flags = var3;
}

- (NSArray)movieLevelMetadata
{
  return self->_movieLevelMetadata;
}

- (void)setMovieLevelMetadata:(id)a3
{
}

- (BOOL)sendPreviewIOSurface
{
  return self->_sendPreviewIOSurface;
}

- (void)setSendPreviewIOSurface:(BOOL)a3
{
  self->_sendPreviewIOSurface = a3;
}

- (BOOL)isIrisRecording
{
  return self->_irisRecording;
}

- (void)setIrisRecording:(BOOL)a3
{
  self->_irisRecording = a3;
}

- (BOOL)debugMetadataSidecarFileEnabled
{
  return self->_debugMetadataSidecarFileEnabled;
}

- (void)setDebugMetadataSidecarFileEnabled:(BOOL)a3
{
  self->_debugMetadataSidecarFileEnabled = a3;
}

- (BOOL)metadataIdentifiersEnabled
{
  return self->_metadataIdentifiersEnabled;
}

- (void)setMetadataIdentifiersEnabled:(BOOL)a3
{
  self->_metadataIdentifiersEnabled = a3;
}

- ($57AEF30BA5BDD2E68F6742A1266F0E8C)bravoCameraSelectionConfigurationForRecording
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)(&self[6].var0 + 4);
  LODWORD(retstr->var2) = HIDWORD(self[6].var2);
  return self;
}

- (void)setBravoCameraSelectionConfigurationForRecording:(id *)a3
{
  int var2 = a3->var2;
  *(_OWORD *)(&self->_metadataIdentifiersEnabled + 1) = *(_OWORD *)&a3->var0;
  HIDWORD(self->_bravoCameraSelectionConfigurationForRecording.selectionBehavior) = var2;
}

- (BOOL)isIrisMovieRecording
{
  return self->_bravoCameraSelectionConfigurationForRecording.restrictedSelectionConditions;
}

- (void)setIrisMovieRecording:(BOOL)a3
{
  LOBYTE(self->_bravoCameraSelectionConfigurationForRecording.restrictedSelectionConditions) = a3;
}

- (NSURL)spatialOverCaptureMovieURL
{
  return *(NSURL **)&self->_irisMovieRecording;
}

- (void)setSpatialOverCaptureMovieURL:(id)a3
{
}

- (NSArray)spatialOverCaptureMovieLevelMetadata
{
  return (NSArray *)self->_spatialOverCaptureMovieURL;
}

- (void)setSpatialOverCaptureMovieLevelMetadata:(id)a3
{
}

- (unint64_t)movieStartTimeOverride
{
  return (unint64_t)self->_spatialOverCaptureMovieLevelMetadata;
}

- (void)setMovieStartTimeOverride:(unint64_t)a3
{
  self->_spatialOverCaptureMovieLevelMetadata = (NSArray *)a3;
}

- (BOOL)personSegmentationRenderingEnabled
{
  return self->_movieStartTimeOverride;
}

- (void)setPersonSegmentationRenderingEnabled:(BOOL)a3
{
  LOBYTE(self->_movieStartTimeOverride) = a3;
}

- (NSData)personSegmentationForegroundColorCube
{
  return *(NSData **)&self->_personSegmentationRenderingEnabled;
}

- (void)setPersonSegmentationForegroundColorCube:(id)a3
{
}

- (NSData)personSegmentationBackgroundColorCube
{
  return self->_personSegmentationForegroundColorCube;
}

- (void)setPersonSegmentationBackgroundColorCube:(id)a3
{
}

- (BOOL)videoSTFEnabled
{
  return (BOOL)self->_personSegmentationBackgroundColorCube;
}

- (void)setVideoSTFEnabled:(BOOL)a3
{
  LOBYTE(self->_personSegmentationBackgroundColorCube) = a3;
}

- (BOOL)usesVirtualCaptureCard
{
  return BYTE1(self->_personSegmentationBackgroundColorCube);
}

- (void)setUsesVirtualCaptureCard:(BOOL)a3
{
  BYTE1(self->_personSegmentationBackgroundColorCube) = a3;
}

- (FigCaptureSmartStyle)smartStyle
{
  return *(FigCaptureSmartStyle **)&self->_smartStyleReversibilitySupported;
}

- (void)setSmartStyle:(id)a3
{
}

- (BOOL)smartStyleReversibilitySupported
{
  return (BOOL)self->smartStyle;
}

- (void)setSmartStyleReversibilitySupported:(BOOL)a3
{
  LOBYTE(self->smartStyle) = a3;
}

- (BOOL)smartStyleRenderingBypassed
{
  return BYTE3(self->smartStyle);
}

- (void)setSmartStyleRenderingBypassed:(BOOL)a3
{
  BYTE3(self->smartStyle) = a3;
}

- (BOOL)audioWasPlayingDuringCapture
{
  return BYTE1(self->smartStyle);
}

- (void)setAudioWasPlayingDuringCapture:(BOOL)a3
{
  BYTE1(self->smartStyle) = a3;
}

- (BOOL)audioMixWithOthersEnabled
{
  return BYTE2(self->smartStyle);
}

- (void)setAudioMixWithOthersEnabled:(BOOL)a3
{
  BYTE2(self->smartStyle) = a3;
}

@end