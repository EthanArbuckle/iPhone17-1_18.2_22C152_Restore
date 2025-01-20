@interface VCMediaNegotiatorMultiwayMediaStream
- (BOOL)hasRepairedStreamID;
- (BOOL)hasV2StreamID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSubstream;
- (id)copyWithZone:(_NSZone *)a3;
- (unsigned)maxMediaBitrate;
- (unsigned)maxNetworkBitrate;
- (unsigned)maxPacketsPerSecond;
- (unsigned)qualityIndex;
- (unsigned)repairedMaxNetworkBitrate;
- (unsigned)repairedStreamID;
- (unsigned)ssrc;
- (unsigned)streamID;
- (unsigned)v2StreamID;
- (void)setHasRepairedStreamID:(BOOL)a3;
- (void)setHasV2StreamID:(BOOL)a3;
- (void)setIsSubstream:(BOOL)a3;
- (void)setMaxMediaBitrate:(unsigned int)a3;
- (void)setMaxNetworkBitrate:(unsigned int)a3;
- (void)setMaxPacketsPerSecond:(unsigned int)a3;
- (void)setQualityIndex:(unsigned int)a3;
- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3;
- (void)setRepairedStreamID:(unsigned __int16)a3;
- (void)setSsrc:(unsigned int)a3;
- (void)setStreamID:(unsigned __int16)a3;
- (void)setV2StreamID:(unsigned __int16)a3;
@end

@implementation VCMediaNegotiatorMultiwayMediaStream

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    [v4 setSsrc:self->_ssrc];
    [v5 setMaxNetworkBitrate:self->_maxNetworkBitrate];
    [v5 setMaxMediaBitrate:self->_maxMediaBitrate];
    [v5 setMaxPacketsPerSecond:self->_maxPacketsPerSecond];
    [v5 setStreamID:self->_streamID];
    [v5 setIsSubstream:self->_isSubstream];
    [v5 setQualityIndex:self->_qualityIndex];
    [v5 setHasRepairedStreamID:self->_hasRepairedStreamID];
    [v5 setRepairedStreamID:self->_repairedStreamID];
    [v5 setRepairedMaxNetworkBitrate:self->_repairedMaxNetworkBitrate];
    [v5 setV2StreamID:self->_v2StreamID];
    [v5 setHasV2StreamID:self->_hasV2StreamID];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if ([a3 ssrc] != self->_ssrc) {
    return 0;
  }
  if ([a3 maxNetworkBitrate] != self->_maxNetworkBitrate) {
    return 0;
  }
  if ([a3 maxMediaBitrate] != self->_maxMediaBitrate) {
    return 0;
  }
  if ([a3 maxPacketsPerSecond] != self->_maxPacketsPerSecond) {
    return 0;
  }
  if ([a3 streamID] != self->_streamID) {
    return 0;
  }
  if (self->_isSubstream != [a3 isSubstream]) {
    return 0;
  }
  if ([a3 qualityIndex] != self->_qualityIndex) {
    return 0;
  }
  if ([a3 v2StreamID] != self->_v2StreamID) {
    return 0;
  }
  if (self->_hasV2StreamID != [a3 hasV2StreamID]) {
    return 0;
  }
  int v5 = [a3 hasRepairedStreamID];
  int hasRepairedStreamID = self->_hasRepairedStreamID;
  if (hasRepairedStreamID != v5) {
    return 0;
  }
  if (self->_hasV2StreamID)
  {
    if ([a3 v2StreamID] != self->_v2StreamID) {
      return 0;
    }
    int hasRepairedStreamID = self->_hasRepairedStreamID;
  }
  return !hasRepairedStreamID
      || [a3 repairedStreamID] == self->_repairedStreamID
      && [a3 repairedMaxNetworkBitrate] == self->_repairedMaxNetworkBitrate;
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

- (void)setMaxNetworkBitrate:(unsigned int)a3
{
  self->_maxNetworkBitrate = a3;
}

- (unsigned)maxMediaBitrate
{
  return self->_maxMediaBitrate;
}

- (void)setMaxMediaBitrate:(unsigned int)a3
{
  self->_maxMediaBitrate = a3;
}

- (unsigned)maxPacketsPerSecond
{
  return self->_maxPacketsPerSecond;
}

- (void)setMaxPacketsPerSecond:(unsigned int)a3
{
  self->_maxPacketsPerSecond = a3;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (void)setStreamID:(unsigned __int16)a3
{
  self->_streamID = a3;
}

- (BOOL)isSubstream
{
  return self->_isSubstream;
}

- (void)setIsSubstream:(BOOL)a3
{
  self->_isSubstream = a3;
}

- (unsigned)qualityIndex
{
  return self->_qualityIndex;
}

- (void)setQualityIndex:(unsigned int)a3
{
  self->_qualityIndex = a3;
}

- (BOOL)hasRepairedStreamID
{
  return self->_hasRepairedStreamID;
}

- (void)setHasRepairedStreamID:(BOOL)a3
{
  self->_int hasRepairedStreamID = a3;
}

- (unsigned)repairedStreamID
{
  return self->_repairedStreamID;
}

- (void)setRepairedStreamID:(unsigned __int16)a3
{
  self->_repairedStreamID = a3;
}

- (unsigned)repairedMaxNetworkBitrate
{
  return self->_repairedMaxNetworkBitrate;
}

- (void)setRepairedMaxNetworkBitrate:(unsigned int)a3
{
  self->_repairedMaxNetworkBitrate = a3;
}

- (unsigned)v2StreamID
{
  return self->_v2StreamID;
}

- (void)setV2StreamID:(unsigned __int16)a3
{
  self->_v2StreamID = a3;
}

- (BOOL)hasV2StreamID
{
  return self->_hasV2StreamID;
}

- (void)setHasV2StreamID:(BOOL)a3
{
  self->_hasV2StreamID = a3;
}

@end