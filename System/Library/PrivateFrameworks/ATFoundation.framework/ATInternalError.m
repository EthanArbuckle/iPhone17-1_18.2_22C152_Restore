@interface ATInternalError
+ (id)errorWithCode:(unint64_t)a3 format:(id)a4;
+ (id)errorWithCode:(unint64_t)a3 underlyingError:(id)a4;
+ (id)errorWithPosixError:(int)a3 format:(id)a4;
@end

@implementation ATInternalError

+ (id)errorWithPosixError:(int)a3 format:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v5 = (objc_class *)NSString;
  id v6 = a4;
  v7 = (void *)[[v5 alloc] initWithFormat:v6 arguments:&v13];

  v8 = [NSString stringWithFormat:@"%@: %s (%d)", v7, strerror(v4), v4];

  v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v8, *MEMORY[0x1E4F28568], 0);
  v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:v9];

  return v10;
}

+ (id)errorWithCode:(unint64_t)a3 underlyingError:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = *MEMORY[0x1E4F28A50];
  v12[0] = a4;
  id v6 = (void *)MEMORY[0x1E4F1C9E8];
  id v7 = a4;
  v8 = [v6 dictionaryWithObjects:v12 forKeys:&v11 count:1];
  v9 = [v5 errorWithDomain:@"ATInternalError" code:a3 userInfo:v8];

  return v9;
}

+ (id)errorWithCode:(unint64_t)a3 format:(id)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = (void *)[[v5 alloc] initWithFormat:v6 arguments:&v15];

  v8 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v12 = *MEMORY[0x1E4F28568];
  v13[0] = v7;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
  v10 = [v8 errorWithDomain:@"ATInternalError" code:a3 userInfo:v9];

  return v10;
}

@end