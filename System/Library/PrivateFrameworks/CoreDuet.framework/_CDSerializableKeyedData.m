@interface _CDSerializableKeyedData
+ (_CDSerializableKeyedData)keyedDataDeserializedFrom:(unint64_t)a3 maxSize:;
+ (id)dataDeseralizedFrom:(void *)a3 maxSize:(unint64_t)a4 checksum:(char *)a5 bytesRead:(unint64_t *)a6;
+ (id)errorForInvalidKeyEncoding;
+ (id)log;
+ (unsigned)byteChecksumOfData:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)setData:(uint64_t)a1;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initWithKey:(void *)a3 data:(void *)a4 error:;
- (unint64_t)serializeData:(id)a3 withChecksum:(unsigned __int8)a4 to:(void *)a5;
- (unint64_t)serializeTo:(unint64_t)a3 maxSize:(char *)a4 success:;
@end

@implementation _CDSerializableKeyedData

- (BOOL)setData:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    *(unsigned char *)(a1 + 18) = 1;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

  return a1 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_encodedKey, 0);
}

- (unint64_t)serializeTo:(unint64_t)a3 maxSize:(char *)a4 success:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  if (*(unsigned char *)(a1 + 18)) {
    *(_WORD *)(a1 + 17) = [(id)objc_opt_class() byteChecksumOfData:*(void *)(a1 + 32)];
  }
  uint64_t v8 = [*(id *)(a1 + 8) length];
  unint64_t v9 = v8 + [*(id *)(a1 + 32) length] + 18;
  if (v9 <= a3)
  {
    uint64_t v12 = [(id)a1 serializeData:*(void *)(a1 + 8) withChecksum:*(unsigned __int8 *)(a1 + 16) to:a2];
    unint64_t v9 = [(id)a1 serializeData:*(void *)(a1 + 32) withChecksum:*(unsigned __int8 *)(a1 + 17) to:a2 + v12]+ v12;
    if (a4)
    {
      char v11 = 1;
      goto LABEL_11;
    }
  }
  else
  {
    v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 24);
      int v15 = 138543874;
      uint64_t v16 = v14;
      __int16 v17 = 1024;
      int v18 = a3;
      __int16 v19 = 1024;
      int v20 = v9;
      _os_log_error_impl(&dword_18ECEB000, v10, OS_LOG_TYPE_ERROR, "Data for key %{public}@ does not fit in %d bytes (it is %d)", (uint8_t *)&v15, 0x18u);
    }

    if (a4)
    {
      char v11 = 0;
LABEL_11:
      *a4 = v11;
    }
  }
  return v9;
}

- (unint64_t)serializeData:(id)a3 withChecksum:(unsigned __int8)a4 to:(void *)a5
{
  id v7 = a3;
  size_t v8 = [v7 length];
  *(void *)a5 = v8;
  id v9 = v7;
  v10 = (const void *)[v9 bytes];

  memcpy((char *)a5 + 8, v10, v8);
  *((unsigned char *)a5 + v8 + 8) = a4;
  return v8 + 9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v4 + 4, self->_data);
  *((unsigned char *)v4 + 17) = self->_dataChecksum;
  *((unsigned char *)v4 + 18) = self->_dataChecksumNeedsUpdate;
  objc_storeStrong(v4 + 3, self->_key);
  objc_storeStrong(v4 + 1, self->_encodedKey);
  *((unsigned char *)v4 + 16) = self->_keyChecksum;
  return v4;
}

+ (unsigned)byteChecksumOfData:(id)a3
{
  id v3 = a3;
  id v4 = (char *)[v3 bytes];
  uint64_t v5 = [v3 length];
  for (unsigned __int8 i = 0; v5; --v5)
  {
    char v7 = *v4++;
    i += v7;
  }

  return i;
}

+ (_CDSerializableKeyedData)keyedDataDeserializedFrom:(unint64_t)a3 maxSize:
{
  uint64_t v5 = self;
  if (a3 >= 0x12)
  {
    char v7 = v5;
    unsigned __int8 v15 = 0;
    uint64_t v14 = 0;
    size_t v8 = [v5 dataDeseralizedFrom:a2 maxSize:a3 checksum:&v15 bytesRead:&v14];
    if (v8)
    {
      id v9 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
      if (v9)
      {
        unsigned __int8 v13 = 0;
        uint64_t v12 = 0;
        v10 = [v7 dataDeseralizedFrom:a2 + v14 maxSize:a3 - v14 checksum:&v13 bytesRead:&v12];
        if (v10)
        {
          v6 = objc_alloc_init(_CDSerializableKeyedData);
          objc_storeStrong((id *)&v6->_key, v9);
          objc_storeStrong((id *)&v6->_encodedKey, v8);
          v6->_keyChecksum = v15;
          objc_storeStrong((id *)&v6->_data, v10);
          v6->_dataChecksum = v13;
          v6->_dataChecksumNeedsUpdate = 0;
        }
        else
        {
          v6 = 0;
        }
      }
      else
      {
        v6 = 0;
      }
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)initWithKey:(void *)a3 data:(void *)a4 error:
{
  id v8 = a2;
  id v9 = a3;
  if (!a1) {
    goto LABEL_9;
  }
  v15.receiver = a1;
  v15.super_class = (Class)_CDSerializableKeyedData;
  v10 = (id *)objc_msgSendSuper2(&v15, sel_init);
  a1 = v10;
  if (v10)
  {
    objc_storeStrong(v10 + 4, a3);
    *(_WORD *)((char *)a1 + 17) = 256;
    objc_storeStrong(a1 + 3, a2);
    uint64_t v11 = [v8 dataUsingEncoding:4 allowLossyConversion:0];
    id v12 = a1[1];
    a1[1] = (id)v11;

    if (a1[1])
    {
      *((unsigned char *)a1 + 16) = [(id)objc_opt_class() byteChecksumOfData:a1[1]];
      goto LABEL_5;
    }
    if (a4)
    {
      [(id)objc_opt_class() errorForInvalidKeyEncoding];
      unsigned __int8 v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_9:
    unsigned __int8 v13 = 0;
    goto LABEL_6;
  }
LABEL_5:
  a1 = a1;
  unsigned __int8 v13 = a1;
LABEL_6:

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_CDSerializableKeyedData *)a3;
  if (self == v4)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = v4;
      if (self) {
        id Property = objc_getProperty(self, v5, 32, 1);
      }
      else {
        id Property = 0;
      }
      id v9 = Property;
      if (v6) {
        id v10 = objc_getProperty(v6, v8, 32, 1);
      }
      else {
        id v10 = 0;
      }
      if ([v9 isEqual:v10])
      {
        if (self) {
          id v12 = objc_getProperty(self, v11, 24, 1);
        }
        else {
          id v12 = 0;
        }
        id v14 = v12;
        if (v6) {
          id v15 = objc_getProperty(v6, v13, 24, 1);
        }
        else {
          id v15 = 0;
        }
        char v16 = [v14 isEqualToString:v15];
      }
      else
      {
        char v16 = 0;
      }
    }
    else
    {
      char v16 = 0;
    }
  }

  return v16;
}

+ (id)errorForInvalidKeyEncoding
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v6 = *MEMORY[0x1E4F28588];
  v7[0] = @"Keys must allow NSUTF8Encoding";
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v2 errorWithDomain:@"com.apple.coreduet.serializableKeyedData" code:0 userInfo:v3];

  return v4;
}

+ (id)log
{
  return +[_CDSharedMemoryKeyValueStore log]();
}

+ (id)dataDeseralizedFrom:(void *)a3 maxSize:(unint64_t)a4 checksum:(char *)a5 bytesRead:(unint64_t *)a6
{
  *a6 = 0;
  uint64_t v8 = *(void *)a3;
  unint64_t v9 = *(void *)a3 + 8;
  if (v9 <= a4)
  {
    id v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:(char *)a3 + 8 length:v8];
    unint64_t v14 = v8 + 9;
    if (v14 <= a4)
    {
      int v16 = *((unsigned __int8 *)a3 + v9);
      if (v16 == [a1 byteChecksumOfData:v10])
      {
        *a6 = v14;
        *a5 = v16;
        id v10 = v10;
        __int16 v17 = v10;
        goto LABEL_14;
      }
      int v18 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        +[_CDSerializableKeyedData dataDeseralizedFrom:maxSize:checksum:bytesRead:]();
      }
    }
    else
    {
      id v15 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[_CDSerializableKeyedData dataDeseralizedFrom:maxSize:checksum:bytesRead:](a4, v15);
      }
    }
  }
  else
  {
    id v10 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[_CDSerializableKeyedData dataDeseralizedFrom:maxSize:checksum:bytesRead:](a4, v10);
    }
  }
  __int16 v17 = 0;
LABEL_14:

  return v17;
}

+ (void)dataDeseralizedFrom:(int)a1 maxSize:(NSObject *)a2 checksum:bytesRead:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Attempt to read beyond max size %d when deserializing", (uint8_t *)v2, 8u);
}

+ (void)dataDeseralizedFrom:(int)a1 maxSize:(NSObject *)a2 checksum:bytesRead:.cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18ECEB000, a2, OS_LOG_TYPE_ERROR, "Attempt to read beyond max size %d when deserializing checksum", (uint8_t *)v2, 8u);
}

+ (void)dataDeseralizedFrom:maxSize:checksum:bytesRead:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Checksum does not match", v2, v3, v4, v5, v6);
}

@end