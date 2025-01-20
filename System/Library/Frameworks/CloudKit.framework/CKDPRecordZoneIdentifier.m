@interface CKDPRecordZoneIdentifier
- (BOOL)hasDatabaseType;
- (BOOL)hasOwnerIdentifier;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPIdentifier)ownerIdentifier;
- (CKDPIdentifier)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)databaseTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsDatabaseType:(id)a3;
- (int)databaseType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDatabaseType:(int)a3;
- (void)setHasDatabaseType:(BOOL)a3;
- (void)setOwnerIdentifier:(id)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordZoneIdentifier

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasOwnerIdentifier
{
  return self->_ownerIdentifier != 0;
}

- (int)databaseType
{
  if (*(unsigned char *)&self->_has) {
    return self->_databaseType;
  }
  else {
    return 1;
  }
}

- (void)setDatabaseType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_databaseType = a3;
}

- (void)setHasDatabaseType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDatabaseType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)databaseTypeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    v4 = objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, a3);
  }
  else
  {
    v4 = (void *)*((void *)&off_1E5463140 + a3 - 1);
  }

  return v4;
}

- (int)StringAsDatabaseType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"privateDB", v5))
  {
    int v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v6, @"publicDB", v7))
  {
    int v8 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"sharedDB", v10))
  {
    int v8 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"orgDB", v12))
  {
    int v8 = 4;
  }
  else
  {
    int v8 = 1;
  }

  return v8;
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKDPRecordZoneIdentifier;
  v4 = [(CKDPRecordZoneIdentifier *)&v13 description];
  int v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  int v8 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  value = self->_value;
  if (value)
  {
    uint64_t v10 = objc_msgSend_dictionaryRepresentation(value, v5, v6, v7);
    objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, @"value");
  }
  ownerIdentifier = self->_ownerIdentifier;
  if (ownerIdentifier)
  {
    objc_super v13 = objc_msgSend_dictionaryRepresentation(ownerIdentifier, v5, v6, v7);
    objc_msgSend_setObject_forKey_(v8, v14, (uint64_t)v13, @"ownerIdentifier");
  }
  if (*(unsigned char *)&self->_has)
  {
    int v15 = self->_databaseType - 1;
    if (v15 >= 4)
    {
      v16 = objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", v7, self->_databaseType);
    }
    else
    {
      v16 = (void *)*((void *)&off_1E5463140 + v15);
    }
    objc_msgSend_setObject_forKey_(v8, v5, (uint64_t)v16, @"databaseType");
  }

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordZoneIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_value)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_ownerIdentifier)
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
  value = self->_value;
  id v9 = v4;
  if (value)
  {
    objc_msgSend_setValue_(v4, v5, (uint64_t)value, v6);
    id v4 = v9;
  }
  ownerIdentifier = self->_ownerIdentifier;
  if (ownerIdentifier)
  {
    objc_msgSend_setOwnerIdentifier_(v9, v5, (uint64_t)ownerIdentifier, v6);
    id v4 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_databaseType;
    *((unsigned char *)v4 + 32) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  int v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_value, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_ownerIdentifier, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v19;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v12 + 8) = self->_databaseType;
    *(unsigned char *)(v12 + 32) |= 1u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_10;
  }
  value = self->_value;
  uint64_t v11 = v4[3];
  if ((unint64_t)value | v11)
  {
    if (!objc_msgSend_isEqual_(value, v8, v11, v9)) {
      goto LABEL_10;
    }
  }
  ownerIdentifier = self->_ownerIdentifier;
  uint64_t v13 = v4[2];
  if ((unint64_t)ownerIdentifier | v13)
  {
    if (!objc_msgSend_isEqual_(ownerIdentifier, v8, v13, v9)) {
      goto LABEL_10;
    }
  }
  BOOL v14 = (v4[4] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[4] & 1) != 0 && self->_databaseType == *((_DWORD *)v4 + 2))
    {
      BOOL v14 = 1;
      goto LABEL_11;
    }
LABEL_10:
    BOOL v14 = 0;
  }
LABEL_11:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_value, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(self->_ownerIdentifier, v6, v7, v8);
  if (*(unsigned char *)&self->_has) {
    uint64_t v10 = 2654435761 * self->_databaseType;
  }
  else {
    uint64_t v10 = 0;
  }
  return v9 ^ v5 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  value = self->_value;
  uint64_t v7 = *((void *)v4 + 3);
  id v10 = v4;
  if (value)
  {
    if (!v7) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(value, (const char *)v4, v7, v5);
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    objc_msgSend_setValue_(self, (const char *)v4, v7, v5);
  }
  id v4 = v10;
LABEL_7:
  ownerIdentifier = self->_ownerIdentifier;
  uint64_t v9 = *((void *)v4 + 2);
  if (ownerIdentifier)
  {
    if (!v9) {
      goto LABEL_13;
    }
    ownerIdentifier = objc_msgSend_mergeFrom_(ownerIdentifier, (const char *)v4, v9, v5);
  }
  else
  {
    if (!v9) {
      goto LABEL_13;
    }
    ownerIdentifier = objc_msgSend_setOwnerIdentifier_(self, (const char *)v4, v9, v5);
  }
  id v4 = v10;
LABEL_13:
  if (*((unsigned char *)v4 + 32))
  {
    self->_databaseType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }

  MEMORY[0x1F41817F8](ownerIdentifier, v4);
}

- (CKDPIdentifier)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (CKDPIdentifier)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (void)setOwnerIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
}

@end