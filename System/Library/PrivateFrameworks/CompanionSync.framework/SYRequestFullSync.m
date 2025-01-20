@interface SYRequestFullSync
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)syncID;
- (SYMessageHeader)header;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHeader:(id)a3;
- (void)setSyncID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYRequestFullSync

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYRequestFullSync;
  v4 = [(SYRequestFullSync *)&v8 description];
  v5 = [(SYRequestFullSync *)self dictionaryRepresentation];
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
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYRequestFullSyncReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_header) {
    -[SYRequestFullSync writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
  if (!self->_syncID) {
    -[SYRequestFullSync writeTo:]();
  }
  PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  header = self->_header;
  id v5 = a3;
  [v5 setHeader:header];
  [v5 setSyncID:self->_syncID];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SYMessageHeader *)self->_header copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_syncID copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((header = self->_header, !((unint64_t)header | v4[1])) || -[SYMessageHeader isEqual:](header, "isEqual:")))
  {
    syncID = self->_syncID;
    if ((unint64_t)syncID | v4[2]) {
      char v7 = -[NSString isEqual:](syncID, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SYMessageHeader *)self->_header hash];
  return [(NSString *)self->_syncID hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  header = self->_header;
  uint64_t v6 = v4[1];
  char v7 = v4;
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
    -[SYRequestFullSync setHeader:](self, "setHeader:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[2]) {
    -[SYRequestFullSync setSyncID:](self, "setSyncID:");
  }
  MEMORY[0x270F9A758]();
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncID, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYRequestFullSync writeTo:]", "SYRequestFullSync.m", 97, "self->_header != nil");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SYRequestFullSync writeTo:]", "SYRequestFullSync.m", 102, "nil != self->_syncID");
}

@end