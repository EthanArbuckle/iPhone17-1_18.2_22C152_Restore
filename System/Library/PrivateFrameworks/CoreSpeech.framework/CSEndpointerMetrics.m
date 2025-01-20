@interface CSEndpointerMetrics
+ (BOOL)supportsSecureCoding;
- (BOOL)isAnchorTimeBuffered;
- (BOOL)isRequestTimeOut;
- (CSASRFeatures)asrFeaturesAtEndpoint;
- (CSEndpointerMetrics)initWithCoder:(id)a3;
- (CSEndpointerMetrics)initWithTotalAudioRecorded:(double)a3 endpointBufferHostTime:(unint64_t)a4 featuresAtEndpoint:(id)a5 endpointerType:(int64_t)a6 asrFeatureLatencyDistribution:(id)a7 additionalMetrics:(id)a8 trailingSilenceDurationAtEndpoint:(double)a9 requestId:(id)a10;
- (CSEndpointerMetrics)initWithTotalAudioRecorded:(double)a3 endpointBufferHostTime:(unint64_t)a4 featuresAtEndpoint:(id)a5 endpointerType:(int64_t)a6 asrFeatureLatencyDistribution:(id)a7 additionalMetrics:(id)a8 trailingSilenceDurationAtEndpoint:(double)a9 requestId:(id)a10 osdFeatures:(id)a11 asrFeatures:(id)a12 isRequestTimeOut:(BOOL)a13 assetConfigVersion:(id)a14 blkHepAudioOrigin:(double)a15 vtExtraAudioAtStartInMs:(double)a16 firstAudioSampleSensorTimestamp:(unint64_t)a17 isAnchorTimeBuffered:(BOOL)a18 endpointHostTime:(unint64_t)a19 audioDeliveryHostTimeDelta:(unint64_t)a20;
- (NSArray)featuresAtEndpoint;
- (NSDictionary)additionalMetrics;
- (NSDictionary)asrFeatureLatencyDistribution;
- (NSString)assetConfigVersion;
- (NSString)requestId;
- (OSDFeatures)osdFeaturesAtEndpoint;
- (double)blkHepAudioOrigin;
- (double)totalAudioRecorded;
- (double)trailingSilenceDurationAtEndpoint;
- (double)vtExtraAudioAtStartInMs;
- (id)description;
- (id)metricsCopyWithRequestId:(id)a3 lastAudioChunkHostTime:(unint64_t)a4;
- (int64_t)endpointerType;
- (unint64_t)audioDeliveryHostTimeDelta;
- (unint64_t)endpointBufferHostTime;
- (unint64_t)endpointHostTime;
- (unint64_t)firstAudioSampleSensorTimestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalMetrics:(id)a3;
- (void)setAsrFeatureLatencyDistribution:(id)a3;
- (void)setAsrFeaturesAtEndpoint:(id)a3;
- (void)setAssetConfigVersion:(id)a3;
- (void)setAudioDeliveryHostTimeDelta:(unint64_t)a3;
- (void)setBlkHepAudioOrigin:(double)a3;
- (void)setEndpointBufferHostTime:(unint64_t)a3;
- (void)setEndpointHostTime:(unint64_t)a3;
- (void)setEndpointerType:(int64_t)a3;
- (void)setFeaturesAtEndpoint:(id)a3;
- (void)setFirstAudioSampleSensorTimestamp:(unint64_t)a3;
- (void)setIsAnchorTimeBuffered:(BOOL)a3;
- (void)setIsRequestTimeOut:(BOOL)a3;
- (void)setOsdFeaturesAtEndpoint:(id)a3;
- (void)setRequestId:(id)a3;
- (void)setTotalAudioRecorded:(double)a3;
- (void)setTrailingSilenceDurationAtEndpoint:(double)a3;
- (void)setVtExtraAudioAtStartInMs:(double)a3;
@end

@implementation CSEndpointerMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetConfigVersion, 0);
  objc_storeStrong((id *)&self->_asrFeaturesAtEndpoint, 0);
  objc_storeStrong((id *)&self->_osdFeaturesAtEndpoint, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
  objc_storeStrong((id *)&self->_additionalMetrics, 0);
  objc_storeStrong((id *)&self->_asrFeatureLatencyDistribution, 0);
  objc_storeStrong((id *)&self->_featuresAtEndpoint, 0);
}

- (void)setAudioDeliveryHostTimeDelta:(unint64_t)a3
{
  self->_audioDeliveryHostTimeDelta = a3;
}

- (unint64_t)audioDeliveryHostTimeDelta
{
  return self->_audioDeliveryHostTimeDelta;
}

- (void)setEndpointHostTime:(unint64_t)a3
{
  self->_endpointHostTime = a3;
}

- (unint64_t)endpointHostTime
{
  return self->_endpointHostTime;
}

- (void)setFirstAudioSampleSensorTimestamp:(unint64_t)a3
{
  self->_firstAudioSampleSensorTimestamp = a3;
}

- (unint64_t)firstAudioSampleSensorTimestamp
{
  return self->_firstAudioSampleSensorTimestamp;
}

- (void)setVtExtraAudioAtStartInMs:(double)a3
{
  self->_vtExtraAudioAtStartInMs = a3;
}

- (double)vtExtraAudioAtStartInMs
{
  return self->_vtExtraAudioAtStartInMs;
}

- (void)setBlkHepAudioOrigin:(double)a3
{
  self->_blkHepAudioOrigin = a3;
}

- (double)blkHepAudioOrigin
{
  return self->_blkHepAudioOrigin;
}

- (void)setAssetConfigVersion:(id)a3
{
}

- (NSString)assetConfigVersion
{
  return self->_assetConfigVersion;
}

- (void)setIsAnchorTimeBuffered:(BOOL)a3
{
  self->_isAnchorTimeBuffered = a3;
}

- (BOOL)isAnchorTimeBuffered
{
  return self->_isAnchorTimeBuffered;
}

- (void)setIsRequestTimeOut:(BOOL)a3
{
  self->_isRequestTimeOut = a3;
}

- (BOOL)isRequestTimeOut
{
  return self->_isRequestTimeOut;
}

- (void)setAsrFeaturesAtEndpoint:(id)a3
{
}

- (CSASRFeatures)asrFeaturesAtEndpoint
{
  return self->_asrFeaturesAtEndpoint;
}

- (void)setOsdFeaturesAtEndpoint:(id)a3
{
}

- (OSDFeatures)osdFeaturesAtEndpoint
{
  return self->_osdFeaturesAtEndpoint;
}

- (void)setRequestId:(id)a3
{
}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setTrailingSilenceDurationAtEndpoint:(double)a3
{
  self->_trailingSilenceDurationAtEndpoint = a3;
}

- (double)trailingSilenceDurationAtEndpoint
{
  return self->_trailingSilenceDurationAtEndpoint;
}

- (void)setAdditionalMetrics:(id)a3
{
}

- (NSDictionary)additionalMetrics
{
  return self->_additionalMetrics;
}

- (void)setAsrFeatureLatencyDistribution:(id)a3
{
}

- (NSDictionary)asrFeatureLatencyDistribution
{
  return self->_asrFeatureLatencyDistribution;
}

- (void)setEndpointerType:(int64_t)a3
{
  self->_endpointerType = a3;
}

- (int64_t)endpointerType
{
  return self->_endpointerType;
}

- (void)setFeaturesAtEndpoint:(id)a3
{
}

- (NSArray)featuresAtEndpoint
{
  return self->_featuresAtEndpoint;
}

- (void)setEndpointBufferHostTime:(unint64_t)a3
{
  self->_endpointBufferHostTime = a3;
}

- (unint64_t)endpointBufferHostTime
{
  return self->_endpointBufferHostTime;
}

- (void)setTotalAudioRecorded:(double)a3
{
  self->_totalAudioRecorded = a3;
}

- (double)totalAudioRecorded
{
  return self->_totalAudioRecorded;
}

- (void)encodeWithCoder:(id)a3
{
  double totalAudioRecorded = self->_totalAudioRecorded;
  id v9 = a3;
  v5 = +[NSNumber numberWithDouble:totalAudioRecorded];
  [v9 encodeObject:v5 forKey:@"CSEndpointMetrics:::totalAudioRecorded"];

  v6 = +[NSNumber numberWithUnsignedLongLong:self->_endpointBufferHostTime];
  [v9 encodeObject:v6 forKey:@"CSEndpointMetrics:::endpointBufferHostTime"];

  [v9 encodeObject:self->_featuresAtEndpoint forKey:@"CSEndpointMetrics:::featuresAtEndpoint"];
  v7 = +[NSNumber numberWithInteger:self->_endpointerType];
  [v9 encodeObject:v7 forKey:@"CSEndpointMetrics:::endpointerType"];

  [v9 encodeObject:self->_asrFeatureLatencyDistribution forKey:@"CSEndpointMetrics:::asrFeatureLatencyDistribution"];
  [v9 encodeObject:self->_additionalMetrics forKey:@"CSEndpointMetrics:::additionalMetrics"];
  v8 = +[NSNumber numberWithDouble:self->_trailingSilenceDurationAtEndpoint];
  [v9 encodeObject:v8 forKey:@"CSEndpointMetrics:::trailingSilenceDurationAtEndpoint"];

  [v9 encodeObject:self->_requestId forKey:@"CSEndpointMetrics:::requestId"];
}

- (CSEndpointerMetrics)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSEndpointMetrics:::totalAudioRecorded"];
  [v4 doubleValue];
  double v6 = v5;

  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSEndpointMetrics:::endpointBufferHostTime"];
  id v27 = [v7 unsignedLongLongValue];

  uint64_t v8 = objc_opt_class();
  id v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, objc_opt_class(), 0);
  v10 = [v3 decodeObjectOfClasses:v9 forKey:@"CSEndpointMetrics:::featuresAtEndpoint"];

  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSEndpointMetrics:::endpointerType"];
  id v12 = [v11 unsignedIntegerValue];

  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, objc_opt_class(), 0);
  v16 = [v3 decodeObjectOfClasses:v15 forKey:@"CSEndpointMetrics:::asrFeatureLatencyDistribution"];

  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, v18, objc_opt_class(), 0);
  v20 = [v3 decodeObjectOfClasses:v19 forKey:@"CSEndpointMetrics:::additionalMetrics"];

  v21 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSEndpointMetrics:::trailingSilenceDurationAtEndpoint"];
  [v21 doubleValue];
  double v23 = v22;

  v24 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"CSEndpointMetrics:::requestId"];

  v25 = [(CSEndpointerMetrics *)self initWithTotalAudioRecorded:v27 endpointBufferHostTime:v10 featuresAtEndpoint:v12 endpointerType:v16 asrFeatureLatencyDistribution:v20 additionalMetrics:v24 trailingSilenceDurationAtEndpoint:v6 requestId:v23];
  return v25;
}

- (id)description
{
  id v3 = +[NSMutableString string];
  objc_msgSend(v3, "appendFormat:", @"[double totalAudioRecorded = %f]", *(void *)&self->_totalAudioRecorded);
  objc_msgSend(v3, "appendFormat:", @"[endpointBufferHostTime = %llu]", self->_endpointBufferHostTime);
  objc_msgSend(v3, "appendFormat:", @"[trailingSilenceDurationAtEndpoint = %f]", *(void *)&self->_trailingSilenceDurationAtEndpoint);
  objc_msgSend(v3, "appendFormat:", @"[endpointerType = %lu]", self->_endpointerType);
  [v3 appendFormat:@"[featuresAtEndpoint = %@]", self->_featuresAtEndpoint];
  [v3 appendFormat:@"[additionalMetrics = %@]", self->_additionalMetrics];
  [v3 appendFormat:@"[requestId = %@]", self->_requestId];
  return v3;
}

- (id)metricsCopyWithRequestId:(id)a3 lastAudioChunkHostTime:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(CSEndpointerMetrics *)self additionalMetrics];
  id v8 = [v7 mutableCopy];

  id v9 = +[NSNumber numberWithUnsignedLongLong:a4];
  [v8 setObject:v9 forKey:@"lastAudioChunkHostTime"];

  v10 = [CSEndpointerMetrics alloc];
  [(CSEndpointerMetrics *)self totalAudioRecorded];
  LOBYTE(v14) = self->_isAnchorTimeBuffered;
  LOBYTE(v13) = self->_isRequestTimeOut;
  v11 = -[CSEndpointerMetrics initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribution:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:osdFeatures:asrFeatures:isRequestTimeOut:assetConfigVersion:blkHepAudioOrigin:vtExtraAudioAtStartInMs:firstAudioSampleSensorTimestamp:isAnchorTimeBuffered:endpointHostTime:audioDeliveryHostTimeDelta:](v10, "initWithTotalAudioRecorded:endpointBufferHostTime:featuresAtEndpoint:endpointerType:asrFeatureLatencyDistribution:additionalMetrics:trailingSilenceDurationAtEndpoint:requestId:osdFeatures:asrFeatures:isRequestTimeOut:assetConfigVersion:blkHepAudioOrigin:vtExtraAudioAtStartInMs:firstAudioSampleSensorTimestamp:isAnchorTimeBuffered:endpointHostTime:audioDeliveryHostTimeDelta:", self->_endpointBufferHostTime, self->_featuresAtEndpoint, self->_endpointerType, self->_asrFeatureLatencyDistribution, v8, v6, self->_osdFeaturesAtEndpoint, self->_asrFeaturesAtEndpoint, v13, self->_assetConfigVersion, self->_firstAudioSampleSensorTimestamp, v14, self->_endpointHostTime, self->_audioDeliveryHostTimeDelta);

  return v11;
}

- (CSEndpointerMetrics)initWithTotalAudioRecorded:(double)a3 endpointBufferHostTime:(unint64_t)a4 featuresAtEndpoint:(id)a5 endpointerType:(int64_t)a6 asrFeatureLatencyDistribution:(id)a7 additionalMetrics:(id)a8 trailingSilenceDurationAtEndpoint:(double)a9 requestId:(id)a10
{
  id v28 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  v29.receiver = self;
  v29.super_class = (Class)CSEndpointerMetrics;
  double v22 = [(CSEndpointerMetrics *)&v29 init];
  double v23 = v22;
  if (v22)
  {
    v22->_double totalAudioRecorded = a3;
    v22->_endpointBufferHostTime = a4;
    objc_storeStrong((id *)&v22->_featuresAtEndpoint, a5);
    v23->_endpointerType = a6;
    objc_storeStrong((id *)&v23->_asrFeatureLatencyDistribution, a7);
    objc_storeStrong((id *)&v23->_additionalMetrics, a8);
    v23->_trailingSilenceDurationAtEndpoint = a9;
    objc_storeStrong((id *)&v23->_requestId, a10);
    osdFeaturesAtEndpoint = v23->_osdFeaturesAtEndpoint;
    v23->_osdFeaturesAtEndpoint = 0;

    asrFeaturesAtEndpoint = v23->_asrFeaturesAtEndpoint;
    v23->_asrFeaturesAtEndpoint = 0;

    v23->_isRequestTimeOut = 0;
    assetConfigVersion = v23->_assetConfigVersion;
    v23->_assetConfigVersion = 0;

    v23->_isAnchorTimeBuffered = 0;
    v23->_vtExtraAudioAtStartInMs = 0.0;
    v23->_firstAudioSampleSensorTimestamp = 0;
    v23->_blkHepAudioOrigin = 0.0;
  }

  return v23;
}

- (CSEndpointerMetrics)initWithTotalAudioRecorded:(double)a3 endpointBufferHostTime:(unint64_t)a4 featuresAtEndpoint:(id)a5 endpointerType:(int64_t)a6 asrFeatureLatencyDistribution:(id)a7 additionalMetrics:(id)a8 trailingSilenceDurationAtEndpoint:(double)a9 requestId:(id)a10 osdFeatures:(id)a11 asrFeatures:(id)a12 isRequestTimeOut:(BOOL)a13 assetConfigVersion:(id)a14 blkHepAudioOrigin:(double)a15 vtExtraAudioAtStartInMs:(double)a16 firstAudioSampleSensorTimestamp:(unint64_t)a17 isAnchorTimeBuffered:(BOOL)a18 endpointHostTime:(unint64_t)a19 audioDeliveryHostTimeDelta:(unint64_t)a20
{
  id v29 = a5;
  id v30 = a7;
  id v40 = a8;
  id v39 = a10;
  id v38 = a11;
  id v37 = a12;
  id v36 = a14;
  v41.receiver = self;
  v41.super_class = (Class)CSEndpointerMetrics;
  v31 = [(CSEndpointerMetrics *)&v41 init];
  v32 = v31;
  if (v31)
  {
    v31->_double totalAudioRecorded = a3;
    v31->_endpointBufferHostTime = a4;
    objc_storeStrong((id *)&v31->_featuresAtEndpoint, a5);
    v32->_endpointerType = a6;
    objc_storeStrong((id *)&v32->_asrFeatureLatencyDistribution, a7);
    objc_storeStrong((id *)&v32->_additionalMetrics, a8);
    v32->_trailingSilenceDurationAtEndpoint = a9;
    objc_storeStrong((id *)&v32->_requestId, a10);
    objc_storeStrong((id *)&v32->_osdFeaturesAtEndpoint, a11);
    objc_storeStrong((id *)&v32->_asrFeaturesAtEndpoint, a12);
    v32->_isRequestTimeOut = a13;
    objc_storeStrong((id *)&v32->_assetConfigVersion, a14);
    v32->_blkHepAudioOrigin = a15;
    v32->_vtExtraAudioAtStartInMs = a16;
    v32->_isAnchorTimeBuffered = a18;
    v32->_firstAudioSampleSensorTimestamp = a17;
    v32->_endpointHostTime = a19;
    v32->_audioDeliveryHostTimeDelta = a20;
  }

  return v32;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end