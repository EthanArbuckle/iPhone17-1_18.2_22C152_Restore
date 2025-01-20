@interface MTRCameraAVStreamManagementClusterSnapshotStreamStruct
- (MTRCameraAVStreamManagementClusterSnapshotStreamStruct)init;
- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)maxResolution;
- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)minResolution;
- (NSNumber)bitRate;
- (NSNumber)frameRate;
- (NSNumber)imageCodec;
- (NSNumber)quality;
- (NSNumber)referenceCount;
- (NSNumber)snapshotStreamID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setBitRate:(id)a3;
- (void)setFrameRate:(id)a3;
- (void)setImageCodec:(id)a3;
- (void)setMaxResolution:(id)a3;
- (void)setMinResolution:(id)a3;
- (void)setQuality:(id)a3;
- (void)setReferenceCount:(id)a3;
- (void)setSnapshotStreamID:(id)a3;
@end

@implementation MTRCameraAVStreamManagementClusterSnapshotStreamStruct

- (MTRCameraAVStreamManagementClusterSnapshotStreamStruct)init
{
  v15.receiver = self;
  v15.super_class = (Class)MTRCameraAVStreamManagementClusterSnapshotStreamStruct;
  v2 = [(MTRCameraAVStreamManagementClusterSnapshotStreamStruct *)&v15 init];
  v3 = v2;
  if (v2)
  {
    snapshotStreamID = v2->_snapshotStreamID;
    v2->_snapshotStreamID = (NSNumber *)&unk_26F9C8620;

    imageCodec = v3->_imageCodec;
    v3->_imageCodec = (NSNumber *)&unk_26F9C8620;

    frameRate = v3->_frameRate;
    v3->_frameRate = (NSNumber *)&unk_26F9C8620;

    bitRate = v3->_bitRate;
    v3->_bitRate = (NSNumber *)&unk_26F9C8620;

    uint64_t v8 = objc_opt_new();
    minResolution = v3->_minResolution;
    v3->_minResolution = (MTRCameraAVStreamManagementClusterVideoResolutionStruct *)v8;

    uint64_t v10 = objc_opt_new();
    maxResolution = v3->_maxResolution;
    v3->_maxResolution = (MTRCameraAVStreamManagementClusterVideoResolutionStruct *)v10;

    quality = v3->_quality;
    v3->_quality = (NSNumber *)&unk_26F9C8620;

    referenceCount = v3->_referenceCount;
    v3->_referenceCount = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCameraAVStreamManagementClusterSnapshotStreamStruct);
  v7 = objc_msgSend_snapshotStreamID(self, v5, v6);
  objc_msgSend_setSnapshotStreamID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_imageCodec(self, v9, v10);
  objc_msgSend_setImageCodec_(v4, v12, (uint64_t)v11);

  objc_super v15 = objc_msgSend_frameRate(self, v13, v14);
  objc_msgSend_setFrameRate_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_bitRate(self, v17, v18);
  objc_msgSend_setBitRate_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_minResolution(self, v21, v22);
  objc_msgSend_setMinResolution_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_maxResolution(self, v25, v26);
  objc_msgSend_setMaxResolution_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_quality(self, v29, v30);
  objc_msgSend_setQuality_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_referenceCount(self, v33, v34);
  objc_msgSend_setReferenceCount_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: snapshotStreamID:%@; imageCodec:%@; frameRate:%@; bitRate:%@; minResolution:%@; maxResolution:%@; quality:%@; referenceCount:%@; >",
    v5,
    self->_snapshotStreamID,
    self->_imageCodec,
    self->_frameRate,
    self->_bitRate,
    self->_minResolution,
    self->_maxResolution,
    self->_quality,
  v7 = self->_referenceCount);

  return v7;
}

- (NSNumber)snapshotStreamID
{
  return self->_snapshotStreamID;
}

- (void)setSnapshotStreamID:(id)a3
{
}

- (NSNumber)imageCodec
{
  return self->_imageCodec;
}

- (void)setImageCodec:(id)a3
{
}

- (NSNumber)frameRate
{
  return self->_frameRate;
}

- (void)setFrameRate:(id)a3
{
}

- (NSNumber)bitRate
{
  return self->_bitRate;
}

- (void)setBitRate:(id)a3
{
}

- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)minResolution
{
  return self->_minResolution;
}

- (void)setMinResolution:(id)a3
{
}

- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)maxResolution
{
  return self->_maxResolution;
}

- (void)setMaxResolution:(id)a3
{
}

- (NSNumber)quality
{
  return self->_quality;
}

- (void)setQuality:(id)a3
{
}

- (NSNumber)referenceCount
{
  return self->_referenceCount;
}

- (void)setReferenceCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceCount, 0);
  objc_storeStrong((id *)&self->_quality, 0);
  objc_storeStrong((id *)&self->_maxResolution, 0);
  objc_storeStrong((id *)&self->_minResolution, 0);
  objc_storeStrong((id *)&self->_bitRate, 0);
  objc_storeStrong((id *)&self->_frameRate, 0);
  objc_storeStrong((id *)&self->_imageCodec, 0);

  objc_storeStrong((id *)&self->_snapshotStreamID, 0);
}

@end