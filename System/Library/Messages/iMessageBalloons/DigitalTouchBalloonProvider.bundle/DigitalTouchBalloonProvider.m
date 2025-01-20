id sub_5538(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  long long v6;
  uint64_t v7;
  void *v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  CGAffineTransform v14;

  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  if (*(unsigned char *)(a1 + 48)) {
    v3 = 1.0;
  }
  else {
    v3 = 0.0;
  }
  [v2 setAlpha:v3];
  if (*(unsigned char *)(a1 + 48)) {
    v4 = 1.0;
  }
  else {
    v4 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 40) setAlpha:v4];
  v5 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 49))
  {
    v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v14.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v14.c = v6;
    *(_OWORD *)&v14.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    CGAffineTransformMakeScale(&v14, 0.01, 0.01);
  }
  [v5 setTransform:&v14];
  v7 = *(void *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  if (*(unsigned char *)(a1 + 49))
  {
    v9 = (double *)(v7 + 48);
    v10 = *v9;
    v11 = v9[1];
  }
  else
  {
    [*(id *)(v7 + 40) center];
  }
  objc_msgSend(v8, "setCenter:", v10, v11, *(_OWORD *)&v14.a, *(_OWORD *)&v14.c, *(_OWORD *)&v14.tx);
  if (*(unsigned char *)(a1 + 49))
  {
    v12 = 1.0;
    if (!*(unsigned char *)(a1 + 50)) {
      v12 = 0.0;
    }
  }
  else
  {
    v12 = 0.0;
  }
  return [*(id *)(a1 + 40) setAlpha:v12];
}

uint64_t sub_565C(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 16) = 0;
  return result;
}

id sub_61B8(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateVideoOnButtonOpacity];
  v2 = *(void **)(a1 + 32);

  return [v2 _updateColorPickerEnabled];
}

id sub_61F4(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  UIRectIntegralWithScale();

  return objc_msgSend(v1, "setFrame:");
}

id sub_6444(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) setDimmed:1 excludeSelectedColor:1 animated:0];
  [*(id *)(a1 + 40) setSelected:0];
  memset(&v5, 0, sizeof(v5));
  CGAffineTransformMakeScale(&v5, 0.9, 0.9);
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4 excludeSelectedColor:1];
}

void sub_66C4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_66E4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained canvasView];

  if ([v5 isComposing])
  {
    id v3 = objc_loadWeakRetained(v1);
    CGAffineTransform v4 = [v3 canvasView];
    [v4 setPaused:0];
  }
}

id sub_6770(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDimmed:excludeSelectedColor:animated:", objc_msgSend(*(id *)(a1 + 32), "_shouldDimColorPicker"), 0, 0);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v5[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v2 setTransform:v5 excludeSelectedColor:1];
  return [*(id *)(a1 + 40) setSelected:1];
}

uint64_t sub_6800(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_70C4(uint64_t a1)
{
  double v1 = 0.0;
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 128) setAlpha:v1];
}

id sub_70F0(uint64_t a1)
{
  double v1 = 0.0;
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 136) setAlpha:v1];
}

id sub_711C(uint64_t a1)
{
  double v1 = 0.0;
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 192) setAlpha:v1];
}

id sub_7468(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 264) setAlpha:(double)*(unint64_t *)&a2];
}

id sub_769C(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 112);
  double v3 = 0.0;
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
  CGAffineTransform v4 = *(void **)(*(void *)(a1 + 32) + 112);

  return [v4 setEnabled:1];
}

void sub_7A2C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 280) = 1;
  uint64_t v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

id sub_87F0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 152) frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  v8 = [*(id *)(a1 + 32) view];
  [v8 bounds];
  double v10 = v9;

  v11 = *(void **)(*(void *)(a1 + 32) + 152);

  return objc_msgSend(v11, "setFrame:", v3, v5, v10, v7);
}

unsigned char *sub_898C(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[184]) {
    return [result _updateVideoRecorderTime:*(void *)(a1 + 40) - 1];
  }
  return result;
}

char *sub_9130(uint64_t a1)
{
  result = (char *)[*(id *)(*(void *)(a1 + 32) + 72) videoState];
  if (result == (unsigned char *)&dword_4 + 2)
  {
    [*(id *)(a1 + 32) setPlayingMessage:*(void *)(*(void *)(a1 + 32) + 80)];
    double v3 = *(void **)(a1 + 32);
    return (char *)[v3 _hideVideoController];
  }
  return result;
}

id sub_91A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCameraEnabled:0];
}

void sub_93BC(id a1, UIAlertAction *a2)
{
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  double v2 = +[NSURL URLWithString:@"prefs:root=General&path=USAGE"];
  [v3 openSensitiveURL:v2 withOptions:0];
}

id sub_9550(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_955C(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  double v2 = *(void **)(a1 + 32);

  return [v2 setAlpha:1.0];
}

void sub_97AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_97C8(id *a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (v12)
  {
    objc_msgSend(a1[4], "setMediaURL:");
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    unsigned int v7 = [WeakRetained _showingSendInProgress];

    if (!v7) {
      goto LABEL_6;
    }
    id v8 = objc_loadWeakRetained(a1 + 6);
    double v9 = [v8 sendDelegate];
    id v10 = objc_loadWeakRetained(a1 + 6);
    [v9 canvasViewController:v10 sendMessage:a1[4]];
  }
  else
  {
    id v11 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v11, "_showWriteErrorAlertForMediaType:outOfSpaceError:completion:", 2, objc_msgSend(v5, "code") == &stru_248.reloff, 0);

    [a1[5] deleteWrittenAssets];
    id v8 = objc_loadWeakRetained(a1 + 6);
    [v8 _endMediaMessageComposition];
  }

LABEL_6:
}

id sub_9ADC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCameraEnabled:0];
}

id sub_A234(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[13];
  if (*(unsigned char *)(a1 + 40)) {
    double v4 = 0.1;
  }
  else {
    double v4 = (double)[v2 _shouldShowOnButton];
  }

  return [v3 setAlpha:v4];
}

void sub_B3C8(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v2 = objc_msgSend(*(id *)(a1 + 32), "paletteCircles", 0);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        unsigned int v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (*(unsigned char *)(a1 + 48))
        {
          id v8 = [*(id *)(a1 + 32) selectedCircle];

          if (v7 == v8) {
            continue;
          }
        }
        [v7 setAlpha:*(double *)(a1 + 40)];
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void sub_C960(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32) + 200;
  *(_OWORD *)uint64_t v2 = *(_OWORD *)&kCMTimeZero.value;
  *(void *)(v2 + 16) = kCMTimeZero.epoch;
  id v3 = +[AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeAudio];
  id v4 = [objc_alloc((Class)AVCaptureDeviceInput) initWithDevice:v3 error:0];
  if ([*(id *)(*(void *)(a1 + 32) + 8) canAddInput:v4]) {
    [*(id *)(*(void *)(a1 + 32) + 8) addInput:v4];
  }
  uint64_t v5 = +[NSUserDefaults standardUserDefaults];
  double v6 = [v5 objectForKey:@"ETVideoCameraFrontBackPositionPreference"];

  if (v6) {
    id v7 = [v6 integerValue];
  }
  else {
    id v7 = &dword_0 + 2;
  }
  uint64_t v8 = [*(id *)(a1 + 32) _videoCaptureDeviceAtPosition:v7];
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(void **)(v9 + 192);
  *(void *)(v9 + 192) = v8;

  id v11 = objc_alloc((Class)AVCaptureDeviceInput);
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 192);
  id v26 = 0;
  id v13 = [v11 initWithDevice:v12 error:&v26];
  id v14 = v26;
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(void **)(v15 + 144);
  *(void *)(v15 + 144) = v13;

  if ([*(id *)(*(void *)(a1 + 32) + 8) canAddInput:*(void *)(*(void *)(a1 + 32) + 144)])objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "addInput:", *(void *)(*(void *)(a1 + 32) + 144)); {
  if ([*(id *)(*(void *)(a1 + 32) + 8) canSetSessionPreset:AVCaptureSessionPreset640x480])objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setSessionPreset:", AVCaptureSessionPreset640x480);
  }
  id v17 = objc_alloc_init((Class)AVCaptureAudioDataOutput);
  uint64_t v18 = *(void *)(a1 + 32);
  v19 = *(void **)(v18 + 96);
  *(void *)(v18 + 96) = v17;

  [*(id *)(*(void *)(a1 + 32) + 96) setSampleBufferDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 64)];
  if ([*(id *)(*(void *)(a1 + 32) + 8) canAddOutput:*(void *)(*(void *)(a1 + 32) + 96)])objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "addOutput:", *(void *)(*(void *)(a1 + 32) + 96)); {
  id v20 = objc_alloc_init((Class)AVCaptureVideoDataOutput);
  }
  uint64_t v21 = *(void *)(a1 + 32);
  v22 = *(void **)(v21 + 80);
  *(void *)(v21 + 80) = v20;

  [*(id *)(*(void *)(a1 + 32) + 80) setSampleBufferDelegate:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 64)];
  [*(id *)(*(void *)(a1 + 32) + 80) setAlwaysDiscardsLateVideoFrames:0];
  if ([*(id *)(*(void *)(a1 + 32) + 8) canAddOutput:*(void *)(*(void *)(a1 + 32) + 80)])objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "addOutput:", *(void *)(*(void *)(a1 + 32) + 80)); {
  id v23 = objc_alloc_init((Class)AVCapturePhotoOutput);
  }
  uint64_t v24 = *(void *)(a1 + 32);
  v25 = *(void **)(v24 + 120);
  *(void *)(v24 + 120) = v23;

  [*(id *)(*(void *)(a1 + 32) + 120) setHighResolutionCaptureEnabled:1];
  if ([*(id *)(*(void *)(a1 + 32) + 8) canAddOutput:*(void *)(*(void *)(a1 + 32) + 120)])objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "addOutput:", *(void *)(*(void *)(a1 + 32) + 120)); {
  objc_msgSend(*(id *)(a1 + 32), "_updatePreviewOrientationWithSize:", CGSizeZero.width, CGSizeZero.height);
  }
}

void sub_CFA8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 152) && ![*(id *)(v1 + 56) status])
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 152) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 153) = 1;
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(NSObject **)(v3 + 168);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_D078;
    v6[3] = &unk_24948;
    uint64_t v5 = *(void *)(a1 + 40);
    v6[4] = v3;
    v6[5] = v5;
    dispatch_async(v4, v6);
  }
}

void sub_D078(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _videoCaptureDeviceAtPosition:*(void *)(a1 + 40)];
  id v20 = 0;
  uint64_t v3 = +[AVCaptureDeviceInput deviceInputWithDevice:v2 error:&v20];
  id v4 = v20;
  if (v4)
  {
    char v5 = 0;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 192), v2);
    [*(id *)(*(void *)(a1 + 32) + 8) beginConfiguration];
    [*(id *)(*(void *)(a1 + 32) + 8) removeInput:*(void *)(*(void *)(a1 + 32) + 144)];
    unsigned int v6 = [*(id *)(*(void *)(a1 + 32) + 8) canAddInput:v3];
    char v5 = v6;
    if (v6)
    {
      [*(id *)(*(void *)(a1 + 32) + 8) addInput:v3];
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 144), v3);
      id v7 = *(void **)(a1 + 32);
      uint64_t v8 = [v7 view];
      [v8 bounds];
      objc_msgSend(v7, "_updatePreviewOrientationWithSize:", v9, v10);

      id v11 = +[NSUserDefaults standardUserDefaults];
      uint64_t v12 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
      [v11 setValue:v12 forKey:@"ETVideoCameraFrontBackPositionPreference"];
    }
    else if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134217984;
        uint64_t v22 = v14;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Failed to switch to camera at position: %ld", buf, 0xCu);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 8) commitConfiguration];
  }
  uint64_t v15 = *(void *)(a1 + 32);
  v16 = *(NSObject **)(v15 + 64);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_D328;
  v18[3] = &unk_24A00;
  char v19 = v5;
  uint64_t v17 = *(void *)(a1 + 40);
  v18[4] = v15;
  v18[5] = v17;
  dispatch_async(v16, v18);
}

void *sub_D328(void *result)
{
  uint64_t v1 = result;
  if (*((unsigned char *)result + 48))
  {
    memset(&v5, 0, sizeof(v5));
    if (result[5] == 2)
    {
      CGAffineTransformMakeScale(&v5, -1.0, 1.0);
    }
    else
    {
      long long v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&v5.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v5.c = v2;
      *(_OWORD *)&v5.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    }
    uint64_t v3 = *(void **)(v1[4] + 72);
    CGAffineTransform v4 = v5;
    result = [v3 setTransform:&v4];
  }
  *(unsigned char *)(v1[4] + 152) = 0;
  *(unsigned char *)(v1[4] + 153) = 0;
  return result;
}

id sub_D460(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 192) position] == (char *)&dword_0 + 1) {
    uint64_t v2 = 2;
  }
  else {
    uint64_t v2 = 1;
  }
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 _toggleCameraToPosition:v2];
}

void sub_D768(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  [*(id *)(*(void *)(a1 + 32) + 56) cancelWriting];
  [*(id *)(a1 + 32) _deleteAssetWithFormat:@"DigitalTouch-%@.m4v"];
  uint64_t v2 = *(void *)(a1 + 32) + 200;
  *(_OWORD *)uint64_t v2 = *(_OWORD *)&kCMTimeZero.value;
  *(void *)(v2 + 16) = kCMTimeZero.epoch;
  [*(id *)(a1 + 32) _createWriter];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D850;
  block[3] = &unk_24858;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_D850(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setVideoState:1];
}

void sub_D85C(uint64_t a1)
{
  uint64_t v2 = +[AVCapturePhotoSettings photoSettings];
  [v2 setHighResolutionPhotoEnabled:1];
  uint64_t v3 = [v2 availablePreviewPhotoPixelFormatTypes];
  CGAffineTransform v4 = [v3 firstObject];

  if (v4)
  {
    CGAffineTransform v5 = +[UIScreen mainScreen];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;

    double v10 = +[UIScreen mainScreen];
    [v10 scale];
    double v12 = v11;

    v17[0] = v4;
    v16[0] = kCVPixelBufferPixelFormatTypeKey;
    v16[1] = kCVPixelBufferWidthKey;
    id v13 = +[NSNumber numberWithDouble:v7 * v12];
    v17[1] = v13;
    v16[2] = kCVPixelBufferHeightKey;
    uint64_t v14 = +[NSNumber numberWithDouble:v9 * v12];
    v17[2] = v14;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
    [v2 setPreviewPhotoFormat:v15];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "capturePhotoWithSettings:delegate:", v2);
}

void sub_DA8C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) startRunning];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DB24;
  block[3] = &unk_24858;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_DB24(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) view];
  uint64_t v3 = [v2 layer];
  [v3 addSublayer:*(void *)(*(void *)(a1 + 32) + 160)];

  CGAffineTransform v4 = *(void **)(a1 + 32);

  return [v4 _setVideoState:1];
}

void sub_DC0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 64);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_DC88;
  block[3] = &unk_24858;
  block[4] = v1;
  dispatch_async(v2, block);
}

void *sub_DC88(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 152) && !*(unsigned char *)(v1 + 153))
  {
    uint64_t v2 = result;
    result = [*(id *)(v1 + 56) status];
    if (!result)
    {
      [(id)v2[4] _createWriter];
      result = [*(id *)(v2[4] + 56) startWriting];
      *(unsigned char *)(v2[4] + 48) = 1;
    }
  }
  return result;
}

id sub_DED0(uint64_t a1)
{
  [*(id *)(a1 + 32) _deleteAssetWithFormat:@"DigitalTouch-%@.jpg"];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _deleteAssetWithFormat:@"DigitalTouch-%@.m4v"];
}

void sub_DFA0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 48))
  {
    *(unsigned char *)(v1 + 48) = 0;
    long long v3 = *(_OWORD *)(*(void *)(a1 + 32) + 200);
    time1.epoch = *(void *)(*(void *)(a1 + 32) + 216);
    *(_OWORD *)&time1.value = v3;
    CMTime time2 = kCMTimeZero;
    int32_t v4 = CMTimeCompare(&time1, &time2);
    uint64_t v1 = *(void *)(a1 + 32);
    if (v4)
    {
      [*(id *)(v1 + 72) markAsFinished];
      [*(id *)(*(void *)(a1 + 32) + 88) markAsFinished];
      uint64_t v5 = *(void *)(a1 + 32);
      double v6 = *(void **)(v5 + 56);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_E10C;
      v9[3] = &unk_24858;
      v9[4] = v5;
      [v6 finishWritingWithCompletionHandler:v9];
      uint64_t v1 = *(void *)(a1 + 32);
    }
  }
  double v7 = *(NSObject **)(v1 + 168);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_E358;
  v8[3] = &unk_24858;
  v8[4] = v1;
  dispatch_async(v7, v8);
}

void sub_E10C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E184;
  block[3] = &unk_24858;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_E184(uint64_t a1)
{
  uint64_t v2 = (char *)[*(id *)(*(void *)(a1 + 32) + 56) status] - 3;
  int v3 = IMOSLoggingEnabled();
  if ((unint64_t)v2 > 1)
  {
    if (v3)
    {
      double v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 104);
        int v11 = 138412290;
        uint64_t v12 = v9;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Successfully stopped recording to file: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    if (v3)
    {
      int32_t v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(v5 + 104);
        double v7 = [*(id *)(v5 + 56) error];
        int v11 = 138412546;
        uint64_t v12 = v6;
        __int16 v13 = 2112;
        uint64_t v14 = v7;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Failed to write video to file %@ with ERROR: %@", (uint8_t *)&v11, 0x16u);
      }
    }
    [*(id *)(a1 + 32) _deleteAssetWithFormat:@"DigitalTouch-%@.m4v"];
  }
  AudioServicesPlaySystemSoundWithCompletion(0x45Eu, 0);
  return [*(id *)(a1 + 32) _setVideoState:6];
}

id sub_E358(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) stopRunning];
}

uint64_t sub_E4BC(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 48) = 0;
  return result;
}

void sub_E4D0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) stopRunning];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_E568;
  block[3] = &unk_24858;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_E568(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32) + 16;
  *(_OWORD *)uint64_t v1 = *(_OWORD *)&kCMTimeZero.value;
  *(void *)(v1 + 16) = kCMTimeZero.epoch;
  return [*(id *)(a1 + 32) _setVideoState:0];
}

id sub_E908(uint64_t a1)
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 104);
      int v5 = 138412290;
      uint64_t v6 = v3;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Started recording to file: %@", (uint8_t *)&v5, 0xCu);
    }
  }
  return [*(id *)(a1 + 32) _setVideoState:2];
}

id sub_EC08(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1[23] == 4) {
    return [v1 _setVideoState:5];
  }
  else {
    return [v1 _deleteAssetWithFormat:@"DigitalTouch-%@.jpg"];
  }
}

id sub_ECB0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 120);
  *(void *)(v2 + 120) = 0;

  int32_t v4 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v4 stopRunning];
}

void sub_EDA8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _urlWithFormat:@"DigitalTouch-%@.jpg"];
  if (([*(id *)(*(void *)(a1 + 32) + 136) writeToURL:v2 atomically:1] & 1) == 0)
  {

    uint64_t v2 = 0;
  }
  if (*(void *)(a1 + 40))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_EE9C;
    block[3] = &unk_24A28;
    id v6 = *(id *)(a1 + 40);
    id v4 = v2;
    id v5 = 0;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

uint64_t sub_EE9C(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_EF34(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 56) status])
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 153) = 1;
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(NSObject **)(v2 + 168);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_EFF0;
    block[3] = &unk_24A78;
    void block[4] = v2;
    long long v5 = *(_OWORD *)(a1 + 40);
    dispatch_async(v3, block);
  }
}

void sub_EFF0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updatePreviewOrientationWithSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 64);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F084;
  block[3] = &unk_24858;
  void block[4] = v2;
  dispatch_async(v3, block);
}

uint64_t sub_F084(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 153) = 0;
  return result;
}

void sub_F4E0(id a1)
{
  qword_2F100 = +[UIColor colorWithRed:0.9294 green:0.1098 blue:0.1412 alpha:1.0];

  _objc_release_x1();
}

void sub_F5F0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v4 = [v1 _redColor];
  uint64_t v2 = [v1 _dimColor:v4];
  uint64_t v3 = (void *)qword_2F110;
  qword_2F110 = v2;
}

id sub_109EC(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 8) setAlpha:1.0];
  uint64_t v2 = [*(id *)(a1 + 32) pickerCircle];
  [v2 setAlpha:1.0];

  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v10 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v8 = v10;
  long long v11 = v9;
  long long v12 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v7 = v12;
  [v3 setTransform:&v10];
  id v4 = [*(id *)(a1 + 32) pickerCircle];
  long long v10 = v8;
  long long v11 = v9;
  long long v12 = v7;
  [v4 setTransform:&v10];

  long long v5 = *(void **)(*(void *)(a1 + 32) + 16);
  long long v10 = v8;
  long long v11 = v9;
  long long v12 = v7;
  [v5 setTransform:&v10];
  return [*(id *)(a1 + 40) setAlpha:1.0];
}

uint64_t sub_10AF4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_10C60(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 16);
  CGAffineTransformMakeScale(&v13, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 48));
  [v2 setTransform:&v13];
  [*(id *)(*(void *)(a1 + 40) + 8) setAlpha:0.0];
  uint64_t v3 = [*(id *)(a1 + 40) pickerCircle];
  [v3 setAlpha:0.0];

  id v4 = *(void **)(*(void *)(a1 + 40) + 8);
  long long v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v10 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v8 = v10;
  long long v11 = v9;
  long long v12 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v7 = v12;
  [v4 setTransform:&v10];
  long long v5 = [*(id *)(a1 + 40) pickerCircle];
  long long v10 = v8;
  long long v11 = v9;
  long long v12 = v7;
  [v5 setTransform:&v10];

  return [*(id *)(a1 + 40) setAlpha:0.0];
}

uint64_t sub_10D68(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v5[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v2 setTransform:v5];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

BOOL sub_11918(void *a1)
{
  return +[ETMessageImageEncoder createVideoForMessage:a1[4] atURL:a1[5] completionBlock:a1[6]];
}

void sub_11BB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_11BE0(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  id v11 = objc_msgSend(objc_alloc((Class)SKScene), "initWithSize:", v2, v3);
  id v4 = +[UIColor blackColor];
  long long v5 = [v4 colorSpaceConvertedColor];
  [v11 setBackgroundColor:v5];

  objc_msgSend(v11, "setAnchorPoint:", 0.5, 0.5);
  id v6 = objc_msgSend(objc_alloc((Class)SKView), "initWithFrame:", 0.0, 0.0, v2, v3);
  [v6 presentScene:v11];
  [v6 setPaused:0];
  [*(id *)(a1 + 32) displayInScene:v11];
  [*(id *)(a1 + 32) messageDuration];
  uint64_t v7 = 0;
  double v9 = ceil(v8 / 10.0);
  do
    [v11 _update:v9 * (double)v7++];
  while (v7 != 10);
  [v6 setPaused:1];
  long long v10 = [v6 textureFromNode:v11];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v10 _createCGImage];
}

void sub_12630(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    objc_end_catch();
    if (!v39) {
      JUMPOUT(0x1231CLL);
    }
    JUMPOUT(0x12458);
  }
  _Unwind_Resume(exception_object);
}

void sub_12680(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    if ([*(id *)(a1 + 32) isReadyForMoreMediaData])
    {
      do
      {
        uint64_t v2 = *(void *)(*(void *)(a1 + 72) + 8);
        unint64_t v3 = *(void *)(v2 + 24);
        if (v3 >= *(void *)(a1 + 80)) {
          break;
        }
        id v4 = *(void **)(a1 + 40);
        uint64_t v5 = *(void *)(a1 + 88);
        *(void *)(v2 + 24) = v3 + 1;
        CMTimeMake(&v11, v3, 60);
        [v4 appendPixelBuffer:v5 withPresentationTime:&v11];
      }
      while (([*(id *)(a1 + 32) isReadyForMoreMediaData] & 1) != 0);
    }
    if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) >= *(void *)(a1 + 80))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_127D4;
      block[3] = &unk_24BA0;
      uint64_t v10 = *(void *)(a1 + 88);
      id v7 = *(id *)(a1 + 32);
      id v8 = *(id *)(a1 + 48);
      id v9 = *(id *)(a1 + 56);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

id sub_127D4(uint64_t a1)
{
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
  [*(id *)(a1 + 32) markAsFinished];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 finishWritingWithCompletionHandler:v3];
}

void sub_12DFC(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) status] == (char *)&dword_0 + 3;
  uint64_t v3 = [*(id *)(a1 + 32) outputURL];
  +[ETMessageImageEncoder _finishedWritingAtURL:v3 withSuccess:v2 completionBlock:*(void *)(a1 + 48)];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12ED4;
  block[3] = &unk_24858;
  id v5 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_12ED4(uint64_t a1)
{
  [*(id *)(a1 + 32) setSketchMessageRenderer:0];
  BOOL v2 = *(void **)(a1 + 32);

  return [v2 setSceneMessageRenderers:0];
}

id sub_13294(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 _shouldShowPlaceholderView];

  return [v1 _setShowingPlaceholderView:v2];
}

id sub_139FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setShowingPlaceholderView:0];
}

void sub_13CBC(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1[4] canvasView];
  id v5 = [v4 backgroundColor];
  if (v3)
  {
    id v6 = +[UIColor clearColor];
    [v4 setBackgroundColor:v6];
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_13EAC;
  void v17[3] = &unk_24C18;
  id v18 = a1[5];
  id v7 = v3;
  id v19 = v7;
  BOOL v22 = v3 != 0;
  id v8 = v4;
  id v20 = v8;
  id v9 = v5;
  id v21 = v9;
  uint64_t v10 = objc_retainBlock(v17);
  CMTime v11 = v10;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_13F74;
    block[3] = &unk_24C40;
    id v15 = a1[6];
    id v16 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

    long long v12 = v15;
  }
  else
  {
    CGAffineTransform v13 = (void (**)(id, void *))a1[6];
    long long v12 = ((void (*)(void *))v10[2])(v10);
    v13[2](v13, v12);
  }
}

id sub_13EAC(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  v14.width = v6;
  v14.height = v8;
  UIGraphicsBeginImageContextWithOptions(v14, 1, 0.0);
  uint64_t v10 = *(void **)(a1 + 40);
  if (v10) {
    objc_msgSend(v10, "drawInRect:", v3, v5, v7, v9);
  }
  objc_msgSend(*(id *)(a1 + 32), "drawViewHierarchyInRect:afterScreenUpdates:", 0, v3, v5, v7, v9);
  CMTime v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 48) setBackgroundColor:*(void *)(a1 + 56)];
  }

  return v11;
}

void sub_13F74(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_13FD8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stillImage];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_140B8;
  _OWORD v5[3] = &unk_24C90;
  char v9 = *(unsigned char *)(a1 + 56);
  id v3 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  objc_destroyWeak(&v8);
}

void sub_140B8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    id v4 = [WeakRetained updateSnapshot];

    if (v4)
    {
      id v6 = objc_loadWeakRetained((id *)(a1 + 48));
      double v5 = [v6 updateSnapshot];
      v5[2](v5, *(void *)(a1 + 32));
    }
  }
}

void sub_14304(id a1)
{
  id v4 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v1 = +[UIImage imageNamed:@"placeholder" inBundle:v4];
  uint64_t v2 = [v1 imageWithRenderingMode:2];
  id v3 = (void *)qword_2F120;
  qword_2F120 = v2;
}

void sub_15780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_15798(double *a1)
{
  unsigned int v2 = [*(id *)(*((void *)a1 + 4) + 8) messageType];
  id v3 = (void *)*((void *)a1 + 4);
  double v4 = a1[6];
  if (v2 == 1) {
    id result = [v3 _createSketchImageForTime:v4];
  }
  else {
    id result = [v3 _createSceneImageForTime:v4];
  }
  *(void *)(*(void *)(*((void *)a1 + 5) + 8) + 24) = result;
  return result;
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return _CGAffineTransformRotate(retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return _CGBitmapContextGetHeight(context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return _CGBitmapContextGetWidth(context);
}

CFDataRef CGColorSpaceCopyICCData(CGColorSpaceRef space)
{
  return _CGColorSpaceCopyICCData(space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return _CGColorSpaceCreateDeviceRGB();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return _CGImageDestinationCreateWithURL(url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return _CGImageDestinationFinalize(idst);
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return _CGPathCreateWithEllipseInRect(rect, transform);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return _CGPathCreateWithRoundedRect(rect, cornerWidth, cornerHeight, transform);
}

void CGPathRelease(CGPathRef path)
{
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return _CMClockGetTime(retstr, clock);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetImageBuffer(sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetPresentationTimeStamp(retstr, sbuf);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return _CMTimeCompare(time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return _CMTimeSubtract(retstr, lhs, rhs);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBaseAddress(pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetBytesPerRow(pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return _CVPixelBufferLockBaseAddress(pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreatePixelBuffer(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CVPixelBufferRef *pixelBufferOut)
{
  return _CVPixelBufferPoolCreatePixelBuffer(allocator, pixelBufferPool, pixelBufferOut);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return _CVPixelBufferUnlockBaseAddress(pixelBuffer, unlockFlags);
}

uint64_t HueFromRadians()
{
  return _HueFromRadians();
}

uint64_t IMAttachmentPreviewFileURL()
{
  return _IMAttachmentPreviewFileURL();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

uint64_t IMPreviewExtension()
{
  return _IMPreviewExtension();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
}

uint64_t RadiansFromHue()
{
  return _RadiansFromHue();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

uint64_t UIPointRoundToViewScale()
{
  return _UIPointRoundToViewScale();
}

uint64_t UIRectIntegralWithScale()
{
  return _UIRectIntegralWithScale();
}

uint64_t UIRoundToViewScale()
{
  return _UIRoundToViewScale();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIContentSizeCategoryCompareToContentSizeCategory()
{
  return __UIContentSizeCategoryCompareToContentSizeCategory();
}

uint64_t _UIContentSizeCategoryIsAccessibilityContentSizeCategory()
{
  return __UIContentSizeCategoryIsAccessibilityContentSizeCategory();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend__addCaptureSessionObservers(void *a1, const char *a2, ...)
{
  return [a1 _addCaptureSessionObservers];
}

id objc_msgSend__attachmentPlaceholderImage(void *a1, const char *a2, ...)
{
  return [a1 _attachmentPlaceholderImage];
}

id objc_msgSend__audioToggleButton(void *a1, const char *a2, ...)
{
  return [a1 _audioToggleButton];
}

id objc_msgSend__canShowCompositionControls(void *a1, const char *a2, ...)
{
  return [a1 _canShowCompositionControls];
}

id objc_msgSend__cancelButton(void *a1, const char *a2, ...)
{
  return [a1 _cancelButton];
}

id objc_msgSend__clearPhotoSendMessageTimer(void *a1, const char *a2, ...)
{
  return [a1 _clearPhotoSendMessageTimer];
}

id objc_msgSend__cornerButtonInset(void *a1, const char *a2, ...)
{
  return [a1 _cornerButtonInset];
}

id objc_msgSend__createCGImage(void *a1, const char *a2, ...)
{
  return [a1 _createCGImage];
}

id objc_msgSend__createWriter(void *a1, const char *a2, ...)
{
  return [a1 _createWriter];
}

id objc_msgSend__detentValues(void *a1, const char *a2, ...)
{
  return [a1 _detentValues];
}

id objc_msgSend__dismissColorWheel(void *a1, const char *a2, ...)
{
  return [a1 _dismissColorWheel];
}

id objc_msgSend__doneViewDiameter(void *a1, const char *a2, ...)
{
  return [a1 _doneViewDiameter];
}

id objc_msgSend__endIntroMessage(void *a1, const char *a2, ...)
{
  return [a1 _endIntroMessage];
}

id objc_msgSend__endMediaMessageComposition(void *a1, const char *a2, ...)
{
  return [a1 _endMediaMessageComposition];
}

id objc_msgSend__endPhotoMessageComposition(void *a1, const char *a2, ...)
{
  return [a1 _endPhotoMessageComposition];
}

id objc_msgSend__gestureInstructionViewIsShown(void *a1, const char *a2, ...)
{
  return [a1 _gestureInstructionViewIsShown];
}

id objc_msgSend__grabberTopSpacing(void *a1, const char *a2, ...)
{
  return [a1 _grabberTopSpacing];
}

id objc_msgSend__innerColor(void *a1, const char *a2, ...)
{
  return [a1 _innerColor];
}

id objc_msgSend__largeVideoOnButton(void *a1, const char *a2, ...)
{
  return [a1 _largeVideoOnButton];
}

id objc_msgSend__moveComposedMessagesIntoMediaMessage(void *a1, const char *a2, ...)
{
  return [a1 _moveComposedMessagesIntoMediaMessage];
}

id objc_msgSend__placeholderImageURL(void *a1, const char *a2, ...)
{
  return [a1 _placeholderImageURL];
}

id objc_msgSend__playingParentMessage(void *a1, const char *a2, ...)
{
  return [a1 _playingParentMessage];
}

id objc_msgSend__redColor(void *a1, const char *a2, ...)
{
  return [a1 _redColor];
}

id objc_msgSend__relinquishAudio(void *a1, const char *a2, ...)
{
  return [a1 _relinquishAudio];
}

id objc_msgSend__replayButton(void *a1, const char *a2, ...)
{
  return [a1 _replayButton];
}

id objc_msgSend__setPickerPositionInGradientWheel(void *a1, const char *a2, ...)
{
  return [a1 _setPickerPositionInGradientWheel];
}

id objc_msgSend__shouldAutoSend(void *a1, const char *a2, ...)
{
  return [a1 _shouldAutoSend];
}

id objc_msgSend__shouldDimColorPicker(void *a1, const char *a2, ...)
{
  return [a1 _shouldDimColorPicker];
}

id objc_msgSend__shouldRestrictOrientation(void *a1, const char *a2, ...)
{
  return [a1 _shouldRestrictOrientation];
}

id objc_msgSend__shouldShowOnButton(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowOnButton];
}

id objc_msgSend__shouldShowPlaceholderView(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowPlaceholderView];
}

id objc_msgSend__shouldShowSendButton(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowSendButton];
}

id objc_msgSend__showingSendInProgress(void *a1, const char *a2, ...)
{
  return [a1 _showingSendInProgress];
}

id objc_msgSend__skipButton(void *a1, const char *a2, ...)
{
  return [a1 _skipButton];
}

id objc_msgSend__smallVideoOnButton(void *a1, const char *a2, ...)
{
  return [a1 _smallVideoOnButton];
}

id objc_msgSend__startCameraPreview(void *a1, const char *a2, ...)
{
  return [a1 _startCameraPreview];
}

id objc_msgSend__startPhotoSendMessageTimer(void *a1, const char *a2, ...)
{
  return [a1 _startPhotoSendMessageTimer];
}

id objc_msgSend__topMarginForColorPicker(void *a1, const char *a2, ...)
{
  return [a1 _topMarginForColorPicker];
}

id objc_msgSend__updateBackToPreviewButton(void *a1, const char *a2, ...)
{
  return [a1 _updateBackToPreviewButton];
}

id objc_msgSend__updateBottomMargin(void *a1, const char *a2, ...)
{
  return [a1 _updateBottomMargin];
}

id objc_msgSend__updateCanvasInteractionEnabled(void *a1, const char *a2, ...)
{
  return [a1 _updateCanvasInteractionEnabled];
}

id objc_msgSend__updateColorPickerEnabled(void *a1, const char *a2, ...)
{
  return [a1 _updateColorPickerEnabled];
}

id objc_msgSend__updateCompositionControls(void *a1, const char *a2, ...)
{
  return [a1 _updateCompositionControls];
}

id objc_msgSend__updateCompositionControlsCenter(void *a1, const char *a2, ...)
{
  return [a1 _updateCompositionControlsCenter];
}

id objc_msgSend__updateGestureInstructionButton(void *a1, const char *a2, ...)
{
  return [a1 _updateGestureInstructionButton];
}

id objc_msgSend__updateGestureInstructionViewFrame(void *a1, const char *a2, ...)
{
  return [a1 _updateGestureInstructionViewFrame];
}

id objc_msgSend__updateLandscapeTrap(void *a1, const char *a2, ...)
{
  return [a1 _updateLandscapeTrap];
}

id objc_msgSend__updateMediaInstructionView(void *a1, const char *a2, ...)
{
  return [a1 _updateMediaInstructionView];
}

id objc_msgSend__updatePlaybackControls(void *a1, const char *a2, ...)
{
  return [a1 _updatePlaybackControls];
}

id objc_msgSend__updateSendButton(void *a1, const char *a2, ...)
{
  return [a1 _updateSendButton];
}

id objc_msgSend__updateTextLabelFrame(void *a1, const char *a2, ...)
{
  return [a1 _updateTextLabelFrame];
}

id objc_msgSend__updateUI(void *a1, const char *a2, ...)
{
  return [a1 _updateUI];
}

id objc_msgSend__updateVideoOnButtonOpacity(void *a1, const char *a2, ...)
{
  return [a1 _updateVideoOnButtonOpacity];
}

id objc_msgSend__updateVideoPreviewFrame(void *a1, const char *a2, ...)
{
  return [a1 _updateVideoPreviewFrame];
}

id objc_msgSend__updateVideoProgressFrame(void *a1, const char *a2, ...)
{
  return [a1 _updateVideoProgressFrame];
}

id objc_msgSend__usesLargeSize(void *a1, const char *a2, ...)
{
  return [a1 _usesLargeSize];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activeFormat(void *a1, const char *a2, ...)
{
  return [a1 activeFormat];
}

id objc_msgSend_allPayloads(void *a1, const char *a2, ...)
{
  return [a1 allPayloads];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_animationDuration(void *a1, const char *a2, ...)
{
  return [a1 animationDuration];
}

id objc_msgSend_animationTimingFunction(void *a1, const char *a2, ...)
{
  return [a1 animationTimingFunction];
}

id objc_msgSend_archive(void *a1, const char *a2, ...)
{
  return [a1 archive];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_availablePreviewPhotoPixelFormatTypes(void *a1, const char *a2, ...)
{
  return [a1 availablePreviewPhotoPixelFormatTypes];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_backgroundImage(void *a1, const char *a2, ...)
{
  return [a1 backgroundImage];
}

id objc_msgSend_balloonPlaybackCompletion(void *a1, const char *a2, ...)
{
  return [a1 balloonPlaybackCompletion];
}

id objc_msgSend_beginConfiguration(void *a1, const char *a2, ...)
{
  return [a1 beginConfiguration];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_canCompressTime(void *a1, const char *a2, ...)
{
  return [a1 canCompressTime];
}

id objc_msgSend_cancelRecording(void *a1, const char *a2, ...)
{
  return [a1 cancelRecording];
}

id objc_msgSend_cancelWriting(void *a1, const char *a2, ...)
{
  return [a1 cancelWriting];
}

id objc_msgSend_canvasView(void *a1, const char *a2, ...)
{
  return [a1 canvasView];
}

id objc_msgSend_canvasViewController(void *a1, const char *a2, ...)
{
  return [a1 canvasViewController];
}

id objc_msgSend_canvasViewControllerClass(void *a1, const char *a2, ...)
{
  return [a1 canvasViewControllerClass];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clearDeferredMessages(void *a1, const char *a2, ...)
{
  return [a1 clearDeferredMessages];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_colorCircleDiameter(void *a1, const char *a2, ...)
{
  return [a1 colorCircleDiameter];
}

id objc_msgSend_colorCircleHorizontalSpacing(void *a1, const char *a2, ...)
{
  return [a1 colorCircleHorizontalSpacing];
}

id objc_msgSend_colorCircleSize(void *a1, const char *a2, ...)
{
  return [a1 colorCircleSize];
}

id objc_msgSend_colorPicker(void *a1, const char *a2, ...)
{
  return [a1 colorPicker];
}

id objc_msgSend_colorSpaceConvertedColor(void *a1, const char *a2, ...)
{
  return [a1 colorSpaceConvertedColor];
}

id objc_msgSend_colorWheel(void *a1, const char *a2, ...)
{
  return [a1 colorWheel];
}

id objc_msgSend_colorWheelRadius(void *a1, const char *a2, ...)
{
  return [a1 colorWheelRadius];
}

id objc_msgSend_commitConfiguration(void *a1, const char *a2, ...)
{
  return [a1 commitConfiguration];
}

id objc_msgSend_composedSketchMessage(void *a1, const char *a2, ...)
{
  return [a1 composedSketchMessage];
}

id objc_msgSend_compositionTime(void *a1, const char *a2, ...)
{
  return [a1 compositionTime];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_cornerRadius(void *a1, const char *a2, ...)
{
  return [a1 cornerRadius];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createRenderedFrameImage(void *a1, const char *a2, ...)
{
  return [a1 createRenderedFrameImage];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentFrameIntervalSinceFirstFrame(void *a1, const char *a2, ...)
{
  return [a1 currentFrameIntervalSinceFirstFrame];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_customVideoCompositor(void *a1, const char *a2, ...)
{
  return [a1 customVideoCompositor];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_deferredMessages(void *a1, const char *a2, ...)
{
  return [a1 deferredMessages];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deleteWrittenAssets(void *a1, const char *a2, ...)
{
  return [a1 deleteWrittenAssets];
}

id objc_msgSend_disallowInstruction(void *a1, const char *a2, ...)
{
  return [a1 disallowInstruction];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_doneButton(void *a1, const char *a2, ...)
{
  return [a1 doneButton];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_drawFrameBeforeWisp(void *a1, const char *a2, ...)
{
  return [a1 drawFrameBeforeWisp];
}

id objc_msgSend_endMessageComposition(void *a1, const char *a2, ...)
{
  return [a1 endMessageComposition];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return [a1 extent];
}

id objc_msgSend_finishRecording(void *a1, const char *a2, ...)
{
  return [a1 finishRecording];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_gradientWidth(void *a1, const char *a2, ...)
{
  return [a1 gradientWidth];
}

id objc_msgSend_heartbreakTime(void *a1, const char *a2, ...)
{
  return [a1 heartbreakTime];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 horizontalSizeClass];
}

id objc_msgSend_hueRotation(void *a1, const char *a2, ...)
{
  return [a1 hueRotation];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreAppearanceCallbacks(void *a1, const char *a2, ...)
{
  return [a1 ignoreAppearanceCallbacks];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_inExpandedPresentation(void *a1, const char *a2, ...)
{
  return [a1 inExpandedPresentation];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_introMessage(void *a1, const char *a2, ...)
{
  return [a1 introMessage];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isComposing(void *a1, const char *a2, ...)
{
  return [a1 isComposing];
}

id objc_msgSend_isComposingCompositeMessage(void *a1, const char *a2, ...)
{
  return [a1 isComposingCompositeMessage];
}

id objc_msgSend_isComposingSketch(void *a1, const char *a2, ...)
{
  return [a1 isComposingSketch];
}

id objc_msgSend_isDimmed(void *a1, const char *a2, ...)
{
  return [a1 isDimmed];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return [a1 isFromMe];
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return [a1 isHighlighted];
}

id objc_msgSend_isInstructionAllowed(void *a1, const char *a2, ...)
{
  return [a1 isInstructionAllowed];
}

id objc_msgSend_isLast(void *a1, const char *a2, ...)
{
  return [a1 isLast];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isPlayed(void *a1, const char *a2, ...)
{
  return [a1 isPlayed];
}

id objc_msgSend_isPlayingCompositeMessage(void *a1, const char *a2, ...)
{
  return [a1 isPlayingCompositeMessage];
}

id objc_msgSend_isPlayingMessages(void *a1, const char *a2, ...)
{
  return [a1 isPlayingMessages];
}

id objc_msgSend_isPresented(void *a1, const char *a2, ...)
{
  return [a1 isPresented];
}

id objc_msgSend_isReadyForMoreMediaData(void *a1, const char *a2, ...)
{
  return [a1 isReadyForMoreMediaData];
}

id objc_msgSend_isRenderingOffscreenOpaque(void *a1, const char *a2, ...)
{
  return [a1 isRenderingOffscreenOpaque];
}

id objc_msgSend_isTracking(void *a1, const char *a2, ...)
{
  return [a1 isTracking];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return [a1 lightGrayColor];
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 loadViewIfNeeded];
}

id objc_msgSend_longPressRecognizer(void *a1, const char *a2, ...)
{
  return [a1 longPressRecognizer];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_markAsFinished(void *a1, const char *a2, ...)
{
  return [a1 markAsFinished];
}

id objc_msgSend_markAsPlayed(void *a1, const char *a2, ...)
{
  return [a1 markAsPlayed];
}

id objc_msgSend_masterClock(void *a1, const char *a2, ...)
{
  return [a1 masterClock];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return [a1 mediaType];
}

id objc_msgSend_mediaURL(void *a1, const char *a2, ...)
{
  return [a1 mediaURL];
}

id objc_msgSend_messageDuration(void *a1, const char *a2, ...)
{
  return [a1 messageDuration];
}

id objc_msgSend_messageGUID(void *a1, const char *a2, ...)
{
  return [a1 messageGUID];
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return [a1 messageType];
}

id objc_msgSend_minimumRowHeight(void *a1, const char *a2, ...)
{
  return [a1 minimumRowHeight];
}

id objc_msgSend_naturalSize(void *a1, const char *a2, ...)
{
  return [a1 naturalSize];
}

id objc_msgSend_newPixelBuffer(void *a1, const char *a2, ...)
{
  return [a1 newPixelBuffer];
}

id objc_msgSend_outputURL(void *a1, const char *a2, ...)
{
  return [a1 outputURL];
}

id objc_msgSend_paletteCircles(void *a1, const char *a2, ...)
{
  return [a1 paletteCircles];
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 panGestureRecognizer];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_photoSettings(void *a1, const char *a2, ...)
{
  return [a1 photoSettings];
}

id objc_msgSend_pickerCircle(void *a1, const char *a2, ...)
{
  return [a1 pickerCircle];
}

id objc_msgSend_pickerDiameter(void *a1, const char *a2, ...)
{
  return [a1 pickerDiameter];
}

id objc_msgSend_pickerRotation(void *a1, const char *a2, ...)
{
  return [a1 pickerRotation];
}

id objc_msgSend_pixelBufferPool(void *a1, const char *a2, ...)
{
  return [a1 pixelBufferPool];
}

id objc_msgSend_placeholderImage(void *a1, const char *a2, ...)
{
  return [a1 placeholderImage];
}

id objc_msgSend_playingMessage(void *a1, const char *a2, ...)
{
  return [a1 playingMessage];
}

id objc_msgSend_playingMessages(void *a1, const char *a2, ...)
{
  return [a1 playingMessages];
}

id objc_msgSend_pluginPayload(void *a1, const char *a2, ...)
{
  return [a1 pluginPayload];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return [a1 position];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredTransform(void *a1, const char *a2, ...)
{
  return [a1 preferredTransform];
}

id objc_msgSend_presentationDelegate(void *a1, const char *a2, ...)
{
  return [a1 presentationDelegate];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return [a1 removeAllAnimations];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_renderContext(void *a1, const char *a2, ...)
{
  return [a1 renderContext];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_selectedCircle(void *a1, const char *a2, ...)
{
  return [a1 selectedCircle];
}

id objc_msgSend_selectedColor(void *a1, const char *a2, ...)
{
  return [a1 selectedColor];
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return [a1 semanticContentAttribute];
}

id objc_msgSend_sendCurrentMessage(void *a1, const char *a2, ...)
{
  return [a1 sendCurrentMessage];
}

id objc_msgSend_sendDelegate(void *a1, const char *a2, ...)
{
  return [a1 sendDelegate];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sheetPresentationController(void *a1, const char *a2, ...)
{
  return [a1 sheetPresentationController];
}

id objc_msgSend_shouldAutorotate(void *a1, const char *a2, ...)
{
  return [a1 shouldAutorotate];
}

id objc_msgSend_shouldCompressSpacingBetweenColumns(void *a1, const char *a2, ...)
{
  return [a1 shouldCompressSpacingBetweenColumns];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startDelay(void *a1, const char *a2, ...)
{
  return [a1 startDelay];
}

id objc_msgSend_startMessagePlaybackLoop(void *a1, const char *a2, ...)
{
  return [a1 startMessagePlaybackLoop];
}

id objc_msgSend_startPreview(void *a1, const char *a2, ...)
{
  return [a1 startPreview];
}

id objc_msgSend_startRunning(void *a1, const char *a2, ...)
{
  return [a1 startRunning];
}

id objc_msgSend_startWriting(void *a1, const char *a2, ...)
{
  return [a1 startWriting];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusBar(void *a1, const char *a2, ...)
{
  return [a1 statusBar];
}

id objc_msgSend_statusBarOrientation(void *a1, const char *a2, ...)
{
  return [a1 statusBarOrientation];
}

id objc_msgSend_stillImage(void *a1, const char *a2, ...)
{
  return [a1 stillImage];
}

id objc_msgSend_stopPlaying(void *a1, const char *a2, ...)
{
  return [a1 stopPlaying];
}

id objc_msgSend_stopPreview(void *a1, const char *a2, ...)
{
  return [a1 stopPreview];
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return [a1 stopRunning];
}

id objc_msgSend_strokes(void *a1, const char *a2, ...)
{
  return [a1 strokes];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_supportedInterfaceOrientations(void *a1, const char *a2, ...)
{
  return [a1 supportedInterfaceOrientations];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_timeSinceStartOfPreview(void *a1, const char *a2, ...)
{
  return [a1 timeSinceStartOfPreview];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_toggleCamera(void *a1, const char *a2, ...)
{
  return [a1 toggleCamera];
}

id objc_msgSend_trackID(void *a1, const char *a2, ...)
{
  return [a1 trackID];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_unlockForConfiguration(void *a1, const char *a2, ...)
{
  return [a1 unlockForConfiguration];
}

id objc_msgSend_updateSnapshot(void *a1, const char *a2, ...)
{
  return [a1 updateSnapshot];
}

id objc_msgSend_updateVideoUI(void *a1, const char *a2, ...)
{
  return [a1 updateVideoUI];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_usesCompactKeyboardLayout(void *a1, const char *a2, ...)
{
  return [a1 usesCompactKeyboardLayout];
}

id objc_msgSend_usesMediaAppearance(void *a1, const char *a2, ...)
{
  return [a1 usesMediaAppearance];
}

id objc_msgSend_videoDevice(void *a1, const char *a2, ...)
{
  return [a1 videoDevice];
}

id objc_msgSend_videoMaxZoomFactor(void *a1, const char *a2, ...)
{
  return [a1 videoMaxZoomFactor];
}

id objc_msgSend_videoState(void *a1, const char *a2, ...)
{
  return [a1 videoState];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewDidTransitionToCompactPresentation(void *a1, const char *a2, ...)
{
  return [a1 viewDidTransitionToCompactPresentation];
}

id objc_msgSend_viewDidTransitionToExpandedPresentation(void *a1, const char *a2, ...)
{
  return [a1 viewDidTransitionToExpandedPresentation];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return [a1 windowScene];
}

id objc_msgSend_writeStartTime(void *a1, const char *a2, ...)
{
  return [a1 writeStartTime];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:atomically:");
}