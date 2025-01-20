@interface NWURLSessionUploadTask
- (BOOL)isKindOfClass:(Class)a3;
@end

@implementation NWURLSessionUploadTask

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NWURLSessionUploadTask;
  if (-[NWURLSessionDataTask isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return [(objc_class *)a3 isEqual:objc_opt_class()];
  }
}

@end