@interface CKDPCodeFunctionInvokeResponseAttestationResponseAttestation
- (BOOL)hasAppQuote;
- (BOOL)hasAqeQuote;
- (BOOL)hasPckCertificate;
- (BOOL)hasRoutingToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)appQuote;
- (NSData)aqeQuote;
- (NSData)routingToken;
- (NSString)pckCertificate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppQuote:(id)a3;
- (void)setAqeQuote:(id)a3;
- (void)setPckCertificate:(id)a3;
- (void)setRoutingToken:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPCodeFunctionInvokeResponseAttestationResponseAttestation

- (BOOL)hasAppQuote
{
  return self->_appQuote != 0;
}

- (BOOL)hasAqeQuote
{
  return self->_aqeQuote != 0;
}

- (BOOL)hasPckCertificate
{
  return self->_pckCertificate != 0;
}

- (BOOL)hasRoutingToken
{
  return self->_routingToken != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPCodeFunctionInvokeResponseAttestationResponseAttestation;
  v4 = [(CKDPCodeFunctionInvokeResponseAttestationResponseAttestation *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  appQuote = self->_appQuote;
  if (appQuote) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)appQuote, @"appQuote");
  }
  aqeQuote = self->_aqeQuote;
  if (aqeQuote) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)aqeQuote, @"aqeQuote");
  }
  pckCertificate = self->_pckCertificate;
  if (pckCertificate) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)pckCertificate, @"pckCertificate");
  }
  routingToken = self->_routingToken;
  if (routingToken) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)routingToken, @"routingToken");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E6CF78((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_appQuote)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_aqeQuote)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_pckCertificate)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_routingToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  appQuote = self->_appQuote;
  id v10 = v4;
  if (appQuote)
  {
    objc_msgSend_setAppQuote_(v4, v5, (uint64_t)appQuote);
    id v4 = v10;
  }
  aqeQuote = self->_aqeQuote;
  if (aqeQuote)
  {
    objc_msgSend_setAqeQuote_(v10, v5, (uint64_t)aqeQuote);
    id v4 = v10;
  }
  pckCertificate = self->_pckCertificate;
  if (pckCertificate)
  {
    objc_msgSend_setPckCertificate_(v10, v5, (uint64_t)pckCertificate);
    id v4 = v10;
  }
  routingToken = self->_routingToken;
  if (routingToken)
  {
    objc_msgSend_setRoutingToken_(v10, v5, (uint64_t)routingToken);
    id v4 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  id v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_appQuote, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  uint64_t v15 = objc_msgSend_copyWithZone_(self->_aqeQuote, v14, (uint64_t)a3);
  v16 = (void *)v10[2];
  v10[2] = v15;

  uint64_t v18 = objc_msgSend_copyWithZone_(self->_pckCertificate, v17, (uint64_t)a3);
  v19 = (void *)v10[3];
  v10[3] = v18;

  uint64_t v21 = objc_msgSend_copyWithZone_(self->_routingToken, v20, (uint64_t)a3);
  v22 = (void *)v10[4];
  v10[4] = v21;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5)
    && ((appQuote = self->_appQuote, uint64_t v9 = v4[1], !((unint64_t)appQuote | v9))
     || objc_msgSend_isEqual_(appQuote, v7, v9))
    && ((aqeQuote = self->_aqeQuote, uint64_t v11 = v4[2], !((unint64_t)aqeQuote | v11))
     || objc_msgSend_isEqual_(aqeQuote, v7, v11))
    && ((pckCertificate = self->_pckCertificate, uint64_t v13 = v4[3], !((unint64_t)pckCertificate | v13))
     || objc_msgSend_isEqual_(pckCertificate, v7, v13)))
  {
    routingToken = self->_routingToken;
    uint64_t v15 = v4[4];
    if ((unint64_t)routingToken | v15) {
      char isEqual = objc_msgSend_isEqual_(routingToken, v7, v15);
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
  uint64_t v4 = objc_msgSend_hash(self->_appQuote, a2, v2);
  uint64_t v7 = objc_msgSend_hash(self->_aqeQuote, v5, v6) ^ v4;
  uint64_t v10 = objc_msgSend_hash(self->_pckCertificate, v8, v9);
  return v7 ^ v10 ^ objc_msgSend_hash(self->_routingToken, v11, v12);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v9 = a3;
  uint64_t v5 = v9[1];
  if (v5) {
    objc_msgSend_setAppQuote_(self, v4, v5);
  }
  uint64_t v6 = v9[2];
  if (v6) {
    objc_msgSend_setAqeQuote_(self, v4, v6);
  }
  uint64_t v7 = v9[3];
  if (v7) {
    objc_msgSend_setPckCertificate_(self, v4, v7);
  }
  uint64_t v8 = v9[4];
  if (v8) {
    objc_msgSend_setRoutingToken_(self, v4, v8);
  }
}

- (NSData)appQuote
{
  return self->_appQuote;
}

- (void)setAppQuote:(id)a3
{
}

- (NSData)aqeQuote
{
  return self->_aqeQuote;
}

- (void)setAqeQuote:(id)a3
{
}

- (NSString)pckCertificate
{
  return self->_pckCertificate;
}

- (void)setPckCertificate:(id)a3
{
}

- (NSData)routingToken
{
  return self->_routingToken;
}

- (void)setRoutingToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingToken, 0);
  objc_storeStrong((id *)&self->_pckCertificate, 0);
  objc_storeStrong((id *)&self->_aqeQuote, 0);
  objc_storeStrong((id *)&self->_appQuote, 0);
}

@end