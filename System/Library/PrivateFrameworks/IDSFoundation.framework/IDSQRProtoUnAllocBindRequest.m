@interface IDSQRProtoUnAllocBindRequest
- (BOOL)hasClientContextBlob;
- (BOOL)hasReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDSQRProtoMaterial)clientContextBlob;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)reasonAsString:(int)a3;
- (int)StringAsReason:(id)a3;
- (int)reason;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClientContextBlob:(id)a3;
- (void)setHasReason:(BOOL)a3;
- (void)setReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoUnAllocBindRequest

- (int)reason
{
  if (*(unsigned char *)&self->_has) {
    return self->_reason;
  }
  else {
    return 0;
  }
}

- (void)setReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_reason = a3;
}

- (void)setHasReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)reasonAsString:(int)a3
{
  if (a3 >= 4)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v3, a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = off_1E59753A0[a3];
  }
  return v4;
}

- (int)StringAsReason:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"VOLUNTARY_LEAVE", v5))
  {
    int v8 = 0;
  }
  else if (objc_msgSend_isEqualToString_(v3, v6, @"CLIENT_LEAVING", v7))
  {
    int v8 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"GO_AWAY_INDICATION", v10))
  {
    int v8 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v11, @"CLIENT_REINITIATE", v12))
  {
    int v8 = 3;
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (BOOL)hasClientContextBlob
{
  return self->_clientContextBlob != 0;
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoUnAllocBindRequest;
  v4 = [(IDSQRProtoUnAllocBindRequest *)&v13 description];
  int v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  double v7 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  if (*(unsigned char *)&self->_has)
  {
    uint64_t reason = self->_reason;
    if (reason >= 4)
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", v8, self->_reason);
      double v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v10 = off_1E59753A0[reason];
    }
    objc_msgSend_setObject_forKey_(v7, v5, (uint64_t)v10, v8, @"reason");
  }
  clientContextBlob = self->_clientContextBlob;
  if (clientContextBlob)
  {
    double v12 = objc_msgSend_dictionaryRepresentation(clientContextBlob, v5, v6, v8);
    objc_msgSend_setObject_forKey_(v7, v13, (uint64_t)v12, v14, @"client_context_blob");
  }
  return v7;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoUnAllocBindRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_clientContextBlob)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_reason;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  clientContextBlob = self->_clientContextBlob;
  if (clientContextBlob)
  {
    double v8 = v4;
    objc_msgSend_setClientContextBlob_(v4, v5, (uint64_t)clientContextBlob, v6);
    id v4 = v8;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  double v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (void *)v12;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v12 + 16) = self->_reason;
    *(unsigned char *)(v12 + 20) |= 1u;
  }
  uint64_t v16 = objc_msgSend_copyWithZone_(self->_clientContextBlob, v13, (uint64_t)a3, v14);
  v17 = (void *)v15[1];
  v15[1] = v16;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_reason != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char isEqual = 0;
    goto LABEL_10;
  }
  clientContextBlob = self->_clientContextBlob;
  uint64_t v11 = v4[1];
  if ((unint64_t)clientContextBlob | v11) {
    char isEqual = objc_msgSend_isEqual_(clientContextBlob, v8, v11, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_10:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_reason;
  }
  else {
    uint64_t v4 = 0;
  }
  return objc_msgSend_hash(self->_clientContextBlob, a2, v2, v3) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  double v6 = v4;
  if (v4[5])
  {
    self->_uint64_t reason = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  clientContextBlob = self->_clientContextBlob;
  uint64_t v8 = v6[1];
  if (clientContextBlob)
  {
    if (!v8) {
      goto LABEL_9;
    }
    double v9 = v6;
    objc_msgSend_mergeFrom_(clientContextBlob, (const char *)v6, v8, v5);
  }
  else
  {
    if (!v8) {
      goto LABEL_9;
    }
    double v9 = v6;
    objc_msgSend_setClientContextBlob_(self, (const char *)v6, v8, v5);
  }
  double v6 = v9;
LABEL_9:
}

- (IDSQRProtoMaterial)clientContextBlob
{
  return self->_clientContextBlob;
}

- (void)setClientContextBlob:(id)a3
{
}

- (void).cxx_destruct
{
}

@end