@interface MTRAudioOutputClusterOutputInfoStruct
- (MTRAudioOutputClusterOutputInfoStruct)init;
- (NSNumber)index;
- (NSNumber)outputType;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setIndex:(NSNumber *)index;
- (void)setName:(NSString *)name;
- (void)setOutputType:(NSNumber *)outputType;
@end

@implementation MTRAudioOutputClusterOutputInfoStruct

- (MTRAudioOutputClusterOutputInfoStruct)init
{
  v8.receiver = self;
  v8.super_class = (Class)MTRAudioOutputClusterOutputInfoStruct;
  v2 = [(MTRAudioOutputClusterOutputInfoStruct *)&v8 init];
  v3 = v2;
  if (v2)
  {
    index = v2->_index;
    v2->_index = (NSNumber *)&unk_26F9C8620;

    outputType = v3->_outputType;
    v3->_outputType = (NSNumber *)&unk_26F9C8620;

    name = v3->_name;
    v3->_name = (NSString *)&stru_26F969DC8;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRAudioOutputClusterOutputInfoStruct);
  v7 = objc_msgSend_index(self, v5, v6);
  objc_msgSend_setIndex_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_outputType(self, v9, v10);
  objc_msgSend_setOutputType_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_name(self, v13, v14);
  objc_msgSend_setName_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend_stringWithFormat_(v3, v6, @"<%@: index:%@; outputType:%@; name:%@; >",
    v5,
    self->_index,
    self->_outputType,
  v7 = self->_name);

  return v7;
}

- (NSNumber)index
{
  return self->_index;
}

- (void)setIndex:(NSNumber *)index
{
}

- (NSNumber)outputType
{
  return self->_outputType;
}

- (void)setOutputType:(NSNumber *)outputType
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
  objc_storeStrong((id *)&self->_outputType, 0);

  objc_storeStrong((id *)&self->_index, 0);
}

@end