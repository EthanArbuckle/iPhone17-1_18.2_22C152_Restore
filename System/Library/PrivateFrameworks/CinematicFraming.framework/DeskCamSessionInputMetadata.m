@interface DeskCamSessionInputMetadata
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp;
- (DeskCamSessionInputMetadata)initWithCoder:(id)a3;
- (DeskCamSessionInputMetadata)initWithDetectedObjectsInfo:(id)a3 cameraCalibrationData:(id)a4 cameraOrientation:(int)a5 timestamp:(id *)a6 aspectRatio:(float)a7 sensorID:(int)a8 gravity:;
- (NSArray)bodyDetections;
- (NSArray)faceDetections;
- (NSDictionary)cameraCalibrationDictionary;
- (__n128)gravity;
- (float)aspectRatio;
- (id)_createCameraCalibrationDictionary:(id)a3;
- (int)cameraOrientation;
- (int)sensorID;
- (void)_parseDetectedObjectsInfo:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DeskCamSessionInputMetadata

- (DeskCamSessionInputMetadata)initWithDetectedObjectsInfo:(id)a3 cameraCalibrationData:(id)a4 cameraOrientation:(int)a5 timestamp:(id *)a6 aspectRatio:(float)a7 sensorID:(int)a8 gravity:
{
  long long v25 = v8;
  id v15 = a3;
  id v16 = a4;
  v17 = [(DeskCamSessionInputMetadata *)self init];
  v18 = v17;
  if (v17)
  {
    [(DeskCamSessionInputMetadata *)v17 _parseDetectedObjectsInfo:v15];
    if (v16
      && ([(DeskCamSessionInputMetadata *)v18 _createCameraCalibrationDictionary:v16], (v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      cameraCalibrationDictionary = v18->_cameraCalibrationDictionary;
      v18->_cameraCalibrationDictionary = v19;
      v21 = v19;
    }
    else
    {
      if (a8 == 1906) {
        defaultCalibrationDictionaryForPictou();
      }
      else {
      uint64_t v22 = defaultCalibrationDictionaryForPennsylvania();
      }
      v21 = v18->_cameraCalibrationDictionary;
      v18->_cameraCalibrationDictionary = (NSDictionary *)v22;
    }

    v18->_cameraOrientation = a5;
    long long v23 = *(_OWORD *)&a6->var0;
    *(void *)&v18->_timestamp.flags = a6->var3;
    *(_OWORD *)(&v18->_cameraOrientation + 1) = v23;
    *((float *)&v18->_timestamp.epoch + 1) = a7;
    LODWORD(v18->_aspectRatio) = a8;
    *(_OWORD *)&v18->_anon_44[8] = v25;
  }

  return v18;
}

- (DeskCamSessionInputMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DeskCamSessionInputMetadata *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    long long v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
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

    id v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v15, "setWithObjects:", v16, v17, objc_opt_class(), 0);
    CFDictionaryRef v19 = [v4 decodeObjectOfClasses:v18 forKey:@"timestamp"];

    CMTimeMakeFromDictionary(&v34, v19);
    *(CMTime *)(&v5->_cameraOrientation + 1) = v34;
    [v4 decodeFloatForKey:@"aspectRatio"];
    HIDWORD(v5->_timestamp.epoch) = v20;
    v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v21, "setWithObjects:", v22, v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"cameraCalibrationDictionary"];
    cameraCalibrationDictionary = v5->_cameraCalibrationDictionary;
    v5->_cameraCalibrationDictionary = (NSDictionary *)v25;

    v5->_cameraOrientation = [v4 decodeInt32ForKey:@"cameraOrientation"];
    LODWORD(v5->_aspectRatio) = [v4 decodeInt32ForKey:@"sensorID"];
    [v4 decodeFloatForKey:@"gravityX"];
    *(void *)&long long v33 = v27;
    [v4 decodeFloatForKey:@"gravityY"];
    int v32 = v28;
    [v4 decodeFloatForKey:@"gravityZ"];
    long long v29 = v33;
    DWORD1(v29) = v32;
    DWORD2(v29) = v30;
    *(_OWORD *)&v5->_anon_44[8] = v29;
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
  *(_OWORD *)&v11.value = *(_OWORD *)(&self->_cameraOrientation + 1);
  v11.epoch = *(void *)&self->_timestamp.flags;
  CFDictionaryRef v6 = CMTimeCopyAsDictionary(&v11, v5);
  [v4 encodeObject:v6 forKey:@"timestamp"];
  if (v6) {
    CFRelease(v6);
  }
  LODWORD(v7) = HIDWORD(self->_timestamp.epoch);
  [v4 encodeFloat:@"aspectRatio" forKey:v7];
  [v4 encodeObject:self->_cameraCalibrationDictionary forKey:@"cameraCalibrationDictionary"];
  [v4 encodeInt32:self->_cameraOrientation forKey:@"cameraOrientation"];
  [v4 encodeInt32:LODWORD(self->_aspectRatio) forKey:@"sensorID"];
  LODWORD(v8) = *(_DWORD *)&self->_anon_44[8];
  [v4 encodeFloat:@"gravityX" forKey:v8];
  LODWORD(v9) = *(_DWORD *)self->_gravity;
  [v4 encodeFloat:@"gravityY" forKey:v9];
  LODWORD(v10) = *(_DWORD *)&self->_gravity[4];
  [v4 encodeFloat:@"gravityZ" forKey:v10];
}

- (void)_parseDetectedObjectsInfo:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v38 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    uint64_t v27 = self;
    id v28 = v4;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id obj = v4;
    uint64_t v31 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
    if (!v31) {
      goto LABEL_21;
    }
    uint64_t v30 = *(void *)v46;
    uint64_t v29 = *MEMORY[0x1E4F538F8];
    uint64_t v5 = *MEMORY[0x1E4F54180];
    uint64_t v6 = *MEMORY[0x1E4F538C8];
    uint64_t v37 = *MEMORY[0x1E4F538C0];
    uint64_t v34 = *MEMORY[0x1E4F53888];
    uint64_t v36 = *MEMORY[0x1E4F558D0];
    while (1)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v46 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v7;
        double v8 = *(void **)(*((void *)&v45 + 1) + 8 * v7);
        double v9 = [obj objectForKeyedSubscript:v8];
        double v10 = [v9 objectForKeyedSubscript:v29];

        long long v43 = 0u;
        long long v44 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v39 = v10;
        uint64_t v11 = [v39 countByEnumeratingWithState:&v41 objects:v49 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v42 != v13) {
                objc_enumerationMutation(v39);
              }
              id v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              uint64_t v16 = objc_alloc_init(Detection);
              memset(&rect, 0, sizeof(rect));
              CFDictionaryRef v17 = [v15 objectForKeyedSubscript:v5];
              CGRectMakeWithDictionaryRepresentation(v17, &rect);
              if ([v8 isEqualToString:v6])
              {
                v18 = [v15 objectForKeyedSubscript:v36];
                int v19 = [v18 intValue];

                int v20 = 2 * v19;
                v21 = v38;
              }
              else
              {
                if (![v8 isEqualToString:v37]) {
                  goto LABEL_17;
                }
                uint64_t v22 = [v15 objectForKeyedSubscript:v34];
                int v23 = [v22 intValue];

                int v20 = (2 * v23) | 1;
                v21 = v35;
              }
              [(Detection *)v16 setOid:v20];
              -[Detection setBounds:](v16, "setBounds:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
              [(NSArray *)v21 addObject:v16];
LABEL_17:
            }
            uint64_t v12 = [v39 countByEnumeratingWithState:&v41 objects:v49 count:16];
          }
          while (v12);
        }

        uint64_t v7 = v33 + 1;
      }
      while (v33 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (!v31)
      {
LABEL_21:

        self = v27;
        id v4 = v28;
        break;
      }
    }
  }
  bodyDetections = self->_bodyDetections;
  self->_bodyDetections = v35;
  uint64_t v25 = v35;

  faceDetections = self->_faceDetections;
  self->_faceDetections = v38;
}

- (id)_createCameraCalibrationDictionary:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    uint64_t v5 = 0;
    goto LABEL_16;
  }
  uint64_t v5 = [v3 objectForKeyedSubscript:@"PixelSize"];
  if (!v5)
  {
LABEL_16:
    uint64_t v6 = 0;
    goto LABEL_17;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"LensDistortionCenter"];
  if (!v6)
  {
LABEL_17:
    uint64_t v7 = 0;
    goto LABEL_18;
  }
  uint64_t v7 = [v4 objectForKeyedSubscript:@"LensDistortionCoefficients"];
  if (!v7)
  {
LABEL_18:
    double v8 = 0;
    goto LABEL_19;
  }
  double v8 = [v4 objectForKeyedSubscript:@"InverseLensDistortionCoefficients"];
  if (!v8)
  {
LABEL_19:
    double v9 = 0;
LABEL_20:
    double v10 = 0;
LABEL_21:
    uint64_t v11 = 0;
    goto LABEL_22;
  }
  double v9 = [v4 objectForKeyedSubscript:@"IntrinsicMatrix"];
  if (!v9)
  {
    double v9 = [v4 objectForKeyedSubscript:@"OriginalCameraIntrinsicMatrix"];
    if (!v9) {
      goto LABEL_20;
    }
  }
  double v10 = [v4 objectForKeyedSubscript:@"IntrinsicMatrixReferenceDimensions"];
  if (!v10)
  {
    double v10 = [v4 objectForKeyedSubscript:@"OriginalCameraIntrinsicMatrixReferenceDimensions"];
    if (!v10) {
      goto LABEL_21;
    }
  }
  uint64_t v11 = [v4 objectForKeyedSubscript:@"DistortionCalibrationValidMaxRadiusInPixels"];
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v12 setObject:v5 forKeyedSubscript:@"PixelSize"];
    [v12 setObject:v9 forKeyedSubscript:@"IntrinsicMatrix"];
    [v12 setObject:v10 forKeyedSubscript:@"IntrinsicMatrixReferenceDimensions"];
    [v12 setObject:v6 forKeyedSubscript:@"LensDistortionCenter"];
    [v12 setObject:v7 forKeyedSubscript:@"LensDistortionCoefficients"];
    [v12 setObject:v8 forKeyedSubscript:@"InverseLensDistortionCoefficients"];
    [v12 setObject:v11 forKeyedSubscript:@"DistortionCalibrationValidMaxRadiusInPixels"];
    goto LABEL_12;
  }
LABEL_22:
  id v12 = 0;
LABEL_12:

  return v12;
}

- (NSArray)bodyDetections
{
  return self->_bodyDetections;
}

- (NSArray)faceDetections
{
  return self->_faceDetections;
}

- (NSDictionary)cameraCalibrationDictionary
{
  return self->_cameraCalibrationDictionary;
}

- (int)cameraOrientation
{
  return self->_cameraOrientation;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timestamp
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var2;
  retstr->var3 = *(int64_t *)((char *)&self[2].var0 + 4);
  return self;
}

- (float)aspectRatio
{
  return *((float *)&self->_timestamp.epoch + 1);
}

- (int)sensorID
{
  return LODWORD(self->_aspectRatio);
}

- (__n128)gravity
{
  return a1[5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraCalibrationDictionary, 0);
  objc_storeStrong((id *)&self->_faceDetections, 0);

  objc_storeStrong((id *)&self->_bodyDetections, 0);
}

@end