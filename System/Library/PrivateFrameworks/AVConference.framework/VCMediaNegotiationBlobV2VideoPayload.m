@interface VCMediaNegotiationBlobV2VideoPayload
+ (int)payloadWithRTPPayload:(int)a3;
+ (int)rtpPayloadWithPayload:(int)a3;
- (BOOL)hasDecodeFormats;
- (BOOL)hasEncodeDecodeFeatures;
- (BOOL)hasEncodeFormats;
- (BOOL)hasParameterSet;
- (BOOL)hasPreferredDecodeFormat;
- (BOOL)hasVideoPayload;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)setupEncode:(BOOL)a3 videoRules:(id)a4;
- (NSArray)decodeVideoRules;
- (NSArray)encodeVideoRules;
- (NSData)encodeDecodeFeatures;
- (VCMediaNegotiationBlobV2VideoPayload)initWithPayload:(int)a3 encodeVideoRules:(id)a4 decodeVideoRules:(id)a5 videoParameterSupport:(unsigned int)a6 featureListStrings:(id)a7;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)videoRulesWithBitmap:(unsigned int)a3 preferredBitmap:(unsigned int)a4;
- (int)payload;
- (unint64_t)hash;
- (unsigned)decodeFormats;
- (unsigned)encodeFormats;
- (unsigned)parameterSet;
- (unsigned)preferredDecodeFormat;
- (unsigned)videoParameterSupport;
- (unsigned)videoPayload;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)printWithLogFile:(void *)a3 prefix:(id)a4;
- (void)setDecodeFormats:(unsigned int)a3;
- (void)setEncodeDecodeFeatures:(id)a3;
- (void)setEncodeFormats:(unsigned int)a3;
- (void)setHasDecodeFormats:(BOOL)a3;
- (void)setHasEncodeFormats:(BOOL)a3;
- (void)setHasParameterSet:(BOOL)a3;
- (void)setHasPreferredDecodeFormat:(BOOL)a3;
- (void)setHasVideoPayload:(BOOL)a3;
- (void)setParameterSet:(unsigned int)a3;
- (void)setPreferredDecodeFormat:(unsigned int)a3;
- (void)setVideoPayload:(unsigned int)a3;
- (void)setupVideoParameterSupport:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobV2VideoPayload

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaNegotiationBlobV2VideoPayload *)self setEncodeDecodeFeatures:0];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2VideoPayload;
  [(VCMediaNegotiationBlobV2VideoPayload *)&v3 dealloc];
}

- (unsigned)videoPayload
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_videoPayload;
  }
  else {
    return 1;
  }
}

- (void)setVideoPayload:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_videoPayload = a3;
}

- (void)setHasVideoPayload:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVideoPayload
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setParameterSet:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_parameterSet = a3;
}

- (void)setHasParameterSet:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasParameterSet
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEncodeFormats:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_encodeFormats = a3;
}

- (void)setHasEncodeFormats:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEncodeFormats
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDecodeFormats:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_decodeFormats = a3;
}

- (void)setHasDecodeFormats:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDecodeFormats
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasEncodeDecodeFeatures
{
  return self->_encodeDecodeFeatures != 0;
}

- (void)setPreferredDecodeFormat:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_preferredDecodeFormat = a3;
}

- (void)setHasPreferredDecodeFormat:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPreferredDecodeFormat
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2VideoPayload;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobV2VideoPayload description](&v3, sel_description), -[VCMediaNegotiationBlobV2VideoPayload dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_videoPayload), @"videoPayload");
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_parameterSet), @"parameterSet");
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_encodeFormats), @"encodeFormats");
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_decodeFormats), @"decodeFormats");
LABEL_6:
  encodeDecodeFeatures = self->_encodeDecodeFeatures;
  if (encodeDecodeFeatures) {
    [v3 setObject:encodeDecodeFeatures forKey:@"encodeDecodeFeatures"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_preferredDecodeFormat), @"preferredDecodeFormat");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2VideoPayloadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_12:
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
  if (self->_encodeDecodeFeatures) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((_DWORD *)a3 + 9) = self->_videoPayload;
    *((unsigned char *)a3 + 40) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 7) = self->_parameterSet;
  *((unsigned char *)a3 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  *((_DWORD *)a3 + 6) = self->_encodeFormats;
  *((unsigned char *)a3 + 40) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    *((_DWORD *)a3 + 2) = self->_decodeFormats;
    *((unsigned char *)a3 + 40) |= 1u;
  }
LABEL_6:
  if (self->_encodeDecodeFeatures) {
    objc_msgSend(a3, "setEncodeDecodeFeatures:");
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_preferredDecodeFormat;
    *((unsigned char *)a3 + 40) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 36) = self->_videoPayload;
    *(unsigned char *)(v5 + 40) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_parameterSet;
  *(unsigned char *)(v5 + 40) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *(_DWORD *)(v5 + 24) = self->_encodeFormats;
  *(unsigned char *)(v5 + 40) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    *(_DWORD *)(v5 + 8) = self->_decodeFormats;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
LABEL_6:

  *(void *)(v6 + 16) = [(NSData *)self->_encodeDecodeFeatures copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_preferredDecodeFormat;
    *(unsigned char *)(v6 + 40) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if ((has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 0x10) == 0 || self->_videoPayload != *((_DWORD *)a3 + 9)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 0x10) != 0)
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_parameterSet != *((_DWORD *)a3 + 7)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 4) != 0)
    {
      goto LABEL_29;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_encodeFormats != *((_DWORD *)a3 + 6)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
      goto LABEL_29;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_decodeFormats != *((_DWORD *)a3 + 2)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
      goto LABEL_29;
    }
    encodeDecodeFeatures = self->_encodeDecodeFeatures;
    if ((unint64_t)encodeDecodeFeatures | *((void *)a3 + 2))
    {
      int v5 = -[NSData isEqual:](encodeDecodeFeatures, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 8) == 0;
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 8) == 0 || self->_preferredDecodeFormat != *((_DWORD *)a3 + 8)) {
        goto LABEL_29;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v3 = 2654435761 * self->_videoPayload;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_parameterSet;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_encodeFormats;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_decodeFormats;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v6 = 0;
LABEL_10:
  uint64_t v7 = [(NSData *)self->_encodeDecodeFeatures hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v8 = 2654435761 * self->_preferredDecodeFormat;
  }
  else {
    uint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 0x10) != 0)
  {
    self->_videoPayload = *((_DWORD *)a3 + 9);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)a3 + 40);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_parameterSet = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  self->_encodeFormats = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 40))
  {
LABEL_5:
    self->_decodeFormats = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_6:
  if (*((void *)a3 + 2)) {
    -[VCMediaNegotiationBlobV2VideoPayload setEncodeDecodeFeatures:](self, "setEncodeDecodeFeatures:");
  }
  if ((*((unsigned char *)a3 + 40) & 8) != 0)
  {
    self->_preferredDecodeFormat = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
}

- (unsigned)parameterSet
{
  return self->_parameterSet;
}

- (unsigned)encodeFormats
{
  return self->_encodeFormats;
}

- (unsigned)decodeFormats
{
  return self->_decodeFormats;
}

- (NSData)encodeDecodeFeatures
{
  return self->_encodeDecodeFeatures;
}

- (void)setEncodeDecodeFeatures:(id)a3
{
}

- (unsigned)preferredDecodeFormat
{
  return self->_preferredDecodeFormat;
}

- (VCMediaNegotiationBlobV2VideoPayload)initWithPayload:(int)a3 encodeVideoRules:(id)a4 decodeVideoRules:(id)a5 videoParameterSupport:(unsigned int)a6 featureListStrings:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  uint64_t v11 = *(void *)&a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v12 = [(VCMediaNegotiationBlobV2VideoPayload *)self init];
  if (v12)
  {
    v13 = +[VCMediaNegotiationBlobV2VideoPayload payloadWithRTPPayload:v11];
    if (v13)
    {
      v14 = v13;
      if ([(VCMediaNegotiationBlobV2VideoPayload *)v12 videoPayload] != v13) {
        [(VCMediaNegotiationBlobV2VideoPayload *)v12 setVideoPayload:v14];
      }
      int v15 = _os_feature_enabled_impl();
      if (a7)
      {
        if (v15)
        {
          uint64_t v16 = objc_msgSend(a7, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v11));
          if (v16)
          {
            uint64_t v17 = v16;
            [(VCMediaNegotiationBlobV2VideoPayload *)v12 setEncodeDecodeFeatures:(id)VCPCreateCompressedFLS()];
            if (![(VCMediaNegotiationBlobV2VideoPayload *)v12 encodeDecodeFeatures]
              && (int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              uint64_t v18 = VRTraceErrorLogLevelToCSTR();
              v19 = *MEMORY[0x1E4F47A50];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
              {
                int v21 = 136316162;
                uint64_t v22 = v18;
                __int16 v23 = 2080;
                v24 = "-[VCMediaNegotiationBlobV2VideoPayload(Utils) initWithPayload:encodeVideoRules:decodeVideoRules:vi"
                      "deoParameterSupport:featureListStrings:]";
                __int16 v25 = 1024;
                int v26 = 41;
                __int16 v27 = 2112;
                uint64_t v28 = v17;
                __int16 v29 = 1024;
                int v30 = v11;
                _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d VCPCreateCompressedFLS return nil for featureString=%@, payload=%u)", (uint8_t *)&v21, 0x2Cu);
              }
            }
          }
        }
      }
      [(VCMediaNegotiationBlobV2VideoPayload *)v12 setupVideoParameterSupport:v8];
      if ([(VCMediaNegotiationBlobV2VideoPayload *)v12 setupEncode:1 videoRules:a4])
      {
        if ([(VCMediaNegotiationBlobV2VideoPayload *)v12 setupEncode:0 videoRules:a5]) {
          return v12;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaNegotiationBlobV2VideoPayload(Utils) initWithPayload:encodeVideoRules:decodeVideoRules:videoParameterSupport:featureListStrings:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) initWithPayload:encodeVideoRules:decodeVideoRules:videoParameterSupport:featureListStrings:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2VideoPayload(Utils) initWithPayload:encodeVideoRules:decodeVideoRules:videoParameterSupport:featureListStrings:]();
      }
    }

    return 0;
  }
  return v12;
}

- (int)payload
{
  uint64_t v2 = [(VCMediaNegotiationBlobV2VideoPayload *)self videoPayload];

  return +[VCMediaNegotiationBlobV2VideoPayload rtpPayloadWithPayload:v2];
}

- (NSArray)encodeVideoRules
{
  uint64_t v3 = [(VCMediaNegotiationBlobV2VideoPayload *)self encodeFormats];

  return (NSArray *)[(VCMediaNegotiationBlobV2VideoPayload *)self videoRulesWithBitmap:v3 preferredBitmap:0];
}

- (NSArray)decodeVideoRules
{
  uint64_t v3 = [(VCMediaNegotiationBlobV2VideoPayload *)self decodeFormats];
  if ([(VCMediaNegotiationBlobV2VideoPayload *)self hasPreferredDecodeFormat]) {
    uint64_t v4 = [(VCMediaNegotiationBlobV2VideoPayload *)self preferredDecodeFormat];
  }
  else {
    uint64_t v4 = 0;
  }

  return (NSArray *)[(VCMediaNegotiationBlobV2VideoPayload *)self videoRulesWithBitmap:v3 preferredBitmap:v4];
}

- (id)videoRulesWithBitmap:(unsigned int)a3 preferredBitmap:(unsigned int)a4
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v158 = VRTraceErrorLogLevelToCSTR();
      v159 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:](v158, v159);
      }
    }
    goto LABEL_245;
  }
  uint64_t v8 = +[VCMediaNegotiationBlobV2VideoPayload rtpPayloadWithPayload:[(VCMediaNegotiationBlobV2VideoPayload *)self videoPayload]];
  if (v8 == 128)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v160 = VRTraceErrorLogLevelToCSTR();
      v161 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:](v160, self, v161);
      }
    }
    goto LABEL_245;
  }
  uint64_t v9 = v8;
  if (a3)
  {
    v10 = [VCVideoRule alloc];
    LODWORD(v11) = 15.0;
    v12 = [(VCVideoRule *)v10 initWithFrameWidth:192 frameHeight:112 frameRate:v9 payload:v11];
    if (!v12)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]1();
        }
      }
      goto LABEL_245;
    }
    v14 = v12;
    if (a4)
    {
      LODWORD(v13) = 1.0;
      [(VCVideoRule *)v12 setFPref:v13];
    }
    [v7 addObject:v14];
  }
  if ((a3 & 2) != 0)
  {
    int v15 = [VCVideoRule alloc];
    LODWORD(v16) = 15.0;
    uint64_t v17 = [(VCVideoRule *)v15 initWithFrameWidth:320 frameHeight:240 frameRate:v9 payload:v16];
    if (!v17)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]0();
        }
      }
      goto LABEL_245;
    }
    v19 = v17;
    if ((a4 & 2) != 0)
    {
      LODWORD(v18) = 1.0;
      [(VCVideoRule *)v17 setFPref:v18];
    }
    [v7 addObject:v19];
  }
  if ((a3 & 4) != 0)
  {
    v20 = [VCVideoRule alloc];
    LODWORD(v21) = 30.0;
    uint64_t v22 = [(VCVideoRule *)v20 initWithFrameWidth:320 frameHeight:240 frameRate:v9 payload:v21];
    if (!v22)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]9();
        }
      }
      goto LABEL_245;
    }
    v24 = v22;
    if ((a4 & 4) != 0)
    {
      LODWORD(v23) = 1.0;
      [(VCVideoRule *)v22 setFPref:v23];
    }
    [v7 addObject:v24];
  }
  if ((a3 & 8) != 0)
  {
    __int16 v25 = [VCVideoRule alloc];
    LODWORD(v26) = 15.0;
    __int16 v27 = [(VCVideoRule *)v25 initWithFrameWidth:480 frameHeight:272 frameRate:v9 payload:v26];
    if (!v27)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]8();
        }
      }
      goto LABEL_245;
    }
    __int16 v29 = v27;
    if ((a4 & 8) != 0)
    {
      LODWORD(v28) = 1.0;
      [(VCVideoRule *)v27 setFPref:v28];
    }
    [v7 addObject:v29];
  }
  if ((a3 & 0x10) != 0)
  {
    int v30 = [VCVideoRule alloc];
    LODWORD(v31) = 30.0;
    v32 = [(VCVideoRule *)v30 initWithFrameWidth:480 frameHeight:272 frameRate:v9 payload:v31];
    if (!v32)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]7();
        }
      }
      goto LABEL_245;
    }
    v34 = v32;
    if ((a4 & 0x10) != 0)
    {
      LODWORD(v33) = 1.0;
      [(VCVideoRule *)v32 setFPref:v33];
    }
    [v7 addObject:v34];
  }
  if ((a3 & 0x20) != 0)
  {
    v35 = [VCVideoRule alloc];
    LODWORD(v36) = 15.0;
    v37 = [(VCVideoRule *)v35 initWithFrameWidth:480 frameHeight:368 frameRate:v9 payload:v36];
    if (!v37)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]6();
        }
      }
      goto LABEL_245;
    }
    v39 = v37;
    if ((a4 & 0x20) != 0)
    {
      LODWORD(v38) = 1.0;
      [(VCVideoRule *)v37 setFPref:v38];
    }
    [v7 addObject:v39];
  }
  if ((a3 & 0x40) != 0)
  {
    v40 = [VCVideoRule alloc];
    LODWORD(v41) = 30.0;
    v42 = [(VCVideoRule *)v40 initWithFrameWidth:480 frameHeight:368 frameRate:v9 payload:v41];
    if (!v42)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]5();
        }
      }
      goto LABEL_245;
    }
    v44 = v42;
    if ((a4 & 0x40) != 0)
    {
      LODWORD(v43) = 1.0;
      [(VCVideoRule *)v42 setFPref:v43];
    }
    [v7 addObject:v44];
  }
  if ((a3 & 0x80) != 0)
  {
    v45 = [VCVideoRule alloc];
    LODWORD(v46) = 15.0;
    v47 = [(VCVideoRule *)v45 initWithFrameWidth:640 frameHeight:480 frameRate:v9 payload:v46];
    if (!v47)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]4();
        }
      }
      goto LABEL_245;
    }
    v49 = v47;
    if ((a4 & 0x80) != 0)
    {
      LODWORD(v48) = 1.0;
      [(VCVideoRule *)v47 setFPref:v48];
    }
    [v7 addObject:v49];
  }
  if ((a3 & 0x100) != 0)
  {
    v50 = [VCVideoRule alloc];
    LODWORD(v51) = 30.0;
    v52 = [(VCVideoRule *)v50 initWithFrameWidth:640 frameHeight:480 frameRate:v9 payload:v51];
    if (!v52)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]3();
        }
      }
      goto LABEL_245;
    }
    v54 = v52;
    if ((a4 & 0x100) != 0)
    {
      LODWORD(v53) = 1.0;
      [(VCVideoRule *)v52 setFPref:v53];
    }
    [v7 addObject:v54];
  }
  if ((a3 & 0x200) != 0)
  {
    v55 = [VCVideoRule alloc];
    LODWORD(v56) = 15.0;
    v57 = [(VCVideoRule *)v55 initWithFrameWidth:848 frameHeight:480 frameRate:v9 payload:v56];
    if (!v57)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]2();
        }
      }
      goto LABEL_245;
    }
    v59 = v57;
    if ((a4 & 0x200) != 0)
    {
      LODWORD(v58) = 1.0;
      [(VCVideoRule *)v57 setFPref:v58];
    }
    [v7 addObject:v59];
  }
  if ((a3 & 0x400) != 0)
  {
    v60 = [VCVideoRule alloc];
    LODWORD(v61) = 30.0;
    v62 = [(VCVideoRule *)v60 initWithFrameWidth:848 frameHeight:480 frameRate:v9 payload:v61];
    if (!v62)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]1();
        }
      }
      goto LABEL_245;
    }
    v64 = v62;
    if ((a4 & 0x400) != 0)
    {
      LODWORD(v63) = 1.0;
      [(VCVideoRule *)v62 setFPref:v63];
    }
    [v7 addObject:v64];
  }
  if ((a3 & 0x800) != 0)
  {
    v65 = [VCVideoRule alloc];
    LODWORD(v66) = 15.0;
    v67 = [(VCVideoRule *)v65 initWithFrameWidth:896 frameHeight:672 frameRate:v9 payload:v66];
    if (!v67)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]0();
        }
      }
      goto LABEL_245;
    }
    v69 = v67;
    if ((a4 & 0x800) != 0)
    {
      LODWORD(v68) = 1.0;
      [(VCVideoRule *)v67 setFPref:v68];
    }
    [v7 addObject:v69];
  }
  if ((a3 & 0x1000) != 0)
  {
    v70 = [VCVideoRule alloc];
    LODWORD(v71) = 30.0;
    v72 = [(VCVideoRule *)v70 initWithFrameWidth:896 frameHeight:672 frameRate:v9 payload:v71];
    if (!v72)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]9();
        }
      }
      goto LABEL_245;
    }
    v74 = v72;
    if ((a4 & 0x1000) != 0)
    {
      LODWORD(v73) = 1.0;
      [(VCVideoRule *)v72 setFPref:v73];
    }
    [v7 addObject:v74];
  }
  if ((a3 & 0x2000) != 0)
  {
    v75 = [VCVideoRule alloc];
    LODWORD(v76) = 1114636288;
    v77 = [(VCVideoRule *)v75 initWithFrameWidth:896 frameHeight:672 frameRate:v9 payload:v76];
    if (!v77)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]8();
        }
      }
      goto LABEL_245;
    }
    v79 = v77;
    if ((a4 & 0x2000) != 0)
    {
      LODWORD(v78) = 1.0;
      [(VCVideoRule *)v77 setFPref:v78];
    }
    [v7 addObject:v79];
  }
  if ((a3 & 0x4000) != 0)
  {
    v80 = [VCVideoRule alloc];
    LODWORD(v81) = 15.0;
    v82 = [(VCVideoRule *)v80 initWithFrameWidth:1024 frameHeight:576 frameRate:v9 payload:v81];
    if (!v82)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]7();
        }
      }
      goto LABEL_245;
    }
    v84 = v82;
    if ((a4 & 0x4000) != 0)
    {
      LODWORD(v83) = 1.0;
      [(VCVideoRule *)v82 setFPref:v83];
    }
    [v7 addObject:v84];
  }
  if ((a3 & 0x8000) != 0)
  {
    v85 = [VCVideoRule alloc];
    LODWORD(v86) = 15.0;
    v87 = [(VCVideoRule *)v85 initWithFrameWidth:1024 frameHeight:768 frameRate:v9 payload:v86];
    if (!v87)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]6();
        }
      }
      goto LABEL_245;
    }
    v89 = v87;
    if ((a4 & 0x8000) != 0)
    {
      LODWORD(v88) = 1.0;
      [(VCVideoRule *)v87 setFPref:v88];
    }
    [v7 addObject:v89];
  }
  if ((a3 & 0x10000) != 0)
  {
    v90 = [VCVideoRule alloc];
    LODWORD(v91) = 30.0;
    v92 = [(VCVideoRule *)v90 initWithFrameWidth:1024 frameHeight:768 frameRate:v9 payload:v91];
    if (!v92)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]5();
        }
      }
      goto LABEL_245;
    }
    v94 = v92;
    if ((a4 & 0x10000) != 0)
    {
      LODWORD(v93) = 1.0;
      [(VCVideoRule *)v92 setFPref:v93];
    }
    [v7 addObject:v94];
  }
  if ((a3 & 0x20000) != 0)
  {
    v95 = [VCVideoRule alloc];
    LODWORD(v96) = 1114636288;
    v97 = [(VCVideoRule *)v95 initWithFrameWidth:1024 frameHeight:768 frameRate:v9 payload:v96];
    if (!v97)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]4();
        }
      }
      goto LABEL_245;
    }
    v99 = v97;
    if ((a4 & 0x20000) != 0)
    {
      LODWORD(v98) = 1.0;
      [(VCVideoRule *)v97 setFPref:v98];
    }
    [v7 addObject:v99];
  }
  if ((a3 & 0x40000) != 0)
  {
    v100 = [VCVideoRule alloc];
    LODWORD(v101) = 15.0;
    v102 = [(VCVideoRule *)v100 initWithFrameWidth:1280 frameHeight:720 frameRate:v9 payload:v101];
    if (!v102)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]3();
        }
      }
      goto LABEL_245;
    }
    v104 = v102;
    if ((a4 & 0x40000) != 0)
    {
      LODWORD(v103) = 1.0;
      [(VCVideoRule *)v102 setFPref:v103];
    }
    [v7 addObject:v104];
  }
  if ((a3 & 0x80000) != 0)
  {
    v105 = [VCVideoRule alloc];
    LODWORD(v106) = 30.0;
    v107 = [(VCVideoRule *)v105 initWithFrameWidth:1024 frameHeight:576 frameRate:v9 payload:v106];
    if (!v107)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]2();
        }
      }
      goto LABEL_245;
    }
    v109 = v107;
    if ((a4 & 0x80000) != 0)
    {
      LODWORD(v108) = 1.0;
      [(VCVideoRule *)v107 setFPref:v108];
    }
    [v7 addObject:v109];
  }
  if ((a3 & 0x100000) != 0)
  {
    v110 = [VCVideoRule alloc];
    LODWORD(v111) = 30.0;
    v112 = [(VCVideoRule *)v110 initWithFrameWidth:1280 frameHeight:720 frameRate:v9 payload:v111];
    if (!v112)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]1();
        }
      }
      goto LABEL_245;
    }
    v114 = v112;
    if ((a4 & 0x100000) != 0)
    {
      LODWORD(v113) = 1.0;
      [(VCVideoRule *)v112 setFPref:v113];
    }
    [v7 addObject:v114];
  }
  if ((a3 & 0x200000) != 0)
  {
    v115 = [VCVideoRule alloc];
    LODWORD(v116) = 1114636288;
    v117 = [(VCVideoRule *)v115 initWithFrameWidth:1280 frameHeight:720 frameRate:v9 payload:v116];
    if (!v117)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]0();
        }
      }
      goto LABEL_245;
    }
    v119 = v117;
    if ((a4 & 0x200000) != 0)
    {
      LODWORD(v118) = 1.0;
      [(VCVideoRule *)v117 setFPref:v118];
    }
    [v7 addObject:v119];
  }
  if ((a3 & 0x400000) != 0)
  {
    v120 = [VCVideoRule alloc];
    LODWORD(v121) = 30.0;
    v122 = [(VCVideoRule *)v120 initWithFrameWidth:1440 frameHeight:1080 frameRate:v9 payload:v121];
    if (!v122)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.9();
        }
      }
      goto LABEL_245;
    }
    v124 = v122;
    if ((a4 & 0x400000) != 0)
    {
      LODWORD(v123) = 1.0;
      [(VCVideoRule *)v122 setFPref:v123];
    }
    [v7 addObject:v124];
  }
  if ((a3 & 0x800000) != 0)
  {
    v125 = [VCVideoRule alloc];
    LODWORD(v126) = 30.0;
    v127 = [(VCVideoRule *)v125 initWithFrameWidth:1664 frameHeight:1248 frameRate:v9 payload:v126];
    if (!v127)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.8();
        }
      }
      goto LABEL_245;
    }
    v129 = v127;
    if ((a4 & 0x800000) != 0)
    {
      LODWORD(v128) = 1.0;
      [(VCVideoRule *)v127 setFPref:v128];
    }
    [v7 addObject:v129];
  }
  if ((a3 & 0x1000000) != 0)
  {
    v130 = [VCVideoRule alloc];
    LODWORD(v131) = 1114636288;
    v132 = [(VCVideoRule *)v130 initWithFrameWidth:1664 frameHeight:1248 frameRate:v9 payload:v131];
    if (!v132)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.7();
        }
      }
      goto LABEL_245;
    }
    v134 = v132;
    if ((a4 & 0x1000000) != 0)
    {
      LODWORD(v133) = 1.0;
      [(VCVideoRule *)v132 setFPref:v133];
    }
    [v7 addObject:v134];
  }
  if ((a3 & 0x2000000) != 0)
  {
    v135 = [VCVideoRule alloc];
    LODWORD(v136) = 30.0;
    v137 = [(VCVideoRule *)v135 initWithFrameWidth:1920 frameHeight:1080 frameRate:v9 payload:v136];
    if (!v137)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.6();
        }
      }
      goto LABEL_245;
    }
    v139 = v137;
    if ((a4 & 0x2000000) != 0)
    {
      LODWORD(v138) = 1.0;
      [(VCVideoRule *)v137 setFPref:v138];
    }
    [v7 addObject:v139];
  }
  if ((a3 & 0x4000000) != 0)
  {
    v140 = [VCVideoRule alloc];
    LODWORD(v141) = 1114636288;
    v142 = [(VCVideoRule *)v140 initWithFrameWidth:1920 frameHeight:1080 frameRate:v9 payload:v141];
    if (!v142)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.5();
        }
      }
      goto LABEL_245;
    }
    v144 = v142;
    if ((a4 & 0x4000000) != 0)
    {
      LODWORD(v143) = 1.0;
      [(VCVideoRule *)v142 setFPref:v143];
    }
    [v7 addObject:v144];
  }
  if ((a3 & 0x10000000) != 0)
  {
    v145 = [VCVideoRule alloc];
    LODWORD(v146) = 30.0;
    v147 = [(VCVideoRule *)v145 initWithFrameWidth:1088 frameHeight:1088 frameRate:v9 payload:v146];
    if (!v147)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:].cold.4();
        }
      }
      goto LABEL_245;
    }
    v149 = v147;
    if ((a4 & 0x10000000) != 0)
    {
      LODWORD(v148) = 1.0;
      [(VCVideoRule *)v147 setFPref:v148];
    }
    [v7 addObject:v149];
  }
  if ((a3 & 0x8000000) == 0) {
    goto LABEL_148;
  }
  v150 = [VCVideoRule alloc];
  LODWORD(v151) = 1114636288;
  v152 = [(VCVideoRule *)v150 initWithFrameWidth:1088 frameHeight:1088 frameRate:v9 payload:v151];
  if (!v152)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]();
      }
    }
LABEL_245:

    id v7 = 0;
    goto LABEL_148;
  }
  v154 = v152;
  if ((a4 & 0x8000000) != 0)
  {
    LODWORD(v153) = 1.0;
    [(VCVideoRule *)v152 setFPref:v153];
  }
  [v7 addObject:v154];

LABEL_148:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v155 = VRTraceErrorLogLevelToCSTR();
    v156 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v162 = 136316162;
      uint64_t v163 = v155;
      __int16 v164 = 2080;
      v165 = "-[VCMediaNegotiationBlobV2VideoPayload(Utils) videoRulesWithBitmap:preferredBitmap:]";
      __int16 v166 = 1024;
      int v167 = 131;
      __int16 v168 = 1024;
      unsigned int v169 = a4;
      __int16 v170 = 2112;
      id v171 = v7;
      _os_log_impl(&dword_1E1EA4000, v156, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d preferredBitmap=0x%x, videoRules=%@", (uint8_t *)&v162, 0x2Cu);
    }
  }
  return v7;
}

- (unsigned)videoParameterSupport
{
  return [(VCMediaNegotiationBlobV2VideoPayload *)self parameterSet] & 0xF;
}

- (void)printWithLogFile:(void *)a3 prefix:(id)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  char v5 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"[%lu] %@", objc_msgSend((id)-[VCMediaNegotiationBlobV2VideoPayload data](self, "data"), "length"), a4];
  uint64_t v6 = [(VCMediaNegotiationBlobV2VideoPayload *)self videoPayload];
  if ((v6 - 1) >= 3) {
    id v7 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v6);
  }
  else {
    id v7 = off_1E6DB7A58[(int)v6 - 1];
  }
  [v5 appendFormat:@"Payload=%@", v7];
  if ([(VCMediaNegotiationBlobV2VideoPayload *)self hasEncodeDecodeFeatures]) {
    [v5 appendFormat:@" encodeDecodeFeatures=%@", -[VCMediaNegotiationBlobV2VideoPayload encodeDecodeFeatures](self, "encodeDecodeFeatures")];
  }
  [v5 appendFormat:@" Encode=["];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  v47 = self;
  obuint64_t j = [(VCMediaNegotiationBlobV2VideoPayload *)self encodeVideoRules];
  uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v64 objects:v63 count:16];
  uint64_t v9 = v5;
  if (v8)
  {
    uint64_t v10 = v8;
    double v11 = &stru_1F3D3E450;
    uint64_t v12 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v65 != v12) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v64 + 1) + 8 * i);
        uint64_t v15 = [v14 iWidth];
        uint64_t v16 = [v14 iHeight];
        [v14 fRate];
        double v18 = v17;
        [v14 fPref];
        v19 = "";
        if (v20 == 1.0) {
          v19 = "(Pref)";
        }
        char v5 = v9;
        [v9 appendFormat:@"%@%dx%d@%.0f%s", v11, v15, v16, *(void *)&v18, v19];
        double v11 = @", ";
      }
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v64 objects:v63 count:16];
      double v11 = @", ";
    }
    while (v10);
  }
  [v5 appendFormat:@"] Decode=["];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  obja = [(VCMediaNegotiationBlobV2VideoPayload *)v47 decodeVideoRules];
  uint64_t v21 = [(NSArray *)obja countByEnumeratingWithState:&v59 objects:v58 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    double v23 = &stru_1F3D3E450;
    uint64_t v24 = *(void *)v60;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v60 != v24) {
          objc_enumerationMutation(obja);
        }
        double v26 = *(void **)(*((void *)&v59 + 1) + 8 * j);
        uint64_t v27 = [v26 iWidth];
        uint64_t v28 = [v26 iHeight];
        [v26 fRate];
        double v30 = v29;
        [v26 fPref];
        double v31 = "";
        if (v32 == 1.0) {
          double v31 = "(Pref)";
        }
        char v5 = v9;
        [v9 appendFormat:@"%@%dx%d@%.0f%s", v23, v27, v28, *(void *)&v30, v31];
        double v23 = @", ";
      }
      uint64_t v22 = [(NSArray *)obja countByEnumeratingWithState:&v59 objects:v58 count:16];
      double v23 = @", ";
    }
    while (v22);
  }
  [v5 appendFormat:@"]"];
  unsigned int v33 = [(VCMediaNegotiationBlobV2VideoPayload *)v47 parameterSet];
  [v5 appendFormat:@" paramSet=["];
  if ((v33 & 0xF) != 0)
  {
    v34 = &stru_1F3D3E450;
    uint64_t v35 = 1;
    do
    {
      if ((v35 & v33) != 0)
      {
        double v36 = @"ImageDescription";
        switch((int)v35)
        {
          case 1:
            break;
          case 2:
            double v36 = @"SPS";
            break;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_31;
          case 4:
            double v36 = @"PPS";
            break;
          case 8:
            double v36 = @"VPS";
            break;
          default:
            if (v35 == 15) {
              double v36 = @"SupportedMask";
            }
            else {
LABEL_31:
            }
              double v36 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v35);
            break;
        }
        [v9 appendFormat:@"%@%@", v34, v36];
        v34 = @", ";
      }
      v33 &= ~v35;
      uint64_t v35 = (2 * v35);
    }
    while ((v33 & 0xF) != 0);
  }
  [v9 appendString:@"]"];
  char v37 = [v9 UTF8String];
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v38, v39, v40, v41, v42, v43, v37);
  if ((int)VRTraceGetErrorLogLevelForModule() > 5)
  {
    uint64_t v44 = VRTraceErrorLogLevelToCSTR();
    v45 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v51 = v44;
      __int16 v52 = 2080;
      double v53 = "-[VCMediaNegotiationBlobV2VideoPayload(Utils) printWithLogFile:prefix:]";
      __int16 v54 = 1024;
      int v55 = 187;
      __int16 v56 = 2112;
      v57 = v9;
      _os_log_impl(&dword_1E1EA4000, v45, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

+ (int)payloadWithRTPPayload:(int)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 == 123) {
    return 1;
  }
  if (a3 == 100) {
    return 2;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    BOOL v7 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    int result = 0;
    if (!v7) {
      return result;
    }
    int v8 = 136315906;
    uint64_t v9 = v5;
    __int16 v10 = 2080;
    double v11 = "+[VCMediaNegotiationBlobV2VideoPayload(Utils) payloadWithRTPPayload:]";
    __int16 v12 = 1024;
    int v13 = 199;
    __int16 v14 = 1024;
    int v15 = a3;
    _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown video payload (payload=%d)", (uint8_t *)&v8, 0x22u);
  }
  return 0;
}

+ (int)rtpPayloadWithPayload:(int)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 == 2) {
    return 100;
  }
  if (a3 == 1) {
    return 123;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      __int16 v10 = "+[VCMediaNegotiationBlobV2VideoPayload(Utils) rtpPayloadWithPayload:]";
      __int16 v11 = 1024;
      int v12 = 211;
      __int16 v13 = 1024;
      int v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Unknown video payload (%d)", (uint8_t *)&v7, 0x22u);
    }
  }
  return 128;
}

- (BOOL)setupEncode:(BOOL)a3 videoRules:(id)a4
{
  BOOL v5 = a3;
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v77 objects:v76 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    LODWORD(v9) = 0;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v78;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v78 != v11) {
        objc_enumerationMutation(a4);
      }
      __int16 v13 = *(void **)(*((void *)&v77 + 1) + 8 * v12);
      if ([v13 iWidth] == 192
        && [v13 iHeight] == 112
        && ([v13 fRate], v14 == 15.0))
      {
        uint64_t v9 = v9 | 1;
        [v13 fPref];
        if (v15 == 1.0) {
          uint64_t v10 = v10 | 1;
        }
      }
      else if ([v13 iWidth] == 320 {
             && [v13 iHeight] == 240
      }
             && ([v13 fRate], v16 == 15.0))
      {
        uint64_t v9 = v9 | 2;
        [v13 fPref];
        if (v17 == 1.0) {
          uint64_t v10 = v10 | 2;
        }
      }
      else if ([v13 iWidth] == 320 {
             && [v13 iHeight] == 240
      }
             && ([v13 fRate], v18 == 30.0))
      {
        uint64_t v9 = v9 | 4;
        [v13 fPref];
        if (v19 == 1.0) {
          uint64_t v10 = v10 | 4;
        }
      }
      else if ([v13 iWidth] == 480 {
             && [v13 iHeight] == 272
      }
             && ([v13 fRate], v20 == 15.0))
      {
        uint64_t v9 = v9 | 8;
        [v13 fPref];
        if (v21 == 1.0) {
          uint64_t v10 = v10 | 8;
        }
      }
      else if ([v13 iWidth] == 480 {
             && [v13 iHeight] == 272
      }
             && ([v13 fRate], v22 == 30.0))
      {
        uint64_t v9 = v9 | 0x10;
        [v13 fPref];
        if (v23 == 1.0) {
          uint64_t v10 = v10 | 0x10;
        }
      }
      else if ([v13 iWidth] == 480 {
             && [v13 iHeight] == 368
      }
             && ([v13 fRate], v24 == 15.0))
      {
        uint64_t v9 = v9 | 0x20;
        [v13 fPref];
        if (v25 == 1.0) {
          uint64_t v10 = v10 | 0x20;
        }
      }
      else if ([v13 iWidth] == 480 {
             && [v13 iHeight] == 368
      }
             && ([v13 fRate], v26 == 30.0))
      {
        uint64_t v9 = v9 | 0x40;
        [v13 fPref];
        if (v27 == 1.0) {
          uint64_t v10 = v10 | 0x40;
        }
      }
      else if ([v13 iWidth] == 640 {
             && [v13 iHeight] == 480
      }
             && ([v13 fRate], v28 == 15.0))
      {
        uint64_t v9 = v9 | 0x80;
        [v13 fPref];
        if (v29 == 1.0) {
          uint64_t v10 = v10 | 0x80;
        }
      }
      else if ([v13 iWidth] == 640 {
             && [v13 iHeight] == 480
      }
             && ([v13 fRate], v30 == 30.0))
      {
        uint64_t v9 = v9 | 0x100;
        [v13 fPref];
        if (v31 == 1.0) {
          uint64_t v10 = v10 | 0x100;
        }
      }
      else if ([v13 iWidth] == 848 {
             && [v13 iHeight] == 480
      }
             && ([v13 fRate], v32 == 15.0))
      {
        uint64_t v9 = v9 | 0x200;
        [v13 fPref];
        if (v33 == 1.0) {
          uint64_t v10 = v10 | 0x200;
        }
      }
      else if ([v13 iWidth] == 848 {
             && [v13 iHeight] == 480
      }
             && ([v13 fRate], v34 == 30.0))
      {
        uint64_t v9 = v9 | 0x400;
        [v13 fPref];
        if (v35 == 1.0) {
          uint64_t v10 = v10 | 0x400;
        }
      }
      else if ([v13 iWidth] == 896 {
             && [v13 iHeight] == 672
      }
             && ([v13 fRate], v36 == 15.0))
      {
        uint64_t v9 = v9 | 0x800;
        [v13 fPref];
        if (v37 == 1.0) {
          uint64_t v10 = v10 | 0x800;
        }
      }
      else if ([v13 iWidth] == 896 {
             && [v13 iHeight] == 672
      }
             && ([v13 fRate], v38 == 30.0))
      {
        uint64_t v9 = v9 | 0x1000;
        [v13 fPref];
        if (v39 == 1.0) {
          uint64_t v10 = v10 | 0x1000;
        }
      }
      else if ([v13 iWidth] == 896 {
             && [v13 iHeight] == 672
      }
             && ([v13 fRate], v40 == 60.0))
      {
        uint64_t v9 = v9 | 0x2000;
        [v13 fPref];
        if (v41 == 1.0) {
          uint64_t v10 = v10 | 0x2000;
        }
      }
      else if ([v13 iWidth] == 1024 {
             && [v13 iHeight] == 576
      }
             && ([v13 fRate], v42 == 15.0))
      {
        uint64_t v9 = v9 | 0x4000;
        [v13 fPref];
        if (v43 == 1.0) {
          uint64_t v10 = v10 | 0x4000;
        }
      }
      else if ([v13 iWidth] == 1024 {
             && [v13 iHeight] == 768
      }
             && ([v13 fRate], v44 == 15.0))
      {
        uint64_t v9 = v9 | 0x8000;
        [v13 fPref];
        if (v45 == 1.0) {
          uint64_t v10 = v10 | 0x8000;
        }
      }
      else if ([v13 iWidth] == 1024 {
             && [v13 iHeight] == 768
      }
             && ([v13 fRate], v46 == 30.0))
      {
        uint64_t v9 = v9 | 0x10000;
        [v13 fPref];
        if (v47 == 1.0) {
          uint64_t v10 = v10 | 0x10000;
        }
      }
      else if ([v13 iWidth] == 1024 {
             && [v13 iHeight] == 768
      }
             && ([v13 fRate], v48 == 60.0))
      {
        uint64_t v9 = v9 | 0x20000;
        [v13 fPref];
        if (v49 == 1.0) {
          uint64_t v10 = v10 | 0x20000;
        }
      }
      else if ([v13 iWidth] == 1280 {
             && [v13 iHeight] == 720
      }
             && ([v13 fRate], v50 == 15.0))
      {
        uint64_t v9 = v9 | 0x40000;
        [v13 fPref];
        if (v51 == 1.0) {
          uint64_t v10 = v10 | 0x40000;
        }
      }
      else if ([v13 iWidth] == 1024 {
             && [v13 iHeight] == 576
      }
             && ([v13 fRate], v52 == 30.0))
      {
        uint64_t v9 = v9 | 0x80000;
        [v13 fPref];
        if (v53 == 1.0) {
          uint64_t v10 = v10 | 0x80000;
        }
      }
      else if ([v13 iWidth] == 1280 {
             && [v13 iHeight] == 720
      }
             && ([v13 fRate], v54 == 30.0))
      {
        uint64_t v9 = v9 | 0x100000;
        [v13 fPref];
        if (v55 == 1.0) {
          uint64_t v10 = v10 | 0x100000;
        }
      }
      else if ([v13 iWidth] == 1280 {
             && [v13 iHeight] == 720
      }
             && ([v13 fRate], v56 == 60.0))
      {
        uint64_t v9 = v9 | 0x200000;
        [v13 fPref];
        if (v57 == 1.0) {
          uint64_t v10 = v10 | 0x200000;
        }
      }
      else if ([v13 iWidth] == 1440 {
             && [v13 iHeight] == 1080
      }
             && ([v13 fRate], v58 == 30.0))
      {
        uint64_t v9 = v9 | 0x400000;
        [v13 fPref];
        if (v59 == 1.0) {
          uint64_t v10 = v10 | 0x400000;
        }
      }
      else if ([v13 iWidth] == 1664 {
             && [v13 iHeight] == 1248
      }
             && ([v13 fRate], v60 == 30.0))
      {
        uint64_t v9 = v9 | 0x800000;
        [v13 fPref];
        if (v61 == 1.0) {
          uint64_t v10 = v10 | 0x800000;
        }
      }
      else if ([v13 iWidth] == 1664 {
             && [v13 iHeight] == 1248
      }
             && ([v13 fRate], v62 == 60.0))
      {
        uint64_t v9 = v9 | 0x1000000;
        [v13 fPref];
        if (v63 == 1.0) {
          uint64_t v10 = v10 | 0x1000000;
        }
      }
      else if ([v13 iWidth] == 1920 {
             && [v13 iHeight] == 1080
      }
             && ([v13 fRate], v64 == 30.0))
      {
        uint64_t v9 = v9 | 0x2000000;
        [v13 fPref];
        if (v65 == 1.0) {
          uint64_t v10 = v10 | 0x2000000;
        }
      }
      else if ([v13 iWidth] == 1920 {
             && [v13 iHeight] == 1080
      }
             && ([v13 fRate], v66 == 60.0))
      {
        uint64_t v9 = v9 | 0x4000000;
        [v13 fPref];
        if (v67 == 1.0) {
          uint64_t v10 = v10 | 0x4000000;
        }
      }
      else if ([v13 iWidth] == 1088 {
             && [v13 iHeight] == 1088
      }
             && ([v13 fRate], v68 == 30.0))
      {
        uint64_t v9 = v9 | 0x10000000;
        [v13 fPref];
        if (v69 == 1.0) {
          uint64_t v10 = v10 | 0x10000000;
        }
      }
      else
      {
        if ([v13 iWidth] != 1088
          || [v13 iHeight] != 1088
          || ([v13 fRate], v70 != 60.0))
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v73 = VRTraceErrorLogLevelToCSTR();
            v74 = *MEMORY[0x1E4F47A50];
            BOOL v72 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
            if (!v72) {
              return v72;
            }
            -[VCMediaNegotiationBlobV2VideoPayload(Utils) setupEncode:videoRules:](v73, v13, v74);
          }
          LOBYTE(v72) = 0;
          return v72;
        }
        uint64_t v9 = v9 | 0x8000000;
        [v13 fPref];
        if (v71 == 1.0) {
          uint64_t v10 = v10 | 0x8000000;
        }
      }
      if (v8 == ++v12)
      {
        uint64_t v8 = [a4 countByEnumeratingWithState:&v77 objects:v76 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_155;
      }
    }
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
LABEL_155:
  if (v5)
  {
    if ([(VCMediaNegotiationBlobV2VideoPayload *)self encodeFormats] != v9) {
      [(VCMediaNegotiationBlobV2VideoPayload *)self setEncodeFormats:v9];
    }
  }
  else
  {
    if ([(VCMediaNegotiationBlobV2VideoPayload *)self decodeFormats] != v9) {
      [(VCMediaNegotiationBlobV2VideoPayload *)self setDecodeFormats:v9];
    }
    [(VCMediaNegotiationBlobV2VideoPayload *)self setPreferredDecodeFormat:v10];
  }
  LOBYTE(v72) = 1;
  return v72;
}

- (void)setupVideoParameterSupport:(unsigned int)a3
{
  uint64_t v4 = a3 & 0xF;
  if (v4 != [(VCMediaNegotiationBlobV2VideoPayload *)self parameterSet])
  {
    [(VCMediaNegotiationBlobV2VideoPayload *)self setParameterSet:v4];
  }
}

@end