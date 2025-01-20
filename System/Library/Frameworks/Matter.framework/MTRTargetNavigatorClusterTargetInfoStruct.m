@interface MTRTargetNavigatorClusterTargetInfoStruct
- (MTRTargetNavigatorClusterTargetInfoStruct)init;
- (NSNumber)identifier;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setIdentifier:(NSNumber *)identifier;
- (void)setName:(NSString *)name;
@end

@implementation MTRTargetNavigatorClusterTargetInfoStruct

- (MTRTargetNavigatorClusterTargetInfoStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRTargetNavigatorClusterTargetInfoStruct;
  v2 = [(MTRTargetNavigatorClusterTargetInfoStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = (NSNumber *)&unk_26F9C8620;

    name = v3->_name;
    v3->_name = (NSString *)&stru_26F969DC8;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRTargetNavigatorClusterTargetInfoStruct);
  objc_super v7 = objc_msgSend_identifier(self, v5, v6);
  objc_msgSend_setIdentifier_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_name(self, v9, v10);
  objc_msgSend_setName_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: identifier:%@; name:%@; >",
    v5,
    self->_identifier,
  objc_super v7 = self->_name);

  return v7;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(NSNumber *)identifier
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end