@interface EDPBInteractionEventMarkedMuteThread
- (BOOL)hasConversationId;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)conversationId;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConversationId:(int64_t)a3;
- (void)setHasConversationId:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setValue:(BOOL)a3;
- (void)withHasher:(id)a3 setConversationID:(int64_t)a4 data:(id)a5;
- (void)writeTo:(id)a3;
@end

@implementation EDPBInteractionEventMarkedMuteThread

- (void)withHasher:(id)a3 setConversationID:(int64_t)a4 data:(id)a5
{
  id v10 = a3;
  id v8 = a5;
  -[EDPBInteractionEventMarkedMuteThread setConversationId:](self, "setConversationId:", [v10 hashedConversationID:a4]);
  v9 = [v8 objectForKeyedSubscript:@"value"];
  -[EDPBInteractionEventMarkedMuteThread setValue:](self, "setValue:", [v9 BOOLValue]);
}

- (void)setConversationId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_conversationId = a3;
}

- (void)setHasConversationId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConversationId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)EDPBInteractionEventMarkedMuteThread;
  v4 = [(EDPBInteractionEventMarkedMuteThread *)&v8 description];
  v5 = [(EDPBInteractionEventMarkedMuteThread *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithLongLong:self->_conversationId];
    [v3 setObject:v5 forKey:@"conversation_id"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_value];
    [v3 setObject:v6 forKey:@"value"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return EDPBInteractionEventMarkedMuteThreadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteSint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_conversationId;
    *((unsigned char *)v4 + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 16) = self->_value;
    *((unsigned char *)v4 + 20) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_conversationId;
    *((unsigned char *)result + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 16) = self->_value;
    *((unsigned char *)result + 20) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_conversationId != *((void *)v4 + 1)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_9;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0)
    {
LABEL_9:
      BOOL v5 = 0;
      goto LABEL_10;
    }
    if (self->_value)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_9;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_9;
    }
    BOOL v5 = 1;
  }
LABEL_10:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_conversationId;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_value;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if (v5)
  {
    self->_conversationId = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 20);
  }
  if ((v5 & 2) != 0)
  {
    self->_value = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int64_t)conversationId
{
  return self->_conversationId;
}

- (BOOL)value
{
  return self->_value;
}

@end