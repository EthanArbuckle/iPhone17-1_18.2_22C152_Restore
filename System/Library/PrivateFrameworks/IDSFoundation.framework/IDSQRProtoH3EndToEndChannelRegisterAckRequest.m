@interface IDSQRProtoH3EndToEndChannelRegisterAckRequest
- (BOOL)accept;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)e2eChannelUuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccept:(BOOL)a3;
- (void)setE2eChannelUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoH3EndToEndChannelRegisterAckRequest

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoH3EndToEndChannelRegisterAckRequest;
  v4 = [(IDSQRProtoH3EndToEndChannelRegisterAckRequest *)&v13 description];
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
  double v10 = objc_msgSend_numberWithBool_(NSNumber, v6, self->_accept, v7);
  objc_msgSend_setObject_forKey_(v8, v11, (uint64_t)v10, v12, @"accept");

  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoH3EndToEndChannelRegisterAckRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_e2eChannelUuid) {
    sub_19DB82700();
  }
  id v5 = v4;
  PBDataWriterWriteDataField();
  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  e2eChannelUuid = self->_e2eChannelUuid;
  double v7 = a3;
  objc_msgSend_setE2eChannelUuid_(v7, v5, (uint64_t)e2eChannelUuid, v6);
  v7[16] = self->_accept;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_e2eChannelUuid, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v15;

  *(unsigned char *)(v12 + 16) = self->_accept;
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7)
    && ((e2eChannelUuid = self->_e2eChannelUuid, uint64_t v11 = *((void *)v4 + 1), !((unint64_t)e2eChannelUuid | v11))
     || objc_msgSend_isEqual_(e2eChannelUuid, v8, v11, v9)))
  {
    if (self->_accept) {
      BOOL v12 = *((unsigned char *)v4 + 16) != 0;
    }
    else {
      BOOL v12 = *((unsigned char *)v4 + 16) == 0;
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  return (2654435761 * self->_accept) ^ objc_msgSend_hash(self->_e2eChannelUuid, a2, v2, v3);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  uint64_t v7 = *((void *)v4 + 1);
  if (v7)
  {
    id v8 = v4;
    objc_msgSend_setE2eChannelUuid_(self, v5, v7, v6);
    id v4 = v8;
  }
  self->_accept = *((unsigned char *)v4 + 16);
}

- (NSData)e2eChannelUuid
{
  return self->_e2eChannelUuid;
}

- (void)setE2eChannelUuid:(id)a3
{
}

- (BOOL)accept
{
  return self->_accept;
}

- (void)setAccept:(BOOL)a3
{
  self->_accept = a3;
}

- (void).cxx_destruct
{
}

@end