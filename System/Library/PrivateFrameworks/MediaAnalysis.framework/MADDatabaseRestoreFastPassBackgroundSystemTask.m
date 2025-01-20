@interface MADDatabaseRestoreFastPassBackgroundSystemTask
+ (id)featureCodes;
+ (id)identifier;
+ (id)processingTaskIdentifiers;
- (id)processingTaskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation MADDatabaseRestoreFastPassBackgroundSystemTask

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.photos.maintenance.fastpass";
}

+ (id)processingTaskIdentifiers
{
  return &off_100230800;
}

+ (id)featureCodes
{
  return &off_100230818;
}

- (id)processingTaskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  v5 = +[MADDatabaseRestoreFastPassProcessingTask taskWithCancelBlock:a3 progressHandler:a4 andCompletionHandler:a5];
  return v5;
}

@end