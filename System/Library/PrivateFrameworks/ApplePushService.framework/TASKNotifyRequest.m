@interface TASKNotifyRequest
- (BOOL)hasCounter;
- (BOOL)hasIsLast;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLast;
- (BOOL)readFrom:(id)a3;
- (TASKOutput)output;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)taskId;
- (unint64_t)hash;
- (unsigned)counter;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCounter:(unsigned int)a3;
- (void)setHasCounter:(BOOL)a3;
- (void)setHasIsLast:(BOOL)a3;
- (void)setIsLast:(BOOL)a3;
- (void)setOutput:(id)a3;
- (void)setTaskId:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation TASKNotifyRequest

- (void)setCounter:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_counter = a3;
}

- (void)setHasCounter:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCounter
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsLast:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isLast = a3;
}

- (void)setHasIsLast:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsLast
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TASKNotifyRequest;
  char v3 = [(TASKNotifyRequest *)&v7 description];
  v4 = [(TASKNotifyRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithInt:self->_taskId];
  [v3 setObject:v4 forKey:@"taskId"];

  output = self->_output;
  if (output)
  {
    v6 = [(TASKOutput *)output dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"output"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v8 = +[NSNumber numberWithUnsignedInt:self->_counter];
    [v3 setObject:v8 forKey:@"counter"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = +[NSNumber numberWithBool:self->_isLast];
    [v3 setObject:v9 forKey:@"isLast"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100062428((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteSubmessage();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  v5[6] = self->_taskId;
  [v5 setOutput:self->_output];
  char has = (char)self->_has;
  if (has)
  {
    v5[2] = self->_counter;
    *((unsigned char *)v5 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 28) = self->_isLast;
    *((unsigned char *)v5 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[6] = self->_taskId;
  id v6 = [(TASKOutput *)self->_output copyWithZone:a3];
  objc_super v7 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v6;

  char has = (char)self->_has;
  if (has)
  {
    v5[2] = self->_counter;
    *((unsigned char *)v5 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 28) = self->_isLast;
    *((unsigned char *)v5 + 32) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  if (self->_taskId != *((_DWORD *)v4 + 6)) {
    goto LABEL_12;
  }
  output = self->_output;
  if ((unint64_t)output | *((void *)v4 + 2))
  {
    if (!-[TASKOutput isEqual:](output, "isEqual:")) {
      goto LABEL_12;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_counter != *((_DWORD *)v4 + 2)) {
      goto LABEL_12;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_12;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0)
    {
LABEL_12:
      BOOL v6 = 0;
      goto LABEL_13;
    }
    if (self->_isLast)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_12;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_12;
    }
    BOOL v6 = 1;
  }
LABEL_13:

  return v6;
}

- (unint64_t)hash
{
  uint64_t taskId = self->_taskId;
  unint64_t v4 = [(TASKOutput *)self->_output hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_counter;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v5 ^ v6 ^ (2654435761 * taskId);
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_isLast;
  return v4 ^ v5 ^ v6 ^ (2654435761 * taskId);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_uint64_t taskId = *((_DWORD *)v4 + 6);
  output = self->_output;
  uint64_t v6 = *((void *)v4 + 2);
  if (output)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[TASKOutput mergeFrom:](output, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[TASKNotifyRequest setOutput:](self, "setOutput:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 32);
  if (v7)
  {
    self->_counter = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 32);
  }
  if ((v7 & 2) != 0)
  {
    self->_isLast = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_has |= 2u;
  }
  _objc_release_x1();
}

- (int)taskId
{
  return self->_taskId;
}

- (void)setTaskId:(int)a3
{
  self->_uint64_t taskId = a3;
}

- (TASKOutput)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (unsigned)counter
{
  return self->_counter;
}

- (BOOL)isLast
{
  return self->_isLast;
}

- (void).cxx_destruct
{
}

@end