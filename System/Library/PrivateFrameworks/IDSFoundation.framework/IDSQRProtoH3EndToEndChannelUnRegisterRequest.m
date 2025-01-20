@interface IDSQRProtoH3EndToEndChannelUnRegisterRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)e2eChannelUuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setE2eChannelUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoH3EndToEndChannelUnRegisterRequest

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoH3EndToEndChannelUnRegisterRequest;
  v4 = [(IDSQRProtoH3EndToEndChannelUnRegisterRequest *)&v13 description];
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
  return v8;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoH3EndToEndChannelUnRegisterRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_e2eChannelUuid) {
    sub_19DB7EA98();
  }
  id v5 = v4;
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  objc_msgSend_setE2eChannelUuid_(a3, a2, (uint64_t)self->_e2eChannelUuid, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = objc_msgSend_init(v8, v9, v10, v11);
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_e2eChannelUuid, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[1];
  v12[1] = v15;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7))
  {
    e2eChannelUuid = self->_e2eChannelUuid;
    uint64_t v11 = v4[1];
    if ((unint64_t)e2eChannelUuid | v11) {
      char isEqual = objc_msgSend_isEqual_(e2eChannelUuid, v8, v11, v9);
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
  return objc_msgSend_hash(self->_e2eChannelUuid, a2, v2, v3);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = *((void *)a3 + 1);
  if (v4) {
    objc_msgSend_setE2eChannelUuid_(self, a2, v4, v3);
  }
}

- (NSData)e2eChannelUuid
{
  return self->_e2eChannelUuid;
}

- (void)setE2eChannelUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end