@interface SYMessageHeader
- (BOOL)hasTimeout;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SYPeer)sender;
- (SYVectorClock)state;
- (double)timeout;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)sequenceNumber;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimeout:(BOOL)a3;
- (void)setSender:(id)a3;
- (void)setSequenceNumber:(unint64_t)a3;
- (void)setState:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTimestamp:(double)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYMessageHeader

- (void)setTimeout:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timeout = a3;
}

- (void)setHasTimeout:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimeout
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYMessageHeader;
  v4 = [(SYMessageHeader *)&v8 description];
  v5 = [(SYMessageHeader *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithDouble:self->_timestamp];
  [v3 setObject:v4 forKey:@"timestamp"];

  sender = self->_sender;
  if (sender)
  {
    v6 = [(SYPeer *)sender dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"sender"];
  }
  state = self->_state;
  if (state)
  {
    objc_super v8 = [(SYVectorClock *)state dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"state"];
  }
  v9 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v9 forKey:@"version"];

  v10 = [NSNumber numberWithUnsignedLongLong:self->_sequenceNumber];
  [v3 setObject:v10 forKey:@"sequenceNumber"];

  if (*(unsigned char *)&self->_has)
  {
    v11 = [NSNumber numberWithDouble:self->_timeout];
    [v3 setObject:v11 forKey:@"timeout"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYMessageHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteDoubleField();
  if (!self->_sender) {
    -[SYMessageHeader writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (!self->_state) {
    -[SYMessageHeader writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint64Field();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  v4[3] = *(void *)&self->_timestamp;
  [v4 setSender:self->_sender];
  [v4 setState:self->_state];
  *((_DWORD *)v4 + 12) = self->_version;
  v4[1] = self->_sequenceNumber;
  if (*(unsigned char *)&self->_has)
  {
    v4[2] = *(void *)&self->_timeout;
    *((unsigned char *)v4 + 52) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 24) = self->_timestamp;
  id v6 = [(SYPeer *)self->_sender copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  id v8 = [(SYVectorClock *)self->_state copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  *(_DWORD *)(v5 + 48) = self->_version;
  *(void *)(v5 + 8) = self->_sequenceNumber;
  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 16) = self->_timeout;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  if (self->_timestamp != *((double *)v4 + 3)) {
    goto LABEL_13;
  }
  sender = self->_sender;
  if ((unint64_t)sender | *((void *)v4 + 4))
  {
    if (!-[SYPeer isEqual:](sender, "isEqual:")) {
      goto LABEL_13;
    }
  }
  state = self->_state;
  if ((unint64_t)state | *((void *)v4 + 5))
  {
    if (!-[SYVectorClock isEqual:](state, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (self->_version != *((_DWORD *)v4 + 12) || self->_sequenceNumber != *((void *)v4 + 1)) {
    goto LABEL_13;
  }
  BOOL v7 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) != 0 && self->_timeout == *((double *)v4 + 2))
    {
      BOOL v7 = 1;
      goto LABEL_14;
    }
LABEL_13:
    BOOL v7 = 0;
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  double timestamp = self->_timestamp;
  double v4 = -timestamp;
  if (timestamp >= 0.0) {
    double v4 = self->_timestamp;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  unint64_t v12 = [(SYPeer *)self->_sender hash];
  unint64_t v13 = [(SYVectorClock *)self->_state hash];
  unsigned int version = self->_version;
  unint64_t sequenceNumber = self->_sequenceNumber;
  if (*(unsigned char *)&self->_has)
  {
    double timeout = self->_timeout;
    double v18 = -timeout;
    if (timeout >= 0.0) {
      double v18 = self->_timeout;
    }
    long double v19 = floor(v18 + 0.5);
    double v20 = (v18 - v19) * 1.84467441e19;
    double v21 = fmod(v19, 1.84467441e19);
    unint64_t v22 = 2654435761u * (unint64_t)v21;
    unint64_t v23 = v22 + (unint64_t)v20;
    if (v20 <= 0.0) {
      unint64_t v23 = 2654435761u * (unint64_t)v21;
    }
    unint64_t v16 = v22 - (unint64_t)fabs(v20);
    if (v20 >= 0.0) {
      unint64_t v16 = v23;
    }
  }
  else
  {
    unint64_t v16 = 0;
  }
  return v12 ^ v11 ^ v13 ^ (2654435761 * version) ^ (2654435761u * sequenceNumber) ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_double timestamp = *((double *)v4 + 3);
  sender = self->_sender;
  uint64_t v6 = *((void *)v4 + 4);
  id v9 = v4;
  if (sender)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SYPeer mergeFrom:](sender, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SYMessageHeader setSender:](self, "setSender:");
  }
  id v4 = v9;
LABEL_7:
  state = self->_state;
  uint64_t v8 = *((void *)v4 + 5);
  if (state)
  {
    if (!v8) {
      goto LABEL_13;
    }
    state = (SYVectorClock *)-[SYVectorClock mergeFrom:](state, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    state = (SYVectorClock *)-[SYMessageHeader setState:](self, "setState:");
  }
  id v4 = v9;
LABEL_13:
  self->_unsigned int version = *((_DWORD *)v4 + 12);
  self->_unint64_t sequenceNumber = *((void *)v4 + 1);
  if (*((unsigned char *)v4 + 52))
  {
    self->_double timeout = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x270F9A758](state, v4);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (SYPeer)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
}

- (SYVectorClock)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_unsigned int version = a3;
}

- (unint64_t)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unint64_t)a3
{
  self->_unint64_t sequenceNumber = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYMessageHeader writeTo:]", "SYMessageHeader.m", 159, "self->_sender != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYMessageHeader writeTo:]", "SYMessageHeader.m", 164, "self->_state != nil");
}

@end