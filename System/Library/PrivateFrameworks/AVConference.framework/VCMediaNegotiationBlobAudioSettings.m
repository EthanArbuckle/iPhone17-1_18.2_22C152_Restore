@interface VCMediaNegotiationBlobAudioSettings
+ (BOOL)isAudioPayloadSupported:(int)a3;
+ (int)negotiationPayloadFromPayload:(int)a3;
+ (int)payloadFromNegotiationPayload:(int)a3;
- (BOOL)allowAudioRecording;
- (BOOL)allowAudioSwitching;
- (BOOL)hasAudioUnitModel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)useSBR;
- (VCMediaNegotiationBlobAudioSettings)initWithAudioConfiguration:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)newMediaNegotiatorAudioConfiguration;
- (unint64_t)hash;
- (unsigned)audioUnitModel;
- (unsigned)payloadFlags;
- (unsigned)rtpSSRC;
- (unsigned)secondaryFlags;
- (unsigned)supportFlags;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)printWithLogFile:(void *)a3;
- (void)setAudioUnitModel:(unsigned int)a3;
- (void)setHasAudioUnitModel:(BOOL)a3;
- (void)setPayloadFlags:(unsigned int)a3;
- (void)setRtpSSRC:(unsigned int)a3;
- (void)setSecondaryFlags:(unsigned int)a3;
- (void)setSupportFlags:(unsigned int)a3;
- (void)setUseSBR:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobAudioSettings

- (void)setAudioUnitModel:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_audioUnitModel = a3;
}

- (void)setHasAudioUnitModel:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAudioUnitModel
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobAudioSettings;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobAudioSettings description](&v3, sel_description), -[VCMediaNegotiationBlobAudioSettings dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rtpSSRC), @"rtpSSRC");
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_audioUnitModel), @"audioUnitModel");
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_supportFlags), @"supportFlags");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_payloadFlags), @"payloadFlags");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_secondaryFlags), @"secondaryFlags");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_useSBR), @"useSBR");
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobAudioSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_rtpSSRC;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 2) = self->_audioUnitModel;
    *((unsigned char *)a3 + 32) |= 1u;
  }
  *((_DWORD *)a3 + 6) = self->_supportFlags;
  *((_DWORD *)a3 + 3) = self->_payloadFlags;
  *((_DWORD *)a3 + 5) = self->_secondaryFlags;
  *((unsigned char *)a3 + 28) = self->_useSBR;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 4) = self->_rtpSSRC;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 2) = self->_audioUnitModel;
    *((unsigned char *)result + 32) |= 1u;
  }
  *((_DWORD *)result + 6) = self->_supportFlags;
  *((_DWORD *)result + 3) = self->_payloadFlags;
  *((_DWORD *)result + 5) = self->_secondaryFlags;
  *((unsigned char *)result + 28) = self->_useSBR;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_rtpSSRC != *((_DWORD *)a3 + 4))
    {
LABEL_13:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 32) & 1) == 0 || self->_audioUnitModel != *((_DWORD *)a3 + 2)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)a3 + 32))
    {
      goto LABEL_13;
    }
    if (self->_supportFlags != *((_DWORD *)a3 + 6)
      || self->_payloadFlags != *((_DWORD *)a3 + 3)
      || self->_secondaryFlags != *((_DWORD *)a3 + 5))
    {
      goto LABEL_13;
    }
    int v6 = *((unsigned __int8 *)a3 + 28);
    if (self->_useSBR) {
      LOBYTE(v5) = v6 != 0;
    }
    else {
      LOBYTE(v5) = v6 == 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_audioUnitModel;
  }
  else {
    uint64_t v2 = 0;
  }
  return v2 ^ (2654435761 * self->_rtpSSRC) ^ (2654435761 * self->_supportFlags) ^ (2654435761
                                                                                      * self->_payloadFlags) ^ (2654435761 * self->_secondaryFlags) ^ (2654435761 * self->_useSBR);
}

- (void)mergeFrom:(id)a3
{
  self->_rtpSSRC = *((_DWORD *)a3 + 4);
  if (*((unsigned char *)a3 + 32))
  {
    self->_audioUnitModel = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  self->_supportFlags = *((_DWORD *)a3 + 6);
  self->_payloadFlags = *((_DWORD *)a3 + 3);
  self->_secondaryFlags = *((_DWORD *)a3 + 5);
  self->_useSBR = *((unsigned char *)a3 + 28);
}

- (unsigned)rtpSSRC
{
  return self->_rtpSSRC;
}

- (void)setRtpSSRC:(unsigned int)a3
{
  self->_rtpSSRC = a3;
}

- (unsigned)audioUnitModel
{
  return self->_audioUnitModel;
}

- (unsigned)supportFlags
{
  return self->_supportFlags;
}

- (void)setSupportFlags:(unsigned int)a3
{
  self->_supportFlags = a3;
}

- (unsigned)payloadFlags
{
  return self->_payloadFlags;
}

- (void)setPayloadFlags:(unsigned int)a3
{
  self->_payloadFlags = a3;
}

- (unsigned)secondaryFlags
{
  return self->_secondaryFlags;
}

- (void)setSecondaryFlags:(unsigned int)a3
{
  self->_secondaryFlags = a3;
}

- (BOOL)useSBR
{
  return self->_useSBR;
}

- (void)setUseSBR:(BOOL)a3
{
  self->_useSBR = a3;
}

- (VCMediaNegotiationBlobAudioSettings)initWithAudioConfiguration:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(VCMediaNegotiationBlobAudioSettings *)self init];
  if (v4)
  {
    v4->_supportFlags |= [a3 allowAudioSwitching];
    int v5 = [a3 allowAudioRecording] ? 2 : 0;
    v4->_supportFlags |= v5;
    v4->_rtpSSRC = [a3 ssrc];
    v4->_audioUnitModel = [a3 audioUnitNumber];
    *(unsigned char *)&v4->_has |= 1u;
    v4->_useSBR = [a3 useSBR];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v6 = (void *)[a3 audioPayloads];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [*(id *)(*((void *)&v16 + 1) + 8 * i) intValue];
          int v12 = +[VCMediaNegotiationBlobAudioSettings negotiationPayloadFromPayload:v11];
          if (v12 != -1)
          {
            int v13 = v12;
            v4->_payloadFlags |= v12;
            if ([a3 isSecondaryPayload:v11]) {
              v4->_secondaryFlags |= v13;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v15 count:16];
      }
      while (v8);
    }
  }
  return v4;
}

- (BOOL)allowAudioRecording
{
  return (LOBYTE(self->_supportFlags) >> 1) & 1;
}

- (BOOL)allowAudioSwitching
{
  return self->_supportFlags & 1;
}

+ (int)negotiationPayloadFromPayload:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", &unk_1F3DC5D30, &unk_1F3DC5D48, &unk_1F3DC5D60, &unk_1F3DC5D78, &unk_1F3DC5D90, &unk_1F3DC5DA8, &unk_1F3DC5DC0, &unk_1F3DC5DD8, &unk_1F3DC5DF0, &unk_1F3DC5E08, &unk_1F3DC5E20, &unk_1F3DC5E38, &unk_1F3DC5E50, &unk_1F3DC5E68, &unk_1F3DC5E80, &unk_1F3DC5E98, &unk_1F3DC5EB0,
                 &unk_1F3DC5EC8,
                 &unk_1F3DC5EE0,
                 &unk_1F3DC5EF8,
                 &unk_1F3DC5F10,
                 &unk_1F3DC5F28,
                 &unk_1F3DC5F40,
                 &unk_1F3DC5F58,
                 &unk_1F3DC5F70,
                 &unk_1F3DC5F88,
                 0);
  int v5 = objc_msgSend(v4, "objectForKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v3));
  if (v5) {
    int v6 = [v5 unsignedIntValue];
  }
  else {
    int v6 = -1;
  }

  return v6;
}

+ (int)payloadFromNegotiationPayload:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", &unk_1F3DC5D48, &unk_1F3DC5D30, &unk_1F3DC5D78, &unk_1F3DC5D60, &unk_1F3DC5DA8, &unk_1F3DC5D90, &unk_1F3DC5DD8, &unk_1F3DC5DC0, &unk_1F3DC5E08, &unk_1F3DC5DF0, &unk_1F3DC5E38, &unk_1F3DC5E20, &unk_1F3DC5E68, &unk_1F3DC5E50, &unk_1F3DC5E98, &unk_1F3DC5E80, &unk_1F3DC5EC8,
                 &unk_1F3DC5EB0,
                 &unk_1F3DC5EF8,
                 &unk_1F3DC5EE0,
                 &unk_1F3DC5F28,
                 &unk_1F3DC5F10,
                 &unk_1F3DC5F58,
                 &unk_1F3DC5F40,
                 &unk_1F3DC5F88,
                 &unk_1F3DC5F70,
                 0);
  int v5 = objc_msgSend(v4, "objectForKey:", objc_msgSend(NSNumber, "numberWithInt:", v3));
  if (v5) {
    int v6 = [v5 unsignedIntValue];
  }
  else {
    int v6 = 128;
  }

  return v6;
}

+ (BOOL)isAudioPayloadSupported:(int)a3
{
  return +[VCMediaNegotiationBlobAudioSettings negotiationPayloadFromPayload:*(void *)&a3] != -1;
}

- (id)newMediaNegotiatorAudioConfiguration
{
  uint64_t v3 = [[VCMediaNegotiatorAudioConfiguration alloc] initWithAllowAudioSwitching:[(VCMediaNegotiationBlobAudioSettings *)self allowAudioSwitching] allowAudioRecording:[(VCMediaNegotiationBlobAudioSettings *)self allowAudioRecording] useSBR:self->_useSBR ssrc:self->_rtpSSRC audioUnitNumber:self->_audioUnitModel];
  unsigned int payloadFlags = self->_payloadFlags;
  if (payloadFlags)
  {
    uint64_t v5 = 1;
    do
    {
      if ((v5 & payloadFlags) != 0)
      {
        payloadFlags &= ~v5;
        [(VCMediaNegotiatorAudioConfiguration *)v3 addAudioPayload:+[VCMediaNegotiationBlobAudioSettings payloadFromNegotiationPayload:v5] isSecondary:(self->_secondaryFlags & v5) != 0];
      }
      uint64_t v5 = (2 * v5);
    }
    while (payloadFlags);
  }
  return v3;
}

- (void)printWithLogFile:(void *)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithFormat:", @"Audio Settings: SSRC=%x sbr=%d audioSwitching=%d audioRecording=%d", self->_rtpSSRC, self->_useSBR, self->_supportFlags & 1, (self->_supportFlags >> 1) & 1);
  if ([(VCMediaNegotiationBlobAudioSettings *)self hasAudioUnitModel]) {
    objc_msgSend(v5, "appendFormat:", @" model=%u", self->_audioUnitModel);
  }
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  uint64_t v7 = (NSObject **)MEMORY[0x1E4F47A50];
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v45 = v8;
      __int16 v46 = 2080;
      v47 = "-[VCMediaNegotiationBlobAudioSettings(AudioRules) printWithLogFile:]";
      __int16 v48 = 1024;
      int v49 = 980;
      __int16 v50 = 2080;
      uint64_t v51 = [v5 UTF8String];
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob - %s", buf, 0x26u);
    }
  }
  char v10 = [v5 UTF8String];
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob - %s\n", v11, v12, v13, v14, v15, v16, v10);
  long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"Primary payloads:"];
  long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"Secondary payloads:"];
  uint64_t v19 = 1;
  do
  {
    if ((self->_payloadFlags & v19) != 0 && (self->_secondaryFlags & v19) == 0)
    {
      if ((int)v19 > 127)
      {
        if ((int)v19 <= 1023)
        {
          switch(v19)
          {
            case 0x80:
              uint64_t v20 = @"AMR_8000";
              goto LABEL_38;
            case 0x100:
              uint64_t v20 = @"AMR_16000";
              goto LABEL_38;
            case 0x200:
              uint64_t v20 = @"CN";
              goto LABEL_38;
          }
        }
        else if ((int)v19 > 4095)
        {
          if (v19 == 4096)
          {
            uint64_t v20 = @"AACELD_48000";
            goto LABEL_38;
          }
          if (v19 == 0x7FFF)
          {
            uint64_t v20 = @"SUPPORTED";
            goto LABEL_38;
          }
        }
        else
        {
          if (v19 == 1024)
          {
            uint64_t v20 = @"RED";
            goto LABEL_38;
          }
          if (v19 == 2048)
          {
            uint64_t v20 = @"EVS_32000";
LABEL_38:
            [v17 appendFormat:@" %@,", v20];
            goto LABEL_39;
          }
        }
      }
      else
      {
        if ((int)v19 <= 15)
        {
          uint64_t v20 = @"G722";
          switch((int)v19)
          {
            case 1:
              goto LABEL_38;
            case 2:
              uint64_t v20 = @"AACELD_16000";
              break;
            case 4:
              uint64_t v20 = @"AACELD_22050";
              break;
            case 8:
              uint64_t v20 = @"AACELD_24000";
              break;
            default:
              goto LABEL_37;
          }
          goto LABEL_38;
        }
        switch(v19)
        {
          case 0x10:
            uint64_t v20 = @"SPEEX_8K";
            goto LABEL_38;
          case 0x20:
            uint64_t v20 = @"SPEEX_16K";
            goto LABEL_38;
          case 0x40:
            uint64_t v20 = @"OPUS";
            goto LABEL_38;
        }
      }
LABEL_37:
      uint64_t v20 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v19);
      goto LABEL_38;
    }
LABEL_39:
    if ((self->_secondaryFlags & v19) == 0) {
      goto LABEL_71;
    }
    if ((int)v19 <= 63)
    {
      v21 = @"G722";
      switch((int)v19)
      {
        case -1:
          v21 = @"INVALID";
          goto LABEL_70;
        case 0:
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_61;
        case 1:
          goto LABEL_70;
        case 2:
          v21 = @"AACELD_16000";
          goto LABEL_70;
        case 4:
          v21 = @"AACELD_22050";
          goto LABEL_70;
        case 8:
          v21 = @"AACELD_24000";
          goto LABEL_70;
        default:
          if (v19 == 16)
          {
            v21 = @"SPEEX_8K";
          }
          else
          {
            if (v19 != 32) {
              goto LABEL_61;
            }
            v21 = @"SPEEX_16K";
          }
          break;
      }
      goto LABEL_70;
    }
    if ((int)v19 > 1023)
    {
      if ((int)v19 > 4095)
      {
        if (v19 == 4096)
        {
          v21 = @"AACELD_48000";
          goto LABEL_70;
        }
        if (v19 != 0x7FFF) {
          goto LABEL_61;
        }
        v21 = @"SUPPORTED";
      }
      else
      {
        if (v19 == 1024)
        {
          v21 = @"RED";
          goto LABEL_70;
        }
        if (v19 != 2048) {
          goto LABEL_61;
        }
        v21 = @"EVS_32000";
      }
    }
    else if ((int)v19 > 255)
    {
      if (v19 == 256)
      {
        v21 = @"AMR_16000";
        goto LABEL_70;
      }
      if (v19 != 512) {
        goto LABEL_61;
      }
      v21 = @"CN";
    }
    else
    {
      if (v19 == 64)
      {
        v21 = @"OPUS";
        goto LABEL_70;
      }
      if (v19 != 128)
      {
LABEL_61:
        v21 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v19);
        goto LABEL_70;
      }
      v21 = @"AMR_8000";
    }
LABEL_70:
    [v18 appendFormat:@" %@,", v21];
LABEL_71:
    BOOL v22 = (v19 & 0x3FFF) == 0;
    uint64_t v19 = (2 * v19);
  }
  while (!v22);
  uint64_t v23 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@","];
  uint64_t v24 = objc_msgSend((id)objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v23), "UTF8String");
  uint64_t v25 = objc_msgSend((id)objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v23), "UTF8String");
  int v26 = VRTraceGetErrorLogLevelForModule();
  v27 = (os_log_t *)MEMORY[0x1E4F47A50];
  if (v26 > 6)
  {
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    v29 = *v27;
    if (os_log_type_enabled(*v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v45 = v28;
      __int16 v46 = 2080;
      v47 = "-[VCMediaNegotiationBlobAudioSettings(AudioRules) printWithLogFile:]";
      __int16 v48 = 1024;
      int v49 = 996;
      __int16 v50 = 2080;
      uint64_t v51 = v24;
      _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s", buf, 0x26u);
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v36 = VRTraceErrorLogLevelToCSTR();
    v37 = *v27;
    if (os_log_type_enabled(*v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v45 = v36;
      __int16 v46 = 2080;
      v47 = "-[VCMediaNegotiationBlobAudioSettings(AudioRules) printWithLogFile:]";
      __int16 v48 = 1024;
      int v49 = 997;
      __int16 v50 = 2080;
      uint64_t v51 = v25;
      _os_log_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Media Blob -     %s", buf, 0x26u);
    }
  }
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v30, v31, v32, v33, v34, v35, v24);
  VRLogfilePrintWithTimestamp((uint64_t)a3, "Media Blob -     %s\n", v38, v39, v40, v41, v42, v43, v25);
}

@end