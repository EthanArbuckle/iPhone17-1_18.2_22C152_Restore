@interface CVAPhotoExceptionBase
- (CVAPhotoExceptionBase)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5;
- (id)error;
- (id)getReasonStr;
- (int)getErrorCode;
- (void)log;
@end

@implementation CVAPhotoExceptionBase

- (int)getErrorCode
{
  return 0;
}

- (id)getReasonStr
{
  return 0;
}

- (void)log
{
  id v4 = [(CVAPhotoExceptionBase *)self getReasonStr];
  v3 = [(CVAPhotoExceptionBase *)self callStackSymbols];
  NSLog(&cfstr_Cvaphotoexcept_0.isa, v4, v3);
}

- (id)error
{
  id v10 = 0;
  uint64_t v3 = [(CVAPhotoExceptionBase *)self getErrorCode];
  id v4 = NSString;
  v5 = [(CVAPhotoExceptionBase *)self getReasonStr];
  v6 = [v4 stringWithFormat:@"%@", v5];
  v7 = [v4 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "-[CVAPhotoExceptionBase error]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAError.mm", 55, v6];
  sub_1BA8161F4(1, &v10, 0, v3, v7);
  id v8 = v10;

  return v8;
}

- (CVAPhotoExceptionBase)initWithName:(id)a3 reason:(id)a4 userInfo:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CVAPhotoExceptionBase;
  return [(CVAPhotoExceptionBase *)&v6 initWithName:a3 reason:a4 userInfo:a5];
}

@end