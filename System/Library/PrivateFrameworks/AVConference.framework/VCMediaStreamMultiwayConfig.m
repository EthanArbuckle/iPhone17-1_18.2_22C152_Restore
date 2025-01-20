@interface VCMediaStreamMultiwayConfig
- (BOOL)hasIdsStreamID;
- (BOOL)hasMaxIDSStreamIdCount;
- (BOOL)hasMaxMediaBitrate;
- (BOOL)hasMaxNetworkBitrate;
- (BOOL)hasMaxPacketsPerSecond;
- (BOOL)hasQualityIndex;
- (BOOL)hasRepairedMaxNetworkBitrate;
- (BOOL)hasRepairedStreamID;
- (BOOL)hasV2StreamID;
- (BOOL)isOneToOne;
- (BOOL)shouldIgnoreRTPHeaderExtensions;
- (BOOL)startOnDemand;
- (NSArray)streamIds;
- (NSDictionary)rxPayloadMap;
- (NSDictionary)txPayloadMap;
- (NSString)participantId;
- (NSString)sessionId;
- (VCMediaStreamMultiwayConfig)init;
- (float)maxPacketsPerSecond;
- (int)repairedFECLevel;
- (unint64_t)remoteIDSParticipantID;
- (unsigned)idsStreamID;
- (unsigned)maxIDSStreamIdCount;
- (unsigned)maxMediaBitrate;
- (unsigned)maxNetworkBitrate;
- (unsigned)negotiationProtocolMask;
- (unsigned)qualityIndex;
- (unsigned)repairedMaxNetworkBitrate;
- (unsigned)repairedStreamID;
- (unsigned)ssrc;
- (unsigned)streamGroupID;
- (unsigned)v2StreamID;
- (void)addRxPayloadType:(int)a3 networkPayload:(unsigned int)a4;
- (void)addTxPayloadType:(int)a3 networkPayload:(unsigned int)a4;
- (void)dealloc;
- (void)setIdsStreamID:(unsigned __int16)a3;
- (void)setIsOneToOne:(BOOL)a3;
- (void)setMaxIDSStreamIdCount:(unsigned int)a3;
- (void)setMaxMediaBitrate:(unsigned int)a3;
- (void)setMaxNetworkBitrate:(unsigned int)a3;
- (void)setMaxPacketsPerSecond:(float)a3;
- (void)setNegotiationProtocolMask:(unsigned int)a3;
- (void)setParticipantId:(id)a3;
- (void)setQualityIndex:(unsigned int)a3;
- (void)setRemoteIDSParticipantID:(unint64_t)a3;
- (void)setRepairedFECLevel:(int)a3;
- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3;
- (void)setRepairedStreamID:(unsigned __int16)a3;
- (void)setSessionId:(id)a3;
- (void)setShouldIgnoreRTPHeaderExtensions:(BOOL)a3;
- (void)setSsrc:(unsigned int)a3;
- (void)setStartOnDemand:(BOOL)a3;
- (void)setStreamGroupID:(unsigned int)a3;
- (void)setV2StreamID:(unsigned __int16)a3;
@end

@implementation VCMediaStreamMultiwayConfig

- (VCMediaStreamMultiwayConfig)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCMediaStreamMultiwayConfig;
  v2 = [(VCMediaStreamMultiwayConfig *)&v4 init];
  if (v2)
  {
    v2->_txPayloadMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_rxPayloadMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaStreamMultiwayConfig;
  [(VCMediaStreamMultiwayConfig *)&v3 dealloc];
}

- (NSArray)streamIds
{
  objc_super v3 = (NSArray *)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObject:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", self->_idsStreamID));
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) != 0)
  {
    -[NSArray addObject:](v3, "addObject:", [NSNumber numberWithUnsignedShort:self->_repairedStreamID]);
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0) {
    -[NSArray addObject:](v3, "addObject:", [NSNumber numberWithUnsignedShort:self->_v2StreamID]);
  }
  return v3;
}

- (void)setMaxNetworkBitrate:(unsigned int)a3
{
  self->_maxNetworkBitrate = a3;
  *(_WORD *)&self->_has |= 1u;
}

- (BOOL)hasMaxNetworkBitrate
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setMaxMediaBitrate:(unsigned int)a3
{
  self->_maxMediaBitrate = a3;
  *(_WORD *)&self->_has |= 2u;
}

- (BOOL)hasMaxMediaBitrate
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setMaxPacketsPerSecond:(float)a3
{
  self->_maxPacketsPerSecond = a3;
  *(_WORD *)&self->_has |= 4u;
}

- (BOOL)hasMaxPacketsPerSecond
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setIdsStreamID:(unsigned __int16)a3
{
  self->_idsStreamID = a3;
  *(_WORD *)&self->_has |= 8u;
}

- (BOOL)hasIdsStreamID
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setV2StreamID:(unsigned __int16)a3
{
  self->_v2StreamID = a3;
  *(_WORD *)&self->_has |= 0x100u;
}

- (BOOL)hasV2StreamID
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setQualityIndex:(unsigned int)a3
{
  self->_qualityIndex = a3;
  *(_WORD *)&self->_has |= 0x10u;
}

- (BOOL)hasQualityIndex
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setMaxIDSStreamIdCount:(unsigned int)a3
{
  self->_maxIDSStreamIdCount = a3;
  *(_WORD *)&self->_has |= 0x20u;
}

- (BOOL)hasMaxIDSStreamIdCount
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRepairedStreamID:(unsigned __int16)a3
{
  self->_repairedStreamID = a3;
  *(_WORD *)&self->_has |= 0x40u;
}

- (BOOL)hasRepairedStreamID
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3
{
  self->_repairedMaxNetworkBitrate = a3;
  *(_WORD *)&self->_has |= 0x80u;
}

- (BOOL)hasRepairedMaxNetworkBitrate
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)addRxPayloadType:(int)a3 networkPayload:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = [NSNumber numberWithUnsignedInt:*(void *)&a4];
  rxPayloadMap = self->_rxPayloadMap;
  uint64_t v8 = [NSNumber numberWithUnsignedInt:v4];

  [(NSMutableDictionary *)rxPayloadMap setObject:v6 forKeyedSubscript:v8];
}

- (void)addTxPayloadType:(int)a3 networkPayload:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v6 = [NSNumber numberWithUnsignedInt:*(void *)&a4];
  txPayloadMap = self->_txPayloadMap;
  uint64_t v8 = [NSNumber numberWithUnsignedInt:v4];

  [(NSMutableDictionary *)txPayloadMap setObject:v6 forKeyedSubscript:v8];
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (NSString)participantId
{
  return self->_participantId;
}

- (void)setParticipantId:(id)a3
{
}

- (unint64_t)remoteIDSParticipantID
{
  return self->_remoteIDSParticipantID;
}

- (void)setRemoteIDSParticipantID:(unint64_t)a3
{
  self->_remoteIDSParticipantID = a3;
}

- (unsigned)ssrc
{
  return self->_ssrc;
}

- (void)setSsrc:(unsigned int)a3
{
  self->_ssrc = a3;
}

- (unsigned)maxNetworkBitrate
{
  return self->_maxNetworkBitrate;
}

- (unsigned)maxMediaBitrate
{
  return self->_maxMediaBitrate;
}

- (float)maxPacketsPerSecond
{
  return self->_maxPacketsPerSecond;
}

- (unsigned)idsStreamID
{
  return self->_idsStreamID;
}

- (unsigned)qualityIndex
{
  return self->_qualityIndex;
}

- (unsigned)maxIDSStreamIdCount
{
  return self->_maxIDSStreamIdCount;
}

- (unsigned)repairedStreamID
{
  return self->_repairedStreamID;
}

- (unsigned)repairedMaxNetworkBitrate
{
  return self->_repairedMaxNetworkBitrate;
}

- (BOOL)startOnDemand
{
  return self->_startOnDemand;
}

- (void)setStartOnDemand:(BOOL)a3
{
  self->_startOnDemand = a3;
}

- (BOOL)isOneToOne
{
  return self->_isOneToOne;
}

- (void)setIsOneToOne:(BOOL)a3
{
  self->_isOneToOne = a3;
}

- (BOOL)shouldIgnoreRTPHeaderExtensions
{
  return self->_shouldIgnoreRTPHeaderExtensions;
}

- (void)setShouldIgnoreRTPHeaderExtensions:(BOOL)a3
{
  self->_shouldIgnoreRTPHeaderExtensions = a3;
}

- (unsigned)streamGroupID
{
  return self->_streamGroupID;
}

- (void)setStreamGroupID:(unsigned int)a3
{
  self->_streamGroupID = a3;
}

- (unsigned)negotiationProtocolMask
{
  return self->_negotiationProtocolMask;
}

- (void)setNegotiationProtocolMask:(unsigned int)a3
{
  self->_negotiationProtocolMask = a3;
}

- (int)repairedFECLevel
{
  return self->_repairedFECLevel;
}

- (void)setRepairedFECLevel:(int)a3
{
  self->_repairedFECLevel = a3;
}

- (unsigned)v2StreamID
{
  return self->_v2StreamID;
}

- (NSDictionary)rxPayloadMap
{
  return &self->_rxPayloadMap->super;
}

- (NSDictionary)txPayloadMap
{
  return &self->_txPayloadMap->super;
}

@end