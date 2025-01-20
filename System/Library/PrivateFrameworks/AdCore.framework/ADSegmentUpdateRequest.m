@interface ADSegmentUpdateRequest
+ (id)options;
- (BOOL)hasAdvertisingIdentifier;
- (BOOL)hasAdvertisingIdentifierMonthResetCount;
- (BOOL)hasDPID;
- (BOOL)hasIAdID;
- (BOOL)hasITunesRefreshTime;
- (BOOL)hasIsFirstPartyIdentifier;
- (BOOL)hasLocaleIdentifier;
- (BOOL)hasOsVersionAndBuild;
- (BOOL)hasSegmentInfo;
- (BOOL)hasTimezone;
- (BOOL)hasUpdateSentTime;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstPartyIdentifier;
- (BOOL)readFrom:(id)a3;
- (NSData)dPID;
- (NSData)iAdID;
- (NSString)advertisingIdentifier;
- (NSString)localeIdentifier;
- (NSString)osVersionAndBuild;
- (NSString)segmentInfo;
- (double)iTunesRefreshTime;
- (double)updateSentTime;
- (float)timezone;
- (id)accountStatesAsString:(int)a3;
- (id)accountTypesAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)deviceModesAsString:(int)a3;
- (id)dictionaryRepresentation;
- (int)StringAsAccountStates:(id)a3;
- (int)StringAsAccountTypes:(id)a3;
- (int)StringAsDeviceModes:(id)a3;
- (int)accountStateAtIndex:(unint64_t)a3;
- (int)accountStates;
- (int)accountTypeAtIndex:(unint64_t)a3;
- (int)accountTypes;
- (int)advertisingIdentifierMonthResetCount;
- (int)deviceModeAtIndex:(unint64_t)a3;
- (int)deviceModes;
- (unint64_t)accountStatesCount;
- (unint64_t)accountTypesCount;
- (unint64_t)deviceModesCount;
- (unint64_t)hash;
- (void)addAccountState:(int)a3;
- (void)addAccountType:(int)a3;
- (void)addDeviceMode:(int)a3;
- (void)clearAccountStates;
- (void)clearAccountTypes;
- (void)clearDeviceModes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccountStates:(int *)a3 count:(unint64_t)a4;
- (void)setAccountTypes:(int *)a3 count:(unint64_t)a4;
- (void)setAdvertisingIdentifier:(id)a3;
- (void)setAdvertisingIdentifierMonthResetCount:(int)a3;
- (void)setDPID:(id)a3;
- (void)setDeviceModes:(int *)a3 count:(unint64_t)a4;
- (void)setHasAdvertisingIdentifierMonthResetCount:(BOOL)a3;
- (void)setHasITunesRefreshTime:(BOOL)a3;
- (void)setHasIsFirstPartyIdentifier:(BOOL)a3;
- (void)setHasTimezone:(BOOL)a3;
- (void)setHasUpdateSentTime:(BOOL)a3;
- (void)setIAdID:(id)a3;
- (void)setITunesRefreshTime:(double)a3;
- (void)setIsFirstPartyIdentifier:(BOOL)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setOsVersionAndBuild:(id)a3;
- (void)setSegmentInfo:(id)a3;
- (void)setTimezone:(float)a3;
- (void)setUpdateSentTime:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation ADSegmentUpdateRequest

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)ADSegmentUpdateRequest;
  [(ADSegmentUpdateRequest *)&v3 dealloc];
}

+ (id)options
{
  if (options_once_6 != -1) {
    dispatch_once(&options_once_6, &__block_literal_global_11);
  }
  v2 = (void *)options_sOptions_6;
  return v2;
}

void __33__ADSegmentUpdateRequest_options__block_invoke()
{
  v0 = (void *)options_sOptions_6;
  options_sOptions_6 = (uint64_t)&unk_1F2715528;
}

- (BOOL)hasIAdID
{
  return self->_iAdID != 0;
}

- (BOOL)hasSegmentInfo
{
  return self->_segmentInfo != 0;
}

- (void)setIsFirstPartyIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isFirstPartyIdentifier = a3;
}

- (void)setHasIsFirstPartyIdentifier:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsFirstPartyIdentifier
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasAdvertisingIdentifier
{
  return self->_advertisingIdentifier != 0;
}

- (void)setITunesRefreshTime:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_iTunesRefreshTime = a3;
}

- (void)setHasITunesRefreshTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasITunesRefreshTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setUpdateSentTime:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_updateSentTime = a3;
}

- (void)setHasUpdateSentTime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUpdateSentTime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimezone:(float)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timezone = a3;
}

- (void)setHasTimezone:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimezone
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAdvertisingIdentifierMonthResetCount:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_advertisingIdentifierMonthResetCount = a3;
}

- (void)setHasAdvertisingIdentifierMonthResetCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAdvertisingIdentifierMonthResetCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasOsVersionAndBuild
{
  return self->_osVersionAndBuild != 0;
}

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
}

- (BOOL)hasDPID
{
  return self->_dPID != 0;
}

- (unint64_t)deviceModesCount
{
  return self->_deviceModes.count;
}

- (int)deviceModes
{
  return self->_deviceModes.list;
}

- (void)clearDeviceModes
{
}

- (void)addDeviceMode:(int)a3
{
}

- (int)deviceModeAtIndex:(unint64_t)a3
{
  p_deviceModes = &self->_deviceModes;
  unint64_t count = self->_deviceModes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_deviceModes->list[a3];
}

- (void)setDeviceModes:(int *)a3 count:(unint64_t)a4
{
}

- (id)deviceModesAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E68A0A00[a3];
  }
  return v3;
}

- (int)StringAsDeviceModes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Default"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EducationMode"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GuestMode"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)accountTypesCount
{
  return self->_accountTypes.count;
}

- (int)accountTypes
{
  return self->_accountTypes.list;
}

- (void)clearAccountTypes
{
}

- (void)addAccountType:(int)a3
{
}

- (int)accountTypeAtIndex:(unint64_t)a3
{
  p_accountTypes = &self->_accountTypes;
  unint64_t count = self->_accountTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_accountTypes->list[a3];
}

- (void)setAccountTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)accountTypesAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E68A0A18[a3];
  }
  return v3;
}

- (int)StringAsAccountTypes:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NoAccount"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Consumer"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ManagedAccount"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"U13"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"T13"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"U18"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Unknown_Age"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"SensitiveContentEligible"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (unint64_t)accountStatesCount
{
  return self->_accountStates.count;
}

- (int)accountStates
{
  return self->_accountStates.list;
}

- (void)clearAccountStates
{
}

- (void)addAccountState:(int)a3
{
}

- (int)accountStateAtIndex:(unint64_t)a3
{
  p_accountStates = &self->_accountStates;
  unint64_t count = self->_accountStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v7 = *MEMORY[0x1E4F1C4A8];
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_accountStates->list[a3];
}

- (void)setAccountStates:(int *)a3 count:(unint64_t)a4
{
}

- (id)accountStatesAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E68A0A58[a3];
  }
  return v3;
}

- (int)StringAsAccountStates:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"No_iCloud"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Same_iCloud"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Diff_iCloud"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ADSegmentUpdateRequest;
  int v4 = [(ADSegmentUpdateRequest *)&v8 description];
  v5 = [(ADSegmentUpdateRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v3;
  iAdID = self->_iAdID;
  if (iAdID) {
    [v3 setObject:iAdID forKey:@"iAdID"];
  }
  segmentInfo = self->_segmentInfo;
  if (segmentInfo) {
    [v5 setObject:segmentInfo forKey:@"segmentInfo"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    objc_super v8 = [NSNumber numberWithBool:self->_isFirstPartyIdentifier];
    [v5 setObject:v8 forKey:@"isFirstPartyIdentifier"];
  }
  advertisingIdentifier = self->_advertisingIdentifier;
  if (advertisingIdentifier) {
    [v5 setObject:advertisingIdentifier forKey:@"advertisingIdentifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v31 = [NSNumber numberWithDouble:self->_iTunesRefreshTime];
    [v5 setObject:v31 forKey:@"iTunesRefreshTime"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_49;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  v32 = [NSNumber numberWithDouble:self->_updateSentTime];
  [v5 setObject:v32 forKey:@"updateSentTime"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_49:
  *(float *)&double v4 = self->_timezone;
  v33 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v33 forKey:@"timezone"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_13:
    v11 = [NSNumber numberWithInt:self->_advertisingIdentifierMonthResetCount];
    [v5 setObject:v11 forKey:@"advertisingIdentifierMonthResetCount"];
  }
LABEL_14:
  osVersionAndBuild = self->_osVersionAndBuild;
  if (osVersionAndBuild) {
    [v5 setObject:osVersionAndBuild forKey:@"osVersionAndBuild"];
  }
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier) {
    [v5 setObject:localeIdentifier forKey:@"localeIdentifier"];
  }
  dPID = self->_dPID;
  if (dPID) {
    [v5 setObject:dPID forKey:@"DPID"];
  }
  p_deviceModes = &self->_deviceModes;
  if (self->_deviceModes.count)
  {
    v16 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (self->_deviceModes.count)
    {
      unint64_t v17 = 0;
      do
      {
        uint64_t v18 = p_deviceModes->list[v17];
        if (v18 >= 3)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_deviceModes->list[v17]);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = off_1E68A0A00[v18];
        }
        [v16 addObject:v19];

        ++v17;
      }
      while (v17 < self->_deviceModes.count);
    }
    [v5 setObject:v16 forKey:@"deviceMode"];
  }
  p_accountTypes = &self->_accountTypes;
  if (self->_accountTypes.count)
  {
    v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (self->_accountTypes.count)
    {
      unint64_t v22 = 0;
      do
      {
        uint64_t v23 = p_accountTypes->list[v22];
        if (v23 >= 8)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_accountTypes->list[v22]);
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = off_1E68A0A18[v23];
        }
        [v21 addObject:v24];

        ++v22;
      }
      while (v22 < self->_accountTypes.count);
    }
    [v5 setObject:v21 forKey:@"accountType"];
  }
  p_accountStates = &self->_accountStates;
  if (self->_accountStates.count)
  {
    v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:");
    if (p_accountStates->count)
    {
      unint64_t v27 = 0;
      do
      {
        uint64_t v28 = p_accountStates->list[v27];
        if (v28 >= 3)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", p_accountStates->list[v27]);
          v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = off_1E68A0A58[v28];
        }
        [v26 addObject:v29];

        ++v27;
      }
      while (v27 < p_accountStates->count);
    }
    [v5 setObject:v26 forKey:@"accountState"];
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return ADSegmentUpdateRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_iAdID)
  {
    PBDataWriterWriteDataField();
    id v4 = v10;
  }
  if (self->_segmentInfo)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v10;
  }
  if (self->_advertisingIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v10;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteDoubleField();
  id v4 = v10;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_34:
  PBDataWriterWriteFloatField();
  id v4 = v10;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_13:
    PBDataWriterWriteInt32Field();
    id v4 = v10;
  }
LABEL_14:
  if (self->_osVersionAndBuild)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_localeIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v10;
  }
  if (self->_dPID)
  {
    PBDataWriterWriteDataField();
    id v4 = v10;
  }
  if (self->_deviceModes.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v10;
      ++v6;
    }
    while (v6 < self->_deviceModes.count);
  }
  if (self->_accountTypes.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v10;
      ++v7;
    }
    while (v7 < self->_accountTypes.count);
  }
  p_accountStates = &self->_accountStates;
  if (p_accountStates->count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v10;
      ++v9;
    }
    while (v9 < p_accountStates->count);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (self->_iAdID)
  {
    objc_msgSend(v4, "setIAdID:");
    id v4 = v15;
  }
  if (self->_segmentInfo)
  {
    objc_msgSend(v15, "setSegmentInfo:");
    id v4 = v15;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((unsigned char *)v4 + 156) = self->_isFirstPartyIdentifier;
    *((unsigned char *)v4 + 160) |= 0x10u;
  }
  if (self->_advertisingIdentifier)
  {
    objc_msgSend(v15, "setAdvertisingIdentifier:");
    id v4 = v15;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 10) = *(void *)&self->_iTunesRefreshTime;
    *((unsigned char *)v4 + 160) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_37;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  *((void *)v4 + 11) = *(void *)&self->_updateSentTime;
  *((unsigned char *)v4 + 160) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_37:
  *((_DWORD *)v4 + 38) = LODWORD(self->_timezone);
  *((unsigned char *)v4 + 160) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_13:
    *((_DWORD *)v4 + 26) = self->_advertisingIdentifierMonthResetCount;
    *((unsigned char *)v4 + 160) |= 4u;
  }
LABEL_14:
  if (self->_osVersionAndBuild) {
    objc_msgSend(v15, "setOsVersionAndBuild:");
  }
  if (self->_localeIdentifier) {
    objc_msgSend(v15, "setLocaleIdentifier:");
  }
  if (self->_dPID) {
    objc_msgSend(v15, "setDPID:");
  }
  if ([(ADSegmentUpdateRequest *)self deviceModesCount])
  {
    [v15 clearDeviceModes];
    unint64_t v6 = [(ADSegmentUpdateRequest *)self deviceModesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        objc_msgSend(v15, "addDeviceMode:", -[ADSegmentUpdateRequest deviceModeAtIndex:](self, "deviceModeAtIndex:", i));
    }
  }
  if ([(ADSegmentUpdateRequest *)self accountTypesCount])
  {
    [v15 clearAccountTypes];
    unint64_t v9 = [(ADSegmentUpdateRequest *)self accountTypesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        objc_msgSend(v15, "addAccountType:", -[ADSegmentUpdateRequest accountTypeAtIndex:](self, "accountTypeAtIndex:", j));
    }
  }
  if ([(ADSegmentUpdateRequest *)self accountStatesCount])
  {
    [v15 clearAccountStates];
    unint64_t v12 = [(ADSegmentUpdateRequest *)self accountStatesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        objc_msgSend(v15, "addAccountState:", -[ADSegmentUpdateRequest accountStateAtIndex:](self, "accountStateAtIndex:", k));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_iAdID copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v6;

  uint64_t v8 = [(NSString *)self->_segmentInfo copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v8;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 156) = self->_isFirstPartyIdentifier;
    *(unsigned char *)(v5 + 160) |= 0x10u;
  }
  uint64_t v10 = [(NSString *)self->_advertisingIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v10;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 80) = self->_iTunesRefreshTime;
    *(unsigned char *)(v5 + 160) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *(float *)(v5 + 152) = self->_timezone;
      *(unsigned char *)(v5 + 160) |= 8u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(double *)(v5 + 88) = self->_updateSentTime;
  *(unsigned char *)(v5 + 160) |= 2u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *(_DWORD *)(v5 + 104) = self->_advertisingIdentifierMonthResetCount;
    *(unsigned char *)(v5 + 160) |= 4u;
  }
LABEL_8:
  uint64_t v13 = [(NSString *)self->_osVersionAndBuild copyWithZone:a3];
  v14 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v13;

  uint64_t v15 = [(NSString *)self->_localeIdentifier copyWithZone:a3];
  v16 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v15;

  uint64_t v17 = [(NSData *)self->_dPID copyWithZone:a3];
  uint64_t v18 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v17;

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_46;
  }
  iAdID = self->_iAdID;
  if ((unint64_t)iAdID | *((void *)v4 + 15))
  {
    if (!-[NSData isEqual:](iAdID, "isEqual:")) {
      goto LABEL_46;
    }
  }
  segmentInfo = self->_segmentInfo;
  if ((unint64_t)segmentInfo | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](segmentInfo, "isEqual:")) {
      goto LABEL_46;
    }
  }
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 160) & 0x10) == 0) {
      goto LABEL_46;
    }
    if (self->_isFirstPartyIdentifier)
    {
      if (!*((unsigned char *)v4 + 156)) {
        goto LABEL_46;
      }
    }
    else if (*((unsigned char *)v4 + 156))
    {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 0x10) != 0)
  {
    goto LABEL_46;
  }
  advertisingIdentifier = self->_advertisingIdentifier;
  if (!((unint64_t)advertisingIdentifier | *((void *)v4 + 12))) {
    goto LABEL_17;
  }
  if (!-[NSString isEqual:](advertisingIdentifier, "isEqual:"))
  {
LABEL_46:
    char IsEqual = 0;
    goto LABEL_47;
  }
  char has = (char)self->_has;
LABEL_17:
  if (has)
  {
    if ((*((unsigned char *)v4 + 160) & 1) == 0 || self->_iTunesRefreshTime != *((double *)v4 + 10)) {
      goto LABEL_46;
    }
  }
  else if (*((unsigned char *)v4 + 160))
  {
    goto LABEL_46;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 160) & 2) == 0 || self->_updateSentTime != *((double *)v4 + 11)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 2) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 160) & 8) == 0 || self->_timezone != *((float *)v4 + 38)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 160) & 4) == 0 || self->_advertisingIdentifierMonthResetCount != *((_DWORD *)v4 + 26)) {
      goto LABEL_46;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 4) != 0)
  {
    goto LABEL_46;
  }
  osVersionAndBuild = self->_osVersionAndBuild;
  if ((unint64_t)osVersionAndBuild | *((void *)v4 + 17)
    && !-[NSString isEqual:](osVersionAndBuild, "isEqual:"))
  {
    goto LABEL_46;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:")) {
      goto LABEL_46;
    }
  }
  dPID = self->_dPID;
  if ((unint64_t)dPID | *((void *)v4 + 14))
  {
    if (!-[NSData isEqual:](dPID, "isEqual:")) {
      goto LABEL_46;
    }
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual()) {
    goto LABEL_46;
  }
  char IsEqual = PBRepeatedInt32IsEqual();
LABEL_47:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_iAdID hash];
  NSUInteger v4 = [(NSString *)self->_segmentInfo hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v5 = 2654435761 * self->_isFirstPartyIdentifier;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_advertisingIdentifier hash];
  char has = (char)self->_has;
  if (has)
  {
    double iTunesRefreshTime = self->_iTunesRefreshTime;
    double v10 = -iTunesRefreshTime;
    if (iTunesRefreshTime >= 0.0) {
      double v10 = self->_iTunesRefreshTime;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  if ((has & 2) != 0)
  {
    double updateSentTime = self->_updateSentTime;
    double v15 = -updateSentTime;
    if (updateSentTime >= 0.0) {
      double v15 = self->_updateSentTime;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  if ((has & 8) != 0)
  {
    float timezone = self->_timezone;
    float v20 = -timezone;
    if (timezone >= 0.0) {
      float v20 = self->_timezone;
    }
    float v21 = floorf(v20 + 0.5);
    float v22 = (float)(v20 - v21) * 1.8447e19;
    unint64_t v18 = 2654435761u * (unint64_t)fmodf(v21, 1.8447e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0) {
        v18 += (unint64_t)v22;
      }
    }
    else
    {
      v18 -= (unint64_t)fabsf(v22);
    }
  }
  else
  {
    unint64_t v18 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v23 = 2654435761 * self->_advertisingIdentifierMonthResetCount;
  }
  else {
    uint64_t v23 = 0;
  }
  NSUInteger v24 = v4 ^ v3 ^ v5 ^ v6;
  NSUInteger v25 = v8 ^ v13 ^ v18 ^ v23 ^ [(NSString *)self->_osVersionAndBuild hash];
  NSUInteger v26 = v24 ^ v25 ^ [(NSString *)self->_localeIdentifier hash];
  uint64_t v27 = [(NSData *)self->_dPID hash];
  uint64_t v28 = v27 ^ PBRepeatedInt32Hash();
  uint64_t v29 = v28 ^ PBRepeatedInt32Hash();
  return v26 ^ v29 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (*((void *)v4 + 15))
  {
    -[ADSegmentUpdateRequest setIAdID:](self, "setIAdID:");
    id v4 = v15;
  }
  if (*((void *)v4 + 18))
  {
    -[ADSegmentUpdateRequest setSegmentInfo:](self, "setSegmentInfo:");
    id v4 = v15;
  }
  if ((*((unsigned char *)v4 + 160) & 0x10) != 0)
  {
    self->_isFirstPartyIdentifier = *((unsigned char *)v4 + 156);
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 12))
  {
    -[ADSegmentUpdateRequest setAdvertisingIdentifier:](self, "setAdvertisingIdentifier:");
    id v4 = v15;
  }
  char v5 = *((unsigned char *)v4 + 160);
  if (v5)
  {
    self->_double iTunesRefreshTime = *((double *)v4 + 10);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 160);
    if ((v5 & 2) == 0)
    {
LABEL_11:
      if ((v5 & 8) == 0) {
        goto LABEL_12;
      }
      goto LABEL_34;
    }
  }
  else if ((*((unsigned char *)v4 + 160) & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_double updateSentTime = *((double *)v4 + 11);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 160);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 4) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_34:
  self->_float timezone = *((float *)v4 + 38);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 160) & 4) != 0)
  {
LABEL_13:
    self->_advertisingIdentifierMonthResetCount = *((_DWORD *)v4 + 26);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_14:
  if (*((void *)v4 + 17))
  {
    -[ADSegmentUpdateRequest setOsVersionAndBuild:](self, "setOsVersionAndBuild:");
    id v4 = v15;
  }
  if (*((void *)v4 + 16))
  {
    -[ADSegmentUpdateRequest setLocaleIdentifier:](self, "setLocaleIdentifier:");
    id v4 = v15;
  }
  if (*((void *)v4 + 14))
  {
    -[ADSegmentUpdateRequest setDPID:](self, "setDPID:");
    id v4 = v15;
  }
  uint64_t v6 = [v4 deviceModesCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[ADSegmentUpdateRequest addDeviceMode:](self, "addDeviceMode:", [v15 deviceModeAtIndex:i]);
  }
  uint64_t v9 = [v15 accountTypesCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[ADSegmentUpdateRequest addAccountType:](self, "addAccountType:", [v15 accountTypeAtIndex:j]);
  }
  uint64_t v12 = [v15 accountStatesCount];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t k = 0; k != v13; ++k)
      -[ADSegmentUpdateRequest addAccountState:](self, "addAccountState:", [v15 accountStateAtIndex:k]);
  }
}

- (NSData)iAdID
{
  return self->_iAdID;
}

- (void)setIAdID:(id)a3
{
}

- (NSString)segmentInfo
{
  return self->_segmentInfo;
}

- (void)setSegmentInfo:(id)a3
{
}

- (BOOL)isFirstPartyIdentifier
{
  return self->_isFirstPartyIdentifier;
}

- (NSString)advertisingIdentifier
{
  return self->_advertisingIdentifier;
}

- (void)setAdvertisingIdentifier:(id)a3
{
}

- (double)iTunesRefreshTime
{
  return self->_iTunesRefreshTime;
}

- (double)updateSentTime
{
  return self->_updateSentTime;
}

- (float)timezone
{
  return self->_timezone;
}

- (int)advertisingIdentifierMonthResetCount
{
  return self->_advertisingIdentifierMonthResetCount;
}

- (NSString)osVersionAndBuild
{
  return self->_osVersionAndBuild;
}

- (void)setOsVersionAndBuild:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSData)dPID
{
  return self->_dPID;
}

- (void)setDPID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentInfo, 0);
  objc_storeStrong((id *)&self->_osVersionAndBuild, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_dPID, 0);
  objc_storeStrong((id *)&self->_advertisingIdentifier, 0);
}

@end