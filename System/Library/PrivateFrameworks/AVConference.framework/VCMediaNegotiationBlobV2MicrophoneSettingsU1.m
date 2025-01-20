@interface VCMediaNegotiationBlobV2MicrophoneSettingsU1
+ (int)flagFromPayload:(int)a3;
+ (int)payloadFromFlag:(int)a3;
- (BOOL)hasCipherSuites;
- (BOOL)hasPayloads;
- (BOOL)hasRtpSSRC;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSSet)audioPayloads;
- (VCMediaNegotiationBlobV2MicrophoneSettingsU1)initWithSSRC:(unsigned int)a3 audioPayloads:(id)a4 u1AuthTagEnabled:(BOOL)a5;
- (id)cipherSuitesAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCipherSuites:(id)a3;
- (int)cipherSuites;
- (unint64_t)hash;
- (unsigned)payloadBitmapWithAudioPayloads:(id)a3;
- (unsigned)payloads;
- (unsigned)rtpSSRC;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)printWithLogFile:(void *)a3 prefix:(id)a4;
- (void)setCipherSuites:(int)a3;
- (void)setHasCipherSuites:(BOOL)a3;
- (void)setHasPayloads:(BOOL)a3;
- (void)setHasRtpSSRC:(BOOL)a3;
- (void)setPayloads:(unsigned int)a3;
- (void)setRtpSSRC:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobV2MicrophoneSettingsU1

- (void)setRtpSSRC:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_rtpSSRC = a3;
}

- (void)setHasRtpSSRC:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasRtpSSRC
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (unsigned)payloads
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_payloads;
  }
  else {
    return 15;
  }
}

- (void)setPayloads:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_payloads = a3;
}

- (void)setHasPayloads:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPayloads
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)cipherSuites
{
  if (*(unsigned char *)&self->_has) {
    return self->_cipherSuites;
  }
  else {
    return 1;
  }
}

- (void)setCipherSuites:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cipherSuites = a3;
}

- (void)setHasCipherSuites:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCipherSuites
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)cipherSuitesAsString:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) < 7 && ((0x4Bu >> v3)) {
    return off_1E6DB91E0[v3];
  }
  else {
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
}

- (int)StringAsCipherSuites:(id)a3
{
  if ([a3 isEqualToString:@"CipherAES128AuthNoneRCCM3"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"CipherAES128AuthSHA280RCCM2Deferred"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"CipherAES128AuthSHA232RCCM2Deferred"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"SupportedMask"]) {
    return 7;
  }
  return 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2MicrophoneSettingsU1;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 description](&v3, sel_description), -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_payloads), @"payloads");
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_7;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rtpSSRC), @"rtpSSRC");
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 1) == 0) {
    return v3;
  }
LABEL_7:
  unsigned int v5 = self->_cipherSuites - 1;
  if (v5 < 7 && ((0x4Bu >> v5) & 1) != 0) {
    v6 = off_1E6DB91E0[v5];
  }
  else {
    v6 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_cipherSuites);
  }
  [v3 setObject:v6 forKey:@"cipherSuites"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2MicrophoneSettingsU1ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((has & 1) == 0) {
    return;
  }
LABEL_7:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_rtpSSRC;
    *((unsigned char *)a3 + 20) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return;
      }
LABEL_7:
      *((_DWORD *)a3 + 2) = self->_cipherSuites;
      *((unsigned char *)a3 + 20) |= 1u;
      return;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 3) = self->_payloads;
  *((unsigned char *)a3 + 20) |= 2u;
  if (*(unsigned char *)&self->_has) {
    goto LABEL_7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)result + 4) = self->_rtpSSRC;
    *((unsigned char *)result + 20) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_payloads;
  *((unsigned char *)result + 20) |= 2u;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 2) = self->_cipherSuites;
  *((unsigned char *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 20) & 4) == 0 || self->_rtpSSRC != *((_DWORD *)a3 + 4)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 20) & 4) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 20) & 2) == 0 || self->_payloads != *((_DWORD *)a3 + 3)) {
        goto LABEL_16;
      }
    }
    else if ((*((unsigned char *)a3 + 20) & 2) != 0)
    {
      goto LABEL_16;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 20) & 1) == 0 || self->_cipherSuites != *((_DWORD *)a3 + 2)) {
        goto LABEL_16;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_rtpSSRC;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_payloads;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_cipherSuites;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 20);
  if ((v3 & 4) != 0)
  {
    self->_rtpSSRC = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 4u;
    char v3 = *((unsigned char *)a3 + 20);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 1) == 0) {
        return;
      }
LABEL_7:
      self->_cipherSuites = *((_DWORD *)a3 + 2);
      *(unsigned char *)&self->_has |= 1u;
      return;
    }
  }
  else if ((*((unsigned char *)a3 + 20) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_payloads = *((_DWORD *)a3 + 3);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)a3 + 20)) {
    goto LABEL_7;
  }
}

- (unsigned)rtpSSRC
{
  return self->_rtpSSRC;
}

- (VCMediaNegotiationBlobV2MicrophoneSettingsU1)initWithSSRC:(unsigned int)a3 audioPayloads:(id)a4 u1AuthTagEnabled:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v8 = [(VCMediaNegotiationBlobV2MicrophoneSettingsU1 *)self init];
  if (!v8) {
    return v8;
  }
  if (![a4 count])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2MicrophoneSettingsU1(Utils) initWithSSRC:audioPayloads:u1AuthTagEnabled:](v15, v16);
      }
    }
    goto LABEL_22;
  }
  if ([(VCMediaNegotiationBlobV2MicrophoneSettingsU1 *)v8 rtpSSRC] != v7) {
    [(VCMediaNegotiationBlobV2MicrophoneSettingsU1 *)v8 setRtpSSRC:v7];
  }
  uint64_t v9 = [(VCMediaNegotiationBlobV2MicrophoneSettingsU1 *)v8 payloadBitmapWithAudioPayloads:a4];
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2MicrophoneSettingsU1(Utils) initWithSSRC:audioPayloads:u1AuthTagEnabled:](v17, (uint64_t)a4, v18);
      }
    }
LABEL_22:

    return 0;
  }
  uint64_t v10 = v9;
  if (v9 != [(VCMediaNegotiationBlobV2MicrophoneSettingsU1 *)v8 payloads]) {
    [(VCMediaNegotiationBlobV2MicrophoneSettingsU1 *)v8 setPayloads:v10];
  }
  uint64_t v11 = +[VCMediaNegotiationBlobV2SettingsU1 negotiationCipherSuitesFromMediaStreamCipherSuites:](VCMediaNegotiationBlobV2SettingsU1, "negotiationCipherSuitesFromMediaStreamCipherSuites:", +[VCEncryptionRules supportedCipherSuitesForStreamGroupID:1835623282 isOneToOne:1]);
  if (v5 && VCFeatureFlagManager_U1AuthTagEnabled())
  {
    if (v11 != [(VCMediaNegotiationBlobV2MicrophoneSettingsU1 *)v8 cipherSuites]) {
      [(VCMediaNegotiationBlobV2MicrophoneSettingsU1 *)v8 setCipherSuites:v11];
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v12 = VRTraceErrorLogLevelToCSTR();
    v13 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 136316162;
      uint64_t v20 = v12;
      __int16 v21 = 2080;
      v22 = "-[VCMediaNegotiationBlobV2MicrophoneSettingsU1(Utils) initWithSSRC:audioPayloads:u1AuthTagEnabled:]";
      __int16 v23 = 1024;
      int v24 = 41;
      __int16 v25 = 2112;
      id v26 = +[VCMediaNegotiationBlobV2SettingsU1 appendCipherSuiteFlags:toDescription:](VCMediaNegotiationBlobV2SettingsU1, "appendCipherSuiteFlags:toDescription:", v11, [MEMORY[0x1E4F28E78] string]);
      __int16 v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Pruning cipherSuites=%@ for blob=%@ because U1AuthTag is NOT enabled", (uint8_t *)&v19, 0x30u);
    }
  }
  return v8;
}

- (NSSet)audioPayloads
{
  char v3 = (NSSet *)[MEMORY[0x1E4F1CA80] set];
  unsigned int v4 = [(VCMediaNegotiationBlobV2MicrophoneSettingsU1 *)self payloads];
  if (v4)
  {
    unsigned int v5 = v4;
    uint64_t v6 = 1;
    do
    {
      if ((v6 & v5) != 0) {
        -[NSSet addObject:](v3, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", +[VCMediaNegotiationBlobV2MicrophoneSettingsU1 payloadFromFlag:](VCMediaNegotiationBlobV2MicrophoneSettingsU1, "payloadFromFlag:", v6)));
      }
      v5 &= ~v6;
      if (!v5) {
        break;
      }
      int v7 = v6 & 0x7F;
      uint64_t v6 = (2 * v6);
    }
    while (v7);
  }
  return v3;
}

- (void)printWithLogFile:(void *)a3 prefix:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"[%lu] %@", objc_msgSend((id)-[VCMediaNegotiationBlobV2MicrophoneSettingsU1 data](self, "data"), "length"), a4];
  [v5 appendFormat:@"Mic settings (U+1): "];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    objc_msgSend(v5, "appendFormat:", @"ssrc=%08x ", -[VCMediaNegotiationBlobV2MicrophoneSettingsU1 rtpSSRC](self, "rtpSSRC"));
  }
  uint64_t v6 = [(VCMediaNegotiationBlobV2MicrophoneSettingsU1 *)self payloads];
  int v7 = v6;
  objc_msgSend(v5, "appendFormat:", @"payloads=0x%x [", v6);
  if (v7)
  {
    v8 = @"%@";
    uint64_t v9 = 1;
    do
    {
      if ((v9 & v7) != 0)
      {
        uint64_t v10 = @"AACELD_24000";
        switch((int)v9)
        {
          case 1:
            break;
          case 2:
            uint64_t v10 = @"EVS_32000";
            break;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_11;
          case 4:
            uint64_t v10 = @"CN";
            break;
          case 8:
            uint64_t v10 = @"RED";
            break;
          default:
            if (v9 == 64)
            {
              uint64_t v10 = @"AACELD_48000";
            }
            else if (v9 == 255)
            {
              uint64_t v10 = @"SupportedMask";
            }
            else
            {
LABEL_11:
              uint64_t v10 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v9);
            }
            break;
        }
        objc_msgSend(v5, "appendFormat:", v8, v10);
        v8 = @",%@";
      }
      v7 &= ~v9;
      if (!v7) {
        break;
      }
      int v11 = v9 & 0x7F;
      uint64_t v9 = (2 * v9);
    }
    while (v11);
  }
  [v5 appendString:@"] "];
  +[VCMediaNegotiationBlobV2SettingsU1 appendCipherSuiteFlags:[(VCMediaNegotiationBlobV2MicrophoneSettingsU1 *)self cipherSuites] toDescription:v5];
  char v12 = [v5 UTF8String];
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v13, v14, v15, v16, v17, v18, v12);
  if ((int)VRTraceGetErrorLogLevelForModule() > 5)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    uint64_t v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v23 = v19;
      __int16 v24 = 2080;
      __int16 v25 = "-[VCMediaNegotiationBlobV2MicrophoneSettingsU1(Utils) printWithLogFile:prefix:]";
      __int16 v26 = 1024;
      int v27 = 86;
      __int16 v28 = 2112;
      uint64_t v29 = v5;
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

+ (int)flagFromPayload:(int)a3
{
  if (a3 <= 100)
  {
    if (a3 == 13) {
      return 4;
    }
    if (a3 == 20) {
      return 8;
    }
  }
  else
  {
    switch(a3)
    {
      case 'e':
        return 64;
      case 'h':
        return 1;
      case 'l':
        return 2;
    }
  }
  return 0;
}

+ (int)payloadFromFlag:(int)a3
{
  int result = 104;
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      int result = 108;
      break;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_5;
    case 4:
      int result = 13;
      break;
    case 8:
      int result = 20;
      break;
    default:
      if (a3 == 64) {
        int result = 101;
      }
      else {
LABEL_5:
      }
        int result = 128;
      break;
  }
  return result;
}

- (unsigned)payloadBitmapWithAudioPayloads:(id)a3
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
      v6 |= +[VCMediaNegotiationBlobV2MicrophoneSettingsU1 flagFromPayload:](VCMediaNegotiationBlobV2MicrophoneSettingsU1, "flagFromPayload:", [*(id *)(*((void *)&v11 + 1) + 8 * i) unsignedIntValue]);
    }
    uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  }
  while (v5);
  return v6;
}

@end