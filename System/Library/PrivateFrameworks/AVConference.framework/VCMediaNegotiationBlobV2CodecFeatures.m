@interface VCMediaNegotiationBlobV2CodecFeatures
- (BOOL)allowAudioRecording;
- (BOOL)hasAudioFeatures;
- (BOOL)hasVideoFeatures;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)videoFeatures;
- (VCMediaNegotiationBlobV2CodecFeatures)initWithAllowAudioRecording:(BOOL)a3 videoFeatures:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)audioFeatures;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)printWithLogFile:(void *)a3 prefix:(id)a4;
- (void)setAudioFeatures:(unsigned int)a3;
- (void)setHasAudioFeatures:(BOOL)a3;
- (void)setVideoFeatures:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobV2CodecFeatures

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaNegotiationBlobV2CodecFeatures *)self setVideoFeatures:0];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2CodecFeatures;
  [(VCMediaNegotiationBlobV2CodecFeatures *)&v3 dealloc];
}

- (unsigned)audioFeatures
{
  if (*(unsigned char *)&self->_has) {
    return self->_audioFeatures;
  }
  else {
    return 0;
  }
}

- (void)setAudioFeatures:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_audioFeatures = a3;
}

- (void)setHasAudioFeatures:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioFeatures
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasVideoFeatures
{
  return self->_videoFeatures != 0;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2CodecFeatures;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobV2CodecFeatures description](&v3, sel_description), -[VCMediaNegotiationBlobV2CodecFeatures dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_audioFeatures), @"audioFeatures");
  }
  videoFeatures = self->_videoFeatures;
  if (videoFeatures) {
    [v3 setObject:videoFeatures forKey:@"videoFeatures"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2CodecFeaturesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_videoFeatures)
  {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_audioFeatures;
    *((unsigned char *)a3 + 24) |= 1u;
  }
  videoFeatures = self->_videoFeatures;
  if (videoFeatures) {
    [a3 setVideoFeatures:videoFeatures];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_audioFeatures;
    *(unsigned char *)(v5 + 24) |= 1u;
  }

  v6[2] = [(NSData *)self->_videoFeatures copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 24) & 1) == 0 || self->_audioFeatures != *((_DWORD *)a3 + 2)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)a3 + 24))
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    videoFeatures = self->_videoFeatures;
    if ((unint64_t)videoFeatures | *((void *)a3 + 2))
    {
      LOBYTE(v5) = -[NSData isEqual:](videoFeatures, "isEqual:");
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
    uint64_t v2 = 2654435761 * self->_audioFeatures;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSData *)self->_videoFeatures hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 24))
  {
    self->_audioFeatures = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 2)) {
    -[VCMediaNegotiationBlobV2CodecFeatures setVideoFeatures:](self, "setVideoFeatures:");
  }
}

- (NSData)videoFeatures
{
  return self->_videoFeatures;
}

- (void)setVideoFeatures:(id)a3
{
}

- (VCMediaNegotiationBlobV2CodecFeatures)initWithAllowAudioRecording:(BOOL)a3 videoFeatures:(id)a4
{
  BOOL v5 = a3;
  v6 = [(VCMediaNegotiationBlobV2CodecFeatures *)self init];
  v7 = v6;
  if (v6)
  {
    if ([(VCMediaNegotiationBlobV2CodecFeatures *)v6 audioFeatures] != v5) {
      [(VCMediaNegotiationBlobV2CodecFeatures *)v7 setAudioFeatures:v5];
    }
    if (![(VCMediaNegotiationBlobV2CodecFeatures *)v7 videoFeatures]
      || (objc_msgSend(a4, "isEqualToData:", -[VCMediaNegotiationBlobV2CodecFeatures videoFeatures](v7, "videoFeatures")) & 1) == 0)
    {
      [(VCMediaNegotiationBlobV2CodecFeatures *)v7 setVideoFeatures:a4];
    }
  }
  return v7;
}

- (BOOL)allowAudioRecording
{
  return [(VCMediaNegotiationBlobV2CodecFeatures *)self audioFeatures] & 1;
}

- (void)printWithLogFile:(void *)a3 prefix:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v6 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"[%lu] %@", objc_msgSend((id)-[VCMediaNegotiationBlobV2CodecFeatures data](self, "data"), "length"), a4];
  [v6 appendFormat:@"Codec Featues: allowAudioRecording=%d videoFeatures=%@", -[VCMediaNegotiationBlobV2CodecFeatures allowAudioRecording](self, "allowAudioRecording"), -[VCMediaNegotiationBlobV2CodecFeatures videoFeatures](self, "videoFeatures")];
  char v7 = [v6 UTF8String];
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v8, v9, v10, v11, v12, v13, v7);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = v14;
      __int16 v18 = 2080;
      v19 = "-[VCMediaNegotiationBlobV2CodecFeatures(Utils) printWithLogFile:prefix:]";
      __int16 v20 = 1024;
      int v21 = 36;
      __int16 v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

@end