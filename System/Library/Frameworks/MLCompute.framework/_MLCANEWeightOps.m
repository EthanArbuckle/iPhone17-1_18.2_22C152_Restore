@interface _MLCANEWeightOps
+ (id)hexStringForData:(id)a3;
- (BOOL)convertAndComputHashWithWeightData:(id)a3 weightDataType:(int)a4 hash:(id *)a5 convertedData:(id *)a6;
- (NSMutableArray)weightFiles;
- (NSMutableDictionary)constantTensorMap;
- (NSMutableDictionary)weightFileIndexMap;
- (NSMutableDictionary)weights;
- (_MLCANEWeightOps)init;
- (id)queryConstantTensor:(id)a3;
- (unint64_t)addWeightData:(id)a3 hash:(id)a4;
- (unint64_t)addWeightData:(id)a3 weightDataType:(int)a4;
- (void)reset;
@end

@implementation _MLCANEWeightOps

+ (id)hexStringForData:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = CC_SHA256((const void *)[v3 bytes], objc_msgSend(v3, "length"), md);
  v5 = (void *)MEMORY[0x1E01B11E0](v4);
  v6 = (void *)[&stru_1F38596E0 mutableCopy];
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v6, "appendFormat:", @"%02X", md[i]);

  return v6;
}

- (_MLCANEWeightOps)init
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)_MLCANEWeightOps;
  v2 = [(_MLCANEWeightOps *)&v19 init];
  if (v2)
  {
    id v3 = (void *)MEMORY[0x1E4F1CC08];
    uint64_t v4 = [MEMORY[0x1E4F1CC08] mutableCopy];
    weights = v2->_weights;
    v2->_weights = (NSMutableDictionary *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CBF0] mutableCopy];
    weightFiles = v2->_weightFiles;
    v2->_weightFiles = (NSMutableArray *)v6;

    uint64_t v8 = [v3 mutableCopy];
    weightFileIndexMap = v2->_weightFileIndexMap;
    v2->_weightFileIndexMap = (NSMutableDictionary *)v8;

    uint64_t v10 = [(NSMutableDictionary *)v2->_weights count];
    v11 = objc_msgSend(kMLCANEWeightFileNamePrefix, "stringByAppendingFormat:", @"%lu", v10);
    v20 = v11;
    v12 = [MEMORY[0x1E4F1C9B8] data];
    v21[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v14 = v2->_weights;
    v15 = [NSNumber numberWithUnsignedInteger:v10];
    [(NSMutableDictionary *)v14 setObject:v13 forKeyedSubscript:v15];

    [(NSMutableArray *)v2->_weightFiles addObject:v11];
    uint64_t v16 = [v3 mutableCopy];
    constantTensorMap = v2->_constantTensorMap;
    v2->_constantTensorMap = (NSMutableDictionary *)v16;
  }
  return v2;
}

- (BOOL)convertAndComputHashWithWeightData:(id)a3 weightDataType:(int)a4 hash:(id *)a5 convertedData:(id *)a6
{
  id v10 = a3;
  v11 = v10;
  if (a4 > 9) {
    goto LABEL_10;
  }
  id v12 = v10;
  if (((1 << a4) & 0x348) != 0)
  {
LABEL_3:
    *a5 = [(id)objc_opt_class() hexStringForData:v12];
    id v12 = v12;
    *a6 = v12;
    BOOL v13 = 1;
    goto LABEL_4;
  }
  if (a4 == 1)
  {
    size_t v15 = (unint64_t)[v10 length] >> 1;
    uint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytesNoCopy:length:freeWhenDone:", malloc_type_malloc(v15, 0xAF7DF5EFuLL), v15, 1);

    unint64_t v17 = (unint64_t)[v11 length] >> 2;
    uint64_t v18 = [v11 bytes];
    id v12 = v16;
    if (+[MLCDataHelper convertFp32toFp16:fp32Values:fp16Values:](MLCDataHelper, "convertFp32toFp16:fp32Values:fp16Values:", v17, v18, [v12 bytes]))
    {
      goto LABEL_3;
    }
    objc_super v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_MLCANEWeightOps convertAndComputHashWithWeightData:weightDataType:hash:convertedData:](a2);
    }

    BOOL v13 = 0;
  }
  else
  {
LABEL_10:
    v20 = +[MLCLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[_MLCANEWeightOps convertAndComputHashWithWeightData:weightDataType:hash:convertedData:](a2, a4, v20);
    }

    BOOL v13 = 0;
    id v12 = v11;
  }
LABEL_4:

  return v13;
}

- (unint64_t)addWeightData:(id)a3 hash:(id)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v24[0] = v7;
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  v24[1] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];

  id v10 = [(_MLCANEWeightOps *)self weightFileIndexMap];
  v11 = [v10 objectForKeyedSubscript:v9];

  if (v11)
  {
    id v12 = [(_MLCANEWeightOps *)self weightFileIndexMap];
    BOOL v13 = [v12 objectForKeyedSubscript:v9];
    unint64_t v14 = [v13 unsignedIntegerValue];
  }
  else
  {
    size_t v15 = [(_MLCANEWeightOps *)self weights];
    unint64_t v14 = [v15 count];

    id v12 = objc_msgSend(kMLCANEWeightFileNamePrefix, "stringByAppendingFormat:", @"%lu", v14);
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:v14];
    unint64_t v17 = [(_MLCANEWeightOps *)self weightFileIndexMap];
    [v17 setObject:v16 forKeyedSubscript:v9];

    v22 = v12;
    id v23 = v6;
    uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    objc_super v19 = [(_MLCANEWeightOps *)self weights];
    v20 = [NSNumber numberWithUnsignedInteger:v14];
    [v19 setObject:v18 forKeyedSubscript:v20];

    BOOL v13 = [(_MLCANEWeightOps *)self weightFiles];
    [v13 addObject:v12];
  }

  return v14;
}

- (unint64_t)addWeightData:(id)a3 weightDataType:(int)a4
{
  id v12 = 0;
  id v13 = 0;
  BOOL v6 = [(_MLCANEWeightOps *)self convertAndComputHashWithWeightData:a3 weightDataType:*(void *)&a4 hash:&v13 convertedData:&v12];
  id v7 = v13;
  id v8 = v12;
  if (v6)
  {
    unint64_t v9 = [(_MLCANEWeightOps *)self addWeightData:v8 hash:v7];
  }
  else
  {
    id v10 = +[MLCLog framework];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_MLCANEWeightOps addWeightData:weightDataType:](a2);
    }

    unint64_t v9 = -1;
  }

  return v9;
}

- (id)queryConstantTensor:(id)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [v5 data];
  id v7 = [v5 descriptor];
  id v21 = 0;
  id v22 = 0;
  BOOL v8 = -[_MLCANEWeightOps convertAndComputHashWithWeightData:weightDataType:hash:convertedData:](self, "convertAndComputHashWithWeightData:weightDataType:hash:convertedData:", v6, [v7 dataType], &v22, &v21);
  id v9 = v22;
  id v10 = v21;

  if (v8)
  {
    v24[0] = v9;
    v11 = [v5 descriptor];
    v24[1] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];

    id v13 = [(_MLCANEWeightOps *)self constantTensorMap];
    unint64_t v14 = [v13 objectForKeyedSubscript:v12];

    size_t v15 = [(_MLCANEWeightOps *)self constantTensorMap];
    uint64_t v16 = v15;
    if (v14)
    {
      id v17 = [v15 objectForKeyedSubscript:v12];
    }
    else
    {
      [v15 setObject:v5 forKeyedSubscript:v12];

      v23[0] = v9;
      v23[1] = v10;
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
      objc_super v19 = [v5 deviceMemory];
      objc_msgSend(v19, "setObject:atIndexedSubscript:", v18, objc_msgSend(v5, "deviceIndex"));

      id v17 = v5;
    }
  }
  else
  {
    id v12 = +[MLCLog framework];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      [(_MLCANEWeightOps *)a2 queryConstantTensor:v12];
    }
    id v17 = 0;
  }

  return v17;
}

- (void)reset
{
  id v3 = (void *)MEMORY[0x1E01B11E0](self, a2);
  uint64_t v4 = [(_MLCANEWeightOps *)self weights];
  [v4 removeAllObjects];

  id v5 = [(_MLCANEWeightOps *)self weightFiles];
  [v5 removeAllObjects];

  BOOL v6 = [(_MLCANEWeightOps *)self weightFileIndexMap];
  [v6 removeAllObjects];

  id v7 = [(_MLCANEWeightOps *)self constantTensorMap];
  [v7 removeAllObjects];
}

- (NSMutableDictionary)weights
{
  return self->_weights;
}

- (NSMutableArray)weightFiles
{
  return self->_weightFiles;
}

- (NSMutableDictionary)weightFileIndexMap
{
  return self->_weightFileIndexMap;
}

- (NSMutableDictionary)constantTensorMap
{
  return self->_constantTensorMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constantTensorMap, 0);
  objc_storeStrong((id *)&self->_weightFileIndexMap, 0);
  objc_storeStrong((id *)&self->_weightFiles, 0);

  objc_storeStrong((id *)&self->_weights, 0);
}

- (void)convertAndComputHashWithWeightData:(NSObject *)a3 weightDataType:hash:convertedData:.cold.1(const char *a1, int a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  __int16 v7 = 1024;
  int v8 = a2;
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: unsupported data type=%d", v6, 0x12u);
}

- (void)convertAndComputHashWithWeightData:(const char *)a1 weightDataType:hash:convertedData:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: failed to convert FP32 data", v4, v5, v6, v7, v8);
}

- (void)addWeightData:(const char *)a1 weightDataType:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: failed to convert and compute hash with weights data", v4, v5, v6, v7, v8);
}

- (void)queryConstantTensor:(NSObject *)a3 .cold.1(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: failed to convert and compute hash with the data of constant tensor=%@", v6, 0x16u);
}

@end