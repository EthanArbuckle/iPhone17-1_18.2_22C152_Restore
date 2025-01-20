@interface CKDPRecordFieldValueEncryptedValue
+ (Class)dateListValueType;
+ (Class)locationListValueType;
+ (Class)stringListValueType;
- (BOOL)hasCkDoubleValue;
- (BOOL)hasDateValue;
- (BOOL)hasLocationValue;
- (BOOL)hasReferenceValue;
- (BOOL)hasSignedValue;
- (BOOL)hasStringValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPDate)dateValue;
- (CKDPLocationCoordinate)locationValue;
- (CKDPRecordReference)referenceValue;
- (NSMutableArray)dateListValues;
- (NSMutableArray)locationListValues;
- (NSMutableArray)stringListValues;
- (NSString)stringValue;
- (double)ckDoubleValue;
- (double)doubleListValueAtIndex:(unint64_t)a3;
- (double)doubleListValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateListValueAtIndex:(unint64_t)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationListValueAtIndex:(unint64_t)a3;
- (id)stringListValueAtIndex:(unint64_t)a3;
- (int64_t)signedListValueAtIndex:(unint64_t)a3;
- (int64_t)signedListValues;
- (int64_t)signedValue;
- (unint64_t)dateListValuesCount;
- (unint64_t)doubleListValuesCount;
- (unint64_t)hash;
- (unint64_t)locationListValuesCount;
- (unint64_t)signedListValuesCount;
- (unint64_t)stringListValuesCount;
- (void)addDateListValue:(id)a3;
- (void)addDoubleListValue:(double)a3;
- (void)addLocationListValue:(id)a3;
- (void)addSignedListValue:(int64_t)a3;
- (void)addStringListValue:(id)a3;
- (void)clearDateListValues;
- (void)clearDoubleListValues;
- (void)clearLocationListValues;
- (void)clearSignedListValues;
- (void)clearStringListValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCkDoubleValue:(double)a3;
- (void)setDateListValues:(id)a3;
- (void)setDateValue:(id)a3;
- (void)setDoubleListValues:(double *)a3 count:(unint64_t)a4;
- (void)setHasCkDoubleValue:(BOOL)a3;
- (void)setHasSignedValue:(BOOL)a3;
- (void)setLocationListValues:(id)a3;
- (void)setLocationValue:(id)a3;
- (void)setReferenceValue:(id)a3;
- (void)setSignedListValues:(int64_t *)a3 count:(unint64_t)a4;
- (void)setSignedValue:(int64_t)a3;
- (void)setStringListValues:(id)a3;
- (void)setStringValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordFieldValueEncryptedValue

- (void)dealloc
{
  PBRepeatedInt64Clear();
  PBRepeatedDoubleClear();
  v3.receiver = self;
  v3.super_class = (Class)CKDPRecordFieldValueEncryptedValue;
  [(CKDPRecordFieldValueEncryptedValue *)&v3 dealloc];
}

- (void)setSignedValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_signedValue = a3;
}

- (void)setHasSignedValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSignedValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCkDoubleValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ckDoubleValue = a3;
}

- (void)setHasCkDoubleValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCkDoubleValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDateValue
{
  return self->_dateValue != 0;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (BOOL)hasLocationValue
{
  return self->_locationValue != 0;
}

- (BOOL)hasReferenceValue
{
  return self->_referenceValue != 0;
}

- (unint64_t)signedListValuesCount
{
  return self->_signedListValues.count;
}

- (int64_t)signedListValues
{
  return self->_signedListValues.list;
}

- (void)clearSignedListValues
{
}

- (void)addSignedListValue:(int64_t)a3
{
}

- (int64_t)signedListValueAtIndex:(unint64_t)a3
{
  p_signedListValues = &self->_signedListValues;
  unint64_t count = self->_signedListValues.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v11 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, (uint64_t)v9, 0);
    objc_msgSend_raise(v11, v12, v13, v14);
  }
  return p_signedListValues->list[a3];
}

- (void)setSignedListValues:(int64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)doubleListValuesCount
{
  return self->_doubleListValues.count;
}

- (double)doubleListValues
{
  return self->_doubleListValues.list;
}

- (void)clearDoubleListValues
{
}

- (void)addDoubleListValue:(double)a3
{
}

- (double)doubleListValueAtIndex:(unint64_t)a3
{
  p_doubleListValues = &self->_doubleListValues;
  unint64_t count = self->_doubleListValues.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v8 = *MEMORY[0x1E4F1C4A8];
    v9 = objc_msgSend_stringWithFormat_(NSString, a2, @"idx (%lu) is out of range (%lu)", v3, a3, count);
    v11 = objc_msgSend_exceptionWithName_reason_userInfo_(v7, v10, v8, (uint64_t)v9, 0);
    objc_msgSend_raise(v11, v12, v13, v14);
  }
  return p_doubleListValues->list[a3];
}

- (void)setDoubleListValues:(double *)a3 count:(unint64_t)a4
{
}

- (void)clearDateListValues
{
  objc_msgSend_removeAllObjects(self->_dateListValues, a2, v2, v3);
}

- (void)addDateListValue:(id)a3
{
  v4 = (const char *)a3;
  dateListValues = self->_dateListValues;
  v9 = (char *)v4;
  if (!dateListValues)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = self->_dateListValues;
    self->_dateListValues = v7;

    v4 = v9;
    dateListValues = self->_dateListValues;
  }
  objc_msgSend_addObject_(dateListValues, v4, (uint64_t)v4, v5);
}

- (unint64_t)dateListValuesCount
{
  return objc_msgSend_count(self->_dateListValues, a2, v2, v3);
}

- (id)dateListValueAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_dateListValues, a2, a3, v3);
}

+ (Class)dateListValueType
{
  return (Class)objc_opt_class();
}

- (void)clearStringListValues
{
  objc_msgSend_removeAllObjects(self->_stringListValues, a2, v2, v3);
}

- (void)addStringListValue:(id)a3
{
  v4 = (const char *)a3;
  stringListValues = self->_stringListValues;
  v9 = (char *)v4;
  if (!stringListValues)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = self->_stringListValues;
    self->_stringListValues = v7;

    v4 = v9;
    stringListValues = self->_stringListValues;
  }
  objc_msgSend_addObject_(stringListValues, v4, (uint64_t)v4, v5);
}

- (unint64_t)stringListValuesCount
{
  return objc_msgSend_count(self->_stringListValues, a2, v2, v3);
}

- (id)stringListValueAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_stringListValues, a2, a3, v3);
}

+ (Class)stringListValueType
{
  return (Class)objc_opt_class();
}

- (void)clearLocationListValues
{
  objc_msgSend_removeAllObjects(self->_locationListValues, a2, v2, v3);
}

- (void)addLocationListValue:(id)a3
{
  v4 = (const char *)a3;
  locationListValues = self->_locationListValues;
  v9 = (char *)v4;
  if (!locationListValues)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v8 = self->_locationListValues;
    self->_locationListValues = v7;

    v4 = v9;
    locationListValues = self->_locationListValues;
  }
  objc_msgSend_addObject_(locationListValues, v4, (uint64_t)v4, v5);
}

- (unint64_t)locationListValuesCount
{
  return objc_msgSend_count(self->_locationListValues, a2, v2, v3);
}

- (id)locationListValueAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_locationListValues, a2, a3, v3);
}

+ (Class)locationListValueType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  uint64_t v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)CKDPRecordFieldValueEncryptedValue;
  v4 = [(CKDPRecordFieldValueEncryptedValue *)&v13 description];
  uint64_t v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v10 = objc_msgSend_numberWithLongLong_(NSNumber, v5, self->_signedValue, v7);
    objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, @"signedValue");

    char has = (char)self->_has;
  }
  if (has)
  {
    v12 = objc_msgSend_numberWithDouble_(NSNumber, v5, v6, v7, self->_ckDoubleValue);
    objc_msgSend_setObject_forKey_(v8, v13, (uint64_t)v12, @"ckDoubleValue");
  }
  dateValue = self->_dateValue;
  if (dateValue)
  {
    v15 = objc_msgSend_dictionaryRepresentation(dateValue, v5, v6, v7);
    objc_msgSend_setObject_forKey_(v8, v16, (uint64_t)v15, @"dateValue");
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    objc_msgSend_setObject_forKey_(v8, v5, (uint64_t)stringValue, @"stringValue");
  }
  locationValue = self->_locationValue;
  if (locationValue)
  {
    v19 = objc_msgSend_dictionaryRepresentation(locationValue, v5, (uint64_t)stringValue, v7);
    objc_msgSend_setObject_forKey_(v8, v20, (uint64_t)v19, @"locationValue");
  }
  referenceValue = self->_referenceValue;
  if (referenceValue)
  {
    v22 = objc_msgSend_dictionaryRepresentation(referenceValue, v5, (uint64_t)stringValue, v7);
    objc_msgSend_setObject_forKey_(v8, v23, (uint64_t)v22, @"referenceValue");
  }
  v24 = PBRepeatedInt64NSArray();
  objc_msgSend_setObject_forKey_(v8, v25, (uint64_t)v24, @"signedListValue");

  v26 = PBRepeatedDoubleNSArray();
  objc_msgSend_setObject_forKey_(v8, v27, (uint64_t)v26, @"doubleListValue");

  if (objc_msgSend_count(self->_dateListValues, v28, v29, v30))
  {
    id v33 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v37 = objc_msgSend_count(self->_dateListValues, v34, v35, v36);
    v40 = objc_msgSend_initWithCapacity_(v33, v38, v37, v39);
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    v41 = self->_dateListValues;
    uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v81, (uint64_t)v86, 16);
    if (v43)
    {
      uint64_t v47 = v43;
      uint64_t v48 = *(void *)v82;
      do
      {
        for (uint64_t i = 0; i != v47; ++i)
        {
          if (*(void *)v82 != v48) {
            objc_enumerationMutation(v41);
          }
          v50 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v81 + 1) + 8 * i), v44, v45, v46);
          objc_msgSend_addObject_(v40, v51, (uint64_t)v50, v52);
        }
        uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v81, (uint64_t)v86, 16);
      }
      while (v47);
    }

    objc_msgSend_setObject_forKey_(v8, v53, (uint64_t)v40, @"dateListValue");
  }
  stringListValues = self->_stringListValues;
  if (stringListValues) {
    objc_msgSend_setObject_forKey_(v8, v31, (uint64_t)stringListValues, @"stringListValue");
  }
  if (objc_msgSend_count(self->_locationListValues, v31, (uint64_t)stringListValues, v32))
  {
    id v55 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v59 = objc_msgSend_count(self->_locationListValues, v56, v57, v58);
    v62 = objc_msgSend_initWithCapacity_(v55, v60, v59, v61);
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    v63 = self->_locationListValues;
    uint64_t v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v77, (uint64_t)v85, 16);
    if (v65)
    {
      uint64_t v69 = v65;
      uint64_t v70 = *(void *)v78;
      do
      {
        for (uint64_t j = 0; j != v69; ++j)
        {
          if (*(void *)v78 != v70) {
            objc_enumerationMutation(v63);
          }
          v72 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v77 + 1) + 8 * j), v66, v67, v68, (void)v77);
          objc_msgSend_addObject_(v62, v73, (uint64_t)v72, v74);
        }
        uint64_t v69 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v66, (uint64_t)&v77, (uint64_t)v85, 16);
      }
      while (v69);
    }

    objc_msgSend_setObject_forKey_(v8, v75, (uint64_t)v62, @"locationListValue");
  }

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordFieldValueEncryptedValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_dateValue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  if (self->_locationValue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_referenceValue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_signedListValues.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v6;
    }
    while (v6 < self->_signedListValues.count);
  }
  if (self->_doubleListValues.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteDoubleField();
      ++v7;
    }
    while (v7 < self->_doubleListValues.count);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v8 = self->_dateListValues;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v37, (uint64_t)v43, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v38 != v12) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v14, (uint64_t)&v37, (uint64_t)v43, 16);
    }
    while (v11);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  v15 = self->_stringListValues;
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v33, (uint64_t)v42, 16);
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v21, (uint64_t)&v33, (uint64_t)v42, 16);
    }
    while (v18);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v22 = self->_locationListValues;
  uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v29, (uint64_t)v41, 16);
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v30;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v30 != v26) {
          objc_enumerationMutation(v22);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v28, (uint64_t)&v29, (uint64_t)v41, 16);
    }
    while (v25);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[8] = self->_signedValue;
    *((unsigned char *)v4 + 128) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[7] = *(void *)&self->_ckDoubleValue;
    *((unsigned char *)v4 + 128) |= 1u;
  }
  dateValue = self->_dateValue;
  id v74 = v4;
  if (dateValue) {
    objc_msgSend_setDateValue_(v4, v5, (uint64_t)dateValue, v6);
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    objc_msgSend_setStringValue_(v74, v5, (uint64_t)stringValue, v6);
  }
  locationValue = self->_locationValue;
  if (locationValue) {
    objc_msgSend_setLocationValue_(v74, v5, (uint64_t)locationValue, v6);
  }
  referenceValue = self->_referenceValue;
  if (referenceValue) {
    objc_msgSend_setReferenceValue_(v74, v5, (uint64_t)referenceValue, v6);
  }
  if (objc_msgSend_signedListValuesCount(self, v5, (uint64_t)referenceValue, v6))
  {
    objc_msgSend_clearSignedListValues(v74, v12, v13, v14);
    uint64_t v18 = objc_msgSend_signedListValuesCount(self, v15, v16, v17);
    if (v18)
    {
      uint64_t v19 = v18;
      for (uint64_t i = 0; i != v19; ++i)
      {
        uint64_t v21 = objc_msgSend_signedListValueAtIndex_(self, v12, i, v14);
        objc_msgSend_addSignedListValue_(v74, v22, v21, v23);
      }
    }
  }
  if (objc_msgSend_doubleListValuesCount(self, v12, v13, v14))
  {
    objc_msgSend_clearDoubleListValues(v74, v24, v25, v26);
    uint64_t v30 = objc_msgSend_doubleListValuesCount(self, v27, v28, v29);
    if (v30)
    {
      uint64_t v31 = v30;
      for (uint64_t j = 0; j != v31; ++j)
      {
        objc_msgSend_doubleListValueAtIndex_(self, v24, j, v26);
        objc_msgSend_addDoubleListValue_(v74, v33, v34, v35);
      }
    }
  }
  if (objc_msgSend_dateListValuesCount(self, v24, v25, v26))
  {
    objc_msgSend_clearDateListValues(v74, v36, v37, v38);
    uint64_t v42 = objc_msgSend_dateListValuesCount(self, v39, v40, v41);
    if (v42)
    {
      uint64_t v43 = v42;
      for (uint64_t k = 0; k != v43; ++k)
      {
        uint64_t v45 = objc_msgSend_dateListValueAtIndex_(self, v36, k, v38);
        objc_msgSend_addDateListValue_(v74, v46, (uint64_t)v45, v47);
      }
    }
  }
  if (objc_msgSend_stringListValuesCount(self, v36, v37, v38))
  {
    objc_msgSend_clearStringListValues(v74, v48, v49, v50);
    uint64_t v54 = objc_msgSend_stringListValuesCount(self, v51, v52, v53);
    if (v54)
    {
      uint64_t v55 = v54;
      for (uint64_t m = 0; m != v55; ++m)
      {
        uint64_t v57 = objc_msgSend_stringListValueAtIndex_(self, v48, m, v50);
        objc_msgSend_addStringListValue_(v74, v58, (uint64_t)v57, v59);
      }
    }
  }
  if (objc_msgSend_locationListValuesCount(self, v48, v49, v50))
  {
    objc_msgSend_clearLocationListValues(v74, v60, v61, v62);
    uint64_t v66 = objc_msgSend_locationListValuesCount(self, v63, v64, v65);
    if (v66)
    {
      uint64_t v69 = v66;
      for (uint64_t n = 0; n != v69; ++n)
      {
        v71 = objc_msgSend_locationListValueAtIndex_(self, v67, n, v68);
        objc_msgSend_addLocationListValue_(v74, v72, (uint64_t)v71, v73);
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_opt_class();
  uint64_t v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (void *)v12;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v12 + 64) = self->_signedValue;
    *(unsigned char *)(v12 + 128) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v12 + 56) = self->_ckDoubleValue;
    *(unsigned char *)(v12 + 128) |= 1u;
  }
  uint64_t v17 = objc_msgSend_copyWithZone_(self->_dateValue, v13, (uint64_t)a3, v14);
  uint64_t v18 = (void *)v15[10];
  v15[10] = v17;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_stringValue, v19, (uint64_t)a3, v20);
  v22 = (void *)v15[15];
  v15[15] = v21;

  uint64_t v25 = objc_msgSend_copyWithZone_(self->_locationValue, v23, (uint64_t)a3, v24);
  uint64_t v26 = (void *)v15[12];
  v15[12] = v25;

  uint64_t v29 = objc_msgSend_copyWithZone_(self->_referenceValue, v27, (uint64_t)a3, v28);
  uint64_t v30 = (void *)v15[13];
  v15[13] = v29;

  PBRepeatedInt64Copy();
  PBRepeatedDoubleCopy();
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  uint64_t v31 = self->_dateListValues;
  uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v73, (uint64_t)v79, 16);
  if (v33)
  {
    uint64_t v36 = v33;
    uint64_t v37 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v74 != v37) {
          objc_enumerationMutation(v31);
        }
        long long v39 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v73 + 1) + 8 * i), v34, (uint64_t)a3, v35);
        objc_msgSend_addDateListValue_(v15, v40, (uint64_t)v39, v41);
      }
      uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v73, (uint64_t)v79, 16);
    }
    while (v36);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v42 = self->_stringListValues;
  uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v69, (uint64_t)v78, 16);
  if (v44)
  {
    uint64_t v47 = v44;
    uint64_t v48 = *(void *)v70;
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v70 != v48) {
          objc_enumerationMutation(v42);
        }
        uint64_t v50 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v69 + 1) + 8 * j), v45, (uint64_t)a3, v46);
        objc_msgSend_addStringListValue_(v15, v51, (uint64_t)v50, v52);
      }
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v69, (uint64_t)v78, 16);
    }
    while (v47);
  }

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v53 = self->_locationListValues;
  uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v54, (uint64_t)&v65, (uint64_t)v77, 16);
  if (v55)
  {
    uint64_t v58 = v55;
    uint64_t v59 = *(void *)v66;
    do
    {
      for (uint64_t k = 0; k != v58; ++k)
      {
        if (*(void *)v66 != v59) {
          objc_enumerationMutation(v53);
        }
        uint64_t v61 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v65 + 1) + 8 * k), v56, (uint64_t)a3, v57, (void)v65);
        objc_msgSend_addLocationListValue_(v15, v62, (uint64_t)v61, v63);
      }
      uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v53, v56, (uint64_t)&v65, (uint64_t)v77, 16);
    }
    while (v58);
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[16] & 2) == 0 || self->_signedValue != v4[8]) {
      goto LABEL_28;
    }
  }
  else if ((v4[16] & 2) != 0)
  {
LABEL_28:
    char isEqual = 0;
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[16] & 1) == 0 || self->_ckDoubleValue != *((double *)v4 + 7)) {
      goto LABEL_28;
    }
  }
  else if (v4[16])
  {
    goto LABEL_28;
  }
  dateValue = self->_dateValue;
  uint64_t v11 = v4[10];
  if ((unint64_t)dateValue | v11 && !objc_msgSend_isEqual_(dateValue, v8, v11, v9)) {
    goto LABEL_28;
  }
  stringValue = self->_stringValue;
  uint64_t v13 = v4[15];
  if ((unint64_t)stringValue | v13)
  {
    if (!objc_msgSend_isEqual_(stringValue, v8, v13, v9)) {
      goto LABEL_28;
    }
  }
  locationValue = self->_locationValue;
  uint64_t v15 = v4[12];
  if ((unint64_t)locationValue | v15)
  {
    if (!objc_msgSend_isEqual_(locationValue, v8, v15, v9)) {
      goto LABEL_28;
    }
  }
  referenceValue = self->_referenceValue;
  uint64_t v17 = v4[13];
  if ((unint64_t)referenceValue | v17)
  {
    if (!objc_msgSend_isEqual_(referenceValue, v8, v17, v9)) {
      goto LABEL_28;
    }
  }
  if (!PBRepeatedInt64IsEqual()) {
    goto LABEL_28;
  }
  if (!PBRepeatedDoubleIsEqual()) {
    goto LABEL_28;
  }
  dateListValues = self->_dateListValues;
  uint64_t v21 = v4[9];
  if ((unint64_t)dateListValues | v21)
  {
    if (!objc_msgSend_isEqual_(dateListValues, v18, v21, v19)) {
      goto LABEL_28;
    }
  }
  stringListValues = self->_stringListValues;
  uint64_t v23 = v4[14];
  if ((unint64_t)stringListValues | v23)
  {
    if (!objc_msgSend_isEqual_(stringListValues, v18, v23, v19)) {
      goto LABEL_28;
    }
  }
  locationListValues = self->_locationListValues;
  uint64_t v25 = v4[11];
  if ((unint64_t)locationListValues | v25) {
    char isEqual = objc_msgSend_isEqual_(locationListValues, v18, v25, v19);
  }
  else {
    char isEqual = 1;
  }
LABEL_29:

  return isEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_signedValue;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double ckDoubleValue = self->_ckDoubleValue;
  double v7 = -ckDoubleValue;
  if (ckDoubleValue >= 0.0) {
    double v7 = self->_ckDoubleValue;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
LABEL_11:
  uint64_t v11 = v10 ^ v5 ^ objc_msgSend_hash(self->_dateValue, a2, v2, v3);
  uint64_t v15 = objc_msgSend_hash(self->_stringValue, v12, v13, v14);
  uint64_t v19 = v11 ^ v15 ^ objc_msgSend_hash(self->_locationValue, v16, v17, v18);
  uint64_t v23 = objc_msgSend_hash(self->_referenceValue, v20, v21, v22);
  uint64_t v24 = v23 ^ PBRepeatedInt64Hash();
  uint64_t v25 = v19 ^ v24 ^ PBRepeatedDoubleHash();
  uint64_t v29 = objc_msgSend_hash(self->_dateListValues, v26, v27, v28);
  uint64_t v33 = v29 ^ objc_msgSend_hash(self->_stringListValues, v30, v31, v32);
  return v25 ^ v33 ^ objc_msgSend_hash(self->_locationListValues, v34, v35, v36);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v7 = v4;
  char v8 = *((unsigned char *)v4 + 128);
  if ((v8 & 2) != 0)
  {
    self->_signedValue = *((void *)v4 + 8);
    *(unsigned char *)&self->_has |= 2u;
    char v8 = *((unsigned char *)v4 + 128);
  }
  if (v8)
  {
    self->_double ckDoubleValue = *((double *)v4 + 7);
    *(unsigned char *)&self->_has |= 1u;
  }
  dateValue = self->_dateValue;
  uint64_t v10 = *((void *)v7 + 10);
  if (dateValue)
  {
    if (v10) {
      objc_msgSend_mergeFrom_(dateValue, v5, v10, v6);
    }
  }
  else if (v10)
  {
    objc_msgSend_setDateValue_(self, v5, v10, v6);
  }
  uint64_t v11 = *((void *)v7 + 15);
  if (v11) {
    objc_msgSend_setStringValue_(self, v5, v11, v6);
  }
  locationValue = self->_locationValue;
  uint64_t v13 = *((void *)v7 + 12);
  if (locationValue)
  {
    if (v13) {
      objc_msgSend_mergeFrom_(locationValue, v5, v13, v6);
    }
  }
  else if (v13)
  {
    objc_msgSend_setLocationValue_(self, v5, v13, v6);
  }
  referenceValue = self->_referenceValue;
  uint64_t v15 = *((void *)v7 + 13);
  if (referenceValue)
  {
    if (v15) {
      objc_msgSend_mergeFrom_(referenceValue, v5, v15, v6);
    }
  }
  else if (v15)
  {
    objc_msgSend_setReferenceValue_(self, v5, v15, v6);
  }
  uint64_t v16 = objc_msgSend_signedListValuesCount(v7, v5, v15, v6);
  if (v16)
  {
    uint64_t v20 = v16;
    for (uint64_t i = 0; i != v20; ++i)
    {
      uint64_t v22 = objc_msgSend_signedListValueAtIndex_(v7, v17, i, v19);
      objc_msgSend_addSignedListValue_(self, v23, v22, v24);
    }
  }
  uint64_t v25 = objc_msgSend_doubleListValuesCount(v7, v17, v18, v19);
  if (v25)
  {
    uint64_t v28 = v25;
    for (uint64_t j = 0; j != v28; ++j)
    {
      objc_msgSend_doubleListValueAtIndex_(v7, v26, j, v27);
      objc_msgSend_addDoubleListValue_(self, v30, v31, v32);
    }
  }
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v33 = *((id *)v7 + 9);
  uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v65, (uint64_t)v71, 16);
  if (v35)
  {
    uint64_t v38 = v35;
    uint64_t v39 = *(void *)v66;
    do
    {
      for (uint64_t k = 0; k != v38; ++k)
      {
        if (*(void *)v66 != v39) {
          objc_enumerationMutation(v33);
        }
        objc_msgSend_addDateListValue_(self, v36, *(void *)(*((void *)&v65 + 1) + 8 * k), v37);
      }
      uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v65, (uint64_t)v71, 16);
    }
    while (v38);
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v41 = *((id *)v7 + 14);
  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v61, (uint64_t)v70, 16);
  if (v43)
  {
    uint64_t v46 = v43;
    uint64_t v47 = *(void *)v62;
    do
    {
      for (uint64_t m = 0; m != v46; ++m)
      {
        if (*(void *)v62 != v47) {
          objc_enumerationMutation(v41);
        }
        objc_msgSend_addStringListValue_(self, v44, *(void *)(*((void *)&v61 + 1) + 8 * m), v45);
      }
      uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v44, (uint64_t)&v61, (uint64_t)v70, 16);
    }
    while (v46);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v49 = *((id *)v7 + 11);
  uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v57, (uint64_t)v69, 16);
  if (v51)
  {
    uint64_t v54 = v51;
    uint64_t v55 = *(void *)v58;
    do
    {
      for (uint64_t n = 0; n != v54; ++n)
      {
        if (*(void *)v58 != v55) {
          objc_enumerationMutation(v49);
        }
        objc_msgSend_addLocationListValue_(self, v52, *(void *)(*((void *)&v57 + 1) + 8 * n), v53, (void)v57);
      }
      uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v52, (uint64_t)&v57, (uint64_t)v69, 16);
    }
    while (v54);
  }
}

- (int64_t)signedValue
{
  return self->_signedValue;
}

- (double)ckDoubleValue
{
  return self->_ckDoubleValue;
}

- (CKDPDate)dateValue
{
  return self->_dateValue;
}

- (void)setDateValue:(id)a3
{
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (CKDPLocationCoordinate)locationValue
{
  return self->_locationValue;
}

- (void)setLocationValue:(id)a3
{
}

- (CKDPRecordReference)referenceValue
{
  return self->_referenceValue;
}

- (void)setReferenceValue:(id)a3
{
}

- (NSMutableArray)dateListValues
{
  return self->_dateListValues;
}

- (void)setDateListValues:(id)a3
{
}

- (NSMutableArray)stringListValues
{
  return self->_stringListValues;
}

- (void)setStringListValues:(id)a3
{
}

- (NSMutableArray)locationListValues
{
  return self->_locationListValues;
}

- (void)setLocationListValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_stringListValues, 0);
  objc_storeStrong((id *)&self->_referenceValue, 0);
  objc_storeStrong((id *)&self->_locationValue, 0);
  objc_storeStrong((id *)&self->_locationListValues, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);

  objc_storeStrong((id *)&self->_dateListValues, 0);
}

@end