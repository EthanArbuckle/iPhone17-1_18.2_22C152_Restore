@interface AVMomentCaptureMovieRecordingSettings
+ (id)movieRecordingSettings;
+ (id)movieRecordingSettingsFromMomentCaptureSettings:(id)a3;
- (BOOL)isAutoSpatialOverCaptureEnabled;
- (NSArray)movieMetadata;
- (NSArray)spatialOverCaptureMovieMetadata;
- (NSString)videoCodecType;
- (NSURL)movieFileURL;
- (NSURL)spatialOverCaptureMovieFileURL;
- (id)_initFromMomentCaptureSettings:(id)a3;
- (id)_sanitizedMovieMetadataArrayForMovieMetadataArray:(id)a3 exceptionReason:(id *)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)spatialOverCaptureGroupIdentifier;
- (int64_t)uniqueID;
- (unint64_t)userInitiatedCaptureTime;
- (void)dealloc;
- (void)setAutoSpatialOverCaptureEnabled:(BOOL)a3;
- (void)setMovieFileURL:(id)a3;
- (void)setMovieMetadata:(id)a3;
- (void)setSpatialOverCaptureMovieFileURL:(id)a3;
- (void)setSpatialOverCaptureMovieMetadata:(id)a3;
- (void)setUserInitiatedCaptureTime:(unint64_t)a3;
- (void)setVideoCodecType:(id)a3;
@end

@implementation AVMomentCaptureMovieRecordingSettings

+ (id)movieRecordingSettingsFromMomentCaptureSettings:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) _initFromMomentCaptureSettings:a3];

  return v3;
}

+ (id)movieRecordingSettings
{
  v3 = +[AVMomentCaptureSettings settingsWithUserInitiatedCaptureTime:uniqueID:](AVMomentCaptureSettings, "settingsWithUserInitiatedCaptureTime:uniqueID:", mach_absolute_time(), +[AVCaptureMovieFileOutput uniqueID]);

  return (id)[a1 movieRecordingSettingsFromMomentCaptureSettings:v3];
}

- (id)_initFromMomentCaptureSettings:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMomentCaptureMovieRecordingSettings;
  v4 = [(AVMomentCaptureMovieRecordingSettings *)&v6 init];
  if (v4)
  {
    v4->_uniqueID = [a3 uniqueID];
    v4->_userInitiatedCaptureTime = [a3 userInitiatedCaptureTime];
    v4->_videoCodecType = (NSString *)(id)*MEMORY[0x1E4F47D30];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMomentCaptureMovieRecordingSettings;
  [(AVMomentCaptureMovieRecordingSettings *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [[AVMomentCaptureMovieRecordingSettings alloc] _initFromMomentCaptureSettings:+[AVMomentCaptureSettings settingsWithUserInitiatedCaptureTime:self->_userInitiatedCaptureTime]];
  v4[1] = self->_uniqueID;
  [v4 setVideoCodecType:self->_videoCodecType];
  [v4 setMovieFileURL:self->_movieFileURL];
  [v4 setMovieMetadata:self->_movieMetadata];
  [v4 setAutoSpatialOverCaptureEnabled:self->_autoSpatialOverCaptureEnabled];
  v4[7] = self->_spatialOverCaptureGroupIdentifier;
  [v4 setSpatialOverCaptureMovieFileURL:self->_spatialOverCaptureMovieFileURL];
  [v4 setSpatialOverCaptureMovieMetadata:self->_spatialOverCaptureMovieMetadata];
  return v4;
}

- (id)debugDescription
{
  if (self->_autoSpatialOverCaptureEnabled) {
    objc_super v3 = (__CFString *)[NSString stringWithFormat:@" soc:%@ %@", -[NSURL lastPathComponent](self->_spatialOverCaptureMovieFileURL, "lastPathComponent"), self->_spatialOverCaptureGroupIdentifier];
  }
  else {
    objc_super v3 = &stru_1EF4D21D0;
  }
  return (id)[NSString stringWithFormat:@"uid:%lld %@ url:%@%@", self->_uniqueID, self->_videoCodecType, -[NSURL lastPathComponent](self->_movieFileURL, "lastPathComponent"), v3];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVMomentCaptureMovieRecordingSettings debugDescription](self, "debugDescription")];
}

- (NSString)videoCodecType
{
  return self->_videoCodecType;
}

- (void)setVideoCodecType:(id)a3
{
  if (a3)
  {

    self->_videoCodecType = (NSString *)[a3 copy];
  }
  else
  {
    v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
}

- (id)spatialOverCaptureGroupIdentifier
{
  id result = self->_spatialOverCaptureGroupIdentifier;
  if (!result)
  {
    id result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
    self->_spatialOverCaptureGroupIdentifier = (NSString *)result;
  }
  return result;
}

- (NSArray)movieMetadata
{
  objc_super v3 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_movieMetadata, "count") + 1);
  v4 = v3;
  if (self->_movieMetadata) {
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:");
  }
  if (self->_autoSpatialOverCaptureEnabled)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F47DD0]);
    [v5 setKeySpace:*MEMORY[0x1E4F47CB8]];
    [v5 setKey:*MEMORY[0x1E4F47CD0]];
    objc_msgSend(v5, "setValue:", -[AVMomentCaptureMovieRecordingSettings spatialOverCaptureGroupIdentifier](self, "spatialOverCaptureGroupIdentifier"));
    [(NSArray *)v4 addObject:v5];
  }
  return v4;
}

- (void)setMovieMetadata:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [(AVMomentCaptureMovieRecordingSettings *)self _sanitizedMovieMetadataArrayForMovieMetadataArray:a3 exceptionReason:&v7];
  if (v7)
  {
    id v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
  else
  {
    objc_super v6 = v4;

    self->_movieMetadata = (NSArray *)v6;
  }
}

- (NSArray)spatialOverCaptureMovieMetadata
{
  objc_super v3 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_spatialOverCaptureMovieMetadata, "count") + 2);
  id v4 = v3;
  if (self->_spatialOverCaptureMovieMetadata) {
    -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:");
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F47DD0]);
  uint64_t v6 = *MEMORY[0x1E4F47CB8];
  [v5 setKeySpace:*MEMORY[0x1E4F47CB8]];
  [v5 setKey:*MEMORY[0x1E4F47CD0]];
  objc_msgSend(v5, "setValue:", -[AVMomentCaptureMovieRecordingSettings spatialOverCaptureGroupIdentifier](self, "spatialOverCaptureGroupIdentifier"));
  [(NSArray *)v4 addObject:v5];

  id v7 = objc_alloc_init(MEMORY[0x1E4F47DD0]);
  [v7 setKeySpace:v6];
  [v7 setKey:*MEMORY[0x1E4F47CC0]];
  [v7 setDataType:*MEMORY[0x1E4F1F068]];
  objc_msgSend(v7, "setValue:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", 1));
  [(NSArray *)v4 addObject:v7];

  return v4;
}

- (void)setSpatialOverCaptureMovieMetadata:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [(AVMomentCaptureMovieRecordingSettings *)self _sanitizedMovieMetadataArrayForMovieMetadataArray:a3 exceptionReason:&v7];
  if (v7)
  {
    id v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:AVMethodExceptionReasonWithObjectAndSelector() userInfo:0];
    if (AVCaptureShouldThrowForAPIViolations()) {
      objc_exception_throw(v5);
    }
    NSLog(&cfstr_SuppressingExc.isa, v5);
  }
  else
  {
    uint64_t v6 = v4;

    self->_spatialOverCaptureMovieMetadata = (NSArray *)v6;
  }
}

- (id)_sanitizedMovieMetadataArrayForMovieMetadataArray:(id)a3 exceptionReason:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (!v6)
  {
LABEL_10:
    v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a3, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = [a3 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (!v12) {
      return (id)[MEMORY[0x1E4F1C978] arrayWithArray:v11];
    }
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v22;
    uint64_t v15 = *MEMORY[0x1E4F47CB8];
    uint64_t v16 = *MEMORY[0x1E4F47CD0];
    uint64_t v17 = *MEMORY[0x1E4F47CC0];
LABEL_12:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(a3);
      }
      v19 = *(void **)(*((void *)&v21 + 1) + 8 * v18);
      if (objc_msgSend((id)objc_msgSend(v19, "keySpace"), "isEqual:", v15)
        && (objc_msgSend((id)objc_msgSend(v19, "key"), "isEqual:", v16) & 1) != 0)
      {
        v9 = @"AVMetadataKeySpaceQuickTimeMetadata/AVMetadataQuickTimeMetadataKeySpatialOverCaptureGroupIdentifier must not be specified";
        goto LABEL_23;
      }
      if (objc_msgSend((id)objc_msgSend(v19, "keySpace"), "isEqual:", v15)
        && (objc_msgSend((id)objc_msgSend(v19, "key"), "isEqual:", v17) & 1) != 0)
      {
        break;
      }
      objc_msgSend(v11, "addObject:", (id)objc_msgSend(v19, "copy"));
      if (v13 == ++v18)
      {
        uint64_t v13 = [a3 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v13) {
          goto LABEL_12;
        }
        return (id)[MEMORY[0x1E4F1C978] arrayWithArray:v11];
      }
    }
    v9 = @"AVMetadataKeySpaceQuickTimeMetadata/AVMetadataQuickTimeMetadataKeyContainsSpatialOverCaptureContent must not be specified";
    if (a4) {
      goto LABEL_24;
    }
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v26;
  v9 = @"Array must only contain AVMetadataItems";
LABEL_4:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v26 != v8) {
      objc_enumerationMutation(a3);
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    if (v7 == ++v10)
    {
      uint64_t v7 = [a3 countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v7) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
LABEL_23:
  if (!a4) {
    return 0;
  }
LABEL_24:
  id result = 0;
  *a4 = v9;
  return result;
}

- (int64_t)uniqueID
{
  return self->_uniqueID;
}

- (unint64_t)userInitiatedCaptureTime
{
  return self->_userInitiatedCaptureTime;
}

- (void)setUserInitiatedCaptureTime:(unint64_t)a3
{
  self->_userInitiatedCaptureTime = a3;
}

- (NSURL)movieFileURL
{
  return self->_movieFileURL;
}

- (void)setMovieFileURL:(id)a3
{
}

- (BOOL)isAutoSpatialOverCaptureEnabled
{
  return self->_autoSpatialOverCaptureEnabled;
}

- (void)setAutoSpatialOverCaptureEnabled:(BOOL)a3
{
  self->_autoSpatialOverCaptureEnabled = a3;
}

- (NSURL)spatialOverCaptureMovieFileURL
{
  return self->_spatialOverCaptureMovieFileURL;
}

- (void)setSpatialOverCaptureMovieFileURL:(id)a3
{
}

@end