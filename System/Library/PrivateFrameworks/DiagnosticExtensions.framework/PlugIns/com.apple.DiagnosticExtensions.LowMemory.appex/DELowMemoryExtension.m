@interface DELowMemoryExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation DELowMemoryExtension

- (id)attachmentList
{
  v3 = +[NSRegularExpression regularExpressionWithPattern:@".*(ExcResource|JetsamEvent|LowMemory).*" options:1 error:0];
  v4 = +[NSURL fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter"];
  v5 = [(DELowMemoryExtension *)self filesInDir:v4 matchingPattern:v3 excludingPattern:0];

  return v5;
}

- (id)attachmentsForParameters:(id)a3
{
  v3 = [(DELowMemoryExtension *)self attachmentList];
  id v4 = [v3 mutableCopy];
  id v5 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceNow:-1800.0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "modificationDate", (void)v16);
        id v13 = [v12 compare:v5];

        if (v13 == (id)-1) {
          [v4 removeObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = [v4 copy];
  return v14;
}

@end