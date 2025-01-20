@interface CKDPZoneZoneReference
- (BOOL)hasReferenceType;
- (BOOL)hasZoneIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPRecordZoneIdentifier)zoneIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)referenceTypeAsString:(int)a3;
- (int)StringAsReferenceType:(id)a3;
- (int)referenceType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasReferenceType:(BOOL)a3;
- (void)setReferenceType:(int)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPZoneZoneReference

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (int)referenceType
{
  if (*(unsigned char *)&self->_has) {
    return self->_referenceType;
  }
  else {
    return 1;
  }
}

- (void)setReferenceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_referenceType = a3;
}

- (void)setHasReferenceType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReferenceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)referenceTypeAsString:(int)a3
{
  if (a3 >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F7058[a3];
  }
  return v3;
}

- (int)StringAsReferenceType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"validating"))
  {
    int v6 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"owning"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"weak"))
  {
    int v6 = 2;
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPZoneZoneReference;
  v4 = [(CKDPZoneZoneReference *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"zoneIdentifier");
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t referenceType = self->_referenceType;
    if (referenceType >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_referenceType);
      objc_super v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_super v11 = off_1E64F7058[referenceType];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v11, @"referenceType");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F6B934((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_zoneIdentifier)
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
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    id v7 = v4;
    objc_msgSend_setZoneIdentifier_(v4, v5, (uint64_t)zoneIdentifier);
    id v4 = v7;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_referenceType;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  id v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 8) = self->_referenceType;
    *(unsigned char *)(v10 + 24) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_8;
  }
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v9 = v4[2];
  if ((unint64_t)zoneIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(zoneIdentifier, v7, v9)) {
      goto LABEL_8;
    }
  }
  BOOL v10 = (v4[3] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[3] & 1) != 0 && self->_referenceType == *((_DWORD *)v4 + 2))
    {
      BOOL v10 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v10 = 0;
  }
LABEL_9:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_zoneIdentifier, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_referenceType;
  }
  else {
    uint64_t v5 = 0;
  }
  return v5 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v6 = *((void *)v4 + 2);
  if (zoneIdentifier)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    objc_msgSend_setZoneIdentifier_(self, (const char *)v4, v6);
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 24))
  {
    self->_uint64_t referenceType = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end