@interface CAMTimelapseState
+ (BOOL)supportsSecureCoding;
+ (double)maxTimeToWaitForWrittenFrameAfterStop;
+ (id)stateWithContentsOfFile:(id)a3;
- (BOOL)_commonCAMTimelapseStateInitWithCoder:(id)a3;
- (BOOL)addStopReasons:(int64_t)a3 stopTime:(id)a4;
- (BOOL)allFramesWritten;
- (BOOL)canContinueCapture;
- (BOOL)incrementFrameIndex;
- (BOOL)isCaptureMirrored;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToState:(id)a3;
- (BOOL)isReadyForWritingMovie;
- (BOOL)mergeSecondaryState:(id)a3;
- (BOOL)preferHEVC;
- (BOOL)writeToFile:(id)a3 createDirectoryIfNeeded:(BOOL)a4;
- (CAMTimelapseState)init;
- (CAMTimelapseState)initWithCoder:(id)a3;
- (CGSize)nominalIntermediateFrameSize;
- (CLLocation)startLocation;
- (NSDate)lastFrameResponseTime;
- (NSDate)startTime;
- (NSDate)stopTime;
- (NSString)timelapseUUID;
- (NSURL)localPrivateMetadataFileURL;
- (double)captureTimeInterval;
- (float)focusLensPosition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)filePathForNextFrameIndex;
- (id)fullDescription;
- (int)captureOrientation;
- (int64_t)captureDevice;
- (int64_t)connectionMode;
- (int64_t)frameIndexStride;
- (int64_t)nextFrameIndex;
- (int64_t)stopReasons;
- (unsigned)sessionIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)forceCompleted;
- (void)setAllFramesWritten:(BOOL)a3;
- (void)setCaptureDevice:(int64_t)a3;
- (void)setCaptureMirrored:(BOOL)a3;
- (void)setCaptureOrientation:(int)a3;
- (void)setFocusLensPosition:(float)a3;
- (void)setLastFrameResponseTime:(id)a3;
- (void)setLocalPrivateMetadataFileURL:(id)a3;
- (void)setNominalIntermediateFrameSize:(CGSize)a3;
- (void)setPreferHEVC:(BOOL)a3;
- (void)setSessionIdentifier:(unsigned __int16)a3;
- (void)setStartLocation:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setStopReasons:(int64_t)a3;
- (void)setStopTime:(id)a3;
- (void)setTimelapseUUID:(id)a3;
@end

@implementation CAMTimelapseState

- (BOOL)mergeSecondaryState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 stopReasons];
  v6 = [v4 stopTime];

  LOBYTE(self) = [(CAMTimelapseState *)self addStopReasons:v5 stopTime:v6];
  return (char)self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMTimelapseState)init
{
  v6.receiver = self;
  v6.super_class = (Class)CAMTimelapseState;
  v2 = [(CAMTimelapseState *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F5DB88] UUIDString];
    timelapseUUID = v2->_timelapseUUID;
    v2->_timelapseUUID = (NSString *)v3;

    if (![(CAMTimelapseState *)v2 _commonCAMTimelapseStateInitWithCoder:0])
    {

      return 0;
    }
  }
  return v2;
}

- (CAMTimelapseState)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CAMTimelapseState;
  uint64_t v5 = [(CAMTimelapseState *)&v8 init];
  objc_super v6 = v5;
  if (v5
    && ![(CAMTimelapseState *)v5 _commonCAMTimelapseStateInitWithCoder:v4])
  {

    objc_super v6 = 0;
  }

  return v6;
}

- (BOOL)_commonCAMTimelapseStateInitWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 containsValueForKey:@"timelapseUUID"])
  {
    uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timelapseUUID"];
    timelapseUUID = self->_timelapseUUID;
    self->_timelapseUUID = v5;
  }
  NSUInteger v7 = [(NSString *)self->_timelapseUUID length];
  if (v7)
  {
    if ([v4 containsValueForKey:@"captureDevice"]) {
      int64_t v8 = [v4 decodeIntegerForKey:@"captureDevice"];
    }
    else {
      int64_t v8 = 0;
    }
    self->_captureDevice = v8;
    if ([v4 containsValueForKey:@"captureOrientation"]) {
      int v9 = [v4 decodeIntegerForKey:@"captureOrientation"];
    }
    else {
      int v9 = 1;
    }
    self->_captureOrientation = v9;
    int v10 = [v4 containsValueForKey:@"captureMirrored"];
    if (v10) {
      LOBYTE(v10) = [v4 decodeBoolForKey:@"captureMirrored"];
    }
    self->_captureMirrored = v10;
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startTime"];
    startTime = self->_startTime;
    self->_startTime = v11;

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startLocation"];
    startLocation = self->_startLocation;
    self->_startLocation = v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastFrameResponseTime"];
    lastFrameResponseTime = self->_lastFrameResponseTime;
    self->_lastFrameResponseTime = v15;

    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stopTime"];
    stopTime = self->_stopTime;
    self->_stopTime = v17;

    self->_preferHEVC = [v4 decodeBoolForKey:@"timelapsePreferHEVC"];
    if ([v4 containsValueForKey:@"stopReasons"]) {
      int64_t v19 = [v4 decodeIntegerForKey:@"stopReasons"];
    }
    else {
      int64_t v19 = 0;
    }
    self->_stopReasons = v19;
    self->_allFramesWritten = [v4 decodeBoolForKey:@"allFramesWritten"];
    if ([v4 containsValueForKey:@"captureTimeInterval"])
    {
      [v4 decodeDoubleForKey:@"captureTimeInterval"];
      self->_captureTimeInterval = v20;
    }
    else
    {
      v21 = +[CAMTimelapseSettings sharedInstance];
      [v21 initialCaptureTimeInterval];
      self->_captureTimeInterval = v22;
    }
    unint64_t v23 = [v4 decodeIntegerForKey:@"frameIndexStride"];
    if (v23 <= 1) {
      int64_t v24 = 1;
    }
    else {
      int64_t v24 = v23;
    }
    self->_frameIndexStride = v24;
    self->_nextFrameIndex = [v4 decodeIntegerForKey:@"nextFrameIndex"];
    if ([v4 containsValueForKey:@"focusLensPosition"]) {
      [v4 decodeFloatForKey:@"focusLensPosition"];
    }
    else {
      +[CUCaptureController focusLensPositionCurrentSentinel];
    }
    self->_focusLensPosition = v25;
    if ([v4 containsValueForKey:@"nominalIntermediateFrameSize"])
    {
      [v4 decodeCGSizeForKey:@"nominalIntermediateFrameSize"];
      self->_nominalIntermediateFrameSize.width = v26;
      self->_nominalIntermediateFrameSize.height = v27;
    }
    else
    {
      self->_nominalIntermediateFrameSize = (CGSize)*MEMORY[0x263F001B0];
    }
    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localPrivateMetadataFileURL"];
    localPrivateMetadataFileURL = self->_localPrivateMetadataFileURL;
    self->_localPrivateMetadataFileURL = v28;
  }
  return v7 != 0;
}

- (void)encodeWithCoder:(id)a3
{
  timelapseUUID = self->_timelapseUUID;
  id v6 = a3;
  [v6 encodeObject:timelapseUUID forKey:@"timelapseUUID"];
  [v6 encodeInteger:self->_captureDevice forKey:@"captureDevice"];
  [v6 encodeInteger:self->_captureOrientation forKey:@"captureOrientation"];
  [v6 encodeBool:self->_captureMirrored forKey:@"captureMirrored"];
  [v6 encodeObject:self->_startTime forKey:@"startTime"];
  [v6 encodeObject:self->_startLocation forKey:@"startLocation"];
  [v6 encodeObject:self->_lastFrameResponseTime forKey:@"lastFrameResponseTime"];
  [v6 encodeObject:self->_stopTime forKey:@"stopTime"];
  [v6 encodeInteger:self->_stopReasons forKey:@"stopReasons"];
  [v6 encodeBool:self->_allFramesWritten forKey:@"allFramesWritten"];
  [v6 encodeDouble:@"captureTimeInterval" forKey:self->_captureTimeInterval];
  [v6 encodeInteger:self->_frameIndexStride forKey:@"frameIndexStride"];
  [v6 encodeInteger:self->_nextFrameIndex forKey:@"nextFrameIndex"];
  *(float *)&double v5 = self->_focusLensPosition;
  [v6 encodeFloat:@"focusLensPosition" forKey:v5];
  objc_msgSend(v6, "encodeCGSize:forKey:", @"nominalIntermediateFrameSize", self->_nominalIntermediateFrameSize.width, self->_nominalIntermediateFrameSize.height);
  [v6 encodeBool:self->_preferHEVC forKey:@"timelapsePreferHEVC"];
  [v6 encodeObject:self->_localPrivateMetadataFileURL forKey:@"localPrivateMetadataFileURL"];
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)CAMTimelapseState;
  id v4 = [(CAMTimelapseState *)&v7 description];
  double v5 = [v3 stringWithFormat:@"%@: timelapseUUID=%@", v4, self->_timelapseUUID];

  return v5;
}

- (id)fullDescription
{
  uint64_t v3 = [MEMORY[0x263F089D8] stringWithFormat:@"Timelapse state:\n"];
  [v3 appendFormat:@"\ttimelapseUUID = %@\n", self->_timelapseUUID];
  objc_msgSend(v3, "appendFormat:", @"\tcaptureDevice = %ld\n", self->_captureDevice);
  objc_msgSend(v3, "appendFormat:", @"\tcaptureOrientation = %d\n", self->_captureOrientation);
  objc_msgSend(v3, "appendFormat:", @"\tcaptureMirrored = %d\n", self->_captureMirrored);
  [v3 appendFormat:@"\tstartTime = %@\n", self->_startTime];
  [v3 appendFormat:@"\tstartLocation = %@\n", self->_startLocation];
  [v3 appendFormat:@"\tlastFrameResponseTime = %@\n", self->_lastFrameResponseTime];
  [v3 appendFormat:@"\tstopTime = %@\n", self->_stopTime];
  objc_msgSend(v3, "appendFormat:", @"\tstopReasons = %ld\n", self->_stopReasons);
  objc_msgSend(v3, "appendFormat:", @"\tallFramesWritten = %d\n", self->_allFramesWritten);
  objc_msgSend(v3, "appendFormat:", @"\tcaptureTimeInterval = %f\n", *(void *)&self->_captureTimeInterval);
  objc_msgSend(v3, "appendFormat:", @"\tframeIndexStride = %ld\n", self->_frameIndexStride);
  objc_msgSend(v3, "appendFormat:", @"\tnextFrameIndex = %ld\n", self->_nextFrameIndex);
  objc_msgSend(v3, "appendFormat:", @"\tfocusLensPosition = %f\n", self->_focusLensPosition);
  id v4 = NSStringFromCGSize(self->_nominalIntermediateFrameSize);
  [v3 appendFormat:@"\tnominalIntermediateFrameSize = %@\n", v4];

  double v5 = [NSNumber numberWithBool:self->_preferHEVC];
  id v6 = [v5 description];
  [v3 appendFormat:@"\tpreferHEVC = %@\n", v6];

  [v3 appendFormat:@"\tlocalPrivateMetadataFileURL = %@\n", self->_localPrivateMetadataFileURL];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
  id v4 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:0];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CAMTimelapseState *)self isEqualToState:v4];

  return v5;
}

- (BOOL)isEqualToState:(id)a3
{
  id v4 = (CAMTimelapseState *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = 1;
    objc_super v7 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:0];
    int64_t v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v5 requiringSecureCoding:1 error:0];
    if (v7 != v8) {
      char v6 = [v7 isEqualToData:v8];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)incrementFrameIndex
{
  int64_t frameIndexStride = self->_frameIndexStride;
  int64_t v4 = self->_nextFrameIndex + frameIndexStride;
  self->_nextFrameIndex = v4;
  uint64_t v5 = v4 / frameIndexStride;
  char v6 = +[CAMTimelapseSettings sharedInstance];
  uint64_t v7 = [v6 maxOutputFrames];

  if (v5 >= v7)
  {
    self->_frameIndexStride *= 2;
    self->_captureTimeInterval = self->_captureTimeInterval + self->_captureTimeInterval;
  }
  return v5 >= v7;
}

- (id)filePathForNextFrameIndex
{
  uint64_t v3 = +[CAMTimelapseDiskUtilities fileNameForImageFrameIndex:[(CAMTimelapseState *)self nextFrameIndex]];
  int64_t v4 = [(CAMTimelapseState *)self timelapseUUID];
  uint64_t v5 = +[CAMTimelapseDiskUtilities directoryPathForTimelapseUUID:v4];

  char v6 = [v5 stringByAppendingPathComponent:v3];

  return v6;
}

- (BOOL)addStopReasons:(int64_t)a3 stopTime:(id)a4
{
  id v6 = a4;
  int64_t v7 = [(CAMTimelapseState *)self stopReasons];
  BOOL v8 = (v7 | a3) == v7;
  BOOL v9 = (v7 | a3) != v7;
  if (!v8) {
    -[CAMTimelapseState setStopReasons:](self, "setStopReasons:");
  }
  uint64_t v10 = [(CAMTimelapseState *)self stopTime];
  v11 = (void *)v10;
  if (v6 && !v10)
  {
    [(CAMTimelapseState *)self setStopTime:v6];
    BOOL v9 = 1;
  }

  return v9;
}

- (int64_t)stopReasons
{
  return self->_stopReasons;
}

+ (double)maxTimeToWaitForWrittenFrameAfterStop
{
  return 2.0;
}

- (BOOL)canContinueCapture
{
  v2 = self;
  uint64_t v3 = [(CAMTimelapseState *)self stopTime];
  LOBYTE(v2) = (v3 | [(CAMTimelapseState *)v2 stopReasons]) == 0;

  return (char)v2;
}

- (BOOL)isReadyForWritingMovie
{
  if ([(CAMTimelapseState *)self canContinueCapture]) {
    return 0;
  }
  if ([(CAMTimelapseState *)self allFramesWritten]) {
    return 1;
  }
  int64_t v4 = [(CAMTimelapseState *)self stopTime];
  [v4 timeIntervalSinceNow];
  double v6 = -v5;
  [(id)objc_opt_class() maxTimeToWaitForWrittenFrameAfterStop];
  BOOL v3 = v7 <= v6;

  return v3;
}

- (void)forceCompleted
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = os_log_create("com.apple.camera", "Nebula");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v4 = [(CAMTimelapseState *)self timelapseUUID];
    int v7 = 138543618;
    BOOL v8 = v4;
    __int16 v9 = 2048;
    int64_t v10 = [(CAMTimelapseState *)self stopReasons];
    _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "Forcing completion of timelapse %{public}@ with stopReasons %ld", (uint8_t *)&v7, 0x16u);
  }
  [(id)objc_opt_class() maxTimeToWaitForWrittenFrameAfterStop];
  double v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-v5];
  [(CAMTimelapseState *)self setStopTime:v6];
  [(CAMTimelapseState *)self setAllFramesWritten:1];
}

- (BOOL)writeToFile:(id)a3 createDirectoryIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 length])
  {
    int v7 = [v6 stringByDeletingLastPathComponent];
    if (v4)
    {
      id v8 = [MEMORY[0x263F08850] defaultManager];
      if (![v8 fileExistsAtPath:v7])
      {
        id v17 = 0;
        int v9 = [v8 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v17];
        id v10 = v17;
        uint64_t v11 = v10;
        if (!v9)
        {
          v14 = os_log_create("com.apple.camera", "Nebula");
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            -[CAMTimelapseState writeToFile:createDirectoryIfNeeded:]();
          }
          BOOL v13 = 0;
          goto LABEL_18;
        }
      }
    }
    id v16 = 0;
    uint64_t v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v16];
    id v8 = v16;
    if (v8)
    {
      v12 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[CAMTimelapseState writeToFile:createDirectoryIfNeeded:]();
      }
    }
    BOOL v13 = 1;
    if ([v11 writeToFile:v6 atomically:1]) {
      goto LABEL_19;
    }
    v14 = os_log_create("com.apple.camera", "Nebula");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CAMTimelapseState writeToFile:createDirectoryIfNeeded:]();
    }
LABEL_18:

LABEL_19:
    goto LABEL_20;
  }
  BOOL v13 = 0;
LABEL_20:

  return v13;
}

+ (id)stateWithContentsOfFile:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    BOOL v4 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v3];
    if (v4)
    {
      id v9 = 0;
      double v5 = [MEMORY[0x263F08928] unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v9];
      id v6 = v9;
      if (v6)
      {
        int v7 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          +[CAMTimelapseState stateWithContentsOfFile:]();
        }
      }
    }
    else
    {
      double v5 = 0;
    }
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (int64_t)connectionMode
{
  return self->_captureTimeInterval >= 8.0;
}

- (NSString)timelapseUUID
{
  return self->_timelapseUUID;
}

- (void)setTimelapseUUID:(id)a3
{
}

- (unsigned)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(unsigned __int16)a3
{
  self->_sessionIdentifier = a3;
}

- (int64_t)captureDevice
{
  return self->_captureDevice;
}

- (void)setCaptureDevice:(int64_t)a3
{
  self->_captureDevice = a3;
}

- (int)captureOrientation
{
  return self->_captureOrientation;
}

- (void)setCaptureOrientation:(int)a3
{
  self->_captureOrientation = a3;
}

- (BOOL)isCaptureMirrored
{
  return self->_captureMirrored;
}

- (void)setCaptureMirrored:(BOOL)a3
{
  self->_captureMirrored = a3;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (CLLocation)startLocation
{
  return self->_startLocation;
}

- (void)setStartLocation:(id)a3
{
}

- (NSDate)lastFrameResponseTime
{
  return self->_lastFrameResponseTime;
}

- (void)setLastFrameResponseTime:(id)a3
{
}

- (NSDate)stopTime
{
  return self->_stopTime;
}

- (void)setStopTime:(id)a3
{
}

- (void)setStopReasons:(int64_t)a3
{
  self->_stopReasons = a3;
}

- (BOOL)allFramesWritten
{
  return self->_allFramesWritten;
}

- (void)setAllFramesWritten:(BOOL)a3
{
  self->_allFramesWritten = a3;
}

- (double)captureTimeInterval
{
  return self->_captureTimeInterval;
}

- (int64_t)frameIndexStride
{
  return self->_frameIndexStride;
}

- (int64_t)nextFrameIndex
{
  return self->_nextFrameIndex;
}

- (float)focusLensPosition
{
  return self->_focusLensPosition;
}

- (void)setFocusLensPosition:(float)a3
{
  self->_focusLensPosition = a3;
}

- (CGSize)nominalIntermediateFrameSize
{
  double width = self->_nominalIntermediateFrameSize.width;
  double height = self->_nominalIntermediateFrameSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setNominalIntermediateFrameSize:(CGSize)a3
{
  self->_nominalIntermediateFrameSize = a3;
}

- (BOOL)preferHEVC
{
  return self->_preferHEVC;
}

- (void)setPreferHEVC:(BOOL)a3
{
  self->_preferHEVC = a3;
}

- (NSURL)localPrivateMetadataFileURL
{
  return self->_localPrivateMetadataFileURL;
}

- (void)setLocalPrivateMetadataFileURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localPrivateMetadataFileURL, 0);
  objc_storeStrong((id *)&self->_stopTime, 0);
  objc_storeStrong((id *)&self->_lastFrameResponseTime, 0);
  objc_storeStrong((id *)&self->_startLocation, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_timelapseUUID, 0);
}

- (void)writeToFile:createDirectoryIfNeeded:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Error: failed to save timelapse state to file %{public}@", v2, v3, v4, v5, v6);
}

- (void)writeToFile:createDirectoryIfNeeded:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Error: failed to archive timelapse state: %{public}@", v2, v3, v4, v5, v6);
}

- (void)writeToFile:createDirectoryIfNeeded:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Error: failed to create directory: %{public}@", v2, v3, v4, v5, v6);
}

+ (void)stateWithContentsOfFile:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2099F8000, v0, v1, "Error: failed to unarchive timelapse state: %{public}@", v2, v3, v4, v5, v6);
}

@end