@interface CKDPQueryRetrieveRequest
+ (id)options;
- (BOOL)hasAssetsToDownload;
- (BOOL)hasContinuationMarker;
- (BOOL)hasLimit;
- (BOOL)hasQuery;
- (BOOL)hasRequestedFields;
- (BOOL)hasZoneIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKDPAssetsToDownload)assetsToDownload;
- (CKDPQuery)query;
- (CKDPRecordZoneIdentifier)zoneIdentifier;
- (CKDPRequestedFields)requestedFields;
- (Class)responseClass;
- (NSData)continuationMarker;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)limit;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetsToDownload:(id)a3;
- (void)setContinuationMarker:(id)a3;
- (void)setHasLimit:(BOOL)a3;
- (void)setLimit:(unsigned int)a3;
- (void)setQuery:(id)a3;
- (void)setRequestedFields:(id)a3;
- (void)setZoneIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPQueryRetrieveRequest

+ (id)options
{
  if (qword_1EBBCDF00 != -1) {
    dispatch_once(&qword_1EBBCDF00, &unk_1F20444F0);
  }
  v2 = (void *)qword_1EBBCDEF8;
  return v2;
}

- (BOOL)hasQuery
{
  return self->_query != 0;
}

- (BOOL)hasContinuationMarker
{
  return self->_continuationMarker != 0;
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

- (BOOL)hasZoneIdentifier
{
  return self->_zoneIdentifier != 0;
}

- (BOOL)hasRequestedFields
{
  return self->_requestedFields != 0;
}

- (BOOL)hasAssetsToDownload
{
  return self->_assetsToDownload != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPQueryRetrieveRequest;
  v4 = [(CKDPQueryRetrieveRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  query = self->_query;
  if (query)
  {
    v8 = objc_msgSend_dictionaryRepresentation(query, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"query");
  }
  continuationMarker = self->_continuationMarker;
  if (continuationMarker) {
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)continuationMarker, @"continuationMarker");
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v11 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E4F28ED0], v4, self->_limit);
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)v11, @"limit");
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    v14 = objc_msgSend_dictionaryRepresentation(zoneIdentifier, v4, (uint64_t)continuationMarker);
    objc_msgSend_setObject_forKey_(v6, v15, (uint64_t)v14, @"zoneIdentifier");
  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    v17 = objc_msgSend_dictionaryRepresentation(requestedFields, v4, (uint64_t)continuationMarker);
    objc_msgSend_setObject_forKey_(v6, v18, (uint64_t)v17, @"requestedFields");
  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    v20 = objc_msgSend_dictionaryRepresentation(assetsToDownload, v4, (uint64_t)continuationMarker);
    objc_msgSend_setObject_forKey_(v6, v21, (uint64_t)v20, @"assetsToDownload");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F73280((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_query)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_continuationMarker)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
  if (self->_zoneIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_requestedFields)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_assetsToDownload)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (unsigned)requestTypeCode
{
  return 11;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  query = self->_query;
  id v11 = v4;
  if (query)
  {
    objc_msgSend_setQuery_(v4, v5, (uint64_t)query);
    id v4 = v11;
  }
  continuationMarker = self->_continuationMarker;
  if (continuationMarker)
  {
    objc_msgSend_setContinuationMarker_(v11, v5, (uint64_t)continuationMarker);
    id v4 = v11;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 6) = self->_limit;
    *((unsigned char *)v4 + 56) |= 1u;
  }
  zoneIdentifier = self->_zoneIdentifier;
  if (zoneIdentifier)
  {
    objc_msgSend_setZoneIdentifier_(v11, v5, (uint64_t)zoneIdentifier);
    id v4 = v11;
  }
  requestedFields = self->_requestedFields;
  if (requestedFields)
  {
    objc_msgSend_setRequestedFields_(v11, v5, (uint64_t)requestedFields);
    id v4 = v11;
  }
  assetsToDownload = self->_assetsToDownload;
  if (assetsToDownload)
  {
    objc_msgSend_setAssetsToDownload_(v11, v5, (uint64_t)assetsToDownload);
    id v4 = v11;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_query, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 32);
  *(void *)(v10 + 32) = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_continuationMarker, v14, (uint64_t)a3);
  v16 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v15;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 24) = self->_limit;
    *(unsigned char *)(v10 + 56) |= 1u;
  }
  uint64_t v18 = objc_msgSend_copyWithZone_(self->_zoneIdentifier, v17, (uint64_t)a3);
  v19 = *(void **)(v10 + 48);
  *(void *)(v10 + 48) = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_requestedFields, v20, (uint64_t)a3);
  v22 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v21;

  uint64_t v24 = objc_msgSend_copyWithZone_(self->_assetsToDownload, v23, (uint64_t)a3);
  v25 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v24;

  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_17;
  }
  query = self->_query;
  uint64_t v9 = v4[4];
  if ((unint64_t)query | v9)
  {
    if (!objc_msgSend_isEqual_(query, v7, v9)) {
      goto LABEL_17;
    }
  }
  continuationMarker = self->_continuationMarker;
  uint64_t v11 = v4[2];
  if ((unint64_t)continuationMarker | v11)
  {
    if (!objc_msgSend_isEqual_(continuationMarker, v7, v11)) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[7] & 1) == 0 || self->_limit != *((_DWORD *)v4 + 6)) {
      goto LABEL_17;
    }
  }
  else if (v4[7])
  {
LABEL_17:
    char isEqual = 0;
    goto LABEL_18;
  }
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v13 = v4[6];
  if ((unint64_t)zoneIdentifier | v13 && !objc_msgSend_isEqual_(zoneIdentifier, v7, v13)) {
    goto LABEL_17;
  }
  requestedFields = self->_requestedFields;
  uint64_t v15 = v4[5];
  if ((unint64_t)requestedFields | v15)
  {
    if (!objc_msgSend_isEqual_(requestedFields, v7, v15)) {
      goto LABEL_17;
    }
  }
  assetsToDownload = self->_assetsToDownload;
  uint64_t v17 = v4[1];
  if ((unint64_t)assetsToDownload | v17) {
    char isEqual = objc_msgSend_isEqual_(assetsToDownload, v7, v17);
  }
  else {
    char isEqual = 1;
  }
LABEL_18:

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_query, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_continuationMarker, v5, v6);
  if (*(unsigned char *)&self->_has) {
    uint64_t v10 = 2654435761 * self->_limit;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = v7 ^ v4 ^ v10 ^ objc_msgSend_hash(self->_zoneIdentifier, v8, v9);
  uint64_t v14 = objc_msgSend_hash(self->_requestedFields, v12, v13);
  return v11 ^ v14 ^ objc_msgSend_hash(self->_assetsToDownload, v15, v16);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  query = self->_query;
  uint64_t v6 = *((void *)v4 + 4);
  id v14 = v4;
  if (query)
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_mergeFrom_(query, (const char *)v4, v6);
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    objc_msgSend_setQuery_(self, (const char *)v4, v6);
  }
  id v4 = v14;
LABEL_7:
  uint64_t v7 = *((void *)v4 + 2);
  if (v7)
  {
    objc_msgSend_setContinuationMarker_(self, (const char *)v4, v7);
    id v4 = v14;
  }
  if (*((unsigned char *)v4 + 56))
  {
    self->_limit = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  zoneIdentifier = self->_zoneIdentifier;
  uint64_t v9 = *((void *)v4 + 6);
  if (zoneIdentifier)
  {
    if (!v9) {
      goto LABEL_17;
    }
    objc_msgSend_mergeFrom_(zoneIdentifier, (const char *)v4, v9);
  }
  else
  {
    if (!v9) {
      goto LABEL_17;
    }
    objc_msgSend_setZoneIdentifier_(self, (const char *)v4, v9);
  }
  id v4 = v14;
LABEL_17:
  requestedFields = self->_requestedFields;
  uint64_t v11 = *((void *)v4 + 5);
  if (requestedFields)
  {
    if (!v11) {
      goto LABEL_23;
    }
    objc_msgSend_mergeFrom_(requestedFields, (const char *)v4, v11);
  }
  else
  {
    if (!v11) {
      goto LABEL_23;
    }
    objc_msgSend_setRequestedFields_(self, (const char *)v4, v11);
  }
  id v4 = v14;
LABEL_23:
  assetsToDownload = self->_assetsToDownload;
  uint64_t v13 = *((void *)v4 + 1);
  if (assetsToDownload)
  {
    if (v13) {
      objc_msgSend_mergeFrom_(assetsToDownload, (const char *)v4, v13);
    }
  }
  else if (v13)
  {
    objc_msgSend_setAssetsToDownload_(self, (const char *)v4, v13);
  }
  MEMORY[0x1F41817F8]();
}

- (CKDPQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSData)continuationMarker
{
  return self->_continuationMarker;
}

- (void)setContinuationMarker:(id)a3
{
}

- (unsigned)limit
{
  return self->_limit;
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
  objc_storeStrong((id *)&self->_requestedFields, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_continuationMarker, 0);
  objc_storeStrong((id *)&self->_assetsToDownload, 0);
}

@end