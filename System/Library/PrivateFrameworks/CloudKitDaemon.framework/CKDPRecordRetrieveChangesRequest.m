@interface CKDPRecordRetrieveChangesRequest
+ (id)options;
- (BOOL)hasAssetsToDownload;
- (BOOL)hasIgnoreCallingDeviceChanges;
- (BOOL)hasIncludeMergeableDeltas;
- (BOOL)hasMaxChanges;
- (BOOL)hasNewestFirst;
- (BOOL)hasRequestedChangeTypes;
- (BOOL)hasRequestedFields;
- (BOOL)hasSyncContinuationToken;
- (BOOL)hasZoneIdentifier;
- (BOOL)ignoreCallingDeviceChanges;
- (BOOL)includeMergeableDeltas;
- (BOOL)isEqual:(id)a3;
- (BOOL)newestFirst;
- (BOOL)readFrom:(id)a3;
- (CKDPAssetsToDownload)assetsToDownload;
- (CKDPRecordZoneIdentifier)zoneIdentifier;
- (CKDPRequestedFields)requestedFields;
- (Class)responseClass;
- (NSData)syncContinuationToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)requestedChangeTypesAsString:(int)a3;
- (int)StringAsRequestedChangeTypes:(id)a3;
- (int)requestedChangeTypes;
- (unint64_t)hash;
- (unsigned)maxChanges;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetsToDownload:(id)a3;
- (void)setHasIgnoreCallingDeviceChanges:(BOOL)a3;
- (void)setHasIncludeMergeableDeltas:(BOOL)a3;
- (void)setHasMaxChanges:(BOOL)a3;
- (void)setHasNewestFirst:(BOOL)a3;
- (void)setHasRequestedChangeTypes:(BOOL)a3;
- (void)setIgnoreCallingDeviceChanges:(BOOL)a3;
- (void)setIncludeMergeableDeltas:(BOOL)a3;
- (void)setMaxChanges:(unsigned int)a3;
- (void)setNewestFirst:(BOOL)a3;
- (void)setRequestedChangeTypes:(int)a3;
- (void)setRequestedFields:(id)a3;
- (void)setSyncContinuationToken:(id)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPRecordRetrieveChangesRequest

+ (id)options
{
  if (qword_1EBBCDF10 != -1) {
    dispatch_once(&qword_1EBBCDF10, &unk_1F20448B0);
  }
  v2 = (void *)qword_1EBBCDF08;
  return v2;
}

- (BOOL)hasSyncContinuationToken
{
  return self->_syncContinuationToken != 0;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (BOOL)hasRequestedFields
{
  return self->_requestedFields != 0;
}

- (void)setMaxChanges:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxChanges = a3;
}

- (void)setHasMaxChanges:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxChanges
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)requestedChangeTypes
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_requestedChangeTypes;
  }
  else {
    return 3;
  }
}

- (void)setRequestedChangeTypes:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_requestedChangeTypes = a3;
}

- (void)setHasRequestedChangeTypes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRequestedChangeTypes
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)requestedChangeTypesAsString:(int)a3
{
  if ((a3 - 1) >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_1E64F82D0[a3 - 1];
  }
  return v3;
}

- (int)StringAsRequestedChangeTypes:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"records"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"shares"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"recordsAndShares"))
  {
    int v6 = 3;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasAssetsToDownload
{
  return self->_assetsToDownload != 0;
}

- (void)setNewestFirst:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_newestFirst = a3;
}

- (void)setHasNewestFirst:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasNewestFirst
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setIgnoreCallingDeviceChanges:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_ignoreCallingDeviceChanges = a3;
}

- (void)setHasIgnoreCallingDeviceChanges:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIgnoreCallingDeviceChanges
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIncludeMergeableDeltas:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_includeMergeableDeltas = a3;
}

- (void)setHasIncludeMergeableDeltas:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIncludeMergeableDeltas
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPRecordRetrieveChangesRequest;
  v4 = [(CKDPRecordRetrieveChangesRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  syncContinuationToken = self->_syncContinuationToken;
  if (syncContinuationToken) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)syncContinuationToken, @"syncContinuationToken");
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    v9 = objc_msgSend_dictionaryRepresentation(zoneIdentifier, v5, (uint64_t)syncContinuationToken);
    objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, @"zoneIdentifier");
  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    v12 = objc_msgSend_dictionaryRepresentation(requestedFields, v5, (uint64_t)syncContinuationToken);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, @"requestedFields");
  }
  char has = (char)self->_has;
  if (has)
  {
    v15 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E4F28ED0], v5, self->_maxChanges);
    objc_msgSend_setObject_forKey_(v6, v16, (uint64_t)v15, @"maxChanges");

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v17 = self->_requestedChangeTypes - 1;
    if (v17 >= 3)
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", self->_requestedChangeTypes);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E64F82D0[v17];
    }
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)v18, @"requestedChangeTypes");
  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    v20 = objc_msgSend_dictionaryRepresentation(assetsToDownload, v5, (uint64_t)syncContinuationToken);
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, @"assetsToDownload");
  }
  char v22 = (char)self->_has;
  if ((v22 & 0x10) != 0)
  {
    v26 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v5, self->_newestFirst);
    objc_msgSend_setObject_forKey_(v6, v27, (uint64_t)v26, @"newestFirst");

    char v22 = (char)self->_has;
    if ((v22 & 4) == 0)
    {
LABEL_18:
      if ((v22 & 8) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_18;
  }
  v28 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v5, self->_ignoreCallingDeviceChanges);
  objc_msgSend_setObject_forKey_(v6, v29, (uint64_t)v28, @"ignoreCallingDeviceChanges");

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_19:
    v23 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v5, self->_includeMergeableDeltas);
    objc_msgSend_setObject_forKey_(v6, v24, (uint64_t)v23, @"includeMergeableDeltas");
  }
LABEL_20:
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4FD38F4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_syncContinuationToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  if (self->_requestedFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_assetsToDownload)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    char v6 = (char)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_15:
      if ((v6 & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_16:
    PBDataWriterWriteBOOLField();
    id v4 = v7;
  }
LABEL_17:
}

- (unsigned)requestTypeCode
{
  return 7;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  syncContinuationToken = self->_syncContinuationToken;
  id v12 = v4;
  if (syncContinuationToken)
  {
    objc_msgSend_setSyncContinuationToken_(v4, v5, (uint64_t)syncContinuationToken);
    id v4 = v12;
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v12, v5, (uint64_t)zoneIdentifier);
    id v4 = v12;
  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_msgSend_setRequestedFields_(v12, v5, (uint64_t)requestedFields);
    id v4 = v12;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_maxChanges;
    *((unsigned char *)v4 + 52) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = self->_requestedChangeTypes;
    *((unsigned char *)v4 + 52) |= 2u;
  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    objc_msgSend_setAssetsToDownload_(v12, v5, (uint64_t)assetsToDownload);
    id v4 = v12;
  }
  char v11 = (char)self->_has;
  if ((v11 & 0x10) != 0)
  {
    *((unsigned char *)v4 + 50) = self->_newestFirst;
    *((unsigned char *)v4 + 52) |= 0x10u;
    char v11 = (char)self->_has;
    if ((v11 & 4) == 0)
    {
LABEL_15:
      if ((v11 & 8) == 0) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  *((unsigned char *)v4 + 48) = self->_ignoreCallingDeviceChanges;
  *((unsigned char *)v4 + 52) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_16:
    *((unsigned char *)v4 + 49) = self->_includeMergeableDeltas;
    *((unsigned char *)v4 + 52) |= 8u;
  }
LABEL_17:
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  id v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_syncContinuationToken, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_requestedFields, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 24);
  *(void *)(v10 + 24) = v18;

  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v10 + 16) = self->_maxChanges;
    *(unsigned char *)(v10 + 52) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v10 + 20) = self->_requestedChangeTypes;
    *(unsigned char *)(v10 + 52) |= 2u;
  }
  uint64_t v22 = objc_msgSend_copyWithZone_(self->_assetsToDownload, v20, (uint64_t)a3);
  v23 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v22;

  char v24 = (char)self->_has;
  if ((v24 & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    *(unsigned char *)(v10 + 48) = self->_ignoreCallingDeviceChanges;
    *(unsigned char *)(v10 + 52) |= 4u;
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return (id)v10;
    }
    goto LABEL_8;
  }
  *(unsigned char *)(v10 + 50) = self->_newestFirst;
  *(unsigned char *)(v10 + 52) |= 0x10u;
  char v24 = (char)self->_has;
  if ((v24 & 4) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if ((v24 & 8) != 0)
  {
LABEL_8:
    *(unsigned char *)(v10 + 49) = self->_includeMergeableDeltas;
    *(unsigned char *)(v10 + 52) |= 8u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_39;
  }
  syncContinuationToken = self->_syncContinuationToken;
  uint64_t v9 = v4[4];
  if ((unint64_t)syncContinuationToken | v9)
  {
    if (!objc_msgSend_isEqual_(syncContinuationToken, v7, v9)) {
      goto LABEL_39;
    }
  }
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v11 = v4[5];
  if ((unint64_t)zoneIdentifier | v11)
  {
    if (!objc_msgSend_isEqual_(zoneIdentifier, v7, v11)) {
      goto LABEL_39;
    }
  }
  requestedFields = self->_requestedFields;
  uint64_t v13 = v4[3];
  if ((unint64_t)requestedFields | v13)
  {
    if (!objc_msgSend_isEqual_(requestedFields, v7, v13)) {
      goto LABEL_39;
    }
  }
  char has = (char)self->_has;
  char v15 = *((unsigned char *)v4 + 52);
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_maxChanges != *((_DWORD *)v4 + 4)) {
      goto LABEL_39;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_39;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_requestedChangeTypes != *((_DWORD *)v4 + 5)) {
      goto LABEL_39;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_39;
  }
  assetsToDownload = self->_assetsToDownload;
  uint64_t v17 = v4[1];
  if ((unint64_t)assetsToDownload | v17)
  {
    if (!objc_msgSend_isEqual_(assetsToDownload, v7, v17)) {
      goto LABEL_39;
    }
    char has = (char)self->_has;
    char v15 = *((unsigned char *)v4 + 52);
  }
  if ((has & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0) {
      goto LABEL_39;
    }
    if (self->_newestFirst)
    {
      if (!*((unsigned char *)v4 + 50)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)v4 + 50))
    {
      goto LABEL_39;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_39;
  }
  if ((has & 4) != 0)
  {
    if ((v15 & 4) == 0) {
      goto LABEL_39;
    }
    if (self->_ignoreCallingDeviceChanges)
    {
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_39;
      }
    }
    else if (*((unsigned char *)v4 + 48))
    {
      goto LABEL_39;
    }
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_39;
  }
  BOOL v18 = (v15 & 8) == 0;
  if ((has & 8) != 0)
  {
    if ((v15 & 8) != 0)
    {
      if (self->_includeMergeableDeltas)
      {
        if (!*((unsigned char *)v4 + 49)) {
          goto LABEL_39;
        }
      }
      else if (*((unsigned char *)v4 + 49))
      {
        goto LABEL_39;
      }
      BOOL v18 = 1;
      goto LABEL_40;
    }
LABEL_39:
    BOOL v18 = 0;
  }
LABEL_40:

  return v18;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_syncContinuationToken, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_zoneIdentifier, v5, v6);
  uint64_t v12 = objc_msgSend_hash(self->_requestedFields, v8, v9);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v13 = 2654435761 * self->_maxChanges;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v14 = 2654435761 * self->_requestedChangeTypes;
      goto LABEL_6;
    }
  }
  uint64_t v14 = 0;
LABEL_6:
  uint64_t v15 = objc_msgSend_hash(self->_assetsToDownload, v10, v11);
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    uint64_t v16 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
LABEL_11:
    uint64_t v17 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_9;
    }
LABEL_12:
    uint64_t v18 = 0;
    return v7 ^ v4 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
  }
  uint64_t v16 = 2654435761 * self->_newestFirst;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_8:
  uint64_t v17 = 2654435761 * self->_ignoreCallingDeviceChanges;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_9:
  uint64_t v18 = 2654435761 * self->_includeMergeableDeltas;
  return v7 ^ v4 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)v4 + 4);
  id v14 = v4;
  if (v5)
  {
    objc_msgSend_setSyncContinuationToken_(self, (const char *)v4, v5);
    id v4 = v14;
  }
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v7 = *((void *)v4 + 5);
  if (zoneIdentifier)
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v4, v7);
  }
  else
  {
    if (!v7) {
      goto LABEL_9;
    }
    objc_msgSend_setZoneIdentifier_(self, (const char *)v4, v7);
  }
  id v4 = v14;
LABEL_9:
  requestedFields = self->_requestedFields;
  uint64_t v9 = *((void *)v4 + 3);
  if (requestedFields)
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_mergeFrom_(requestedFields, (const char *)v4, v9);
  }
  else
  {
    if (!v9) {
      goto LABEL_15;
    }
    objc_msgSend_setRequestedFields_(self, (const char *)v4, v9);
  }
  id v4 = v14;
LABEL_15:
  char v10 = *((unsigned char *)v4 + 52);
  if (v10)
  {
    self->_maxChanges = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v10 = *((unsigned char *)v4 + 52);
  }
  if ((v10 & 2) != 0)
  {
    self->_requestedChangeTypes = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
  assetsToDownload = self->_assetsToDownload;
  uint64_t v12 = *((void *)v4 + 1);
  if (assetsToDownload)
  {
    if (!v12) {
      goto LABEL_25;
    }
    objc_msgSend_mergeFrom_(assetsToDownload, (const char *)v4, v12);
  }
  else
  {
    if (!v12) {
      goto LABEL_25;
    }
    objc_msgSend_setAssetsToDownload_(self, (const char *)v4, v12);
  }
  id v4 = v14;
LABEL_25:
  char v13 = *((unsigned char *)v4 + 52);
  if ((v13 & 0x10) != 0)
  {
    self->_newestFirst = *((unsigned char *)v4 + 50);
    *(unsigned char *)&self->_has |= 0x10u;
    char v13 = *((unsigned char *)v4 + 52);
    if ((v13 & 4) == 0)
    {
LABEL_27:
      if ((v13 & 8) == 0) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) == 0)
  {
    goto LABEL_27;
  }
  self->_ignoreCallingDeviceChanges = *((unsigned char *)v4 + 48);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 52) & 8) != 0)
  {
LABEL_28:
    self->_includeMergeableDeltas = *((unsigned char *)v4 + 49);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_29:
  MEMORY[0x1F41817F8]();
}

- (NSData)syncContinuationToken
{
  return self->_syncContinuationToken;
}

- (void)setSyncContinuationToken:(id)a3
{
}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
}

- (CKDPRequestedFields)requestedFields
{
  return self->_requestedFields;
}

- (void)setRequestedFields:(id)a3
{
}

- (unsigned)maxChanges
{
  return self->_maxChanges;
}

- (CKDPAssetsToDownload)assetsToDownload
{
  return self->_assetsToDownload;
}

- (void)setAssetsToDownload:(id)a3
{
}

- (BOOL)newestFirst
{
  return self->_newestFirst;
}

- (BOOL)ignoreCallingDeviceChanges
{
  return self->_ignoreCallingDeviceChanges;
}

- (BOOL)includeMergeableDeltas
{
  return self->_includeMergeableDeltas;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_syncContinuationToken, 0);
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_assetsToDownload, 0);
}

@end