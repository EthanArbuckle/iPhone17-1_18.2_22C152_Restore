@interface HMDRemoteEventRouterProtoServerMessage
- (BOOL)hasChangeRegistrationsResponse;
- (BOOL)hasConnectResponse;
- (BOOL)hasIdentifier;
- (BOOL)hasMessage;
- (BOOL)hasMultiHopFetchEventsResponse;
- (BOOL)hasUpdatedEvents;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMDRemoteEventRouterProtoChangeRegistrationsResponse)changeRegistrationsResponse;
- (HMDRemoteEventRouterProtoConnectResponse)connectResponse;
- (HMDRemoteEventRouterProtoEventsMessage)updatedEvents;
- (HMDRemoteEventRouterProtoMultiHopFetchEventsResponse)multiHopFetchEventsResponse;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)messageAsString:(int)a3;
- (int)StringAsMessage:(id)a3;
- (int)message;
- (unint64_t)hash;
- (void)clearOneofValuesForMessage;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChangeRegistrationsResponse:(id)a3;
- (void)setConnectResponse:(id)a3;
- (void)setHasMessage:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMessage:(int)a3;
- (void)setMultiHopFetchEventsResponse:(id)a3;
- (void)setUpdatedEvents:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMDRemoteEventRouterProtoServerMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedEvents, 0);
  objc_storeStrong((id *)&self->_multiHopFetchEventsResponse, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_connectResponse, 0);
  objc_storeStrong((id *)&self->_changeRegistrationsResponse, 0);
}

- (HMDRemoteEventRouterProtoMultiHopFetchEventsResponse)multiHopFetchEventsResponse
{
  return self->_multiHopFetchEventsResponse;
}

- (HMDRemoteEventRouterProtoChangeRegistrationsResponse)changeRegistrationsResponse
{
  return self->_changeRegistrationsResponse;
}

- (HMDRemoteEventRouterProtoConnectResponse)connectResponse
{
  return self->_connectResponse;
}

- (HMDRemoteEventRouterProtoEventsMessage)updatedEvents
{
  return self->_updatedEvents;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (*((unsigned char *)v4 + 56))
  {
    self->_message = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 1u;
  }
  v14 = v4;
  if (*((void *)v4 + 3))
  {
    -[HMDRemoteEventRouterProtoServerMessage setIdentifier:](self, "setIdentifier:");
    v5 = v14;
  }
  updatedEvents = self->_updatedEvents;
  uint64_t v7 = v5[6];
  if (updatedEvents)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[HMDRemoteEventRouterProtoEventsMessage mergeFrom:](updatedEvents, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[HMDRemoteEventRouterProtoServerMessage setUpdatedEvents:](self, "setUpdatedEvents:");
  }
  v5 = v14;
LABEL_11:
  connectResponse = self->_connectResponse;
  uint64_t v9 = v5[2];
  if (connectResponse)
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[HMDRemoteEventRouterProtoConnectResponse mergeFrom:](connectResponse, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[HMDRemoteEventRouterProtoServerMessage setConnectResponse:](self, "setConnectResponse:");
  }
  v5 = v14;
LABEL_17:
  changeRegistrationsResponse = self->_changeRegistrationsResponse;
  uint64_t v11 = v5[1];
  if (changeRegistrationsResponse)
  {
    if (!v11) {
      goto LABEL_23;
    }
    -[HMDRemoteEventRouterProtoChangeRegistrationsResponse mergeFrom:](changeRegistrationsResponse, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_23;
    }
    -[HMDRemoteEventRouterProtoServerMessage setChangeRegistrationsResponse:](self, "setChangeRegistrationsResponse:");
  }
  v5 = v14;
LABEL_23:
  multiHopFetchEventsResponse = self->_multiHopFetchEventsResponse;
  uint64_t v13 = v5[5];
  if (multiHopFetchEventsResponse)
  {
    if (!v13) {
      goto LABEL_29;
    }
    -[HMDRemoteEventRouterProtoMultiHopFetchEventsResponse mergeFrom:](multiHopFetchEventsResponse, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_29;
    }
    -[HMDRemoteEventRouterProtoServerMessage setMultiHopFetchEventsResponse:](self, "setMultiHopFetchEventsResponse:");
  }
  v5 = v14;
LABEL_29:
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_message;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_identifier hash] ^ v3;
  unint64_t v5 = [(HMDRemoteEventRouterProtoEventsMessage *)self->_updatedEvents hash];
  unint64_t v6 = v4 ^ v5 ^ [(HMDRemoteEventRouterProtoConnectResponse *)self->_connectResponse hash];
  unint64_t v7 = [(HMDRemoteEventRouterProtoChangeRegistrationsResponse *)self->_changeRegistrationsResponse hash];
  return v6 ^ v7 ^ [(HMDRemoteEventRouterProtoMultiHopFetchEventsResponse *)self->_multiHopFetchEventsResponse hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_message != *((_DWORD *)v4 + 8)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
LABEL_17:
    char v10 = 0;
    goto LABEL_18;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 3) && !-[NSString isEqual:](identifier, "isEqual:")) {
    goto LABEL_17;
  }
  updatedEvents = self->_updatedEvents;
  if ((unint64_t)updatedEvents | *((void *)v4 + 6))
  {
    if (!-[HMDRemoteEventRouterProtoEventsMessage isEqual:](updatedEvents, "isEqual:")) {
      goto LABEL_17;
    }
  }
  connectResponse = self->_connectResponse;
  if ((unint64_t)connectResponse | *((void *)v4 + 2))
  {
    if (!-[HMDRemoteEventRouterProtoConnectResponse isEqual:](connectResponse, "isEqual:")) {
      goto LABEL_17;
    }
  }
  changeRegistrationsResponse = self->_changeRegistrationsResponse;
  if ((unint64_t)changeRegistrationsResponse | *((void *)v4 + 1))
  {
    if (!-[HMDRemoteEventRouterProtoChangeRegistrationsResponse isEqual:](changeRegistrationsResponse, "isEqual:")) {
      goto LABEL_17;
    }
  }
  multiHopFetchEventsResponse = self->_multiHopFetchEventsResponse;
  if ((unint64_t)multiHopFetchEventsResponse | *((void *)v4 + 5)) {
    char v10 = -[HMDRemoteEventRouterProtoMultiHopFetchEventsResponse isEqual:](multiHopFetchEventsResponse, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_18:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_message;
    *(unsigned char *)(v5 + 56) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_identifier copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  id v9 = [(HMDRemoteEventRouterProtoEventsMessage *)self->_updatedEvents copyWithZone:a3];
  char v10 = (void *)v6[6];
  v6[6] = v9;

  id v11 = [(HMDRemoteEventRouterProtoConnectResponse *)self->_connectResponse copyWithZone:a3];
  v12 = (void *)v6[2];
  v6[2] = v11;

  id v13 = [(HMDRemoteEventRouterProtoChangeRegistrationsResponse *)self->_changeRegistrationsResponse copyWithZone:a3];
  v14 = (void *)v6[1];
  v6[1] = v13;

  id v15 = [(HMDRemoteEventRouterProtoMultiHopFetchEventsResponse *)self->_multiHopFetchEventsResponse copyWithZone:a3];
  v16 = (void *)v6[5];
  v6[5] = v15;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_message;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v5;
  }
  if (self->_updatedEvents)
  {
    objc_msgSend(v5, "setUpdatedEvents:");
    id v4 = v5;
  }
  if (self->_connectResponse)
  {
    objc_msgSend(v5, "setConnectResponse:");
    id v4 = v5;
  }
  if (self->_changeRegistrationsResponse)
  {
    objc_msgSend(v5, "setChangeRegistrationsResponse:");
    id v4 = v5;
  }
  if (self->_multiHopFetchEventsResponse)
  {
    objc_msgSend(v5, "setMultiHopFetchEventsResponse:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_updatedEvents)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_connectResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_changeRegistrationsResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_multiHopFetchEventsResponse)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x263F62298];
  id v5 = (int *)MEMORY[0x263F62288];
  unint64_t v6 = (int *)MEMORY[0x263F62270];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x263F62298]) < *(void *)((char *)a3 + (int)*MEMORY[0x263F62288]))
  {
    v8 = (int *)MEMORY[0x263F62268];
    while (!*((unsigned char *)a3 + *v6))
    {
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      switch((v11 >> 3))
      {
        case 0u:
          unsigned int v18 = 0;
          do
          {
            uint64_t v19 = *v4;
            unint64_t v20 = *(void *)((char *)a3 + v19);
            if (v20 == -1 || v20 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
              goto LABEL_41;
            }
            unint64_t v21 = v20 + 1;
            int v22 = *(char *)(*(void *)((char *)a3 + *v8) + v20);
            *(void *)((char *)a3 + v19) = v21;
            if ((v22 & 0x80000000) == 0) {
              break;
            }
          }
          while (v18++ <= 8);
          goto LABEL_41;
        case 1u:
          PBReaderReadString();
          v24 = (NSString *)objc_claimAutoreleasedReturnValue();
          identifier = self->_identifier;
          self->_identifier = v24;

          goto LABEL_41;
        case 2u:
          [(HMDRemoteEventRouterProtoServerMessage *)self clearOneofValuesForMessage];
          *(unsigned char *)&self->_has |= 1u;
          self->_message = 1;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoEventsMessage);
          objc_storeStrong((id *)&self->_updatedEvents, v26);
          if (!PBReaderPlaceMark() || !HMDRemoteEventRouterProtoEventsMessageReadFrom(v26, (uint64_t)a3)) {
            goto LABEL_45;
          }
          goto LABEL_40;
        case 4u:
          [(HMDRemoteEventRouterProtoServerMessage *)self clearOneofValuesForMessage];
          *(unsigned char *)&self->_has |= 1u;
          self->_message = 2;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoConnectResponse);
          objc_storeStrong((id *)&self->_connectResponse, v26);
          if (!PBReaderPlaceMark()
            || (HMDRemoteEventRouterProtoConnectResponseReadFrom(v26, (uint64_t)a3) & 1) == 0)
          {
            goto LABEL_45;
          }
          goto LABEL_40;
        case 5u:
          [(HMDRemoteEventRouterProtoServerMessage *)self clearOneofValuesForMessage];
          *(unsigned char *)&self->_has |= 1u;
          self->_message = 3;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoChangeRegistrationsResponse);
          objc_storeStrong((id *)&self->_changeRegistrationsResponse, v26);
          if (!PBReaderPlaceMark()
            || (HMDRemoteEventRouterProtoConnectResponseReadFrom(v26, (uint64_t)a3) & 1) == 0)
          {
            goto LABEL_45;
          }
          goto LABEL_40;
        case 6u:
          [(HMDRemoteEventRouterProtoServerMessage *)self clearOneofValuesForMessage];
          *(unsigned char *)&self->_has |= 1u;
          self->_message = 4;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoMultiHopFetchEventsResponse);
          objc_storeStrong((id *)&self->_multiHopFetchEventsResponse, v26);
          if (!PBReaderPlaceMark()
            || (HMDRemoteEventRouterProtoMultiHopFetchEventsResponseReadFrom(v26, (uint64_t)a3) & 1) == 0)
          {
LABEL_45:

            LOBYTE(v27) = 0;
            return v27;
          }
LABEL_40:
          PBReaderRecallMark();

LABEL_41:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_44;
          }
          break;
        default:
          int v27 = PBReaderSkipValueWithTag();
          if (!v27) {
            return v27;
          }
          goto LABEL_41;
      }
    }
  }
LABEL_44:
  LOBYTE(v27) = *((unsigned char *)a3 + *v6) == 0;
  return v27;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  updatedEvents = self->_updatedEvents;
  if (updatedEvents)
  {
    uint64_t v7 = [(HMDRemoteEventRouterProtoEventsMessage *)updatedEvents dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"updatedEvents"];
  }
  connectResponse = self->_connectResponse;
  if (connectResponse)
  {
    char v9 = [(HMDRemoteEventRouterProtoConnectResponse *)connectResponse dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"connectResponse"];
  }
  changeRegistrationsResponse = self->_changeRegistrationsResponse;
  if (changeRegistrationsResponse)
  {
    unint64_t v11 = [(HMDRemoteEventRouterProtoChangeRegistrationsResponse *)changeRegistrationsResponse dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"changeRegistrationsResponse"];
  }
  multiHopFetchEventsResponse = self->_multiHopFetchEventsResponse;
  if (multiHopFetchEventsResponse)
  {
    unint64_t v13 = [(HMDRemoteEventRouterProtoMultiHopFetchEventsResponse *)multiHopFetchEventsResponse dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"multiHopFetchEventsResponse"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t message = self->_message;
    if (message >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_message);
      id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v15 = off_264A27360[message];
    }
    [v4 setObject:v15 forKey:@"Message"];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDRemoteEventRouterProtoServerMessage;
  id v4 = [(HMDRemoteEventRouterProtoServerMessage *)&v8 description];
  id v5 = [(HMDRemoteEventRouterProtoServerMessage *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)clearOneofValuesForMessage
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_uint64_t message = 0;
  updatedEvents = self->_updatedEvents;
  self->_updatedEvents = 0;

  connectResponse = self->_connectResponse;
  self->_connectResponse = 0;

  changeRegistrationsResponse = self->_changeRegistrationsResponse;
  self->_changeRegistrationsResponse = 0;

  multiHopFetchEventsResponse = self->_multiHopFetchEventsResponse;
  self->_multiHopFetchEventsResponse = 0;
}

- (int)StringAsMessage:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"updatedEvents"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"connectResponse"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"changeRegistrationsResponse"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"multiHopFetchEventsResponse"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)messageAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_264A27360[a3];
  }
  return v3;
}

- (BOOL)hasMessage
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasMessage:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setMessage:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t message = a3;
}

- (int)message
{
  if (*(unsigned char *)&self->_has) {
    return self->_message;
  }
  else {
    return 0;
  }
}

- (void)setMultiHopFetchEventsResponse:(id)a3
{
  int v4 = (HMDRemoteEventRouterProtoMultiHopFetchEventsResponse *)a3;
  [(HMDRemoteEventRouterProtoServerMessage *)self clearOneofValuesForMessage];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t message = 4;
  multiHopFetchEventsResponse = self->_multiHopFetchEventsResponse;
  self->_multiHopFetchEventsResponse = v4;
}

- (BOOL)hasMultiHopFetchEventsResponse
{
  return self->_multiHopFetchEventsResponse != 0;
}

- (void)setChangeRegistrationsResponse:(id)a3
{
  int v4 = (HMDRemoteEventRouterProtoChangeRegistrationsResponse *)a3;
  [(HMDRemoteEventRouterProtoServerMessage *)self clearOneofValuesForMessage];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t message = 3;
  changeRegistrationsResponse = self->_changeRegistrationsResponse;
  self->_changeRegistrationsResponse = v4;
}

- (BOOL)hasChangeRegistrationsResponse
{
  return self->_changeRegistrationsResponse != 0;
}

- (void)setConnectResponse:(id)a3
{
  int v4 = (HMDRemoteEventRouterProtoConnectResponse *)a3;
  [(HMDRemoteEventRouterProtoServerMessage *)self clearOneofValuesForMessage];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t message = 2;
  connectResponse = self->_connectResponse;
  self->_connectResponse = v4;
}

- (BOOL)hasConnectResponse
{
  return self->_connectResponse != 0;
}

- (void)setUpdatedEvents:(id)a3
{
  int v4 = (HMDRemoteEventRouterProtoEventsMessage *)a3;
  [(HMDRemoteEventRouterProtoServerMessage *)self clearOneofValuesForMessage];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t message = 1;
  updatedEvents = self->_updatedEvents;
  self->_updatedEvents = v4;
}

- (BOOL)hasUpdatedEvents
{
  return self->_updatedEvents != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

@end