@interface VCMediaNegotiationBlobBandwidthSettings
+ (int)bandwidthConfigurationFor2GWithArbiterMode:(unsigned __int8)a3;
+ (int)bandwidthConfigurationFor3GWithArbiterMode:(unsigned __int8)a3;
+ (int)bandwidthConfigurationFor5GWithArbiterMode:(unsigned __int8)a3;
+ (int)bandwidthConfigurationForAWDLWithArbiterMode:(unsigned __int8)a3;
+ (int)bandwidthConfigurationForLTEWithArbiterMode:(unsigned __int8)a3;
+ (int)bandwidthConfigurationForUSBWithArbiterMode:(unsigned __int8)a3;
+ (int)bandwidthConfigurationForWiFiWithArbiterMode:(unsigned __int8)a3;
+ (int)bandwidthConfigurationForWiredWithArbiterMode:(unsigned __int8)a3;
+ (int)bandwidthConfigurationWithArbiterMode:(unsigned __int8)a3 connectionType:(int)a4;
- (BOOL)hasConfigurationExtension;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)configurationAsString:(int)a3;
- (id)configurationExtensionAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)newBandwidthConfigurations;
- (int)StringAsConfiguration:(id)a3;
- (int)StringAsConfigurationExtension:(id)a3;
- (int)configuration;
- (int)configurationExtension;
- (unint64_t)hash;
- (unsigned)maxBandwidth;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfiguration:(int)a3;
- (void)setConfigurationExtension:(int)a3;
- (void)setHasConfigurationExtension:(BOOL)a3;
- (void)setMaxBandwidth:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation VCMediaNegotiationBlobBandwidthSettings

- (id)configurationAsString:(int)a3
{
  if (a3 > 511)
  {
    if (a3 < 0x4000)
    {
      if (a3 <= 2047)
      {
        if (a3 == 512) {
          return @"mode_FaceTime_2G";
        }
        if (a3 == 1024) {
          return @"mode_Screen_2G";
        }
      }
      else
      {
        switch(a3)
        {
          case 0x800:
            return @"mode_Default_2G";
          case 0x1000:
            return @"mode_iPadCompanion_AWDL";
          case 0x2000:
            return @"mode_iPadCompanion_USB";
        }
      }
    }
    else if (a3 >= 0x20000)
    {
      switch(a3)
      {
        case 0x20000:
          return @"mode_MultiwayScreen_Wifi";
        case 0x40000:
          return @"mode_LowLatencyScreen_Wired";
        case 0x7FFFF:
          return @"mode_SUPPORTED";
      }
    }
    else
    {
      switch(a3)
      {
        case 0x4000:
          return @"mode_FaceTime_5G";
        case 0x8000:
          return @"mode_RemoteCamera_AWDL";
        case 0x10000:
          return @"mode_RemoteCamera_USB";
      }
    }
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  if (a3 > 15)
  {
    if (a3 <= 63)
    {
      if (a3 == 16) {
        return @"mode_Screen_Wifi";
      }
      if (a3 == 32) {
        return @"mode_Screen_LTE";
      }
    }
    else
    {
      switch(a3)
      {
        case 64:
          return @"mode_FaceTime_3G";
        case 128:
          return @"mode_Screen_3G";
        case 256:
          return @"mode_Default_3G";
      }
    }
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  id result = @"mode_Invalid";
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      id result = @"mode_Default_Wifi";
      break;
    case 2:
      id result = @"mode_Default_LTE";
      break;
    case 4:
      id result = @"mode_FaceTime_Wifi";
      break;
    case 8:
      id result = @"mode_FaceTime_LTE";
      break;
    default:
      return (id)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  return result;
}

- (int)StringAsConfiguration:(id)a3
{
  if ([a3 isEqualToString:@"mode_Invalid"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"mode_Default_Wifi"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"mode_Default_LTE"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"mode_FaceTime_Wifi"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"mode_FaceTime_LTE"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"mode_Screen_Wifi"]) {
    return 16;
  }
  if ([a3 isEqualToString:@"mode_Screen_LTE"]) {
    return 32;
  }
  if ([a3 isEqualToString:@"mode_FaceTime_3G"]) {
    return 64;
  }
  if ([a3 isEqualToString:@"mode_Screen_3G"]) {
    return 128;
  }
  if ([a3 isEqualToString:@"mode_Default_3G"]) {
    return 256;
  }
  if ([a3 isEqualToString:@"mode_FaceTime_2G"]) {
    return 512;
  }
  if ([a3 isEqualToString:@"mode_Screen_2G"]) {
    return 1024;
  }
  if ([a3 isEqualToString:@"mode_Default_2G"]) {
    return 2048;
  }
  if ([a3 isEqualToString:@"mode_iPadCompanion_AWDL"]) {
    return 4096;
  }
  if ([a3 isEqualToString:@"mode_iPadCompanion_USB"]) {
    return 0x2000;
  }
  if ([a3 isEqualToString:@"mode_FaceTime_5G"]) {
    return 0x4000;
  }
  if ([a3 isEqualToString:@"mode_RemoteCamera_AWDL"]) {
    return 0x8000;
  }
  if ([a3 isEqualToString:@"mode_RemoteCamera_USB"]) {
    return 0x10000;
  }
  if ([a3 isEqualToString:@"mode_MultiwayScreen_Wifi"]) {
    return 0x20000;
  }
  if ([a3 isEqualToString:@"mode_LowLatencyScreen_Wired"]) {
    return 0x40000;
  }
  if ([a3 isEqualToString:@"mode_SUPPORTED"]) {
    return 0x7FFFF;
  }
  return 0;
}

- (int)configurationExtension
{
  if (*(unsigned char *)&self->_has) {
    return self->_configurationExtension;
  }
  else {
    return 0;
  }
}

- (void)setConfigurationExtension:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_configurationExtension = a3;
}

- (void)setHasConfigurationExtension:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfigurationExtension
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)configurationExtensionAsString:(int)a3
{
  if (a3 > 511)
  {
    if (a3 < 0x4000)
    {
      if (a3 <= 2047)
      {
        if (a3 == 512) {
          return @"mode_FaceTime_2G";
        }
        if (a3 == 1024) {
          return @"mode_Screen_2G";
        }
      }
      else
      {
        switch(a3)
        {
          case 0x800:
            return @"mode_Default_2G";
          case 0x1000:
            return @"mode_iPadCompanion_AWDL";
          case 0x2000:
            return @"mode_iPadCompanion_USB";
        }
      }
    }
    else if (a3 >= 0x20000)
    {
      switch(a3)
      {
        case 0x20000:
          return @"mode_MultiwayScreen_Wifi";
        case 0x40000:
          return @"mode_LowLatencyScreen_Wired";
        case 0x7FFFF:
          return @"mode_SUPPORTED";
      }
    }
    else
    {
      switch(a3)
      {
        case 0x4000:
          return @"mode_FaceTime_5G";
        case 0x8000:
          return @"mode_RemoteCamera_AWDL";
        case 0x10000:
          return @"mode_RemoteCamera_USB";
      }
    }
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  if (a3 > 15)
  {
    if (a3 <= 63)
    {
      if (a3 == 16) {
        return @"mode_Screen_Wifi";
      }
      if (a3 == 32) {
        return @"mode_Screen_LTE";
      }
    }
    else
    {
      switch(a3)
      {
        case 64:
          return @"mode_FaceTime_3G";
        case 128:
          return @"mode_Screen_3G";
        case 256:
          return @"mode_Default_3G";
      }
    }
    return (id)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  id result = @"mode_Invalid";
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      id result = @"mode_Default_Wifi";
      break;
    case 2:
      id result = @"mode_Default_LTE";
      break;
    case 4:
      id result = @"mode_FaceTime_Wifi";
      break;
    case 8:
      id result = @"mode_FaceTime_LTE";
      break;
    default:
      return (id)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  return result;
}

- (int)StringAsConfigurationExtension:(id)a3
{
  if ([a3 isEqualToString:@"mode_Invalid"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"mode_Default_Wifi"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"mode_Default_LTE"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"mode_FaceTime_Wifi"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"mode_FaceTime_LTE"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"mode_Screen_Wifi"]) {
    return 16;
  }
  if ([a3 isEqualToString:@"mode_Screen_LTE"]) {
    return 32;
  }
  if ([a3 isEqualToString:@"mode_FaceTime_3G"]) {
    return 64;
  }
  if ([a3 isEqualToString:@"mode_Screen_3G"]) {
    return 128;
  }
  if ([a3 isEqualToString:@"mode_Default_3G"]) {
    return 256;
  }
  if ([a3 isEqualToString:@"mode_FaceTime_2G"]) {
    return 512;
  }
  if ([a3 isEqualToString:@"mode_Screen_2G"]) {
    return 1024;
  }
  if ([a3 isEqualToString:@"mode_Default_2G"]) {
    return 2048;
  }
  if ([a3 isEqualToString:@"mode_iPadCompanion_AWDL"]) {
    return 4096;
  }
  if ([a3 isEqualToString:@"mode_iPadCompanion_USB"]) {
    return 0x2000;
  }
  if ([a3 isEqualToString:@"mode_FaceTime_5G"]) {
    return 0x4000;
  }
  if ([a3 isEqualToString:@"mode_RemoteCamera_AWDL"]) {
    return 0x8000;
  }
  if ([a3 isEqualToString:@"mode_RemoteCamera_USB"]) {
    return 0x10000;
  }
  if ([a3 isEqualToString:@"mode_MultiwayScreen_Wifi"]) {
    return 0x20000;
  }
  if ([a3 isEqualToString:@"mode_LowLatencyScreen_Wired"]) {
    return 0x40000;
  }
  if ([a3 isEqualToString:@"mode_SUPPORTED"]) {
    return 0x7FFFF;
  }
  return 0;
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiationBlobBandwidthSettings;
  return (id)[NSString stringWithFormat:@"%@ %@", -[VCMediaNegotiationBlobBandwidthSettings description](&v3, sel_description), -[VCMediaNegotiationBlobBandwidthSettings dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  int configuration = self->_configuration;
  if (configuration > 511)
  {
    if (configuration < 0x4000)
    {
      if (configuration <= 2047)
      {
        if (configuration == 512)
        {
          v5 = @"mode_FaceTime_2G";
          goto LABEL_45;
        }
        if (configuration == 1024)
        {
          v5 = @"mode_Screen_2G";
          goto LABEL_45;
        }
      }
      else
      {
        switch(configuration)
        {
          case 0x800:
            v5 = @"mode_Default_2G";
            goto LABEL_45;
          case 0x1000:
            v5 = @"mode_iPadCompanion_AWDL";
            goto LABEL_45;
          case 0x2000:
            v5 = @"mode_iPadCompanion_USB";
            goto LABEL_45;
        }
      }
    }
    else if (configuration >= 0x20000)
    {
      switch(configuration)
      {
        case 0x20000:
          v5 = @"mode_MultiwayScreen_Wifi";
          goto LABEL_45;
        case 0x40000:
          v5 = @"mode_LowLatencyScreen_Wired";
          goto LABEL_45;
        case 0x7FFFF:
          v5 = @"mode_SUPPORTED";
          goto LABEL_45;
      }
    }
    else
    {
      switch(configuration)
      {
        case 0x4000:
          v5 = @"mode_FaceTime_5G";
          goto LABEL_45;
        case 0x8000:
          v5 = @"mode_RemoteCamera_AWDL";
          goto LABEL_45;
        case 0x10000:
          v5 = @"mode_RemoteCamera_USB";
          goto LABEL_45;
      }
    }
LABEL_44:
    v5 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_configuration);
    goto LABEL_45;
  }
  if (configuration > 15)
  {
    if (configuration <= 63)
    {
      if (configuration == 16)
      {
        v5 = @"mode_Screen_Wifi";
        goto LABEL_45;
      }
      if (configuration == 32)
      {
        v5 = @"mode_Screen_LTE";
        goto LABEL_45;
      }
    }
    else
    {
      switch(configuration)
      {
        case 64:
          v5 = @"mode_FaceTime_3G";
          goto LABEL_45;
        case 128:
          v5 = @"mode_Screen_3G";
          goto LABEL_45;
        case 256:
          v5 = @"mode_Default_3G";
          goto LABEL_45;
      }
    }
    goto LABEL_44;
  }
  v5 = @"mode_Invalid";
  switch(configuration)
  {
    case 0:
      break;
    case 1:
      v5 = @"mode_Default_Wifi";
      break;
    case 2:
      v5 = @"mode_Default_LTE";
      break;
    case 4:
      v5 = @"mode_FaceTime_Wifi";
      break;
    case 8:
      v5 = @"mode_FaceTime_LTE";
      break;
    default:
      goto LABEL_44;
  }
LABEL_45:
  [v3 setObject:v5 forKey:@"configuration"];
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_maxBandwidth), @"maxBandwidth");
  if (*(unsigned char *)&self->_has)
  {
    int configurationExtension = self->_configurationExtension;
    if (configurationExtension <= 511)
    {
      if (configurationExtension <= 15)
      {
        v7 = @"mode_Invalid";
        switch(configurationExtension)
        {
          case 0:
            goto LABEL_90;
          case 1:
            v7 = @"mode_Default_Wifi";
            break;
          case 2:
            v7 = @"mode_Default_LTE";
            break;
          case 4:
            v7 = @"mode_FaceTime_Wifi";
            break;
          case 8:
            v7 = @"mode_FaceTime_LTE";
            break;
          default:
            goto LABEL_89;
        }
        goto LABEL_90;
      }
      if (configurationExtension <= 63)
      {
        if (configurationExtension == 16)
        {
          v7 = @"mode_Screen_Wifi";
          goto LABEL_90;
        }
        if (configurationExtension == 32)
        {
          v7 = @"mode_Screen_LTE";
          goto LABEL_90;
        }
      }
      else
      {
        switch(configurationExtension)
        {
          case 64:
            v7 = @"mode_FaceTime_3G";
            goto LABEL_90;
          case 128:
            v7 = @"mode_Screen_3G";
            goto LABEL_90;
          case 256:
            v7 = @"mode_Default_3G";
            goto LABEL_90;
        }
      }
    }
    else if (configurationExtension < 0x4000)
    {
      if (configurationExtension <= 2047)
      {
        if (configurationExtension == 512)
        {
          v7 = @"mode_FaceTime_2G";
          goto LABEL_90;
        }
        if (configurationExtension == 1024)
        {
          v7 = @"mode_Screen_2G";
          goto LABEL_90;
        }
      }
      else
      {
        switch(configurationExtension)
        {
          case 0x800:
            v7 = @"mode_Default_2G";
            goto LABEL_90;
          case 0x1000:
            v7 = @"mode_iPadCompanion_AWDL";
            goto LABEL_90;
          case 0x2000:
            v7 = @"mode_iPadCompanion_USB";
            goto LABEL_90;
        }
      }
    }
    else if (configurationExtension >= 0x20000)
    {
      switch(configurationExtension)
      {
        case 0x20000:
          v7 = @"mode_MultiwayScreen_Wifi";
          goto LABEL_90;
        case 0x40000:
          v7 = @"mode_LowLatencyScreen_Wired";
          goto LABEL_90;
        case 0x7FFFF:
          v7 = @"mode_SUPPORTED";
          goto LABEL_90;
      }
    }
    else
    {
      switch(configurationExtension)
      {
        case 0x4000:
          v7 = @"mode_FaceTime_5G";
          goto LABEL_90;
        case 0x8000:
          v7 = @"mode_RemoteCamera_AWDL";
          goto LABEL_90;
        case 0x10000:
          v7 = @"mode_RemoteCamera_USB";
LABEL_90:
          [v3 setObject:v7 forKey:@"configurationExtension"];
          return v3;
      }
    }
LABEL_89:
    v7 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_configurationExtension);
    goto LABEL_90;
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCMediaNegotiationBlobBandwidthSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_configuration;
  *((_DWORD *)a3 + 4) = self->_maxBandwidth;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 3) = self->_configurationExtension;
    *((unsigned char *)a3 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_configuration;
  *((_DWORD *)result + 4) = self->_maxBandwidth;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)result + 3) = self->_configurationExtension;
    *((unsigned char *)result + 20) |= 1u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (self->_configuration != *((_DWORD *)a3 + 2) || self->_maxBandwidth != *((_DWORD *)a3 + 4)) {
      goto LABEL_8;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) == 0;
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 20) & 1) != 0 && self->_configurationExtension == *((_DWORD *)a3 + 3))
      {
        LOBYTE(v5) = 1;
        return v5;
      }
LABEL_8:
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_configurationExtension;
  }
  else {
    uint64_t v2 = 0;
  }
  return (2654435761 * self->_maxBandwidth) ^ v2 ^ (2654435761 * self->_configuration);
}

- (void)mergeFrom:(id)a3
{
  self->_int configuration = *((_DWORD *)a3 + 2);
  self->_maxBandwidth = *((_DWORD *)a3 + 4);
  if (*((unsigned char *)a3 + 20))
  {
    self->_int configurationExtension = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (int)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(int)a3
{
  self->_int configuration = a3;
}

- (unsigned)maxBandwidth
{
  return self->_maxBandwidth;
}

- (void)setMaxBandwidth:(unsigned int)a3
{
  self->_maxBandwidth = a3;
}

+ (int)bandwidthConfigurationFor2GWithArbiterMode:(unsigned __int8)a3
{
  if (a3 < 8u) {
    return dword_1E25A2298[(char)a3];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationFor2GWithArbiterMode:]();
  }
  return 0;
}

+ (int)bandwidthConfigurationFor3GWithArbiterMode:(unsigned __int8)a3
{
  if (a3 < 8u) {
    return dword_1E25A22B8[(char)a3];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationFor3GWithArbiterMode:]();
  }
  return 0;
}

+ (int)bandwidthConfigurationForLTEWithArbiterMode:(unsigned __int8)a3
{
  if (a3 < 8u) {
    return dword_1E25A22D8[(char)a3];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationForLTEWithArbiterMode:]();
  }
  return 0;
}

+ (int)bandwidthConfigurationFor5GWithArbiterMode:(unsigned __int8)a3
{
  if (a3 == 1) {
    return 0x4000;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationFor5GWithArbiterMode:]();
  }
  return 0;
}

+ (int)bandwidthConfigurationForWiFiWithArbiterMode:(unsigned __int8)a3
{
  if (a3 < 8u) {
    return dword_1E25A22F8[(char)a3];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationForWiFiWithArbiterMode:]();
  }
  return 0;
}

+ (int)bandwidthConfigurationForAWDLWithArbiterMode:(unsigned __int8)a3
{
  if ((a3 - 4) < 3) {
    return dword_1E25A2318[(char)(a3 - 4)];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationForAWDLWithArbiterMode:]();
  }
  return 0;
}

+ (int)bandwidthConfigurationForUSBWithArbiterMode:(unsigned __int8)a3
{
  if ((a3 - 4) < 3) {
    return dword_1E25A2324[(char)(a3 - 4)];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationForUSBWithArbiterMode:]();
  }
  return 0;
}

+ (int)bandwidthConfigurationForWiredWithArbiterMode:(unsigned __int8)a3
{
  if (a3 == 5) {
    return 0x40000;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    int result = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
    if (!result) {
      return result;
    }
    +[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationForWiredWithArbiterMode:]();
  }
  return 0;
}

+ (int)bandwidthConfigurationWithArbiterMode:(unsigned __int8)a3 connectionType:(int)a4
{
  int v5 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  switch(a4)
  {
    case 0:
      int result = objc_msgSend(a1, "bandwidthConfigurationFor2GWithArbiterMode:");
      break;
    case 1:
      int result = objc_msgSend(a1, "bandwidthConfigurationFor3GWithArbiterMode:");
      break;
    case 2:
      int result = objc_msgSend(a1, "bandwidthConfigurationForLTEWithArbiterMode:");
      break;
    case 3:
      int result = objc_msgSend(a1, "bandwidthConfigurationForWiFiWithArbiterMode:");
      break;
    case 4:
      int result = objc_msgSend(a1, "bandwidthConfigurationForAWDLWithArbiterMode:");
      break;
    case 5:
      int result = objc_msgSend(a1, "bandwidthConfigurationForUSBWithArbiterMode:");
      break;
    case 6:
      int result = objc_msgSend(a1, "bandwidthConfigurationFor5GWithArbiterMode:");
      break;
    case 7:
      int result = objc_msgSend(a1, "bandwidthConfigurationForWiredWithArbiterMode:");
      break;
    default:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v9 = 136316162;
          uint64_t v10 = v7;
          __int16 v11 = 2080;
          v12 = "+[VCMediaNegotiationBlobBandwidthSettings(BandwidthSettings) bandwidthConfigurationWithArbiterMode:connectionType:]";
          __int16 v13 = 1024;
          int v14 = 1177;
          __int16 v15 = 1024;
          int v16 = a4;
          __int16 v17 = 1024;
          int v18 = v5;
          _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid bandwidth configuration: connection type=%d, arbiterMode=%hhu", (uint8_t *)&v9, 0x28u);
        }
      }
      int result = 0;
      break;
  }
  return result;
}

- (id)newBandwidthConfigurations
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  int configuration = self->_configuration;
  if (configuration)
  {
    int v9 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithConnectionType:3 maxBandwidth:self->_maxBandwidth];
    [v3 addObject:v9];

    int configuration = self->_configuration;
    if ((configuration & 2) == 0)
    {
LABEL_3:
      if ((configuration & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((configuration & 2) == 0)
  {
    goto LABEL_3;
  }
  uint64_t v10 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithConnectionType:2 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v10];

  int configuration = self->_configuration;
  if ((configuration & 4) == 0)
  {
LABEL_4:
    if ((configuration & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  __int16 v11 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:1 connectionType:3 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v11];

  int configuration = self->_configuration;
  if ((configuration & 8) == 0)
  {
LABEL_5:
    if ((configuration & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  v12 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:1 connectionType:2 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v12];

  int configuration = self->_configuration;
  if ((configuration & 0x10) == 0)
  {
LABEL_6:
    if ((configuration & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  __int16 v13 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:3 connectionType:3 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v13];

  int configuration = self->_configuration;
  if ((configuration & 0x20) == 0)
  {
LABEL_7:
    if ((configuration & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  int v14 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:3 connectionType:2 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v14];

  int configuration = self->_configuration;
  if ((configuration & 0x40) == 0)
  {
LABEL_8:
    if ((configuration & 0x80) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  __int16 v15 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:1 connectionType:1 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v15];

  int configuration = self->_configuration;
  if ((configuration & 0x80) == 0)
  {
LABEL_9:
    if ((configuration & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  int v16 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:3 connectionType:1 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v16];

  int configuration = self->_configuration;
  if ((configuration & 0x100) == 0)
  {
LABEL_10:
    if ((configuration & 0x200) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  __int16 v17 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithConnectionType:1 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v17];

  int configuration = self->_configuration;
  if ((configuration & 0x200) == 0)
  {
LABEL_11:
    if ((configuration & 0x400) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  int v18 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:1 connectionType:0 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v18];

  int configuration = self->_configuration;
  if ((configuration & 0x400) == 0)
  {
LABEL_12:
    if ((configuration & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_35:
  uint64_t v19 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:3 connectionType:0 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v19];

  if ((self->_configuration & 0x800) != 0)
  {
LABEL_13:
    int v5 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithConnectionType:0 maxBandwidth:self->_maxBandwidth];
    [v3 addObject:v5];
  }
LABEL_14:
  int configurationExtension = self->_configurationExtension;
  if ((configurationExtension & 0x1000) != 0)
  {
    v20 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:4 connectionType:4 maxBandwidth:self->_maxBandwidth];
    [v3 addObject:v20];

    int configurationExtension = self->_configurationExtension;
    if ((configurationExtension & 0x2000) == 0)
    {
LABEL_16:
      if ((configurationExtension & 0x4000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_39;
    }
  }
  else if ((configurationExtension & 0x2000) == 0)
  {
    goto LABEL_16;
  }
  v21 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:4 connectionType:5 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v21];

  int configurationExtension = self->_configurationExtension;
  if ((configurationExtension & 0x4000) == 0)
  {
LABEL_17:
    if ((configurationExtension & 0x1000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
LABEL_39:
  v22 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:1 connectionType:6 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v22];

  int configurationExtension = self->_configurationExtension;
  if ((configurationExtension & 0x1000) == 0)
  {
LABEL_18:
    if ((configurationExtension & 0x2000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_41;
  }
LABEL_40:
  v23 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:5 connectionType:4 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v23];

  int configurationExtension = self->_configurationExtension;
  if ((configurationExtension & 0x2000) == 0)
  {
LABEL_19:
    if ((configurationExtension & 0x8000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_42;
  }
LABEL_41:
  v24 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:5 connectionType:5 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v24];

  int configurationExtension = self->_configurationExtension;
  if ((configurationExtension & 0x8000) == 0)
  {
LABEL_20:
    if ((configurationExtension & 0x10000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_43;
  }
LABEL_42:
  v25 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:6 connectionType:4 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v25];

  int configurationExtension = self->_configurationExtension;
  if ((configurationExtension & 0x10000) == 0)
  {
LABEL_21:
    if ((configurationExtension & 0x20000) == 0) {
      goto LABEL_22;
    }
LABEL_44:
    v27 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:7 connectionType:3 maxBandwidth:self->_maxBandwidth];
    [v3 addObject:v27];

    if ((self->_configurationExtension & 0x40000) == 0) {
      return v3;
    }
    goto LABEL_23;
  }
LABEL_43:
  v26 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:6 connectionType:5 maxBandwidth:self->_maxBandwidth];
  [v3 addObject:v26];

  int configurationExtension = self->_configurationExtension;
  if ((configurationExtension & 0x20000) != 0) {
    goto LABEL_44;
  }
LABEL_22:
  if ((configurationExtension & 0x40000) != 0)
  {
LABEL_23:
    uint64_t v7 = [[VCMediaNegotiatorBandwidthConfiguration alloc] initWithArbiterMode:5 connectionType:7 maxBandwidth:self->_maxBandwidth];
    [v3 addObject:v7];
  }
  return v3;
}

@end