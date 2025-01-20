@interface BMPBSubscriptionEvent
- (BOOL)hasBootUUID;
- (BOOL)hasClient;
- (BOOL)hasIdentifier;
- (BOOL)hasUseCase;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)starting;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (uint64_t)bootUUID;
- (uint64_t)client;
- (uint64_t)hasStarting;
- (uint64_t)identifier;
- (uint64_t)setHasStarting:(uint64_t)result;
- (uint64_t)setStarting:(uint64_t)result;
- (uint64_t)useCase;
- (unint64_t)hash;
- (void)copyTo:(uint64_t)a1;
- (void)mergeFrom:(uint64_t)a1;
- (void)setBootUUID:(uint64_t)a1;
- (void)setClient:(uint64_t)a1;
- (void)setIdentifier:(uint64_t)a1;
- (void)setUseCase:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation BMPBSubscriptionEvent

- (uint64_t)setStarting:(uint64_t)result
{
  if (result)
  {
    *(unsigned char *)(result + 44) |= 1u;
    *(unsigned char *)(result + 40) = a2;
  }
  return result;
}

- (uint64_t)setHasStarting:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 44) = *(unsigned char *)(result + 44) & 0xFE | a2;
  }
  return result;
}

- (uint64_t)hasStarting
{
  if (result) {
    return *(unsigned char *)(result + 44) & 1;
  }
  return result;
}

- (BOOL)hasClient
{
  if (result) {
    return *(void *)(result + 16) != 0;
  }
  return result;
}

- (BOOL)hasIdentifier
{
  if (result) {
    return *(void *)(result + 24) != 0;
  }
  return result;
}

- (BOOL)hasUseCase
{
  if (result) {
    return *(void *)(result + 32) != 0;
  }
  return result;
}

- (BOOL)hasBootUUID
{
  if (result) {
    return *(void *)(result + 8) != 0;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBSubscriptionEvent;
  v4 = [(BMPBSubscriptionEvent *)&v8 description];
  v5 = [(BMPBSubscriptionEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_starting];
    [v3 setObject:v4 forKey:@"starting"];
  }
  client = self->_client;
  if (client) {
    [v3 setObject:client forKey:@"client"];
  }
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  useCase = self->_useCase;
  if (useCase) {
    [v3 setObject:useCase forKey:@"useCase"];
  }
  bootUUID = self->_bootUUID;
  if (bootUUID) {
    [v3 setObject:bootUUID forKey:@"bootUUID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBSubscriptionEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_client)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_useCase)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_bootUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(uint64_t)a1
{
  v7 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 44))
    {
      v7[40] = *(unsigned char *)(a1 + 40);
      v7[44] |= 1u;
    }
    v3 = *(void **)(a1 + 16);
    if (v3) {
      -[BMPBSubscriptionEvent setClient:]((uint64_t)v7, v3);
    }
    id v4 = *(void **)(a1 + 24);
    if (v4) {
      -[BMPBSubscriptionEvent setIdentifier:]((uint64_t)v7, v4);
    }
    id v5 = *(void **)(a1 + 32);
    if (v5) {
      -[BMPBSubscriptionEvent setUseCase:]((uint64_t)v7, v5);
    }
    v6 = *(void **)(a1 + 8);
    if (v6) {
      -[BMPBSubscriptionEvent setBootUUID:]((uint64_t)v7, v6);
    }
  }
}

- (void)setClient:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (void)setIdentifier:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (void)setUseCase:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (void)setBootUUID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 40) = self->_starting;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_client copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSString *)self->_identifier copyWithZone:a3];
  v10 = (void *)v6[3];
  v6[3] = v9;

  uint64_t v11 = [(NSString *)self->_useCase copyWithZone:a3];
  v12 = (void *)v6[4];
  v6[4] = v11;

  uint64_t v13 = [(NSString *)self->_bootUUID copyWithZone:a3];
  v14 = (void *)v6[1];
  v6[1] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 44))
    {
      if (self->_starting)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_18;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_10;
      }
    }
LABEL_18:
    char v9 = 0;
    goto LABEL_19;
  }
  if (*((unsigned char *)v4 + 44)) {
    goto LABEL_18;
  }
LABEL_10:
  client = self->_client;
  if ((unint64_t)client | *((void *)v4 + 2) && !-[NSString isEqual:](client, "isEqual:")) {
    goto LABEL_18;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:")) {
      goto LABEL_18;
    }
  }
  useCase = self->_useCase;
  if ((unint64_t)useCase | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](useCase, "isEqual:")) {
      goto LABEL_18;
    }
  }
  bootUUID = self->_bootUUID;
  if ((unint64_t)bootUUID | *((void *)v4 + 1)) {
    char v9 = -[NSString isEqual:](bootUUID, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_19:

  return v9;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_starting;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_client hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_identifier hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_useCase hash];
  return v6 ^ [(NSString *)self->_bootUUID hash];
}

- (void)mergeFrom:(uint64_t)a1
{
  uint64_t v3 = a2;
  if (a1)
  {
    if (v3[44])
    {
      *(unsigned char *)(a1 + 40) = v3[40];
      *(unsigned char *)(a1 + 44) |= 1u;
    }
    NSUInteger v4 = (void *)*((void *)v3 + 2);
    objc_super v8 = v3;
    if (v4)
    {
      objc_storeStrong((id *)(a1 + 16), v4);
      uint64_t v3 = v8;
    }
    NSUInteger v5 = (void *)*((void *)v3 + 3);
    if (v5)
    {
      objc_storeStrong((id *)(a1 + 24), v5);
      uint64_t v3 = v8;
    }
    NSUInteger v6 = (void *)*((void *)v3 + 4);
    if (v6)
    {
      objc_storeStrong((id *)(a1 + 32), v6);
      uint64_t v3 = v8;
    }
    uint64_t v7 = (void *)*((void *)v3 + 1);
    if (v7)
    {
      objc_storeStrong((id *)(a1 + 8), v7);
      uint64_t v3 = v8;
    }
  }
}

- (BOOL)starting
{
  if (result) {
    return *(unsigned char *)(result + 40) != 0;
  }
  return result;
}

- (uint64_t)client
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (uint64_t)identifier
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (uint64_t)useCase
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (uint64_t)bootUUID
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCase, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_bootUUID, 0);
}

@end