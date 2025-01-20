@interface CKDPZoneRetrieveChangesRequest
+ (id)options;
- (BOOL)hasMaxChangedZones;
- (BOOL)hasSyncContinuationToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (NSData)syncContinuationToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)maxChangedZones;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasMaxChangedZones:(BOOL)a3;
- (void)setMaxChangedZones:(unsigned int)a3;
- (void)setSyncContinuationToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPZoneRetrieveChangesRequest

+ (id)options
{
  if (qword_1EBBCDF20 != -1) {
    dispatch_once(&qword_1EBBCDF20, &unk_1F2044C50);
  }
  v2 = (void *)qword_1EBBCDF18;
  return v2;
}

- (BOOL)hasSyncContinuationToken
{
  return self->_syncContinuationToken != 0;
}

- (void)setMaxChangedZones:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_maxChangedZones = a3;
}

- (void)setHasMaxChangedZones:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMaxChangedZones
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPZoneRetrieveChangesRequest;
  v4 = [(CKDPZoneRetrieveChangesRequest *)&v11 description];
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
  if (*(unsigned char *)&self->_has)
  {
    v8 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E4F28ED0], v5, self->_maxChangedZones);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"maxChangedZones");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C50328E8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_syncContinuationToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (unsigned)requestTypeCode
{
  return 48;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  syncContinuationToken = self->_syncContinuationToken;
  if (syncContinuationToken)
  {
    id v7 = v4;
    objc_msgSend_setSyncContinuationToken_(v4, v5, (uint64_t)syncContinuationToken);
    id v4 = v7;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_maxChangedZones;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  id v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_syncContinuationToken, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 16);
  *(void *)(v10 + 16) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 8) = self->_maxChangedZones;
    *(unsigned char *)(v10 + 24) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_8;
  }
  syncContinuationToken = self->_syncContinuationToken;
  uint64_t v9 = v4[2];
  if ((unint64_t)syncContinuationToken | v9)
  {
    if (!objc_msgSend_isEqual_(syncContinuationToken, v7, v9)) {
      goto LABEL_8;
    }
  }
  BOOL v10 = (v4[3] & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[3] & 1) != 0 && self->_maxChangedZones == *((_DWORD *)v4 + 2))
    {
      BOOL v10 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v10 = 0;
  }
LABEL_9:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_syncContinuationToken, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_maxChangedZones;
  }
  else {
    uint64_t v5 = 0;
  }
  return v5 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v6 = *((void *)v4 + 2);
  if (v6)
  {
    id v7 = v4;
    objc_msgSend_setSyncContinuationToken_(self, v5, v6);
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 24))
  {
    self->_maxChangedZones = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)syncContinuationToken
{
  return self->_syncContinuationToken;
}

- (void)setSyncContinuationToken:(id)a3
{
}

- (unsigned)maxChangedZones
{
  return self->_maxChangedZones;
}

- (void).cxx_destruct
{
}

@end