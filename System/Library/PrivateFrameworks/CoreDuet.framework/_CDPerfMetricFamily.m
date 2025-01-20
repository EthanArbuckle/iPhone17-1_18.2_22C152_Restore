@interface _CDPerfMetricFamily
+ (_CDPerfMetricFamily)perfMetricFamilyWithName:(id)a3;
- (NSMutableDictionary)perfMetrics;
- (NSString)name;
- (_CDPerfMetricFamily)initWithName:(id)a3;
- (id)allPerfMetrics;
- (id)description;
- (id)perfMetricWithName:(id)a3;
- (id)perfMetricWithName:(id)a3 string:(id)a4;
@end

@implementation _CDPerfMetricFamily

+ (_CDPerfMetricFamily)perfMetricFamilyWithName:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__0;
  v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  if (_CDPerfMetricInitialized != -1) {
    dispatch_once_f(&_CDPerfMetricInitialized, 0, (dispatch_function_t)_CDPerfMetricInitialize);
  }
  v4 = _CDPerfMetricQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48___CDPerfMetricFamily_perfMetricFamilyWithName___block_invoke;
  v8[3] = &unk_1E560D4D0;
  id v9 = v3;
  v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return (_CDPerfMetricFamily *)v6;
}

- (_CDPerfMetricFamily)initWithName:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CDPerfMetricFamily;
  id v6 = [(_CDPerfMetricFamily *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    uint64_t v8 = objc_opt_new();
    perfMetrics = v7->_perfMetrics;
    v7->_perfMetrics = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (id)perfMetricWithName:(id)a3 string:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  uint64_t v8 = _CDPerfMetricQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49___CDPerfMetricFamily_perfMetricWithName_string___block_invoke;
  v13[3] = &unk_1E560D4F8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)perfMetricWithName:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  id v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  id v5 = _CDPerfMetricQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___CDPerfMetricFamily_perfMetricWithName___block_invoke;
  block[3] = &unk_1E560D380;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)allPerfMetrics
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__0;
  id v9 = __Block_byref_object_dispose__0;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37___CDPerfMetricFamily_allPerfMetrics__block_invoke;
  v4[3] = &unk_1E560D4D0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_sync((dispatch_queue_t)_CDPerfMetricQueue, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(_CDPerfMetricFamily *)self name];
  uint64_t v7 = NSNumber;
  uint64_t v8 = [(_CDPerfMetricFamily *)self perfMetrics];
  id v9 = objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
  id v10 = [v3 stringWithFormat:@"%@: { name=%@, metrics.count=%@ }", v5, v6, v9];

  return v10;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableDictionary)perfMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perfMetrics, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end