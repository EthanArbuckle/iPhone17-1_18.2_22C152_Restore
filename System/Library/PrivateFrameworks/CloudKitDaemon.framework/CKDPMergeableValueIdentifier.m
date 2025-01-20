@interface CKDPMergeableValueIdentifier
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

@implementation CKDPMergeableValueIdentifier

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
  v11.receiver = self;
  v11.super_class = (Class)CKDPMergeableValueIdentifier;
  v4 = [(CKDPMergeableValueIdentifier *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  value = self->_value;
  if (value)
  {
    v8 = objc_msgSend_dictionaryRepresentation(value, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"value");
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"zoneIdentifier");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E62940((uint64_t)self, (uint64_t)a3);
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
  id v8 = v4;
  if (value)
  {
    objc_msgSend_setValue_(v4, v5, (uint64_t)value);
    id v4 = v8;
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v8, v5, (uint64_t)zoneIdentifier);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_value, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((value = self->_value, uint64_t v9 = v4[1], !((unint64_t)value | v9))
     || objc_msgSend_isEqual_(value, v7, v9)))
  {
    zoneIdentifier = self->_zoneIdentifier;
    uint64_t v11 = v4[2];
    if ((unint64_t)zoneIdentifier | v11) {
      char isEqual = objc_msgSend_isEqual_(zoneIdentifier, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_value, a2, v2);
  return objc_msgSend_hash(self->_zoneIdentifier, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  value = self->_value;
  uint64_t v6 = v4[1];
  uint64_t v9 = v4;
  if (value)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(value, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setValue_(self, (const char *)v4, v6);
  }
  uint64_t v4 = v9;
LABEL_7:
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v8 = v4[2];
  if (zoneIdentifier)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v4, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setZoneIdentifier_(self, (const char *)v4, v8);
  }
  MEMORY[0x1F41817F8]();
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