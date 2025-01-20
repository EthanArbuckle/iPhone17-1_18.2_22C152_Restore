@interface VCMediaNegotiationBlobV2MomentsSettings
+ (id)imageTypesWithSupportedCodecs:(unsigned int)a3;
+ (id)videoCodecsWithSupportedCodecs:(unsigned int)a3;
+ (unsigned)blobCapabilitiesWithOneToOneCapabilities:(unsigned __int8)a3 multiwayCapabilities:(unsigned __int8)a4;
+ (unsigned)capabilitiesWithBlobCapabilities:(unsigned int)a3;
+ (unsigned)multiwayCapabilitiesWithBlobCapabilities:(unsigned int)a3;
+ (unsigned)supportedCodecsWithVideoCodecs:(id)a3 imageTypes:(id)a4;
- (BOOL)hasCapabilities;
- (BOOL)hasSupportedCodecs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSSet)imageTypes;
- (NSSet)videoCodecs;
- (VCMediaNegotiationBlobV2MomentsSettings)initWithVideoCodecs:(id)a3 imageTypes:(id)a4 capabilitiesOneToOne:(unsigned __int8)a5 capabilitiesMultiway:(unsigned __int8)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)capabilities;
- (unsigned)capabilitiesMultiway;
- (unsigned)capabilitiesOneToOne;
- (unsigned)supportedCodecs;
- (void)appendFieldName:(id)a3 codecs:(unsigned int)a4 outString:(id)a5;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)printWithLogFile:(void *)a3 prefix:(id)a4;
- (void)setCapabilities:(unsigned int)a3;
- (void)setHasCapabilities:(BOOL)a3;
- (void)setHasSupportedCodecs:(BOOL)a3;
- (void)setSupportedCodecs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobV2MomentsSettings

- (unsigned)capabilities
{
  if (*(unsigned char *)&self->_has) {
    return self->_capabilities;
  }
  else {
    return 4;
  }
}

- (void)setCapabilities:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_capabilities = a3;
}

- (void)setHasCapabilities:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCapabilities
{
  return *(unsigned char *)&self->_has & 1;
}

- (unsigned)supportedCodecs
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_supportedCodecs;
  }
  else {
    return 10;
  }
}

- (void)setSupportedCodecs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_supportedCodecs = a3;
}

- (void)setHasSupportedCodecs:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSupportedCodecs
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2MomentsSettings;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobV2MomentsSettings description](&v3, sel_description), -[VCMediaNegotiationBlobV2MomentsSettings dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_capabilities), @"capabilities");
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_supportedCodecs), @"supportedCodecs");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2MomentsSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return;
    }
LABEL_5:
    *((_DWORD *)a3 + 3) = self->_supportedCodecs;
    *((unsigned char *)a3 + 16) |= 2u;
    return;
  }
  *((_DWORD *)a3 + 2) = self->_capabilities;
  *((unsigned char *)a3 + 16) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    goto LABEL_5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_capabilities;
    *((unsigned char *)result + 16) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_supportedCodecs;
    *((unsigned char *)result + 16) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 16) & 1) == 0 || self->_capabilities != *((_DWORD *)a3 + 2)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)a3 + 16))
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 16) & 2) == 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 16) & 2) == 0 || self->_supportedCodecs != *((_DWORD *)a3 + 3)) {
        goto LABEL_11;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_capabilities;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_supportedCodecs;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((unsigned char *)a3 + 16) & 1) == 0)
  {
    if ((*((unsigned char *)a3 + 16) & 2) == 0) {
      return;
    }
LABEL_5:
    self->_supportedCodecs = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
    return;
  }
  self->_capabilities = *((_DWORD *)a3 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 16) & 2) != 0) {
    goto LABEL_5;
  }
}

- (VCMediaNegotiationBlobV2MomentsSettings)initWithVideoCodecs:(id)a3 imageTypes:(id)a4 capabilitiesOneToOne:(unsigned __int8)a5 capabilitiesMultiway:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v10 = [(VCMediaNegotiationBlobV2MomentsSettings *)self init];
  if (v10)
  {
    uint64_t v11 = +[VCMediaNegotiationBlobV2MomentsSettings supportedCodecsWithVideoCodecs:a3 imageTypes:a4];
    uint64_t v12 = v11;
    if ((v7 == 1 || v6 == 1 || (v6 != 2 ? (BOOL v13 = v7 == 2) : (BOOL v13 = 1), v13))
      && !v11)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v18 = 136316162;
          uint64_t v19 = v16;
          __int16 v20 = 2080;
          v21 = "-[VCMediaNegotiationBlobV2MomentsSettings(Utils) initWithVideoCodecs:imageTypes:capabilitiesOneToOne:cap"
                "abilitiesMultiway:]";
          __int16 v22 = 1024;
          int v23 = 29;
          __int16 v24 = 2112;
          id v25 = a4;
          __int16 v26 = 2112;
          id v27 = a3;
          _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to negotiate image types and video codecs. imageTypes=%@ videoCodecExpected=%@", (uint8_t *)&v18, 0x30u);
        }
      }

      return 0;
    }
    else
    {
      if (v11 != [(VCMediaNegotiationBlobV2MomentsSettings *)v10 supportedCodecs]) {
        [(VCMediaNegotiationBlobV2MomentsSettings *)v10 setSupportedCodecs:v12];
      }
      uint64_t v14 = +[VCMediaNegotiationBlobV2MomentsSettings blobCapabilitiesWithOneToOneCapabilities:v7 multiwayCapabilities:v6];
      if (v14 != [(VCMediaNegotiationBlobV2MomentsSettings *)v10 capabilities]) {
        [(VCMediaNegotiationBlobV2MomentsSettings *)v10 setCapabilities:v14];
      }
    }
  }
  return v10;
}

- (NSSet)videoCodecs
{
  uint64_t v2 = [(VCMediaNegotiationBlobV2MomentsSettings *)self supportedCodecs];

  return (NSSet *)+[VCMediaNegotiationBlobV2MomentsSettings videoCodecsWithSupportedCodecs:v2];
}

- (NSSet)imageTypes
{
  uint64_t v2 = [(VCMediaNegotiationBlobV2MomentsSettings *)self supportedCodecs];

  return (NSSet *)+[VCMediaNegotiationBlobV2MomentsSettings imageTypesWithSupportedCodecs:v2];
}

- (unsigned)capabilitiesOneToOne
{
  uint64_t v2 = [(VCMediaNegotiationBlobV2MomentsSettings *)self capabilities];

  return +[VCMediaNegotiationBlobV2MomentsSettings capabilitiesWithBlobCapabilities:v2];
}

- (unsigned)capabilitiesMultiway
{
  uint64_t v2 = [(VCMediaNegotiationBlobV2MomentsSettings *)self capabilities];

  return +[VCMediaNegotiationBlobV2MomentsSettings multiwayCapabilitiesWithBlobCapabilities:v2];
}

- (void)printWithLogFile:(void *)a3 prefix:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"[%lu] %@", objc_msgSend((id)-[VCMediaNegotiationBlobV2MomentsSettings data](self, "data"), "length"), a4];
  [v6 appendFormat:@"Moments settings: "];
  [(VCMediaNegotiationBlobV2MomentsSettings *)self appendFieldName:@"imageTypes" codecs:+[VCMediaNegotiationBlobV2MomentsSettings supportedCodecsWithVideoCodecs:imageTypes:](VCMediaNegotiationBlobV2MomentsSettings, "supportedCodecsWithVideoCodecs:imageTypes:", 0, +[VCMediaNegotiationBlobV2MomentsSettings imageTypesWithSupportedCodecs:[(VCMediaNegotiationBlobV2MomentsSettings *)self supportedCodecs]]) outString:v6];
  [(VCMediaNegotiationBlobV2MomentsSettings *)self appendFieldName:@"videoCodecs" codecs:+[VCMediaNegotiationBlobV2MomentsSettings supportedCodecsWithVideoCodecs:imageTypes:](VCMediaNegotiationBlobV2MomentsSettings, "supportedCodecsWithVideoCodecs:imageTypes:", +[VCMediaNegotiationBlobV2MomentsSettings videoCodecsWithSupportedCodecs:[(VCMediaNegotiationBlobV2MomentsSettings *)self supportedCodecs]], 0) outString:v6];
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
      uint64_t v19 = "-[VCMediaNegotiationBlobV2MomentsSettings(Utils) printWithLogFile:prefix:]";
      __int16 v20 = 1024;
      int v21 = 77;
      __int16 v22 = 2112;
      int v23 = v6;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

+ (unsigned)supportedCodecsWithVideoCodecs:(id)a3 imageTypes:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v24 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unsigned int v8 = 0;
    uint64_t v9 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(a3);
        }
        int v11 = [*(id *)(*((void *)&v24 + 1) + 8 * i) intValue];
        if (v11 == 100)
        {
          v8 |= 2u;
        }
        else if (v11 == 123)
        {
          v8 |= 1u;
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v24 objects:v23 count:16];
    }
    while (v7);
  }
  else
  {
    unsigned int v8 = 0;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = [a4 countByEnumeratingWithState:&v19 objects:v18 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(a4);
        }
        int v16 = [*(id *)(*((void *)&v19 + 1) + 8 * j) intValue];
        if (v16 == 1)
        {
          v8 |= 8u;
        }
        else if (!v16)
        {
          v8 |= 4u;
        }
      }
      uint64_t v13 = [a4 countByEnumeratingWithState:&v19 objects:v18 count:16];
    }
    while (v13);
  }
  return v8;
}

+ (id)videoCodecsWithSupportedCodecs:(unsigned int)a3
{
  char v3 = a3;
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA80] set];
  int v5 = v4;
  if (v3) {
    [v4 addObject:&unk_1F3DC66C0];
  }
  if ((v3 & 2) != 0) {
    [v5 addObject:&unk_1F3DC66D8];
  }
  return v5;
}

+ (id)imageTypesWithSupportedCodecs:(unsigned int)a3
{
  char v3 = a3;
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CA80] set];
  int v5 = v4;
  if ((v3 & 4) != 0) {
    [v4 addObject:&unk_1F3DC66F0];
  }
  if ((v3 & 8) != 0) {
    [v5 addObject:&unk_1F3DC6708];
  }
  return v5;
}

+ (unsigned)blobCapabilitiesWithOneToOneCapabilities:(unsigned __int8)a3 multiwayCapabilities:(unsigned __int8)a4
{
  unsigned int v4 = 2 * (a3 == 2);
  if (a3 == 1) {
    unsigned int v4 = 1;
  }
  unsigned int v5 = v4 | 8;
  if (a4 == 1) {
    v4 |= 4u;
  }
  if (a4 == 2) {
    return v5;
  }
  else {
    return v4;
  }
}

+ (unsigned)capabilitiesWithBlobCapabilities:(unsigned int)a3
{
  if ((a3 & 2) != 0) {
    return 2;
  }
  else {
    return a3 & 1;
  }
}

+ (unsigned)multiwayCapabilitiesWithBlobCapabilities:(unsigned int)a3
{
  if ((a3 & 8) != 0) {
    return 2;
  }
  else {
    return (a3 & 4) != 0;
  }
}

- (void)appendFieldName:(id)a3 codecs:(unsigned int)a4 outString:(id)a5
{
  [a5 appendFormat:@"%@=[", a3];
  if ((a4 & 0xF) != 0)
  {
    uint64_t v7 = @"%@";
    uint64_t v8 = 1;
    do
    {
      if ((v8 & a4) != 0)
      {
        uint64_t v9 = @"H264";
        switch((int)v8)
        {
          case 1:
            break;
          case 2:
            uint64_t v9 = @"HEVC";
            break;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_8;
          case 4:
            uint64_t v9 = @"JPEG";
            break;
          case 8:
            uint64_t v9 = @"HEIF";
            break;
          default:
            if (v8 == 15) {
              uint64_t v9 = @"SupportedMask";
            }
            else {
LABEL_8:
            }
              uint64_t v9 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v8);
            break;
        }
        objc_msgSend(a5, "appendFormat:", v7, v9);
        uint64_t v7 = @",%@";
      }
      a4 &= ~v8;
      uint64_t v8 = (2 * v8);
    }
    while ((a4 & 0xF) != 0);
  }

  [a5 appendString:@"] "];
}

@end