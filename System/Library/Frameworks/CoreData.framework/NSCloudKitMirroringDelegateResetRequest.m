@interface NSCloudKitMirroringDelegateResetRequest
- (NSCloudKitMirroringDelegateResetRequest)initWithError:(id)a3 completionBlock:(id)a4;
- (void)dealloc;
@end

@implementation NSCloudKitMirroringDelegateResetRequest

- (NSCloudKitMirroringDelegateResetRequest)initWithError:(id)a3 completionBlock:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NSCloudKitMirroringDelegateResetRequest;
  v5 = [(NSCloudKitMirroringRequest *)&v7 initWithOptions:0 completionBlock:a4];
  if (v5) {
    v5->_causedByError = (NSError *)a3;
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringDelegateResetRequest;
  [(NSCloudKitMirroringRequest *)&v3 dealloc];
}

@end