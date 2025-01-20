@interface IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo
- (BOOL)hasQuicClientConnectionId;
- (BOOL)hasQuicServerConnectionId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)serverGeneratedConnectionIds;
- (NSData)quicClientConnectionId;
- (NSData)quicServerConnectionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)quicClientLinkId;
- (unsigned)quicServerLinkId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setQuicClientConnectionId:(id)a3;
- (void)setQuicClientLinkId:(unsigned int)a3;
- (void)setQuicServerConnectionId:(id)a3;
- (void)setQuicServerLinkId:(unsigned int)a3;
- (void)setServerGeneratedConnectionIds:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo

- (BOOL)hasQuicClientConnectionId
{
  return self->_quicClientConnectionId != 0;
}

- (BOOL)hasQuicServerConnectionId
{
  return self->_quicServerConnectionId != 0;
}

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo;
  v4 = [(IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v8 = v5;
  quicClientConnectionId = self->_quicClientConnectionId;
  if (quicClientConnectionId) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)quicClientConnectionId, v7, @"quic_client_connection_id");
  }
  quicServerConnectionId = self->_quicServerConnectionId;
  if (quicServerConnectionId) {
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)quicServerConnectionId, v7, @"quic_server_connection_id");
  }
  v11 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v6, self->_quicClientLinkId, v7);
  objc_msgSend_setObject_forKey_(v8, v12, (uint64_t)v11, v13, @"quic_client_link_id");

  v16 = objc_msgSend_numberWithUnsignedInt_(NSNumber, v14, self->_quicServerLinkId, v15);
  objc_msgSend_setObject_forKey_(v8, v17, (uint64_t)v16, v18, @"quic_server_link_id");

  v21 = objc_msgSend_numberWithBool_(NSNumber, v19, self->_serverGeneratedConnectionIds, v20);
  objc_msgSend_setObject_forKey_(v8, v22, (uint64_t)v21, v23, @"server_generated_connection_ids");

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_quicClientConnectionId) {
    PBDataWriterWriteDataField();
  }
  if (self->_quicServerConnectionId) {
    PBDataWriterWriteDataField();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  quicClientConnectionId = self->_quicClientConnectionId;
  id v9 = v4;
  if (quicClientConnectionId)
  {
    objc_msgSend_setQuicClientConnectionId_(v4, v5, (uint64_t)quicClientConnectionId, v6);
    id v4 = v9;
  }
  quicServerConnectionId = self->_quicServerConnectionId;
  if (quicServerConnectionId)
  {
    objc_msgSend_setQuicServerConnectionId_(v9, v5, (uint64_t)quicServerConnectionId, v6);
    id v4 = v9;
  }
  *((_DWORD *)v4 + 4) = self->_quicClientLinkId;
  *((_DWORD *)v4 + 8) = self->_quicServerLinkId;
  *((unsigned char *)v4 + 36) = self->_serverGeneratedConnectionIds;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_quicClientConnectionId, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_quicServerConnectionId, v17, (uint64_t)a3, v18);
  double v20 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v19;

  *(_DWORD *)(v12 + 16) = self->_quicClientLinkId;
  *(_DWORD *)(v12 + 32) = self->_quicServerLinkId;
  *(unsigned char *)(v12 + 36) = self->_serverGeneratedConnectionIds;
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((quicClientConnectionId = self->_quicClientConnectionId,
         uint64_t v11 = *((void *)v4 + 1),
         !((unint64_t)quicClientConnectionId | v11))
     || objc_msgSend_isEqual_(quicClientConnectionId, v8, v11, v9))
    && ((quicServerConnectionId = self->_quicServerConnectionId,
         uint64_t v13 = *((void *)v4 + 3),
         !((unint64_t)quicServerConnectionId | v13))
     || objc_msgSend_isEqual_(quicServerConnectionId, v8, v13, v9))
    && self->_quicClientLinkId == *((_DWORD *)v4 + 4)
    && self->_quicServerLinkId == *((_DWORD *)v4 + 8))
  {
    if (self->_serverGeneratedConnectionIds) {
      BOOL v14 = *((unsigned char *)v4 + 36) != 0;
    }
    else {
      BOOL v14 = *((unsigned char *)v4 + 36) == 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_quicClientConnectionId, a2, v2, v3);
  return objc_msgSend_hash(self->_quicServerConnectionId, v6, v7, v8) ^ v5 ^ (2654435761 * self->_quicClientLinkId) ^ (2654435761 * self->_quicServerLinkId) ^ (2654435761 * self->_serverGeneratedConnectionIds);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v7 = *((void *)v4 + 1);
  id v9 = v4;
  if (v7)
  {
    objc_msgSend_setQuicClientConnectionId_(self, v5, v7, v6);
    id v4 = v9;
  }
  uint64_t v8 = *((void *)v4 + 3);
  if (v8)
  {
    objc_msgSend_setQuicServerConnectionId_(self, v5, v8, v6);
    id v4 = v9;
  }
  self->_quicClientLinkId = *((_DWORD *)v4 + 4);
  self->_quicServerLinkId = *((_DWORD *)v4 + 8);
  self->_serverGeneratedConnectionIds = *((unsigned char *)v4 + 36);
}

- (NSData)quicClientConnectionId
{
  return self->_quicClientConnectionId;
}

- (void)setQuicClientConnectionId:(id)a3
{
}

- (NSData)quicServerConnectionId
{
  return self->_quicServerConnectionId;
}

- (void)setQuicServerConnectionId:(id)a3
{
}

- (unsigned)quicClientLinkId
{
  return self->_quicClientLinkId;
}

- (void)setQuicClientLinkId:(unsigned int)a3
{
  self->_quicClientLinkId = a3;
}

- (unsigned)quicServerLinkId
{
  return self->_quicServerLinkId;
}

- (void)setQuicServerLinkId:(unsigned int)a3
{
  self->_quicServerLinkId = a3;
}

- (BOOL)serverGeneratedConnectionIds
{
  return self->_serverGeneratedConnectionIds;
}

- (void)setServerGeneratedConnectionIds:(BOOL)a3
{
  self->_serverGeneratedConnectionIds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quicServerConnectionId, 0);
  objc_storeStrong((id *)&self->_quicClientConnectionId, 0);
}

@end