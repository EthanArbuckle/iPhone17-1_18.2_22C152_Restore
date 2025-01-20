@interface VCMediaNegotiationBlobV2SettingsU1
+ (Class)encodeDecodeFeaturesType;
+ (id)appendCipherSuiteFlags:(unsigned int)a3 toDescription:(id)a4;
+ (id)mediaStreamCipherSuitesFromNegotiationCipherSuites:(int)a3;
+ (int)negotiationCipherSuiteFromMediaStreamCipherSuite:(int64_t)a3;
+ (int)negotiationCipherSuitesFromMediaStreamCipherSuites:(id)a3;
+ (int64_t)mediaStreamCipherSuiteFromNegotiationCipherSuite:(int)a3;
- (BOOL)hasRtpSSRC;
- (BOOL)isEqual:(id)a3;
- (BOOL)loadEncodeDecodeFeatures:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)encodeDecodeFeatures;
- (VCMediaNegotiationBlobV2SettingsU1)initWithU1Config:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)encodeDecodeFeaturesAtIndex:(unint64_t)a3;
- (id)u1Config;
- (unint64_t)encodeDecodeFeaturesCount;
- (unint64_t)hash;
- (unsigned)rtpSSRC;
- (void)addEncodeDecodeFeatures:(id)a3;
- (void)clearEncodeDecodeFeatures;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setEncodeDecodeFeatures:(id)a3;
- (void)setHasRtpSSRC:(BOOL)a3;
- (void)setRtpSSRC:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobV2SettingsU1

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCMediaNegotiationBlobV2SettingsU1 *)self setEncodeDecodeFeatures:0];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2SettingsU1;
  [(VCMediaNegotiationBlobV2SettingsU1 *)&v3 dealloc];
}

- (void)setRtpSSRC:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_rtpSSRC = a3;
}

- (void)setHasRtpSSRC:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRtpSSRC
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearEncodeDecodeFeatures
{
}

- (void)addEncodeDecodeFeatures:(id)a3
{
  encodeDecodeFeatures = self->_encodeDecodeFeatures;
  if (!encodeDecodeFeatures)
  {
    encodeDecodeFeatures = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    self->_encodeDecodeFeatures = encodeDecodeFeatures;
  }

  [(NSMutableArray *)encodeDecodeFeatures addObject:a3];
}

- (unint64_t)encodeDecodeFeaturesCount
{
  return [(NSMutableArray *)self->_encodeDecodeFeatures count];
}

- (id)encodeDecodeFeaturesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_encodeDecodeFeatures objectAtIndex:a3];
}

+ (Class)encodeDecodeFeaturesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2SettingsU1;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobV2SettingsU1 description](&v3, sel_description), -[VCMediaNegotiationBlobV2SettingsU1 dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_rtpSSRC), @"rtpSSRC");
  }
  if ([(NSMutableArray *)self->_encodeDecodeFeatures count])
  {
    uint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_encodeDecodeFeatures, "count"));
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    encodeDecodeFeatures = self->_encodeDecodeFeatures;
    uint64_t v6 = [(NSMutableArray *)encodeDecodeFeatures countByEnumeratingWithState:&v12 objects:v11 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(encodeDecodeFeatures);
          }
          objc_msgSend(v4, "addObject:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9++), "dictionaryRepresentation"));
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)encodeDecodeFeatures countByEnumeratingWithState:&v12 objects:v11 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"encodeDecodeFeatures"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2SettingsU1ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  encodeDecodeFeatures = self->_encodeDecodeFeatures;
  uint64_t v5 = [(NSMutableArray *)encodeDecodeFeatures countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(encodeDecodeFeatures);
        }
        PBDataWriterWriteSubmessage();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)encodeDecodeFeatures countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 4) = self->_rtpSSRC;
    *((unsigned char *)a3 + 20) |= 1u;
  }
  if ([(VCMediaNegotiationBlobV2SettingsU1 *)self encodeDecodeFeaturesCount])
  {
    [a3 clearEncodeDecodeFeatures];
    unint64_t v5 = [(VCMediaNegotiationBlobV2SettingsU1 *)self encodeDecodeFeaturesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(a3, "addEncodeDecodeFeatures:", -[VCMediaNegotiationBlobV2SettingsU1 encodeDecodeFeaturesAtIndex:](self, "encodeDecodeFeaturesAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_rtpSSRC;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  encodeDecodeFeatures = self->_encodeDecodeFeatures;
  uint64_t v8 = [(NSMutableArray *)encodeDecodeFeatures countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(encodeDecodeFeatures);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * v11) copyWithZone:a3];
        [v6 addEncodeDecodeFeatures:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)encodeDecodeFeatures countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v9);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 20) & 1) == 0 || self->_rtpSSRC != *((_DWORD *)a3 + 4)) {
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
      LOBYTE(v5) = -[NSMutableArray isEqual:](encodeDecodeFeatures, "isEqual:");
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
    uint64_t v2 = 2654435761 * self->_rtpSSRC;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NSMutableArray *)self->_encodeDecodeFeatures hash] ^ v2;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)a3 + 20))
  {
    self->_rtpSSRC = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = (void *)*((void *)a3 + 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [(VCMediaNegotiationBlobV2SettingsU1 *)self addEncodeDecodeFeatures:*(void *)(*((void *)&v10 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v9 count:16];
    }
    while (v6);
  }
}

- (unsigned)rtpSSRC
{
  return self->_rtpSSRC;
}

- (NSMutableArray)encodeDecodeFeatures
{
  return self->_encodeDecodeFeatures;
}

- (void)setEncodeDecodeFeatures:(id)a3
{
}

- (VCMediaNegotiationBlobV2SettingsU1)initWithU1Config:(id)a3
{
  uint64_t v4 = [(VCMediaNegotiationBlobV2SettingsU1 *)self init];
  if (v4)
  {
    if (a3)
    {
      -[VCMediaNegotiationBlobV2SettingsU1 setRtpSSRC:](v4, "setRtpSSRC:", [a3 ssrc]);
      if ([(VCMediaNegotiationBlobV2SettingsU1 *)v4 loadEncodeDecodeFeatures:a3]) {
        return v4;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiationBlobV2SettingsU1(Utils) initWithU1Config:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2SettingsU1(Utils) initWithU1Config:]();
      }
    }

    return 0;
  }
  return v4;
}

- (id)u1Config
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_super v3 = objc_alloc_init(VCMediaNegotiatorStreamGroupU1Configuration);
  [(VCMediaNegotiatorStreamGroupU1Configuration *)v3 setSupportedDirection:3];
  if ([(VCMediaNegotiationBlobV2SettingsU1 *)self hasRtpSSRC]) {
    [(VCMediaNegotiatorStreamGroupU1Configuration *)v3 setSsrc:[(VCMediaNegotiationBlobV2SettingsU1 *)self rtpSSRC]];
  }
  if ([(NSMutableArray *)[(VCMediaNegotiationBlobV2SettingsU1 *)self encodeDecodeFeatures] count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [(VCMediaNegotiationBlobV2SettingsU1 *)self encodeDecodeFeatures];
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          [v10 encodeDecodeFeatures];
          long long v11 = (void *)VCPCreateDecompressedFLS();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "rtpPayload")));
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v13 count:16];
      }
      while (v7);
    }
    [(VCMediaNegotiatorStreamGroupU1Configuration *)v3 setVideoFeatureStringsFixedPosition:v4];
  }
  return v3;
}

- (BOOL)loadEncodeDecodeFeatures:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[a3 videoFeatureStringsFixedPosition];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v28;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v28 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v27 + 1) + 8 * v8);
      [v4 objectForKeyedSubscript:v9];
      long long v10 = (void *)VCPCreateCompressedFLS();
      long long v11 = [[VCMediaNegotiationBlobV2StreamGroupEncodeDecodeFeatures alloc] initWithPayload:v9 encodeDecodeFeatures:v10];

      if (!v11) {
        break;
      }
      [(VCMediaNegotiationBlobV2SettingsU1 *)self addEncodeDecodeFeatures:v11];

      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v27 objects:v26 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      long long v14 = *MEMORY[0x1E4F47A50];
      BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v12) {
        return v12;
      }
      int v16 = 136316162;
      uint64_t v17 = v13;
      __int16 v18 = 2080;
      uint64_t v19 = "-[VCMediaNegotiationBlobV2SettingsU1(Utils) loadEncodeDecodeFeatures:]";
      __int16 v20 = 1024;
      int v21 = 79;
      __int16 v22 = 2112;
      uint64_t v23 = v9;
      __int16 v24 = 2112;
      uint64_t v25 = [v4 objectForKeyedSubscript:v9];
      _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to create encodeDecodeFeaturesBlob for rtpPayload=%@, FLS=%@", (uint8_t *)&v16, 0x30u);
    }
    LOBYTE(v12) = 0;
  }
  else
  {
LABEL_9:
    LOBYTE(v12) = 1;
  }
  return v12;
}

+ (id)mediaStreamCipherSuitesFromNegotiationCipherSuites:(int)a3
{
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA70] orderedSet];
  if (a3)
  {
    uint64_t v6 = 1;
    do
    {
      if ((v6 & a3) != 0) {
        objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "mediaStreamCipherSuiteFromNegotiationCipherSuite:", v6)));
      }
      a3 &= ~v6;
      if (!a3) {
        break;
      }
      int v7 = v6 & 3;
      uint64_t v6 = (2 * v6);
    }
    while (v7);
  }
  return v5;
}

+ (int64_t)mediaStreamCipherSuiteFromNegotiationCipherSuite:(int)a3
{
  int64_t v3 = 3;
  if (a3 == 2) {
    int64_t v3 = 8;
  }
  if (a3 == 4) {
    return 9;
  }
  else {
    return v3;
  }
}

+ (int)negotiationCipherSuiteFromMediaStreamCipherSuite:(int64_t)a3
{
  int result = 1;
  switch(a3)
  {
    case -1:
    case 0:
    case 1:
    case 2:
    case 4:
    case 5:
    case 6:
    case 7:
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_5;
      }
      VRTraceErrorLogLevelToCSTR();
      int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (result)
      {
        +[VCMediaNegotiationBlobV2SettingsU1(Utils) negotiationCipherSuiteFromMediaStreamCipherSuite:]();
        goto LABEL_5;
      }
      break;
    case 3:
      return result;
    case 8:
      int result = 2;
      break;
    case 9:
      int result = 4;
      break;
    default:
LABEL_5:
      int result = 0;
      break;
  }
  return result;
}

+ (int)negotiationCipherSuitesFromMediaStreamCipherSuites:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  int v7 = 0;
  uint64_t v8 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(a3);
      }
      v7 |= objc_msgSend(a1, "negotiationCipherSuiteFromMediaStreamCipherSuite:", objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "integerValue"));
    }
    uint64_t v6 = [a3 countByEnumeratingWithState:&v12 objects:v11 count:16];
  }
  while (v6);
  return v7;
}

+ (id)appendCipherSuiteFlags:(unsigned int)a3 toDescription:(id)a4
{
  unsigned int v5 = a3;
  objc_msgSend(a4, "appendFormat:", @"cipherSuites=0x%x [", *(void *)&a3);
  if (v5)
  {
    uint64_t v6 = @"%@";
    uint64_t v7 = 1;
    do
    {
      if ((v7 & v5) != 0)
      {
        int v8 = v7 - 1;
        if (v7 - 1) < 7 && ((0x4Bu >> v8)) {
          uint64_t v9 = off_1E6DB8990[v8];
        }
        else {
          uint64_t v9 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v7);
        }
        objc_msgSend(a4, "appendFormat:", v6, v9);
        uint64_t v6 = @",%@";
      }
      v5 &= ~v7;
      if (!v5) {
        break;
      }
      int v10 = v7 & 3;
      uint64_t v7 = (2 * v7);
    }
    while (v10);
  }
  [a4 appendString:@"]"];
  return a4;
}

@end