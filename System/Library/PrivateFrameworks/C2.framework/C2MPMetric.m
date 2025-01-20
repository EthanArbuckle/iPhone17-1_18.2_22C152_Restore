@interface C2MPMetric
- (BOOL)hasCloudkitInfo;
- (BOOL)hasDeviceInfo;
- (BOOL)hasGenericEvent;
- (BOOL)hasMetricType;
- (BOOL)hasNetworkEvent;
- (BOOL)hasReportFrequency;
- (BOOL)hasReportFrequencyBase;
- (BOOL)hasReportTransportAllowExpensiveAccess;
- (BOOL)hasReportTransportAllowPowerNapScheduling;
- (BOOL)hasReportTransportSourceApplicationBundleIdentifier;
- (BOOL)hasReportTransportSourceApplicationSecondaryIdentifier;
- (BOOL)hasServerInfo;
- (BOOL)hasTriggers;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)reportTransportAllowExpensiveAccess;
- (BOOL)reportTransportAllowPowerNapScheduling;
- (C2MPCloudKitInfo)cloudkitInfo;
- (C2MPDeviceInfo)deviceInfo;
- (C2MPGenericEvent)genericEvent;
- (C2MPNetworkEvent)networkEvent;
- (C2MPServerInfo)serverInfo;
- (NSString)reportTransportSourceApplicationBundleIdentifier;
- (NSString)reportTransportSourceApplicationSecondaryIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)metricTypeAsString:(int)a3;
- (int)StringAsMetricType:(id)a3;
- (int)metricType;
- (unint64_t)hash;
- (unint64_t)reportFrequency;
- (unint64_t)reportFrequencyBase;
- (unint64_t)triggers;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCloudkitInfo:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setGenericEvent:(id)a3;
- (void)setHasMetricType:(BOOL)a3;
- (void)setHasReportFrequency:(BOOL)a3;
- (void)setHasReportFrequencyBase:(BOOL)a3;
- (void)setHasReportTransportAllowExpensiveAccess:(BOOL)a3;
- (void)setHasReportTransportAllowPowerNapScheduling:(BOOL)a3;
- (void)setHasTriggers:(BOOL)a3;
- (void)setMetricType:(int)a3;
- (void)setNetworkEvent:(id)a3;
- (void)setReportFrequency:(unint64_t)a3;
- (void)setReportFrequencyBase:(unint64_t)a3;
- (void)setReportTransportAllowExpensiveAccess:(BOOL)a3;
- (void)setReportTransportAllowPowerNapScheduling:(BOOL)a3;
- (void)setReportTransportSourceApplicationBundleIdentifier:(id)a3;
- (void)setReportTransportSourceApplicationSecondaryIdentifier:(id)a3;
- (void)setServerInfo:(id)a3;
- (void)setTriggers:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation C2MPMetric

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverInfo, 0);
  objc_storeStrong((id *)&self->_reportTransportSourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_reportTransportSourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_networkEvent, 0);
  objc_storeStrong((id *)&self->_genericEvent, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_cloudkitInfo, 0);
}

- (C2MPNetworkEvent)networkEvent
{
  return self->_networkEvent;
}

- (void)setTriggers:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_triggers = a3;
}

- (void)setReportTransportSourceApplicationSecondaryIdentifier:(id)a3
{
}

- (void)setReportTransportSourceApplicationBundleIdentifier:(id)a3
{
}

- (void)setReportTransportAllowPowerNapScheduling:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_reportTransportAllowPowerNapScheduling = a3;
}

- (void)setReportTransportAllowExpensiveAccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_reportTransportAllowExpensiveAccess = a3;
}

- (void)setReportFrequencyBase:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_reportFrequencyBase = a3;
}

- (void)setReportFrequency:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_reportFrequency = a3;
}

- (void)setMetricType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_metricType = a3;
}

- (void)setDeviceInfo:(id)a3
{
}

- (void)setCloudkitInfo:(id)a3
{
}

- (C2MPCloudKitInfo)cloudkitInfo
{
  return self->_cloudkitInfo;
}

- (int)metricType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_metricType;
  }
  else {
    return 0;
  }
}

- (C2MPDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (C2MPGenericEvent)genericEvent
{
  return self->_genericEvent;
}

- (void)setNetworkEvent:(id)a3
{
}

- (void)setGenericEvent:(id)a3
{
}

- (void)setHasMetricType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasMetricType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)metricTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 201)
    {
      v4 = @"generic_event_type";
    }
    else if (a3 == 200)
    {
      v4 = @"network_event_type";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"none_type";
  }
  return v4;
}

- (int)StringAsMetricType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"none_type"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"network_event_type"])
  {
    int v4 = 200;
  }
  else if ([v3 isEqualToString:@"generic_event_type"])
  {
    int v4 = 201;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDeviceInfo
{
  return self->_deviceInfo != 0;
}

- (BOOL)hasCloudkitInfo
{
  return self->_cloudkitInfo != 0;
}

- (BOOL)hasServerInfo
{
  return self->_serverInfo != 0;
}

- (void)setHasTriggers:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTriggers
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasReportFrequency:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReportFrequency
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasReportFrequencyBase:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasReportFrequencyBase
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasReportTransportAllowExpensiveAccess:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasReportTransportAllowExpensiveAccess
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasReportTransportAllowPowerNapScheduling:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasReportTransportAllowPowerNapScheduling
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasReportTransportSourceApplicationBundleIdentifier
{
  return self->_reportTransportSourceApplicationBundleIdentifier != 0;
}

- (BOOL)hasReportTransportSourceApplicationSecondaryIdentifier
{
  return self->_reportTransportSourceApplicationSecondaryIdentifier != 0;
}

- (BOOL)hasNetworkEvent
{
  return self->_networkEvent != 0;
}

- (BOOL)hasGenericEvent
{
  return self->_genericEvent != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)C2MPMetric;
  int v4 = [(C2MPMetric *)&v8 description];
  v5 = [(C2MPMetric *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    int metricType = self->_metricType;
    if (metricType)
    {
      if (metricType == 201)
      {
        v5 = @"generic_event_type";
      }
      else if (metricType == 200)
      {
        v5 = @"network_event_type";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_metricType);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v5 = @"none_type";
    }
    [v3 setObject:v5 forKey:@"metric_type"];
  }
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    v7 = [(C2MPDeviceInfo *)deviceInfo dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"device_info"];
  }
  cloudkitInfo = self->_cloudkitInfo;
  if (cloudkitInfo)
  {
    v9 = [(C2MPCloudKitInfo *)cloudkitInfo dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"cloudkit_info"];
  }
  serverInfo = self->_serverInfo;
  if (serverInfo)
  {
    v11 = [(C2MPServerInfo *)serverInfo dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"server_info"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v21 = [NSNumber numberWithUnsignedLongLong:self->_triggers];
    [v3 setObject:v21 forKey:@"triggers"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_18:
      if ((has & 2) == 0) {
        goto LABEL_19;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_18;
  }
  v22 = [NSNumber numberWithUnsignedLongLong:self->_reportFrequency];
  [v3 setObject:v22 forKey:@"report_frequency"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_19:
    if ((has & 0x10) == 0) {
      goto LABEL_20;
    }
    goto LABEL_36;
  }
LABEL_35:
  v23 = [NSNumber numberWithUnsignedLongLong:self->_reportFrequencyBase];
  [v3 setObject:v23 forKey:@"report_frequency_base"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_20:
    if ((has & 0x20) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_36:
  v24 = [NSNumber numberWithBool:self->_reportTransportAllowExpensiveAccess];
  [v3 setObject:v24 forKey:@"report_transport_allow_expensive_access"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_21:
    v13 = [NSNumber numberWithBool:self->_reportTransportAllowPowerNapScheduling];
    [v3 setObject:v13 forKey:@"report_transport_allow_power_nap_scheduling"];
  }
LABEL_22:
  reportTransportSourceApplicationBundleIdentifier = self->_reportTransportSourceApplicationBundleIdentifier;
  if (reportTransportSourceApplicationBundleIdentifier) {
    [v3 setObject:reportTransportSourceApplicationBundleIdentifier forKey:@"report_transport_source_application_bundle_identifier"];
  }
  reportTransportSourceApplicationSecondaryIdentifier = self->_reportTransportSourceApplicationSecondaryIdentifier;
  if (reportTransportSourceApplicationSecondaryIdentifier) {
    [v3 setObject:reportTransportSourceApplicationSecondaryIdentifier forKey:@"report_transport_source_application_secondary_identifier"];
  }
  networkEvent = self->_networkEvent;
  if (networkEvent)
  {
    v17 = [(C2MPNetworkEvent *)networkEvent dictionaryRepresentation];
    [v3 setObject:v17 forKey:@"network_event"];
  }
  genericEvent = self->_genericEvent;
  if (genericEvent)
  {
    v19 = [(C2MPGenericEvent *)genericEvent dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"generic_event"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return C2MPMetricReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_deviceInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_cloudkitInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_serverInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_14:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_15:
  if (self->_reportTransportSourceApplicationBundleIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_reportTransportSourceApplicationSecondaryIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_networkEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_genericEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v4[14] = self->_metricType;
    *((unsigned char *)v4 + 100) |= 8u;
  }
  id v6 = v4;
  if (self->_deviceInfo)
  {
    objc_msgSend(v4, "setDeviceInfo:");
    id v4 = v6;
  }
  if (self->_cloudkitInfo)
  {
    objc_msgSend(v6, "setCloudkitInfo:");
    id v4 = v6;
  }
  if (self->_serverInfo)
  {
    objc_msgSend(v6, "setServerInfo:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_triggers;
    *((unsigned char *)v4 + 100) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_11:
      if ((has & 2) == 0) {
        goto LABEL_12;
      }
      goto LABEL_28;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_11;
  }
  *((void *)v4 + 1) = self->_reportFrequency;
  *((unsigned char *)v4 + 100) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((void *)v4 + 2) = self->_reportFrequencyBase;
  *((unsigned char *)v4 + 100) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  *((unsigned char *)v4 + 96) = self->_reportTransportAllowExpensiveAccess;
  *((unsigned char *)v4 + 100) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_14:
    *((unsigned char *)v4 + 97) = self->_reportTransportAllowPowerNapScheduling;
    *((unsigned char *)v4 + 100) |= 0x20u;
  }
LABEL_15:
  if (self->_reportTransportSourceApplicationBundleIdentifier)
  {
    objc_msgSend(v6, "setReportTransportSourceApplicationBundleIdentifier:");
    id v4 = v6;
  }
  if (self->_reportTransportSourceApplicationSecondaryIdentifier)
  {
    objc_msgSend(v6, "setReportTransportSourceApplicationSecondaryIdentifier:");
    id v4 = v6;
  }
  if (self->_networkEvent)
  {
    objc_msgSend(v6, "setNetworkEvent:");
    id v4 = v6;
  }
  if (self->_genericEvent)
  {
    objc_msgSend(v6, "setGenericEvent:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_metricType;
    *(unsigned char *)(v5 + 100) |= 8u;
  }
  id v7 = [(C2MPDeviceInfo *)self->_deviceInfo copyWithZone:a3];
  objc_super v8 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v7;

  id v9 = [(C2MPCloudKitInfo *)self->_cloudkitInfo copyWithZone:a3];
  v10 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v9;

  id v11 = [(C2MPServerInfo *)self->_serverInfo copyWithZone:a3];
  v12 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v11;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(void *)(v6 + 24) = self->_triggers;
    *(unsigned char *)(v6 + 100) |= 4u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(void *)(v6 + 8) = self->_reportFrequency;
  *(unsigned char *)(v6 + 100) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    *(unsigned char *)(v6 + 96) = self->_reportTransportAllowExpensiveAccess;
    *(unsigned char *)(v6 + 100) |= 0x10u;
    if ((*(unsigned char *)&self->_has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_12:
  *(void *)(v6 + 16) = self->_reportFrequencyBase;
  *(unsigned char *)(v6 + 100) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_13;
  }
LABEL_7:
  if ((has & 0x20) != 0)
  {
LABEL_8:
    *(unsigned char *)(v6 + 97) = self->_reportTransportAllowPowerNapScheduling;
    *(unsigned char *)(v6 + 100) |= 0x20u;
  }
LABEL_9:
  uint64_t v14 = [(NSString *)self->_reportTransportSourceApplicationBundleIdentifier copyWithZone:a3];
  v15 = *(void **)(v6 + 72);
  *(void *)(v6 + 72) = v14;

  uint64_t v16 = [(NSString *)self->_reportTransportSourceApplicationSecondaryIdentifier copyWithZone:a3];
  v17 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v16;

  id v18 = [(C2MPNetworkEvent *)self->_networkEvent copyWithZone:a3];
  v19 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v18;

  id v20 = [(C2MPGenericEvent *)self->_genericEvent copyWithZone:a3];
  v21 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v20;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 8) == 0 || self->_metricType != *((_DWORD *)v4 + 14)) {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 8) != 0)
  {
    goto LABEL_52;
  }
  deviceInfo = self->_deviceInfo;
  if ((unint64_t)deviceInfo | *((void *)v4 + 5) && !-[C2MPDeviceInfo isEqual:](deviceInfo, "isEqual:")) {
    goto LABEL_52;
  }
  cloudkitInfo = self->_cloudkitInfo;
  if ((unint64_t)cloudkitInfo | *((void *)v4 + 4))
  {
    if (!-[C2MPCloudKitInfo isEqual:](cloudkitInfo, "isEqual:")) {
      goto LABEL_52;
    }
  }
  serverInfo = self->_serverInfo;
  if ((unint64_t)serverInfo | *((void *)v4 + 11))
  {
    if (!-[C2MPServerInfo isEqual:](serverInfo, "isEqual:")) {
      goto LABEL_52;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 4) == 0 || self->_triggers != *((void *)v4 + 3)) {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 4) != 0)
  {
    goto LABEL_52;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 100) & 1) == 0 || self->_reportFrequency != *((void *)v4 + 1)) {
      goto LABEL_52;
    }
  }
  else if (*((unsigned char *)v4 + 100))
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 2) == 0 || self->_reportFrequencyBase != *((void *)v4 + 2)) {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 2) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x10) == 0) {
      goto LABEL_52;
    }
    if (self->_reportTransportAllowExpensiveAccess)
    {
      if (!*((unsigned char *)v4 + 96)) {
        goto LABEL_52;
      }
    }
    else if (*((unsigned char *)v4 + 96))
    {
      goto LABEL_52;
    }
  }
  else if ((*((unsigned char *)v4 + 100) & 0x10) != 0)
  {
    goto LABEL_52;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 100) & 0x20) != 0)
    {
      if (self->_reportTransportAllowPowerNapScheduling)
      {
        if (!*((unsigned char *)v4 + 97)) {
          goto LABEL_52;
        }
        goto LABEL_44;
      }
      if (!*((unsigned char *)v4 + 97)) {
        goto LABEL_44;
      }
    }
LABEL_52:
    char v12 = 0;
    goto LABEL_53;
  }
  if ((*((unsigned char *)v4 + 100) & 0x20) != 0) {
    goto LABEL_52;
  }
LABEL_44:
  reportTransportSourceApplicationBundleIdentifier = self->_reportTransportSourceApplicationBundleIdentifier;
  if ((unint64_t)reportTransportSourceApplicationBundleIdentifier | *((void *)v4 + 9)
    && !-[NSString isEqual:](reportTransportSourceApplicationBundleIdentifier, "isEqual:"))
  {
    goto LABEL_52;
  }
  reportTransportSourceApplicationSecondaryIdentifier = self->_reportTransportSourceApplicationSecondaryIdentifier;
  if ((unint64_t)reportTransportSourceApplicationSecondaryIdentifier | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](reportTransportSourceApplicationSecondaryIdentifier, "isEqual:")) {
      goto LABEL_52;
    }
  }
  networkEvent = self->_networkEvent;
  if ((unint64_t)networkEvent | *((void *)v4 + 8))
  {
    if (!-[C2MPNetworkEvent isEqual:](networkEvent, "isEqual:")) {
      goto LABEL_52;
    }
  }
  genericEvent = self->_genericEvent;
  if ((unint64_t)genericEvent | *((void *)v4 + 6)) {
    char v12 = -[C2MPGenericEvent isEqual:](genericEvent, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_53:

  return v12;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v3 = 2654435761 * self->_metricType;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(C2MPDeviceInfo *)self->_deviceInfo hash];
  unint64_t v5 = [(C2MPCloudKitInfo *)self->_cloudkitInfo hash];
  unint64_t v6 = [(C2MPServerInfo *)self->_serverInfo hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unint64_t v7 = 2654435761u * self->_triggers;
    if (*(unsigned char *)&self->_has)
    {
LABEL_6:
      unint64_t v8 = 2654435761u * self->_reportFrequency;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
  }
  unint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_7:
    unint64_t v9 = 2654435761u * self->_reportFrequencyBase;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v10 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v11 = 0;
    goto LABEL_15;
  }
LABEL_12:
  unint64_t v9 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v10 = 2654435761 * self->_reportTransportAllowExpensiveAccess;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v11 = 2654435761 * self->_reportTransportAllowPowerNapScheduling;
LABEL_15:
  unint64_t v12 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v13 = v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(NSString *)self->_reportTransportSourceApplicationBundleIdentifier hash];
  NSUInteger v14 = v12 ^ v13 ^ [(NSString *)self->_reportTransportSourceApplicationSecondaryIdentifier hash];
  unint64_t v15 = [(C2MPNetworkEvent *)self->_networkEvent hash];
  return v14 ^ v15 ^ [(C2MPGenericEvent *)self->_genericEvent hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  unint64_t v5 = v4;
  if ((v4[25] & 8) != 0)
  {
    self->_int metricType = v4[14];
    *(unsigned char *)&self->_has |= 8u;
  }
  deviceInfo = self->_deviceInfo;
  uint64_t v7 = *((void *)v5 + 5);
  v17 = v5;
  if (deviceInfo)
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[C2MPDeviceInfo mergeFrom:](deviceInfo, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    -[C2MPMetric setDeviceInfo:](self, "setDeviceInfo:");
  }
  unint64_t v5 = v17;
LABEL_9:
  cloudkitInfo = self->_cloudkitInfo;
  uint64_t v9 = *((void *)v5 + 4);
  if (cloudkitInfo)
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[C2MPCloudKitInfo mergeFrom:](cloudkitInfo, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    -[C2MPMetric setCloudkitInfo:](self, "setCloudkitInfo:");
  }
  unint64_t v5 = v17;
LABEL_15:
  serverInfo = self->_serverInfo;
  uint64_t v11 = *((void *)v5 + 11);
  if (serverInfo)
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[C2MPServerInfo mergeFrom:](serverInfo, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    -[C2MPMetric setServerInfo:](self, "setServerInfo:");
  }
  unint64_t v5 = v17;
LABEL_21:
  char v12 = *((unsigned char *)v5 + 100);
  if ((v12 & 4) != 0)
  {
    self->_triggers = *((void *)v5 + 3);
    *(unsigned char *)&self->_has |= 4u;
    char v12 = *((unsigned char *)v5 + 100);
    if ((v12 & 1) == 0)
    {
LABEL_23:
      if ((v12 & 2) == 0) {
        goto LABEL_24;
      }
      goto LABEL_36;
    }
  }
  else if ((v5[25] & 1) == 0)
  {
    goto LABEL_23;
  }
  self->_reportFrequency = *((void *)v5 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v12 = *((unsigned char *)v5 + 100);
  if ((v12 & 2) == 0)
  {
LABEL_24:
    if ((v12 & 0x10) == 0) {
      goto LABEL_25;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_reportFrequencyBase = *((void *)v5 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v12 = *((unsigned char *)v5 + 100);
  if ((v12 & 0x10) == 0)
  {
LABEL_25:
    if ((v12 & 0x20) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_37:
  self->_reportTransportAllowExpensiveAccess = *((unsigned char *)v5 + 96);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((v5[25] & 0x20) != 0)
  {
LABEL_26:
    self->_reportTransportAllowPowerNapScheduling = *((unsigned char *)v5 + 97);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_27:
  if (*((void *)v5 + 9))
  {
    -[C2MPMetric setReportTransportSourceApplicationBundleIdentifier:](self, "setReportTransportSourceApplicationBundleIdentifier:");
    unint64_t v5 = v17;
  }
  if (*((void *)v5 + 10))
  {
    -[C2MPMetric setReportTransportSourceApplicationSecondaryIdentifier:](self, "setReportTransportSourceApplicationSecondaryIdentifier:");
    unint64_t v5 = v17;
  }
  networkEvent = self->_networkEvent;
  uint64_t v14 = *((void *)v5 + 8);
  if (networkEvent)
  {
    if (!v14) {
      goto LABEL_42;
    }
    -[C2MPNetworkEvent mergeFrom:](networkEvent, "mergeFrom:");
  }
  else
  {
    if (!v14) {
      goto LABEL_42;
    }
    -[C2MPMetric setNetworkEvent:](self, "setNetworkEvent:");
  }
  unint64_t v5 = v17;
LABEL_42:
  genericEvent = self->_genericEvent;
  uint64_t v16 = *((void *)v5 + 6);
  if (genericEvent)
  {
    if (v16) {
      -[C2MPGenericEvent mergeFrom:](genericEvent, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[C2MPMetric setGenericEvent:](self, "setGenericEvent:");
  }
  MEMORY[0x1F41817F8]();
}

- (C2MPServerInfo)serverInfo
{
  return self->_serverInfo;
}

- (void)setServerInfo:(id)a3
{
}

- (unint64_t)triggers
{
  return self->_triggers;
}

- (unint64_t)reportFrequency
{
  return self->_reportFrequency;
}

- (unint64_t)reportFrequencyBase
{
  return self->_reportFrequencyBase;
}

- (BOOL)reportTransportAllowExpensiveAccess
{
  return self->_reportTransportAllowExpensiveAccess;
}

- (BOOL)reportTransportAllowPowerNapScheduling
{
  return self->_reportTransportAllowPowerNapScheduling;
}

- (NSString)reportTransportSourceApplicationBundleIdentifier
{
  return self->_reportTransportSourceApplicationBundleIdentifier;
}

- (NSString)reportTransportSourceApplicationSecondaryIdentifier
{
  return self->_reportTransportSourceApplicationSecondaryIdentifier;
}

@end