@interface AMDMapFeature
- (AMDMapFeature)initWithValue:(id)a3;
- (id)getArrayForOp:(id)a3;
- (unint64_t)getCount;
- (void)copyDoubleValues:(int)a3 toBuffer:(double *)a4 withDefaultValue:(double)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8;
- (void)copyFloat32Values:(int)a3 toBuffer:(float *)a4 withDefaultValue:(float)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8;
- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8;
- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapInfo:(id)a7 andPostRemapOperation:(id)a8;
@end

@implementation AMDMapFeature

- (AMDMapFeature)initWithValue:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDMapFeature;
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
  v18 = self;
  SEL v17 = a2;
  unsigned int v16 = a3;
  v15 = a4;
  unsigned int v14 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v12 = 0;
  objc_storeStrong(&v12, a7);
  id v11 = 0;
  objc_storeStrong(&v11, a8);
  id v10 = [(AMDMapFeature *)v18 getArrayForOp:location];
  if (v10) {
    +[AMDFeature copyInt32Values:v16 fromArray:v10 toBuffer:v15 withDefaultValue:v14 withRemapInfo:v12 andPostRemapOperation:v11];
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapInfo:(id)a7 andPostRemapOperation:(id)a8
{
  v18 = self;
  SEL v17 = a2;
  unsigned int v16 = a3;
  v15 = a4;
  unsigned int v14 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v12 = 0;
  objc_storeStrong(&v12, a7);
  id v11 = 0;
  objc_storeStrong(&v11, a8);
  id v10 = [(AMDMapFeature *)v18 getArrayForOp:location];
  if (v10) {
    +[AMDFeature copyInt32Values:v16 fromArray:v10 toBuffer:v15 withDefaultValue:v14 withRemapInfo:v12 andPostRemapOperation:v11];
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyFloat32Values:(int)a3 toBuffer:(float *)a4 withDefaultValue:(float)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  v19 = self;
  SEL v18 = a2;
  unsigned int v17 = a3;
  unsigned int v16 = a4;
  float v15 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v13 = 0;
  objc_storeStrong(&v13, a7);
  id v12 = 0;
  objc_storeStrong(&v12, a8);
  id v11 = [(AMDMapFeature *)v19 getArrayForOp:location];
  if (v11)
  {
    *(float *)&double v8 = v15;
    +[AMDFeature copyFloat32Values:v17 fromArray:v11 toBuffer:v16 withDefaultValue:v13 withRemapDictionary:v12 andPostRemapOperation:v8];
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyDoubleValues:(int)a3 toBuffer:(double *)a4 withDefaultValue:(double)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  SEL v18 = self;
  SEL v17 = a2;
  unsigned int v16 = a3;
  float v15 = a4;
  double v14 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v12 = 0;
  objc_storeStrong(&v12, a7);
  id v11 = 0;
  objc_storeStrong(&v11, a8);
  id v10 = [(AMDMapFeature *)v18 getArrayForOp:location];
  if (v10) {
    +[AMDFeature copyDoubleValues:v16 fromArray:v10 toBuffer:v15 withDefaultValue:v12 withRemapDictionary:v11 andPostRemapOperation:v14];
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&location, 0);
}

- (id)getArrayForOp:(id)a3
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  v59 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v57 = 0;
  if ([location[0] isEqualToString:@"keys_order_asc_by_value"])
  {
    id v48 = [(AMDFeature *)v59 _value];
    id v3 = (id)[v48 keysSortedByValueUsingComparator:&__block_literal_global_1];
    id v4 = v57;
    id v57 = v3;
  }
  else if ([location[0] isEqualToString:@"keys_order_desc_by_value"])
  {
    id v47 = [(AMDFeature *)v59 _value];
    id v5 = (id)[v47 keysSortedByValueUsingComparator:&__block_literal_global_110];
    id v6 = v57;
    id v57 = v5;
  }
  else if ([location[0] isEqualToString:@"values_order_asc_by_value"])
  {
    id v46 = [(AMDFeature *)v59 _value];
    id v45 = (id)[v46 allValues];
    id v7 = (id)[v45 sortedArrayUsingComparator:&__block_literal_global_115];
    id v8 = v57;
    id v57 = v7;
  }
  else if ([location[0] isEqualToString:@"values_order_desc_by_value"])
  {
    id v44 = [(AMDFeature *)v59 _value];
    id v43 = (id)[v44 allValues];
    id v9 = (id)[v43 sortedArrayUsingComparator:&__block_literal_global_120];
    id v10 = v57;
    id v57 = v9;
  }
  else if ([location[0] isEqualToString:@"keys_order_asc_by_key"])
  {
    id v42 = [(AMDFeature *)v59 _value];
    id v41 = (id)[v42 allKeys];
    id v11 = (id)[v41 sortedArrayUsingComparator:&__block_literal_global_125];
    id v12 = v57;
    id v57 = v11;
  }
  else if ([location[0] isEqualToString:@"keys_order_desc_by_key"])
  {
    id v40 = [(AMDFeature *)v59 _value];
    id v39 = (id)[v40 allKeys];
    id v13 = (id)[v39 sortedArrayUsingComparator:&__block_literal_global_130];
    id v14 = v57;
    id v57 = v13;
  }
  else if ([location[0] isEqualToString:@"values_order_asc_by_key"])
  {
    id v36 = [(AMDFeature *)v59 _value];
    id v35 = (id)[v36 allKeys];
    id v56 = (id)[v35 sortedArrayUsingComparator:&__block_literal_global_135];

    id v55 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v56, "count"));
    memset(__b, 0, sizeof(__b));
    id obj = v56;
    uint64_t v38 = [obj countByEnumeratingWithState:__b objects:v61 count:16];
    if (v38)
    {
      uint64_t v32 = *(void *)__b[2];
      uint64_t v33 = 0;
      unint64_t v34 = v38;
      while (1)
      {
        uint64_t v31 = v33;
        if (*(void *)__b[2] != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v54 = *(void *)(__b[1] + 8 * v33);
        id v28 = v55;
        id v30 = [(AMDFeature *)v59 _value];
        id v29 = (id)[v30 objectForKey:v54];
        objc_msgSend(v28, "addObject:");

        ++v33;
        if (v31 + 1 >= v34)
        {
          uint64_t v33 = 0;
          unint64_t v34 = [obj countByEnumeratingWithState:__b objects:v61 count:16];
          if (!v34) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v57, v55);
    objc_storeStrong(&v55, 0);
    objc_storeStrong(&v56, 0);
  }
  else if ([location[0] isEqualToString:@"values_order_desc_by_key"])
  {
    id v25 = [(AMDFeature *)v59 _value];
    id v24 = (id)[v25 allKeys];
    id v52 = (id)[v24 sortedArrayUsingComparator:&__block_literal_global_141];

    id v51 = (id)objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v52, "count"));
    memset(v49, 0, sizeof(v49));
    id v26 = v52;
    uint64_t v27 = [v26 countByEnumeratingWithState:v49 objects:v60 count:16];
    if (v27)
    {
      uint64_t v21 = *(void *)v49[2];
      uint64_t v22 = 0;
      unint64_t v23 = v27;
      while (1)
      {
        uint64_t v20 = v22;
        if (*(void *)v49[2] != v21) {
          objc_enumerationMutation(v26);
        }
        uint64_t v50 = *(void *)(v49[1] + 8 * v22);
        id v17 = v51;
        id v19 = [(AMDFeature *)v59 _value];
        id v18 = (id)[v19 objectForKey:v50];
        objc_msgSend(v17, "addObject:");

        ++v22;
        if (v20 + 1 >= v23)
        {
          uint64_t v22 = 0;
          unint64_t v23 = [v26 countByEnumeratingWithState:v49 objects:v60 count:16];
          if (!v23) {
            break;
          }
        }
      }
    }

    objc_storeStrong(&v57, v51);
    objc_storeStrong(&v51, 0);
    objc_storeStrong(&v52, 0);
  }
  id v16 = v57;
  objc_storeStrong(&v57, 0);
  objc_storeStrong(location, 0);

  return v16;
}

BOOL __31__AMDMapFeature_getArrayForOp___block_invoke(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  [location[0] doubleValue];
  double v7 = v3;
  [v9 doubleValue];
  BOOL v8 = v7 >= v4;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8;
}

BOOL __31__AMDMapFeature_getArrayForOp___block_invoke_2(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  [location[0] doubleValue];
  double v7 = v3;
  [v9 doubleValue];
  BOOL v8 = v7 <= v4;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8;
}

BOOL __31__AMDMapFeature_getArrayForOp___block_invoke_3(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  [location[0] doubleValue];
  double v7 = v3;
  [v9 doubleValue];
  BOOL v8 = v7 >= v4;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8;
}

BOOL __31__AMDMapFeature_getArrayForOp___block_invoke_4(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v9 = 0;
  objc_storeStrong(&v9, a3);
  [location[0] doubleValue];
  double v7 = v3;
  [v9 doubleValue];
  BOOL v8 = v7 <= v4;
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v8;
}

uint64_t __31__AMDMapFeature_getArrayForOp___block_invoke_5(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v8 compare:location[0]];
  }
  else
  {
    [location[0] doubleValue];
    double v6 = v3;
    [v8 doubleValue];
    uint64_t v10 = v6 <= v4;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

uint64_t __31__AMDMapFeature_getArrayForOp___block_invoke_6(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [location[0] compare:v8];
  }
  else
  {
    [location[0] doubleValue];
    double v6 = v3;
    [v8 doubleValue];
    uint64_t v10 = v6 >= v4;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

uint64_t __31__AMDMapFeature_getArrayForOp___block_invoke_7(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [v8 compare:location[0]];
  }
  else
  {
    [location[0] doubleValue];
    double v6 = v3;
    [v8 doubleValue];
    uint64_t v10 = v6 <= v4;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

uint64_t __31__AMDMapFeature_getArrayForOp___block_invoke_8(void *a1, void *a2, void *a3)
{
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v8 = 0;
  objc_storeStrong(&v8, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = [location[0] compare:v8];
  }
  else
  {
    [location[0] doubleValue];
    double v6 = v3;
    [v8 doubleValue];
    uint64_t v10 = v6 >= v4;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v10;
}

@end