@interface SSSDebugAssetManager
+ (id)newTestScreenshot;
- (void)imageForPreviouslyRegisteredIdentifier:(id)a3 imageHandler:(id)a4;
- (void)registerEntryWithImage:(id)a3 options:(id)a4 identifierHandler:(id)a5;
- (void)removeEntryWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)saveImageToTemporaryLocation:(id)a3 withName:(id)a4 imageDescription:(id)a5 completionHandler:(id)a6;
- (void)updateImageData:(id)a3 withModificationData:(id)a4 forEntryWithIdentifier:(id)a5 registrationOptions:(id)a6 imageDescription:(id)a7 completionHandler:(id)a8;
@end

@implementation SSSDebugAssetManager

+ (id)newTestScreenshot
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  v16.width = v8;
  v16.height = v10;
  UIGraphicsBeginImageContext(v16);
  v11 = +[UIApplication sharedApplication];
  v12 = [v11 windows];
  v13 = [v12 firstObject];
  [v13 drawViewHierarchyInRect:0 afterScreenUpdates:v4, v6, v8, v10];

  v14 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v14;
}

- (void)registerEntryWithImage:(id)a3 options:(id)a4 identifierHandler:(id)a5
{
}

- (void)imageForPreviouslyRegisteredIdentifier:(id)a3 imageHandler:(id)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000260C4;
  v5[3] = &unk_100099A60;
  v5[4] = self;
  id v6 = a4;
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

- (void)updateImageData:(id)a3 withModificationData:(id)a4 forEntryWithIdentifier:(id)a5 registrationOptions:(id)a6 imageDescription:(id)a7 completionHandler:(id)a8
{
}

- (void)saveImageToTemporaryLocation:(id)a3 withName:(id)a4 imageDescription:(id)a5 completionHandler:(id)a6
{
}

- (void)removeEntryWithIdentifier:(id)a3 completionHandler:(id)a4
{
}

@end