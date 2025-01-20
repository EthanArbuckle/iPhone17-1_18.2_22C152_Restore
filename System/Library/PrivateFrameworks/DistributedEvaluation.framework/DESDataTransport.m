@interface DESDataTransport
- (BOOL)hasBfloat16;
- (BOOL)hasBinary32;
- (BOOL)hasBinary64;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DESBfloat16Transport)bfloat16;
- (DESBinary32Transport)binary32;
- (DESBinary64Transport)binary64;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBfloat16:(id)a3;
- (void)setBinary32:(id)a3;
- (void)setBinary64:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation DESDataTransport

- (BOOL)hasBinary64
{
  return self->_binary64 != 0;
}

- (BOOL)hasBinary32
{
  return self->_binary32 != 0;
}

- (BOOL)hasBfloat16
{
  return self->_bfloat16 != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)DESDataTransport;
  v4 = [(DESDataTransport *)&v8 description];
  v5 = [(DESDataTransport *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  binary64 = self->_binary64;
  if (binary64)
  {
    v5 = [(DESBinary64Transport *)binary64 dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"binary64"];
  }
  binary32 = self->_binary32;
  if (binary32)
  {
    v7 = [(DESBinary32Transport *)binary32 dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"binary32"];
  }
  bfloat16 = self->_bfloat16;
  if (bfloat16)
  {
    v9 = [(DESBfloat16Transport *)bfloat16 dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"bfloat16"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DESDataTransportReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_binary64)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_binary32)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_bfloat16)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_binary64)
  {
    objc_msgSend(v4, "setBinary64:");
    id v4 = v5;
  }
  if (self->_binary32)
  {
    objc_msgSend(v5, "setBinary32:");
    id v4 = v5;
  }
  if (self->_bfloat16)
  {
    objc_msgSend(v5, "setBfloat16:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(DESBinary64Transport *)self->_binary64 copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(DESBinary32Transport *)self->_binary32 copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(DESBfloat16Transport *)self->_bfloat16 copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((binary64 = self->_binary64, !((unint64_t)binary64 | v4[3]))
     || -[DESBinary64Transport isEqual:](binary64, "isEqual:"))
    && ((binary32 = self->_binary32, !((unint64_t)binary32 | v4[2]))
     || -[DESBinary32Transport isEqual:](binary32, "isEqual:")))
  {
    bfloat16 = self->_bfloat16;
    if ((unint64_t)bfloat16 | v4[1]) {
      char v8 = -[DESBfloat16Transport isEqual:](bfloat16, "isEqual:");
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
  unint64_t v3 = [(DESBinary64Transport *)self->_binary64 hash];
  unint64_t v4 = [(DESBinary32Transport *)self->_binary32 hash] ^ v3;
  return v4 ^ [(DESBfloat16Transport *)self->_bfloat16 hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  binary64 = self->_binary64;
  uint64_t v6 = v4[3];
  v11 = v4;
  if (binary64)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[DESBinary64Transport mergeFrom:](binary64, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[DESDataTransport setBinary64:](self, "setBinary64:");
  }
  unint64_t v4 = v11;
LABEL_7:
  binary32 = self->_binary32;
  uint64_t v8 = v4[2];
  if (binary32)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[DESBinary32Transport mergeFrom:](binary32, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[DESDataTransport setBinary32:](self, "setBinary32:");
  }
  unint64_t v4 = v11;
LABEL_13:
  bfloat16 = self->_bfloat16;
  uint64_t v10 = v4[1];
  if (bfloat16)
  {
    if (v10) {
      -[DESBfloat16Transport mergeFrom:](bfloat16, "mergeFrom:");
    }
  }
  else if (v10)
  {
    -[DESDataTransport setBfloat16:](self, "setBfloat16:");
  }

  MEMORY[0x1F41817F8]();
}

- (DESBinary64Transport)binary64
{
  return self->_binary64;
}

- (void)setBinary64:(id)a3
{
}

- (DESBinary32Transport)binary32
{
  return self->_binary32;
}

- (void)setBinary32:(id)a3
{
}

- (DESBfloat16Transport)bfloat16
{
  return self->_bfloat16;
}

- (void)setBfloat16:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binary64, 0);
  objc_storeStrong((id *)&self->_binary32, 0);

  objc_storeStrong((id *)&self->_bfloat16, 0);
}

@end