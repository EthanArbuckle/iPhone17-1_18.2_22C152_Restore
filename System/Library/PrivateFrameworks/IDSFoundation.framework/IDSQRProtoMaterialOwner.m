@interface IDSQRProtoMaterialOwner
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)materialTypesAsString:(int)a3;
- (int)StringAsMaterialTypes:(id)a3;
- (int)materialTypeAtIndex:(unint64_t)a3;
- (int)materialTypes;
- (unint64_t)hash;
- (unint64_t)materialTypesCount;
- (unint64_t)participantId;
- (void)addMaterialType:(int)a3;
- (void)clearMaterialTypes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setMaterialTypes:(int *)a3 count:(unint64_t)a4;
- (void)setParticipantId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoMaterialOwner

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)IDSQRProtoMaterialOwner;
  [(IDSQRProtoMaterialOwner *)&v3 dealloc];
}

- (unint64_t)materialTypesCount
{
  return self->_materialTypes.count;
}

- (int)materialTypes
{
  return self->_materialTypes.list;
}

- (void)clearMaterialTypes
{
}

- (void)addMaterialType:(int)a3
{
}

- (int)materialTypeAtIndex:(unint64_t)a3
{
  p_materialTypes = &self->_materialTypes;
  unint64_t count = self->_materialTypes.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v12 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, v11, v9, 0);
    objc_msgSend_raise(v12, v13, v14, v15);
  }
  return p_materialTypes->list[a3];
}

- (void)setMaterialTypes:(int *)a3 count:(unint64_t)a4
{
}

- (id)materialTypesAsString:(int)a3
{
  if a3 < 0xF && ((0x78E1u >> a3))
  {
    v4 = off_1E5975300[a3];
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsMaterialTypes:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"UNDEFINED", v5))
  {
    int v8 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v6, @"PREKEY", v7))
  {
    int v8 = 11;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"AVCBLOB", v10))
  {
    int v8 = 12;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"MKM", v12))
  {
    int v8 = 13;
  }
  else if (objc_msgSend_isEqualToString_(v3, v13, @"SKM", v14))
  {
    int v8 = 14;
  }
  else if (objc_msgSend_isEqualToString_(v3, v15, @"MIRAGEKEY", v16))
  {
    int v8 = 5;
  }
  else if (objc_msgSend_isEqualToString_(v3, v17, @"MIRAGEBLOB", v18))
  {
    int v8 = 6;
  }
  else if (objc_msgSend_isEqualToString_(v3, v19, @"IDS_CONTEXT_BLOB", v20))
  {
    int v8 = 7;
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoMaterialOwner;
  v4 = [(IDSQRProtoMaterialOwner *)&v13 description];
  int v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  double v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  double v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  int v8 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v6, self->_participantId, v7);
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, @"participant_id");

  p_materialTypes = &self->_materialTypes;
  unint64_t count = self->_materialTypes.count;
  if (count)
  {
    double v16 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v11, count, v12);
    if (p_materialTypes->count)
    {
      unint64_t v18 = 0;
      do
      {
        uint64_t v19 = p_materialTypes->list[v18];
        if v19 < 0xF && ((0x78E1u >> v19))
        {
          double v20 = off_1E5975300[v19];
          objc_msgSend_addObject_(v16, v15, (uint64_t)v20, v17);
        }
        else
        {
          objc_msgSend_stringWithFormat_(NSString, v15, @"(unknown: %i)", v17, p_materialTypes->list[v18]);
          double v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v16, v21, (uint64_t)v20, v22);
        }

        ++v18;
      }
      while (v18 < p_materialTypes->count);
    }
    objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v16, v17, @"material_type");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoMaterialOwnerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteUint64Field();
  p_materialTypes = &self->_materialTypes;
  if (p_materialTypes->count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < p_materialTypes->count);
  }
}

- (void)copyTo:(id)a3
{
  v21 = a3;
  v21[4] = self->_participantId;
  if (objc_msgSend_materialTypesCount(self, v4, v5, v6))
  {
    objc_msgSend_clearMaterialTypes(v21, v7, v8, v9);
    uint64_t v13 = objc_msgSend_materialTypesCount(self, v10, v11, v12);
    if (v13)
    {
      uint64_t v16 = v13;
      for (uint64_t i = 0; i != v16; ++i)
      {
        uint64_t v18 = objc_msgSend_materialTypeAtIndex_(self, v14, i, v15);
        objc_msgSend_addMaterialType_(v21, v19, v18, v20);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  double v12 = objc_msgSend_init(v8, v9, v10, v11);
  v12[4] = self->_participantId;
  PBRepeatedInt32Copy();
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) && self->_participantId == v4[4]) {
    char IsEqual = PBRepeatedInt32IsEqual();
  }
  else {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  unint64_t v2 = 2654435761u * self->_participantId;
  return PBRepeatedInt32Hash() ^ v2;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  self->_participantId = v4[4];
  id v16 = v4;
  uint64_t v8 = objc_msgSend_materialTypesCount(v4, v5, v6, v7);
  if (v8)
  {
    uint64_t v11 = v8;
    for (uint64_t i = 0; i != v11; ++i)
    {
      uint64_t v13 = objc_msgSend_materialTypeAtIndex_(v16, v9, i, v10);
      objc_msgSend_addMaterialType_(self, v14, v13, v15);
    }
  }
}

- (unint64_t)participantId
{
  return self->_participantId;
}

- (void)setParticipantId:(unint64_t)a3
{
  self->_participantId = a3;
}

@end