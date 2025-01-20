@interface NSURLSessionDownloadTask
- (NSURLSessionDownloadTask)init;
- (void)cancelByProducingResumeData:(void *)completionHandler;
@end

@implementation NSURLSessionDownloadTask

- (void)cancelByProducingResumeData:(void *)completionHandler
{
}

- (NSURLSessionDownloadTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionDownloadTask;
  return [(NSURLSessionTask *)&v3 init];
}

@end