@interface BCSCallerIdWrapper
- (BCSCallerIdMessage)message;
- (BOOL)hasMessage;
- (BOOL)hasModTime;
- (BOOL)hasPhone;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)phone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)modTime;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasModTime:(BOOL)a3;
- (void)setMessage:(id)a3;
- (void)setModTime:(int64_t)a3;
- (void)setPhone:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSCallerIdWrapper

- (BOOL)hasPhone
{
  return self->_phone != 0;
}

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (void)setModTime:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_modTime = a3;
}

- (void)setHasModTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasModTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSCallerIdWrapper;
  v4 = [(BCSCallerIdWrapper *)&v8 description];
  v5 = [(BCSCallerIdWrapper *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  phone = self->_phone;
  if (phone) {
    [v3 setObject:phone forKey:@"phone"];
  }
  message = self->_message;
  if (message)
  {
    v7 = [(BCSCallerIdMessage *)message dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"message"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_modTime];
    [v4 setObject:v8 forKey:@"mod_time"];
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
        BOOL v15 = v10++ >= 9;
        if (v15)
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
      unint64_t v18 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        char v21 = 0;
        unsigned int v22 = 0;
        int64_t v23 = 0;
        *(unsigned char *)&self->_has |= 1u;
        while (1)
        {
          uint64_t v24 = *v4;
          unint64_t v25 = *(void *)((char *)a3 + v24);
          if (v25 == -1 || v25 >= *(void *)((char *)a3 + *v5)) {
            break;
          }
          char v26 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v25);
          *(void *)((char *)a3 + v24) = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0) {
            goto LABEL_35;
          }
          v21 += 7;
          BOOL v15 = v22++ >= 9;
          if (v15)
          {
            int64_t v23 = 0;
            goto LABEL_37;
          }
        }
        *((unsigned char *)a3 + *v6) = 1;
LABEL_35:
        if (*((unsigned char *)a3 + *v6)) {
          int64_t v23 = 0;
        }
LABEL_37:
        self->_modTime = v23;
      }
      else if (v18 == 2)
      {
        v27 = objc_alloc_init(BCSCallerIdMessage);
        objc_storeStrong((id *)&self->_message, v27);
        if (!PBReaderPlaceMark() || (BCSCallerIdMessageReadFrom((uint64_t)v27, (uint64_t)a3) & 1) == 0)
        {

          LOBYTE(v28) = 0;
          return v28;
        }
        PBReaderRecallMark();
      }
      else if (v18 == 1)
      {
        PBReaderReadString();
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        phone = self->_phone;
        self->_phone = v19;
      }
      else
      {
        int v28 = PBReaderSkipValueWithTag();
        if (!v28) {
          return v28;
        }
      }
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v28) = *((unsigned char *)a3 + *v6) == 0;
  return v28;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_phone)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_message)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_phone)
  {
    objc_msgSend(v4, "setPhone:");
    id v4 = v5;
  }
  if (self->_message)
  {
    objc_msgSend(v5, "setMessage:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_modTime;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_phone copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  id v8 = [(BCSCallerIdMessage *)self->_message copyWithZone:a3];
  char v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_modTime;
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
  phone = self->_phone;
  if ((unint64_t)phone | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](phone, "isEqual:")) {
      goto LABEL_10;
    }
  }
  message = self->_message;
  if ((unint64_t)message | *((void *)v4 + 2))
  {
    if (!-[BCSCallerIdMessage isEqual:](message, "isEqual:")) {
      goto LABEL_10;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) != 0 && self->_modTime == *((void *)v4 + 1))
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
  NSUInteger v3 = [(NSString *)self->_phone hash];
  unint64_t v4 = [(BCSCallerIdMessage *)self->_message hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_modTime;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  BOOL v7 = v4;
  if (v4[3])
  {
    -[BCSCallerIdWrapper setPhone:](self, "setPhone:");
    unint64_t v4 = v7;
  }
  message = self->_message;
  uint64_t v6 = v4[2];
  if (message)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[BCSCallerIdMessage mergeFrom:](message, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[BCSCallerIdWrapper setMessage:](self, "setMessage:");
  }
  unint64_t v4 = v7;
LABEL_9:
  if (v4[4])
  {
    self->_modTime = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }

  MEMORY[0x270F9A758]();
}

- (NSString)phone
{
  return self->_phone;
}

- (void)setPhone:(id)a3
{
}

- (BCSCallerIdMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (int64_t)modTime
{
  return self->_modTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phone, 0);

  objc_storeStrong((id *)&self->_message, 0);
}

@end