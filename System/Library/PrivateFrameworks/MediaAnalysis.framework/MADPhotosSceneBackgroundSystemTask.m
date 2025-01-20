@interface MADPhotosSceneBackgroundSystemTask
+ (BOOL)enabledByDefault;
+ (NSString)identifier;
+ (id)sharedTask;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
@end

@implementation MADPhotosSceneBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A6DF8;
  block[3] = &unk_100219838;
  block[4] = a1;
  if (qword_1002525D8 != -1) {
    dispatch_once(&qword_1002525D8, block);
  }
  v2 = (void *)qword_1002525D0;
  return v2;
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.mediaanalysisd.photos.scene";
}

+ (BOOL)enabledByDefault
{
  return 1;
}

+ (unint64_t)taskID
{
  return 2;
}

+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (VCPMADUnifiedBackgroundProcessing())
  {
    CFStringRef v18 = @"SkipSyncGallery";
    v19 = &__kCFBooleanTrue;
    v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000A7024;
    v16[3] = &unk_10021C610;
    id v17 = v11;
    v14 = +[MADUnifiedProcessingTask taskWithCancelBlock:v10 options:v13 progressHandler:v16 andCompletionHandler:v12];
  }
  else
  {
    v14 = +[VCPMADSceneLibraryProcessingTask taskWithPhotoLibraries:v9 cancelBlock:v10 progressHandler:v11 andCompletionHandler:v12];
  }

  return v14;
}

@end