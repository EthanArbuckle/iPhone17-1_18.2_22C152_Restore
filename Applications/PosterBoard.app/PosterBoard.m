id sub_1000024E0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) reset:a2];
}

id sub_1000024EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reset:0];
}

void sub_1000024F8(id a1, id a2)
{
  v4 = v3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000025C4;
  v9[3] = &unk_10000C3C8;
  id v10 = v2;
  id v11 = v4;
  v6 = (void (*)(id, void *))*((void *)a2 + 2);
  id v7 = v11;
  id v8 = v10;
  v6(a2, v9);
}

uint64_t sub_1000025C4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_1000025D8(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t, void))(a1[4] + 16))(a1[4], a1[5], a2, a1[6]);
}

id sub_1000025F4(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _runScrollPosterRackWithTestOptions:*(void *)(a1 + 40) completion:a2];
}

id sub_100002604(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _runScrollPosterGalleryWithTestOptions:*(void *)(a1 + 40) completion:a2];
}

id sub_100002614(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _runSwitchPosterWithTestOptions:*(void *)(a1 + 40) completion:a2];
}

void sub_100002A4C(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  [*(id *)(a1 + 32) addObject:v4];
  objc_sync_exit(v3);
}

void sub_100002AB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100002ACC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 markStartedTest:*(void *)(a1 + 32)];
  v5 = +[PosterBoardTestingUtilities posterRackViewController];
  v6 = [v5 collectionView];

  id v7 = objc_alloc((Class)RPTDirectionalSwipeTestParameters);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100002CA8;
  v16[3] = &unk_10000C468;
  id v8 = v3;
  id v17 = v8;
  id v18 = *(id *)(a1 + 32);
  id v9 = v6;
  id v19 = v9;
  id v10 = [v7 initWithTestName:0 scrollView:v9 completionHandler:v16];
  [v10 setSwipeSpeedFactor:&off_10000CEA0];
  [v10 scrollingBounds];
  UIRectInset();
  [v10 setScrollingBounds:];
  if ([*(id *)(a1 + 40) userInterfaceLayoutDirection] == (id)1) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = 2;
  }
  [v10 setDirection:v11];
  id v12 = *(id *)(a1 + 48);
  objc_sync_enter(v12);
  uint64_t v13 = *(void *)(a1 + 56);
  v14 = (char *)[*(id *)(a1 + 48) count];
  if ((unint64_t)&v14[v13] >= *(void *)(a1 + 64)) {
    v15 = *(char **)(a1 + 64);
  }
  else {
    v15 = &v14[v13];
  }
  [v10 setSwipeCount:v15];
  objc_sync_exit(v12);

  +[RPTTestRunner runTestWithParameters:v10];
}

void sub_100002C90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100002CA8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) markFinishedTest:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 48);
  id v4 = +[NSIndexPath indexPathForItem:0 inSection:0];
  [v3 scrollToItemAtIndexPath:v4 atScrollPosition:16 animated:0];

  v5 = *(void **)(a1 + 32);

  return [v5 finish];
}

id sub_100002D30(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = [*(id *)(a1 + 32) copy];
  objc_sync_exit(v2);

  return v3;
}

void sub_100002D8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100002F38(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 markStartSubTest:@"presentPosterGallery" forTestName:*(void *)(a1 + 32)];
  v5 = +[PosterBoardTestingUtilities posterRackViewController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000301C;
  v7[3] = &unk_10000C508;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v6 = v3;
  [v5 presentPosterGallery:v7];
}

void sub_10000301C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v4 markFinishedSubTest:@"presentPosterGallery" forTestName:*(void *)(a1 + 40)];
    id v6 = [*(id *)(a1 + 32) markStartSubTest:@"scrollPosterGallery" forTestName:*(void *)(a1 + 40)];
    id v7 = objc_alloc((Class)RPTScrollViewTestParameters);
    id v8 = [v3 collectionView];
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    id v12 = sub_100003168;
    uint64_t v13 = &unk_10000C4E0;
    id v14 = *(id *)(a1 + 32);
    id v15 = *(id *)(a1 + 40);
    id v9 = [v7 initWithTestName:0 scrollView:v8 completionHandler:&v10];

    [v9 setPreventSheetDismissal:1 v10, v11, v12, v13];
    +[RPTTestRunner runTestWithParameters:v9];
  }
  else
  {
    [v4 cancelAndFailTestWithReason:@"poster gallery did not present"];
  }
}

id sub_100003168(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) markFinishedSubTest:@"scrollPosterGallery" forTestName:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) markFinishedTest:*(void *)(a1 + 40)];
  id v4 = *(void **)(a1 + 32);

  return [v4 finish];
}

void sub_1000035D8(id a1, PBFPPTBlockOperation *a2)
{
  id v2 = a2;
  id v3 = +[PosterBoardTestingUtilities posterRackViewController];
  id v11 = [v3 posterExtensionDataStore];

  id v4 = [v11 switcherConfiguration];
  id v5 = [v4 mutableCopy];
  id v6 = [v4 configurations];
  id v7 = [v6 lastObject];
  [v5 setSelectedConfiguration:v7];

  id v8 = [v4 configurations];
  id v9 = [v8 lastObject];
  [v5 setDesiredActiveConfiguration:v9];

  id v10 = [v11 updateDataStoreForSwitcherConfiguration:v5 reason:@"PPT" error:0];
  [(PBFPPTBlockOperation *)v2 finish];
}

void sub_1000036FC(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  [*(id *)(a1 + 32) addObject:v4];
  objc_sync_exit(v3);
}

void sub_100003768(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000377C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 markStartSubTest:@"selectedPoster" forTestName:*(void *)(a1 + 32)];
  id v5 = +[PosterBoardTestingUtilities posterRackViewController];
  id v6 = [v5 collectionView];
  [v6 center];
  id v9 = PBFPPTEventActionsToTouchAndHoldAtPoint(v7, v8);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003890;
  v11[3] = &unk_10000C4E0;
  id v12 = v3;
  id v13 = *(id *)(a1 + 32);
  id v10 = v3;
  PBFPPTSynthesizeEventsForEventActions(v9, v11);
}

id sub_100003890(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) markFinishedSubTest:@"selectedPoster" forTestName:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);

  return [v3 finish];
}

id sub_1000038E0(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  id v3 = [*(id *)(a1 + 32) copy];
  objc_sync_exit(v2);

  return v3;
}

void sub_10000393C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100003AC4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [v2 delegate];
    char v6 = objc_opt_isKindOfClass();
  }
  else
  {
    char v6 = 0;
  }

  return v6 & 1;
}

void PBFPPTSynthesizeEventsForEventActions(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = objc_alloc_init((Class)RCPPlayerPlaybackOptions);
  +[RCPInlinePlayer playEventActions:v4 options:v5 completion:v3];
}

Block_layout *PBFPPTEventActionsToSwipeLeftFromRightOfInterface()
{
  return &stru_10000C5D0;
}

void sub_100003C48(id a1, RCPEventStreamComposer *a2)
{
  id v2 = (void *)UIApp;
  id v3 = a2;
  id v4 = +[UIScreen mainScreen];
  id v35 = [v2 _keyWindowForScreen:v4];

  [v35 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  id v13 = [UIApp userInterfaceLayoutDirection];
  CGFloat v14 = v6;
  CGFloat v15 = v8;
  CGFloat v16 = v10;
  CGFloat v17 = v12;
  if (v13 == (id)1) {
    double MinX = CGRectGetMinX(*(CGRect *)&v14);
  }
  else {
    double MinX = CGRectGetMaxX(*(CGRect *)&v14);
  }
  double v19 = MinX;
  v37.origin.x = v6;
  v37.origin.y = v8;
  v37.size.width = v10;
  v37.size.height = v12;
  double MidY = CGRectGetMidY(v37);
  id v21 = [UIApp userInterfaceLayoutDirection];
  CGFloat v22 = v6;
  CGFloat v23 = v8;
  CGFloat v24 = v10;
  CGFloat v25 = v12;
  if (v21 == (id)1) {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v22);
  }
  else {
    double MaxX = CGRectGetMinX(*(CGRect *)&v22);
  }
  double v27 = MaxX;
  v38.origin.x = v6;
  v38.origin.y = v8;
  v38.size.width = v10;
  v38.size.height = v12;
  double v28 = CGRectGetMidY(v38);
  [v35 convertPoint:0 toView:v19 MidY];
  [v35 _convertPointToSceneReferenceSpace:];
  double v30 = v29;
  double v32 = v31;
  [v35 convertPoint:0 toView:v27];
  [v35 _convertPointToSceneReferenceSpace:];
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v30, v32, v33, v34, 0.25);
}

Block_layout *PBFPPTEventActionsToSwipeRightFromLeftOfInterface()
{
  return &stru_10000C5F0;
}

void sub_100003E00(id a1, RCPEventStreamComposer *a2)
{
  id v2 = (void *)UIApp;
  id v3 = a2;
  id v4 = +[UIScreen mainScreen];
  id v35 = [v2 _keyWindowForScreen:v4];

  [v35 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  id v13 = [UIApp userInterfaceLayoutDirection];
  CGFloat v14 = v6;
  CGFloat v15 = v8;
  CGFloat v16 = v10;
  CGFloat v17 = v12;
  if (v13 == (id)1) {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v14);
  }
  else {
    double MaxX = CGRectGetMinX(*(CGRect *)&v14);
  }
  double v19 = MaxX;
  v37.origin.x = v6;
  v37.origin.y = v8;
  v37.size.width = v10;
  v37.size.height = v12;
  double MidY = CGRectGetMidY(v37);
  id v21 = [UIApp userInterfaceLayoutDirection];
  CGFloat v22 = v6;
  CGFloat v23 = v8;
  CGFloat v24 = v10;
  CGFloat v25 = v12;
  if (v21 == (id)1) {
    double MinX = CGRectGetMinX(*(CGRect *)&v22);
  }
  else {
    double MinX = CGRectGetMaxX(*(CGRect *)&v22);
  }
  double v27 = MinX;
  v38.origin.x = v6;
  v38.origin.y = v8;
  v38.size.width = v10;
  v38.size.height = v12;
  double v28 = CGRectGetMidY(v38);
  [v35 convertPoint:0 toView:v19 MidY];
  [v35 _convertPointToSceneReferenceSpace:];
  double v30 = v29;
  double v32 = v31;
  [v35 convertPoint:0 toView:v27];
  [v35 _convertPointToSceneReferenceSpace:];
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v30, v32, v33, v34, 0.25);
}

void *PBFPPTEventActionsToTapAtPoint(double a1, double a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004028;
  v4[3] = &unk_10000C610;
  *(double *)&v4[4] = a1;
  *(double *)&v4[5] = a2;
  id v2 = objc_retainBlock(v4);

  return v2;
}

void sub_100004028(uint64_t a1, void *a2)
{
  id v3 = (void *)UIApp;
  id v4 = a2;
  double v5 = +[UIScreen mainScreen];
  id v6 = [v3 _keyWindowForScreen:v5];

  [v6 convertPoint:0 toView:*(double *)(a1 + 32), *(double *)(a1 + 40)];
  [v6 _convertPointToSceneReferenceSpace:];
  [v4 tap:];
}

void *PBFPPTEventActionsToTouchAndHoldAtPoint(double a1, double a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100004150;
  v4[3] = &unk_10000C610;
  *(double *)&v4[4] = a1;
  *(double *)&v4[5] = a2;
  id v2 = objc_retainBlock(v4);

  return v2;
}

void sub_100004150(uint64_t a1, void *a2)
{
  id v3 = (void *)UIApp;
  id v4 = a2;
  double v5 = +[UIScreen mainScreen];
  id v6 = [v3 _keyWindowForScreen:v5];

  [v6 convertPoint:0 toView:*(double *)(a1 + 32), *(double *)(a1 + 40)];
  [v6 _convertPointToSceneReferenceSpace:];
  [v4 touchDown:];
  [v4 advanceTime:2.0];
  [v4 liftUpAtAllActivePoints];
}

void *PBFPPTEventActionsToPeekAndPopAtPoint(char a1, double a2, double a3, double a4)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004294;
  v6[3] = &unk_10000C630;
  *(double *)&v6[4] = a2;
  *(double *)&v6[5] = a3;
  char v7 = a1;
  *(double *)&v6[6] = a4;
  id v4 = objc_retainBlock(v6);

  return v4;
}

void sub_100004294(uint64_t a1, void *a2)
{
  id v3 = (void *)UIApp;
  id v4 = a2;
  double v5 = +[UIScreen mainScreen];
  id v6 = [v3 _keyWindowForScreen:v5];

  [v6 convertPoint:0 toView:*(double *)(a1 + 32), *(double *)(a1 + 40)];
  [v6 _convertPointToSceneReferenceSpace:];
  [v4 peekAndPop:*(unsigned __int8 *)(a1 + 56)];
}

Block_layout *PBFPPTEventActionsToSwipeUpInMiddleOfInterface()
{
  return &stru_10000C650;
}

void sub_100004354(id a1, RCPEventStreamComposer *a2)
{
  id v2 = (void *)UIApp;
  id v3 = a2;
  id v4 = +[UIScreen mainScreen];
  id v19 = [v2 _keyWindowForScreen:v4];

  [v19 bounds];
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  double MidX = CGRectGetMidX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v11 = CGRectGetMidX(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat v12 = CGRectGetMidY(v24) + -200.0;
  [v19 convertPoint:0 toView:MidX, MidY];
  [v19 _convertPointToSceneReferenceSpace:];
  double v14 = v13;
  double v16 = v15;
  [v19 convertPoint:0 toView:v11];
  [v19 _convertPointToSceneReferenceSpace:];
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v14, v16, v17, v18, 0.25);
}

Block_layout *PBFPPTEventActionsToSwipeDownInMiddleOfInterface()
{
  return &stru_10000C670;
}

void sub_1000044D4(id a1, RCPEventStreamComposer *a2)
{
  id v2 = (void *)UIApp;
  id v3 = a2;
  id v4 = +[UIScreen mainScreen];
  id v19 = [v2 _keyWindowForScreen:v4];

  [v19 bounds];
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  double MidX = CGRectGetMidX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat v10 = CGRectGetMidY(v22) + -200.0;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v11 = CGRectGetMidX(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v24);
  [v19 convertPoint:0 toView:MidX v10];
  [v19 _convertPointToSceneReferenceSpace:];
  double v14 = v13;
  double v16 = v15;
  [v19 convertPoint:0 toView:v11 MidY];
  [v19 _convertPointToSceneReferenceSpace:];
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v14, v16, v17, v18, 0.25);
}

Block_layout *PBFPPTEventActionsToSwipeLeftInMiddleOfInterface()
{
  return &stru_10000C690;
}

void sub_100004654(id a1, RCPEventStreamComposer *a2)
{
  id v2 = (void *)UIApp;
  id v3 = a2;
  id v4 = +[UIScreen mainScreen];
  id v27 = [v2 _keyWindowForScreen:v4];

  [v27 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  id v13 = [UIApp userInterfaceLayoutDirection];
  v29.origin.CGFloat x = v6;
  v29.origin.CGFloat y = v8;
  v29.size.CGFloat width = v10;
  v29.size.CGFloat height = v12;
  double MidX = CGRectGetMidX(v29);
  double v15 = 100.0;
  if (v13 == (id)1) {
    double v16 = -100.0;
  }
  else {
    double v16 = 100.0;
  }
  double v17 = MidX + v16;
  v30.origin.CGFloat x = v6;
  v30.origin.CGFloat y = v8;
  v30.size.CGFloat width = v10;
  v30.size.CGFloat height = v12;
  double MidY = CGRectGetMidY(v30);
  if ([UIApp userInterfaceLayoutDirection] != (id)1) {
    double v15 = -100.0;
  }
  v31.origin.CGFloat x = v6;
  v31.origin.CGFloat y = v8;
  v31.size.CGFloat width = v10;
  v31.size.CGFloat height = v12;
  CGFloat v19 = CGRectGetMidX(v31) + v15;
  v32.origin.CGFloat x = v6;
  v32.origin.CGFloat y = v8;
  v32.size.CGFloat width = v10;
  v32.size.CGFloat height = v12;
  double v20 = CGRectGetMidY(v32);
  [v27 convertPoint:0 toView:v17 MidY];
  [v27 _convertPointToSceneReferenceSpace:];
  double v22 = v21;
  double v24 = v23;
  [v27 convertPoint:0 toView:v19, v20];
  [v27 _convertPointToSceneReferenceSpace:];
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v22, v24, v25, v26, 0.25);
}

Block_layout *PBFPPTEventActionsToSwipeRightInMiddleOfInterface()
{
  return &stru_10000C6B0;
}

void sub_100004810(id a1, RCPEventStreamComposer *a2)
{
  id v2 = (void *)UIApp;
  id v3 = a2;
  id v4 = +[UIScreen mainScreen];
  id v27 = [v2 _keyWindowForScreen:v4];

  [v27 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  id v13 = [UIApp userInterfaceLayoutDirection];
  v29.origin.CGFloat x = v6;
  v29.origin.CGFloat y = v8;
  v29.size.CGFloat width = v10;
  v29.size.CGFloat height = v12;
  double MidX = CGRectGetMidX(v29);
  double v15 = -100.0;
  if (v13 == (id)1) {
    double v16 = 100.0;
  }
  else {
    double v16 = -100.0;
  }
  double v17 = MidX + v16;
  v30.origin.CGFloat x = v6;
  v30.origin.CGFloat y = v8;
  v30.size.CGFloat width = v10;
  v30.size.CGFloat height = v12;
  double MidY = CGRectGetMidY(v30);
  if ([UIApp userInterfaceLayoutDirection] != (id)1) {
    double v15 = 100.0;
  }
  v31.origin.CGFloat x = v6;
  v31.origin.CGFloat y = v8;
  v31.size.CGFloat width = v10;
  v31.size.CGFloat height = v12;
  CGFloat v19 = CGRectGetMidX(v31) + v15;
  v32.origin.CGFloat x = v6;
  v32.origin.CGFloat y = v8;
  v32.size.CGFloat width = v10;
  v32.size.CGFloat height = v12;
  double v20 = CGRectGetMidY(v32);
  [v27 convertPoint:0 toView:v17 MidY];
  [v27 _convertPointToSceneReferenceSpace:];
  double v22 = v21;
  double v24 = v23;
  [v27 convertPoint:0 toView:v19];
  [v27 _convertPointToSceneReferenceSpace:];
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v22, v24, v25, v26, 0.25);
}

Block_layout *PBFPPTEventActionsToSwipeUpFromBottomOfInterface()
{
  return &stru_10000C6D0;
}

void sub_1000049CC(id a1, RCPEventStreamComposer *a2)
{
  id v2 = (void *)UIApp;
  id v3 = a2;
  id v4 = +[UIScreen mainScreen];
  id v19 = [v2 _keyWindowForScreen:v4];

  [v19 bounds];
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  double MidX = CGRectGetMidX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v11 = CGRectGetMidX(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v24);
  [v19 convertPoint:0 toView:MidX, MaxY];
  [v19 _convertPointToSceneReferenceSpace:];
  double v14 = v13;
  double v16 = v15;
  [v19 convertPoint:0 toView:v11 MinY];
  [v19 _convertPointToSceneReferenceSpace:];
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v14, v16, v17, v18, 0.25);
}

Block_layout *PBFPPTEventActionsToSwipeDownFromTopOfInterface()
{
  return &stru_10000C6F0;
}

void sub_100004B44(id a1, RCPEventStreamComposer *a2)
{
  id v2 = (void *)UIApp;
  id v3 = a2;
  id v4 = +[UIScreen mainScreen];
  id v19 = [v2 _keyWindowForScreen:v4];

  [v19 bounds];
  CGFloat x = v21.origin.x;
  CGFloat y = v21.origin.y;
  CGFloat width = v21.size.width;
  CGFloat height = v21.size.height;
  double MidX = CGRectGetMidX(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v22);
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double v11 = CGRectGetMidX(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v24);
  if (PF_IS_PAD_DEVICE())
  {
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    double MidX = CGRectGetMinX(v25) + 100.0;
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v26);
    v27.origin.CGFloat x = x;
    v27.origin.CGFloat y = y;
    v27.size.CGFloat width = width;
    v27.size.CGFloat height = height;
    double v11 = CGRectGetMinX(v27) + 100.0;
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.CGFloat width = width;
    v28.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v28);
  }
  [v19 convertPoint:0 toView:MidX, MinY];
  [v19 _convertPointToSceneReferenceSpace:];
  double v14 = v13;
  double v16 = v15;
  [v19 convertPoint:0 toView:v11 MaxY];
  [v19 _convertPointToSceneReferenceSpace:];
  -[RCPEventStreamComposer sendFlickWithStartPoint:endPoint:duration:](v3, "sendFlickWithStartPoint:endPoint:duration:", v14, v16, v17, v18, 0.25);
}

void sub_100004D20(void *a1, void *a2, void *a3, double a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  uint64_t v32 = 0;
  double v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_100004F9C;
  v36 = sub_100004FC8;
  id v37 = 0;
  uint64_t v26 = 0;
  CGRect v27 = &v26;
  uint64_t v28 = 0x3032000000;
  CGRect v29 = sub_100004FD0;
  CGRect v30 = sub_100004FE0;
  id v31 = 0;
  CGFloat v10 = +[NSNotificationCenter defaultCenter];
  double v11 = +[NSOperationQueue mainQueue];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100004FE8;
  v22[3] = &unk_10000C718;
  CGRect v24 = &v32;
  CGRect v25 = &v26;
  id v12 = v9;
  id v23 = v12;
  uint64_t v13 = [v10 addObserverForName:v7 object:v8 queue:v11 usingBlock:v22];
  double v14 = (void *)v27[5];
  v27[5] = v13;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005090;
  block[3] = &unk_10000C740;
  id v20 = v12;
  CGRect v21 = &v26;
  id v15 = v12;
  dispatch_block_t v16 = dispatch_block_create((dispatch_block_flags_t)0, block);
  double v17 = (void *)v33[5];
  v33[5] = (uint64_t)v16;

  dispatch_time_t v18 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  dispatch_after(v18, (dispatch_queue_t)&_dispatch_main_q, (dispatch_block_t)v33[5]);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
}

void sub_100004F84(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id sub_100004F9C(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100004FC8(uint64_t a1)
{
}

uint64_t sub_100004FD0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004FE0(uint64_t a1)
{
}

void sub_100004FE8(void *a1, void *a2)
{
  id v3 = *(void **)(*(void *)(a1[5] + 8) + 40);
  id v7 = a2;
  dispatch_block_cancel(v3);
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:*(void *)(*(void *)(a1[6] + 8) + 40)];

  uint64_t v5 = *(void *)(a1[6] + 8);
  CGFloat v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;

  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t sub_100005090(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v5();
}

void sub_1000051D4(id a1, PBFPPTBlockOperation *a2)
{
}

void sub_1000052A4(id a1, PBFPPTBlockOperation *a2)
{
}

void sub_10000536C(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 32) * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000542C;
  block[3] = &unk_10000C360;
  id v7 = v3;
  id v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10000542C(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

void sub_100005548(double *a1, void *a2)
{
  id v3 = a2;
  id v5 = (void *)*((void *)a1 + 4);
  dispatch_time_t v4 = (void *)*((void *)a1 + 5);
  double v6 = a1[6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005618;
  v8[3] = &unk_10000C7C8;
  id v9 = v3;
  id v10 = v5;
  uint64_t v11 = *((void *)a1 + 6);
  id v7 = v3;
  sub_100004D20(v5, v4, v8, v6);
}

void sub_100005618(void *a1, uint64_t a2)
{
  id v2 = (void *)a1[4];
  if (a2)
  {
    id v3 = (void *)a1[4];
    [v3 finish];
  }
  else
  {
    id v4 = +[NSString stringWithFormat:@"Didn't observe %@ within %f seconds", a1[5], a1[6]];
    [v2 cancelAndFailTestWithReason:v4];
  }
}

void sub_100005794(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000582C;
  v6[3] = &unk_10000C360;
  id v7 = v3;
  id v5 = v3;
  PBFPPTSynthesizeEventsForEventActions(v4, v6);
}

id sub_10000582C(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

void sub_10000591C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000059B4;
  v6[3] = &unk_10000C360;
  id v7 = v3;
  id v5 = v3;
  [v4 reset:v6];
}

id sub_1000059B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

void sub_100005AAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(unsigned __int8 *)(a1 + 40);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005B54;
  v7[3] = &unk_10000C360;
  id v8 = v3;
  id v6 = v3;
  [v4 scrollToFirstPoster:v5 completion:v7];
}

id sub_100005B54(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

void sub_100005CAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) view];
  uint64_t v5 = [v4 window];
  [v5 center];
  id v8 = PBFPPTEventActionsToTouchAndHoldAtPoint(v6, v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005D84;
  v10[3] = &unk_10000C360;
  id v11 = v3;
  id v9 = v3;
  PBFPPTSynthesizeEventsForEventActions(v8, v10);
}

void sub_100005D84(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005E2C;
  block[3] = &unk_10000C360;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100005E2C(uint64_t a1)
{
  return [*(id *)(a1 + 32) finish];
}

void sub_100005F9C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = PRPosterRoleLockScreen;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006074;
  v9[3] = &unk_10000C868;
  id v10 = v3;
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v8 = v3;
  [v4 createPosterConfigurationForProviderIdentifier:v5 posterDescriptorIdentifier:v7 role:v6 completion:v9];
}

void sub_100006074(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = [v5 description];
    [v7 cancelAndFailTestWithReason:v8];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 40);
    if (v9)
    {
      id v10 = [objc_alloc((Class)PRPosterConfiguration) _initWithPath:v11];
      (*(void (**)(uint64_t, id))(v9 + 16))(v9, v10);
    }
    [*(id *)(a1 + 32) finish];
  }
}

void sub_100006258(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(a1 + 32);
        id v10 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v8) _path];
        id v11 = [v10 serverIdentity];
        id v12 = [v11 posterUUID];
        [v9 deletePosterConfigurationsMatchingUUID:v12 error:0];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  [v3 finish];
}

void sub_100006538(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = +[UIApplication sharedApplication];
  [v3 startedTest:*(void *)(a1 + 32)];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [WeakRetained operationName];
    id v5 = (void *)v4;
    uint64_t v6 = *(void *)(a1 + 32);
    if (v4) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = (uint64_t)WeakRetained;
    }
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' starting testname '%@'", (uint8_t *)&v8, 0x16u);
  }
}

void sub_100006720(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = +[UIApplication sharedApplication];
  [v3 finishedTest:*(void *)(a1 + 32)];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [WeakRetained operationName];
    id v5 = (void *)v4;
    uint64_t v6 = *(void *)(a1 + 32);
    if (v4) {
      uint64_t v7 = v4;
    }
    else {
      uint64_t v7 = (uint64_t)WeakRetained;
    }
    int v8 = 138412546;
    uint64_t v9 = v7;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' finished testname '%@'", (uint8_t *)&v8, 0x16u);
  }
}

void sub_100006928(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = +[UIApplication sharedApplication];
  [v3 startedSubTest:*(void *)(a1 + 32) forTest:*(void *)(a1 + 40)];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [WeakRetained operationName];
    id v5 = (void *)v4;
    if (v4) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = (uint64_t)WeakRetained;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138412802;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' started testname '%@' / sub test %@", (uint8_t *)&v9, 0x20u);
  }
}

void sub_100006B38(uint64_t a1)
{
  BSDispatchQueueAssertMain();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = +[UIApplication sharedApplication];
  [v3 finishedSubTest:*(void *)(a1 + 32) forTest:*(void *)(a1 + 40)];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [WeakRetained operationName];
    id v5 = (void *)v4;
    if (v4) {
      uint64_t v6 = v4;
    }
    else {
      uint64_t v6 = (uint64_t)WeakRetained;
    }
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 138412802;
    uint64_t v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PPT Operation '%@' finished testname '%@' / sub test %@", (uint8_t *)&v9, 0x20u);
  }
}

void sub_10000716C(id a1, PBFPPTBlockOperation *a2)
{
}

CFStringRef sub_1000072B0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) state];
  CFStringRef v2 = @"Pending";
  if (v1 == (id)2) {
    CFStringRef v2 = @"Finished";
  }
  if (v1 == (id)1) {
    return @"Executing";
  }
  else {
    return v2;
  }
}

void sub_10000782C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = +[NSString stringWithFormat:@"Operation didn't complete within %f seconds", *(void *)(a1 + 40)];
  [v1 cancelAndFailTestWithReason:v2];
}

id sub_100007A18()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ApplicationDelegate();
  [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for ApplicationDelegate();
  static CommandLine.unsafeArgv.getter();
  static CommandLine.argc.getter();
  static CommandLine.argc.getter();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t type metadata accessor for ApplicationDelegate()
{
  return self;
}

uint64_t sub_100007B0C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100007B40(void *a1)
{
  id v1 = [a1 operationName];
  int v2 = 138412290;
  id v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Skipping '%@' because it's already executing", (uint8_t *)&v2, 0xCu);
}

void sub_100007BD8(void *a1)
{
  id v1 = [a1 operationName];
  int v2 = 138412290;
  id v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Skipping '%@' because it's already finished", (uint8_t *)&v2, 0xCu);
}

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

uint64_t BSDispatchQueueAssertMain()
{
  return _BSDispatchQueueAssertMain();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PF_IS_PAD_DEVICE()
{
  return _PF_IS_PAD_DEVICE();
}

uint64_t UIRectInset()
{
  return _UIRectInset();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

id objc_msgSend__convertPointToSceneReferenceSpace_(void *a1, const char *a2, ...)
{
  return [a1 _convertPointToSceneReferenceSpace:];
}

id objc_msgSend__initWithPath_(void *a1, const char *a2, ...)
{
  return [a1 _initWithPath:];
}

id objc_msgSend__keyWindowForScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_keyWindowForScreen:");
}

id objc_msgSend__path(void *a1, const char *a2, ...)
{
  return _[a1 _path];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addObserverForName:object:queue:usingBlock:];
}

id objc_msgSend_addOperations_waitUntilFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperations:waitUntilFinished:");
}

id objc_msgSend_advanceTime_(void *a1, const char *a2, ...)
{
  return [a1 advanceTime:];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_appendFloat_withName_(void *a1, const char *a2, ...)
{
  return [a1 appendFloat:withName:];
}

id objc_msgSend_appendString_withName_(void *a1, const char *a2, ...)
{
  return [a1 appendString:withName:];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return _[a1 block];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bs_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 bs_firstObjectPassingTest:];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return _[a1 build];
}

id objc_msgSend_builderWithObject_(void *a1, const char *a2, ...)
{
  return [a1 builderWithObject:];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelAndFailTestWithReason_(void *a1, const char *a2, ...)
{
  return [a1 cancelAndFailTestWithReason:];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _[a1 collectionView];
}

id objc_msgSend_configurations(void *a1, const char *a2, ...)
{
  return _[a1 configurations];
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return _[a1 connectedScenes];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return [a1 convertPoint:toView:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion_(void *a1, const char *a2, ...)
{
  return [a1 createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:];
}

id objc_msgSend_currentTestName(void *a1, const char *a2, ...)
{
  return _[a1 currentTestName];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deletePosterConfigurationsMatchingUUID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deletePosterConfigurationsMatchingUUID:error:");
}

id objc_msgSend_dependencies(void *a1, const char *a2, ...)
{
  return _[a1 dependencies];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_enqueueOperations_(void *a1, const char *a2, ...)
{
  return [a1 enqueueOperations:];
}

id objc_msgSend_failedTest_withFailure_(void *a1, const char *a2, ...)
{
  return [a1 failedTest:withFailure:];
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return _[a1 finish];
}

id objc_msgSend_finishedSubTest_forTest_(void *a1, const char *a2, ...)
{
  return [a1 finishedSubTest:forTest:];
}

id objc_msgSend_finishedTest_(void *a1, const char *a2, ...)
{
  return [a1 finishedTest:];
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForItem:inSection:];
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithBlock:];
}

id objc_msgSend_initWithName_block_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:block:];
}

id objc_msgSend_initWithTestName_scrollView_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithTestName:scrollView:completionHandler:];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return _[a1 isExecuting];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _[a1 isFinished];
}

id objc_msgSend_knownPPTTests(void *a1, const char *a2, ...)
{
  return _[a1 knownPPTTests];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_liftUpAtAllActivePoints(void *a1, const char *a2, ...)
{
  return _[a1 liftUpAtAllActivePoints];
}

id objc_msgSend_main(void *a1, const char *a2, ...)
{
  return _[a1 main];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_markFinishedSubTest_forTestName_(void *a1, const char *a2, ...)
{
  return [a1 markFinishedSubTest:forTestName:];
}

id objc_msgSend_markFinishedTest_(void *a1, const char *a2, ...)
{
  return [a1 markFinishedTest:];
}

id objc_msgSend_markStartSubTest_forTestName_(void *a1, const char *a2, ...)
{
  return [a1 markStartSubTest:forTestName:];
}

id objc_msgSend_markStartedTest_(void *a1, const char *a2, ...)
{
  return [a1 markStartedTest:];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_operationDidFinish(void *a1, const char *a2, ...)
{
  return _[a1 operationDidFinish];
}

id objc_msgSend_operationName(void *a1, const char *a2, ...)
{
  return _[a1 operationName];
}

id objc_msgSend_operationToAddPosterWithProvider_descriptorIdentifier_completion_(void *a1, const char *a2, ...)
{
  return [a1 operationToAddPosterWithProvider:descriptorIdentifier:completion:];
}

id objc_msgSend_operationToDeletePosters_(void *a1, const char *a2, ...)
{
  return [a1 operationToDeletePosters:];
}

id objc_msgSend_operationToFinishTest_(void *a1, const char *a2, ...)
{
  return [a1 operationToFinishTest:];
}

id objc_msgSend_operationToPushInToPosterSwitcher(void *a1, const char *a2, ...)
{
  return _[a1 operationToPushInToPosterSwitcher];
}

id objc_msgSend_operationToResetSwitcher(void *a1, const char *a2, ...)
{
  return _[a1 operationToResetSwitcher];
}

id objc_msgSend_operationToScrollToFirstPoster_(void *a1, const char *a2, ...)
{
  return [a1 operationToScrollToFirstPoster:];
}

id objc_msgSend_operationToStartTest_(void *a1, const char *a2, ...)
{
  return [a1 operationToStartTest:];
}

id objc_msgSend_operationToSynthesizeEventsForEventActions_(void *a1, const char *a2, ...)
{
  return [a1 operationToSynthesizeEventsForEventActions:];
}

id objc_msgSend_operationToWaitForTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 operationToWaitForTimeInterval:];
}

id objc_msgSend_operationWillStart(void *a1, const char *a2, ...)
{
  return _[a1 operationWillStart];
}

id objc_msgSend_operationWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 operationWithBlock:];
}

id objc_msgSend_operationWithName_block_(void *a1, const char *a2, ...)
{
  return [a1 operationWithName:block:];
}

id objc_msgSend_peekAndPop_commit_duration_(void *a1, const char *a2, ...)
{
  return [a1 peekAndPop:commit:duration:];
}

id objc_msgSend_playEventActions_options_completion_(void *a1, const char *a2, ...)
{
  return [a1 playEventActions:options:completion:];
}

id objc_msgSend_posterExtensionDataStore(void *a1, const char *a2, ...)
{
  return _[a1 posterExtensionDataStore];
}

id objc_msgSend_posterRackViewController(void *a1, const char *a2, ...)
{
  return _[a1 posterRackViewController];
}

id objc_msgSend_posterSwitcherWindowScene(void *a1, const char *a2, ...)
{
  return _[a1 posterSwitcherWindowScene];
}

id objc_msgSend_posterUUID(void *a1, const char *a2, ...)
{
  return _[a1 posterUUID];
}

id objc_msgSend_presentPosterGallery_(void *a1, const char *a2, ...)
{
  return [a1 presentPosterGallery:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver];
}

id objc_msgSend_reset_(void *a1, const char *a2, ...)
{
  return [a1 reset:];
}

id objc_msgSend_runTestWithParameters_(void *a1, const char *a2, ...)
{
  return [a1 runTestWithParameters:];
}

id objc_msgSend_runningPPTTestName(void *a1, const char *a2, ...)
{
  return _[a1 runningPPTTestName];
}

id objc_msgSend_scrollToFirstPoster_completion_(void *a1, const char *a2, ...)
{
  return [a1 scrollToFirstPoster:completion:];
}

id objc_msgSend_scrollToItemAtIndexPath_atScrollPosition_animated_(void *a1, const char *a2, ...)
{
  return [a1 scrollToItemAtIndexPath:atScrollPosition:animated:];
}

id objc_msgSend_scrollingBounds(void *a1, const char *a2, ...)
{
  return _[a1 scrollingBounds];
}

id objc_msgSend_sendFlickWithStartPoint_endPoint_duration_(void *a1, const char *a2, ...)
{
  return [a1 sendFlickWithStartPoint:endPoint:duration:];
}

id objc_msgSend_serverIdentity(void *a1, const char *a2, ...)
{
  return _[a1 serverIdentity];
}

id objc_msgSend_setCurrentTestName_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentTestName:];
}

id objc_msgSend_setDesiredActiveConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setDesiredActiveConfiguration:];
}

id objc_msgSend_setDirection_(void *a1, const char *a2, ...)
{
  return [a1 setDirection:];
}

id objc_msgSend_setOperationName_(void *a1, const char *a2, ...)
{
  return [a1 setOperationName:];
}

id objc_msgSend_setPreventSheetDismissal_(void *a1, const char *a2, ...)
{
  return [a1 setPreventSheetDismissal:];
}

id objc_msgSend_setScrollingBounds_(void *a1, const char *a2, ...)
{
  return [a1 setScrollingBounds:];
}

id objc_msgSend_setSelectedConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedConfiguration:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setSwipeCount_(void *a1, const char *a2, ...)
{
  return [a1 setSwipeCount:];
}

id objc_msgSend_setSwipeSpeedFactor_(void *a1, const char *a2, ...)
{
  return [a1 setSwipeSpeedFactor:];
}

id objc_msgSend_setTimeoutBlock_(void *a1, const char *a2, ...)
{
  return [a1 setTimeoutBlock:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_startedSubTest_forTest_(void *a1, const char *a2, ...)
{
  return [a1 startedSubTest:forTest:];
}

id objc_msgSend_startedTest_(void *a1, const char *a2, ...)
{
  return [a1 startedTest:];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_switcherConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 switcherConfiguration];
}

id objc_msgSend_tap_(void *a1, const char *a2, ...)
{
  return [a1 tap:];
}

id objc_msgSend_timeoutBlock(void *a1, const char *a2, ...)
{
  return _[a1 timeoutBlock];
}

id objc_msgSend_timeoutInterval(void *a1, const char *a2, ...)
{
  return _[a1 timeoutInterval];
}

id objc_msgSend_touchDown_(void *a1, const char *a2, ...)
{
  return [a1 touchDown:];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateDataStoreForSwitcherConfiguration_reason_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDataStoreForSwitcherConfiguration:reason:error:");
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceLayoutDirection];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}