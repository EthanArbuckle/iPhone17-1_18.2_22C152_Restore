@interface CKDPRecordIdentifier
- (BOOL)hasValue;
- (BOOL)hasZoneIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPIdentifier)value;
- (CKDPRecordZoneIdentifier)zoneIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setValue:(id)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordIdentifier

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKDPRecordIdentifier;
  v4 = [(CKDPRecordIdentifier *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v8 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  value = self->_value;
  if (value)
  {
    uint64_t v10 = objc_msgSend_dictionaryRepresentation(value, v5, v6, v7);
    objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, @"value");
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_super v13 = objc_msgSend_dictionaryRepresentation(zoneIdentifier, v5, v6, v7);
    objc_msgSend_setObject_forKey_(v8, v14, (uint64_t)v13, @"zoneIdentifier");
  }

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
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
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v9, v5, (uint64_t)zoneIdentifier, v6);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_value, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[1];
  v12[1] = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v17, (uint64_t)a3, v18);
  v20 = (void *)v12[2];
  v12[2] = v19;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((value = self->_value, uint64_t v11 = v4[1], !((unint64_t)value | v11))
     || objc_msgSend_isEqual_(value, v8, v11, v9)))
  {
    zoneIdentifier = self->_zoneIdentifier;
    uint64_t v13 = v4[2];
    if ((unint64_t)zoneIdentifier | v13) {
      char isEqual = objc_msgSend_isEqual_(zoneIdentifier, v8, v13, v9);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_value, a2, v2, v3);
  return objc_msgSend_hash(self->_zoneIdentifier, v6, v7, v8) ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  value = self->_value;
  uint64_t v7 = v4[1];
  uint64_t v10 = v4;
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
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v9 = v4[2];
  if (zoneIdentifier)
  {
    if (!v9) {
      goto LABEL_13;
    }
    zoneIdentifier = objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v4, v9, v5);
  }
  else
  {
    if (!v9) {
      goto LABEL_13;
    }
    zoneIdentifier = objc_msgSend_setZoneIdentifier_(self, (const char *)v4, v9, v5);
  }
  id v4 = v10;
LABEL_13:

  MEMORY[0x1F41817F8](zoneIdentifier, v4);
}

- (CKDPIdentifier)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
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
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);

  objc_storeStrong((id *)&self->_value, 0);
}

@end