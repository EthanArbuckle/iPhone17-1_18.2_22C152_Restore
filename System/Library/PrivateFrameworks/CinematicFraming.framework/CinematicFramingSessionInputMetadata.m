@interface CinematicFramingSessionInputMetadata
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp;
- (BOOL)frontCameraHas180DegreesRotation;
- (BOOL)hasDeviceToCameraSpaceTransform;
- (BOOL)hasGravity;
- (CinematicFramingSessionInputMetadata)initWithCoder:(id)a3;
- (CinematicFramingSessionInputMetadata)initWithDetectedObjectsInfo:(id)a3 calibrationData:(id)a4 timestamp:(id *)a5 aspectRatio:(float)a6;
- (CinematicFramingSessionInputMetadata)initWithDetectedObjectsInfo:(id)a3 calibrationData:(id)a4 timestamp:(id *)a5 aspectRatio:(float)a6 sensorID:(int)a7;
- (CinematicFramingSessionInputMetadata)initWithDetectedObjectsInfo:(id)a3 calibrationData:(id)a4 timestamp:(id *)a5 aspectRatio:(float)a6 sensorID:(int)a7 filteredFaceIDs:(id)a8 filteredBodyIDs:(id)a9;
- (CinematicFramingSessionInputMetadata)initWithDetectedObjectsInfo:(id)a3 calibrationData:(id)a4 timestamp:(id *)a5 aspectRatio:(float)a6 sensorID:(int)a7 filteredFaceIDs:(id)a8 filteredBodyIDs:(id)a9 calibrationDistortionCoefficientsSupported:(BOOL)a10 calibrationValidMaxRadiusSupported:(BOOL)a11;
- (NSArray)bodyDetections;
- (NSArray)faceDetections;
- (NSDictionary)calibrationDataDictionary;
- (NSDictionary)detectedObjectsInfo;
- (NSString)portType;
- (__n128)deviceToCameraSpaceTransform;
- (__n128)setDeviceToCameraSpaceTransform:(__n128)a3;
- (float)additionalCameraRotation;
- (float)additionalInputCameraRotation;
- (float)additionalOutputCameraRotation;
- (float)aspectRatio;
- (float)gravityX;
- (float)gravityY;
- (float)gravityZ;
- (id)_validateCalibrationDictionary:(id)a3;
- (int)cameraOrientation;
- (int)sensorID;
- (void)_parseDetectedObjectsInfoWithFilteredFaceIDs:(id)a3 filteredBodyIDs:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalCameraRotation:(float)a3;
- (void)setAdditionalInputCameraRotation:(float)a3;
- (void)setAdditionalOutputCameraRotation:(float)a3;
- (void)setCameraOrientation:(int)a3;
- (void)setFrontCameraHas180DegreesRotation:(BOOL)a3;
- (void)setGravityX:(float)a3 y:(float)a4 z:(float)a5;
- (void)setPortType:(id)a3;
@end

@implementation CinematicFramingSessionInputMetadata

- (CinematicFramingSessionInputMetadata)initWithDetectedObjectsInfo:(id)a3 calibrationData:(id)a4 timestamp:(id *)a5 aspectRatio:(float)a6 sensorID:(int)a7 filteredFaceIDs:(id)a8 filteredBodyIDs:(id)a9 calibrationDistortionCoefficientsSupported:(BOOL)a10 calibrationValidMaxRadiusSupported:(BOOL)a11
{
  id v19 = a3;
  id v20 = a4;
  id v21 = a8;
  id v22 = a9;
  v23 = [(CinematicFramingSessionInputMetadata *)self init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_detectedObjectsInfo, a3);
    [(CinematicFramingSessionInputMetadata *)v24 _parseDetectedObjectsInfoWithFilteredFaceIDs:v21 filteredBodyIDs:v22];
    v24->_calibrationDistortionCoefficientsSupported = a10;
    v24->_calibrationValidMaxRadiusSupported = a11;
    if (v20)
    {
      uint64_t v25 = [(CinematicFramingSessionInputMetadata *)v24 _validateCalibrationDictionary:v20];
      calibrationDictionary = v24->_calibrationDictionary;
      v24->_calibrationDictionary = (NSDictionary *)v25;
    }
    if (!v24->_calibrationDictionary)
    {
      if (a7 == 1906)
      {
        uint64_t v27 = defaultCalibrationDictionaryForPictou();
      }
      else
      {
        if (a7 != 1556)
        {
          v31 = 0;
          goto LABEL_12;
        }
        uint64_t v27 = defaultCalibrationDictionaryForPennsylvania();
      }
      v28 = v24->_calibrationDictionary;
      v24->_calibrationDictionary = (NSDictionary *)v27;
    }
    long long v29 = *(_OWORD *)&a5->var0;
    v24->_timestamp.epoch = a5->var3;
    *(_OWORD *)&v24->_timestamp.value = v29;
    v24->_aspectRatio = a6;
    v24->_sensorID = a7;
    v24->_additionalCameraRotation = 0.0;
    v24->_cameraOrientation = -1;
    portType = v24->_portType;
    v24->_portType = 0;

    *(_WORD *)&v24->_hasDeviceToCameraSpaceTransform = 256;
  }
  v31 = v24;
LABEL_12:

  return v31;
}

- (CinematicFramingSessionInputMetadata)initWithDetectedObjectsInfo:(id)a3 calibrationData:(id)a4 timestamp:(id *)a5 aspectRatio:(float)a6 sensorID:(int)a7 filteredFaceIDs:(id)a8 filteredBodyIDs:(id)a9
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a5;
  LOWORD(v10) = 257;
  return -[CinematicFramingSessionInputMetadata initWithDetectedObjectsInfo:calibrationData:timestamp:aspectRatio:sensorID:filteredFaceIDs:filteredBodyIDs:calibrationDistortionCoefficientsSupported:calibrationValidMaxRadiusSupported:](self, "initWithDetectedObjectsInfo:calibrationData:timestamp:aspectRatio:sensorID:filteredFaceIDs:filteredBodyIDs:calibrationDistortionCoefficientsSupported:calibrationValidMaxRadiusSupported:", a3, a4, &v11, *(void *)&a7, a8, a9, v10);
}

- (CinematicFramingSessionInputMetadata)initWithDetectedObjectsInfo:(id)a3 calibrationData:(id)a4 timestamp:(id *)a5 aspectRatio:(float)a6 sensorID:(int)a7
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a5;
  LOWORD(v8) = 257;
  return -[CinematicFramingSessionInputMetadata initWithDetectedObjectsInfo:calibrationData:timestamp:aspectRatio:sensorID:filteredFaceIDs:filteredBodyIDs:calibrationDistortionCoefficientsSupported:calibrationValidMaxRadiusSupported:](self, "initWithDetectedObjectsInfo:calibrationData:timestamp:aspectRatio:sensorID:filteredFaceIDs:filteredBodyIDs:calibrationDistortionCoefficientsSupported:calibrationValidMaxRadiusSupported:", a3, a4, &v9, *(void *)&a7, 0, 0, v8);
}

- (CinematicFramingSessionInputMetadata)initWithDetectedObjectsInfo:(id)a3 calibrationData:(id)a4 timestamp:(id *)a5 aspectRatio:(float)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a5;
  return -[CinematicFramingSessionInputMetadata initWithDetectedObjectsInfo:calibrationData:timestamp:aspectRatio:sensorID:](self, "initWithDetectedObjectsInfo:calibrationData:timestamp:aspectRatio:sensorID:", a3, a4, &v7, 0);
}

- (CinematicFramingSessionInputMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CinematicFramingSessionInputMetadata *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"bodyDetections"];
    bodyDetections = v5->_bodyDetections;
    v5->_bodyDetections = (NSArray *)v9;

    if (!v5->_bodyDetections)
    {
      uint64_t v11 = [v4 decodeObjectOfClasses:v8 forKey:@"detections"];
      v12 = v5->_bodyDetections;
      v5->_bodyDetections = (NSArray *)v11;
    }
    uint64_t v13 = [v4 decodeObjectOfClasses:v8 forKey:@"faceDetections"];
    faceDetections = v5->_faceDetections;
    v5->_faceDetections = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    CFDictionaryRef v19 = [v4 decodeObjectOfClasses:v18 forKey:@"timestamp"];

    CMTimeMakeFromDictionary(&v29, v19);
    v5->_timestamp = ($95D729B680665BEAEFA1D6FCA8238556)v29;
    [v4 decodeFloatForKey:@"aspectRatio"];
    v5->_aspectRatio = v20;
    id v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"calibrationDataDictionary"];
    calibrationDictionary = v5->_calibrationDictionary;
    v5->_calibrationDictionary = (NSDictionary *)v25;

    v5->_sensorID = [v4 decodeInt32ForKey:@"sensorID"];
    [v4 decodeFloatForKey:@"additionalCameraRotation"];
    v5->_additionalCameraRotation = v27;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_bodyDetections forKey:@"bodyDetections"];
  [v4 encodeObject:self->_faceDetections forKey:@"faceDetections"];
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  $95D729B680665BEAEFA1D6FCA8238556 timestamp = self->_timestamp;
  CFDictionaryRef v6 = CMTimeCopyAsDictionary((CMTime *)&timestamp, v5);
  [v4 encodeObject:v6 forKey:@"timestamp"];
  if (v6) {
    CFRelease(v6);
  }
  *(float *)&double v7 = self->_aspectRatio;
  [v4 encodeFloat:@"aspectRatio" forKey:v7];
  [v4 encodeObject:self->_calibrationDictionary forKey:@"calibrationDataDictionary"];
  [v4 encodeInt32:self->_sensorID forKey:@"sensorID"];
  *(float *)&double v8 = self->_additionalCameraRotation;
  [v4 encodeFloat:@"additionalCameraRotation" forKey:v8];
}

- (void)setGravityX:(float)a3 y:(float)a4 z:(float)a5
{
  self->_hasGravity = 1;
  self->_gravityX = a3;
  self->_gravityY = a4;
  self->_gravityZ = a5;
}

- (__n128)setDeviceToCameraSpaceTransform:(__n128)a3
{
  result[10].n128_u8[0] = 1;
  result[7] = a2;
  result[8] = a3;
  result[9] = a4;
  return result;
}

- (void)setAdditionalCameraRotation:(float)a3
{
  self->_additionalCameraRotation = a3;
}

- (void)_parseDetectedObjectsInfoWithFilteredFaceIDs:(id)a3 filteredBodyIDs:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v35 = a4;
  v33 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v36 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  float v27 = self;
  obj = self->_detectedObjectsInfo;
  if (obj)
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    uint64_t v30 = [(NSDictionary *)obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v30)
    {
      uint64_t v29 = *(void *)v47;
      uint64_t v28 = *MEMORY[0x1E4F538F8];
      uint64_t v7 = *MEMORY[0x1E4F54180];
      uint64_t v8 = *MEMORY[0x1E4F538C8];
      uint64_t v38 = *MEMORY[0x1E4F538C0];
      uint64_t v34 = *MEMORY[0x1E4F53888];
      uint64_t v37 = *MEMORY[0x1E4F558D0];
      id v39 = v6;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v47 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = v9;
          uint64_t v10 = *(void **)(*((void *)&v46 + 1) + 8 * v9);
          uint64_t v11 = -[NSDictionary objectForKeyedSubscript:](obj, "objectForKeyedSubscript:", v10, v27);
          v12 = [v11 objectForKeyedSubscript:v28];

          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v40 = v12;
          uint64_t v13 = [v40 countByEnumeratingWithState:&v42 objects:v50 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v43;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v43 != v15) {
                  objc_enumerationMutation(v40);
                }
                uint64_t v17 = *(void **)(*((void *)&v42 + 1) + 8 * i);
                v18 = objc_alloc_init(Detection);
                memset(&rect, 0, sizeof(rect));
                CFDictionaryRef v19 = [v17 objectForKeyedSubscript:v7];
                CGRectMakeWithDictionaryRepresentation(v19, &rect);
                if ([v10 isEqualToString:v8])
                {
                  float v20 = [v17 objectForKeyedSubscript:v37];
                  if (v6 && ![v6 containsObject:v20]) {
                    goto LABEL_21;
                  }
                  int v21 = 2 * [v20 intValue];
                  uint64_t v22 = v36;
                  goto LABEL_20;
                }
                if (![v10 isEqualToString:v38]) {
                  goto LABEL_22;
                }
                float v20 = [v17 objectForKeyedSubscript:v34];
                if (!v35 || [v35 containsObject:v20])
                {
                  int v21 = (2 * [v20 intValue]) | 1;
                  uint64_t v22 = v33;
LABEL_20:
                  [(Detection *)v18 setOid:v21];
                  -[Detection setBounds:](v18, "setBounds:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
                  [(NSArray *)v22 addObject:v18];
                  id v6 = v39;
                }
LABEL_21:

LABEL_22:
              }
              uint64_t v14 = [v40 countByEnumeratingWithState:&v42 objects:v50 count:16];
            }
            while (v14);
          }

          uint64_t v9 = v32 + 1;
        }
        while (v32 + 1 != v30);
        uint64_t v30 = [(NSDictionary *)obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v30);
    }
  }
  bodyDetections = v27->_bodyDetections;
  v27->_bodyDetections = v33;
  v24 = v33;

  faceDetections = v27->_faceDetections;
  v27->_faceDetections = v36;
  v26 = v36;
}

- (id)_validateCalibrationDictionary:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (!v5)
  {
    uint64_t v7 = 0;
    goto LABEL_24;
  }
  uint64_t v7 = [v5 objectForKeyedSubscript:@"PixelSize"];
  if (!v7)
  {
LABEL_24:
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
LABEL_25:
    id v14 = 0;
    goto LABEL_20;
  }
  uint64_t v8 = [v6 objectForKeyedSubscript:@"LensDistortionCenter"];
  if (!v8)
  {
    fig_log_get_emitter();
    uint64_t v17 = v3;
    LODWORD(v16) = 0;
    FigDebugAssert3();
  }
  if (self->_calibrationDistortionCoefficientsSupported)
  {
    uint64_t v9 = [v6 objectForKeyedSubscript:@"LensDistortionCoefficients"];
    if (!v9)
    {
      fig_log_get_emitter();
      uint64_t v17 = v3;
      LODWORD(v16) = 0;
      FigDebugAssert3();
    }
    uint64_t v10 = objc_msgSend(v6, "objectForKeyedSubscript:", @"InverseLensDistortionCoefficients", v16, v17);
    if (!v10)
    {
      fig_log_get_emitter();
      uint64_t v17 = v3;
      LODWORD(v16) = 0;
      FigDebugAssert3();
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  uint64_t v11 = objc_msgSend(v6, "objectForKeyedSubscript:", @"IntrinsicMatrix", v16, v17);
  if (!v11)
  {
    uint64_t v11 = [v6 objectForKeyedSubscript:@"OriginalCameraIntrinsicMatrix"];
    if (!v11) {
      goto LABEL_25;
    }
  }
  v12 = [v6 objectForKeyedSubscript:@"IntrinsicMatrixReferenceDimensions"];
  if (!v12)
  {
    v12 = [v6 objectForKeyedSubscript:@"OriginalCameraIntrinsicMatrixReferenceDimensions"];
    if (!v12) {
      goto LABEL_25;
    }
  }
  if (self->_calibrationValidMaxRadiusSupported)
  {
    uint64_t v13 = [v6 objectForKeyedSubscript:@"DistortionCalibrationValidMaxRadiusInPixels"];
    if (!v13)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v14 setObject:v7 forKeyedSubscript:@"PixelSize"];
  [v14 setObject:v11 forKeyedSubscript:@"IntrinsicMatrix"];
  [v14 setObject:v12 forKeyedSubscript:@"IntrinsicMatrixReferenceDimensions"];
  [v14 setObject:v8 forKeyedSubscript:@"LensDistortionCenter"];
  [v14 setObject:v9 forKeyedSubscript:@"LensDistortionCoefficients"];
  [v14 setObject:v10 forKeyedSubscript:@"InverseLensDistortionCoefficients"];
  [v14 setObject:v13 forKeyedSubscript:@"DistortionCalibrationValidMaxRadiusInPixels"];

LABEL_20:

  return v14;
}

- (NSDictionary)detectedObjectsInfo
{
  return self->_detectedObjectsInfo;
}

- (NSArray)bodyDetections
{
  return self->_bodyDetections;
}

- (NSArray)faceDetections
{
  return self->_faceDetections;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 32);
  return self;
}

- (float)aspectRatio
{
  return self->_aspectRatio;
}

- (NSDictionary)calibrationDataDictionary
{
  return self->_calibrationDictionary;
}

- (int)sensorID
{
  return self->_sensorID;
}

- (BOOL)hasGravity
{
  return self->_hasGravity;
}

- (float)gravityX
{
  return self->_gravityX;
}

- (float)gravityY
{
  return self->_gravityY;
}

- (float)gravityZ
{
  return self->_gravityZ;
}

- (float)additionalCameraRotation
{
  return self->_additionalCameraRotation;
}

- (__n128)deviceToCameraSpaceTransform
{
  return a1[7];
}

- (BOOL)hasDeviceToCameraSpaceTransform
{
  return self->_hasDeviceToCameraSpaceTransform;
}

- (BOOL)frontCameraHas180DegreesRotation
{
  return self->_frontCameraHas180DegreesRotation;
}

- (void)setFrontCameraHas180DegreesRotation:(BOOL)a3
{
  self->_frontCameraHas180DegreesRotation = a3;
}

- (int)cameraOrientation
{
  return self->_cameraOrientation;
}

- (void)setCameraOrientation:(int)a3
{
  self->_cameraOrientation = a3;
}

- (NSString)portType
{
  return self->_portType;
}

- (void)setPortType:(id)a3
{
}

- (float)additionalInputCameraRotation
{
  return self->_additionalInputCameraRotation;
}

- (void)setAdditionalInputCameraRotation:(float)a3
{
  self->_additionalInputCameraRotation = a3;
}

- (float)additionalOutputCameraRotation
{
  return self->_additionalOutputCameraRotation;
}

- (void)setAdditionalOutputCameraRotation:(float)a3
{
  self->_additionalOutputCameraRotation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_portType, 0);
  objc_storeStrong((id *)&self->_calibrationDictionary, 0);
  objc_storeStrong((id *)&self->_faceDetections, 0);
  objc_storeStrong((id *)&self->_bodyDetections, 0);

  objc_storeStrong((id *)&self->_detectedObjectsInfo, 0);
}

@end