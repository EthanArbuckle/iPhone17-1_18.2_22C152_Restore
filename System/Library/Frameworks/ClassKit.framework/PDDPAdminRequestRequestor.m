@interface PDDPAdminRequestRequestor
+ (Class)serverRequestHeadersType;
- (BOOL)hasEmail;
- (BOOL)hasNote;
- (BOOL)hasState;
- (BOOL)hasVerificationCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)serverRequestHeaders;
- (NSString)email;
- (NSString)note;
- (NSString)verificationCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)serverRequestHeadersAtIndex:(unint64_t)a3;
- (id)stateAsString:(int)a3;
- (int)StringAsState:(id)a3;
- (int)state;
- (unint64_t)hash;
- (unint64_t)serverRequestHeadersCount;
- (void)addServerRequestHeaders:(id)a3;
- (void)clearServerRequestHeaders;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEmail:(id)a3;
- (void)setHasState:(BOOL)a3;
- (void)setNote:(id)a3;
- (void)setServerRequestHeaders:(id)a3;
- (void)setState:(int)a3;
- (void)setVerificationCode:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDDPAdminRequestRequestor

- (int)state
{
  if (*(unsigned char *)&self->_has) {
    return self->_state;
  }
  else {
    return 0;
  }
}

- (void)setState:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasState
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)stateAsString:(int)a3
{
  if (a3 >= 5)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = *(&off_1001F3C80 + a3);
  }

  return v3;
}

- (int)StringAsState:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UNKNOWN_VERIFICATION_STATE"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"UNVERIFIED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EMAIL_VERIFICATION_SENT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"EMAIL_VERIFICATION_FAILED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"EMAIL_VERIFIED"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasEmail
{
  return self->_email != 0;
}

- (BOOL)hasVerificationCode
{
  return self->_verificationCode != 0;
}

- (BOOL)hasNote
{
  return self->_note != 0;
}

- (void)clearServerRequestHeaders
{
}

- (void)addServerRequestHeaders:(id)a3
{
  id v4 = a3;
  serverRequestHeaders = self->_serverRequestHeaders;
  id v8 = v4;
  if (!serverRequestHeaders)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_serverRequestHeaders;
    self->_serverRequestHeaders = v6;

    id v4 = v8;
    serverRequestHeaders = self->_serverRequestHeaders;
  }
  [(NSMutableArray *)serverRequestHeaders addObject:v4];
}

- (unint64_t)serverRequestHeadersCount
{
  return (unint64_t)[(NSMutableArray *)self->_serverRequestHeaders count];
}

- (id)serverRequestHeadersAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_serverRequestHeaders objectAtIndex:a3];
}

+ (Class)serverRequestHeadersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDDPAdminRequestRequestor;
  id v3 = [(PDDPAdminRequestRequestor *)&v7 description];
  id v4 = [(PDDPAdminRequestRequestor *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t state = self->_state;
    if (state >= 5)
    {
      v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_state];
    }
    else
    {
      v5 = *(&off_1001F3C80 + state);
    }
    [v3 setObject:v5 forKey:@"state"];
  }
  email = self->_email;
  if (email) {
    [v3 setObject:email forKey:@"email"];
  }
  verificationCode = self->_verificationCode;
  if (verificationCode) {
    [v3 setObject:verificationCode forKey:@"verification_code"];
  }
  note = self->_note;
  if (note) {
    [v3 setObject:note forKey:@"note"];
  }
  if ([(NSMutableArray *)self->_serverRequestHeaders count])
  {
    id v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_serverRequestHeaders, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v10 = self->_serverRequestHeaders;
    id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) dictionaryRepresentation];
          [v9 addObject:v15];
        }
        id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKey:@"server_request_headers"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A6418((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_email) {
    PBDataWriterWriteStringField();
  }
  if (self->_verificationCode) {
    PBDataWriterWriteStringField();
  }
  if (self->_note) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_serverRequestHeaders;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    objc_super v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      objc_super v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_state;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  id v9 = v4;
  if (self->_email) {
    objc_msgSend(v4, "setEmail:");
  }
  if (self->_verificationCode) {
    objc_msgSend(v9, "setVerificationCode:");
  }
  if (self->_note) {
    objc_msgSend(v9, "setNote:");
  }
  if ([(PDDPAdminRequestRequestor *)self serverRequestHeadersCount])
  {
    [v9 clearServerRequestHeaders];
    unint64_t v5 = [(PDDPAdminRequestRequestor *)self serverRequestHeadersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PDDPAdminRequestRequestor *)self serverRequestHeadersAtIndex:i];
        [v9 addServerRequestHeaders:v8];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 8) = self->_state;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  id v7 = [(NSString *)self->_email copyWithZone:a3];
  uint64_t v8 = (void *)v6[1];
  v6[1] = v7;

  id v9 = [(NSString *)self->_verificationCode copyWithZone:a3];
  long long v10 = (void *)v6[5];
  v6[5] = v9;

  id v11 = [(NSString *)self->_note copyWithZone:a3];
  long long v12 = (void *)v6[2];
  v6[2] = v11;

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v13 = self->_serverRequestHeaders;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (void)v20);
        [v6 addServerRequestHeaders:v18];
      }
      id v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_state != *((_DWORD *)v4 + 8)) {
      goto LABEL_15;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_15:
    unsigned __int8 v9 = 0;
    goto LABEL_16;
  }
  email = self->_email;
  if ((unint64_t)email | *((void *)v4 + 1) && !-[NSString isEqual:](email, "isEqual:")) {
    goto LABEL_15;
  }
  verificationCode = self->_verificationCode;
  if ((unint64_t)verificationCode | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](verificationCode, "isEqual:")) {
      goto LABEL_15;
    }
  }
  note = self->_note;
  if ((unint64_t)note | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](note, "isEqual:")) {
      goto LABEL_15;
    }
  }
  serverRequestHeaders = self->_serverRequestHeaders;
  if ((unint64_t)serverRequestHeaders | *((void *)v4 + 3)) {
    unsigned __int8 v9 = -[NSMutableArray isEqual:](serverRequestHeaders, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_state;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(NSString *)self->_email hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_verificationCode hash];
  unint64_t v6 = v4 ^ v5 ^ [(NSString *)self->_note hash];
  return v6 ^ (unint64_t)[(NSMutableArray *)self->_serverRequestHeaders hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  id v5 = v4;
  if (v4[12])
  {
    self->_uint64_t state = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1)) {
    -[PDDPAdminRequestRequestor setEmail:](self, "setEmail:");
  }
  if (*((void *)v5 + 5)) {
    -[PDDPAdminRequestRequestor setVerificationCode:](self, "setVerificationCode:");
  }
  if (*((void *)v5 + 2)) {
    -[PDDPAdminRequestRequestor setNote:](self, "setNote:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v5 + 3);
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[PDDPAdminRequestRequestor addServerRequestHeaders:](self, "addServerRequestHeaders:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
}

- (NSString)verificationCode
{
  return self->_verificationCode;
}

- (void)setVerificationCode:(id)a3
{
}

- (NSString)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (NSMutableArray)serverRequestHeaders
{
  return self->_serverRequestHeaders;
}

- (void)setServerRequestHeaders:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_verificationCode, 0);
  objc_storeStrong((id *)&self->_serverRequestHeaders, 0);
  objc_storeStrong((id *)&self->_note, 0);

  objc_storeStrong((id *)&self->_email, 0);
}

@end