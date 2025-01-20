@interface CKDPRecordSaveResponse
- (BOOL)hasEtag;
- (BOOL)hasExpirationTime;
- (BOOL)hasServerFields;
- (BOOL)hasTimeStatistics;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPDate)expirationTime;
- (CKDPDateStatistics)timeStatistics;
- (CKDPRecord)serverFields;
- (NSString)etag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEtag:(id)a3;
- (void)setExpirationTime:(id)a3;
- (void)setServerFields:(id)a3;
- (void)setTimeStatistics:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordSaveResponse

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasTimeStatistics
{
  return self->_timeStatistics != 0;
}

- (BOOL)hasServerFields
{
  return self->_serverFields != 0;
}

- (BOOL)hasExpirationTime
{
  return self->_expirationTime != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordSaveResponse;
  v4 = [(CKDPRecordSaveResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  etag = self->_etag;
  if (etag) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)etag, @"etag");
  }
  timeStatistics = self->_timeStatistics;
  if (timeStatistics)
  {
    v9 = objc_msgSend_dictionaryRepresentation(timeStatistics, v5, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, @"timeStatistics");
  }
  serverFields = self->_serverFields;
  if (serverFields)
  {
    v12 = objc_msgSend_dictionaryRepresentation(serverFields, v5, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, @"serverFields");
  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    v15 = objc_msgSend_dictionaryRepresentation(expirationTime, v5, (uint64_t)etag);
    objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, @"expirationTime");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E43880((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_etag)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_timeStatistics)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_serverFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_expirationTime)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  etag = self->_etag;
  id v10 = v4;
  if (etag)
  {
    objc_msgSend_setEtag_(v4, v5, (uint64_t)etag);
    id v4 = v10;
  }
  timeStatistics = self->_timeStatistics;
  if (timeStatistics)
  {
    objc_msgSend_setTimeStatistics_(v10, v5, (uint64_t)timeStatistics);
    id v4 = v10;
  }
  serverFields = self->_serverFields;
  if (serverFields)
  {
    objc_msgSend_setServerFields_(v10, v5, (uint64_t)serverFields);
    id v4 = v10;
  }
  expirationTime = self->_expirationTime;
  if (expirationTime)
  {
    objc_msgSend_setExpirationTime_(v10, v5, (uint64_t)expirationTime);
    id v4 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_etag, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_timeStatistics, v14, (uint64_t)a3);
  v16 = (void *)v10[4];
  v10[4] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_serverFields, v17, (uint64_t)a3);
  v19 = (void *)v10[3];
  v10[3] = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_expirationTime, v20, (uint64_t)a3);
  v22 = (void *)v10[2];
  v10[2] = v21;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((etag = self->_etag, uint64_t v9 = v4[1], !((unint64_t)etag | v9))
     || objc_msgSend_isEqual_(etag, v7, v9))
    && ((timeStatistics = self->_timeStatistics, uint64_t v11 = v4[4], !((unint64_t)timeStatistics | v11))
     || objc_msgSend_isEqual_(timeStatistics, v7, v11))
    && ((serverFields = self->_serverFields, uint64_t v13 = v4[3], !((unint64_t)serverFields | v13))
     || objc_msgSend_isEqual_(serverFields, v7, v13)))
  {
    expirationTime = self->_expirationTime;
    uint64_t v15 = v4[2];
    if ((unint64_t)expirationTime | v15) {
      char isEqual = objc_msgSend_isEqual_(expirationTime, v7, v15);
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
  uint64_t v4 = objc_msgSend_hash(self->_etag, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_timeStatistics, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_serverFields, v8, v9);
  return v7 ^ v10 ^ objc_msgSend_hash(self->_expirationTime, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = v4[1];
  uint64_t v12 = v4;
  if (v5)
  {
    objc_msgSend_setEtag_(self, (const char *)v4, v5);
    uint64_t v4 = v12;
  }
  timeStatistics = self->_timeStatistics;
  uint64_t v7 = v4[4];
  if (timeStatistics)
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_mergeFrom_(timeStatistics, (const char *)v4, v7);
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_setTimeStatistics_(self, (const char *)v4, v7);
  }
  uint64_t v4 = v12;
LABEL_9:
  serverFields = self->_serverFields;
  uint64_t v9 = v4[3];
  if (serverFields)
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_mergeFrom_(serverFields, (const char *)v4, v9);
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_setServerFields_(self, (const char *)v4, v9);
  }
  uint64_t v4 = v12;
LABEL_15:
  expirationTime = self->_expirationTime;
  uint64_t v11 = v4[2];
  if (expirationTime)
  {
    if (v11) {
      objc_msgSend_mergeFrom_(expirationTime, (const char *)v4, v11);
    }
  }
  else if (v11)
  {
    objc_msgSend_setExpirationTime_(self, (const char *)v4, v11);
  }
  MEMORY[0x1F41817F8]();
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (CKDPDateStatistics)timeStatistics
{
  return self->_timeStatistics;
}

- (void)setTimeStatistics:(id)a3
{
}

- (CKDPRecord)serverFields
{
  return self->_serverFields;
}

- (void)setServerFields:(id)a3
{
}

- (CKDPDate)expirationTime
{
  return self->_expirationTime;
}

- (void)setExpirationTime:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeStatistics, 0);
  objc_storeStrong((id *)&self->_serverFields, 0);
  objc_storeStrong((id *)&self->_expirationTime, 0);
  objc_storeStrong((id *)&self->_etag, 0);
}

@end