@interface EDMessageDataLayoutManager
+ (id)messageDataDirectoryURLForGlobalMessageID:(int64_t)a3 basePath:(id)a4 purgeable:(BOOL)a5;
+ (id)messageDataDirectoryURLForGlobalMessageID:(int64_t)a3 rootMessageDataDirectory:(id)a4;
+ (id)rootMessageDataDirectoryForBasePath:(id)a3 purgeable:(BOOL)a4;
@end

@implementation EDMessageDataLayoutManager

+ (id)messageDataDirectoryURLForGlobalMessageID:(int64_t)a3 basePath:(id)a4 purgeable:(BOOL)a5
{
  v7 = [a1 rootMessageDataDirectoryForBasePath:a4 purgeable:a5];
  v8 = [a1 messageDataDirectoryURLForGlobalMessageID:a3 rootMessageDataDirectory:v7];

  return v8;
}

+ (id)rootMessageDataDirectoryForBasePath:(id)a3 purgeable:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a3 isDirectory:1];
  v6 = v5;
  if (v4) {
    v7 = @"MessageData";
  }
  else {
    v7 = @"NonpurgeableMessageData";
  }
  v8 = [v5 URLByAppendingPathComponent:v7 isDirectory:1];

  return v8;
}

+ (id)messageDataDirectoryURLForGlobalMessageID:(int64_t)a3 rootMessageDataDirectory:(id)a4
{
  id v5 = a4;
  v6 = (void *)MEMORY[0x1E4F1CB10];
  v7 = [NSNumber numberWithLongLong:a3];
  v8 = [v7 stringValue];
  v9 = [v6 fileURLWithPath:v8 isDirectory:1 relativeToURL:v5];

  return v9;
}

@end