@interface BCSCallerIdParquetWrapper
- (BOOL)hasMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)message;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMessage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSCallerIdParquetWrapper

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSCallerIdParquetWrapper;
  v4 = [(BCSCallerIdParquetWrapper *)&v8 description];
  v5 = [(BCSCallerIdParquetWrapper *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  message = self->_message;
  if (message) {
    [v3 setObject:message forKey:@"message"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x263F62298];
  v5 = (int *)MEMORY[0x263F62288];
  v6 = (int *)MEMORY[0x263F62270];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x263F62298]) < *(void *)((char *)a3 + (int)*MEMORY[0x263F62288]))
  {
    objc_super v8 = (int *)MEMORY[0x263F62268];
    do
    {
      if (*((unsigned char *)a3 + *v6)) {
        break;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        break;
      }
      if ((v11 >> 3) == 1)
      {
        PBReaderReadData();
        v18 = (NSData *)objc_claimAutoreleasedReturnValue();
        message = self->_message;
        self->_message = v18;
      }
      else
      {
        int v20 = PBReaderSkipValueWithTag();
        if (!v20) {
          return v20;
        }
      }
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v20) = *((unsigned char *)a3 + *v6) == 0;
  return v20;
}

- (void)writeTo:(id)a3
{
  if (self->_message) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  message = self->_message;
  if (message) {
    [a3 setMessage:message];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_message copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    message = self->_message;
    if ((unint64_t)message | v4[1]) {
      char v6 = -[NSData isEqual:](message, "isEqual:");
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
  return [(NSData *)self->_message hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[BCSCallerIdParquetWrapper setMessage:](self, "setMessage:");
  }
}

- (NSData)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end