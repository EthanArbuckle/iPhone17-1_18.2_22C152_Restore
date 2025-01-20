@interface IDSQRProtoPluginControlRequest
- (BOOL)hasPluginClientRawPublicKey;
- (BOOL)hasPluginStreamId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)pluginClientRawPublicKey;
- (NSString)pluginName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)pluginOperation;
- (unsigned)pluginStreamId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPluginStreamId:(BOOL)a3;
- (void)setPluginClientRawPublicKey:(id)a3;
- (void)setPluginName:(id)a3;
- (void)setPluginOperation:(unsigned int)a3;
- (void)setPluginStreamId:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoPluginControlRequest

- (void)setPluginStreamId:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_pluginStreamId = a3;
}

- (void)setHasPluginStreamId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPluginStreamId
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPluginClientRawPublicKey
{
  return self->_pluginClientRawPublicKey != 0;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoPluginControlRequest;
  v4 = [(IDSQRProtoPluginControlRequest *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v8 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v6, self->_pluginOperation, v7);
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, @"plugin_operation");

  pluginName = self->_pluginName;
  if (pluginName) {
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)pluginName, v12, @"plugin_name");
  }
  if (*(unsigned char *)&self->_has)
  {
    v14 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v11, self->_pluginStreamId, v12);
    objc_msgSend_setObject_forKey_(v5, v15, (uint64_t)v14, v16, @"plugin_stream_id");
  }
  pluginClientRawPublicKey = self->_pluginClientRawPublicKey;
  if (pluginClientRawPublicKey) {
    objc_msgSend_setObject_forKey_(v5, v11, (uint64_t)pluginClientRawPublicKey, v12, @"plugin_client_raw_public_key");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoPluginControlRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  if (!self->_pluginName) {
    sub_19DB7E040();
  }
  PBDataWriterWriteStringField();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  v4 = v5;
  if (self->_pluginClientRawPublicKey)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  double v10 = a3;
  v10[6] = self->_pluginOperation;
  objc_msgSend_setPluginName_(v10, v4, (uint64_t)self->_pluginName, v5);
  v8 = v10;
  if (*(unsigned char *)&self->_has)
  {
    v10[7] = self->_pluginStreamId;
    *((unsigned char *)v10 + 32) |= 1u;
  }
  pluginClientRawPublicKey = self->_pluginClientRawPublicKey;
  if (pluginClientRawPublicKey)
  {
    objc_msgSend_setPluginClientRawPublicKey_(v10, v6, (uint64_t)pluginClientRawPublicKey, v7);
    v8 = v10;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_DWORD *)(v12 + 24) = self->_pluginOperation;
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_pluginName, v13, (uint64_t)a3, v14);
  double v16 = *(void **)(v12 + 16);
  *(void *)(v12 + 16) = v15;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v12 + 28) = self->_pluginStreamId;
    *(unsigned char *)(v12 + 32) |= 1u;
  }
  uint64_t v19 = objc_msgSend_copyWithZone_(self->_pluginClientRawPublicKey, v17, (uint64_t)a3, v18);
  v20 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v19;

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_12;
  }
  if (self->_pluginOperation != *((_DWORD *)v4 + 6)) {
    goto LABEL_12;
  }
  pluginName = self->_pluginName;
  uint64_t v11 = v4[2];
  if ((unint64_t)pluginName | v11)
  {
    if (!objc_msgSend_isEqual_(pluginName, v8, v11, v9)) {
      goto LABEL_12;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[4] & 1) == 0 || self->_pluginStreamId != *((_DWORD *)v4 + 7)) {
      goto LABEL_12;
    }
  }
  else if (v4[4])
  {
LABEL_12:
    char isEqual = 0;
    goto LABEL_13;
  }
  pluginClientRawPublicKey = self->_pluginClientRawPublicKey;
  uint64_t v13 = v4[1];
  if ((unint64_t)pluginClientRawPublicKey | v13) {
    char isEqual = objc_msgSend_isEqual_(pluginClientRawPublicKey, v8, v13, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_13:

  return isEqual;
}

- (unint64_t)hash
{
  unsigned int pluginOperation = self->_pluginOperation;
  uint64_t v6 = objc_msgSend_hash(self->_pluginName, a2, v2, v3);
  if (*(unsigned char *)&self->_has) {
    uint64_t v10 = 2654435761 * self->_pluginStreamId;
  }
  else {
    uint64_t v10 = 0;
  }
  return v6 ^ v10 ^ objc_msgSend_hash(self->_pluginClientRawPublicKey, v7, v8, v9) ^ (2654435761 * pluginOperation);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_unsigned int pluginOperation = *((_DWORD *)v4 + 6);
  uint64_t v7 = *((void *)v4 + 2);
  id v9 = v4;
  if (v7)
  {
    objc_msgSend_setPluginName_(self, v5, v7, v6);
    id v4 = v9;
  }
  if (*((unsigned char *)v4 + 32))
  {
    self->_pluginStreamId = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v8 = *((void *)v4 + 1);
  if (v8)
  {
    objc_msgSend_setPluginClientRawPublicKey_(self, v5, v8, v6);
    id v4 = v9;
  }
}

- (unsigned)pluginOperation
{
  return self->_pluginOperation;
}

- (void)setPluginOperation:(unsigned int)a3
{
  self->_unsigned int pluginOperation = a3;
}

- (NSString)pluginName
{
  return self->_pluginName;
}

- (void)setPluginName:(id)a3
{
}

- (unsigned)pluginStreamId
{
  return self->_pluginStreamId;
}

- (NSData)pluginClientRawPublicKey
{
  return self->_pluginClientRawPublicKey;
}

- (void)setPluginClientRawPublicKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginName, 0);
  objc_storeStrong((id *)&self->_pluginClientRawPublicKey, 0);
}

@end