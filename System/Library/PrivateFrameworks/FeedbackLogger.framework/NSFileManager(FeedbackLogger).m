@interface NSFileManager(FeedbackLogger)
- (id)feedbackLoggerDirectoryURL;
- (id)urlForStoreWithId:()FeedbackLogger;
@end

@implementation NSFileManager(FeedbackLogger)

- (id)urlForStoreWithId:()FeedbackLogger
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 feedbackLoggerDirectoryURL];
  v6 = [v5 URLByAppendingPathComponent:v4 isDirectory:1];

  if (v6)
  {
    uint64_t v10 = *MEMORY[0x1E4F28330];
    v11[0] = &unk_1F13BBA68;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [a1 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:v7 error:0];
  }
  v8 = [v6 URLByAppendingPathComponent:@"data.sqlite" isDirectory:0];

  return v8;
}

- (id)feedbackLoggerDirectoryURL
{
  v1 = [a1 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:0 error:0];
  v2 = [v1 URLByAppendingPathComponent:@"com.apple.feedbacklogger" isDirectory:1];

  return v2;
}

@end