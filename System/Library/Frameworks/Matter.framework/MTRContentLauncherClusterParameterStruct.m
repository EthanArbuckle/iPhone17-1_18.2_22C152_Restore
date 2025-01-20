@interface MTRContentLauncherClusterParameterStruct
- (MTRContentLauncherClusterParameterStruct)init;
- (NSArray)externalIDList;
- (NSNumber)type;
- (NSString)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setExternalIDList:(NSArray *)externalIDList;
- (void)setType:(NSNumber *)type;
- (void)setValue:(NSString *)value;
@end

@implementation MTRContentLauncherClusterParameterStruct

- (MTRContentLauncherClusterParameterStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRContentLauncherClusterParameterStruct;
  v2 = [(MTRContentLauncherClusterParameterStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    type = v2->_type;
    v2->_type = (NSNumber *)&unk_26F9C8620;

    value = v3->_value;
    v3->_value = (NSString *)&stru_26F969DC8;

    externalIDList = v3->_externalIDList;
    v3->_externalIDList = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRContentLauncherClusterParameterStruct);
  v7 = objc_msgSend_type(self, v5, v6);
  objc_msgSend_setType_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_value(self, v9, v10);
  objc_msgSend_setValue_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_externalIDList(self, v13, v14);
  objc_msgSend_setExternalIDList_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: type:%@; value:%@; externalIDList:%@; >",
    v5,
    self->_type,
    self->_value,
  v7 = self->_externalIDList);

  return v7;
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(NSNumber *)type
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(NSString *)value
{
}

- (NSArray)externalIDList
{
  return self->_externalIDList;
}

- (void)setExternalIDList:(NSArray *)externalIDList
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalIDList, 0);
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end