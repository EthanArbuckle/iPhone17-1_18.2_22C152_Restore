@interface CKDPZoneRetrieveRequest
+ (id)options;
- (BOOL)hasContinuationMarker;
- (BOOL)hasOnlyFetchPCSInfo;
- (BOOL)hasSkipContinuation;
- (BOOL)hasZoneIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)onlyFetchPCSInfo;
- (BOOL)readFrom:(id)a3;
- (BOOL)skipContinuation;
- (CKDPRecordZoneIdentifier)zoneIdentifier;
- (Class)responseClass;
- (NSData)continuationMarker;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContinuationMarker:(id)a3;
- (void)setHasOnlyFetchPCSInfo:(BOOL)a3;
- (void)setHasSkipContinuation:(BOOL)a3;
- (void)setOnlyFetchPCSInfo:(BOOL)a3;
- (void)setSkipContinuation:(BOOL)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPZoneRetrieveRequest

+ (id)options
{
  if (qword_1EBBCDCF0 != -1) {
    dispatch_once(&qword_1EBBCDCF0, &unk_1F2042E50);
  }
  v2 = (void *)qword_1EBBCDCE8;
  return v2;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (void)setOnlyFetchPCSInfo:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_onlyFetchPCSInfo = a3;
}

- (void)setHasOnlyFetchPCSInfo:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOnlyFetchPCSInfo
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasContinuationMarker
{
  return self->_continuationMarker != 0;
}

- (void)setSkipContinuation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_skipContinuation = a3;
}

- (void)setHasSkipContinuation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSkipContinuation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPZoneRetrieveRequest;
  v4 = [(CKDPZoneRetrieveRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    v8 = objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"zoneIdentifier");
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_onlyFetchPCSInfo);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"onlyFetchPCSInfo");
  }
  continuationMarker = self->_continuationMarker;
  if (continuationMarker) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)continuationMarker, @"continuationMarker");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v13 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_skipContinuation);
    objc_msgSend_setObject_forKey_(v6, v14, (uint64_t)v13, @"skipContinuation");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4DA3680((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_continuationMarker)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (unsigned)requestTypeCode
{
  return 9;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  v8 = v4;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v4, v5, (uint64_t)zoneIdentifier);
    id v4 = v8;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_onlyFetchPCSInfo;
    v4[28] |= 1u;
  }
  continuationMarker = self->_continuationMarker;
  if (continuationMarker)
  {
    objc_msgSend_setContinuationMarker_(v8, v5, (uint64_t)continuationMarker);
    id v4 = v8;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[25] = self->_skipContinuation;
    v4[28] |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v10 + 24) = self->_onlyFetchPCSInfo;
    *(unsigned char *)(v10 + 28) |= 1u;
  }
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_continuationMarker, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v15;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v10 + 25) = self->_skipContinuation;
    *(unsigned char *)(v10 + 28) |= 2u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_17;
  }
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v9 = v4[2];
  if ((unint64_t)zoneIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(zoneIdentifier, v7, v9)) {
      goto LABEL_17;
    }
  }
  char has = (char)self->_has;
  char v11 = *((unsigned char *)v4 + 28);
  if (has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0) {
      goto LABEL_17;
    }
    if (self->_onlyFetchPCSInfo)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_17;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
    goto LABEL_17;
  }
  continuationMarker = self->_continuationMarker;
  uint64_t v13 = v4[1];
  if ((unint64_t)continuationMarker | v13)
  {
    if (!objc_msgSend_isEqual_(continuationMarker, v7, v13)) {
      goto LABEL_17;
    }
    char has = (char)self->_has;
    char v11 = *((unsigned char *)v4 + 28);
  }
  BOOL v14 = (v11 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v11 & 2) != 0)
    {
      if (self->_skipContinuation)
      {
        if (!*((unsigned char *)v4 + 25)) {
          goto LABEL_17;
        }
      }
      else if (*((unsigned char *)v4 + 25))
      {
        goto LABEL_17;
      }
      BOOL v14 = 1;
      goto LABEL_18;
    }
LABEL_17:
    BOOL v14 = 0;
  }
LABEL_18:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v6 = objc_msgSend_hash(self->_zoneIdentifier, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v7 = 2654435761 * self->_onlyFetchPCSInfo;
  }
  else {
    uint64_t v7 = 0;
  }
  uint64_t v8 = objc_msgSend_hash(self->_continuationMarker, v4, v5);
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v9 = 2654435761 * self->_skipContinuation;
  }
  else {
    uint64_t v9 = 0;
  }
  return v7 ^ v6 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v6 = *((void *)v4 + 2);
  id v8 = v4;
  if (zoneIdentifier)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setZoneIdentifier_(self, (const char *)v4, v6);
  }
  id v4 = v8;
LABEL_7:
  if (*((unsigned char *)v4 + 28))
  {
    self->_onlyFetchPCSInfo = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v7 = *((void *)v4 + 1);
  if (v7)
  {
    objc_msgSend_setContinuationMarker_(self, (const char *)v4, v7);
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 28) & 2) != 0)
  {
    self->_skipContinuation = *((unsigned char *)v4 + 25);
    *(unsigned char *)&self->_has |= 2u;
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPRecordZoneIdentifier)zoneIdentifier
{
  return self->_zoneIdentifier;
}

- (void)setZoneIdentifier:(id)a3
{
}

- (BOOL)onlyFetchPCSInfo
{
  return self->_onlyFetchPCSInfo;
}

- (NSData)continuationMarker
{
  return self->_continuationMarker;
}

- (void)setContinuationMarker:(id)a3
{
}

- (BOOL)skipContinuation
{
  return self->_skipContinuation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_continuationMarker, 0);
}

@end