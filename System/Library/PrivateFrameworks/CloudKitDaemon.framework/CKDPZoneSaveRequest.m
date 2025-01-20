@interface CKDPZoneSaveRequest
+ (id)options;
- (BOOL)hasAncestryEtag;
- (BOOL)hasReParentingDestinationAncestryEtag;
- (BOOL)hasRecordZone;
- (BOOL)hasZoneProtectionInfoTag;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPAncestryEtag)ancestryEtag;
- (CKDPAncestryEtag)reParentingDestinationAncestryEtag;
- (CKDPZone)recordZone;
- (Class)responseClass;
- (NSString)zoneProtectionInfoTag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAncestryEtag:(id)a3;
- (void)setReParentingDestinationAncestryEtag:(id)a3;
- (void)setRecordZone:(id)a3;
- (void)setZoneProtectionInfoTag:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPZoneSaveRequest

+ (id)options
{
  if (qword_1EBBCDD20 != -1) {
    dispatch_once(&qword_1EBBCDD20, &unk_1F20431B0);
  }
  v2 = (void *)qword_1EBBCDD18;
  return v2;
}

- (BOOL)hasRecordZone
{
  return self->_recordZone != 0;
}

- (BOOL)hasZoneProtectionInfoTag
{
  return self->_zoneProtectionInfoTag != 0;
}

- (BOOL)hasAncestryEtag
{
  return self->_ancestryEtag != 0;
}

- (BOOL)hasReParentingDestinationAncestryEtag
{
  return self->_reParentingDestinationAncestryEtag != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPZoneSaveRequest;
  v4 = [(CKDPZoneSaveRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  recordZone = self->_recordZone;
  if (recordZone)
  {
    v8 = objc_msgSend_dictionaryRepresentation(recordZone, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"recordZone");
  }
  zoneProtectionInfoTag = self->_zoneProtectionInfoTag;
  if (zoneProtectionInfoTag) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)zoneProtectionInfoTag, @"zoneProtectionInfoTag");
  }
  ancestryEtag = self->_ancestryEtag;
  if (ancestryEtag)
  {
    v12 = objc_msgSend_dictionaryRepresentation(ancestryEtag, v4, (uint64_t)zoneProtectionInfoTag);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, @"ancestryEtag");
  }
  reParentingDestinationAncestryEtag = self->_reParentingDestinationAncestryEtag;
  if (reParentingDestinationAncestryEtag)
  {
    v15 = objc_msgSend_dictionaryRepresentation(reParentingDestinationAncestryEtag, v4, (uint64_t)zoneProtectionInfoTag);
    objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, @"reParentingDestinationAncestryEtag");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4DF5490((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_recordZone)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_zoneProtectionInfoTag)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_ancestryEtag)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_reParentingDestinationAncestryEtag)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (unsigned)requestTypeCode
{
  return 8;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  recordZone = self->_recordZone;
  id v10 = v4;
  if (recordZone)
  {
    objc_msgSend_setRecordZone_(v4, v5, (uint64_t)recordZone);
    id v4 = v10;
  }
  zoneProtectionInfoTag = self->_zoneProtectionInfoTag;
  if (zoneProtectionInfoTag)
  {
    objc_msgSend_setZoneProtectionInfoTag_(v10, v5, (uint64_t)zoneProtectionInfoTag);
    id v4 = v10;
  }
  ancestryEtag = self->_ancestryEtag;
  if (ancestryEtag)
  {
    objc_msgSend_setAncestryEtag_(v10, v5, (uint64_t)ancestryEtag);
    id v4 = v10;
  }
  reParentingDestinationAncestryEtag = self->_reParentingDestinationAncestryEtag;
  if (reParentingDestinationAncestryEtag)
  {
    objc_msgSend_setReParentingDestinationAncestryEtag_(v10, v5, (uint64_t)reParentingDestinationAncestryEtag);
    id v4 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_recordZone, v11, (uint64_t)a3);
  v13 = (void *)v10[3];
  v10[3] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_zoneProtectionInfoTag, v14, (uint64_t)a3);
  v16 = (void *)v10[4];
  v10[4] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_ancestryEtag, v17, (uint64_t)a3);
  v19 = (void *)v10[1];
  v10[1] = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_reParentingDestinationAncestryEtag, v20, (uint64_t)a3);
  v22 = (void *)v10[2];
  v10[2] = v21;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((recordZone = self->_recordZone, uint64_t v9 = v4[3], !((unint64_t)recordZone | v9))
     || objc_msgSend_isEqual_(recordZone, v7, v9))
    && ((zoneProtectionInfoTag = self->_zoneProtectionInfoTag,
         uint64_t v11 = v4[4],
         !((unint64_t)zoneProtectionInfoTag | v11))
     || objc_msgSend_isEqual_(zoneProtectionInfoTag, v7, v11))
    && ((ancestryEtag = self->_ancestryEtag, uint64_t v13 = v4[1], !((unint64_t)ancestryEtag | v13))
     || objc_msgSend_isEqual_(ancestryEtag, v7, v13)))
  {
    reParentingDestinationAncestryEtag = self->_reParentingDestinationAncestryEtag;
    uint64_t v15 = v4[2];
    if ((unint64_t)reParentingDestinationAncestryEtag | v15) {
      char isEqual = objc_msgSend_isEqual_(reParentingDestinationAncestryEtag, v7, v15);
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
  uint64_t v4 = objc_msgSend_hash(self->_recordZone, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_zoneProtectionInfoTag, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_ancestryEtag, v8, v9);
  return v7 ^ v10 ^ objc_msgSend_hash(self->_reParentingDestinationAncestryEtag, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  recordZone = self->_recordZone;
  uint64_t v6 = v4[3];
  uint64_t v12 = v4;
  if (recordZone)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(recordZone, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setRecordZone_(self, (const char *)v4, v6);
  }
  uint64_t v4 = v12;
LABEL_7:
  uint64_t v7 = v4[4];
  if (v7)
  {
    objc_msgSend_setZoneProtectionInfoTag_(self, (const char *)v4, v7);
    uint64_t v4 = v12;
  }
  ancestryEtag = self->_ancestryEtag;
  uint64_t v9 = v4[1];
  if (ancestryEtag)
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_mergeFrom_(ancestryEtag, (const char *)v4, v9);
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_setAncestryEtag_(self, (const char *)v4, v9);
  }
  uint64_t v4 = v12;
LABEL_15:
  reParentingDestinationAncestryEtag = self->_reParentingDestinationAncestryEtag;
  uint64_t v11 = v4[2];
  if (reParentingDestinationAncestryEtag)
  {
    if (v11) {
      objc_msgSend_mergeFrom_(reParentingDestinationAncestryEtag, (const char *)v4, v11);
    }
  }
  else if (v11)
  {
    objc_msgSend_setReParentingDestinationAncestryEtag_(self, (const char *)v4, v11);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPZone)recordZone
{
  return self->_recordZone;
}

- (void)setRecordZone:(id)a3
{
}

- (NSString)zoneProtectionInfoTag
{
  return self->_zoneProtectionInfoTag;
}

- (void)setZoneProtectionInfoTag:(id)a3
{
}

- (CKDPAncestryEtag)ancestryEtag
{
  return self->_ancestryEtag;
}

- (void)setAncestryEtag:(id)a3
{
}

- (CKDPAncestryEtag)reParentingDestinationAncestryEtag
{
  return self->_reParentingDestinationAncestryEtag;
}

- (void)setReParentingDestinationAncestryEtag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneProtectionInfoTag, 0);
  objc_storeStrong((id *)&self->_recordZone, 0);
  objc_storeStrong((id *)&self->_reParentingDestinationAncestryEtag, 0);
  objc_storeStrong((id *)&self->_ancestryEtag, 0);
}

@end