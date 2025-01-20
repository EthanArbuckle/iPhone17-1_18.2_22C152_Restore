@interface ACSURLSessionUploadTask
- (ACSURLSessionUploadTask)initWithNSURLUploadTaskCreator:(id)a3 initialRequest:(id)a4 forSession:(id)a5;
- (BOOL)_isUpload;
@end

@implementation ACSURLSessionUploadTask

- (ACSURLSessionUploadTask)initWithNSURLUploadTaskCreator:(id)a3 initialRequest:(id)a4 forSession:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)ACSURLSessionUploadTask;
  return [(ACSURLSessionTask *)&v6 initWithNSURLTaskCreator:a3 initialRequest:a4 forSession:a5];
}

- (BOOL)_isUpload
{
  return 1;
}

@end