@interface CVAPhotoExceptionThirdPartyAPIMismatch
- (CVAPhotoExceptionThirdPartyAPIMismatch)initWithReason:(id)a3;
- (id)getReasonStr;
- (int)getErrorCode;
@end

@implementation CVAPhotoExceptionThirdPartyAPIMismatch

- (void).cxx_destruct
{
}

- (int)getErrorCode
{
  return -22915;
}

- (id)getReasonStr
{
  return (id)MEMORY[0x1F4181798](self, sel_reason);
}

- (CVAPhotoExceptionThirdPartyAPIMismatch)initWithReason:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CVAPhotoExceptionThirdPartyAPIMismatch;
  return [(CVAPhotoExceptionBase *)&v4 initWithName:@"CVAPhotoExceptionThirdPartyAPIMismatch" reason:a3 userInfo:0];
}

@end