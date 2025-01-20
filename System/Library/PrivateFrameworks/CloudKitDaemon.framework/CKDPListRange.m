@interface CKDPListRange
- (BOOL)hasLeft;
- (BOOL)hasRight;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPListPosition)left;
- (CKDPListPosition)right;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setLeft:(id)a3;
- (void)setRight:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPListRange

- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4
{
  id v46 = a3;
  if (objc_msgSend_hasLeft(self, v6, v7) && objc_msgSend_hasRight(self, v8, v9))
  {
    v11 = objc_msgSend_left(self, v8, v10);
    int v14 = objc_msgSend_index(v11, v12, v13);
    v17 = objc_msgSend_right(self, v15, v16);
    if (v14 == objc_msgSend_index(v17, v18, v19))
    {
      v22 = objc_msgSend_left(self, v20, v21);
      int isReversed = objc_msgSend_isReversed(v22, v23, v24);
      v28 = objc_msgSend_right(self, v26, v27);
      int v31 = objc_msgSend_isReversed(v28, v29, v30);

      if (isReversed == v31)
      {
        v33 = objc_msgSend_left(self, v8, v32);
        objc_msgSend__CKLogToFileHandle_atDepth_(v33, v34, (uint64_t)v46, (a4 + 1));

        goto LABEL_14;
      }
    }
    else
    {
    }
  }
  if (qword_1EBBCFED0 != -1) {
    dispatch_once(&qword_1EBBCFED0, &unk_1F2043D30);
  }
  objc_msgSend_writeData_(v46, v8, qword_1EBBCFEC8);
  v37 = objc_msgSend_left(self, v35, v36);
  uint64_t v38 = (a4 + 1);
  objc_msgSend__CKLogToFileHandle_atDepth_(v37, v39, (uint64_t)v46, v38);

  if (qword_1EBBCFEE0 != -1) {
    dispatch_once(&qword_1EBBCFEE0, &unk_1F2043D50);
  }
  objc_msgSend_writeData_(v46, v40, qword_1EBBCFED8);
  v43 = objc_msgSend_right(self, v41, v42);
  objc_msgSend__CKLogToFileHandle_atDepth_(v43, v44, (uint64_t)v46, v38);

  if (qword_1EBBCFEF0 != -1) {
    dispatch_once(&qword_1EBBCFEF0, &unk_1F2043D70);
  }
  objc_msgSend_writeData_(v46, v45, qword_1EBBCFEE8);
LABEL_14:
}

- (BOOL)hasLeft
{
  return self->_left != 0;
}

- (BOOL)hasRight
{
  return self->_right != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPListRange;
  v4 = [(CKDPListRange *)&v11 description];
  uint64_t v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  uint64_t v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  left = self->_left;
  if (left)
  {
    v8 = objc_msgSend_dictionaryRepresentation(left, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"left");
  }
  right = self->_right;
  if (right)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(right, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"right");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F65720((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_left)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_right)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  left = self->_left;
  id v8 = v4;
  if (left)
  {
    objc_msgSend_setLeft_(v4, v5, (uint64_t)left);
    id v4 = v8;
  }
  right = self->_right;
  if (right)
  {
    objc_msgSend_setRight_(v8, v5, (uint64_t)right);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  uint64_t v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_left, v11, (uint64_t)a3);
  uint64_t v13 = (void *)v10[1];
  v10[1] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_right, v14, (uint64_t)a3);
  uint64_t v16 = (void *)v10[2];
  v10[2] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((left = self->_left, uint64_t v9 = v4[1], !((unint64_t)left | v9))
     || objc_msgSend_isEqual_(left, v7, v9)))
  {
    right = self->_right;
    uint64_t v11 = v4[2];
    if ((unint64_t)right | v11) {
      char isEqual = objc_msgSend_isEqual_(right, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_left, a2, v2);
  return objc_msgSend_hash(self->_right, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  left = self->_left;
  uint64_t v6 = v4[1];
  uint64_t v9 = v4;
  if (left)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(left, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setLeft_(self, (const char *)v4, v6);
  }
  uint64_t v4 = v9;
LABEL_7:
  right = self->_right;
  uint64_t v8 = v4[2];
  if (right)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(right, (const char *)v4, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setRight_(self, (const char *)v4, v8);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPListPosition)left
{
  return self->_left;
}

- (void)setLeft:(id)a3
{
}

- (CKDPListPosition)right
{
  return self->_right;
}

- (void)setRight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_right, 0);
  objc_storeStrong((id *)&self->_left, 0);
}

@end