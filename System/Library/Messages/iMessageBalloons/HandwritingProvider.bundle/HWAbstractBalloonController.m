@interface HWAbstractBalloonController
+ (id)_sharedRenderQueue;
+ (void)_writeThumbnailOfHandwriting:(id)a3 atSize:(CGSize)a4 useHighFidelityInk:(BOOL)a5 darkModeOverride:(id)a6 toDiskWithCompletionHandler:(id)a7;
+ (void)_writeThumbnailOfHandwriting:(id)a3 atSize:(CGSize)a4 useHighFidelityInk:(BOOL)a5 toDiskWithCompletionHandler:(id)a6;
- (BOOL)datasourceIsFromMe;
- (HWBalloonDataSource)balloonPluginDatasource;
- (void)playbackWithCompletionBlock:(id)a3;
- (void)setBalloonPluginDatasource:(id)a3;
- (void)setDatasourceIsFromMe:(BOOL)a3;
@end

@implementation HWAbstractBalloonController

+ (id)_sharedRenderQueue
{
  if (qword_33678 != -1) {
    dispatch_once(&qword_33678, &stru_28A08);
  }
  v2 = (void *)qword_33668;

  return v2;
}

- (void)playbackWithCompletionBlock:(id)a3
{
}

+ (void)_writeThumbnailOfHandwriting:(id)a3 atSize:(CGSize)a4 useHighFidelityInk:(BOOL)a5 toDiskWithCompletionHandler:(id)a6
{
}

+ (void)_writeThumbnailOfHandwriting:(id)a3 atSize:(CGSize)a4 useHighFidelityInk:(BOOL)a5 darkModeOverride:(id)a6 toDiskWithCompletionHandler:(id)a7
{
  double height = a4.height;
  double width = a4.width;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  uint64_t v53 = 0;
  v54 = (id *)&v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_14C50;
  v57 = sub_14C60;
  id v58 = 0;
  int v15 = DKIsDarkMode();
  if (v13)
  {
    id v16 = [v13 BOOLValue];
    +[UIColor forcedInkColor:v16];
  }
  else
  {
    LODWORD(v16) = v15;
    +[UIColor inkColor];
  v17 = };
  v18 = [v12 uuid];
  v19 = [v18 UUIDString];
  id v20 = [v19 length];

  if (v20)
  {
    v21 = [v12 uuid];
    uint64_t v22 = [v21 UUIDString];
    v23 = (void *)v22;
    CFStringRef v24 = @"light";
    if (v16) {
      CFStringRef v24 = @"dark";
    }
    v25 = +[NSString stringWithFormat:@"hw_%@_%d_%d_%@.png", v22, (int)width, (int)height, v24];

    v26 = NSTemporaryDirectory();
    v27 = [v26 stringByAppendingPathComponent:v25];

    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    v50 = sub_14C50;
    v51 = sub_14C60;
    id v52 = +[NSURL fileURLWithPath:v27];
    v28 = +[NSFileManager defaultManager];
    if ([v28 fileExistsAtPath:v27])
    {
      objc_storeStrong(v54 + 5, (id)v48[5]);
      if (!v14)
      {
LABEL_13:

        _Block_object_dispose(&v47, 8);
        goto LABEL_14;
      }
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_14C68;
      block[3] = &unk_28A30;
      id v45 = v14;
      v46 = &v53;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      v29 = v45;
    }
    else
    {
      v29 = +[HWAbstractBalloonController _sharedRenderQueue];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_14C84;
      v33[3] = &unk_28A58;
      id v34 = v12;
      id v35 = v27;
      char v42 = (char)v16;
      double v40 = width;
      double v41 = height;
      BOOL v43 = a5;
      id v36 = v17;
      v38 = &v47;
      v39 = &v53;
      id v37 = v14;
      [v29 addOperationWithBlock:v33];
    }
    goto LABEL_13;
  }
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_14E64;
  v30[3] = &unk_28A30;
  id v31 = v14;
  v32 = &v53;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v30);
  v25 = v31;
LABEL_14:

  _Block_object_dispose(&v53, 8);
}

- (HWBalloonDataSource)balloonPluginDatasource
{
  return self->_balloonPluginDatasource;
}

- (void)setBalloonPluginDatasource:(id)a3
{
}

- (BOOL)datasourceIsFromMe
{
  return self->_datasourceIsFromMe;
}

- (void)setDatasourceIsFromMe:(BOOL)a3
{
  self->_datasourceIsFromMe = a3;
}

- (void).cxx_destruct
{
}

@end