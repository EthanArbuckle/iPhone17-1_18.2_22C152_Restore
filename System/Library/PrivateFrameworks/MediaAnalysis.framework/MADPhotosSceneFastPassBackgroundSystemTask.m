@interface MADPhotosSceneFastPassBackgroundSystemTask
+ (id)featureCodes;
+ (id)identifier;
+ (id)processingTaskIdentifiers;
+ (id)producedResultIdentifiers;
- (id)processingTaskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
@end

@implementation MADPhotosSceneFastPassBackgroundSystemTask

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.photos.scene.fastpass";
}

+ (id)processingTaskIdentifiers
{
  return &off_1002307A0;
}

+ (id)featureCodes
{
  return &off_1002307B8;
}

+ (id)producedResultIdentifiers
{
  return +[NSSet setWithObject:@"com.apple.mediaanalysisd.photos.scene.results"];
}

- (id)processingTaskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  v5 = +[MADPhotosSceneFastPassProcessingTask taskWithCancelBlock:a3 progressHandler:a4 andCompletionHandler:a5];
  return v5;
}

@end