@interface MTRMediaInputClusterInputInfoStruct
- (MTRMediaInputClusterInputInfoStruct)init;
- (NSNumber)index;
- (NSNumber)inputType;
- (NSString)descriptionString;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setDescriptionString:(NSString *)descriptionString;
- (void)setIndex:(NSNumber *)index;
- (void)setInputType:(NSNumber *)inputType;
- (void)setName:(NSString *)name;
@end

@implementation MTRMediaInputClusterInputInfoStruct

- (MTRMediaInputClusterInputInfoStruct)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRMediaInputClusterInputInfoStruct;
  v2 = [(MTRMediaInputClusterInputInfoStruct *)&v9 init];
  v3 = v2;
  if (v2)
  {
    index = v2->_index;
    v2->_index = (NSNumber *)&unk_26F9C8620;

    inputType = v3->_inputType;
    v3->_inputType = (NSNumber *)&unk_26F9C8620;

    name = v3->_name;
    v3->_name = (NSString *)&stru_26F969DC8;

    descriptionString = v3->_descriptionString;
    v3->_descriptionString = (NSString *)&stru_26F969DC8;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRMediaInputClusterInputInfoStruct);
  v7 = objc_msgSend_index(self, v5, v6);
  objc_msgSend_setIndex_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_inputType(self, v9, v10);
  objc_msgSend_setInputType_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_name(self, v13, v14);
  objc_msgSend_setName_(v4, v16, (uint64_t)v15);

  v19 = objc_msgSend_descriptionString(self, v17, v18);
  objc_msgSend_setDescriptionString_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: index:%@; inputType:%@; name:%@; descriptionString:%@; >",
    v5,
    self->_index,
    self->_inputType,
    self->_name,
  v7 = self->_descriptionString);

  return v7;
}

- (NSNumber)index
{
  return self->_index;
}

- (void)setIndex:(NSNumber *)index
{
}

- (NSNumber)inputType
{
  return self->_inputType;
}

- (void)setInputType:(NSNumber *)inputType
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (NSString)descriptionString
{
  return self->_descriptionString;
}

- (void)setDescriptionString:(NSString *)descriptionString
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_inputType, 0);

  objc_storeStrong((id *)&self->_index, 0);
}

@end