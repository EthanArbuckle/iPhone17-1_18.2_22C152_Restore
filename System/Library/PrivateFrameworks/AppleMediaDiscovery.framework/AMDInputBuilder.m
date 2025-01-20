@interface AMDInputBuilder
+ (unsigned)getSizeOfDataType:(int64_t)a3;
- (AMDInputBuilder)initWithDictionary:(id)a3 andModelId:(id)a4;
- (BOOL)isMatchingShape:(id)a3 with:(id)a4;
- (BOOL)isValid;
- (NSMutableDictionary)inputsDefinitions;
- (NSString)modelId;
- (id)getGeneralMultiArrayForInput:(id)a3 withDataType:(int64_t)a4 andShape:(id)a5 withPaddingValue:(id)a6 usingMetadata:(id)a7 andModelAssets:(id)a8 error:(id *)a9;
- (id)getHyperParameterInput:(id)a3 usingMetadata:(id)a4 withInputFeatureDefinition:(id)a5;
- (id)getInputsWithMetadata:(id)a3 andModelAssets:(id)a4 error:(id *)a5;
- (id)getMinimalCToLMapping;
- (id)getModelInput:(id)a3 usingMetadata:(id)a4 andModelAssets:(id)a5 error:(id *)a6;
- (id)getRemapInfoFrom:(id)a3 andModelAssets:(id)a4;
- (id)getSimpleMultiArrayForInput:(id)a3 OfSize:(id)a4 withDataType:(int64_t)a5 withPaddingValue:(id)a6 usingMetadata:(id)a7 andModelAssets:(id)a8 error:(id *)a9;
- (void)setInputsDefinitions:(id)a3;
- (void)setModelId:(id)a3;
@end

@implementation AMDInputBuilder

- (AMDInputBuilder)initWithDictionary:(id)a3 andModelId:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  [v31 setModelId:v29];
  id v19 = (id)objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(location[0], "count"));
  objc_msgSend(v31, "setInputsDefinitions:");

  memset(__b, 0, sizeof(__b));
  id v20 = location[0];
  uint64_t v21 = [v20 countByEnumeratingWithState:__b objects:v33 count:16];
  if (v21)
  {
    uint64_t v15 = *(void *)__b[2];
    uint64_t v16 = 0;
    unint64_t v17 = v21;
    while (1)
    {
      uint64_t v14 = v16;
      if (*(void *)__b[2] != v15) {
        objc_enumerationMutation(v20);
      }
      uint64_t v28 = *(void *)(__b[1] + 8 * v16);
      id v26 = (id)[location[0] objectForKey:v28];
      id v25 = (id)objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v26, "count"));
      memset(v23, 0, sizeof(v23));
      id v12 = v26;
      uint64_t v13 = [v12 countByEnumeratingWithState:v23 objects:v32 count:16];
      if (v13)
      {
        uint64_t v9 = *(void *)v23[2];
        uint64_t v10 = 0;
        unint64_t v11 = v13;
        while (1)
        {
          uint64_t v8 = v10;
          if (*(void *)v23[2] != v9) {
            objc_enumerationMutation(v12);
          }
          uint64_t v24 = *(void *)(v23[1] + 8 * v10);
          v4 = [InputFeatureDefinition alloc];
          id v22 = [(InputFeatureDefinition *)v4 initWithDictionary:v24];
          if ([v22 isValid]) {
            [v25 addObject:v22];
          }
          objc_storeStrong(&v22, 0);
          ++v10;
          if (v8 + 1 >= v11)
          {
            uint64_t v10 = 0;
            unint64_t v11 = [v12 countByEnumeratingWithState:v23 objects:v32 count:16];
            if (!v11) {
              break;
            }
          }
        }
      }

      if ([v25 count])
      {
        id v7 = (id)[v31 inputsDefinitions];
        [v7 setObject:v25 forKey:v28];
      }
      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v26, 0);
      ++v16;
      if (v14 + 1 >= v17)
      {
        uint64_t v16 = 0;
        unint64_t v17 = [v20 countByEnumeratingWithState:__b objects:v33 count:16];
        if (!v17) {
          break;
        }
      }
    }
  }

  v6 = (AMDInputBuilder *)v31;
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v31, 0);
  return v6;
}

- (BOOL)isValid
{
  v3 = [(AMDInputBuilder *)self inputsDefinitions];
  char v5 = 0;
  BOOL v4 = 0;
  if (v3)
  {
    v6 = [(AMDInputBuilder *)self inputsDefinitions];
    char v5 = 1;
    BOOL v4 = [(NSMutableDictionary *)v6 count] != 0;
  }
  if (v5) {

  }
  return v4;
}

- (id)getInputsWithMetadata:(id)a3 andModelAssets:(id)a4 error:(id *)a5
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v43 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v41 = 0;
  objc_storeStrong(&v41, a4);
  v40 = a5;
  id v39 = @"getInputs";
  +[AMDPerf startMonitoringEvent:v39];
  id v38 = (id)objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(location[0], "count"));
  uint64_t v21 = [(AMDInputBuilder *)v43 inputsDefinitions];
  id v37 = (id)[(NSMutableDictionary *)v21 objectForKey:@"hyperparameters"];

  id v36 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  memset(__b, 0, sizeof(__b));
  id v22 = v37;
  uint64_t v23 = [v22 countByEnumeratingWithState:__b objects:v47 count:16];
  if (v23)
  {
    uint64_t v16 = *(void *)__b[2];
    uint64_t v17 = 0;
    unint64_t v18 = v23;
    while (1)
    {
      uint64_t v15 = v17;
      if (*(void *)__b[2] != v16) {
        objc_enumerationMutation(v22);
      }
      id v35 = *(id *)(__b[1] + 8 * v17);
      id v33 = (id)[v35 featureId];
      [v36 addObject:v33];
      id v32 = (id)[location[0] objectForKey:v33];
      id v31 = [(AMDInputBuilder *)v43 getHyperParameterInput:v33 usingMetadata:v32 withInputFeatureDefinition:v35];
      if (v31)
      {
        [v38 setObject:v31 forKey:v33];
        int v28 = 0;
      }
      else
      {
        os_log_t oslog = (os_log_t)&_os_log_internal;
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          __os_log_helper_16_2_1_8_64((uint64_t)v46, (uint64_t)v33);
          _os_log_error_impl(&dword_20ABD4000, log, type, "could not build input array for hyperparameter %@", v46, 0xCu);
        }
        objc_storeStrong((id *)&oslog, 0);
        int v28 = 3;
      }
      objc_storeStrong(&v31, 0);
      objc_storeStrong(&v32, 0);
      objc_storeStrong(&v33, 0);
      ++v17;
      if (v15 + 1 >= v18)
      {
        uint64_t v17 = 0;
        unint64_t v18 = [v22 countByEnumeratingWithState:__b objects:v47 count:16];
        if (!v18) {
          break;
        }
      }
    }
  }

  memset(v26, 0, sizeof(v26));
  id v12 = location[0];
  uint64_t v13 = [v12 countByEnumeratingWithState:v26 objects:v45 count:16];
  if (v13)
  {
    uint64_t v9 = *(void *)v26[2];
    uint64_t v10 = 0;
    unint64_t v11 = v13;
    while (1)
    {
      uint64_t v8 = v10;
      if (*(void *)v26[2] != v9) {
        objc_enumerationMutation(v12);
      }
      uint64_t v27 = *(void *)(v26[1] + 8 * v10);
      if (([v36 containsObject:v27] & 1) == 0)
      {
        id v25 = (id)[location[0] objectForKey:v27];
        id v24 = [(AMDInputBuilder *)v43 getModelInput:v27 usingMetadata:v25 andModelAssets:v41 error:v40];
        if (!*v40 && v24)
        {
          [v38 setObject:v24 forKey:v27];
          int v28 = 0;
        }
        else
        {
          uint64_t v44 = 0;
          int v28 = 1;
        }
        objc_storeStrong(&v24, 0);
        objc_storeStrong(&v25, 0);
        if (v28) {
          break;
        }
      }
      ++v10;
      if (v8 + 1 >= v11)
      {
        uint64_t v10 = 0;
        unint64_t v11 = [v12 countByEnumeratingWithState:v26 objects:v45 count:16];
        if (!v11) {
          goto LABEL_24;
        }
      }
    }
  }
  else
  {
LABEL_24:
    int v28 = 0;
  }

  if (!v28)
  {
    +[AMDPerf endMonitoringEvent:v39];
    id v5 = objc_alloc(MEMORY[0x263F00D38]);
    uint64_t v44 = [v5 initWithDictionary:v38 error:v40];
    int v28 = 1;
  }
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(location, 0);
  v6 = (void *)v44;

  return v6;
}

- (id)getHyperParameterInput:(id)a3 usingMetadata:(id)a4 withInputFeatureDefinition:(id)a5
{
  v47[2] = *MEMORY[0x263EF8340];
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v43 = 0;
  objc_storeStrong(&v43, a4);
  id v42 = 0;
  objc_storeStrong(&v42, a5);
  id v41 = (id)[v43 getSize];
  uint64_t v40 = [v43 getDataType];
  id v39 = (id)[v43 getPaddingValue];
  id v38 = (id)[v42 featureValues];
  if (v41 && v40)
  {
    v47[0] = &unk_26BEC2330;
    v47[1] = v41;
    id v36 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
    id v35 = &unk_26BEC3720;
    id v34 = (id)objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:", +[AMDInputBuilder getSizeOfDataType:](AMDInputBuilder, "getSizeOfDataType:", v40)* objc_msgSend(v41, "intValue"));
    id v33 = 0;
    switch(v40)
    {
      case 65568:
        float v31 = 0.0;
        if (v39)
        {
          [v39 floatValue];
          double v21 = v6;
        }
        else
        {
          double v21 = 0.0;
        }
        float v7 = v21;
        float v31 = v7;
        unsigned int v20 = [v41 intValue];
        uint64_t v8 = [v34 mutableBytes];
        *(float *)&double v9 = v31;
        +[AMDFeature copyFloat32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "copyFloat32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:", v20, v38, v8, 0, v9);
        break;
      case 65600:
        double v32 = 0.0;
        if (v39)
        {
          [v39 doubleValue];
          double v22 = v5;
        }
        else
        {
          double v22 = 0.0;
        }
        double v32 = v22;
        +[AMDFeature copyDoubleValues:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "copyDoubleValues:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:", [v41 intValue], v38, objc_msgSend(v34, "mutableBytes"), 0, v22);
        break;
      case 131104:
        unsigned int v30 = 0;
        if (v39) {
          unsigned int v19 = [v39 intValue];
        }
        else {
          unsigned int v19 = 0;
        }
        unsigned int v30 = v19;
        +[AMDFeature copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:](AMDFeature, "copyInt32Values:fromArray:toBuffer:withDefaultValue:withRemapDictionary:andPostRemapOperation:", [v41 intValue], v38, objc_msgSend(v34, "mutableBytes"), v19, 0);
        break;
      default:
        id v10 = +[AMDError allocError:16 withMessage:@"invalid data type for hyperparameter"];
        id v11 = v33;
        id v33 = v10;

        break;
    }
    if (v33)
    {
      id v45 = 0;
      int v37 = 1;
    }
    else
    {
      id v28 = 0;
      unint64_t v18 = objc_msgSend(objc_alloc(MEMORY[0x263F00DA8]), "initWithDataPointer:shape:dataType:strides:deallocator:error:", objc_msgSend(v34, "mutableBytes"), v36, v40, v35, 0, &v28);
      objc_storeStrong(&v33, v28);
      id v29 = v18;
      if (v33)
      {
        id v27 = &_os_log_internal;
        char v26 = 16;
        if (os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_ERROR))
        {
          log = v27;
          os_log_type_t type = v26;
          id v14 = location[0];
          id v17 = (id)[v33 localizedDescription];
          id v25 = v17;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v46, (uint64_t)v14, (uint64_t)v25);
          _os_log_error_impl(&dword_20ABD4000, log, type, "Error while initialising for feature %@ input array: %@", v46, 0x16u);

          objc_storeStrong(&v25, 0);
        }
        objc_storeStrong(&v27, 0);
        id v45 = 0;
        int v37 = 1;
      }
      else
      {
        id v45 = v29;
        int v37 = 1;
      }
      objc_storeStrong(&v29, 0);
    }
    objc_storeStrong(&v33, 0);
    objc_storeStrong(&v34, 0);
    objc_storeStrong(&v35, 0);
    objc_storeStrong(&v36, 0);
  }
  else
  {
    id v45 = 0;
    int v37 = 1;
  }
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(location, 0);
  id v12 = v45;

  return v12;
}

- (id)getModelInput:(id)a3 usingMetadata:(id)a4 andModelAssets:(id)a5 error:(id *)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v26 = 0;
  objc_storeStrong(&v26, a4);
  id v25 = 0;
  objc_storeStrong(&v25, a5);
  id v24 = a6;
  if (v26)
  {
    uint64_t v19 = [v26 getDataType];
    if (v19)
    {
      id v15 = (id)[v26 getPaddingValue];
      id v14 = (id)[v26 getShape];
      if (v14)
      {
        id v29 = [(AMDInputBuilder *)v28 getGeneralMultiArrayForInput:location[0] withDataType:v19 andShape:v14 withPaddingValue:v15 usingMetadata:v26 andModelAssets:v25 error:v24];
        int v20 = 1;
      }
      else
      {
        id v13 = (id)[v26 getSize];
        id v29 = [(AMDInputBuilder *)v28 getSimpleMultiArrayForInput:location[0] OfSize:v13 withDataType:v19 withPaddingValue:v15 usingMetadata:v26 andModelAssets:v25 error:v24];
        int v20 = 1;
        objc_storeStrong(&v13, 0);
      }
      objc_storeStrong(&v14, 0);
      objc_storeStrong(&v15, 0);
    }
    else
    {
      unint64_t v18 = @"No datatype available, check model metadata";
      id v17 = &_os_log_internal;
      os_log_type_t v16 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v30, (uint64_t)v18);
        _os_log_error_impl(&dword_20ABD4000, (os_log_t)v17, v16, "%@", v30, 0xCu);
      }
      objc_storeStrong(&v17, 0);
      id v7 = +[AMDError allocError:16 withMessage:v18];
      *id v24 = v7;
      id v29 = 0;
      int v20 = 1;
      objc_storeStrong((id *)&v18, 0);
    }
  }
  else
  {
    uint64_t v23 = @"No model metadata available";
    id v22 = &_os_log_internal;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v31, (uint64_t)v23);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v22, v21, "%@", v31, 0xCu);
    }
    objc_storeStrong(&v22, 0);
    id v6 = +[AMDError allocError:16 withMessage:v23];
    *id v24 = v6;
    id v29 = 0;
    int v20 = 1;
    objc_storeStrong((id *)&v23, 0);
  }
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  uint64_t v8 = v29;

  return v8;
}

- (BOOL)isMatchingShape:(id)a3 with:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  uint64_t v10 = [location[0] count];
  if (v10 == [v12 count])
  {
    for (int i = 0; i < (unint64_t)[location[0] count]; ++i)
    {
      id v7 = (id)[location[0] objectAtIndexedSubscript:i];
      int v5 = [v7 intValue];
      id v6 = (id)[v12 objectAtIndexedSubscript:i];
      BOOL v8 = v5 == [v6 intValue];

      if (!v8)
      {
        char v14 = 0;
        goto LABEL_9;
      }
    }
    char v14 = 1;
  }
  else
  {
    char v14 = 0;
  }
LABEL_9:
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v14 & 1;
}

- (id)getGeneralMultiArrayForInput:(id)a3 withDataType:(int64_t)a4 andShape:(id)a5 withPaddingValue:(id)a6 usingMetadata:(id)a7 andModelAssets:(id)a8 error:(id *)a9
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  v67 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v65 = a4;
  id v64 = 0;
  objc_storeStrong(&v64, a5);
  id v63 = 0;
  objc_storeStrong(&v63, a6);
  id v62 = 0;
  objc_storeStrong(&v62, a7);
  id v61 = 0;
  objc_storeStrong(&v61, a8);
  v60 = a9;
  int v37 = [(AMDInputBuilder *)v67 inputsDefinitions];
  id v59 = (id)[(NSMutableDictionary *)v37 objectForKey:location[0]];

  if (v59 && [v59 count] == 1)
  {
    id v54 = (id)[v59 firstObject];
    id v30 = (id)[v54 shape];
    char v52 = 0;
    BOOL v31 = 1;
    if (v30)
    {
      id v53 = (id)[v54 shape];
      char v52 = 1;
      BOOL v31 = [v53 count] == 0;
    }
    if (v52) {

    }
    if (v31)
    {
      id v51 = (id)[NSString stringWithFormat:@"Empty input definition for feature '%@'", location[0]];
      os_log_t oslog = (os_log_t)&_os_log_internal;
      os_log_type_t v49 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v72, (uint64_t)v51);
        _os_log_error_impl(&dword_20ABD4000, oslog, v49, "%@", v72, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      id *v60 = +[AMDError allocError:16 withMessage:v51];
      id v68 = 0;
      int v55 = 1;
      objc_storeStrong(&v51, 0);
    }
    else
    {
      id v27 = v67;
      id v26 = v64;
      id v28 = (id)[v54 shape];
      BOOL v29 = -[AMDInputBuilder isMatchingShape:with:](v27, "isMatchingShape:with:", v26);

      if (v29)
      {
        id v19 = (id)[v54 featureType];
        char v44 = 0;
        BOOL v20 = 0;
        if ([v19 isEqual:@"RowSet"])
        {
          id v45 = (id)[v54 columnName];
          char v44 = 1;
          BOOL v20 = v45 == 0;
        }
        if (v44) {

        }
        if (v20)
        {
          id v17 = NSString;
          id v18 = (id)[v54 featureId];
          id v43 = (id)[v17 stringWithFormat:@"Error %@: No column name specified for a feature of type RowSet", v18];

          os_log_t v42 = (os_log_t)&_os_log_internal;
          os_log_type_t v41 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_1_8_64((uint64_t)v70, (uint64_t)v43);
            _os_log_error_impl(&dword_20ABD4000, v42, v41, "%@", v70, 0xCu);
          }
          objc_storeStrong((id *)&v42, 0);
          id *v60 = +[AMDError allocError:16 withMessage:v43];
          id v68 = 0;
          int v55 = 1;
          objc_storeStrong(&v43, 0);
        }
        else
        {
          id v16 = (id)[v54 featureProvider];
          id v15 = (id)[v54 featureId];
          id v14 = (id)[v54 columnName];
          id v40 = (id)objc_msgSend(v16, "getFeatureWithName:withColumn:error:", v15);

          if (!*v60 && v40)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v40 setDataType:v65];
              [v40 setShape:v64];
              id v11 = [(AMDInputBuilder *)v67 getRemapInfoFrom:v54 andModelAssets:v61];
              objc_msgSend(v40, "setRemapInfo:");

              id v68 = (id)[v40 getMultiArray:v60];
              int v55 = 1;
            }
            else
            {
              id v12 = NSString;
              id v13 = (id)[v54 featureId];
              id v39 = (id)[v12 stringWithFormat:@"Feature '%@' is not a multi-array, check!", v13];

              os_log_t v38 = (os_log_t)&_os_log_internal;
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                __os_log_helper_16_2_1_8_64((uint64_t)v69, (uint64_t)v39);
                _os_log_error_impl(&dword_20ABD4000, v38, OS_LOG_TYPE_ERROR, "%@", v69, 0xCu);
              }
              objc_storeStrong((id *)&v38, 0);
              id *v60 = +[AMDError allocError:16 withMessage:v39];
              id v68 = 0;
              int v55 = 1;
              objc_storeStrong(&v39, 0);
            }
          }
          else
          {
            id v68 = 0;
            int v55 = 1;
          }
          objc_storeStrong(&v40, 0);
        }
      }
      else
      {
        uint64_t v23 = NSString;
        id v21 = location[0];
        id v22 = v64;
        id v25 = (id)[v54 shape];
        id v24 = (id)[v23 stringWithFormat:@"Unexpected shapes of data for feature '%@', expected: %@, got: %@", v21, v22, v25];
        id v48 = (id)[v24 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_26BEAC9D8];

        os_log_t v47 = (os_log_t)&_os_log_internal;
        os_log_type_t v46 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_1_8_64((uint64_t)v71, (uint64_t)v48);
          _os_log_error_impl(&dword_20ABD4000, v47, v46, "%@", v71, 0xCu);
        }
        objc_storeStrong((id *)&v47, 0);
        id *v60 = +[AMDError allocError:16 withMessage:v48];
        id v68 = 0;
        int v55 = 1;
        objc_storeStrong(&v48, 0);
      }
    }
    objc_storeStrong(&v54, 0);
  }
  else
  {
    id v58 = (id)[NSString stringWithFormat:@"Missing or invalid input definition for feature '%@'", location[0]];
    id v57 = &_os_log_internal;
    os_log_type_t v56 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v57, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v73, (uint64_t)v58);
      _os_log_error_impl(&dword_20ABD4000, (os_log_t)v57, v56, "%@", v73, 0xCu);
    }
    objc_storeStrong(&v57, 0);
    id *v60 = +[AMDError allocError:16 withMessage:v58];
    id v68 = 0;
    int v55 = 1;
    objc_storeStrong(&v58, 0);
  }
  objc_storeStrong(&v59, 0);
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&v62, 0);
  objc_storeStrong(&v63, 0);
  objc_storeStrong(&v64, 0);
  objc_storeStrong(location, 0);
  double v9 = v68;

  return v9;
}

- (id)getSimpleMultiArrayForInput:(id)a3 OfSize:(id)a4 withDataType:(int64_t)a5 withPaddingValue:(id)a6 usingMetadata:(id)a7 andModelAssets:(id)a8 error:(id *)a9
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  v89 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v87 = 0;
  objc_storeStrong(&v87, a4);
  int64_t v86 = a5;
  id v85 = 0;
  objc_storeStrong(&v85, a6);
  id v84 = 0;
  objc_storeStrong(&v84, a7);
  id v83 = 0;
  objc_storeStrong(&v83, a8);
  v82 = a9;
  v60 = [(AMDInputBuilder *)v89 inputsDefinitions];
  id v81 = (id)[(NSMutableDictionary *)v60 objectForKey:location[0]];

  if (v81)
  {
    char v52 = (void *)MEMORY[0x263EFF990];
    unsigned int v51 = +[AMDInputBuilder getSizeOfDataType:v86];
    id v76 = (id)objc_msgSend(v52, "dataWithLength:", v51 * objc_msgSend(v87, "intValue"));
    uint64_t v75 = [v76 mutableBytes];
    memset(__b, 0, sizeof(__b));
    id v53 = v81;
    uint64_t v54 = [v53 countByEnumeratingWithState:__b objects:v93 count:16];
    if (v54)
    {
      uint64_t v48 = *(void *)__b[2];
      uint64_t v49 = 0;
      unint64_t v50 = v54;
      while (1)
      {
        uint64_t v47 = v49;
        if (*(void *)__b[2] != v48) {
          objc_enumerationMutation(v53);
        }
        id v74 = *(id *)(__b[1] + 8 * v49);
        id v45 = (id)[v74 columnName];
        char v71 = 0;
        LOBYTE(v46) = 0;
        if (v45)
        {
          id v72 = (id)[v74 featureType];
          char v71 = 1;
          int v46 = [v72 isEqual:@"RowSet"] ^ 1;
        }
        if (v71) {

        }
        if (v46) {
          break;
        }
        id v40 = (id)[v74 featureProvider];
        id v39 = (id)[v74 featureId];
        id v38 = (id)[v74 columnName];
        id v67 = (id)objc_msgSend(v40, "getFeatureWithName:withColumn:error:", v39);

        if (!*v82 && v67)
        {
          id v66 = [(AMDInputBuilder *)v89 getRemapInfoFrom:v74 andModelAssets:v83];
          id v36 = (id)[v74 size];
          unsigned int v37 = [v36 intValue];

          unsigned int v65 = v37;
          if (v86 == 65552)
          {
            id v90 = 0;
            int v77 = 1;
          }
          else
          {
            switch(v86)
            {
              case 65568:
                float v63 = 0.0;
                if (v85)
                {
                  [v85 floatValue];
                  double v31 = v12;
                }
                else
                {
                  double v31 = 0.0;
                }
                float v13 = v31;
                float v63 = v13;
                id v29 = v67;
                uint64_t v27 = v75;
                float v28 = v13;
                id v14 = (id)[v74 mapOp];
                *(float *)&double v15 = v28;
                id v30 = v14;
                objc_msgSend(v29, "copyFloat32Values:toBuffer:withDefaultValue:withMapOp:withRemapDictionary:andPostRemapOperation:", v65, v27, v15);

                v75 += 4 * (int)v65;
                break;
              case 65600:
                double v64 = 0.0;
                if (v85)
                {
                  [v85 doubleValue];
                  double v35 = v11;
                }
                else
                {
                  double v35 = 0.0;
                }
                double v64 = v35;
                id v33 = v67;
                uint64_t v32 = v75;
                id v34 = (id)[v74 mapOp];
                objc_msgSend(v33, "copyDoubleValues:toBuffer:withDefaultValue:withMapOp:withRemapDictionary:andPostRemapOperation:", v65, v32, v35);

                v75 += 8 * (int)v65;
                break;
              case 131104:
                unsigned int v62 = 0;
                if (v85) {
                  unsigned int v26 = [v85 intValue];
                }
                else {
                  unsigned int v26 = 0;
                }
                unsigned int v62 = v26;
                id v24 = v67;
                uint64_t v23 = v75;
                id v25 = (id)[v74 mapOp];
                objc_msgSend(v24, "copyInt32Values:toBuffer:withDefaultValue:withMapOp:withRemapInfo:andPostRemapOperation:", v65, v23, v26);

                v75 += 4 * (int)v65;
                break;
            }
            int v77 = 0;
          }
          objc_storeStrong(&v66, 0);
        }
        else
        {
          id v90 = 0;
          int v77 = 1;
        }
        objc_storeStrong(&v67, 0);
        if (v77) {
          goto LABEL_44;
        }
        ++v49;
        if (v47 + 1 >= v50)
        {
          uint64_t v49 = 0;
          unint64_t v50 = [v53 countByEnumeratingWithState:__b objects:v93 count:16];
          if (!v50) {
            goto LABEL_43;
          }
        }
      }
      id v43 = NSString;
      id v44 = (id)[v74 featureId];
      id v70 = (id)[v43 stringWithFormat:@"Error %@: Column name can only be specified for a feature of type RowSet", v44];

      os_log_t v69 = (os_log_t)&_os_log_internal;
      os_log_type_t v68 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        os_log_type_t v41 = v69;
        os_log_type_t v42 = v68;
        __os_log_helper_16_2_1_8_64((uint64_t)v92, (uint64_t)v70);
        _os_log_error_impl(&dword_20ABD4000, v41, v42, "%@", v92, 0xCu);
      }
      objc_storeStrong((id *)&v69, 0);
      id v10 = +[AMDError allocError:16 withMessage:v70];
      id *v82 = v10;
      id v90 = 0;
      int v77 = 1;
      objc_storeStrong(&v70, 0);
    }
    else
    {
LABEL_43:
      int v77 = 0;
    }
LABEL_44:

    if (!v77)
    {
      id v18 = location[0];
      uint64_t v19 = [v76 mutableBytes];
      +[AMDMiscHelpers printInput:withRawData:withType:andSize:](AMDMiscHelpers, "printInput:withRawData:withType:andSize:", v18, v19, v86, [v87 intValue]);
      id v21 = objc_alloc(MEMORY[0x263F00DA8]);
      uint64_t v20 = [v76 mutableBytes];
      v91[0] = &unk_26BEC2330;
      v91[1] = v87;
      id v22 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v91 count:2];
      id v61 = (id)objc_msgSend(v21, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v20);

      if (*v82) {
        id v90 = 0;
      }
      else {
        id v90 = v61;
      }
      int v77 = 1;
      objc_storeStrong(&v61, 0);
    }
    objc_storeStrong(&v76, 0);
  }
  else
  {
    id v80 = (id)[NSString stringWithFormat:@"No input definition for feature '%@'", location[0]];
    os_log_t oslog = (os_log_t)&_os_log_internal;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v94, (uint64_t)v80);
      _os_log_error_impl(&dword_20ABD4000, oslog, type, "%@", v94, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v9 = +[AMDError allocError:16 withMessage:v80];
    id *v82 = v9;
    id v90 = 0;
    int v77 = 1;
    objc_storeStrong(&v80, 0);
  }
  objc_storeStrong(&v81, 0);
  objc_storeStrong(&v83, 0);
  objc_storeStrong(&v84, 0);
  objc_storeStrong(&v85, 0);
  objc_storeStrong(&v87, 0);
  objc_storeStrong(location, 0);
  id v16 = v90;

  return v16;
}

- (id)getRemapInfoFrom:(id)a3 andModelAssets:(id)a4
{
  double v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  id v7 = (id)[location[0] remapDictionaryId];
  char v11 = 0;
  LOBYTE(v8) = 1;
  if (v7)
  {
    id v12 = (id)[location[0] remapDictionaryId];
    char v11 = 1;
    int v8 = [v12 isEqualToString:0x26BEB2DF8] ^ 1;
  }
  if (v11) {

  }
  if (v8)
  {
    id v16 = 0;
    int v10 = 1;
  }
  else if (([v13 getMinimalMapPresent] & 1) == 0 {
         || ((id v9 = [(AMDInputBuilder *)v15 getMinimalCToLMapping]) == 0
  }
           ? (int v10 = 0)
           : (v16 = v9, int v10 = 1),
             objc_storeStrong(&v9, 0),
             !v10))
  {
    id v16 = (id)[v13 getContentToLogicalMap];
    int v10 = 1;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  BOOL v4 = v16;

  return v4;
}

+ (unsigned)getSizeOfDataType:(int64_t)a3
{
  switch(a3)
  {
    case 65552:
      return 2;
    case 65568:
      return 4;
    case 65600:
      return 8;
    case 131104:
      return 4;
  }
  return 0;
}

- (id)getMinimalCToLMapping
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v15 = self;
  v14[1] = (id)a2;
  v2 = [(AMDInputBuilder *)self modelId];
  BOOL v9 = v2 != 0;

  if (v9)
  {
    v14[0] = 0;
    id v6 = NSString;
    id v7 = [(AMDInputBuilder *)v15 modelId];
    id v13 = (id)[v6 stringWithFormat:@"%@%@", 0x26BEB7D38, v7];

    id v11 = v14[0];
    id v8 = +[AMDTasteProfile getFeatureValueWithName:v13 inDomain:@"apps" error:&v11];
    objc_storeStrong(v14, v11);
    id v12 = v8;
    if (v8)
    {
      id v10 = &_os_log_internal;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
      {
        int v5 = [(AMDInputBuilder *)v15 modelId];
        __os_log_helper_16_2_1_8_64((uint64_t)v17, (uint64_t)v5);
        _os_log_debug_impl(&dword_20ABD4000, (os_log_t)v10, OS_LOG_TYPE_DEBUG, "Content to logical id map for model '%@' found", v17, 0xCu);
      }
      objc_storeStrong(&v10, 0);
    }
    id v16 = v12;
    objc_storeStrong(&v12, 0);
    objc_storeStrong(&v13, 0);
    objc_storeStrong(v14, 0);
  }
  else
  {
    id v16 = 0;
  }
  v3 = v16;

  return v3;
}

- (NSMutableDictionary)inputsDefinitions
{
  return self->_inputsDefinitions;
}

- (void)setInputsDefinitions:(id)a3
{
}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setModelId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end