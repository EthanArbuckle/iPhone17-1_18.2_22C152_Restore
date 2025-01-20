@interface MTRCameraAVStreamManagementClusterAudioStreamStruct
- (MTRCameraAVStreamManagementClusterAudioStreamStruct)init;
- (NSNumber)audioCodec;
- (NSNumber)audioStreamID;
- (NSNumber)bitDepth;
- (NSNumber)bitRate;
- (NSNumber)channelCount;
- (NSNumber)referenceCount;
- (NSNumber)sampleRate;
- (NSNumber)streamType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAudioCodec:(id)a3;
- (void)setAudioStreamID:(id)a3;
- (void)setBitDepth:(id)a3;
- (void)setBitRate:(id)a3;
- (void)setChannelCount:(id)a3;
- (void)setReferenceCount:(id)a3;
- (void)setSampleRate:(id)a3;
- (void)setStreamType:(id)a3;
@end

@implementation MTRCameraAVStreamManagementClusterAudioStreamStruct

- (MTRCameraAVStreamManagementClusterAudioStreamStruct)init
{
  v13.receiver = self;
  v13.super_class = (Class)MTRCameraAVStreamManagementClusterAudioStreamStruct;
  v2 = [(MTRCameraAVStreamManagementClusterAudioStreamStruct *)&v13 init];
  v3 = v2;
  if (v2)
  {
    audioStreamID = v2->_audioStreamID;
    v2->_audioStreamID = (NSNumber *)&unk_26F9C8620;

    streamType = v3->_streamType;
    v3->_streamType = (NSNumber *)&unk_26F9C8620;

    audioCodec = v3->_audioCodec;
    v3->_audioCodec = (NSNumber *)&unk_26F9C8620;

    channelCount = v3->_channelCount;
    v3->_channelCount = (NSNumber *)&unk_26F9C8620;

    sampleRate = v3->_sampleRate;
    v3->_sampleRate = (NSNumber *)&unk_26F9C8620;

    bitRate = v3->_bitRate;
    v3->_bitRate = (NSNumber *)&unk_26F9C8620;

    bitDepth = v3->_bitDepth;
    v3->_bitDepth = (NSNumber *)&unk_26F9C8620;

    referenceCount = v3->_referenceCount;
    v3->_referenceCount = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRCameraAVStreamManagementClusterAudioStreamStruct);
  v7 = objc_msgSend_audioStreamID(self, v5, v6);
  objc_msgSend_setAudioStreamID_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_streamType(self, v9, v10);
  objc_msgSend_setStreamType_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_audioCodec(self, v13, v14);
  objc_msgSend_setAudioCodec_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_channelCount(self, v17, v18);
  objc_msgSend_setChannelCount_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_sampleRate(self, v21, v22);
  objc_msgSend_setSampleRate_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_bitRate(self, v25, v26);
  objc_msgSend_setBitRate_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_bitDepth(self, v29, v30);
  objc_msgSend_setBitDepth_(v4, v32, (uint64_t)v31);

  v35 = objc_msgSend_referenceCount(self, v33, v34);
  objc_msgSend_setReferenceCount_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: audioStreamID:%@; streamType:%@; audioCodec:%@; channelCount:%@; sampleRate:%@; bitRate:%@; bitDepth:%@; referenceCount:%@; >",
    v5,
    self->_audioStreamID,
    self->_streamType,
    self->_audioCodec,
    self->_channelCount,
    self->_sampleRate,
    self->_bitRate,
    self->_bitDepth,
  v7 = self->_referenceCount);

  return v7;
}

- (NSNumber)audioStreamID
{
  return self->_audioStreamID;
}

- (void)setAudioStreamID:(id)a3
{
}

- (NSNumber)streamType
{
  return self->_streamType;
}

- (void)setStreamType:(id)a3
{
}

- (NSNumber)audioCodec
{
  return self->_audioCodec;
}

- (void)setAudioCodec:(id)a3
{
}

- (NSNumber)channelCount
{
  return self->_channelCount;
}

- (void)setChannelCount:(id)a3
{
}

- (NSNumber)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(id)a3
{
}

- (NSNumber)bitRate
{
  return self->_bitRate;
}

- (void)setBitRate:(id)a3
{
}

- (NSNumber)bitDepth
{
  return self->_bitDepth;
}

- (void)setBitDepth:(id)a3
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
  objc_storeStrong((id *)&self->_bitDepth, 0);
  objc_storeStrong((id *)&self->_bitRate, 0);
  objc_storeStrong((id *)&self->_sampleRate, 0);
  objc_storeStrong((id *)&self->_channelCount, 0);
  objc_storeStrong((id *)&self->_audioCodec, 0);
  objc_storeStrong((id *)&self->_streamType, 0);

  objc_storeStrong((id *)&self->_audioStreamID, 0);
}

@end