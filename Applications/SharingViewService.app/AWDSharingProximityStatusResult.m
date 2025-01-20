@interface AWDSharingProximityStatusResult
- (BOOL)hasDismissType;
- (BOOL)hasRssi;
- (BOOL)hasSessionUUID;
- (BOOL)hasSmoothedRSSI;
- (BOOL)hasTimestamp;
- (BOOL)hasVisibleMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sessionUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)rssi;
- (int)smoothedRSSI;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)dismissType;
- (unsigned)visibleMs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDismissType:(unsigned int)a3;
- (void)setHasDismissType:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setHasSmoothedRSSI:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVisibleMs:(BOOL)a3;
- (void)setRssi:(int)a3;
- (void)setSessionUUID:(id)a3;
- (void)setSmoothedRSSI:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVisibleMs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSharingProximityStatusResult

- (void).cxx_destruct
{
}

- (unsigned)visibleMs
{
  return self->_visibleMs;
}

- (unsigned)dismissType
{
  return self->_dismissType;
}

- (int)smoothedRSSI
{
  return self->_smoothedRSSI;
}

- (int)rssi
{
  return self->_rssi;
}

- (void)setSessionUUID:(id)a3
{
}

- (NSString)sessionUUID
{
  return self->_sessionUUID;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((unsigned char *)v4 + 40))
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[AWDSharingProximityStatusResult setSessionUUID:](self, "setSessionUUID:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 4) != 0)
  {
    self->_rssi = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 40);
    if ((v5 & 8) == 0)
    {
LABEL_7:
      if ((v5 & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 8) == 0)
  {
    goto LABEL_7;
  }
  self->_smoothedRSSI = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  self->_dismissType = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)v4 + 40) & 0x10) != 0)
  {
LABEL_9:
    self->_visibleMs = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_10:
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_sessionUUID hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v5 = 2654435761 * self->_rssi;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_smoothedRSSI;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v7 = 0;
      if ((*(unsigned char *)&self->_has & 0x10) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_dismissType;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_visibleMs;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 40);
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_29;
  }
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](sessionUUID, "isEqual:"))
    {
LABEL_29:
      BOOL v8 = 0;
      goto LABEL_30;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 40);
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_rssi != *((_DWORD *)v4 + 5)) {
      goto LABEL_29;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_smoothedRSSI != *((_DWORD *)v4 + 8)) {
      goto LABEL_29;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_dismissType != *((_DWORD *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_29;
  }
  BOOL v8 = (v6 & 0x10) == 0;
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_visibleMs != *((_DWORD *)v4 + 9)) {
      goto LABEL_29;
    }
    BOOL v8 = 1;
  }
LABEL_30:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  char v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  id v7 = [(NSString *)self->_sessionUUID copyWithZone:a3];
  BOOL v8 = (void *)v6[3];
  v6[3] = v7;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v6 + 5) = self->_rssi;
    *((unsigned char *)v6 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      *((_DWORD *)v6 + 4) = self->_dismissType;
      *((unsigned char *)v6 + 40) |= 2u;
      if ((*(unsigned char *)&self->_has & 0x10) == 0) {
        return v6;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 8) = self->_smoothedRSSI;
  *((unsigned char *)v6 + 40) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 0x10) != 0)
  {
LABEL_7:
    *((_DWORD *)v6 + 9) = self->_visibleMs;
    *((unsigned char *)v6 + 40) |= 0x10u;
  }
  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_sessionUUID)
  {
    char v6 = v4;
    [v4 setSessionUUID:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_rssi;
    *((unsigned char *)v4 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 8) = self->_smoothedRSSI;
  *((unsigned char *)v4 + 40) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  *((_DWORD *)v4 + 4) = self->_dismissType;
  *((unsigned char *)v4 + 40) |= 2u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    *((_DWORD *)v4 + 9) = self->_visibleMs;
    *((unsigned char *)v4 + 40) |= 0x10u;
  }
LABEL_10:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_sessionUUID) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_9:
  }
    PBDataWriterWriteUint32Field();
LABEL_10:
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
        unint64_t v15 = 0;
        *(unsigned char *)&self->_has |= 1u;
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
            goto LABEL_57;
          }
          v13 += 7;
          BOOL v10 = v14++ >= 9;
          if (v10)
          {
            unint64_t v15 = 0;
            goto LABEL_59;
          }
        }
        *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_57:
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          unint64_t v15 = 0;
        }
LABEL_59:
        self->_timestamp = v15;
        continue;
      case 2u:
        PBReaderReadString();
        v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        sessionUUID = self->_sessionUUID;
        self->_sessionUUID = v19;

        continue;
      case 3u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)&self->_has |= 4u;
        while (2)
        {
          unint64_t v24 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v24 == -1 || v24 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v25 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v24);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v24 + 1;
            v23 |= (unint64_t)(v25 & 0x7F) << v21;
            if (v25 < 0)
            {
              v21 += 7;
              BOOL v10 = v22++ >= 9;
              if (v10)
              {
                LODWORD(v23) = 0;
                goto LABEL_63;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v23) = 0;
        }
LABEL_63:
        uint64_t v38 = 20;
        goto LABEL_76;
      case 4u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)&self->_has |= 8u;
        while (2)
        {
          unint64_t v28 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v28 == -1 || v28 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v29 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v28);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v28 + 1;
            v23 |= (unint64_t)(v29 & 0x7F) << v26;
            if (v29 < 0)
            {
              v26 += 7;
              BOOL v10 = v27++ >= 9;
              if (v10)
              {
                LODWORD(v23) = 0;
                goto LABEL_67;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v23) = 0;
        }
LABEL_67:
        uint64_t v38 = 32;
        goto LABEL_76;
      case 5u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)&self->_has |= 2u;
        while (2)
        {
          unint64_t v32 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v32 == -1 || v32 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v32);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v32 + 1;
            v23 |= (unint64_t)(v33 & 0x7F) << v30;
            if (v33 < 0)
            {
              v30 += 7;
              BOOL v10 = v31++ >= 9;
              if (v10)
              {
                LODWORD(v23) = 0;
                goto LABEL_71;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v23) = 0;
        }
LABEL_71:
        uint64_t v38 = 16;
        goto LABEL_76;
      case 6u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)&self->_has |= 0x10u;
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
      unint64_t v36 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v36 == -1 || v36 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v37 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v36);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v36 + 1;
      v23 |= (unint64_t)(v37 & 0x7F) << v34;
      if ((v37 & 0x80) == 0) {
        goto LABEL_73;
      }
      v34 += 7;
      BOOL v10 = v35++ >= 9;
      if (v10)
      {
        LODWORD(v23) = 0;
        goto LABEL_75;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_73:
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v23) = 0;
    }
LABEL_75:
    uint64_t v38 = 36;
LABEL_76:
    *(_DWORD *)&self->PBCodable_opaque[v38] = v23;
  }
  LOBYTE(v18) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v18;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = +[NSNumber numberWithUnsignedLongLong:self->_timestamp];
    [v3 setObject:v4 forKey:@"timestamp"];
  }
  sessionUUID = self->_sessionUUID;
  if (sessionUUID) {
    [v3 setObject:sessionUUID forKey:@"sessionUUID"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    char v9 = +[NSNumber numberWithInt:self->_rssi];
    [v3 setObject:v9 forKey:@"rssi"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 2) == 0) {
        goto LABEL_8;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  BOOL v10 = +[NSNumber numberWithInt:self->_smoothedRSSI];
  [v3 setObject:v10 forKey:@"smoothedRSSI"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_15:
  int v11 = +[NSNumber numberWithUnsignedInt:self->_dismissType];
  [v3 setObject:v11 forKey:@"dismissType"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    unint64_t v7 = +[NSNumber numberWithUnsignedInt:self->_visibleMs];
    [v3 setObject:v7 forKey:@"visibleMs"];
  }
LABEL_10:

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDSharingProximityStatusResult;
  unint64_t v3 = [(AWDSharingProximityStatusResult *)&v7 description];
  id v4 = [(AWDSharingProximityStatusResult *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasVisibleMs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasVisibleMs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setVisibleMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_visibleMs = a3;
}

- (BOOL)hasDismissType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDismissType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setDismissType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_dismissType = a3;
}

- (BOOL)hasSmoothedRSSI
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasSmoothedRSSI:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setSmoothedRSSI:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_smoothedRSSI = a3;
}

- (BOOL)hasRssi
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasRssi:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setRssi:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_rssi = a3;
}

- (BOOL)hasSessionUUID
{
  return self->_sessionUUID != 0;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

@end