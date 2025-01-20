@interface AWDBarcodeSupportCodeDetectedEvent
- (BOOL)hasAppLinkPreferredOpenStrategy;
- (BOOL)hasBarcodeDataType;
- (BOOL)hasBarcodeSourceType;
- (BOOL)hasBarcodeURLType;
- (BOOL)hasClientType;
- (BOOL)hasDetectionTimeMs;
- (BOOL)hasInvalidBarcodeDataType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)appLinkPreferredOpenStrategyAsString:(int)a3;
- (id)barcodeDataTypeAsString:(int)a3;
- (id)barcodeSourceTypeAsString:(int)a3;
- (id)barcodeURLTypeAsString:(int)a3;
- (id)clientTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)invalidBarcodeDataTypeAsString:(int)a3;
- (int)StringAsAppLinkPreferredOpenStrategy:(id)a3;
- (int)StringAsBarcodeDataType:(id)a3;
- (int)StringAsBarcodeSourceType:(id)a3;
- (int)StringAsBarcodeURLType:(id)a3;
- (int)StringAsClientType:(id)a3;
- (int)StringAsInvalidBarcodeDataType:(id)a3;
- (int)appLinkPreferredOpenStrategy;
- (int)barcodeDataType;
- (int)barcodeSourceType;
- (int)barcodeURLType;
- (int)clientType;
- (int)invalidBarcodeDataType;
- (unint64_t)detectionTimeMs;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppLinkPreferredOpenStrategy:(int)a3;
- (void)setBarcodeDataType:(int)a3;
- (void)setBarcodeSourceType:(int)a3;
- (void)setBarcodeURLType:(int)a3;
- (void)setClientType:(int)a3;
- (void)setDetectionTimeMs:(unint64_t)a3;
- (void)setHasAppLinkPreferredOpenStrategy:(BOOL)a3;
- (void)setHasBarcodeDataType:(BOOL)a3;
- (void)setHasBarcodeSourceType:(BOOL)a3;
- (void)setHasBarcodeURLType:(BOOL)a3;
- (void)setHasClientType:(BOOL)a3;
- (void)setHasDetectionTimeMs:(BOOL)a3;
- (void)setHasInvalidBarcodeDataType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInvalidBarcodeDataType:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDBarcodeSupportCodeDetectedEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)clientType
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_clientType;
  }
  else {
    return 0;
  }
}

- (void)setClientType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_clientType = a3;
}

- (void)setHasClientType:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasClientType
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)clientTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26468AD20[a3];
  }
  return v3;
}

- (int)StringAsClientType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BARCODECLIENTTYPE_OTHER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BARCODECLIENTTYPE_NOTIFICATION_SERVICE"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BARCODECLIENTTYPE_SAFARI"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)barcodeDataType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_barcodeDataType;
  }
  else {
    return 0;
  }
}

- (void)setBarcodeDataType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_barcodeDataType = a3;
}

- (void)setHasBarcodeDataType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBarcodeDataType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)barcodeDataTypeAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26468AD38[a3];
  }
  return v3;
}

- (int)StringAsBarcodeDataType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BARCODEDATATYPE_INVALID"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BARCODEDATATYPE_URL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BARCODEDATATYPE_CONTACT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"BARCODEDATATYPE_EMAIL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"BARCODEDATATYPE_TELEPHONE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"BARCODEDATATYPE_MESSAGE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"BARCODEDATATYPE_LOCATION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"BARCODEDATATYPE_EVENT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"BARCODEDATATYPE_WIFI"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"BARCODEDATATYPE_HOMEKIT_URL"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"BARCODEDATATYPE_STRING"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"BARCODEDATATYPE_OTHER"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setDetectionTimeMs:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_detectionTimeMs = a3;
}

- (void)setHasDetectionTimeMs:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDetectionTimeMs
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)invalidBarcodeDataType
{
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    return self->_invalidBarcodeDataType;
  }
  else {
    return 0;
  }
}

- (void)setInvalidBarcodeDataType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_invalidBarcodeDataType = a3;
}

- (void)setHasInvalidBarcodeDataType:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasInvalidBarcodeDataType
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)invalidBarcodeDataTypeAsString:(int)a3
{
  if (a3 >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26468AD98[a3];
  }
  return v3;
}

- (int)StringAsInvalidBarcodeDataType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"INVALIDBARCODEDATATYPE_OTHER"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"INVALIDBARCODEDATATYPE_URL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"INVALIDBARCODEDATATYPE_CONTACT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"INVALIDBARCODEDATATYPE_EMAIL"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"INVALIDBARCODEDATATYPE_TELEPHONE"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"INVALIDBARCODEDATATYPE_MESSAGE"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"INVALIDBARCODEDATATYPE_LOCATION"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"INVALIDBARCODEDATATYPE_EVENT"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"INVALIDBARCODEDATATYPE_WIFI"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"INVALIDBARCODEDATATYPE_HOMEKIT_URL"])
  {
    int v4 = 9;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)barcodeURLType
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_barcodeURLType;
  }
  else {
    return 0;
  }
}

- (void)setBarcodeURLType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_barcodeURLType = a3;
}

- (void)setHasBarcodeURLType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasBarcodeURLType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)barcodeURLTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26468ADE8[a3];
  }
  return v3;
}

- (int)StringAsBarcodeURLType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BARCODEURLTYPE_NON_APPLINK"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"BARCODEURLTYPE_SINGLE_APPLINK"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"BARCODEURLTYPE_MULTIPLE_APPLINKS"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (int)appLinkPreferredOpenStrategy
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_appLinkPreferredOpenStrategy;
  }
  else {
    return 0;
  }
}

- (void)setAppLinkPreferredOpenStrategy:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_appLinkPreferredOpenStrategy = a3;
}

- (void)setHasAppLinkPreferredOpenStrategy:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAppLinkPreferredOpenStrategy
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)appLinkPreferredOpenStrategyAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      int v4 = @"BARCODEAPPLINKOPENSTRATEGY_OPEN_IN_APP";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    int v4 = @"BARCODEAPPLINKOPENSTRATEGY_OPEN_IN_SAFARI";
  }
  return v4;
}

- (int)StringAsAppLinkPreferredOpenStrategy:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BARCODEAPPLINKOPENSTRATEGY_OPEN_IN_SAFARI"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"BARCODEAPPLINKOPENSTRATEGY_OPEN_IN_APP"];
  }

  return v4;
}

- (int)barcodeSourceType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_barcodeSourceType;
  }
  else {
    return 1;
  }
}

- (void)setBarcodeSourceType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_barcodeSourceType = a3;
}

- (void)setHasBarcodeSourceType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBarcodeSourceType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (id)barcodeSourceTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    int v4 = @"BARCODESOURCETYPE_QR";
  }
  else if (a3 == 2)
  {
    int v4 = @"BARCODESOURCETYPE_OTHER";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    int v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsBarcodeSourceType:(id)a3
{
  id v3 = a3;
  int v4 = 1;
  if (([v3 isEqualToString:@"BARCODESOURCETYPE_QR"] & 1) == 0)
  {
    if ([v3 isEqualToString:@"BARCODESOURCETYPE_OTHER"]) {
      int v4 = 2;
    }
    else {
      int v4 = 1;
    }
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDBarcodeSupportCodeDetectedEvent;
  int v4 = [(AWDBarcodeSupportCodeDetectedEvent *)&v8 description];
  v5 = [(AWDBarcodeSupportCodeDetectedEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  uint64_t clientType = self->_clientType;
  if (clientType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_clientType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_26468AD20[clientType];
  }
  [v3 setObject:v7 forKey:@"clientType"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_15:
  uint64_t barcodeDataType = self->_barcodeDataType;
  if (barcodeDataType >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_barcodeDataType);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_26468AD38[barcodeDataType];
  }
  [v3 setObject:v9 forKey:@"barcodeDataType"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  v10 = [NSNumber numberWithUnsignedLongLong:self->_detectionTimeMs];
  [v3 setObject:v10 forKey:@"detection_time_ms"];

  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_20:
  uint64_t invalidBarcodeDataType = self->_invalidBarcodeDataType;
  if (invalidBarcodeDataType >= 0xA)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_invalidBarcodeDataType);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = off_26468AD98[invalidBarcodeDataType];
  }
  [v3 setObject:v12 forKey:@"invalidBarcodeDataType"];

  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
LABEL_28:
    int appLinkPreferredOpenStrategy = self->_appLinkPreferredOpenStrategy;
    if (appLinkPreferredOpenStrategy)
    {
      if (appLinkPreferredOpenStrategy == 1)
      {
        v16 = @"BARCODEAPPLINKOPENSTRATEGY_OPEN_IN_APP";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_appLinkPreferredOpenStrategy);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v16 = @"BARCODEAPPLINKOPENSTRATEGY_OPEN_IN_SAFARI";
    }
    [v3 setObject:v16 forKey:@"appLinkPreferredOpenStrategy"];

    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_40;
    }
    goto LABEL_34;
  }
LABEL_24:
  uint64_t barcodeURLType = self->_barcodeURLType;
  if (barcodeURLType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_barcodeURLType);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = off_26468ADE8[barcodeURLType];
  }
  [v3 setObject:v14 forKey:@"barcodeURLType"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_28;
  }
LABEL_8:
  if ((has & 0x10) != 0)
  {
LABEL_34:
    int barcodeSourceType = self->_barcodeSourceType;
    if (barcodeSourceType == 1)
    {
      v18 = @"BARCODESOURCETYPE_QR";
    }
    else if (barcodeSourceType == 2)
    {
      v18 = @"BARCODESOURCETYPE_OTHER";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_barcodeSourceType);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v18 forKey:@"barcodeSourceType"];
  }
LABEL_40:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDBarcodeSupportCodeDetectedEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_9:
  }
    PBDataWriterWriteInt32Field();
LABEL_10:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_timestamp;
    *((unsigned char *)v4 + 48) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 10) = self->_clientType;
  *((unsigned char *)v4 + 48) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)v4 + 7) = self->_barcodeDataType;
  *((unsigned char *)v4 + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v4[1] = self->_detectionTimeMs;
  *((unsigned char *)v4 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((_DWORD *)v4 + 11) = self->_invalidBarcodeDataType;
  *((unsigned char *)v4 + 48) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)v4 + 9) = self->_barcodeURLType;
  *((unsigned char *)v4 + 48) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  *((_DWORD *)v4 + 6) = self->_appLinkPreferredOpenStrategy;
  *((unsigned char *)v4 + 48) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 8) = self->_barcodeSourceType;
    *((unsigned char *)v4 + 48) |= 0x10u;
  }
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_timestamp;
    *((unsigned char *)result + 48) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 10) = self->_clientType;
  *((unsigned char *)result + 48) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)result + 7) = self->_barcodeDataType;
  *((unsigned char *)result + 48) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 1) = self->_detectionTimeMs;
  *((unsigned char *)result + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((_DWORD *)result + 11) = self->_invalidBarcodeDataType;
  *((unsigned char *)result + 48) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)result + 9) = self->_barcodeURLType;
  *((unsigned char *)result + 48) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 6) = self->_appLinkPreferredOpenStrategy;
  *((unsigned char *)result + 48) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    return result;
  }
LABEL_9:
  *((_DWORD *)result + 8) = self->_barcodeSourceType;
  *((unsigned char *)result + 48) |= 0x10u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_timestamp != *((void *)v4 + 2)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x40) == 0 || self->_clientType != *((_DWORD *)v4 + 10)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x40) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_barcodeDataType != *((_DWORD *)v4 + 7)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_41;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_detectionTimeMs != *((void *)v4 + 1)) {
      goto LABEL_41;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x80) == 0 || self->_invalidBarcodeDataType != *((_DWORD *)v4 + 11)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x80) != 0)
  {
LABEL_41:
    BOOL v5 = 0;
    goto LABEL_42;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x20) == 0 || self->_barcodeURLType != *((_DWORD *)v4 + 9)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x20) != 0)
  {
    goto LABEL_41;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_appLinkPreferredOpenStrategy != *((_DWORD *)v4 + 6)) {
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_41;
  }
  BOOL v5 = (*((unsigned char *)v4 + 48) & 0x10) == 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x10) == 0 || self->_barcodeSourceType != *((_DWORD *)v4 + 8)) {
      goto LABEL_41;
    }
    BOOL v5 = 1;
  }
LABEL_42:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_clientType;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_barcodeDataType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v4 = 0;
  if (*(unsigned char *)&self->_has)
  {
LABEL_5:
    unint64_t v5 = 2654435761u * self->_detectionTimeMs;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v6 = 2654435761 * self->_invalidBarcodeDataType;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_barcodeURLType;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v9 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_15:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_appLinkPreferredOpenStrategy;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_barcodeSourceType;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t clientType = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_uint64_t barcodeDataType = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_detectionTimeMs = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_uint64_t invalidBarcodeDataType = *((_DWORD *)v4 + 11);
  *(unsigned char *)&self->_has |= 0x80u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_uint64_t barcodeURLType = *((_DWORD *)v4 + 9);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  self->_int appLinkPreferredOpenStrategy = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 48) & 0x10) != 0)
  {
LABEL_9:
    self->_int barcodeSourceType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_10:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)detectionTimeMs
{
  return self->_detectionTimeMs;
}

@end