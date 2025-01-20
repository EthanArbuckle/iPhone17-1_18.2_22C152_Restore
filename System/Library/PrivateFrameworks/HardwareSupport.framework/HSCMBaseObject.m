@interface HSCMBaseObject
+ (id)statusDescription:(int)a3;
- (BOOL)setValue:(id)a3 forProperty:(__CFString *)a4 error:(id *)a5;
- (HSCMBaseObject)initWithBaseObject:(OpaqueCMBaseObject *)a3;
- (OpaqueCMBaseObject)underlyingObject;
- (id)valueForProperty:(__CFString *)a3 error:(id *)a4;
@end

@implementation HSCMBaseObject

+ (id)statusDescription:(int)a3
{
  if ((a3 + 12788) > 8)
  {
    uint64_t v4 = *(void *)&a3;
    v5 = NSString;
    v6 = objc_msgSend(NSNumber, "numberWithInt:");
    v3 = [v5 stringWithFormat:@"(%@) (0x%08X) (mach: %s)]", v6, v4, mach_error_string(v4)];
  }
  else
  {
    v3 = off_26484C880[a3 + 12788];
  }

  return v3;
}

- (HSCMBaseObject)initWithBaseObject:(OpaqueCMBaseObject *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HSCMBaseObject;
  result = [(HSCMBaseObject *)&v5 init];
  result->_underlyingObject = a3;
  return result;
}

- (BOOL)setValue:(id)a3 forProperty:(__CFString *)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = HSLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[HSCMBaseObject setValue:forProperty:error:]((uint64_t)v8, (uint64_t)a4, v9);
  }

  underlyingObject = self->_underlyingObject;
  uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v11) {
    uint64_t v12 = v11;
  }
  else {
    uint64_t v12 = 0;
  }
  v13 = *(uint64_t (**)(OpaqueCMBaseObject *, __CFString *, id))(v12 + 56);
  if (v13)
  {
    uint64_t v14 = v13(underlyingObject, a4, v8);
    if (!v14)
    {
      LOBYTE(a5) = 1;
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v14 = 4294954514;
  }
  v15 = HSLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v25 = [(id)objc_opt_class() statusDescription:v14];
    *(_DWORD *)buf = 138412802;
    v29 = a4;
    __int16 v30 = 2112;
    id v31 = v8;
    __int16 v32 = 2112;
    v33 = v25;
    _os_log_error_impl(&dword_2289F2000, v15, OS_LOG_TYPE_ERROR, "Failed to set property %@ to %@: %@!", buf, 0x20u);
  }
  if (a5)
  {
    v16 = NSString;
    v17 = [(id)objc_opt_class() statusDescription:v14];
    v18 = [v16 stringWithFormat:@"Failed to set property %@ to %@: %@!", a4, v8, v17];

    v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08410];
    uint64_t v26 = *MEMORY[0x263F08320];
    v27 = v18;
    v21 = [NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    v22 = [v19 errorWithDomain:v20 code:(int)v14 userInfo:v21];

    id v23 = v22;
    *a5 = v23;

    LOBYTE(a5) = 0;
  }
LABEL_14:

  return (char)a5;
}

- (id)valueForProperty:(__CFString *)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v24 = 0;
  underlyingObject = self->_underlyingObject;
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = *(uint64_t (**)(OpaqueCMBaseObject *, __CFString *, void, id *))(v8 + 48);
  if (v9) {
    uint64_t v10 = v9(underlyingObject, a3, 0, &v24);
  }
  else {
    uint64_t v10 = 4294954514;
  }
  uint64_t v11 = HSLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[HSCMBaseObject valueForProperty:error:]((uint64_t)a3, &v24, v11);
  }

  if (!v10)
  {
    id v15 = v24;
    if (v24)
    {
      v21 = (id *)v24;
      id v15 = v21;
    }
    else
    {
      v21 = [MEMORY[0x263EFF9D0] null];
    }
    a4 = v21;
    goto LABEL_18;
  }
  uint64_t v12 = HSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v23 = [(id)objc_opt_class() statusDescription:v10];
    *(_DWORD *)buf = 138412546;
    v28 = a3;
    __int16 v29 = 2112;
    __int16 v30 = v23;
    _os_log_error_impl(&dword_2289F2000, v12, OS_LOG_TYPE_ERROR, "Failed to copy property %@: %@!", buf, 0x16u);
  }
  if (a4)
  {
    v13 = NSString;
    uint64_t v14 = [(id)objc_opt_class() statusDescription:v10];
    id v15 = [v13 stringWithFormat:@"Failed to copy property %@: %@!", a3, v14];

    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08410];
    uint64_t v25 = *MEMORY[0x263F08320];
    id v26 = v15;
    v18 = [NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    v19 = [v16 errorWithDomain:v17 code:(int)v10 userInfo:v18];

    id v20 = v19;
    *a4 = v20;

    a4 = 0;
LABEL_18:
  }

  return a4;
}

- (OpaqueCMBaseObject)underlyingObject
{
  return self->_underlyingObject;
}

- (void)setValue:(uint64_t)a1 forProperty:(uint64_t)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 136315650;
  *(void *)&v3[4] = "-[HSCMBaseObject setValue:forProperty:error:]";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_0(&dword_2289F2000, a2, a3, "%s: Set %@ > %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

- (void)valueForProperty:(NSObject *)a3 error:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)v3 = 136315650;
  *(void *)&v3[4] = "-[HSCMBaseObject valueForProperty:error:]";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_0(&dword_2289F2000, (uint64_t)a2, a3, "%s: Copy %@ > %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *a2);
}

@end