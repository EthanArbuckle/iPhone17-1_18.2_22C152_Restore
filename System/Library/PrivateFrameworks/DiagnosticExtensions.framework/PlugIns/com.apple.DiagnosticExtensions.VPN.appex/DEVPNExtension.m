@interface DEVPNExtension
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DEVPNExtension

- (id)attachmentsForParameters:(id)a3
{
  v3 = +[NSFileManager defaultManager];
  v4 = +[NSURL fileURLWithPath:@"/Library/Logs/CrashReporter"];
  v24 = v3;
  v5 = [v3 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:&__NSArray0__struct options:4 error:0];

  v6 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v13 = [v12 absoluteString];
        id v14 = [v13 rangeOfString:@"com.apple.networking.networkextension.log"];

        if (v14 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = [v12 pathExtension];
          [v6 addObject:v15];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  [v6 addObject:@"log"];
  +[DELogMover moveSystemLogsWithExtensions:v6];
  v16 = +[NSRegularExpression regularExpressionWithPattern:@"com.apple.networking.networkextension.log.*" options:1 error:0];
  v17 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter"];
  v18 = [(DEVPNExtension *)self filesInDir:v17 matchingPattern:v16 excludingPattern:0];
  id v19 = [v18 mutableCopy];

  v20 = +[NSURL fileURLWithPath:@"/var/log/ppp.log" isDirectory:0];
  uint64_t v25 = 0;
  if (([v20 checkResourceIsReachableAndReturnError:&v25] & 1) == 0)
  {
    v21 = +[DEAttachmentItem attachmentWithPathURL:v20];
    [v19 addObject:v21];
  }
  return v19;
}

@end