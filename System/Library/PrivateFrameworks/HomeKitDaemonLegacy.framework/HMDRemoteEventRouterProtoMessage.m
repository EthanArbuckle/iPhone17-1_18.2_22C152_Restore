@interface HMDRemoteEventRouterProtoMessage
- (BOOL)hasChangeRegistrations;
- (BOOL)hasConnect;
- (BOOL)hasDisconnect;
- (BOOL)hasFetchEvents;
- (BOOL)hasIdentifier;
- (BOOL)hasKeepAlive;
- (BOOL)hasRequest;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HMDRemoteEventRouterProtoChangeRegistrationsMessage)changeRegistrations;
- (HMDRemoteEventRouterProtoConnectMessage)connect;
- (HMDRemoteEventRouterProtoDisconnectMessage)disconnect;
- (HMDRemoteEventRouterProtoFetchEventsMessage)fetchEvents;
- (HMDRemoteEventRouterProtoKeepAliveMessage)keepAlive;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)requestAsString:(int)a3;
- (int)StringAsRequest:(id)a3;
- (int)request;
- (unint64_t)hash;
- (void)clearOneofValuesForRequest;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChangeRegistrations:(id)a3;
- (void)setConnect:(id)a3;
- (void)setDisconnect:(id)a3;
- (void)setFetchEvents:(id)a3;
- (void)setHasRequest:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setKeepAlive:(id)a3;
- (void)setRequest:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMDRemoteEventRouterProtoMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fetchEvents, 0);
  objc_storeStrong((id *)&self->_disconnect, 0);
  objc_storeStrong((id *)&self->_connect, 0);
  objc_storeStrong((id *)&self->_changeRegistrations, 0);
}

- (HMDRemoteEventRouterProtoFetchEventsMessage)fetchEvents
{
  return self->_fetchEvents;
}

- (HMDRemoteEventRouterProtoDisconnectMessage)disconnect
{
  return self->_disconnect;
}

- (HMDRemoteEventRouterProtoKeepAliveMessage)keepAlive
{
  return self->_keepAlive;
}

- (HMDRemoteEventRouterProtoChangeRegistrationsMessage)changeRegistrations
{
  return self->_changeRegistrations;
}

- (HMDRemoteEventRouterProtoConnectMessage)connect
{
  return self->_connect;
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
  if (*((unsigned char *)v4 + 60))
  {
    self->_request = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 1u;
  }
  v16 = v4;
  if (*((void *)v4 + 5))
  {
    -[HMDRemoteEventRouterProtoMessage setIdentifier:](self, "setIdentifier:");
    v5 = v16;
  }
  connect = self->_connect;
  uint64_t v7 = v5[2];
  if (connect)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[HMDRemoteEventRouterProtoConnectMessage mergeFrom:](connect, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[HMDRemoteEventRouterProtoMessage setConnect:](self, "setConnect:");
  }
  v5 = v16;
LABEL_11:
  changeRegistrations = self->_changeRegistrations;
  uint64_t v9 = v5[1];
  if (changeRegistrations)
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[HMDRemoteEventRouterProtoChangeRegistrationsMessage mergeFrom:](changeRegistrations, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    -[HMDRemoteEventRouterProtoMessage setChangeRegistrations:](self, "setChangeRegistrations:");
  }
  v5 = v16;
LABEL_17:
  keepAlive = self->_keepAlive;
  uint64_t v11 = v5[6];
  if (keepAlive)
  {
    if (!v11) {
      goto LABEL_23;
    }
    -[HMDRemoteEventRouterProtoKeepAliveMessage mergeFrom:](keepAlive, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_23;
    }
    -[HMDRemoteEventRouterProtoMessage setKeepAlive:](self, "setKeepAlive:");
  }
  v5 = v16;
LABEL_23:
  disconnect = self->_disconnect;
  uint64_t v13 = v5[3];
  if (disconnect)
  {
    if (!v13) {
      goto LABEL_29;
    }
    -[HMDRemoteEventRouterProtoDisconnectMessage mergeFrom:](disconnect, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_29;
    }
    -[HMDRemoteEventRouterProtoMessage setDisconnect:](self, "setDisconnect:");
  }
  v5 = v16;
LABEL_29:
  fetchEvents = self->_fetchEvents;
  uint64_t v15 = v5[4];
  if (fetchEvents)
  {
    if (!v15) {
      goto LABEL_35;
    }
    fetchEvents = (HMDRemoteEventRouterProtoFetchEventsMessage *)-[HMDRemoteEventRouterProtoFetchEventsMessage mergeFrom:](fetchEvents, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_35;
    }
    fetchEvents = (HMDRemoteEventRouterProtoFetchEventsMessage *)-[HMDRemoteEventRouterProtoMessage setFetchEvents:](self, "setFetchEvents:");
  }
  v5 = v16;
LABEL_35:
  MEMORY[0x1F41817F8](fetchEvents, v5);
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_request;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_identifier hash] ^ v3;
  unint64_t v5 = [(HMDRemoteEventRouterProtoConnectMessage *)self->_connect hash];
  unint64_t v6 = v4 ^ v5 ^ [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self->_changeRegistrations hash];
  unint64_t v7 = [(HMDRemoteEventRouterProtoKeepAliveMessage *)self->_keepAlive hash];
  unint64_t v8 = v7 ^ [(HMDRemoteEventRouterProtoDisconnectMessage *)self->_disconnect hash];
  return v6 ^ v8 ^ [(HMDRemoteEventRouterProtoFetchEventsMessage *)self->_fetchEvents hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_request != *((_DWORD *)v4 + 14)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
LABEL_19:
    char v11 = 0;
    goto LABEL_20;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 5) && !-[NSString isEqual:](identifier, "isEqual:")) {
    goto LABEL_19;
  }
  connect = self->_connect;
  if ((unint64_t)connect | *((void *)v4 + 2))
  {
    if (!-[HMDRemoteEventRouterProtoConnectMessage isEqual:](connect, "isEqual:")) {
      goto LABEL_19;
    }
  }
  changeRegistrations = self->_changeRegistrations;
  if ((unint64_t)changeRegistrations | *((void *)v4 + 1))
  {
    if (!-[HMDRemoteEventRouterProtoChangeRegistrationsMessage isEqual:](changeRegistrations, "isEqual:")) {
      goto LABEL_19;
    }
  }
  keepAlive = self->_keepAlive;
  if ((unint64_t)keepAlive | *((void *)v4 + 6))
  {
    if (!-[HMDRemoteEventRouterProtoKeepAliveMessage isEqual:](keepAlive, "isEqual:")) {
      goto LABEL_19;
    }
  }
  disconnect = self->_disconnect;
  if ((unint64_t)disconnect | *((void *)v4 + 3))
  {
    if (!-[HMDRemoteEventRouterProtoDisconnectMessage isEqual:](disconnect, "isEqual:")) {
      goto LABEL_19;
    }
  }
  fetchEvents = self->_fetchEvents;
  if ((unint64_t)fetchEvents | *((void *)v4 + 4)) {
    char v11 = -[HMDRemoteEventRouterProtoFetchEventsMessage isEqual:](fetchEvents, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_20:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 56) = self->_request;
    *(unsigned char *)(v5 + 60) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_identifier copyWithZone:a3];
  unint64_t v8 = (void *)v6[5];
  v6[5] = v7;

  id v9 = [(HMDRemoteEventRouterProtoConnectMessage *)self->_connect copyWithZone:a3];
  v10 = (void *)v6[2];
  v6[2] = v9;

  id v11 = [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)self->_changeRegistrations copyWithZone:a3];
  v12 = (void *)v6[1];
  v6[1] = v11;

  id v13 = [(HMDRemoteEventRouterProtoKeepAliveMessage *)self->_keepAlive copyWithZone:a3];
  v14 = (void *)v6[6];
  v6[6] = v13;

  id v15 = [(HMDRemoteEventRouterProtoDisconnectMessage *)self->_disconnect copyWithZone:a3];
  v16 = (void *)v6[3];
  v6[3] = v15;

  id v17 = [(HMDRemoteEventRouterProtoFetchEventsMessage *)self->_fetchEvents copyWithZone:a3];
  v18 = (void *)v6[4];
  v6[4] = v17;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[14] = self->_request;
    *((unsigned char *)v4 + 60) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v5;
  }
  if (self->_connect)
  {
    objc_msgSend(v5, "setConnect:");
    id v4 = v5;
  }
  if (self->_changeRegistrations)
  {
    objc_msgSend(v5, "setChangeRegistrations:");
    id v4 = v5;
  }
  if (self->_keepAlive)
  {
    objc_msgSend(v5, "setKeepAlive:");
    id v4 = v5;
  }
  if (self->_disconnect)
  {
    objc_msgSend(v5, "setDisconnect:");
    id v4 = v5;
  }
  if (self->_fetchEvents)
  {
    objc_msgSend(v5, "setFetchEvents:");
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
  if (self->_connect)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_changeRegistrations)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_keepAlive)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_disconnect)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_fetchEvents)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  id v5 = (int *)MEMORY[0x1E4F940E0];
  unint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    unint64_t v8 = (int *)MEMORY[0x1E4F940B8];
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
              goto LABEL_44;
            }
            unint64_t v21 = v20 + 1;
            int v22 = *(char *)(*(void *)((char *)a3 + *v8) + v20);
            *(void *)((char *)a3 + v19) = v21;
            if ((v22 & 0x80000000) == 0) {
              break;
            }
          }
          while (v18++ <= 8);
          goto LABEL_44;
        case 1u:
          PBReaderReadString();
          v24 = (NSString *)objc_claimAutoreleasedReturnValue();
          identifier = self->_identifier;
          self->_identifier = v24;

          goto LABEL_44;
        case 2u:
          [(HMDRemoteEventRouterProtoMessage *)self clearOneofValuesForRequest];
          *(unsigned char *)&self->_has |= 1u;
          self->_request = 1;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoConnectMessage);
          objc_storeStrong((id *)&self->_connect, v26);
          if (!PBReaderPlaceMark()
            || (HMDRemoteEventRouterProtoConnectMessageReadFrom((uint64_t)v26, (uint64_t)a3) & 1) == 0)
          {
            goto LABEL_48;
          }
          goto LABEL_43;
        case 3u:
          [(HMDRemoteEventRouterProtoMessage *)self clearOneofValuesForRequest];
          *(unsigned char *)&self->_has |= 1u;
          self->_request = 2;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoChangeRegistrationsMessage);
          objc_storeStrong((id *)&self->_changeRegistrations, v26);
          if (!PBReaderPlaceMark()
            || !HMDRemoteEventRouterProtoChangeRegistrationsMessageReadFrom(v26, (uint64_t)a3))
          {
            goto LABEL_48;
          }
          goto LABEL_43;
        case 4u:
          [(HMDRemoteEventRouterProtoMessage *)self clearOneofValuesForRequest];
          *(unsigned char *)&self->_has |= 1u;
          self->_request = 3;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoKeepAliveMessage);
          objc_storeStrong((id *)&self->_keepAlive, v26);
          if (!PBReaderPlaceMark() || !HMDRemoteEventRouterProtoDisconnectMessageReadFrom((uint64_t)a3)) {
            goto LABEL_48;
          }
          goto LABEL_43;
        case 5u:
          [(HMDRemoteEventRouterProtoMessage *)self clearOneofValuesForRequest];
          *(unsigned char *)&self->_has |= 1u;
          self->_request = 4;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoDisconnectMessage);
          objc_storeStrong((id *)&self->_disconnect, v26);
          if (!PBReaderPlaceMark() || !HMDRemoteEventRouterProtoDisconnectMessageReadFrom((uint64_t)a3)) {
            goto LABEL_48;
          }
          goto LABEL_43;
        case 7u:
          [(HMDRemoteEventRouterProtoMessage *)self clearOneofValuesForRequest];
          *(unsigned char *)&self->_has |= 1u;
          self->_request = 5;
          v26 = objc_alloc_init(HMDRemoteEventRouterProtoFetchEventsMessage);
          objc_storeStrong((id *)&self->_fetchEvents, v26);
          if (!PBReaderPlaceMark()
            || (HMDRemoteEventRouterProtoFetchEventsMessageReadFrom((uint64_t)v26, (uint64_t)a3) & 1) == 0)
          {
LABEL_48:

            LOBYTE(v27) = 0;
            return v27;
          }
LABEL_43:
          PBReaderRecallMark();

LABEL_44:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_47;
          }
          break;
        default:
          int v27 = PBReaderSkipValueWithTag();
          if (!v27) {
            return v27;
          }
          goto LABEL_44;
      }
    }
  }
LABEL_47:
  LOBYTE(v27) = *((unsigned char *)a3 + *v6) == 0;
  return v27;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  connect = self->_connect;
  if (connect)
  {
    uint64_t v7 = [(HMDRemoteEventRouterProtoConnectMessage *)connect dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"connect"];
  }
  changeRegistrations = self->_changeRegistrations;
  if (changeRegistrations)
  {
    char v9 = [(HMDRemoteEventRouterProtoChangeRegistrationsMessage *)changeRegistrations dictionaryRepresentation];
    [v4 setObject:v9 forKey:@"changeRegistrations"];
  }
  keepAlive = self->_keepAlive;
  if (keepAlive)
  {
    unint64_t v11 = [(HMDRemoteEventRouterProtoKeepAliveMessage *)keepAlive dictionaryRepresentation];
    [v4 setObject:v11 forKey:@"keepAlive"];
  }
  disconnect = self->_disconnect;
  if (disconnect)
  {
    unint64_t v13 = [(HMDRemoteEventRouterProtoDisconnectMessage *)disconnect dictionaryRepresentation];
    [v4 setObject:v13 forKey:@"disconnect"];
  }
  fetchEvents = self->_fetchEvents;
  if (fetchEvents)
  {
    id v15 = [(HMDRemoteEventRouterProtoFetchEventsMessage *)fetchEvents dictionaryRepresentation];
    [v4 setObject:v15 forKey:@"fetchEvents"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t request = self->_request;
    if (request >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_request);
      id v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v17 = off_1E6A17C78[request];
    }
    [v4 setObject:v17 forKey:@"Request"];
  }
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDRemoteEventRouterProtoMessage;
  id v4 = [(HMDRemoteEventRouterProtoMessage *)&v8 description];
  id v5 = [(HMDRemoteEventRouterProtoMessage *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (void)clearOneofValuesForRequest
{
  *(unsigned char *)&self->_has &= ~1u;
  self->_uint64_t request = 0;
  connect = self->_connect;
  self->_connect = 0;

  changeRegistrations = self->_changeRegistrations;
  self->_changeRegistrations = 0;

  keepAlive = self->_keepAlive;
  self->_keepAlive = 0;

  disconnect = self->_disconnect;
  self->_disconnect = 0;

  fetchEvents = self->_fetchEvents;
  self->_fetchEvents = 0;
}

- (int)StringAsRequest:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"connect"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"changeRegistrations"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"keepAlive"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"disconnect"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"fetchEvents"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)requestAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E6A17C78[a3];
  }
  return v3;
}

- (BOOL)hasRequest
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRequest:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRequest:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t request = a3;
}

- (int)request
{
  if (*(unsigned char *)&self->_has) {
    return self->_request;
  }
  else {
    return 0;
  }
}

- (void)setFetchEvents:(id)a3
{
  int v4 = (HMDRemoteEventRouterProtoFetchEventsMessage *)a3;
  [(HMDRemoteEventRouterProtoMessage *)self clearOneofValuesForRequest];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t request = 5;
  fetchEvents = self->_fetchEvents;
  self->_fetchEvents = v4;
}

- (BOOL)hasFetchEvents
{
  return self->_fetchEvents != 0;
}

- (void)setDisconnect:(id)a3
{
  int v4 = (HMDRemoteEventRouterProtoDisconnectMessage *)a3;
  [(HMDRemoteEventRouterProtoMessage *)self clearOneofValuesForRequest];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t request = 4;
  disconnect = self->_disconnect;
  self->_disconnect = v4;
}

- (BOOL)hasDisconnect
{
  return self->_disconnect != 0;
}

- (void)setKeepAlive:(id)a3
{
  int v4 = (HMDRemoteEventRouterProtoKeepAliveMessage *)a3;
  [(HMDRemoteEventRouterProtoMessage *)self clearOneofValuesForRequest];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t request = 3;
  keepAlive = self->_keepAlive;
  self->_keepAlive = v4;
}

- (BOOL)hasKeepAlive
{
  return self->_keepAlive != 0;
}

- (void)setChangeRegistrations:(id)a3
{
  int v4 = (HMDRemoteEventRouterProtoChangeRegistrationsMessage *)a3;
  [(HMDRemoteEventRouterProtoMessage *)self clearOneofValuesForRequest];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t request = 2;
  changeRegistrations = self->_changeRegistrations;
  self->_changeRegistrations = v4;
}

- (BOOL)hasChangeRegistrations
{
  return self->_changeRegistrations != 0;
}

- (void)setConnect:(id)a3
{
  int v4 = (HMDRemoteEventRouterProtoConnectMessage *)a3;
  [(HMDRemoteEventRouterProtoMessage *)self clearOneofValuesForRequest];
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t request = 1;
  connect = self->_connect;
  self->_connect = v4;
}

- (BOOL)hasConnect
{
  return self->_connect != 0;
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

@end