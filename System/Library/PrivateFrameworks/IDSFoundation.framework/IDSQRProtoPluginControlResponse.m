@interface IDSQRProtoPluginControlResponse
- (BOOL)hasPluginParticipantId;
- (BOOL)hasPluginServerCertHostname;
- (BOOL)hasPluginServerCertOid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)pluginServerCertHostname;
- (NSString)pluginServerCertOid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)pluginParticipantId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPluginParticipantId:(BOOL)a3;
- (void)setPluginParticipantId:(unint64_t)a3;
- (void)setPluginServerCertHostname:(id)a3;
- (void)setPluginServerCertOid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoPluginControlResponse

- (void)setPluginParticipantId:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_pluginParticipantId = a3;
}

- (void)setHasPluginParticipantId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPluginParticipantId
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasPluginServerCertHostname
{
  return self->_pluginServerCertHostname != 0;
}

- (BOOL)hasPluginServerCertOid
{
  return self->_pluginServerCertOid != 0;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoPluginControlResponse;
  v4 = [(IDSQRProtoPluginControlResponse *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  if (*(unsigned char *)&self->_has)
  {
    v8 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v5, self->_pluginParticipantId, v7);
    objc_msgSend_setObject_forKey_(v6, v9, (uint64_t)v8, v10, @"plugin_participant_id");
  }
  pluginServerCertHostname = self->_pluginServerCertHostname;
  if (pluginServerCertHostname) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)pluginServerCertHostname, v7, @"plugin_server_cert_hostname");
  }
  pluginServerCertOid = self->_pluginServerCertOid;
  if (pluginServerCertOid) {
    objc_msgSend_setObject_forKey_(v6, v5, (uint64_t)pluginServerCertOid, v7, @"plugin_server_cert_oid");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoPluginControlResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
  if (self->_pluginServerCertHostname)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_pluginServerCertOid)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_pluginParticipantId;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  pluginServerCertHostname = self->_pluginServerCertHostname;
  v9 = v4;
  if (pluginServerCertHostname)
  {
    objc_msgSend_setPluginServerCertHostname_(v4, v5, (uint64_t)pluginServerCertHostname, v6);
    id v4 = v9;
  }
  pluginServerCertOid = self->_pluginServerCertOid;
  if (pluginServerCertOid)
  {
    objc_msgSend_setPluginServerCertOid_(v9, v5, (uint64_t)pluginServerCertOid, v6);
    id v4 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  v15 = (void *)v12;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v12 + 8) = self->_pluginParticipantId;
    *(unsigned char *)(v12 + 32) |= 1u;
  }
  uint64_t v16 = objc_msgSend_copyWithZone_(self->_pluginServerCertHostname, v13, (uint64_t)a3, v14);
  v17 = (void *)v15[2];
  v15[2] = v16;

  uint64_t v20 = objc_msgSend_copyWithZone_(self->_pluginServerCertOid, v18, (uint64_t)a3, v19);
  v21 = (void *)v15[3];
  v15[3] = v20;

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (uint64_t *)a3;
  uint64_t v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[4] & 1) == 0 || self->_pluginParticipantId != v4[1]) {
      goto LABEL_11;
    }
  }
  else if (v4[4])
  {
LABEL_11:
    char isEqual = 0;
    goto LABEL_12;
  }
  pluginServerCertHostname = self->_pluginServerCertHostname;
  uint64_t v11 = v4[2];
  if ((unint64_t)pluginServerCertHostname | v11
    && !objc_msgSend_isEqual_(pluginServerCertHostname, v8, v11, v9))
  {
    goto LABEL_11;
  }
  pluginServerCertOid = self->_pluginServerCertOid;
  uint64_t v13 = v4[3];
  if ((unint64_t)pluginServerCertOid | v13) {
    char isEqual = objc_msgSend_isEqual_(pluginServerCertOid, v8, v13, v9);
  }
  else {
    char isEqual = 1;
  }
LABEL_12:

  return isEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_pluginParticipantId;
  }
  else {
    unint64_t v5 = 0;
  }
  uint64_t v6 = objc_msgSend_hash(self->_pluginServerCertHostname, a2, v2, v3) ^ v5;
  return v6 ^ objc_msgSend_hash(self->_pluginServerCertOid, v7, v8, v9);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (v4[4])
  {
    self->_pluginParticipantId = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v7 = v4[2];
  double v9 = v4;
  if (v7)
  {
    objc_msgSend_setPluginServerCertHostname_(self, v5, v7, v6);
    id v4 = v9;
  }
  uint64_t v8 = v4[3];
  if (v8)
  {
    objc_msgSend_setPluginServerCertOid_(self, v5, v8, v6);
    id v4 = v9;
  }
}

- (unint64_t)pluginParticipantId
{
  return self->_pluginParticipantId;
}

- (NSString)pluginServerCertHostname
{
  return self->_pluginServerCertHostname;
}

- (void)setPluginServerCertHostname:(id)a3
{
}

- (NSString)pluginServerCertOid
{
  return self->_pluginServerCertOid;
}

- (void)setPluginServerCertOid:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginServerCertOid, 0);
  objc_storeStrong((id *)&self->_pluginServerCertHostname, 0);
}

@end