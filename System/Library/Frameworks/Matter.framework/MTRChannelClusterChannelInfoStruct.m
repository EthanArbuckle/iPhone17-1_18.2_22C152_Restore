@interface MTRChannelClusterChannelInfoStruct
- (MTRChannelClusterChannelInfoStruct)init;
- (NSNumber)majorNumber;
- (NSNumber)minorNumber;
- (NSNumber)type;
- (NSString)affiliateCallSign;
- (NSString)callSign;
- (NSString)identifier;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAffiliateCallSign:(NSString *)affiliateCallSign;
- (void)setCallSign:(NSString *)callSign;
- (void)setIdentifier:(id)a3;
- (void)setMajorNumber:(NSNumber *)majorNumber;
- (void)setMinorNumber:(NSNumber *)minorNumber;
- (void)setName:(NSString *)name;
- (void)setType:(id)a3;
@end

@implementation MTRChannelClusterChannelInfoStruct

- (MTRChannelClusterChannelInfoStruct)init
{
  v12.receiver = self;
  v12.super_class = (Class)MTRChannelClusterChannelInfoStruct;
  v2 = [(MTRChannelClusterChannelInfoStruct *)&v12 init];
  v3 = v2;
  if (v2)
  {
    majorNumber = v2->_majorNumber;
    v2->_majorNumber = (NSNumber *)&unk_26F9C8620;

    minorNumber = v3->_minorNumber;
    v3->_minorNumber = (NSNumber *)&unk_26F9C8620;

    name = v3->_name;
    v3->_name = 0;

    callSign = v3->_callSign;
    v3->_callSign = 0;

    affiliateCallSign = v3->_affiliateCallSign;
    v3->_affiliateCallSign = 0;

    identifier = v3->_identifier;
    v3->_identifier = 0;

    type = v3->_type;
    v3->_type = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRChannelClusterChannelInfoStruct);
  v7 = objc_msgSend_majorNumber(self, v5, v6);
  objc_msgSend_setMajorNumber_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_minorNumber(self, v9, v10);
  objc_msgSend_setMinorNumber_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_name(self, v13, v14);
  objc_msgSend_setName_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_callSign(self, v17, v18);
  objc_msgSend_setCallSign_(v4, v20, (uint64_t)v19);

  v23 = objc_msgSend_affiliateCallSign(self, v21, v22);
  objc_msgSend_setAffiliateCallSign_(v4, v24, (uint64_t)v23);

  v27 = objc_msgSend_identifier(self, v25, v26);
  objc_msgSend_setIdentifier_(v4, v28, (uint64_t)v27);

  v31 = objc_msgSend_type(self, v29, v30);
  objc_msgSend_setType_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: majorNumber:%@; minorNumber:%@; name:%@; callSign:%@; affiliateCallSign:%@; identifier:%@; type:%@; >",
    v5,
    self->_majorNumber,
    self->_minorNumber,
    self->_name,
    self->_callSign,
    self->_affiliateCallSign,
    self->_identifier,
  v7 = self->_type);

  return v7;
}

- (NSNumber)majorNumber
{
  return self->_majorNumber;
}

- (void)setMajorNumber:(NSNumber *)majorNumber
{
}

- (NSNumber)minorNumber
{
  return self->_minorNumber;
}

- (void)setMinorNumber:(NSNumber *)minorNumber
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (NSString)callSign
{
  return self->_callSign;
}

- (void)setCallSign:(NSString *)callSign
{
}

- (NSString)affiliateCallSign
{
  return self->_affiliateCallSign;
}

- (void)setAffiliateCallSign:(NSString *)affiliateCallSign
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_affiliateCallSign, 0);
  objc_storeStrong((id *)&self->_callSign, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_minorNumber, 0);

  objc_storeStrong((id *)&self->_majorNumber, 0);
}

@end