@interface IDSQRProtoH3EndToEndChannelRegisterAckResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
@end

@implementation IDSQRProtoH3EndToEndChannelRegisterAckResponse

- (id)description
{
  v3 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)IDSQRProtoH3EndToEndChannelRegisterAckResponse;
  v4 = [(IDSQRProtoH3EndToEndChannelRegisterAckResponse *)&v13 description];
  v8 = objc_msgSend_dictionaryRepresentation(self, v5, v6, v7);
  v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ %@", v10, v4, v8);

  return v11;
}

- (id)dictionaryRepresentation
{
  return (id)objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
}

- (BOOL)readFrom:(id)a3
{
  return IDSQRProtoH3EndToEndChannelRegisterAckResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_class();
  double v7 = objc_msgSend_allocWithZone_(v4, v5, (uint64_t)a3, v6);
  return (id)objc_msgSend_init(v7, v8, v9, v10);
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  char isMemberOfClass = objc_msgSend_isMemberOfClass_(v3, v5, v4, v6);

  return isMemberOfClass;
}

- (unint64_t)hash
{
  return 0;
}

@end