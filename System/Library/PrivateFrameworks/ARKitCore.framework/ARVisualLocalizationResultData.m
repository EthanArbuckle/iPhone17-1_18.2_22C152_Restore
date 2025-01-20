@interface ARVisualLocalizationResultData
+ (BOOL)supportsSecureCoding;
- (ARVisualLocalizationResultData)initWithCoder:(id)a3;
- (ARVisualLocalizationResultData)initWithVLLocalizationResult:(id)a3 errorCode:(int64_t)a4 debugInfo:(id)a5 heading:(double)a6 inputLocation:(id)a7 algorithmVersion:(int64_t)a8 undulation:(double)a9;
- (BOOL)isSecure;
- (CLLocation)location;
- (VLLocalizationDebugInfo)debugInfo;
- (VLLocalizationResult)localizationResult;
- (double)heading;
- (double)timestamp;
- (double)undulation;
- (int64_t)algorithmVersion;
- (int64_t)errorCode;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setLocation:(id)a3;
@end

@implementation ARVisualLocalizationResultData

- (ARVisualLocalizationResultData)initWithVLLocalizationResult:(id)a3 errorCode:(int64_t)a4 debugInfo:(id)a5 heading:(double)a6 inputLocation:(id)a7 algorithmVersion:(int64_t)a8 undulation:(double)a9
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a5;
  id v19 = a7;
  v32.receiver = self;
  v32.super_class = (Class)ARVisualLocalizationResultData;
  v20 = [(ARVisualLocalizationResultData *)&v32 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_localizationResult, a3);
    v21->_errorCode = a4;
    objc_storeStrong((id *)&v21->_debugInfo, a5);
    v21->_heading = a6;
    objc_storeStrong((id *)&v21->_inputLocation, a7);
    v21->_algorithmVersion = a8;
    v21->_undulation = a9;
    if (v21->_localizationResult)
    {
      if (v17)
      {
        [v17 location];
      }
      else
      {
        long long v34 = 0u;
        long long v35 = 0u;
        long long v33 = 0u;
      }
      ARECEFToLLA(&v30);
      *(int8x16_t *)latitude = v30;
      double v22 = ARWGS84ToMSLAltitude(v31, v21->_undulation);
      id v23 = objc_alloc(MEMORY[0x1E4F1E5F0]);
      CLLocationCoordinate2D v24 = CLLocationCoordinate2DMake(latitude[0], latitude[1]);
      v25 = [MEMORY[0x1E4F1C9C8] date];
      uint64_t v26 = objc_msgSend(v23, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v25, v24.latitude, v24.longitude, v22, 0.0, 0.0);
      location = v21->_location;
      v21->_location = (CLLocation *)v26;
    }
  }

  return v21;
}

- (double)timestamp
{
  [(VLLocalizationResult *)self->_localizationResult inputTimestamp];
  return result;
}

- (BOOL)isSecure
{
  return [(ARLocationData *)self->_inputLocation isSecure];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [(ARVisualLocalizationResultData *)self heading];
  objc_msgSend(v6, "encodeDouble:forKey:", @"ARVisualLocalizationResultData_headingKey");
  v4 = [(ARVisualLocalizationResultData *)self localizationResult];
  [v6 encodeObject:v4 forKey:@"ARVisualLocalizationResultData_localizationResultKey"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[ARVisualLocalizationResultData errorCode](self, "errorCode"), @"ARVisualLocalizationResultData_errorCodeKey");
  v5 = [(ARVisualLocalizationResultData *)self debugInfo];
  [v6 encodeObject:v5 forKey:@"ARVisualLocalizationResultData_debugInfoKey"];

  [v6 encodeObject:self->_inputLocation forKey:@"ARVisualLocalizationResultData_inputLocationKey"];
  objc_msgSend(v6, "encodeInteger:forKey:", -[ARVisualLocalizationResultData algorithmVersion](self, "algorithmVersion"), @"ARVisualLocalizationResultData_algorithmVersionKey");
  [v6 encodeDouble:@"ARVisualLocalizationResultData_undulationKey" forKey:self->_undulation];
}

- (ARVisualLocalizationResultData)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"ARVisualLocalizationResultData_headingKey"];
  double v6 = v5;
  v7 = [v4 decodeObjectForKey:@"ARVisualLocalizationResultData_localizationResultKey"];
  uint64_t v8 = [v4 decodeIntegerForKey:@"ARVisualLocalizationResultData_errorCodeKey"];
  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ARVisualLocalizationResultData_debugInfoKey"];
  v10 = [v4 decodeObjectForKey:@"ARVisualLocalizationResultData_inputLocationKey"];
  uint64_t v11 = [v4 decodeIntegerForKey:@"ARVisualLocalizationResultData_algorithmVersionKey"];
  [v4 decodeDoubleForKey:@"ARVisualLocalizationResultData_undulationKey"];
  double v13 = v12;

  v14 = [(ARVisualLocalizationResultData *)self initWithVLLocalizationResult:v7 errorCode:v8 debugInfo:v9 heading:v10 inputLocation:v11 algorithmVersion:v6 undulation:v13];
  return v14;
}

- (VLLocalizationResult)localizationResult
{
  return self->_localizationResult;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (VLLocalizationDebugInfo)debugInfo
{
  return self->_debugInfo;
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (double)heading
{
  return self->_heading;
}

- (int64_t)algorithmVersion
{
  return self->_algorithmVersion;
}

- (double)undulation
{
  return self->_undulation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_localizationResult, 0);
  objc_storeStrong((id *)&self->_inputLocation, 0);
}

@end