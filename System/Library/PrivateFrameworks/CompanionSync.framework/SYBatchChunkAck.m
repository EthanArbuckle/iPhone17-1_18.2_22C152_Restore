@interface SYBatchChunkAck
- (BOOL)hasError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)syncID;
- (SYErrorInfo)error;
- (SYMessageHeader)header;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)chunkIndex;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChunkIndex:(unsigned int)a3;
- (void)setError:(id)a3;
- (void)setHeader:(id)a3;
- (void)setSyncID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYBatchChunkAck

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYBatchChunkAck;
  v4 = [(SYBatchChunkAck *)&v8 description];
  v5 = [(SYBatchChunkAck *)self dictionaryRepresentation];
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
  v7 = [NSNumber numberWithUnsignedInt:self->_chunkIndex];
  [v3 setObject:v7 forKey:@"chunkIndex"];

  error = self->_error;
  if (error)
  {
    v9 = [(SYErrorInfo *)error dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"error"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYBatchChunkAckReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_header) {
    -[SYBatchChunkAck writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  if (!self->_syncID) {
    -[SYBatchChunkAck writeTo:]();
  }
  PBDataWriterWriteStringField();
  PBDataWriterWriteUint32Field();
  if (self->_error) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [v5 setHeader:self->_header];
  [v5 setSyncID:self->_syncID];
  id v4 = v5;
  v5[2] = self->_chunkIndex;
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SYMessageHeader *)self->_header copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_syncID copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  *(_DWORD *)(v5 + 8) = self->_chunkIndex;
  id v10 = [(SYErrorInfo *)self->_error copyWithZone:a3];
  v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((header = self->_header, !((unint64_t)header | v4[3])) || -[SYMessageHeader isEqual:](header, "isEqual:"))
    && ((syncID = self->_syncID, !((unint64_t)syncID | v4[4]))
     || -[NSString isEqual:](syncID, "isEqual:"))
    && self->_chunkIndex == *((_DWORD *)v4 + 2))
  {
    error = self->_error;
    if ((unint64_t)error | v4[2]) {
      char v8 = -[SYErrorInfo isEqual:](error, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SYMessageHeader *)self->_header hash];
  NSUInteger v4 = [(NSString *)self->_syncID hash] ^ v3;
  uint64_t v5 = 2654435761 * self->_chunkIndex;
  return v4 ^ [(SYErrorInfo *)self->_error hash] ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  header = self->_header;
  uint64_t v6 = *((void *)v4 + 3);
  id v9 = v4;
  if (header)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SYMessageHeader mergeFrom:](header, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SYBatchChunkAck setHeader:](self, "setHeader:");
  }
  id v4 = v9;
LABEL_7:
  if (*((void *)v4 + 4))
  {
    -[SYBatchChunkAck setSyncID:](self, "setSyncID:");
    id v4 = v9;
  }
  self->_chunkIndex = *((_DWORD *)v4 + 2);
  error = self->_error;
  uint64_t v8 = *((void *)v4 + 2);
  if (error)
  {
    if (!v8) {
      goto LABEL_15;
    }
    error = (SYErrorInfo *)-[SYErrorInfo mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    error = (SYErrorInfo *)-[SYBatchChunkAck setError:](self, "setError:");
  }
  id v4 = v9;
LABEL_15:
  MEMORY[0x270F9A758](error, v4);
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

- (unsigned)chunkIndex
{
  return self->_chunkIndex;
}

- (void)setChunkIndex:(unsigned int)a3
{
  self->_chunkIndex = a3;
}

- (SYErrorInfo)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncID, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYBatchChunkAck writeTo:]", "SYBatchChunkAck.m", 132, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYBatchChunkAck writeTo:]", "SYBatchChunkAck.m", 137, "nil != self->_syncID");
}

@end