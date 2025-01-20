@interface AMDMultiArrayFeature
- (AMDMultiArrayFeature)initWithValue:(id)a3;
- (double)fillDoubleMultiArray:(double *)a3 fromSource:(id)a4 atDepth:(unsigned int)a5 error:(id *)a6;
- (float)fillFloat32MultiArray:(float *)a3 fromSource:(id)a4 atDepth:(unsigned int)a5 error:(id *)a6;
- (id)buildMultiArrayBufferFrom:(id)a3 andCapacity:(unint64_t)a4 error:(id *)a5;
- (id)getMultiArray:(id *)a3;
- (int)fillInt32MultiArray:(int *)a3 fromSource:(id)a4 atDepth:(unsigned int)a5 error:(id *)a6;
@end

@implementation AMDMultiArrayFeature

- (AMDMultiArrayFeature)initWithValue:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)AMDMultiArrayFeature;
  v8 = [(AMDFeature *)&v6 initWithValue:location[0]];
  objc_storeStrong((id *)&v8, v8);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (id)getMultiArray:(id *)a3
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  v69 = self;
  SEL v68 = a2;
  v67 = a3;
  id v44 = objc_alloc(MEMORY[0x263EFF980]);
  v46 = [(AMDFeature *)v69 _shape];
  id v45 = (id)objc_msgSend(v44, "initWithCapacity:", -[NSArray count](v46, "count"));
  -[AMDFeature set_actualShape:](v69, "set_actualShape:");

  id v66 = [(AMDFeature *)v69 _value];
  uint64_t v65 = 1;
  for (unsigned int i = 0; ; ++i)
  {
    v42 = [(AMDFeature *)v69 _shape];
    BOOL v43 = i >= [(NSArray *)v42 count];

    if (v43)
    {
      id v22 = [(AMDFeature *)v69 _value];
      id v52 = -[AMDMultiArrayFeature buildMultiArrayBufferFrom:andCapacity:error:](v69, "buildMultiArrayBufferFrom:andCapacity:error:");

      if (*v67)
      {
        id v70 = 0;
        int v60 = 1;
      }
      else
      {
        id v20 = objc_alloc(MEMORY[0x263EFF980]);
        v21 = [(AMDFeature *)v69 _actualShape];
        id v51 = (id)objc_msgSend(v20, "initWithCapacity:", -[NSMutableArray count](v21, "count"));

        for (int j = 0; ; ++j)
        {
          v18 = [(AMDFeature *)v69 _actualShape];
          BOOL v19 = j >= (unint64_t)[(NSMutableArray *)v18 count];

          if (v19) {
            break;
          }
          uint64_t v49 = 1;
          for (int k = j + 1; ; ++k)
          {
            v16 = [(AMDFeature *)v69 _actualShape];
            BOOL v17 = k >= (unint64_t)[(NSMutableArray *)v16 count];

            if (v17) {
              break;
            }
            v15 = [(AMDFeature *)v69 _actualShape];
            id v14 = (id)[(NSMutableArray *)v15 objectAtIndexedSubscript:k];
            v49 *= [v14 longValue];
          }
          id v13 = (id)[NSNumber numberWithLong:v49];
          objc_msgSend(v51, "addObject:");
        }
        id v11 = objc_alloc(MEMORY[0x263F00DA8]);
        uint64_t v10 = [v52 bytes];
        v12 = [(AMDFeature *)v69 _actualShape];
        id v47 = (id)objc_msgSend(v11, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v10, v12, -[AMDFeature _dataType](v69, "_dataType"), v51, 0, v67);

        if (*v67) {
          id v70 = 0;
        }
        else {
          id v70 = v47;
        }
        int v60 = 1;
        objc_storeStrong(&v47, 0);
        objc_storeStrong(&v51, 0);
      }
      objc_storeStrong(&v52, 0);
      goto LABEL_35;
    }
    if (!v66 || ![v66 count])
    {
      id v63 = (id)objc_msgSend(NSString, "stringWithFormat:", @"Empty array at depth %u", i);
      id location = &_os_log_internal;
      os_log_type_t v61 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v73, (uint64_t)v63);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)location, v61, "%@", v73, 0xCu);
      }
      objc_storeStrong(&location, 0);
      id v3 = +[AMDError allocError:16 withMessage:v63];
      id *v67 = v3;
      id v70 = 0;
      int v60 = 1;
      objc_storeStrong(&v63, 0);
      goto LABEL_35;
    }
    uint64_t v59 = 0;
    v40 = [(AMDFeature *)v69 _shape];
    id v39 = [(NSArray *)v40 objectAtIndexedSubscript:i];
    BOOL v41 = (int)[v39 intValue] >= 0;

    if (!v41)
    {
      uint64_t v59 = [v66 count];
      goto LABEL_15;
    }
    uint64_t v35 = [v66 count];
    v37 = [(AMDFeature *)v69 _shape];
    id v36 = [(NSArray *)v37 objectAtIndexedSubscript:i];
    BOOL v38 = v35 == [v36 unsignedIntValue];

    if (!v38) {
      break;
    }
    v30 = [(AMDFeature *)v69 _shape];
    id v29 = [(NSArray *)v30 objectAtIndexedSubscript:i];
    uint64_t v59 = (int)[v29 intValue];

LABEL_15:
    v26 = [(AMDFeature *)v69 _actualShape];
    id v25 = (id)[NSNumber numberWithUnsignedLong:v59];
    -[NSMutableArray addObject:](v26, "addObject:");

    v65 *= v59;
    v27 = [(AMDFeature *)v69 _shape];
    BOOL v28 = i + 1 >= [(NSArray *)v27 count];

    if (v28)
    {
      id v23 = (id)[v66 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        v55 = @"MultiArray does not contain numbers";
        id v54 = &_os_log_internal;
        os_log_type_t v53 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v71, (uint64_t)v55);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v54, v53, "%@", v71, 0xCu);
        }
        objc_storeStrong(&v54, 0);
        id v7 = +[AMDError allocError:16 withMessage:v55];
        id *v67 = v7;
        id v70 = 0;
        int v60 = 1;
        objc_storeStrong((id *)&v55, 0);
        goto LABEL_35;
      }
    }
    else
    {
      id v5 = (id)[v66 firstObject];
      id v6 = v66;
      id v66 = v5;
    }
  }
  v32 = NSString;
  uint64_t v31 = [v66 count];
  v34 = [(AMDFeature *)v69 _shape];
  id v33 = [(NSArray *)v34 objectAtIndexedSubscript:i];
  id v58 = (id)[v32 stringWithFormat:@"Unexpected size at depth %u, found: %lu, expected: %@", i, v31, v33];

  id v57 = &_os_log_internal;
  os_log_type_t v56 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_ERROR))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v72, (uint64_t)v58);
    _os_log_error_impl(&dword_20ABD4000, (os_log_t)v57, v56, "%@", v72, 0xCu);
  }
  objc_storeStrong(&v57, 0);
  id v4 = +[AMDError allocError:16 withMessage:v58];
  id *v67 = v4;
  id v70 = 0;
  int v60 = 1;
  objc_storeStrong(&v58, 0);
LABEL_35:
  objc_storeStrong(&v66, 0);
  v8 = v70;

  return v8;
}

- (id)buildMultiArrayBufferFrom:(id)a3 andCapacity:(unint64_t)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v29 = a4;
  BOOL v28 = a5;
  id v27 = 0;
  uint64_t v22 = [(AMDFeature *)v31 _dataType];
  switch(v22)
  {
    case 65568:
      id v11 = (id)[MEMORY[0x263EFF990] dataWithLength:4 * v29];
      id v12 = v27;
      id v27 = v11;

      BOOL v17 = v31;
      uint64_t v13 = [v27 mutableBytes];
      v24[1] = [(AMDMultiArrayFeature *)v17 fillFloat32MultiArray:v13 fromSource:location[0] atDepth:0 error:v28];
      if (*v28)
      {
        id v32 = 0;
        int v25 = 1;
        goto LABEL_18;
      }
      break;
    case 65600:
      id v5 = (id)[MEMORY[0x263EFF990] dataWithLength:8 * v29];
      id v6 = v27;
      id v27 = v5;

      BOOL v19 = v31;
      uint64_t v7 = [v27 mutableBytes];
      uint64_t v26 = [(AMDMultiArrayFeature *)v19 fillDoubleMultiArray:v7 fromSource:location[0] atDepth:0 error:v28];
      if (*v28)
      {
        id v32 = 0;
        int v25 = 1;
        goto LABEL_18;
      }
      break;
    case 131104:
      id v8 = (id)[MEMORY[0x263EFF990] dataWithLength:4 * v29];
      id v9 = v27;
      id v27 = v8;

      v18 = v31;
      uint64_t v10 = [v27 mutableBytes];
      v24[2] = [(AMDMultiArrayFeature *)v18 fillInt32MultiArray:v10 fromSource:location[0] atDepth:0 error:v28];
      if (*v28)
      {
        id v32 = 0;
        int v25 = 1;
        goto LABEL_18;
      }
      break;
    default:
      v24[0] = (id)objc_msgSend(NSString, "stringWithFormat:", @"Unknown data type: %ldd", -[AMDFeature _dataType](v31, "_dataType"));
      os_log_t oslog = (os_log_t)&_os_log_internal;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v33, (uint64_t)v24[0]);
        _os_log_error_impl(&dword_20ABD4000, oslog, OS_LOG_TYPE_ERROR, "%@", v33, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v14 = +[AMDError allocError:16 withMessage:v24[0]];
      *BOOL v28 = v14;
      objc_storeStrong(v24, 0);
      break;
  }
  id v32 = v27;
  int v25 = 1;
LABEL_18:
  objc_storeStrong(&v27, 0);
  objc_storeStrong(location, 0);
  v15 = v32;

  return v15;
}

- (int)fillInt32MultiArray:(int *)a3 fromSource:(id)a4 atDepth:(unsigned int)a5 error:(id *)a6
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  BOOL v41 = self;
  SEL v40 = a2;
  id v39 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  unsigned int v37 = a5;
  id v36 = a6;
  v21 = [(AMDFeature *)v41 _actualShape];
  id v20 = (id)[(NSMutableArray *)v21 objectAtIndexedSubscript:a5];
  unsigned int v22 = [v20 unsignedIntValue];

  unsigned int v35 = v22;
  if ([location count] == v22)
  {
    v16 = [(AMDFeature *)v41 _actualShape];
    BOOL v17 = v37 + 1 != [(NSMutableArray *)v16 count];

    if (v17)
    {
      uint64_t v25 = (uint64_t)v39;
      uint64_t v24 = 0;
      for (unsigned int i = 0; i < v35; ++i)
      {
        id v9 = v41;
        id v10 = (id)[location objectAtIndexedSubscript:i];
        uint64_t v24 = -[AMDMultiArrayFeature fillInt32MultiArray:fromSource:atDepth:error:](v9, "fillInt32MultiArray:fromSource:atDepth:error:", v25);

        if (*v36)
        {
          v42 = 0;
          int v31 = 1;
          goto LABEL_23;
        }
        uint64_t v25 = v24;
      }
      v42 = (int *)v24;
      int v31 = 1;
    }
    else
    {
      v30 = v39;
      id v29 = (id)[location firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = [(AMDFeature *)v41 _remapInfo];

        if (v15)
        {
          id v12 = location;
          id v14 = [(AMDFeature *)v41 _remapInfo];
          uint64_t v13 = [(AMDFeature *)v41 _postRemapOperation];
          +[AMDFeature copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapData:andPostRemapOperation:](AMDFeature, "copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapData:andPostRemapOperation:", v35, v12, v30, 0, v14);

          v30 += v35;
        }
        else
        {
          for (unsigned int j = 0; j < v35; ++j)
          {
            id v11 = (id)[location objectAtIndexedSubscript:j];
            int *v30 = [v11 intValue];

            ++v30;
          }
        }
        v42 = v30;
        int v31 = 1;
      }
      else
      {
        BOOL v28 = @"Data is not int32";
        id v27 = &_os_log_internal;
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v43, (uint64_t)v28);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v27, OS_LOG_TYPE_ERROR, "%@", v43, 0xCu);
        }
        objc_storeStrong(&v27, 0);
        id v7 = +[AMDError allocError:16 withMessage:v28];
        *id v36 = v7;
        v42 = 0;
        int v31 = 1;
        objc_storeStrong((id *)&v28, 0);
      }
      objc_storeStrong(&v29, 0);
    }
  }
  else
  {
    id v34 = objc_retainAutoreleasedReturnValue((id)objc_msgSend(NSString, "stringWithFormat:", @"Size mismatch while copying int32s at level %u: expected; %u, got: %lu",
                                                   v37,
                                                   v35,
                                                   [location count]));
    id v33 = &_os_log_internal;
    os_log_type_t v32 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v44, (uint64_t)v34);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v33, v32, "%@", v44, 0xCu);
    }
    objc_storeStrong(&v33, 0);
    id v6 = +[AMDError allocError:16 withMessage:v34];
    *id v36 = v6;
    v42 = 0;
    int v31 = 1;
    objc_storeStrong(&v34, 0);
  }
LABEL_23:
  objc_storeStrong(&location, 0);
  return v42;
}

- (float)fillFloat32MultiArray:(float *)a3 fromSource:(id)a4 atDepth:(unsigned int)a5 error:(id *)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  BOOL v38 = self;
  SEL v37 = a2;
  id v36 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  unsigned int v34 = a5;
  id v33 = a6;
  v18 = [(AMDFeature *)v38 _actualShape];
  id v17 = (id)[(NSMutableArray *)v18 objectAtIndexedSubscript:a5];
  unsigned int v19 = [v17 unsignedIntValue];

  unsigned int v32 = v19;
  if ([location count] == v19)
  {
    uint64_t v13 = [(AMDFeature *)v38 _actualShape];
    BOOL v14 = v34 + 1 != [(NSMutableArray *)v13 count];

    if (v14)
    {
      uint64_t v22 = (uint64_t)v36;
      uint64_t v21 = 0;
      for (unsigned int i = 0; i < v32; ++i)
      {
        id v10 = v38;
        id v11 = (id)[location objectAtIndexedSubscript:i];
        uint64_t v21 = -[AMDMultiArrayFeature fillFloat32MultiArray:fromSource:atDepth:error:](v10, "fillFloat32MultiArray:fromSource:atDepth:error:", v22);

        if (*v33)
        {
          id v39 = 0;
          int v28 = 1;
          goto LABEL_21;
        }
        uint64_t v22 = v21;
      }
      id v39 = (float *)v21;
      int v28 = 1;
    }
    else
    {
      id v27 = v36;
      id v26 = (id)[location firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        for (unsigned int j = 0; j < v32; ++j)
        {
          id v12 = (id)[location objectAtIndexedSubscript:j];
          [v12 floatValue];
          *(_DWORD *)id v27 = v8;

          ++v27;
        }
        id v39 = v27;
        int v28 = 1;
      }
      else
      {
        uint64_t v25 = @"Data is not Float32";
        id v24 = &_os_log_internal;
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v25);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v24, OS_LOG_TYPE_ERROR, "%@", v40, 0xCu);
        }
        objc_storeStrong(&v24, 0);
        id v7 = +[AMDError allocError:16 withMessage:v25];
        *id v33 = v7;
        id v39 = 0;
        int v28 = 1;
        objc_storeStrong((id *)&v25, 0);
      }
      objc_storeStrong(&v26, 0);
    }
  }
  else
  {
    id v31 = objc_retainAutoreleasedReturnValue((id)objc_msgSend(NSString, "stringWithFormat:", @"Size mismatch while copying float32s at level %u: expected; %u, got: %lu",
                                                   v34,
                                                   v32,
                                                   [location count]));
    id v30 = &_os_log_internal;
    os_log_type_t v29 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v31);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v30, v29, "%@", v41, 0xCu);
    }
    objc_storeStrong(&v30, 0);
    id v6 = +[AMDError allocError:16 withMessage:v31];
    *id v33 = v6;
    id v39 = 0;
    int v28 = 1;
    objc_storeStrong(&v31, 0);
  }
LABEL_21:
  objc_storeStrong(&location, 0);
  return v39;
}

- (double)fillDoubleMultiArray:(double *)a3 fromSource:(id)a4 atDepth:(unsigned int)a5 error:(id *)a6
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  BOOL v38 = self;
  SEL v37 = a2;
  id v36 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  unsigned int v34 = a5;
  id v33 = a6;
  v18 = [(AMDFeature *)v38 _actualShape];
  id v17 = (id)[(NSMutableArray *)v18 objectAtIndexedSubscript:a5];
  unsigned int v19 = [v17 unsignedIntValue];

  unsigned int v32 = v19;
  if ([location count] == v19)
  {
    uint64_t v13 = [(AMDFeature *)v38 _actualShape];
    BOOL v14 = v34 + 1 != [(NSMutableArray *)v13 count];

    if (v14)
    {
      uint64_t v22 = (uint64_t)v36;
      uint64_t v21 = 0;
      for (unsigned int i = 0; i < v32; ++i)
      {
        id v10 = v38;
        id v11 = (id)[location objectAtIndexedSubscript:i];
        uint64_t v21 = -[AMDMultiArrayFeature fillDoubleMultiArray:fromSource:atDepth:error:](v10, "fillDoubleMultiArray:fromSource:atDepth:error:", v22);

        if (*v33)
        {
          id v39 = 0;
          int v28 = 1;
          goto LABEL_21;
        }
        uint64_t v22 = v21;
      }
      id v39 = (double *)v21;
      int v28 = 1;
    }
    else
    {
      id v27 = v36;
      id v26 = (id)[location firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        for (unsigned int j = 0; j < v32; ++j)
        {
          id v12 = (id)[location objectAtIndexedSubscript:j];
          [v12 doubleValue];
          *(void *)id v27 = v8;

          ++v27;
        }
        id v39 = v27;
        int v28 = 1;
      }
      else
      {
        uint64_t v25 = @"Data is not Float32";
        id v24 = &_os_log_internal;
        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v40, (uint64_t)v25);
          _os_log_error_impl(&dword_20ABD4000, (os_log_t)v24, OS_LOG_TYPE_ERROR, "%@", v40, 0xCu);
        }
        objc_storeStrong(&v24, 0);
        id v7 = +[AMDError allocError:16 withMessage:v25];
        *id v33 = v7;
        id v39 = 0;
        int v28 = 1;
        objc_storeStrong((id *)&v25, 0);
      }
      objc_storeStrong(&v26, 0);
    }
  }
  else
  {
    id v31 = objc_retainAutoreleasedReturnValue((id)objc_msgSend(NSString, "stringWithFormat:", @"Size mismatch while copying doubles at level %u: expected; %u, got: %lu",
                                                   v34,
                                                   v32,
                                                   [location count]));
    id v30 = &_os_log_internal;
    os_log_type_t v29 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v31);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v30, v29, "%@", v41, 0xCu);
    }
    objc_storeStrong(&v30, 0);
    id v6 = +[AMDError allocError:16 withMessage:v31];
    *id v33 = v6;
    id v39 = 0;
    int v28 = 1;
    objc_storeStrong(&v31, 0);
  }
LABEL_21:
  objc_storeStrong(&location, 0);
  return v39;
}

@end