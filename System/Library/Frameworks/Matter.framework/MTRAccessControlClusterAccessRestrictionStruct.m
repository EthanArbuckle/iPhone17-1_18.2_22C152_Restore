@interface MTRAccessControlClusterAccessRestrictionStruct
- (MTRAccessControlClusterAccessRestrictionStruct)init;
- (NSNumber)id;
- (NSNumber)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setId:(id)a3;
- (void)setType:(id)a3;
@end

@implementation MTRAccessControlClusterAccessRestrictionStruct

- (MTRAccessControlClusterAccessRestrictionStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRAccessControlClusterAccessRestrictionStruct;
  v2 = [(MTRAccessControlClusterAccessRestrictionStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    type = v2->_type;
    v2->_type = (NSNumber *)&unk_26F9C8620;

    id = v3->_id;
    v3->_id = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRAccessControlClusterAccessRestrictionStruct);
  objc_super v7 = objc_msgSend_type(self, v5, v6);
  objc_msgSend_setType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_id(self, v9, v10);
  objc_msgSend_setId_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: type:%@ id:%@; >", v5, self->_type, self->_id);;

  return v7;
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSNumber)id
{
  return self->_id;
}

- (void)setId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_id, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end