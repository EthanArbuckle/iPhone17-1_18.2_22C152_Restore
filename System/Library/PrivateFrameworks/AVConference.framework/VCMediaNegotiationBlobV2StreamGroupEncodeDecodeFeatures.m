@interface VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures
- (BOOL)hasEncodeDecodeFeatures;
- (BOOL)hasRtpPayload;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encodeDecodeFeatures;
- (VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures)initWithPayload:(id)a3 encodeDecodeFeatures:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)rtpPayload;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEncodeDecodeFeatures:(id)a3;
- (void)setHasRtpPayload:(BOOL)a3;
- (void)setRtpPayload:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures

- (VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures)initWithPayload:(id)a3 encodeDecodeFeatures:(id)a4
{
  v6 = [(VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures *)self init];
  v7 = v6;
  if (!v6)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures(Utils) initWithPayload:encodeDecodeFeatures:]();
      }
    }
    goto LABEL_15;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures(Utils) initWithPayload:encodeDecodeFeatures:]();
      }
    }
    goto LABEL_15;
  }
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures(Utils) initWithPayload:encodeDecodeFeatures:]();
      }
    }
LABEL_15:

    return 0;
  }
  [(VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures *)v6 setEncodeDecodeFeatures:a4];
  -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures setRtpPayload:](v7, "setRtpPayload:", [a3 intValue]);
  return v7;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures *)self setEncodeDecodeFeatures:0];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures;
  [(VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures *)&v3 dealloc];
}

- (void)setRtpPayload:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_rtpPayload = a3;
}

- (void)setHasRtpPayload:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRtpPayload
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasEncodeDecodeFeatures
{
  return self->_encodeDecodeFeatures != 0;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures description](&v3, sel_description), -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rtpPayload), @"rtpPayload");
  }
  encodeDecodeFeatures = self->_encodeDecodeFeatures;
  if (encodeDecodeFeatures) {
    [v3 setObject:encodeDecodeFeatures forKey:@"encodeDecodeFeatures"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeaturesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_encodeDecodeFeatures)
  {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 4) = self->_rtpPayload;
    *((unsigned char *)a3 + 20) |= 1u;
  }
  encodeDecodeFeatures = self->_encodeDecodeFeatures;
  if (encodeDecodeFeatures) {
    [a3 setEncodeDecodeFeatures:encodeDecodeFeatures];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_rtpPayload;
    *(unsigned char *)(v5 + 20) |= 1u;
  }

  v6[1] = [(NSData *)self->_encodeDecodeFeatures copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 20) & 1) == 0 || self->_rtpPayload != *((_DWORD *)a3 + 4)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)a3 + 20))
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    encodeDecodeFeatures = self->_encodeDecodeFeatures;
    if ((unint64_t)encodeDecodeFeatures | *((void *)a3 + 1))
    {
      LOBYTE(v5) = -[NSData isEqual:](encodeDecodeFeatures, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_rtpPayload;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSData *)self->_encodeDecodeFeatures hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 20))
  {
    self->_rtpPayload = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 1)) {
    -[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures setEncodeDecodeFeatures:](self, "setEncodeDecodeFeatures:");
  }
}

- (unsigned)rtpPayload
{
  return self->_rtpPayload;
}

- (NSData)encodeDecodeFeatures
{
  return self->_encodeDecodeFeatures;
}

- (void)setEncodeDecodeFeatures:(id)a3
{
}

@end