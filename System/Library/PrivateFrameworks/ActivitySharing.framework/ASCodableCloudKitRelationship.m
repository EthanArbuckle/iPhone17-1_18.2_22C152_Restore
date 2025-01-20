@interface ASCodableCloudKitRelationship
+ (Class)addressesType;
+ (Class)eventsType;
- (BOOL)hasCloudKitAddress;
- (BOOL)hasCloudType;
- (BOOL)hasEventCount;
- (BOOL)hasIncomingHandshakeToken;
- (BOOL)hasOutgoingHandshakeToken;
- (BOOL)hasPreferredReachableAddress;
- (BOOL)hasPreferredReachableService;
- (BOOL)hasReceivedInvitation;
- (BOOL)hasSecureCloudUpgradeToken;
- (BOOL)hasSentInvitation;
- (BOOL)hasSupportedPhoneFeatures;
- (BOOL)hasSupportedWatchFeatures;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)receivedInvitation;
- (NSData)sentInvitation;
- (NSData)uuid;
- (NSMutableArray)addresses;
- (NSMutableArray)events;
- (NSString)cloudKitAddress;
- (NSString)incomingHandshakeToken;
- (NSString)outgoingHandshakeToken;
- (NSString)preferredReachableAddress;
- (NSString)preferredReachableService;
- (NSString)secureCloudUpgradeToken;
- (id)addressesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventsAtIndex:(unint64_t)a3;
- (int64_t)cloudType;
- (int64_t)eventCount;
- (unint64_t)addressesCount;
- (unint64_t)eventsCount;
- (unint64_t)hash;
- (unsigned)supportedPhoneFeatures;
- (unsigned)supportedWatchFeatures;
- (void)addAddresses:(id)a3;
- (void)addEvents:(id)a3;
- (void)clearAddresses;
- (void)clearEvents;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddresses:(id)a3;
- (void)setCloudKitAddress:(id)a3;
- (void)setCloudType:(int64_t)a3;
- (void)setEventCount:(int64_t)a3;
- (void)setEvents:(id)a3;
- (void)setHasCloudType:(BOOL)a3;
- (void)setHasEventCount:(BOOL)a3;
- (void)setHasSupportedPhoneFeatures:(BOOL)a3;
- (void)setHasSupportedWatchFeatures:(BOOL)a3;
- (void)setIncomingHandshakeToken:(id)a3;
- (void)setOutgoingHandshakeToken:(id)a3;
- (void)setPreferredReachableAddress:(id)a3;
- (void)setPreferredReachableService:(id)a3;
- (void)setReceivedInvitation:(id)a3;
- (void)setSecureCloudUpgradeToken:(id)a3;
- (void)setSentInvitation:(id)a3;
- (void)setSupportedPhoneFeatures:(unsigned int)a3;
- (void)setSupportedWatchFeatures:(unsigned int)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASCodableCloudKitRelationship

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasIncomingHandshakeToken
{
  return self->_incomingHandshakeToken != 0;
}

- (BOOL)hasOutgoingHandshakeToken
{
  return self->_outgoingHandshakeToken != 0;
}

- (BOOL)hasCloudKitAddress
{
  return self->_cloudKitAddress != 0;
}

- (void)clearAddresses
{
}

- (void)addAddresses:(id)a3
{
  id v4 = a3;
  addresses = self->_addresses;
  id v8 = v4;
  if (!addresses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_addresses;
    self->_addresses = v6;

    id v4 = v8;
    addresses = self->_addresses;
  }
  [(NSMutableArray *)addresses addObject:v4];
}

- (unint64_t)addressesCount
{
  return [(NSMutableArray *)self->_addresses count];
}

- (id)addressesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_addresses objectAtIndex:a3];
}

+ (Class)addressesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPreferredReachableAddress
{
  return self->_preferredReachableAddress != 0;
}

- (BOOL)hasPreferredReachableService
{
  return self->_preferredReachableService != 0;
}

- (void)clearEvents
{
}

- (void)addEvents:(id)a3
{
  id v4 = a3;
  events = self->_events;
  id v8 = v4;
  if (!events)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_events;
    self->_events = v6;

    id v4 = v8;
    events = self->_events;
  }
  [(NSMutableArray *)events addObject:v4];
}

- (unint64_t)eventsCount
{
  return [(NSMutableArray *)self->_events count];
}

- (id)eventsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_events objectAtIndex:a3];
}

+ (Class)eventsType
{
  return (Class)objc_opt_class();
}

- (void)setEventCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_eventCount = a3;
}

- (void)setHasEventCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSupportedPhoneFeatures:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_supportedPhoneFeatures = a3;
}

- (void)setHasSupportedPhoneFeatures:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportedPhoneFeatures
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSupportedWatchFeatures:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_supportedWatchFeatures = a3;
}

- (void)setHasSupportedWatchFeatures:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportedWatchFeatures
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCloudType:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cloudType = a3;
}

- (void)setHasCloudType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCloudType
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasSecureCloudUpgradeToken
{
  return self->_secureCloudUpgradeToken != 0;
}

- (BOOL)hasSentInvitation
{
  return self->_sentInvitation != 0;
}

- (BOOL)hasReceivedInvitation
{
  return self->_receivedInvitation != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ASCodableCloudKitRelationship;
  id v4 = [(ASCodableCloudKitRelationship *)&v8 description];
  v5 = [(ASCodableCloudKitRelationship *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  incomingHandshakeToken = self->_incomingHandshakeToken;
  if (incomingHandshakeToken) {
    [v4 setObject:incomingHandshakeToken forKey:@"incomingHandshakeToken"];
  }
  outgoingHandshakeToken = self->_outgoingHandshakeToken;
  if (outgoingHandshakeToken) {
    [v4 setObject:outgoingHandshakeToken forKey:@"outgoingHandshakeToken"];
  }
  cloudKitAddress = self->_cloudKitAddress;
  if (cloudKitAddress) {
    [v4 setObject:cloudKitAddress forKey:@"cloudKitAddress"];
  }
  addresses = self->_addresses;
  if (addresses) {
    [v4 setObject:addresses forKey:@"addresses"];
  }
  preferredReachableAddress = self->_preferredReachableAddress;
  if (preferredReachableAddress) {
    [v4 setObject:preferredReachableAddress forKey:@"preferredReachableAddress"];
  }
  preferredReachableService = self->_preferredReachableService;
  if (preferredReachableService) {
    [v4 setObject:preferredReachableService forKey:@"preferredReachableService"];
  }
  if ([(NSMutableArray *)self->_events count])
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_events, "count"));
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v13 = self->_events;
    uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "dictionaryRepresentation", (void)v28);
          [v12 addObject:v18];
        }
        uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v15);
    }

    [v4 setObject:v12 forKey:@"events"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v25 = [NSNumber numberWithLongLong:self->_eventCount];
    [v4 setObject:v25 forKey:@"eventCount"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_26:
      if ((has & 8) == 0) {
        goto LABEL_27;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_26;
  }
  v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_supportedPhoneFeatures, (void)v28);
  [v4 setObject:v26 forKey:@"supportedPhoneFeatures"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_27:
    if ((has & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_40:
  v27 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_supportedWatchFeatures, (void)v28);
  [v4 setObject:v27 forKey:@"supportedWatchFeatures"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_28:
    v20 = objc_msgSend(NSNumber, "numberWithLongLong:", self->_cloudType, (void)v28);
    [v4 setObject:v20 forKey:@"cloudType"];
  }
LABEL_29:
  secureCloudUpgradeToken = self->_secureCloudUpgradeToken;
  if (secureCloudUpgradeToken) {
    [v4 setObject:secureCloudUpgradeToken forKey:@"secureCloudUpgradeToken"];
  }
  sentInvitation = self->_sentInvitation;
  if (sentInvitation) {
    [v4 setObject:sentInvitation forKey:@"sentInvitation"];
  }
  receivedInvitation = self->_receivedInvitation;
  if (receivedInvitation) {
    [v4 setObject:receivedInvitation forKey:@"receivedInvitation"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableCloudKitRelationshipReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_uuid) {
    PBDataWriterWriteDataField();
  }
  if (self->_incomingHandshakeToken) {
    PBDataWriterWriteStringField();
  }
  if (self->_outgoingHandshakeToken) {
    PBDataWriterWriteStringField();
  }
  if (self->_cloudKitAddress) {
    PBDataWriterWriteStringField();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = self->_addresses;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  if (self->_preferredReachableAddress) {
    PBDataWriterWriteStringField();
  }
  if (self->_preferredReachableService) {
    PBDataWriterWriteStringField();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v10 = self->_events;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_29:
      if ((has & 8) == 0) {
        goto LABEL_30;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_30:
    if ((has & 1) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_31:
  }
    PBDataWriterWriteInt64Field();
LABEL_32:
  if (self->_secureCloudUpgradeToken) {
    PBDataWriterWriteStringField();
  }
  if (self->_sentInvitation) {
    PBDataWriterWriteDataField();
  }
  if (self->_receivedInvitation) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v14 = a3;
  if (self->_uuid) {
    objc_msgSend(v14, "setUuid:");
  }
  if (self->_incomingHandshakeToken) {
    objc_msgSend(v14, "setIncomingHandshakeToken:");
  }
  if (self->_outgoingHandshakeToken) {
    objc_msgSend(v14, "setOutgoingHandshakeToken:");
  }
  if (self->_cloudKitAddress) {
    objc_msgSend(v14, "setCloudKitAddress:");
  }
  if ([(ASCodableCloudKitRelationship *)self addressesCount])
  {
    [v14 clearAddresses];
    unint64_t v4 = [(ASCodableCloudKitRelationship *)self addressesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(ASCodableCloudKitRelationship *)self addressesAtIndex:i];
        [v14 addAddresses:v7];
      }
    }
  }
  if (self->_preferredReachableAddress) {
    objc_msgSend(v14, "setPreferredReachableAddress:");
  }
  if (self->_preferredReachableService) {
    objc_msgSend(v14, "setPreferredReachableService:");
  }
  if ([(ASCodableCloudKitRelationship *)self eventsCount])
  {
    [v14 clearEvents];
    unint64_t v8 = [(ASCodableCloudKitRelationship *)self eventsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(ASCodableCloudKitRelationship *)self eventsAtIndex:j];
        [v14 addEvents:v11];
      }
    }
  }
  char has = (char)self->_has;
  uint64_t v13 = v14;
  if ((has & 2) != 0)
  {
    *((void *)v14 + 2) = self->_eventCount;
    *((unsigned char *)v14 + 120) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_23:
      if ((has & 8) == 0) {
        goto LABEL_24;
      }
      goto LABEL_37;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_23;
  }
  *((_DWORD *)v14 + 26) = self->_supportedPhoneFeatures;
  *((unsigned char *)v14 + 120) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_24:
    if ((has & 1) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_37:
  *((_DWORD *)v14 + 27) = self->_supportedWatchFeatures;
  *((unsigned char *)v14 + 120) |= 8u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_25:
    *((void *)v14 + 1) = self->_cloudType;
    *((unsigned char *)v14 + 120) |= 1u;
  }
LABEL_26:
  if (self->_secureCloudUpgradeToken)
  {
    objc_msgSend(v14, "setSecureCloudUpgradeToken:");
    uint64_t v13 = v14;
  }
  if (self->_sentInvitation)
  {
    objc_msgSend(v14, "setSentInvitation:");
    uint64_t v13 = v14;
  }
  if (self->_receivedInvitation)
  {
    objc_msgSend(v14, "setReceivedInvitation:");
    uint64_t v13 = v14;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_uuid copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v6;

  uint64_t v8 = [(NSString *)self->_incomingHandshakeToken copyWithZone:a3];
  unint64_t v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(NSString *)self->_outgoingHandshakeToken copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_cloudKitAddress copyWithZone:a3];
  uint64_t v13 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v12;

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v14 = self->_addresses;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v42 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(v14);
        }
        long long v19 = (void *)[*(id *)(*((void *)&v42 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addAddresses:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v42 objects:v47 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSString *)self->_preferredReachableAddress copyWithZone:a3];
  long long v21 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v20;

  uint64_t v22 = [(NSString *)self->_preferredReachableService copyWithZone:a3];
  long long v23 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v22;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v24 = self->_events;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v39 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = objc_msgSend(*(id *)(*((void *)&v38 + 1) + 8 * j), "copyWithZone:", a3, (void)v38);
        [(id)v5 addEvents:v29];
      }
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v26);
  }

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_eventCount;
    *(unsigned char *)(v5 + 120) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_17:
      if ((has & 8) == 0) {
        goto LABEL_18;
      }
LABEL_23:
      *(_DWORD *)(v5 + 108) = self->_supportedWatchFeatures;
      *(unsigned char *)(v5 + 120) |= 8u;
      if ((*(unsigned char *)&self->_has & 1) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_17;
  }
  *(_DWORD *)(v5 + 104) = self->_supportedPhoneFeatures;
  *(unsigned char *)(v5 + 120) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_23;
  }
LABEL_18:
  if (has)
  {
LABEL_19:
    *(void *)(v5 + 8) = self->_cloudType;
    *(unsigned char *)(v5 + 120) |= 1u;
  }
LABEL_20:
  uint64_t v31 = -[NSString copyWithZone:](self->_secureCloudUpgradeToken, "copyWithZone:", a3, (void)v38);
  v32 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v31;

  uint64_t v33 = [(NSData *)self->_sentInvitation copyWithZone:a3];
  v34 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v33;

  uint64_t v35 = [(NSData *)self->_receivedInvitation copyWithZone:a3];
  v36 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v35;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 14))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_44;
    }
  }
  incomingHandshakeToken = self->_incomingHandshakeToken;
  if ((unint64_t)incomingHandshakeToken | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](incomingHandshakeToken, "isEqual:")) {
      goto LABEL_44;
    }
  }
  outgoingHandshakeToken = self->_outgoingHandshakeToken;
  if ((unint64_t)outgoingHandshakeToken | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](outgoingHandshakeToken, "isEqual:")) {
      goto LABEL_44;
    }
  }
  cloudKitAddress = self->_cloudKitAddress;
  if ((unint64_t)cloudKitAddress | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](cloudKitAddress, "isEqual:")) {
      goto LABEL_44;
    }
  }
  addresses = self->_addresses;
  if ((unint64_t)addresses | *((void *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](addresses, "isEqual:")) {
      goto LABEL_44;
    }
  }
  preferredReachableAddress = self->_preferredReachableAddress;
  if ((unint64_t)preferredReachableAddress | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](preferredReachableAddress, "isEqual:")) {
      goto LABEL_44;
    }
  }
  preferredReachableService = self->_preferredReachableService;
  if ((unint64_t)preferredReachableService | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](preferredReachableService, "isEqual:")) {
      goto LABEL_44;
    }
  }
  events = self->_events;
  if ((unint64_t)events | *((void *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](events, "isEqual:")) {
      goto LABEL_44;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 2) == 0 || self->_eventCount != *((void *)v4 + 2)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 2) != 0)
  {
LABEL_44:
    char v16 = 0;
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 4) == 0 || self->_supportedPhoneFeatures != *((_DWORD *)v4 + 26)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 120) & 8) == 0 || self->_supportedWatchFeatures != *((_DWORD *)v4 + 27)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 8) != 0)
  {
    goto LABEL_44;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 120) & 1) == 0 || self->_cloudType != *((void *)v4 + 1)) {
      goto LABEL_44;
    }
  }
  else if (*((unsigned char *)v4 + 120))
  {
    goto LABEL_44;
  }
  secureCloudUpgradeToken = self->_secureCloudUpgradeToken;
  if ((unint64_t)secureCloudUpgradeToken | *((void *)v4 + 11)
    && !-[NSString isEqual:](secureCloudUpgradeToken, "isEqual:"))
  {
    goto LABEL_44;
  }
  sentInvitation = self->_sentInvitation;
  if ((unint64_t)sentInvitation | *((void *)v4 + 12))
  {
    if (!-[NSData isEqual:](sentInvitation, "isEqual:")) {
      goto LABEL_44;
    }
  }
  receivedInvitation = self->_receivedInvitation;
  if ((unint64_t)receivedInvitation | *((void *)v4 + 10)) {
    char v16 = -[NSData isEqual:](receivedInvitation, "isEqual:");
  }
  else {
    char v16 = 1;
  }
LABEL_45:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_uuid hash];
  NSUInteger v4 = [(NSString *)self->_incomingHandshakeToken hash];
  NSUInteger v5 = [(NSString *)self->_outgoingHandshakeToken hash];
  NSUInteger v6 = [(NSString *)self->_cloudKitAddress hash];
  uint64_t v7 = [(NSMutableArray *)self->_addresses hash];
  NSUInteger v8 = [(NSString *)self->_preferredReachableAddress hash];
  NSUInteger v9 = [(NSString *)self->_preferredReachableService hash];
  uint64_t v10 = [(NSMutableArray *)self->_events hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v11 = 2654435761 * self->_eventCount;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v12 = 2654435761 * self->_supportedPhoneFeatures;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v13 = 0;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v14 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v13 = 2654435761 * self->_supportedWatchFeatures;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v14 = 2654435761 * self->_cloudType;
LABEL_10:
  NSUInteger v15 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  NSUInteger v16 = v14 ^ [(NSString *)self->_secureCloudUpgradeToken hash];
  uint64_t v17 = v16 ^ [(NSData *)self->_sentInvitation hash];
  return v15 ^ v17 ^ [(NSData *)self->_receivedInvitation hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 14)) {
    -[ASCodableCloudKitRelationship setUuid:](self, "setUuid:");
  }
  if (*((void *)v4 + 6)) {
    -[ASCodableCloudKitRelationship setIncomingHandshakeToken:](self, "setIncomingHandshakeToken:");
  }
  if (*((void *)v4 + 7)) {
    -[ASCodableCloudKitRelationship setOutgoingHandshakeToken:](self, "setOutgoingHandshakeToken:");
  }
  if (*((void *)v4 + 4)) {
    -[ASCodableCloudKitRelationship setCloudKitAddress:](self, "setCloudKitAddress:");
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [(ASCodableCloudKitRelationship *)self addAddresses:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 8)) {
    -[ASCodableCloudKitRelationship setPreferredReachableAddress:](self, "setPreferredReachableAddress:");
  }
  if (*((void *)v4 + 9)) {
    -[ASCodableCloudKitRelationship setPreferredReachableService:](self, "setPreferredReachableService:");
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = *((id *)v4 + 5);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        -[ASCodableCloudKitRelationship addEvents:](self, "addEvents:", *(void *)(*((void *)&v16 + 1) + 8 * j), (void)v16);
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  char v15 = *((unsigned char *)v4 + 120);
  if ((v15 & 2) != 0)
  {
    self->_eventCount = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v15 = *((unsigned char *)v4 + 120);
    if ((v15 & 4) == 0)
    {
LABEL_29:
      if ((v15 & 8) == 0) {
        goto LABEL_30;
      }
      goto LABEL_41;
    }
  }
  else if ((*((unsigned char *)v4 + 120) & 4) == 0)
  {
    goto LABEL_29;
  }
  self->_supportedPhoneFeatures = *((_DWORD *)v4 + 26);
  *(unsigned char *)&self->_has |= 4u;
  char v15 = *((unsigned char *)v4 + 120);
  if ((v15 & 8) == 0)
  {
LABEL_30:
    if ((v15 & 1) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_41:
  self->_supportedWatchFeatures = *((_DWORD *)v4 + 27);
  *(unsigned char *)&self->_has |= 8u;
  if (*((unsigned char *)v4 + 120))
  {
LABEL_31:
    self->_cloudType = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_32:
  if (*((void *)v4 + 11)) {
    -[ASCodableCloudKitRelationship setSecureCloudUpgradeToken:](self, "setSecureCloudUpgradeToken:");
  }
  if (*((void *)v4 + 12)) {
    -[ASCodableCloudKitRelationship setSentInvitation:](self, "setSentInvitation:");
  }
  if (*((void *)v4 + 10)) {
    -[ASCodableCloudKitRelationship setReceivedInvitation:](self, "setReceivedInvitation:");
  }
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)incomingHandshakeToken
{
  return self->_incomingHandshakeToken;
}

- (void)setIncomingHandshakeToken:(id)a3
{
}

- (NSString)outgoingHandshakeToken
{
  return self->_outgoingHandshakeToken;
}

- (void)setOutgoingHandshakeToken:(id)a3
{
}

- (NSString)cloudKitAddress
{
  return self->_cloudKitAddress;
}

- (void)setCloudKitAddress:(id)a3
{
}

- (NSMutableArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
}

- (NSString)preferredReachableAddress
{
  return self->_preferredReachableAddress;
}

- (void)setPreferredReachableAddress:(id)a3
{
}

- (NSString)preferredReachableService
{
  return self->_preferredReachableService;
}

- (void)setPreferredReachableService:(id)a3
{
}

- (NSMutableArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
}

- (int64_t)eventCount
{
  return self->_eventCount;
}

- (unsigned)supportedPhoneFeatures
{
  return self->_supportedPhoneFeatures;
}

- (unsigned)supportedWatchFeatures
{
  return self->_supportedWatchFeatures;
}

- (int64_t)cloudType
{
  return self->_cloudType;
}

- (NSString)secureCloudUpgradeToken
{
  return self->_secureCloudUpgradeToken;
}

- (void)setSecureCloudUpgradeToken:(id)a3
{
}

- (NSData)sentInvitation
{
  return self->_sentInvitation;
}

- (void)setSentInvitation:(id)a3
{
}

- (NSData)receivedInvitation
{
  return self->_receivedInvitation;
}

- (void)setReceivedInvitation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_sentInvitation, 0);
  objc_storeStrong((id *)&self->_secureCloudUpgradeToken, 0);
  objc_storeStrong((id *)&self->_receivedInvitation, 0);
  objc_storeStrong((id *)&self->_preferredReachableService, 0);
  objc_storeStrong((id *)&self->_preferredReachableAddress, 0);
  objc_storeStrong((id *)&self->_outgoingHandshakeToken, 0);
  objc_storeStrong((id *)&self->_incomingHandshakeToken, 0);
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_cloudKitAddress, 0);

  objc_storeStrong((id *)&self->_addresses, 0);
}

@end