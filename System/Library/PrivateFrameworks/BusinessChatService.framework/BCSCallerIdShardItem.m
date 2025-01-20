@interface BCSCallerIdShardItem
- (BOOL)hasCount;
- (BOOL)hasFilter;
- (BOOL)hasIndex;
- (BOOL)hasTtl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)filter;
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
- (void)setFilter:(id)a3;
- (void)setHasCount:(BOOL)a3;
- (void)setHasIndex:(BOOL)a3;
- (void)setHasTtl:(BOOL)a3;
- (void)setIndex:(int64_t)a3;
- (void)setTtl:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation BCSCallerIdShardItem

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

- (BOOL)hasFilter
{
  return self->_filter != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BCSCallerIdShardItem;
  v4 = [(BCSCallerIdShardItem *)&v8 description];
  v5 = [(BCSCallerIdShardItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_index];
    [v3 setObject:v8 forKey:@"index"];

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
  v9 = [NSNumber numberWithLongLong:self->_count];
  [v3 setObject:v9 forKey:@"count"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = [NSNumber numberWithLongLong:self->_ttl];
    [v3 setObject:v5 forKey:@"ttl"];
  }
LABEL_5:
  filter = self->_filter;
  if (filter) {
    [v3 setObject:filter forKey:@"filter"];
  }

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
      switch((v11 >> 3))
      {
        case 1u:
          char v18 = 0;
          unsigned int v19 = 0;
          unint64_t v20 = 0;
          *(unsigned char *)&self->_has |= 2u;
          while (1)
          {
            uint64_t v21 = *v4;
            unint64_t v22 = *(void *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(void *)((char *)a3 + *v5)) {
              break;
            }
            char v23 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v22);
            *(void *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0) {
              goto LABEL_44;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              unint64_t v20 = 0;
              goto LABEL_46;
            }
          }
          *((unsigned char *)a3 + *v6) = 1;
LABEL_44:
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v20 = 0;
          }
LABEL_46:
          uint64_t v37 = 16;
          goto LABEL_55;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          unint64_t v20 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (2)
          {
            uint64_t v27 = *v4;
            unint64_t v28 = *(void *)((char *)a3 + v27);
            if (v28 == -1 || v28 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v28);
              *(void *)((char *)a3 + v27) = v28 + 1;
              v20 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                BOOL v15 = v26++ >= 9;
                if (v15)
                {
                  unint64_t v20 = 0;
                  goto LABEL_50;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v20 = 0;
          }
LABEL_50:
          uint64_t v37 = 8;
          goto LABEL_55;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          unint64_t v20 = 0;
          *(unsigned char *)&self->_has |= 4u;
          break;
        case 4u:
          PBReaderReadData();
          v35 = (NSData *)objc_claimAutoreleasedReturnValue();
          filter = self->_filter;
          self->_filter = v35;

          continue;
        default:
          int v24 = PBReaderSkipValueWithTag();
          if (!v24) {
            return v24;
          }
          continue;
      }
      while (1)
      {
        uint64_t v32 = *v4;
        unint64_t v33 = *(void *)((char *)a3 + v32);
        if (v33 == -1 || v33 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v34 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v33);
        *(void *)((char *)a3 + v32) = v33 + 1;
        v20 |= (unint64_t)(v34 & 0x7F) << v30;
        if ((v34 & 0x80) == 0) {
          goto LABEL_52;
        }
        v30 += 7;
        BOOL v15 = v31++ >= 9;
        if (v15)
        {
          unint64_t v20 = 0;
          goto LABEL_54;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_52:
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v20 = 0;
      }
LABEL_54:
      uint64_t v37 = 24;
LABEL_55:
      *(Class *)((char *)&self->super.super.isa + v37) = (Class)v20;
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v24) = *((unsigned char *)a3 + *v6) == 0;
  return v24;
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
  if (self->_filter)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[2] = self->_index;
    *((unsigned char *)v4 + 40) |= 2u;
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
  *((unsigned char *)v4 + 40) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[3] = self->_ttl;
    *((unsigned char *)v4 + 40) |= 4u;
  }
LABEL_5:
  if (self->_filter)
  {
    id v6 = v4;
    objc_msgSend(v4, "setFilter:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(void *)(v5 + 8) = self->_count;
    *(unsigned char *)(v5 + 40) |= 1u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(void *)(v5 + 16) = self->_index;
  *(unsigned char *)(v5 + 40) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 4) != 0)
  {
LABEL_4:
    *(void *)(v5 + 24) = self->_ttl;
    *(unsigned char *)(v5 + 40) |= 4u;
  }
LABEL_5:
  uint64_t v8 = [(NSData *)self->_filter copyWithZone:a3];
  char v9 = (void *)v6[4];
  v6[4] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_index != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_19:
    char v6 = 0;
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_count != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_ttl != *((void *)v4 + 3)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_19;
  }
  filter = self->_filter;
  if ((unint64_t)filter | *((void *)v4 + 4)) {
    char v6 = -[NSData isEqual:](filter, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_20:

  return v6;
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
    return v3 ^ v2 ^ v4 ^ [(NSData *)self->_filter hash];
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
  return v3 ^ v2 ^ v4 ^ [(NSData *)self->_filter hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_index = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_count = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_4:
    self->_ttl = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  if (*((void *)v4 + 4))
  {
    id v6 = v4;
    -[BCSCallerIdShardItem setFilter:](self, "setFilter:");
    id v4 = v6;
  }
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

- (NSData)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end