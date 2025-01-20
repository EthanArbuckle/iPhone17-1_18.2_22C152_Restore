@interface CKDPAncestryEtagAncestorInformation
- (BOOL)hasZoneEtag;
- (BOOL)hasZoneIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPRecordZoneIdentifier)zoneIdentifier;
- (NSString)zoneEtag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setZoneEtag:(id)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPAncestryEtagAncestorInformation

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (BOOL)hasZoneEtag
{
  return self->_zoneEtag != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPAncestryEtagAncestorInformation;
  v4 = [(CKDPAncestryEtagAncestorInformation *)&v11 description];
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
  zoneEtag = self->_zoneEtag;
  if (zoneEtag) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)zoneEtag, @"zoneEtag");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4DAA1FC((uint64_t)self, (uint64_t)a3);
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
  if (self->_zoneEtag)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  id v8 = v4;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v4, v5, (uint64_t)zoneIdentifier);
    id v4 = v8;
  }
  zoneEtag = self->_zoneEtag;
  if (zoneEtag)
  {
    objc_msgSend_setZoneEtag_(v8, v5, (uint64_t)zoneEtag);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_zoneEtag, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((zoneIdentifier = self->_zoneIdentifier, uint64_t v9 = v4[2], !((unint64_t)zoneIdentifier | v9))
     || objc_msgSend_isEqual_(zoneIdentifier, v7, v9)))
  {
    zoneEtag = self->_zoneEtag;
    uint64_t v11 = v4[1];
    if ((unint64_t)zoneEtag | v11) {
      char isEqual = objc_msgSend_isEqual_(zoneEtag, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_zoneIdentifier, a2, v2);
  return objc_msgSend_hash(self->_zoneEtag, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v6 = v4[2];
  id v8 = v4;
  if (zoneIdentifier)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setZoneIdentifier_(self, (const char *)v4, v6);
  }
  uint64_t v4 = v8;
LABEL_7:
  uint64_t v7 = v4[1];
  if (v7) {
    objc_msgSend_setZoneEtag_(self, (const char *)v4, v7);
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

- (NSString)zoneEtag
{
  return self->_zoneEtag;
}

- (void)setZoneEtag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_zoneEtag, 0);
}

@end