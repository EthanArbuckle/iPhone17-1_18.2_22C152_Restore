@interface CKObjCClass
+ (id)classForHandle:(Class)a3;
+ (id)classForObject:(id)a3;
- (CKObjCClass)initWithHandle:(Class)a3;
- (Class)handle;
- (NSArray)properties;
- (NSString)name;
- (id)description;
- (id)propertyForName:(id)a3;
@end

@implementation CKObjCClass

+ (id)classForHandle:(Class)a3
{
  v4 = NSStringFromClass(a3);
  if (qword_1EB279C98 != -1) {
    dispatch_once(&qword_1EB279C98, &unk_1ED7EF298);
  }
  id v5 = (id)qword_1EB279CA0;
  objc_sync_enter(v5);
  v8 = objc_msgSend_objectForKey_((void *)qword_1EB279CA0, v6, (uint64_t)v4, v7);
  if (!v8)
  {
    v9 = [CKObjCClass alloc];
    v8 = objc_msgSend_initWithHandle_(v9, v10, (uint64_t)a3, v11);
    objc_msgSend_setObject_forKey_((void *)qword_1EB279CA0, v12, (uint64_t)v8, (uint64_t)v4);
  }
  objc_sync_exit(v5);

  return v8;
}

+ (id)classForObject:(id)a3
{
  uint64_t v4 = objc_opt_class();

  return (id)objc_msgSend_classForHandle_(CKObjCClass, v3, v4, v5);
}

- (CKObjCClass)initWithHandle:(Class)a3
{
  uint64_t v5 = NSStringFromClass(a3);
  unsigned int outCount = 0;
  v6 = class_copyPropertyList(a3, &outCount);
  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v10 = objc_msgSend_initWithCapacity_(v7, v8, outCount, v9);
  if (outCount)
  {
    for (unint64_t i = 0; i < outCount; ++i)
    {
      v12 = (void *)sub_18B1233E8([CKObjCProperty alloc], a3, v6[i]);
      objc_msgSend_addObject_(v10, v13, (uint64_t)v12, v14);
    }
  }
  free(v6);
  v23.receiver = self;
  v23.super_class = (Class)CKObjCClass;
  v15 = [(CKObjCClass *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_handle, a3);
    objc_storeStrong((id *)&v16->_name, v5);
    uint64_t v20 = objc_msgSend_copy(v10, v17, v18, v19);
    properties = v16->_properties;
    v16->_properties = (NSArray *)v20;
  }
  return v16;
}

- (id)description
{
  uint64_t v5 = NSString;
  v6 = objc_msgSend_name(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_stringWithFormat_(v5, v7, @"<%@: %p>", v8, v6, self);

  return v9;
}

- (id)propertyForName:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_properties(self, v5, v6, v7);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_18B0E54F8;
  v14[3] = &unk_1E5464228;
  id v15 = v4;
  id v9 = v4;
  v12 = objc_msgSend_CKFirstObjectPassingTest_(v8, v10, (uint64_t)v14, v11);

  return v12;
}

- (Class)handle
{
  return self->_handle;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_handle, 0);
}

@end