@interface NSURLDownloadInternal
- (void)dealloc;
@end

@implementation NSURLDownloadInternal

- (void)dealloc
{
  if (self->delegate) {
    __assert_rtn("-[NSURLDownloadInternal dealloc]", "NSURLDownload.mm", 52, "!delegate");
  }

  v3.receiver = self;
  v3.super_class = (Class)NSURLDownloadInternal;
  [(NSURLDownloadInternal *)&v3 dealloc];
}

@end