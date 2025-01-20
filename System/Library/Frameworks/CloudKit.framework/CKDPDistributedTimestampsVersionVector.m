@interface CKDPDistributedTimestampsVersionVector
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)stateValuesAsString:(int)a3;
- (int)StringAsStateValues:(id)a3;
- (int)stateValues;
- (int)stateValuesAtIndex:(unint64_t)a3;
- (unint64_t)clockValueLengths;
- (unint64_t)clockValueLengthsAtIndex:(unint64_t)a3;
- (unint64_t)clockValueLengthsCount;
- (unint64_t)clockValues;
- (unint64_t)clockValuesAtIndex:(unint64_t)a3;
- (unint64_t)clockValuesCount;
- (unint64_t)hash;
- (unint64_t)stateValueLengthsCount;
- (unint64_t)stateValuesCount;
- (unsigned)stateValueLengths;
- (unsigned)stateValueLengthsAtIndex:(unint64_t)a3;
- (void)addClockValueLengths:(unint64_t)a3;
- (void)addClockValues:(unint64_t)a3;
- (void)addStateValueLengths:(unsigned int)a3;
- (void)addStateValues:(int)a3;
- (void)clearClockValueLengths;
- (void)clearClockValues;
- (void)clearStateValueLengths;
- (void)clearStateValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setClockValueLengths:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setClockValues:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setStateValueLengths:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setStateValues:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation CKDPDistributedTimestampsVersionVector

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)CKDPDistributedTimestampsVersionVector;
  [(CKDPDistributedTimestampsVersionVector *)&v3 dealloc];
}

- (unint64_t)clockValuesCount
{
  return self->_clockValues.count;
}

- (unint64_t)clockValues
{
  return self->_clockValues.list;
}

- (void)clearClockValues
{
}

- (void)addClockValues:(unint64_t)a3
{
}

- (unint64_t)clockValuesAtIndex:(unint64_t)a3
{
  p_clockValues = &self->_clockValues;
  unint64_t count = self->_clockValues.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v11 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, (uint64_t)v9, 0);
    objc_msgSend_raise(v11, v12, v13, v14);
  }
  return p_clockValues->list[a3];
}

- (void)setClockValues:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)clockValueLengthsCount
{
  return self->_clockValueLengths.count;
}

- (unint64_t)clockValueLengths
{
  return self->_clockValueLengths.list;
}

- (void)clearClockValueLengths
{
}

- (void)addClockValueLengths:(unint64_t)a3
{
}

- (unint64_t)clockValueLengthsAtIndex:(unint64_t)a3
{
  p_clockValueLengths = &self->_clockValueLengths;
  unint64_t count = self->_clockValueLengths.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v11 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, (uint64_t)v9, 0);
    objc_msgSend_raise(v11, v12, v13, v14);
  }
  return p_clockValueLengths->list[a3];
}

- (void)setClockValueLengths:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)stateValuesCount
{
  return self->_stateValues.count;
}

- (int)stateValues
{
  return self->_stateValues.list;
}

- (void)clearStateValues
{
}

- (void)addStateValues:(int)a3
{
}

- (int)stateValuesAtIndex:(unint64_t)a3
{
  p_stateValues = &self->_stateValues;
  unint64_t count = self->_stateValues.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v11 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, (uint64_t)v9, 0);
    objc_msgSend_raise(v11, v12, v13, v14);
  }
  return p_stateValues->list[a3];
}

- (void)setStateValues:(int *)a3 count:(unint64_t)a4
{
}

- (id)stateValuesAsString:(int)a3
{
  if (a3 >= 9)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E5464868[a3];
  }

  return v4;
}

- (int)StringAsStateValues:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"unknown", v5))
  {
    int v8 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v6, @"regular", v7))
  {
    int v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"regularPresent", v10))
  {
    int v8 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"regularTombstoned", v12))
  {
    int v8 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v13, @"regularMissing", v14))
  {
    int v8 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v15, @"lwwPerModifier", v16))
  {
    int v8 = 5;
  }
  else if (objc_msgSend_isEqualToString_(v3, v17, @"lwwPerModifierPresent", v18))
  {
    int v8 = 6;
  }
  else if (objc_msgSend_isEqualToString_(v3, v19, @"lwwPerModifierTombstoned", v20))
  {
    int v8 = 7;
  }
  else if (objc_msgSend_isEqualToString_(v3, v21, @"lwwPerModifierMissing", v22))
  {
    int v8 = 8;
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (unint64_t)stateValueLengthsCount
{
  return self->_stateValueLengths.count;
}

- (unsigned)stateValueLengths
{
  return self->_stateValueLengths.list;
}

- (void)clearStateValueLengths
{
}

- (void)addStateValueLengths:(unsigned int)a3
{
}

- (unsigned)stateValueLengthsAtIndex:(unint64_t)a3
{
  p_stateValueLengths = &self->_stateValueLengths;
  unint64_t count = self->_stateValueLengths.count;
  if (count <= a3)
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v11 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, (uint64_t)v9, 0);
    objc_msgSend_raise(v11, v12, v13, v14);
  }
  return p_stateValueLengths->list[a3];
}

- (void)setStateValueLengths:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  uint64_t v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKDPDistributedTimestampsVersionVector;
  v4 = [(CKDPDistributedTimestampsVersionVector *)&v13 description];
  uint64_t v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  uint64_t v6 = PBRepeatedUInt64NSArray();
  objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, @"clockValues");

  uint64_t v8 = PBRepeatedUInt64NSArray();
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, @"clockValueLengths");

  p_stateValues = &self->_stateValues;
  unint64_t count = self->_stateValues.count;
  if (count)
  {
    uint64_t v16 = objc_msgSend_arrayWithCapacity_(MEMORY[0x1E4F1CA48], v10, count, v11);
    if (self->_stateValues.count)
    {
      unint64_t v17 = 0;
      do
      {
        uint64_t v18 = p_stateValues->list[v17];
        if (v18 >= 9)
        {
          objc_msgSend_stringWithFormat_(NSString, v14, @"(unknown: %i)", v15, p_stateValues->list[v17]);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v19 = off_1E5464868[v18];
        }
        objc_msgSend_addObject_(v16, v14, (uint64_t)v19, v15);

        ++v17;
      }
      while (v17 < self->_stateValues.count);
    }
    objc_msgSend_setObject_forKey_(v5, v14, (uint64_t)v16, @"stateValues");
  }
  uint64_t v20 = PBRepeatedUInt32NSArray();
  objc_msgSend_setObject_forKey_(v5, v21, (uint64_t)v20, @"stateValueLengths");

  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPDistributedTimestampsVersionVectorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_clockValues.count)
  {
    PBDataWriterPlaceMark();
    if (self->_clockValues.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v5;
      }
      while (v5 < self->_clockValues.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_clockValueLengths.count)
  {
    PBDataWriterPlaceMark();
    if (self->_clockValueLengths.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v6;
      }
      while (v6 < self->_clockValueLengths.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_stateValues.count)
  {
    PBDataWriterPlaceMark();
    if (self->_stateValues.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_stateValues.count);
    }
    PBDataWriterRecallMark();
  }
  p_stateValueLengths = &self->_stateValueLengths;
  if (p_stateValueLengths->count)
  {
    PBDataWriterPlaceMark();
    if (p_stateValueLengths->count)
    {
      unint64_t v9 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v9 < p_stateValueLengths->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  id v57 = a3;
  if (objc_msgSend_clockValuesCount(self, v4, v5, v6))
  {
    objc_msgSend_clearClockValues(v57, v7, v8, v9);
    uint64_t v13 = objc_msgSend_clockValuesCount(self, v10, v11, v12);
    if (v13)
    {
      uint64_t v14 = v13;
      for (uint64_t i = 0; i != v14; ++i)
      {
        uint64_t v16 = objc_msgSend_clockValuesAtIndex_(self, v7, i, v9);
        objc_msgSend_addClockValues_(v57, v17, v16, v18);
      }
    }
  }
  if (objc_msgSend_clockValueLengthsCount(self, v7, v8, v9))
  {
    objc_msgSend_clearClockValueLengths(v57, v19, v20, v21);
    uint64_t v25 = objc_msgSend_clockValueLengthsCount(self, v22, v23, v24);
    if (v25)
    {
      uint64_t v26 = v25;
      for (uint64_t j = 0; j != v26; ++j)
      {
        uint64_t v28 = objc_msgSend_clockValueLengthsAtIndex_(self, v19, j, v21);
        objc_msgSend_addClockValueLengths_(v57, v29, v28, v30);
      }
    }
  }
  if (objc_msgSend_stateValuesCount(self, v19, v20, v21))
  {
    objc_msgSend_clearStateValues(v57, v31, v32, v33);
    uint64_t v37 = objc_msgSend_stateValuesCount(self, v34, v35, v36);
    if (v37)
    {
      uint64_t v38 = v37;
      for (uint64_t k = 0; k != v38; ++k)
      {
        uint64_t v40 = objc_msgSend_stateValuesAtIndex_(self, v31, k, v33);
        objc_msgSend_addStateValues_(v57, v41, v40, v42);
      }
    }
  }
  if (objc_msgSend_stateValueLengthsCount(self, v31, v32, v33))
  {
    objc_msgSend_clearStateValueLengths(v57, v43, v44, v45);
    uint64_t v49 = objc_msgSend_stateValueLengthsCount(self, v46, v47, v48);
    if (v49)
    {
      uint64_t v52 = v49;
      for (uint64_t m = 0; m != v52; ++m)
      {
        uint64_t v54 = objc_msgSend_stateValueLengthsAtIndex_(self, v50, m, v51);
        objc_msgSend_addStateValueLengths_(v57, v55, v54, v56);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_class();
  unint64_t v7 = objc_msgSend_allocWithZone_(v4, v5, (uint64_t)a3, v6);
  uint64_t v11 = objc_msgSend_init(v7, v8, v9, v10);
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedInt32Copy();
  PBRepeatedUInt32Copy();
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v3, v5, v4, v6)
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedInt32IsEqual())
  {
    char IsEqual = PBRepeatedUInt32IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2 = PBRepeatedUInt64Hash();
  uint64_t v3 = PBRepeatedUInt64Hash() ^ v2;
  uint64_t v4 = PBRepeatedInt32Hash();
  return v3 ^ v4 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  id v42 = a3;
  uint64_t v7 = objc_msgSend_clockValuesCount(v42, v4, v5, v6);
  if (v7)
  {
    uint64_t v11 = v7;
    for (uint64_t i = 0; i != v11; ++i)
    {
      uint64_t v13 = objc_msgSend_clockValuesAtIndex_(v42, v8, i, v10);
      objc_msgSend_addClockValues_(self, v14, v13, v15);
    }
  }
  uint64_t v16 = objc_msgSend_clockValueLengthsCount(v42, v8, v9, v10);
  if (v16)
  {
    uint64_t v20 = v16;
    for (uint64_t j = 0; j != v20; ++j)
    {
      uint64_t v22 = objc_msgSend_clockValueLengthsAtIndex_(v42, v17, j, v19);
      objc_msgSend_addClockValueLengths_(self, v23, v22, v24);
    }
  }
  uint64_t v25 = objc_msgSend_stateValuesCount(v42, v17, v18, v19);
  if (v25)
  {
    uint64_t v29 = v25;
    for (uint64_t k = 0; k != v29; ++k)
    {
      uint64_t v31 = objc_msgSend_stateValuesAtIndex_(v42, v26, k, v28);
      objc_msgSend_addStateValues_(self, v32, v31, v33);
    }
  }
  uint64_t v34 = objc_msgSend_stateValueLengthsCount(v42, v26, v27, v28);
  if (v34)
  {
    uint64_t v37 = v34;
    for (uint64_t m = 0; m != v37; ++m)
    {
      uint64_t v39 = objc_msgSend_stateValueLengthsAtIndex_(v42, v35, m, v36);
      objc_msgSend_addStateValueLengths_(self, v40, v39, v41);
    }
  }
}

@end