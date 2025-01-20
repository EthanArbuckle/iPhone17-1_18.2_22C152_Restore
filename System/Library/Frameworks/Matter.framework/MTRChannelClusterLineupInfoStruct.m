@interface MTRChannelClusterLineupInfoStruct
- (MTRChannelClusterLineupInfoStruct)init;
- (NSNumber)lineupInfoType;
- (NSString)lineupName;
- (NSString)operatorName;
- (NSString)postalCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setLineupInfoType:(NSNumber *)lineupInfoType;
- (void)setLineupName:(NSString *)lineupName;
- (void)setOperatorName:(NSString *)operatorName;
- (void)setPostalCode:(NSString *)postalCode;
@end

@implementation MTRChannelClusterLineupInfoStruct

- (MTRChannelClusterLineupInfoStruct)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRChannelClusterLineupInfoStruct;
  v2 = [(MTRChannelClusterLineupInfoStruct *)&v9 init];
  v3 = v2;
  if (v2)
  {
    operatorName = v2->_operatorName;
    v2->_operatorName = (NSString *)&stru_26F969DC8;

    lineupName = v3->_lineupName;
    v3->_lineupName = 0;

    postalCode = v3->_postalCode;
    v3->_postalCode = 0;

    lineupInfoType = v3->_lineupInfoType;
    v3->_lineupInfoType = (NSNumber *)&unk_26F9C8620;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRChannelClusterLineupInfoStruct);
  v7 = objc_msgSend_operatorName(self, v5, v6);
  objc_msgSend_setOperatorName_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_lineupName(self, v9, v10);
  objc_msgSend_setLineupName_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_postalCode(self, v13, v14);
  objc_msgSend_setPostalCode_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_lineupInfoType(self, v17, v18);
  objc_msgSend_setLineupInfoType_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: operatorName:%@; lineupName:%@; postalCode:%@; lineupInfoType:%@; >",
    v5,
    self->_operatorName,
    self->_lineupName,
    self->_postalCode,
  v7 = self->_lineupInfoType);

  return v7;
}

- (NSString)operatorName
{
  return self->_operatorName;
}

- (void)setOperatorName:(NSString *)operatorName
{
}

- (NSString)lineupName
{
  return self->_lineupName;
}

- (void)setLineupName:(NSString *)lineupName
{
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(NSString *)postalCode
{
}

- (NSNumber)lineupInfoType
{
  return self->_lineupInfoType;
}

- (void)setLineupInfoType:(NSNumber *)lineupInfoType
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lineupInfoType, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_lineupName, 0);

  objc_storeStrong((id *)&self->_operatorName, 0);
}

@end