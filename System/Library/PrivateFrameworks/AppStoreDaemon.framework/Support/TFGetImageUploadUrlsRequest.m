@interface TFGetImageUploadUrlsRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation TFGetImageUploadUrlsRequest

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)TFGetImageUploadUrlsRequest;
  v3 = [(TFGetImageUploadUrlsRequest *)&v7 description];
  v4 = [(TFGetImageUploadUrlsRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = +[NSNumber numberWithUnsignedLongLong:self->_dsid];
    [v3 setObject:v5 forKey:@"dsid"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v6 = +[NSNumber numberWithUnsignedInt:self->_count];
    [v3 setObject:v6 forKey:@"count"];
  }
  contentType = self->_contentType;
  if (contentType) {
    [v3 setObject:contentType forKey:@"contentType"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = +[NSNumber numberWithUnsignedLongLong:self->_desiredUrlTTLMillis];
    [v3 setObject:v8 forKey:@"desiredUrlTTLMillis"];
  }
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
    switch((v7 >> 3))
    {
      case 1u:
        char v13 = 0;
        unsigned int v14 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)&self->_has |= 2u;
        while (1)
        {
          unint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v16 == -1 || v16 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v17 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
          v15 |= (unint64_t)(v17 & 0x7F) << v13;
          if ((v17 & 0x80) == 0) {
            goto LABEL_43;
          }
          v13 += 7;
          BOOL v10 = v14++ >= 9;
          if (v10)
          {
            uint64_t v15 = 0;
            goto LABEL_45;
          }
        }
        *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_43:
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v15 = 0;
        }
LABEL_45:
        uint64_t v30 = 16;
        goto LABEL_54;
      case 2u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)&self->_has |= 4u;
        while (2)
        {
          unint64_t v22 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v22 == -1 || v22 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v23 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
            v21 |= (unint64_t)(v23 & 0x7F) << v19;
            if (v23 < 0)
            {
              v19 += 7;
              BOOL v10 = v20++ >= 9;
              if (v10)
              {
                LODWORD(v21) = 0;
                goto LABEL_49;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v21) = 0;
        }
LABEL_49:
        self->_count = v21;
        continue;
      case 3u:
        PBReaderReadString();
        v24 = (NSString *)objc_claimAutoreleasedReturnValue();
        contentType = self->_contentType;
        self->_contentType = v24;

        continue;
      case 4u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)&self->_has |= 1u;
        break;
      default:
        int v18 = PBReaderSkipValueWithTag();
        if (!v18) {
          return v18;
        }
        continue;
    }
    while (1)
    {
      unint64_t v28 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v28 == -1 || v28 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v29 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v28);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v28 + 1;
      v15 |= (unint64_t)(v29 & 0x7F) << v26;
      if ((v29 & 0x80) == 0) {
        goto LABEL_51;
      }
      v26 += 7;
      BOOL v10 = v27++ >= 9;
      if (v10)
      {
        uint64_t v15 = 0;
        goto LABEL_53;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_51:
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v15 = 0;
    }
LABEL_53:
    uint64_t v30 = 8;
LABEL_54:
    *(void *)&self->PBRequest_opaque[v30] = v15;
  }
  LOBYTE(v18) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v18;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_contentType) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unsigned int v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = self->_dsid;
    *((unsigned char *)v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_count;
    *((unsigned char *)v5 + 36) |= 4u;
  }
  id v8 = [(NSString *)self->_contentType copyWithZone:a3];
  char v9 = (void *)v6[3];
  v6[3] = v8;

  if (*(unsigned char *)&self->_has)
  {
    v6[1] = self->_desiredUrlTTLMillis;
    *((unsigned char *)v6 + 36) |= 1u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 36);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_dsid != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_count != *((_DWORD *)v4 + 8)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_19;
  }
  contentType = self->_contentType;
  if ((unint64_t)contentType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](contentType, "isEqual:"))
    {
LABEL_19:
      BOOL v8 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 36);
  }
  BOOL v8 = (v6 & 1) == 0;
  if (has)
  {
    if ((v6 & 1) == 0 || self->_desiredUrlTTLMillis != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
    BOOL v8 = 1;
  }
LABEL_20:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_dsid;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_count;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_contentType hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v6 = 2654435761u * self->_desiredUrlTTLMillis;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void).cxx_destruct
{
}

@end