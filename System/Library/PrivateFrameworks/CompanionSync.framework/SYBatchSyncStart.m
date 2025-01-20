@interface SYBatchSyncStart
- (BOOL)hasEstimatedChangeCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)syncID;
- (SYMessageHeader)header;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)estimatedChangeCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEstimatedChangeCount:(unsigned int)a3;
- (void)setHasEstimatedChangeCount:(BOOL)a3;
- (void)setHeader:(id)a3;
- (void)setSyncID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYBatchSyncStart

- (void)setEstimatedChangeCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_estimatedChangeCount = a3;
}

- (void)setHasEstimatedChangeCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEstimatedChangeCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYBatchSyncStart;
  v4 = [(SYBatchSyncStart *)&v8 description];
  v5 = [(SYBatchSyncStart *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  header = self->_header;
  if (header)
  {
    v5 = [(SYMessageHeader *)header dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"header"];
  }
  syncID = self->_syncID;
  if (syncID) {
    [v3 setObject:syncID forKey:@"syncID"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v7 = [NSNumber numberWithUnsignedInt:self->_estimatedChangeCount];
    [v3 setObject:v7 forKey:@"estimatedChangeCount"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYBatchSyncStartReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_header) {
    -[SYBatchSyncStart writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (!self->_syncID) {
    -[SYBatchSyncStart writeTo:]();
  }
  PBDataWriterWriteStringField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setHeader:self->_header];
  [v4 setSyncID:self->_syncID];
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_estimatedChangeCount;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SYMessageHeader *)self->_header copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_syncID copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 8) = self->_estimatedChangeCount;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_10;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 2))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:")) {
      goto LABEL_10;
    }
  }
  syncID = self->_syncID;
  if ((unint64_t)syncID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](syncID, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_estimatedChangeCount == *((_DWORD *)v4 + 2))
    {
      BOOL v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SYMessageHeader *)self->_header hash];
  NSUInteger v4 = [(NSString *)self->_syncID hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_estimatedChangeCount;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  header = self->_header;
  uint64_t v6 = *((void *)v4 + 2);
  id v7 = v4;
  if (header)
  {
    if (!v6) {
      goto LABEL_7;
    }
    header = (SYMessageHeader *)-[SYMessageHeader mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    header = (SYMessageHeader *)-[SYBatchSyncStart setHeader:](self, "setHeader:");
  }
  id v4 = v7;
LABEL_7:
  if (*((void *)v4 + 3))
  {
    header = (SYMessageHeader *)-[SYBatchSyncStart setSyncID:](self, "setSyncID:");
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 32))
  {
    self->_estimatedChangeCount = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x270F9A758](header, v4);
}

- (SYMessageHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSString)syncID
{
  return self->_syncID;
}

- (void)setSyncID:(id)a3
{
}

- (unsigned)estimatedChangeCount
{
  return self->_estimatedChangeCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncID, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYBatchSyncStart writeTo:]", "SYBatchSyncStart.m", 121, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYBatchSyncStart writeTo:]", "SYBatchSyncStart.m", 126, "nil != self->_syncID");
}

@end