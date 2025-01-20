@interface AWDBarcodeSupportCodeActivatedEvent
- (BOOL)hasAppLinkActivationOpenStrategy;
- (BOOL)hasBarcodeDataType;
- (BOOL)hasBarcodeSourceType;
- (BOOL)hasBarcodeURLType;
- (BOOL)hasClientType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)appLinkActivationOpenStrategyAsString:(int)a3;
- (id)barcodeDataTypeAsString:(int)a3;
- (id)barcodeSourceTypeAsString:(int)a3;
- (id)barcodeURLTypeAsString:(int)a3;
- (id)clientTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAppLinkActivationOpenStrategy:(id)a3;
- (int)StringAsBarcodeDataType:(id)a3;
- (int)StringAsBarcodeSourceType:(id)a3;
- (int)StringAsBarcodeURLType:(id)a3;
- (int)StringAsClientType:(id)a3;
- (int)appLinkActivationOpenStrategy;
- (int)barcodeDataType;
- (int)barcodeSourceType;
- (int)barcodeURLType;
- (int)clientType;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppLinkActivationOpenStrategy:(int)a3;
- (void)setBarcodeDataType:(int)a3;
- (void)setBarcodeSourceType:(int)a3;
- (void)setBarcodeURLType:(int)a3;
- (void)setClientType:(int)a3;
- (void)setHasAppLinkActivationOpenStrategy:(BOOL)a3;
- (void)setHasBarcodeDataType:(BOOL)a3;
- (void)setHasBarcodeSourceType:(BOOL)a3;
- (void)setHasBarcodeURLType:(BOOL)a3;
- (void)setHasClientType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDBarcodeSupportCodeActivatedEvent

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)clientType
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_clientType;
  }
  else {
    return 0;
  }
}

- (void)setClientType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_clientType = a3;
}

- (void)setHasClientType:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasClientType
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
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
    char v3 = off_26468AC00[a3];
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
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_barcodeDataType;
  }
  else {
    return 0;
  }
}

- (void)setBarcodeDataType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_barcodeDataType = a3;
}

- (void)setHasBarcodeDataType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasBarcodeDataType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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
    char v3 = off_26468AC18[a3];
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

- (int)barcodeURLType
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_barcodeURLType;
  }
  else {
    return 0;
  }
}

- (void)setBarcodeURLType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_barcodeURLType = a3;
}

- (void)setHasBarcodeURLType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBarcodeURLType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
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
    char v3 = off_26468AC78[a3];
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

- (int)appLinkActivationOpenStrategy
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_appLinkActivationOpenStrategy;
  }
  else {
    return 0;
  }
}

- (void)setAppLinkActivationOpenStrategy:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_appLinkActivationOpenStrategy = a3;
}

- (void)setHasAppLinkActivationOpenStrategy:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAppLinkActivationOpenStrategy
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)appLinkActivationOpenStrategyAsString:(int)a3
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

- (int)StringAsAppLinkActivationOpenStrategy:(id)a3
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
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_barcodeSourceType;
  }
  else {
    return 1;
  }
}

- (void)setBarcodeSourceType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_barcodeSourceType = a3;
}

- (void)setHasBarcodeSourceType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBarcodeSourceType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
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
  v8.super_class = (Class)AWDBarcodeSupportCodeActivatedEvent;
  int v4 = [(AWDBarcodeSupportCodeActivatedEvent *)&v8 description];
  v5 = [(AWDBarcodeSupportCodeActivatedEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v5 forKey:@"timestamp"];

    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
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
    v7 = off_26468AC00[clientType];
  }
  [v3 setObject:v7 forKey:@"clientType"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_13:
  uint64_t barcodeDataType = self->_barcodeDataType;
  if (barcodeDataType >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_barcodeDataType);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_26468AC18[barcodeDataType];
  }
  [v3 setObject:v9 forKey:@"barcodeDataType"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
LABEL_21:
    int appLinkActivationOpenStrategy = self->_appLinkActivationOpenStrategy;
    if (appLinkActivationOpenStrategy)
    {
      if (appLinkActivationOpenStrategy == 1)
      {
        v13 = @"BARCODEAPPLINKOPENSTRATEGY_OPEN_IN_APP";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_appLinkActivationOpenStrategy);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v13 = @"BARCODEAPPLINKOPENSTRATEGY_OPEN_IN_SAFARI";
    }
    [v3 setObject:v13 forKey:@"appLinkActivationOpenStrategy"];

    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_33;
    }
    goto LABEL_27;
  }
LABEL_17:
  uint64_t barcodeURLType = self->_barcodeURLType;
  if (barcodeURLType >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_barcodeURLType);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_26468AC78[barcodeURLType];
  }
  [v3 setObject:v11 forKey:@"barcodeURLType"];

  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_21;
  }
LABEL_6:
  if ((has & 8) != 0)
  {
LABEL_27:
    int barcodeSourceType = self->_barcodeSourceType;
    if (barcodeSourceType == 1)
    {
      v15 = @"BARCODESOURCETYPE_QR";
    }
    else if (barcodeSourceType == 2)
    {
      v15 = @"BARCODESOURCETYPE_OTHER";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_barcodeSourceType);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    [v3 setObject:v15 forKey:@"barcodeSourceType"];
  }
LABEL_33:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDBarcodeSupportCodeActivatedEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_7:
  }
    PBDataWriterWriteInt32Field();
LABEL_8:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v4 + 8) = self->_clientType;
  *((unsigned char *)v4 + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)v4 + 5) = self->_barcodeDataType;
  *((unsigned char *)v4 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((_DWORD *)v4 + 7) = self->_barcodeURLType;
  *((unsigned char *)v4 + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((_DWORD *)v4 + 4) = self->_appLinkActivationOpenStrategy;
  *((unsigned char *)v4 + 36) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 6) = self->_barcodeSourceType;
    *((unsigned char *)v4 + 36) |= 8u;
  }
LABEL_8:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_timestamp;
    *((unsigned char *)result + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x20) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 8) = self->_clientType;
  *((unsigned char *)result + 36) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  *((_DWORD *)result + 5) = self->_barcodeDataType;
  *((unsigned char *)result + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((_DWORD *)result + 7) = self->_barcodeURLType;
  *((unsigned char *)result + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      return result;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((_DWORD *)result + 4) = self->_appLinkActivationOpenStrategy;
  *((unsigned char *)result + 36) |= 2u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return result;
  }
LABEL_7:
  *((_DWORD *)result + 6) = self->_barcodeSourceType;
  *((unsigned char *)result + 36) |= 8u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_31;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
LABEL_31:
    BOOL v5 = 0;
    goto LABEL_32;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x20) == 0 || self->_clientType != *((_DWORD *)v4 + 8)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x20) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_barcodeDataType != *((_DWORD *)v4 + 5)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0 || self->_barcodeURLType != *((_DWORD *)v4 + 7)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_appLinkActivationOpenStrategy != *((_DWORD *)v4 + 4)) {
      goto LABEL_31;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_31;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_barcodeSourceType != *((_DWORD *)v4 + 6)) {
      goto LABEL_31;
    }
    BOOL v5 = 1;
  }
LABEL_32:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x20) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_clientType;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_barcodeDataType;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v5 = 2654435761 * self->_barcodeURLType;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_13:
    uint64_t v7 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
  }
LABEL_11:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_appLinkActivationOpenStrategy;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_barcodeSourceType;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if (v5)
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_uint64_t clientType = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_uint64_t barcodeDataType = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_uint64_t barcodeURLType = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_int appLinkActivationOpenStrategy = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
LABEL_7:
    self->_int barcodeSourceType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_8:
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end