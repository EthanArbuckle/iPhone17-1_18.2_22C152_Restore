@interface VCMediaNegotiatorStreamGroupCodecConfiguration
- (BOOL)H264LevelAsymmetryAllowed;
- (BOOL)H264PacketizationMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)rtcpPSFB_FIREnabled;
- (BOOL)rtcpPSFB_PLIEnabled;
- (BOOL)rtcpRTPFB_GNACKEnabled;
- (BOOL)rtcpSREnabled;
- (BOOL)useInBandFEC;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)codecType;
- (unint64_t)pTime;
- (unint64_t)profileLevelId;
- (unint64_t)serializedSize;
- (unsigned)cipherSuite;
- (unsigned)encoderUsage;
- (unsigned)rtpPayload;
- (void)setCipherSuite:(unsigned int)a3;
- (void)setCodecType:(int64_t)a3;
- (void)setEncoderUsage:(unsigned int)a3;
- (void)setH264LevelAsymmetryAllowed:(BOOL)a3;
- (void)setH264PacketizationMode:(BOOL)a3;
- (void)setPTime:(unint64_t)a3;
- (void)setProfileLevelId:(unint64_t)a3;
- (void)setRtcpPSFB_FIREnabled:(BOOL)a3;
- (void)setRtcpPSFB_PLIEnabled:(BOOL)a3;
- (void)setRtcpRTPFB_GNACKEnabled:(BOOL)a3;
- (void)setRtcpSREnabled:(BOOL)a3;
- (void)setRtpPayload:(unsigned int)a3;
- (void)setSerializedSize:(unint64_t)a3;
- (void)setUseInBandFEC:(BOOL)a3;
@end

@implementation VCMediaNegotiatorStreamGroupCodecConfiguration

- (id)description
{
  v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"codecType=%ld, rtpPayload=%d, cipherSuite=%d", self->_codecType, self->_rtpPayload, self->_cipherSuite];
  v4 = v3;
  if (self->_pTime) {
    [v3 appendFormat:@", pTime=%ld", self->_pTime];
  }
  if (self->_useInBandFEC) {
    [v4 appendFormat:@", useInBandFEC"];
  }
  v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  v6 = v5;
  if (self->_rtcpSREnabled) {
    [v5 addObject:@"SR"];
  }
  if (self->_rtcpPSFB_PLIEnabled) {
    [v6 addObject:@"PLI"];
  }
  if (self->_rtcpPSFB_FIREnabled) {
    [v6 addObject:@"FIR"];
  }
  if (self->_rtcpRTPFB_GNACKEnabled) {
    [v6 addObject:@"GNACK"];
  }
  if ([v6 count]) {
    [v4 appendFormat:@", rtcp=[%@]", objc_msgSend(v6, "componentsJoinedByString:", @","];
  }
  if (self->_encoderUsage) {
    [v4 appendFormat:@", encoderUsage=%u", self->_encoderUsage];
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) != 0
      && [a3 codecType] == self->_codecType
      && [a3 rtpPayload] == self->_rtpPayload
      && [a3 pTime] == self->_pTime
      && self->_rtcpRTPFB_GNACKEnabled == objc_msgSend(a3, "rtcpRTPFB_GNACKEnabled")
      && self->_rtcpPSFB_PLIEnabled == objc_msgSend(a3, "rtcpPSFB_PLIEnabled")
      && self->_rtcpPSFB_FIREnabled == objc_msgSend(a3, "rtcpPSFB_FIREnabled")
      && self->_rtcpSREnabled == [a3 rtcpSREnabled]
      && self->_H264PacketizationMode == [a3 H264PacketizationMode]
      && self->_H264LevelAsymmetryAllowed == [a3 H264LevelAsymmetryAllowed]
      && self->_useInBandFEC == [a3 useInBandFEC]
      && [a3 profileLevelId] == self->_profileLevelId
      && [a3 cipherSuite] == self->_cipherSuite
      && [a3 encoderUsage] == self->_encoderUsage;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    [v4 setCodecType:self->_codecType];
    [v5 setRtpPayload:self->_rtpPayload];
    [v5 setPTime:self->_pTime];
    objc_msgSend(v5, "setRtcpRTPFB_GNACKEnabled:", self->_rtcpRTPFB_GNACKEnabled);
    objc_msgSend(v5, "setRtcpPSFB_PLIEnabled:", self->_rtcpPSFB_PLIEnabled);
    objc_msgSend(v5, "setRtcpPSFB_FIREnabled:", self->_rtcpPSFB_FIREnabled);
    [v5 setRtcpSREnabled:self->_rtcpSREnabled];
    [v5 setH264LevelAsymmetryAllowed:self->_H264LevelAsymmetryAllowed];
    [v5 setH264PacketizationMode:self->_H264PacketizationMode];
    [v5 setUseInBandFEC:self->_useInBandFEC];
    [v5 setProfileLevelId:self->_profileLevelId];
    [v5 setSerializedSize:self->_serializedSize];
    [v5 setCipherSuite:self->_cipherSuite];
    [v5 setEncoderUsage:self->_encoderUsage];
  }
  return v5;
}

- (int64_t)codecType
{
  return self->_codecType;
}

- (void)setCodecType:(int64_t)a3
{
  self->_codecType = a3;
}

- (unsigned)rtpPayload
{
  return self->_rtpPayload;
}

- (void)setRtpPayload:(unsigned int)a3
{
  self->_rtpPayload = a3;
}

- (unint64_t)pTime
{
  return self->_pTime;
}

- (void)setPTime:(unint64_t)a3
{
  self->_pTime = a3;
}

- (BOOL)rtcpRTPFB_GNACKEnabled
{
  return self->_rtcpRTPFB_GNACKEnabled;
}

- (void)setRtcpRTPFB_GNACKEnabled:(BOOL)a3
{
  self->_rtcpRTPFB_GNACKEnabled = a3;
}

- (BOOL)rtcpPSFB_PLIEnabled
{
  return self->_rtcpPSFB_PLIEnabled;
}

- (void)setRtcpPSFB_PLIEnabled:(BOOL)a3
{
  self->_rtcpPSFB_PLIEnabled = a3;
}

- (BOOL)rtcpPSFB_FIREnabled
{
  return self->_rtcpPSFB_FIREnabled;
}

- (void)setRtcpPSFB_FIREnabled:(BOOL)a3
{
  self->_rtcpPSFB_FIREnabled = a3;
}

- (BOOL)rtcpSREnabled
{
  return self->_rtcpSREnabled;
}

- (void)setRtcpSREnabled:(BOOL)a3
{
  self->_rtcpSREnabled = a3;
}

- (BOOL)H264LevelAsymmetryAllowed
{
  return self->_H264LevelAsymmetryAllowed;
}

- (void)setH264LevelAsymmetryAllowed:(BOOL)a3
{
  self->_H264LevelAsymmetryAllowed = a3;
}

- (BOOL)H264PacketizationMode
{
  return self->_H264PacketizationMode;
}

- (void)setH264PacketizationMode:(BOOL)a3
{
  self->_H264PacketizationMode = a3;
}

- (BOOL)useInBandFEC
{
  return self->_useInBandFEC;
}

- (void)setUseInBandFEC:(BOOL)a3
{
  self->_useInBandFEC = a3;
}

- (unint64_t)profileLevelId
{
  return self->_profileLevelId;
}

- (void)setProfileLevelId:(unint64_t)a3
{
  self->_profileLevelId = a3;
}

- (unint64_t)serializedSize
{
  return self->_serializedSize;
}

- (void)setSerializedSize:(unint64_t)a3
{
  self->_serializedSize = a3;
}

- (unsigned)cipherSuite
{
  return self->_cipherSuite;
}

- (void)setCipherSuite:(unsigned int)a3
{
  self->_cipherSuite = a3;
}

- (unsigned)encoderUsage
{
  return self->_encoderUsage;
}

- (void)setEncoderUsage:(unsigned int)a3
{
  self->_encoderUsage = a3;
}

@end