@interface CKDPRecordMoveResponse
- (BOOL)hasMoveMarker;
- (BOOL)hasMovedRecord;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPRecord)moveMarker;
- (CKDPRecord)movedRecord;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMoveMarker:(id)a3;
- (void)setMovedRecord:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordMoveResponse

- (BOOL)hasMoveMarker
{
  return self->_moveMarker != 0;
}

- (BOOL)hasMovedRecord
{
  return self->_movedRecord != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordMoveResponse;
  v4 = [(CKDPRecordMoveResponse *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  moveMarker = self->_moveMarker;
  if (moveMarker)
  {
    v8 = objc_msgSend_dictionaryRepresentation(moveMarker, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"moveMarker");
  }
  movedRecord = self->_movedRecord;
  if (movedRecord)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(movedRecord, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"movedRecord");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4FB1EE0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_moveMarker)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_movedRecord)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  moveMarker = self->_moveMarker;
  id v8 = v4;
  if (moveMarker)
  {
    objc_msgSend_setMoveMarker_(v4, v5, (uint64_t)moveMarker);
    id v4 = v8;
  }
  movedRecord = self->_movedRecord;
  if (movedRecord)
  {
    objc_msgSend_setMovedRecord_(v8, v5, (uint64_t)movedRecord);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_moveMarker, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_movedRecord, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((moveMarker = self->_moveMarker, uint64_t v9 = v4[1], !((unint64_t)moveMarker | v9))
     || objc_msgSend_isEqual_(moveMarker, v7, v9)))
  {
    movedRecord = self->_movedRecord;
    uint64_t v11 = v4[2];
    if ((unint64_t)movedRecord | v11) {
      char isEqual = objc_msgSend_isEqual_(movedRecord, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_moveMarker, a2, v2);
  return objc_msgSend_hash(self->_movedRecord, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  moveMarker = self->_moveMarker;
  uint64_t v6 = v4[1];
  uint64_t v9 = v4;
  if (moveMarker)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(moveMarker, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setMoveMarker_(self, (const char *)v4, v6);
  }
  uint64_t v4 = v9;
LABEL_7:
  movedRecord = self->_movedRecord;
  uint64_t v8 = v4[2];
  if (movedRecord)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(movedRecord, (const char *)v4, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setMovedRecord_(self, (const char *)v4, v8);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPRecord)moveMarker
{
  return self->_moveMarker;
}

- (void)setMoveMarker:(id)a3
{
}

- (CKDPRecord)movedRecord
{
  return self->_movedRecord;
}

- (void)setMovedRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movedRecord, 0);
  objc_storeStrong((id *)&self->_moveMarker, 0);
}

@end