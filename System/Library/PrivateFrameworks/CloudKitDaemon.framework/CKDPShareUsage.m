@interface CKDPShareUsage
- (BOOL)hasDeviceIdentifier;
- (BOOL)hasParticipantHandle;
- (BOOL)hasShareIdentifier;
- (BOOL)hasTime;
- (BOOL)hasUserIdentifier;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPDate)time;
- (CKDPIdentifier)deviceIdentifier;
- (CKDPIdentifier)userIdentifier;
- (CKDPShareIdentifier)shareIdentifier;
- (NSString)participantHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setParticipantHandle:(id)a3;
- (void)setShareIdentifier:(id)a3;
- (void)setTime:(id)a3;
- (void)setUserIdentifier:(id)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPShareUsage

- (int)version
{
  if (*(unsigned char *)&self->_has) {
    return self->_version;
  }
  else {
    return 1;
  }
}

- (void)setVersion:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasTime
{
  return self->_time != 0;
}

- (BOOL)hasDeviceIdentifier
{
  return self->_deviceIdentifier != 0;
}

- (BOOL)hasUserIdentifier
{
  return self->_userIdentifier != 0;
}

- (BOOL)hasShareIdentifier
{
  return self->_shareIdentifier != 0;
}

- (BOOL)hasParticipantHandle
{
  return self->_participantHandle != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPShareUsage;
  v4 = [(CKDPShareUsage *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    v7 = objc_msgSend_numberWithInt_(MEMORY[0x1E4F28ED0], v4, self->_version);
    objc_msgSend_setObject_forKey_(v6, v8, (uint64_t)v7, @"version");
  }
  time = self->_time;
  if (time)
  {
    v10 = objc_msgSend_dictionaryRepresentation(time, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"time");
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    v13 = objc_msgSend_dictionaryRepresentation(deviceIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"deviceIdentifier");
  }
  userIdentifier = self->_userIdentifier;
  if (userIdentifier)
  {
    v16 = objc_msgSend_dictionaryRepresentation(userIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v17, (uint64_t)v16, @"userIdentifier");
  }
  shareIdentifier = self->_shareIdentifier;
  if (shareIdentifier)
  {
    v19 = objc_msgSend_dictionaryRepresentation(shareIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v20, (uint64_t)v19, @"shareIdentifier");
  }
  participantHandle = self->_participantHandle;
  if (participantHandle) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)participantHandle, @"participantHandle");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v8 = (int *)MEMORY[0x1E4F940B8];
    while (!*((unsigned char *)a3 + *v6))
    {
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
          uint64_t v20 = 0;
          *(unsigned char *)&self->_has |= 1u;
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
              goto LABEL_41;
            }
            v18 += 7;
            BOOL v15 = v19++ >= 9;
            if (v15)
            {
              LODWORD(v20) = 0;
              goto LABEL_43;
            }
          }
          *((unsigned char *)a3 + *v6) = 1;
LABEL_41:
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v20) = 0;
          }
LABEL_43:
          self->_version = v20;
          goto LABEL_44;
        case 2u:
          v25 = (CKDPShareIdentifier *)objc_alloc_init(MEMORY[0x1E4F19EF8]);
          objc_storeStrong((id *)&self->_time, v25);
          if (!PBReaderPlaceMark() || (CKDPDateReadFrom() & 1) == 0) {
            goto LABEL_46;
          }
          goto LABEL_38;
        case 3u:
          v25 = (CKDPShareIdentifier *)objc_alloc_init(MEMORY[0x1E4F19F08]);
          uint64_t v26 = 8;
          goto LABEL_33;
        case 4u:
          v25 = (CKDPShareIdentifier *)objc_alloc_init(MEMORY[0x1E4F19F08]);
          uint64_t v26 = 40;
LABEL_33:
          objc_storeStrong((id *)((char *)&self->super.super.isa + v26), v25);
          if (!PBReaderPlaceMark() || (CKDPIdentifierReadFrom() & 1) == 0) {
            goto LABEL_46;
          }
          goto LABEL_38;
        case 5u:
          v25 = objc_alloc_init(CKDPShareIdentifier);
          objc_storeStrong((id *)&self->_shareIdentifier, v25);
          if (!PBReaderPlaceMark() || !CKDPShareIdentifierReadFrom((uint64_t)v25, (uint64_t)a3))
          {
LABEL_46:

            LOBYTE(v24) = 0;
            return v24;
          }
LABEL_38:
          PBReaderRecallMark();

LABEL_44:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_45;
          }
          break;
        case 6u:
          PBReaderReadString();
          v27 = (NSString *)objc_claimAutoreleasedReturnValue();
          participantHandle = self->_participantHandle;
          self->_participantHandle = v27;

          goto LABEL_44;
        default:
          int v24 = PBReaderSkipValueWithTag();
          if (!v24) {
            return v24;
          }
          goto LABEL_44;
      }
    }
  }
LABEL_45:
  LOBYTE(v24) = *((unsigned char *)a3 + *v6) == 0;
  return v24;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_time)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_deviceIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_userIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_shareIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_participantHandle)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[12] = self->_version;
    *((unsigned char *)v4 + 52) |= 1u;
  }
  time = self->_time;
  unint64_t v11 = v4;
  if (time)
  {
    objc_msgSend_setTime_(v4, v5, (uint64_t)time);
    id v4 = v11;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    objc_msgSend_setDeviceIdentifier_(v11, v5, (uint64_t)deviceIdentifier);
    id v4 = v11;
  }
  userIdentifier = self->_userIdentifier;
  if (userIdentifier)
  {
    objc_msgSend_setUserIdentifier_(v11, v5, (uint64_t)userIdentifier);
    id v4 = v11;
  }
  shareIdentifier = self->_shareIdentifier;
  if (shareIdentifier)
  {
    objc_msgSend_setShareIdentifier_(v11, v5, (uint64_t)shareIdentifier);
    id v4 = v11;
  }
  participantHandle = self->_participantHandle;
  if (participantHandle)
  {
    objc_msgSend_setParticipantHandle_(v11, v5, (uint64_t)participantHandle);
    id v4 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = (void *)v10;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 48) = self->_version;
    *(unsigned char *)(v10 + 52) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_time, v11, (uint64_t)a3);
  char v14 = (void *)v12[4];
  v12[4] = v13;

  uint64_t v16 = objc_msgSend_copyWithZone_(self->_deviceIdentifier, v15, (uint64_t)a3);
  v17 = (void *)v12[1];
  v12[1] = v16;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_userIdentifier, v18, (uint64_t)a3);
  uint64_t v20 = (void *)v12[5];
  v12[5] = v19;

  uint64_t v22 = objc_msgSend_copyWithZone_(self->_shareIdentifier, v21, (uint64_t)a3);
  char v23 = (void *)v12[3];
  v12[3] = v22;

  uint64_t v25 = objc_msgSend_copyWithZone_(self->_participantHandle, v24, (uint64_t)a3);
  uint64_t v26 = (void *)v12[2];
  v12[2] = v25;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_version != *((_DWORD *)v4 + 12)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
LABEL_17:
    char isEqual = 0;
    goto LABEL_18;
  }
  time = self->_time;
  uint64_t v9 = v4[4];
  if ((unint64_t)time | v9 && !objc_msgSend_isEqual_(time, v7, v9)) {
    goto LABEL_17;
  }
  deviceIdentifier = self->_deviceIdentifier;
  uint64_t v11 = v4[1];
  if ((unint64_t)deviceIdentifier | v11)
  {
    if (!objc_msgSend_isEqual_(deviceIdentifier, v7, v11)) {
      goto LABEL_17;
    }
  }
  userIdentifier = self->_userIdentifier;
  uint64_t v13 = v4[5];
  if ((unint64_t)userIdentifier | v13)
  {
    if (!objc_msgSend_isEqual_(userIdentifier, v7, v13)) {
      goto LABEL_17;
    }
  }
  shareIdentifier = self->_shareIdentifier;
  uint64_t v15 = v4[3];
  if ((unint64_t)shareIdentifier | v15)
  {
    if (!objc_msgSend_isEqual_(shareIdentifier, v7, v15)) {
      goto LABEL_17;
    }
  }
  participantHandle = self->_participantHandle;
  uint64_t v17 = v4[2];
  if ((unint64_t)participantHandle | v17) {
    char isEqual = objc_msgSend_isEqual_(participantHandle, v7, v17);
  }
  else {
    char isEqual = 1;
  }
LABEL_18:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_version;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_msgSend_hash(self->_time, a2, v2) ^ v4;
  uint64_t v8 = objc_msgSend_hash(self->_deviceIdentifier, v6, v7);
  uint64_t v11 = v5 ^ v8 ^ objc_msgSend_hash(self->_userIdentifier, v9, v10);
  uint64_t v14 = objc_msgSend_hash(self->_shareIdentifier, v12, v13);
  return v11 ^ v14 ^ objc_msgSend_hash(self->_participantHandle, v15, v16);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = v4;
  if (v4[13])
  {
    self->_version = v4[12];
    *(unsigned char *)&self->_has |= 1u;
  }
  time = self->_time;
  uint64_t v7 = v5[4];
  uint64_t v15 = v5;
  if (time)
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_mergeFrom_(time, (const char *)v5, v7);
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_setTime_(self, (const char *)v5, v7);
  }
  uint64_t v5 = v15;
LABEL_9:
  deviceIdentifier = self->_deviceIdentifier;
  uint64_t v9 = v5[1];
  if (deviceIdentifier)
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_mergeFrom_(deviceIdentifier, (const char *)v5, v9);
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_setDeviceIdentifier_(self, (const char *)v5, v9);
  }
  uint64_t v5 = v15;
LABEL_15:
  userIdentifier = self->_userIdentifier;
  uint64_t v11 = v5[5];
  if (userIdentifier)
  {
    if (!v11) {
      goto LABEL_21;
    }
    objc_msgSend_mergeFrom_(userIdentifier, (const char *)v5, v11);
  }
  else
  {
    if (!v11) {
      goto LABEL_21;
    }
    objc_msgSend_setUserIdentifier_(self, (const char *)v5, v11);
  }
  uint64_t v5 = v15;
LABEL_21:
  shareIdentifier = self->_shareIdentifier;
  uint64_t v13 = v5[3];
  if (shareIdentifier)
  {
    if (!v13) {
      goto LABEL_27;
    }
    objc_msgSend_mergeFrom_(shareIdentifier, (const char *)v5, v13);
  }
  else
  {
    if (!v13) {
      goto LABEL_27;
    }
    objc_msgSend_setShareIdentifier_(self, (const char *)v5, v13);
  }
  uint64_t v5 = v15;
LABEL_27:
  uint64_t v14 = v5[2];
  if (v14) {
    objc_msgSend_setParticipantHandle_(self, (const char *)v5, v14);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPDate)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
}

- (CKDPIdentifier)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (CKDPIdentifier)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
}

- (CKDPShareIdentifier)shareIdentifier
{
  return self->_shareIdentifier;
}

- (void)setShareIdentifier:(id)a3
{
}

- (NSString)participantHandle
{
  return self->_participantHandle;
}

- (void)setParticipantHandle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_shareIdentifier, 0);
  objc_storeStrong((id *)&self->_participantHandle, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end