@interface CKDPRecordReference
- (BOOL)hasRecordIdentifier;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPRecordIdentifier)recordIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasType:(BOOL)a3;
- (void)setRecordIdentifier:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordReference

- (int)type
{
  if (*(unsigned char *)&self->_has) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E5462220[a3 - 1];
  }

  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"owning", v5))
  {
    int v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v6, @"weak", v7))
  {
    int v8 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"validating", v10))
  {
    int v8 = 3;
  }
  else
  {
    int v8 = 1;
  }

  return v8;
}

- (BOOL)hasRecordIdentifier
{
  return self->_recordIdentifier != 0;
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKDPRecordReference;
  v4 = [(CKDPRecordReference *)&v13 description];
  int v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  int v8 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v9 = self->_type - 1;
    if (v9 >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", v7, self->_type);
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v10 = off_1E5462220[v9];
    }
    objc_msgSend_setObject_forKey_(v8, v5, (uint64_t)v10, @"type");
  }
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    v12 = objc_msgSend_dictionaryRepresentation(recordIdentifier, v5, v6, v7);
    objc_msgSend_setObject_forKey_(v8, v13, (uint64_t)v12, @"recordIdentifier");
  }

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordReferenceReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_recordIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_type;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  recordIdentifier = self->_recordIdentifier;
  if (recordIdentifier)
  {
    int v8 = v4;
    objc_msgSend_setRecordIdentifier_(v4, v5, (uint64_t)recordIdentifier, v6);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  int v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (void *)v12;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v12 + 16) = self->_type;
    *(unsigned char *)(v12 + 20) |= 1u;
  }
  uint64_t v16 = objc_msgSend_copyWithZone_(self->_recordIdentifier, v13, (uint64_t)a3, v14);
  v17 = (void *)v15[1];
  v15[1] = v16;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char isEqual = 0;
    goto LABEL_10;
  }
  recordIdentifier = self->_recordIdentifier;
  uint64_t v11 = v4[1];
  if ((unint64_t)recordIdentifier | v11) {
    char isEqual = objc_msgSend_isEqual_(recordIdentifier, v8, v11, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_10:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_type;
  }
  else {
    uint64_t v4 = 0;
  }
  return objc_msgSend_hash(self->_recordIdentifier, a2, v2, v3) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v6 = v4;
  if (v4[5])
  {
    self->_type = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  recordIdentifier = self->_recordIdentifier;
  uint64_t v8 = v6[1];
  if (recordIdentifier)
  {
    if (!v8) {
      goto LABEL_9;
    }
    uint64_t v9 = v6;
    recordIdentifier = objc_msgSend_mergeFrom_(recordIdentifier, (const char *)v6, v8, v5);
  }
  else
  {
    if (!v8) {
      goto LABEL_9;
    }
    uint64_t v9 = v6;
    recordIdentifier = objc_msgSend_setRecordIdentifier_(self, (const char *)v6, v8, v5);
  }
  uint64_t v6 = v9;
LABEL_9:

  MEMORY[0x1F41817F8](recordIdentifier, v6);
}

- (CKDPRecordIdentifier)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end