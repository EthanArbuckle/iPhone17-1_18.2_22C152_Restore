@interface BLTPBThreadMuteAssertion
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)threadID;
- (double)expirationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExpirationDate:(double)a3;
- (void)setThreadID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BLTPBThreadMuteAssertion

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BLTPBThreadMuteAssertion;
  v4 = [(BLTPBThreadMuteAssertion *)&v8 description];
  v5 = [(BLTPBThreadMuteAssertion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithDouble:self->_expirationDate];
  [v3 setObject:v4 forKey:@"expirationDate"];

  threadID = self->_threadID;
  if (threadID) {
    [v3 setObject:threadID forKey:@"threadID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBThreadMuteAssertionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteDoubleField();
  if (!self->_threadID) {
    -[BLTPBThreadMuteAssertion writeTo:]();
  }
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = *(void *)&self->_expirationDate;
  [a3 setThreadID:self->_threadID];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(double *)(v5 + 8) = self->_expirationDate;
  uint64_t v6 = [(NSString *)self->_threadID copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_expirationDate == *((double *)v4 + 1))
  {
    threadID = self->_threadID;
    if ((unint64_t)threadID | v4[2]) {
      char v6 = -[NSString isEqual:](threadID, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  double expirationDate = self->_expirationDate;
  double v4 = -expirationDate;
  if (expirationDate >= 0.0) {
    double v4 = self->_expirationDate;
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
  return [(NSString *)self->_threadID hash] ^ v11;
}

- (void)mergeFrom:(id)a3
{
  self->_double expirationDate = *((double *)a3 + 1);
  if (*((void *)a3 + 2)) {
    -[BLTPBThreadMuteAssertion setThreadID:](self, "setThreadID:");
  }
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(double)a3
{
  self->_double expirationDate = a3;
}

- (NSString)threadID
{
  return self->_threadID;
}

- (void)setThreadID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BLTPBThreadMuteAssertion writeTo:]", "BLTPBThreadMuteAssertion.m", 83, "nil != self->_threadID");
}

@end