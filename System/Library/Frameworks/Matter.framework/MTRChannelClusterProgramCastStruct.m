@interface MTRChannelClusterProgramCastStruct
- (MTRChannelClusterProgramCastStruct)init;
- (NSString)name;
- (NSString)role;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setName:(id)a3;
- (void)setRole:(id)a3;
@end

@implementation MTRChannelClusterProgramCastStruct

- (MTRChannelClusterProgramCastStruct)init
{
  v7.receiver = self;
  v7.super_class = (Class)MTRChannelClusterProgramCastStruct;
  v2 = [(MTRChannelClusterProgramCastStruct *)&v7 init];
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_26F969DC8;

    role = v3->_role;
    v3->_role = (NSString *)&stru_26F969DC8;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRChannelClusterProgramCastStruct);
  objc_super v7 = objc_msgSend_name(self, v5, v6);
  objc_msgSend_setName_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_role(self, v9, v10);
  objc_msgSend_setRole_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_super v7 = objc_msgSend_stringWithFormat_(v3, v6, @"<%@: name:%@ role:%@; >", v5, self->_name, self->_role);;

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)role
{
  return self->_role;
}

- (void)setRole:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_role, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end