@interface IDSQRProtoH3EndToEndChannelRegisterIndication
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo)channelInfo;
- (NSData)e2eChannelUuid;
- (NSData)virtualQuicClientConnectionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)txnId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChannelInfo:(id)a3;
- (void)setE2eChannelUuid:(id)a3;
- (void)setTxnId:(unint64_t)a3;
- (void)setVirtualQuicClientConnectionId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoH3EndToEndChannelRegisterIndication

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoH3EndToEndChannelRegisterIndication;
  v4 = [(IDSQRProtoH3EndToEndChannelRegisterIndication *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v8 = v5;
  e2eChannelUuid = self->_e2eChannelUuid;
  if (e2eChannelUuid) {
    objc_msgSend_setObject_forKey_(v5, v6, (uint64_t)e2eChannelUuid, v7, @"e2e_channel_uuid");
  }
  channelInfo = self->_channelInfo;
  if (channelInfo)
  {
    v11 = objc_msgSend_dictionaryRepresentation(channelInfo, v6, (uint64_t)e2eChannelUuid, v7);
    objc_msgSend_setObject_forKey_(v8, v12, (uint64_t)v11, v13, @"channel_info");
  }
  virtualQuicClientConnectionId = self->_virtualQuicClientConnectionId;
  if (virtualQuicClientConnectionId) {
    objc_msgSend_setObject_forKey_(v8, v6, (uint64_t)virtualQuicClientConnectionId, v7, @"virtual_quic_client_connection_id");
  }
  v15 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v6, self->_txnId, v7);
  objc_msgSend_setObject_forKey_(v8, v16, (uint64_t)v15, v17, @"txn_id");

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoH3EndToEndChannelRegisterIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_e2eChannelUuid) {
    sub_19DB7EAC4();
  }
  PBDataWriterWriteDataField();
  if (!self->_channelInfo) {
    sub_19DB7EAF0();
  }
  PBDataWriterWriteSubmessage();
  if (!self->_virtualQuicClientConnectionId) {
    sub_19DB7EB1C();
  }
  PBDataWriterWriteDataField();
  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  e2eChannelUuid = self->_e2eChannelUuid;
  v11 = a3;
  objc_msgSend_setE2eChannelUuid_(v11, v5, (uint64_t)e2eChannelUuid, v6);
  objc_msgSend_setChannelInfo_(v11, v7, (uint64_t)self->_channelInfo, v8);
  objc_msgSend_setVirtualQuicClientConnectionId_(v11, v9, (uint64_t)self->_virtualQuicClientConnectionId, v10);
  v11[1] = self->_txnId;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  double v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_e2eChannelUuid, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[3];
  v12[3] = v15;

  uint64_t v19 = objc_msgSend_copyWithZone_(self->_channelInfo, v17, (uint64_t)a3, v18);
  v20 = (void *)v12[2];
  v12[2] = v19;

  uint64_t v23 = objc_msgSend_copyWithZone_(self->_virtualQuicClientConnectionId, v21, (uint64_t)a3, v22);
  v24 = (void *)v12[4];
  v12[4] = v23;

  v12[1] = self->_txnId;
  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v16 = objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
     && ((e2eChannelUuid = self->_e2eChannelUuid, uint64_t v11 = v4[3], !((unint64_t)e2eChannelUuid | v11))
      || objc_msgSend_isEqual_(e2eChannelUuid, v8, v11, v9))
     && ((channelInfo = self->_channelInfo, uint64_t v13 = v4[2], !((unint64_t)channelInfo | v13))
      || objc_msgSend_isEqual_(channelInfo, v8, v13, v9))
     && ((virtualQuicClientConnectionId = self->_virtualQuicClientConnectionId,
          uint64_t v15 = v4[4],
          !((unint64_t)virtualQuicClientConnectionId | v15))
      || objc_msgSend_isEqual_(virtualQuicClientConnectionId, v8, v15, v9))
     && self->_txnId == v4[1];

  return v16;
}

- (unint64_t)hash
{
  uint64_t v5 = objc_msgSend_hash(self->_e2eChannelUuid, a2, v2, v3);
  uint64_t v9 = objc_msgSend_hash(self->_channelInfo, v6, v7, v8) ^ v5;
  return v9 ^ objc_msgSend_hash(self->_virtualQuicClientConnectionId, v10, v11, v12) ^ (2654435761u * self->_txnId);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v6 = v4[3];
  uint64_t v10 = v4;
  if (v6)
  {
    objc_msgSend_setE2eChannelUuid_(self, (const char *)v4, v6, v5);
    id v4 = v10;
  }
  channelInfo = self->_channelInfo;
  uint64_t v8 = v4[2];
  if (channelInfo)
  {
    if (!v8) {
      goto LABEL_9;
    }
    objc_msgSend_mergeFrom_(channelInfo, (const char *)v4, v8, v5);
  }
  else
  {
    if (!v8) {
      goto LABEL_9;
    }
    objc_msgSend_setChannelInfo_(self, (const char *)v4, v8, v5);
  }
  id v4 = v10;
LABEL_9:
  uint64_t v9 = v4[4];
  if (v9)
  {
    objc_msgSend_setVirtualQuicClientConnectionId_(self, (const char *)v4, v9, v5);
    id v4 = v10;
  }
  self->_txnId = v4[1];
}

- (NSData)e2eChannelUuid
{
  return self->_e2eChannelUuid;
}

- (void)setE2eChannelUuid:(id)a3
{
}

- (IDSQRProtoH3EndToEndChannelRegisterE2EChannelInfo)channelInfo
{
  return self->_channelInfo;
}

- (void)setChannelInfo:(id)a3
{
}

- (NSData)virtualQuicClientConnectionId
{
  return self->_virtualQuicClientConnectionId;
}

- (void)setVirtualQuicClientConnectionId:(id)a3
{
}

- (unint64_t)txnId
{
  return self->_txnId;
}

- (void)setTxnId:(unint64_t)a3
{
  self->_txnId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualQuicClientConnectionId, 0);
  objc_storeStrong((id *)&self->_e2eChannelUuid, 0);
  objc_storeStrong((id *)&self->_channelInfo, 0);
}

@end