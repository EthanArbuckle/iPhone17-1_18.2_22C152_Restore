@interface CNFoundationError
+ (BOOL)ifResultIsNo:(BOOL)a3 setOutputError:(id *)a4 toError:(id)a5;
+ (BOOL)ifResultIsNo:(BOOL)a3 setOutputError:(id *)a4 withBlock:(id)a5;
+ (BOOL)isCanceledError:(id)a3;
+ (BOOL)isCertificateError:(id)a3;
+ (BOOL)isError:(id)a3 errorWithDomain:(id)a4 code:(int64_t)a5;
+ (BOOL)isFileAlreadyExistsError:(id)a3;
+ (BOOL)isFileNotFoundError:(id)a3;
+ (BOOL)isNotImplementedError:(id)a3;
+ (BOOL)isTimeoutError:(id)a3;
+ (NSError)notImplementedError;
+ (NSError)timeoutError;
+ (NSError)userCanceledError;
+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4;
+ (id)errorWithCode:(int64_t)a3 underlyingException:(id)a4;
+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4;
+ (id)errorWithErrno;
+ (id)errorWithErrno:(int)a3;
+ (id)errorWithErrno:(int)a3 userInfo:(id)a4;
+ (id)errorWithErrnoAndUserInfo:(id)a3;
+ (id)ifResultIsNil:(id)a3 setOutputError:(id *)a4 toError:(id)a5;
+ (id)ifResultIsNil:(id)a3 setOutputError:(id *)a4 withBlock:(id)a5;
@end

@implementation CNFoundationError

+ (id)ifResultIsNil:(id)a3 setOutputError:(id *)a4 toError:(id)a5
{
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__CNFoundationError_ifResultIsNil_setOutputError_toError___block_invoke;
  v12[3] = &unk_1E56A2078;
  id v13 = v8;
  id v9 = v8;
  v10 = [a1 ifResultIsNil:a3 setOutputError:a4 withBlock:v12];

  return v10;
}

+ (id)ifResultIsNil:(id)a3 setOutputError:(id *)a4 withBlock:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = v8;
  if (v7)
  {
    id v10 = v7;
  }
  else if (a4)
  {
    (*((void (**)(id))v8 + 2))(v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id __58__CNFoundationError_ifResultIsNil_setOutputError_toError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (NSError)timeoutError
{
  return (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:2 userInfo:0];
}

+ (BOOL)isTimeoutError:(id)a3
{
  return [a1 isError:a3 errorWithDomain:@"CNContactsFoundationErrorDomain" code:2];
}

+ (NSError)userCanceledError
{
  return (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
}

+ (BOOL)isCanceledError:(id)a3
{
  return [a1 isError:a3 errorWithDomain:*MEMORY[0x1E4F281F8] code:3072];
}

+ (NSError)notImplementedError
{
  return (NSError *)[MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:11 userInfo:0];
}

+ (BOOL)isNotImplementedError:(id)a3
{
  return [a1 isError:a3 errorWithDomain:@"CNContactsFoundationErrorDomain" code:11];
}

+ (BOOL)isFileNotFoundError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F281F8];
  if (([a1 isError:v4 errorWithDomain:*MEMORY[0x1E4F281F8] code:260] & 1) != 0
    || ([a1 isError:v4 errorWithDomain:v5 code:4] & 1) != 0)
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [a1 isError:v4 errorWithDomain:*MEMORY[0x1E4F28798] code:2];
  }

  return v6;
}

+ (BOOL)isFileAlreadyExistsError:(id)a3
{
  return [a1 isError:a3 errorWithDomain:*MEMORY[0x1E4F281F8] code:516];
}

+ (BOOL)isCertificateError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1E4F289A0];
  if (([a1 isError:v4 errorWithDomain:*MEMORY[0x1E4F289A0] code:-1203] & 1) != 0
    || ([a1 isError:v4 errorWithDomain:v5 code:-1201] & 1) != 0
    || ([a1 isError:v4 errorWithDomain:v5 code:-1204] & 1) != 0)
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [a1 isError:v4 errorWithDomain:v5 code:-1202];
  }

  return v6;
}

+ (BOOL)isError:(id)a3 errorWithDomain:(id)a4 code:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 code] == a5)
  {
    id v9 = [v7 domain];
    char v10 = [v8 isEqualToString:v9];
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

+ (id)errorWithErrno
{
  uint64_t v3 = *__error();

  return (id)[a1 errorWithErrno:v3 userInfo:0];
}

+ (id)errorWithErrno:(int)a3
{
  return (id)[a1 errorWithErrno:*(void *)&a3 userInfo:0];
}

+ (id)errorWithErrnoAndUserInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 errorWithErrno:*__error() userInfo:v4];

  return v5;
}

+ (id)errorWithErrno:(int)a3 userInfo:(id)a4
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:a3 userInfo:a4];
}

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  return (id)[MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:a3 userInfo:a4];
}

+ (id)errorWithCode:(int64_t)a3 underlyingError:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = v5;
  if (v5)
  {
    uint64_t v10 = *MEMORY[0x1E4F28A50];
    v11[0] = v5;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:a3 userInfo:v7];

  return v8;
}

+ (id)errorWithCode:(int64_t)a3 underlyingException:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  char v6 = v5;
  if (v5)
  {
    uint64_t v10 = @"com.apple.contacts.underlying-exception";
    v11[0] = v5;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CNContactsFoundationErrorDomain" code:a3 userInfo:v7];

  return v8;
}

+ (BOOL)ifResultIsNo:(BOOL)a3 setOutputError:(id *)a4 toError:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __57__CNFoundationError_ifResultIsNo_setOutputError_toError___block_invoke;
  v11[3] = &unk_1E56A2078;
  id v12 = v8;
  id v9 = v8;
  LOBYTE(a4) = [a1 ifResultIsNo:v6 setOutputError:a4 withBlock:v11];

  return (char)a4;
}

id __57__CNFoundationError_ifResultIsNo_setOutputError_toError___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (BOOL)ifResultIsNo:(BOOL)a3 setOutputError:(id *)a4 withBlock:(id)a5
{
  if (a4 && !a3)
  {
    (*((void (**)(id, SEL))a5 + 2))(a5, a2);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3;
}

@end