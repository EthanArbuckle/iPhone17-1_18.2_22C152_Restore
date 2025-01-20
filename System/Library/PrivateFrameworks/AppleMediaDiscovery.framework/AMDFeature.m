@interface AMDFeature
+ (BOOL)getDoubleFromObject:(id)a3 copyToValue:(double *)a4 withRemapDictionary:(id)a5 andPostRemapOperation:(id)a6;
+ (BOOL)getFloatFromObject:(id)a3 copyToValue:(float *)a4 withRemapDictionary:(id)a5 andPostRemapOperation:(id)a6;
+ (BOOL)getIntFromObject:(id)a3 copyToValue:(int *)a4 withRemapDictionary:(id)a5 andPostRemapOperation:(id)a6;
+ (id)featureFromValue:(id)a3;
+ (void)copyDoubleValues:(int)a3 fromArray:(id)a4 toBuffer:(double *)a5 withDefaultValue:(double)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8;
+ (void)copyFloat32Values:(int)a3 fromArray:(id)a4 toBuffer:(float *)a5 withDefaultValue:(float)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8;
+ (void)copyInt32Values:(int)a3 fromArray:(id)a4 toBuffer:(int *)a5 withDefaultValue:(int)a6 withRemapData:(id)a7 andPostRemapOperation:(id)a8;
+ (void)copyInt32Values:(int)a3 fromArray:(id)a4 toBuffer:(int *)a5 withDefaultValue:(int)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8;
+ (void)copyInt32Values:(int)a3 fromArray:(id)a4 toBuffer:(int *)a5 withDefaultValue:(int)a6 withRemapInfo:(id)a7 andPostRemapOperation:(id)a8;
- (AMDFeature)initWithValue:(id)a3;
- (NSArray)_shape;
- (NSMutableArray)_actualShape;
- (PostRemapOperation)_postRemapOperation;
- (id)_remapInfo;
- (id)_value;
- (id)getPostRemapOperation;
- (id)getRemapInfo;
- (id)getShape;
- (id)getValue;
- (id)stringValue;
- (int64_t)_dataType;
- (int64_t)getDataType;
- (unint64_t)getCount;
- (void)copyDoubleValues:(int)a3 toBuffer:(double *)a4 withDefaultValue:(double)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8;
- (void)copyFloat32Values:(int)a3 toBuffer:(float *)a4 withDefaultValue:(float)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8;
- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8;
- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapInfo:(id)a7 andPostRemapOperation:(id)a8;
- (void)setDataType:(int64_t)a3;
- (void)setPostRemapOperation:(id)a3;
- (void)setRemapInfo:(id)a3;
- (void)setShape:(id)a3;
- (void)set_actualShape:(id)a3;
- (void)set_dataType:(int64_t)a3;
- (void)set_postRemapOperation:(id)a3;
- (void)set_remapInfo:(id)a3;
- (void)set_shape:(id)a3;
- (void)set_value:(id)a3;
@end

@implementation AMDFeature

- (AMDFeature)initWithValue:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDFeature;
  v8 = [(AMDFeature *)&v6 init];
  objc_storeStrong((id *)&v8, v8);
  [(AMDFeature *)v8 set_value:location[0]];
  [(AMDFeature *)v8 set_dataType:0];
  [(AMDFeature *)v8 set_remapInfo:0];
  [(AMDFeature *)v8 set_postRemapOperation:0];
  [(AMDFeature *)v8 set_shape:0];
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (int64_t)getDataType
{
  return [(AMDFeature *)self _dataType];
}

- (void)setDataType:(int64_t)a3
{
}

- (id)getRemapInfo
{
  return [(AMDFeature *)self _remapInfo];
}

- (void)setRemapInfo:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(AMDFeature *)v4 set_remapInfo:location[0]];
  objc_storeStrong(location, 0);
}

- (id)getPostRemapOperation
{
  return [(AMDFeature *)self _postRemapOperation];
}

- (void)setPostRemapOperation:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(AMDFeature *)v4 set_postRemapOperation:location[0]];
  objc_storeStrong(location, 0);
}

- (id)getShape
{
  return [(AMDFeature *)self _shape];
}

- (void)setShape:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(AMDFeature *)v4 set_shape:location[0]];
  objc_storeStrong(location, 0);
}

- (id)getValue
{
  return [(AMDFeature *)self _value];
}

- (unint64_t)getCount
{
  id v2 = [(AMDFeature *)self _value];
  unint64_t v4 = v2 != 0;

  return v4;
}

- (id)stringValue
{
  id v4 = [(AMDFeature *)self _value];
  char v7 = 0;
  char v5 = 0;
  if (v4)
  {
    id v8 = [(AMDFeature *)self _value];
    char v7 = 1;
    id v6 = (id)[v8 stringValue];
    char v5 = 1;
    id v2 = v6;
  }
  else
  {
    id v2 = 0;
  }
  v10 = v2;
  if (v5) {

  }
  if (v7) {

  }
  return v10;
}

- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  v17 = self;
  SEL v16 = a2;
  int v15 = a3;
  v14 = a4;
  int v13 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v11 = 0;
  objc_storeStrong(&v11, a7);
  id v10 = 0;
  objc_storeStrong(&v10, a8);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyInt32Values:(int)a3 toBuffer:(int *)a4 withDefaultValue:(int)a5 withMapOp:(id)a6 withRemapInfo:(id)a7 andPostRemapOperation:(id)a8
{
  v17 = self;
  SEL v16 = a2;
  int v15 = a3;
  v14 = a4;
  int v13 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v11 = 0;
  objc_storeStrong(&v11, a7);
  id v10 = 0;
  objc_storeStrong(&v10, a8);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyFloat32Values:(int)a3 toBuffer:(float *)a4 withDefaultValue:(float)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  v17 = self;
  SEL v16 = a2;
  int v15 = a3;
  v14 = a4;
  float v13 = a5;
  id location = 0;
  objc_storeStrong(&location, a6);
  id v11 = 0;
  objc_storeStrong(&v11, a7);
  id v10 = 0;
  objc_storeStrong(&v10, a8);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&location, 0);
}

- (void)copyDoubleValues:(int)a3 toBuffer:(double *)a4 withDefaultValue:(double)a5 withMapOp:(id)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  int v15 = self;
  SEL v14 = a2;
  int v13 = a3;
  id location[2] = a4;
  location[1] = *(id *)&a5;
  location[0] = 0;
  objc_storeStrong(location, a6);
  id v11 = 0;
  objc_storeStrong(&v11, a7);
  id v10 = 0;
  objc_storeStrong(&v10, a8);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

+ (id)featureFromValue:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v3 = [AMDScalarFeature alloc];
      v20 = [(AMDScalarFeature *)v3 initWithValue:location[0]];
      int v18 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_31;
      }
      id v17 = location[0];
      if ([v17 count])
      {
        id v13 = (id)[v17 firstObject];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0
          || (id v11 = (id)[v17 firstObject],
              objc_opt_class(),
              char v12 = objc_opt_isKindOfClass(),
              v11,
              (v12 & 1) != 0))
        {
          v20 = [[AMDListFeature alloc] initWithValue:v17];
          int v18 = 1;
        }
        else
        {
          id v9 = (id)[v17 firstObject];
          objc_opt_class();
          char v10 = objc_opt_isKindOfClass();

          if (v10)
          {
            v20 = [[AMDMultiArrayFeature alloc] initWithValue:v17];
            int v18 = 1;
          }
          else
          {
            int v18 = 0;
          }
        }
      }
      else
      {
        id v4 = [AMDListFeature alloc];
        v20 = [(AMDListFeature *)v4 initWithValue:MEMORY[0x263EFFA68]];
        int v18 = 1;
      }
      objc_storeStrong(&v17, 0);
      if (!v18)
      {
LABEL_31:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_25;
        }
        id v16 = location[0];
        if ([v16 count])
        {
          id v8 = (id)[v16 allValues];
          id v15 = (id)[v8 firstObject];

          objc_opt_class();
          if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
          {
            v20 = [[AMDMapFeature alloc] initWithValue:v16];
            int v18 = 1;
          }
          else
          {
            int v18 = 0;
          }
          objc_storeStrong(&v15, 0);
        }
        else
        {
          char v5 = [AMDMapFeature alloc];
          v20 = [(AMDMapFeature *)v5 initWithValue:MEMORY[0x263EFFA78]];
          int v18 = 1;
        }
        objc_storeStrong(&v16, 0);
        if (!v18)
        {
LABEL_25:
          v20 = 0;
          int v18 = 1;
        }
      }
    }
  }
  else
  {
    v20 = 0;
    int v18 = 1;
  }
  objc_storeStrong(location, 0);
  id v6 = v20;

  return v6;
}

+ (BOOL)getIntFromObject:(id)a3 copyToValue:(int *)a4 withRemapDictionary:(id)a5 andPostRemapOperation:(id)a6
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v28 = a4;
  id v27 = 0;
  objc_storeStrong(&v27, a5);
  id v26 = 0;
  objc_storeStrong(&v26, a6);
  id v25 = location[0];
  if (v27)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (id)[v27 objectForKey:location[0]];
      id v7 = v25;
      id v25 = v6;
    }
    else
    {
      id v13 = v27;
      id v14 = (id)[location[0] stringValue];
      id v8 = (id)objc_msgSend(v13, "objectForKey:");
      id v9 = v25;
      id v25 = v8;
    }
  }
  if (v25)
  {
    int v23 = [v25 intValue];
    char v21 = 0;
    BOOL v12 = 0;
    if (v26)
    {
      id v22 = (id)[v26 getPostRemapOperationName];
      char v21 = 1;
      BOOL v12 = v22 != 0;
    }
    if (v21) {

    }
    if (!v12) {
      goto LABEL_26;
    }
    id v20 = (id)[v26 getPostRemapOperationName];
    if ([v20 isEqualToString:@"hash"])
    {
      id v11 = (id)[v26 getHashOpModValue];
      v23 %= (int)[v11 intValue];
    }
    else if ([v20 isEqualToString:@"truncate"])
    {
      id v19 = (id)[v26 getTruncateOpMinValue];
      if (v19 && v23 < (int)[v19 intValue])
      {
        char v30 = 0;
        int v24 = 1;
      }
      else
      {
        id v18 = (id)[v26 getTruncateOpMaxValue];
        if (v18 && v23 > (int)[v18 intValue])
        {
          char v30 = 0;
          int v24 = 1;
        }
        else
        {
          int v24 = 0;
        }
        objc_storeStrong(&v18, 0);
      }
      objc_storeStrong(&v19, 0);
      if (v24)
      {
LABEL_25:
        objc_storeStrong(&v20, 0);
        if (v24) {
          goto LABEL_27;
        }
LABEL_26:
        int *v28 = v23;
        char v30 = 1;
        int v24 = 1;
        goto LABEL_27;
      }
    }
    int v24 = 0;
    goto LABEL_25;
  }
  char v30 = 0;
  int v24 = 1;
LABEL_27:
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  return v30 & 1;
}

+ (BOOL)getFloatFromObject:(id)a3 copyToValue:(float *)a4 withRemapDictionary:(id)a5 andPostRemapOperation:(id)a6
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = a4;
  id v28 = 0;
  objc_storeStrong(&v28, a5);
  id v27 = 0;
  objc_storeStrong(&v27, a6);
  id v26 = location[0];
  if (v28)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (id)[v28 objectForKey:location[0]];
      id v7 = v26;
      id v26 = v6;
    }
    else
    {
      id v15 = v28;
      id v16 = (id)[location[0] stringValue];
      id v8 = (id)objc_msgSend(v15, "objectForKey:");
      id v9 = v26;
      id v26 = v8;
    }
  }
  if (v26)
  {
    [v26 floatValue];
    float v24 = v10;
    char v22 = 0;
    char v14 = 0;
    if (v27)
    {
      id v23 = (id)[v27 getPostRemapOperationName];
      char v22 = 1;
      char v14 = [v23 isEqualToString:@"truncate"];
    }
    if (v22) {

    }
    if ((v14 & 1) == 0) {
      goto LABEL_21;
    }
    id v21 = (id)[v27 getTruncateOpMinValue];
    if (v21 && ([v21 floatValue], v24 < v11))
    {
      char v31 = 0;
      int v25 = 1;
    }
    else
    {
      id v20 = (id)[v27 getTruncateOpMaxValue];
      if (v20 && ([v20 floatValue], v24 > v12))
      {
        char v31 = 0;
        int v25 = 1;
      }
      else
      {
        int v25 = 0;
      }
      objc_storeStrong(&v20, 0);
    }
    objc_storeStrong(&v21, 0);
    if (!v25)
    {
LABEL_21:
      float *v29 = v24;
      char v31 = 1;
      int v25 = 1;
    }
  }
  else
  {
    char v31 = 0;
    int v25 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
  return v31 & 1;
}

+ (BOOL)getDoubleFromObject:(id)a3 copyToValue:(double *)a4 withRemapDictionary:(id)a5 andPostRemapOperation:(id)a6
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = a4;
  id v28 = 0;
  objc_storeStrong(&v28, a5);
  id v27 = 0;
  objc_storeStrong(&v27, a6);
  id v26 = location[0];
  if (v28)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = (id)[v28 objectForKey:location[0]];
      id v7 = v26;
      id v26 = v6;
    }
    else
    {
      id v15 = v28;
      id v16 = (id)[location[0] stringValue];
      id v8 = (id)objc_msgSend(v15, "objectForKey:");
      id v9 = v26;
      id v26 = v8;
    }
  }
  if (v26)
  {
    [v26 doubleValue];
    double v24 = v10;
    char v22 = 0;
    char v14 = 0;
    if (v27)
    {
      id v23 = (id)[v27 getPostRemapOperationName];
      char v22 = 1;
      char v14 = [v23 isEqualToString:@"truncate"];
    }
    if (v22) {

    }
    if ((v14 & 1) == 0) {
      goto LABEL_21;
    }
    id v21 = (id)[v27 getTruncateOpMinValue];
    if (v21 && ([v21 doubleValue], v24 < v11))
    {
      char v31 = 0;
      int v25 = 1;
    }
    else
    {
      id v20 = (id)[v27 getTruncateOpMaxValue];
      if (v20 && ([v20 doubleValue], v24 > v12))
      {
        char v31 = 0;
        int v25 = 1;
      }
      else
      {
        int v25 = 0;
      }
      objc_storeStrong(&v20, 0);
    }
    objc_storeStrong(&v21, 0);
    if (!v25)
    {
LABEL_21:
      double *v29 = v24;
      char v31 = 1;
      int v25 = 1;
    }
  }
  else
  {
    char v31 = 0;
    int v25 = 1;
  }
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
  return v31 & 1;
}

+ (void)copyInt32Values:(int)a3 fromArray:(id)a4 toBuffer:(int *)a5 withDefaultValue:(int)a6 withRemapInfo:(id)a7 andPostRemapOperation:(id)a8
{
  id v19 = a1;
  SEL v18 = a2;
  unsigned int v17 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v15 = a5;
  unsigned int v14 = a6;
  id v13 = 0;
  objc_storeStrong(&v13, a7);
  id v12 = 0;
  objc_storeStrong(&v12, a8);
  if (v17)
  {
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)) {
      [v19 copyInt32Values:v17 fromArray:location toBuffer:v15 withDefaultValue:v14 withRemapData:v13 andPostRemapOperation:v12];
    }
    else {
      [v19 copyInt32Values:v17 fromArray:location toBuffer:v15 withDefaultValue:v14 withRemapDictionary:v13 andPostRemapOperation:v12];
    }
  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&location, 0);
}

+ (void)copyInt32Values:(int)a3 fromArray:(id)a4 toBuffer:(int *)a5 withDefaultValue:(int)a6 withRemapData:(id)a7 andPostRemapOperation:(id)a8
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v69 = a1;
  SEL v68 = a2;
  int v67 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  v65 = a5;
  int v64 = a6;
  id v63 = 0;
  objc_storeStrong(&v63, a7);
  id v62 = 0;
  objc_storeStrong(&v62, a8);
  id v35 = objc_alloc(MEMORY[0x263EFF9A0]);
  id v61 = (id)objc_msgSend(v35, "initWithCapacity:", objc_msgSend(location, "count"));
  memset(__b, 0, sizeof(__b));
  id v36 = location;
  uint64_t v37 = [v36 countByEnumeratingWithState:__b objects:v73 count:16];
  if (v37)
  {
    uint64_t v28 = *(void *)__b[2];
    uint64_t v29 = 0;
    unint64_t v30 = v37;
    while (1)
    {
      uint64_t v27 = v29;
      if (*(void *)__b[2] != v28) {
        objc_enumerationMutation(v36);
      }
      id v60 = *(id *)(__b[1] + 8 * v29);
      id v25 = v61;
      id v26 = (id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v60, "longLongValue"));
      objc_msgSend(v25, "setObject:forKey:", &unk_26BEC17F0);

      ++v29;
      if (v27 + 1 >= v30)
      {
        uint64_t v29 = 0;
        unint64_t v30 = [v36 countByEnumeratingWithState:__b objects:v73 count:16];
        if (!v30) {
          break;
        }
      }
    }
  }

  v58 = (void *)[v63 bytes];
  v57 = 0;
  unsigned int v56 = 0;
  unsigned int v56 = *(_DWORD *)v58;
  os_log_t oslog = (os_log_t)&_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_2_4_0_4_0((uint64_t)v72, v67, v56);
    _os_log_debug_impl(&dword_20ABD4000, oslog, type, "copyInt32Values: %d values, remap from binary data (%d entries)", v72, 0xEu);
  }
  objc_storeStrong((id *)&oslog, 0);
  v58 = (void *)((char *)v58 + 4);
  int v53 = 0;
  int v52 = [v61 count];
  for (unsigned int i = 0; i < v56; ++i)
  {
    v57 = (unsigned int *)v58;
    v58 = (void *)((char *)v58 + 4);
    id v50 = (id)[NSNumber numberWithUnsignedLongLong:*v58++];
    id v24 = (id)[v61 objectForKey:v50];

    if (!v24) {
      goto LABEL_14;
    }
    id v22 = v61;
    id v23 = (id)[NSNumber numberWithUnsignedInt:*v57];
    objc_msgSend(v22, "setObject:forKey:");

    if (++v53 == v52) {
      int v49 = 4;
    }
    else {
LABEL_14:
    }
      int v49 = 0;
    objc_storeStrong(&v50, 0);
    if (v49) {
      break;
    }
  }
  os_log_t v48 = (os_log_t)&_os_log_internal;
  os_log_type_t v47 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_0_2_4_0_8_0((uint64_t)v71, v53, [location count]);
    _os_log_debug_impl(&dword_20ABD4000, v48, v47, "Mapped %d of %lu input values", v71, 0x12u);
  }
  objc_storeStrong((id *)&v48, 0);
  int v53 = 0;
  memset(v45, 0, sizeof(v45));
  id v20 = location;
  uint64_t v21 = [v20 countByEnumeratingWithState:v45 objects:v70 count:16];
  if (v21)
  {
    uint64_t v17 = *(void *)v45[2];
    uint64_t v18 = 0;
    unint64_t v19 = v21;
    while (1)
    {
      uint64_t v16 = v18;
      if (*(void *)v45[2] != v17) {
        objc_enumerationMutation(v20);
      }
      id v46 = *(id *)(v45[1] + 8 * v18);
      id v14 = v61;
      id v15 = (id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v46, "longLongValue"));
      id v44 = (id)objc_msgSend(v14, "objectForKey:");

      int v43 = 0;
      int v43 = [v44 intValue];
      if (v43 == -1)
      {
        int v49 = 8;
        goto LABEL_47;
      }
      char v41 = 0;
      BOOL v13 = 0;
      if (v62)
      {
        id v42 = (id)[v62 getPostRemapOperationName];
        char v41 = 1;
        BOOL v13 = v42 != 0;
      }
      if (v41) {

      }
      if (v13) {
        break;
      }
LABEL_44:
      *v65++ = v43;
      if (++v53 == v67) {
        int v49 = 7;
      }
      else {
        int v49 = 0;
      }
LABEL_47:
      objc_storeStrong(&v44, 0);
      if (v49 && v49 != 8) {
        goto LABEL_52;
      }
      ++v18;
      if (v16 + 1 >= v19)
      {
        uint64_t v18 = 0;
        unint64_t v19 = [v20 countByEnumeratingWithState:v45 objects:v70 count:16];
        if (!v19) {
          goto LABEL_51;
        }
      }
    }
    id v40 = (id)[v62 getPostRemapOperationName];
    if ([v40 isEqualToString:@"hash"])
    {
      int v11 = v43;
      id v12 = (id)[v62 getHashOpModValue];
      int v43 = v11 % (int)[v12 intValue];
    }
    else if ([v40 isEqualToString:@"truncate"])
    {
      id v39 = (id)[v62 getTruncateOpMinValue];
      if (v39 && (int v10 = v43, v10 < (int)[v39 intValue]))
      {
        int v49 = 8;
      }
      else
      {
        id v38 = (id)[v62 getTruncateOpMaxValue];
        if (v38 && (int v9 = v43, v9 > (int)[v38 intValue])) {
          int v49 = 8;
        }
        else {
          int v49 = 0;
        }
        objc_storeStrong(&v38, 0);
      }
      objc_storeStrong(&v39, 0);
      if (v49)
      {
LABEL_43:
        objc_storeStrong(&v40, 0);
        if (v49) {
          goto LABEL_47;
        }
        goto LABEL_44;
      }
    }
    int v49 = 0;
    goto LABEL_43;
  }
LABEL_51:
  int v49 = 0;
LABEL_52:

  while (v53 < v67)
  {
    id v8 = v65++;
    int *v8 = v64;
    ++v53;
  }
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(&location, 0);
}

+ (void)copyInt32Values:(int)a3 fromArray:(id)a4 toBuffer:(int *)a5 withDefaultValue:(int)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v34 = a1;
  SEL v33 = a2;
  int v32 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  unint64_t v30 = a5;
  int v29 = a6;
  id v28 = 0;
  objc_storeStrong(&v28, a7);
  id v27 = 0;
  objc_storeStrong(&v27, a8);
  os_log_t oslog = (os_log_t)&_os_log_internal;
  os_log_type_t type = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    int v16 = v32;
    BOOL v17 = v28 != 0;
    if (v28) {
      uint64_t v15 = [v28 count];
    }
    else {
      uint64_t v15 = 0;
    }
    __os_log_helper_16_0_3_4_0_4_0_8_0((uint64_t)v36, v16, v17, v15);
    _os_log_debug_impl(&dword_20ABD4000, oslog, type, "copyInt32Values: %d values, remap from dict, has remap dict: %d, sizee: %lu", v36, 0x18u);
  }
  objc_storeStrong((id *)&oslog, 0);
  int v24 = 0;
  memset(__b, 0, sizeof(__b));
  id v13 = location;
  uint64_t v14 = [v13 countByEnumeratingWithState:__b objects:v35 count:16];
  if (v14)
  {
    uint64_t v10 = *(void *)__b[2];
    uint64_t v11 = 0;
    unint64_t v12 = v14;
    while (1)
    {
      uint64_t v9 = v11;
      if (*(void *)__b[2] != v10) {
        objc_enumerationMutation(v13);
      }
      uint64_t v23 = *(void *)(__b[1] + 8 * v11);
      if (+[AMDFeature getIntFromObject:v23 copyToValue:v30 withRemapDictionary:v28 andPostRemapOperation:v27])
      {
        ++v30;
        if (++v24 == v32) {
          break;
        }
      }
      ++v11;
      if (v9 + 1 >= v12)
      {
        uint64_t v11 = 0;
        unint64_t v12 = [v13 countByEnumeratingWithState:__b objects:v35 count:16];
        if (!v12) {
          break;
        }
      }
    }
  }

  while (v24 < v32)
  {
    id v8 = v30++;
    int *v8 = v29;
    ++v24;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&location, 0);
}

+ (void)copyFloat32Values:(int)a3 fromArray:(id)a4 toBuffer:(float *)a5 withDefaultValue:(float)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v30 = a1;
  SEL v29 = a2;
  int v28 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v26 = a5;
  float v25 = a6;
  id v24 = 0;
  objc_storeStrong(&v24, a7);
  id v23 = 0;
  objc_storeStrong(&v23, a8);
  if (v28)
  {
    int v21 = 0;
    memset(__b, 0, sizeof(__b));
    id v13 = location;
    uint64_t v14 = [v13 countByEnumeratingWithState:__b objects:v31 count:16];
    if (v14)
    {
      uint64_t v10 = *(void *)__b[2];
      uint64_t v11 = 0;
      unint64_t v12 = v14;
      while (1)
      {
        uint64_t v9 = v11;
        if (*(void *)__b[2] != v10) {
          objc_enumerationMutation(v13);
        }
        uint64_t v20 = *(void *)(__b[1] + 8 * v11);
        if (+[AMDFeature getFloatFromObject:v20 copyToValue:v26 withRemapDictionary:v24 andPostRemapOperation:v23])
        {
          ++v26;
          if (++v21 == v28) {
            break;
          }
        }
        ++v11;
        if (v9 + 1 >= v12)
        {
          uint64_t v11 = 0;
          unint64_t v12 = [v13 countByEnumeratingWithState:__b objects:v31 count:16];
          if (!v12) {
            goto LABEL_12;
          }
        }
      }
      int v22 = 2;
    }
    else
    {
LABEL_12:
      int v22 = 0;
    }

    while (v21 < v28)
    {
      id v8 = v26++;
      float *v8 = v25;
      ++v21;
    }
    int v22 = 0;
  }
  else
  {
    int v22 = 1;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&location, 0);
}

+ (void)copyDoubleValues:(int)a3 fromArray:(id)a4 toBuffer:(double *)a5 withDefaultValue:(double)a6 withRemapDictionary:(id)a7 andPostRemapOperation:(id)a8
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v30 = a1;
  SEL v29 = a2;
  int v28 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v26 = a5;
  double v25 = a6;
  id v24 = 0;
  objc_storeStrong(&v24, a7);
  id v23 = 0;
  objc_storeStrong(&v23, a8);
  if (v28)
  {
    int v21 = 0;
    memset(__b, 0, sizeof(__b));
    id v13 = location;
    uint64_t v14 = [v13 countByEnumeratingWithState:__b objects:v31 count:16];
    if (v14)
    {
      uint64_t v10 = *(void *)__b[2];
      uint64_t v11 = 0;
      unint64_t v12 = v14;
      while (1)
      {
        uint64_t v9 = v11;
        if (*(void *)__b[2] != v10) {
          objc_enumerationMutation(v13);
        }
        uint64_t v20 = *(void *)(__b[1] + 8 * v11);
        if (+[AMDFeature getDoubleFromObject:v20 copyToValue:v26 withRemapDictionary:v24 andPostRemapOperation:v23])
        {
          ++v26;
          if (++v21 == v28) {
            break;
          }
        }
        ++v11;
        if (v9 + 1 >= v12)
        {
          uint64_t v11 = 0;
          unint64_t v12 = [v13 countByEnumeratingWithState:__b objects:v31 count:16];
          if (!v12) {
            goto LABEL_12;
          }
        }
      }
      int v22 = 2;
    }
    else
    {
LABEL_12:
      int v22 = 0;
    }

    while (v21 < v28)
    {
      id v8 = v26++;
      double *v8 = v25;
      ++v21;
    }
    int v22 = 0;
  }
  else
  {
    int v22 = 1;
  }
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&location, 0);
}

- (id)_value
{
  return self->__value;
}

- (void)set_value:(id)a3
{
}

- (int64_t)_dataType
{
  return self->__dataType;
}

- (void)set_dataType:(int64_t)a3
{
  self->__dataType = a3;
}

- (id)_remapInfo
{
  return self->__remapInfo;
}

- (void)set_remapInfo:(id)a3
{
}

- (PostRemapOperation)_postRemapOperation
{
  return self->__postRemapOperation;
}

- (void)set_postRemapOperation:(id)a3
{
}

- (NSArray)_shape
{
  return self->__shape;
}

- (void)set_shape:(id)a3
{
}

- (NSMutableArray)_actualShape
{
  return self->__actualShape;
}

- (void)set_actualShape:(id)a3
{
}

- (void).cxx_destruct
{
}

@end