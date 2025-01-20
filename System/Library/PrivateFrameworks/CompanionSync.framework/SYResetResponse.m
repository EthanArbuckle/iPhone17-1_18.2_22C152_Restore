@interface SYResetResponse
- (BOOL)accepted;
- (BOOL)hasError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (SYErrorInfo)error;
- (SYMessageHeader)header;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccepted:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setHeader:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SYResetResponse

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SYResetResponse;
  v4 = [(SYResetResponse *)&v8 description];
  v5 = [(SYResetResponse *)self dictionaryRepresentation];
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
  v6 = [NSNumber numberWithBool:self->_accepted];
  [v3 setObject:v6 forKey:@"accepted"];

  error = self->_error;
  if (error)
  {
    objc_super v8 = [(SYErrorInfo *)error dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"error"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SYResetResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_header) {
    -[SYResetResponse writeTo:]();
  }
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteBOOLField();
  if (self->_error) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [v5 setHeader:self->_header];
  id v4 = v5;
  v5[24] = self->_accepted;
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
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(unsigned char *)(v5 + 24) = self->_accepted;
  id v8 = [(SYErrorInfo *)self->_error copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_9;
  }
  header = self->_header;
  if ((unint64_t)header | *((void *)v4 + 2))
  {
    if (!-[SYMessageHeader isEqual:](header, "isEqual:")) {
      goto LABEL_9;
    }
  }
  if (self->_accepted)
  {
    if (*((unsigned char *)v4 + 24)) {
      goto LABEL_6;
    }
LABEL_9:
    char v7 = 0;
    goto LABEL_10;
  }
  if (*((unsigned char *)v4 + 24)) {
    goto LABEL_9;
  }
LABEL_6:
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 1)) {
    char v7 = -[SYErrorInfo isEqual:](error, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SYMessageHeader *)self->_header hash];
  uint64_t v4 = 2654435761 * self->_accepted;
  return v4 ^ v3 ^ [(SYErrorInfo *)self->_error hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  header = self->_header;
  uint64_t v6 = *((void *)v4 + 2);
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
    -[SYResetResponse setHeader:](self, "setHeader:");
  }
  id v4 = v9;
LABEL_7:
  self->_accepted = *((unsigned char *)v4 + 24);
  error = self->_error;
  uint64_t v8 = *((void *)v4 + 1);
  if (error)
  {
    if (!v8) {
      goto LABEL_13;
    }
    error = (SYErrorInfo *)-[SYErrorInfo mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    error = (SYErrorInfo *)-[SYResetResponse setError:](self, "setError:");
  }
  id v4 = v9;
LABEL_13:
  MEMORY[0x270F9A758](error, v4);
}

- (SYMessageHeader)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (BOOL)accepted
{
  return self->_accepted;
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
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
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SYResetResponse writeTo:]", "SYResetResponse.m", 121, "self->_header != nil");
}

@end