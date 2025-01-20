@interface CVAPhotoExceptionMetalResourceUnavailable
+ (id)error;
+ (id)throwIfNil:(id)a3;
- (CVAPhotoExceptionMetalResourceUnavailable)init;
- (id)getReasonStr;
- (int)getErrorCode;
@end

@implementation CVAPhotoExceptionMetalResourceUnavailable

- (int)getErrorCode
{
  return -22914;
}

- (id)getReasonStr
{
  return @"Metal resource allocation failed!";
}

- (CVAPhotoExceptionMetalResourceUnavailable)init
{
  v3.receiver = self;
  v3.super_class = (Class)CVAPhotoExceptionMetalResourceUnavailable;
  return [(CVAPhotoExceptionBase *)&v3 initWithName:@"CVAPhotoExceptionMetalResourceUnavailable" reason:@"Metal resource allocation failed!" userInfo:0];
}

+ (id)error
{
  id v7 = 0;
  v2 = NSString;
  objc_super v3 = [NSString stringWithFormat:@"%@", @"Metal resource allocation failed!"];
  v4 = [v2 stringWithFormat:@"Assertion failure in %s at %s:%d -- %@", "+[CVAPhotoExceptionMetalResourceUnavailable error]", "/Library/Caches/com.apple.xbs/Sources/AppleCVAPhoto/src/CVAError.mm", 92, v3];
  sub_1BA8161F4(1, &v7, 0, 4294944382, v4);
  id v5 = v7;

  return v5;
}

+ (id)throwIfNil:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v5 = (id)objc_opt_new();
    objc_exception_throw(v5);
  }

  return v3;
}

@end