@interface MTRWebRTCTransportProviderClusterWebRTCSessionStruct
- (MTRWebRTCTransportProviderClusterWebRTCSessionStruct)init;
- (NSNumber)audioStreamID;
- (NSNumber)id;
- (NSNumber)metadataOptions;
- (NSNumber)peerFabricIndex;
- (NSNumber)peerNodeID;
- (NSNumber)streamType;
- (NSNumber)videoStreamID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAudioStreamID:(id)a3;
- (void)setId:(id)a3;
- (void)setMetadataOptions:(id)a3;
- (void)setPeerFabricIndex:(id)a3;
- (void)setPeerNodeID:(id)a3;
- (void)setStreamType:(id)a3;
- (void)setVideoStreamID:(id)a3;
@end

@implementation MTRWebRTCTransportProviderClusterWebRTCSessionStruct

- (MTRWebRTCTransportProviderClusterWebRTCSessionStruct)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTRWebRTCTransportProviderClusterWebRTCSessionStruct;
  v2 = [(MTRWebRTCTransportProviderClusterWebRTCSessionStruct *)&v12 init];
  v3 = v2;
  if (v2)
  {
    id = v2->_id;
    v2->_id = (NSNumber *)&unk_26F9C8620;

    peerNodeID = v3->_peerNodeID;
    v3->_peerNodeID = (NSNumber *)&unk_26F9C8620;

    peerFabricIndex = v3->_peerFabricIndex;
    v3->_peerFabricIndex = (NSNumber *)&unk_26F9C8620;

    streamType = v3->_streamType;
    v3->_streamType = (NSNumber *)&unk_26F9C8620;

    videoStreamID = v3->_videoStreamID;
    v3->_videoStreamID = 0;

    audioStreamID = v3->_audioStreamID;
    v3->_audioStreamID = 0;

    metadataOptions = v3->_metadataOptions;
    v3->_metadataOptions = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRWebRTCTransportProviderClusterWebRTCSessionStruct);
  v7 = objc_msgSend_id(self, v5, v6);
  objc_msgSend_setId_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_peerNodeID(self, v9, v10);
  objc_msgSend_setPeerNodeID_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_peerFabricIndex(self, v13, v14);
  objc_msgSend_setPeerFabricIndex_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_streamType(self, v17, v18);
  objc_msgSend_setStreamType_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_videoStreamID(self, v21, v22);
  objc_msgSend_setVideoStreamID_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_audioStreamID(self, v25, v26);
  objc_msgSend_setAudioStreamID_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_metadataOptions(self, v29, v30);
  objc_msgSend_setMetadataOptions_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: id:%@; peerNodeID:%@; peerFabricIndex:%@; streamType:%@; videoStreamID:%@; audioStreamID:%@; metadataOptions:%@; >",
    v5,
    self->_id,
    self->_peerNodeID,
    self->_peerFabricIndex,
    self->_streamType,
    self->_videoStreamID,
    self->_audioStreamID,
  v7 = self->_metadataOptions);

  return v7;
}

- (NSNumber)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
}

- (NSNumber)peerNodeID
{
  return self->_peerNodeID;
}

- (void)setPeerNodeID:(id)a3
{
}

- (NSNumber)peerFabricIndex
{
  return self->_peerFabricIndex;
}

- (void)setPeerFabricIndex:(id)a3
{
}

- (NSNumber)streamType
{
  return self->_streamType;
}

- (void)setStreamType:(id)a3
{
}

- (NSNumber)videoStreamID
{
  return self->_videoStreamID;
}

- (void)setVideoStreamID:(id)a3
{
}

- (NSNumber)audioStreamID
{
  return self->_audioStreamID;
}

- (void)setAudioStreamID:(id)a3
{
}

- (NSNumber)metadataOptions
{
  return self->_metadataOptions;
}

- (void)setMetadataOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataOptions, 0);
  objc_storeStrong((id *)&self->_audioStreamID, 0);
  objc_storeStrong((id *)&self->_videoStreamID, 0);
  objc_storeStrong((id *)&self->_streamType, 0);
  objc_storeStrong((id *)&self->_peerFabricIndex, 0);
  objc_storeStrong((id *)&self->_peerNodeID, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

@end