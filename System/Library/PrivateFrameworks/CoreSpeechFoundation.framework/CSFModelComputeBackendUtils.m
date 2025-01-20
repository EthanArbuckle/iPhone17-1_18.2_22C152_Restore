@interface CSFModelComputeBackendUtils
+ (id)_flattenArray:(id)a3;
+ (id)compileWithMilFile:(id)a3 bnnsIrPath:(id)a4;
+ (id)compileWithMilFile:(id)a3 bnnsIrPath:(id)a4 separateWeight:(id)a5;
+ (id)getShapeWithTensors:(id)a3;
+ (int64_t)getRankOfTensor:(id)a3;
+ (unint64_t)_getElementSizeFromShape:(id)a3;
@end

@implementation CSFModelComputeBackendUtils

+ (unint64_t)_getElementSizeFromShape:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      unint64_t v8 = 1;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          v8 *= [*(id *)(*((void *)&v11 + 1) + 8 * i) unsignedLongValue];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
    else
    {
      unint64_t v8 = 1;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

+ (id)_flattenArray:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 getShapeWithTensors:v4];
  if ([v5 count] == 1)
  {
    id v6 = v4;
  }
  else if ([v5 count] == 2)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    unint64_t v8 = [v5 firstObject];
    uint64_t v9 = [v8 unsignedLongValue];

    if (v9)
    {
      unint64_t v10 = 0;
      do
      {
        long long v11 = [v4 objectAtIndexedSubscript:v10];
        long long v12 = [v5 objectAtIndexedSubscript:1];
        uint64_t v13 = [v12 unsignedLongValue];

        if (v13)
        {
          unint64_t v14 = 0;
          do
          {
            v15 = [v11 objectAtIndexedSubscript:v14];
            [v7 addObject:v15];

            ++v14;
            uint64_t v16 = [v5 objectAtIndexedSubscript:1];
            unint64_t v17 = [v16 unsignedLongValue];
          }
          while (v14 < v17);
        }

        ++v10;
        v18 = [v5 firstObject];
        unint64_t v19 = [v18 unsignedLongValue];
      }
      while (v10 < v19);
    }
    id v6 = (id)[v7 copy];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (int64_t)getRankOfTensor:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 firstObject];

    if (v5)
    {
      id v6 = [v4 firstObject];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        int64_t v5 = 1;
      }
      else
      {
        unint64_t v8 = [v4 firstObject];
        objc_opt_class();
        char v9 = objc_opt_isKindOfClass();

        if ((v9 & 1) == 0) {
          goto LABEL_9;
        }
        unint64_t v10 = [v4 firstObject];
        long long v11 = [v10 firstObject];
        objc_opt_class();
        char v12 = objc_opt_isKindOfClass();

        if (v12)
        {
          int64_t v5 = 2;
        }
        else
        {
LABEL_9:
          uint64_t v13 = CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            int v15 = 136315138;
            uint64_t v16 = "+[CSFModelComputeBackendUtils getRankOfTensor:]";
            _os_log_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_DEFAULT, "%s No support for tensor with rank > 2", (uint8_t *)&v15, 0xCu);
          }
          int64_t v5 = -1;
        }
      }
    }
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

+ (id)compileWithMilFile:(id)a3 bnnsIrPath:(id)a4 separateWeight:(id)a5
{
  return +[CSFMil2bnnsComputeBackend compileWithMilFile:a3 bnnsIrPath:a4 separateWeight:a5];
}

+ (id)compileWithMilFile:(id)a3 bnnsIrPath:(id)a4
{
  return +[CSFMil2bnnsComputeBackend compileWithMilFile:a3 bnnsIrPath:a4 separateWeight:0];
}

+ (id)getShapeWithTensors:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_12;
  }
  int64_t v5 = [v3 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v22[0] = v7;
    unint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
LABEL_9:

    goto LABEL_13;
  }
  char v9 = [v4 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    unint64_t v10 = [v4 firstObject];
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) == 0) {
      goto LABEL_12;
    }
  }
  char v12 = [v4 firstObject];
  uint64_t v13 = [v12 firstObject];
  objc_opt_class();
  char v14 = objc_opt_isKindOfClass();

  if (v14)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    int v15 = [v4 firstObject];
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    [v7 addObject:v16];

    uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    [v7 addObject:v17];

    unint64_t v8 = (void *)[v7 copy];
    goto LABEL_9;
  }
  v18 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    int v20 = 136315138;
    v21 = "+[CSFModelComputeBackendUtils getShapeWithTensors:]";
    _os_log_error_impl(&dword_1BA1A5000, v18, OS_LOG_TYPE_ERROR, "%s input tensor not valid, rank > 3 tensor is not supported", (uint8_t *)&v20, 0xCu);
  }
LABEL_12:
  unint64_t v8 = 0;
LABEL_13:

  return v8;
}

@end