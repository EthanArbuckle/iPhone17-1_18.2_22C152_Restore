@interface SKANTokenPublicInput
- (BOOL)hasAppAdamId;
- (BOOL)hasIsRedownload;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRedownload;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)appAdamId;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppAdamId:(unint64_t)a3;
- (void)setHasAppAdamId:(BOOL)a3;
- (void)setHasIsRedownload:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setIsRedownload:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SKANTokenPublicInput

- (void)setAppAdamId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_appAdamId = a3;
}

- (void)setHasAppAdamId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAppAdamId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsRedownload:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isRedownload = a3;
}

- (void)setHasIsRedownload:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsRedownload
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SKANTokenPublicInput;
  char v3 = [(SKANTokenPublicInput *)&v7 description];
  v4 = [(SKANTokenPublicInput *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    objc_super v7 = +[NSNumber numberWithUnsignedLongLong:self->_appAdamId];
    [v3 setObject:v7 forKey:@"appAdamId"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v8 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
  [v3 setObject:v8 forKey:@"timestamp"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = +[NSNumber numberWithBool:self->_isRedownload];
    [v3 setObject:v5 forKey:@"isRedownload"];
  }
LABEL_5:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      BOOL v10 = v6++ >= 9;
      if (v10)
      {
        unint64_t v7 = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    unint64_t v13 = v7 >> 3;
    if ((v7 >> 3) == 3)
    {
      char v19 = 0;
      unsigned int v20 = 0;
      uint64_t v21 = 0;
      *(unsigned char *)&self->_has |= 4u;
      while (1)
      {
        unint64_t v22 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v22 == -1 || v22 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v23 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
        v21 |= (unint64_t)(v23 & 0x7F) << v19;
        if ((v23 & 0x80) == 0) {
          goto LABEL_48;
        }
        v19 += 7;
        BOOL v10 = v20++ >= 9;
        if (v10)
        {
          uint64_t v21 = 0;
          goto LABEL_50;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_48:
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v21 = 0;
      }
LABEL_50:
      self->_isRedownload = v21 != 0;
    }
    else
    {
      if (v13 == 2)
      {
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v16 = 0;
        *(unsigned char *)&self->_has |= 2u;
        while (1)
        {
          unint64_t v26 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v26 == -1 || v26 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v26);
          *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
          v16 |= (unint64_t)(v27 & 0x7F) << v24;
          if ((v27 & 0x80) == 0) {
            goto LABEL_52;
          }
          v24 += 7;
          BOOL v10 = v25++ >= 9;
          if (v10)
          {
            uint64_t v16 = 0;
            goto LABEL_54;
          }
        }
        *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_52:
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v16 = 0;
        }
LABEL_54:
        uint64_t v29 = 16;
      }
      else
      {
        if (v13 != 1)
        {
          int v28 = PBReaderSkipValueWithTag();
          if (!v28) {
            return v28;
          }
          continue;
        }
        char v14 = 0;
        unsigned int v15 = 0;
        uint64_t v16 = 0;
        *(unsigned char *)&self->_has |= 1u;
        while (1)
        {
          unint64_t v17 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v17 == -1 || v17 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v18 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v17);
          *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
          v16 |= (unint64_t)(v18 & 0x7F) << v14;
          if ((v18 & 0x80) == 0) {
            goto LABEL_44;
          }
          v14 += 7;
          BOOL v10 = v15++ >= 9;
          if (v10)
          {
            uint64_t v16 = 0;
            goto LABEL_46;
          }
        }
        *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_44:
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v16 = 0;
        }
LABEL_46:
        uint64_t v29 = 8;
      }
      *(void *)&self->PBCodable_opaque[v29] = v16;
    }
  }
  LOBYTE(v28) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v28;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_appAdamId;
    *((unsigned char *)v4 + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v4[2] = self->_timestamp;
  *((unsigned char *)v4 + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *((unsigned char *)v4 + 24) = self->_isRedownload;
    *((unsigned char *)v4 + 28) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_appAdamId;
    *((unsigned char *)result + 28) |= 1u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_timestamp;
  *((unsigned char *)result + 28) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((unsigned char *)result + 24) = self->_isRedownload;
  *((unsigned char *)result + 28) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_appAdamId != *((void *)v4 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 2) == 0 || self->_timestamp != *((void *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    goto LABEL_14;
  }
  BOOL v5 = (*((unsigned char *)v4 + 28) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 28) & 4) == 0)
    {
LABEL_14:
      BOOL v5 = 0;
      goto LABEL_15;
    }
    if (self->_isRedownload)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_14;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_14;
    }
    BOOL v5 = 1;
  }
LABEL_15:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  unint64_t v2 = 2654435761u * self->_appAdamId;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v3 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_isRedownload;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 28);
  if (v5)
  {
    self->_appAdamId = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 28);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 28) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_timestamp = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 28) & 4) != 0)
  {
LABEL_4:
    self->_isRedownload = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
}

- (unint64_t)appAdamId
{
  return self->_appAdamId;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)isRedownload
{
  return self->_isRedownload;
}

@end