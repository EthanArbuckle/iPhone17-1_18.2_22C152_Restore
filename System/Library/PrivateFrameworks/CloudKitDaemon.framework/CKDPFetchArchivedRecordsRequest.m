@interface CKDPFetchArchivedRecordsRequest
+ (id)options;
- (BOOL)hasArchiveContinuationToken;
- (BOOL)hasAssetsToDownload;
- (BOOL)hasLimit;
- (BOOL)hasNewestFirst;
- (BOOL)hasZoneIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)newestFirst;
- (BOOL)readFrom:(id)a3;
- (CKDPAssetsToDownload)assetsToDownload;
- (CKDPRecordZoneIdentifier)zoneIdentifier;
- (Class)responseClass;
- (NSData)archiveContinuationToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)limit;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArchiveContinuationToken:(id)a3;
- (void)setAssetsToDownload:(id)a3;
- (void)setHasLimit:(BOOL)a3;
- (void)setHasNewestFirst:(BOOL)a3;
- (void)setLimit:(unsigned int)a3;
- (void)setNewestFirst:(BOOL)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPFetchArchivedRecordsRequest

+ (id)options
{
  if (qword_1EBBCDE30 != -1) {
    dispatch_once(&qword_1EBBCDE30, &unk_1F2043D90);
  }
  v2 = (void *)qword_1EBBCDE28;
  return v2;
}

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (BOOL)hasArchiveContinuationToken
{
  return self->_archiveContinuationToken != 0;
}

- (void)setNewestFirst:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_newestFirst = a3;
}

- (void)setHasNewestFirst:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNewestFirst
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLimit:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_limit = a3;
}

- (void)setHasLimit:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLimit
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAssetsToDownload
{
  return self->_assetsToDownload != 0;
}

- (id)description
{
  char v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPFetchArchivedRecordsRequest;
  v4 = [(CKDPFetchArchivedRecordsRequest *)&v11 description];
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
  archiveContinuationToken = self->_archiveContinuationToken;
  if (archiveContinuationToken) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)archiveContinuationToken, @"archiveContinuationToken");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v12 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v4, self->_newestFirst);
    objc_msgSend_setObject_forKey_(v6, v13, (uint64_t)v12, @"newestFirst");

    char has = (char)self->_has;
  }
  if (has)
  {
    v14 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E4F28ED0], v4, self->_limit);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"limit");
  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    v17 = objc_msgSend_dictionaryRepresentation(assetsToDownload, v4, (uint64_t)archiveContinuationToken);
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, @"assetsToDownload");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4EBF1DC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_archiveContinuationToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_assetsToDownload)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (unsigned)requestTypeCode
{
  return 79;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  id v10 = v4;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v4, v5, (uint64_t)zoneIdentifier);
    id v4 = v10;
  }
  archiveContinuationToken = self->_archiveContinuationToken;
  if (archiveContinuationToken)
  {
    objc_msgSend_setArchiveContinuationToken_(v10, v5, (uint64_t)archiveContinuationToken);
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 40) = self->_newestFirst;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 6) = self->_limit;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    objc_msgSend_setAssetsToDownload_(v10, v5, (uint64_t)assetsToDownload);
    id v4 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_archiveContinuationToken, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v15;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v10 + 40) = self->_newestFirst;
    *(unsigned char *)(v10 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v10 + 24) = self->_limit;
    *(unsigned char *)(v10 + 44) |= 1u;
  }
  uint64_t v19 = objc_msgSend_copyWithZone_(self->_assetsToDownload, v17, (uint64_t)a3);
  v20 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v19;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_21;
  }
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v9 = v4[4];
  if ((unint64_t)zoneIdentifier | v9)
  {
    if (!objc_msgSend_isEqual_(zoneIdentifier, v7, v9)) {
      goto LABEL_21;
    }
  }
  archiveContinuationToken = self->_archiveContinuationToken;
  uint64_t v11 = v4[1];
  if ((unint64_t)archiveContinuationToken | v11)
  {
    if (!objc_msgSend_isEqual_(archiveContinuationToken, v7, v11)) {
      goto LABEL_21;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) != 0)
    {
      if (self->_newestFirst)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_21;
        }
        goto LABEL_14;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_14;
      }
    }
LABEL_21:
    char isEqual = 0;
    goto LABEL_22;
  }
  if ((*((unsigned char *)v4 + 44) & 2) != 0) {
    goto LABEL_21;
  }
LABEL_14:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_limit != *((_DWORD *)v4 + 6)) {
      goto LABEL_21;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_21;
  }
  assetsToDownload = self->_assetsToDownload;
  uint64_t v13 = v4[2];
  if ((unint64_t)assetsToDownload | v13) {
    char isEqual = objc_msgSend_isEqual_(assetsToDownload, v7, v13);
  }
  else {
    char isEqual = 1;
  }
LABEL_22:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_zoneIdentifier, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_archiveContinuationToken, v5, v6);
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v10 = 2654435761 * self->_newestFirst;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v11 = 0;
    return v7 ^ v4 ^ v10 ^ v11 ^ objc_msgSend_hash(self->_assetsToDownload, v8, v9);
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v11 = 2654435761 * self->_limit;
  return v7 ^ v4 ^ v10 ^ v11 ^ objc_msgSend_hash(self->_assetsToDownload, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v6 = *((void *)v4 + 4);
  id v11 = v4;
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
  id v4 = v11;
LABEL_7:
  uint64_t v7 = *((void *)v4 + 1);
  if (v7)
  {
    objc_msgSend_setArchiveContinuationToken_(self, (const char *)v4, v7);
    id v4 = v11;
  }
  char v8 = *((unsigned char *)v4 + 44);
  if ((v8 & 2) != 0)
  {
    self->_newestFirst = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 2u;
    char v8 = *((unsigned char *)v4 + 44);
  }
  if (v8)
  {
    self->_limit = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  assetsToDownload = self->_assetsToDownload;
  uint64_t v10 = *((void *)v4 + 2);
  if (assetsToDownload)
  {
    if (v10) {
      objc_msgSend_mergeFrom_(assetsToDownload, (const char *)v4, v10);
    }
  }
  else if (v10)
  {
    objc_msgSend_setAssetsToDownload_(self, (const char *)v4, v10);
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

- (NSData)archiveContinuationToken
{
  return self->_archiveContinuationToken;
}

- (void)setArchiveContinuationToken:(id)a3
{
}

- (BOOL)newestFirst
{
  return self->_newestFirst;
}

- (unsigned)limit
{
  return self->_limit;
}

- (CKDPAssetsToDownload)assetsToDownload
{
  return self->_assetsToDownload;
}

- (void)setAssetsToDownload:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneIdentifier, 0);
  objc_storeStrong((id *)&self->_assetsToDownload, 0);
  objc_storeStrong((id *)&self->_archiveContinuationToken, 0);
}

@end