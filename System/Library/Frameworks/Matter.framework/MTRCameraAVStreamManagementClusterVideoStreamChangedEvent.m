@interface MTRCameraAVStreamManagementClusterVideoStreamChangedEvent
- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)maxResolution;
- (MTRCameraAVStreamManagementClusterVideoResolutionStruct)minResolution;
- (MTRCameraAVStreamManagementClusterVideoStreamChangedEvent)init;
- (NSNumber)maxBitRate;
- (NSNumber)maxFragmentLen;
- (NSNumber)maxFrameRate;
- (NSNumber)minBitRate;
- (NSNumber)minFragmentLen;
- (NSNumber)minFrameRate;
- (NSNumber)streamType;
- (NSNumber)videoCodec;
- (NSNumber)videoStreamID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setMaxBitRate:(id)a3;
- (void)setMaxFragmentLen:(id)a3;
- (void)setMaxFrameRate:(id)a3;
- (void)setMaxResolution:(id)a3;
- (void)setMinBitRate:(id)a3;
- (void)setMinFragmentLen:(id)a3;
- (void)setMinFrameRate:(id)a3;
- (void)setMinResolution:(id)a3;
- (void)setStreamType:(id)a3;
- (void)setVideoCodec:(id)a3;
- (void)setVideoStreamID:(id)a3;
@end

@implementation MTRCameraAVStreamManagementClusterVideoStreamChangedEvent

- (MTRCameraAVStreamManagementClusterVideoStreamChangedEvent)init
{
  v16.receiver = self;
  v16.super_class = (Class)MTRCameraAVStreamManagementClusterVideoStreamChangedEvent;
  v2 = [(MTRCameraAVStreamManagementClusterVideoStreamChangedEvent *)&v16 init];
  v3 = v2;
  if (v2)
  {
    videoStreamID = v2->_videoStreamID;
    v2->_videoStreamID = (NSNumber *)&unk_26F9C8620;

    streamType = v3->_streamType;
    v3->_streamType = 0;

    videoCodec = v3->_videoCodec;
    v3->_videoCodec = 0;

    minFrameRate = v3->_minFrameRate;
    v3->_minFrameRate = 0;

    maxFrameRate = v3->_maxFrameRate;
    v3->_maxFrameRate = 0;

    minResolution = v3->_minResolution;
    v3->_minResolution = 0;

    maxResolution = v3->_maxResolution;
    v3->_maxResolution = 0;

    minBitRate = v3->_minBitRate;
    v3->_minBitRate = 0;

    maxBitRate = v3->_maxBitRate;
    v3->_maxBitRate = 0;

    minFragmentLen = v3->_minFragmentLen;
    v3->_minFragmentLen = 0;

    maxFragmentLen = v3->_maxFragmentLen;
    v3->_maxFragmentLen = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCameraAVStreamManagementClusterVideoStreamChangedEvent);
  v7 = objc_msgSend_videoStreamID(self, v5, v6);
  objc_msgSend_setVideoStreamID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_streamType(self, v9, v10);
  objc_msgSend_setStreamType_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_videoCodec(self, v13, v14);
  objc_msgSend_setVideoCodec_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_minFrameRate(self, v17, v18);
  objc_msgSend_setMinFrameRate_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_maxFrameRate(self, v21, v22);
  objc_msgSend_setMaxFrameRate_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_minResolution(self, v25, v26);
  objc_msgSend_setMinResolution_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_maxResolution(self, v29, v30);
  objc_msgSend_setMaxResolution_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_minBitRate(self, v33, v34);
  objc_msgSend_setMinBitRate_(v4, v36, (uint64_t)v35);

  v39 = objc_msgSend_maxBitRate(self, v37, v38);
  objc_msgSend_setMaxBitRate_(v4, v40, (uint64_t)v39);

  v43 = objc_msgSend_minFragmentLen(self, v41, v42);
  objc_msgSend_setMinFragmentLen_(v4, v44, (uint64_t)v43);

  v47 = objc_msgSend_maxFragmentLen(self, v45, v46);
  objc_msgSend_setMaxFragmentLen_(v4, v48, (uint64_t)v47);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: videoStreamID:%@; streamType:%@; videoCodec:%@; minFrameRate:%@; maxFrameRate:%@; minResolution:%@; maxResolution:%@; minBitRate:%@; maxBitRate:%@; minFragmentLen:%@; maxFragmentLen:%@; >",
    v5,
    self->_videoStreamID,
    self->_streamType,
    self->_videoCodec,
    self->_minFrameRate,
    self->_maxFrameRate,
    self->_minResolution,
    self->_maxResolution,
    self->_minBitRate,
    self->_maxBitRate,
    self->_minFragmentLen,
  v7 = self->_maxFragmentLen);

  return v7;
}

- (NSNumber)videoStreamID
{
  return self->_videoStreamID;
}

- (void)setVideoStreamID:(id)a3
{
}

- (NSNumber)streamType
{
  return self->_streamType;
}

- (void)setStreamType:(id)a3
{
}

- (NSNumber)videoCodec
{
  return self->_videoCodec;
}

- (void)setVideoCodec:(id)a3
{
}

- (NSNumber)minFrameRate
{
  return self->_minFrameRate;
}

- (void)setMinFrameRate:(id)a3
{
}

- (NSNumber)maxFrameRate
{
  return self->_maxFrameRate;
}

- (void)setMaxFrameRate:(id)a3
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

- (NSNumber)minBitRate
{
  return self->_minBitRate;
}

- (void)setMinBitRate:(id)a3
{
}

- (NSNumber)maxBitRate
{
  return self->_maxBitRate;
}

- (void)setMaxBitRate:(id)a3
{
}

- (NSNumber)minFragmentLen
{
  return self->_minFragmentLen;
}

- (void)setMinFragmentLen:(id)a3
{
}

- (NSNumber)maxFragmentLen
{
  return self->_maxFragmentLen;
}

- (void)setMaxFragmentLen:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxFragmentLen, 0);
  objc_storeStrong((id *)&self->_minFragmentLen, 0);
  objc_storeStrong((id *)&self->_maxBitRate, 0);
  objc_storeStrong((id *)&self->_minBitRate, 0);
  objc_storeStrong((id *)&self->_maxResolution, 0);
  objc_storeStrong((id *)&self->_minResolution, 0);
  objc_storeStrong((id *)&self->_maxFrameRate, 0);
  objc_storeStrong((id *)&self->_minFrameRate, 0);
  objc_storeStrong((id *)&self->_videoCodec, 0);
  objc_storeStrong((id *)&self->_streamType, 0);

  objc_storeStrong((id *)&self->_videoStreamID, 0);
}

@end