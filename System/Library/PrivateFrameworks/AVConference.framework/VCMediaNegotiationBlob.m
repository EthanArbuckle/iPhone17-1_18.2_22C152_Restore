@interface VCMediaNegotiationBlob
+ (Class)bandwidthSettingsType;
+ (Class)multiwayAudioStreamsType;
+ (Class)multiwayVideoStreamType;
- (BOOL)allowDynamicMaxBitrate;
- (BOOL)allowsContentsChangeWithAspectPreservation;
- (BOOL)hasAccessNetworkType;
- (BOOL)hasAllowDynamicMaxBitrate;
- (BOOL)hasAllowsContentsChangeWithAspectPreservation;
- (BOOL)hasAudioSettings;
- (BOOL)hasBasebandCodec;
- (BOOL)hasBasebandCodecSampleRate;
- (BOOL)hasBlobVersion;
- (BOOL)hasCaptionsSettings;
- (BOOL)hasFaceTimeSettings;
- (BOOL)hasMediaControlInfoVersion;
- (BOOL)hasMomentsSettings;
- (BOOL)hasNtpTime;
- (BOOL)hasScreenSettings;
- (BOOL)hasUserAgent;
- (BOOL)hasVideoSettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)bandwidthSettings;
- (NSMutableArray)multiwayAudioStreams;
- (NSMutableArray)multiwayVideoStreams;
- (NSString)basebandCodec;
- (NSString)userAgent;
- (VCMediaNegotiationBlobAudioSettings)audioSettings;
- (VCMediaNegotiationBlobCaptionsSettings)captionsSettings;
- (VCMediaNegotiationBlobMomentsSettings)momentsSettings;
- (VCMediaNegotiationBlobVideoSettings)screenSettings;
- (VCMediaNegotiationBlobVideoSettings)videoSettings;
- (VCMediaNegotiationFaceTimeSettings)faceTimeSettings;
- (id)bandwidthSettingsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)multiwayAudioStreamsAtIndex:(unint64_t)a3;
- (id)multiwayVideoStreamAtIndex:(unint64_t)a3;
- (unint64_t)bandwidthSettingsCount;
- (unint64_t)hash;
- (unint64_t)multiwayAudioStreamsCount;
- (unint64_t)multiwayVideoStreamsCount;
- (unint64_t)ntpTime;
- (unsigned)accessNetworkType;
- (unsigned)basebandCodecSampleRate;
- (unsigned)blobVersion;
- (unsigned)mediaControlInfoVersion;
- (void)addBandwidthSettings:(id)a3;
- (void)addMultiwayAudioStreams:(id)a3;
- (void)addMultiwayVideoStream:(id)a3;
- (void)clearBandwidthSettings;
- (void)clearMultiwayAudioStreams;
- (void)clearMultiwayVideoStreams;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)formatBandwidthConfig:(int)a3 maxBanxwidth:(unsigned int)a4 bandwidthString:(id)a5;
- (void)mergeFrom:(id)a3;
- (void)printBandwidthSettingsWithLogFile:(void *)a3;
- (void)printCaptionsSettingsWithLogFile:(void *)a3;
- (void)printMomentsSettingsWithLogFile:(void *)a3;
- (void)printMultiwayAudioStreamsWithLogFile:(void *)a3;
- (void)printMultiwayVideoStreamsWithLogFile:(void *)a3;
- (void)printWithTitle:(id)a3 blobSize:(unsigned int)a4 logFile:(void *)a5;
- (void)setAccessNetworkType:(unsigned int)a3;
- (void)setAllowDynamicMaxBitrate:(BOOL)a3;
- (void)setAllowsContentsChangeWithAspectPreservation:(BOOL)a3;
- (void)setAudioSettings:(id)a3;
- (void)setBandwidthSettings:(id)a3;
- (void)setBasebandCodec:(id)a3;
- (void)setBasebandCodecSampleRate:(unsigned int)a3;
- (void)setBlobVersion:(unsigned int)a3;
- (void)setCaptionsSettings:(id)a3;
- (void)setFaceTimeSettings:(id)a3;
- (void)setHasAccessNetworkType:(BOOL)a3;
- (void)setHasAllowDynamicMaxBitrate:(BOOL)a3;
- (void)setHasAllowsContentsChangeWithAspectPreservation:(BOOL)a3;
- (void)setHasBasebandCodecSampleRate:(BOOL)a3;
- (void)setHasBlobVersion:(BOOL)a3;
- (void)setHasMediaControlInfoVersion:(BOOL)a3;
- (void)setHasNtpTime:(BOOL)a3;
- (void)setMediaControlInfoVersion:(unsigned int)a3;
- (void)setMomentsSettings:(id)a3;
- (void)setMultiwayAudioStreams:(id)a3;
- (void)setMultiwayVideoStreams:(id)a3;
- (void)setNtpTime:(unint64_t)a3;
- (void)setScreenSettings:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)setVideoSettings:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlob

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaNegotiationBlob *)self setAudioSettings:0];
  [(VCMediaNegotiationBlob *)self setVideoSettings:0];
  [(VCMediaNegotiationBlob *)self setScreenSettings:0];
  [(VCMediaNegotiationBlob *)self setUserAgent:0];
  [(VCMediaNegotiationBlob *)self setBasebandCodec:0];
  [(VCMediaNegotiationBlob *)self setBandwidthSettings:0];
  [(VCMediaNegotiationBlob *)self setCaptionsSettings:0];
  [(VCMediaNegotiationBlob *)self setMultiwayAudioStreams:0];
  [(VCMediaNegotiationBlob *)self setMomentsSettings:0];
  [(VCMediaNegotiationBlob *)self setMultiwayVideoStreams:0];
  [(VCMediaNegotiationBlob *)self setFaceTimeSettings:0];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlob;
  [(VCMediaNegotiationBlob *)&v3 dealloc];
}

- (void)setAllowDynamicMaxBitrate:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_allowDynamicMaxBitrate = a3;
}

- (void)setHasAllowDynamicMaxBitrate:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAllowDynamicMaxBitrate
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAllowsContentsChangeWithAspectPreservation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_allowsContentsChangeWithAspectPreservation = a3;
}

- (void)setHasAllowsContentsChangeWithAspectPreservation:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasAllowsContentsChangeWithAspectPreservation
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasAudioSettings
{
  return self->_audioSettings != 0;
}

- (BOOL)hasVideoSettings
{
  return self->_videoSettings != 0;
}

- (BOOL)hasScreenSettings
{
  return self->_screenSettings != 0;
}

- (BOOL)hasUserAgent
{
  return self->_userAgent != 0;
}

- (BOOL)hasBasebandCodec
{
  return self->_basebandCodec != 0;
}

- (void)setBasebandCodecSampleRate:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_basebandCodecSampleRate = a3;
}

- (void)setHasBasebandCodecSampleRate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBasebandCodecSampleRate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)clearBandwidthSettings
{
}

- (void)addBandwidthSettings:(id)a3
{
  bandwidthSettings = self->_bandwidthSettings;
  if (!bandwidthSettings)
  {
    bandwidthSettings = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_bandwidthSettings = bandwidthSettings;
  }

  [(NSMutableArray *)bandwidthSettings addObject:a3];
}

- (unint64_t)bandwidthSettingsCount
{
  return [(NSMutableArray *)self->_bandwidthSettings count];
}

- (id)bandwidthSettingsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_bandwidthSettings objectAtIndex:a3];
}

+ (Class)bandwidthSettingsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCaptionsSettings
{
  return self->_captionsSettings != 0;
}

- (void)clearMultiwayAudioStreams
{
}

- (void)addMultiwayAudioStreams:(id)a3
{
  multiwayAudioStreams = self->_multiwayAudioStreams;
  if (!multiwayAudioStreams)
  {
    multiwayAudioStreams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_multiwayAudioStreams = multiwayAudioStreams;
  }

  [(NSMutableArray *)multiwayAudioStreams addObject:a3];
}

- (unint64_t)multiwayAudioStreamsCount
{
  return [(NSMutableArray *)self->_multiwayAudioStreams count];
}

- (id)multiwayAudioStreamsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_multiwayAudioStreams objectAtIndex:a3];
}

+ (Class)multiwayAudioStreamsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMomentsSettings
{
  return self->_momentsSettings != 0;
}

- (void)setNtpTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ntpTime = a3;
}

- (void)setHasNtpTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNtpTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setBlobVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_blobVersion = a3;
}

- (void)setHasBlobVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBlobVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)clearMultiwayVideoStreams
{
}

- (void)addMultiwayVideoStream:(id)a3
{
  multiwayVideoStreams = self->_multiwayVideoStreams;
  if (!multiwayVideoStreams)
  {
    multiwayVideoStreams = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_multiwayVideoStreams = multiwayVideoStreams;
  }

  [(NSMutableArray *)multiwayVideoStreams addObject:a3];
}

- (unint64_t)multiwayVideoStreamsCount
{
  return [(NSMutableArray *)self->_multiwayVideoStreams count];
}

- (id)multiwayVideoStreamAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_multiwayVideoStreams objectAtIndex:a3];
}

+ (Class)multiwayVideoStreamType
{
  return (Class)objc_opt_class();
}

- (unsigned)mediaControlInfoVersion
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_mediaControlInfoVersion;
  }
  else {
    return 1;
  }
}

- (void)setMediaControlInfoVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_mediaControlInfoVersion = a3;
}

- (void)setHasMediaControlInfoVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMediaControlInfoVersion
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasFaceTimeSettings
{
  return self->_faceTimeSettings != 0;
}

- (unsigned)accessNetworkType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_accessNetworkType;
  }
  else {
    return 0;
  }
}

- (void)setAccessNetworkType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_accessNetworkType = a3;
}

- (void)setHasAccessNetworkType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAccessNetworkType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlob;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlob description](&v3, sel_description), -[VCMediaNegotiationBlob dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_allowDynamicMaxBitrate), @"allowDynamicMaxBitrate");
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_allowsContentsChangeWithAspectPreservation), @"allowsContentsChangeWithAspectPreservation");
  }
  audioSettings = self->_audioSettings;
  if (audioSettings) {
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobAudioSettings dictionaryRepresentation](audioSettings, "dictionaryRepresentation"), @"audioSettings");
  }
  videoSettings = self->_videoSettings;
  if (videoSettings) {
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobVideoSettings dictionaryRepresentation](videoSettings, "dictionaryRepresentation"), @"videoSettings");
  }
  screenSettings = self->_screenSettings;
  if (screenSettings) {
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobVideoSettings dictionaryRepresentation](screenSettings, "dictionaryRepresentation"), @"screenSettings");
  }
  userAgent = self->_userAgent;
  if (userAgent) {
    [v3 setObject:userAgent forKey:@"userAgent"];
  }
  basebandCodec = self->_basebandCodec;
  if (basebandCodec) {
    [v3 setObject:basebandCodec forKey:@"basebandCodec"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_basebandCodecSampleRate), @"basebandCodecSampleRate");
  }
  if ([(NSMutableArray *)self->_bandwidthSettings count])
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_bandwidthSettings, "count"));
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    bandwidthSettings = self->_bandwidthSettings;
    uint64_t v12 = [(NSMutableArray *)bandwidthSettings countByEnumeratingWithState:&v44 objects:v43 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v45 != v14) {
            objc_enumerationMutation(bandwidthSettings);
          }
          objc_msgSend(v10, "addObject:", objc_msgSend(*(id *)(*((void *)&v44 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v13 = [(NSMutableArray *)bandwidthSettings countByEnumeratingWithState:&v44 objects:v43 count:16];
      }
      while (v13);
    }
    [v3 setObject:v10 forKey:@"bandwidthSettings"];
  }
  captionsSettings = self->_captionsSettings;
  if (captionsSettings) {
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobCaptionsSettings dictionaryRepresentation](captionsSettings, "dictionaryRepresentation"), @"captionsSettings");
  }
  if ([(NSMutableArray *)self->_multiwayAudioStreams count])
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_multiwayAudioStreams, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    multiwayAudioStreams = self->_multiwayAudioStreams;
    uint64_t v19 = [(NSMutableArray *)multiwayAudioStreams countByEnumeratingWithState:&v39 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(multiwayAudioStreams);
          }
          objc_msgSend(v17, "addObject:", objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * j), "dictionaryRepresentation"));
        }
        uint64_t v20 = [(NSMutableArray *)multiwayAudioStreams countByEnumeratingWithState:&v39 objects:v38 count:16];
      }
      while (v20);
    }
    [v3 setObject:v17 forKey:@"multiwayAudioStreams"];
  }
  momentsSettings = self->_momentsSettings;
  if (momentsSettings) {
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationBlobMomentsSettings dictionaryRepresentation](momentsSettings, "dictionaryRepresentation"), @"momentsSettings");
  }
  char v24 = (char)self->_has;
  if (v24)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_ntpTime), @"ntpTime");
    char v24 = (char)self->_has;
  }
  if ((v24 & 8) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_blobVersion), @"blobVersion");
  }
  if ([(NSMutableArray *)self->_multiwayVideoStreams count])
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_multiwayVideoStreams, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    multiwayVideoStreams = self->_multiwayVideoStreams;
    uint64_t v27 = [(NSMutableArray *)multiwayVideoStreams countByEnumeratingWithState:&v34 objects:v33 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(multiwayVideoStreams);
          }
          objc_msgSend(v25, "addObject:", objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * k), "dictionaryRepresentation"));
        }
        uint64_t v28 = [(NSMutableArray *)multiwayVideoStreams countByEnumeratingWithState:&v34 objects:v33 count:16];
      }
      while (v28);
    }
    [v3 setObject:v25 forKey:@"multiwayVideoStream"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_mediaControlInfoVersion), @"mediaControlInfoVersion");
  }
  faceTimeSettings = self->_faceTimeSettings;
  if (faceTimeSettings) {
    objc_msgSend(v3, "setObject:forKey:", -[VCMediaNegotiationFaceTimeSettings dictionaryRepresentation](faceTimeSettings, "dictionaryRepresentation"), @"faceTimeSettings");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_accessNetworkType), @"accessNetworkType");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_audioSettings) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_videoSettings) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_screenSettings) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_userAgent) {
    PBDataWriterWriteStringField();
  }
  if (self->_basebandCodec) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  bandwidthSettings = self->_bandwidthSettings;
  uint64_t v6 = [(NSMutableArray *)bandwidthSettings countByEnumeratingWithState:&v32 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(bandwidthSettings);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)bandwidthSettings countByEnumeratingWithState:&v32 objects:v31 count:16];
    }
    while (v7);
  }
  if (self->_captionsSettings) {
    PBDataWriterWriteSubmessage();
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  multiwayAudioStreams = self->_multiwayAudioStreams;
  uint64_t v11 = [(NSMutableArray *)multiwayAudioStreams countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(multiwayAudioStreams);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)multiwayAudioStreams countByEnumeratingWithState:&v27 objects:v26 count:16];
    }
    while (v12);
  }
  if (self->_momentsSettings) {
    PBDataWriterWriteSubmessage();
  }
  char v15 = (char)self->_has;
  if (v15)
  {
    PBDataWriterWriteUint64Field();
    char v15 = (char)self->_has;
  }
  if ((v15 & 8) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  multiwayVideoStreams = self->_multiwayVideoStreams;
  uint64_t v17 = [(NSMutableArray *)multiwayVideoStreams countByEnumeratingWithState:&v22 objects:v21 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(multiwayVideoStreams);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v18 = [(NSMutableArray *)multiwayVideoStreams countByEnumeratingWithState:&v22 objects:v21 count:16];
    }
    while (v18);
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_faceTimeSettings) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)a3 + 128) = self->_allowDynamicMaxBitrate;
    *((unsigned char *)a3 + 132) |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *((unsigned char *)a3 + 129) = self->_allowsContentsChangeWithAspectPreservation;
    *((unsigned char *)a3 + 132) |= 0x40u;
  }
  if (self->_audioSettings) {
    objc_msgSend(a3, "setAudioSettings:");
  }
  if (self->_videoSettings) {
    objc_msgSend(a3, "setVideoSettings:");
  }
  if (self->_screenSettings) {
    objc_msgSend(a3, "setScreenSettings:");
  }
  if (self->_userAgent) {
    objc_msgSend(a3, "setUserAgent:");
  }
  if (self->_basebandCodec) {
    objc_msgSend(a3, "setBasebandCodec:");
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_basebandCodecSampleRate;
    *((unsigned char *)a3 + 132) |= 4u;
  }
  if ([(VCMediaNegotiationBlob *)self bandwidthSettingsCount])
  {
    [a3 clearBandwidthSettings];
    unint64_t v6 = [(VCMediaNegotiationBlob *)self bandwidthSettingsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        objc_msgSend(a3, "addBandwidthSettings:", -[VCMediaNegotiationBlob bandwidthSettingsAtIndex:](self, "bandwidthSettingsAtIndex:", i));
    }
  }
  if (self->_captionsSettings) {
    objc_msgSend(a3, "setCaptionsSettings:");
  }
  if ([(VCMediaNegotiationBlob *)self multiwayAudioStreamsCount])
  {
    [a3 clearMultiwayAudioStreams];
    unint64_t v9 = [(VCMediaNegotiationBlob *)self multiwayAudioStreamsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        objc_msgSend(a3, "addMultiwayAudioStreams:", -[VCMediaNegotiationBlob multiwayAudioStreamsAtIndex:](self, "multiwayAudioStreamsAtIndex:", j));
    }
  }
  if (self->_momentsSettings) {
    objc_msgSend(a3, "setMomentsSettings:");
  }
  char v12 = (char)self->_has;
  if (v12)
  {
    *((void *)a3 + 1) = self->_ntpTime;
    *((unsigned char *)a3 + 132) |= 1u;
    char v12 = (char)self->_has;
  }
  if ((v12 & 8) != 0)
  {
    *((_DWORD *)a3 + 13) = self->_blobVersion;
    *((unsigned char *)a3 + 132) |= 8u;
  }
  if ([(VCMediaNegotiationBlob *)self multiwayVideoStreamsCount])
  {
    [a3 clearMultiwayVideoStreams];
    unint64_t v13 = [(VCMediaNegotiationBlob *)self multiwayVideoStreamsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
        objc_msgSend(a3, "addMultiwayVideoStream:", -[VCMediaNegotiationBlob multiwayVideoStreamAtIndex:](self, "multiwayVideoStreamAtIndex:", k));
    }
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 18) = self->_mediaControlInfoVersion;
    *((unsigned char *)a3 + 132) |= 0x10u;
  }
  if (self->_faceTimeSettings) {
    objc_msgSend(a3, "setFaceTimeSettings:");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_accessNetworkType;
    *((unsigned char *)a3 + 132) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(unsigned char *)(v5 + 128) = self->_allowDynamicMaxBitrate;
    *(unsigned char *)(v5 + 132) |= 0x20u;
    char has = (char)self->_has;
  }
  if ((has & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 129) = self->_allowsContentsChangeWithAspectPreservation;
    *(unsigned char *)(v5 + 132) |= 0x40u;
  }

  *(void *)(v6 + 24) = [(VCMediaNegotiationBlobAudioSettings *)self->_audioSettings copyWithZone:a3];
  *(void *)(v6 + 120) = [(VCMediaNegotiationBlobVideoSettings *)self->_videoSettings copyWithZone:a3];

  *(void *)(v6 + 104) = [(VCMediaNegotiationBlobVideoSettings *)self->_screenSettings copyWithZone:a3];
  *(void *)(v6 + 112) = [(NSString *)self->_userAgent copyWithZone:a3];

  *(void *)(v6 + 40) = [(NSString *)self->_basebandCodec copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_basebandCodecSampleRate;
    *(unsigned char *)(v6 + 132) |= 4u;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  bandwidthSettings = self->_bandwidthSettings;
  uint64_t v9 = [(NSMutableArray *)bandwidthSettings countByEnumeratingWithState:&v39 objects:v38 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v40 != v11) {
          objc_enumerationMutation(bandwidthSettings);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addBandwidthSettings:v13];
      }
      uint64_t v10 = [(NSMutableArray *)bandwidthSettings countByEnumeratingWithState:&v39 objects:v38 count:16];
    }
    while (v10);
  }

  *(void *)(v6 + 56) = [(VCMediaNegotiationBlobCaptionsSettings *)self->_captionsSettings copyWithZone:a3];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  multiwayAudioStreams = self->_multiwayAudioStreams;
  uint64_t v15 = [(NSMutableArray *)multiwayAudioStreams countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(multiwayAudioStreams);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addMultiwayAudioStreams:v19];
      }
      uint64_t v16 = [(NSMutableArray *)multiwayAudioStreams countByEnumeratingWithState:&v34 objects:v33 count:16];
    }
    while (v16);
  }

  *(void *)(v6 + 80) = [(VCMediaNegotiationBlobMomentsSettings *)self->_momentsSettings copyWithZone:a3];
  char v20 = (char)self->_has;
  if (v20)
  {
    *(void *)(v6 + 8) = self->_ntpTime;
    *(unsigned char *)(v6 + 132) |= 1u;
    char v20 = (char)self->_has;
  }
  if ((v20 & 8) != 0)
  {
    *(_DWORD *)(v6 + 52) = self->_blobVersion;
    *(unsigned char *)(v6 + 132) |= 8u;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  multiwayVideoStreams = self->_multiwayVideoStreams;
  uint64_t v22 = [(NSMutableArray *)multiwayVideoStreams countByEnumeratingWithState:&v29 objects:v28 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(multiwayVideoStreams);
        }
        v26 = (void *)[*(id *)(*((void *)&v29 + 1) + 8 * k) copyWithZone:a3];
        [(id)v6 addMultiwayVideoStream:v26];
      }
      uint64_t v23 = [(NSMutableArray *)multiwayVideoStreams countByEnumeratingWithState:&v29 objects:v28 count:16];
    }
    while (v23);
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_mediaControlInfoVersion;
    *(unsigned char *)(v6 + 132) |= 0x10u;
  }

  *(void *)(v6 + 64) = [(VCMediaNegotiationFaceTimeSettings *)self->_faceTimeSettings copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_accessNetworkType;
    *(unsigned char *)(v6 + 132) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)a3 + 132) & 0x20) == 0) {
      goto LABEL_14;
    }
    if (self->_allowDynamicMaxBitrate)
    {
      if (!*((unsigned char *)a3 + 128)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)a3 + 128))
    {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)a3 + 132) & 0x20) != 0)
  {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)a3 + 132) & 0x40) == 0) {
      goto LABEL_14;
    }
    if (self->_allowsContentsChangeWithAspectPreservation)
    {
      if (!*((unsigned char *)a3 + 129)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)a3 + 129))
    {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)a3 + 132) & 0x40) != 0)
  {
    goto LABEL_14;
  }
  audioSettings = self->_audioSettings;
  if ((unint64_t)audioSettings | *((void *)a3 + 3))
  {
    int v5 = -[VCMediaNegotiationBlobAudioSettings isEqual:](audioSettings, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  videoSettings = self->_videoSettings;
  if ((unint64_t)videoSettings | *((void *)a3 + 15))
  {
    int v5 = -[VCMediaNegotiationBlobVideoSettings isEqual:](videoSettings, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  screenSettings = self->_screenSettings;
  if ((unint64_t)screenSettings | *((void *)a3 + 13))
  {
    int v5 = -[VCMediaNegotiationBlobVideoSettings isEqual:](screenSettings, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  userAgent = self->_userAgent;
  if ((unint64_t)userAgent | *((void *)a3 + 14))
  {
    int v5 = -[NSString isEqual:](userAgent, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  basebandCodec = self->_basebandCodec;
  if ((unint64_t)basebandCodec | *((void *)a3 + 5))
  {
    int v5 = -[NSString isEqual:](basebandCodec, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 132) & 4) == 0 || self->_basebandCodecSampleRate != *((_DWORD *)a3 + 12)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)a3 + 132) & 4) != 0)
  {
    goto LABEL_14;
  }
  bandwidthSettings = self->_bandwidthSettings;
  if ((unint64_t)bandwidthSettings | *((void *)a3 + 4))
  {
    int v5 = -[NSMutableArray isEqual:](bandwidthSettings, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  captionsSettings = self->_captionsSettings;
  if ((unint64_t)captionsSettings | *((void *)a3 + 7))
  {
    int v5 = -[VCMediaNegotiationBlobCaptionsSettings isEqual:](captionsSettings, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  multiwayAudioStreams = self->_multiwayAudioStreams;
  if ((unint64_t)multiwayAudioStreams | *((void *)a3 + 11))
  {
    int v5 = -[NSMutableArray isEqual:](multiwayAudioStreams, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  momentsSettings = self->_momentsSettings;
  if ((unint64_t)momentsSettings | *((void *)a3 + 10))
  {
    int v5 = -[VCMediaNegotiationBlobMomentsSettings isEqual:](momentsSettings, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)a3 + 132) & 1) == 0 || self->_ntpTime != *((void *)a3 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)a3 + 132))
  {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 132) & 8) == 0 || self->_blobVersion != *((_DWORD *)a3 + 13)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)a3 + 132) & 8) != 0)
  {
    goto LABEL_14;
  }
  multiwayVideoStreams = self->_multiwayVideoStreams;
  if ((unint64_t)multiwayVideoStreams | *((void *)a3 + 12))
  {
    int v5 = -[NSMutableArray isEqual:](multiwayVideoStreams, "isEqual:");
    if (!v5) {
      return v5;
    }
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 132) & 0x10) == 0 || self->_mediaControlInfoVersion != *((_DWORD *)a3 + 18)) {
      goto LABEL_14;
    }
    goto LABEL_61;
  }
  if ((*((unsigned char *)a3 + 132) & 0x10) != 0)
  {
LABEL_14:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_61:
  faceTimeSettings = self->_faceTimeSettings;
  if ((unint64_t)faceTimeSettings | *((void *)a3 + 8))
  {
    int v5 = -[VCMediaNegotiationFaceTimeSettings isEqual:](faceTimeSettings, "isEqual:");
    if (!v5) {
      return v5;
    }
    char has = (char)self->_has;
  }
  LOBYTE(v5) = (*((unsigned char *)a3 + 132) & 2) == 0;
  if ((has & 2) == 0) {
    return v5;
  }
  if ((*((unsigned char *)a3 + 132) & 2) == 0 || self->_accessNetworkType != *((_DWORD *)a3 + 4)) {
    goto LABEL_14;
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v21 = 2654435761 * self->_allowDynamicMaxBitrate;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v20 = 2654435761 * self->_allowsContentsChangeWithAspectPreservation;
      goto LABEL_6;
    }
  }
  uint64_t v20 = 0;
LABEL_6:
  unint64_t v19 = [(VCMediaNegotiationBlobAudioSettings *)self->_audioSettings hash];
  unint64_t v18 = [(VCMediaNegotiationBlobVideoSettings *)self->_videoSettings hash];
  unint64_t v17 = [(VCMediaNegotiationBlobVideoSettings *)self->_screenSettings hash];
  NSUInteger v16 = [(NSString *)self->_userAgent hash];
  NSUInteger v15 = [(NSString *)self->_basebandCodec hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v14 = 2654435761 * self->_basebandCodecSampleRate;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v13 = [(NSMutableArray *)self->_bandwidthSettings hash];
  unint64_t v3 = [(VCMediaNegotiationBlobCaptionsSettings *)self->_captionsSettings hash];
  uint64_t v4 = [(NSMutableArray *)self->_multiwayAudioStreams hash];
  unint64_t v5 = [(VCMediaNegotiationBlobMomentsSettings *)self->_momentsSettings hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v6 = 2654435761u * self->_ntpTime;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_11:
      uint64_t v7 = 2654435761 * self->_blobVersion;
      goto LABEL_14;
    }
  }
  uint64_t v7 = 0;
LABEL_14:
  uint64_t v8 = [(NSMutableArray *)self->_multiwayVideoStreams hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v9 = 2654435761 * self->_mediaControlInfoVersion;
  }
  else {
    uint64_t v9 = 0;
  }
  unint64_t v10 = [(VCMediaNegotiationFaceTimeSettings *)self->_faceTimeSettings hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_accessNetworkType;
  }
  else {
    uint64_t v11 = 0;
  }
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  char v5 = *((unsigned char *)a3 + 132);
  if ((v5 & 0x20) != 0)
  {
    self->_allowDynamicMaxBitrate = *((unsigned char *)a3 + 128);
    *(unsigned char *)&self->_has |= 0x20u;
    char v5 = *((unsigned char *)a3 + 132);
  }
  if ((v5 & 0x40) != 0)
  {
    self->_allowsContentsChangeWithAspectPreservation = *((unsigned char *)a3 + 129);
    *(unsigned char *)&self->_has |= 0x40u;
  }
  audioSettings = self->_audioSettings;
  uint64_t v7 = *((void *)a3 + 3);
  if (audioSettings)
  {
    if (v7) {
      -[VCMediaNegotiationBlobAudioSettings mergeFrom:](audioSettings, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[VCMediaNegotiationBlob setAudioSettings:](self, "setAudioSettings:");
  }
  videoSettings = self->_videoSettings;
  uint64_t v9 = *((void *)a3 + 15);
  if (videoSettings)
  {
    if (v9) {
      -[VCMediaNegotiationBlobVideoSettings mergeFrom:](videoSettings, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[VCMediaNegotiationBlob setVideoSettings:](self, "setVideoSettings:");
  }
  screenSettings = self->_screenSettings;
  uint64_t v11 = *((void *)a3 + 13);
  if (screenSettings)
  {
    if (v11) {
      -[VCMediaNegotiationBlobVideoSettings mergeFrom:](screenSettings, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[VCMediaNegotiationBlob setScreenSettings:](self, "setScreenSettings:");
  }
  if (*((void *)a3 + 14)) {
    -[VCMediaNegotiationBlob setUserAgent:](self, "setUserAgent:");
  }
  if (*((void *)a3 + 5)) {
    -[VCMediaNegotiationBlob setBasebandCodec:](self, "setBasebandCodec:");
  }
  if ((*((unsigned char *)a3 + 132) & 4) != 0)
  {
    self->_basebandCodecSampleRate = *((_DWORD *)a3 + 12);
    *(unsigned char *)&self->_has |= 4u;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  char v12 = (void *)*((void *)a3 + 4);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v45 objects:v44 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v46 != v15) {
          objc_enumerationMutation(v12);
        }
        [(VCMediaNegotiationBlob *)self addBandwidthSettings:*(void *)(*((void *)&v45 + 1) + 8 * i)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v45 objects:v44 count:16];
    }
    while (v14);
  }
  captionsSettings = self->_captionsSettings;
  uint64_t v18 = *((void *)a3 + 7);
  if (captionsSettings)
  {
    if (v18) {
      -[VCMediaNegotiationBlobCaptionsSettings mergeFrom:](captionsSettings, "mergeFrom:");
    }
  }
  else if (v18)
  {
    -[VCMediaNegotiationBlob setCaptionsSettings:](self, "setCaptionsSettings:");
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unint64_t v19 = (void *)*((void *)a3 + 11);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v39 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v41 != v22) {
          objc_enumerationMutation(v19);
        }
        [(VCMediaNegotiationBlob *)self addMultiwayAudioStreams:*(void *)(*((void *)&v40 + 1) + 8 * j)];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:v39 count:16];
    }
    while (v21);
  }
  momentsSettings = self->_momentsSettings;
  uint64_t v25 = *((void *)a3 + 10);
  if (momentsSettings)
  {
    if (v25) {
      -[VCMediaNegotiationBlobMomentsSettings mergeFrom:](momentsSettings, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[VCMediaNegotiationBlob setMomentsSettings:](self, "setMomentsSettings:");
  }
  char v26 = *((unsigned char *)a3 + 132);
  if (v26)
  {
    self->_ntpTime = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v26 = *((unsigned char *)a3 + 132);
  }
  if ((v26 & 8) != 0)
  {
    self->_blobVersion = *((_DWORD *)a3 + 13);
    *(unsigned char *)&self->_has |= 8u;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v27 = (void *)*((void *)a3 + 12);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v36;
    do
    {
      for (uint64_t k = 0; k != v29; ++k)
      {
        if (*(void *)v36 != v30) {
          objc_enumerationMutation(v27);
        }
        [(VCMediaNegotiationBlob *)self addMultiwayVideoStream:*(void *)(*((void *)&v35 + 1) + 8 * k)];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v35 objects:v34 count:16];
    }
    while (v29);
  }
  if ((*((unsigned char *)a3 + 132) & 0x10) != 0)
  {
    self->_mediaControlInfoVersion = *((_DWORD *)a3 + 18);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  faceTimeSettings = self->_faceTimeSettings;
  uint64_t v33 = *((void *)a3 + 8);
  if (faceTimeSettings)
  {
    if (v33) {
      -[VCMediaNegotiationFaceTimeSettings mergeFrom:](faceTimeSettings, "mergeFrom:");
    }
  }
  else if (v33)
  {
    -[VCMediaNegotiationBlob setFaceTimeSettings:](self, "setFaceTimeSettings:");
  }
  if ((*((unsigned char *)a3 + 132) & 2) != 0)
  {
    self->_accessNetworkType = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (BOOL)allowDynamicMaxBitrate
{
  return self->_allowDynamicMaxBitrate;
}

- (BOOL)allowsContentsChangeWithAspectPreservation
{
  return self->_allowsContentsChangeWithAspectPreservation;
}

- (VCMediaNegotiationBlobAudioSettings)audioSettings
{
  return self->_audioSettings;
}

- (void)setAudioSettings:(id)a3
{
}

- (VCMediaNegotiationBlobVideoSettings)videoSettings
{
  return self->_videoSettings;
}

- (void)setVideoSettings:(id)a3
{
}

- (VCMediaNegotiationBlobVideoSettings)screenSettings
{
  return self->_screenSettings;
}

- (void)setScreenSettings:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)basebandCodec
{
  return self->_basebandCodec;
}

- (void)setBasebandCodec:(id)a3
{
}

- (unsigned)basebandCodecSampleRate
{
  return self->_basebandCodecSampleRate;
}

- (NSMutableArray)bandwidthSettings
{
  return self->_bandwidthSettings;
}

- (void)setBandwidthSettings:(id)a3
{
}

- (VCMediaNegotiationBlobCaptionsSettings)captionsSettings
{
  return self->_captionsSettings;
}

- (void)setCaptionsSettings:(id)a3
{
}

- (NSMutableArray)multiwayAudioStreams
{
  return self->_multiwayAudioStreams;
}

- (void)setMultiwayAudioStreams:(id)a3
{
}

- (VCMediaNegotiationBlobMomentsSettings)momentsSettings
{
  return self->_momentsSettings;
}

- (void)setMomentsSettings:(id)a3
{
}

- (unint64_t)ntpTime
{
  return self->_ntpTime;
}

- (unsigned)blobVersion
{
  return self->_blobVersion;
}

- (NSMutableArray)multiwayVideoStreams
{
  return self->_multiwayVideoStreams;
}

- (void)setMultiwayVideoStreams:(id)a3
{
}

- (VCMediaNegotiationFaceTimeSettings)faceTimeSettings
{
  return self->_faceTimeSettings;
}

- (void)setFaceTimeSettings:(id)a3
{
}

- (void)formatBandwidthConfig:(int)a3 maxBanxwidth:(unsigned int)a4 bandwidthString:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  if (a3 > 511)
  {
    if (a3 < 0x4000)
    {
      if (a3 <= 2047)
      {
        if (a3 == 512)
        {
          uint64_t v7 = @"mode_FaceTime_2G";
          goto LABEL_45;
        }
        if (a3 == 1024)
        {
          uint64_t v7 = @"mode_Screen_2G";
          goto LABEL_45;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x800:
            uint64_t v7 = @"mode_Default_2G";
            goto LABEL_45;
          case 0x1000:
            uint64_t v7 = @"mode_iPadCompanion_AWDL";
            goto LABEL_45;
          case 0x2000:
            uint64_t v7 = @"mode_iPadCompanion_USB";
            goto LABEL_45;
        }
      }
    }
    else if (a3 >= 0x20000)
    {
      switch(a3)
      {
        case 0x20000:
          uint64_t v7 = @"mode_MultiwayScreen_Wifi";
          goto LABEL_45;
        case 0x40000:
          uint64_t v7 = @"mode_LowLatencyScreen_Wired";
          goto LABEL_45;
        case 0x7FFFF:
          uint64_t v7 = @"mode_SUPPORTED";
          goto LABEL_45;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x4000:
          uint64_t v7 = @"mode_FaceTime_5G";
          goto LABEL_45;
        case 0x8000:
          uint64_t v7 = @"mode_RemoteCamera_AWDL";
          goto LABEL_45;
        case 0x10000:
          uint64_t v7 = @"mode_RemoteCamera_USB";
          goto LABEL_45;
      }
    }
LABEL_44:
    uint64_t v7 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    goto LABEL_45;
  }
  if (a3 > 15)
  {
    if (a3 <= 63)
    {
      if (a3 == 16)
      {
        uint64_t v7 = @"mode_Screen_Wifi";
        goto LABEL_45;
      }
      if (a3 == 32)
      {
        uint64_t v7 = @"mode_Screen_LTE";
        goto LABEL_45;
      }
    }
    else
    {
      switch(a3)
      {
        case 64:
          uint64_t v7 = @"mode_FaceTime_3G";
          goto LABEL_45;
        case 128:
          uint64_t v7 = @"mode_Screen_3G";
          goto LABEL_45;
        case 256:
          uint64_t v7 = @"mode_Default_3G";
          goto LABEL_45;
      }
    }
    goto LABEL_44;
  }
  uint64_t v7 = @"mode_Invalid";
  switch(a3)
  {
    case 0:
      break;
    case 1:
      uint64_t v7 = @"mode_Default_Wifi";
      break;
    case 2:
      uint64_t v7 = @"mode_Default_LTE";
      break;
    case 4:
      uint64_t v7 = @"mode_FaceTime_Wifi";
      break;
    case 8:
      uint64_t v7 = @"mode_FaceTime_LTE";
      break;
    default:
      goto LABEL_44;
  }
LABEL_45:
  uint64_t v8 = (void *)[(__CFString *)v7 componentsSeparatedByString:@"_"];
  if ([v8 count] == 3) {
    [a5 appendFormat:@" %@(%@)=%u,", objc_msgSend(v8, "objectAtIndex:", 1), objc_msgSend(v8, "objectAtIndex:", 2), v6];
  }
}

- (void)printBandwidthSettingsWithLogFile:(void *)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"Bandwidth Settings:"];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  bandwidthSettings = self->_bandwidthSettings;
  uint64_t v6 = [(NSMutableArray *)bandwidthSettings countByEnumeratingWithState:&v47 objects:v46 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v48 != v8) {
          objc_enumerationMutation(bandwidthSettings);
        }
        unint64_t v10 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        int v11 = [v10 configuration];
        if (v11)
        {
          int v12 = v11;
          int v13 = 1;
          do
          {
            if ((v13 & v12) != 0) {
              -[VCMediaNegotiationBlob formatBandwidthConfig:maxBanxwidth:bandwidthString:](self, "formatBandwidthConfig:maxBanxwidth:bandwidthString:", [v10 configuration], objc_msgSend(v10, "maxBandwidth"), v4);
            }
            v12 &= ~v13;
            v13 *= 2;
          }
          while (v12);
        }
      }
      uint64_t v7 = [(NSMutableArray *)bandwidthSettings countByEnumeratingWithState:&v47 objects:v46 count:16];
    }
    while (v7);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v14 = self->_bandwidthSettings;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v42 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(v14);
        }
        unint64_t v19 = *(void **)(*((void *)&v42 + 1) + 8 * j);
        int v20 = [v19 configurationExtension];
        if (v20)
        {
          int v21 = v20;
          int v22 = 1;
          do
          {
            if ((v22 & v21) != 0) {
              -[VCMediaNegotiationBlob formatBandwidthConfig:maxBanxwidth:bandwidthString:](self, "formatBandwidthConfig:maxBanxwidth:bandwidthString:", [v19 configurationExtension], objc_msgSend(v19, "maxBandwidth"), v4);
            }
            v21 &= ~v22;
            v22 *= 2;
          }
          while (v21);
        }
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v42 objects:v41 count:16];
    }
    while (v16);
  }
  uint64_t v23 = objc_msgSend((id)objc_msgSend(v4, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @",")), "UTF8String");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    long long v31 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v34 = v30;
      __int16 v35 = 2080;
      long long v36 = "-[VCMediaNegotiationBlob(Utils) printBandwidthSettingsWithLogFile:]";
      __int16 v37 = 1024;
      int v38 = 65;
      __int16 v39 = 2080;
      uint64_t v40 = v23;
      _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - %s", buf, 0x26u);
    }
  }
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob - %s\n", v24, v25, v26, v27, v28, v29, v23);
}

- (void)printCaptionsSettingsWithLogFile:(void *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = [(VCMediaNegotiationBlobCaptionsSettings *)self->_captionsSettings canDisplayCaptions];
      *(_DWORD *)buf = 136315906;
      uint64_t v29 = v5;
      __int16 v30 = 2080;
      long long v31 = "-[VCMediaNegotiationBlob(Utils) printCaptionsSettingsWithLogFile:]";
      __int16 v32 = 1024;
      int v33 = 70;
      __int16 v34 = 1024;
      LODWORD(v35) = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - Captions Settings: canDisplayCaptions=%d", buf, 0x22u);
    }
  }
  char v8 = [(VCMediaNegotiationBlobCaptionsSettings *)self->_captionsSettings canDisplayCaptions];
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob - Captions Settings: canDisplayCaptions=%d\n", v9, v10, v11, v12, v13, v14, v8);
  if ([(VCMediaNegotiationBlobCaptionsSettings *)self->_captionsSettings hasSenderLanguages])
  {
    uint64_t v15 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"Sender languages:"];
    uint64_t v16 = 1;
    do
    {
      uint64_t v17 = v16;
      if (([(VCMediaNegotiationBlobCaptionsSettings *)self->_captionsSettings senderLanguages] & v16) != 0)
      {
        if ((v17 - 1) >= 3) {
          uint64_t v18 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
        }
        else {
          uint64_t v18 = off_1E6DB9240[(int)v17 - 1];
        }
        [v15 appendFormat:@" %@,", v18];
      }
      uint64_t v16 = (2 * v17);
    }
    while ((v17 & 1) != 0);
    uint64_t v19 = objc_msgSend((id)objc_msgSend(v15, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @",")), "UTF8String");
    if ((int)VRTraceGetErrorLogLevelForModule() > 6)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      uint64_t v27 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v29 = v26;
        __int16 v30 = 2080;
        long long v31 = "-[VCMediaNegotiationBlob(Utils) printCaptionsSettingsWithLogFile:]";
        __int16 v32 = 1024;
        int v33 = 82;
        __int16 v34 = 2080;
        uint64_t v35 = v19;
        _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s", buf, 0x26u);
      }
    }
    VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v20, v21, v22, v23, v24, v25, v19);
  }
}

- (void)printMomentsSettingsWithLogFile:(void *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"Moments Settings:"];
  uint64_t v5 = 1;
  do
  {
    if (([(VCMediaNegotiationBlobMomentsSettings *)self->_momentsSettings capabilities] & v5) == 0) {
      goto LABEL_14;
    }
    if ((int)v5 > 3)
    {
      if (v5 == 4)
      {
        uint64_t v6 = @"history_video";
        goto LABEL_13;
      }
      if (v5 != 119) {
        goto LABEL_10;
      }
      uint64_t v6 = @"supported";
    }
    else
    {
      if (v5 == 1)
      {
        uint64_t v6 = @"no_history";
        goto LABEL_13;
      }
      if (v5 != 2)
      {
LABEL_10:
        uint64_t v6 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v5);
        goto LABEL_13;
      }
      uint64_t v6 = @"history_image";
    }
LABEL_13:
    [v4 appendFormat:@" %@,", v6];
LABEL_14:
    BOOL v7 = (v5 & 0x3B) == 0;
    uint64_t v5 = (2 * v5);
  }
  while (!v7);
  uint64_t v8 = 1;
  do
  {
    uint64_t v9 = v8;
    if (([(VCMediaNegotiationBlobMomentsSettings *)self->_momentsSettings supportedVideoCodecs] & v8) != 0)
    {
      if ((v9 - 1) >= 3) {
        uint64_t v10 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
      }
      else {
        uint64_t v10 = off_1E6DB9258[(int)v9 - 1];
      }
      [v4 appendFormat:@" %@,", v10];
    }
    uint64_t v8 = (2 * v9);
  }
  while ((v9 & 1) != 0);
  uint64_t v11 = 1;
  do
  {
    uint64_t v12 = v11;
    if (([(VCMediaNegotiationBlobMomentsSettings *)self->_momentsSettings supportedImageTypes] & v11) != 0)
    {
      if ((v12 - 1) >= 3) {
        uint64_t v13 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v12);
      }
      else {
        uint64_t v13 = off_1E6DB9270[(int)v12 - 1];
      }
      [v4 appendFormat:@" %@,", v13];
    }
    uint64_t v11 = (2 * v12);
  }
  while ((v12 & 1) != 0);
  uint64_t v14 = objc_msgSend((id)objc_msgSend(v4, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @",")), "UTF8String");
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    uint64_t v22 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v25 = v21;
      __int16 v26 = 2080;
      uint64_t v27 = "-[VCMediaNegotiationBlob(Utils) printMomentsSettingsWithLogFile:]";
      __int16 v28 = 1024;
      int v29 = 106;
      __int16 v30 = 2080;
      uint64_t v31 = v14;
      _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s", buf, 0x26u);
    }
  }
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v15, v16, v17, v18, v19, v20, v14);
}

- (void)printMultiwayAudioStreamsWithLogFile:(void *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [(NSMutableArray *)self->_multiwayAudioStreams count];
      *(_DWORD *)buf = 136315906;
      uint64_t v26 = v5;
      __int16 v27 = 2080;
      __int16 v28 = "-[VCMediaNegotiationBlob(Utils) printMultiwayAudioStreamsWithLogFile:]";
      __int16 v29 = 1024;
      int v30 = 111;
      __int16 v31 = 1024;
      int v32 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - Multiway Audio: count=%d", buf, 0x22u);
    }
  }
  char v8 = [(NSMutableArray *)self->_multiwayAudioStreams count];
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob - Multiway Audio: count=%d\n", v9, v10, v11, v12, v13, v14, v8);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  multiwayAudioStreams = self->_multiwayAudioStreams;
  uint64_t v16 = [(NSMutableArray *)multiwayAudioStreams countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(multiwayAudioStreams);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v19++) printWithLogFile:a3];
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)multiwayAudioStreams countByEnumeratingWithState:&v21 objects:v20 count:16];
    }
    while (v17);
  }
}

- (void)printMultiwayVideoStreamsWithLogFile:(void *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() > 6)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = [(NSMutableArray *)self->_multiwayVideoStreams count];
      *(_DWORD *)buf = 136315906;
      uint64_t v26 = v5;
      __int16 v27 = 2080;
      __int16 v28 = "-[VCMediaNegotiationBlob(Utils) printMultiwayVideoStreamsWithLogFile:]";
      __int16 v29 = 1024;
      int v30 = 119;
      __int16 v31 = 1024;
      int v32 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - Multiway Video: count=%d", buf, 0x22u);
    }
  }
  char v8 = [(NSMutableArray *)self->_multiwayVideoStreams count];
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob - Multiway Video: count=%d\n", v9, v10, v11, v12, v13, v14, v8);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  multiwayVideoStreams = self->_multiwayVideoStreams;
  uint64_t v16 = [(NSMutableArray *)multiwayVideoStreams countByEnumeratingWithState:&v21 objects:v20 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v22;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v22 != v18) {
          objc_enumerationMutation(multiwayVideoStreams);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * v19++) printWithLogFile:a3];
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)multiwayVideoStreams countByEnumeratingWithState:&v21 objects:v20 count:16];
    }
    while (v17);
  }
}

- (void)printWithTitle:(id)a3 blobSize:(unsigned int)a4 logFile:(void *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@ (size=%u): UserAgent=%s", a3, *(void *)&a4, -[NSString UTF8String](self->_userAgent, "UTF8String")];
  if ([(VCMediaNegotiationBlob *)self hasBasebandCodec]) {
    [v7 appendFormat:@", basebandCodec=%@, basebandCodecSampleRate=%u", self->_basebandCodec, self->_basebandCodecSampleRate];
  }
  if ([(VCMediaNegotiationBlob *)self hasAllowDynamicMaxBitrate]) {
    [v7 appendFormat:@", allowDynamicMaxBitrate=%d", self->_allowDynamicMaxBitrate];
  }
  if ([(VCMediaNegotiationBlob *)self hasAllowsContentsChangeWithAspectPreservation])
  {
    [v7 appendFormat:@", allowsContentsChangeWithAspectPreservation=%d", self->_allowsContentsChangeWithAspectPreservation];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v18 = v8;
      __int16 v19 = 2080;
      uint64_t v20 = "-[VCMediaNegotiationBlob(Utils) printWithTitle:blobSize:logFile:]";
      __int16 v21 = 1024;
      int v22 = 137;
      __int16 v23 = 2080;
      uint64_t v24 = [v7 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - %s", buf, 0x26u);
    }
  }
  char v10 = [v7 UTF8String];
  VRLogfilePrintWithTimestamp((uint64_t)a5, "Media Blob - %s\n", v11, v12, v13, v14, v15, v16, v10);
  if ([(VCMediaNegotiationBlob *)self hasAudioSettings]) {
    [(VCMediaNegotiationBlobAudioSettings *)self->_audioSettings printWithLogFile:a5];
  }
  if ([(VCMediaNegotiationBlob *)self hasVideoSettings]) {
    [(VCMediaNegotiationBlobVideoSettings *)self->_videoSettings printVideoWithLogFile:a5];
  }
  if ([(VCMediaNegotiationBlob *)self hasScreenSettings]) {
    [(VCMediaNegotiationBlobVideoSettings *)self->_screenSettings printScreenWithLogFile:a5];
  }
  if ([(NSMutableArray *)self->_bandwidthSettings count]) {
    [(VCMediaNegotiationBlob *)self printBandwidthSettingsWithLogFile:a5];
  }
  if ([(VCMediaNegotiationBlob *)self hasCaptionsSettings]) {
    [(VCMediaNegotiationBlob *)self printCaptionsSettingsWithLogFile:a5];
  }
  if ([(VCMediaNegotiationBlob *)self hasMomentsSettings]) {
    [(VCMediaNegotiationBlob *)self printMomentsSettingsWithLogFile:a5];
  }
  if ([(NSMutableArray *)self->_multiwayAudioStreams count]) {
    [(VCMediaNegotiationBlob *)self printMultiwayAudioStreamsWithLogFile:a5];
  }
  if ([(NSMutableArray *)self->_multiwayVideoStreams count]) {
    [(VCMediaNegotiationBlob *)self printMultiwayVideoStreamsWithLogFile:a5];
  }
}

@end