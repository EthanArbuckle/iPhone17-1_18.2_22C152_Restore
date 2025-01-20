@interface CKDPFieldAction
- (BOOL)hasDeleteListRange;
- (BOOL)hasInsertIntoList;
- (BOOL)hasReplaceListRange;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPFieldActionDeleteListRange)deleteListRange;
- (CKDPFieldActionInsertIntoList)insertIntoList;
- (CKDPFieldActionReplaceListRange)replaceListRange;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeleteListRange:(id)a3;
- (void)setInsertIntoList:(id)a3;
- (void)setReplaceListRange:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPFieldAction

- (BOOL)hasInsertIntoList
{
  return self->_insertIntoList != 0;
}

- (BOOL)hasDeleteListRange
{
  return self->_deleteListRange != 0;
}

- (BOOL)hasReplaceListRange
{
  return self->_replaceListRange != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPFieldAction;
  v4 = [(CKDPFieldAction *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  insertIntoList = self->_insertIntoList;
  if (insertIntoList)
  {
    v8 = objc_msgSend_dictionaryRepresentation(insertIntoList, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"insert_into_list");
  }
  deleteListRange = self->_deleteListRange;
  if (deleteListRange)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(deleteListRange, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"delete_list_range");
  }
  replaceListRange = self->_replaceListRange;
  if (replaceListRange)
  {
    v14 = objc_msgSend_dictionaryRepresentation(replaceListRange, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"replace_list_range");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F3EDB4((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_insertIntoList)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_deleteListRange)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_replaceListRange)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  insertIntoList = self->_insertIntoList;
  id v9 = v4;
  if (insertIntoList)
  {
    objc_msgSend_setInsertIntoList_(v4, v5, (uint64_t)insertIntoList);
    id v4 = v9;
  }
  deleteListRange = self->_deleteListRange;
  if (deleteListRange)
  {
    objc_msgSend_setDeleteListRange_(v9, v5, (uint64_t)deleteListRange);
    id v4 = v9;
  }
  replaceListRange = self->_replaceListRange;
  if (replaceListRange)
  {
    objc_msgSend_setReplaceListRange_(v9, v5, (uint64_t)replaceListRange);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_insertIntoList, v11, (uint64_t)a3);
  v13 = (void *)v10[2];
  v10[2] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_deleteListRange, v14, (uint64_t)a3);
  v16 = (void *)v10[1];
  v10[1] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_replaceListRange, v17, (uint64_t)a3);
  v19 = (void *)v10[3];
  v10[3] = v18;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((insertIntoList = self->_insertIntoList, uint64_t v9 = v4[2], !((unint64_t)insertIntoList | v9))
     || objc_msgSend_isEqual_(insertIntoList, v7, v9))
    && ((deleteListRange = self->_deleteListRange, uint64_t v11 = v4[1], !((unint64_t)deleteListRange | v11))
     || objc_msgSend_isEqual_(deleteListRange, v7, v11)))
  {
    replaceListRange = self->_replaceListRange;
    uint64_t v13 = v4[3];
    if ((unint64_t)replaceListRange | v13) {
      char isEqual = objc_msgSend_isEqual_(replaceListRange, v7, v13);
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
  uint64_t v4 = objc_msgSend_hash(self->_insertIntoList, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_deleteListRange, v5, v6) ^ v4;
  return v7 ^ objc_msgSend_hash(self->_replaceListRange, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  insertIntoList = self->_insertIntoList;
  uint64_t v6 = v4[2];
  uint64_t v11 = v4;
  if (insertIntoList)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(insertIntoList, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setInsertIntoList_(self, (const char *)v4, v6);
  }
  uint64_t v4 = v11;
LABEL_7:
  deleteListRange = self->_deleteListRange;
  uint64_t v8 = v4[1];
  if (deleteListRange)
  {
    if (!v8) {
      goto LABEL_13;
    }
    objc_msgSend_mergeFrom_(deleteListRange, (const char *)v4, v8);
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    objc_msgSend_setDeleteListRange_(self, (const char *)v4, v8);
  }
  uint64_t v4 = v11;
LABEL_13:
  replaceListRange = self->_replaceListRange;
  uint64_t v10 = v4[3];
  if (replaceListRange)
  {
    if (v10) {
      objc_msgSend_mergeFrom_(replaceListRange, (const char *)v4, v10);
    }
  }
  else if (v10)
  {
    objc_msgSend_setReplaceListRange_(self, (const char *)v4, v10);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPFieldActionInsertIntoList)insertIntoList
{
  return self->_insertIntoList;
}

- (void)setInsertIntoList:(id)a3
{
}

- (CKDPFieldActionDeleteListRange)deleteListRange
{
  return self->_deleteListRange;
}

- (void)setDeleteListRange:(id)a3
{
}

- (CKDPFieldActionReplaceListRange)replaceListRange
{
  return self->_replaceListRange;
}

- (void)setReplaceListRange:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceListRange, 0);
  objc_storeStrong((id *)&self->_insertIntoList, 0);
  objc_storeStrong((id *)&self->_deleteListRange, 0);
}

@end