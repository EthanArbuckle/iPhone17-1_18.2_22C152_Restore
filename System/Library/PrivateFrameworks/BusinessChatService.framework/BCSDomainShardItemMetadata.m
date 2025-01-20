@interface BCSDomainShardItemMetadata
- (BOOL)hasCount;
- (BOOL)hasIndex;
- (BOOL)hasTtl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)count;
- (int64_t)index;
- (int64_t)ttl;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCount:(int64_t)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasIndex:(BOOL)a3;
- (void)setHasTtl:(BOOL)a3;
- (void)setIndex:(int64_t)a3;
- (void)setTtl:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSDomainShardItemMetadata

- (void)setIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_index = a3;
}

- (void)setHasIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_count = a3;
}

- (void)setHasCount:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCount
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTtl:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_ttl = a3;
}

- (void)setHasTtl:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTtl
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSDomainShardItemMetadata;
  v4 = [(BCSDomainShardItemMetadata *)&v8 description];
  v5 = [(BCSDomainShardItemMetadata *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v7 = [NSNumber numberWithLongLong:self->_index];
    [v3 setObject:v7 forKey:@"index"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithLongLong:self->_count];
  [v3 setObject:v8 forKey:@"count"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithLongLong:self->_ttl];
    [v3 setObject:v5 forKey:@"ttl"];
  }
LABEL_5:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x263F62298];
  v5 = (int *)MEMORY[0x263F62288];
  v6 = (int *)MEMORY[0x263F62270];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x263F62298]) < *(void *)((char *)a3 + (int)*MEMORY[0x263F62288]))
  {
    objc_super v8 = (int *)MEMORY[0x263F62268];
    while (1)
    {
      if (*((unsigned char *)a3 + *v6)) {
        return *((unsigned char *)a3 + *v6) == 0;
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
        return *((unsigned char *)a3 + *v6) == 0;
      }
      unint64_t v18 = v11 >> 3;
      if ((v11 >> 3) == 3)
      {
        char v27 = 0;
        unsigned int v28 = 0;
        unint64_t v21 = 0;
        *(unsigned char *)&self->_has |= 4u;
        while (1)
        {
          uint64_t v29 = *v4;
          unint64_t v30 = *(void *)((char *)a3 + v29);
          if (v30 == -1 || v30 >= *(void *)((char *)a3 + *v5)) {
            break;
          }
          char v31 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v30);
          *(void *)((char *)a3 + v29) = v30 + 1;
          v21 |= (unint64_t)(v31 & 0x7F) << v27;
          if ((v31 & 0x80) == 0)
          {
            v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__ttl;
            goto LABEL_48;
          }
          v27 += 7;
          BOOL v25 = v28++ > 8;
          if (v25)
          {
            unint64_t v21 = 0;
            v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__ttl;
            goto LABEL_50;
          }
        }
        v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__ttl;
LABEL_47:
        *((unsigned char *)a3 + *v6) = 1;
        goto LABEL_48;
      }
      if (v18 == 2) {
        break;
      }
      if (v18 == 1)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        unint64_t v21 = 0;
        *(unsigned char *)&self->_has |= 2u;
        while (1)
        {
          uint64_t v22 = *v4;
          unint64_t v23 = *(void *)((char *)a3 + v22);
          if (v23 == -1 || v23 >= *(void *)((char *)a3 + *v5))
          {
            v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__index;
            goto LABEL_47;
          }
          char v24 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v23);
          *(void *)((char *)a3 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            break;
          }
          v19 += 7;
          BOOL v25 = v20++ > 8;
          if (v25)
          {
            unint64_t v21 = 0;
            v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__index;
            goto LABEL_50;
          }
        }
        v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__index;
        goto LABEL_48;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_51:
      if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
    }
    char v32 = 0;
    unsigned int v33 = 0;
    unint64_t v21 = 0;
    *(unsigned char *)&self->_has |= 1u;
    while (1)
    {
      uint64_t v34 = *v4;
      unint64_t v35 = *(void *)((char *)a3 + v34);
      if (v35 == -1 || v35 >= *(void *)((char *)a3 + *v5))
      {
        v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__count;
        goto LABEL_47;
      }
      char v36 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v35);
      *(void *)((char *)a3 + v34) = v35 + 1;
      v21 |= (unint64_t)(v36 & 0x7F) << v32;
      if ((v36 & 0x80) == 0) {
        break;
      }
      v32 += 7;
      BOOL v25 = v33++ > 8;
      if (v25)
      {
        unint64_t v21 = 0;
        v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__count;
        goto LABEL_50;
      }
    }
    v26 = &OBJC_IVAR___BCSDomainShardItemMetadata__count;
LABEL_48:
    if (*((unsigned char *)a3 + *v6)) {
      unint64_t v21 = 0;
    }
LABEL_50:
    *(Class *)((char *)&self->super.super.isa + *v26) = (Class)v21;
    goto LABEL_51;
  }
  return *((unsigned char *)a3 + *v6) == 0;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
LABEL_5:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_index;
    *((unsigned char *)v4 + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[1] = self->_count;
  *((unsigned char *)v4 + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[3] = self->_ttl;
    *((unsigned char *)v4 + 32) |= 4u;
  }
LABEL_5:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)result + 2) = self->_index;
    *((unsigned char *)result + 32) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 1) = self->_count;
  *((unsigned char *)result + 32) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_4:
  *((void *)result + 3) = self->_ttl;
  *((unsigned char *)result + 32) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_index != *((void *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_16:
    BOOL v5 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_count != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_16;
  }
  BOOL v5 = (*((unsigned char *)v4 + 32) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_ttl != *((void *)v4 + 3)) {
      goto LABEL_16;
    }
    BOOL v5 = 1;
  }
LABEL_17:

  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_index;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_count;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_ttl;
  return v3 ^ v2 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_index = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_count = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
LABEL_4:
    self->_ttl = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
}

- (int64_t)index
{
  return self->_index;
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)ttl
{
  return self->_ttl;
}

@end