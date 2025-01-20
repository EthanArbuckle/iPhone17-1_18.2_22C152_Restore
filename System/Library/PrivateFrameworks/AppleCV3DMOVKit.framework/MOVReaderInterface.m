@interface MOVReaderInterface
+ (BOOL)grabSWToWExtrinsics:(id *)a3 summary:(id)a4 backExtrinsics:(id)a5;
+ (BOOL)isSuperWideStream:(id)a3;
+ (id)grabCMSessionID:(id)a3;
+ (id)grabJasperExtrinsics:(id)a3 backExtrinsics:(id)a4;
- (BOOL)grabSWToWExtrinsics:(id *)a3;
- (BOOL)resetReaderTo:(id *)a3 error:(id *)a4;
- (CIContext)filterContext;
- (MOVReaderInterface)initWithFileURL:(id)a3 delegate:(id)a4 error:(id *)a5;
- (MOVReaderInterface)initWithFileURL:(id)a3 enforcedVideoTrackFormat:(id)a4 error:(id *)a5;
- (MOVReaderInterface)initWithFileURL:(id)a3 error:(id *)a4;
- (NSDictionary)enforcedVideoTrackFormat;
- (NSError)lastError;
- (NSMutableDictionary)streamFilters;
- (NSNumber)depthOutputFrameRate;
- (NSNumber)depthSourceFrameRate;
- (NSNumber)depthSourceMaxPoints;
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
- (NSString)prDeviceTrackName;
- (NSString)productConfig;
- (NSString)productVersion;
- (NSString)ryfTimedValueTrackName;
- (NSString)serialNumber;
- (NSString)spuIMUTrackName;
- (NSString)userEventTrackName;
- (NSString)version;
- (NSString)wifiTrackName;
- (__CVBuffer)copyNextFrameForStream:(id)a3 timestamp:(id *)a4 error:(id *)a5;
- (id)applyFlip:(id)a3 f:(id)a4;
- (id)deviceStringFromPlatformID:(id)a3;
- (id)grabCalibration;
- (id)grabCalibration:(int64_t *)a3;
- (id)grabJasperExtrinsics;
- (id)grabMovieMetadataForKey:(id)a3;
- (id)grabMovieMetadataItem:(id)a3;
- (id)grabMovieMetadataRawForKey:(id)a3;
- (id)grabNextCLLocation;
- (id)grabNextCLLocation:(id *)a3;
- (id)grabNextCLLocation:(id *)a3 location:(int64_t *)a4 timestamps:(id *)a5;
- (id)grabNextCMData;
- (id)grabNextCMData:(id *)a3;
- (id)grabNextCMDeviceMotion;
- (id)grabNextCMDeviceMotion:(id *)a3;
- (id)grabNextCVACameraCalibrationData;
- (id)grabNextCVACameraCalibrationData:(id *)a3;
- (id)grabNextClass:(id)a3 class:(Class)a4;
- (id)grabNextClass:(id)a3 class:(Class)a4 timeRange:(id *)a5;
- (id)grabNextDepthIR;
- (id)grabNextDepthIR:(id)a3;
- (id)grabNextDepthIR:(id)a3 timeRange:(id *)a4;
- (id)grabNextDepthTOF;
- (id)grabNextDepthTOF:(id *)a3;
- (id)grabNextDepthTOF:(id *)a3 sampleDropped:(BOOL *)a4;
- (id)grabNextDeviceMotionData;
- (id)grabNextDeviceMotionData:(id *)a3;
- (id)grabNextDeviceMotionData:(id *)a3 location:(int64_t *)a4;
- (id)grabNextDictionary:(id)a3;
- (id)grabNextDictionary:(id)a3 timeRange:(id *)a4;
- (id)grabNextFastPathControlData:(id)a3;
- (id)grabNextFastPathData:(id)a3;
- (id)grabNextFastPathMUData:(int64_t *)a3;
- (id)grabNextFastPathMUData:(int64_t *)a3 metadataID:(id)a4;
- (id)grabNextFeatureBuffer;
- (id)grabNextFeatureBuffer:(id *)a3 streamName:(id)a4;
- (id)grabNextFeatureBuffer:(id)a3;
- (id)grabNextMotionData;
- (id)grabNextMotionData:(id *)a3 location:(int64_t *)a4;
- (id)grabNextMotionData:(int64_t *)a3;
- (id)grabNextNSCoderObject:(id)a3 class:(Class)a4;
- (id)grabNextNSCoderObject:(id)a3 class:(Class)a4 timeRange:(id *)a5;
- (id)grabNextNSCoderObject:(id)a3 classes:(id)a4;
- (id)grabNextNSCoderObject:(id)a3 classes:(id)a4 timeRange:(id *)a5;
- (id)grabNextPRDevice;
- (id)grabNextPRDevice:(id *)a3;
- (id)grabNextRawALSData:(id *)a3 location:(int64_t *)a4;
- (id)grabNextRawALSData:(int64_t *)a3;
- (id)grabNextRawAccelData;
- (id)grabNextRawAccelData:(id *)a3 location:(int64_t *)a4;
- (id)grabNextRawAccelData:(int64_t *)a3;
- (id)grabNextRawCompassData;
- (id)grabNextRawCompassData:(id *)a3 location:(int64_t *)a4;
- (id)grabNextRawCompassData:(int64_t *)a3;
- (id)grabNextRawGyroData;
- (id)grabNextRawGyroData:(id *)a3 location:(int64_t *)a4;
- (id)grabNextRawGyroData:(int64_t *)a3;
- (id)grabNextRawWiFiData:(id *)a3 location:(int64_t *)a4;
- (id)grabNextRawWiFiData:(int64_t *)a3;
- (id)grabNextSpuIMUData:(id *)a3 location:(int64_t *)a4;
- (id)grabNextSpuIMUData:(int64_t *)a3;
- (id)grabNextStreamData:(id)a3 timeRange:(id *)a4;
- (id)grabNextTimedValue;
- (id)grabNextTimedValue:(id *)a3;
- (id)grabNextUserEvent;
- (id)grabNextUserEvent:(id *)a3;
- (id)grabSummary;
- (id)mapProductToDevice:(id)a3;
- (id)resolvedAccelStreamName:(int64_t *)a3;
- (id)resolvedCalibration:(int64_t *)a3;
- (id)resolvedCompassStreamName:(int64_t *)a3;
- (id)resolvedDeviceMotionStreamName:(int64_t *)a3;
- (id)resolvedGyroStreamName:(int64_t *)a3;
- (id)resolvedIMUStreamName:(int64_t *)a3 metadataID:(id)a4;
- (id)resolvedLocationStreamName:(int64_t *)a3;
- (id)resolvedMotionStreamName:(int64_t *)a3;
- (id)resolvedSpuIMUStreamName:(int64_t *)a3;
- (unsigned)reader:(id)a3 pixelFormatForStream:(id)a4 suggestedFormat:(unsigned int)a5;
- (void)addStreamFilter:(id)a3 obj:(id)a4;
- (void)addStreamFilters:(id)a3;
- (void)setAccelTrackName:(id)a3;
- (void)setAlsTrackName:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setCompassTrackName:(id)a3;
- (void)setDepthOutputFrameRate:(id)a3;
- (void)setDepthTOFTrackName:(id)a3;
- (void)setDeviceMotionTrackName:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceString:(id)a3;
- (void)setEnforcedVideoTrackFormat:(id)a3;
- (void)setFilterContext:(id)a3;
- (void)setGyroTrackName:(id)a3;
- (void)setLastError:(id)a3;
- (void)setLocationTrackName:(id)a3;
- (void)setMotionTrackName:(id)a3;
- (void)setPrDeviceTrackName:(id)a3;
- (void)setProductConfig:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setRyfTimedValueTrackName:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSpuIMUTrackName:(id)a3;
- (void)setStreamFilters:(id)a3;
- (void)setUserEventTrackName:(id)a3;
- (void)setVersion:(id)a3;
- (void)setWifiTrackName:(id)a3;
@end

@implementation MOVReaderInterface

- (id)deviceStringFromPlatformID:(id)a3
{
  int v3 = [a3 intValue];
  v4 = @"ST2";
  if (v3 != 178) {
    v4 = 0;
  }
  if ((v3 - 82) >= 2) {
    v5 = v4;
  }
  else {
    v5 = @"J420";
  }
  if ((v3 - 80) >= 2) {
    return v5;
  }
  else {
    return @"J417";
  }
}

- (BOOL)resetReaderTo:(id *)a3 error:(id *)a4
{
  self->_lastDepthTOFTimestamp = 0.0;
  v6.receiver = self;
  v6.super_class = (Class)MOVReaderInterface;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  return [(MOVStreamReader *)&v6 resetReaderTo:&v5 error:a4];
}

- (MOVReaderInterface)initWithFileURL:(id)a3 delegate:(id)a4 error:(id *)a5
{
  v175[18] = *MEMORY[0x263EF8340];
  v170.receiver = self;
  v170.super_class = (Class)MOVReaderInterface;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [(MOVStreamReader *)&v170 initWithURL:a3 delegate:a4 error:a5];
  objc_super v6 = v5;
  if (v5)
  {
    lastError = v5->_lastError;
    v5->_lastError = 0;

    uint64_t v8 = objc_opt_new();
    streamFilters = v6->_streamFilters;
    v6->_streamFilters = (NSMutableDictionary *)v8;

    v10 = [(MOVReaderInterface *)v6 grabSummary];
    uint64_t v11 = [v10 objectForKeyedSubscript:@"deviceName"];
    deviceName = v6->_deviceName;
    v6->_deviceName = (NSString *)v11;

    uint64_t v13 = [v10 objectForKeyedSubscript:@"CFBundleIdentifier"];
    bundleID = v6->_bundleID;
    v6->_bundleID = (NSString *)v13;

    uint64_t v15 = [v10 objectForKeyedSubscript:@"version"];
    version = v6->_version;
    v6->_version = (NSString *)v15;

    uint64_t v17 = [v10 objectForKeyedSubscript:@"SerialNumber"];
    serialNumber = v6->_serialNumber;
    v6->_serialNumber = (NSString *)v17;

    uint64_t v19 = [v10 objectForKeyedSubscript:@"ProductConfig"];
    productConfig = v6->_productConfig;
    v6->_productConfig = (NSString *)v19;

    uint64_t v21 = [v10 objectForKeyedSubscript:@"ProductVersion"];
    productVersion = v6->_productVersion;
    v6->_productVersion = (NSString *)v21;

    uint64_t v23 = [v10 objectForKeyedSubscript:@"OSBuildVersion"];
    osVersion = v6->_osVersion;
    v6->_osVersion = (NSString *)v23;

    if (!v6->_osVersion)
    {
      uint64_t v25 = [v10 objectForKeyedSubscript:@"mdta/com.apple.arkit.osversion"];
      v26 = v6->_osVersion;
      v6->_osVersion = (NSString *)v25;
    }
    v145 = v10;
    v27 = [v10 objectForKeyedSubscript:@"machTimeSince1970"];
    [v27 doubleValue];
    v6->_machTimeSince1970 = v28;

    v148 = objc_opt_new();
    v175[0] = @"com.apple.reality.kind.data.imu800";
    v175[1] = @"com.apple.reality.kind.data.accelerometer";
    v175[2] = @"com.apple.reality.kind.data.gyroscope";
    v175[3] = @"com.apple.reality.kind.data.compass";
    v175[4] = @"com.apple.reality.kind.data.als";
    v175[5] = @"com.apple.reality.kind.data.wifi";
    v175[6] = @"com.apple.reality.kind.data.zcam_tof_pc";
    v175[7] = @"com.apple.reality.kind.camera.xcam.pointcloud";
    v175[8] = @"RawAccelerometer";
    v175[9] = @"RawGyroscope";
    v175[10] = @"Compass";
    v175[11] = @"ALS";
    v175[12] = @"CVADepthTOF";
    v175[13] = @"CVAUserEvent";
    v175[14] = @"com.apple.reality.kind.data.user_event";
    v175[15] = @"CVAPRDevice";
    v175[16] = @"com.apple.reality.kind.data.devicemotion";
    v175[17] = @"Motion";
    v151 = [MEMORY[0x263EFF8C0] arrayWithObjects:v175 count:18];
    [(MOVStreamReader *)v6 getAllMetadataStreams];
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = [obj countByEnumeratingWithState:&v166 objects:v174 count:16];
    v152 = v6;
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v149 = *(void *)v167;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v167 != v149) {
            objc_enumerationMutation(obj);
          }
          v33 = *(void **)(*((void *)&v166 + 1) + 8 * i);
          v34 = [(MOVStreamReader *)v6 metadataTrackForStream:v33];
          uint64_t v35 = [v34 totalSampleDataLength];
          long long v162 = 0u;
          long long v163 = 0u;
          long long v164 = 0u;
          long long v165 = 0u;
          id v36 = v151;
          uint64_t v37 = [v36 countByEnumeratingWithState:&v162 objects:v173 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v163;
            do
            {
              for (uint64_t j = 0; j != v38; ++j)
              {
                if (*(void *)v163 != v39) {
                  objc_enumerationMutation(v36);
                }
                uint64_t v41 = *(void *)(*((void *)&v162 + 1) + 8 * j);
                if ([v33 hasPrefix:v41])
                {
                  v32 = [NSNumber numberWithBool:v35 > 0];
                  [v148 setObject:v32 forKeyedSubscript:v41];

                  goto LABEL_9;
                }
              }
              uint64_t v38 = [v36 countByEnumeratingWithState:&v162 objects:v173 count:16];
            }
            while (v38);
          }
LABEL_9:

          objc_super v6 = v152;
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v166 objects:v174 count:16];
      }
      while (v30);
    }
    p_spuIMUTrackName = &v6->_spuIMUTrackName;
    spuIMUTrackName = v6->_spuIMUTrackName;
    v6->_spuIMUTrackName = 0;

    v44 = [v148 objectForKeyedSubscript:@"com.apple.reality.kind.data.imu800"];
    int v45 = [v44 BOOLValue];

    if (v45) {
      objc_storeStrong((id *)&v6->_spuIMUTrackName, @"com.apple.reality.kind.data.imu800");
    }
    v144 = +[CVAMetadataWrapper imuTrackName:0 prefix:*p_spuIMUTrackName];
    v6->_imuLocationNil = objc_msgSend(obj, "containsObject:");
    v143 = +[CVAMetadataWrapper motionTrackName:&unk_267C58C70 prefix:*p_spuIMUTrackName];
    v6->_imuLocation0 = objc_msgSend(obj, "containsObject:");
    uint64_t v46 = objc_opt_new();
    spuVersions = v6->_spuVersions;
    v6->_spuVersions = (NSMutableDictionary *)v46;

    if (*p_spuIMUTrackName)
    {
      long long v160 = 0u;
      long long v161 = 0u;
      long long v158 = 0u;
      long long v159 = 0u;
      id v48 = obj;
      uint64_t v49 = [v48 countByEnumeratingWithState:&v158 objects:v172 count:16];
      if (v49)
      {
        uint64_t v50 = v49;
        uint64_t v51 = *(void *)v159;
        do
        {
          for (uint64_t k = 0; k != v50; ++k)
          {
            if (*(void *)v159 == v51)
            {
              v53 = *(void **)(*((void *)&v158 + 1) + 8 * k);
              if (![v53 hasPrefix:@"com.apple.reality.kind.data.imu800"]) {
                continue;
              }
            }
            else
            {
              objc_enumerationMutation(v48);
              v53 = *(void **)(*((void *)&v158 + 1) + 8 * k);
              if (![v53 hasPrefix:@"com.apple.reality.kind.data.imu800"]) {
                continue;
              }
            }
            uint64_t v157 = 0;
            +[CVAMetadataWrapper locationFromTrackName:v53 location:&v157];
            v54 = [(MOVStreamReader *)v152 trackMetadataForMetadataStream:v53];
            uint64_t v55 = [v54 objectForKeyedSubscript:@"com.apple.AppleCV3DMOVKit.fastPathIMUVersion"];
            v56 = (void *)v55;
            if (v55) {
              v57 = (void *)v55;
            }
            else {
              v57 = &unk_26CB67A80;
            }
            v58 = v152->_spuVersions;
            v59 = [NSNumber numberWithInteger:v157];
            [(NSMutableDictionary *)v58 setObject:v57 forKeyedSubscript:v59];
          }
          uint64_t v50 = [v48 countByEnumeratingWithState:&v158 objects:v172 count:16];
        }
        while (v50);
      }

      objc_super v6 = v152;
    }
    p_accelTrackName = &v6->_accelTrackName;
    accelTrackName = v6->_accelTrackName;
    v6->_accelTrackName = 0;

    v62 = @"com.apple.reality.kind.data.accelerometer";
    v63 = [v148 objectForKeyedSubscript:@"com.apple.reality.kind.data.accelerometer"];
    char v64 = [v63 BOOLValue];

    if ((v64 & 1) != 0
      || (v62 = @"RawAccelerometer",
          [v148 objectForKeyedSubscript:@"RawAccelerometer"],
          v65 = objc_claimAutoreleasedReturnValue(),
          int v66 = [v65 BOOLValue],
          v65,
          v66))
    {
      objc_storeStrong((id *)&v6->_accelTrackName, v62);
    }
    v150 = +[CVAMetadataWrapper accelerometerTrackName:0 prefix:*p_accelTrackName];
    v6->_accelLocationNil = objc_msgSend(obj, "containsObject:");
    v146 = +[CVAMetadataWrapper accelerometerTrackName:&unk_267C58C70 prefix:*p_accelTrackName];
    v6->_accelLocation0 = objc_msgSend(obj, "containsObject:");
    p_gyroTrackName = &v6->_gyroTrackName;
    gyroTrackName = v6->_gyroTrackName;
    v6->_gyroTrackName = 0;

    v69 = @"com.apple.reality.kind.data.gyroscope";
    v70 = [v148 objectForKeyedSubscript:@"com.apple.reality.kind.data.gyroscope"];
    char v71 = [v70 BOOLValue];

    if ((v71 & 1) != 0
      || (v69 = @"RawGyroscope",
          [v148 objectForKeyedSubscript:@"RawGyroscope"],
          v72 = objc_claimAutoreleasedReturnValue(),
          int v73 = [v72 BOOLValue],
          v72,
          v73))
    {
      objc_storeStrong((id *)&v6->_gyroTrackName, v69);
    }
    v141 = +[CVAMetadataWrapper gyroTrackName:0 prefix:*p_gyroTrackName];
    v6->_gyroLocationNil = objc_msgSend(obj, "containsObject:");
    v140 = +[CVAMetadataWrapper gyroTrackName:&unk_267C58C70 prefix:*p_gyroTrackName];
    v6->_gyroLocation0 = objc_msgSend(obj, "containsObject:");
    p_motionTrackName = &v6->_motionTrackName;
    motionTrackName = v6->_motionTrackName;
    v6->_motionTrackName = 0;

    v76 = [v148 objectForKeyedSubscript:@"com.apple.reality.kind.data.motion"];
    int v77 = [v76 BOOLValue];

    if (v77) {
      objc_storeStrong((id *)&v6->_motionTrackName, @"com.apple.reality.kind.data.motion");
    }
    v139 = +[CVAMetadataWrapper motionTrackName:0 prefix:*p_motionTrackName];
    v6->_motionLocationNil = objc_msgSend(obj, "containsObject:");
    v138 = +[CVAMetadataWrapper motionTrackName:&unk_267C58C70 prefix:*p_motionTrackName];
    v6->_motionLocation0 = objc_msgSend(obj, "containsObject:");
    p_deviceMotionTrackName = &v6->_deviceMotionTrackName;
    deviceMotionTrackName = v6->_deviceMotionTrackName;
    v6->_deviceMotionTrackName = 0;

    v80 = @"com.apple.reality.kind.data.devicemotion";
    v81 = [v148 objectForKeyedSubscript:@"com.apple.reality.kind.data.devicemotion"];
    char v82 = [v81 BOOLValue];

    if ((v82 & 1) != 0
      || (v80 = @"Motion",
          [v148 objectForKeyedSubscript:@"Motion"],
          v83 = objc_claimAutoreleasedReturnValue(),
          int v84 = [v83 BOOLValue],
          v83,
          v84))
    {
      objc_storeStrong((id *)&v6->_deviceMotionTrackName, v80);
    }
    v137 = +[CVAMetadataWrapper deviceMotionTrackName:0 prefix:*p_deviceMotionTrackName];
    v6->_deviceMotionLocationNil = objc_msgSend(obj, "containsObject:");
    v136 = +[CVAMetadataWrapper deviceMotionTrackName:&unk_267C58C70 prefix:*p_deviceMotionTrackName];
    v6->_deviceMotionLocation0 = objc_msgSend(obj, "containsObject:");
    p_locationTrackName = &v6->_locationTrackName;
    locationTrackName = v6->_locationTrackName;
    v6->_locationTrackName = 0;

    v87 = [v148 objectForKeyedSubscript:@"Location"];
    int v88 = [v87 BOOLValue];

    if (v88) {
      objc_storeStrong((id *)&v6->_locationTrackName, @"Location");
    }
    v135 = +[CVAMetadataWrapper locationTrackName:0 prefix:*p_locationTrackName];
    v6->_locationLocationNil = objc_msgSend(obj, "containsObject:");
    v134 = +[CVAMetadataWrapper locationTrackName:&unk_267C58C70 prefix:*p_locationTrackName];
    v6->_locationLocation0 = objc_msgSend(obj, "containsObject:");
    p_compassTrackName = &v6->_compassTrackName;
    compassTrackName = v6->_compassTrackName;
    v6->_compassTrackName = 0;

    v91 = @"com.apple.reality.kind.data.compass";
    v92 = [v148 objectForKeyedSubscript:@"com.apple.reality.kind.data.compass"];
    char v93 = [v92 BOOLValue];

    if ((v93 & 1) != 0
      || (v91 = @"Compass",
          [v148 objectForKeyedSubscript:@"Compass"],
          v94 = objc_claimAutoreleasedReturnValue(),
          int v95 = [v94 BOOLValue],
          v94,
          v95))
    {
      objc_storeStrong((id *)&v6->_compassTrackName, v91);
    }
    v142 = +[CVAMetadataWrapper compassTrackName:0 prefix:*p_compassTrackName];
    v6->_compassLocationNil = objc_msgSend(obj, "containsObject:");
    v96 = +[CVAMetadataWrapper compassTrackName:&unk_267C58C70 prefix:*p_compassTrackName];
    v6->_compassLocation0 = [obj containsObject:v96];
    alsTrackName = v6->_alsTrackName;
    v6->_alsTrackName = 0;

    v98 = @"com.apple.reality.kind.data.als";
    v99 = [v148 objectForKeyedSubscript:@"com.apple.reality.kind.data.als"];
    char v100 = [v99 BOOLValue];

    if ((v100 & 1) != 0
      || (v98 = @"ALS",
          [v148 objectForKeyedSubscript:@"ALS"],
          v101 = objc_claimAutoreleasedReturnValue(),
          int v102 = [v101 BOOLValue],
          v101,
          v102))
    {
      objc_storeStrong((id *)&v6->_alsTrackName, v98);
    }
    wifiTrackName = v6->_wifiTrackName;
    v6->_wifiTrackName = 0;

    v104 = [v148 objectForKeyedSubscript:@"com.apple.reality.kind.data.wifi"];
    int v105 = [v104 BOOLValue];

    v106 = @"com.apple.reality.kind.camera.xcam.pointcloud";
    if (v105) {
      objc_storeStrong((id *)&v6->_wifiTrackName, @"com.apple.reality.kind.data.wifi");
    }
    depthTOFTrackName = v6->_depthTOFTrackName;
    v6->_depthTOFTrackName = 0;

    v108 = [v148 objectForKeyedSubscript:@"com.apple.reality.kind.camera.xcam.pointcloud"];
    char v109 = [v108 BOOLValue];

    if (v109) {
      goto LABEL_62;
    }
    v106 = @"com.apple.reality.kind.data.zcam_tof_pc";
    v110 = [v148 objectForKeyedSubscript:@"com.apple.reality.kind.data.zcam_tof_pc"];
    char v111 = [v110 BOOLValue];

    if ((v111 & 1) != 0
      || (v106 = @"CVADepthTOF",
          [v148 objectForKeyedSubscript:@"CVADepthTOF"],
          v112 = objc_claimAutoreleasedReturnValue(),
          int v113 = [v112 BOOLValue],
          v112,
          v113))
    {
LABEL_62:
      objc_storeStrong((id *)&v6->_depthTOFTrackName, v106);
    }
    v6->_lastDepthTOFTimestamp = 0.0;
    v114 = [v148 objectForKeyedSubscript:@"CVAUserEvent"];
    if ([v114 BOOLValue]) {
      v115 = @"CVAUserEvent";
    }
    else {
      v115 = 0;
    }
    objc_storeStrong((id *)&v6->_userEventTrackName, v115);

    v116 = [v148 objectForKeyedSubscript:@"com.apple.reality.kind.data.user_event"];
    if ([v116 BOOLValue]) {
      v117 = @"com.apple.reality.kind.data.user_event";
    }
    else {
      v117 = 0;
    }
    objc_storeStrong((id *)&v6->_ryfTimedValueTrackName, v117);

    v118 = [v148 objectForKeyedSubscript:@"CVAPRDevice"];
    if ([v118 BOOLValue]) {
      v119 = @"CVAPRDevice";
    }
    else {
      v119 = 0;
    }
    objc_storeStrong((id *)&v6->_prDeviceTrackName, v119);

    p_jasperDepthPCStreamID = (id *)&v6->_jasperDepthPCStreamID;
    jasperDepthPCStreamID = v6->_jasperDepthPCStreamID;
    v6->_jasperDepthPCStreamID = 0;

    long long v155 = 0u;
    long long v156 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    v122 = [(MOVStreamReader *)v6 getAllStreams];
    uint64_t v123 = [v122 countByEnumeratingWithState:&v153 objects:v171 count:16];
    if (v123)
    {
      uint64_t v124 = v123;
      uint64_t v125 = *(void *)v154;
      uint64_t v126 = *MEMORY[0x263F2C248];
      while (2)
      {
        for (uint64_t m = 0; m != v124; ++m)
        {
          if (*(void *)v154 != v125) {
            objc_enumerationMutation(v122);
          }
          v128 = *(void **)(*((void *)&v153 + 1) + 8 * m);
          if (([v128 isEqualToString:v126] & 1) != 0
            || [v128 isEqualToString:@"JasperCamera"])
          {
            objc_storeStrong(p_jasperDepthPCStreamID, v128);
            v129 = [(MOVReaderInterface *)v152 grabMovieMetadataForKey:@"mdta/com.apple.jasperl.calibdata"];
            if (v129)
            {
              v130 = [[CVAJasperDepthFrameProcessor alloc] initWithCalibrationDict:v129];
              uint64_t v131 = 176;
            }
            else
            {
              v130 = [MEMORY[0x263F087E8] movReaderInterfaceErrorWithMessage:@"Failed to read TOF calibration" code:6];
              uint64_t v131 = 400;
            }
            v132 = *(Class *)((char *)&v152->super.super.isa + v131);
            *(Class *)((char *)&v152->super.super.isa + v131) = (Class)v130;

            goto LABEL_86;
          }
        }
        uint64_t v124 = [v122 countByEnumeratingWithState:&v153 objects:v171 count:16];
        if (v124) {
          continue;
        }
        break;
      }
    }
LABEL_86:

    objc_super v6 = v152;
    v152->_jasperCounter = 0;
    *(void *)v152->_jasperEnabled = 0x101010101010101;
    *(void *)&v152->_jasperEnabled[8] = 0x101010101010101;
  }
  return v6;
}

- (NSNumber)depthSourceFrameRate
{
  if (self->_depthTOFTrackName)
  {
    int v3 = -[MOVStreamReader trackMetadataForMetadataStream:](self, "trackMetadataForMetadataStream:");
    v4 = [v3 objectForKeyedSubscript:@"Framerate"];
    if (!v4)
    {
      BOOL v5 = [(NSString *)self->_deviceString hasPrefix:@"D83"];
      if ([(NSString *)self->_deviceString hasPrefix:@"D84"] || v5) {
        v4 = &unk_26CB67AB0;
      }
      else {
        v4 = &unk_26CB67A98;
      }
    }

    objc_super v6 = v4;
  }
  else
  {
    objc_super v6 = &unk_26CB67A80;
  }
  return (NSNumber *)v6;
}

- (NSNumber)depthSourceMaxPoints
{
  if (self->_depthTOFTrackName)
  {
    int v3 = -[MOVStreamReader trackMetadataForMetadataStream:](self, "trackMetadataForMetadataStream:");
    v4 = [v3 objectForKeyedSubscript:@"MaxPoints"];
    if (!v4)
    {
      BOOL v5 = [(NSString *)self->_deviceString hasPrefix:@"D83"];
      if ([(NSString *)self->_deviceString hasPrefix:@"D84"] || v5) {
        v4 = &unk_26CB67AE0;
      }
      else {
        v4 = &unk_26CB67AC8;
      }
    }

    objc_super v6 = v4;
  }
  else
  {
    objc_super v6 = &unk_26CB67A80;
  }
  return (NSNumber *)v6;
}

- (void)setDepthOutputFrameRate:(id)a3
{
  id v14 = a3;
  lastError = self->_lastError;
  self->_lastError = 0;

  p_depthOutputFrameRate = &self->_depthOutputFrameRate;
  objc_storeStrong((id *)&self->_depthOutputFrameRate, a3);
  v7 = [(MOVReaderInterface *)self depthSourceMaxPoints];
  int v8 = [v7 isEqualToNumber:&unk_26CB67AC8];

  v9 = v14;
  if (v8)
  {
    v10 = [(MOVReaderInterface *)self depthSourceFrameRate];
    if ([v10 compare:*p_depthOutputFrameRate] == 1)
    {
      if ([v10 isEqualToNumber:&unk_26CB67A98]
        && [(NSNumber *)*p_depthOutputFrameRate isEqualToNumber:&unk_26CB67AB0]
        || [v10 isEqualToNumber:&unk_26CB67AB0]
        && [(NSNumber *)*p_depthOutputFrameRate isEqualToNumber:&unk_26CB67AF8])
      {
        *(void *)&self->_jasperEnabled[1] = 0;
        *(void *)&self->_jasperEnabled[7] = 0;
        self->_jasperEnabled[0] = 1;
        self->_jasperEnabled[2] = 1;
        self->_jasperEnabled[5] = 1;
        *(_WORD *)&self->_jasperEnabled[7] = 257;
        self->_jasperEnabled[10] = 1;
        self->_jasperEnabled[13] = 1;
        self->_jasperEnabled[15] = 1;
LABEL_14:

        v9 = v14;
        goto LABEL_15;
      }
      if ([v10 isEqualToNumber:&unk_26CB67A98]
        && [(NSNumber *)*p_depthOutputFrameRate isEqualToNumber:&unk_26CB67AF8])
      {
        *(void *)&self->_jasperEnabled[1] = 0;
        *(void *)&self->_jasperEnabled[7] = 0;
        self->_jasperEnabled[0] = 1;
        self->_jasperEnabled[5] = 1;
        self->_jasperEnabled[10] = 1;
        self->_jasperEnabled[15] = 1;
        goto LABEL_14;
      }
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Requested depth rate %ld is invalid", -[NSNumber longValue](*p_depthOutputFrameRate, "longValue"));
      v12 = [MEMORY[0x263F087E8] movReaderInterfaceErrorWithMessage:v11 code:7];
    }
    else
    {
      uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Requested depth rate %ld >= source rate %ld", -[NSNumber longValue](*p_depthOutputFrameRate, "longValue"), objc_msgSend(v10, "longValue"));
      v12 = [MEMORY[0x263F087E8] movReaderInterfaceWarningWithMessage:v11 code:0];
    }
    uint64_t v13 = self->_lastError;
    self->_lastError = v12;

    goto LABEL_14;
  }
LABEL_15:
}

- (MOVReaderInterface)initWithFileURL:(id)a3 enforcedVideoTrackFormat:(id)a4 error:(id *)a5
{
  objc_storeStrong((id *)&self->_enforcedVideoTrackFormat, a4);
  id v8 = a3;
  v9 = [(MOVReaderInterface *)self initWithFileURL:v8 delegate:self error:a5];

  return v9;
}

- (MOVReaderInterface)initWithFileURL:(id)a3 error:(id *)a4
{
  return [(MOVReaderInterface *)self initWithFileURL:a3 delegate:0 error:a4];
}

- (id)grabMovieMetadataForKey:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  lastError = self->_lastError;
  self->_lastError = 0;

  [(MOVStreamReader *)self metadataForMovie];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v27 = 400;
    double v28 = self;
    uint64_t v9 = *(void *)v32;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "identifier", v27, v28);
        int v13 = [v4 isEqualToString:v12];

        if (v13)
        {
          id v14 = [v11 value];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          id v16 = [v11 value];
          if (isKindOfClass) {
            goto LABEL_17;
          }
          objc_opt_class();
          char v17 = objc_opt_isKindOfClass();

          if (v17)
          {
            v18 = [v11 value];
            id v29 = 0;
            uint64_t v30 = 0;
            uint64_t v19 = [MEMORY[0x263F08AC0] propertyListWithData:v18 options:0 format:&v30 error:&v29];
            v20 = v19;
            if (v29)
            {
              uint64_t v21 = (void *)MEMORY[0x263F087E8];
              id v22 = v29;
              uint64_t v23 = [v22 description];
              uint64_t v24 = [v21 movReaderInterfaceErrorWithMessage:v23 code:8];
              uint64_t v25 = *(Class *)((char *)&v28->super.super.isa + v27);
              *(Class *)((char *)&v28->super.super.isa + v27) = (Class)v24;

              id v16 = 0;
            }
            else
            {
              id v16 = v19;
            }

            goto LABEL_17;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v35 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_17:

  return v16;
}

- (id)grabMovieMetadataRawForKey:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  lastError = self->_lastError;
  self->_lastError = 0;

  [(MOVStreamReader *)self metadataForMovie];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    uint64_t v10 = *MEMORY[0x263F00F48];
LABEL_4:
    uint64_t v11 = 0;
    uint64_t v23 = v8;
    while (1)
    {
      if (*(void *)v25 != v9) {
        objc_enumerationMutation(v6);
      }
      v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
      int v13 = [v12 identifier];
      if (![v4 isEqualToString:v13]) {
        goto LABEL_6;
      }
      id v14 = [v12 dataType];
      if (([v14 isEqual:v10] & 1) == 0) {
        break;
      }
      [v12 value];
      uint64_t v15 = v9;
      id v16 = v4;
      uint64_t v17 = v10;
      uint64_t v19 = v18 = v6;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      id v6 = v18;
      uint64_t v10 = v17;
      id v4 = v16;
      uint64_t v9 = v15;
      uint64_t v8 = v23;

      if (isKindOfClass)
      {
        uint64_t v21 = [v12 value];
        goto LABEL_15;
      }
LABEL_7:
      if (v8 == ++v11)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (!v8) {
          goto LABEL_14;
        }
        goto LABEL_4;
      }
    }

LABEL_6:
    goto LABEL_7;
  }
LABEL_14:
  uint64_t v21 = 0;
LABEL_15:

  return v21;
}

- (id)grabMovieMetadataItem:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  lastError = self->_lastError;
  self->_lastError = 0;

  [(MOVStreamReader *)self metadataForMovie];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = objc_msgSend(v10, "identifier", (void)v14);
        char v12 = [v4 isEqualToString:v11];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)grabSummary
{
  lastError = self->_lastError;
  self->_lastError = 0;

  id v4 = [(MOVReaderInterface *)self grabMovieMetadataForKey:@"mdta/com.apple.framework.state.MOVKit"];
  if (!v4)
  {
    id v4 = [(MOVReaderInterface *)self grabMovieMetadataForKey:@"mdta/com.apple.recordingEnvironment"];
    if (!v4)
    {
      id v4 = [(MOVReaderInterface *)self grabMovieMetadataForKey:@"mdta/com.apple.movieSummary"];
    }
  }
  BOOL v5 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v4];
  id v6 = [v5 objectForKeyedSubscript:@"hw.model"];
  p_deviceString = &self->_deviceString;
  deviceString = self->_deviceString;
  self->_deviceString = v6;

  uint64_t v9 = [v5 objectForKeyedSubscript:@"movKitVersion"];
  uint64_t v10 = v9;
  if (!v9 || [v9 isEqualToString:@"1.0.0"])
  {
    uint64_t v11 = [v5 objectForKeyedSubscript:@"CFBundleIdentifier"];
    if (v11)
    {
    }
    else
    {
      char v12 = [v5 objectForKeyedSubscript:@"bundleID"];

      if (v12)
      {
        int v13 = [v5 objectForKeyedSubscript:@"bundleID"];
        [v5 setObject:v13 forKeyedSubscript:@"CFBundleIdentifier"];

        [v5 removeObjectForKey:@"bundleID"];
      }
    }
    long long v14 = [v5 objectForKeyedSubscript:@"hw.model"];
    if (v14)
    {
    }
    else
    {
      long long v15 = [v5 objectForKeyedSubscript:@"deviceString"];

      if (v15)
      {
        long long v16 = [v5 objectForKeyedSubscript:@"deviceString"];
        [v5 setObject:v16 forKeyedSubscript:@"hw.model"];

        uint64_t v17 = [v5 objectForKeyedSubscript:@"hw.model"];
        id v18 = *p_deviceString;
        *p_deviceString = (NSString *)v17;

        [v5 removeObjectForKey:@"deviceString"];
      }
    }
  }
  uint64_t v19 = [(MOVReaderInterface *)self grabMovieMetadataForKey:@"mdta/com.apple.isp.UnitInfo"];
  v20 = v19;
  if (v19)
  {
    uint64_t v21 = [v19 objectForKey:@"PlatformID"];
    id v22 = [(MOVReaderInterface *)self deviceStringFromPlatformID:v21];
    if (v22) {
      objc_storeStrong((id *)&self->_deviceString, v22);
    }
  }
  uint64_t v23 = [(MOVReaderInterface *)self grabMovieMetadataForKey:@"mdta/com.apple.isp.FirmwareVersion"];
  long long v24 = [v23 objectForKey:@"PlatformType"];

  if (![v24 isEqualToString:@"SpearTooth3"])
  {
    if (![v24 isEqualToString:@"SpearTooth2"]) {
      goto LABEL_20;
    }
LABEL_23:
    objc_msgSend(MEMORY[0x263F087E8], "movReaderInterfaceWarningWithMessage:code:", @"platformType is SpearTooth2; assuming device is ST2",
      1);
    double v28 = (NSError *)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = self->_lastError;
    self->_lastError = v28;

    uint64_t v30 = *p_deviceString;
    *p_deviceString = (NSString *)@"ST2";

    if (*p_deviceString) {
      goto LABEL_29;
    }
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x263F087E8], "movReaderInterfaceWarningWithMessage:code:", @"platformType is SpearTooth3; assuming device is ST3",
    1);
  long long v25 = (NSError *)objc_claimAutoreleasedReturnValue();
  long long v26 = self->_lastError;
  self->_lastError = v25;

  long long v27 = *p_deviceString;
  *p_deviceString = (NSString *)@"ST3";

  if ([v24 isEqualToString:@"SpearTooth2"]) {
    goto LABEL_23;
  }
LABEL_20:
  if (*p_deviceString) {
    goto LABEL_29;
  }
LABEL_24:
  long long v31 = [v5 objectForKeyedSubscript:@"ProductType"];
  uint64_t v32 = [(MOVReaderInterface *)self mapProductToDevice:v31];
  long long v33 = *p_deviceString;
  *p_deviceString = (NSString *)v32;

  if (!*p_deviceString)
  {
    long long v34 = [(MOVReaderInterface *)self grabMovieMetadataForKey:@"mdta/com.apple.jasperl.calibdata"];
    [v34 objectForKey:@"PlatformId"];
    uint64_t v35 = v44 = v10;
    uint64_t v36 = [(MOVReaderInterface *)self deviceStringFromPlatformID:v35];
    uint64_t v37 = *p_deviceString;
    *p_deviceString = (NSString *)v36;

    uint64_t v10 = v44;
    if (!*p_deviceString)
    {
      uint64_t v38 = [(MOVReaderInterface *)self grabMovieMetadataForKey:@"mdta/com.apple.strecorder.summary"];
      uint64_t v39 = [v38 objectForKey:@"STRecorder Version"];
      if (v39)
      {
        objc_msgSend(MEMORY[0x263F087E8], "movReaderInterfaceWarningWithMessage:code:", @"Metadata is missing; assuming device is ST2",
          1);
        v40 = (NSError *)objc_claimAutoreleasedReturnValue();
        uint64_t v41 = self->_lastError;
        self->_lastError = v40;

        v42 = *p_deviceString;
        *p_deviceString = (NSString *)@"ST2";
      }
      uint64_t v10 = v44;
    }
  }
LABEL_29:
  objc_msgSend(v5, "setObject:forKeyedSubscript:");

  return v5;
}

- (void)addStreamFilter:(id)a3 obj:(id)a4
{
  id v11 = a3;
  streamFilters = self->_streamFilters;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)streamFilters objectForKeyedSubscript:v11];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 addObject:v7];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x263EFF980] arrayWithObject:v7];

    [(NSMutableDictionary *)self->_streamFilters setObject:v10 forKeyedSubscript:v11];
    id v7 = (id)v10;
  }
}

- (id)applyFlip:(id)a3 f:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objectForKeyedSubscript:@"flip"];
  id v7 = v5;
  if ([v6 containsString:@"H"])
  {
    id v7 = [v5 imageByApplyingCGOrientation:2];
  }
  if ([v6 containsString:@"V"])
  {
    uint64_t v8 = [v7 imageByApplyingCGOrientation:4];

    id v7 = (void *)v8;
  }

  return v7;
}

- (void)addStreamFilters:(id)a3
{
  uint64_t v131 = *MEMORY[0x263EF8340];
  id v89 = a3;
  int v3 = [MEMORY[0x263F08850] defaultManager];
  char v4 = [v3 fileExistsAtPath:v89];

  if (v4)
  {
    int v88 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v89];
    id v126 = 0;
    v86 = [MEMORY[0x263F08900] JSONObjectWithData:v88 options:1 error:&v126];
    id v5 = v126;
    v85 = v5;
    if (v5)
    {
      id v6 = (void *)MEMORY[0x263F087E8];
      id v7 = NSString;
      obuint64_t j = [v5 localizedDescription];
      uint64_t v8 = [v7 stringWithFormat:@"Filter file can't be parsed: %@", obj];
      uint64_t v9 = [v6 movReaderInterfaceErrorWithMessage:v8 code:13];
      lastError = self->_lastError;
      self->_lastError = v9;

      goto LABEL_4;
    }
    id v11 = v86;
    if (v86)
    {
      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      obuint64_t j = v86;
      uint64_t v83 = [obj countByEnumeratingWithState:&v122 objects:v130 count:16];
      if (!v83) {
        goto LABEL_4;
      }
      uint64_t v82 = *(void *)v123;
      unsigned int v104 = *MEMORY[0x263F00878];
      unsigned int v103 = *MEMORY[0x263F00870];
      uint64_t v101 = *MEMORY[0x263F00990];
      uint64_t v102 = *MEMORY[0x263F00968];
      uint64_t v100 = *MEMORY[0x263F00928];
      while (1)
      {
        for (uint64_t i = 0; i != v83; ++i)
        {
          if (*(void *)v123 != v82) {
            objc_enumerationMutation(obj);
          }
          uint64_t v105 = *(void *)(*((void *)&v122 + 1) + 8 * i);
          long long v14 = objc_msgSend(obj, "objectForKeyedSubscript:");
          long long v120 = 0u;
          long long v121 = 0u;
          long long v118 = 0u;
          long long v119 = 0u;
          id v90 = v14;
          uint64_t v92 = [v90 countByEnumeratingWithState:&v118 objects:v129 count:16];
          if (v92)
          {
            uint64_t v91 = *(void *)v119;
            do
            {
              for (uint64_t j = 0; j != v92; ++j)
              {
                if (*(void *)v119 != v91) {
                  objc_enumerationMutation(v90);
                }
                v99 = *(void **)(*((void *)&v118 + 1) + 8 * j);
                v98 = [v99 objectForKeyedSubscript:@"filterName"];
                if (v98)
                {
                  long long v15 = [MEMORY[0x263F00640] filterWithName:v98];
                  if (!v15)
                  {
                    v57 = (void *)MEMORY[0x263F087E8];
                    v58 = [NSString stringWithFormat:@"Filter name not found: %@", v98];
                    v59 = [v57 movReaderInterfaceErrorWithMessage:v58 code:13];
                    v60 = self->_lastError;
                    self->_lastError = v59;

                    v61 = (void *)MEMORY[0x263EFF940];
                    v62 = [(NSError *)self->_lastError localizedDescription];
                    v63 = [v61 exceptionWithName:@"AppleCV3DMOVKitErrorFilterFileFailed" reason:v62 userInfo:0];

                    objc_exception_throw(v63);
                  }
                  long long v16 = [v99 objectForKeyedSubscript:@"params"];
                  long long v116 = 0u;
                  long long v117 = 0u;
                  long long v114 = 0u;
                  long long v115 = 0u;
                  uint64_t v17 = [v16 countByEnumeratingWithState:&v114 objects:v128 count:16];
                  if (v17)
                  {
                    uint64_t v18 = *(void *)v115;
                    do
                    {
                      for (uint64_t k = 0; k != v17; ++k)
                      {
                        if (*(void *)v115 != v18) {
                          objc_enumerationMutation(v16);
                        }
                        uint64_t v20 = *(void *)(*((void *)&v114 + 1) + 8 * k);
                        uint64_t v21 = [v16 objectForKeyedSubscript:v20];
                        [v15 setValue:v21 forKey:v20];
                      }
                      uint64_t v17 = [v16 countByEnumeratingWithState:&v114 objects:v128 count:16];
                    }
                    while (v17);
                  }
                  [v99 setObject:v15 forKeyedSubscript:@"filter"];
                  [(MOVReaderInterface *)self addStreamFilter:v105 obj:v99];
                }
                v97 = [v99 objectForKeyedSubscript:@"filterImage"];
                if (v97)
                {
                  id v22 = [NSURL fileURLWithPath:v97];
                  uint64_t v23 = [MEMORY[0x263F00650] imageWithContentsOfURL:v22];
                  if (!v23)
                  {
                    v75 = (void *)MEMORY[0x263F087E8];
                    v76 = [NSString stringWithFormat:@"Filter image not found: %@", v97];
                    int v77 = [v75 movReaderInterfaceErrorWithMessage:v76 code:13];
                    v78 = self->_lastError;
                    self->_lastError = v77;

                    v79 = (void *)MEMORY[0x263EFF940];
                    v80 = [(NSError *)self->_lastError localizedDescription];
                    v81 = [v79 exceptionWithName:@"AppleCV3DMOVKitErrorFilterFileFailed" reason:v80 userInfo:0];

                    objc_exception_throw(v81);
                  }
                  long long v24 = [v99 objectForKeyedSubscript:@"selector"];
                  SEL v25 = NSSelectorFromString(v24);

                  long long v26 = [MEMORY[0x263F005F8] performSelector:v25];
                  [v99 setObject:v26 forKeyedSubscript:@"filter"];
                  long long v27 = [(MOVReaderInterface *)self applyFlip:v23 f:v99];
                  [v99 setObject:v27 forKeyedSubscript:@"background_img"];

                  [(MOVReaderInterface *)self addStreamFilter:v105 obj:v99];
                }
                double v28 = [v99 objectForKeyedSubscript:@"filterKernel"];
                id v96 = v28;
                if (v28)
                {
                  uint64_t v29 = (void *)MEMORY[0x263EFF8F8];
                  uint64_t v30 = [v28 objectForKeyedSubscript:@"path"];
                  char v93 = [v29 dataWithContentsOfFile:v30];

                  long long v31 = (void *)MEMORY[0x263F00658];
                  uint64_t v32 = [v96 objectForKeyedSubscript:@"name"];
                  id v113 = 0;
                  v94 = [v31 kernelWithFunctionName:v32 fromMetalLibraryData:v93 error:&v113];
                  id v33 = v113;

                  if (!v94 || v33)
                  {
                    char v64 = (void *)MEMORY[0x263F087E8];
                    v65 = NSString;
                    int v66 = [v96 objectForKeyedSubscript:@"path"];
                    v67 = [v96 objectForKeyedSubscript:@"name"];
                    v68 = [v33 localizedDescription];
                    v69 = [v65 stringWithFormat:@"Filter Kernel failed: %@, %@, %@", v66, v67, v68];
                    v70 = [v64 movReaderInterfaceErrorWithMessage:v69 code:13];
                    char v71 = self->_lastError;
                    self->_lastError = v70;

                    v72 = (void *)MEMORY[0x263EFF940];
                    int v73 = [(NSError *)self->_lastError localizedDescription];
                    v74 = [v72 exceptionWithName:@"AppleCV3DMOVKitErrorFilterFileFailed" reason:v73 userInfo:0];

                    objc_exception_throw(v74);
                  }
                  [v99 setObject:v94 forKeyedSubscript:@"filter"];
                  long long v34 = (void *)MEMORY[0x263EFF8C0];
                  uint64_t v35 = [v99 objectForKeyedSubscript:@"params"];
                  uint64_t v36 = [v34 arrayWithArray:v35];

                  v108 = objc_opt_new();
                  long long v111 = 0u;
                  long long v112 = 0u;
                  long long v109 = 0u;
                  long long v110 = 0u;
                  id v107 = v36;
                  uint64_t v37 = [v107 countByEnumeratingWithState:&v109 objects:v127 count:16];
                  if (v37)
                  {
                    uint64_t v38 = *(void *)v110;
                    do
                    {
                      for (uint64_t m = 0; m != v37; ++m)
                      {
                        if (*(void *)v110 != v38) {
                          objc_enumerationMutation(v107);
                        }
                        v40 = *(void **)(*((void *)&v109 + 1) + 8 * m);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          uint64_t v41 = [v40 objectForKeyedSubscript:@"path"];
                          if (v41)
                          {
                            v42 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v41];
                            if (v42)
                            {
                              v43 = [v40 objectForKeyedSubscript:@"dim"];
                              unint64_t v44 = [v43 longValue];

                              if ([v41 hasSuffix:@"png"])
                              {
                                int v45 = [MEMORY[0x263F00650] imageWithData:v42];
                              }
                              else
                              {
                                int v45 = 0;
                              }
                              if ([v41 hasSuffix:@"sraw"])
                              {
                                uint64_t v46 = [v40 objectForKeyedSubscript:@"bpp"];
                                int v47 = [v46 intValue] == 16;

                                if (v47) {
                                  uint64_t v48 = v103;
                                }
                                else {
                                  uint64_t v48 = v104;
                                }
                                uint64_t v49 = objc_msgSend(MEMORY[0x263F00650], "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v42, v44 << v47, v48, 0, (double)v44, (double)v44);

                                int v45 = (void *)v49;
                              }
                              if (v45)
                              {
                                uint64_t v50 = [(MOVReaderInterface *)self applyFlip:v45 f:v40];

                                [(MOVStreamReader *)self getOutputSizeForStream:v105];
                                unint64_t v52 = (unint64_t)v51;
                                if (v44 != (unint64_t)v51)
                                {
                                  v53 = [MEMORY[0x263F00640] filterWithName:@"CILanczosScaleTransform"];
                                  [v53 setValue:v50 forKey:v102];
                                  *(float *)&double v54 = (float)v52 / (float)v44;
                                  uint64_t v55 = [NSNumber numberWithFloat:v54];
                                  [v53 setValue:v55 forKey:v101];

                                  [v53 setValue:&unk_26CB67B58 forKey:v100];
                                  uint64_t v56 = [v53 outputImage];

                                  uint64_t v50 = (void *)v56;
                                }
                                if (v50) {
                                  [v40 setObject:v50 forKeyedSubscript:@"img"];
                                }
                                goto LABEL_58;
                              }
                            }
                          }
                          else
                          {
                            v42 = 0;
                          }
                          uint64_t v50 = 0;
LABEL_58:
                        }
                        [v108 addObject:v40];
                      }
                      uint64_t v37 = [v107 countByEnumeratingWithState:&v109 objects:v127 count:16];
                    }
                    while (v37);
                  }

                  [v99 setObject:v108 forKeyedSubscript:@"params"];
                  [(MOVReaderInterface *)self addStreamFilter:v105 obj:v99];

                  double v28 = v96;
                }
              }
              uint64_t v92 = [v90 countByEnumeratingWithState:&v118 objects:v129 count:16];
            }
            while (v92);
          }
        }
        uint64_t v83 = [obj countByEnumeratingWithState:&v122 objects:v130 count:16];
        if (!v83)
        {
LABEL_4:

          id v11 = v86;
          break;
        }
      }
    }
  }
  else
  {
    char v12 = [MEMORY[0x263F087E8] movReaderInterfaceErrorWithMessage:@"Filter file is missing" code:13];
    int v13 = self->_lastError;
    self->_lastError = v12;
  }
}

- (__CVBuffer)copyNextFrameForStream:(id)a3 timestamp:(id *)a4 error:(id *)a5
{
  uint64_t v84 = *MEMORY[0x263EF8340];
  id v8 = a3;
  lastError = self->_lastError;
  self->_lastError = 0;

  v81.receiver = self;
  v81.super_class = (Class)MOVReaderInterface;
  uint64_t v10 = [(MOVStreamReader *)&v81 copyNextFrameForStream:v8 timestamp:a4 error:a5];
  uint64_t v11 = [(NSMutableDictionary *)self->_streamFilters objectForKeyedSubscript:v8];
  char v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (!v13)
  {
    id v59 = v8;
    v60 = v10;
    long long v14 = [(MOVReaderInterface *)self filterContext];

    if (!v14)
    {
      long long v15 = [MEMORY[0x263F00628] context];
      filterContext = self->_filterContext;
      self->_filterContext = v15;
    }
    int v66 = self;
    uint64_t v17 = objc_opt_new();
    [MEMORY[0x263F00650] imageWithCVImageBuffer:v60];
    v57 = v70 = v17;
    objc_msgSend(v17, "addObject:");
    long long v79 = 0u;
    long long v80 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    v58 = v12;
    id v18 = v12;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v77 objects:v83 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = @"src";
      uint64_t v22 = *(void *)v78;
      uint64_t v65 = *MEMORY[0x263F00968];
      uint64_t v61 = *(void *)v78;
      id v62 = v18;
      do
      {
        uint64_t v23 = 0;
        uint64_t v63 = v20;
        do
        {
          if (*(void *)v78 != v22) {
            objc_enumerationMutation(v18);
          }
          uint64_t v29 = *(void **)(*((void *)&v77 + 1) + 8 * v23);
          uint64_t v30 = [v29 objectForKeyedSubscript:v21];
          if (v30)
          {
            double v28 = [v29 objectForKeyedSubscript:v21];

            if ([v28 isEqual:&unk_26CB67B10]) {
              goto LABEL_19;
            }
          }
          else
          {
            double v28 = &unk_26CB67B10;

            if ([&unk_26CB67B10 isEqual:&unk_26CB67B10])
            {
LABEL_19:
              uint64_t v31 = [v70 lastObject];
              goto LABEL_22;
            }
          }
          uint64_t v31 = objc_msgSend(v70, "objectAtIndexedSubscript:", (int)objc_msgSend(v28, "intValue"));
LABEL_22:
          v69 = (void *)v31;
          uint64_t v32 = [v29 objectForKeyedSubscript:@"filter"];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v67 = v28;
            uint64_t v68 = v23;
            id v24 = v32;
            SEL v25 = [(MOVReaderInterface *)v66 applyFlip:v69 f:v29];
            [v24 setValue:v25 forKey:v65];
            uint64_t v26 = [v24 outputImage];
LABEL_12:
            long long v27 = (void *)v26;

            [v70 addObject:v27];
LABEL_13:

            double v28 = v67;
            uint64_t v23 = v68;
            goto LABEL_14;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v67 = v28;
            uint64_t v68 = v23;
            id v24 = v32;
            SEL v25 = [v29 objectForKeyedSubscript:@"background_img"];
            uint64_t v26 = [v24 applyWithForeground:v69 background:v25];
            goto LABEL_12;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v67 = v28;
            uint64_t v68 = v23;
            id v33 = [MEMORY[0x263EFF980] arrayWithObject:v69];
            long long v34 = [v29 objectForKeyedSubscript:@"mult"];
            if (v34)
            {
              uint64_t v35 = [v29 objectForKeyedSubscript:@"mult"];
            }
            else
            {
              uint64_t v35 = &unk_26CB67B58;
            }

            char v64 = v35;
            [v33 addObject:v35];
            uint64_t v36 = [v29 objectForKeyedSubscript:@"params"];
            long long v73 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            obuint64_t j = v36;
            uint64_t v37 = [v36 countByEnumeratingWithState:&v73 objects:v82 count:16];
            if (v37)
            {
              uint64_t v38 = v37;
              uint64_t v39 = *(void *)v74;
              uint64_t v71 = *(void *)v74;
              do
              {
                for (uint64_t i = 0; i != v38; ++i)
                {
                  while (1)
                  {
                    if (*(void *)v74 != v39) {
                      objc_enumerationMutation(obj);
                    }
                    uint64_t v41 = *(void **)(*((void *)&v73 + 1) + 8 * i);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass()) {
                      break;
                    }
                    [v33 addObject:v41];
                    if (v38 == ++i) {
                      goto LABEL_31;
                    }
                  }
                  v42 = v32;
                  v43 = [v41 objectForKeyedSubscript:@"mult"];
                  if (v43)
                  {
                    unint64_t v44 = [v41 objectForKeyedSubscript:@"mult"];
                  }
                  else
                  {
                    unint64_t v44 = &unk_26CB67B58;
                  }

                  int v45 = [v41 objectForKeyedSubscript:v21];

                  if (v45)
                  {
                    uint64_t v46 = v21;
                    int v47 = [v41 objectForKeyedSubscript:v21];
                    if ([v47 isEqual:&unk_26CB67B10]) {
                      [v70 lastObject];
                    }
                    else {
                    uint64_t v48 = objc_msgSend(v70, "objectAtIndexedSubscript:", (int)objc_msgSend(v47, "intValue"));
                    }
                    [v33 addObject:v48];
                    [v33 addObject:v44];

                    uint64_t v21 = v46;
                  }
                  uint64_t v49 = [v41 objectForKeyedSubscript:@"img"];

                  if (v49)
                  {
                    uint64_t v50 = [v41 objectForKeyedSubscript:@"img"];
                    [v33 addObject:v50];

                    [v33 addObject:v44];
                  }

                  uint64_t v32 = v42;
                  uint64_t v39 = v71;
                }
LABEL_31:
                uint64_t v38 = [obj countByEnumeratingWithState:&v73 objects:v82 count:16];
              }
              while (v38);
            }
            id v51 = v32;
            [v69 extent];
            unint64_t v52 = objc_msgSend(v51, "applyWithExtent:roiCallback:arguments:", &unk_26CB5E418, v33);

            [v70 addObject:v52];
            SEL v25 = v33;
            id v18 = v62;
            uint64_t v20 = v63;
            uint64_t v22 = v61;
            long long v27 = v64;
            goto LABEL_13;
          }
LABEL_14:

          ++v23;
        }
        while (v23 != v20);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v77 objects:v83 count:16];
      }
      while (v20);
    }

    v53 = v66->_filterContext;
    double v54 = [v70 lastObject];
    uint64_t v55 = v53;
    uint64_t v10 = v60;
    [(CIContext *)v55 render:v54 toCVPixelBuffer:v60];

    char v12 = v58;
    id v8 = v59;
  }

  return v10;
}

- (id)resolvedCalibration:(int64_t *)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  lastError = self->_lastError;
  self->_lastError = 0;

  id v6 = @"mdta/com.apple.calibration";
  unint64_t v7 = 0x263F08000uLL;
  id v8 = [NSString stringWithFormat:@"%@.0", v6];
  [(MOVStreamReader *)self metadataForMovie];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v9)
  {
    if (!a3) {
      goto LABEL_19;
    }
    int64_t v21 = *a3;
    if (!*a3) {
      goto LABEL_19;
    }
    goto LABEL_15;
  }
  uint64_t v10 = v9;
  SEL v25 = self;
  uint64_t v26 = a3;
  int v11 = 0;
  int v12 = 0;
  uint64_t v13 = *(void *)v29;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v29 != v13) {
        objc_enumerationMutation(obj);
      }
      long long v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      uint64_t v16 = [v15 identifier];
      int v17 = [(__CFString *)v6 isEqualToString:v16];

      v11 |= v17;
      id v18 = [v15 identifier];
      LODWORD(v16) = [v8 isEqualToString:v18];

      v12 |= v16;
    }
    uint64_t v10 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  }
  while (v10);
  if (v11 & v12)
  {
    uint64_t v19 = [MEMORY[0x263F087E8] movReaderInterfaceWarningWithMessage:@"Location nil and 0 are both present. This is unexpected!!" code:2];
    uint64_t v20 = v25->_lastError;
    v25->_lastError = (NSError *)v19;
  }
  if (!v26)
  {
    if (v11) {
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  int64_t v21 = *v26;
  unint64_t v7 = 0x263F08000;
  if (*v26)
  {
LABEL_15:
    uint64_t v22 = [*(id *)(v7 + 2880) stringWithFormat:@"%@.%ld", v6, v21];
    goto LABEL_20;
  }
LABEL_17:
  if (v12)
  {
    uint64_t v22 = v8;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v22 = v6;
LABEL_20:
  uint64_t v23 = v22;

  return v23;
}

- (id)grabCalibration:(int64_t *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  char v4 = [(MOVReaderInterface *)self resolvedCalibration:a3];
  [(MOVStreamReader *)self metadataForMovie];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "identifier", (void)v14);
        char v11 = [v4 isEqualToString:v10];

        if (v11)
        {
          int v12 = [v9 value];
          id v6 = +[CVAMetadataWrapper decodeCVACalibration:v12];

          goto LABEL_11;
        }
      }
      id v6 = (void *)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)grabCalibration
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabCalibration_);
}

+ (BOOL)grabSWToWExtrinsics:(id *)a3 summary:(id)a4 backExtrinsics:(id)a5
{
  id v7 = a5;
  id v8 = [a4 objectForKeyedSubscript:@"extrinsicsSWToW"];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 objectAtIndexedSubscript:0];
    [v10 floatValue];
    *(_DWORD *)a3 = v11;

    int v12 = [v9 objectAtIndexedSubscript:1];
    [v12 floatValue];
    *((_DWORD *)a3 + 4) = v13;

    long long v14 = [v9 objectAtIndexedSubscript:2];
    [v14 floatValue];
    *((_DWORD *)a3 + 8) = v15;

    long long v16 = [v9 objectAtIndexedSubscript:3];
    [v16 floatValue];
    *((_DWORD *)a3 + 12) = v17;

    id v18 = [v9 objectAtIndexedSubscript:4];
    [v18 floatValue];
    *((_DWORD *)a3 + 1) = v19;

    uint64_t v20 = [v9 objectAtIndexedSubscript:5];
    [v20 floatValue];
    *((_DWORD *)a3 + 5) = v21;

    uint64_t v22 = [v9 objectAtIndexedSubscript:6];
    [v22 floatValue];
    *((_DWORD *)a3 + 9) = v23;

    id v24 = [v9 objectAtIndexedSubscript:7];
    [v24 floatValue];
    *((_DWORD *)a3 + 13) = v25;

    uint64_t v26 = [v9 objectAtIndexedSubscript:8];
    [v26 floatValue];
    *((_DWORD *)a3 + 2) = v27;

    long long v28 = [v9 objectAtIndexedSubscript:9];
    [v28 floatValue];
    *((_DWORD *)a3 + 6) = v29;

    long long v30 = [v9 objectAtIndexedSubscript:10];
    [v30 floatValue];
    *((_DWORD *)a3 + 10) = v31;

    id v32 = [v9 objectAtIndexedSubscript:11];
    [v32 floatValue];
    *((_DWORD *)a3 + 14) = v33;
  }
  else
  {
    if (!v7
      || ([v7 objectForKeyedSubscript:*MEMORY[0x263F2C260]],
          uint64_t v35 = objc_claimAutoreleasedReturnValue(),
          [v35 objectForKeyedSubscript:*MEMORY[0x263F2C238]],
          uint64_t v36 = objc_claimAutoreleasedReturnValue(),
          v35,
          !v36))
    {
      BOOL v34 = 0;
      goto LABEL_8;
    }
    id v32 = v36;
    uint64_t v37 = (float32x2_t *)[v32 bytes];
    float32x4_t v38 = *(float32x4_t *)v37[2].f32;
    float32x4_t v39 = *(float32x4_t *)v37[4].f32;
    float32x4_t v40 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 32);
    float32x4_t v41 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
    float32x4_t v42 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
    v42.i32[1] = -1.0;
    float32x4_t v43 = *(float32x4_t *)MEMORY[0x263EF89A8];
    v43.i32[0] = -1.0;
    float32x4_t v44 = vmlaq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v43, COERCE_FLOAT(*(_OWORD *)v37->f32)), v42, v38.f32[0]), v40, v39.f32[0]), (float32x4_t)0, v41);
    float32x4_t v45 = vmlaq_f32(vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v43, *v37, 1), v42, *(float32x2_t *)v38.f32, 1), v40, *(float32x2_t *)v39.f32, 1), (float32x4_t)0, v41);
    float32x4_t v46 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v43, *(float32x4_t *)v37->f32, 2), v42, v38, 2), v40, v39, 2), (float32x4_t)0, v41);
    float32x4_t v47 = vaddq_f32(v41, vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v43, *(float32x4_t *)v37->f32, 3), v42, v38, 3), v40, v39, 3));
    v54.columns[0] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vnegq_f32(v44), v45, *MEMORY[0x263EF89A8], 1), v46, *MEMORY[0x263EF89A8], 2), v47, *MEMORY[0x263EF89A8], 3);
    __asm { FMOV            V2.4S, #-1.0 }
    v54.columns[1] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_f32(vmulq_n_f32(v44, COERCE_FLOAT(*(_OWORD *)(MEMORY[0x263EF89A8] + 16))), _Q2, v45), v46, *(float32x4_t *)(MEMORY[0x263EF89A8] + 16), 2), v47, *(float32x4_t *)(MEMORY[0x263EF89A8] + 16), 3);
    v54.columns[2] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, v40.f32[0]), v45, *(float32x2_t *)v40.f32, 1), v46, v40, 2), v47, v40, 3);
    v54.columns[3] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v44, v41.f32[0]), v45, *(float32x2_t *)v41.f32, 1), v46, v41, 2), v47, v41, 3);
    simd_float4x4 v55 = __invert_f4(v54);
    *((_DWORD *)a3 + 2) = v55.columns[0].i32[2];
    *(void *)a3 = v55.columns[0].i64[0];
    *((_DWORD *)a3 + 6) = v55.columns[1].i32[2];
    *((_DWORD *)a3 + 10) = v55.columns[2].i32[2];
    *((void *)a3 + 2) = v55.columns[1].i64[0];
    *((void *)a3 + 4) = v55.columns[2].i64[0];
    *((_DWORD *)a3 + 14) = v55.columns[3].i32[2];
    *((void *)a3 + 6) = v55.columns[3].i64[0];
  }

  BOOL v34 = 1;
LABEL_8:

  return v34;
}

- (BOOL)grabSWToWExtrinsics:(id *)a3
{
  id v5 = [(MOVReaderInterface *)self grabSummary];
  id v6 = [(MOVReaderInterface *)self grabMovieMetadataForKey:@"mdta/com.apple.isp.BackExtrinsics"];
  LOBYTE(a3) = +[MOVReaderInterface grabSWToWExtrinsics:a3 summary:v5 backExtrinsics:v6];

  return (char)a3;
}

+ (id)grabJasperExtrinsics:(id)a3 backExtrinsics:(id)a4
{
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [a3 objectForKeyedSubscript:@"extrinsicsToJasper"];
  if (v6)
  {
    id v7 = objc_opt_new();
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v8 = [v6 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v89 objects:v93 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      id v82 = v5;
      uint64_t v11 = *(void *)v90;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v90 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v89 + 1) + 8 * i);
          long long v14 = [v6 objectForKeyedSubscript:v13];
          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          int v15 = [v14 objectAtIndexedSubscript:0];
          [v15 floatValue];
          LODWORD(v85) = v16;

          int v17 = [v14 objectAtIndexedSubscript:1];
          [v17 floatValue];
          LODWORD(v86) = v18;

          int v19 = [v14 objectAtIndexedSubscript:2];
          [v19 floatValue];
          LODWORD(v87) = v20;

          int v21 = [v14 objectAtIndexedSubscript:3];
          [v21 floatValue];
          LODWORD(v88) = v22;

          int v23 = [v14 objectAtIndexedSubscript:4];
          [v23 floatValue];
          DWORD1(v85) = v24;

          int v25 = [v14 objectAtIndexedSubscript:5];
          [v25 floatValue];
          DWORD1(v86) = v26;

          int v27 = [v14 objectAtIndexedSubscript:6];
          [v27 floatValue];
          DWORD1(v87) = v28;

          int v29 = [v14 objectAtIndexedSubscript:7];
          [v29 floatValue];
          DWORD1(v88) = v30;

          int v31 = [v14 objectAtIndexedSubscript:8];
          [v31 floatValue];
          DWORD2(v85) = v32;

          int v33 = [v14 objectAtIndexedSubscript:9];
          [v33 floatValue];
          DWORD2(v86) = v34;

          uint64_t v35 = [v14 objectAtIndexedSubscript:10];
          [v35 floatValue];
          DWORD2(v87) = v36;

          uint64_t v37 = [v14 objectAtIndexedSubscript:11];
          [v37 floatValue];
          DWORD2(v88) = v38;

          float32x4_t v39 = [MEMORY[0x263EFF8F8] dataWithBytes:&v85 length:64];
          [v7 setObject:v39 forKeyedSubscript:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v89 objects:v93 count:16];
      }
      while (v10);
      id v5 = v82;
    }
  }
  else
  {
    if (!v5)
    {
      id v7 = 0;
      goto LABEL_20;
    }
    float32x4_t v40 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2C248]];
    uint64_t v41 = *MEMORY[0x263F2C238];
    id v8 = [v40 objectForKeyedSubscript:*MEMORY[0x263F2C238]];

    uint64_t v42 = *MEMORY[0x263F2C260];
    float32x4_t v43 = [v5 objectForKeyedSubscript:*MEMORY[0x263F2C260]];
    float32x4_t v44 = [v43 objectForKeyedSubscript:v41];

    if (v8) {
      _ZF = v44 == 0;
    }
    else {
      _ZF = 1;
    }
    if (_ZF)
    {
      id v7 = 0;
    }
    else
    {
      id v7 = objc_opt_new();
      float32x4_t v46 = (float32x2_t *)[v8 bytes];
      float32x4_t v47 = *(float32x4_t *)v46[2].f32;
      float32x4_t v48 = *(float32x4_t *)v46[4].f32;
      float32x4_t v50 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 32);
      float32x4_t v49 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 48);
      float32x4_t v51 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
      v51.i32[1] = -1.0;
      float32x4_t v52 = *(float32x4_t *)MEMORY[0x263EF89A8];
      v52.i32[0] = -1.0;
      float32x4_t v74 = v52;
      float32x4_t v75 = v51;
      float32x4_t v53 = vmlaq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v52, COERCE_FLOAT(*(_OWORD *)v46->f32)), v51, v47.f32[0]), v50, v48.f32[0]), (float32x4_t)0, v49);
      float32x4_t v54 = vmlaq_f32(vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v52, *v46, 1), v51, *(float32x2_t *)v47.f32, 1), v50, *(float32x2_t *)v48.f32, 1), (float32x4_t)0, v49);
      float32x4_t v55 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v52, *(float32x4_t *)v46->f32, 2), v51, v47, 2), v50, v48, 2), (float32x4_t)0, v49);
      float32x4_t v56 = vaddq_f32(v49, vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v52, *(float32x4_t *)v46->f32, 3), v51, v47, 3), v50, v48, 3));
      float32x4_t v79 = *(float32x4_t *)MEMORY[0x263EF89A8];
      float32x4_t v76 = *(float32x4_t *)(MEMORY[0x263EF89A8] + 16);
      __asm { FMOV            V2.4S, #-1.0 }
      float32x4_t v80 = _Q2;
      float32x4_t v72 = v49;
      float32x4_t v73 = v50;
      float32x4_t v81 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vnegq_f32(v53), v54, *MEMORY[0x263EF89A8], 1), v55, *MEMORY[0x263EF89A8], 2), v56, *MEMORY[0x263EF89A8], 3);
      float32x4_t v83 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_f32(vmulq_n_f32(v53, v76.f32[0]), _Q2, v54), v55, v76, 2), v56, v76, 3);
      *((void *)&v85 + 1) = v81.u32[2];
      *((void *)&v86 + 1) = v83.u32[2];
      *(void *)&long long v85 = v81.i64[0];
      *(void *)&long long v86 = v83.i64[0];
      float32x4_t v77 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v53, v50.f32[0]), v54, *(float32x2_t *)v50.f32, 1), v55, v50, 2), v56, v50, 3);
      float32x4_t v78 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v53, v49.f32[0]), v54, *(float32x2_t *)v49.f32, 1), v55, v49, 2), v56, v49, 3);
      *((void *)&v87 + 1) = v77.u32[2];
      *((void *)&v88 + 1) = v78.u32[2];
      *(void *)&long long v87 = v77.i64[0];
      *(void *)&long long v88 = v78.i64[0];
      uint64_t v61 = [MEMORY[0x263EFF8F8] dataWithBytes:&v85 length:64];
      [v7 setObject:v61 forKeyedSubscript:v41];
      [v7 setObject:v61 forKeyedSubscript:@"AVCaptureDeviceTypeBuiltInWideAngleCamera.1"];
      id v62 = (float32x2_t *)[v44 bytes];
      float32x4_t v63 = *(float32x4_t *)v62[2].f32;
      float32x4_t v64 = *(float32x4_t *)v62[4].f32;
      float32x4_t v65 = vmlaq_f32(vmlaq_n_f32(vmlaq_n_f32(vmulq_n_f32(v74, COERCE_FLOAT(*(_OWORD *)v62->f32)), v75, v63.f32[0]), v73, v64.f32[0]), (float32x4_t)0, v72);
      float32x4_t v66 = vmlaq_f32(vmlaq_lane_f32(vmlaq_lane_f32(vmulq_lane_f32(v74, *v62, 1), v75, *(float32x2_t *)v63.f32, 1), v73, *(float32x2_t *)v64.f32, 1), (float32x4_t)0, v72);
      float32x4_t v67 = vmlaq_f32(vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v74, *(float32x4_t *)v62->f32, 2), v75, v63, 2), v73, v64, 2), (float32x4_t)0, v72);
      float32x4_t v68 = vaddq_f32(v72, vmlaq_laneq_f32(vmlaq_laneq_f32(vmulq_laneq_f32(v74, *(float32x4_t *)v62->f32, 3), v75, v63, 3), v73, v64, 3));
      v96.columns[0] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vnegq_f32(v65), v66, *(float32x2_t *)v79.f32, 1), v67, v79, 2), v68, v79, 3);
      v96.columns[1] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_f32(vmulq_n_f32(v65, v76.f32[0]), v80, v66), v67, v76, 2), v68, v76, 3);
      v96.columns[2] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v65, v73.f32[0]), v66, *(float32x2_t *)v73.f32, 1), v67, v73, 2), v68, v73, 3);
      v96.columns[3] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v65, v72.f32[0]), v66, *(float32x2_t *)v72.f32, 1), v67, v72, 2), v68, v72, 3);
      simd_float4x4 v97 = __invert_f4(v96);
      float32x4_t v69 = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, v97.columns[0].f32[0]), v83, *(float32x2_t *)v97.columns[0].f32, 1), v77, (float32x4_t)v97.columns[0], 2), v78, (float32x4_t)v97.columns[0], 3);
      v97.columns[0] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, v97.columns[1].f32[0]), v83, *(float32x2_t *)v97.columns[1].f32, 1), v77, (float32x4_t)v97.columns[1], 2), v78, (float32x4_t)v97.columns[1], 3);
      v97.columns[1] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, v97.columns[2].f32[0]), v83, *(float32x2_t *)v97.columns[2].f32, 1), v77, (float32x4_t)v97.columns[2], 2), v78, (float32x4_t)v97.columns[2], 3);
      v84[1] = v69.u32[2];
      v84[3] = v97.columns[0].u32[2];
      v97.columns[2] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v81, v97.columns[3].f32[0]), v83, *(float32x2_t *)v97.columns[3].f32, 1), v77, (float32x4_t)v97.columns[3], 2), v78, (float32x4_t)v97.columns[3], 3);
      v84[0] = v69.i64[0];
      v84[2] = v97.columns[0].i64[0];
      v84[5] = v97.columns[1].u32[2];
      v84[7] = v97.columns[2].u32[2];
      v84[4] = v97.columns[1].i64[0];
      v84[6] = v97.columns[2].i64[0];
      v70 = [MEMORY[0x263EFF8F8] dataWithBytes:v84 length:64];
      [v7 setObject:v70 forKeyedSubscript:v42];
      [v7 setObject:v70 forKeyedSubscript:@"AVCaptureDeviceTypeBuiltInUltraWideCamera.1"];
    }
  }

LABEL_20:
  return v7;
}

- (id)grabJasperExtrinsics
{
  int v3 = [(MOVReaderInterface *)self grabSummary];
  char v4 = [(MOVReaderInterface *)self grabMovieMetadataForKey:@"mdta/com.apple.isp.BackExtrinsics"];
  id v5 = +[MOVReaderInterface grabJasperExtrinsics:v3 backExtrinsics:v4];

  return v5;
}

- (id)grabNextStreamData:(id)a3 timeRange:(id *)a4
{
  id v6 = a3;
  lastError = self->_lastError;
  self->_lastError = 0;

  id v18 = 0;
  id v8 = [(MOVStreamReader *)self grabNextMetadataOfStream:v6 timeRange:a4 error:&v18];
  id v9 = v18;
  uint64_t v10 = v9;
  if (v9)
  {
    uint64_t v11 = NSString;
    int v12 = [v9 description];
    uint64_t v13 = [v11 stringWithFormat:@"%@: %@", v6, v12];

    long long v14 = [MEMORY[0x263F087E8] movReaderInterfaceErrorWithMessage:v13 code:9];
    int v15 = self->_lastError;
    self->_lastError = v14;

    id v16 = 0;
  }
  else
  {
    id v16 = v8;
  }

  return v16;
}

- (id)grabNextFastPathData:(id)a3
{
  return [(MOVReaderInterface *)self grabNextStreamData:a3 timeRange:0];
}

- (id)resolvedIMUStreamName:(int64_t *)a3 metadataID:(id)a4
{
  return +[CVAMetadataWrapper imuTrackName:prefix:](CVAMetadataWrapper, "imuTrackName:prefix:");
}

- (id)grabNextFastPathControlData:(id)a3
{
  return [(MOVReaderInterface *)self grabNextStreamData:a3 timeRange:0];
}

- (id)grabNextFastPathMUData:(int64_t *)a3 metadataID:(id)a4
{
  id v5 = [(MOVReaderInterface *)self resolvedIMUStreamName:a3 metadataID:a4];
  id v6 = [(MOVReaderInterface *)self grabNextStreamData:v5 timeRange:0];

  return v6;
}

- (id)grabNextFastPathMUData:(int64_t *)a3
{
  char v4 = [(MOVReaderInterface *)self resolvedSpuIMUStreamName:a3];
  id v5 = [(MOVReaderInterface *)self grabNextStreamData:v4 timeRange:0];

  return v5;
}

- (id)grabNextSpuIMUData:(int64_t *)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextSpuIMUData_location_);
}

- (id)resolvedSpuIMUStreamName:(int64_t *)a3
{
  return [(MOVReaderInterface *)self resolvedIMUStreamName:a3 metadataID:self->_spuIMUTrackName];
}

- (id)grabNextSpuIMUData:(id *)a3 location:(int64_t *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = [(MOVReaderInterface *)self resolvedSpuIMUStreamName:a4];
  id v8 = [(MOVReaderInterface *)self grabNextStreamData:v7 timeRange:a3];
  id v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  if (a4) {
    int64_t v10 = *a4;
  }
  else {
    int64_t v10 = 0;
  }
  uint64_t v11 = [NSNumber numberWithInteger:v10];
  int v12 = [(NSMutableDictionary *)self->_spuVersions objectForKeyedSubscript:v11];
  int v13 = [v12 unsignedIntValue];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v14 = v8;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    if (v13)
    {
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          int v20 = [CVASpuFastPathComboAxisData alloc];
          int v21 = -[CVASpuFastPathComboAxisData initWithFastPathIMUData:](v20, "initWithFastPathIMUData:", v19, (void)v25);
          if (v21) {
            [v9 addObject:v21];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v16);
    }
    else
    {
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v26 != v17) {
            objc_enumerationMutation(v14);
          }
          int v23 = +[CVAMetadataWrapper decodeIMU:](CVAMetadataWrapper, "decodeIMU:", *(void *)(*((void *)&v25 + 1) + 8 * j), (void)v25);
          if (v23) {
            [v9 addObject:v23];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v16);
    }
  }

  return v9;
}

- (id)grabNextRawAccelData
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextRawAccelData_location_);
}

- (id)grabNextRawAccelData:(int64_t *)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextRawAccelData_location_);
}

- (id)resolvedAccelStreamName:(int64_t *)a3
{
  if (a3)
  {
    if (!*a3 && self->_accelLocationNil) {
      a3 = 0;
    }
  }
  else if (self->_accelLocation0)
  {
    a3 = (int64_t *)&unk_267C58C70;
  }
  return +[CVAMetadataWrapper accelerometerTrackName:a3 prefix:self->_accelTrackName];
}

- (id)grabNextRawAccelData:(id *)a3 location:(int64_t *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = [(MOVReaderInterface *)self resolvedAccelStreamName:a4];
  id v7 = [(MOVReaderInterface *)self grabNextStreamData:v6 timeRange:a3];
  id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = +[CVAMetadataWrapper decodeAccel:](CVAMetadataWrapper, "decodeAccel:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)grabNextRawGyroData
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextRawGyroData_location_);
}

- (id)grabNextRawGyroData:(int64_t *)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextRawGyroData_location_);
}

- (id)resolvedGyroStreamName:(int64_t *)a3
{
  if (a3)
  {
    if (!*a3 && self->_gyroLocationNil) {
      a3 = 0;
    }
  }
  else if (self->_gyroLocation0)
  {
    a3 = (int64_t *)&unk_267C58C70;
  }
  return +[CVAMetadataWrapper gyroTrackName:a3 prefix:self->_gyroTrackName];
}

- (id)grabNextRawGyroData:(id *)a3 location:(int64_t *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = [(MOVReaderInterface *)self resolvedGyroStreamName:a4];
  id v7 = [(MOVReaderInterface *)self grabNextStreamData:v6 timeRange:a3];
  id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = +[CVAMetadataWrapper decodeGyro:](CVAMetadataWrapper, "decodeGyro:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)grabNextMotionData
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextMotionData_location_);
}

- (id)grabNextMotionData:(int64_t *)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextMotionData_location_);
}

- (id)resolvedMotionStreamName:(int64_t *)a3
{
  if (a3)
  {
    if (!*a3 && self->_motionLocationNil) {
      a3 = 0;
    }
  }
  else if (self->_motionLocation0)
  {
    a3 = (int64_t *)&unk_267C58C70;
  }
  return +[CVAMetadataWrapper motionTrackName:a3 prefix:self->_motionTrackName];
}

- (id)grabNextMotionData:(id *)a3 location:(int64_t *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = [(MOVReaderInterface *)self resolvedMotionStreamName:a4];
  id v7 = [(MOVReaderInterface *)self grabNextStreamData:v6 timeRange:a3];
  id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = +[CVAMetadataWrapper decodeMotion:](CVAMetadataWrapper, "decodeMotion:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)grabNextRawCompassData
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextRawCompassData_);
}

- (id)grabNextRawCompassData:(int64_t *)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextRawCompassData_location_);
}

- (id)resolvedCompassStreamName:(int64_t *)a3
{
  if (a3)
  {
    if (!*a3 && self->_compassLocationNil) {
      a3 = 0;
    }
  }
  else if (self->_compassLocation0)
  {
    a3 = (int64_t *)&unk_267C58C70;
  }
  return +[CVAMetadataWrapper compassTrackName:a3 prefix:self->_compassTrackName];
}

- (id)grabNextRawCompassData:(id *)a3 location:(int64_t *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = [(MOVReaderInterface *)self resolvedCompassStreamName:a4];
  id v7 = [(MOVReaderInterface *)self grabNextStreamData:v6 timeRange:a3];
  id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = +[CVAMetadataWrapper decodeCompass:](CVAMetadataWrapper, "decodeCompass:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)grabNextRawALSData:(int64_t *)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextRawALSData_location_);
}

- (id)grabNextRawALSData:(id *)a3 location:(int64_t *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = +[CVAMetadataWrapper alsTrackName:a4 prefix:self->_alsTrackName];
  id v7 = [(MOVReaderInterface *)self grabNextStreamData:v6 timeRange:a3];
  id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = +[CVAMetadataWrapper decodeALS:](CVAMetadataWrapper, "decodeALS:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)grabNextRawWiFiData:(int64_t *)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextRawWiFiData_location_);
}

- (id)grabNextRawWiFiData:(id *)a3 location:(int64_t *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = +[CVAMetadataWrapper wifiTrackName:a4 prefix:self->_wifiTrackName];
  id v7 = [(MOVReaderInterface *)self grabNextStreamData:v6 timeRange:a3];
  id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = +[CVAMetadataWrapper decodeWiFi:](CVAMetadataWrapper, "decodeWiFi:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)grabNextDeviceMotionData
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextDeviceMotionData_location_);
}

- (id)grabNextDeviceMotionData:(id *)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextDeviceMotionData_location_);
}

- (id)resolvedDeviceMotionStreamName:(int64_t *)a3
{
  if (a3)
  {
    if (!*a3 && self->_deviceMotionLocationNil) {
      a3 = 0;
    }
  }
  else if (self->_deviceMotionLocation0)
  {
    a3 = (int64_t *)&unk_267C58C70;
  }
  return +[CVAMetadataWrapper deviceMotionTrackName:a3 prefix:self->_deviceMotionTrackName];
}

- (id)grabNextDeviceMotionData:(id *)a3 location:(int64_t *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = [(MOVReaderInterface *)self resolvedDeviceMotionStreamName:a4];
  id v7 = [(MOVReaderInterface *)self grabNextStreamData:v6 timeRange:a3];
  id v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = +[CVAMetadataWrapper decodeDeviceMotion:](CVAMetadataWrapper, "decodeDeviceMotion:", *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16);
        if (v14) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (id)grabNextCLLocation
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextCLLocation_location_timestamps_);
}

- (id)grabNextCLLocation:(id *)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextCLLocation_location_timestamps_);
}

- (id)resolvedLocationStreamName:(int64_t *)a3
{
  if (a3)
  {
    if (!*a3 && self->_locationLocationNil) {
      a3 = 0;
    }
  }
  else if (self->_locationLocation0)
  {
    a3 = (int64_t *)&unk_267C58C70;
  }
  return +[CVAMetadataWrapper locationTrackName:a3 prefix:self->_locationTrackName];
}

- (id)grabNextCLLocation:(id *)a3 location:(int64_t *)a4 timestamps:(id *)a5
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = [(MOVReaderInterface *)self resolvedLocationStreamName:a4];
  id v9 = [(MOVReaderInterface *)self grabNextStreamData:v8 timeRange:a3];
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  if (a5)
  {
    long long v27 = v8;
    uint64_t v11 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    double v36 = 0.0;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v26 = v9;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v12);
          }
          long long v17 = +[CVAMetadataWrapper decodeCLLocation:*(void *)(*((void *)&v32 + 1) + 8 * i) timestamp:&v36];
          if (v17)
          {
            [v10 addObject:v17];
            long long v18 = [NSNumber numberWithDouble:v36];
            [v11 addObject:v18];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v32 objects:v38 count:16];
      }
      while (v14);
    }

    id v19 = v11;
    id v9 = v26;
    *a5 = v19;
    id v8 = v27;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v19 = v9;
    uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v37 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v19);
          }
          long long v25 = +[CVAMetadataWrapper decodeCLLocation:*(void *)(*((void *)&v28 + 1) + 8 * j)];
          if (v25) {
            [v10 addObject:v25];
          }
        }
        uint64_t v22 = [v19 countByEnumeratingWithState:&v28 objects:v37 count:16];
      }
      while (v22);
    }
  }

  return v10;
}

- (id)grabNextCMDeviceMotion
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextCMDeviceMotion_);
}

- (id)grabNextCMDeviceMotion:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = [(MOVReaderInterface *)self resolvedDeviceMotionStreamName:0];
  id v6 = [(MOVReaderInterface *)self grabNextStreamData:v5 timeRange:a3];
  id v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = +[CVAMetadataWrapper decodeCMDeviceMotion:](CVAMetadataWrapper, "decodeCMDeviceMotion:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)grabNextCMData
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextCMData_);
}

- (id)grabNextCMData:(id *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v3 = [(MOVReaderInterface *)self grabNextStreamData:@"CMData" timeRange:a3];
  char v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = +[CVAMetadataWrapper decodeCMData:](CVAMetadataWrapper, "decodeCMData:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)grabNextUserEvent
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextUserEvent_);
}

- (id)grabNextUserEvent:(id *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  userEventTrackName = self->_userEventTrackName;
  if (userEventTrackName)
  {
    id v5 = [(MOVReaderInterface *)self grabNextStreamData:userEventTrackName timeRange:a3];
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = +[CVAMetadataWrapper decodeCVAUserEvent:](CVAMetadataWrapper, "decodeCVAUserEvent:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          if (v12) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)grabNextTimedValue
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextTimedValue_);
}

- (id)grabNextTimedValue:(id *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v3 = [(MOVReaderInterface *)self grabNextStreamData:@"CVATimedValue" timeRange:a3];
  char v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = +[CVAMetadataWrapper decodeCVATimedValue:](CVAMetadataWrapper, "decodeCVATimedValue:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)grabNextPRDevice
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextPRDevice_);
}

- (id)grabNextPRDevice:(id *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  prDeviceTrackName = self->_prDeviceTrackName;
  if (prDeviceTrackName)
  {
    id v5 = [(MOVReaderInterface *)self grabNextStreamData:prDeviceTrackName timeRange:a3];
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = +[CVAMetadataWrapper decodePRDevice:](CVAMetadataWrapper, "decodePRDevice:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
          if (v12) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)grabNextFeatureBuffer
{
  int v3 = +[CVAFeatureBuffer streamName:0];
  char v4 = [(MOVReaderInterface *)self grabNextFeatureBuffer:0 streamName:v3];

  return v4;
}

- (id)grabNextFeatureBuffer:(id)a3
{
  return [(MOVReaderInterface *)self grabNextFeatureBuffer:0 streamName:a3];
}

- (id)grabNextFeatureBuffer:(id *)a3 streamName:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char v4 = [(MOVReaderInterface *)self grabNextStreamData:a4 timeRange:a3];
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = +[CVAMetadataWrapper decodeCVAFeatureBuffer:](CVAMetadataWrapper, "decodeCVAFeatureBuffer:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)grabNextDepthTOF
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextDepthTOF_sampleDropped_);
}

- (id)grabNextDepthTOF:(id *)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextDepthTOF_sampleDropped_);
}

- (id)grabNextDepthTOF:(id *)a3 sampleDropped:(BOOL *)a4
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v6 = objc_opt_new();
  if (a4) {
    *a4 = 0;
  }
  lastError = self->_lastError;
  self->_lastError = 0;

  if (self->_jasperDepthPCStreamID)
  {
    if (!self->_jdfp) {
      goto LABEL_35;
    }
    uint64_t v90 = 0;
    uint64_t v91 = 0;
    uint64_t v92 = 0;
    uint64_t v89 = 0;
    uint64_t v8 = -[MOVReaderInterface copyNextFrameForStream:timestamp:error:](self, "copyNextFrameForStream:timestamp:error:");
    id v9 = 0;
    if (v9)
    {
      uint64_t v10 = v9;
      CVPixelBufferRelease(v8);
      uint64_t v11 = [NSString stringWithFormat:@"%@: %@", self->_jasperDepthPCStreamID, v10];
      long long v12 = [MEMORY[0x263F087E8] movReaderInterfaceErrorWithMessage:v11 code:10];
      long long v13 = self->_lastError;
      self->_lastError = v12;

      id v14 = v6;
      goto LABEL_57;
    }
    float32x4_t v43 = CVBufferGetAttachments(v8, kCVAttachmentMode_ShouldPropagate);
    if (!v43)
    {
LABEL_35:
      id v55 = v6;
      goto LABEL_57;
    }
    float32x4_t v44 = v43;
    CFDictionaryRef v45 = [v43 objectForKeyedSubscript:*MEMORY[0x263F535F8]];
    if (!v45)
    {
      id v70 = v6;

      goto LABEL_57;
    }
    CFDictionaryRef v46 = v45;
    float32x4_t v75 = v6;
    float32x4_t v77 = a4;
    CMTimeMakeFromDictionary(&time, v45);
    double Seconds = CMTimeGetSeconds(&time);
    float32x4_t v48 = [(CVAJasperDepthFrameProcessor *)self->_jdfp process:v8];
    uint64_t v49 = *MEMORY[0x263F2D618];
    float32x4_t v50 = [v44 objectForKeyedSubscript:*MEMORY[0x263F2D618]];
    if (v50
      || ([v44 objectForKeyedSubscript:*MEMORY[0x263F2C550]],
          float32x4_t v51 = objc_claimAutoreleasedReturnValue(),
          [v51 objectForKeyedSubscript:v49],
          float32x4_t v50 = objc_claimAutoreleasedReturnValue(),
          v51,
          v50))
    {
      uint64_t v52 = [v50 integerValue];
    }
    else
    {
      uint64_t v52 = 0;
    }
    float32x4_t v53 = [[CVADepthTOF alloc] initWithJasperDepth:v48 timestamp:v52 projectorMode:Seconds];
    CVPixelBufferRelease(v8);
    uint64_t jasperCounter = self->_jasperCounter;
    if (self->_jasperEnabled[jasperCounter])
    {
      [v6 addObject:v53];
      LODWORD(jasperCounter) = self->_jasperCounter;
    }
    else if (v77)
    {
      *float32x4_t v77 = 1;
    }
    int v71 = jasperCounter + 1;
    BOOL v39 = -v71 < 0;
    int v72 = -v71 & 0xF;
    int v73 = v71 & 0xF;
    if (!v39) {
      int v73 = -v72;
    }
    self->_uint64_t jasperCounter = v73;

    id v18 = 0;
  }
  else
  {
    float32x4_t v75 = v6;
    depthTOFTrackName = (__CFString *)self->_depthTOFTrackName;
    if (!depthTOFTrackName) {
      depthTOFTrackName = @"com.apple.reality.kind.camera.xcam.pointcloud";
    }
    float32x4_t v74 = depthTOFTrackName;
    -[MOVReaderInterface grabNextStreamData:timeRange:](self, "grabNextStreamData:timeRange:");
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [obj countByEnumeratingWithState:&v84 objects:v94 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      float32x4_t v76 = a4;
      id v18 = 0;
      uint64_t v19 = *(void *)v85;
      do
      {
        uint64_t v20 = 0;
        uint64_t v21 = v18;
        do
        {
          while (1)
          {
            if (*(void *)v85 != v19) {
              objc_enumerationMutation(obj);
            }
            uint64_t v22 = *(void **)(*((void *)&v84 + 1) + 8 * v20);
            id v83 = v21;
            uint64_t v23 = [v22 decompressedDataUsingAlgorithm:1 error:&v83];
            id v18 = v83;

            if (!v18) {
              break;
            }
            int v24 = (void *)MEMORY[0x263F087E8];
            long long v25 = [v18 description];
            long long v26 = [v24 movReaderInterfaceErrorWithMessage:v25 code:11];
            long long v27 = self->_lastError;
            self->_lastError = v26;

            ++v20;
            uint64_t v21 = v18;
            if (v17 == v20) {
              goto LABEL_11;
            }
          }
          long long v28 = +[CVAMetadataWrapper decodeCVADepthTOF:v23];
          long long v29 = v28;
          if (self->_jasperEnabled[self->_jasperCounter])
          {
            [v28 timestamp];
            if (v30 <= self->_lastDepthTOFTimestamp)
            {
              long long v32 = NSString;
              [v29 timestamp];
              long long v34 = objc_msgSend(v32, "stringWithFormat:", @"TOF timestamp is old %lf : %lf", v33, *(void *)&self->_lastDepthTOFTimestamp);
              long long v35 = [MEMORY[0x263F087E8] movReaderInterfaceErrorWithMessage:v34 code:0];
              double v36 = self->_lastError;
              self->_lastError = v35;
            }
            else
            {
              [v6 addObject:v29];
              [v29 timestamp];
              self->_lastDepthTOFTimestamp = v31;
            }
          }
          else if (v76)
          {
            BOOL *v76 = 1;
          }
          int v37 = self->_jasperCounter + 1;
          int v38 = v37 & 0xF;
          int v40 = -v37;
          BOOL v39 = v40 < 0;
          int v41 = v40 & 0xF;
          if (v39) {
            int v42 = v38;
          }
          else {
            int v42 = -v41;
          }
          self->_uint64_t jasperCounter = v42;

          ++v20;
          uint64_t v21 = 0;
        }
        while (v17 != v20);
LABEL_11:
        uint64_t v17 = [obj countByEnumeratingWithState:&v84 objects:v94 count:16];
      }
      while (v17);
    }
    else
    {
      id v18 = 0;
    }
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v56 = v75;
  uint64_t v57 = [v56 countByEnumeratingWithState:&v79 objects:v93 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v58; ++i)
      {
        if (*(void *)v80 != v59) {
          objc_enumerationMutation(v56);
        }
        uint64_t v61 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        if (![v61 projectorMode])
        {
          id v62 = [v61 pointCloud];

          if (v62)
          {
            float32x4_t v63 = [v61 pointCloud];
            uint64_t v64 = *(unsigned __int8 *)[v63 bankIds];

            if (self->_jdfp)
            {
              float32x4_t v65 = (char *)&unk_21B5CB858 + 8 * v64;
            }
            else
            {
              osVersion = self->_osVersion;
              if (osVersion)
              {
                uint64_t v67 = [(NSString *)osVersion compare:@"18A253"];
                float32x4_t v65 = (char *)&unk_21B5CB878 + 8 * v64;
                if (v67 == -1) {
                  float32x4_t v65 = (char *)&unk_21B5CB858 + 8 * v64;
                }
              }
              else
              {
                float32x4_t v65 = (char *)&unk_21B5CB878 + 8 * v64;
                if (self->_machTimeSince1970 < 1584430000.0) {
                  float32x4_t v65 = (char *)&unk_21B5CB858 + 8 * v64;
                }
              }
            }
            [v61 setProjectorMode:*(void *)v65];
          }
        }
      }
      uint64_t v58 = [v56 countByEnumeratingWithState:&v79 objects:v93 count:16];
    }
    while (v58);
  }

  id v68 = v56;
  id v6 = v75;
LABEL_57:

  return v6;
}

- (id)grabNextDepthIR
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextDepthIR_);
}

- (id)grabNextDepthIR:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextDepthIR_timeRange_);
}

- (id)grabNextDepthIR:(id)a3 timeRange:(id *)a4
{
  id v5 = a3;
  id v6 = objc_opt_new();
  lastError = self->_lastError;
  self->_lastError = 0;

  memset(v24, 0, sizeof(v24));
  id v23 = 0;
  uint64_t v8 = [(MOVReaderInterface *)self copyNextFrameForStream:v5 timestamp:v24 error:&v23];
  id v9 = v23;
  if (v9)
  {
    CVPixelBufferRelease(v8);
    uint64_t v10 = [NSString stringWithFormat:@"%@: %@", v5, v9];
    uint64_t v11 = [MEMORY[0x263F087E8] movReaderInterfaceErrorWithMessage:v10 code:10];
    long long v12 = self->_lastError;
    self->_lastError = v11;

    id v13 = v6;
  }
  else
  {
    id v14 = CVBufferGetAttachments(v8, kCVAttachmentMode_ShouldPropagate);
    uint64_t v10 = v14;
    if (v14)
    {
      CFDictionaryRef v15 = [v14 objectForKeyedSubscript:*MEMORY[0x263F535F8]];
      CFDictionaryRef v16 = v15;
      if (v15)
      {
        CMTimeMakeFromDictionary(&time, v15);
        uint64_t v17 = [[CVADepthIR alloc] initWithPixelBufferRef:v8 timestamp:CMTimeGetSeconds(&time)];
        CVPixelBufferRelease(v8);
        [v6 addObject:v17];
        id v18 = v6;
      }
      else
      {
        CVPixelBufferRelease(v8);
        id v20 = v6;
      }
    }
    else
    {
      CVPixelBufferRelease(v8);
      id v19 = v6;
    }
  }

  return v6;
}

- (id)grabNextCVACameraCalibrationData
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextCVACameraCalibrationData_);
}

- (id)grabNextCVACameraCalibrationData:(id *)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int v3 = [(MOVReaderInterface *)self grabNextStreamData:@"CVACameraCalibration" timeRange:a3];
  char v4 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = +[CVAMetadataWrapper decodeCVACameraCalibrationData:](CVAMetadataWrapper, "decodeCVACameraCalibrationData:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)grabNextDictionary:(id)a3
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextDictionary_timeRange_);
}

- (id)grabNextDictionary:(id)a3 timeRange:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  char v4 = [(MOVReaderInterface *)self grabNextStreamData:a3 timeRange:a4];
  id v5 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v25;
    unint64_t v10 = 0x2643AB000uLL;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v12 = [*(id *)(v10 + 3344) decodeDictionary:*(void *)(*((void *)&v24 + 1) + 8 * i)];
        if (v12)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v5 addObject:v12];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v13 = v6;
              long long v22 = 0u;
              long long v23 = 0u;
              long long v20 = 0u;
              long long v21 = 0u;
              id v14 = v12;
              uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
              if (v15)
              {
                uint64_t v16 = v15;
                uint64_t v17 = *(void *)v21;
                do
                {
                  for (uint64_t j = 0; j != v16; ++j)
                  {
                    if (*(void *)v21 != v17) {
                      objc_enumerationMutation(v14);
                    }
                    [v5 addObject:*(void *)(*((void *)&v20 + 1) + 8 * j)];
                  }
                  uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
                }
                while (v16);
              }

              id v6 = v13;
              unint64_t v10 = 0x2643AB000;
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)grabNextClass:(id)a3 class:(Class)a4
{
  return (id)MEMORY[0x270F9A6D0](self, sel_grabNextClass_class_timeRange_);
}

- (id)grabNextClass:(id)a3 class:(Class)a4 timeRange:(id *)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = [(MOVReaderInterface *)self grabNextStreamData:a3 timeRange:a5];
  uint64_t v7 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = +[CVAMetadataWrapper decodeClass:class:](CVAMetadataWrapper, "decodeClass:class:", *(void *)(*((void *)&v15 + 1) + 8 * i), a4, (void)v15);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)grabNextNSCoderObject:(id)a3 class:(Class)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = (void *)MEMORY[0x263EFFA08];
  Class v12 = a4;
  id v6 = (void *)MEMORY[0x263EFF8C0];
  id v7 = a3;
  id v8 = [v6 arrayWithObjects:&v12 count:1];
  uint64_t v9 = objc_msgSend(v5, "setWithArray:", v8, v12, v13);
  uint64_t v10 = [(MOVReaderInterface *)self grabNextNSCoderObject:v7 classes:v9 timeRange:0];

  return v10;
}

- (id)grabNextNSCoderObject:(id)a3 class:(Class)a4 timeRange:(id *)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = (void *)MEMORY[0x263EFFA08];
  Class v14 = a4;
  id v8 = (void *)MEMORY[0x263EFF8C0];
  id v9 = a3;
  uint64_t v10 = [v8 arrayWithObjects:&v14 count:1];
  uint64_t v11 = objc_msgSend(v7, "setWithArray:", v10, v14, v15);
  Class v12 = [(MOVReaderInterface *)self grabNextNSCoderObject:v9 classes:v11 timeRange:a5];

  return v12;
}

- (id)grabNextNSCoderObject:(id)a3 classes:(id)a4
{
  return [(MOVReaderInterface *)self grabNextNSCoderObject:a3 classes:a4 timeRange:0];
}

- (id)grabNextNSCoderObject:(id)a3 classes:(id)a4 timeRange:(id *)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = [(MOVReaderInterface *)self grabNextStreamData:a3 timeRange:a5];
  uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = +[CVAMetadataWrapper decodeNSCoderObject:classes:](CVAMetadataWrapper, "decodeNSCoderObject:classes:", *(void *)(*((void *)&v18 + 1) + 8 * i), v8, (void)v18);
        if (v16) {
          [v10 addObject:v16];
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v13);
  }

  return v10;
}

- (id)mapProductToDevice:(id)a3
{
  return (id)[&unk_26CB67B68 objectForKeyedSubscript:a3];
}

+ (BOOL)isSuperWideStream:(id)a3
{
  uint64_t v3 = *MEMORY[0x263EF9660];
  char v4 = [a3 componentsSeparatedByString:@"."];
  id v5 = [v4 objectAtIndexedSubscript:0];

  if (([v5 isEqualToString:v3] & 1) != 0
    || ([v5 isEqualToString:@"AVCaptureDeviceTypeBuiltInSuperWideAngleCamera"] & 1) != 0
    || ([v5 isEqualToString:@"BackColorSuperWide"] & 1) != 0)
  {

    return 1;
  }
  else
  {
    char v7 = [v5 isEqualToString:*MEMORY[0x263F2C260]];

    return v7;
  }
}

- (unsigned)reader:(id)a3 pixelFormatForStream:(id)a4 suggestedFormat:(unsigned int)a5
{
  enforcedVideoTrackFormat = self->_enforcedVideoTrackFormat;
  if (enforcedVideoTrackFormat)
  {
    char v7 = [(NSDictionary *)enforcedVideoTrackFormat objectForKeyedSubscript:a4];
    id v8 = v7;
    if (v7) {
      a5 = [v7 unsignedIntValue];
    }
  }
  return a5;
}

+ (id)grabCMSessionID:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v3 = a3;
  char v4 = (void *)MEMORY[0x21D490BF0]();
  id v26 = 0;
  id v5 = [[MOVReaderInterface alloc] initWithFileURL:v3 delegate:0 error:&v26];
  id v6 = v26;
  char v7 = v6;
  if (v6)
  {
    id v8 = (void *)MEMORY[0x263F087E8];
    id v9 = [v6 description];
    id v10 = (id)[v8 movReaderInterfaceErrorWithMessage:v9 code:12];
    id v11 = 0;
LABEL_3:

    goto LABEL_4;
  }
  uint64_t v13 = [(MOVReaderInterface *)v5 grabNextUserEvent];
  if (v13)
  {
    id v9 = (void *)v13;
    id v11 = 0;
    do
    {
      if (![v9 count]) {
        break;
      }
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v16 = v9;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v23 != v19) {
              objc_enumerationMutation(v16);
            }
            long long v21 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if ([v21 eventType] == 7)
            {
              uint64_t v14 = [v21 sessionID];
              uint64_t v15 = [v14 copy];

              id v11 = (void *)v15;
              goto LABEL_10;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v18);
      }
LABEL_10:

      id v9 = [(MOVReaderInterface *)v5 grabNextUserEvent];
    }
    while (v9);
    goto LABEL_3;
  }
  id v11 = 0;
LABEL_4:

  return v11;
}

- (NSDictionary)enforcedVideoTrackFormat
{
  return self->_enforcedVideoTrackFormat;
}

- (void)setEnforcedVideoTrackFormat:(id)a3
{
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

- (NSString)userEventTrackName
{
  return self->_userEventTrackName;
}

- (void)setUserEventTrackName:(id)a3
{
}

- (NSString)ryfTimedValueTrackName
{
  return self->_ryfTimedValueTrackName;
}

- (void)setRyfTimedValueTrackName:(id)a3
{
}

- (NSString)prDeviceTrackName
{
  return self->_prDeviceTrackName;
}

- (void)setPrDeviceTrackName:(id)a3
{
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
}

- (NSNumber)depthOutputFrameRate
{
  return self->_depthOutputFrameRate;
}

- (NSMutableDictionary)streamFilters
{
  return self->_streamFilters;
}

- (void)setStreamFilters:(id)a3
{
}

- (CIContext)filterContext
{
  return self->_filterContext;
}

- (void)setFilterContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterContext, 0);
  objc_storeStrong((id *)&self->_streamFilters, 0);
  objc_storeStrong((id *)&self->_depthOutputFrameRate, 0);
  objc_storeStrong((id *)&self->_lastError, 0);
  objc_storeStrong((id *)&self->_prDeviceTrackName, 0);
  objc_storeStrong((id *)&self->_ryfTimedValueTrackName, 0);
  objc_storeStrong((id *)&self->_userEventTrackName, 0);
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
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_productConfig, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_deviceString, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_enforcedVideoTrackFormat, 0);
  objc_storeStrong((id *)&self->_spuVersions, 0);
  objc_storeStrong((id *)&self->_jasperDepthPCStreamID, 0);
  objc_storeStrong((id *)&self->_jdfp, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
}

@end