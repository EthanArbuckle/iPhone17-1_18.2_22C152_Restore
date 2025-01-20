@interface MTRChannelClusterAdditionalInfoStruct
- (MTRChannelClusterAdditionalInfoStruct)init;
- (NSString)name;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setName:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation MTRChannelClusterAdditionalInfoStruct

- (MTRChannelClusterAdditionalInfoStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRChannelClusterAdditionalInfoStruct;
  v2 = [(MTRChannelClusterAdditionalInfoStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_26F969DC8;

    value = v3->_value;
    v3->_value = (NSString *)&stru_26F969DC8;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRChannelClusterAdditionalInfoStruct);
  objc_super v7 = objc_msgSend_name(self, v5, v6);
  objc_msgSend_setName_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_value(self, v9, v10);
  objc_msgSend_setValue_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: name:%@ value:%@; >", v5, self->_name, self->_value);;

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end