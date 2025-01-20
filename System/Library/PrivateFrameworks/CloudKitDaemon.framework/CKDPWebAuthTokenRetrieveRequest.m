@interface CKDPWebAuthTokenRetrieveRequest
+ (id)options;
- (BOOL)forceFetchToken;
- (BOOL)hasApiToken;
- (BOOL)hasForceFetchToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (NSString)apiToken;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setApiToken:(id)a3;
- (void)setForceFetchToken:(BOOL)a3;
- (void)setHasForceFetchToken:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPWebAuthTokenRetrieveRequest

+ (id)options
{
  if (qword_1EBBCDE00 != -1) {
    dispatch_once(&qword_1EBBCDE00, &unk_1F2043770);
  }
  v2 = (void *)qword_1EBBCDDF8;
  return v2;
}

- (BOOL)hasApiToken
{
  return self->_apiToken != 0;
}

- (void)setForceFetchToken:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_forceFetchToken = a3;
}

- (void)setHasForceFetchToken:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasForceFetchToken
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPWebAuthTokenRetrieveRequest;
  v4 = [(CKDPWebAuthTokenRetrieveRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  apiToken = self->_apiToken;
  if (apiToken) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)apiToken, @"apiToken");
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = objc_msgSend_numberWithBool_(MEMORY[0x1E4F28ED0], v5, self->_forceFetchToken);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"forceFetchToken");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4E88D14((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_apiToken)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (unsigned)requestTypeCode
{
  return 54;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  apiToken = self->_apiToken;
  if (apiToken)
  {
    v7 = v4;
    objc_msgSend_setApiToken_(v4, v5, (uint64_t)apiToken);
    id v4 = v7;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_forceFetchToken;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_apiToken, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v10 + 16) = self->_forceFetchToken;
    *(unsigned char *)(v10 + 20) |= 1u;
  }
  return (id)v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_6;
  }
  apiToken = self->_apiToken;
  uint64_t v9 = v4[1];
  if ((unint64_t)apiToken | v9)
  {
    if (!objc_msgSend_isEqual_(apiToken, v7, v9)) {
      goto LABEL_6;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v10 = 0;
      goto LABEL_7;
    }
    if (self->_forceFetchToken)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v10 = 1;
  }
LABEL_7:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_apiToken, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_forceFetchToken;
  }
  else {
    uint64_t v5 = 0;
  }
  return v5 ^ v4;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v6 = *((void *)v4 + 1);
  if (v6)
  {
    id v7 = v4;
    objc_msgSend_setApiToken_(self, v5, v6);
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 20))
  {
    self->_forceFetchToken = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)apiToken
{
  return self->_apiToken;
}

- (void)setApiToken:(id)a3
{
}

- (BOOL)forceFetchToken
{
  return self->_forceFetchToken;
}

- (void).cxx_destruct
{
}

@end