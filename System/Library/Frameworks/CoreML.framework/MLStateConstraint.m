@interface MLStateConstraint
+ (BOOL)supportsSecureCoding;
+ (MLStateConstraint)constraintWithBufferShape:(id)a3 dataType:(int64_t)a4;
- (BOOL)isAllowedDataType:(int64_t)a3 error:(id *)a4;
- (BOOL)isAllowedShape:(id)a3 error:(id *)a4;
- (BOOL)isAllowedValue:(id)a3 error:(id *)a4;
- (MLStateConstraint)initWithCoder:(id)a3;
- (MLStateConstraint)initWithShape:(id)a3 dataType:(int64_t)a4 shapeConstraint:(id)a5 defaultOptionalValue:(id)a6;
- (NSArray)bufferShape;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)dataType;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MLStateConstraint

- (void).cxx_destruct
{
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (NSArray)bufferShape
{
  return self->_bufferShape;
}

- (MLStateConstraint)initWithCoder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:3];
  objc_msgSend(v6, "addObjectsFromArray:", v7, v13, v14);

  v8 = [v5 allowedClasses];
  [v6 unionSet:v8];

  v9 = [v5 decodeObjectOfClasses:v6 forKey:@"shape"];
  uint64_t v10 = [v5 decodeIntegerForKey:@"dataType"];

  v11 = [(MLStateConstraint *)self initWithShape:v9 dataType:v10 shapeConstraint:0 defaultOptionalValue:0];
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(MLStateConstraint *)self bufferShape];
  [v5 encodeObject:v4 forKey:@"shape"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[MLStateConstraint dataType](self, "dataType"), @"dataType");
}

- (id)description
{
  v3 = NSString;
  v4 = +[MLMultiArrayUtils stringForDataType:self->_dataType];
  id v5 = [(MLStateConstraint *)self bufferShape];
  id v6 = [v5 componentsJoinedByString:@" × "];
  v7 = [v3 stringWithFormat:@"%@, %@", v4, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[MLStateConstraint allocWithZone:a3];
  id v5 = [(MLStateConstraint *)self bufferShape];
  id v6 = [(MLStateConstraint *)v4 initWithShape:v5 dataType:[(MLStateConstraint *)self dataType] shapeConstraint:0 defaultOptionalValue:0];

  return v6;
}

- (BOOL)isAllowedValue:(id)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 isUndefined])
  {
    v7 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v7, OS_LOG_TYPE_ERROR, "StateConstraint cannot check undefined values", buf, 2u);
    }

    if (a4)
    {
      v8 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      v9 = [NSString stringWithFormat:@"StateConstraint cannot check undefined values"];
      v32[0] = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
      *a4 = [v8 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v10];

LABEL_15:
      LOBYTE(a4) = 0;
    }
  }
  else if ([v6 type] == 8)
  {
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2020000000;
    char v28 = 0;
    *(void *)buf = 0;
    v20 = buf;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__28550;
    v23 = __Block_byref_object_dispose__28551;
    id v24 = 0;
    v11 = [v6 internalStateValue];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __42__MLStateConstraint_isAllowedValue_error___block_invoke;
    v18[3] = &unk_1E59A5410;
    v18[4] = self;
    v18[5] = &v25;
    v18[6] = buf;
    [v11 internalGetMultiArrayWithHandler:v18];

    int v12 = *((unsigned __int8 *)v26 + 24);
    if (a4 && !*((unsigned char *)v26 + 24))
    {
      *a4 = *((id *)v20 + 5);
      int v12 = *((unsigned __int8 *)v26 + 24);
    }
    LOBYTE(a4) = v12 != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    uint64_t v13 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v13, OS_LOG_TYPE_ERROR, "StateConstraint only allows State Feature Values", buf, 2u);
    }

    if (a4)
    {
      uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      uint64_t v15 = [NSString stringWithFormat:@"StateConstraint only allows State Feature Values"];
      v30 = v15;
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      *a4 = [v14 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v16];

      goto LABEL_15;
    }
  }

  return (char)a4;
}

void __42__MLStateConstraint_isAllowedValue_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    v4 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v4, OS_LOG_TYPE_ERROR, "Error while trying to get multiArray from state value.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Error while trying to get multiArray from state value."];
  }
  v7 = (void *)a1[4];
  id v5 = [v3 shape];
  uint64_t v6 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v6 + 40);
  LODWORD(v7) = [v7 isAllowedShape:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    v7 = (void *)a1[4];
    uint64_t v8 = [v3 dataType];
    uint64_t v9 = *(void *)(a1[6] + 8);
    id v10 = *(id *)(v9 + 40);
    LOBYTE(v7) = [v7 isAllowedDataType:v8 error:&v10];
    objc_storeStrong((id *)(v9 + 40), v10);
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = (_BYTE)v7;
}

- (BOOL)isAllowedDataType:(int64_t)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int64_t dataType = self->_dataType;
  if (dataType != a3)
  {
    uint64_t v8 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = +[MLMultiArrayUtils stringForDataType:self->_dataType];
      v17 = +[MLMultiArrayUtils stringForDataType:a3];
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v16;
      __int16 v22 = 2112;
      v23 = v17;
      _os_log_error_impl(&dword_19E58B000, v8, OS_LOG_TYPE_ERROR, "State array dataType should be %@ but is %@", buf, 0x16u);
    }
    if (a4)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v18 = *MEMORY[0x1E4F28568];
      id v10 = NSString;
      v11 = +[MLMultiArrayUtils stringForDataType:self->_dataType];
      int v12 = +[MLMultiArrayUtils stringForDataType:a3];
      uint64_t v13 = [v10 stringWithFormat:@"State array dataType should be %@ but is %@", v11, v12];
      v19 = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      *a4 = [v9 errorWithDomain:@"com.apple.CoreML" code:1 userInfo:v14];
    }
  }
  return dataType == a3;
}

- (BOOL)isAllowedShape:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [(MLStateConstraint *)self bufferShape];
  char v7 = [v6 isEqualToArray:v5];

  return v7;
}

- (MLStateConstraint)initWithShape:(id)a3 dataType:(int64_t)a4 shapeConstraint:(id)a5 defaultOptionalValue:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)MEMORY[0x1E4F1C3C8];
  if (v12)
  {
    uint64_t v15 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v15, OS_LOG_TYPE_ERROR, "MLState doesn't support shape constraint.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*v14 format:@"MLState doesn't support shape constraint."];
  }
  if (v13)
  {
    uint64_t v16 = +[MLLogging coreChannel];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19E58B000, v16, OS_LOG_TYPE_ERROR, "MLState doesn't support default optional value.", buf, 2u);
    }

    [MEMORY[0x1E4F1CA00] raise:*v14 format:@"MLState doesn't support default optional value."];
  }
  v20.receiver = self;
  v20.super_class = (Class)MLStateConstraint;
  v17 = [(MLStateConstraint *)&v20 init];
  uint64_t v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bufferShape, a3);
    v18->_int64_t dataType = a4;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MLStateConstraint)constraintWithBufferShape:(id)a3 dataType:(int64_t)a4
{
  id v6 = a3;
  char v7 = (void *)[objc_alloc((Class)a1) initWithShape:v6 dataType:a4 shapeConstraint:0 defaultOptionalValue:0];

  return (MLStateConstraint *)v7;
}

@end