@interface CTAudioCodecInfo
+ (BOOL)supportsSecureCoding;
- (CTAudioCodecInfo)init;
- (CTAudioCodecInfo)initWithCallId:(unint64_t)a3 codec:(int64_t)a4 amrMode:(unint64_t)a5 evsBandwidth:(int64_t)a6 evsBitrate:(int64_t)a7;
- (CTAudioCodecInfo)initWithCallId:(unint64_t)a3 codec:(int64_t)a4 amrMode:(unint64_t)a5 evsBandwidth:(int64_t)a6 evsBitrate:(int64_t)a7 sampleRate:(unint64_t)a8 i2SClockRate:(unint64_t)a9;
- (CTAudioCodecInfo)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)codec;
- (int64_t)evsBandwidth;
- (int64_t)evsBitrate;
- (unint64_t)amrMode;
- (unint64_t)callId;
- (unint64_t)i2SClockRate;
- (unint64_t)sampleRate;
- (void)encodeWithCoder:(id)a3;
- (void)setAmrMode:(unint64_t)a3;
- (void)setCallId:(unint64_t)a3;
- (void)setCodec:(int64_t)a3;
- (void)setEvsBandwidth:(int64_t)a3;
- (void)setEvsBitrate:(int64_t)a3;
- (void)setI2SClockRate:(unint64_t)a3;
- (void)setSampleRate:(unint64_t)a3;
@end

@implementation CTAudioCodecInfo

- (CTAudioCodecInfo)initWithCallId:(unint64_t)a3 codec:(int64_t)a4 amrMode:(unint64_t)a5 evsBandwidth:(int64_t)a6 evsBitrate:(int64_t)a7
{
  return [(CTAudioCodecInfo *)self initWithCallId:a3 codec:a4 amrMode:a5 evsBandwidth:a6 evsBitrate:a7 sampleRate:0 i2SClockRate:0];
}

- (CTAudioCodecInfo)initWithCallId:(unint64_t)a3 codec:(int64_t)a4 amrMode:(unint64_t)a5 evsBandwidth:(int64_t)a6 evsBitrate:(int64_t)a7 sampleRate:(unint64_t)a8 i2SClockRate:(unint64_t)a9
{
  v16.receiver = self;
  v16.super_class = (Class)CTAudioCodecInfo;
  result = [(CTAudioCodecInfo *)&v16 init];
  if (result)
  {
    result->_callId = a3;
    result->_codec = a4;
    result->_amrMode = a5;
    result->_evsBandwidth = a6;
    result->_evsBitrate = a7;
    result->_sampleRate = a8;
    result->_i2SClockRate = a9;
  }
  return result;
}

- (CTAudioCodecInfo)init
{
  return [(CTAudioCodecInfo *)self initWithCallId:0 codec:0 amrMode:0 evsBandwidth:0 evsBitrate:0 sampleRate:0 i2SClockRate:0];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTAudioCodecInfo callId](self, "callId"));
  [v3 appendFormat:@" callId=%@", v4];

  int64_t v5 = [(CTAudioCodecInfo *)self codec];
  if ((unint64_t)(v5 - 1) > 4) {
    v6 = "kCTAudioCodecAMR_NB";
  }
  else {
    v6 = off_1E52629E8[v5 - 1];
  }
  objc_msgSend(v3, "appendFormat:", @" codec=%s", v6);
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTAudioCodecInfo amrMode](self, "amrMode"));
  [v3 appendFormat:@" amrMode=%@", v7];

  int64_t v8 = [(CTAudioCodecInfo *)self evsBandwidth];
  if ((unint64_t)(v8 - 1) > 2) {
    v9 = "kCTAudioCodecBandwidthEVS_NB";
  }
  else {
    v9 = off_1E5262A10[v8 - 1];
  }
  objc_msgSend(v3, "appendFormat:", @" evsBandwidth=%s", v9);
  int64_t v10 = [(CTAudioCodecInfo *)self evsBitrate];
  if ((unint64_t)(v10 - 1) > 0xA) {
    v11 = "kCTAudioCodecBitrateEVS_5900";
  }
  else {
    v11 = off_1E5262A28[v10 - 1];
  }
  objc_msgSend(v3, "appendFormat:", @" evsBitrate=%s", v11);
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTAudioCodecInfo sampleRate](self, "sampleRate"));
  [v3 appendFormat:@" sampleRate=%@", v12];

  v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CTAudioCodecInfo i2SClockRate](self, "i2SClockRate"));
  [v3 appendFormat:@" i2SClockRate=%@", v13];

  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCallId:codec:amrMode:evsBandwidth:evsBitrate:sampleRate:i2SClockRate:", -[CTAudioCodecInfo callId](self, "callId"), -[CTAudioCodecInfo codec](self, "codec"), -[CTAudioCodecInfo amrMode](self, "amrMode"), -[CTAudioCodecInfo evsBandwidth](self, "evsBandwidth"), -[CTAudioCodecInfo evsBitrate](self, "evsBitrate"), -[CTAudioCodecInfo sampleRate](self, "sampleRate"), -[CTAudioCodecInfo i2SClockRate](self, "i2SClockRate"));
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTAudioCodecInfo callId](self, "callId"), @"callId");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTAudioCodecInfo codec](self, "codec"), @"codecType");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTAudioCodecInfo amrMode](self, "amrMode"), @"amrMode");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTAudioCodecInfo evsBandwidth](self, "evsBandwidth"), @"evsBandwidth");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTAudioCodecInfo evsBitrate](self, "evsBitrate"), @"evsBitrate");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTAudioCodecInfo sampleRate](self, "sampleRate"), @"sampleRate");
  objc_msgSend(v4, "encodeInteger:forKey:", -[CTAudioCodecInfo i2SClockRate](self, "i2SClockRate"), @"i2SClockRate");
}

- (CTAudioCodecInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = -[CTAudioCodecInfo initWithCallId:codec:amrMode:evsBandwidth:evsBitrate:sampleRate:i2SClockRate:](self, "initWithCallId:codec:amrMode:evsBandwidth:evsBitrate:sampleRate:i2SClockRate:", [v4 decodeIntegerForKey:@"callId"], objc_msgSend(v4, "decodeIntegerForKey:", @"codecType"), objc_msgSend(v4, "decodeIntegerForKey:", @"amrMode"), objc_msgSend(v4, "decodeIntegerForKey:", @"evsBandwidth"), objc_msgSend(v4, "decodeIntegerForKey:", @"evsBitrate"), objc_msgSend(v4, "decodeIntegerForKey:", @"sampleRate"), objc_msgSend(v4, "decodeIntegerForKey:", @"i2SClockRate"));

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)callId
{
  return self->_callId;
}

- (void)setCallId:(unint64_t)a3
{
  self->_callId = a3;
}

- (int64_t)codec
{
  return self->_codec;
}

- (void)setCodec:(int64_t)a3
{
  self->_codec = a3;
}

- (unint64_t)amrMode
{
  return self->_amrMode;
}

- (void)setAmrMode:(unint64_t)a3
{
  self->_amrMode = a3;
}

- (int64_t)evsBandwidth
{
  return self->_evsBandwidth;
}

- (void)setEvsBandwidth:(int64_t)a3
{
  self->_evsBandwidth = a3;
}

- (int64_t)evsBitrate
{
  return self->_evsBitrate;
}

- (void)setEvsBitrate:(int64_t)a3
{
  self->_evsBitrate = a3;
}

- (unint64_t)sampleRate
{
  return self->_sampleRate;
}

- (void)setSampleRate:(unint64_t)a3
{
  self->_sampleRate = a3;
}

- (unint64_t)i2SClockRate
{
  return self->_i2SClockRate;
}

- (void)setI2SClockRate:(unint64_t)a3
{
  self->_i2SClockRate = a3;
}

@end