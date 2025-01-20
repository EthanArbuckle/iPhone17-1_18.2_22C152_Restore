@interface CKCDPCodeServiceRequestServiceClientConfig
- (BOOL)hasHost;
- (BOOL)hasPort;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)host;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)port;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPort:(BOOL)a3;
- (void)setHost:(id)a3;
- (void)setPort:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCDPCodeServiceRequestServiceClientConfig

- (BOOL)hasHost
{
  return self->_host != 0;
}

- (void)setPort:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_port = a3;
}

- (void)setHasPort:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPort
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKCDPCodeServiceRequestServiceClientConfig;
  v4 = [(CKCDPCodeServiceRequestServiceClientConfig *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  host = self->_host;
  if (host) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)host, @"host");
  }
  if (*(unsigned char *)&self->_has)
  {
    v8 = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E4F28ED0], v5, self->_port);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, @"port");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4F6E8A8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_host)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  host = self->_host;
  if (host)
  {
    id v7 = v4;
    objc_msgSend_setHost_(v4, v5, (uint64_t)host);
    id v4 = v7;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_port;
    *((unsigned char *)v4 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  id v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_host, v11, (uint64_t)a3);
  v13 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 16) = self->_port;
    *(unsigned char *)(v10 + 20) |= 1u;
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
  host = self->_host;
  uint64_t v9 = v4[1];
  if ((unint64_t)host | v9)
  {
    if (!objc_msgSend_isEqual_(host, v7, v9)) {
      goto LABEL_8;
    }
  }
  BOOL v10 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) != 0 && self->_port == *((_DWORD *)v4 + 4))
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
  uint64_t v4 = objc_msgSend_hash(self->_host, a2, v2);
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_port;
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
    objc_msgSend_setHost_(self, v5, v6);
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 20))
  {
    self->_port = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (unsigned)port
{
  return self->_port;
}

- (void).cxx_destruct
{
}

@end