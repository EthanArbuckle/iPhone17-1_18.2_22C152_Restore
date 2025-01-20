@interface CKDPAnonymousZoneInfo
- (BOOL)hasAnonymousZoneInfoData;
- (BOOL)hasAnonymousZoneInfoID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)anonymousZoneInfoData;
- (NSString)anonymousZoneInfoID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAnonymousZoneInfoData:(id)a3;
- (void)setAnonymousZoneInfoID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPAnonymousZoneInfo

- (BOOL)hasAnonymousZoneInfoID
{
  return self->_anonymousZoneInfoID != 0;
}

- (BOOL)hasAnonymousZoneInfoData
{
  return self->_anonymousZoneInfoData != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPAnonymousZoneInfo;
  v4 = [(CKDPAnonymousZoneInfo *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  anonymousZoneInfoID = self->_anonymousZoneInfoID;
  if (anonymousZoneInfoID) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)anonymousZoneInfoID, @"anonymousZoneInfoID");
  }
  anonymousZoneInfoData = self->_anonymousZoneInfoData;
  if (anonymousZoneInfoData) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)anonymousZoneInfoData, @"anonymousZoneInfoData");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4EE8B14((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_anonymousZoneInfoID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_anonymousZoneInfoData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  anonymousZoneInfoID = self->_anonymousZoneInfoID;
  id v8 = v4;
  if (anonymousZoneInfoID)
  {
    objc_msgSend_setAnonymousZoneInfoID_(v4, v5, (uint64_t)anonymousZoneInfoID);
    id v4 = v8;
  }
  anonymousZoneInfoData = self->_anonymousZoneInfoData;
  if (anonymousZoneInfoData)
  {
    objc_msgSend_setAnonymousZoneInfoData_(v8, v5, (uint64_t)anonymousZoneInfoData);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_anonymousZoneInfoID, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_anonymousZoneInfoData, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((anonymousZoneInfoID = self->_anonymousZoneInfoID, uint64_t v9 = v4[2], !((unint64_t)anonymousZoneInfoID | v9))
     || objc_msgSend_isEqual_(anonymousZoneInfoID, v7, v9)))
  {
    anonymousZoneInfoData = self->_anonymousZoneInfoData;
    uint64_t v11 = v4[1];
    if ((unint64_t)anonymousZoneInfoData | v11) {
      char isEqual = objc_msgSend_isEqual_(anonymousZoneInfoData, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_anonymousZoneInfoID, a2, v2);
  return objc_msgSend_hash(self->_anonymousZoneInfoData, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v6 = v4[2];
  id v8 = v4;
  if (v6)
  {
    objc_msgSend_setAnonymousZoneInfoID_(self, v5, v6);
    uint64_t v4 = v8;
  }
  uint64_t v7 = v4[1];
  if (v7)
  {
    objc_msgSend_setAnonymousZoneInfoData_(self, v5, v7);
    uint64_t v4 = v8;
  }
}

- (NSString)anonymousZoneInfoID
{
  return self->_anonymousZoneInfoID;
}

- (void)setAnonymousZoneInfoID:(id)a3
{
}

- (NSData)anonymousZoneInfoData
{
  return self->_anonymousZoneInfoData;
}

- (void)setAnonymousZoneInfoData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anonymousZoneInfoID, 0);
  objc_storeStrong((id *)&self->_anonymousZoneInfoData, 0);
}

@end