@interface _MPCProtoDelegateInfo
+ (id)currentDeviceDelegateInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)accountCapabilitiesAtIndex:(uint64_t)a1;
- (unint64_t)hash;
- (void)dealloc;
- (void)setTokenA:(uint64_t)a1;
- (void)setTokenE:(uint64_t)a1;
- (void)setUuid:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation _MPCProtoDelegateInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_tokenE, 0);
  objc_storeStrong((id *)&self->_tokenA, 0);
  objc_storeStrong((id *)&self->_timeZoneName, 0);
  objc_storeStrong((id *)&self->_requestUserAgent, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_deviceGUID, 0);
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_delegateInfoID;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      unint64_t v4 = 2654435761u * self->_accountID;
      goto LABEL_6;
    }
  }
  unint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_uuid hash];
  NSUInteger v6 = [(NSString *)self->_deviceGUID hash];
  NSUInteger v7 = [(NSString *)self->_deviceName hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v8 = 2654435761 * self->_systemReleaseType;
  }
  else {
    uint64_t v8 = 0;
  }
  NSUInteger v9 = [(NSString *)self->_requestUserAgent hash];
  NSUInteger v10 = [(NSString *)self->_timeZoneName hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v11 = 2654435761 * self->_privateListeningEnabled;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  uint64_t v13 = v11 ^ PBRepeatedInt32Hash();
  unint64_t v14 = v13 ^ [(_MPCProtoDelegateInfoTokenA *)self->_tokenA hash];
  return v12 ^ v14 ^ [(_MPCProtoDelegateInfoTokenE *)self->_tokenE hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 2) == 0 || self->_delegateInfoID != *((void *)v4 + 5)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 2) != 0)
  {
    goto LABEL_40;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 116) & 1) == 0 || self->_accountID != *((void *)v4 + 4)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)v4 + 116))
  {
    goto LABEL_40;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 13) && !-[NSString isEqual:](uuid, "isEqual:")) {
    goto LABEL_40;
  }
  deviceGUID = self->_deviceGUID;
  if ((unint64_t)deviceGUID | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](deviceGUID, "isEqual:")) {
      goto LABEL_40;
    }
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:")) {
      goto LABEL_40;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 4) == 0 || self->_systemReleaseType != *((_DWORD *)v4 + 18)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 116) & 4) != 0)
  {
    goto LABEL_40;
  }
  requestUserAgent = self->_requestUserAgent;
  if ((unint64_t)requestUserAgent | *((void *)v4 + 8)
    && !-[NSString isEqual:](requestUserAgent, "isEqual:"))
  {
    goto LABEL_40;
  }
  timeZoneName = self->_timeZoneName;
  if ((unint64_t)timeZoneName | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](timeZoneName, "isEqual:")) {
      goto LABEL_40;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 116) & 8) != 0)
    {
      if (self->_privateListeningEnabled)
      {
        if (!*((unsigned char *)v4 + 112)) {
          goto LABEL_40;
        }
        goto LABEL_35;
      }
      if (!*((unsigned char *)v4 + 112)) {
        goto LABEL_35;
      }
    }
LABEL_40:
    char v12 = 0;
    goto LABEL_41;
  }
  if ((*((unsigned char *)v4 + 116) & 8) != 0) {
    goto LABEL_40;
  }
LABEL_35:
  if (!PBRepeatedInt32IsEqual()) {
    goto LABEL_40;
  }
  tokenA = self->_tokenA;
  if ((unint64_t)tokenA | *((void *)v4 + 11))
  {
    if (!-[_MPCProtoDelegateInfoTokenA isEqual:](tokenA, "isEqual:")) {
      goto LABEL_40;
    }
  }
  tokenE = self->_tokenE;
  if ((unint64_t)tokenE | *((void *)v4 + 12)) {
    char v12 = -[_MPCProtoDelegateInfoTokenE isEqual:](tokenE, "isEqual:");
  }
  else {
    char v12 = 1;
  }
LABEL_41:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 40) = self->_delegateInfoID;
    *(unsigned char *)(v5 + 116) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 32) = self->_accountID;
    *(unsigned char *)(v5 + 116) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_uuid copyWithZone:a3];
  NSUInteger v9 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v8;

  uint64_t v10 = [(NSString *)self->_deviceGUID copyWithZone:a3];
  uint64_t v11 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v10;

  uint64_t v12 = [(NSString *)self->_deviceName copyWithZone:a3];
  uint64_t v13 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v12;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 72) = self->_systemReleaseType;
    *(unsigned char *)(v6 + 116) |= 4u;
  }
  uint64_t v14 = [(NSString *)self->_requestUserAgent copyWithZone:a3];
  v15 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v14;

  uint64_t v16 = [(NSString *)self->_timeZoneName copyWithZone:a3];
  v17 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v16;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v6 + 112) = self->_privateListeningEnabled;
    *(unsigned char *)(v6 + 116) |= 8u;
  }
  PBRepeatedInt32Copy();
  id v18 = [(_MPCProtoDelegateInfoTokenA *)self->_tokenA copyWithZone:a3];
  v19 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v18;

  id v20 = [(_MPCProtoDelegateInfoTokenE *)self->_tokenE copyWithZone:a3];
  v21 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v20;

  return (id)v6;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v7 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v7;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_deviceGUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_deviceName)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_requestUserAgent)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_timeZoneName)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
  if (self->_accountCapabilities.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      id v4 = v7;
      ++v6;
    }
    while (v6 < self->_accountCapabilities.count);
  }
  if (self->_tokenA)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_tokenE)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _MPCProtoDelegateInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v5 = [NSNumber numberWithLongLong:self->_delegateInfoID];
    [v3 setObject:v5 forKey:@"delegateInfoID"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unint64_t v6 = [NSNumber numberWithUnsignedLongLong:self->_accountID];
    [v3 setObject:v6 forKey:@"accountID"];
  }
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  deviceGUID = self->_deviceGUID;
  if (deviceGUID) {
    [v3 setObject:deviceGUID forKey:@"deviceGUID"];
  }
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKey:@"deviceName"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v10 = [NSNumber numberWithInt:self->_systemReleaseType];
    [v3 setObject:v10 forKey:@"systemReleaseType"];
  }
  requestUserAgent = self->_requestUserAgent;
  if (requestUserAgent) {
    [v3 setObject:requestUserAgent forKey:@"requestUserAgent"];
  }
  timeZoneName = self->_timeZoneName;
  if (timeZoneName) {
    [v3 setObject:timeZoneName forKey:@"timeZoneName"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v13 = [NSNumber numberWithBool:self->_privateListeningEnabled];
    [v3 setObject:v13 forKey:@"privateListeningEnabled"];
  }
  uint64_t v14 = PBRepeatedInt32NSArray();
  [v3 setObject:v14 forKey:@"accountCapabilities"];

  tokenA = self->_tokenA;
  if (tokenA)
  {
    uint64_t v16 = [(_MPCProtoDelegateInfoTokenA *)tokenA dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"tokenA"];
  }
  tokenE = self->_tokenE;
  if (tokenE)
  {
    id v18 = [(_MPCProtoDelegateInfoTokenE *)tokenE dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"tokenE"];
  }

  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MPCProtoDelegateInfo;
  id v4 = [(_MPCProtoDelegateInfo *)&v8 description];
  uint64_t v5 = [(_MPCProtoDelegateInfo *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)_MPCProtoDelegateInfo;
  [(_MPCProtoDelegateInfo *)&v3 dealloc];
}

- (uint64_t)accountCapabilitiesAtIndex:(uint64_t)a1
{
  unint64_t v4 = *(void *)(a1 + 16);
  if (v4 <= a2)
  {
    uint64_t v5 = (void *)MEMORY[0x263EFF940];
    uint64_t v6 = *MEMORY[0x263EFF578];
    id v7 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a2, v4);
    objc_super v8 = [v5 exceptionWithName:v6 reason:v7 userInfo:0];
    [v8 raise];
  }
  return *(unsigned int *)(*(void *)(a1 + 8) + 4 * a2);
}

- (void)setUuid:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

- (void)setTokenA:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

- (void)setTokenE:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 96), a2);
  }
}

+ (id)currentDeviceDelegateInfo
{
  v2 = (id *)objc_alloc_init((Class)a1);
  id v3 = objc_alloc(MEMORY[0x263F89360]);
  unint64_t v4 = [MEMORY[0x263F890C0] defaultInfo];
  uint64_t v5 = (void *)[v3 initWithClientInfo:v4];

  uint64_t v6 = [v5 deviceInfo];
  id v7 = [v6 deviceGUID];
  if (v2) {
    objc_storeStrong(v2 + 6, v7);
  }

  objc_super v8 = [v6 deviceName];
  if (v2) {
    objc_storeStrong(v2 + 7, v8);
  }

  NSUInteger v9 = [v5 userAgent];
  if (v2) {
    objc_storeStrong(v2 + 8, v9);
  }

  uint64_t v10 = [v6 systemReleaseType];
  if ([v10 isEqualToString:*MEMORY[0x263F88EE0]])
  {
    int v11 = 3;
  }
  else if ([v10 isEqualToString:*MEMORY[0x263F88EE8]])
  {
    int v11 = 4;
  }
  else if ([v10 isEqualToString:*MEMORY[0x263F88ED8]])
  {
    int v11 = 2;
  }
  else
  {
    int v11 = 1;
  }
  if (v2)
  {
    *((unsigned char *)v2 + 116) |= 4u;
    *((_DWORD *)v2 + 18) = v11;
  }
  uint64_t v12 = [MEMORY[0x263EFFA18] defaultTimeZone];
  uint64_t v13 = [v12 name];
  if (v2) {
    objc_storeStrong(v2 + 10, v13);
  }

  uint64_t v14 = [MEMORY[0x263F12178] standardUserDefaults];
  v15 = [v14 isPrivateListeningEnabled];

  if ([MEMORY[0x263F11DA0] isCurrentDeviceValidHomeAccessory])
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(MEMORY[0x263F11DA8], "isPrivateListeningEnabledForCurrentUserAndAccessory"));

    v15 = (void *)v16;
  }
  if (v15)
  {
    char v17 = [v15 BOOLValue];
    if (v2)
    {
      *((unsigned char *)v2 + 116) |= 8u;
      *((unsigned char *)v2 + 112) = v17;
    }
  }

  return v2;
}

@end