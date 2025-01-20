@interface GEODataURLSessionDownloadTask
- (id)_createBackingTaskWithRequest:(id)a3 session:(id)a4;
@end

@implementation GEODataURLSessionDownloadTask

- (id)_createBackingTaskWithRequest:(id)a3 session:(id)a4
{
  return (id)[a4 downloadTaskWithRequest:a3];
}

@end