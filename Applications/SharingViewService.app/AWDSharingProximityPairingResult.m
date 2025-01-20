@interface AWDSharingProximityPairingResult
- (BOOL)hasConnectErrors;
- (BOOL)hasErrorCode;
- (BOOL)hasPairingMs;
- (BOOL)hasSessionUUID;
- (BOOL)hasTimestamp;
- (BOOL)hasUserAccepted;
- (BOOL)hasUserResponseMs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)userAccepted;
- (NSString)sessionUUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)errorCode;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)connectErrors;
- (unsigned)pairingMs;
- (unsigned)userResponseMs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConnectErrors:(unsigned int)a3;
- (void)setErrorCode:(int)a3;
- (void)setHasConnectErrors:(BOOL)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasPairingMs:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUserAccepted:(BOOL)a3;
- (void)setHasUserResponseMs:(BOOL)a3;
- (void)setPairingMs:(unsigned int)a3;
- (void)setSessionUUID:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUserAccepted:(BOOL)a3;
- (void)setUserResponseMs:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDSharingProximityPairingResult

- (void).cxx_destruct
{
}

- (unsigned)connectErrors
{
  return self->_connectErrors;
}

- (unsigned)pairingMs
{
  return self->_pairingMs;
}

- (int)errorCode
{
  return self->_errorCode;
}

- (unsigned)userResponseMs
{
  return self->_userResponseMs;
}

- (BOOL)userAccepted
{
  return self->_userAccepted;
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
  if (*((unsigned char *)v4 + 48))
  {
    self->_timestamp = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    id v6 = v4;
    -[AWDSharingProximityPairingResult setSessionUUID:](self, "setSessionUUID:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 0x20) != 0)
  {
    self->_userAccepted = *((unsigned char *)v4 + 44);
    *(unsigned char *)&self->_has |= 0x20u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 0x10) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 0x10) == 0)
  {
    goto LABEL_7;
  }
  self->_userResponseMs = *((_DWORD *)v4 + 10);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_errorCode = *((_DWORD *)v4 + 5);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 8) == 0)
  {
LABEL_9:
    if ((v5 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_17:
  self->_pairingMs = *((_DWORD *)v4 + 6);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
LABEL_10:
    self->_connectErrors = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_11:
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
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v5 = 2654435761 * self->_userAccepted;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_userResponseMs;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_7;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_7:
    uint64_t v7 = 2654435761 * self->_errorCode;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_8;
    }
LABEL_13:
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_9;
    }
LABEL_14:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
LABEL_12:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_pairingMs;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v9 = 2654435761 * self->_connectErrors;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 48);
  if (has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_timestamp != *((void *)v4 + 1)) {
      goto LABEL_37;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_37;
  }
  sessionUUID = self->_sessionUUID;
  if ((unint64_t)sessionUUID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](sessionUUID, "isEqual:")) {
      goto LABEL_37;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 48);
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) != 0)
    {
      if (self->_userAccepted)
      {
        if (!*((unsigned char *)v4 + 44)) {
          goto LABEL_37;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 44)) {
        goto LABEL_18;
      }
    }
LABEL_37:
    BOOL v8 = 0;
    goto LABEL_38;
  }
  if ((v6 & 0x20) != 0) {
    goto LABEL_37;
  }
LABEL_18:
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_userResponseMs != *((_DWORD *)v4 + 10)) {
      goto LABEL_37;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_errorCode != *((_DWORD *)v4 + 5)) {
      goto LABEL_37;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_37;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_pairingMs != *((_DWORD *)v4 + 6)) {
      goto LABEL_37;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_37;
  }
  BOOL v8 = (v6 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_connectErrors != *((_DWORD *)v4 + 4)) {
      goto LABEL_37;
    }
    BOOL v8 = 1;
  }
LABEL_38:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  char v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_timestamp;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  id v7 = [(NSString *)self->_sessionUUID copyWithZone:a3];
  BOOL v8 = (void *)v6[4];
  v6[4] = v7;

  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)v6 + 44) = self->_userAccepted;
    *((unsigned char *)v6 + 48) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 10) = self->_userResponseMs;
  *((unsigned char *)v6 + 48) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_13:
    *((_DWORD *)v6 + 6) = self->_pairingMs;
    *((unsigned char *)v6 + 48) |= 8u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v6;
    }
    goto LABEL_8;
  }
LABEL_12:
  *((_DWORD *)v6 + 5) = self->_errorCode;
  *((unsigned char *)v6 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_13;
  }
LABEL_7:
  if ((has & 2) != 0)
  {
LABEL_8:
    *((_DWORD *)v6 + 4) = self->_connectErrors;
    *((unsigned char *)v6 + 48) |= 2u;
  }
  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_timestamp;
    *((unsigned char *)v4 + 48) |= 1u;
  }
  if (self->_sessionUUID)
  {
    char v6 = v4;
    [v4 setSessionUUID:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *((unsigned char *)v4 + 44) = self->_userAccepted;
    *((unsigned char *)v4 + 48) |= 0x20u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 10) = self->_userResponseMs;
  *((unsigned char *)v4 + 48) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((_DWORD *)v4 + 5) = self->_errorCode;
  *((unsigned char *)v4 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_17:
  *((_DWORD *)v4 + 6) = self->_pairingMs;
  *((unsigned char *)v4 + 48) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    *((_DWORD *)v4 + 4) = self->_connectErrors;
    *((unsigned char *)v4 + 48) |= 2u;
  }
LABEL_11:
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
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
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
            goto LABEL_64;
          }
          v13 += 7;
          BOOL v10 = v14++ >= 9;
          if (v10)
          {
            unint64_t v15 = 0;
            goto LABEL_66;
          }
        }
        *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_64:
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          unint64_t v15 = 0;
        }
LABEL_66:
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
        *(unsigned char *)&self->_has |= 0x20u;
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
                uint64_t v23 = 0;
                goto LABEL_70;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v23 = 0;
        }
LABEL_70:
        self->_userAccepted = v23 != 0;
        continue;
      case 4u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)&self->_has |= 0x10u;
        while (2)
        {
          unint64_t v29 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v29 == -1 || v29 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v30 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v29);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v29 + 1;
            v28 |= (unint64_t)(v30 & 0x7F) << v26;
            if (v30 < 0)
            {
              v26 += 7;
              BOOL v10 = v27++ >= 9;
              if (v10)
              {
                LODWORD(v28) = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v28) = 0;
        }
LABEL_74:
        uint64_t v43 = 40;
        goto LABEL_87;
      case 5u:
        char v31 = 0;
        unsigned int v32 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)&self->_has |= 4u;
        while (2)
        {
          unint64_t v33 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v33 == -1 || v33 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v34 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v33);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v33 + 1;
            v28 |= (unint64_t)(v34 & 0x7F) << v31;
            if (v34 < 0)
            {
              v31 += 7;
              BOOL v10 = v32++ >= 9;
              if (v10)
              {
                LODWORD(v28) = 0;
                goto LABEL_78;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v28) = 0;
        }
LABEL_78:
        uint64_t v43 = 20;
        goto LABEL_87;
      case 6u:
        char v35 = 0;
        unsigned int v36 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)&self->_has |= 8u;
        while (2)
        {
          unint64_t v37 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v37 == -1 || v37 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v38 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v37);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v37 + 1;
            v28 |= (unint64_t)(v38 & 0x7F) << v35;
            if (v38 < 0)
            {
              v35 += 7;
              BOOL v10 = v36++ >= 9;
              if (v10)
              {
                LODWORD(v28) = 0;
                goto LABEL_82;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v28) = 0;
        }
LABEL_82:
        uint64_t v43 = 24;
        goto LABEL_87;
      case 7u:
        char v39 = 0;
        unsigned int v40 = 0;
        uint64_t v28 = 0;
        *(unsigned char *)&self->_has |= 2u;
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
      unint64_t v41 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v41 == -1 || v41 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v42 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v41);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v41 + 1;
      v28 |= (unint64_t)(v42 & 0x7F) << v39;
      if ((v42 & 0x80) == 0) {
        goto LABEL_84;
      }
      v39 += 7;
      BOOL v10 = v40++ >= 9;
      if (v10)
      {
        LODWORD(v28) = 0;
        goto LABEL_86;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_84:
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v28) = 0;
    }
LABEL_86:
    uint64_t v43 = 16;
LABEL_87:
    *(_DWORD *)&self->PBCodable_opaque[v43] = v28;
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
  if ((has & 0x20) != 0)
  {
    char v9 = +[NSNumber numberWithBool:self->_userAccepted];
    [v3 setObject:v9 forKey:@"userAccepted"];

    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_7;
  }
  BOOL v10 = +[NSNumber numberWithUnsignedInt:self->_userResponseMs];
  [v3 setObject:v10 forKey:@"userResponseMs"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  int v11 = +[NSNumber numberWithInt:self->_errorCode];
  [v3 setObject:v11 forKey:@"errorCode"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_17:
  v12 = +[NSNumber numberWithUnsignedInt:self->_pairingMs];
  [v3 setObject:v12 forKey:@"pairingMs"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_10:
    unint64_t v7 = +[NSNumber numberWithUnsignedInt:self->_connectErrors];
    [v3 setObject:v7 forKey:@"connectErrors"];
  }
LABEL_11:

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AWDSharingProximityPairingResult;
  unint64_t v3 = [(AWDSharingProximityPairingResult *)&v7 description];
  id v4 = [(AWDSharingProximityPairingResult *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasConnectErrors
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasConnectErrors:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setConnectErrors:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_connectErrors = a3;
}

- (BOOL)hasPairingMs
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasPairingMs:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setPairingMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_pairingMs = a3;
}

- (BOOL)hasErrorCode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_errorCode = a3;
}

- (BOOL)hasUserResponseMs
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasUserResponseMs:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setUserResponseMs:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_userResponseMs = a3;
}

- (BOOL)hasUserAccepted
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasUserAccepted:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setUserAccepted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_userAccepted = a3;
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