@interface HAPValueTransformer
+ (Class)expectedClassForFormat:(unint64_t)a3;
+ (Class)expectedTransformedClassForFormat:(unint64_t)a3;
- (id)reverseTransformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5;
- (id)transformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5;
@end

@implementation HAPValueTransformer

- (id)reverseTransformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7
    && (uint64_t v8 = [(id)objc_opt_class() expectedTransformedClassForFormat:a4],
        (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = [NSString stringWithFormat:@"Value class, %@, is not of the expected class %@", objc_opt_class(), v8];
    v11 = (void *)MEMORY[0x1D944E080]();
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      __int16 v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPValueTransformer] %@", buf, 0x16u);
    }
    if (a5)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v18 = v10;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      *a5 = [v14 errorWithDomain:@"HAPErrorDomain" code:-6756 userInfo:v15];
    }
    id v9 = 0;
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

+ (Class)expectedClassForFormat:(unint64_t)a3
{
  if (a3 - 1 > 0xE)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_opt_class();
  }
  return (Class)v4;
}

- (id)transformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7
    && (uint64_t v8 = [(id)objc_opt_class() expectedClassForFormat:a4], (objc_opt_isKindOfClass() & 1) == 0))
  {
    v10 = [NSString stringWithFormat:@"Value class, %@, is not of the expected class %@", objc_opt_class(), v8];
    v11 = (void *)MEMORY[0x1D944E080]();
    v12 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = HMFGetLogIdentifier();
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      __int16 v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_1D4758000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@[HAPValueTransformer] %@", buf, 0x16u);
    }
    if (a5)
    {
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v18 = v10;
      v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      *a5 = [v14 errorWithDomain:@"HAPErrorDomain" code:-6756 userInfo:v15];
    }
    id v9 = 0;
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

+ (Class)expectedTransformedClassForFormat:(unint64_t)a3
{
  return +[HAPValueTransformer expectedClassForFormat:a3];
}

@end