@interface NSURLSessionUploadTask
- (NSURLSessionUploadTask)init;
- (void)cancelByProducingResumeData:(void *)completionHandler;
@end

@implementation NSURLSessionUploadTask

- (void)cancelByProducingResumeData:(void *)completionHandler
{
}

- (NSURLSessionUploadTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionUploadTask;
  return [(NSURLSessionDataTask *)&v3 init];
}

@end