@interface AAFDefaultSerializer
- (NSArray)mediaTypes;
- (id)_className;
- (id)_dataFromDictionary:(id)a3 error:(id *)a4;
- (id)_dictionaryFromObject:(id)a3 error:(id *)a4;
- (id)dataFromDictionary:(id)a3;
- (id)dataFromDictionary:(id)a3 error:(id *)a4;
- (id)dictionaryFromObject:(id)a3;
- (id)dictionaryFromObject:(id)a3 error:(id *)a4;
- (id)stringFromData:(id)a3;
- (id)stringFromDictionary:(id)a3;
- (void)_raiseException:(id)a3;
@end

@implementation AAFDefaultSerializer

- (id)dictionaryFromObject:(id)a3
{
  id v8 = 0;
  v4 = [(AAFDefaultSerializer *)self dictionaryFromObject:a3 error:&v8];
  id v5 = v8;
  if (v5)
  {
    v6 = _AAFLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AAFDefaultSerializer dictionaryFromObject:](self);
    }
  }
  return v4;
}

- (id)dictionaryFromObject:(id)a3 error:(id *)a4
{
  v19[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!v6) {
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v6 dataUsingEncoding:4];

    id v6 = (id)v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v6 length]) {
    goto LABEL_11;
  }
  uint64_t v8 = [(AAFDefaultSerializer *)self _dictionaryFromObject:v6 error:a4];
  v9 = (void *)v8;
  if (a4)
  {
    if (!*a4)
    {
      if (v8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = NSString;
          v11 = [(AAFDefaultSerializer *)self _className];
          v12 = (objc_class *)objc_opt_class();
          v13 = NSStringFromClass(v12);
          v14 = [v10 stringWithFormat:@"[%@] result [%@] was not in the expected format (NSDictionary)", v11, v13];

          v15 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v18 = *MEMORY[0x1E4F28568];
          v19[0] = v14;
          v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
          *a4 = [v15 errorWithDomain:@"AAFSerializationError" code:-702 userInfo:v16];

LABEL_11:
          v9 = 0;
        }
      }
    }
  }

  return v9;
}

- (id)dataFromDictionary:(id)a3
{
  id v8 = 0;
  v4 = [(AAFDefaultSerializer *)self dataFromDictionary:a3 error:&v8];
  id v5 = v8;
  if (v5)
  {
    id v6 = _AAFLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AAFDefaultSerializer dataFromDictionary:](self);
    }
  }
  return v4;
}

- (id)dataFromDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v7 = [(AAFDefaultSerializer *)self _dataFromDictionary:v6 error:a4];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)stringFromDictionary:(id)a3
{
  v4 = [(AAFDefaultSerializer *)self dataFromDictionary:a3];
  id v5 = [(AAFDefaultSerializer *)self stringFromData:v4];

  return v5;
}

- (id)stringFromData:(id)a3
{
  id v3 = a3;
  if ([v3 length]) {
    v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (id)_className
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)_raiseException:(id)a3
{
}

- (NSArray)mediaTypes
{
  id v3 = NSStringFromSelector(a2);
  [(AAFDefaultSerializer *)self _raiseException:v3];

  return 0;
}

- (id)_dictionaryFromObject:(id)a3 error:(id *)a4
{
  id v5 = NSStringFromSelector(a2);
  [(AAFDefaultSerializer *)self _raiseException:v5];

  return 0;
}

- (id)_dataFromDictionary:(id)a3 error:(id *)a4
{
  id v5 = NSStringFromSelector(a2);
  [(AAFDefaultSerializer *)self _raiseException:v5];

  return 0;
}

- (void)dictionaryFromObject:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 _className];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1DD937000, v2, v3, "[%@] unable to parse data, error: %@", v4, v5, v6, v7, v8);
}

- (void)dataFromDictionary:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 _className];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1DD937000, v2, v3, "[%@] serialization failed, error: %@", v4, v5, v6, v7, v8);
}

@end