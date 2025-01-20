@interface VSDataCompressionValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)_dataByPerformingOperation:(int)a3 onData:(id)a4;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation VSDataCompressionValueTransformer

- (id)_dataByPerformingOperation:(int)a3 onData:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  memset(&v18, 0, sizeof(v18));
  if (compression_stream_init(&v18, (compression_stream_operation)a3, COMPRESSION_ZLIB))
  {
    v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:*__error() userInfo:0];
    v7 = VSErrorLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[VSDataCompressionValueTransformer _dataByPerformingOperation:onData:]((uint64_t)v6, v7);
    }

    goto LABEL_5;
  }
  id v10 = v5;
  v18.src_ptr = (const uint8_t *)[v10 bytes];
  v18.src_size = [v10 length];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  v12 = (uint8_t *)malloc_type_malloc(0x1000uLL, 0x49199746uLL);
  if (v12)
  {
    v13 = v12;
    BOOL v14 = a3 == 0;
    v18.dst_ptr = v12;
    v18.dst_size = 4096;
    uint64_t v15 = *MEMORY[0x1E4F28760];
    while (1)
    {
      compression_status v16 = compression_stream_process(&v18, v14);
      if (v16) {
        break;
      }
      if (!v18.dst_size)
      {
        objc_msgSend(v11, "appendBytes:length:", v13, 4096, v18.dst_ptr);
        v18.dst_ptr = v13;
        v18.dst_size = 4096;
      }
    }
    if (v16 == COMPRESSION_STATUS_ERROR)
    {
      v6 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", v15, *__error(), 0, v18.dst_ptr);
      v17 = VSErrorLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v6;
        _os_log_error_impl(&dword_1DA674000, v17, OS_LOG_TYPE_ERROR, "Error processing stream: %@", buf, 0xCu);
      }

      id v11 = 0;
    }
    else
    {
      if (v16 == COMPRESSION_STATUS_END && v18.dst_size != 4096) {
        objc_msgSend(v11, "appendBytes:length:", v13, 4096 - v18.dst_size, v18.dst_ptr);
      }
      v6 = 0;
    }
    free(v13);
  }
  else
  {
    v6 = 0;
  }
  compression_stream_destroy(&v18);
  if (!v11)
  {
LABEL_5:
    if (!v6) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The errorOrNil parameter must not be nil."];
    }
    v8 = +[VSFailable failableWithError:](VSFailable, "failableWithError:", v6, v18.dst_ptr);
    if (!v8) {
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v8 = +[VSFailable failableWithObject:v11];

  if (!v8) {
LABEL_8:
  }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"The result parameter must not be nil.", v18.dst_ptr);
LABEL_9:

  return v8;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  id v4 = a3;
  id v26 = v4;
  id v5 = (void *)v22[5];
  if (!v5) {
    goto LABEL_11;
  }
  id v6 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E4F1CA00];
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      [v7 raise:*MEMORY[0x1E4F1C3C8], @"Unexpectedly, inputValue was %@, instead of VSFailable.", v9 format];
    }
    id v10 = v6;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __54__VSDataCompressionValueTransformer_transformedValue___block_invoke;
    v20[3] = &unk_1E6BD2F38;
    v20[4] = &v21;
    [v10 unwrapObject:v20 error:&__block_literal_global_6];
  }
  id v11 = (void *)v22[5];
  if (v11)
  {
    id v12 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = (void *)MEMORY[0x1E4F1CA00];
        BOOL v14 = (objc_class *)objc_opt_class();
        uint64_t v15 = NSStringFromClass(v14);
        [v13 raise:*MEMORY[0x1E4F1C3C8], @"Unexpectedly, inputValue was %@, instead of NSData.", v15 format];
      }
      id v16 = v12;
      v17 = (void *)[v16 copy];
      compression_stream v18 = [(VSDataCompressionValueTransformer *)self _dataByPerformingOperation:0 onData:v17];
    }
    else
    {
      compression_stream v18 = 0;
    }
  }
  else
  {
LABEL_11:
    compression_stream v18 = 0;
  }
  _Block_object_dispose(&v21, 8);

  return v18;
}

void __54__VSDataCompressionValueTransformer_transformedValue___block_invoke(uint64_t a1, void *a2)
{
}

- (id)reverseTransformedValue:(id)a3
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  id v4 = a3;
  id v26 = v4;
  id v5 = (void *)v22[5];
  if (!v5) {
    goto LABEL_11;
  }
  id v6 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = (void *)MEMORY[0x1E4F1CA00];
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      [v7 raise:*MEMORY[0x1E4F1C3C8], @"Unexpectedly, inputValue was %@, instead of VSFailable.", v9 format];
    }
    id v10 = v6;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __61__VSDataCompressionValueTransformer_reverseTransformedValue___block_invoke;
    v20[3] = &unk_1E6BD2F38;
    v20[4] = &v21;
    [v10 unwrapObject:v20 error:&__block_literal_global_26];
  }
  id v11 = (void *)v22[5];
  if (v11)
  {
    id v12 = v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = (void *)MEMORY[0x1E4F1CA00];
        BOOL v14 = (objc_class *)objc_opt_class();
        uint64_t v15 = NSStringFromClass(v14);
        [v13 raise:*MEMORY[0x1E4F1C3C8], @"Unexpectedly, inputValue was %@, instead of NSData.", v15 format];
      }
      id v16 = v12;
      v17 = (void *)[v16 copy];
      compression_stream v18 = [(VSDataCompressionValueTransformer *)self _dataByPerformingOperation:1 onData:v17];
    }
    else
    {
      compression_stream v18 = 0;
    }
  }
  else
  {
LABEL_11:
    compression_stream v18 = 0;
  }
  _Block_object_dispose(&v21, 8);

  return v18;
}

void __61__VSDataCompressionValueTransformer_reverseTransformedValue___block_invoke(uint64_t a1, void *a2)
{
}

- (void)_dataByPerformingOperation:(uint64_t)a1 onData:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DA674000, a2, OS_LOG_TYPE_ERROR, "Error creating stream: %@", (uint8_t *)&v2, 0xCu);
}

@end