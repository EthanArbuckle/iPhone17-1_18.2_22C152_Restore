@interface MTRContentLauncherClusterAdditionalInfoStruct
- (MTRContentLauncherClusterAdditionalInfoStruct)init;
- (NSString)name;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setName:(NSString *)name;
- (void)setValue:(NSString *)value;
@end

@implementation MTRContentLauncherClusterAdditionalInfoStruct

- (MTRContentLauncherClusterAdditionalInfoStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRContentLauncherClusterAdditionalInfoStruct;
  v2 = [(MTRContentLauncherClusterAdditionalInfoStruct *)&v7 init];
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
  v4 = objc_alloc_init(MTRContentLauncherClusterAdditionalInfoStruct);
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

- (void)setName:(NSString *)name
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(NSString *)value
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end