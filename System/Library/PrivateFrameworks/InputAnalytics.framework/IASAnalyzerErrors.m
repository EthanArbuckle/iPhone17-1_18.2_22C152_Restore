@interface IASAnalyzerErrors
- (IASAnalyzerErrors)init;
- (NSMutableSet)errors;
- (id)errorString;
- (void)clear;
- (void)logErrorCodeIfNotNil:(id)a3;
- (void)setErrors:(id)a3;
@end

@implementation IASAnalyzerErrors

- (IASAnalyzerErrors)init
{
  v7.receiver = self;
  v7.super_class = (Class)IASAnalyzerErrors;
  v2 = [(IASAnalyzerErrors *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    objc_msgSend_setErrors_(v2, v4, (uint64_t)v3, v5);
  }
  return v2;
}

- (void)logErrorCodeIfNotNil:(id)a3
{
  v4 = (__CFString *)a3;
  if (v4)
  {
    v8 = v4;
    if (objc_msgSend_length(v4, v5, v6, v7) != 1)
    {
      v12 = sub_252A04814();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_252A111DC((uint64_t)v8, v12);
      }

      v8 = @"E";
    }
    v13 = objc_msgSend_errors(self, v9, v10, v11);
    objc_msgSend_addObject_(v13, v14, (uint64_t)v8, v15);
  }
}

- (id)errorString
{
  v26[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_errors(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_count(v5, v6, v7, v8);

  if (v9)
  {
    v13 = objc_msgSend_errors(self, v10, v11, v12);
    id v14 = objc_alloc(MEMORY[0x263F08B30]);
    v16 = objc_msgSend_initWithKey_ascending_(v14, v15, @"self", 1);
    v26[0] = v16;
    v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v17, (uint64_t)v26, 1);
    v21 = objc_msgSend_sortedArrayUsingDescriptors_(v13, v19, (uint64_t)v18, v20);

    v24 = objc_msgSend_componentsJoinedByString_(v21, v22, (uint64_t)&stru_2702E3F20, v23);
  }
  else
  {
    v24 = 0;
  }
  return v24;
}

- (void)clear
{
  objc_msgSend_errors(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v7, v4, v5, v6);
}

- (NSMutableSet)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end