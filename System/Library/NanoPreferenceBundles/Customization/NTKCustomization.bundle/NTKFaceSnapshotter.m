@interface NTKFaceSnapshotter
+ (id)defaultModernSnapshotOptions;
+ (id)renderSnapshotAndTexture:(id *)a3 fromWindow:(id)a4;
+ (id)renderSnapshotFromWindow:(id)a3;
- (NTKFaceSnapshotter)init;
- (id)viewControllerForFace:(id)a3 withOptions:(id)a4;
- (void)_hideSnapshotWindow;
- (void)_mainQueue_serviceRequest:(id)a3 completion:(id)a4;
- (void)_queue_serviceRequestIfIdle;
- (void)_setupNotificationForCollectionLoadForDevice:(id)a3 completion:(id)a4;
- (void)_showSnapshotWindowForDevice:(id)a3;
- (void)complicationCollectionDidLoad:(id)a3;
- (void)dealloc;
- (void)provideSnapshotOfFace:(id)a3 completion:(id)a4;
- (void)provideSnapshotOfFace:(id)a3 options:(id)a4 completion:(id)a5;
@end

@implementation NTKFaceSnapshotter

+ (id)defaultModernSnapshotOptions
{
  CFStringRef v4 = @"NTKSnapshotPersistableKey";
  v5 = &__kCFBooleanTrue;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

- (NTKFaceSnapshotter)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKFaceSnapshotter;
  v2 = [(NTKFaceSnapshotter *)&v7 init];
  v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_B264;
    block[3] = &unk_248D8;
    v6 = v2;
    if (qword_2E458 != -1) {
      dispatch_once(&qword_2E458, block);
    }
  }
  return v3;
}

- (void)_setupNotificationForCollectionLoadForDevice:(id)a3 completion:(id)a4
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B5E8;
  block[3] = &unk_24978;
  id v9 = a3;
  v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)provideSnapshotOfFace:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "dispatching to face snapshotter queue", buf, 2u);
  }

  v12 = [v8 device];
  if (v12)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_B8E0;
    v22[3] = &unk_248D8;
    v22[4] = self;
    [(NTKFaceSnapshotter *)self _setupNotificationForCollectionLoadForDevice:v12 completion:v22];
  }
  v13 = qword_2E468;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B964;
  block[3] = &unk_249E0;
  id v18 = v8;
  id v19 = v9;
  v20 = self;
  id v21 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v13, block);
}

- (void)_queue_serviceRequestIfIdle
{
  dispatch_assert_queue_V2((dispatch_queue_t)qword_2E468);
  if ([(id)qword_2E470 count])
  {
    if (byte_2E478 == 1)
    {
      v3 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        CFStringRef v4 = "Already servicing a face snapshot request.";
LABEL_10:
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
      }
    }
    else
    {
      id v5 = [(id)qword_2E470 indexOfObjectPassingTest:&stru_24A20];
      if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v6 = v5;
        id v7 = [(id)qword_2E470 objectAtIndex:v5];
        byte_2E478 = 1;
        [(id)qword_2E470 removeObjectAtIndex:v6];
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_BD48;
        v8[3] = &unk_248B0;
        v8[4] = self;
        id v9 = v7;
        v3 = v7;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

        goto LABEL_12;
      }
      v3 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        CFStringRef v4 = "No complication snapshot requests are ready.";
        goto LABEL_10;
      }
    }
  }
  else
  {
    v3 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      CFStringRef v4 = "No face snapshot requests to service.";
      goto LABEL_10;
    }
  }
LABEL_12:
}

- (void)provideSnapshotOfFace:(id)a3 completion:(id)a4
{
  id v6 = a4;
  CFStringRef v12 = @"NTKSnapshotUIOnlyKey";
  v13 = &__kCFBooleanTrue;
  id v7 = a3;
  id v8 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_BFC4;
  v10[3] = &unk_24A48;
  id v11 = v6;
  id v9 = v6;
  [(NTKFaceSnapshotter *)self provideSnapshotOfFace:v7 options:v8 completion:v10];
}

- (id)viewControllerForFace:(id)a3 withOptions:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v7 = objc_alloc((Class)NTKFaceViewController);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_C0C4;
  v11[3] = &unk_24A70;
  id v12 = v5;
  id v8 = v5;
  id v9 = [v7 initWithFace:v6 configuration:v11];

  [v9 freeze];

  return v9;
}

- (void)_mainQueue_serviceRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v37 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v40 = [v6 face];
  v39 = [v6 options];
  id v7 = [v40 description];
  id v8 = _NTKLoggingObjectForDomain();
  id v9 = (char *)os_signpost_id_generate(v8);
  id v10 = v8;
  id v11 = v10;
  if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "FaceSnapshot", "%@", (uint8_t *)&buf, 0xCu);
  }

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v13 = [v39 objectForKeyedSubscript:@"NTKSnapshotOverrideDateKey"];
  if (v13)
  {
    id v14 = NTKRoundDateDownToNearestSecond();

    NTKSetIdealizedDate();
    CLKSetCompanionDisplayDate();
  }
  else
  {
    id v14 = 0;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v66 = 0x2020000000;
  char v67 = 0;
  id v16 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  v17 = [v40 device];
  [v16 setDevice:v17];

  id v18 = [(NTKFaceSnapshotter *)self viewControllerForFace:v40 withOptions:v39];
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_C92C;
  v64[3] = &unk_24A98;
  v64[4] = &buf;
  [v18 enumerateComplicationControllersAndDisplaysWithBlock:v64];
  id v19 = [v40 device];
  [(NTKFaceSnapshotter *)self _showSnapshotWindowForDevice:v19];

  [v18 prepareForSnapshotting];
  v20 = +[UIColor clearColor];
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setBackgroundColor:v20];

  _UIAppSetStatusBarOrientation();
  _UIAppSetStatusBarHeight();
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setRootViewController:v18];
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setHidden:0];
  id v21 = [v18 faceView];
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setNeedsLayout];
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow layoutIfNeeded];
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setNeedsDisplay];
  [v21 setNeedsRender];
  +[CATransaction commit];
  +[CATransaction flush];

  objc_initWeak(&location, self);
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  char v62 = 0;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_CA78;
  v52[3] = &unk_24AC0;
  v58 = v61;
  id v36 = v14;
  id v53 = v36;
  objc_copyWeak(v60, &location);
  v60[1] = *(id *)&Current;
  p_long long buf = &buf;
  id v35 = v7;
  id v54 = v35;
  v22 = v11;
  v55 = v22;
  v60[2] = v9;
  id v23 = v6;
  id v56 = v23;
  id v38 = v37;
  id v57 = v38;
  v24 = objc_retainBlock(v52);
  dispatch_time_t v25 = dispatch_time(0, 20000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_CE18;
  block[3] = &unk_24AE8;
  v51 = v61;
  v26 = v24;
  id v50 = v26;
  dispatch_after(v25, (dispatch_queue_t)&_dispatch_main_q, block);

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_CEB4;
  v44[3] = &unk_24B60;
  id v27 = v18;
  id v45 = v27;
  v47 = v61;
  objc_copyWeak(&v48, &location);
  v28 = v26;
  id v46 = v28;
  v29 = objc_retainBlock(v44);
  v30 = [v23 options];
  v31 = [v30 valueForKey:@"NTKSnapshotPerformPrewarmRoutineKey"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    && ([v23 options],
        uint64_t v33 = objc_claimAutoreleasedReturnValue(),
        [(id)v33 valueForKey:@"NTKSnapshotPerformPrewarmRoutineKey"],
        v34 = objc_claimAutoreleasedReturnValue(),
        (id)v33,
        LOBYTE(v33) = [v34 BOOLValue],
        v34,
        (v33 & 1) != 0))
  {
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_D238;
    v41[3] = &unk_24AE8;
    v43 = v61;
    v42 = v29;
    [v27 performPrewarmRoutine:v41];
  }
  else
  {
    ((void (*)(void *))v29[2])(v29);
  }

  objc_destroyWeak(&v48);
  objc_destroyWeak(v60);

  _Block_object_dispose(v61, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

+ (id)renderSnapshotFromWindow:(id)a3
{
  return (id)_NTKRenderSnapshotFromWindow(a3, 3);
}

+ (id)renderSnapshotAndTexture:(id *)a3 fromWindow:(id)a4
{
  return (id)_NTKRenderSnapshotAndTextureFromWindow(a4, 3, a3);
}

- (void)_showSnapshotWindowForDevice:(id)a3
{
  id v4 = a3;
  snapshotWindow = self->_snapshotWindow;
  id v8 = v4;
  if (!snapshotWindow)
  {
    id v6 = (NTKFaceSnapshottingWindow *)objc_alloc_init((Class)NTKFaceSnapshottingWindow);
    id v7 = self->_snapshotWindow;
    self->_snapshotWindow = v6;

    id v4 = v8;
    snapshotWindow = self->_snapshotWindow;
  }
  [(NTKFaceSnapshottingWindow *)snapshotWindow updateForDevice:v4];
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setHidden:0];
}

- (void)_hideSnapshotWindow
{
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setHidden:1];
  snapshotWindow = self->_snapshotWindow;
  self->_snapshotWindow = 0;
}

- (void)dealloc
{
  [(NTKFaceSnapshottingWindow *)self->_snapshotWindow setHidden:1];
  v3.receiver = self;
  v3.super_class = (Class)NTKFaceSnapshotter;
  [(NTKFaceSnapshotter *)&v3 dealloc];
}

- (void)complicationCollectionDidLoad:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D520;
  block[3] = &unk_248D8;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)qword_2E468, block);
}

- (void).cxx_destruct
{
}

@end