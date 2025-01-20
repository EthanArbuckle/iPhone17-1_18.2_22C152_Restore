@interface MTRDeviceType
+ (id)deviceTypeForID:(id)a3;
- (BOOL)isUtility;
- (MTRDeviceType)initWithDeviceTypeID:(id)a3 name:(id)a4 isUtility:(BOOL)a5;
- (NSNumber)id;
- (NSString)name;
@end

@implementation MTRDeviceType

- (MTRDeviceType)initWithDeviceTypeID:(id)a3 name:(id)a4 isUtility:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)MTRDeviceType;
  v11 = [(MTRDeviceType *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_id, a3);
    objc_storeStrong((id *)&v12->_name, a4);
    v12->_isUtility = a5;
    v13 = v12;
  }

  return v12;
}

+ (id)deviceTypeForID:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ((unint64_t)objc_msgSend_unsignedLongLongValue(v3, v4, v5) >> 32)
  {
    v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v21 = objc_msgSend_unsignedLongLongValue(v3, v15, v16);
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "Invalid device type ID: 0x%llx", buf, 0xCu);
    }

    if (sub_244CC4E58(1u))
    {
      objc_msgSend_unsignedLongLongValue(v3, v17, v18);
      sub_244CC4DE0(0, 1);
    }
    uint64_t isUtility = 0;
  }
  else
  {
    int v8 = objc_msgSend_unsignedLongLongValue(v3, v6, v7);
    uint64_t isUtility = (uint64_t)sub_2447992E8(v8);
    if (isUtility)
    {
      id v10 = [MTRDeviceType alloc];
      v12 = objc_msgSend_stringWithUTF8String_(NSString, v11, *(void *)(isUtility + 8));
      uint64_t isUtility = objc_msgSend_initWithDeviceTypeID_name_isUtility_(v10, v13, (uint64_t)v3, v12, *(_DWORD *)(isUtility + 4) != 1);
    }
  }

  return (id)isUtility;
}

- (NSNumber)id
{
  return self->_id;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isUtility
{
  return self->_isUtility;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_id, 0);
}

@end