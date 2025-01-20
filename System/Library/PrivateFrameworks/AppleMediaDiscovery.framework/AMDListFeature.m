@interface AMDListFeature
- (AMDListFeature)initWithValue:(id)a3;
- (unint64_t)getCount;
- (void)copyDoubleValues:(int)a3 toBuffer:(double *)a4 withDefaultValue:(double)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8;
- (void)copyFloat32Values:(int)a3 toBuffer:(float *)a4 withDefaultValue:(float)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8;
- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8;
@end

@implementation AMDListFeature

- (AMDListFeature)initWithValue:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDListFeature;
  v8 = [(AMDFeature *)&v6 initWithValue:location[0]];
  objc_storeStrong((id *)&v8, v8);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (unint64_t)getCount
{
  id v4 = [(AMDFeature *)self _value];
  char v5 = 0;
  if (v4)
  {
    id v6 = [(AMDFeature *)self _value];
    char v5 = 1;
    unint64_t v3 = [v6 count];
  }
  else
  {
    unint64_t v3 = 0;
  }
  if (v5) {

  }
  return v3;
}

- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  v19 = self;
  SEL v18 = a2;
  int v17 = a3;
  v16 = a4;
  int v15 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v13 = 0;
  objc_storeStrong(&v13, a7);
  id v12 = 0;
  objc_storeStrong(&v12, a8);
  unsigned int v10 = v17;
  id v11 = [(AMDFeature *)v19 _value];
  +[AMDFeature copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:", v10);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyFloat32Values:(int)a3 toBuffer:(float *)a4 withDefaultValue:(float)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  v20 = self;
  SEL v19 = a2;
  int v18 = a3;
  int v17 = a4;
  float v16 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v14 = 0;
  objc_storeStrong(&v14, a7);
  id v13 = 0;
  objc_storeStrong(&v13, a8);
  unsigned int v11 = v18;
  id v12 = [(AMDFeature *)v20 _value];
  *(float *)&double v8 = v16;
  +[AMDFeature copyFloat32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "copyFloat32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:", v11, v8);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyDoubleValues:(int)a3 toBuffer:(double *)a4 withDefaultValue:(double)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  SEL v19 = self;
  SEL v18 = a2;
  int v17 = a3;
  float v16 = a4;
  double v15 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v13 = 0;
  objc_storeStrong(&v13, a7);
  id v12 = 0;
  objc_storeStrong(&v12, a8);
  unsigned int v10 = v17;
  id v11 = [(AMDFeature *)v19 _value];
  +[AMDFeature copyDoubleValues:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "copyDoubleValues:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:", v10, v15);

  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

@end