@interface CKDPLocation
- (BOOL)hasBounds;
- (BOOL)hasCoordinate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPLocationBound)bounds;
- (CKDPLocationCoordinate)coordinate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBounds:(id)a3;
- (void)setCoordinate:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPLocation

- (BOOL)hasCoordinate
{
  return self->_coordinate != 0;
}

- (BOOL)hasBounds
{
  return self->_bounds != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPLocation;
  v4 = [(CKDPLocation *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  coordinate = self->_coordinate;
  if (coordinate)
  {
    v8 = objc_msgSend_dictionaryRepresentation(coordinate, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"coordinate");
  }
  bounds = self->_bounds;
  if (bounds)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(bounds, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"bounds");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  v4 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v5 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v6 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E8]) < *(void *)((char *)a3 + (int)*MEMORY[0x1E4F940E0]))
  {
    v8 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*((unsigned char *)a3 + *v6)) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
      char v9 = 0;
      unsigned int v10 = 0;
      unint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = *v4;
        unint64_t v13 = *(void *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(void *)((char *)a3 + *v5)) {
          break;
        }
        char v14 = *(unsigned char *)(*(void *)((char *)a3 + *v8) + v13);
        *(void *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0) {
          goto LABEL_12;
        }
        v9 += 7;
        if (v10++ >= 9)
        {
          unint64_t v11 = 0;
          int v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((unsigned char *)a3 + *v6) = 1;
LABEL_12:
      int v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((unsigned char *)a3 + *v6)) {
        unint64_t v11 = 0;
      }
LABEL_14:
      if (v16 || (v11 & 7) == 4) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
      if ((v11 >> 3) == 2) {
        break;
      }
      if ((v11 >> 3) == 1)
      {
        v18 = (CKDPLocationBound *)objc_alloc_init(MEMORY[0x1E4F19F10]);
        objc_storeStrong((id *)&self->_coordinate, v18);
        if (!PBReaderPlaceMark() || (CKDPLocationCoordinateReadFrom() & 1) == 0) {
          goto LABEL_30;
        }
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_27:
      if (*(void *)((char *)a3 + *v4) >= *(void *)((char *)a3 + *v5)) {
        return *((unsigned char *)a3 + *v6) == 0;
      }
    }
    v18 = objc_alloc_init(CKDPLocationBound);
    objc_storeStrong((id *)&self->_bounds, v18);
    if (!PBReaderPlaceMark() || (sub_1C4EE6B6C((uint64_t)v18, (uint64_t)a3) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *((unsigned char *)a3 + *v6) == 0;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_coordinate)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_bounds)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  coordinate = self->_coordinate;
  id v8 = v4;
  if (coordinate)
  {
    objc_msgSend_setCoordinate_(v4, v5, (uint64_t)coordinate);
    id v4 = v8;
  }
  bounds = self->_bounds;
  if (bounds)
  {
    objc_msgSend_setBounds_(v8, v5, (uint64_t)bounds);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  unsigned int v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_coordinate, v11, (uint64_t)a3);
  unint64_t v13 = (void *)v10[2];
  v10[2] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_bounds, v14, (uint64_t)a3);
  int v16 = (void *)v10[1];
  v10[1] = v15;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((coordinate = self->_coordinate, uint64_t v9 = v4[2], !((unint64_t)coordinate | v9))
     || objc_msgSend_isEqual_(coordinate, v7, v9)))
  {
    bounds = self->_bounds;
    uint64_t v11 = v4[1];
    if ((unint64_t)bounds | v11) {
      char isEqual = objc_msgSend_isEqual_(bounds, v7, v11);
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
  uint64_t v4 = objc_msgSend_hash(self->_coordinate, a2, v2);
  return objc_msgSend_hash(self->_bounds, v5, v6) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  coordinate = self->_coordinate;
  uint64_t v6 = v4[2];
  uint64_t v9 = v4;
  if (coordinate)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(coordinate, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setCoordinate_(self, (const char *)v4, v6);
  }
  uint64_t v4 = v9;
LABEL_7:
  bounds = self->_bounds;
  uint64_t v8 = v4[1];
  if (bounds)
  {
    if (v8) {
      objc_msgSend_mergeFrom_(bounds, (const char *)v4, v8);
    }
  }
  else if (v8)
  {
    objc_msgSend_setBounds_(self, (const char *)v4, v8);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPLocationCoordinate)coordinate
{
  return self->_coordinate;
}

- (void)setCoordinate:(id)a3
{
}

- (CKDPLocationBound)bounds
{
  return self->_bounds;
}

- (void)setBounds:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinate, 0);
  objc_storeStrong((id *)&self->_bounds, 0);
}

@end