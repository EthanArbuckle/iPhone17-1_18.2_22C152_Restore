@interface CKDPRecordFieldValue
+ (Class)listValueType;
- (BOOL)hasAppliedCryptoFeatures;
- (BOOL)hasAssetValue;
- (BOOL)hasBytesValue;
- (BOOL)hasCkDoubleValue;
- (BOOL)hasDateValue;
- (BOOL)hasEncryptedMergeableValue;
- (BOOL)hasIsEncrypted;
- (BOOL)hasLocationValue;
- (BOOL)hasMergeableValue;
- (BOOL)hasPackageValue;
- (BOOL)hasReferenceValue;
- (BOOL)hasSignedValue;
- (BOOL)hasStreamingAssetValue;
- (BOOL)hasStringValue;
- (BOOL)hasType;
- (BOOL)isEncrypted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPAsset)assetValue;
- (CKDPDate)dateValue;
- (CKDPEncryptedMergeableValue)encryptedMergeableValue;
- (CKDPFieldCryptoFeatureSet)appliedCryptoFeatures;
- (CKDPLocationCoordinate)locationValue;
- (CKDPMergeableValue)mergeableValue;
- (CKDPPackage)packageValue;
- (CKDPRecordReference)referenceValue;
- (CKDPStreamingAsset)streamingAssetValue;
- (NSData)bytesValue;
- (NSMutableArray)listValues;
- (NSString)stringValue;
- (double)ckDoubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)listValueAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (int64_t)signedValue;
- (unint64_t)hash;
- (unint64_t)listValuesCount;
- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4;
- (void)addListValue:(id)a3;
- (void)clearListValues;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppliedCryptoFeatures:(id)a3;
- (void)setAssetValue:(id)a3;
- (void)setBytesValue:(id)a3;
- (void)setCkDoubleValue:(double)a3;
- (void)setDateValue:(id)a3;
- (void)setEncryptedMergeableValue:(id)a3;
- (void)setHasCkDoubleValue:(BOOL)a3;
- (void)setHasIsEncrypted:(BOOL)a3;
- (void)setHasSignedValue:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIsEncrypted:(BOOL)a3;
- (void)setListValues:(id)a3;
- (void)setLocationValue:(id)a3;
- (void)setMergeableValue:(id)a3;
- (void)setPackageValue:(id)a3;
- (void)setReferenceValue:(id)a3;
- (void)setSignedValue:(int64_t)a3;
- (void)setStreamingAssetValue:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordFieldValue

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 1;
  }
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)typeAsString:(int)a3
{
  int v3 = a3 - 1;
  if (a3 - 1) < 0x1F && ((0x799FFFFFu >> v3))
  {
    v4 = off_1E64F46E0[v3];
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"bytesType"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"dateType"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"stringType"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"locationType"))
  {
    int v6 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"referenceType"))
  {
    int v6 = 5;
  }
  else if (objc_msgSend_isEqualToString_(v3, v10, @"assetType"))
  {
    int v6 = 6;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"int64Type"))
  {
    int v6 = 7;
  }
  else if (objc_msgSend_isEqualToString_(v3, v12, @"doubleType"))
  {
    int v6 = 8;
  }
  else if (objc_msgSend_isEqualToString_(v3, v13, @"emptyList"))
  {
    int v6 = 9;
  }
  else if (objc_msgSend_isEqualToString_(v3, v14, @"dateListType"))
  {
    int v6 = 10;
  }
  else if (objc_msgSend_isEqualToString_(v3, v15, @"bytesListType"))
  {
    int v6 = 11;
  }
  else if (objc_msgSend_isEqualToString_(v3, v16, @"locationListType"))
  {
    int v6 = 12;
  }
  else if (objc_msgSend_isEqualToString_(v3, v17, @"referenceListType"))
  {
    int v6 = 13;
  }
  else if (objc_msgSend_isEqualToString_(v3, v18, @"assetListType"))
  {
    int v6 = 14;
  }
  else if (objc_msgSend_isEqualToString_(v3, v19, @"stringListType"))
  {
    int v6 = 15;
  }
  else if (objc_msgSend_isEqualToString_(v3, v20, @"listType"))
  {
    int v6 = 16;
  }
  else if (objc_msgSend_isEqualToString_(v3, v21, @"int64ListType"))
  {
    int v6 = 17;
  }
  else if (objc_msgSend_isEqualToString_(v3, v22, @"doubleListType"))
  {
    int v6 = 18;
  }
  else if (objc_msgSend_isEqualToString_(v3, v23, @"packageType"))
  {
    int v6 = 19;
  }
  else if (objc_msgSend_isEqualToString_(v3, v24, @"encryptedBytesType"))
  {
    int v6 = 20;
  }
  else if (objc_msgSend_isEqualToString_(v3, v25, @"encryptedBytesListType"))
  {
    int v6 = 21;
  }
  else if (objc_msgSend_isEqualToString_(v3, v26, @"streamingAsset"))
  {
    int v6 = 24;
  }
  else if (objc_msgSend_isEqualToString_(v3, v27, @"streamingAssetList"))
  {
    int v6 = 25;
  }
  else if (objc_msgSend_isEqualToString_(v3, v28, @"mergeableValueType"))
  {
    int v6 = 28;
  }
  else if (objc_msgSend_isEqualToString_(v3, v29, @"encryptedMergeableValueType"))
  {
    int v6 = 29;
  }
  else if (objc_msgSend_isEqualToString_(v3, v30, @"tupleType"))
  {
    int v6 = 30;
  }
  else if (objc_msgSend_isEqualToString_(v3, v31, @"tupleListType"))
  {
    int v6 = 31;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasBytesValue
{
  return self->_bytesValue != 0;
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

- (BOOL)hasAssetValue
{
  return self->_assetValue != 0;
}

- (void)clearListValues
{
  objc_msgSend_removeAllObjects(self->_listValues, a2, v2);
}

- (void)addListValue:(id)a3
{
  v4 = (const char *)a3;
  listValues = self->_listValues;
  v8 = (char *)v4;
  if (!listValues)
  {
    int v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_listValues;
    self->_listValues = v6;

    v4 = v8;
    listValues = self->_listValues;
  }
  objc_msgSend_addObject_(listValues, v4, (uint64_t)v4);
}

- (unint64_t)listValuesCount
{
  return objc_msgSend_count(self->_listValues, a2, v2);
}

- (id)listValueAtIndex:(unint64_t)a3
{
  return (id)objc_msgSend_objectAtIndex_(self->_listValues, a2, a3);
}

+ (Class)listValueType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasPackageValue
{
  return self->_packageValue != 0;
}

- (BOOL)hasStreamingAssetValue
{
  return self->_streamingAssetValue != 0;
}

- (BOOL)hasMergeableValue
{
  return self->_mergeableValue != 0;
}

- (BOOL)hasEncryptedMergeableValue
{
  return self->_encryptedMergeableValue != 0;
}

- (void)setIsEncrypted:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isEncrypted = a3;
}

- (void)setHasIsEncrypted:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsEncrypted
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasAppliedCryptoFeatures
{
  return self->_appliedCryptoFeatures != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordFieldValue;
  v4 = [(CKDPRecordFieldValue *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    unsigned int v6 = self->_type - 1;
    if (v6 < 0x1F && ((0x799FFFFFu >> v6) & 1) != 0)
    {
      v7 = off_1E64F46E0[v6];
      objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)v7, @"type");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_type);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v5, v8, (uint64_t)v7, @"type");
    }
  }
  bytesValue = self->_bytesValue;
  if (bytesValue) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)bytesValue, @"bytesValue");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_super v11 = objc_msgSend_numberWithLongLong_(MEMORY[0x1E4F28ED0], v4, self->_signedValue);
    objc_msgSend_setObject_forKey_(v5, v12, (uint64_t)v11, @"signedValue");

    char has = (char)self->_has;
  }
  if (has)
  {
    v13 = objc_msgSend_numberWithDouble_(MEMORY[0x1E4F28ED0], v4, (uint64_t)bytesValue, self->_ckDoubleValue);
    objc_msgSend_setObject_forKey_(v5, v14, (uint64_t)v13, @"ckDoubleValue");
  }
  dateValue = self->_dateValue;
  if (dateValue)
  {
    v16 = objc_msgSend_dictionaryRepresentation(dateValue, v4, (uint64_t)bytesValue);
    objc_msgSend_setObject_forKey_(v5, v17, (uint64_t)v16, @"dateValue");
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)stringValue, @"stringValue");
  }
  locationValue = self->_locationValue;
  if (locationValue)
  {
    v20 = objc_msgSend_dictionaryRepresentation(locationValue, v4, (uint64_t)stringValue);
    objc_msgSend_setObject_forKey_(v5, v21, (uint64_t)v20, @"locationValue");
  }
  referenceValue = self->_referenceValue;
  if (referenceValue)
  {
    v23 = objc_msgSend_dictionaryRepresentation(referenceValue, v4, (uint64_t)stringValue);
    objc_msgSend_setObject_forKey_(v5, v24, (uint64_t)v23, @"referenceValue");
  }
  assetValue = self->_assetValue;
  if (assetValue)
  {
    v26 = objc_msgSend_dictionaryRepresentation(assetValue, v4, (uint64_t)stringValue);
    objc_msgSend_setObject_forKey_(v5, v27, (uint64_t)v26, @"assetValue");
  }
  if (objc_msgSend_count(self->_listValues, v4, (uint64_t)stringValue))
  {
    id v30 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v33 = objc_msgSend_count(self->_listValues, v31, v32);
    v35 = objc_msgSend_initWithCapacity_(v30, v34, v33);
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v36 = self->_listValues;
    uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v65, v69, 16);
    if (v38)
    {
      uint64_t v41 = v38;
      uint64_t v42 = *(void *)v66;
      do
      {
        for (uint64_t i = 0; i != v41; ++i)
        {
          if (*(void *)v66 != v42) {
            objc_enumerationMutation(v36);
          }
          v44 = objc_msgSend_dictionaryRepresentation(*(void **)(*((void *)&v65 + 1) + 8 * i), v39, v40);
          objc_msgSend_addObject_(v35, v45, (uint64_t)v44);
        }
        uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v65, v69, 16);
      }
      while (v41);
    }

    objc_msgSend_setObject_forKey_(v5, v46, (uint64_t)v35, @"listValue");
  }
  packageValue = self->_packageValue;
  if (packageValue)
  {
    v48 = objc_msgSend_dictionaryRepresentation(packageValue, v28, v29);
    objc_msgSend_setObject_forKey_(v5, v49, (uint64_t)v48, @"packageValue");
  }
  streamingAssetValue = self->_streamingAssetValue;
  if (streamingAssetValue)
  {
    v51 = objc_msgSend_dictionaryRepresentation(streamingAssetValue, v28, v29);
    objc_msgSend_setObject_forKey_(v5, v52, (uint64_t)v51, @"streamingAssetValue");
  }
  mergeableValue = self->_mergeableValue;
  if (mergeableValue)
  {
    v54 = objc_msgSend_dictionaryRepresentation(mergeableValue, v28, v29);
    objc_msgSend_setObject_forKey_(v5, v55, (uint64_t)v54, @"mergeableValue");
  }
  encryptedMergeableValue = self->_encryptedMergeableValue;
  if (encryptedMergeableValue)
  {
    v57 = objc_msgSend_dictionaryRepresentation(encryptedMergeableValue, v28, v29);
    objc_msgSend_setObject_forKey_(v5, v58, (uint64_t)v57, @"encryptedMergeableValue");
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v59 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v28, self->_isEncrypted);
    objc_msgSend_setObject_forKey_(v5, v60, (uint64_t)v59, @"isEncrypted");
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  if (appliedCryptoFeatures)
  {
    v62 = objc_msgSend_dictionaryRepresentation(appliedCryptoFeatures, v28, v29);
    objc_msgSend_setObject_forKey_(v5, v63, (uint64_t)v62, @"appliedCryptoFeatures");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return CKDPRecordFieldValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_bytesValue) {
    PBDataWriterWriteDataField();
  }
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
  if (self->_assetValue) {
    PBDataWriterWriteSubmessage();
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned int v6 = self->_listValues;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v13, v17, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v13, v17, 16);
    }
    while (v9);
  }

  if (self->_packageValue) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_appliedCryptoFeatures) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_streamingAssetValue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_mergeableValue) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_encryptedMergeableValue) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[30] = self->_type;
    *((unsigned char *)v4 + 128) |= 4u;
  }
  bytesValue = self->_bytesValue;
  v28 = v4;
  if (bytesValue)
  {
    objc_msgSend_setBytesValue_(v4, v5, (uint64_t)bytesValue);
    id v4 = v28;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_signedValue;
    *((unsigned char *)v4 + 128) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_ckDoubleValue;
    *((unsigned char *)v4 + 128) |= 1u;
  }
  dateValue = self->_dateValue;
  if (dateValue) {
    objc_msgSend_setDateValue_(v28, v5, (uint64_t)dateValue);
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    objc_msgSend_setStringValue_(v28, v5, (uint64_t)stringValue);
  }
  locationValue = self->_locationValue;
  if (locationValue) {
    objc_msgSend_setLocationValue_(v28, v5, (uint64_t)locationValue);
  }
  referenceValue = self->_referenceValue;
  if (referenceValue) {
    objc_msgSend_setReferenceValue_(v28, v5, (uint64_t)referenceValue);
  }
  assetValue = self->_assetValue;
  if (assetValue) {
    objc_msgSend_setAssetValue_(v28, v5, (uint64_t)assetValue);
  }
  if (objc_msgSend_listValuesCount(self, v5, (uint64_t)assetValue))
  {
    objc_msgSend_clearListValues(v28, v13, v14);
    uint64_t v17 = objc_msgSend_listValuesCount(self, v15, v16);
    if (v17)
    {
      uint64_t v18 = v17;
      for (uint64_t i = 0; i != v18; ++i)
      {
        v20 = objc_msgSend_listValueAtIndex_(self, v13, i);
        objc_msgSend_addListValue_(v28, v21, (uint64_t)v20);
      }
    }
  }
  packageValue = self->_packageValue;
  if (packageValue) {
    objc_msgSend_setPackageValue_(v28, v13, (uint64_t)packageValue);
  }
  v23 = v28;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v28[124] = self->_isEncrypted;
    v28[128] |= 8u;
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  if (appliedCryptoFeatures)
  {
    objc_msgSend_setAppliedCryptoFeatures_(v28, v13, (uint64_t)appliedCryptoFeatures);
    v23 = v28;
  }
  streamingAssetValue = self->_streamingAssetValue;
  if (streamingAssetValue)
  {
    objc_msgSend_setStreamingAssetValue_(v28, v13, (uint64_t)streamingAssetValue);
    v23 = v28;
  }
  mergeableValue = self->_mergeableValue;
  if (mergeableValue)
  {
    objc_msgSend_setMergeableValue_(v28, v13, (uint64_t)mergeableValue);
    v23 = v28;
  }
  encryptedMergeableValue = self->_encryptedMergeableValue;
  if (encryptedMergeableValue)
  {
    objc_msgSend_setEncryptedMergeableValue_(v28, v13, (uint64_t)encryptedMergeableValue);
    v23 = v28;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = v10;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v10 + 120) = self->_type;
    *(unsigned char *)(v10 + 128) |= 4u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_bytesValue, v11, (uint64_t)a3);
  uint64_t v14 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v13;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v12 + 16) = self->_signedValue;
    *(unsigned char *)(v12 + 128) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v12 + 8) = self->_ckDoubleValue;
    *(unsigned char *)(v12 + 128) |= 1u;
  }
  uint64_t v17 = objc_msgSend_copyWithZone_(self->_dateValue, v15, (uint64_t)a3);
  uint64_t v18 = *(void **)(v12 + 48);
  *(void *)(v12 + 48) = v17;

  uint64_t v20 = objc_msgSend_copyWithZone_(self->_stringValue, v19, (uint64_t)a3);
  v21 = *(void **)(v12 + 112);
  *(void *)(v12 + 112) = v20;

  uint64_t v23 = objc_msgSend_copyWithZone_(self->_locationValue, v22, (uint64_t)a3);
  v24 = *(void **)(v12 + 72);
  *(void *)(v12 + 72) = v23;

  uint64_t v26 = objc_msgSend_copyWithZone_(self->_referenceValue, v25, (uint64_t)a3);
  v27 = *(void **)(v12 + 96);
  *(void *)(v12 + 96) = v26;

  uint64_t v29 = objc_msgSend_copyWithZone_(self->_assetValue, v28, (uint64_t)a3);
  id v30 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = v29;

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v31 = self->_listValues;
  uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v56, v60, 16);
  if (v33)
  {
    uint64_t v35 = v33;
    uint64_t v36 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v57 != v36) {
          objc_enumerationMutation(v31);
        }
        uint64_t v38 = objc_msgSend_copyWithZone_(*(void **)(*((void *)&v56 + 1) + 8 * i), v34, (uint64_t)a3, (void)v56);
        objc_msgSend_addListValue_((void *)v12, v39, (uint64_t)v38);
      }
      uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v34, (uint64_t)&v56, v60, 16);
    }
    while (v35);
  }

  uint64_t v41 = objc_msgSend_copyWithZone_(self->_packageValue, v40, (uint64_t)a3);
  uint64_t v42 = *(void **)(v12 + 88);
  *(void *)(v12 + 88) = v41;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *(unsigned char *)(v12 + 124) = self->_isEncrypted;
    *(unsigned char *)(v12 + 128) |= 8u;
  }
  uint64_t v44 = objc_msgSend_copyWithZone_(self->_appliedCryptoFeatures, v43, (uint64_t)a3, (void)v56);
  v45 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v44;

  uint64_t v47 = objc_msgSend_copyWithZone_(self->_streamingAssetValue, v46, (uint64_t)a3);
  v48 = *(void **)(v12 + 104);
  *(void *)(v12 + 104) = v47;

  uint64_t v50 = objc_msgSend_copyWithZone_(self->_mergeableValue, v49, (uint64_t)a3);
  v51 = *(void **)(v12 + 80);
  *(void *)(v12 + 80) = v50;

  uint64_t v53 = objc_msgSend_copyWithZone_(self->_encryptedMergeableValue, v52, (uint64_t)a3);
  v54 = *(void **)(v12 + 56);
  *(void *)(v12 + 56) = v53;

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_50;
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 128);
  if ((has & 4) != 0)
  {
    if ((v4[16] & 4) == 0 || self->_type != *((_DWORD *)v4 + 30)) {
      goto LABEL_50;
    }
  }
  else if ((v4[16] & 4) != 0)
  {
    goto LABEL_50;
  }
  bytesValue = self->_bytesValue;
  uint64_t v11 = v4[5];
  if ((unint64_t)bytesValue | v11)
  {
    if (!objc_msgSend_isEqual_(bytesValue, v7, v11)) {
      goto LABEL_50;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 128);
  }
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_signedValue != v4[2]) {
      goto LABEL_50;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_50;
  }
  if (has)
  {
    if ((v9 & 1) == 0 || self->_ckDoubleValue != *((double *)v4 + 1)) {
      goto LABEL_50;
    }
  }
  else if (v9)
  {
    goto LABEL_50;
  }
  dateValue = self->_dateValue;
  uint64_t v13 = v4[6];
  if ((unint64_t)dateValue | v13 && !objc_msgSend_isEqual_(dateValue, v7, v13)) {
    goto LABEL_50;
  }
  stringValue = self->_stringValue;
  uint64_t v15 = v4[14];
  if ((unint64_t)stringValue | v15)
  {
    if (!objc_msgSend_isEqual_(stringValue, v7, v15)) {
      goto LABEL_50;
    }
  }
  locationValue = self->_locationValue;
  uint64_t v17 = v4[9];
  if ((unint64_t)locationValue | v17)
  {
    if (!objc_msgSend_isEqual_(locationValue, v7, v17)) {
      goto LABEL_50;
    }
  }
  referenceValue = self->_referenceValue;
  uint64_t v19 = v4[12];
  if ((unint64_t)referenceValue | v19)
  {
    if (!objc_msgSend_isEqual_(referenceValue, v7, v19)) {
      goto LABEL_50;
    }
  }
  assetValue = self->_assetValue;
  uint64_t v21 = v4[4];
  if ((unint64_t)assetValue | v21)
  {
    if (!objc_msgSend_isEqual_(assetValue, v7, v21)) {
      goto LABEL_50;
    }
  }
  listValues = self->_listValues;
  uint64_t v23 = v4[8];
  if ((unint64_t)listValues | v23)
  {
    if (!objc_msgSend_isEqual_(listValues, v7, v23)) {
      goto LABEL_50;
    }
  }
  packageValue = self->_packageValue;
  uint64_t v25 = v4[11];
  if ((unint64_t)packageValue | v25)
  {
    if (!objc_msgSend_isEqual_(packageValue, v7, v25)) {
      goto LABEL_50;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[16] & 8) != 0)
    {
      if (self->_isEncrypted)
      {
        if (!*((unsigned char *)v4 + 124)) {
          goto LABEL_50;
        }
        goto LABEL_42;
      }
      if (!*((unsigned char *)v4 + 124)) {
        goto LABEL_42;
      }
    }
LABEL_50:
    char isEqual = 0;
    goto LABEL_51;
  }
  if ((v4[16] & 8) != 0) {
    goto LABEL_50;
  }
LABEL_42:
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  uint64_t v27 = v4[3];
  if ((unint64_t)appliedCryptoFeatures | v27
    && !objc_msgSend_isEqual_(appliedCryptoFeatures, v7, v27))
  {
    goto LABEL_50;
  }
  streamingAssetValue = self->_streamingAssetValue;
  uint64_t v29 = v4[13];
  if ((unint64_t)streamingAssetValue | v29)
  {
    if (!objc_msgSend_isEqual_(streamingAssetValue, v7, v29)) {
      goto LABEL_50;
    }
  }
  mergeableValue = self->_mergeableValue;
  uint64_t v31 = v4[10];
  if ((unint64_t)mergeableValue | v31)
  {
    if (!objc_msgSend_isEqual_(mergeableValue, v7, v31)) {
      goto LABEL_50;
    }
  }
  encryptedMergeableValue = self->_encryptedMergeableValue;
  uint64_t v33 = v4[7];
  if ((unint64_t)encryptedMergeableValue | v33) {
    char isEqual = objc_msgSend_isEqual_(encryptedMergeableValue, v7, v33);
  }
  else {
    char isEqual = 1;
  }
LABEL_51:

  return isEqual;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v50 = 2654435761 * self->_type;
  }
  else {
    uint64_t v50 = 0;
  }
  uint64_t v49 = objc_msgSend_hash(self->_bytesValue, a2, v2);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v48 = 2654435761 * self->_signedValue;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_14:
    unint64_t v14 = 0;
    goto LABEL_15;
  }
  uint64_t v48 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_14;
  }
LABEL_6:
  double ckDoubleValue = self->_ckDoubleValue;
  double v7 = -ckDoubleValue;
  if (ckDoubleValue >= 0.0) {
    double v7 = self->_ckDoubleValue;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  double v10 = fmod(v8, 1.84467441e19);
  unint64_t v11 = 2654435761u * (unint64_t)v10;
  unint64_t v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0) {
    unint64_t v12 = 2654435761u * (unint64_t)v10;
  }
  unint64_t v13 = v11 - (unint64_t)fabs(v9);
  if (v9 < 0.0) {
    unint64_t v14 = v13;
  }
  else {
    unint64_t v14 = v12;
  }
LABEL_15:
  uint64_t v15 = objc_msgSend_hash(self->_dateValue, v4, v5);
  uint64_t v18 = objc_msgSend_hash(self->_stringValue, v16, v17);
  uint64_t v21 = objc_msgSend_hash(self->_locationValue, v19, v20);
  uint64_t v24 = objc_msgSend_hash(self->_referenceValue, v22, v23);
  uint64_t v27 = objc_msgSend_hash(self->_assetValue, v25, v26);
  uint64_t v30 = objc_msgSend_hash(self->_listValues, v28, v29);
  uint64_t v33 = objc_msgSend_hash(self->_packageValue, v31, v32);
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v36 = 2654435761 * self->_isEncrypted;
  }
  else {
    uint64_t v36 = 0;
  }
  uint64_t v37 = v49 ^ v50 ^ v48 ^ v14 ^ v15 ^ v18 ^ v21 ^ v24 ^ v27 ^ v30 ^ v33 ^ v36;
  uint64_t v38 = objc_msgSend_hash(self->_appliedCryptoFeatures, v34, v35);
  uint64_t v41 = v38 ^ objc_msgSend_hash(self->_streamingAssetValue, v39, v40);
  uint64_t v44 = v41 ^ objc_msgSend_hash(self->_mergeableValue, v42, v43);
  return v37 ^ v44 ^ objc_msgSend_hash(self->_encryptedMergeableValue, v45, v46);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v6 = v4;
  if ((*((unsigned char *)v4 + 128) & 4) != 0)
  {
    self->_type = *((_DWORD *)v4 + 30);
    *(unsigned char *)&self->_has |= 4u;
  }
  uint64_t v7 = *((void *)v4 + 5);
  if (v7) {
    objc_msgSend_setBytesValue_(self, v5, v7);
  }
  char v8 = *((unsigned char *)v6 + 128);
  if ((v8 & 2) != 0)
  {
    self->_signedValue = *((void *)v6 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v8 = *((unsigned char *)v6 + 128);
  }
  if (v8)
  {
    self->_double ckDoubleValue = *((double *)v6 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  dateValue = self->_dateValue;
  uint64_t v10 = *((void *)v6 + 6);
  if (dateValue)
  {
    if (v10) {
      objc_msgSend_mergeFrom_(dateValue, v5, v10);
    }
  }
  else if (v10)
  {
    objc_msgSend_setDateValue_(self, v5, v10);
  }
  uint64_t v11 = *((void *)v6 + 14);
  if (v11) {
    objc_msgSend_setStringValue_(self, v5, v11);
  }
  locationValue = self->_locationValue;
  uint64_t v13 = *((void *)v6 + 9);
  if (locationValue)
  {
    if (v13) {
      objc_msgSend_mergeFrom_(locationValue, v5, v13);
    }
  }
  else if (v13)
  {
    objc_msgSend_setLocationValue_(self, v5, v13);
  }
  referenceValue = self->_referenceValue;
  uint64_t v15 = *((void *)v6 + 12);
  if (referenceValue)
  {
    if (v15) {
      objc_msgSend_mergeFrom_(referenceValue, v5, v15);
    }
  }
  else if (v15)
  {
    objc_msgSend_setReferenceValue_(self, v5, v15);
  }
  assetValue = self->_assetValue;
  uint64_t v17 = *((void *)v6 + 4);
  if (assetValue)
  {
    if (v17) {
      objc_msgSend_mergeFrom_(assetValue, v5, v17);
    }
  }
  else if (v17)
  {
    objc_msgSend_setAssetValue_(self, v5, v17);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v18 = *((id *)v6 + 8);
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v36, v40, 16);
  if (v20)
  {
    uint64_t v22 = v20;
    uint64_t v23 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v37 != v23) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend_addListValue_(self, v21, *(void *)(*((void *)&v36 + 1) + 8 * i), (void)v36);
      }
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v36, v40, 16);
    }
    while (v22);
  }

  packageValue = self->_packageValue;
  uint64_t v27 = *((void *)v6 + 11);
  if (packageValue)
  {
    if (v27) {
      objc_msgSend_mergeFrom_(packageValue, v25, v27);
    }
  }
  else if (v27)
  {
    objc_msgSend_setPackageValue_(self, v25, v27);
  }
  if ((*((unsigned char *)v6 + 128) & 8) != 0)
  {
    self->_isEncrypted = *((unsigned char *)v6 + 124);
    *(unsigned char *)&self->_has |= 8u;
  }
  appliedCryptoFeatures = self->_appliedCryptoFeatures;
  uint64_t v29 = *((void *)v6 + 3);
  if (appliedCryptoFeatures)
  {
    if (v29) {
      objc_msgSend_mergeFrom_(appliedCryptoFeatures, v25, v29);
    }
  }
  else if (v29)
  {
    objc_msgSend_setAppliedCryptoFeatures_(self, v25, v29);
  }
  streamingAssetValue = self->_streamingAssetValue;
  uint64_t v31 = *((void *)v6 + 13);
  if (streamingAssetValue)
  {
    if (v31) {
      objc_msgSend_mergeFrom_(streamingAssetValue, v25, v31);
    }
  }
  else if (v31)
  {
    objc_msgSend_setStreamingAssetValue_(self, v25, v31);
  }
  mergeableValue = self->_mergeableValue;
  uint64_t v33 = *((void *)v6 + 10);
  if (mergeableValue)
  {
    if (v33) {
      objc_msgSend_mergeFrom_(mergeableValue, v25, v33);
    }
  }
  else if (v33)
  {
    objc_msgSend_setMergeableValue_(self, v25, v33);
  }
  encryptedMergeableValue = self->_encryptedMergeableValue;
  uint64_t v35 = *((void *)v6 + 7);
  if (encryptedMergeableValue)
  {
    if (v35) {
      objc_msgSend_mergeFrom_(encryptedMergeableValue, v25, v35);
    }
  }
  else if (v35)
  {
    objc_msgSend_setEncryptedMergeableValue_(self, v25, v35);
  }
}

- (NSData)bytesValue
{
  return self->_bytesValue;
}

- (void)setBytesValue:(id)a3
{
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

- (CKDPAsset)assetValue
{
  return self->_assetValue;
}

- (void)setAssetValue:(id)a3
{
}

- (NSMutableArray)listValues
{
  return self->_listValues;
}

- (void)setListValues:(id)a3
{
}

- (CKDPPackage)packageValue
{
  return self->_packageValue;
}

- (void)setPackageValue:(id)a3
{
}

- (CKDPStreamingAsset)streamingAssetValue
{
  return self->_streamingAssetValue;
}

- (void)setStreamingAssetValue:(id)a3
{
}

- (CKDPMergeableValue)mergeableValue
{
  return self->_mergeableValue;
}

- (void)setMergeableValue:(id)a3
{
}

- (CKDPEncryptedMergeableValue)encryptedMergeableValue
{
  return self->_encryptedMergeableValue;
}

- (void)setEncryptedMergeableValue:(id)a3
{
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (CKDPFieldCryptoFeatureSet)appliedCryptoFeatures
{
  return self->_appliedCryptoFeatures;
}

- (void)setAppliedCryptoFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_streamingAssetValue, 0);
  objc_storeStrong((id *)&self->_referenceValue, 0);
  objc_storeStrong((id *)&self->_packageValue, 0);
  objc_storeStrong((id *)&self->_mergeableValue, 0);
  objc_storeStrong((id *)&self->_locationValue, 0);
  objc_storeStrong((id *)&self->_listValues, 0);
  objc_storeStrong((id *)&self->_encryptedMergeableValue, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_bytesValue, 0);
  objc_storeStrong((id *)&self->_assetValue, 0);
  objc_storeStrong((id *)&self->_appliedCryptoFeatures, 0);
}

- (void)_CKLogToFileHandle:(id)a3 atDepth:(int)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1C8789E70]();
  uint64_t v10 = objc_msgSend_dictionaryRepresentation(self, v8, v9);
  uint64_t v13 = objc_msgSend_packageProcessBasePath(MEMORY[0x1E4F1A250], v11, v12);
  uint64_t v15 = objc_msgSend_standaloneTranslatorWithPackageStagingDirectory_databaseScope_(CKDProtocolTranslator, v14, (uint64_t)v13, 2);
  uint64_t v17 = objc_msgSend_objectRepresentationFromFieldValue_(v15, v16, (uint64_t)self);

  if (!v17)
  {
    if ((objc_msgSend_hasMergeableValue(self, v18, v19) & 1) != 0
      || objc_msgSend_hasEncryptedMergeableValue(self, v20, v21))
    {
      uint64_t v22 = objc_msgSend_mergeableValue(self, v20, v21);
      uint64_t v25 = v22;
      if (v22)
      {
        id v26 = v22;
      }
      else
      {
        objc_msgSend_encryptedMergeableValue(self, v23, v24);
        id v26 = (id)objc_claimAutoreleasedReturnValue();
      }
      uint64_t v17 = v26;
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v60 = v10;
    uint64_t v27 = v7;
    v28 = sub_1C4EB6188();
    objc_msgSend_writeData_(v6, v29, (uint64_t)v28);

    uint64_t v30 = sub_1C4EB5A74();
    objc_msgSend_writeData_(v6, v31, (uint64_t)v30);

    sub_1C4EB5AC8(a4 + 1, v6);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id v32 = v17;
    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v61, v65, 16);
    if (v34)
    {
      uint64_t v36 = v34;
      uint64_t v37 = *(void *)v62;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v62 != v37) {
            objc_enumerationMutation(v32);
          }
          objc_msgSend__CKLogToFileHandle_atDepth_(*(void **)(*((void *)&v61 + 1) + 8 * i), v35, (uint64_t)v6, (a4 + 1));
          long long v39 = sub_1C4EB5A74();
          objc_msgSend_writeData_(v6, v40, (uint64_t)v39);
        }
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v61, v65, 16);
      }
      while (v36);
    }

    sub_1C4EB5AC8(a4, v6);
    uint64_t v41 = sub_1C4EB6230();
    objc_msgSend_writeData_(v6, v42, (uint64_t)v41);

    uint64_t v7 = v27;
    uint64_t v10 = v60;
  }
  else
  {
    uint64_t v43 = sub_1C4EB74C0();
    objc_msgSend_writeData_(v6, v44, (uint64_t)v43);

    uint64_t v46 = objc_msgSend_objectForKeyedSubscript_(v10, v45, @"type");
    objc_msgSend_writeString_(v6, v47, (uint64_t)v46);

    uint64_t v48 = sub_1C4EB7514();
    objc_msgSend_writeData_(v6, v49, (uint64_t)v48);

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_21;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_21;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_21;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_37;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_37;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_37;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
LABEL_37:
      v55 = sub_1C4EB7568();
      objc_msgSend_writeData_(v6, v56, (uint64_t)v55);

      objc_msgSend__CKLogToFileHandle_atDepth_(v17, v57, (uint64_t)v6, (a4 + 1));
      long long v58 = sub_1C4EB7568();
      objc_msgSend_writeData_(v6, v59, (uint64_t)v58);
    }
    else
    {
LABEL_21:
      objc_msgSend__CKLogToFileHandle_atDepth_(v17, v50, (uint64_t)v6, (a4 + 1));
    }
    v51 = sub_1C4EB6F54();
    objc_msgSend_writeData_(v6, v52, (uint64_t)v51);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend_removeDB(v17, v53, v54);
  }
}

@end