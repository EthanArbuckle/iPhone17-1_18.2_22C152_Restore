@interface MTRCameraAVStreamManagementClusterSnapshotParamsStruct
- (MTRCameraAVStreamManagementClusterSnapshotParamsStruct)init;
- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)resolution;
- (NSNumber)imageCodec;
- (NSNumber)maxFrameRate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setImageCodec:(id)a3;
- (void)setMaxFrameRate:(id)a3;
- (void)setResolution:(id)a3;
@end

@implementation MTRCameraAVStreamManagementClusterSnapshotParamsStruct

- (MTRCameraAVStreamManagementClusterSnapshotParamsStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRCameraAVStreamManagementClusterSnapshotParamsStruct;
  v2 = [(MTRCameraAVStreamManagementClusterSnapshotParamsStruct *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    resolution = v2->_resolution;
    v2->_resolution = (MTRCameraAVStreamManagementClusterVideoResolutionStruct *)v3;

    maxFrameRate = v2->_maxFrameRate;
    v2->_maxFrameRate = (NSNumber *)&unk_26F9C8620;

    imageCodec = v2->_imageCodec;
    v2->_imageCodec = (NSNumber *)&unk_26F9C8620;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCameraAVStreamManagementClusterSnapshotParamsStruct);
  v7 = objc_msgSend_resolution(self, v5, v6);
  objc_msgSend_setResolution_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_maxFrameRate(self, v9, v10);
  objc_msgSend_setMaxFrameRate_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_imageCodec(self, v13, v14);
  objc_msgSend_setImageCodec_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: resolution:%@; maxFrameRate:%@; imageCodec:%@; >",
    v5,
    self->_resolution,
    self->_maxFrameRate,
  v7 = self->_imageCodec);

  return v7;
}

- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)resolution
{
  return self->_resolution;
}

- (void)setResolution:(id)a3
{
}

- (NSNumber)maxFrameRate
{
  return self->_maxFrameRate;
}

- (void)setMaxFrameRate:(id)a3
{
}

- (NSNumber)imageCodec
{
  return self->_imageCodec;
}

- (void)setImageCodec:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageCodec, 0);
  objc_storeStrong((id *)&self->_maxFrameRate, 0);

  objc_storeStrong((id *)&self->_resolution, 0);
}

@end