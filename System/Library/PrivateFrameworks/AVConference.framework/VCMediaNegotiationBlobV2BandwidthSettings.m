@interface VCMediaNegotiationBlobV2BandwidthSettings
+ (id)filteredSetForArbiterMode:(unsigned __int8)a3 bandwidthConfigurations:(id)a4;
- (BOOL)hasCap2G;
- (BOOL)hasCap3G;
- (BOOL)hasCap5G;
- (BOOL)hasCapLTE;
- (BOOL)hasCapWifi;
- (BOOL)isDefaultSettings;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)setupCapForBandwidthConfiguration:(id)a3;
- (VCMediaNegotiationBlobV2BandwidthSettings)initWithBandwidthConfigurations:(id)a3;
- (id)bandwidthConfigurations;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)cap2G;
- (unsigned)cap3G;
- (unsigned)cap5G;
- (unsigned)capLTE;
- (unsigned)capWifi;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)printWithLogFile:(void *)a3 prefix:(id)a4;
- (void)setCap2G:(unsigned int)a3;
- (void)setCap3G:(unsigned int)a3;
- (void)setCap5G:(unsigned int)a3;
- (void)setCapLTE:(unsigned int)a3;
- (void)setCapWifi:(unsigned int)a3;
- (void)setHasCap2G:(BOOL)a3;
- (void)setHasCap3G:(BOOL)a3;
- (void)setHasCap5G:(BOOL)a3;
- (void)setHasCapLTE:(BOOL)a3;
- (void)setHasCapWifi:(BOOL)a3;
- (void)setupCap2G:(unsigned int)a3;
- (void)setupCap3G:(unsigned int)a3;
- (void)setupCap5G:(unsigned int)a3;
- (void)setupCapLTE:(unsigned int)a3;
- (void)setupCapWifi:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobV2BandwidthSettings

- (VCMediaNegotiationBlobV2BandwidthSettings)initWithBandwidthConfigurations:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = [(VCMediaNegotiationBlobV2BandwidthSettings *)self init];
  if (!v4) {
    return v4;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) initWithBandwidthConfigurations:]();
      }
    }
    goto LABEL_16;
  }
  id v5 = +[VCMediaNegotiationBlobV2BandwidthSettings filteredSetForArbiterMode:1 bandwidthConfigurations:a3];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) initWithBandwidthConfigurations:]();
      }
    }
LABEL_16:

    return 0;
  }
  v6 = v5;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if (![(VCMediaNegotiationBlobV2BandwidthSettings *)v4 setupCapForBandwidthConfiguration:*(void *)(*((void *)&v13 + 1) + 8 * i)])
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) initWithBandwidthConfigurations:]();
            }
          }
          goto LABEL_16;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  return v4;
}

- (id)bandwidthConfigurations
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) bandwidthConfigurations]();
      }
    }
    long long v15 = 0;
    goto LABEL_29;
  }
  v4 = v3;
  id v5 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithConnectionType:0 maxBandwidth:[(VCMediaNegotiationBlobV2BandwidthSettings *)self cap2G]];
  if (!v5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) bandwidthConfigurations]();
      }
    }
    goto LABEL_28;
  }
  v6 = v5;
  [v4 addObject:v5];

  uint64_t v7 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithConnectionType:1 maxBandwidth:[(VCMediaNegotiationBlobV2BandwidthSettings *)self cap3G]];
  if (!v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) bandwidthConfigurations]();
      }
    }
    goto LABEL_28;
  }
  uint64_t v8 = v7;
  [v4 addObject:v7];

  uint64_t v9 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithConnectionType:2 maxBandwidth:[(VCMediaNegotiationBlobV2BandwidthSettings *)self capLTE]];
  if (!v9)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) bandwidthConfigurations].cold.4();
      }
    }
    goto LABEL_28;
  }
  v10 = v9;
  [v4 addObject:v9];

  v11 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithConnectionType:6 maxBandwidth:[(VCMediaNegotiationBlobV2BandwidthSettings *)self cap5G]];
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) bandwidthConfigurations].cold.5();
      }
    }
    goto LABEL_28;
  }
  v12 = v11;
  [v4 addObject:v11];

  long long v13 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithConnectionType:3 maxBandwidth:[(VCMediaNegotiationBlobV2BandwidthSettings *)self capWifi]];
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiationBlobV2BandwidthSettings(Utils) bandwidthConfigurations].cold.6();
      }
    }
LABEL_28:
    long long v15 = v4;
LABEL_29:
    v4 = 0;
    goto LABEL_8;
  }
  long long v14 = v13;
  [v4 addObject:v13];

  long long v15 = 0;
LABEL_8:

  return v4;
}

- (BOOL)isDefaultSettings
{
  id v3 = objc_alloc_init(VCMediaNegotiationBlobV2BandwidthSettings);
  LOBYTE(self) = [(VCMediaNegotiationBlobV2BandwidthSettings(Utils) *)self isEqual:v3];

  return (char)self;
}

- (void)printWithLogFile:(void *)a3 prefix:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v6 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"[%lu] %@", objc_msgSend((id)-[VCMediaNegotiationBlobV2BandwidthSettings data](self, "data"), "length"), a4];
  objc_msgSend(v6, "appendFormat:", @"BandwidthSettings: 2G=%u 3G=%u LTE=%u 5G=%u Wifi=%u", -[VCMediaNegotiationBlobV2BandwidthSettings cap2G](self, "cap2G"), -[VCMediaNegotiationBlobV2BandwidthSettings cap3G](self, "cap3G"), -[VCMediaNegotiationBlobV2BandwidthSettings capLTE](self, "capLTE"), -[VCMediaNegotiationBlobV2BandwidthSettings cap5G](self, "cap5G"), -[VCMediaNegotiationBlobV2BandwidthSettings capWifi](self, "capWifi"));
  char v7 = [v6 UTF8String];
  VRLogfilePrintWithTimestamp((uint64_t)a3, "%s\n", v8, v9, v10, v11, v12, v13, v7);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    long long v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v17 = v14;
      __int16 v18 = 2080;
      v19 = "-[VCMediaNegotiationBlobV2BandwidthSettings(Utils) printWithLogFile:prefix:]";
      __int16 v20 = 1024;
      int v21 = 90;
      __int16 v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
    }
  }
}

- (void)setupCap2G:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(VCMediaNegotiationBlobV2BandwidthSettings *)self cap2G] != a3)
  {
    [(VCMediaNegotiationBlobV2BandwidthSettings *)self setCap2G:v3];
  }
}

- (void)setupCap3G:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(VCMediaNegotiationBlobV2BandwidthSettings *)self cap3G] != a3)
  {
    [(VCMediaNegotiationBlobV2BandwidthSettings *)self setCap3G:v3];
  }
}

- (void)setupCapLTE:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(VCMediaNegotiationBlobV2BandwidthSettings *)self capLTE] != a3)
  {
    [(VCMediaNegotiationBlobV2BandwidthSettings *)self setCapLTE:v3];
  }
}

- (void)setupCap5G:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(VCMediaNegotiationBlobV2BandwidthSettings *)self cap5G] != a3)
  {
    [(VCMediaNegotiationBlobV2BandwidthSettings *)self setCap5G:v3];
  }
}

- (void)setupCapWifi:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  if ([(VCMediaNegotiationBlobV2BandwidthSettings *)self capWifi] != a3)
  {
    [(VCMediaNegotiationBlobV2BandwidthSettings *)self setCapWifi:v3];
  }
}

+ (id)filteredSetForArbiterMode:(unsigned __int8)a3 bandwidthConfigurations:(id)a4
{
  int v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v6 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [a4 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(a4);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v11, "connectionType"));
        if ([v11 isDefaultMode] && !objc_msgSend(v6, "objectForKeyedSubscript:", v12)
          || [v11 mode] == v5)
        {
          [v6 setObject:v11 forKeyedSubscript:v12];
        }
      }
      uint64_t v8 = [a4 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }
    while (v8);
  }
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(v6, "allValues"));
}

- (BOOL)setupCapForBandwidthConfiguration:(id)a3
{
  switch([a3 connectionType])
  {
    case 0u:
      -[VCMediaNegotiationBlobV2BandwidthSettings setupCap2G:](self, "setupCap2G:", [a3 maxBandwidth]);
      goto LABEL_8;
    case 1u:
      -[VCMediaNegotiationBlobV2BandwidthSettings setupCap3G:](self, "setupCap3G:", [a3 maxBandwidth]);
      goto LABEL_8;
    case 2u:
      -[VCMediaNegotiationBlobV2BandwidthSettings setupCapLTE:](self, "setupCapLTE:", [a3 maxBandwidth]);
      goto LABEL_8;
    case 3u:
      -[VCMediaNegotiationBlobV2BandwidthSettings setupCapWifi:](self, "setupCapWifi:", [a3 maxBandwidth]);
      goto LABEL_8;
    case 4u:
    case 5u:
      goto LABEL_8;
    case 6u:
      -[VCMediaNegotiationBlobV2BandwidthSettings setupCap5G:](self, "setupCap5G:", [a3 maxBandwidth]);
LABEL_8:
      BOOL result = 1;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (unsigned)cap2G
{
  if (*(unsigned char *)&self->_has) {
    return self->_cap2G;
  }
  else {
    return 100;
  }
}

- (void)setCap2G:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cap2G = a3;
}

- (void)setHasCap2G:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCap2G
{
  return *(unsigned char *)&self->_has & 1;
}

- (unsigned)cap3G
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_cap3G;
  }
  else {
    return 228;
  }
}

- (void)setCap3G:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cap3G = a3;
}

- (void)setHasCap3G:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCap3G
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unsigned)capLTE
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_capLTE;
  }
  else {
    return 600;
  }
}

- (void)setCapLTE:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_capLTE = a3;
}

- (void)setHasCapLTE:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCapLTE
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (unsigned)cap5G
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_cap5G;
  }
  else {
    return 2000;
  }
}

- (void)setCap5G:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_cap5G = a3;
}

- (void)setHasCap5G:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasCap5G
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (unsigned)capWifi
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_capWifi;
  }
  else {
    return 4100;
  }
}

- (void)setCapWifi:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_capWifuint64_t i = a3;
}

- (void)setHasCapWifi:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasCapWifi
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobV2BandwidthSettings;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobV2BandwidthSettings description](&v3, sel_description), -[VCMediaNegotiationBlobV2BandwidthSettings dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cap2G), @"cap2G");
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cap3G), @"cap3G");
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_11:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_cap5G), @"cap5G");
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return v3;
    }
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_capLTE), @"capLTE");
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_5:
  if ((has & 0x10) != 0) {
LABEL_6:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_capWifi), @"capWifi");
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobV2BandwidthSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    PBDataWriterWriteUint32Field();
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_9:
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_10;
  }
LABEL_5:
  if ((has & 0x10) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 2) = self->_cap2G;
    *((unsigned char *)a3 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 3) = self->_cap3G;
  *((unsigned char *)a3 + 28) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  *((_DWORD *)a3 + 5) = self->_capLTE;
  *((unsigned char *)a3 + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      return;
    }
LABEL_11:
    *((_DWORD *)a3 + 6) = self->_capWifi;
    *((unsigned char *)a3 + 28) |= 0x10u;
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 4) = self->_cap5G;
  *((unsigned char *)a3 + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    goto LABEL_11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_cap2G;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 3) = self->_cap3G;
  *((unsigned char *)result + 28) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((_DWORD *)result + 5) = self->_capLTE;
  *((unsigned char *)result + 28) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((_DWORD *)result + 4) = self->_cap5G;
  *((unsigned char *)result + 28) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_6:
  *((_DWORD *)result + 6) = self->_capWifi;
  *((unsigned char *)result + 28) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_cap2G != *((_DWORD *)a3 + 2)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)a3 + 28))
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_cap3G != *((_DWORD *)a3 + 3)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 2) != 0)
    {
      goto LABEL_26;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 8) == 0 || self->_capLTE != *((_DWORD *)a3 + 5)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 8) != 0)
    {
      goto LABEL_26;
    }
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 4) == 0 || self->_cap5G != *((_DWORD *)a3 + 4)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 28) & 4) != 0)
    {
      goto LABEL_26;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 0x10) == 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 28) & 0x10) == 0 || self->_capWifi != *((_DWORD *)a3 + 6)) {
        goto LABEL_26;
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
    uint64_t v2 = 2654435761 * self->_cap2G;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_cap3G;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_capLTE;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_cap5G;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_capWifi;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  char v3 = *((unsigned char *)a3 + 28);
  if (v3)
  {
    self->_cap2G = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v3 = *((unsigned char *)a3 + 28);
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*((unsigned char *)a3 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_cap3G = *((_DWORD *)a3 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 8) == 0)
  {
LABEL_4:
    if ((v3 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_10;
  }
LABEL_9:
  self->_capLTE = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 8u;
  char v3 = *((unsigned char *)a3 + 28);
  if ((v3 & 4) == 0)
  {
LABEL_5:
    if ((v3 & 0x10) == 0) {
      return;
    }
LABEL_11:
    self->_capWifuint64_t i = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 0x10u;
    return;
  }
LABEL_10:
  self->_cap5G = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 28) & 0x10) != 0) {
    goto LABEL_11;
  }
}

@end