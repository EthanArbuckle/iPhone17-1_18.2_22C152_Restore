@interface IDSQRProtoQuicConnectionInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)quicConnectionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)quicConnectionTypeAsString:(int)a3;
- (int)StringAsQuicConnectionType:(id)a3;
- (int)quicConnectionType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setQuicConnectionId:(id)a3;
- (void)setQuicConnectionType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation IDSQRProtoQuicConnectionInfo

- (id)quicConnectionTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v5 = @"IDS";
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, a2, @"(unknown: %i)", v4, a3);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = @"AVC";
  }
  return v5;
}

- (int)StringAsQuicConnectionType:(id)a3
{
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"AVC", v5)) {
    int isEqualToString = 0;
  }
  else {
    int isEqualToString = objc_msgSend_isEqualToString_(v3, v6, @"IDS", v7);
  }

  return isEqualToString;
}

- (id)description
{
  id v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoQuicConnectionInfo;
  double v4 = [(IDSQRProtoQuicConnectionInfo *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  int quicConnectionType = self->_quicConnectionType;
  if (quicConnectionType)
  {
    if (quicConnectionType == 1)
    {
      v9 = @"IDS";
      objc_msgSend_setObject_forKey_(v6, v5, @"IDS", v7, @"quic_connection_type");
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, v5, @"(unknown: %i)", v7, self->_quicConnectionType);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v6, v10, (uint64_t)v9, v11, @"quic_connection_type");
    }
  }
  else
  {
    v9 = @"AVC";
    objc_msgSend_setObject_forKey_(v6, v5, @"AVC", v7, @"quic_connection_type");
  }

  quicConnectionId = self->_quicConnectionId;
  if (quicConnectionId) {
    objc_msgSend_setObject_forKey_(v6, v12, (uint64_t)quicConnectionId, v13, @"quic_connection_id");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoQuicConnectionInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_quicConnectionId) {
    sub_19DB826D4();
  }
  PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 4) = self->_quicConnectionType;
  objc_msgSend_setQuicConnectionId_(a3, a2, (uint64_t)self->_quicConnectionId, v3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = objc_opt_class();
  v8 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  uint64_t v12 = objc_msgSend_init(v8, v9, v10, v11);
  *(_DWORD *)(v12 + 16) = self->_quicConnectionType;
  uint64_t v15 = objc_msgSend_copyWithZone_(self->_quicConnectionId, v13, (uint64_t)a3, v14);
  v16 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = v15;

  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5, v7) && self->_quicConnectionType == *((_DWORD *)v4 + 4))
  {
    quicConnectionId = self->_quicConnectionId;
    uint64_t v11 = v4[1];
    if ((unint64_t)quicConnectionId | v11) {
      char isEqual = objc_msgSend_isEqual_(quicConnectionId, v8, v11, v9);
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
  uint64_t v4 = 2654435761 * self->_quicConnectionType;
  return objc_msgSend_hash(self->_quicConnectionId, a2, v2, v3) ^ v4;
}

- (void)mergeFrom:(id)a3
{
  self->_int quicConnectionType = *((_DWORD *)a3 + 4);
  uint64_t v4 = *((void *)a3 + 1);
  if (v4) {
    objc_msgSend_setQuicConnectionId_(self, a2, v4, v3);
  }
}

- (int)quicConnectionType
{
  return self->_quicConnectionType;
}

- (void)setQuicConnectionType:(int)a3
{
  self->_int quicConnectionType = a3;
}

- (NSData)quicConnectionId
{
  return self->_quicConnectionId;
}

- (void)setQuicConnectionId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end