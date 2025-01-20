@interface _DPHuffmanEncoder
+ (id)codeToBinaryString:(unint64_t)a3;
- (BOOL)tokenExist:(id)a3;
- (NSString)tableUUID;
- (_DPHuffmanEncoder)init;
- (_DPHuffmanEncoder)initWithTableClassName:(id)a3 maxOutputBitLength:(unint64_t)a4;
- (id)encodeTokens:(id)a3;
@end

@implementation _DPHuffmanEncoder

- (_DPHuffmanEncoder)init
{
  return 0;
}

- (_DPHuffmanEncoder)initWithTableClassName:(id)a3 maxOutputBitLength:(unint64_t)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v6 = (NSString *)a3;
  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v27[0] = v9;
  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  v27[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  v13 = [v7 setWithArray:v12];

  if (!v6)
  {
    v24 = +[_DPLog framework];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[_DPHuffmanEncoder initWithTableClassName:maxOutputBitLength:]();
    }
    goto LABEL_22;
  }
  v14 = [v13 member:v6];

  if (!v14)
  {
    v24 = +[_DPLog framework];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[_DPHuffmanEncoder initWithTableClassName:maxOutputBitLength:]();
    }
    goto LABEL_22;
  }
  if (!a4)
  {
    v24 = +[_DPLog framework];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[_DPHuffmanEncoder initWithTableClassName:maxOutputBitLength:]();
    }
    goto LABEL_22;
  }
  v26.receiver = self;
  v26.super_class = (Class)_DPHuffmanEncoder;
  self = [(_DPHuffmanEncoder *)&v26 init];
  if (self)
  {
    Class v15 = NSClassFromString(v6);
    if (v15)
    {
      Class v16 = v15;
      v17 = [(objc_class *)v15 getTable];
      table = self->_table;
      self->_table = v17;

      v19 = [(objc_class *)v16 getUUID];
      tableUUID = self->_tableUUID;
      self->_tableUUID = v19;

      v21 = [(objc_class *)v16 getUnknownTokenCode];
      unknownTokenCode = self->_unknownTokenCode;
      self->_unknownTokenCode = v21;

      if (self->_table)
      {
        if (self->_tableUUID)
        {
          self->_maxOutputBitLength = a4;
          goto LABEL_9;
        }
        v24 = +[_DPLog framework];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[_DPHuffmanEncoder initWithTableClassName:maxOutputBitLength:].cold.6();
        }
      }
      else
      {
        v24 = +[_DPLog framework];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[_DPHuffmanEncoder initWithTableClassName:maxOutputBitLength:].cold.5();
        }
      }
    }
    else
    {
      v24 = +[_DPLog framework];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[_DPHuffmanEncoder initWithTableClassName:maxOutputBitLength:].cold.4();
      }
    }
LABEL_22:

    v23 = 0;
    goto LABEL_23;
  }
LABEL_9:
  self = self;
  v23 = self;
LABEL_23:

  return v23;
}

- (BOOL)tokenExist:(id)a3
{
  if (a3)
  {
    v3 = -[NSDictionary objectForKeyedSubscript:](self->_table, "objectForKeyedSubscript:");
    BOOL v4 = v3 != 0;
  }
  else
  {
    v5 = +[_DPLog framework];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[_DPHuffmanEncoder tokenExist:]();
    }

    return 0;
  }
  return v4;
}

- (id)encodeTokens:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [&stru_1F3681BE0 mutableCopy];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v7)
    {
      uint64_t v9 = v7;
      uint64_t v10 = *(void *)v28;
      *(void *)&long long v8 = 138412546;
      long long v25 = v8;
      id v26 = v4;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_table, "objectForKeyedSubscript:", v12, v25);
          v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
            v14 = +[_DPLog framework];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              tableUUID = self->_tableUUID;
              *(_DWORD *)buf = v25;
              uint64_t v32 = v12;
              __int16 v33 = 2112;
              v34 = tableUUID;
              _os_log_debug_impl(&dword_1DC55E000, v14, OS_LOG_TYPE_DEBUG, "Token=%@ is not in our table=%@.", buf, 0x16u);
            }

            v13 = self->_unknownTokenCode;
          }
          uint64_t v15 = [(NSNumber *)v13 unsignedLongValue];
          if (!v15)
          {
            v21 = +[_DPLog framework];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              -[_DPHuffmanEncoder encodeTokens:]();
            }

            v22 = 0;
            id v4 = v26;
            goto LABEL_28;
          }
          uint64_t v16 = +[_DPHuffmanEncoder codeToBinaryString:v15];
          if (!v16)
          {
            v23 = +[_DPLog framework];
            id v4 = v26;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              -[_DPHuffmanEncoder encodeTokens:]();
            }

            goto LABEL_25;
          }
          v17 = (void *)v16;
          unint64_t maxOutputBitLength = self->_maxOutputBitLength;
          uint64_t v19 = [v5 length];
          if (maxOutputBitLength < [v17 length] + v19)
          {

            id v4 = v26;
            goto LABEL_27;
          }
          [v5 appendString:v17];
        }
        uint64_t v9 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
        id v4 = v26;
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_27:

    v22 = [v5 stringByPaddingToLength:self->_maxOutputBitLength withString:@"0" startingAtIndex:0];
  }
  else
  {
    v5 = +[_DPLog framework];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[_DPHuffmanEncoder tokenExist:]();
    }
LABEL_25:
    v22 = 0;
  }
LABEL_28:

  return v22;
}

+ (id)codeToBinaryString:(unint64_t)a3
{
  char v4 = __clz(a3);
  v5 = (void *)[&stru_1F3681BE0 mutableCopy];
  unint64_t v6 = 1 << ~v4;
  do
  {
    if ((v6 & a3) != 0) {
      uint64_t v7 = 49;
    }
    else {
      uint64_t v7 = 48;
    }
    objc_msgSend(v5, "appendFormat:", @"%c", v7);
    BOOL v8 = v6 >= 2;
    v6 >>= 1;
  }
  while (v8);
  uint64_t v9 = (void *)[v5 copy];

  return v9;
}

- (NSString)tableUUID
{
  return self->_tableUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableUUID, 0);
  objc_storeStrong((id *)&self->_unknownTokenCode, 0);
  objc_storeStrong((id *)&self->_table, 0);
}

- (void)initWithTableClassName:maxOutputBitLength:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "TableName is nil.", v2, v3, v4, v5, v6);
}

- (void)initWithTableClassName:maxOutputBitLength:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Unknown tableName=%@.", v2, v3, v4, v5, v6);
}

- (void)initWithTableClassName:maxOutputBitLength:.cold.3()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "Invalid maxOutputBitLength: 0.", v2, v3, v4, v5, v6);
}

- (void)initWithTableClassName:maxOutputBitLength:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Invalid tableName=%@.", v2, v3, v4, v5, v6);
}

- (void)initWithTableClassName:maxOutputBitLength:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Cannot read table for %@.", v2, v3, v4, v5, v6);
}

- (void)initWithTableClassName:maxOutputBitLength:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DC55E000, v0, v1, "Cannot read table UUID for %@.", v2, v3, v4, v5, v6);
}

- (void)tokenExist:.cold.1()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "Input tokens is nil.", v2, v3, v4, v5, v6);
}

- (void)encodeTokens:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1DC55E000, v1, OS_LOG_TYPE_ERROR, "Encoding for token=%@ collide with end of sequence code for table=%@.", v2, 0x16u);
}

- (void)encodeTokens:.cold.3()
{
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_1(&dword_1DC55E000, v0, v1, "Can't convert code to binary string", v2, v3, v4, v5, v6);
}

@end