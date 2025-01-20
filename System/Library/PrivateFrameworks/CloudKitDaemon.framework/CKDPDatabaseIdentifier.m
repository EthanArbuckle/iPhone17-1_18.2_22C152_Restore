@interface CKDPDatabaseIdentifier
- (BOOL)hasContainerName;
- (BOOL)hasContainerType;
- (BOOL)hasDatabaseOwnerId;
- (BOOL)hasDatabaseType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPIdentifier)databaseOwnerId;
- (NSString)containerName;
- (id)containerTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)databaseTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsContainerType:(id)a3;
- (int)StringAsDatabaseType:(id)a3;
- (int)containerType;
- (int)databaseType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContainerName:(id)a3;
- (void)setContainerType:(int)a3;
- (void)setDatabaseOwnerId:(id)a3;
- (void)setDatabaseType:(int)a3;
- (void)setHasContainerType:(BOOL)a3;
- (void)setHasDatabaseType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPDatabaseIdentifier

- (BOOL)hasContainerName
{
  return self->_containerName != 0;
}

- (int)databaseType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_databaseType;
  }
  else {
    return 1;
  }
}

- (void)setDatabaseType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_databaseType = a3;
}

- (void)setHasDatabaseType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDatabaseType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)databaseTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F7098[a3 - 1];
  }
  return v3;
}

- (int)StringAsDatabaseType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"privateDB"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"publicDB"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"sharedDB"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"orgDB"))
  {
    int v6 = 4;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasDatabaseOwnerId
{
  return self->_databaseOwnerId != 0;
}

- (int)containerType
{
  if (*(unsigned char *)&self->_has) {
    return self->_containerType;
  }
  else {
    return 1;
  }
}

- (void)setContainerType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_containerType = a3;
}

- (void)setHasContainerType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContainerType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)containerTypeAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"production";
  }
  else if (a3 == 2)
  {
    v4 = @"sandbox";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsContainerType:(id)a3
{
  id v3 = a3;
  int v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, @"production") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, @"sandbox")) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPDatabaseIdentifier;
  v4 = [(CKDPDatabaseIdentifier *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  containerName = self->_containerName;
  if (containerName) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)containerName, @"containerName");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unsigned int v8 = self->_databaseType - 1;
    if (v8 >= 4)
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_databaseType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E64F7098[v8];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v9, @"databaseType");
  }
  databaseOwnerId = self->_databaseOwnerId;
  if (databaseOwnerId)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(databaseOwnerId, v5, (uint64_t)containerName);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"databaseOwnerId");
  }
  if (*(unsigned char *)&self->_has)
  {
    int containerType = self->_containerType;
    if (containerType == 1)
    {
      v14 = @"production";
      objc_msgSend_setObject_forKey_(v6, v5, @"production", @"containerType");
    }
    else if (containerType == 2)
    {
      v14 = @"sandbox";
      objc_msgSend_setObject_forKey_(v6, v5, @"sandbox", @"containerType");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_containerType);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"containerType");
    }
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    unsigned int v8 = (int *)MEMORY[0x1E4F940B8];
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
          PBReaderReadString();
          v18 = (NSString *)objc_claimAutoreleasedReturnValue();
          containerName = self->_containerName;
          self->_containerName = v18;

          goto LABEL_48;
        case 2u:
          char v21 = 0;
          unsigned int v22 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)&self->_has |= 2u;
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
                  goto LABEL_42;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_42:
          uint64_t v33 = 32;
          goto LABEL_47;
        case 3u:
          id v27 = objc_alloc_init(MEMORY[0x1E4F19F08]);
          objc_storeStrong((id *)&self->_databaseOwnerId, v27);
          if (!PBReaderPlaceMark() || (CKDPIdentifierReadFrom() & 1) == 0)
          {

            LOBYTE(v20) = 0;
            return v20;
          }
          PBReaderRecallMark();

LABEL_48:
          if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
            goto LABEL_49;
          }
          break;
        case 4u:
          char v28 = 0;
          unsigned int v29 = 0;
          uint64_t v23 = 0;
          *(unsigned char *)&self->_has |= 1u;
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
              v23 |= (unint64_t)(v32 & 0x7F) << v28;
              if (v32 < 0)
              {
                v28 += 7;
                BOOL v15 = v29++ >= 9;
                if (v15)
                {
                  LODWORD(v23) = 0;
                  goto LABEL_46;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + *v6)) {
            LODWORD(v23) = 0;
          }
LABEL_46:
          uint64_t v33 = 16;
LABEL_47:
          *(_DWORD *)((char *)&self->super.super.isa + v33) = v23;
          goto LABEL_48;
        default:
          int v20 = PBReaderSkipValueWithTag();
          if (!v20) {
            return v20;
          }
          goto LABEL_48;
      }
    }
  }
LABEL_49:
  LOBYTE(v20) = *((unsigned char *)a3 + *v6) == 0;
  return v20;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_containerName)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_databaseOwnerId)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  containerName = self->_containerName;
  id v8 = v4;
  if (containerName)
  {
    objc_msgSend_setContainerName_(v4, v5, (uint64_t)containerName);
    id v4 = v8;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_databaseType;
    *((unsigned char *)v4 + 36) |= 2u;
  }
  databaseOwnerId = self->_databaseOwnerId;
  if (databaseOwnerId)
  {
    objc_msgSend_setDatabaseOwnerId_(v8, v5, (uint64_t)databaseOwnerId);
    id v4 = v8;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_containerType;
    *((unsigned char *)v4 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_containerName, v11, (uint64_t)a3);
  unint64_t v13 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v12;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v10 + 32) = self->_databaseType;
    *(unsigned char *)(v10 + 36) |= 2u;
  }
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_databaseOwnerId, v14, (uint64_t)a3);
  int v16 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v15;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 16) = self->_containerType;
    *(unsigned char *)(v10 + 36) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_16;
  }
  containerName = self->_containerName;
  uint64_t v9 = v4[1];
  if ((unint64_t)containerName | v9)
  {
    if (!objc_msgSend_isEqual_(containerName, v7, v9)) {
      goto LABEL_16;
    }
  }
  char has = (char)self->_has;
  char v11 = *((unsigned char *)v4 + 36);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_databaseType != *((_DWORD *)v4 + 8)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_16;
  }
  databaseOwnerId = self->_databaseOwnerId;
  uint64_t v13 = v4[3];
  if ((unint64_t)databaseOwnerId | v13)
  {
    if (!objc_msgSend_isEqual_(databaseOwnerId, v7, v13))
    {
LABEL_16:
      BOOL v14 = 0;
      goto LABEL_17;
    }
    char has = (char)self->_has;
    char v11 = *((unsigned char *)v4 + 36);
  }
  BOOL v14 = (v11 & 1) == 0;
  if (has)
  {
    if ((v11 & 1) == 0 || self->_containerType != *((_DWORD *)v4 + 4)) {
      goto LABEL_16;
    }
    BOOL v14 = 1;
  }
LABEL_17:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_containerName, a2, v2);
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v7 = 2654435761 * self->_databaseType;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = objc_msgSend_hash(self->_databaseOwnerId, v4, v5);
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_containerType;
  }
  else {
    uint64_t v9 = 0;
  }
  return v7 ^ v6 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)v4 + 1);
  id v8 = v4;
  if (v5)
  {
    objc_msgSend_setContainerName_(self, (const char *)v4, v5);
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    self->_databaseType = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
  }
  databaseOwnerId = self->_databaseOwnerId;
  uint64_t v7 = *((void *)v4 + 3);
  if (databaseOwnerId)
  {
    if (!v7) {
      goto LABEL_11;
    }
    objc_msgSend_mergeFrom_(databaseOwnerId, (const char *)v4, v7);
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    objc_msgSend_setDatabaseOwnerId_(self, (const char *)v4, v7);
  }
  id v4 = v8;
LABEL_11:
  if (*((unsigned char *)v4 + 36))
  {
    self->_int containerType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)containerName
{
  return self->_containerName;
}

- (void)setContainerName:(id)a3
{
}

- (CKDPIdentifier)databaseOwnerId
{
  return self->_databaseOwnerId;
}

- (void)setDatabaseOwnerId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseOwnerId, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
}

@end