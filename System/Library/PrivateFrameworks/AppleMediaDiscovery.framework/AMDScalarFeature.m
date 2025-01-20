@interface AMDScalarFeature
- (AMDScalarFeature)initWithValue:(id)a3;
- (id)stringValue;
- (void)copyDoubleValues:(int)a3 toBuffer:(double *)a4 withDefaultValue:(double)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8;
- (void)copyFloat32Values:(int)a3 toBuffer:(float *)a4 withDefaultValue:(float)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8;
- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8;
@end

@implementation AMDScalarFeature

- (AMDScalarFeature)initWithValue:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDScalarFeature;
  v8 = [(AMDFeature *)&v6 initWithValue:location[0]];
  objc_storeStrong((id *)&v8, v8);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (id)stringValue
{
  id v5 = [(AMDFeature *)self _value];
  char v12 = 0;
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  if (v5)
  {
    id v13 = [(AMDFeature *)self _value];
    char v12 = 1;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [(AMDFeature *)self _value];
      char v10 = 1;
      v4 = v11;
    }
    else
    {
      id v9 = [(AMDFeature *)self _value];
      char v8 = 1;
      id v7 = (id)[v9 stringValue];
      char v6 = 1;
      v4 = v7;
    }
    id v2 = v4;
  }
  else
  {
    id v2 = 0;
  }
  v15 = v2;
  if (v6) {

  }
  if (v8) {
  if (v10)
  }

  if (v12) {

  }
  return v15;
}

- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v20 = self;
  SEL v19 = a2;
  int v18 = a3;
  v17 = a4;
  int v16 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v14 = 0;
  objc_storeStrong(&v14, a7);
  id v13 = 0;
  objc_storeStrong(&v13, a8);
  if (v18 != 1)
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v21, v18);
      _os_log_error_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_ERROR, "trying to get %d values (!= 1) from NumericFeature", v21, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v8 = [(AMDFeature *)v20 _value];
  BOOL v9 = +[AMDFeature getIntFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "getIntFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:");

  if (!v9) {
    int *v17 = v16;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyFloat32Values:(int)a3 toBuffer:(float *)a4 withDefaultValue:(float)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v20 = self;
  SEL v19 = a2;
  int v18 = a3;
  v17 = a4;
  float v16 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v14 = 0;
  objc_storeStrong(&v14, a7);
  id v13 = 0;
  objc_storeStrong(&v13, a8);
  if (v18 != 1)
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v21, v18);
      _os_log_error_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_ERROR, "trying to get %d values (!= 1) from NumericFeature", v21, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v8 = [(AMDFeature *)v20 _value];
  BOOL v9 = +[AMDFeature getFloatFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "getFloatFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:");

  if (!v9) {
    float *v17 = v16;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyDoubleValues:(int)a3 toBuffer:(double *)a4 withDefaultValue:(double)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v20 = self;
  SEL v19 = a2;
  int v18 = a3;
  v17 = a4;
  double v16 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v14 = 0;
  objc_storeStrong(&v14, a7);
  id v13 = 0;
  objc_storeStrong(&v13, a8);
  if (v18 != 1)
  {
    os_log_t oslog = (os_log_t)&_os_log_internal;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_0_1_4_0((uint64_t)v21, v18);
      _os_log_error_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_ERROR, "trying to get %d values (!= 1) from NumericFeature", v21, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  id v8 = [(AMDFeature *)v20 _value];
  BOOL v9 = +[AMDFeature getDoubleFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "getDoubleFromObject:copyToValue:withRemapDictionary:andPostRemapOperation:");

  if (!v9) {
    double *v17 = v16;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
}

@end