@interface IDSQRProtoPutMaterialErrorIndication
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IDSQRProtoMaterialOwner)materialOwner;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)receiverParticipantId;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMaterialOwner:(id)a3;
- (void)setReceiverParticipantId:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoPutMaterialErrorIndication

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoPutMaterialErrorIndication;
  v4 = [(IDSQRProtoPutMaterialErrorIndication *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  v8 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v6, self->_receiverParticipantId, v7);
  objc_msgSend_setObject_forKey_(v5, v9, (uint64_t)v8, v10, @"receiver_participant_id");

  materialOwner = self->_materialOwner;
  if (materialOwner)
  {
    v15 = objc_msgSend_dictionaryRepresentation(materialOwner, v11, v12, v13);
    objc_msgSend_setObject_forKey_(v5, v16, (uint64_t)v15, v17, @"material_owner");
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoPutMaterialErrorIndicationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint64Field();
  if (!self->_materialOwner) {
    sub_19DB80DF0();
  }
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  *((void *)a3 + 1) = self->_receiverParticipantId;
  objc_msgSend_setMaterialOwner_(a3, a2, (uint64_t)self->_materialOwner, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  v12[1] = self->_receiverParticipantId;
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_materialOwner, v13, (uint64_t)a3, v14);
  v16 = (void *)v12[2];
  v12[2] = v15;

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) && self->_receiverParticipantId == v4[1])
  {
    materialOwner = self->_materialOwner;
    uint64_t v11 = v4[2];
    if ((unint64_t)materialOwner | v11) {
      char isEqual = objc_msgSend_isEqual_(materialOwner, v8, v11, v9);
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
  unint64_t v4 = 2654435761u * self->_receiverParticipantId;
  return objc_msgSend_hash(self->_materialOwner, a2, v2, v3) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  self->_receiverParticipantId = v4[1];
  materialOwner = self->_materialOwner;
  uint64_t v7 = v4[2];
  if (materialOwner)
  {
    if (!v7) {
      goto LABEL_7;
    }
    v8 = v4;
    objc_msgSend_mergeFrom_(materialOwner, (const char *)v4, v7, v5);
  }
  else
  {
    if (!v7) {
      goto LABEL_7;
    }
    v8 = v4;
    objc_msgSend_setMaterialOwner_(self, (const char *)v4, v7, v5);
  }
  unint64_t v4 = v8;
LABEL_7:
}

- (unint64_t)receiverParticipantId
{
  return self->_receiverParticipantId;
}

- (void)setReceiverParticipantId:(unint64_t)a3
{
  self->_receiverParticipantId = a3;
}

- (IDSQRProtoMaterialOwner)materialOwner
{
  return self->_materialOwner;
}

- (void)setMaterialOwner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end