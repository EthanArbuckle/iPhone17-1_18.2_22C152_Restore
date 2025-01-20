@interface MTRCameraAVStreamManagementClusterRateDistortionTradeOffPointsStruct
- (MTRCameraAVStreamManagementClusterRateDistortionTradeOffPointsStruct)init;
- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)resolution;
- (NSNumber)codec;
- (NSNumber)minBitRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setCodec:(id)a3;
- (void)setMinBitRate:(id)a3;
- (void)setResolution:(id)a3;
@end

@implementation MTRCameraAVStreamManagementClusterRateDistortionTradeOffPointsStruct

- (MTRCameraAVStreamManagementClusterRateDistortionTradeOffPointsStruct)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRCameraAVStreamManagementClusterRateDistortionTradeOffPointsStruct;
  v2 = [(MTRCameraAVStreamManagementClusterRateDistortionTradeOffPointsStruct *)&v9 init];
  v3 = v2;
  if (v2)
  {
    codec = v2->_codec;
    v2->_codec = (NSNumber *)&unk_26F9C8620;

    uint64_t v5 = objc_opt_new();
    resolution = v3->_resolution;
    v3->_resolution = (MTRCameraAVStreamManagementClusterVideoResolutionStruct *)v5;

    minBitRate = v3->_minBitRate;
    v3->_minBitRate = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCameraAVStreamManagementClusterRateDistortionTradeOffPointsStruct);
  v7 = objc_msgSend_codec(self, v5, v6);
  objc_msgSend_setCodec_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_resolution(self, v9, v10);
  objc_msgSend_setResolution_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_minBitRate(self, v13, v14);
  objc_msgSend_setMinBitRate_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: codec:%@; resolution:%@; minBitRate:%@; >",
    v5,
    self->_codec,
    self->_resolution,
  v7 = self->_minBitRate);

  return v7;
}

- (NSNumber)codec
{
  return self->_codec;
}

- (void)setCodec:(id)a3
{
}

- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)resolution
{
  return self->_resolution;
}

- (void)setResolution:(id)a3
{
}

- (NSNumber)minBitRate
{
  return self->_minBitRate;
}

- (void)setMinBitRate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minBitRate, 0);
  objc_storeStrong((id *)&self->_resolution, 0);

  objc_storeStrong((id *)&self->_codec, 0);
}

@end