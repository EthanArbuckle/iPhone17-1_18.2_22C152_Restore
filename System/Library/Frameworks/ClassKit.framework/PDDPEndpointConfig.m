@interface PDDPEndpointConfig
- (BOOL)hasIdentifier;
- (BOOL)hasIsInternal;
- (BOOL)hasMescalSignRequests;
- (BOOL)hasMescalVerifyResponses;
- (BOOL)hasPayloadLimitBytes;
- (BOOL)hasPayloadLimitItems;
- (BOOL)hasRequiresAuth;
- (BOOL)hasResponseTTLSeconds;
- (BOOL)hasServiceId;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInternal;
- (BOOL)mescalSignRequests;
- (BOOL)mescalVerifyResponses;
- (BOOL)readFrom:(id)a3;
- (BOOL)requiresAuth;
- (NSString)identifier;
- (NSString)serviceId;
- (NSString)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)payloadLimitBytes;
- (int)payloadLimitItems;
- (int)responseTTLSeconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsInternal:(BOOL)a3;
- (void)setHasMescalSignRequests:(BOOL)a3;
- (void)setHasMescalVerifyResponses:(BOOL)a3;
- (void)setHasPayloadLimitBytes:(BOOL)a3;
- (void)setHasPayloadLimitItems:(BOOL)a3;
- (void)setHasRequiresAuth:(BOOL)a3;
- (void)setHasResponseTTLSeconds:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsInternal:(BOOL)a3;
- (void)setMescalSignRequests:(BOOL)a3;
- (void)setMescalVerifyResponses:(BOOL)a3;
- (void)setPayloadLimitBytes:(int)a3;
- (void)setPayloadLimitItems:(int)a3;
- (void)setRequiresAuth:(BOOL)a3;
- (void)setResponseTTLSeconds:(int)a3;
- (void)setServiceId:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPEndpointConfig

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (void)setPayloadLimitItems:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_payloadLimitItems = a3;
}

- (void)setHasPayloadLimitItems:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPayloadLimitItems
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setPayloadLimitBytes:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_payloadLimitBytes = a3;
}

- (void)setHasPayloadLimitBytes:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPayloadLimitBytes
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setResponseTTLSeconds:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_responseTTLSeconds = a3;
}

- (void)setHasResponseTTLSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasResponseTTLSeconds
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRequiresAuth:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_requiresAuth = a3;
}

- (void)setHasRequiresAuth:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasRequiresAuth
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setMescalSignRequests:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_mescalSignRequests = a3;
}

- (void)setHasMescalSignRequests:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMescalSignRequests
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setMescalVerifyResponses:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_mescalVerifyResponses = a3;
}

- (void)setHasMescalVerifyResponses:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasMescalVerifyResponses
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasServiceId
{
  return self->_serviceId != 0;
}

- (void)setIsInternal:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isInternal = a3;
}

- (void)setHasIsInternal:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsInternal
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPEndpointConfig;
  char v3 = [(PDDPEndpointConfig *)&v7 description];
  v4 = [(PDDPEndpointConfig *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  url = self->_url;
  if (url) {
    [v4 setObject:url forKey:@"url"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v12 = +[NSNumber numberWithInt:self->_payloadLimitItems];
    [v4 setObject:v12 forKey:@"payload_limit_items"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  v13 = +[NSNumber numberWithInt:self->_payloadLimitBytes];
  [v4 setObject:v13 forKey:@"payload_limit_bytes"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  v14 = +[NSNumber numberWithInt:self->_responseTTLSeconds];
  [v4 setObject:v14 forKey:@"response_TTL_seconds"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  v15 = +[NSNumber numberWithBool:self->_requiresAuth];
  [v4 setObject:v15 forKey:@"requires_auth"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  v16 = +[NSNumber numberWithBool:self->_mescalSignRequests];
  [v4 setObject:v16 forKey:@"mescal_sign_requests"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_11:
    v8 = +[NSNumber numberWithBool:self->_mescalVerifyResponses];
    [v4 setObject:v8 forKey:@"mescal_verify_responses"];
  }
LABEL_12:
  serviceId = self->_serviceId;
  if (serviceId) {
    [v4 setObject:serviceId forKey:@"service_id"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v10 = +[NSNumber numberWithBool:self->_isInternal];
    [v4 setObject:v10 forKey:@"is_internal"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000699C4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_url)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_12:
  if (self->_serviceId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v6;
  }
  if (self->_url)
  {
    objc_msgSend(v6, "setUrl:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_payloadLimitItems;
    *((unsigned char *)v4 + 52) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 4) = self->_payloadLimitBytes;
  *((unsigned char *)v4 + 52) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 6) = self->_responseTTLSeconds;
  *((unsigned char *)v4 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)v4 + 51) = self->_requiresAuth;
  *((unsigned char *)v4 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  *((unsigned char *)v4 + 49) = self->_mescalSignRequests;
  *((unsigned char *)v4 + 52) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_11:
    *((unsigned char *)v4 + 50) = self->_mescalVerifyResponses;
    *((unsigned char *)v4 + 52) |= 0x20u;
  }
LABEL_12:
  if (self->_serviceId)
  {
    objc_msgSend(v6, "setServiceId:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v4 + 48) = self->_isInternal;
    *((unsigned char *)v4 + 52) |= 8u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_identifier copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_url copyWithZone:a3];
  v9 = (void *)v5[5];
  v5[5] = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 5) = self->_payloadLimitItems;
    *((unsigned char *)v5 + 52) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 4) = self->_payloadLimitBytes;
  *((unsigned char *)v5 + 52) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x40) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((_DWORD *)v5 + 6) = self->_responseTTLSeconds;
  *((unsigned char *)v5 + 52) |= 4u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((unsigned char *)v5 + 51) = self->_requiresAuth;
  *((unsigned char *)v5 + 52) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  *((unsigned char *)v5 + 49) = self->_mescalSignRequests;
  *((unsigned char *)v5 + 52) |= 0x10u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    *((unsigned char *)v5 + 50) = self->_mescalVerifyResponses;
    *((unsigned char *)v5 + 52) |= 0x20u;
  }
LABEL_8:
  id v11 = [(NSString *)self->_serviceId copyWithZone:a3];
  v12 = (void *)v5[4];
  v5[4] = v11;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v5 + 48) = self->_isInternal;
    *((unsigned char *)v5 + 52) |= 8u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_50;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_50;
    }
  }
  url = self->_url;
  if ((unint64_t)url | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](url, "isEqual:")) {
      goto LABEL_50;
    }
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 52);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_payloadLimitItems != *((_DWORD *)v4 + 5)) {
      goto LABEL_50;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_50;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_payloadLimitBytes != *((_DWORD *)v4 + 4)) {
      goto LABEL_50;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_50;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_responseTTLSeconds != *((_DWORD *)v4 + 6)) {
      goto LABEL_50;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_50;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x40) == 0) {
      goto LABEL_50;
    }
    if (self->_requiresAuth)
    {
      if (!*((unsigned char *)v4 + 51)) {
        goto LABEL_50;
      }
    }
    else if (*((unsigned char *)v4 + 51))
    {
      goto LABEL_50;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 0x40) != 0)
  {
    goto LABEL_50;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x10) == 0) {
      goto LABEL_50;
    }
    if (self->_mescalSignRequests)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_50;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_50;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 0x10) != 0)
  {
    goto LABEL_50;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 0x20) == 0) {
      goto LABEL_50;
    }
    if (self->_mescalVerifyResponses)
    {
      if (!*((unsigned char *)v4 + 50)) {
        goto LABEL_50;
      }
    }
    else if (*((unsigned char *)v4 + 50))
    {
      goto LABEL_50;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 0x20) != 0)
  {
    goto LABEL_50;
  }
  serviceId = self->_serviceId;
  if ((unint64_t)serviceId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](serviceId, "isEqual:")) {
      goto LABEL_50;
    }
    char has = (char)self->_has;
    char v8 = *((unsigned char *)v4 + 52);
  }
  BOOL v10 = (v8 & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((v8 & 8) != 0)
    {
      if (self->_isInternal)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_50;
        }
      }
      else if (*((unsigned char *)v4 + 48))
      {
        goto LABEL_50;
      }
      BOOL v10 = 1;
      goto LABEL_51;
    }
LABEL_50:
    BOOL v10 = 0;
  }
LABEL_51:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v13 = [(NSString *)self->_identifier hash];
  NSUInteger v3 = [(NSString *)self->_url hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_payloadLimitItems;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_payloadLimitBytes;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_responseTTLSeconds;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
LABEL_5:
    uint64_t v7 = 2654435761 * self->_requiresAuth;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_mescalSignRequests;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_mescalVerifyResponses;
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v9 = 0;
LABEL_14:
  NSUInteger v10 = [(NSString *)self->_serviceId hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v11 = 2654435761 * self->_isInternal;
  }
  else {
    uint64_t v11 = 0;
  }
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 1))
  {
    -[PDDPEndpointConfig setIdentifier:](self, "setIdentifier:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[PDDPEndpointConfig setUrl:](self, "setUrl:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 2) != 0)
  {
    self->_payloadLimitItems = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 52);
    if ((v5 & 1) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 1) == 0)
  {
    goto LABEL_7;
  }
  self->_payloadLimitBytes = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_responseTTLSeconds = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_requiresAuth = *((unsigned char *)v4 + 51);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 0x10) == 0)
  {
LABEL_10:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  self->_mescalSignRequests = *((unsigned char *)v4 + 49);
  *(unsigned char *)&self->_has |= 0x10u;
  if ((*((unsigned char *)v4 + 52) & 0x20) != 0)
  {
LABEL_11:
    self->_mescalVerifyResponses = *((unsigned char *)v4 + 50);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_12:
  if (*((void *)v4 + 4))
  {
    -[PDDPEndpointConfig setServiceId:](self, "setServiceId:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
    self->_isInternal = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 8u;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (int)payloadLimitItems
{
  return self->_payloadLimitItems;
}

- (int)payloadLimitBytes
{
  return self->_payloadLimitBytes;
}

- (int)responseTTLSeconds
{
  return self->_responseTTLSeconds;
}

- (BOOL)requiresAuth
{
  return self->_requiresAuth;
}

- (BOOL)mescalSignRequests
{
  return self->_mescalSignRequests;
}

- (BOOL)mescalVerifyResponses
{
  return self->_mescalVerifyResponses;
}

- (NSString)serviceId
{
  return self->_serviceId;
}

- (void)setServiceId:(id)a3
{
}

- (BOOL)isInternal
{
  return self->_isInternal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_serviceId, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end