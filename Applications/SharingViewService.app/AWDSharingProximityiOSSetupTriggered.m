@interface AWDSharingProximityiOSSetupTriggered
- (BOOL)hasSessionUUID;
- (BOOL)hasSmoothedRSSI;
- (BOOL)hasTimestamp;
- (BOOL)hasUserActionType;
- (BOOL)hasUserMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)sessionUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)smoothedRSSI;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)userActionType;
- (unsigned)userMs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasSmoothedRSSI:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUserActionType:(BOOL)a3;
- (void)setHasUserMs:(BOOL)a3;
- (void)setSessionUUID:(id)a3;
- (void)setSmoothedRSSI:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUserActionType:(unsigned int)a3;
- (void)setUserMs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSharingProximityiOSSetupTriggered

- (void).cxx_destruct
{
}

- (unsigned)userMs
{
  return self->_userMs;
}

- (unsigned)userActionType
{
  return self->_userActionType;
}

- (int)smoothedRSSI
{
  return self->_smoothedRSSI;
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
  if (*((unsigned char *)v4 + 36))
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[AWDSharingProximityiOSSetupTriggered setSessionUUID:](self, "setSessionUUID:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_smoothedRSSI = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 4) == 0)
    {
LABEL_7:
      if ((v5 & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) == 0)
  {
    goto LABEL_7;
  }
  self->_userActionType = *((_DWORD *)v4 + 7);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
LABEL_8:
    self->_userMs = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_9:
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
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  uint64_t v5 = 2654435761 * self->_smoothedRSSI;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_userActionType;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_userMs;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 36);
  if (has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_24;
  }
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](sessionUUID, "isEqual:"))
    {
LABEL_24:
      BOOL v8 = 0;
      goto LABEL_25;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 36);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_smoothedRSSI != *((_DWORD *)v4 + 6)) {
      goto LABEL_24;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_24;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_userActionType != *((_DWORD *)v4 + 7)) {
      goto LABEL_24;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_24;
  }
  BOOL v8 = (v6 & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_userMs != *((_DWORD *)v4 + 8)) {
      goto LABEL_24;
    }
    BOOL v8 = 1;
  }
LABEL_25:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  char v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 36) |= 1u;
  }
  id v7 = [(NSString *)self->_sessionUUID copyWithZone:a3];
  BOOL v8 = (void *)v6[2];
  v6[2] = v7;

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *((_DWORD *)v6 + 7) = self->_userActionType;
    *((unsigned char *)v6 + 36) |= 4u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return v6;
    }
    goto LABEL_6;
  }
  *((_DWORD *)v6 + 6) = self->_smoothedRSSI;
  *((unsigned char *)v6 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *((_DWORD *)v6 + 8) = self->_userMs;
    *((unsigned char *)v6 + 36) |= 8u;
  }
  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 36) |= 1u;
  }
  if (self->_sessionUUID)
  {
    char v6 = v4;
    [v4 setSessionUUID:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_smoothedRSSI;
    *((unsigned char *)v4 + 36) |= 2u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 7) = self->_userActionType;
  *((unsigned char *)v4 + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    *((_DWORD *)v4 + 8) = self->_userMs;
    *((unsigned char *)v4 + 36) |= 8u;
  }
LABEL_9:
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
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
LABEL_9:
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
            goto LABEL_50;
          }
          v13 += 7;
          BOOL v10 = v14++ >= 9;
          if (v10)
          {
            unint64_t v15 = 0;
            goto LABEL_52;
          }
        }
        *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_50:
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          unint64_t v15 = 0;
        }
LABEL_52:
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
        *(unsigned char *)&self->_has |= 2u;
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
                goto LABEL_56;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v23) = 0;
        }
LABEL_56:
        uint64_t v34 = 24;
        goto LABEL_65;
      case 4u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)&self->_has |= 4u;
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
                goto LABEL_60;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v23) = 0;
        }
LABEL_60:
        uint64_t v34 = 28;
        goto LABEL_65;
      case 5u:
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v23 = 0;
        *(unsigned char *)&self->_has |= 8u;
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
      unint64_t v32 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v32 == -1 || v32 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v33 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v32);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v32 + 1;
      v23 |= (unint64_t)(v33 & 0x7F) << v30;
      if ((v33 & 0x80) == 0) {
        goto LABEL_62;
      }
      v30 += 7;
      BOOL v10 = v31++ >= 9;
      if (v10)
      {
        LODWORD(v23) = 0;
        goto LABEL_64;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_62:
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v23) = 0;
    }
LABEL_64:
    uint64_t v34 = 32;
LABEL_65:
    *(_DWORD *)&self->PBCodable_opaque[v34] = v23;
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
  if ((has & 2) != 0)
  {
    char v9 = +[NSNumber numberWithInt:self->_smoothedRSSI];
    [v3 setObject:v9 forKey:@"smoothedRSSI"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  BOOL v10 = +[NSNumber numberWithUnsignedInt:self->_userActionType];
  [v3 setObject:v10 forKey:@"userActionType"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_8:
    unint64_t v7 = +[NSNumber numberWithUnsignedInt:self->_userMs];
    [v3 setObject:v7 forKey:@"userMs"];
  }
LABEL_9:

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDSharingProximityiOSSetupTriggered;
  unint64_t v3 = [(AWDSharingProximityiOSSetupTriggered *)&v7 description];
  id v4 = [(AWDSharingProximityiOSSetupTriggered *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasUserMs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasUserMs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setUserMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_userMs = a3;
}

- (BOOL)hasUserActionType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasUserActionType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setUserActionType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_userActionType = a3;
}

- (BOOL)hasSmoothedRSSI
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSmoothedRSSI:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setSmoothedRSSI:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_smoothedRSSI = a3;
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