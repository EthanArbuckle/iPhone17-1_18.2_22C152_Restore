@interface BMPBUserFocusActivityEvent
- (BOOL)hasClientID;
- (BOOL)hasIsStart;
- (BOOL)hasMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStart;
- (BOOL)readFrom:(id)a3;
- (NSString)clientID;
- (NSString)mode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientID:(id)a3;
- (void)setHasIsStart:(BOOL)a3;
- (void)setIsStart:(BOOL)a3;
- (void)setMode:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBUserFocusActivityEvent

- (void)setIsStart:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_isStart = a3;
}

- (void)setHasIsStart:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsStart
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasMode
{
  return self->_mode != 0;
}

- (BOOL)hasClientID
{
  return self->_clientID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBUserFocusActivityEvent;
  v4 = [(BMPBUserFocusActivityEvent *)&v8 description];
  v5 = [(BMPBUserFocusActivityEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = [NSNumber numberWithBool:self->_isStart];
    [v3 setObject:v4 forKey:@"isStart"];
  }
  mode = self->_mode;
  if (mode) {
    [v3 setObject:mode forKey:@"mode"];
  }
  clientID = self->_clientID;
  if (clientID) {
    [v3 setObject:clientID forKey:@"clientID"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBUserFocusActivityEventReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_mode)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_isStart;
    v4[28] |= 1u;
  }
  id v5 = v4;
  if (self->_mode)
  {
    objc_msgSend(v4, "setMode:");
    id v4 = v5;
  }
  if (self->_clientID)
  {
    objc_msgSend(v5, "setClientID:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 24) = self->_isStart;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_mode copyWithZone:a3];
  objc_super v8 = (void *)v6[2];
  v6[2] = v7;

  uint64_t v9 = [(NSString *)self->_clientID copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 28))
    {
      if (self->_isStart)
      {
        if (!*((unsigned char *)v4 + 24)) {
          goto LABEL_14;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_10;
      }
    }
LABEL_14:
    char v7 = 0;
    goto LABEL_15;
  }
  if (*((unsigned char *)v4 + 28)) {
    goto LABEL_14;
  }
LABEL_10:
  mode = self->_mode;
  if ((unint64_t)mode | *((void *)v4 + 2) && !-[NSString isEqual:](mode, "isEqual:")) {
    goto LABEL_14;
  }
  clientID = self->_clientID;
  if ((unint64_t)clientID | *((void *)v4 + 1)) {
    char v7 = -[NSString isEqual:](clientID, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_isStart;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_mode hash] ^ v3;
  return v4 ^ [(NSString *)self->_clientID hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[28])
  {
    self->_isStart = v4[24];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = v4;
  if (*((void *)v4 + 2))
  {
    -[BMPBUserFocusActivityEvent setMode:](self, "setMode:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[BMPBUserFocusActivityEvent setClientID:](self, "setClientID:");
    NSUInteger v4 = v5;
  }
}

- (BOOL)isStart
{
  return self->_isStart;
}

- (NSString)mode
{
  return self->_mode;
}

- (void)setMode:(id)a3
{
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mode, 0);

  objc_storeStrong((id *)&self->_clientID, 0);
}

@end