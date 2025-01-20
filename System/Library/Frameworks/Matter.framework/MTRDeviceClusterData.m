@interface MTRDeviceClusterData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClusterData:(id)a3;
- (MTRDeviceClusterData)init;
- (MTRDeviceClusterData)initWithCoder:(id)a3;
- (MTRDeviceClusterData)initWithDataVersion:(id)a3 attributes:(id)a4;
- (NSDictionary)attributes;
- (NSNumber)dataVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)removeValueForAttribute:(id)a3;
- (void)setDataVersion:(id)a3;
- (void)storeValue:(id)a3 forAttribute:(id)a4;
@end

@implementation MTRDeviceClusterData

- (void)storeValue:(id)a3 forAttribute:(id)a4
{
}

- (void)removeValueForAttribute:(id)a3
{
}

- (NSDictionary)attributes
{
  return (NSDictionary *)self->_attributes;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  dataVersion = self->_dataVersion;
  uint64_t v5 = objc_msgSend_count(self->_attributes, a2, v2);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, @"<MTRDeviceClusterData: dataVersion %@ attributes count %lu>", dataVersion, v5);
}

- (MTRDeviceClusterData)init
{
  return (MTRDeviceClusterData *)objc_msgSend_initWithDataVersion_attributes_(self, a2, 0, 0);
}

- (MTRDeviceClusterData)initWithDataVersion:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MTRDeviceClusterData;
  v10 = [(MTRDeviceClusterData *)&v23 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v8, v9);
    dataVersion = v10->_dataVersion;
    v10->_dataVersion = (NSNumber *)v11;

    v13 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v16 = objc_msgSend_count(v7, v14, v15);
    uint64_t v18 = objc_msgSend_dictionaryWithCapacity_(v13, v17, v16);
    attributes = v10->_attributes;
    v10->_attributes = (NSMutableDictionary *)v18;

    objc_msgSend_addEntriesFromDictionary_(v10->_attributes, v20, (uint64_t)v7);
    v21 = v10;
  }

  return v10;
}

- (MTRDeviceClusterData)initWithCoder:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MTRDeviceClusterData;
  uint64_t v5 = [(MTRDeviceClusterData *)&v26 init];
  if (!v5) {
    goto LABEL_16;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v8 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, @"dataVersion");
  dataVersion = v5->_dataVersion;
  v5->_dataVersion = (NSNumber *)v8;

  if (v5->_dataVersion)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v15 = v5->_dataVersion;
        *(_DWORD *)buf = 138412290;
        v28 = v15;
        _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "MTRDeviceClusterData got %@ for data version, not NSNumber.", buf, 0xCu);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_16;
      }
LABEL_15:
      sub_244CC4DE0(0, 1);
LABEL_16:
      v13 = 0;
      goto LABEL_17;
    }
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_268EBE950, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_268EBE950))
  {
    v19 = (void *)MEMORY[0x263EFFA08];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    qword_268EBE948 = objc_msgSend_setWithObjects_(v19, v25, v20, v21, v22, v23, v24, 0);
    __cxa_guard_release(&qword_268EBE950);
  }
  uint64_t v11 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v10, qword_268EBE948, @"attributes");
  attributes = v5->_attributes;
  v5->_attributes = (NSMutableDictionary *)v11;

  if (v5->_attributes)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v16 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = v5->_attributes;
        *(_DWORD *)buf = 138412290;
        v28 = v17;
        _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_ERROR, "MTRDeviceClusterData got %@ for attributes, not NSDictionary.", buf, 0xCu);
      }

      if (!sub_244CC4E58(1u)) {
        goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
  v13 = v5;
LABEL_17:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  uint64_t v6 = objc_msgSend_dataVersion(self, v4, v5);
  objc_msgSend_encodeObject_forKey_(v12, v7, (uint64_t)v6, @"dataVersion");

  v10 = objc_msgSend_attributes(self, v8, v9);
  objc_msgSend_encodeObject_forKey_(v12, v11, (uint64_t)v10, @"attributes");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [MTRDeviceClusterData alloc];
  attributes = self->_attributes;
  dataVersion = self->_dataVersion;

  return (id)objc_msgSend_initWithDataVersion_attributes_(v4, v5, (uint64_t)dataVersion, attributes);
}

- (BOOL)isEqualToClusterData:(id)a3
{
  id v4 = a3;
  dataVersion = self->_dataVersion;
  uint64_t v8 = objc_msgSend_dataVersion(v4, v6, v7);
  if (sub_2446BE670(dataVersion, v8))
  {
    attributes = self->_attributes;
    id v12 = objc_msgSend_attributes(v4, v9, v10);
    char v13 = sub_2446BE670(attributes, v12);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class()) {
    char isEqualToClusterData = objc_msgSend_isEqualToClusterData_(self, v6, (uint64_t)v4);
  }
  else {
    char isEqualToClusterData = 0;
  }

  return isEqualToClusterData;
}

- (NSNumber)dataVersion
{
  return self->_dataVersion;
}

- (void)setDataVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataVersion, 0);

  objc_storeStrong((id *)&self->_attributes, 0);
}

@end