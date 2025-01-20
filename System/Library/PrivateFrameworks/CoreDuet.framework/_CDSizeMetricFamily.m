@interface _CDSizeMetricFamily
+ (id)sizeMetricFamilyWithName:(uint64_t)a1;
- (id)description;
- (id)sizeMetricWithName:(void *)a3 string:(uint64_t)a4 scale:;
- (void)initWithName:(void *)a1;
@end

@implementation _CDSizeMetricFamily

+ (id)sizeMetricFamilyWithName:(uint64_t)a1
{
  id v2 = a2;
  self;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__30;
  v14 = __Block_byref_object_dispose__30;
  id v15 = 0;
  if (_CDSizeMetricInitialized != -1) {
    dispatch_once_f(&_CDSizeMetricInitialized, 0, (dispatch_function_t)_CDSizeMetricInitialize);
  }
  v3 = _CDSizeMetricQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48___CDSizeMetricFamily_sizeMetricFamilyWithName___block_invoke;
  v7[3] = &unk_1E560D4D0;
  id v8 = v2;
  v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)initWithName:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_CDSizeMetricFamily;
    id v5 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      uint64_t v6 = objc_opt_new();
      v7 = (void *)a1[2];
      a1[2] = v6;
    }
  }

  return a1;
}

- (id)sizeMetricWithName:(void *)a3 string:(uint64_t)a4 scale:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__30;
    v21 = __Block_byref_object_dispose__30;
    id v22 = 0;
    objc_super v9 = _CDSizeMetricQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55___CDSizeMetricFamily_sizeMetricWithName_string_scale___block_invoke;
    block[3] = &unk_1E5610E30;
    id v15 = &v17;
    block[4] = a1;
    id v13 = v7;
    id v14 = v8;
    uint64_t v16 = a4;
    dispatch_sync(v9, block);
    id v10 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v4);
  if (self)
  {
    id v7 = objc_getProperty(self, v5, 8, 1);
    id v8 = NSNumber;
    id Property = objc_getProperty(self, v9, 16, 1);
  }
  else
  {
    id v7 = 0;
    id Property = 0;
    id v8 = NSNumber;
  }
  id v11 = Property;
  uint64_t v12 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
  id v13 = [v3 stringWithFormat:@"%@: { name=%@, metrics.count=%@ }", v6, v7, v12];

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeMetrics, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end