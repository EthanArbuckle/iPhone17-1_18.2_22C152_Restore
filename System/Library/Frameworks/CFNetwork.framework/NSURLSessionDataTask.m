@interface NSURLSessionDataTask
- (NSURLSessionDataTask)init;
@end

@implementation NSURLSessionDataTask

- (NSURLSessionDataTask)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSURLSessionDataTask;
  return [(NSURLSessionTask *)&v3 init];
}

@end