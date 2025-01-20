@interface MADPhotosFullBackgroundSystemTask
+ (BOOL)enabledByDefault;
+ (NSString)identifier;
+ (id)sharedTask;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
@end

@implementation MADPhotosFullBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008697C;
  block[3] = &unk_100219838;
  block[4] = a1;
  if (qword_1002525B8 != -1) {
    dispatch_once(&qword_1002525B8, block);
  }
  v2 = (void *)qword_1002525B0;
  return v2;
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.mediaanalysisd.photos.full";
}

+ (BOOL)enabledByDefault
{
  return 1;
}

+ (unint64_t)taskID
{
  return 1;
}

+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  v6 = +[VCPLibraryProcessingTask taskWithPhotoLibraries:a3 andOptions:0 andProgressHandler:a5 andCompletionHandler:a6 andCancelBlock:a4];
  return v6;
}

@end