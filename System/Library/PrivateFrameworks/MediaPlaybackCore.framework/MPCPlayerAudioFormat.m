@interface MPCPlayerAudioFormat
+ (id)lossyHighQualityStereoFormat;
+ (id)lossyLowQualityStereoFormat;
+ (id)payloadValueFromJSONValue:(id)a3;
- (BOOL)_isBinauralFormat:(id)a3;
- (BOOL)_isDerivedFromSpatialFormat:(id)a3;
- (BOOL)_isHLSVersion:(id)a3 greatherThanOrEqualTo:(id)a4;
- (BOOL)_isMultichannelFormat:(id)a3;
- (BOOL)_isSpatialFormat:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMultiChannel;
- (BOOL)isSpatialized;
- (MPCPlayerAudioFormat)audioFormatWithRenderingMode:(int64_t)a3;
- (MPCPlayerAudioFormat)initWithDictionaryRepresentation:(id)a3;
- (MPCPlayerAudioFormat)initWithJSONDictionaryRepresentation:(id)a3 stableVariantID:(id)a4;
- (MPCPlayerAudioFormat)initWithNowPlayingInfoAudioFormat:(id)a3;
- (MPCPlayerAudioFormat)initWithTier:(int64_t)a3 codec:(unsigned int)a4 spatialized:(BOOL)a5 multiChannel:(BOOL)a6 channelLayout:(unsigned int)a7 sampleRate:(int64_t)a8 stableVariantID:(id)a9;
- (MPNowPlayingInfoAudioFormat)nowPlayingAudioFormat;
- (NSDictionary)dictionaryRepresentation;
- (NSString)audioChannelLayoutDescription;
- (NSString)debugBitDepthDescription;
- (NSString)debugBitRateDescription;
- (NSString)debugChannelCountDescription;
- (NSString)debugChannelLayoutDescription;
- (NSString)debugCodecDescription;
- (NSString)debugSampleRateDescription;
- (NSString)debugTierDescription;
- (NSString)description;
- (NSString)groupID;
- (NSString)humanDescription;
- (NSString)stableVariantID;
- (id)_descriptionForChannelLayoutTag:(unsigned int)a3;
- (id)analyticsFormatInfo;
- (id)debugOriginChannelCountDescription;
- (id)debugOriginChannelLayoutDescription;
- (int64_t)_computedTierFromHLSDataWithChannelCount:(int64_t)a3;
- (int64_t)bitDepth;
- (int64_t)bitrate;
- (int64_t)renderingMode;
- (int64_t)sampleRate;
- (int64_t)tier;
- (unsigned)_computedChannelLayoutTagFromHLSData:(id)a3 channelCount:(int64_t)a4;
- (unsigned)channelLayout;
- (unsigned)codec;
- (unsigned)originChannelLayout;
- (void)setOriginChannelLayout:(unsigned int)a3;
@end

@implementation MPCPlayerAudioFormat

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stableVariantID, 0);
  objc_storeStrong((id *)&self->_groupID, 0);

  objc_storeStrong((id *)&self->_audioChannelLayoutDescription, 0);
}

- (NSString)stableVariantID
{
  return self->_stableVariantID;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (void)setOriginChannelLayout:(unsigned int)a3
{
  self->_originChannelLayout = a3;
}

- (unsigned)originChannelLayout
{
  return self->_originChannelLayout;
}

- (NSString)audioChannelLayoutDescription
{
  return self->_audioChannelLayoutDescription;
}

- (unsigned)channelLayout
{
  return self->_channelLayout;
}

- (int64_t)renderingMode
{
  return self->_renderingMode;
}

- (BOOL)isMultiChannel
{
  return self->_multiChannel;
}

- (BOOL)isSpatialized
{
  return self->_spatialized;
}

- (unsigned)codec
{
  return self->_codec;
}

- (int64_t)bitDepth
{
  return self->_bitDepth;
}

- (int64_t)sampleRate
{
  return self->_sampleRate;
}

- (int64_t)bitrate
{
  return self->_bitrate;
}

- (int64_t)tier
{
  return self->_tier;
}

- (id)analyticsFormatInfo
{
  v3 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:5];
  if ([(MPCPlayerAudioFormat *)self bitrate])
  {
    v4 = [(MPCPlayerAudioFormat *)self debugBitRateDescription];
    [v3 setObject:v4 forKeyedSubscript:@"bitrate"];
  }
  if ([(MPCPlayerAudioFormat *)self codec])
  {
    v5 = [(MPCPlayerAudioFormat *)self debugCodecDescription];
    [v3 setObject:v5 forKeyedSubscript:@"codec"];
  }
  if ([(MPCPlayerAudioFormat *)self bitDepth])
  {
    v6 = [(MPCPlayerAudioFormat *)self debugBitDepthDescription];
    [v3 setObject:v6 forKeyedSubscript:@"bitDepth"];
  }
  if ([(MPCPlayerAudioFormat *)self channelLayout] != -1
    && [(MPCPlayerAudioFormat *)self channelLayout])
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", (unsigned __int16)-[MPCPlayerAudioFormat channelLayout](self, "channelLayout"));
    [v3 setObject:v7 forKeyedSubscript:@"channelCount"];

    v8 = [(MPCPlayerAudioFormat *)self debugChannelLayoutDescription];
    [v3 setObject:v8 forKeyedSubscript:@"layout"];
  }
  if ([(MPCPlayerAudioFormat *)self sampleRate])
  {
    v9 = [(MPCPlayerAudioFormat *)self debugSampleRateDescription];
    [v3 setObject:v9 forKeyedSubscript:@"sampleRate"];
  }

  return v3;
}

- (id)_descriptionForChannelLayoutTag:(unsigned int)a3
{
  id result = @"unknown";
  if ((int)a3 > 8323079)
  {
    if ((int)a3 > 12648463)
    {
      signed int v4 = 12779529;
      v12 = @"7.1.2";
      if (a3 != 12845066) {
        v12 = @"unknown";
      }
      if (a3 == 12779530) {
        v6 = @"5.1.4";
      }
      else {
        v6 = v12;
      }
      v7 = @"9.1.6";
      BOOL v8 = a3 == 12713992;
      v9 = @"5.1.2";
      int v10 = 12648464;
    }
    else
    {
      signed int v4 = 11796488;
      v5 = @"7.1.4";
      if (a3 != 12582924) {
        v5 = @"unknown";
      }
      if (a3 == 11796489) {
        v6 = @"8.1";
      }
      else {
        v6 = v5;
      }
      v7 = @"7.1";
      BOOL v8 = a3 == 9306119;
      v9 = @"6.1";
      int v10 = 8323080;
    }
    goto LABEL_26;
  }
  if ((int)a3 > 7471106)
  {
    signed int v4 = 7864324;
    v11 = @"5.1";
    if (a3 != 8126470) {
      v11 = @"unknown";
    }
    if (a3 == 7864325) {
      v6 = @"5.0";
    }
    else {
      v6 = v11;
    }
    v7 = @"3.0";
    BOOL v8 = a3 == 7602180;
    v9 = @"4.0";
    int v10 = 7471107;
LABEL_26:
    if (!v8) {
      v9 = @"unknown";
    }
    if (a3 != v10) {
      v7 = v9;
    }
    if ((int)a3 <= v4) {
      return v7;
    }
    else {
      return v6;
    }
  }
  if ((int)a3 > 6684673)
  {
    if (a3 != 6684674)
    {
      if (a3 == 6946818) {
        return @"Binaural";
      }
      return result;
    }
    return @"Stereo";
  }
  if (a3 == 6553601) {
    return @"Mono";
  }
  if (a3 == 6619138) {
    return @"Stereo";
  }
  return result;
}

- (BOOL)_isHLSVersion:(id)a3 greatherThanOrEqualTo:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 compare:v6]) {
    BOOL v7 = [v5 compare:v6] == 1;
  }
  else {
    BOOL v7 = 1;
  }

  return v7;
}

- (unsigned)_computedChannelLayoutTagFromHLSData:(id)a3 channelCount:(int64_t)a4
{
  id v6 = a3;
  if ([(MPCPlayerAudioFormat *)self _isSpatialFormat:v6])
  {
    if (a4 < 3) {
      goto LABEL_8;
    }
LABEL_6:
    if ((unint64_t)(a4 - 3) >= 0xE) {
LABEL_12:
    }
      unsigned int v8 = 6619138;
    else {
      unsigned int v8 = dword_21BEF193C[a4 - 3];
    }
    goto LABEL_13;
  }
  BOOL v7 = [(MPCPlayerAudioFormat *)self _isDerivedFromSpatialFormat:v6];
  if (a4 >= 3 && v7) {
    goto LABEL_6;
  }
LABEL_8:
  int64_t v9 = a4 - 1;
  unsigned int v8 = 6553601;
  switch(v9)
  {
    case 0:
      break;
    case 1:
      if ([(MPCPlayerAudioFormat *)self _isBinauralFormat:v6]) {
        unsigned int v8 = 6946818;
      }
      else {
        unsigned int v8 = 6619138;
      }
      break;
    case 2:
      unsigned int v8 = 7471107;
      break;
    case 3:
      unsigned int v8 = 7602180;
      break;
    case 4:
      unsigned int v8 = 7864325;
      break;
    case 5:
      unsigned int v8 = 8126470;
      break;
    case 6:
      unsigned int v8 = 9306119;
      break;
    case 7:
      unsigned int v8 = 8323080;
      break;
    case 8:
      unsigned int v8 = 11796489;
      break;
    default:
      goto LABEL_12;
  }
LABEL_13:

  return v8;
}

- (int64_t)_computedTierFromHLSDataWithChannelCount:(int64_t)a3
{
  if (self->_codec == 1634492771)
  {
    if (self->_sampleRate < 48001) {
      return 2;
    }
    else {
      return 3;
    }
  }
  else if (!self->_spatialized && a3 <= 2)
  {
    return self->_bitrate > 128000;
  }
  else
  {
    return 4;
  }
}

- (BOOL)_isBinauralFormat:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"CHANNEL-USAGE"];
  char v4 = [v3 isEqualToString:@"BINAURAL"];

  return v4;
}

- (BOOL)_isDerivedFromSpatialFormat:(id)a3
{
  v3 = [a3 objectForKeyedSubscript:@"ORIGIN-IS-ATMOS"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)_isMultichannelFormat:(id)a3
{
  id v3 = a3;
  char v4 = [v3 objectForKeyedSubscript:@"CHANNEL-COUNT"];
  uint64_t v5 = [v4 integerValue];

  id v6 = [v3 objectForKeyedSubscript:@"ORIGIN-CHANNEL-COUNT"];

  uint64_t v7 = [v6 integerValue];
  BOOL v8 = v5 == 2;
  if (v7 <= 2) {
    BOOL v8 = 0;
  }
  BOOL v9 = v5 > 2 || v8;

  return v9;
}

- (BOOL)_isSpatialFormat:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"IS-ATMOS"];
  char v6 = [v5 BOOLValue];

  LOBYTE(self) = [(MPCPlayerAudioFormat *)self _isDerivedFromSpatialFormat:v4];
  return v6 | self;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MPCPlayerAudioFormat *)a3;
  if (self == v4)
  {
    BOOL v15 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      uint64_t v6 = [(MPCPlayerAudioFormat *)v5 tier];
      if (v6 == [(MPCPlayerAudioFormat *)self tier]
        && (uint64_t v7 = [(MPCPlayerAudioFormat *)v5 bitrate], v7 == [(MPCPlayerAudioFormat *)self bitrate])
        && (uint64_t v8 = [(MPCPlayerAudioFormat *)v5 sampleRate],
            v8 == [(MPCPlayerAudioFormat *)self sampleRate])
        && (uint64_t v9 = [(MPCPlayerAudioFormat *)v5 bitDepth],
            v9 == [(MPCPlayerAudioFormat *)self bitDepth])
        && (unsigned int v10 = [(MPCPlayerAudioFormat *)v5 codec], v10 == [(MPCPlayerAudioFormat *)self codec])
        && (BOOL v11 = [(MPCPlayerAudioFormat *)v5 isSpatialized],
            v11 == [(MPCPlayerAudioFormat *)self isSpatialized])
        && (BOOL v12 = [(MPCPlayerAudioFormat *)v5 isMultiChannel],
            v12 == [(MPCPlayerAudioFormat *)self isMultiChannel])
        && (unsigned int v13 = [(MPCPlayerAudioFormat *)v5 channelLayout],
            v13 == [(MPCPlayerAudioFormat *)self channelLayout]))
      {
        uint64_t v14 = [(MPCPlayerAudioFormat *)v5 renderingMode];
        BOOL v15 = v14 == [(MPCPlayerAudioFormat *)self renderingMode];
      }
      else
      {
        BOOL v15 = 0;
      }
    }
    else
    {
      BOOL v15 = 0;
    }
  }

  return v15;
}

- (id)debugOriginChannelLayoutDescription
{
  return [(MPCPlayerAudioFormat *)self _descriptionForChannelLayoutTag:self->_originChannelLayout];
}

- (NSString)debugChannelLayoutDescription
{
  return self->_audioChannelLayoutDescription;
}

- (id)debugOriginChannelCountDescription
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%d", LOWORD(self->_originChannelLayout));
}

- (NSString)debugChannelCountDescription
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%d", LOWORD(self->_channelLayout));
}

- (NSString)debugCodecDescription
{
  unsigned int v2 = bswap32(self->_codec);
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%c%c%c%c", v2, BYTE1(v2), BYTE2(v2), HIBYTE(v2));
  id v4 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  uint64_t v5 = [v3 stringByTrimmingCharactersInSet:v4];

  return (NSString *)v5;
}

- (NSString)debugSampleRateDescription
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%ldkhz", self->_sampleRate / 1000);
}

- (NSString)debugBitDepthDescription
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%d-bit", self->_bitDepth);
}

- (NSString)debugBitRateDescription
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"%ldkbps", self->_bitrate / 1000);
}

- (NSString)debugTierDescription
{
  return (NSString *)NSStringFromMPCPlayerAudioFormatTier(self->_tier);
}

- (NSString)humanDescription
{
  id v3 = [MEMORY[0x263EFF980] arrayWithCapacity:8];
  id v4 = NSString;
  uint64_t v5 = [(MPCPlayerAudioFormat *)self debugTierDescription];
  uint64_t v6 = [v4 stringWithFormat:@"tier: %@", v5];
  [v3 addObject:v6];

  if (self->_bitrate)
  {
    uint64_t v7 = NSString;
    uint64_t v8 = [(MPCPlayerAudioFormat *)self debugBitRateDescription];
    uint64_t v9 = [v7 stringWithFormat:@"bitrate: %@", v8];
    [v3 addObject:v9];
  }
  if (self->_groupID)
  {
    unsigned int v10 = [NSString stringWithFormat:@"groupID: %@", self->_groupID];
    [v3 addObject:v10];
  }
  if (self->_bitDepth)
  {
    BOOL v11 = NSString;
    BOOL v12 = [(MPCPlayerAudioFormat *)self debugBitDepthDescription];
    unsigned int v13 = [v11 stringWithFormat:@"bitDepth: %@", v12];
    [v3 addObject:v13];
  }
  if (self->_sampleRate)
  {
    uint64_t v14 = NSString;
    BOOL v15 = [(MPCPlayerAudioFormat *)self debugSampleRateDescription];
    v16 = [v14 stringWithFormat:@"sampleRate: %@", v15];
    [v3 addObject:v16];
  }
  if (self->_codec)
  {
    v17 = NSString;
    v18 = [(MPCPlayerAudioFormat *)self debugCodecDescription];
    v19 = [v17 stringWithFormat:@"codec: %@", v18];
    [v3 addObject:v19];
  }
  unsigned int channelLayout = self->_channelLayout;
  if (channelLayout != -65536 && channelLayout)
  {
    v21 = NSString;
    v22 = [(MPCPlayerAudioFormat *)self debugChannelCountDescription];
    v23 = [v21 stringWithFormat:@"channels: %@", v22];
    [v3 addObject:v23];
  }
  if (self->_audioChannelLayoutDescription)
  {
    v24 = NSString;
    v25 = [(MPCPlayerAudioFormat *)self debugChannelLayoutDescription];
    v26 = [v24 stringWithFormat:@"layout: %@", v25];
    [v3 addObject:v26];
  }
  if (self->_originChannelLayout)
  {
    v27 = [(MPCPlayerAudioFormat *)self debugOriginChannelLayoutDescription];
    v28 = NSString;
    uint64_t v29 = [(MPCPlayerAudioFormat *)self debugOriginChannelCountDescription];
    v30 = (void *)v29;
    if (v27) {
      [v28 stringWithFormat:@"origin channels: %@ [%@]", v29, v27];
    }
    else {
    v31 = [v28 stringWithFormat:@"origin channels: %@", v29, v38];
    }
    [v3 addObject:v31];
  }
  if (self->_spatialized) {
    [v3 addObject:@"spatialized"];
  }
  if (self->_multiChannel) {
    [v3 addObject:@"multichannel"];
  }
  if (self->_stableVariantID)
  {
    v32 = [NSString stringWithFormat:@"stableVariantID: %@", self->_stableVariantID];
    [v3 addObject:v32];
  }
  unint64_t renderingMode = self->_renderingMode;
  if (renderingMode)
  {
    if (renderingMode > 5) {
      v34 = @"Unknown";
    }
    else {
      v34 = off_2643C4788[renderingMode - 1];
    }
    v35 = [NSString stringWithFormat:@"rendering: %@", v34];
    [v3 addObject:v35];
  }
  v36 = [v3 componentsJoinedByString:@"; "];

  return (NSString *)v36;
}

- (NSString)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(MPCPlayerAudioFormat *)self humanDescription];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSDictionary)dictionaryRepresentation
{
  v21[13] = *MEMORY[0x263EF8340];
  v20[0] = @"tier";
  v19 = [NSNumber numberWithInteger:self->_tier];
  v21[0] = v19;
  v20[1] = @"br";
  id v3 = [NSNumber numberWithInteger:self->_bitrate];
  v21[1] = v3;
  v20[2] = @"sr";
  uint64_t v4 = [NSNumber numberWithInteger:self->_sampleRate];
  v21[2] = v4;
  v20[3] = @"bd";
  uint64_t v5 = [NSNumber numberWithInteger:self->_bitDepth];
  v21[3] = v5;
  v20[4] = @"codec";
  uint64_t v6 = [NSNumber numberWithUnsignedInt:self->_codec];
  v21[4] = v6;
  v20[5] = @"chlay";
  uint64_t v7 = [NSNumber numberWithUnsignedInt:self->_channelLayout];
  v21[5] = v7;
  v20[6] = @"ochlay";
  uint64_t v8 = [NSNumber numberWithUnsignedInt:self->_originChannelLayout];
  uint64_t v9 = (void *)v8;
  unsigned int v10 = &stru_26CBCA930;
  audioChannelLayoutDescription = self->_audioChannelLayoutDescription;
  groupID = (__CFString *)self->_groupID;
  if (!groupID) {
    groupID = &stru_26CBCA930;
  }
  v21[6] = v8;
  v21[7] = groupID;
  v20[7] = @"grp";
  v20[8] = @"var";
  stableVariantID = (__CFString *)self->_stableVariantID;
  if (!stableVariantID) {
    stableVariantID = &stru_26CBCA930;
  }
  if (audioChannelLayoutDescription) {
    unsigned int v10 = (__CFString *)audioChannelLayoutDescription;
  }
  v21[8] = stableVariantID;
  v21[9] = v10;
  v20[9] = @"chlayd";
  v20[10] = @"spz";
  uint64_t v14 = [NSNumber numberWithBool:self->_spatialized];
  v21[10] = v14;
  v20[11] = @"mul";
  BOOL v15 = [NSNumber numberWithBool:self->_multiChannel];
  v21[11] = v15;
  v20[12] = @"rdm";
  v16 = [NSNumber numberWithInteger:self->_renderingMode];
  v21[12] = v16;
  v17 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:13];

  return (NSDictionary *)v17;
}

- (MPCPlayerAudioFormat)audioFormatWithRenderingMode:(int64_t)a3
{
  if ([(MPCPlayerAudioFormat *)self renderingMode] == a3)
  {
    uint64_t v5 = self;
  }
  else
  {
    uint64_t v5 = (MPCPlayerAudioFormat *)objc_opt_new();
    v5->_tier = [(MPCPlayerAudioFormat *)self tier];
    uint64_t v6 = [(MPCPlayerAudioFormat *)self groupID];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;

    v5->_bitrate = [(MPCPlayerAudioFormat *)self bitrate];
    v5->_sampleRate = [(MPCPlayerAudioFormat *)self sampleRate];
    v5->_bitDepth = [(MPCPlayerAudioFormat *)self bitDepth];
    v5->_codec = [(MPCPlayerAudioFormat *)self codec];
    v5->_unsigned int channelLayout = [(MPCPlayerAudioFormat *)self channelLayout];
    uint64_t v8 = [(MPCPlayerAudioFormat *)self stableVariantID];
    stableVariantID = v5->_stableVariantID;
    v5->_stableVariantID = (NSString *)v8;

    uint64_t v10 = [(MPCPlayerAudioFormat *)self audioChannelLayoutDescription];
    audioChannelLayoutDescription = v5->_audioChannelLayoutDescription;
    v5->_audioChannelLayoutDescription = (NSString *)v10;

    v5->_spatialized = [(MPCPlayerAudioFormat *)self isSpatialized];
    v5->_multiChannel = [(MPCPlayerAudioFormat *)self isMultiChannel];
    v5->_unint64_t renderingMode = a3;
  }

  return v5;
}

- (MPCPlayerAudioFormat)initWithDictionaryRepresentation:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MPCPlayerAudioFormat;
  uint64_t v5 = [(MPCPlayerAudioFormat *)&v24 init];
  if (!v5) {
    goto LABEL_4;
  }
  uint64_t v6 = [v4 objectForKeyedSubscript:@"tier"];

  if (v6)
  {
    uint64_t v7 = [v4 objectForKeyedSubscript:@"tier"];
    v5->_tier = [v7 integerValue];

    uint64_t v8 = [v4 objectForKeyedSubscript:@"grp"];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"br"];
    v5->_bitrate = [v10 integerValue];

    BOOL v11 = [v4 objectForKeyedSubscript:@"sr"];
    v5->_sampleRate = [v11 integerValue];

    BOOL v12 = [v4 objectForKeyedSubscript:@"bd"];
    v5->_bitDepth = [v12 integerValue];

    unsigned int v13 = [v4 objectForKeyedSubscript:@"codec"];
    v5->_codec = [v13 unsignedIntValue];

    uint64_t v14 = [v4 objectForKeyedSubscript:@"chlay"];
    v5->_unsigned int channelLayout = [v14 unsignedIntValue];

    BOOL v15 = [v4 objectForKeyedSubscript:@"ochlay"];
    v5->_originChannelLayout = [v15 unsignedIntValue];

    uint64_t v16 = [v4 objectForKeyedSubscript:@"var"];
    stableVariantID = v5->_stableVariantID;
    v5->_stableVariantID = (NSString *)v16;

    uint64_t v18 = [v4 objectForKeyedSubscript:@"chlayd"];
    audioChannelLayoutDescription = v5->_audioChannelLayoutDescription;
    v5->_audioChannelLayoutDescription = (NSString *)v18;

    v20 = [v4 objectForKeyedSubscript:@"spz"];
    v5->_spatialized = [v20 BOOLValue];

    v21 = [v4 objectForKeyedSubscript:@"mul"];
    v5->_multiChannel = [v21 BOOLValue];

    v22 = [v4 objectForKeyedSubscript:@"rdm"];
    v5->_unint64_t renderingMode = [v22 integerValue];

LABEL_4:
    uint64_t v6 = v5;
  }

  return v6;
}

- (MPCPlayerAudioFormat)initWithTier:(int64_t)a3 codec:(unsigned int)a4 spatialized:(BOOL)a5 multiChannel:(BOOL)a6 channelLayout:(unsigned int)a7 sampleRate:(int64_t)a8 stableVariantID:(id)a9
{
  uint64_t v10 = *(void *)&a7;
  id v16 = a9;
  v23.receiver = self;
  v23.super_class = (Class)MPCPlayerAudioFormat;
  v17 = [(MPCPlayerAudioFormat *)&v23 init];
  uint64_t v18 = v17;
  if (v17)
  {
    v17->_tier = a3;
    v17->_spatialized = a5;
    v17->_multiChannel = a6;
    v17->_codec = a4;
    v17->_unsigned int channelLayout = v10;
    v19 = [(MPCPlayerAudioFormat *)v17 _descriptionForChannelLayoutTag:v10];
    uint64_t v20 = [v19 copy];
    audioChannelLayoutDescription = v18->_audioChannelLayoutDescription;
    v18->_audioChannelLayoutDescription = (NSString *)v20;

    v18->_sampleRate = a8;
    objc_storeStrong((id *)&v18->_stableVariantID, a9);
    v18->_unint64_t renderingMode = 0;
  }

  return v18;
}

- (MPNowPlayingInfoAudioFormat)nowPlayingAudioFormat
{
  id v3 = objc_alloc_init(MEMORY[0x263F12108]);
  objc_msgSend(v3, "setTier:", -[MPCPlayerAudioFormat tier](self, "tier"));
  objc_msgSend(v3, "setBitrate:", -[MPCPlayerAudioFormat bitrate](self, "bitrate"));
  objc_msgSend(v3, "setSampleRate:", -[MPCPlayerAudioFormat sampleRate](self, "sampleRate"));
  objc_msgSend(v3, "setBitDepth:", -[MPCPlayerAudioFormat bitDepth](self, "bitDepth"));
  objc_msgSend(v3, "setCodec:", -[MPCPlayerAudioFormat codec](self, "codec"));
  if (![(MPCPlayerAudioFormat *)self renderingMode]
    || [(MPCPlayerAudioFormat *)self renderingMode] == 5)
  {
    objc_msgSend(v3, "setSpatialized:", -[MPCPlayerAudioFormat isSpatialized](self, "isSpatialized"));
  }
  objc_msgSend(v3, "setMultiChannel:", -[MPCPlayerAudioFormat isMultiChannel](self, "isMultiChannel"));
  objc_msgSend(v3, "setChannelLayout:", -[MPCPlayerAudioFormat channelLayout](self, "channelLayout"));
  id v4 = [(MPCPlayerAudioFormat *)self audioChannelLayoutDescription];
  [v3 setAudioChannelLayoutDescription:v4];

  uint64_t v5 = [(MPCPlayerAudioFormat *)self groupID];
  [v3 setGroupID:v5];

  uint64_t v6 = [(MPCPlayerAudioFormat *)self stableVariantID];
  [v3 setStableVariantID:v6];

  objc_msgSend(v3, "setRenderingMode:", -[MPCPlayerAudioFormat renderingMode](self, "renderingMode"));

  return (MPNowPlayingInfoAudioFormat *)v3;
}

- (MPCPlayerAudioFormat)initWithNowPlayingInfoAudioFormat:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MPCPlayerAudioFormat;
  uint64_t v5 = [(MPCPlayerAudioFormat *)&v13 init];
  if (v5)
  {
    v5->_tier = [v4 tier];
    uint64_t v6 = [v4 groupID];
    groupID = v5->_groupID;
    v5->_groupID = (NSString *)v6;

    v5->_bitrate = [v4 bitrate];
    v5->_sampleRate = [v4 sampleRate];
    v5->_bitDepth = [v4 bitDepth];
    v5->_codec = [v4 codec];
    v5->_unsigned int channelLayout = [v4 channelLayout];
    uint64_t v8 = [v4 stableVariantID];
    stableVariantID = v5->_stableVariantID;
    v5->_stableVariantID = (NSString *)v8;

    uint64_t v10 = [v4 audioChannelLayoutDescription];
    audioChannelLayoutDescription = v5->_audioChannelLayoutDescription;
    v5->_audioChannelLayoutDescription = (NSString *)v10;

    v5->_spatialized = [v4 isSpatialized];
    v5->_multiChannel = [v4 isMultiChannel];
    v5->_unint64_t renderingMode = [v4 renderingMode];
  }

  return v5;
}

- (MPCPlayerAudioFormat)initWithJSONDictionaryRepresentation:(id)a3 stableVariantID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MPCPlayerAudioFormat;
  uint64_t v8 = [(MPCPlayerAudioFormat *)&v34 init];
  if (!v8) {
    goto LABEL_18;
  }
  uint64_t v9 = [v6 objectForKeyedSubscript:@"VERSION"];
  if (v9)
  {
    uint64_t v10 = [v6 objectForKeyedSubscript:@"AUDIO-FORMAT-ID"];

    if (v10)
    {
      uint64_t v11 = [v7 copy];
      stableVariantID = v8->_stableVariantID;
      v8->_stableVariantID = (NSString *)v11;

      objc_super v13 = [v6 objectForKeyedSubscript:@"VERSION"];
      if (![(MPCPlayerAudioFormat *)v8 _isHLSVersion:v13 greatherThanOrEqualTo:&unk_26CC19260])
      {
LABEL_17:

LABEL_18:
        uint64_t v9 = v8;
        goto LABEL_19;
      }
      uint64_t v14 = [v6 objectForKeyedSubscript:@"AUDIO-FORMAT-ID"];
      if ([v14 length] == 4)
      {
        id v15 = v14;
        id v16 = (char *)[v15 UTF8String];
        v8->_codec = v16[3] + (v16[2] << 8) + (v16[1] << 16) + (*v16 << 24);
        v17 = [v6 objectForKeyedSubscript:@"GROUP-ID"];
        uint64_t v18 = [v17 copy];
        groupID = v8->_groupID;
        v8->_groupID = (NSString *)v18;

        if (v8->_codec == 1634492771)
        {
          uint64_t v20 = [v6 objectForKeyedSubscript:@"SAMPLE-RATE"];
          v8->_sampleRate = [v20 integerValue];

          v21 = @"BIT-DEPTH";
          uint64_t v22 = 48;
        }
        else
        {
          v21 = @"BIT-RATE";
          uint64_t v22 = 32;
        }
        objc_super v23 = [v6 objectForKeyedSubscript:v21];
        *(Class *)((char *)&v8->super.isa + v22) = (Class)[v23 integerValue];

        v8->_spatialized = [(MPCPlayerAudioFormat *)v8 _isSpatialFormat:v6];
        objc_super v24 = [v6 objectForKeyedSubscript:@"CHANNEL-COUNT"];
        uint64_t v25 = [v24 integerValue];

        v8->_tier = [(MPCPlayerAudioFormat *)v8 _computedTierFromHLSDataWithChannelCount:v25];
        uint64_t v26 = [(MPCPlayerAudioFormat *)v8 _computedChannelLayoutTagFromHLSData:v6 channelCount:v25];
        v8->_unsigned int channelLayout = v26;
        v27 = [(MPCPlayerAudioFormat *)v8 _descriptionForChannelLayoutTag:v26];
        uint64_t v28 = [v27 copy];
        audioChannelLayoutDescription = v8->_audioChannelLayoutDescription;
        v8->_audioChannelLayoutDescription = (NSString *)v28;

        v30 = [v6 objectForKeyedSubscript:@"ORIGIN-CHANNEL-COUNT"];
        uint64_t v31 = [v30 integerValue];

        if (v31) {
          v8->_originChannelLayout = [(MPCPlayerAudioFormat *)v8 _computedChannelLayoutTagFromHLSData:v6 channelCount:v31];
        }
        if (v8->_spatialized) {
          char v32 = 1;
        }
        else {
          char v32 = [(MPCPlayerAudioFormat *)v8 _isMultichannelFormat:v6];
        }
        v8->_multiChannel = v32;

        goto LABEL_17;
      }
    }
    uint64_t v9 = 0;
  }
LABEL_19:

  return v9;
}

+ (id)lossyHighQualityStereoFormat
{
  v7[7] = *MEMORY[0x263EF8340];
  unsigned int v2 = [MPCPlayerAudioFormat alloc];
  v6[0] = @"tier";
  v6[1] = @"chlay";
  v7[0] = &unk_26CC192A8;
  v7[1] = &unk_26CC19290;
  v6[2] = @"chlayd";
  v6[3] = @"spz";
  v7[2] = @"Stereo";
  v7[3] = MEMORY[0x263EFFA80];
  v6[4] = @"mul";
  v6[5] = @"var";
  v7[4] = MEMORY[0x263EFFA80];
  v7[5] = @"HQ-Stereo";
  v6[6] = @"grp";
  v7[6] = @"Synthesized format";
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:7];
  id v4 = [(MPCPlayerAudioFormat *)v2 initWithDictionaryRepresentation:v3];

  return v4;
}

+ (id)lossyLowQualityStereoFormat
{
  v7[7] = *MEMORY[0x263EF8340];
  unsigned int v2 = [MPCPlayerAudioFormat alloc];
  v6[0] = @"tier";
  v6[1] = @"chlay";
  v7[0] = &unk_26CC19278;
  v7[1] = &unk_26CC19290;
  v6[2] = @"chlayd";
  v6[3] = @"spz";
  v7[2] = @"Stereo";
  v7[3] = MEMORY[0x263EFFA80];
  v6[4] = @"mul";
  v6[5] = @"var";
  v7[4] = MEMORY[0x263EFFA80];
  v7[5] = @"LQ-Stereo";
  v6[6] = @"grp";
  v7[6] = @"Synthesized format";
  id v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:7];
  id v4 = [(MPCPlayerAudioFormat *)v2 initWithDictionaryRepresentation:v3];

  return v4;
}

+ (id)payloadValueFromJSONValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithDictionaryRepresentation:v4];

  return v5;
}

@end