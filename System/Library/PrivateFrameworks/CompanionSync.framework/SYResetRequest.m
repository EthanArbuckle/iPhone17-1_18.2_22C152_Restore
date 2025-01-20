@interface SYResetRequest
- (BOOL)hasCancelSessionID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)cancelSessionID;
- (SYMessageHeader)header;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCancelSessionID:(id)a3;
- (void)setHeader:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYResetRequest

- (BOOL)hasCancelSessionID
{
  return self->_cancelSessionID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYResetRequest;
  v4 = [(SYResetRequest *)&v8 description];
  v5 = [(SYResetRequest *)self dictionaryRepresentation];
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
  cancelSessionID = self->_cancelSessionID;
  if (cancelSessionID) {
    [v3 setObject:cancelSessionID forKey:@"cancelSessionID"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYResetRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_header) {
    -[SYResetRequest writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_cancelSessionID) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setHeader:self->_header];
  if (self->_cancelSessionID) {
    objc_msgSend(v4, "setCancelSessionID:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SYMessageHeader *)self->_header copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_cancelSessionID copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((header = self->_header, !((unint64_t)header | v4[2])) || -[SYMessageHeader isEqual:](header, "isEqual:")))
  {
    cancelSessionID = self->_cancelSessionID;
    if ((unint64_t)cancelSessionID | v4[1]) {
      char v7 = -[NSString isEqual:](cancelSessionID, "isEqual:");
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
  return [(NSString *)self->_cancelSessionID hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  header = self->_header;
  uint64_t v6 = v4[2];
  char v7 = v4;
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
    header = (SYMessageHeader *)-[SYResetRequest setHeader:](self, "setHeader:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[1])
  {
    header = (SYMessageHeader *)-[SYResetRequest setCancelSessionID:](self, "setCancelSessionID:");
    id v4 = v7;
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

- (NSString)cancelSessionID
{
  return self->_cancelSessionID;
}

- (void)setCancelSessionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_cancelSessionID, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYResetRequest writeTo:]", "SYResetRequest.m", 101, "self->_header != nil");
}

@end