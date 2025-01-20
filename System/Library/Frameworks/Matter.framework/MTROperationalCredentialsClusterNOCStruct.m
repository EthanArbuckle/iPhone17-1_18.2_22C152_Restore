@interface MTROperationalCredentialsClusterNOCStruct
- (MTROperationalCredentialsClusterNOCStruct)init;
- (NSData)icac;
- (NSData)noc;
- (NSNumber)fabricIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setFabricIndex:(NSNumber *)fabricIndex;
- (void)setIcac:(NSData *)icac;
- (void)setNoc:(NSData *)noc;
@end

@implementation MTROperationalCredentialsClusterNOCStruct

- (MTROperationalCredentialsClusterNOCStruct)init
{
  v10.receiver = self;
  v10.super_class = (Class)MTROperationalCredentialsClusterNOCStruct;
  v4 = [(MTROperationalCredentialsClusterNOCStruct *)&v10 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_data(MEMORY[0x263EFF8F8], v2, v3);
    noc = v4->_noc;
    v4->_noc = (NSData *)v5;

    icac = v4->_icac;
    v4->_icac = 0;

    fabricIndex = v4->_fabricIndex;
    v4->_fabricIndex = (NSNumber *)&unk_26F9C8620;
  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(MTROperationalCredentialsClusterNOCStruct);
  v7 = objc_msgSend_noc(self, v5, v6);
  objc_msgSend_setNoc_(v4, v8, (uint64_t)v7);

  v11 = objc_msgSend_icac(self, v9, v10);
  objc_msgSend_setIcac_(v4, v12, (uint64_t)v11);

  v15 = objc_msgSend_fabricIndex(self, v13, v14);
  objc_msgSend_setFabricIndex_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v7 = objc_msgSend_base64EncodedStringWithOptions_(self->_noc, v6, 0);
  v9 = objc_msgSend_base64EncodedStringWithOptions_(self->_icac, v8, 0);
  objc_msgSend_stringWithFormat_(v3, v10, @"<%@: noc:%@; icac:%@; fabricIndex:%@; >",
    v5,
    v7,
    v9,
  v11 = self->_fabricIndex);

  return v11;
}

- (NSData)noc
{
  return self->_noc;
}

- (void)setNoc:(NSData *)noc
{
}

- (NSData)icac
{
  return self->_icac;
}

- (void)setIcac:(NSData *)icac
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
  objc_storeStrong((id *)&self->_icac, 0);

  objc_storeStrong((id *)&self->_noc, 0);
}

@end