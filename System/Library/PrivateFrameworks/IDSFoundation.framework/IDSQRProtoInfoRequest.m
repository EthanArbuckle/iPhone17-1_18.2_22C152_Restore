@interface IDSQRProtoInfoRequest
- (BOOL)hasAccessToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)accessToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)infoFlags;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccessToken:(id)a3;
- (void)setInfoFlags:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoInfoRequest

- (BOOL)hasAccessToken
{
  return self->_accessToken != 0;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoInfoRequest;
  v4 = [(IDSQRProtoInfoRequest *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v8 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v6, self->_infoFlags, v7);
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, @"info_flags");

  accessToken = self->_accessToken;
  if (accessToken) {
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)accessToken, v12, @"access_token");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoInfoRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_accessToken) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_infoFlags;
  accessToken = self->_accessToken;
  if (accessToken) {
    objc_msgSend_setAccessToken_(a3, a2, (uint64_t)accessToken, v3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_DWORD *)(v12 + 16) = self->_infoFlags;
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_accessToken, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v15;

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) && self->_infoFlags == *((_DWORD *)v4 + 4))
  {
    accessToken = self->_accessToken;
    uint64_t v11 = v4[1];
    if ((unint64_t)accessToken | v11) {
      char isEqual = objc_msgSend_isEqual_(accessToken, v8, v11, v9);
    }
    else {
      char isEqual = 1;
    }
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  uint64_t v4 = 2654435761 * self->_infoFlags;
  return objc_msgSend_hash(self->_accessToken, a2, v2, v3) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  self->_infoFlags = *((_DWORD *)a3 + 4);
  uint64_t v4 = *((void *)a3 + 1);
  if (v4) {
    objc_msgSend_setAccessToken_(self, a2, v4, v3);
  }
}

- (unsigned)infoFlags
{
  return self->_infoFlags;
}

- (void)setInfoFlags:(unsigned int)a3
{
  self->_infoFlags = a3;
}

- (NSData)accessToken
{
  return self->_accessToken;
}

- (void)setAccessToken:(id)a3
{
}

- (void).cxx_destruct
{
}

@end