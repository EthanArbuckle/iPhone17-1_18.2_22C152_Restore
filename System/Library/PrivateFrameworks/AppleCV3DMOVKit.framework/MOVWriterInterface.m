@interface MOVWriterInterface
+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)cmTimeFromTimestamp:(SEL)a3;
+ (BOOL)getSWToWExtrinsics:(id *)a3;
+ (id)makeDeviceString;
- (BOOL)addCVADepthIRTrackWithDimensions:(id)a3;
- (BOOL)addVideoTrack:(opaqueCMFormatDescription *)a3 streamID:(id)a4 encoding:(id)a5;
- (BOOL)isReady;
- (BOOL)processCVADepthIR:(id)a3;
- (BOOL)processPixelBuffer:(__CVBuffer *)a3 withTimeStamp:(id *)a4 beforeAppend:(id)a5 streamID:(id)a6;
- (BOOL)processPixelBuffer:(__CVBuffer *)a3 withTimeStamp:(id *)a4 intrinsics:(id *)a5 exposureTime:(double)a6 streamID:(id)a7;
- (BOOL)receivedAllFramesForStreams:(id)a3;
- (BOOL)setTrackMetadata:(id)a3 forMetadataStream:(id)a4;
- (CVACalibration)calibration;
- (MOVWriterInterface)initWithFileURL:(id)a3 expectedFrameRate:(double)a4 fileSummary:(id)a5;
- (MOVWriterInterface)initWithFileURL:(id)a3 expectedFrameRate:(double)a4 fileSummary:(id)a5 callbackQueue:(id)a6;
- (MOVWriterInterfaceDelegate)interface_delegate;
- (NSError)lastError;
- (NSMutableArray)movMetadataArray;
- (NSMutableDictionary)firstFrameContainer;
- (NSString)accelTrackName;
- (NSString)alsTrackName;
- (NSString)bundleID;
- (NSString)compassTrackName;
- (NSString)depthTOFTrackName;
- (NSString)deviceMotionTrackName;
- (NSString)deviceName;
- (NSString)deviceString;
- (NSString)gyroTrackName;
- (NSString)locationTrackName;
- (NSString)motionTrackName;
- (NSString)osBuildVersion;
- (NSString)productConfig;
- (NSString)productType;
- (NSString)productVersion;
- (NSString)serialNumber;
- (NSString)spuIMUTrackName;
- (NSString)version;
- (NSString)wifiTrackName;
- (__CVBuffer)getFirstBufferForStream:(id)a3 withTimestamp:(id *)a4;
- (double)writeMetadataTimeInterval;
- (id)addDefaultSummary;
- (id)arrayFrom3x3Matrix:(id *)a3;
- (id)createFileMetadata;
- (id)getSuggestedEncodingOptionsForFormat:(opaqueCMFormatDescription *)a3 streamID:(id)a4;
- (void)addFirstBufferForStream:(id)a3 buffer:(__CVBuffer *)a4 withTimestamp:(id *)a5;
- (void)addFrameMetadata:(id)a3 streamID:(id)a4;
- (void)addFrameMetadata:(id)a3 value:(id)a4 streamID:(id)a5;
- (void)addJasperExtrinsics:(id)a3;
- (void)addMovieMetadataData:(id)a3 rawValue:(id)a4;
- (void)addMovieMetadataDictionary:(id)a3 value:(id)a4;
- (void)addMovieMetadataItem:(id)a3;
- (void)addSWToWExtrinsics:(id)a3;
- (void)appendAllMetadataWithTimeStamp:(id *)a3;
- (void)appendMetadata:(id)a3 metadataID:(id)a4;
- (void)appendMetadata:(id)a3 metadataID:(id)a4 timestamp:(double)a5;
- (void)appendMetadata:(id)a3 metadataID:(id)a4 timestamp:(double)a5 enforceMonotonicity:(BOOL)a6;
- (void)clearAllMetadataBuffers;
- (void)clearFirstBufferForStream:(id)a3;
- (void)disableLegacyTracks;
- (void)enableLegacyTracks;
- (void)finishWriting:(id *)a3;
- (void)intelligentlyAppendBuffersForStreams:(id)a3;
- (void)processALSData:(id)a3 location:(int64_t *)a4;
- (void)processAccelerometerData:(id)a3 andAdditionalData:(id)a4;
- (void)processAccelerometerData:(id)a3 andAdditionalData:(id)a4 location:(int64_t *)a5;
- (void)processCMData:(id)a3;
- (void)processCVACameraCalibrationData:(id)a3;
- (void)processCVADepthTOF:(id)a3;
- (void)processCVAFeatureBuffer:(__CVBuffer *)a3 timestamp:(double)a4 syncTimestamp:(unint64_t)a5 frameId:(unint64_t)a6 streamName:(id)a7;
- (void)processCVAFeatureBuffer:(__CVBuffer *)a3 timestamp:(double)a4 syncTimestamp:(unint64_t)a5 streamName:(id)a6;
- (void)processCVAFeatureBuffer:(id)a3;
- (void)processCVAPRDevice:(id)a3;
- (void)processCVATimedValue:(id)a3;
- (void)processCVAUserEvent:(id)a3;
- (void)processClass:(id)a3 andAdditionalData:(id)a4 metadataID:(id)a5;
- (void)processClass:(id)a3 andAdditionalData:(id)a4 metadataID:(id)a5 timestamp:(double)a6;
- (void)processCompassData:(id)a3;
- (void)processCompassData:(id)a3 location:(int64_t *)a4;
- (void)processCoreLocationData:(id)a3 timestamp:(double)a4 andAdditionalData:(id)a5;
- (void)processCoreLocationData:(id)a3 timestamp:(double)a4 andAdditionalData:(id)a5 location:(int64_t *)a6;
- (void)processDeviceMotionData:(id)a3 andAdditionalData:(id)a4;
- (void)processDeviceMotionData:(id)a3 andAdditionalData:(id)a4 location:(int64_t *)a5;
- (void)processDeviceMotionData:(id)a3 location:(int64_t *)a4;
- (void)processFastPathIMUData:(id)a3 location:(int64_t *)a4;
- (void)processFastPathIMUData:(id)a3 location:(int64_t *)a4 metadataID:(id)a5;
- (void)processGyroscopeData:(id)a3 andAdditionalData:(id)a4;
- (void)processGyroscopeData:(id)a3 andAdditionalData:(id)a4 location:(int64_t *)a5;
- (void)processMotionData:(id)a3;
- (void)processMotionData:(id)a3 location:(int64_t *)a4;
- (void)processNSCoderObject:(id)a3 metadataID:(id)a4;
- (void)processNSCoderObject:(id)a3 metadataID:(id)a4 timestamp:(double)a5;
- (void)processSpuIMUData:(id)a3 location:(int64_t *)a4;
- (void)processWiFiData:(id)a3 location:(int64_t *)a4;
- (void)registerALS:(int64_t *)a3;
- (void)registerAccelerometer;
- (void)registerAccelerometer:(int64_t *)a3;
- (void)registerCMData;
- (void)registerCVACameraCalibrationData;
- (void)registerCVADepthIR;
- (void)registerCVADepthTOF;
- (void)registerCVAFeatureBuffer;
- (void)registerCVAFeatureBuffer:(id)a3 compress:(BOOL)a4;
- (void)registerCVAPRDevice;
- (void)registerCVATimedValue;
- (void)registerCVAUserEvent;
- (void)registerCompass;
- (void)registerCompass:(int64_t *)a3;
- (void)registerDeviceMotion;
- (void)registerDeviceMotion:(int64_t *)a3;
- (void)registerGyro;
- (void)registerGyro:(int64_t *)a3;
- (void)registerLocation;
- (void)registerLocation:(int64_t *)a3;
- (void)registerMetadataID:(id)a3;
- (void)registerMetadataID:(id)a3 maxBufferSize:(unint64_t)a4;
- (void)registerMotion;
- (void)registerMotion:(int64_t *)a3;
- (void)registerSpuIMU:(int64_t *)a3;
- (void)registerSpuIMU:(int64_t *)a3 version:(int64_t)a4;
- (void)registerStreamID:(id)a3 config:(id *)a4;
- (void)registerStreamID:(id)a3 withConfigObject:(id)a4;
- (void)registerWiFi:(int64_t *)a3;
- (void)setAccelTrackName:(id)a3;
- (void)setAlsTrackName:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCalibration:(id)a3;
- (void)setCompassTrackName:(id)a3;
- (void)setDepthTOFTrackName:(id)a3;
- (void)setDeviceMotionTrackName:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceString:(id)a3;
- (void)setFirstFrameContainer:(id)a3;
- (void)setGyroTrackName:(id)a3;
- (void)setInterface_delegate:(id)a3;
- (void)setIsReady:(BOOL)a3;
- (void)setLastError:(id)a3;
- (void)setLocationTrackName:(id)a3;
- (void)setMetadataAttachmentTo:(__CVBuffer *)a3 streamID:(id)a4;
- (void)setMotionTrackName:(id)a3;
- (void)setMovMetadataArray:(id)a3;
- (void)setOsBuildVersion:(id)a3;
- (void)setProductConfig:(id)a3;
- (void)setProductType:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSpuIMUTrackName:(id)a3;
- (void)setVersion:(id)a3;
- (void)setWifiTrackName:(id)a3;
- (void)setWriteMetadataTimeInterval:(double)a3;
- (void)setupMetadata:(id)a3;
- (void)streamWriter:(id)a3 stream:(id)a4 preparedTrackInputs:(id)a5 mediaType:(int64_t)a6;
- (void)streamWriterDidFailWithError:(id)a3;
- (void)streamWriterDidFinishPreparing;
- (void)streamWriterDidFinishRecording;
- (void)streamWriterEncounteredAnError:(id)a3;
@end

@implementation MOVWriterInterface

- (MOVWriterInterface)initWithFileURL:(id)a3 expectedFrameRate:(double)a4 fileSummary:(id)a5 callbackQueue:(id)a6
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v11 = a5;
  id v12 = a6;
  id v13 = a3;
  NSLog(&cfstr_MovkitMovwrite.isa);
  v58.receiver = self;
  v58.super_class = (Class)MOVWriterInterface;
  v14 = [(MOVStreamWriter *)&v58 initWithURL:v13 andExpectedFrameRate:a4];

  if (v14)
  {
    [(MOVStreamWriter *)v14 setDelegate:v14 callbackQueue:v12];
    v14->_prepared = 0;
    uint64_t v15 = objc_opt_new();
    trackAddedByStream = v14->_trackAddedByStream;
    v14->_trackAddedByStream = (NSMutableDictionary *)v15;

    firstSteamID = v14->_firstSteamID;
    v14->_firstSteamID = 0;

    uint64_t v18 = objc_opt_new();
    metadataTrackMetadata = v14->_metadataTrackMetadata;
    v14->_metadataTrackMetadata = (NSMutableDictionary *)v18;

    uint64_t v20 = objc_opt_new();
    metadataAttachmentArrays = v14->_metadataAttachmentArrays;
    v14->_metadataAttachmentArrays = (NSMutableDictionary *)v20;

    uint64_t v22 = objc_opt_new();
    metadataAttachmentArraysTimestamp = v14->_metadataAttachmentArraysTimestamp;
    v14->_metadataAttachmentArraysTimestamp = (NSMutableDictionary *)v22;

    uint64_t v24 = objc_opt_new();
    metadataLastTimestamp = v14->_metadataLastTimestamp;
    v14->_metadataLastTimestamp = (NSMutableDictionary *)v24;

    uint64_t v26 = objc_opt_new();
    metadataMaxBufferSize = v14->_metadataMaxBufferSize;
    v14->_metadataMaxBufferSize = (NSMutableDictionary *)v26;

    uint64_t v28 = objc_opt_new();
    movMetadataArray = v14->_movMetadataArray;
    v14->_movMetadataArray = (NSMutableArray *)v28;

    uint64_t v30 = objc_opt_new();
    frameMetadataDictionary = v14->_frameMetadataDictionary;
    v14->_frameMetadataDictionary = (NSMutableDictionary *)v30;

    uint64_t v32 = objc_opt_new();
    firstFrameContainer = v14->_firstFrameContainer;
    v14->_firstFrameContainer = (NSMutableDictionary *)v32;

    uint64_t v34 = objc_opt_new();
    cvaFeatureBufferCompression = v14->_cvaFeatureBufferCompression;
    v14->_cvaFeatureBufferCompression = (NSMutableDictionary *)v34;

    uint64_t v36 = MEMORY[0x263F01090];
    *(_OWORD *)&v14->_lastAppendMetadata.value = *MEMORY[0x263F01090];
    v14->_lastAppendMetadata.epoch = *(void *)(v36 + 16);
    v14->_writeMetadataTimeInterval = 0.0;
    v14->_writeLegacyTracks = 0;
    objc_storeStrong((id *)&v14->_spuIMUTrackName, @"com.apple.reality.kind.data.imu800");
    objc_storeStrong((id *)&v14->_accelTrackName, @"com.apple.reality.kind.data.accelerometer");
    objc_storeStrong((id *)&v14->_gyroTrackName, @"com.apple.reality.kind.data.gyroscope");
    objc_storeStrong((id *)&v14->_motionTrackName, @"com.apple.reality.kind.data.motion");
    objc_storeStrong((id *)&v14->_deviceMotionTrackName, @"com.apple.reality.kind.data.devicemotion");
    objc_storeStrong((id *)&v14->_locationTrackName, @"Location");
    objc_storeStrong((id *)&v14->_alsTrackName, @"com.apple.reality.kind.data.als");
    objc_storeStrong((id *)&v14->_wifiTrackName, @"com.apple.reality.kind.data.wifi");
    objc_storeStrong((id *)&v14->_compassTrackName, @"com.apple.reality.kind.data.compass");
    objc_storeStrong((id *)&v14->_depthTOFTrackName, @"com.apple.reality.kind.data.zcam_tof_pc");
    memset(&v59, 0, 512);
    uname(&v59);
    uint64_t v37 = [NSString stringWithUTF8String:v59.machine];
    productType = v14->_productType;
    v14->_productType = (NSString *)v37;

    v39 = [MEMORY[0x263F086E0] mainBundle];
    v40 = [v39 infoDictionary];
    uint64_t v41 = [v40 objectForKey:@"CFBundleVersion"];
    version = v14->_version;
    v14->_version = (NSString *)v41;

    v43 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v44 = [v43 bundleIdentifier];
    bundleID = v14->_bundleID;
    v14->_bundleID = (NSString *)v44;

    long long v57 = 0uLL;
    v46 = [MEMORY[0x263F08AB0] processInfo];
    v47 = v46;
    if (v46) {
      [v46 operatingSystemVersion];
    }
    else {
      long long v57 = 0uLL;
    }

    uint64_t v48 = objc_msgSend(NSString, "stringWithFormat:", @"%lu.%lu.%lu", v57, 0);
    osBuildVersion = v14->_osBuildVersion;
    v14->_osBuildVersion = (NSString *)v48;

    v50 = NSDictionary;
    v51 = [NSURL fileURLWithPath:@"/System/Library/CoreServices/SystemVersion.plist"];
    v52 = [v50 dictionaryWithContentsOfURL:v51 error:0];

    if (v52)
    {
      v53 = [v52 objectForKeyedSubscript:@"ProductBuildVersion"];
      uint64_t v54 = [NSString stringWithFormat:@"%@ (%@)", v14->_osBuildVersion, v53];
      v55 = v14->_osBuildVersion;
      v14->_osBuildVersion = (NSString *)v54;
    }
    objc_storeStrong((id *)&v14->_fileSummary, a5);
  }
  return v14;
}

- (MOVWriterInterface)initWithFileURL:(id)a3 expectedFrameRate:(double)a4 fileSummary:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.vio.movwriterinterface.recordercallback", 0);
  id v11 = [(MOVWriterInterface *)self initWithFileURL:v9 expectedFrameRate:v8 fileSummary:v10 callbackQueue:a4];

  return v11;
}

- (void)disableLegacyTracks
{
  self->_writeLegacyTracks = 0;
}

- (void)enableLegacyTracks
{
  self->_writeLegacyTracks = 1;
}

- (BOOL)setTrackMetadata:(id)a3 forMetadataStream:(id)a4
{
  v6 = (void *)MEMORY[0x263EFF9A0];
  id v7 = a4;
  id v8 = [v6 dictionaryWithDictionary:a3];
  id v9 = [(NSMutableDictionary *)self->_metadataTrackMetadata objectForKeyedSubscript:v7];
  [v8 addEntriesFromDictionary:v9];

  v11.receiver = self;
  v11.super_class = (Class)MOVWriterInterface;
  LOBYTE(self) = [(MOVStreamWriter *)&v11 setTrackMetadata:v8 forMetadataStream:v7];

  return (char)self;
}

- (void)registerSpuIMU:(int64_t *)a3 version:(int64_t)a4
{
  v12[1] = *MEMORY[0x263EF8340];
  v6 = +[CVAMetadataWrapper imuTrackName:a3 prefix:self->_spuIMUTrackName];
  [(MOVWriterInterface *)self registerMetadataID:v6];
  id v7 = (void *)MEMORY[0x263EFF9A0];
  objc_super v11 = @"com.apple.AppleCV3DMOVKit.fastPathIMUVersion";
  id v8 = [NSNumber numberWithInteger:a4];
  v12[0] = v8;
  id v9 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
  dispatch_queue_t v10 = [v7 dictionaryWithDictionary:v9];
  [(NSMutableDictionary *)self->_metadataTrackMetadata setObject:v10 forKeyedSubscript:v6];

  [(MOVWriterInterface *)self setTrackMetadata:0 forMetadataStream:v6];
}

- (void)registerSpuIMU:(int64_t *)a3
{
}

- (void)registerAccelerometer:(int64_t *)a3
{
  v5 = +[CVAMetadataWrapper accelerometerTrackName:a3 prefix:self->_accelTrackName];
  [(MOVWriterInterface *)self registerMetadataID:v5];

  if (self->_writeLegacyTracks)
  {
    id v6 = +[CVAMetadataWrapper accelerometerTrackName:a3 prefix:@"RawAccelerometer"];
    [(MOVWriterInterface *)self registerMetadataID:v6];
  }
}

- (void)registerAccelerometer
{
}

- (void)registerGyro:(int64_t *)a3
{
  v5 = +[CVAMetadataWrapper gyroTrackName:a3 prefix:self->_gyroTrackName];
  [(MOVWriterInterface *)self registerMetadataID:v5];

  if (self->_writeLegacyTracks)
  {
    id v6 = +[CVAMetadataWrapper gyroTrackName:a3 prefix:@"RawGyroscope"];
    [(MOVWriterInterface *)self registerMetadataID:v6];
  }
}

- (void)registerGyro
{
}

- (void)registerMotion:(int64_t *)a3
{
  id v4 = +[CVAMetadataWrapper motionTrackName:a3 prefix:self->_motionTrackName];
  [(MOVWriterInterface *)self registerMetadataID:v4];
}

- (void)registerMotion
{
}

- (void)registerDeviceMotion:(int64_t *)a3
{
  id v4 = +[CVAMetadataWrapper deviceMotionTrackName:a3 prefix:self->_deviceMotionTrackName];
  [(MOVWriterInterface *)self registerMetadataID:v4];
}

- (void)registerDeviceMotion
{
}

- (void)registerLocation:(int64_t *)a3
{
  id v4 = +[CVAMetadataWrapper locationTrackName:a3 prefix:self->_locationTrackName];
  [(MOVWriterInterface *)self registerMetadataID:v4];
}

- (void)registerLocation
{
}

- (void)registerCVAUserEvent
{
}

- (void)registerCVATimedValue
{
}

- (void)registerALS:(int64_t *)a3
{
  v5 = +[CVAMetadataWrapper alsTrackName:a3 prefix:self->_alsTrackName];
  [(MOVWriterInterface *)self registerMetadataID:v5];

  if (self->_writeLegacyTracks)
  {
    id v6 = +[CVAMetadataWrapper alsTrackName:a3 prefix:@"ALS"];
    [(MOVWriterInterface *)self registerMetadataID:v6];
  }
}

- (void)registerWiFi:(int64_t *)a3
{
  id v4 = +[CVAMetadataWrapper wifiTrackName:a3 prefix:self->_wifiTrackName];
  [(MOVWriterInterface *)self registerMetadataID:v4];
}

- (void)registerCompass:(int64_t *)a3
{
  v5 = +[CVAMetadataWrapper compassTrackName:a3 prefix:self->_compassTrackName];
  [(MOVWriterInterface *)self registerMetadataID:v5];

  if (self->_writeLegacyTracks)
  {
    id v6 = +[CVAMetadataWrapper compassTrackName:a3 prefix:@"Compass"];
    [(MOVWriterInterface *)self registerMetadataID:v6];
  }
}

- (void)registerCompass
{
}

- (void)registerCVAFeatureBuffer
{
  id v3 = +[CVAFeatureBuffer streamName:0];
  [(MOVWriterInterface *)self registerMetadataID:v3];
}

- (void)registerCVAFeatureBuffer:(id)a3 compress:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = NSNumber;
  id v8 = a3;
  id v7 = [v6 numberWithBool:v4];
  [(NSMutableDictionary *)self->_cvaFeatureBufferCompression setObject:v7 forKeyedSubscript:v8];

  [(MOVWriterInterface *)self registerMetadataID:v8];
}

- (void)registerCVADepthTOF
{
  [(MOVWriterInterface *)self registerMetadataID:self->_depthTOFTrackName];
  if (self->_writeLegacyTracks)
  {
    [(MOVWriterInterface *)self registerMetadataID:@"CVADepthTOF"];
  }
}

- (void)registerCVAPRDevice
{
}

- (void)registerCVACameraCalibrationData
{
}

- (void)registerCMData
{
}

- (void)registerCVADepthIR
{
  id v3 = [[MOVWriterInterfaceStreamEncodingObject alloc] initWithLossless:1 bitrate:0 forceH264:0 expectedFPS:0.0 extraConfigs:0.0];
  [(MOVWriterInterface *)self registerStreamID:@"com.apple.reality.kind.data.pcam_avdepth" withConfigObject:v3];
}

- (void)registerMetadataID:(id)a3
{
  id v5 = a3;
  BOOL v4 = objc_opt_new();
  [(NSMutableDictionary *)self->_metadataAttachmentArrays setObject:v4 forKeyedSubscript:v5];

  [(MOVWriterInterface *)self setupMetadata:v5];
}

- (void)registerMetadataID:(id)a3 maxBufferSize:(unint64_t)a4
{
  id v6 = a3;
  [(MOVWriterInterface *)self registerMetadataID:v6];
  id v7 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)self->_metadataMaxBufferSize setObject:v7 forKeyedSubscript:v6];
}

- (void)setupMetadata:(id)a3
{
}

- (void)addMovieMetadataDictionary:(id)a3 value:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  lastError = self->_lastError;
  self->_lastError = 0;

  if ([v11 hasPrefix:@"mdta/"])
  {
    id v8 = objc_opt_new();
    [v8 setIdentifier:v11];
    [v8 setDataType:*MEMORY[0x263F00F30]];
    [v8 setValue:v6];
    [(NSMutableArray *)self->_movMetadataArray addObject:v8];
    id v9 = [v8 identifier];
    NSLog(&cfstr_MovkitMovwrite_1.isa, v9);
  }
  else
  {
    id v8 = [NSString stringWithFormat:@"MOVKit:MOVWriterInterface - ERROR - Invalid identifer %@", v11];
    dispatch_queue_t v10 = [MEMORY[0x263F087E8] movWriterInterfaceErrorWithMessage:v8 code:14];
    id v9 = self->_lastError;
    self->_lastError = v10;
  }
}

- (void)addMovieMetadataData:(id)a3 rawValue:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  lastError = self->_lastError;
  self->_lastError = 0;

  if ([v11 hasPrefix:@"mdta/"])
  {
    id v8 = objc_opt_new();
    [v8 setIdentifier:v11];
    [v8 setDataType:*MEMORY[0x263F00F48]];
    [v8 setValue:v6];
    [(NSMutableArray *)self->_movMetadataArray addObject:v8];
    id v9 = [v8 identifier];
    NSLog(&cfstr_MovkitMovwrite_2.isa, v9);
  }
  else
  {
    id v8 = [NSString stringWithFormat:@"MOVKit:MOVWriterInterface - ERROR - Invalid identifer %@", v11];
    dispatch_queue_t v10 = [MEMORY[0x263F087E8] movWriterInterfaceErrorWithMessage:v8 code:14];
    id v9 = self->_lastError;
    self->_lastError = v10;
  }
}

- (void)addMovieMetadataItem:(id)a3
{
  movMetadataArray = self->_movMetadataArray;
  id v4 = a3;
  [(NSMutableArray *)movMetadataArray addObject:v4];
  id v5 = [v4 identifier];

  NSLog(&cfstr_MovkitMovwrite_3.isa, v5);
}

- (id)addDefaultSummary
{
  id v3 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_fileSummary];
  id v4 = v3;
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKeyedSubscript:@"deviceName"];
  }
  deviceString = self->_deviceString;
  if (deviceString) {
    [v4 setObject:deviceString forKeyedSubscript:@"hw.model"];
  }
  bundleID = self->_bundleID;
  if (bundleID) {
    [v4 setObject:bundleID forKeyedSubscript:@"CFBundleIdentifier"];
  }
  version = self->_version;
  if (version) {
    [v4 setObject:version forKeyedSubscript:@"version"];
  }
  serialNumber = self->_serialNumber;
  if (serialNumber) {
    [v4 setObject:serialNumber forKeyedSubscript:@"SerialNumber"];
  }
  osBuildVersion = self->_osBuildVersion;
  if (osBuildVersion) {
    [v4 setObject:osBuildVersion forKeyedSubscript:@"OSBuildVersion"];
  }
  productType = self->_productType;
  if (productType) {
    [v4 setObject:productType forKeyedSubscript:@"ProductType"];
  }
  productConfig = self->_productConfig;
  if (productConfig) {
    [v4 setObject:productConfig forKeyedSubscript:@"ProductConfig"];
  }
  productVersion = self->_productVersion;
  if (productVersion) {
    [v4 setObject:productVersion forKeyedSubscript:@"ProductVersion"];
  }
  v14 = +[CVAMetadataWrapper version];
  [v4 setObject:v14 forKeyedSubscript:@"movKitVersion"];

  [(MOVWriterInterface *)self addSWToWExtrinsics:v4];
  [(MOVWriterInterface *)self addJasperExtrinsics:v4];
  [v4 setObject:&unk_26CB67B28 forKeyedSubscript:@"iOS"];
  return v4;
}

+ (BOOL)getSWToWExtrinsics:(id *)a3
{
  uint64_t v4 = *MEMORY[0x263EF9D48];
  id v5 = [MEMORY[0x263EFA598] defaultDeviceWithDeviceType:*MEMORY[0x263EF9660] mediaType:*MEMORY[0x263EF9D48] position:1];
  if (v5)
  {
    id v6 = [MEMORY[0x263EFA598] defaultDeviceWithDeviceType:*MEMORY[0x263EF9670] mediaType:v4 position:1];
    id v7 = [MEMORY[0x263EFA598] extrinsicMatrixFromDevice:v5 toDevice:v6];
    BOOL v8 = v7 != 0;
    if (v7)
    {
      id v9 = v7;
      [v7 getBytes:a3 length:64];
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)addSWToWExtrinsics:(id)a3
{
  v33[12] = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  if (+[MOVWriterInterface getSWToWExtrinsics:&v29])
  {
    LODWORD(v4) = v29;
    uint64_t v28 = [NSNumber numberWithFloat:v4];
    v33[0] = v28;
    LODWORD(v5) = v30;
    v27 = [NSNumber numberWithFloat:v5];
    v33[1] = v27;
    LODWORD(v6) = v31;
    uint64_t v26 = [NSNumber numberWithFloat:v6];
    v33[2] = v26;
    LODWORD(v7) = v32;
    v25 = [NSNumber numberWithFloat:v7];
    v33[3] = v25;
    LODWORD(v8) = DWORD1(v29);
    id v9 = [NSNumber numberWithFloat:v8];
    v33[4] = v9;
    LODWORD(v10) = DWORD1(v30);
    id v11 = [NSNumber numberWithFloat:v10];
    v33[5] = v11;
    LODWORD(v12) = DWORD1(v31);
    id v13 = [NSNumber numberWithFloat:v12];
    v33[6] = v13;
    LODWORD(v14) = DWORD1(v32);
    uint64_t v15 = [NSNumber numberWithFloat:v14];
    v33[7] = v15;
    LODWORD(v16) = DWORD2(v29);
    v17 = [NSNumber numberWithFloat:v16];
    v33[8] = v17;
    LODWORD(v18) = DWORD2(v30);
    v19 = [NSNumber numberWithFloat:v18];
    v33[9] = v19;
    LODWORD(v20) = DWORD2(v31);
    v21 = [NSNumber numberWithFloat:v20];
    v33[10] = v21;
    LODWORD(v22) = DWORD2(v32);
    v23 = [NSNumber numberWithFloat:v22];
    v33[11] = v23;
    uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:12];

    [v3 setObject:v24 forKeyedSubscript:@"extrinsicsSWToW"];
  }
}

- (void)addJasperExtrinsics:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v36 = [MEMORY[0x263EFA598] defaultDeviceWithDeviceType:*MEMORY[0x263EF9640] mediaType:0 position:1];
  if (v36)
  {
    long long v31 = v3;
    double v4 = objc_opt_new();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v32 = *MEMORY[0x263EF9660];
    uint64_t v5 = *MEMORY[0x263EF9660];
    uint64_t v33 = *MEMORY[0x263EF9670];
    v56[0] = *MEMORY[0x263EF9670];
    v56[1] = v5;
    id obj = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
    uint64_t v39 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v39)
    {
      uint64_t v37 = *MEMORY[0x263EF9D48];
      uint64_t v38 = *(void *)v52;
      v35 = v4;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v52 != v38) {
            objc_enumerationMutation(obj);
          }
          uint64_t v29 = *(void *)(*((void *)&v51 + 1) + 8 * i);
          uint64_t v28 = [MEMORY[0x263EFA598] defaultDeviceWithDeviceType:v29 mediaType:v37 position:1];
          if (v28)
          {
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v30 = [MEMORY[0x263EFA598] extrinsicMatrixFromDevice:v28 toDevice:v36];
            v45 = v30;
            v46 = v28;
            if (v30)
            {
              [v30 getBytes:&v47 length:64];
            }
            else if (v29 == v33)
            {
              DWORD2(v47) = 987939115;
              *(void *)&long long v47 = 0x3F7FFC11BC281DC1;
              DWORD2(v48) = 965922039;
              *(void *)&long long v48 = 0xBC28198FBF7FFC87;
              DWORD2(v49) = 1065353048;
              *(void *)&long long v49 = 0xBAE1719F399BB6AALL;
              DWORD2(v50) = 1039292160;
              *(void *)&long long v50 = 0x406CDA9041468A09;
              if (v29 == v32) {
                goto LABEL_17;
              }
            }
            else if (v29 == v32)
            {
LABEL_17:
              DWORD2(v47) = -1150855277;
              *(void *)&long long v47 = 0x3F7FFE3BBBCEC41ELL;
              DWORD2(v48) = 991362741;
              *(void *)&long long v48 = 0xBBCEC41EBF7FFE09;
              DWORD2(v49) = 1065353065;
              *(void *)&long long v49 = 0x3B6842743B157CD4;
              DWORD2(v50) = 1035551109;
              *(void *)&long long v50 = 0xC1044D6041478794;
            }
            uint64_t v44 = [NSString stringWithFormat:@"%@.%ld", v29, 1];
            LODWORD(v7) = v47;
            v43 = [NSNumber numberWithFloat:v7];
            v55[0] = v43;
            LODWORD(v8) = v48;
            v42 = [NSNumber numberWithFloat:v8];
            v55[1] = v42;
            LODWORD(v9) = v49;
            uint64_t v41 = [NSNumber numberWithFloat:v9];
            v55[2] = v41;
            LODWORD(v10) = v50;
            v40 = [NSNumber numberWithFloat:v10];
            v55[3] = v40;
            LODWORD(v11) = DWORD1(v47);
            double v12 = [NSNumber numberWithFloat:v11];
            v55[4] = v12;
            LODWORD(v13) = DWORD1(v48);
            double v14 = [NSNumber numberWithFloat:v13];
            v55[5] = v14;
            LODWORD(v15) = DWORD1(v49);
            double v16 = [NSNumber numberWithFloat:v15];
            v55[6] = v16;
            LODWORD(v17) = DWORD1(v50);
            double v18 = [NSNumber numberWithFloat:v17];
            v55[7] = v18;
            LODWORD(v19) = DWORD2(v47);
            double v20 = [NSNumber numberWithFloat:v19];
            v55[8] = v20;
            LODWORD(v21) = DWORD2(v48);
            double v22 = [NSNumber numberWithFloat:v21];
            v55[9] = v22;
            LODWORD(v23) = DWORD2(v49);
            uint64_t v24 = [NSNumber numberWithFloat:v23];
            v55[10] = v24;
            LODWORD(v25) = DWORD2(v50);
            uint64_t v26 = [NSNumber numberWithFloat:v25];
            v55[11] = v26;
            v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:12];

            double v4 = v35;
            [v35 setObject:v27 forKeyedSubscript:v44];

            uint64_t v28 = v46;
          }
        }
        uint64_t v39 = [obj countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v39);
    }

    id v3 = v31;
    if ([v4 count]) {
      [v31 setObject:v4 forKeyedSubscript:@"extrinsicsToJasper"];
    }
  }
}

- (id)createFileMetadata
{
  id v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:self->_movMetadataArray];
  double v4 = objc_opt_new();
  [v4 setIdentifier:@"mdta/com.apple.framework.state.MOVKit"];
  uint64_t v5 = *MEMORY[0x263F00F30];
  [v4 setDataType:*MEMORY[0x263F00F30]];
  double v6 = [(MOVWriterInterface *)self addDefaultSummary];
  [v4 setValue:v6];

  [v3 addObject:v4];
  if (self->_writeLegacyTracks)
  {
    double v7 = objc_opt_new();
    [v7 setIdentifier:@"mdta/com.apple.recordingEnvironment"];
    [v7 setDataType:v5];
    double v8 = [(MOVWriterInterface *)self addDefaultSummary];
    [v7 setValue:v8];

    [v3 addObject:v7];
  }
  if (self->_calibration)
  {
    double v9 = objc_opt_new();
    [v9 setIdentifier:@"mdta/com.apple.calibration"];
    [v9 setDataType:*MEMORY[0x263F00F48]];
    double v10 = +[CVAMetadataWrapper encodeCVACalibration:self->_calibration];
    [v9 setValue:v10];

    [v3 addObject:v9];
  }

  return v3;
}

- (void)registerStreamID:(id)a3 config:(id *)a4
{
  id v17 = a3;
  double v6 = objc_opt_new();
  [v6 setObject:&unk_26CB67B40 forKeyedSubscript:qword_267C58A38];
  if (a4) {
    BOOL var0 = a4->var0;
  }
  else {
    BOOL var0 = 0;
  }
  double v8 = [NSNumber numberWithInt:var0];
  [v6 setObject:v8 forKeyedSubscript:qword_267C58A40];

  if (a4) {
    *(float *)&double v9 = a4->var1;
  }
  else {
    double v9 = 0.0;
  }
  double v10 = [NSNumber numberWithFloat:v9];
  [v6 setObject:v10 forKeyedSubscript:qword_267C58A48];

  if (a4) {
    BOOL var2 = a4->var2;
  }
  else {
    BOOL var2 = 0;
  }
  double v12 = [NSNumber numberWithInt:var2];
  [v6 setObject:v12 forKeyedSubscript:qword_267C58A50];

  [v6 setObject:&unk_26CB67B40 forKeyedSubscript:qword_267C58A58];
  double v13 = [MEMORY[0x263EFF9D0] null];
  [v6 setObject:v13 forKeyedSubscript:qword_267C58A60];

  [(NSMutableDictionary *)self->_trackAddedByStream setObject:v6 forKeyedSubscript:v17];
  double v14 = objc_opt_new();
  [(NSMutableDictionary *)self->_frameMetadataDictionary setObject:v14 forKeyedSubscript:v17];

  if (!self->_firstSteamID)
  {
    double v15 = [NSString stringWithString:v17];
    firstSteamID = self->_firstSteamID;
    self->_firstSteamID = v15;
  }
}

- (void)registerStreamID:(id)a3 withConfigObject:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  double v7 = objc_opt_new();
  [v7 setObject:&unk_26CB67B40 forKeyedSubscript:qword_267C58A38];
  double v8 = NSNumber;
  if (v6) {
    uint64_t v9 = [v6 lossless];
  }
  else {
    uint64_t v9 = 0;
  }
  double v10 = [v8 numberWithInt:v9];
  [v7 setObject:v10 forKeyedSubscript:qword_267C58A40];

  double v11 = NSNumber;
  if (v6) {
    [v6 bitrate];
  }
  else {
    double v12 = 0.0;
  }
  double v13 = [v11 numberWithFloat:v12];
  [v7 setObject:v13 forKeyedSubscript:qword_267C58A48];

  double v14 = NSNumber;
  if (v6) {
    uint64_t v15 = [v6 forceH264];
  }
  else {
    uint64_t v15 = 0;
  }
  double v16 = [v14 numberWithInt:v15];
  [v7 setObject:v16 forKeyedSubscript:qword_267C58A50];

  id v17 = NSNumber;
  if (v6)
  {
    [v6 expectedFPS];
    double v18 = objc_msgSend(v17, "numberWithFloat:");
    [v7 setObject:v18 forKeyedSubscript:qword_267C58A58];

    [v6 extraConfigs];
  }
  else
  {
    double v19 = [NSNumber numberWithFloat:0.0];
    [v7 setObject:v19 forKeyedSubscript:qword_267C58A58];

    [MEMORY[0x263EFF9D0] null];
  double v20 = };
  [v7 setObject:v20 forKeyedSubscript:qword_267C58A60];

  [(NSMutableDictionary *)self->_trackAddedByStream setObject:v7 forKeyedSubscript:v24];
  double v21 = objc_opt_new();
  [(NSMutableDictionary *)self->_frameMetadataDictionary setObject:v21 forKeyedSubscript:v24];

  if (!self->_firstSteamID)
  {
    double v22 = [NSString stringWithString:v24];
    firstSteamID = self->_firstSteamID;
    self->_firstSteamID = v22;
  }
}

- (BOOL)addCVADepthIRTrackWithDimensions:(id)a3
{
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  if (CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], 0x31332E33u, a3.var0, a3.var1, 0, &formatDescriptionOut))
  {
    NSLog(&cfstr_MovkitMovwrite_4.isa);
    return 0;
  }
  else
  {
    BOOL v5 = [(MOVWriterInterface *)self addVideoTrack:formatDescriptionOut streamID:@"com.apple.reality.kind.data.pcam_avdepth" encoding:0];
    if (v5)
    {
      id v6 = [(NSMutableDictionary *)self->_trackAddedByStream objectForKeyedSubscript:@"com.apple.reality.kind.data.pcam_avdepth"];
      [v6 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:qword_267C58A38];
    }
    CFRelease(formatDescriptionOut);
    return v5;
  }
}

- (void)addFirstBufferForStream:(id)a3 buffer:(__CVBuffer *)a4 withTimestamp:(id *)a5
{
  id v8 = a3;
  CVPixelBufferRetain(a4);
  uint64_t v9 = [TimedBuffer alloc];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a5;
  double v10 = [(TimedBuffer *)v9 initWithBuffer:a4 atTimestamp:&v12];
  [(MOVWriterInterface *)self clearFirstBufferForStream:v8];
  double v11 = [(MOVWriterInterface *)self firstFrameContainer];
  [v11 setObject:v10 forKeyedSubscript:v8];
}

- (__CVBuffer)getFirstBufferForStream:(id)a3 withTimestamp:(id *)a4
{
  id v6 = a3;
  double v7 = [(MOVWriterInterface *)self firstFrameContainer];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (v8)
  {
    uint64_t v9 = [(MOVWriterInterface *)self firstFrameContainer];
    double v10 = [v9 objectForKeyedSubscript:v6];
    double v11 = (__CVBuffer *)[v10 buffer];

    $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = [(MOVWriterInterface *)self firstFrameContainer];
    double v13 = [v12 objectForKeyedSubscript:v6];
    double v14 = v13;
    if (v13)
    {
      [v13 timestamp];
    }
    else
    {
      long long v16 = 0uLL;
      int64_t v17 = 0;
    }
    *(_OWORD *)&a4->BOOL var0 = v16;
    a4->var3 = v17;
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (BOOL)receivedAllFramesForStreams:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        double v10 = [(MOVWriterInterface *)self firstFrameContainer];
        double v11 = [v10 objectForKeyedSubscript:v9];

        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_11:

  return v12;
}

- (void)intelligentlyAppendBuffersForStreams:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(MOVWriterInterface *)self firstFrameContainer];
  uint64_t v6 = [v5 keysSortedByValueUsingComparator:&unk_26CB5E438];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 == v10)
        {
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if (![v4 containsObject:v13]) {
            goto LABEL_7;
          }
        }
        else
        {
          objc_enumerationMutation(v7);
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          if (![v4 containsObject:v13]) {
            goto LABEL_7;
          }
        }
        long long v14 = [(MOVWriterInterface *)self firstFrameContainer];
        long long v15 = [v14 objectForKeyedSubscript:v13];
        uint64_t v16 = [v15 buffer];

        memset(&v21, 0, sizeof(v21));
        long long v17 = [(MOVWriterInterface *)self firstFrameContainer];
        double v18 = [v17 objectForKeyedSubscript:v13];
        uint64_t v19 = v18;
        if (v18) {
          [v18 timestamp];
        }
        else {
          memset(&v21, 0, sizeof(v21));
        }

        CMTime time = v21;
        Float64 Seconds = CMTimeGetSeconds(&time);
        NSLog(&cfstr_MovkitMovwrite_5.isa, v13, *(void *)&Seconds);
        CMTime time = v21;
        [(MOVStreamWriter *)self appendPixelBuffer:v16 presentationTime:&time toStreamId:v13];
LABEL_7:
        [(MOVWriterInterface *)self clearFirstBufferForStream:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  [(MOVWriterInterface *)self setFirstFrameContainer:0];
}

- (void)clearFirstBufferForStream:(id)a3
{
  id v10 = a3;
  id v4 = [(MOVWriterInterface *)self firstFrameContainer];
  uint64_t v5 = [v4 objectForKeyedSubscript:v10];

  if (v5)
  {
    uint64_t v6 = [(MOVWriterInterface *)self firstFrameContainer];
    id v7 = [v6 objectForKeyedSubscript:v10];
    uint64_t v8 = (__CVBuffer *)[v7 buffer];

    uint64_t v9 = [(MOVWriterInterface *)self firstFrameContainer];
    [v9 setObject:0 forKeyedSubscript:v10];

    CVPixelBufferRelease(v8);
  }
}

- (id)getSuggestedEncodingOptionsForFormat:(opaqueCMFormatDescription *)a3 streamID:(id)a4
{
  id v6 = a4;
  id v7 = [(NSMutableDictionary *)self->_trackAddedByStream objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 objectForKeyedSubscript:qword_267C58A40];
  char v9 = [v8 BOOLValue];

  id v10 = [v7 objectForKeyedSubscript:qword_267C58A48];
  uint64_t v11 = [v10 integerValue];

  FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  if (MediaSubType != 825437747)
  {
    if (MediaSubType == 1278226488)
    {
      if (v9)
      {
        uint64_t v13 = [MEMORY[0x263F535C0] monochrome8bitHEVCLosslessEncoderConfig];
        goto LABEL_22;
      }
      if (v11) {
        [MEMORY[0x263F535C0] monochrome8bitHEVCEncoderConfigWithBitrate:v11];
      }
      else {
        [MEMORY[0x263F535C0] monochrome8bitHEVCEncoderConfig];
      }
    }
    else
    {
      long long v14 = [v7 objectForKeyedSubscript:qword_267C58A50];
      if ([v14 BOOLValue])
      {
      }
      else
      {
        char v15 = [MEMORY[0x263F535C0] isEncoderAvailableForEncoderType:9];

        if (v15)
        {
          if (v9)
          {
            uint64_t v13 = [MEMORY[0x263F535C0] colorHEVCLosslessEncoderConfig];
            goto LABEL_22;
          }
          if (v11) {
            [MEMORY[0x263F535C0] colorHEVCEncoderConfigWithBitrate:v11];
          }
          else {
            [MEMORY[0x263F535C0] colorHEVCEncoderConfig];
          }
          goto LABEL_20;
        }
      }
      if (v11) {
        [MEMORY[0x263F535C0] colorH264EncoderConfigWithBitrate:v11];
      }
      else {
        [MEMORY[0x263F535C0] colorH264EncoderConfig];
      }
    }
    uint64_t v13 = LABEL_20:;
    goto LABEL_22;
  }
  if ((v9 & 1) == 0)
  {
    id v27 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Streams with 13.3 format requires lossless encoding" userInfo:0];
    objc_exception_throw(v27);
  }
  uint64_t v13 = [MEMORY[0x263F535C0] slimEncoderConfig];
LABEL_22:
  uint64_t v16 = (void *)v13;
  long long v17 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v13];
  [v17 setObject:&unk_26CB67B40 forKeyedSubscript:*MEMORY[0x263F535E0]];
  double v18 = [v7 objectForKeyedSubscript:qword_267C58A58];
  [v18 floatValue];
  float v20 = v19;

  if (v20 > 0.0)
  {
    CMTime v21 = [v7 objectForKeyedSubscript:qword_267C58A58];
    [v17 setObject:v21 forKeyedSubscript:*MEMORY[0x263F535D8]];
  }
  long long v22 = [v7 objectForKeyedSubscript:qword_267C58A60];
  long long v23 = [MEMORY[0x263EFF9D0] null];
  char v24 = [v22 isEqual:v23];

  if ((v24 & 1) == 0)
  {
    long long v25 = [v7 objectForKeyedSubscript:qword_267C58A60];
    [v17 addEntriesFromDictionary:v25];
  }
  return v17;
}

- (BOOL)addVideoTrack:(opaqueCMFormatDescription *)a3 streamID:(id)a4 encoding:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  lastError = self->_lastError;
  self->_lastError = 0;

  if (!v9)
  {
    id v9 = [(MOVWriterInterface *)self getSuggestedEncodingOptionsForFormat:a3 streamID:v8];
  }
  [(MOVStreamWriter *)self addTrackForStreamWithIdentifier:v8 formatDescription:a3 recordingConfiguration:v9];
  NSLog(&cfstr_MovkitMovwrite_6.isa, v8);

  return 1;
}

- (BOOL)processPixelBuffer:(__CVBuffer *)a3 withTimeStamp:(id *)a4 beforeAppend:(id)a5 streamID:(id)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v42 = (void (**)(id, __CVBuffer *))a5;
  id v43 = a6;
  id v8 = self;
  objc_sync_enter(v8);
  lastError = v8->_lastError;
  v8->_lastError = 0;

  id v10 = [(NSMutableDictionary *)v8->_trackAddedByStream valueForKey:v8->_firstSteamID];

  if (v10)
  {
    uint64_t v11 = [(NSMutableDictionary *)v8->_trackAddedByStream objectForKeyedSubscript:v8->_firstSteamID];
    BOOL v12 = [v11 objectForKeyedSubscript:qword_267C58A38];
    int v13 = [v12 BOOLValue];
  }
  else
  {
    int v13 = 0;
  }
  if (([v43 isEqualToString:v8->_firstSteamID] | v13) != 1)
  {
    objc_sync_exit(v8);

    goto LABEL_36;
  }
  long long v14 = [(NSMutableDictionary *)v8->_trackAddedByStream valueForKey:v43];

  id obj = v8;
  if (!v14
    || ([(NSMutableDictionary *)v8->_trackAddedByStream objectForKeyedSubscript:v43],
        char v15 = objc_claimAutoreleasedReturnValue(),
        [v15 objectForKeyedSubscript:qword_267C58A38],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        char v17 = [v16 BOOLValue],
        v16,
        v15,
        (v17 & 1) == 0))
  {
    double v18 = (const void *)[MEMORY[0x263F535C0] formatForPixelBuffer:a3];
    if ([(MOVWriterInterface *)v8 addVideoTrack:v18 streamID:v43 encoding:0])
    {
      float v19 = [(NSMutableDictionary *)v8->_trackAddedByStream objectForKeyedSubscript:v43];
      float v20 = [NSNumber numberWithBool:1];
      [v19 setObject:v20 forKeyedSubscript:qword_267C58A38];
    }
    CFRelease(v18);
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  CMTime v21 = [(NSMutableDictionary *)v8->_trackAddedByStream allKeys];
  uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (!v22)
  {

    p_isa = (id *)&v8->super.super.isa;
    if (v8->_prepared) {
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  uint64_t v23 = *(void *)v47;
  char v24 = 1;
  do
  {
    for (uint64_t i = 0; i != v22; ++i)
    {
      if (*(void *)v47 != v23) {
        objc_enumerationMutation(v21);
      }
      uint64_t v26 = [(NSMutableDictionary *)obj->_trackAddedByStream objectForKeyedSubscript:*(void *)(*((void *)&v46 + 1) + 8 * i)];
      id v27 = [v26 objectForKeyedSubscript:qword_267C58A38];
      char v28 = [v27 BOOLValue];

      v24 &= v28;
    }
    uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v50 count:16];
  }
  while (v22);

  p_isa = (id *)&obj->super.super.isa;
  if ((v24 & 1) != 0 && !obj->_prepared)
  {
LABEL_22:
    if ([p_isa[71] count] == 1)
    {
      firstFrameContainer = obj->_firstFrameContainer;
      obj->_firstFrameContainer = 0;
    }
    long long v31 = [(MOVWriterInterface *)obj createFileMetadata];
    [(MOVStreamWriter *)obj prepareToRecordWithMovieMetadata:v31];
    obj->_prepared = 1;

    p_isa = (id *)&obj->super.super.isa;
  }
LABEL_25:
  objc_sync_exit(p_isa);

  uint64_t v32 = obj;
  if (!obj->_isReady) {
    goto LABEL_36;
  }
  if (v42)
  {
    v42[2](v42, a3);
    uint64_t v32 = obj;
  }
  [(MOVWriterInterface *)v32 setMetadataAttachmentTo:a3 streamID:v43];
  uint64_t v33 = obj;
  if (obj->_firstFrameContainer)
  {
    CMTime time = (CMTime)*a4;
    Float64 Seconds = CMTimeGetSeconds(&time);
    NSLog(&cfstr_MovkitMovwrite_7.isa, v43, *(void *)&Seconds);
    CMTime time = (CMTime)*a4;
    [(MOVWriterInterface *)obj addFirstBufferForStream:v43 buffer:a3 withTimestamp:&time];
    v35 = [(NSMutableDictionary *)obj->_trackAddedByStream allKeys];
    BOOL v36 = [(MOVWriterInterface *)obj receivedAllFramesForStreams:v35];

    if (v36)
    {
      NSLog(&cfstr_MovkitMovwrite_8.isa);
      uint64_t v37 = [(NSMutableDictionary *)obj->_trackAddedByStream allKeys];
      [(MOVWriterInterface *)obj intelligentlyAppendBuffersForStreams:v37];

      uint64_t v33 = obj;
      goto LABEL_32;
    }
LABEL_36:
    BOOL v38 = 0;
    goto LABEL_37;
  }
  CMTime time = (CMTime)*a4;
  [(MOVStreamWriter *)obj appendPixelBuffer:a3 presentationTime:&time toStreamId:v43];
LABEL_32:
  if ([(NSString *)v33->_firstSteamID isEqualToString:v43]
    && obj->_writeMetadataTimeInterval <= 0.0)
  {
    CMTime time = (CMTime)*a4;
    [(MOVWriterInterface *)obj appendAllMetadataWithTimeStamp:&time];
  }
  BOOL v38 = 1;
LABEL_37:

  return v38;
}

- (BOOL)processPixelBuffer:(__CVBuffer *)a3 withTimeStamp:(id *)a4 intrinsics:(id *)a5 exposureTime:(double)a6 streamID:(id)a7
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_21B5BEC5C;
  v9[3] = &unk_2643ABF90;
  v9[4] = self;
  v9[5] = a5;
  *(double *)&v9[6] = a6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  return [(MOVWriterInterface *)self processPixelBuffer:a3 withTimeStamp:&v8 beforeAppend:v9 streamID:a7];
}

- (BOOL)processCVADepthIR:(id)a3
{
  id v4 = a3;
  OSType PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[v4 dataBuffer]);
  if (PixelFormatType == 825437747)
  {
    uint64_t v5 = [v4 dataBuffer];
    [v4 timestamp];
    +[MOVWriterInterface cmTimeFromTimestamp:](MOVWriterInterface, "cmTimeFromTimestamp:");
    BOOL v6 = [(MOVWriterInterface *)self processPixelBuffer:v5 withTimeStamp:v9 beforeAppend:0 streamID:@"com.apple.reality.kind.data.pcam_avdepth"];
  }
  else
  {
    id v7 = (void *)[[NSString alloc] initWithBytesNoCopy:&PixelFormatType length:4 encoding:1 freeWhenDone:0];
    NSLog(&cfstr_MovkitMovwrite_9.isa, v7);

    BOOL v6 = 0;
  }

  return v6;
}

- (id)arrayFrom3x3Matrix:(id *)a3
{
  if (a3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:9];
    LODWORD(v5) = *(_DWORD *)a3;
    BOOL v6 = [NSNumber numberWithFloat:v5];
    [v4 addObject:v6];

    LODWORD(v7) = *((_DWORD *)a3 + 1);
    $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [NSNumber numberWithFloat:v7];
    [v4 addObject:v8];

    LODWORD(v9) = *((_DWORD *)a3 + 2);
    id v10 = [NSNumber numberWithFloat:v9];
    [v4 addObject:v10];

    LODWORD(v11) = *((_DWORD *)a3 + 4);
    BOOL v12 = [NSNumber numberWithFloat:v11];
    [v4 addObject:v12];

    LODWORD(v13) = *((_DWORD *)a3 + 5);
    long long v14 = [NSNumber numberWithFloat:v13];
    [v4 addObject:v14];

    LODWORD(v15) = *((_DWORD *)a3 + 6);
    uint64_t v16 = [NSNumber numberWithFloat:v15];
    [v4 addObject:v16];

    LODWORD(v17) = *((_DWORD *)a3 + 8);
    double v18 = [NSNumber numberWithFloat:v17];
    [v4 addObject:v18];

    LODWORD(v19) = *((_DWORD *)a3 + 9);
    float v20 = [NSNumber numberWithFloat:v19];
    [v4 addObject:v20];

    LODWORD(v21) = *((_DWORD *)a3 + 10);
    uint64_t v22 = [NSNumber numberWithFloat:v21];
    [v4 addObject:v22];

    uint64_t v23 = v4;
  }
  else
  {
    uint64_t v23 = 0;
  }
  return v23;
}

- (void)setMetadataAttachmentTo:(__CVBuffer *)a3 streamID:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  double v7 = self;
  objc_sync_enter(v7);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [(NSMutableDictionary *)v7->_frameMetadataDictionary objectForKeyedSubscript:v6];
  double v9 = v8;
  if (v8)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v10);
          }
          CVBufferSetAttachment(a3, *(CFStringRef *)(*((void *)&v14 + 1) + 8 * v13), (CFTypeRef)objc_msgSend(v10, "objectForKey:", *(void *)(*((void *)&v14 + 1) + 8 * v13), (void)v14), kCVAttachmentMode_ShouldPropagate);
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }

    [v10 removeAllObjects];
  }

  objc_sync_exit(v7);
}

- (void)finishWriting:(id *)a3
{
  NSLog(&cfstr_MovkitMovwrite_10.isa, a2);
  double v5 = self;
  objc_sync_enter(v5);
  v5->_isReady = 0;
  objc_sync_exit(v5);

  if (a3) {
    *a3 = 0;
  }
  long long v6 = *MEMORY[0x263F01088];
  uint64_t v7 = *(void *)(MEMORY[0x263F01088] + 16);
  [(MOVWriterInterface *)v5 appendAllMetadataWithTimeStamp:&v6];
  [(MOVStreamWriter *)v5 finishRecording];
}

- (void)streamWriterDidFinishPreparing
{
  NSLog(&cfstr_MovkitMovwrite_11.isa, a2);
  id v3 = self;
  objc_sync_enter(v3);
  v3->_isReady = 1;
  objc_sync_exit(v3);

  p_interface_delegate = (id *)&v3->_interface_delegate;
  id WeakRetained = objc_loadWeakRetained(p_interface_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained(p_interface_delegate);
    [v7 isReadyToRecord];
  }
}

- (void)streamWriterDidFailWithError:(id)a3
{
  id v13 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  double v5 = NSString;
  uint64_t v6 = [v13 description];
  id v7 = [v5 stringWithFormat:@"StreamWriter failure: %@", v6];

  uint64_t v8 = [MEMORY[0x263F087E8] movWriterInterfaceErrorWithMessage:v7 code:5];
  lastError = v4->_lastError;
  v4->_lastError = (NSError *)v8;

  v4->_isReady = 0;
  objc_sync_exit(v4);

  p_interface_delegate = (id *)&v4->_interface_delegate;
  id WeakRetained = objc_loadWeakRetained(p_interface_delegate);
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v12 = objc_loadWeakRetained(p_interface_delegate);
    [v12 didFailWithError:v13];
  }
}

- (void)streamWriterDidFinishRecording
{
  NSLog(&cfstr_MovkitMovwrite_12.isa, a2);
  id v3 = self;
  objc_sync_enter(v3);
  v3->_isReady = 0;
  objc_sync_exit(v3);

  p_interface_delegate = (id *)&v3->_interface_delegate;
  id WeakRetained = objc_loadWeakRetained(p_interface_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained(p_interface_delegate);
    [v7 didFinishRecording];
  }
}

- (void)streamWriterEncounteredAnError:(id)a3
{
  id v13 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  double v5 = NSString;
  uint64_t v6 = [v13 description];
  id v7 = [v5 stringWithFormat:@"StreamWriter error: %@", v6];

  uint64_t v8 = [MEMORY[0x263F087E8] movWriterInterfaceErrorWithMessage:v7 code:5];
  lastError = v4->_lastError;
  v4->_lastError = (NSError *)v8;

  objc_sync_exit(v4);
  p_interface_delegate = (id *)&v4->_interface_delegate;
  id WeakRetained = objc_loadWeakRetained(p_interface_delegate);
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    id v12 = objc_loadWeakRetained(p_interface_delegate);
    [v12 didEncounterError:v13];
  }
}

- (void)streamWriter:(id)a3 stream:(id)a4 preparedTrackInputs:(id)a5 mediaType:(int64_t)a6
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  NSLog(&cfstr_Movwriterinter_0.isa, v7);
  if ([v7 isEqualToString:@"com.apple.reality.kind.data.pcam_avdepth"])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      uint64_t v13 = *MEMORY[0x263EF95D8];
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v14++) setMediaDataLocation:v13];
        }
        while (v11 != v14);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)addFrameMetadata:(id)a3 value:(id)a4 streamID:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = self;
  objc_sync_enter(v10);
  uint64_t v11 = [(NSMutableDictionary *)v10->_frameMetadataDictionary objectForKeyedSubscript:v9];
  uint64_t v12 = v11;
  if (v11) {
    [v11 setObject:v8 forKeyedSubscript:v13];
  }

  objc_sync_exit(v10);
}

- (void)addFrameMetadata:(id)a3 streamID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  id v8 = [(NSMutableDictionary *)v7->_frameMetadataDictionary objectForKeyedSubscript:v6];
  id v9 = v8;
  if (v8) {
    [v8 addEntriesFromDictionary:v10];
  }

  objc_sync_exit(v7);
}

- (void)processFastPathIMUData:(id)a3 location:(int64_t *)a4
{
  if (a3)
  {
    id v6 = a3;
    double v7 = *(double *)([v6 bytes] + 8);
    id v8 = +[CVAMetadataWrapper imuTrackName:a4 prefix:self->_spuIMUTrackName];
    [(MOVWriterInterface *)self appendMetadata:v6 metadataID:v8 timestamp:v7];
  }
}

- (void)processFastPathIMUData:(id)a3 location:(int64_t *)a4 metadataID:(id)a5
{
  if (a3)
  {
    id v8 = a5;
    id v9 = a3;
    +[CVASpuFastPathComboAxisData getTimestamp:v9];
    double v11 = v10;
    id v12 = +[CVAMetadataWrapper imuTrackName:a4 prefix:v8];

    [(MOVWriterInterface *)self appendMetadata:v9 metadataID:v12 timestamp:v11];
  }
}

- (void)processSpuIMUData:(id)a3 location:(int64_t *)a4
{
  id v8 = a3;
  id v6 = +[CVAMetadataWrapper encodeIMUData:](CVAMetadataWrapper, "encodeIMUData:");
  if (v6)
  {
    double v7 = +[CVAMetadataWrapper imuTrackName:a4 prefix:self->_spuIMUTrackName];
    [v8 timestamp];
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v7);
  }
}

- (void)processAccelerometerData:(id)a3 andAdditionalData:(id)a4 location:(int64_t *)a5
{
  id v10 = a3;
  double v7 = +[CVAMetadataWrapper encodeAccelerometerData:andAdditionalData:](CVAMetadataWrapper, "encodeAccelerometerData:andAdditionalData:");
  if (v7)
  {
    id v8 = +[CVAMetadataWrapper accelerometerTrackName:a5 prefix:self->_accelTrackName];
    [v10 timestamp];
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v7, v8);

    if (self->_writeLegacyTracks)
    {
      id v9 = +[CVAMetadataWrapper accelerometerTrackName:a5 prefix:@"RawAccelerometer"];
      [v10 timestamp];
      -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v7, v9);
    }
  }
}

- (void)processAccelerometerData:(id)a3 andAdditionalData:(id)a4
{
}

- (void)processGyroscopeData:(id)a3 andAdditionalData:(id)a4 location:(int64_t *)a5
{
  id v10 = a3;
  double v7 = +[CVAMetadataWrapper encodeGyroscopeData:andAdditionalData:](CVAMetadataWrapper, "encodeGyroscopeData:andAdditionalData:");
  if (v7)
  {
    id v8 = +[CVAMetadataWrapper gyroTrackName:a5 prefix:self->_gyroTrackName];
    [v10 timestamp];
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v7, v8);

    if (self->_writeLegacyTracks)
    {
      id v9 = +[CVAMetadataWrapper gyroTrackName:a5 prefix:@"RawGyroscope"];
      [v10 timestamp];
      -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v7, v9);
    }
  }
}

- (void)processGyroscopeData:(id)a3 andAdditionalData:(id)a4
{
}

- (void)processMotionData:(id)a3 location:(int64_t *)a4
{
  id v8 = a3;
  id v6 = +[CVAMetadataWrapper encodeMotionData:](CVAMetadataWrapper, "encodeMotionData:");
  if (v6)
  {
    double v7 = +[CVAMetadataWrapper motionTrackName:a4 prefix:self->_motionTrackName];
    [v8 timestamp];
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v7);
  }
}

- (void)processMotionData:(id)a3
{
}

- (void)processALSData:(id)a3 location:(int64_t *)a4
{
  id v9 = a3;
  id v6 = +[CVAMetadataWrapper encodeALSData:](CVAMetadataWrapper, "encodeALSData:");
  if (v6)
  {
    double v7 = +[CVAMetadataWrapper alsTrackName:a4 prefix:self->_alsTrackName];
    [v9 timestamp];
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v7);

    if (self->_writeLegacyTracks)
    {
      id v8 = +[CVAMetadataWrapper alsTrackName:a4 prefix:@"ALS"];
      [v9 timestamp];
      -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v8);
    }
  }
}

- (void)processWiFiData:(id)a3 location:(int64_t *)a4
{
  id v8 = a3;
  id v6 = +[CVAMetadataWrapper encodeWiFiData:](CVAMetadataWrapper, "encodeWiFiData:");
  if (v6)
  {
    double v7 = +[CVAMetadataWrapper wifiTrackName:a4 prefix:self->_wifiTrackName];
    [v8 timestamp];
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v7);
  }
}

- (void)processCompassData:(id)a3 location:(int64_t *)a4
{
  id v9 = a3;
  id v6 = +[CVAMetadataWrapper encodeCompassData:](CVAMetadataWrapper, "encodeCompassData:");
  if (v6)
  {
    double v7 = +[CVAMetadataWrapper compassTrackName:a4 prefix:self->_compassTrackName];
    [v9 timestamp];
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v7);

    if (self->_writeLegacyTracks)
    {
      id v8 = +[CVAMetadataWrapper compassTrackName:a4 prefix:@"Compass"];
      [v9 timestamp];
      -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v8);
    }
  }
}

- (void)processCompassData:(id)a3
{
}

- (void)processDeviceMotionData:(id)a3 andAdditionalData:(id)a4 location:(int64_t *)a5
{
  id v9 = a3;
  double v7 = +[CVAMetadataWrapper encodeDeviceMotionData:andAdditionalData:](CVAMetadataWrapper, "encodeDeviceMotionData:andAdditionalData:");
  if (v7)
  {
    id v8 = +[CVAMetadataWrapper deviceMotionTrackName:a5 prefix:self->_deviceMotionTrackName];
    [v9 timestamp];
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v7, v8);
  }
}

- (void)processDeviceMotionData:(id)a3 andAdditionalData:(id)a4
{
}

- (void)processDeviceMotionData:(id)a3 location:(int64_t *)a4
{
  id v8 = a3;
  id v6 = +[CVAMetadataWrapper encodeDeviceMotionData:](CVAMetadataWrapper, "encodeDeviceMotionData:");
  if (v6)
  {
    double v7 = +[CVAMetadataWrapper deviceMotionTrackName:a4 prefix:self->_deviceMotionTrackName];
    [v8 timestamp];
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v6, v7);
  }
}

- (void)processCoreLocationData:(id)a3 timestamp:(double)a4 andAdditionalData:(id)a5 location:(int64_t *)a6
{
  +[CVAMetadataWrapper encodeCoreLocationData:timestamp:andAdditionalData:](CVAMetadataWrapper, "encodeCoreLocationData:timestamp:andAdditionalData:", a3, a5);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    id v9 = +[CVAMetadataWrapper locationTrackName:a6 prefix:self->_locationTrackName];
    [(MOVWriterInterface *)self appendMetadata:v10 metadataID:v9 timestamp:a4];
  }
}

- (void)processCoreLocationData:(id)a3 timestamp:(double)a4 andAdditionalData:(id)a5
{
}

- (void)processCMData:(id)a3
{
  id v5 = a3;
  id v4 = +[CVAMetadataWrapper encodeCMData:](CVAMetadataWrapper, "encodeCMData:");
  if (v4)
  {
    [v5 timestamp];
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v4, @"CMData");
  }
}

- (void)processCVAUserEvent:(id)a3
{
  id v5 = a3;
  id v4 = +[CVAMetadataWrapper encodeCVAUserEvent:](CVAMetadataWrapper, "encodeCVAUserEvent:");
  if (v4)
  {
    [v5 timestamp];
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v4, @"CVAUserEvent");
  }
}

- (void)processCVATimedValue:(id)a3
{
  id v5 = a3;
  id v4 = +[CVAMetadataWrapper encodeCVATimedValue:](CVAMetadataWrapper, "encodeCVATimedValue:");
  if (v4)
  {
    [v5 timestamp];
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v4, @"CVATimedValue");
  }
}

- (void)processCVAPRDevice:(id)a3
{
  id v5 = a3;
  id v4 = +[CVAMetadataWrapper encodePRDevice:](CVAMetadataWrapper, "encodePRDevice:");
  if (v4)
  {
    [v5 timestamp];
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v4, @"CVAPRDevice");
  }
}

- (void)processCVAFeatureBuffer:(__CVBuffer *)a3 timestamp:(double)a4 syncTimestamp:(unint64_t)a5 frameId:(unint64_t)a6 streamName:(id)a7
{
  id v16 = a7;
  id v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_cvaFeatureBufferCompression, "objectForKeyedSubscript:");
  uint64_t v13 = [v12 BOOLValue];

  uint64_t v14 = [[CVAFeatureBuffer alloc] initWithPixelBufferRef:a3 timestamp:0 streamID:0 reduce:v13 compress:a4];
  [(CVAFeatureBuffer *)v14 setSyncTimestamp:a5];
  [(CVAFeatureBuffer *)v14 setFrameId:a6];
  long long v15 = +[CVAMetadataWrapper encodeCVAFeatureBuffer:v14];
  if (v15) {
    [(MOVWriterInterface *)self appendMetadata:v15 metadataID:v16 timestamp:a4];
  }
}

- (void)processCVAFeatureBuffer:(__CVBuffer *)a3 timestamp:(double)a4 syncTimestamp:(unint64_t)a5 streamName:(id)a6
{
}

- (void)processCVAFeatureBuffer:(id)a3
{
  id v6 = a3;
  id v4 = +[CVAMetadataWrapper encodeCVAFeatureBuffer:](CVAMetadataWrapper, "encodeCVAFeatureBuffer:");
  if (v4)
  {
    id v5 = +[CVAFeatureBuffer streamName:0];
    [v6 timestamp];
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v4, v5);
  }
}

- (void)processCVADepthTOF:(id)a3
{
  id v4 = a3;
  id v5 = +[CVAMetadataWrapper encodeCVADepthTOF:v4];
  lastError = self->_lastError;
  self->_lastError = 0;

  if (v5)
  {
    id v15 = 0;
    double v7 = [v5 compressedDataUsingAlgorithm:1 error:&v15];
    id v8 = v15;
    id v9 = v8;
    if (v8)
    {
      id v10 = (void *)MEMORY[0x263F087E8];
      double v11 = [v8 description];
      id v12 = [v10 movWriterInterfaceErrorWithMessage:v11 code:1];
      uint64_t v13 = self->_lastError;
      self->_lastError = v12;
    }
    else
    {
      depthTOFTrackName = self->_depthTOFTrackName;
      [v4 timestamp];
      -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v7, depthTOFTrackName);

      if (self->_writeLegacyTracks)
      {
        [v4 timestamp];
        -[MOVWriterInterface appendMetadata:metadataID:timestamp:](self, "appendMetadata:metadataID:timestamp:", v7, @"CVADepthTOF");
      }
    }
  }
}

- (void)processCVACameraCalibrationData:(id)a3
{
  id v5 = a3;
  id v4 = +[CVAMetadataWrapper encodeCVACameraCalibrationData:](CVAMetadataWrapper, "encodeCVACameraCalibrationData:");
  if (v4)
  {
    [v5 timestamp];
    -[MOVWriterInterface appendMetadata:metadataID:timestamp:enforceMonotonicity:](self, "appendMetadata:metadataID:timestamp:enforceMonotonicity:", v4, @"CVACameraCalibration", 0);
  }
}

- (void)processClass:(id)a3 andAdditionalData:(id)a4 metadataID:(id)a5
{
  id v9 = a5;
  id v8 = +[CVAMetadataWrapper encodeClass:a3 andAdditionalData:a4];
  if (v8) {
    [(MOVWriterInterface *)self appendMetadata:v8 metadataID:v9];
  }
}

- (void)processClass:(id)a3 andAdditionalData:(id)a4 metadataID:(id)a5 timestamp:(double)a6
{
  id v11 = a5;
  id v10 = +[CVAMetadataWrapper encodeClass:a3 andAdditionalData:a4];
  if (v10) {
    [(MOVWriterInterface *)self appendMetadata:v10 metadataID:v11 timestamp:a6];
  }
}

- (void)processNSCoderObject:(id)a3 metadataID:(id)a4
{
  id v7 = a4;
  id v6 = +[CVAMetadataWrapper encodeNSCoderObject:a3];
  if (v6) {
    [(MOVWriterInterface *)self appendMetadata:v6 metadataID:v7];
  }
}

- (void)processNSCoderObject:(id)a3 metadataID:(id)a4 timestamp:(double)a5
{
  id v9 = a4;
  id v8 = +[CVAMetadataWrapper encodeNSCoderObject:a3];
  if (v8) {
    [(MOVWriterInterface *)self appendMetadata:v8 metadataID:v9 timestamp:a5];
  }
}

- (void)appendMetadata:(id)a3 metadataID:(id)a4 timestamp:(double)a5
{
}

- (void)appendMetadata:(id)a3 metadataID:(id)a4 timestamp:(double)a5 enforceMonotonicity:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = self;
  objc_sync_enter(v12);
  if (v6)
  {
    lastError = v12->_lastError;
    v12->_lastError = 0;

    uint64_t v14 = [(NSMutableDictionary *)v12->_metadataLastTimestamp objectForKeyedSubscript:v11];
    id v15 = v14;
    if (v14)
    {
      [v14 doubleValue];
      if (v16 > a5)
      {
        uint64_t v19 = [NSString stringWithFormat:@"%@ timestamp %.6f is older than %.6f", v11, *(void *)&a5, *(void *)&v16];
        uint64_t v26 = [MEMORY[0x263F087E8] movWriterInterfaceErrorWithMessage:v19 code:0];
        id v27 = v12->_lastError;
        v12->_lastError = (NSError *)v26;

LABEL_19:
        goto LABEL_20;
      }
    }
    long long v17 = [NSNumber numberWithDouble:a5];
    [(NSMutableDictionary *)v12->_metadataLastTimestamp setObject:v17 forKeyedSubscript:v11];
  }
  id v15 = [(NSMutableDictionary *)v12->_metadataAttachmentArrays objectForKeyedSubscript:v11];
  [v15 addObject:v10];
  if (a5 >= 0.0 && v12->_isReady)
  {
    long long v18 = [(NSMutableDictionary *)v12->_metadataMaxBufferSize objectForKeyedSubscript:v11];
    uint64_t v19 = v18;
    if (v18)
    {
      unsigned int v20 = [v18 unsignedIntValue];
      if ([v15 count] > (unint64_t)v20 && (v12->_lastAppendMetadata.flags & 1) != 0)
      {
        double v21 = [MEMORY[0x263EFF8C0] arrayWithArray:v15];
        [v15 removeAllObjects];
        memset(&v32, 0, sizeof(v32));
        +[MOVWriterInterface cmTimeFromTimestamp:a5];
        v31.receiver = v12;
        v31.super_class = (Class)MOVWriterInterface;
        CMTime time1 = v32;
        [(MOVStreamWriter *)&v31 appendMetadata:v21 withTimeStamp:&time1 toStream:v11];
        long long v22 = *(_OWORD *)&v32.value;
        v12->_lastAppendMetadata.epoch = v32.epoch;
        *(_OWORD *)&v12->_lastAppendMetadata.value = v22;
      }
    }
    if (v12->_writeMetadataTimeInterval > 0.0)
    {
      uint64_t v23 = [(NSMutableDictionary *)v12->_metadataAttachmentArraysTimestamp objectForKeyedSubscript:v11];
      if (!v23)
      {
        char v24 = [NSNumber numberWithDouble:a5];
        [(NSMutableDictionary *)v12->_metadataAttachmentArraysTimestamp setObject:v24 forKeyedSubscript:v11];
      }
      memset(&v32, 0, sizeof(v32));
      +[MOVWriterInterface cmTimeFromTimestamp:a5 - v12->_writeMetadataTimeInterval];
      if ((v12->_lastAppendMetadata.flags & 1) == 0
        || (CMTime time1 = v32,
            long long v25 = *(_OWORD *)&v12->_lastAppendMetadata.value,
            time2.epoch = v12->_lastAppendMetadata.epoch,
            *(_OWORD *)&time2.value = v25,
            CMTimeCompare(&time1, &time2) >= 1))
      {
        +[MOVWriterInterface cmTimeFromTimestamp:a5];
        [(MOVWriterInterface *)v12 appendAllMetadataWithTimeStamp:v28];
      }
    }
    goto LABEL_19;
  }
LABEL_20:

  objc_sync_exit(v12);
}

- (void)appendMetadata:(id)a3 metadataID:(id)a4
{
}

- (void)clearAllMetadataBuffers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = self;
  objc_sync_enter(v2);
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v2->_metadataAttachmentArrays;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = -[NSMutableDictionary objectForKeyedSubscript:](v2->_metadataAttachmentArrays, "objectForKeyedSubscript:", *(void *)(*((void *)&v8 + 1) + 8 * v6), (void)v8);
        [v7 removeAllObjects];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (void)appendAllMetadataWithTimeStamp:(id *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = [(NSMutableDictionary *)v3->_metadataAttachmentArrays allKeys];
  if (v3->_writeMetadataTimeInterval > 0.0)
  {
    uint64_t v5 = [(NSMutableDictionary *)v3->_metadataAttachmentArrays allKeys];
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = sub_21B5C1558;
    v29[3] = &unk_2643ABFB8;
    v29[4] = v3;
    uint64_t v6 = [v5 sortedArrayUsingComparator:v29];

    uint64_t v4 = (void *)v6;
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      uint64_t v17 = v7;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8 * v9);
        long long v11 = [(NSMutableDictionary *)v3->_metadataAttachmentArrays objectForKeyedSubscript:v10];
        id v12 = [MEMORY[0x263EFF8C0] arrayWithArray:v11];
        [v11 removeAllObjects];
        if ([v12 count])
        {
          uint64_t v13 = [(NSMutableDictionary *)v3->_metadataAttachmentArraysTimestamp objectForKeyedSubscript:v10];
          uint64_t v14 = v13;
          if (v13)
          {
            long long v23 = 0uLL;
            int64_t var3 = 0;
            [v13 doubleValue];
            +[MOVWriterInterface cmTimeFromTimestamp:](MOVWriterInterface, "cmTimeFromTimestamp:");
            v22.receiver = v3;
            v22.super_class = (Class)MOVWriterInterface;
            long long v20 = v23;
            int64_t v21 = var3;
            [(MOVStreamWriter *)&v22 appendMetadata:v12 withTimeStamp:&v20 toStream:v10];
            [(NSMutableDictionary *)v3->_metadataAttachmentArraysTimestamp setObject:0 forKeyedSubscript:v10];
            uint64_t v7 = v17;
          }
          else
          {
            v19.receiver = v3;
            v19.super_class = (Class)MOVWriterInterface;
            long long v23 = *(_OWORD *)&a3->var0;
            int64_t var3 = a3->var3;
            [(MOVStreamWriter *)&v19 appendMetadata:v12 withTimeStamp:&v23 toStream:v10];
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v7);
  }

  int64_t v15 = a3->var3;
  *(_OWORD *)&v3->_lastAppendMetadata.value = *(_OWORD *)&a3->var0;
  v3->_lastAppendMetadata.epoch = v15;

  objc_sync_exit(v3);
}

+ ($3CC8671D27C23BF42ADDB32F2B5E48AE)cmTimeFromTimestamp:(SEL)a3
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, a4, 1000000000);
}

+ (id)makeDeviceString
{
  return +[MOVWriterInterfaceUtil makeDeviceString];
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)deviceString
{
  return self->_deviceString;
}

- (void)setDeviceString:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)productConfig
{
  return self->_productConfig;
}

- (void)setProductConfig:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)osBuildVersion
{
  return self->_osBuildVersion;
}

- (void)setOsBuildVersion:(id)a3
{
}

- (CVACalibration)calibration
{
  return self->_calibration;
}

- (void)setCalibration:(id)a3
{
}

- (NSString)spuIMUTrackName
{
  return self->_spuIMUTrackName;
}

- (void)setSpuIMUTrackName:(id)a3
{
}

- (NSString)accelTrackName
{
  return self->_accelTrackName;
}

- (void)setAccelTrackName:(id)a3
{
}

- (NSString)gyroTrackName
{
  return self->_gyroTrackName;
}

- (void)setGyroTrackName:(id)a3
{
}

- (NSString)motionTrackName
{
  return self->_motionTrackName;
}

- (void)setMotionTrackName:(id)a3
{
}

- (NSString)deviceMotionTrackName
{
  return self->_deviceMotionTrackName;
}

- (void)setDeviceMotionTrackName:(id)a3
{
}

- (NSString)locationTrackName
{
  return self->_locationTrackName;
}

- (void)setLocationTrackName:(id)a3
{
}

- (NSString)alsTrackName
{
  return self->_alsTrackName;
}

- (void)setAlsTrackName:(id)a3
{
}

- (NSString)wifiTrackName
{
  return self->_wifiTrackName;
}

- (void)setWifiTrackName:(id)a3
{
}

- (NSString)compassTrackName
{
  return self->_compassTrackName;
}

- (void)setCompassTrackName:(id)a3
{
}

- (NSString)depthTOFTrackName
{
  return self->_depthTOFTrackName;
}

- (void)setDepthTOFTrackName:(id)a3
{
}

- (NSMutableArray)movMetadataArray
{
  return self->_movMetadataArray;
}

- (void)setMovMetadataArray:(id)a3
{
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
}

- (BOOL)isReady
{
  return self->_isReady;
}

- (void)setIsReady:(BOOL)a3
{
  self->_isReady = a3;
}

- (double)writeMetadataTimeInterval
{
  return self->_writeMetadataTimeInterval;
}

- (void)setWriteMetadataTimeInterval:(double)a3
{
  self->_writeMetadataTimeInterval = a3;
}

- (MOVWriterInterfaceDelegate)interface_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interface_delegate);
  return (MOVWriterInterfaceDelegate *)WeakRetained;
}

- (void)setInterface_delegate:(id)a3
{
}

- (NSMutableDictionary)firstFrameContainer
{
  return self->_firstFrameContainer;
}

- (void)setFirstFrameContainer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstFrameContainer, 0);
  objc_destroyWeak((id *)&self->_interface_delegate);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_movMetadataArray, 0);
  objc_storeStrong((id *)&self->_depthTOFTrackName, 0);
  objc_storeStrong((id *)&self->_compassTrackName, 0);
  objc_storeStrong((id *)&self->_wifiTrackName, 0);
  objc_storeStrong((id *)&self->_alsTrackName, 0);
  objc_storeStrong((id *)&self->_locationTrackName, 0);
  objc_storeStrong((id *)&self->_deviceMotionTrackName, 0);
  objc_storeStrong((id *)&self->_motionTrackName, 0);
  objc_storeStrong((id *)&self->_gyroTrackName, 0);
  objc_storeStrong((id *)&self->_accelTrackName, 0);
  objc_storeStrong((id *)&self->_spuIMUTrackName, 0);
  objc_storeStrong((id *)&self->_calibration, 0);
  objc_storeStrong((id *)&self->_osBuildVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productConfig, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_deviceString, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_fileSummary, 0);
  objc_storeStrong((id *)&self->_metadataTrackMetadata, 0);
  objc_storeStrong((id *)&self->_cvaFeatureBufferCompression, 0);
  objc_storeStrong((id *)&self->_metadataMaxBufferSize, 0);
  objc_storeStrong((id *)&self->_metadataLastTimestamp, 0);
  objc_storeStrong((id *)&self->_metadataAttachmentArraysTimestamp, 0);
  objc_storeStrong((id *)&self->_metadataAttachmentArrays, 0);
  objc_storeStrong((id *)&self->_frameMetadataDictionary, 0);
  objc_storeStrong((id *)&self->_firstSteamID, 0);
  objc_storeStrong((id *)&self->_trackAddedByStream, 0);
}

@end