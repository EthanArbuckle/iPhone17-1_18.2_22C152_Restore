@interface MTRAccessControlClusterAccessControlExtensionStruct
- (MTRAccessControlClusterAccessControlExtensionStruct)init;
- (NSData)data;
- (NSNumber)fabricIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setData:(NSData *)data;
- (void)setFabricIndex:(NSNumber *)fabricIndex;
@end

@implementation MTRAccessControlClusterAccessControlExtensionStruct

- (MTRAccessControlClusterAccessControlExtensionStruct)init
{
  v9.receiver = self;
  v9.super_class = (Class)MTRAccessControlClusterAccessControlExtensionStruct;
  v4 = [(MTRAccessControlClusterAccessControlExtensionStruct *)&v9 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    data = v4->_data;
    v4->_data = (NSData *)v5;

    fabricIndex = v4->_fabricIndex;
    v4->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTRAccessControlClusterAccessControlExtensionStruct);
  v7 = objc_msgSend_data(self, v5, v6);
  objc_msgSend_setData_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_fabricIndex(self, v9, v10);
  objc_msgSend_setFabricIndex_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_data, v6, 0);
  objc_super v9 = objc_msgSend_stringWithFormat_(v3, v8, @"<%@: data:%@ fabricIndex:%@; >", v5, v7, self->_fabricIndex);;

  return v9;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(NSData *)data
{
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);

  objc_storeStrong((id *)&self->_data, 0);
}

@end