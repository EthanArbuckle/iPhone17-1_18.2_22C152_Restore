@interface CKDPNotificationMarkReadRequest
+ (id)options;
- (BOOL)hasUuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (Class)responseClass;
- (NSString)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)requestTypeCode;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setUuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CKDPNotificationMarkReadRequest

+ (id)options
{
  if (qword_1EBBD0138 != -1) {
    dispatch_once(&qword_1EBBD0138, &unk_1F2044A90);
  }
  v2 = (void *)qword_1EBBD0130;
  return v2;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (id)description
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)CKDPNotificationMarkReadRequest;
  v4 = [(CKDPNotificationMarkReadRequest *)&v11 description];
  v7 = objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v9 = objc_msgSend_stringWithFormat_(v3, v8, @"%@ %@", v4, v7);

  return v9;
}

- (id)dictionaryRepresentation
{
  v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2);
  uint64_t v6 = v4;
  uuid = self->_uuid;
  if (uuid) {
    objc_msgSend_setObject_forKey_(v4, v5, (uint64_t)uuid, @"uuid");
  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1C4FFA3CC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_uuid) {
    PBDataWriterWriteStringField();
  }
}

- (unsigned)requestTypeCode
{
  return 66;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  uuid = self->_uuid;
  if (uuid) {
    objc_msgSend_setUuid_(a3, a2, (uint64_t)uuid);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_opt_class();
  v7 = objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  uint64_t v12 = objc_msgSend_copyWithZone_(self->_uuid, v11, (uint64_t)a3);
  v13 = (void *)v10[1];
  v10[1] = v12;

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (objc_msgSend_isMemberOfClass_(v4, v6, v5))
  {
    uuid = self->_uuid;
    uint64_t v9 = v4[1];
    if ((unint64_t)uuid | v9) {
      char isEqual = objc_msgSend_isEqual_(uuid, v7, v9);
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
  return objc_msgSend_hash(self->_uuid, a2, v2);
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3 = *((void *)a3 + 1);
  if (v3) {
    objc_msgSend_setUuid_(self, a2, v3);
  }
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end