@interface HMDRemoteEventRouterProtoFragmentedMessage
- (BOOL)hasFragmentData;
- (BOOL)hasFragmentNumber;
- (BOOL)hasRouterVersion;
- (BOOL)hasTotalFragments;
- (BOOL)hasTotalSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)fragmentData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)totalFragments;
- (unint64_t)totalSize;
- (unsigned)fragmentNumber;
- (unsigned)routerVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFragmentData:(id)a3;
- (void)setFragmentNumber:(unsigned int)a3;
- (void)setHasFragmentNumber:(BOOL)a3;
- (void)setHasRouterVersion:(BOOL)a3;
- (void)setHasTotalFragments:(BOOL)a3;
- (void)setHasTotalSize:(BOOL)a3;
- (void)setRouterVersion:(unsigned int)a3;
- (void)setTotalFragments:(unint64_t)a3;
- (void)setTotalSize:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation HMDRemoteEventRouterProtoFragmentedMessage

- (void).cxx_destruct
{
}

- (unsigned)routerVersion
{
  return self->_routerVersion;
}

- (unint64_t)totalFragments
{
  return self->_totalFragments;
}

- (unint64_t)totalSize
{
  return self->_totalSize;
}

- (unsigned)fragmentNumber
{
  return self->_fragmentNumber;
}

- (void)setFragmentData:(id)a3
{
}

- (NSData)fragmentData
{
  return self->_fragmentData;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[HMDRemoteEventRouterProtoFragmentedMessage setFragmentData:](self, "setFragmentData:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_fragmentNumber = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_5:
      if ((v5 & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) == 0)
  {
    goto LABEL_5;
  }
  self->_totalSize = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  self->_totalFragments = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 40) & 8) != 0)
  {
LABEL_7:
    self->_routerVersion = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_8:
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_fragmentData hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v4 = 2654435761 * self->_fragmentNumber;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v5 = 2654435761u * self->_totalSize;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v6 = 2654435761u * self->_totalFragments;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_routerVersion;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  fragmentData = self->_fragmentData;
  if ((unint64_t)fragmentData | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](fragmentData, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_fragmentNumber != *((_DWORD *)v4 + 8)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
LABEL_23:
    BOOL v6 = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_totalSize != *((void *)v4 + 2)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_totalFragments != *((void *)v4 + 1)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_23;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) == 0 || self->_routerVersion != *((_DWORD *)v4 + 9)) {
      goto LABEL_23;
    }
    BOOL v6 = 1;
  }
LABEL_24:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_fragmentData copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_fragmentNumber;
    *(unsigned char *)(v5 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(void *)(v5 + 8) = self->_totalFragments;
      *(unsigned char *)(v5 + 40) |= 1u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_totalSize;
  *(unsigned char *)(v5 + 40) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 36) = self->_routerVersion;
    *(unsigned char *)(v5 + 40) |= 8u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_fragmentData)
  {
    id v6 = v4;
    objc_msgSend(v4, "setFragmentData:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_fragmentNumber;
    *((unsigned char *)v4 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 2) = self->_totalSize;
  *((unsigned char *)v4 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  *((void *)v4 + 1) = self->_totalFragments;
  *((unsigned char *)v4 + 40) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 9) = self->_routerVersion;
    *((unsigned char *)v4 + 40) |= 8u;
  }
LABEL_8:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_fragmentData)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
LABEL_8:
}

- (BOOL)readFrom:(id)a3
{
  id v4 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v5 = (int *)MEMORY[0x1E4F940E0];
  id v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v8 = (int *)MEMORY[0x1E4F940B8];
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
          PBReaderReadData();
          v18 = (NSData *)objc_claimAutoreleasedReturnValue();
          fragmentData = self->_fragmentData;
          self->_fragmentData = v18;

          continue;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)&self->_has |= 4u;
          while (2)
          {
            uint64_t v24 = *v4;
            unint64_t v25 = *(void *)((char *)a3 + v24);
            if (v25 == -1 || v25 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v26 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v25);
              *(void *)((char *)a3 + v24) = v25 + 1;
              v23 |= (unint64_t)(v26 & 0x7F) << v21;
              if (v26 < 0)
              {
                v21 += 7;
                BOOL v15 = v22++ >= 9;
                if (v15)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_53;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_53:
          uint64_t v43 = 32;
          goto LABEL_67;
        case 3u:
          char v27 = 0;
          unsigned int v28 = 0;
          unint64_t v29 = 0;
          *(unsigned char *)&self->_has |= 2u;
          while (2)
          {
            uint64_t v30 = *v4;
            unint64_t v31 = *(void *)((char *)a3 + v30);
            if (v31 == -1 || v31 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v32 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v31);
              *(void *)((char *)a3 + v30) = v31 + 1;
              v29 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                BOOL v15 = v28++ >= 9;
                if (v15)
                {
                  unint64_t v29 = 0;
                  goto LABEL_57;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v29 = 0;
          }
LABEL_57:
          uint64_t v44 = 16;
          goto LABEL_62;
        case 4u:
          char v33 = 0;
          unsigned int v34 = 0;
          unint64_t v29 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (2)
          {
            uint64_t v35 = *v4;
            unint64_t v36 = *(void *)((char *)a3 + v35);
            if (v36 == -1 || v36 >= *(void *)((char *)a3 + *v5))
            {
              *((unsigned char *)a3 + *v6) = 1;
            }
            else
            {
              char v37 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v36);
              *(void *)((char *)a3 + v35) = v36 + 1;
              v29 |= (unint64_t)(v37 & 0x7F) << v33;
              if (v37 < 0)
              {
                v33 += 7;
                BOOL v15 = v34++ >= 9;
                if (v15)
                {
                  unint64_t v29 = 0;
                  goto LABEL_61;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            unint64_t v29 = 0;
          }
LABEL_61:
          uint64_t v44 = 8;
LABEL_62:
          *(Class *)((char *)&self->super.super.isa + v44) = (Class)v29;
          continue;
        case 5u:
          char v38 = 0;
          unsigned int v39 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)&self->_has |= 8u;
          break;
        default:
          int v20 = PBReaderSkipValueWithTag();
          if (!v20) {
            return v20;
          }
          continue;
      }
      while (1)
      {
        uint64_t v40 = *v4;
        unint64_t v41 = *(void *)((char *)a3 + v40);
        if (v41 == -1 || v41 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v42 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v41);
        *(void *)((char *)a3 + v40) = v41 + 1;
        v23 |= (unint64_t)(v42 & 0x7F) << v38;
        if ((v42 & 0x80) == 0) {
          goto LABEL_64;
        }
        v38 += 7;
        BOOL v15 = v39++ >= 9;
        if (v15)
        {
          LODWORD(v23) = 0;
          goto LABEL_66;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_64:
      if (*((unsigned char *)a3 + *v6)) {
        LODWORD(v23) = 0;
      }
LABEL_66:
      uint64_t v43 = 36;
LABEL_67:
      *(_DWORD *)((char *)&self->super.super.isa + v43) = v23;
    }
    while (*(void *)((char *)a3 + *v4) < *(void *)((char *)a3 + *v5));
  }
  LOBYTE(v20) = *((unsigned char *)a3 + *v6) == 0;
  return v20;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  fragmentData = self->_fragmentData;
  if (fragmentData) {
    [v3 setObject:fragmentData forKey:@"fragmentData"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    char v9 = [NSNumber numberWithUnsignedInt:self->_fragmentNumber];
    [v4 setObject:v9 forKey:@"fragmentNumber"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  unsigned int v10 = [NSNumber numberWithUnsignedLongLong:self->_totalSize];
  [v4 setObject:v10 forKey:@"totalSize"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_13:
  unint64_t v11 = [NSNumber numberWithUnsignedLongLong:self->_totalFragments];
  [v4 setObject:v11 forKey:@"totalFragments"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_7:
    uint64_t v7 = [NSNumber numberWithUnsignedInt:self->_routerVersion];
    [v4 setObject:v7 forKey:@"routerVersion"];
  }
LABEL_8:
  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)HMDRemoteEventRouterProtoFragmentedMessage;
  id v4 = [(HMDRemoteEventRouterProtoFragmentedMessage *)&v8 description];
  uint64_t v5 = [(HMDRemoteEventRouterProtoFragmentedMessage *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRouterVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasRouterVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setRouterVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_routerVersion = a3;
}

- (BOOL)hasTotalFragments
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasTotalFragments:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setTotalFragments:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_totalFragments = a3;
}

- (BOOL)hasTotalSize
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTotalSize:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setTotalSize:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_totalSize = a3;
}

- (BOOL)hasFragmentNumber
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasFragmentNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setFragmentNumber:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_fragmentNumber = a3;
}

- (BOOL)hasFragmentData
{
  return self->_fragmentData != 0;
}

@end