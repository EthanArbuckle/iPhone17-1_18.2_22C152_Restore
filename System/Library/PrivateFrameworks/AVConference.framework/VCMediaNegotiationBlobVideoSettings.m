@interface VCMediaNegotiationBlobVideoSettings
+ (Class)videoPayloadCollectionsType;
+ (unsigned)hdrModesBitmapWithSupportedModes:(id)a3;
+ (unsigned)storePixelFormatsInBitMap:(id)a3;
- (BOOL)allowRTCPFB;
- (BOOL)blackFrameOnClearScreenEnabled;
- (BOOL)fecEnabled;
- (BOOL)foveationSupported;
- (BOOL)hasBlackFrameOnClearScreenEnabled;
- (BOOL)hasCustomVideoHeight;
- (BOOL)hasCustomVideoWidth;
- (BOOL)hasFecEnabled;
- (BOOL)hasFoveationSupported;
- (BOOL)hasHdrModesSupported;
- (BOOL)hasLtrpEnabled;
- (BOOL)hasPixelFormats;
- (BOOL)hasRtxEnabled;
- (BOOL)hasTilesPerFrame;
- (BOOL)isEqual:(id)a3;
- (BOOL)ltrpEnabled;
- (BOOL)readFrom:(id)a3;
- (BOOL)rtxEnabled;
- (BOOL)setVideoRuleCollections:(id)a3 featureStrings:(id)a4 isScreen:(BOOL)a5 isCellular16x9Capable:(BOOL)a6;
- (NSMutableArray)videoPayloadCollections;
- (VCMediaNegotiationBlobVideoSettings)initWithSSRC:(unsigned int)a3 allowRTCPFB:(BOOL)a4 videoRuleCollections:(id)a5 featureStrings:(id)a6 isCellular16x9Capable:(BOOL)a7 tilesPerFrame:(unsigned int)a8 ltrpEnabled:(BOOL)a9 pixelFormats:(id)a10 hdrModesSupported:(id)a11;
- (VCMediaNegotiationBlobVideoSettings)initWithScreenSSRC:(unsigned int)a3 allowRTCPFB:(BOOL)a4 videoRuleCollections:(id)a5 featureStrings:(id)a6 isCellular16x9Capable:(BOOL)a7 customVideoWidth:(unsigned int)a8 customVideoHeight:(unsigned int)a9 tilesPerFrame:(unsigned int)a10 ltrpEnabled:(BOOL)a11 pixelFormats:(id)a12 hdrModesSupported:(id)a13 fecEnabled:(BOOL)a14 rtxEnabled:(BOOL)a15 blackFrameOnClearScreenEnabled:(BOOL)a16 foveationSupported:(BOOL)a17;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)getPayloadSettingsForPayload:(int)a3;
- (id)newCameraConfiguration;
- (id)newFeatureStrings;
- (id)newScreenConfigurationWithCameraConfiguration:(id)a3;
- (id)newVideoRuleCollectionsForScreen:(BOOL)a3 isCellular16x9Capable:(BOOL)a4 isLocalConfig:(BOOL)a5;
- (id)parameterSetStringFromPayloadSettings:(id)a3;
- (id)videoPayloadCollectionsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)videoPayloadCollectionsCount;
- (unsigned)customVideoHeight;
- (unsigned)customVideoWidth;
- (unsigned)hdrModesSupported;
- (unsigned)pixelFormats;
- (unsigned)rtpSSRC;
- (unsigned)tilesPerFrame;
- (void)addVideoPayloadCollections:(id)a3;
- (void)checkAndInsertRuleWithWidth:(unsigned int)a3 height:(unsigned int)a4 framerate:(int)a5 payload:(int)a6 priority:(double)a7 negotiationBitfield:(unsigned int *)a8 negotiationBit:(unsigned int)a9 rules:(id)a10 isCellular16x9Capable:(BOOL)a11;
- (void)clearVideoPayloadCollections;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)prepareFormatString:(id)a3 format:(id)a4 formatIndex:(unsigned int)a5 preferredFormat:(unsigned int)a6;
- (void)printScreenWithLogFile:(void *)a3;
- (void)printVideoWithLogFile:(void *)a3;
- (void)setAllowRTCPFB:(BOOL)a3;
- (void)setBlackFrameOnClearScreenEnabled:(BOOL)a3;
- (void)setCustomVideoHeight:(unsigned int)a3;
- (void)setCustomVideoWidth:(unsigned int)a3;
- (void)setFecEnabled:(BOOL)a3;
- (void)setFoveationSupported:(BOOL)a3;
- (void)setHasBlackFrameOnClearScreenEnabled:(BOOL)a3;
- (void)setHasCustomVideoHeight:(BOOL)a3;
- (void)setHasCustomVideoWidth:(BOOL)a3;
- (void)setHasFecEnabled:(BOOL)a3;
- (void)setHasFoveationSupported:(BOOL)a3;
- (void)setHasHdrModesSupported:(BOOL)a3;
- (void)setHasLtrpEnabled:(BOOL)a3;
- (void)setHasPixelFormats:(BOOL)a3;
- (void)setHasRtxEnabled:(BOOL)a3;
- (void)setHasTilesPerFrame:(BOOL)a3;
- (void)setHdrModesSupported:(unsigned int)a3;
- (void)setLtrpEnabled:(BOOL)a3;
- (void)setPixelFormats:(unsigned int)a3;
- (void)setRtpSSRC:(unsigned int)a3;
- (void)setRtxEnabled:(BOOL)a3;
- (void)setTilesPerFrame:(unsigned int)a3;
- (void)setVideoPayloadCollections:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobVideoSettings

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaNegotiationBlobVideoSettings *)self setVideoPayloadCollections:0];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobVideoSettings;
  [(VCMediaNegotiationBlobVideoSettings *)&v3 dealloc];
}

- (void)clearVideoPayloadCollections
{
}

- (void)addVideoPayloadCollections:(id)a3
{
  videoPayloadCollections = self->_videoPayloadCollections;
  if (!videoPayloadCollections)
  {
    videoPayloadCollections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_videoPayloadCollections = videoPayloadCollections;
  }

  [(NSMutableArray *)videoPayloadCollections addObject:a3];
}

- (unint64_t)videoPayloadCollectionsCount
{
  return [(NSMutableArray *)self->_videoPayloadCollections count];
}

- (id)videoPayloadCollectionsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_videoPayloadCollections objectAtIndex:a3];
}

+ (Class)videoPayloadCollectionsType
{
  return (Class)objc_opt_class();
}

- (unsigned)customVideoWidth
{
  if ((*(_WORD *)&self->_has & 2) != 0) {
    return self->_customVideoWidth;
  }
  else {
    return 0;
  }
}

- (void)setCustomVideoWidth:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_customVideoWidth = a3;
}

- (void)setHasCustomVideoWidth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCustomVideoWidth
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (unsigned)customVideoHeight
{
  if (*(_WORD *)&self->_has) {
    return self->_customVideoHeight;
  }
  else {
    return 0;
  }
}

- (void)setCustomVideoHeight:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_customVideoHeight = a3;
}

- (void)setHasCustomVideoHeight:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCustomVideoHeight
{
  return *(_WORD *)&self->_has & 1;
}

- (unsigned)tilesPerFrame
{
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
    return self->_tilesPerFrame;
  }
  else {
    return 1;
  }
}

- (void)setTilesPerFrame:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_tilesPerFrame = a3;
}

- (void)setHasTilesPerFrame:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasTilesPerFrame
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)ltrpEnabled
{
  return (*(_WORD *)&self->_has & 0x100) != 0 && self->_ltrpEnabled;
}

- (void)setLtrpEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_ltrpEnabled = a3;
}

- (void)setHasLtrpEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasLtrpEnabled
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPixelFormats:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_pixelFormats = a3;
}

- (void)setHasPixelFormats:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPixelFormats
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setHdrModesSupported:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_hdrModesSupported = a3;
}

- (void)setHasHdrModesSupported:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasHdrModesSupported
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setFecEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_fecEnabled = a3;
}

- (void)setHasFecEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFecEnabled
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRtxEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_rtxEnabled = a3;
}

- (void)setHasRtxEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasRtxEnabled
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setBlackFrameOnClearScreenEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_blackFrameOnClearScreenEnabled = a3;
}

- (void)setHasBlackFrameOnClearScreenEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasBlackFrameOnClearScreenEnabled
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (BOOL)foveationSupported
{
  return (*(_WORD *)&self->_has & 0x80) != 0 && self->_foveationSupported;
}

- (void)setFoveationSupported:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_foveationSupported = a3;
}

- (void)setHasFoveationSupported:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasFoveationSupported
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobVideoSettings;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobVideoSettings description](&v3, sel_description), -[VCMediaNegotiationBlobVideoSettings dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rtpSSRC), @"rtpSSRC");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_allowRTCPFB), @"allowRTCPFB");
  if ([(NSMutableArray *)self->_videoPayloadCollections count])
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_videoPayloadCollections, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    videoPayloadCollections = self->_videoPayloadCollections;
    uint64_t v6 = [(NSMutableArray *)videoPayloadCollections countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(videoPayloadCollections);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        uint64_t v7 = [(NSMutableArray *)videoPayloadCollections countByEnumeratingWithState:&v13 objects:v12 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"videoPayloadCollections"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_customVideoWidth), @"customVideoWidth");
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_12:
      if ((has & 0x10) == 0) {
        goto LABEL_13;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_customVideoHeight), @"customVideoHeight");
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_tilesPerFrame), @"tilesPerFrame");
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_14:
    if ((has & 8) == 0) {
      goto LABEL_15;
    }
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_ltrpEnabled), @"ltrpEnabled");
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_15:
    if ((has & 4) == 0) {
      goto LABEL_16;
    }
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_pixelFormats), @"pixelFormats");
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_16:
    if ((has & 0x40) == 0) {
      goto LABEL_17;
    }
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_hdrModesSupported), @"hdrModesSupported");
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_17:
    if ((has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_fecEnabled), @"fecEnabled");
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_18:
    if ((has & 0x20) == 0) {
      goto LABEL_19;
    }
LABEL_30:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_blackFrameOnClearScreenEnabled), @"blackFrameOnClearScreenEnabled");
    if ((*(_WORD *)&self->_has & 0x80) == 0) {
      return v3;
    }
    goto LABEL_20;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_rtxEnabled), @"rtxEnabled");
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_30;
  }
LABEL_19:
  if ((has & 0x80) != 0) {
LABEL_20:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_foveationSupported), @"foveationSupported");
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobVideoSettingsReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteBOOLField();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  videoPayloadCollections = self->_videoPayloadCollections;
  uint64_t v5 = [(NSMutableArray *)videoPayloadCollections countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(videoPayloadCollections);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)videoPayloadCollections countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_10:
      if ((has & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_10;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_15:
    if ((has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_16:
    if ((has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_17:
    if ((has & 0x80) == 0) {
      return;
    }
    goto LABEL_18;
  }
LABEL_28:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x80) == 0) {
    return;
  }
LABEL_18:
  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 6) = self->_rtpSSRC;
  *((unsigned char *)a3 + 40) = self->_allowRTCPFB;
  if ([(VCMediaNegotiationBlobVideoSettings *)self videoPayloadCollectionsCount])
  {
    [a3 clearVideoPayloadCollections];
    unint64_t v5 = [(VCMediaNegotiationBlobVideoSettings *)self videoPayloadCollectionsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(a3, "addVideoPayloadCollections:", -[VCMediaNegotiationBlobVideoSettings videoPayloadCollectionsAtIndex:](self, "videoPayloadCollectionsAtIndex:", i));
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_customVideoWidth;
    *((_WORD *)a3 + 24) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 0x10) == 0) {
        goto LABEL_8;
      }
      goto LABEL_19;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)a3 + 2) = self->_customVideoHeight;
  *((_WORD *)a3 + 24) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x100) == 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 7) = self->_tilesPerFrame;
  *((_WORD *)a3 + 24) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((unsigned char *)a3 + 44) = self->_ltrpEnabled;
  *((_WORD *)a3 + 24) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 5) = self->_pixelFormats;
  *((_WORD *)a3 + 24) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 4) = self->_hdrModesSupported;
  *((_WORD *)a3 + 24) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 0x200) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((unsigned char *)a3 + 42) = self->_fecEnabled;
  *((_WORD *)a3 + 24) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((unsigned char *)a3 + 45) = self->_rtxEnabled;
  *((_WORD *)a3 + 24) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_14:
    if ((has & 0x80) == 0) {
      return;
    }
    goto LABEL_15;
  }
LABEL_25:
  *((unsigned char *)a3 + 41) = self->_blackFrameOnClearScreenEnabled;
  *((_WORD *)a3 + 24) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x80) == 0) {
    return;
  }
LABEL_15:
  *((unsigned char *)a3 + 43) = self->_foveationSupported;
  *((_WORD *)a3 + 24) |= 0x80u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_rtpSSRC;
  *(unsigned char *)(v5 + 40) = self->_allowRTCPFB;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  videoPayloadCollections = self->_videoPayloadCollections;
  uint64_t v7 = [(NSMutableArray *)videoPayloadCollections countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(videoPayloadCollections);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addVideoPayloadCollections:v11];
      }
      uint64_t v8 = [(NSMutableArray *)videoPayloadCollections countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v8);
  }
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 12) = self->_customVideoWidth;
    *(_WORD *)(v5 + 48) |= 2u;
    __int16 has = (__int16)self->_has;
    if ((has & 1) == 0)
    {
LABEL_10:
      if ((has & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_22;
    }
  }
  else if ((has & 1) == 0)
  {
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 8) = self->_customVideoHeight;
  *(_WORD *)(v5 + 48) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(_DWORD *)(v5 + 28) = self->_tilesPerFrame;
  *(_WORD *)(v5 + 48) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_12:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(unsigned char *)(v5 + 44) = self->_ltrpEnabled;
  *(_WORD *)(v5 + 48) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_13:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 20) = self->_pixelFormats;
  *(_WORD *)(v5 + 48) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(_DWORD *)(v5 + 16) = self->_hdrModesSupported;
  *(_WORD *)(v5 + 48) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_15:
    if ((has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(unsigned char *)(v5 + 42) = self->_fecEnabled;
  *(_WORD *)(v5 + 48) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_16:
    if ((has & 0x20) == 0) {
      goto LABEL_17;
    }
LABEL_28:
    *(unsigned char *)(v5 + 41) = self->_blackFrameOnClearScreenEnabled;
    *(_WORD *)(v5 + 48) |= 0x20u;
    if ((*(_WORD *)&self->_has & 0x80) == 0) {
      return (id)v5;
    }
    goto LABEL_18;
  }
LABEL_27:
  *(unsigned char *)(v5 + 45) = self->_rtxEnabled;
  *(_WORD *)(v5 + 48) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0) {
    goto LABEL_28;
  }
LABEL_17:
  if ((has & 0x80) != 0)
  {
LABEL_18:
    *(unsigned char *)(v5 + 43) = self->_foveationSupported;
    *(_WORD *)(v5 + 48) |= 0x80u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  if (self->_rtpSSRC != *((_DWORD *)a3 + 6)) {
    goto LABEL_68;
  }
  if (self->_allowRTCPFB)
  {
    if (!*((unsigned char *)a3 + 40)) {
      goto LABEL_68;
    }
  }
  else if (*((unsigned char *)a3 + 40))
  {
    goto LABEL_68;
  }
  videoPayloadCollections = self->_videoPayloadCollections;
  if ((unint64_t)videoPayloadCollections | *((void *)a3 + 4))
  {
    int v5 = -[NSMutableArray isEqual:](videoPayloadCollections, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v8 = *((_WORD *)a3 + 24);
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_customVideoWidth != *((_DWORD *)a3 + 3)) {
      goto LABEL_68;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_68;
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_customVideoHeight != *((_DWORD *)a3 + 2)) {
      goto LABEL_68;
    }
  }
  else if (v8)
  {
    goto LABEL_68;
  }
  if ((has & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_tilesPerFrame != *((_DWORD *)a3 + 7)) {
      goto LABEL_68;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 24) & 0x100) == 0) {
      goto LABEL_68;
    }
    if (self->_ltrpEnabled)
    {
      if (!*((unsigned char *)a3 + 44)) {
        goto LABEL_68;
      }
    }
    else if (*((unsigned char *)a3 + 44))
    {
      goto LABEL_68;
    }
  }
  else if ((*((_WORD *)a3 + 24) & 0x100) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_pixelFormats != *((_DWORD *)a3 + 5)) {
      goto LABEL_68;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_hdrModesSupported != *((_DWORD *)a3 + 4)) {
      goto LABEL_68;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0) {
      goto LABEL_68;
    }
    if (self->_fecEnabled)
    {
      if (!*((unsigned char *)a3 + 42)) {
        goto LABEL_68;
      }
    }
    else if (*((unsigned char *)a3 + 42))
    {
      goto LABEL_68;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_68;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)a3 + 24) & 0x200) == 0) {
      goto LABEL_68;
    }
    if (self->_rtxEnabled)
    {
      if (!*((unsigned char *)a3 + 45)) {
        goto LABEL_68;
      }
    }
    else if (*((unsigned char *)a3 + 45))
    {
      goto LABEL_68;
    }
  }
  else if ((*((_WORD *)a3 + 24) & 0x200) != 0)
  {
    goto LABEL_68;
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) != 0)
    {
      if (self->_blackFrameOnClearScreenEnabled)
      {
        if (!*((unsigned char *)a3 + 41)) {
          goto LABEL_68;
        }
        goto LABEL_66;
      }
      if (!*((unsigned char *)a3 + 41)) {
        goto LABEL_66;
      }
    }
LABEL_68:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((v8 & 0x20) != 0) {
    goto LABEL_68;
  }
LABEL_66:
  LOBYTE(v5) = (v8 & 0x80) == 0;
  if ((has & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0) {
      goto LABEL_68;
    }
    if (self->_foveationSupported)
    {
      if (!*((unsigned char *)a3 + 43)) {
        goto LABEL_68;
      }
    }
    else if (*((unsigned char *)a3 + 43))
    {
      goto LABEL_68;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unsigned int rtpSSRC = self->_rtpSSRC;
  BOOL allowRTCPFB = self->_allowRTCPFB;
  uint64_t v5 = [(NSMutableArray *)self->_videoPayloadCollections hash];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_customVideoWidth;
    if (has)
    {
LABEL_3:
      uint64_t v8 = 2654435761 * self->_customVideoHeight;
      if ((has & 0x10) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (has) {
      goto LABEL_3;
    }
  }
  uint64_t v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_4:
    uint64_t v9 = 2654435761 * self->_tilesPerFrame;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v9 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_5:
    uint64_t v10 = 2654435761 * self->_ltrpEnabled;
    if ((has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v10 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    uint64_t v11 = 2654435761 * self->_pixelFormats;
    if ((has & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v11 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    uint64_t v12 = 2654435761 * self->_hdrModesSupported;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v12 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v13 = 2654435761 * self->_fecEnabled;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v13 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    uint64_t v14 = 2654435761 * self->_rtxEnabled;
    if ((has & 0x20) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v15 = 0;
    if ((has & 0x80) != 0) {
      goto LABEL_11;
    }
LABEL_21:
    uint64_t v16 = 0;
    return (2654435761 * allowRTCPFB) ^ (2654435761 * rtpSSRC) ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_19:
  uint64_t v14 = 0;
  if ((has & 0x20) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v15 = 2654435761 * self->_blackFrameOnClearScreenEnabled;
  if ((has & 0x80) == 0) {
    goto LABEL_21;
  }
LABEL_11:
  uint64_t v16 = 2654435761 * self->_foveationSupported;
  return (2654435761 * allowRTCPFB) ^ (2654435761 * rtpSSRC) ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  self->_unsigned int rtpSSRC = *((_DWORD *)a3 + 6);
  self->_BOOL allowRTCPFB = *((unsigned char *)a3 + 40);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 4);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [(VCMediaNegotiationBlobVideoSettings *)self addVideoPayloadCollections:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v11 count:16];
    }
    while (v7);
  }
  __int16 v10 = *((_WORD *)a3 + 24);
  if ((v10 & 2) != 0)
  {
    self->_customVideoWidth = *((_DWORD *)a3 + 3);
    *(_WORD *)&self->_has |= 2u;
    __int16 v10 = *((_WORD *)a3 + 24);
    if ((v10 & 1) == 0)
    {
LABEL_10:
      if ((v10 & 0x10) == 0) {
        goto LABEL_11;
      }
      goto LABEL_22;
    }
  }
  else if ((v10 & 1) == 0)
  {
    goto LABEL_10;
  }
  self->_customVideoHeight = *((_DWORD *)a3 + 2);
  *(_WORD *)&self->_has |= 1u;
  __int16 v10 = *((_WORD *)a3 + 24);
  if ((v10 & 0x10) == 0)
  {
LABEL_11:
    if ((v10 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_tilesPerFrame = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v10 = *((_WORD *)a3 + 24);
  if ((v10 & 0x100) == 0)
  {
LABEL_12:
    if ((v10 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_ltrpEnabled = *((unsigned char *)a3 + 44);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v10 = *((_WORD *)a3 + 24);
  if ((v10 & 8) == 0)
  {
LABEL_13:
    if ((v10 & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_pixelFormats = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 8u;
  __int16 v10 = *((_WORD *)a3 + 24);
  if ((v10 & 4) == 0)
  {
LABEL_14:
    if ((v10 & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_hdrModesSupported = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 4u;
  __int16 v10 = *((_WORD *)a3 + 24);
  if ((v10 & 0x40) == 0)
  {
LABEL_15:
    if ((v10 & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_fecEnabled = *((unsigned char *)a3 + 42);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v10 = *((_WORD *)a3 + 24);
  if ((v10 & 0x200) == 0)
  {
LABEL_16:
    if ((v10 & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_rtxEnabled = *((unsigned char *)a3 + 45);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v10 = *((_WORD *)a3 + 24);
  if ((v10 & 0x20) == 0)
  {
LABEL_17:
    if ((v10 & 0x80) == 0) {
      return;
    }
    goto LABEL_18;
  }
LABEL_28:
  self->_blackFrameOnClearScreenEnabled = *((unsigned char *)a3 + 41);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 24) & 0x80) == 0) {
    return;
  }
LABEL_18:
  self->_foveationSupported = *((unsigned char *)a3 + 43);
  *(_WORD *)&self->_has |= 0x80u;
}

- (unsigned)rtpSSRC
{
  return self->_rtpSSRC;
}

- (void)setRtpSSRC:(unsigned int)a3
{
  self->_unsigned int rtpSSRC = a3;
}

- (BOOL)allowRTCPFB
{
  return self->_allowRTCPFB;
}

- (void)setAllowRTCPFB:(BOOL)a3
{
  self->_BOOL allowRTCPFB = a3;
}

- (NSMutableArray)videoPayloadCollections
{
  return self->_videoPayloadCollections;
}

- (void)setVideoPayloadCollections:(id)a3
{
}

- (unsigned)pixelFormats
{
  return self->_pixelFormats;
}

- (unsigned)hdrModesSupported
{
  return self->_hdrModesSupported;
}

- (BOOL)fecEnabled
{
  return self->_fecEnabled;
}

- (BOOL)rtxEnabled
{
  return self->_rtxEnabled;
}

- (BOOL)blackFrameOnClearScreenEnabled
{
  return self->_blackFrameOnClearScreenEnabled;
}

- (VCMediaNegotiationBlobVideoSettings)initWithSSRC:(unsigned int)a3 allowRTCPFB:(BOOL)a4 videoRuleCollections:(id)a5 featureStrings:(id)a6 isCellular16x9Capable:(BOOL)a7 tilesPerFrame:(unsigned int)a8 ltrpEnabled:(BOOL)a9 pixelFormats:(id)a10 hdrModesSupported:(id)a11
{
  BOOL v12 = a7;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v17 = [(VCMediaNegotiationBlobVideoSettings *)self init];
  long long v18 = v17;
  if (v17)
  {
    v17->_unsigned int rtpSSRC = a3;
    v17->_BOOL allowRTCPFB = a4;
    if (a8 >= 2)
    {
      *(_WORD *)&v17->_has |= 0x10u;
      v17->_tilesPerFrame = a8;
    }
    if (a9)
    {
      *(_WORD *)&v17->_has |= 0x100u;
      v17->_ltrpEnabled = a9;
    }
    if ([(VCMediaNegotiationBlobVideoSettings *)v17 setVideoRuleCollections:a5 featureStrings:a6 isScreen:0 isCellular16x9Capable:v12])
    {
      if (a10)
      {
        unsigned int v19 = +[VCMediaNegotiationBlobVideoSettings storePixelFormatsInBitMap:](VCMediaNegotiationBlobVideoSettings, "storePixelFormatsInBitMap:");
        v18->_pixelFormats = v19;
        if (v19)
        {
          *(_WORD *)&v18->_has |= 8u;
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v20 = VRTraceErrorLogLevelToCSTR();
          v21 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v26 = 136315650;
            uint64_t v27 = v20;
            __int16 v28 = 2080;
            v29 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) initWithSSRC:allowRTCPFB:videoRuleCollections:featur"
                  "eStrings:isCellular16x9Capable:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:]";
            __int16 v30 = 1024;
            int v31 = 202;
            _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No pixel format set to negotiate", (uint8_t *)&v26, 0x1Cu);
          }
        }
      }
      if (a11)
      {
        unsigned int v22 = +[VCMediaNegotiationBlobVideoSettings hdrModesBitmapWithSupportedModes:a11];
        v18->_hdrModesSupported = v22;
        if (v22)
        {
          *(_WORD *)&v18->_has |= 4u;
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v23 = VRTraceErrorLogLevelToCSTR();
          v24 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v26 = 136315650;
            uint64_t v27 = v23;
            __int16 v28 = 2080;
            v29 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) initWithSSRC:allowRTCPFB:videoRuleCollections:featur"
                  "eStrings:isCellular16x9Capable:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:]";
            __int16 v30 = 1024;
            int v31 = 210;
            _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No HDR modes to negotiate", (uint8_t *)&v26, 0x1Cu);
          }
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobVideoSettings(VideoRules) initWithSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:]();
        }
      }

      return 0;
    }
  }
  return v18;
}

- (VCMediaNegotiationBlobVideoSettings)initWithScreenSSRC:(unsigned int)a3 allowRTCPFB:(BOOL)a4 videoRuleCollections:(id)a5 featureStrings:(id)a6 isCellular16x9Capable:(BOOL)a7 customVideoWidth:(unsigned int)a8 customVideoHeight:(unsigned int)a9 tilesPerFrame:(unsigned int)a10 ltrpEnabled:(BOOL)a11 pixelFormats:(id)a12 hdrModesSupported:(id)a13 fecEnabled:(BOOL)a14 rtxEnabled:(BOOL)a15 blackFrameOnClearScreenEnabled:(BOOL)a16 foveationSupported:(BOOL)a17
{
  BOOL v18 = a7;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = [(VCMediaNegotiationBlobVideoSettings *)self init];
  v24 = v23;
  if (!v23) {
    return v24;
  }
  v23->_unsigned int rtpSSRC = a3;
  v23->_BOOL allowRTCPFB = a4;
  [(VCMediaNegotiationBlobVideoSettings *)v23 setBlackFrameOnClearScreenEnabled:a16];
  if (a8)
  {
    *(_WORD *)&v24->_has |= 2u;
    v24->_customVideoWidth = a8;
  }
  if (a9)
  {
    *(_WORD *)&v24->_has |= 1u;
    v24->_customVideoHeight = a9;
  }
  if (a10 >= 2)
  {
    *(_WORD *)&v24->_has |= 0x10u;
    v24->_tilesPerFrame = a10;
  }
  if (a11)
  {
    *(_WORD *)&v24->_has |= 0x100u;
    v24->_ltrpEnabled = a11;
  }
  if (a14)
  {
    *(_WORD *)&v24->_has |= 0x40u;
    v24->_fecEnabled = a14;
    if (!a15)
    {
LABEL_12:
      if (!a17) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if (!a15)
  {
    goto LABEL_12;
  }
  *(_WORD *)&v24->_has |= 0x200u;
  v24->_rtxEnabled = a15;
  if (a17)
  {
LABEL_13:
    *(_WORD *)&v24->_has |= 0x80u;
    v24->_foveationSupported = a17;
  }
LABEL_14:
  if ([(VCMediaNegotiationBlobVideoSettings *)v24 setVideoRuleCollections:a5 featureStrings:a6 isScreen:1 isCellular16x9Capable:v18])
  {
    if (a12)
    {
      unsigned int v25 = +[VCMediaNegotiationBlobVideoSettings storePixelFormatsInBitMap:](VCMediaNegotiationBlobVideoSettings, "storePixelFormatsInBitMap:");
      v24->_pixelFormats = v25;
      if (v25)
      {
        *(_WORD *)&v24->_has |= 8u;
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v26 = VRTraceErrorLogLevelToCSTR();
        uint64_t v27 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v32 = 136315650;
          uint64_t v33 = v26;
          __int16 v34 = 2080;
          v35 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) initWithScreenSSRC:allowRTCPFB:videoRuleCollections:fe"
                "atureStrings:isCellular16x9Capable:customVideoWidth:customVideoHeight:tilesPerFrame:ltrpEnabled:pixelFor"
                "mats:hdrModesSupported:fecEnabled:rtxEnabled:blackFrameOnClearScreenEnabled:foveationSupported:]";
          __int16 v36 = 1024;
          int v37 = 270;
          _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No pixel format set to negotiate", (uint8_t *)&v32, 0x1Cu);
        }
      }
    }
    if (a13)
    {
      unsigned int v28 = +[VCMediaNegotiationBlobVideoSettings hdrModesBitmapWithSupportedModes:a13];
      v24->_hdrModesSupported = v28;
      if (v28)
      {
        *(_WORD *)&v24->_has |= 4u;
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        __int16 v30 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v32 = 136315650;
          uint64_t v33 = v29;
          __int16 v34 = 2080;
          v35 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) initWithScreenSSRC:allowRTCPFB:videoRuleCollections:fe"
                "atureStrings:isCellular16x9Capable:customVideoWidth:customVideoHeight:tilesPerFrame:ltrpEnabled:pixelFor"
                "mats:hdrModesSupported:fecEnabled:rtxEnabled:blackFrameOnClearScreenEnabled:foveationSupported:]";
          __int16 v36 = 1024;
          int v37 = 278;
          _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No HDR modes to negotiate", (uint8_t *)&v32, 0x1Cu);
        }
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobVideoSettings(VideoRules) initWithScreenSSRC:allowRTCPFB:videoRuleCollections:featureStrings:isCellular16x9Capable:customVideoWidth:customVideoHeight:tilesPerFrame:ltrpEnabled:pixelFormats:hdrModesSupported:fecEnabled:rtxEnabled:blackFrameOnClearScreenEnabled:foveationSupported:]();
      }
    }

    return 0;
  }
  return v24;
}

+ (unsigned)storePixelFormatsInBitMap:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  unsigned int v6 = 0;
  uint64_t v7 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(a3);
      }
      int v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) intValue];
      if (v9 > 875836533)
      {
        switch(v9)
        {
          case 875836534:
            v6 |= 0x10u;
            break;
          case 2016686640:
            v6 |= 4u;
            break;
          case 2019963956:
            v6 |= 0x20u;
            break;
        }
      }
      else
      {
        switch(v9)
        {
          case 875704422:
            v6 |= 1u;
            break;
          case 875704438:
            v6 |= 2u;
            break;
          case 875836518:
            v6 |= 8u;
            break;
        }
      }
    }
    uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  }
  while (v5);
  return v6;
}

+ (unsigned)hdrModesBitmapWithSupportedModes:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  unsigned int v6 = 0;
  uint64_t v7 = *(void *)v12;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(a3);
      }
      switch([*(id *)(*((void *)&v11 + 1) + 8 * i) intValue])
      {
        case 0u:
          v6 |= 1u;
          break;
        case 1u:
          v6 |= 2u;
          break;
        case 2u:
          v6 |= 4u;
          break;
        case 3u:
          v6 |= 8u;
          break;
        default:
          continue;
      }
    }
    uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  }
  while (v5);
  return v6;
}

- (id)getPayloadSettingsForPayload:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  videoPayloadCollections = self->_videoPayloadCollections;
  uint64_t v6 = [(NSMutableArray *)videoPayloadCollections countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(videoPayloadCollections);
        }
        __int16 v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 payload] == v3)
        {
          id v11 = v10;
          return v11;
        }
      }
      uint64_t v7 = [(NSMutableArray *)videoPayloadCollections countByEnumeratingWithState:&v14 objects:v13 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = (id)objc_opt_new();
  [v11 setPayload:v3];
  [(VCMediaNegotiationBlobVideoSettings *)self addVideoPayloadCollections:v11];
  return v11;
}

- (BOOL)setVideoRuleCollections:(id)a3 featureStrings:(id)a4 isScreen:(BOOL)a5 isCellular16x9Capable:(BOOL)a6
{
  BOOL v161 = a6;
  BOOL v6 = a5;
  uint64_t v175 = *MEMORY[0x1E4F143B8];
  long long v171 = 0u;
  long long v172 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  __int16 v10 = (void *)[a3 supportedPayloads];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v171 objects:v170 count:16];
  if (!v11)
  {
    LOBYTE(v145) = 1;
    return v145;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v172;
  uint64_t v155 = *(void *)v172;
LABEL_3:
  uint64_t v154 = v12;
  uint64_t v14 = 0;
LABEL_4:
  if (*(void *)v172 != v13) {
    objc_enumerationMutation(v10);
  }
  uint64_t v156 = v14;
  long long v15 = *(void **)(*((void *)&v171 + 1) + 8 * v14);
  id v16 = -[VCMediaNegotiationBlobVideoSettings getPayloadSettingsForPayload:](self, "getPayloadSettingsForPayload:", [v15 unsignedIntValue]);
  objc_msgSend(v16, "setFeatureString:", objc_msgSend(a4, "objectForKey:", v15));
  char v17 = VCVideoParamaterSets_DefaultSupportedSets([v15 unsignedIntValue]);
  char v18 = v17;
  if (v17)
  {
    objc_msgSend(v16, "setParameterSet:", objc_msgSend(v16, "parameterSet") | 1);
    if ((v18 & 2) == 0)
    {
LABEL_8:
      if ((v18 & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_275;
    }
  }
  else if ((v17 & 2) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(v16, "setParameterSet:", objc_msgSend(v16, "parameterSet") | 2);
  if ((v18 & 4) == 0)
  {
LABEL_9:
    if ((v18 & 8) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_275:
  objc_msgSend(v16, "setParameterSet:", objc_msgSend(v16, "parameterSet") | 4);
  if ((v18 & 8) != 0) {
LABEL_10:
  }
    objc_msgSend(v16, "setParameterSet:", objc_msgSend(v16, "parameterSet") | 8);
LABEL_11:
  if ([v16 parameterSet])
  {
    v151 = v10;
    v152 = self;
    id v153 = a4;
    int v19 = 1;
    v158 = v16;
    v159 = v15;
    while (1)
    {
      int v157 = v19;
      uint64_t v20 = v19;
      if (v19 == 1) {
        int v21 = 1;
      }
      else {
        int v21 = 2;
      }
      unsigned int v162 = v21;
      int v22 = 1;
      unsigned int v160 = v19;
      do
      {
        unsigned int v23 = v22;
        uint64_t v24 = objc_msgSend(a3, "getVideoRulesForTransport:payload:encodingType:", v20, objc_msgSend(v15, "unsignedIntValue", v151), v22);
        if (!v24) {
          goto LABEL_269;
        }
        unsigned int v25 = (void *)v24;
        int v164 = v22;
        uint64_t v26 = objc_opt_new();
        [v26 setTransport:v162];
        unsigned int v163 = v22;
        if (v22 == 1) {
          uint64_t v27 = 1;
        }
        else {
          uint64_t v27 = 2;
        }
        [v26 setOperation:v27];
        long long v168 = 0u;
        long long v169 = 0u;
        long long v166 = 0u;
        long long v167 = 0u;
        uint64_t v28 = [v25 countByEnumeratingWithState:&v166 objects:v165 count:16];
        if (!v28) {
          goto LABEL_268;
        }
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v167;
        while (2)
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v167 != v30) {
              objc_enumerationMutation(v25);
            }
            int v32 = *(void **)(*((void *)&v166 + 1) + 8 * v31);
            int v33 = [v32 iWidth];
            if (v6)
            {
              if (v33 == 1024
                && [v32 iHeight] == 768
                && ([v32 fRate], v34 == 30.0))
              {
LABEL_64:
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | (v48 == 1.0));
                uint64_t v46 = [v26 formats] | 1;
              }
              else if ([v32 iWidth] == 1024 {
                     && [v32 iHeight] == 768
              }
                     && ([v32 fRate], v35 == 60.0))
              {
LABEL_68:
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | (2 * (v50 == 1.0)));
                uint64_t v46 = [v26 formats] | 2;
              }
              else if ([v32 iWidth] == 1136 {
                     && [v32 iHeight] == 640
              }
                     && ([v32 fRate], v36 == 30.0))
              {
LABEL_72:
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | (4 * (v52 == 1.0)));
                uint64_t v46 = [v26 formats] | 4;
              }
              else if ([v32 iWidth] == 1136 {
                     && [v32 iHeight] == 640
              }
                     && ([v32 fRate], v37 == 60.0))
              {
LABEL_76:
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | (8 * (v54 == 1.0)));
                uint64_t v46 = [v26 formats] | 8;
              }
              else if ([v32 iWidth] == 1334 {
                     && [v32 iHeight] == 750
              }
                     && ([v32 fRate], v38 == 30.0))
              {
LABEL_80:
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | (16 * (v56 == 1.0)));
                uint64_t v46 = [v26 formats] | 0x10;
              }
              else if ([v32 iWidth] == 1334 {
                     && [v32 iHeight] == 750
              }
                     && ([v32 fRate], v39 == 60.0))
              {
LABEL_84:
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | (32 * (v58 == 1.0)));
                uint64_t v46 = [v26 formats] | 0x20;
              }
              else if ([v32 iWidth] == 1664 {
                     && [v32 iHeight] == 1248
              }
                     && ([v32 fRate], v40 == 30.0))
              {
LABEL_88:
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v60 == 1.0) << 6));
                uint64_t v46 = [v26 formats] | 0x40;
              }
              else if ([v32 iWidth] == 1664 {
                     && [v32 iHeight] == 1248
              }
                     && ([v32 fRate], v41 == 60.0))
              {
LABEL_92:
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v62 == 1.0) << 7));
                uint64_t v46 = [v26 formats] | 0x80;
              }
              else if ([v32 iWidth] == 1920 {
                     && [v32 iHeight] == 1080
              }
                     && ([v32 fRate], v42 == 30.0))
              {
LABEL_96:
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v64 == 1.0) << 8));
                uint64_t v46 = [v26 formats] | 0x100;
              }
              else if ([v32 iWidth] == 1920 {
                     && [v32 iHeight] == 1080
              }
                     && ([v32 fRate], v43 == 60.0))
              {
LABEL_100:
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v66 == 1.0) << 9));
                uint64_t v46 = [v26 formats] | 0x200;
              }
              else if ([v32 iWidth] == 2208 {
                     && [v32 iHeight] == 1242
              }
                     && ([v32 fRate], v44 == 30.0))
              {
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v45 == 1.0) << 10));
                uint64_t v46 = [v26 formats] | 0x400;
              }
              else
              {
                if ([v32 iWidth] == 2208
                  && [v32 iHeight] == 1242)
                {
                  [v32 fRate];
                  if (v74 == 60.0)
                  {
                    [v32 fPref];
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v75 == 1.0) << 11));
                    uint64_t v46 = [v26 formats] | 0x800;
                    goto LABEL_196;
                  }
                }
                if ([v32 iWidth] == 2048
                  && [v32 iHeight] == 1536)
                {
                  [v32 fRate];
                  if (v76 == 30.0)
                  {
LABEL_127:
                    [v32 fPref];
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v77 == 1.0) << 12));
                    uint64_t v46 = [v26 formats] | 0x1000;
                    goto LABEL_196;
                  }
                }
                if ([v32 iWidth] == 2048
                  && [v32 iHeight] == 1536)
                {
                  [v32 fRate];
                  if (v78 == 60.0)
                  {
                    [v32 fPref];
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v79 == 1.0) << 13));
                    uint64_t v46 = [v26 formats] | 0x2000;
                    goto LABEL_196;
                  }
                }
                if ([v32 iWidth] == 1280
                  && [v32 iHeight] == 720)
                {
                  [v32 fRate];
                  if (v80 == 30.0) {
                    goto LABEL_135;
                  }
                }
                if ([v32 iWidth] == 1280
                  && [v32 iHeight] == 720)
                {
                  [v32 fRate];
                  if (v82 == 60.0)
                  {
LABEL_139:
                    [v32 fPref];
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v83 == 1.0) << 15));
                    uint64_t v46 = [v26 formats] | 0x8000;
                    goto LABEL_196;
                  }
                }
                if ([v32 iWidth] == 1920
                  && [v32 iHeight] == 896)
                {
                  [v32 fRate];
                  if (v86 == 30.0)
                  {
                    [v32 fPref];
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v87 == 1.0) << 16));
                    uint64_t v46 = [v26 formats] | 0x10000;
                    goto LABEL_196;
                  }
                }
                if ([v32 iWidth] == 1920
                  && [v32 iHeight] == 896)
                {
                  [v32 fRate];
                  if (v90 == 60.0) {
                    goto LABEL_155;
                  }
                }
                if ([v32 iWidth] == 2732
                  && [v32 iHeight] == 2048)
                {
                  [v32 fRate];
                  if (v94 == 60.0) {
                    goto LABEL_163;
                  }
                }
                if ([v32 iWidth] == 2388
                  && [v32 iHeight] == 1668
                  && ([v32 fRate], v98 == 60.0))
                {
LABEL_171:
                  [v32 fPref];
                  objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v99 == 1.0) << 19));
                  uint64_t v46 = [v26 formats] | 0x80000;
                }
                else if ([v32 iWidth] == 2224 {
                       && [v32 iHeight] == 1668
                }
                       && ([v32 fRate], v102 == 60.0))
                {
LABEL_179:
                  [v32 fPref];
                  objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v103 == 1.0) << 20));
                  uint64_t v46 = [v26 formats] | 0x100000;
                }
                else if ([v32 iWidth] == 3072 {
                       && [v32 iHeight] == 1728
                }
                       && ([v32 fRate], v106 == 60.0))
                {
LABEL_187:
                  [v32 fPref];
                  objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v107 == 1.0) << 21));
                  uint64_t v46 = [v26 formats] | 0x200000;
                }
                else
                {
                  if ([v32 iWidth] != 3840) {
                    goto LABEL_279;
                  }
                  if ([v32 iHeight] != 2160) {
                    goto LABEL_279;
                  }
                  [v32 fRate];
                  if (v110 != 60.0) {
                    goto LABEL_279;
                  }
LABEL_195:
                  [v32 fPref];
                  objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v111 == 1.0) << 22));
                  uint64_t v46 = [v26 formats] | 0x400000;
                }
              }
LABEL_196:
              [v26 setFormats:v46];
              goto LABEL_197;
            }
            if (v33 == 320 && [v32 iHeight] == 240)
            {
              [v32 fRate];
              if (v47 == 15.0) {
                goto LABEL_64;
              }
            }
            if ([v32 iWidth] == 320 && objc_msgSend(v32, "iHeight") == 240)
            {
              [v32 fRate];
              if (v49 == 30.0) {
                goto LABEL_68;
              }
            }
            if ([v32 iWidth] == 480 && objc_msgSend(v32, "iHeight") == 368)
            {
              [v32 fRate];
              if (v51 == 15.0) {
                goto LABEL_72;
              }
            }
            if ([v32 iWidth] == 480 && objc_msgSend(v32, "iHeight") == 368)
            {
              [v32 fRate];
              if (v53 == 30.0) {
                goto LABEL_76;
              }
            }
            if ([v32 iWidth] == 640 && objc_msgSend(v32, "iHeight") == 480)
            {
              [v32 fRate];
              if (v55 == 15.0) {
                goto LABEL_80;
              }
            }
            if ([v32 iWidth] == 640 && objc_msgSend(v32, "iHeight") == 480)
            {
              [v32 fRate];
              if (v57 == 30.0) {
                goto LABEL_84;
              }
            }
            if ([v32 iWidth] == 848 && objc_msgSend(v32, "iHeight") == 480)
            {
              [v32 fRate];
              if (v59 == 15.0) {
                goto LABEL_88;
              }
            }
            if ([v32 iWidth] == 848 && objc_msgSend(v32, "iHeight") == 480)
            {
              [v32 fRate];
              if (v61 == 30.0) {
                goto LABEL_92;
              }
            }
            if ([v32 iWidth] == 1024 && objc_msgSend(v32, "iHeight") == 768)
            {
              [v32 fRate];
              if (v63 == 15.0) {
                goto LABEL_96;
              }
            }
            if ([v32 iWidth] == 1024 && objc_msgSend(v32, "iHeight") == 768)
            {
              [v32 fRate];
              if (v65 == 30.0) {
                goto LABEL_100;
              }
            }
            if ([v32 iWidth] == 1024 && objc_msgSend(v32, "iHeight") == 768)
            {
              [v32 fRate];
              if (v67 == 60.0) {
                goto LABEL_127;
              }
            }
            if ([v32 iWidth] == 192 && objc_msgSend(v32, "iHeight") == 112)
            {
              [v32 fRate];
              if (v68 == 15.0) {
                goto LABEL_171;
              }
            }
            if ([v32 iWidth] == 192 && objc_msgSend(v32, "iHeight") == 192)
            {
              [v32 fRate];
              if (v69 == 15.0) {
                goto LABEL_179;
              }
            }
            if ([v32 iWidth] == 240 && objc_msgSend(v32, "iHeight") == 240)
            {
              [v32 fRate];
              if (v70 == 15.0) {
                goto LABEL_187;
              }
            }
            if ([v32 iWidth] == 320 && objc_msgSend(v32, "iHeight") == 320)
            {
              [v32 fRate];
              if (v71 == 30.0) {
                goto LABEL_195;
              }
            }
            if ([v32 iWidth] == 480 && objc_msgSend(v32, "iHeight") == 480)
            {
              [v32 fRate];
              if (v72 == 30.0)
              {
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v73 == 1.0) << 23));
                uint64_t v46 = [v26 formats] | 0x800000;
                goto LABEL_196;
              }
            }
            if ([v32 iWidth] == 640 && objc_msgSend(v32, "iHeight") == 640)
            {
              [v32 fRate];
              if (v84 == 30.0)
              {
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v85 == 1.0) << 24));
                uint64_t v46 = [v26 formats] | 0x1000000;
                goto LABEL_196;
              }
            }
            if ([v32 iWidth] == 720 && objc_msgSend(v32, "iHeight") == 720)
            {
              [v32 fRate];
              if (v88 == 30.0)
              {
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v89 == 1.0) << 25));
                uint64_t v46 = [v26 formats] | 0x2000000;
                goto LABEL_196;
              }
            }
            if ([v32 iWidth] == 1024 && objc_msgSend(v32, "iHeight") == 576)
            {
              [v32 fRate];
              if (v92 == 30.0)
              {
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v93 == 1.0) << 26));
                uint64_t v46 = [v26 formats] | 0x4000000;
                goto LABEL_196;
              }
            }
            if ([v32 iWidth] == 1920 && objc_msgSend(v32, "iHeight") == 1080)
            {
              [v32 fRate];
              if (v96 == 30.0)
              {
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v97 == 1.0) << 27));
                uint64_t v46 = [v26 formats] | 0x8000000;
                goto LABEL_196;
              }
            }
            if ([v32 iWidth] == 1440 && objc_msgSend(v32, "iHeight") == 1080)
            {
              [v32 fRate];
              if (v100 == 30.0)
              {
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v101 == 1.0) << 28));
                uint64_t v46 = [v26 formats] | 0x10000000;
                goto LABEL_196;
              }
            }
            if ([v32 iWidth] == 896 && objc_msgSend(v32, "iHeight") == 672)
            {
              [v32 fRate];
              if (v104 == 30.0)
              {
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v105 == 1.0) << 29));
                uint64_t v46 = [v26 formats] | 0x20000000;
                goto LABEL_196;
              }
            }
            if ([v32 iWidth] == 1920 && objc_msgSend(v32, "iHeight") == 1080)
            {
              [v32 fRate];
              if (v108 == 60.0)
              {
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v109 == 1.0) << 30));
                uint64_t v46 = [v26 formats] | 0x40000000;
                goto LABEL_196;
              }
            }
            if ([v32 iWidth] == 896 && objc_msgSend(v32, "iHeight") == 672)
            {
              [v32 fRate];
              if (v112 == 60.0)
              {
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormatExt1:", objc_msgSend(v26, "preferredFormatExt1") | (v113 == 1.0));
                uint64_t v114 = [v26 formatsExt1] | 1;
LABEL_223:
                [v26 setFormatsExt1:v114];
                goto LABEL_197;
              }
            }
            if ([v32 iWidth] == 1664 && objc_msgSend(v32, "iHeight") == 1248)
            {
              [v32 fRate];
              if (v115 == 30.0)
              {
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormatExt1:", objc_msgSend(v26, "preferredFormatExt1") | (2 * (v116 == 1.0)));
                uint64_t v114 = [v26 formatsExt1] | 2;
                goto LABEL_223;
              }
            }
            if ([v32 iWidth] == 1664 && objc_msgSend(v32, "iHeight") == 1248)
            {
              [v32 fRate];
              if (v117 == 60.0)
              {
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormatExt1:", objc_msgSend(v26, "preferredFormatExt1") | (4 * (v118 == 1.0)));
                uint64_t v114 = [v26 formatsExt1] | 4;
                goto LABEL_223;
              }
            }
            if ([v32 iWidth] == 1024 && objc_msgSend(v32, "iHeight") == 576)
            {
              [v32 fRate];
              if (v119 == 15.0)
              {
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormatExt1:", objc_msgSend(v26, "preferredFormatExt1") | (8 * (v120 == 1.0)));
                uint64_t v114 = [v26 formatsExt1] | 8;
                goto LABEL_223;
              }
            }
            if ([v32 iWidth] == 896 && objc_msgSend(v32, "iHeight") == 672)
            {
              [v32 fRate];
              if (v121 == 15.0)
              {
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormatExt1:", objc_msgSend(v26, "preferredFormatExt1") | (16 * (v122 == 1.0)));
                uint64_t v114 = [v26 formatsExt1] | 0x10;
                goto LABEL_223;
              }
            }
            if ([v32 iWidth] == 1920 && objc_msgSend(v32, "iHeight") == 1440)
            {
              [v32 fRate];
              if (v123 == 60.0)
              {
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormatExt1:", objc_msgSend(v26, "preferredFormatExt1") | (32 * (v124 == 1.0)));
                uint64_t v114 = [v26 formatsExt1] | 0x20;
                goto LABEL_223;
              }
            }
            if ([v32 iWidth] != 1088
              || [v32 iHeight] != 1088
              || ([v32 fRate], v125 != 15.0)
              && ([v32 fRate], v126 != 30.0)
              && ([v32 fRate], v127 != 60.0))
            {
              int v128 = [v32 iWidth];
              if (v164 == 1)
              {
                if (v128 == 1280 && [v32 iHeight] == 720)
                {
                  [v32 fRate];
                  if (v129 == 15.0)
                  {
                    [v32 fPref];
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v130 == 1.0) << 10));
                    objc_msgSend(v26, "setFormats:", objc_msgSend(v26, "formats") | 0x400);
                  }
                }
                if ([v32 iWidth] == 1280
                  && [v32 iHeight] == 720)
                {
                  [v32 fRate];
                  if (v131 == 30.0)
                  {
                    [v32 fPref];
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v132 == 1.0) << 11));
                    objc_msgSend(v26, "setFormats:", objc_msgSend(v26, "formats") | 0x800);
                  }
                }
                if ([v32 iWidth] == 1280
                  && [v32 iHeight] == 720)
                {
                  [v32 fRate];
                  if (v133 == 60.0)
                  {
                    [v32 fPref];
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v134 == 1.0) << 13));
                    objc_msgSend(v26, "setFormats:", objc_msgSend(v26, "formats") | 0x2000);
                  }
                }
                int v128 = [v32 iWidth];
              }
              if (v161)
              {
                if (v128 != 1280
                  || [v32 iHeight] != 720
                  || ([v32 fRate], v135 != 15.0))
                {
                  uint64_t v20 = v160;
                  if ([v32 iWidth] != 1280
                    || [v32 iHeight] != 720
                    || ([v32 fRate], v140 != 30.0))
                  {
                    if ([v32 iWidth] != 1280
                      || [v32 iHeight] != 720
                      || ([v32 fRate], v141 != 60.0))
                    {
LABEL_260:
                      if ([v32 iWidth] != 480
                        || [v32 iHeight] != 272
                        || ([v32 fRate], v142 != 15.0))
                      {
                        if ([v32 iWidth] != 480
                          || [v32 iHeight] != 272
                          || ([v32 fRate], v143 != 30.0))
                        {
LABEL_279:
                          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                          {
                            uint64_t v146 = VRTraceErrorLogLevelToCSTR();
                            v147 = *MEMORY[0x1E4F47A50];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                              -[VCMediaNegotiationBlobVideoSettings(VideoRules) setVideoRuleCollections:featureStrings:isScreen:isCellular16x9Capable:](v146, v32, v147);
                            }
                          }

                          goto LABEL_283;
                        }
                        goto LABEL_139;
                      }
LABEL_135:
                      [v32 fPref];
                      objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v81 == 1.0) << 14));
                      uint64_t v46 = [v26 formats] | 0x4000;
                      goto LABEL_196;
                    }
LABEL_163:
                    [v32 fPref];
                    objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v95 == 1.0) << 18));
                    uint64_t v46 = [v26 formats] | 0x40000;
                    goto LABEL_196;
                  }
LABEL_155:
                  [v32 fPref];
                  objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v91 == 1.0) << 17));
                  uint64_t v46 = [v26 formats] | 0x20000;
                  goto LABEL_196;
                }
                [v32 fPref];
                objc_msgSend(v26, "setPreferredFormat:", objc_msgSend(v26, "preferredFormat") | ((v136 == 1.0) << 16));
                objc_msgSend(v26, "setFormats:", objc_msgSend(v26, "formats") | 0x10000);
                uint64_t v20 = v160;
              }
              else
              {
                uint64_t v20 = v160;
                if (v128 != 1280) {
                  goto LABEL_260;
                }
                if ([v32 iHeight] != 720) {
                  goto LABEL_260;
                }
                [v32 fRate];
                if (v137 != 15.0)
                {
                  [v32 fRate];
                  if (v138 != 30.0)
                  {
                    [v32 fRate];
                    if (v139 != 60.0) {
                      goto LABEL_260;
                    }
                  }
                }
              }
            }
LABEL_197:
            ++v31;
          }
          while (v29 != v31);
          uint64_t v144 = [v25 countByEnumeratingWithState:&v166 objects:v165 count:16];
          uint64_t v29 = v144;
          if (v144) {
            continue;
          }
          break;
        }
LABEL_268:
        [v158 addVideoRuleCollections:v26];

        long long v15 = v159;
        unsigned int v23 = v163;
        int v22 = v164;
LABEL_269:
        ++v22;
      }
      while (v23 < 2);
      int v19 = v157 + 1;
      if (v157 >= 2u)
      {
        uint64_t v13 = v155;
        uint64_t v14 = v156 + 1;
        a4 = v153;
        __int16 v10 = v151;
        self = v152;
        if (v156 + 1 == v154)
        {
          uint64_t v145 = [v151 countByEnumeratingWithState:&v171 objects:v170 count:16];
          uint64_t v13 = v155;
          uint64_t v12 = v145;
          LOBYTE(v145) = 1;
          if (!v12) {
            return v145;
          }
          goto LABEL_3;
        }
        goto LABEL_4;
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v148 = VRTraceErrorLogLevelToCSTR();
    v149 = *MEMORY[0x1E4F47A50];
    LODWORD(v145) = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!v145) {
      return v145;
    }
    -[VCMediaNegotiationBlobVideoSettings(VideoRules) setVideoRuleCollections:featureStrings:isScreen:isCellular16x9Capable:](v148, v15, v149);
  }
LABEL_283:
  LOBYTE(v145) = 0;
  return v145;
}

- (void)checkAndInsertRuleWithWidth:(unsigned int)a3 height:(unsigned int)a4 framerate:(int)a5 payload:(int)a6 priority:(double)a7 negotiationBitfield:(unsigned int *)a8 negotiationBit:(unsigned int)a9 rules:(id)a10 isCellular16x9Capable:(BOOL)a11
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if ((*a8 & a9) != 0)
  {
    uint64_t v14 = *(void *)&a6;
    uint64_t v16 = *(void *)&a4;
    uint64_t v17 = *(void *)&a3;
    char v18 = [VCVideoRule alloc];
    unint64_t v35 = __PAIR64__(a5, v16);
    *(float *)&double v19 = (float)a5;
    *(float *)&double v20 = a7;
    int v36 = v14;
    int v21 = [(VCVideoRule *)v18 initWithFrameWidth:v17 frameHeight:v16 frameRate:v14 payload:v19 priority:v20];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v22 = [a10 countByEnumeratingWithState:&v54 objects:v53 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v55;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v55 != v24) {
            objc_enumerationMutation(a10);
          }
          uint64_t v26 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          int v27 = [v26 iWidth];
          if (v27 == [(VCVideoRule *)v21 iWidth])
          {
            int v28 = [v26 iHeight];
            if (v28 == [(VCVideoRule *)v21 iHeight])
            {
              [v26 fRate];
              float v30 = v29;
              [(VCVideoRule *)v21 fRate];
              if (v30 == v31)
              {
                int v32 = [v26 iPayload];
                if (v32 == [(VCVideoRule *)v21 iPayload])
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
                  {
                    uint64_t v33 = VRTraceErrorLogLevelToCSTR();
                    float v34 = *MEMORY[0x1E4F47A50];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136316930;
                      uint64_t v38 = v33;
                      __int16 v39 = 2080;
                      float v40 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) checkAndInsertRuleWithWidth:height:framera"
                            "te:payload:priority:negotiationBitfield:negotiationBit:rules:isCellular16x9Capable:]";
                      __int16 v41 = 1024;
                      int v42 = 547;
                      __int16 v43 = 1024;
                      int v44 = v17;
                      __int16 v45 = 1024;
                      int v46 = v35;
                      __int16 v47 = 1024;
                      int v48 = HIDWORD(v35);
                      __int16 v49 = 1024;
                      int v50 = v36;
                      __int16 v51 = 1024;
                      unsigned int v52 = a9;
                      _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Found duplicated rule for %dx%d (%d) payload=%d 0x%x", buf, 0x3Au);
                    }
                  }
                  goto LABEL_17;
                }
              }
            }
          }
        }
        uint64_t v23 = [a10 countByEnumeratingWithState:&v54 objects:v53 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
    [a10 addObject:v21];
LABEL_17:

    *a8 &= ~a9;
  }
}

- (id)newVideoRuleCollectionsForScreen:(BOOL)a3 isCellular16x9Capable:(BOOL)a4 isLocalConfig:(BOOL)a5
{
  BOOL v5 = a4;
  BOOL v153 = a3;
  uint64_t v178 = *MEMORY[0x1E4F143B8];
  v152 = objc_alloc_init(VCVideoRuleCollections);
  if (v152)
  {
    long long v176 = 0u;
    long long v177 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    obj = self->_videoPayloadCollections;
    uint64_t v145 = [(NSMutableArray *)obj countByEnumeratingWithState:&v174 objects:v173 count:16];
    if (v145)
    {
      uint64_t v146 = *(void *)v175;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v175 != v146) {
            objc_enumerationMutation(obj);
          }
          uint64_t v147 = v7;
          uint64_t v8 = *(void **)(*((void *)&v174 + 1) + 8 * v7);
          uint64_t v9 = [v8 payload];
          [(VCVideoRuleCollections *)v152 addSupportedPayload:v9];
          long long v171 = 0u;
          long long v172 = 0u;
          long long v169 = 0u;
          long long v170 = 0u;
          v151 = v8;
          id v149 = (id)[v8 videoRuleCollections];
          uint64_t v10 = [v149 countByEnumeratingWithState:&v169 objects:v168 count:16];
          if (!v10) {
            goto LABEL_210;
          }
          uint64_t v11 = v10;
          uint64_t v150 = *(void *)v170;
          while (2)
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v170 != v150) {
                objc_enumerationMutation(v149);
              }
              uint64_t v13 = *(void **)(*((void *)&v169 + 1) + 8 * i);
              int v155 = -1431655766;
              int v14 = [v13 formats];
              int v154 = -1431655766;
              int v155 = v14;
              int v154 = [v13 formatsExt1];
              id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              if (!v15)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCMediaNegotiationBlobVideoSettings(VideoRules) newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:]();
                  }
                }
                goto LABEL_216;
              }
              uint64_t v16 = v15;
              if ([v13 preferredFormat]) {
                double v17 = 1.0;
              }
              else {
                double v17 = 0.5;
              }
              if (v153)
              {
                LOBYTE(v87) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1024 height:768 framerate:30 payload:v9 priority:&v155 negotiationBitfield:1 negotiationBit:v17 rules:v16 isCellular16x9Capable:v87];
                v155 &= ~1u;
                if (([v13 preferredFormat] & 2) != 0) {
                  double v18 = 1.0;
                }
                else {
                  double v18 = 0.5;
                }
                LOBYTE(v88) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1024 height:768 framerate:60 payload:v9 priority:&v155 negotiationBitfield:2 negotiationBit:v18 rules:v16 isCellular16x9Capable:v88];
                v155 &= ~2u;
                if (([v13 preferredFormat] & 4) != 0) {
                  double v19 = 1.0;
                }
                else {
                  double v19 = 0.5;
                }
                LOBYTE(v89) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1136 height:640 framerate:30 payload:v9 priority:&v155 negotiationBitfield:4 negotiationBit:v19 rules:v16 isCellular16x9Capable:v89];
                v155 &= ~4u;
                if (([v13 preferredFormat] & 8) != 0) {
                  double v20 = 1.0;
                }
                else {
                  double v20 = 0.5;
                }
                LOBYTE(v90) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1136 height:640 framerate:60 payload:v9 priority:&v155 negotiationBitfield:8 negotiationBit:v20 rules:v16 isCellular16x9Capable:v90];
                v155 &= ~8u;
                if (([v13 preferredFormat] & 0x4000) != 0) {
                  double v21 = 1.0;
                }
                else {
                  double v21 = 0.5;
                }
                LOBYTE(v91) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1280 height:720 framerate:30 payload:v9 priority:&v155 negotiationBitfield:0x4000 negotiationBit:v21 rules:v16 isCellular16x9Capable:v91];
                v155 &= ~0x4000u;
                if (([v13 preferredFormat] & 0x8000) != 0) {
                  double v22 = 1.0;
                }
                else {
                  double v22 = 0.5;
                }
                LOBYTE(v92) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1280 height:720 framerate:60 payload:v9 priority:&v155 negotiationBitfield:0x8000 negotiationBit:v22 rules:v16 isCellular16x9Capable:v92];
                v155 &= ~0x8000u;
                if (([v13 preferredFormat] & 0x10) != 0) {
                  double v23 = 1.0;
                }
                else {
                  double v23 = 0.5;
                }
                LOBYTE(v93) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1334 height:750 framerate:30 payload:v9 priority:&v155 negotiationBitfield:16 negotiationBit:v23 rules:v16 isCellular16x9Capable:v93];
                v155 &= ~0x10u;
                if (([v13 preferredFormat] & 0x20) != 0) {
                  double v24 = 1.0;
                }
                else {
                  double v24 = 0.5;
                }
                LOBYTE(v94) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1334 height:750 framerate:60 payload:v9 priority:&v155 negotiationBitfield:32 negotiationBit:v24 rules:v16 isCellular16x9Capable:v94];
                v155 &= ~0x20u;
                if (([v13 preferredFormat] & 0x40) != 0) {
                  double v25 = 1.0;
                }
                else {
                  double v25 = 0.5;
                }
                LOBYTE(v95) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1664 height:1248 framerate:30 payload:v9 priority:&v155 negotiationBitfield:64 negotiationBit:v25 rules:v16 isCellular16x9Capable:v95];
                v155 &= ~0x40u;
                if (([v13 preferredFormat] & 0x80) != 0) {
                  double v26 = 1.0;
                }
                else {
                  double v26 = 0.5;
                }
                LOBYTE(v96) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1664 height:1248 framerate:60 payload:v9 priority:&v155 negotiationBitfield:128 negotiationBit:v26 rules:v16 isCellular16x9Capable:v96];
                v155 &= ~0x80u;
                if (([v13 preferredFormat] & 0x100) != 0) {
                  double v27 = 1.0;
                }
                else {
                  double v27 = 0.5;
                }
                LOBYTE(v97) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1920 height:1080 framerate:30 payload:v9 priority:&v155 negotiationBitfield:256 negotiationBit:v27 rules:v16 isCellular16x9Capable:v97];
                v155 &= ~0x100u;
                if (([v13 preferredFormat] & 0x200) != 0) {
                  double v28 = 1.0;
                }
                else {
                  double v28 = 0.5;
                }
                LOBYTE(v98) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1920 height:1080 framerate:60 payload:v9 priority:&v155 negotiationBitfield:512 negotiationBit:v28 rules:v16 isCellular16x9Capable:v98];
                v155 &= ~0x200u;
                if (([v13 preferredFormat] & 0x400) != 0) {
                  double v29 = 1.0;
                }
                else {
                  double v29 = 0.5;
                }
                LOBYTE(v99) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:2208 height:1242 framerate:30 payload:v9 priority:&v155 negotiationBitfield:1024 negotiationBit:v29 rules:v16 isCellular16x9Capable:v99];
                v155 &= ~0x400u;
                if (([v13 preferredFormat] & 0x800) != 0) {
                  double v30 = 1.0;
                }
                else {
                  double v30 = 0.5;
                }
                LOBYTE(v100) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:2208 height:1242 framerate:60 payload:v9 priority:&v155 negotiationBitfield:2048 negotiationBit:v30 rules:v16 isCellular16x9Capable:v100];
                v155 &= ~0x800u;
                if (([v13 preferredFormat] & 0x1000) != 0) {
                  double v31 = 1.0;
                }
                else {
                  double v31 = 0.5;
                }
                LOBYTE(v101) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:2048 height:1536 framerate:30 payload:v9 priority:&v155 negotiationBitfield:4096 negotiationBit:v31 rules:v16 isCellular16x9Capable:v101];
                v155 &= ~0x1000u;
                if (([v13 preferredFormat] & 0x2000) != 0) {
                  double v32 = 1.0;
                }
                else {
                  double v32 = 0.5;
                }
                LOBYTE(v102) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:2048 height:1536 framerate:60 payload:v9 priority:&v155 negotiationBitfield:0x2000 negotiationBit:v32 rules:v16 isCellular16x9Capable:v102];
                v155 &= ~0x2000u;
                if (([v13 preferredFormat] & 0x10000) != 0) {
                  double v33 = 1.0;
                }
                else {
                  double v33 = 0.5;
                }
                LOBYTE(v103) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1920 height:896 framerate:30 payload:v9 priority:&v155 negotiationBitfield:0x10000 negotiationBit:v33 rules:v16 isCellular16x9Capable:v103];
                v155 &= ~0x10000u;
                if (([v13 preferredFormat] & 0x20000) != 0) {
                  double v34 = 1.0;
                }
                else {
                  double v34 = 0.5;
                }
                LOBYTE(v104) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1920 height:896 framerate:60 payload:v9 priority:&v155 negotiationBitfield:0x20000 negotiationBit:v34 rules:v16 isCellular16x9Capable:v104];
                v155 &= ~0x20000u;
                if (([v13 preferredFormat] & 0x40000) != 0) {
                  double v35 = 1.0;
                }
                else {
                  double v35 = 0.5;
                }
                LOBYTE(v105) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:2732 height:2048 framerate:60 payload:v9 priority:&v155 negotiationBitfield:0x40000 negotiationBit:v35 rules:v16 isCellular16x9Capable:v105];
                v155 &= ~0x40000u;
                if (([v13 preferredFormat] & 0x80000) != 0) {
                  double v36 = 1.0;
                }
                else {
                  double v36 = 0.5;
                }
                LOBYTE(v106) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:2388 height:1668 framerate:60 payload:v9 priority:&v155 negotiationBitfield:0x80000 negotiationBit:v36 rules:v16 isCellular16x9Capable:v106];
                v155 &= ~0x80000u;
                if (([v13 preferredFormat] & 0x100000) != 0) {
                  double v37 = 1.0;
                }
                else {
                  double v37 = 0.5;
                }
                LOBYTE(v107) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:2224 height:1668 framerate:60 payload:v9 priority:&v155 negotiationBitfield:0x100000 negotiationBit:v37 rules:v16 isCellular16x9Capable:v107];
                v155 &= ~0x100000u;
                if (([v13 preferredFormat] & 0x200000) != 0) {
                  double v38 = 1.0;
                }
                else {
                  double v38 = 0.5;
                }
                LOBYTE(v108) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:3072 height:1728 framerate:60 payload:v9 priority:&v155 negotiationBitfield:0x200000 negotiationBit:v38 rules:v16 isCellular16x9Capable:v108];
                v155 &= ~0x200000u;
                if (([v13 preferredFormat] & 0x400000) != 0) {
                  double v39 = 1.0;
                }
                else {
                  double v39 = 0.5;
                }
                LOBYTE(v109) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:3840 height:2160 framerate:60 payload:v9 priority:&v155 negotiationBitfield:0x400000 negotiationBit:v39 rules:v16 isCellular16x9Capable:v109];
                unsigned int v40 = v155 & 0xFFBFFFFF;
LABEL_197:
                int v155 = v40;
                goto LABEL_198;
              }
              LOBYTE(v87) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:320 height:240 framerate:15 payload:v9 priority:&v155 negotiationBitfield:1 negotiationBit:v17 rules:v16 isCellular16x9Capable:v87];
              v155 &= ~1u;
              if (([v13 preferredFormat] & 2) != 0) {
                double v41 = 1.0;
              }
              else {
                double v41 = 0.5;
              }
              LOBYTE(v110) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:320 height:240 framerate:30 payload:v9 priority:&v155 negotiationBitfield:2 negotiationBit:v41 rules:v16 isCellular16x9Capable:v110];
              v155 &= ~2u;
              if (([v13 preferredFormat] & 4) != 0) {
                double v42 = 1.0;
              }
              else {
                double v42 = 0.5;
              }
              LOBYTE(v111) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:480 height:368 framerate:15 payload:v9 priority:&v155 negotiationBitfield:4 negotiationBit:v42 rules:v16 isCellular16x9Capable:v111];
              v155 &= ~4u;
              if (([v13 preferredFormat] & 8) != 0) {
                double v43 = 1.0;
              }
              else {
                double v43 = 0.5;
              }
              LOBYTE(v112) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:480 height:368 framerate:30 payload:v9 priority:&v155 negotiationBitfield:8 negotiationBit:v43 rules:v16 isCellular16x9Capable:v112];
              v155 &= ~8u;
              if (([v13 preferredFormat] & 0x10) != 0) {
                double v44 = 1.0;
              }
              else {
                double v44 = 0.5;
              }
              LOBYTE(v113) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:640 height:480 framerate:15 payload:v9 priority:&v155 negotiationBitfield:16 negotiationBit:v44 rules:v16 isCellular16x9Capable:v113];
              v155 &= ~0x10u;
              if (([v13 preferredFormat] & 0x20) != 0) {
                double v45 = 1.0;
              }
              else {
                double v45 = 0.5;
              }
              LOBYTE(v114) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:640 height:480 framerate:30 payload:v9 priority:&v155 negotiationBitfield:32 negotiationBit:v45 rules:v16 isCellular16x9Capable:v114];
              v155 &= ~0x20u;
              if (([v13 preferredFormat] & 0x40) != 0) {
                double v46 = 1.0;
              }
              else {
                double v46 = 0.5;
              }
              LOBYTE(v115) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:848 height:480 framerate:15 payload:v9 priority:&v155 negotiationBitfield:64 negotiationBit:v46 rules:v16 isCellular16x9Capable:v115];
              v155 &= ~0x40u;
              if (([v13 preferredFormat] & 0x80) != 0) {
                double v47 = 1.0;
              }
              else {
                double v47 = 0.5;
              }
              LOBYTE(v116) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:848 height:480 framerate:30 payload:v9 priority:&v155 negotiationBitfield:128 negotiationBit:v47 rules:v16 isCellular16x9Capable:v116];
              v155 &= ~0x80u;
              if (([v13 preferredFormat] & 0x100) != 0) {
                double v48 = 1.0;
              }
              else {
                double v48 = 0.5;
              }
              LOBYTE(v117) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1024 height:768 framerate:15 payload:v9 priority:&v155 negotiationBitfield:256 negotiationBit:v48 rules:v16 isCellular16x9Capable:v117];
              v155 &= ~0x100u;
              if (([v13 preferredFormat] & 0x200) != 0) {
                double v49 = 1.0;
              }
              else {
                double v49 = 0.5;
              }
              LOBYTE(v118) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1024 height:768 framerate:30 payload:v9 priority:&v155 negotiationBitfield:512 negotiationBit:v49 rules:v16 isCellular16x9Capable:v118];
              v155 &= ~0x200u;
              if (([v13 preferredFormat] & 0x1000) != 0) {
                double v50 = 1.0;
              }
              else {
                double v50 = 0.5;
              }
              LOBYTE(v119) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1024 height:768 framerate:60 payload:v9 priority:&v155 negotiationBitfield:4096 negotiationBit:v50 rules:v16 isCellular16x9Capable:v119];
              v155 &= ~0x1000u;
              if (([v13 preferredFormat] & 0x80000) != 0) {
                double v51 = 1.0;
              }
              else {
                double v51 = 0.5;
              }
              LOBYTE(v120) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:192 height:112 framerate:15 payload:v9 priority:&v155 negotiationBitfield:0x80000 negotiationBit:v51 rules:v16 isCellular16x9Capable:v120];
              v155 &= ~0x80000u;
              if (([v13 preferredFormat] & 0x100000) != 0) {
                double v52 = 1.0;
              }
              else {
                double v52 = 0.5;
              }
              LOBYTE(v121) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:192 height:192 framerate:15 payload:v9 priority:&v155 negotiationBitfield:0x100000 negotiationBit:v52 rules:v16 isCellular16x9Capable:v121];
              v155 &= ~0x100000u;
              if (([v13 preferredFormat] & 0x200000) != 0) {
                double v53 = 1.0;
              }
              else {
                double v53 = 0.5;
              }
              LOBYTE(v122) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:240 height:240 framerate:15 payload:v9 priority:&v155 negotiationBitfield:0x200000 negotiationBit:v53 rules:v16 isCellular16x9Capable:v122];
              v155 &= ~0x200000u;
              if (([v13 preferredFormat] & 0x400000) != 0) {
                double v54 = 1.0;
              }
              else {
                double v54 = 0.5;
              }
              LOBYTE(v123) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:320 height:320 framerate:30 payload:v9 priority:&v155 negotiationBitfield:0x400000 negotiationBit:v54 rules:v16 isCellular16x9Capable:v123];
              v155 &= ~0x400000u;
              if (([v13 preferredFormat] & 0x800000) != 0) {
                double v55 = 1.0;
              }
              else {
                double v55 = 0.5;
              }
              LOBYTE(v124) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:480 height:480 framerate:30 payload:v9 priority:&v155 negotiationBitfield:0x800000 negotiationBit:v55 rules:v16 isCellular16x9Capable:v124];
              v155 &= ~0x800000u;
              if (([v13 preferredFormat] & 0x1000000) != 0) {
                double v56 = 1.0;
              }
              else {
                double v56 = 0.5;
              }
              LOBYTE(v125) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:640 height:640 framerate:30 payload:v9 priority:&v155 negotiationBitfield:0x1000000 negotiationBit:v56 rules:v16 isCellular16x9Capable:v125];
              v155 &= ~0x1000000u;
              if (([v13 preferredFormat] & 0x2000000) != 0) {
                double v57 = 1.0;
              }
              else {
                double v57 = 0.5;
              }
              LOBYTE(v126) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:720 height:720 framerate:30 payload:v9 priority:&v155 negotiationBitfield:0x2000000 negotiationBit:v57 rules:v16 isCellular16x9Capable:v126];
              v155 &= ~0x2000000u;
              if (([v13 preferredFormat] & 0x4000000) != 0) {
                double v58 = 1.0;
              }
              else {
                double v58 = 0.5;
              }
              LOBYTE(v127) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1024 height:576 framerate:30 payload:v9 priority:&v155 negotiationBitfield:0x4000000 negotiationBit:v58 rules:v16 isCellular16x9Capable:v127];
              v155 &= ~0x4000000u;
              if (([v13 preferredFormat] & 0x8000000) != 0) {
                double v59 = 1.0;
              }
              else {
                double v59 = 0.5;
              }
              LOBYTE(v128) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1920 height:1080 framerate:30 payload:v9 priority:&v155 negotiationBitfield:0x8000000 negotiationBit:v59 rules:v16 isCellular16x9Capable:v128];
              v155 &= ~0x8000000u;
              if (([v13 preferredFormat] & 0x10000000) != 0) {
                double v60 = 1.0;
              }
              else {
                double v60 = 0.5;
              }
              LOBYTE(v129) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1440 height:1080 framerate:30 payload:v9 priority:&v155 negotiationBitfield:0x10000000 negotiationBit:v60 rules:v16 isCellular16x9Capable:v129];
              v155 &= ~0x10000000u;
              if (([v13 preferredFormat] & 0x20000000) != 0) {
                double v61 = 1.0;
              }
              else {
                double v61 = 0.5;
              }
              LOBYTE(v130) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:896 height:672 framerate:30 payload:v9 priority:&v155 negotiationBitfield:0x20000000 negotiationBit:v61 rules:v16 isCellular16x9Capable:v130];
              v155 &= ~0x20000000u;
              if (([v13 preferredFormat] & 0x40000000) != 0) {
                double v62 = 1.0;
              }
              else {
                double v62 = 0.5;
              }
              LOBYTE(v131) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1920 height:1080 framerate:60 payload:v9 priority:&v155 negotiationBitfield:0x40000000 negotiationBit:v62 rules:v16 isCellular16x9Capable:v131];
              v155 &= ~0x40000000u;
              if ([v13 preferredFormatExt1]) {
                double v63 = 1.0;
              }
              else {
                double v63 = 0.5;
              }
              LOBYTE(v132) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:896 height:672 framerate:60 payload:v9 priority:&v154 negotiationBitfield:1 negotiationBit:v63 rules:v16 isCellular16x9Capable:v132];
              v154 &= ~1u;
              if (([v13 preferredFormatExt1] & 2) != 0) {
                double v64 = 1.0;
              }
              else {
                double v64 = 0.5;
              }
              LOBYTE(v133) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1664 height:1248 framerate:30 payload:v9 priority:&v154 negotiationBitfield:2 negotiationBit:v64 rules:v16 isCellular16x9Capable:v133];
              v154 &= ~2u;
              if (([v13 preferredFormatExt1] & 4) != 0) {
                double v65 = 1.0;
              }
              else {
                double v65 = 0.5;
              }
              LOBYTE(v134) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1664 height:1248 framerate:60 payload:v9 priority:&v154 negotiationBitfield:4 negotiationBit:v65 rules:v16 isCellular16x9Capable:v134];
              v154 &= ~4u;
              if (([v13 preferredFormatExt1] & 8) != 0) {
                double v66 = 1.0;
              }
              else {
                double v66 = 0.5;
              }
              LOBYTE(v135) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1024 height:576 framerate:15 payload:v9 priority:&v154 negotiationBitfield:8 negotiationBit:v66 rules:v16 isCellular16x9Capable:v135];
              v154 &= ~8u;
              if (([v13 preferredFormatExt1] & 0x10) != 0) {
                double v67 = 1.0;
              }
              else {
                double v67 = 0.5;
              }
              LOBYTE(v136) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:896 height:672 framerate:15 payload:v9 priority:&v154 negotiationBitfield:16 negotiationBit:v67 rules:v16 isCellular16x9Capable:v136];
              v154 &= ~0x10u;
              if (([v13 preferredFormatExt1] & 0x20) != 0) {
                double v68 = 1.0;
              }
              else {
                double v68 = 0.5;
              }
              LOBYTE(v137) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1920 height:1440 framerate:60 payload:v9 priority:&v154 negotiationBitfield:32 negotiationBit:v68 rules:v16 isCellular16x9Capable:v137];
              v154 &= ~0x20u;
              if (a5 || [v13 operation] == 2)
              {
                if (([v13 preferredFormat] & 0x400) != 0) {
                  double v69 = 1.0;
                }
                else {
                  double v69 = 0.5;
                }
                LOBYTE(v138) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1280 height:720 framerate:15 payload:v9 priority:&v155 negotiationBitfield:1024 negotiationBit:v69 rules:v16 isCellular16x9Capable:v138];
                v155 &= ~0x400u;
                if (([v13 preferredFormat] & 0x800) != 0) {
                  double v70 = 1.0;
                }
                else {
                  double v70 = 0.5;
                }
                LOBYTE(v139) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1280 height:720 framerate:30 payload:v9 priority:&v155 negotiationBitfield:2048 negotiationBit:v70 rules:v16 isCellular16x9Capable:v139];
                v155 &= ~0x800u;
                if (([v13 preferredFormat] & 0x2000) != 0) {
                  double v71 = 1.0;
                }
                else {
                  double v71 = 0.5;
                }
                LOBYTE(v140) = v5;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1280 height:720 framerate:60 payload:v9 priority:&v155 negotiationBitfield:0x2000 negotiationBit:v71 rules:v16 isCellular16x9Capable:v140];
                v155 &= ~0x2000u;
              }
              if (([v13 preferredFormat] & 0x4000) != 0) {
                double v72 = 1.0;
              }
              else {
                double v72 = 0.5;
              }
              LOBYTE(v138) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:480 height:272 framerate:15 payload:v9 priority:&v155 negotiationBitfield:0x4000 negotiationBit:v72 rules:v16 isCellular16x9Capable:v138];
              v155 &= ~0x4000u;
              if (([v13 preferredFormat] & 0x8000) != 0) {
                double v73 = 1.0;
              }
              else {
                double v73 = 0.5;
              }
              LOBYTE(v141) = v5;
              [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:480 height:272 framerate:30 payload:v9 priority:&v155 negotiationBitfield:0x8000 negotiationBit:v73 rules:v16 isCellular16x9Capable:v141];
              unsigned int v40 = v155 & 0xFFFF7FFF;
              v155 &= ~0x8000u;
              if (v5)
              {
                if (([v13 preferredFormat] & 0x10000) != 0) {
                  double v74 = 1.0;
                }
                else {
                  double v74 = 0.5;
                }
                LOBYTE(v87) = 1;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1280 height:720 framerate:15 payload:v9 priority:&v155 negotiationBitfield:0x10000 negotiationBit:v74 rules:v16 isCellular16x9Capable:v87];
                v155 &= ~0x10000u;
                if (([v13 preferredFormat] & 0x20000) != 0) {
                  double v75 = 1.0;
                }
                else {
                  double v75 = 0.5;
                }
                LOBYTE(v142) = 1;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1280 height:720 framerate:30 payload:v9 priority:&v155 negotiationBitfield:0x20000 negotiationBit:v75 rules:v16 isCellular16x9Capable:v142];
                v155 &= ~0x20000u;
                if (([v13 preferredFormat] & 0x40000) != 0) {
                  double v76 = 1.0;
                }
                else {
                  double v76 = 0.5;
                }
                LOBYTE(v143) = 1;
                [(VCMediaNegotiationBlobVideoSettings *)self checkAndInsertRuleWithWidth:1280 height:720 framerate:60 payload:v9 priority:&v155 negotiationBitfield:0x40000 negotiationBit:v76 rules:v16 isCellular16x9Capable:v143];
                unsigned int v40 = v155 & 0xFFFBFFFF;
                goto LABEL_197;
              }
LABEL_198:
              if (v40 | v154)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
                {
                  uint64_t v77 = VRTraceErrorLogLevelToCSTR();
                  float v78 = *MEMORY[0x1E4F47A50];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136316418;
                    uint64_t v157 = v77;
                    __int16 v158 = 2080;
                    v159 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) newVideoRuleCollectionsForScreen:isCellular"
                           "16x9Capable:isLocalConfig:]";
                    __int16 v160 = 1024;
                    int v161 = 658;
                    __int16 v162 = 1024;
                    int v163 = v155;
                    __int16 v164 = 1024;
                    int v165 = v154;
                    __int16 v166 = 1024;
                    BOOL v167 = v153;
                    _os_log_impl(&dword_1E1EA4000, v78, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Detected an unknown formats (bitfield=0x%08x, bitfieldExt1=0x%08x - screen=%d). Ignoring ...", buf, 0x2Eu);
                  }
                }
              }
              [v16 sortUsingSelector:sel_compare_];
              int v79 = [v13 transport];
              uint64_t v80 = [v151 payload];
              int v81 = [v13 operation];
              if (v79 == 1) {
                uint64_t v82 = 1;
              }
              else {
                uint64_t v82 = 2;
              }
              if (v81 == 1) {
                uint64_t v83 = 1;
              }
              else {
                uint64_t v83 = 2;
              }
              [(VCVideoRuleCollections *)v152 addVideoRules:v16 transportType:v82 payload:v80 encodingType:v83];
            }
            uint64_t v11 = [v149 countByEnumeratingWithState:&v169 objects:v168 count:16];
            if (v11) {
              continue;
            }
            break;
          }
LABEL_210:
          uint64_t v7 = v147 + 1;
        }
        while (v147 + 1 != v145);
        uint64_t v145 = [(NSMutableArray *)obj countByEnumeratingWithState:&v174 objects:v173 count:16];
      }
      while (v145);
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v85 = VRTraceErrorLogLevelToCSTR();
      float v86 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobVideoSettings(VideoRules) newVideoRuleCollectionsForScreen:isCellular16x9Capable:isLocalConfig:](v85, v153, v86);
      }
    }
LABEL_216:

    return 0;
  }
  return v152;
}

- (id)newCameraConfiguration
{
  uint64_t v3 = objc_alloc_init(VCMediaNegotiatorVideoConfiguration);
  uint64_t v4 = v3;
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobVideoSettings(VideoRules) newCameraConfiguration]();
      }
    }
    goto LABEL_12;
  }
  [(VCMediaNegotiatorCommonConfiguration *)v3 setSsrc:self->_rtpSSRC];
  id v5 = [(VCMediaNegotiationBlobVideoSettings *)self newVideoRuleCollectionsForScreen:0 isCellular16x9Capable:1 isLocalConfig:1];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobVideoSettings(VideoRules) newCameraConfiguration]();
      }
    }
LABEL_12:
    BOOL v6 = 0;
LABEL_16:

    return 0;
  }
  BOOL v6 = v5;
  [(VCMediaNegotiatorVideoConfiguration *)v4 setVideoRuleCollections:v5];
  id v7 = [(VCMediaNegotiationBlobVideoSettings *)self newFeatureStrings];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobVideoSettings(VideoRules) newCameraConfiguration]();
      }
    }
    goto LABEL_16;
  }
  uint64_t v8 = v7;
  [(VCMediaNegotiatorVideoConfiguration *)v4 setVideoFeatureStrings:v7];

  return v4;
}

- (id)newScreenConfigurationWithCameraConfiguration:(id)a3
{
  if (a3) {
    uint64_t v4 = (VCMediaNegotiatorVideoConfiguration *)[a3 copy];
  }
  else {
    uint64_t v4 = objc_alloc_init(VCMediaNegotiatorVideoConfiguration);
  }
  id v5 = v4;
  if (v4)
  {
    [(VCMediaNegotiatorCommonConfiguration *)v4 setSsrc:self->_rtpSSRC];
    id v6 = [(VCMediaNegotiationBlobVideoSettings *)self newVideoRuleCollectionsForScreen:1 isCellular16x9Capable:1 isLocalConfig:1];
    [(VCMediaNegotiatorVideoConfiguration *)v5 setVideoRuleCollections:v6];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaNegotiationBlobVideoSettings(VideoRules) newScreenConfigurationWithCameraConfiguration:]();
    }
  }
  return v5;
}

- (id)newFeatureStrings
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", -[NSMutableArray count](self->_videoPayloadCollections, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  videoPayloadCollections = self->_videoPayloadCollections;
  uint64_t v5 = [(NSMutableArray *)videoPayloadCollections countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(videoPayloadCollections);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v10 = [v9 payload];
        uint64_t v11 = [v9 featureString];
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v10));
      }
      uint64_t v6 = [(NSMutableArray *)videoPayloadCollections countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)parameterSetStringFromPayloadSettings:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@", "];
  uint64_t v5 = (void *)[MEMORY[0x1E4F28E78] stringWithString:&stru_1F3D3E450];
  int v6 = [a3 parameterSet];
  uint64_t v7 = 1;
  do
  {
    if ((v7 & v6) != 0)
    {
      if v7 < 9 && ((0x117u >> v7)) {
        uint64_t v8 = off_1E6DB9288[v7];
      }
      else {
        uint64_t v8 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
      }
      [v5 appendFormat:@", %@", v8];
    }
    BOOL v9 = v7 >= 8;
    uint64_t v7 = (2 * v7);
  }
  while (!v9);

  return (id)[v5 stringByTrimmingCharactersInSet:v4];
}

- (void)prepareFormatString:(id)a3 format:(id)a4 formatIndex:(unsigned int)a5 preferredFormat:(unsigned int)a6
{
  BOOL v9 = (void *)[a4 componentsSeparatedByString:@"_"];
  if ([v9 count] == 4) {
    int v10 = objc_msgSend((id)objc_msgSend(v9, "objectAtIndexedSubscript:", 3), "isEqualToString:", @"dec");
  }
  else {
    int v10 = 0;
  }
  if ([v9 count] == 3 || v10 != 0)
  {
    uint64_t v12 = [v9 objectAtIndex:1];
    uint64_t v13 = [v9 objectAtIndex:2];
    long long v14 = "";
    if (v10) {
      long long v14 = "*";
    }
    [a3 appendFormat:@" %@@%@fps%s", v12, v13, v14];
    if ((a6 & a5) != 0) {
      [a3 appendString:@" (preferred)"];
    }
    [a3 appendString:@","];
  }
}

- (void)printVideoWithLogFile:(void *)a3
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v11 = (NSObject **)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule > 6)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    uint64_t v13 = *v11;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int rtpSSRC = self->_rtpSSRC;
      BOOL allowRTCPFB = self->_allowRTCPFB;
      *(_DWORD *)buf = 136316162;
      uint64_t v80 = v12;
      __int16 v81 = 2080;
      uint64_t v82 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printVideoWithLogFile:]";
      __int16 v83 = 1024;
      int v84 = 765;
      __int16 v85 = 1024;
      *(_DWORD *)float v86 = rtpSSRC;
      *(_WORD *)&v86[4] = 1024;
      *(_DWORD *)&v86[6] = allowRTCPFB;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - Video Settings: SSRC=%x allowRTCPFB=%u", buf, 0x28u);
    }
  }
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob - Video Settings: SSRC=%x allowRTCPFB=%u\n", v5, v6, v7, v8, v9, v10, self->_rtpSSRC);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  obj = self->_videoPayloadCollections;
  uint64_t v68 = [(NSMutableArray *)obj countByEnumeratingWithState:&v88 objects:v87 count:16];
  if (v68)
  {
    uint64_t v67 = *(void *)v89;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v89 != v67) {
          objc_enumerationMutation(obj);
        }
        long long v17 = *(void **)(*((void *)&v88 + 1) + 8 * v16);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v18 = VRTraceErrorLogLevelToCSTR();
          double v19 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v20 = [v17 payload];
            uint64_t v21 = objc_msgSend((id)objc_msgSend(v17, "featureString"), "UTF8String");
            *(_DWORD *)buf = 136316162;
            uint64_t v80 = v18;
            __int16 v81 = 2080;
            uint64_t v82 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printVideoWithLogFile:]";
            __int16 v83 = 1024;
            int v84 = 769;
            __int16 v85 = 1024;
            *(_DWORD *)float v86 = v20;
            *(_WORD *)&v86[4] = 2080;
            *(void *)&v86[6] = v21;
            _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     Payload=%u Format string=%s", buf, 0x2Cu);
          }
        }
        uint64_t v69 = v16;
        char v22 = [v17 payload];
        objc_msgSend((id)objc_msgSend(v17, "featureString"), "UTF8String");
        VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     Payload=%u Format string=%s\n", v23, v24, v25, v26, v27, v28, v22);
        id v29 = [(VCMediaNegotiationBlobVideoSettings *)self parameterSetStringFromPayloadSettings:v17];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v30 = VRTraceErrorLogLevelToCSTR();
          double v31 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v32 = [v17 payload];
            uint64_t v33 = [v29 UTF8String];
            *(_DWORD *)buf = 136316162;
            uint64_t v80 = v30;
            __int16 v81 = 2080;
            uint64_t v82 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printVideoWithLogFile:]";
            __int16 v83 = 1024;
            int v84 = 773;
            __int16 v85 = 1024;
            *(_DWORD *)float v86 = v32;
            *(_WORD *)&v86[4] = 2080;
            *(void *)&v86[6] = v33;
            _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     Payload=%u Parameter set: %s", buf, 0x2Cu);
          }
        }
        char v34 = [v17 payload];
        [v29 UTF8String];
        VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     Payload=%u Parameter set: %s\n", v35, v36, v37, v38, v39, v40, v34);
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        id v70 = (id)[v17 videoRuleCollections];
        uint64_t v73 = [v70 countByEnumeratingWithState:&v75 objects:v74 count:16];
        if (v73)
        {
          uint64_t v71 = *(void *)v76;
          do
          {
            for (uint64_t i = 0; i != v73; ++i)
            {
              if (*(void *)v76 != v71) {
                objc_enumerationMutation(v70);
              }
              double v42 = *(void **)(*((void *)&v75 + 1) + 8 * i);
              double v43 = (void *)MEMORY[0x1E4F28E78];
              double v44 = v17;
              uint64_t v45 = [v17 payload];
              if ([v42 operation] == 1) {
                double v46 = "encode";
              }
              else {
                double v46 = "decode";
              }
              int v47 = [v42 transport];
              double v48 = "Cellular";
              if (v47 == 1) {
                double v48 = "WiFi";
              }
              double v49 = objc_msgSend(v43, "stringWithFormat:", @"Payload=%u %s %s", v45, v46, v48);
              if ([v42 hasPreferredFormat]) {
                uint64_t v50 = [v42 preferredFormat];
              }
              else {
                uint64_t v50 = 0;
              }
              uint64_t v51 = 1;
              do
              {
                if (([v42 formats] & v51) == 0) {
                  goto LABEL_106;
                }
                if ((int)v51 >= 0x10000)
                {
                  if ((int)v51 > 0xFFFFFF)
                  {
                    if ((int)v51 > 0xFFFFFFF)
                    {
                      if ((int)v51 > 0x3FFFFFFF)
                      {
                        if (v51 == 0x40000000)
                        {
                          double v52 = @"video_1920x1080_60";
                        }
                        else
                        {
                          if (v51 != 0x7FFFFFFF)
                          {
LABEL_104:
                            double v52 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v52, v51);
                            goto LABEL_105;
                          }
                          double v52 = @"video_SUPPORTED";
                        }
                      }
                      else if (v51 == 0x10000000)
                      {
                        double v52 = @"video_1440x1080_30";
                      }
                      else
                      {
                        if (v51 != 0x20000000) {
                          goto LABEL_104;
                        }
                        double v52 = @"video_896_672_30";
                      }
                    }
                    else if ((int)v51 > 0x3FFFFFF)
                    {
                      if (v51 == 0x4000000)
                      {
                        double v52 = @"video_1024x576_30";
                      }
                      else
                      {
                        if (v51 != 0x8000000) {
                          goto LABEL_104;
                        }
                        double v52 = @"video_1920x1080_30";
                      }
                    }
                    else if (v51 == 0x1000000)
                    {
                      double v52 = @"video_640x640_30";
                    }
                    else
                    {
                      if (v51 != 0x2000000) {
                        goto LABEL_104;
                      }
                      double v52 = @"video_720x720_30";
                    }
                  }
                  else if ((int)v51 >= 0x100000)
                  {
                    if ((int)v51 >= 0x400000)
                    {
                      if (v51 == 0x400000)
                      {
                        double v52 = @"video_320x320_30";
                      }
                      else
                      {
                        if (v51 != 0x800000) {
                          goto LABEL_104;
                        }
                        double v52 = @"video_480x480_30";
                      }
                    }
                    else if (v51 == 0x100000)
                    {
                      double v52 = @"video_192x192_15";
                    }
                    else
                    {
                      if (v51 != 0x200000) {
                        goto LABEL_104;
                      }
                      double v52 = @"video_240x240_15";
                    }
                  }
                  else if ((int)v51 >= 0x40000)
                  {
                    if (v51 == 0x40000)
                    {
                      double v52 = @"video_1280x720_60_dec";
                    }
                    else
                    {
                      if (v51 != 0x80000) {
                        goto LABEL_104;
                      }
                      double v52 = @"video_192x112_15";
                    }
                  }
                  else if (v51 == 0x10000)
                  {
                    double v52 = @"video_1280x720_15_dec";
                  }
                  else
                  {
                    if (v51 != 0x20000) {
                      goto LABEL_104;
                    }
                    double v52 = @"video_1280x720_30_dec";
                  }
                }
                else if ((int)v51 > 255)
                {
                  if ((int)v51 > 4095)
                  {
                    if ((int)v51 >= 0x4000)
                    {
                      if (v51 == 0x4000)
                      {
                        double v52 = @"video_480x272_15";
                      }
                      else
                      {
                        if (v51 != 0x8000) {
                          goto LABEL_104;
                        }
                        double v52 = @"video_480x272_30";
                      }
                    }
                    else if (v51 == 4096)
                    {
                      double v52 = @"video_1024x768_60";
                    }
                    else
                    {
                      if (v51 != 0x2000) {
                        goto LABEL_104;
                      }
                      double v52 = @"video_1280x720_60";
                    }
                  }
                  else if ((int)v51 > 1023)
                  {
                    if (v51 == 1024)
                    {
                      double v52 = @"video_1280x720_15";
                    }
                    else
                    {
                      if (v51 != 2048) {
                        goto LABEL_104;
                      }
                      double v52 = @"video_1280x720_30";
                    }
                  }
                  else if (v51 == 256)
                  {
                    double v52 = @"video_1024x768_15";
                  }
                  else
                  {
                    if (v51 != 512) {
                      goto LABEL_104;
                    }
                    double v52 = @"video_1024x768_30";
                  }
                }
                else
                {
                  if ((int)v51 <= 15)
                  {
                    double v52 = @"video_320x240_15";
                    switch((int)v51)
                    {
                      case 1:
                        goto LABEL_105;
                      case 2:
                        double v52 = @"video_320x240_30";
                        break;
                      case 4:
                        double v52 = @"video_480x368_15";
                        break;
                      case 8:
                        double v52 = @"video_480x368_30";
                        break;
                      default:
                        goto LABEL_104;
                    }
                    goto LABEL_105;
                  }
                  if ((int)v51 > 63)
                  {
                    if (v51 == 64)
                    {
                      double v52 = @"video_848x480_15";
                    }
                    else
                    {
                      if (v51 != 128) {
                        goto LABEL_104;
                      }
                      double v52 = @"video_848x480_30";
                    }
                  }
                  else if (v51 == 16)
                  {
                    double v52 = @"video_640x480_15";
                  }
                  else
                  {
                    if (v51 != 32) {
                      goto LABEL_104;
                    }
                    double v52 = @"video_640x480_30";
                  }
                }
LABEL_105:
                [(VCMediaNegotiationBlobVideoSettings *)self prepareFormatString:v49 format:v52 formatIndex:v51 preferredFormat:v50];
LABEL_106:
                BOOL v53 = (v51 & 0x3FFFFFFF) == 0;
                uint64_t v51 = (2 * v51);
              }
              while (!v53);
              if ([v42 hasPreferredFormatExt1]) {
                uint64_t v54 = [v42 preferredFormatExt1];
              }
              else {
                uint64_t v54 = 0;
              }
              uint64_t v55 = 1;
              do
              {
                if (([v42 formatsExt1] & v55) != 0)
                {
                  if ((int)v55 > 15)
                  {
                    switch(v55)
                    {
                      case 0x10:
                        double v56 = @"video_896x672_15";
                        break;
                      case 0x20:
                        double v56 = @"video_1920x1440_60";
                        break;
                      case 0x3F:
                        double v56 = @"video_SUPPORTED";
                        break;
                      default:
LABEL_124:
                        double v56 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v56, v55);
                        break;
                    }
                  }
                  else
                  {
                    double v56 = @"video_896x672_60";
                    switch((int)v55)
                    {
                      case 1:
                        break;
                      case 2:
                        double v56 = @"video_1664x1248_30";
                        break;
                      case 4:
                        double v56 = @"video_1664x1248_60";
                        break;
                      case 8:
                        double v56 = @"video_1024x576_15";
                        break;
                      default:
                        goto LABEL_124;
                    }
                  }
                  [(VCMediaNegotiationBlobVideoSettings *)self prepareFormatString:v49 format:v56 formatIndex:v55 preferredFormat:v54];
                }
                BOOL v53 = (v55 & 0x1F) == 0;
                uint64_t v55 = (2 * v55);
              }
              while (!v53);
              uint64_t v57 = objc_msgSend((id)objc_msgSend(v49, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @",")), "UTF8String");
              if ((int)VRTraceGetErrorLogLevelForModule() > 6)
              {
                uint64_t v64 = VRTraceErrorLogLevelToCSTR();
                double v65 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315906;
                  uint64_t v80 = v64;
                  __int16 v81 = 2080;
                  uint64_t v82 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printVideoWithLogFile:]";
                  __int16 v83 = 1024;
                  int v84 = 800;
                  __int16 v85 = 2080;
                  *(void *)float v86 = v57;
                  _os_log_impl(&dword_1E1EA4000, v65, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s", buf, 0x26u);
                }
              }
              VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v58, v59, v60, v61, v62, v63, v57);
              long long v17 = v44;
            }
            uint64_t v73 = [v70 countByEnumeratingWithState:&v75 objects:v74 count:16];
          }
          while (v73);
        }
        uint64_t v16 = v69 + 1;
      }
      while (v69 + 1 != v68);
      uint64_t v68 = [(NSMutableArray *)obj countByEnumeratingWithState:&v88 objects:v87 count:16];
    }
    while (v68);
  }
}

- (void)printScreenWithLogFile:(void *)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v10 = (NSObject **)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule > 6)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *v10;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int rtpSSRC = self->_rtpSSRC;
      BOOL allowRTCPFB = self->_allowRTCPFB;
      *(_DWORD *)buf = 136316162;
      uint64_t v77 = v11;
      __int16 v78 = 2080;
      int v79 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printScreenWithLogFile:]";
      __int16 v80 = 1024;
      int v81 = 807;
      __int16 v82 = 1024;
      *(_DWORD *)__int16 v83 = rtpSSRC;
      *(_WORD *)&v83[4] = 1024;
      *(_DWORD *)&v83[6] = allowRTCPFB;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - Screen Settings: SSRC=%x allowRTCPFB=%u", buf, 0x28u);
    }
  }
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob - Screen Settings: SSRC=%x allowRTCPFB=%u\n", v4, v5, v6, v7, v8, v9, self->_rtpSSRC);
  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obj = self->_videoPayloadCollections;
  uint64_t v64 = [(NSMutableArray *)obj countByEnumeratingWithState:&v85 objects:v84 count:16];
  if (v64)
  {
    uint64_t v62 = *(void *)v86;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v86 != v62) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v85 + 1) + 8 * v15);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v17 = VRTraceErrorLogLevelToCSTR();
          uint64_t v18 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = objc_msgSend((id)objc_msgSend(v16, "featureString"), "UTF8String");
            *(_DWORD *)buf = 136315906;
            uint64_t v77 = v17;
            __int16 v78 = 2080;
            int v79 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printScreenWithLogFile:]";
            __int16 v80 = 1024;
            int v81 = 811;
            __int16 v82 = 2080;
            *(void *)__int16 v83 = v19;
            _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     Format string=%s", buf, 0x26u);
          }
        }
        uint64_t v65 = v15;
        char v20 = objc_msgSend((id)objc_msgSend(v16, "featureString"), "UTF8String");
        VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     Format string=%s\n", v21, v22, v23, v24, v25, v26, v20);
        id v27 = [(VCMediaNegotiationBlobVideoSettings *)self parameterSetStringFromPayloadSettings:v16];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v28 = VRTraceErrorLogLevelToCSTR();
          id v29 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v30 = [v16 payload];
            uint64_t v31 = [v27 UTF8String];
            *(_DWORD *)buf = 136316162;
            uint64_t v77 = v28;
            __int16 v78 = 2080;
            int v79 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printScreenWithLogFile:]";
            __int16 v80 = 1024;
            int v81 = 815;
            __int16 v82 = 1024;
            *(_DWORD *)__int16 v83 = v30;
            *(_WORD *)&v83[4] = 2080;
            *(void *)&v83[6] = v31;
            _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     Payload=%u parameter set: %s", buf, 0x2Cu);
          }
        }
        char v32 = [v16 payload];
        [v27 UTF8String];
        VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     Payload=%u parameter set: %s\n", v33, v34, v35, v36, v37, v38, v32);
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v66 = (id)[v16 videoRuleCollections];
        uint64_t v70 = [v66 countByEnumeratingWithState:&v72 objects:v71 count:16];
        if (v70)
        {
          uint64_t v67 = *(void *)v73;
          uint64_t v68 = v16;
          do
          {
            for (uint64_t i = 0; i != v70; ++i)
            {
              if (*(void *)v73 != v67) {
                objc_enumerationMutation(v66);
              }
              uint64_t v40 = *(void **)(*((void *)&v72 + 1) + 8 * i);
              double v41 = (void *)MEMORY[0x1E4F28E78];
              uint64_t v42 = [v16 payload];
              if ([v40 operation] == 1) {
                double v43 = "encode";
              }
              else {
                double v43 = "decode";
              }
              int v44 = [v40 transport];
              uint64_t v45 = "Cellular";
              if (v44 == 1) {
                uint64_t v45 = "WiFi";
              }
              double v46 = objc_msgSend(v41, "stringWithFormat:", @"Payload=%u %s %s", v42, v43, v45);
              if ([v40 hasPreferredFormat]) {
                int v47 = [v40 preferredFormat];
              }
              else {
                int v47 = 0;
              }
              uint64_t v48 = 1;
              do
              {
                if (([v40 formats] & v48) == 0) {
                  goto LABEL_85;
                }
                if ((int)v48 > 4095)
                {
                  if ((int)v48 >= 0x40000)
                  {
                    if ((int)v48 >= 0x200000)
                    {
                      switch(v48)
                      {
                        case 0x200000:
                          double v49 = @"screen_3072x1728_60";
                          break;
                        case 0x400000:
                          double v49 = @"screen_3840x2160_60";
                          break;
                        case 0x7FFFFF:
                          double v49 = @"screen_SUPPORTED";
                          break;
                        default:
                          goto LABEL_67;
                      }
                    }
                    else
                    {
                      switch(v48)
                      {
                        case 0x40000:
                          double v49 = @"screen_2732x2048_60";
                          break;
                        case 0x80000:
                          double v49 = @"screen_2388x1668_60";
                          break;
                        case 0x100000:
                          double v49 = @"screen_2224x1668_60";
                          break;
                        default:
                          goto LABEL_67;
                      }
                    }
                  }
                  else if ((int)v48 >= 0x8000)
                  {
                    switch(v48)
                    {
                      case 0x8000:
                        double v49 = @"screen_1280x720_60";
                        break;
                      case 0x10000:
                        double v49 = @"screen_1920x896_30";
                        break;
                      case 0x20000:
                        double v49 = @"screen_1920x896_60";
                        break;
                      default:
                        goto LABEL_67;
                    }
                  }
                  else
                  {
                    switch(v48)
                    {
                      case 0x1000:
                        double v49 = @"screen_2048x1536_30";
                        break;
                      case 0x2000:
                        double v49 = @"screen_2048x1536_60";
                        break;
                      case 0x4000:
                        double v49 = @"screen_1280x720_30";
                        break;
                      default:
LABEL_67:
                        double v49 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v48);
                        break;
                    }
                  }
                }
                else
                {
                  if ((int)v48 <= 63)
                  {
                    double v49 = @"screen_1024x768_30";
                    switch((int)v48)
                    {
                      case 1:
                        goto LABEL_81;
                      case 2:
                        double v49 = @"screen_1024x768_60";
                        goto LABEL_81;
                      case 3:
                      case 5:
                      case 6:
                      case 7:
                        goto LABEL_67;
                      case 4:
                        double v49 = @"screen_1136x640_30";
                        goto LABEL_81;
                      case 8:
                        double v49 = @"screen_1136x640_60";
                        goto LABEL_81;
                      default:
                        if (v48 == 16)
                        {
                          double v49 = @"screen_1334x750_30";
                        }
                        else
                        {
                          if (v48 != 32) {
                            goto LABEL_67;
                          }
                          double v49 = @"screen_1334x750_60";
                        }
                        break;
                    }
                    goto LABEL_81;
                  }
                  if ((int)v48 > 511)
                  {
                    switch(v48)
                    {
                      case 0x200:
                        double v49 = @"screen_1920x1080_60";
                        break;
                      case 0x400:
                        double v49 = @"screen_2208x1242_30";
                        break;
                      case 0x800:
                        double v49 = @"screen_2208x1242_60";
                        break;
                      default:
                        goto LABEL_67;
                    }
                  }
                  else
                  {
                    switch(v48)
                    {
                      case 0x40:
                        double v49 = @"screen_1664x1248_30";
                        break;
                      case 0x80:
                        double v49 = @"screen_1664x1248_60";
                        break;
                      case 0x100:
                        double v49 = @"screen_1920x1080_30";
                        break;
                      default:
                        goto LABEL_67;
                    }
                  }
                }
LABEL_81:
                uint64_t v50 = (void *)[(__CFString *)v49 componentsSeparatedByString:@"_"];
                if ([v50 count] == 3)
                {
                  [v46 appendFormat:@" %@@%@fps", objc_msgSend(v50, "objectAtIndex:", 1), objc_msgSend(v50, "objectAtIndex:", 2)];
                  if (v47 == v48) {
                    [v46 appendString:@" (preferred)"];
                  }
                  [v46 appendString:@","];
                }
LABEL_85:
                BOOL v51 = (v48 & 0x3FFFFF) == 0;
                uint64_t v48 = (2 * v48);
              }
              while (!v51);
              uint64_t v52 = objc_msgSend((id)objc_msgSend(v46, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @",")), "UTF8String");
              if ((int)VRTraceGetErrorLogLevelForModule() > 6)
              {
                uint64_t v59 = VRTraceErrorLogLevelToCSTR();
                uint64_t v60 = *MEMORY[0x1E4F47A50];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315906;
                  uint64_t v77 = v59;
                  __int16 v78 = 2080;
                  int v79 = "-[VCMediaNegotiationBlobVideoSettings(VideoRules) printScreenWithLogFile:]";
                  __int16 v80 = 1024;
                  int v81 = 840;
                  __int16 v82 = 2080;
                  *(void *)__int16 v83 = v52;
                  _os_log_impl(&dword_1E1EA4000, v60, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s", buf, 0x26u);
                }
              }
              VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v53, v54, v55, v56, v57, v58, v52);
              uint64_t v16 = v68;
            }
            uint64_t v70 = [v66 countByEnumeratingWithState:&v72 objects:v71 count:16];
          }
          while (v70);
        }
        uint64_t v15 = v65 + 1;
      }
      while (v65 + 1 != v64);
      uint64_t v64 = [(NSMutableArray *)obj countByEnumeratingWithState:&v85 objects:v84 count:16];
    }
    while (v64);
  }
}

@end