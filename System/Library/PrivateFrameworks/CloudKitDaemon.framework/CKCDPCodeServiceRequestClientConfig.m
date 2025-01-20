@interface CKCDPCodeServiceRequestClientConfig
- (BOOL)hasConfig;
- (BOOL)hasServiceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CKCDPCodeServiceRequestServiceClientConfig)config;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)serviceTypeAsString:(int)a3;
- (int)StringAsServiceType:(id)a3;
- (int)serviceType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfig:(id)a3;
- (void)setHasServiceType:(BOOL)a3;
- (void)setServiceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKCDPCodeServiceRequestClientConfig

- (int)serviceType
{
  if (*(unsigned char *)&self->_has) {
    return self->_serviceType;
  }
  else {
    return 1;
  }
}

- (void)setServiceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_serviceType = a3;
}

- (void)setHasServiceType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasServiceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)serviceTypeAsString:(int)a3
{
  if ((a3 - 1) >= 6)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E64F88A0[a3 - 1];
  }
  return v3;
}

- (int)StringAsServiceType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"PUSH"))
  {
    int v6 = 1;
  }
  else if (objc_msgSend_isEqualToString_(v3, v5, @"DATABASE"))
  {
    int v6 = 2;
  }
  else if (objc_msgSend_isEqualToString_(v3, v7, @"CONTENT"))
  {
    int v6 = 3;
  }
  else if (objc_msgSend_isEqualToString_(v3, v8, @"CALDAV"))
  {
    int v6 = 4;
  }
  else if (objc_msgSend_isEqualToString_(v3, v9, @"ESCROWPROXY"))
  {
    int v6 = 5;
  }
  else if (objc_msgSend_isEqualToString_(v3, v10, @"QUOTA"))
  {
    int v6 = 6;
  }
  else
  {
    int v6 = 1;
  }

  return v6;
}

- (BOOL)hasConfig
{
  return self->_config != 0;
}

- (id)description
{
  id v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKCDPCodeServiceRequestClientConfig;
  v4 = [(CKCDPCodeServiceRequestClientConfig *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v7 = self->_serviceType - 1;
    if (v7 >= 6)
    {
      objc_msgSend_stringWithFormat_(NSString, v4, @"(unknown: %i)", self->_serviceType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E64F88A0[v7];
    }
    objc_msgSend_setObject_forKey_(v6, v4, (uint64_t)v8, @"serviceType");
  }
  config = self->_config;
  if (config)
  {
    v10 = objc_msgSend_dictionaryRepresentation(config, v4, v5);
    objc_msgSend_setObject_forKey_(v6, v11, (uint64_t)v10, @"config");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C5018444((uint64_t)self, (uint64_t)a3);
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
  if (self->_config)
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
    v4[4] = self->_serviceType;
    *((unsigned char *)v4 + 20) |= 1u;
  }
  config = self->_config;
  if (config)
  {
    unsigned int v7 = v4;
    objc_msgSend_setConfig_(v4, v5, (uint64_t)config);
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  unsigned int v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  uint64_t v10 = objc_msgSend_init(v7, v8, v9);
  v12 = (void *)v10;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v10 + 16) = self->_serviceType;
    *(unsigned char *)(v10 + 20) |= 1u;
  }
  uint64_t v13 = objc_msgSend_copyWithZone_(self->_config, v11, (uint64_t)a3);
  v14 = (void *)v12[1];
  v12[1] = v13;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5)) {
    goto LABEL_9;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_serviceType != *((_DWORD *)v4 + 4)) {
      goto LABEL_9;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_9:
    char isEqual = 0;
    goto LABEL_10;
  }
  config = self->_config;
  uint64_t v9 = v4[1];
  if ((unint64_t)config | v9) {
    char isEqual = objc_msgSend_isEqual_(config, v7, v9);
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
    uint64_t v3 = 2654435761 * self->_serviceType;
  }
  else {
    uint64_t v3 = 0;
  }
  return objc_msgSend_hash(self->_config, a2, v2) ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = (const char *)a3;
  uint64_t v5 = v4;
  if (v4[20])
  {
    self->_serviceType = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  config = self->_config;
  uint64_t v7 = *((void *)v5 + 1);
  if (config)
  {
    if (v7) {
      objc_msgSend_mergeFrom_(config, v5, v7);
    }
  }
  else if (v7)
  {
    objc_msgSend_setConfig_(self, v5, v7);
  }
  MEMORY[0x1F41817F8]();
}

- (CKCDPCodeServiceRequestServiceClientConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

@end