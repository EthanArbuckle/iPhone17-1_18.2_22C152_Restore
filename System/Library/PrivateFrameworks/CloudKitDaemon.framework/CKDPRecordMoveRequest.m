@interface CKDPRecordMoveRequest
+ (id)options;
- (BOOL)hasDestinationEtag;
- (BOOL)hasDestinationRecord;
- (BOOL)hasDestinationRecordProtectionInfoTag;
- (BOOL)hasDestinationZoneProtectionInfoTag;
- (BOOL)hasMerge;
- (BOOL)hasOriginEtag;
- (BOOL)hasOriginId;
- (BOOL)hasSemantics;
- (BOOL)isEqual:(id)a3;
- (BOOL)merge;
- (BOOL)readFrom:(id)a3;
- (CKDPRecord)destinationRecord;
- (CKDPRecordIdentifier)originId;
- (Class)responseClass;
- (NSString)destinationEtag;
- (NSString)destinationRecordProtectionInfoTag;
- (NSString)destinationZoneProtectionInfoTag;
- (NSString)originEtag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)semanticsAsString:(int)a3;
- (int)StringAsSemantics:(id)a3;
- (int)semantics;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDestinationEtag:(id)a3;
- (void)setDestinationRecord:(id)a3;
- (void)setDestinationRecordProtectionInfoTag:(id)a3;
- (void)setDestinationZoneProtectionInfoTag:(id)a3;
- (void)setHasMerge:(BOOL)a3;
- (void)setHasSemantics:(BOOL)a3;
- (void)setMerge:(BOOL)a3;
- (void)setOriginEtag:(id)a3;
- (void)setOriginId:(id)a3;
- (void)setSemantics:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordMoveRequest

+ (id)options
{
  if (qword_1EBBCDD80 != -1) {
    dispatch_once(&qword_1EBBCDD80, &unk_1F2043430);
  }
  v2 = (void *)qword_1EBBCDD78;
  return v2;
}

- (int)semantics
{
  if (*(unsigned char *)&self->_has) {
    return self->_semantics;
  }
  else {
    return 1;
  }
}

- (void)setSemantics:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_semantics = a3;
}

- (void)setHasSemantics:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSemantics
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)semanticsAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"failIfExists";
  }
  else if (a3 == 2)
  {
    v4 = @"failIfEtagMismatch";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsSemantics:(id)a3
{
  id v3 = a3;
  int v6 = 1;
  if ((objc_msgSend_isEqualToString_(v3, v4, @"failIfExists") & 1) == 0)
  {
    if (objc_msgSend_isEqualToString_(v3, v5, @"failIfEtagMismatch")) {
      int v6 = 2;
    }
    else {
      int v6 = 1;
    }
  }

  return v6;
}

- (BOOL)hasOriginId
{
  return self->_originId != 0;
}

- (BOOL)hasOriginEtag
{
  return self->_originEtag != 0;
}

- (BOOL)hasDestinationEtag
{
  return self->_destinationEtag != 0;
}

- (BOOL)hasDestinationZoneProtectionInfoTag
{
  return self->_destinationZoneProtectionInfoTag != 0;
}

- (BOOL)hasDestinationRecordProtectionInfoTag
{
  return self->_destinationRecordProtectionInfoTag != 0;
}

- (BOOL)hasDestinationRecord
{
  return self->_destinationRecord != 0;
}

- (void)setMerge:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_merge = a3;
}

- (void)setHasMerge:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMerge
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordMoveRequest;
  v4 = [(CKDPRecordMoveRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    int semantics = self->_semantics;
    if (semantics == 1)
    {
      v8 = @"failIfExists";
      objc_msgSend_setObject_forKey_(v6, v4, @"failIfExists", @"semantics");
    }
    else if (semantics == 2)
    {
      v8 = @"failIfEtagMismatch";
      objc_msgSend_setObject_forKey_(v6, v4, @"failIfEtagMismatch", @"semantics");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_semantics);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"semantics");
    }
  }
  originId = self->_originId;
  if (originId)
  {
    objc_super v11 = objc_msgSend_dictionaryRepresentation(originId, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"originId");
  }
  originEtag = self->_originEtag;
  if (originEtag) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)originEtag, @"originEtag");
  }
  destinationEtag = self->_destinationEtag;
  if (destinationEtag) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)destinationEtag, @"destinationEtag");
  }
  destinationZoneProtectionInfoTag = self->_destinationZoneProtectionInfoTag;
  if (destinationZoneProtectionInfoTag) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)destinationZoneProtectionInfoTag, @"destinationZoneProtectionInfoTag");
  }
  destinationRecordProtectionInfoTag = self->_destinationRecordProtectionInfoTag;
  if (destinationRecordProtectionInfoTag) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)destinationRecordProtectionInfoTag, @"destinationRecordProtectionInfoTag");
  }
  destinationRecord = self->_destinationRecord;
  if (destinationRecord)
  {
    v18 = objc_msgSend_dictionaryRepresentation(destinationRecord, v4, (uint64_t)destinationRecordProtectionInfoTag);
    objc_msgSend_setObject_forKey_(v6, v19, (uint64_t)v18, @"destinationRecord");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v20 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_merge);
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, @"merge");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E21208((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_originId) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_originEtag) {
    PBDataWriterWriteStringField();
  }
  if (self->_destinationEtag) {
    PBDataWriterWriteStringField();
  }
  if (self->_destinationZoneProtectionInfoTag) {
    PBDataWriterWriteStringField();
  }
  if (self->_destinationRecordProtectionInfoTag) {
    PBDataWriterWriteStringField();
  }
  if (self->_destinationRecord) {
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (unsigned)requestTypeCode
{
  return 78;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  objc_super v11 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v11[14] = self->_semantics;
    *((unsigned char *)v11 + 64) |= 1u;
  }
  originId = self->_originId;
  if (originId) {
    objc_msgSend_setOriginId_(v11, v4, (uint64_t)originId);
  }
  originEtag = self->_originEtag;
  if (originEtag) {
    objc_msgSend_setOriginEtag_(v11, v4, (uint64_t)originEtag);
  }
  destinationEtag = self->_destinationEtag;
  if (destinationEtag) {
    objc_msgSend_setDestinationEtag_(v11, v4, (uint64_t)destinationEtag);
  }
  destinationZoneProtectionInfoTag = self->_destinationZoneProtectionInfoTag;
  if (destinationZoneProtectionInfoTag) {
    objc_msgSend_setDestinationZoneProtectionInfoTag_(v11, v4, (uint64_t)destinationZoneProtectionInfoTag);
  }
  destinationRecordProtectionInfoTag = self->_destinationRecordProtectionInfoTag;
  if (destinationRecordProtectionInfoTag) {
    objc_msgSend_setDestinationRecordProtectionInfoTag_(v11, v4, (uint64_t)destinationRecordProtectionInfoTag);
  }
  destinationRecord = self->_destinationRecord;
  if (destinationRecord) {
    objc_msgSend_setDestinationRecord_(v11, v4, (uint64_t)destinationRecord);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((unsigned char *)v11 + 60) = self->_merge;
    *((unsigned char *)v11 + 64) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = v10;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 56) = self->_semantics;
    *(unsigned char *)(v10 + 64) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_originId, v11, (uint64_t)a3);
  v14 = *(void **)(v12 + 48);
  *(void *)(v12 + 48) = v13;

  uint64_t v16 = objc_msgSend_copyWithZone_(self->_originEtag, v15, (uint64_t)a3);
  v17 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v16;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_destinationEtag, v18, (uint64_t)a3);
  v20 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v19;

  uint64_t v22 = objc_msgSend_copyWithZone_(self->_destinationZoneProtectionInfoTag, v21, (uint64_t)a3);
  v23 = *(void **)(v12 + 32);
  *(void *)(v12 + 32) = v22;

  uint64_t v25 = objc_msgSend_copyWithZone_(self->_destinationRecordProtectionInfoTag, v24, (uint64_t)a3);
  v26 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v25;

  uint64_t v28 = objc_msgSend_copyWithZone_(self->_destinationRecord, v27, (uint64_t)a3);
  v29 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v28;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v12 + 60) = self->_merge;
    *(unsigned char *)(v12 + 64) |= 2u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_21;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[8] & 1) == 0 || self->_semantics != *((_DWORD *)v4 + 14)) {
      goto LABEL_21;
    }
  }
  else if (v4[8])
  {
    goto LABEL_21;
  }
  originId = self->_originId;
  uint64_t v9 = v4[6];
  if ((unint64_t)originId | v9 && !objc_msgSend_isEqual_(originId, v7, v9)) {
    goto LABEL_21;
  }
  originEtag = self->_originEtag;
  uint64_t v11 = v4[5];
  if ((unint64_t)originEtag | v11)
  {
    if (!objc_msgSend_isEqual_(originEtag, v7, v11)) {
      goto LABEL_21;
    }
  }
  destinationEtag = self->_destinationEtag;
  uint64_t v13 = v4[1];
  if ((unint64_t)destinationEtag | v13)
  {
    if (!objc_msgSend_isEqual_(destinationEtag, v7, v13)) {
      goto LABEL_21;
    }
  }
  destinationZoneProtectionInfoTag = self->_destinationZoneProtectionInfoTag;
  uint64_t v15 = v4[4];
  if ((unint64_t)destinationZoneProtectionInfoTag | v15)
  {
    if (!objc_msgSend_isEqual_(destinationZoneProtectionInfoTag, v7, v15)) {
      goto LABEL_21;
    }
  }
  destinationRecordProtectionInfoTag = self->_destinationRecordProtectionInfoTag;
  uint64_t v17 = v4[3];
  if ((unint64_t)destinationRecordProtectionInfoTag | v17)
  {
    if (!objc_msgSend_isEqual_(destinationRecordProtectionInfoTag, v7, v17)) {
      goto LABEL_21;
    }
  }
  destinationRecord = self->_destinationRecord;
  uint64_t v19 = v4[2];
  if ((unint64_t)destinationRecord | v19)
  {
    if (!objc_msgSend_isEqual_(destinationRecord, v7, v19)) {
      goto LABEL_21;
    }
  }
  BOOL v20 = (v4[8] & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[8] & 2) == 0)
    {
LABEL_21:
      BOOL v20 = 0;
      goto LABEL_22;
    }
    if (self->_merge)
    {
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_21;
      }
    }
    else if (*((unsigned char *)v4 + 60))
    {
      goto LABEL_21;
    }
    BOOL v20 = 1;
  }
LABEL_22:

  return v20;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_semantics;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = objc_msgSend_hash(self->_originId, a2, v2);
  uint64_t v8 = objc_msgSend_hash(self->_originEtag, v6, v7);
  uint64_t v11 = objc_msgSend_hash(self->_destinationEtag, v9, v10);
  uint64_t v14 = objc_msgSend_hash(self->_destinationZoneProtectionInfoTag, v12, v13);
  uint64_t v17 = objc_msgSend_hash(self->_destinationRecordProtectionInfoTag, v15, v16);
  uint64_t v20 = objc_msgSend_hash(self->_destinationRecord, v18, v19);
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v21 = 2654435761 * self->_merge;
  }
  else {
    uint64_t v21 = 0;
  }
  return v5 ^ v4 ^ v8 ^ v11 ^ v14 ^ v17 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  id v5 = v4;
  if (v4[16])
  {
    self->_int semantics = v4[14];
    *(unsigned char *)&self->_has |= 1u;
  }
  originId = self->_originId;
  uint64_t v7 = *((void *)v5 + 6);
  id v14 = v5;
  if (originId)
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_mergeFrom_(originId, (const char *)v5, v7);
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_setOriginId_(self, (const char *)v5, v7);
  }
  id v5 = v14;
LABEL_9:
  uint64_t v8 = *((void *)v5 + 5);
  if (v8)
  {
    objc_msgSend_setOriginEtag_(self, (const char *)v5, v8);
    id v5 = v14;
  }
  uint64_t v9 = *((void *)v5 + 1);
  if (v9)
  {
    objc_msgSend_setDestinationEtag_(self, (const char *)v5, v9);
    id v5 = v14;
  }
  uint64_t v10 = *((void *)v5 + 4);
  if (v10)
  {
    objc_msgSend_setDestinationZoneProtectionInfoTag_(self, (const char *)v5, v10);
    id v5 = v14;
  }
  uint64_t v11 = *((void *)v5 + 3);
  if (v11)
  {
    objc_msgSend_setDestinationRecordProtectionInfoTag_(self, (const char *)v5, v11);
    id v5 = v14;
  }
  destinationRecord = self->_destinationRecord;
  uint64_t v13 = *((void *)v5 + 2);
  if (destinationRecord)
  {
    if (!v13) {
      goto LABEL_23;
    }
    objc_msgSend_mergeFrom_(destinationRecord, (const char *)v5, v13);
  }
  else
  {
    if (!v13) {
      goto LABEL_23;
    }
    objc_msgSend_setDestinationRecord_(self, (const char *)v5, v13);
  }
  id v5 = v14;
LABEL_23:
  if ((*((unsigned char *)v5 + 64) & 2) != 0)
  {
    self->_merge = *((unsigned char *)v5 + 60);
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPRecordIdentifier)originId
{
  return self->_originId;
}

- (void)setOriginId:(id)a3
{
}

- (NSString)originEtag
{
  return self->_originEtag;
}

- (void)setOriginEtag:(id)a3
{
}

- (NSString)destinationEtag
{
  return self->_destinationEtag;
}

- (void)setDestinationEtag:(id)a3
{
}

- (NSString)destinationZoneProtectionInfoTag
{
  return self->_destinationZoneProtectionInfoTag;
}

- (void)setDestinationZoneProtectionInfoTag:(id)a3
{
}

- (NSString)destinationRecordProtectionInfoTag
{
  return self->_destinationRecordProtectionInfoTag;
}

- (void)setDestinationRecordProtectionInfoTag:(id)a3
{
}

- (CKDPRecord)destinationRecord
{
  return self->_destinationRecord;
}

- (void)setDestinationRecord:(id)a3
{
}

- (BOOL)merge
{
  return self->_merge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originId, 0);
  objc_storeStrong((id *)&self->_originEtag, 0);
  objc_storeStrong((id *)&self->_destinationZoneProtectionInfoTag, 0);
  objc_storeStrong((id *)&self->_destinationRecordProtectionInfoTag, 0);
  objc_storeStrong((id *)&self->_destinationRecord, 0);
  objc_storeStrong((id *)&self->_destinationEtag, 0);
}

@end