@interface CBQRCodeScanner
- (AVCaptureSession)captureSession;
- (BOOL)scanCompleted;
- (BOOL)startScan;
- (CBQRCodeScanner)initWithScanCompletion:(id)a3;
- (id)scanCompletion;
- (id)setupQRCodeScanner;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)setCaptureSession:(id)a3;
- (void)setScanCompleted:(BOOL)a3;
- (void)setScanCompletion:(id)a3;
- (void)stopScan;
@end

@implementation CBQRCodeScanner

- (CBQRCodeScanner)initWithScanCompletion:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CBQRCodeScanner;
  v5 = [(CBQRCodeScanner *)&v11 init];
  if (v5)
  {
    id v6 = objc_retainBlock(v4);
    id scanCompletion = v5->_scanCompletion;
    v5->_id scanCompletion = v6;

    v5->_scanCompleted = 0;
    uint64_t v8 = [(CBQRCodeScanner *)v5 setupQRCodeScanner];
    captureSession = v5->_captureSession;
    v5->_captureSession = (AVCaptureSession *)v8;

    if (!v5->_captureSession)
    {

      v5 = 0;
    }
  }

  return v5;
}

- (id)setupQRCodeScanner
{
  id v2 = objc_alloc_init((Class)AVCaptureSession);
  v3 = +[AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInWideAngleCamera mediaType:AVMediaTypeVideo position:1];
  if (!v3)
  {
    v7 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to get default rear camera. Performing discovery of cameras", (uint8_t *)&v17, 2u);
    }

    AVCaptureDeviceType v19 = AVCaptureDeviceTypeBuiltInWideAngleCamera;
    uint64_t v8 = +[NSArray arrayWithObjects:&v19 count:1];
    v3 = +[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:v8 mediaType:AVMediaTypeVideo position:1];

    v9 = [v3 devices];
    id v10 = [v9 count];

    objc_super v11 = CheckerBoardLogHandleForCategory();
    id v4 = v11;
    if (!v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100049218();
      }
      goto LABEL_18;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [v3 devices];
      id v13 = [v12 count];
      int v17 = 134217984;
      id v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Found %lu devices. Using first one", (uint8_t *)&v17, 0xCu);
    }
    v14 = [v3 devices];
    uint64_t v15 = [v14 firstObject];

    if (!v15)
    {
      id v4 = CheckerBoardLogHandleForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_10004924C();
      }
      goto LABEL_18;
    }

    v3 = (void *)v15;
  }
  [v2 setSessionPreset:AVCaptureSessionPresetPhoto];
  id v4 = [objc_alloc((Class)AVCaptureDeviceInput) initWithDevice:v3 error:0];
  if ([v2 canAddInput:v4])
  {
    [v2 addInput:v4];
    id v5 = v2;
    goto LABEL_19;
  }
  id v6 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100049280();
  }

LABEL_18:
  id v5 = 0;
LABEL_19:

  return v5;
}

- (BOOL)startScan
{
  [(CBQRCodeScanner *)self setScanCompleted:0];
  v3 = [(CBQRCodeScanner *)self captureSession];

  if (!v3) {
    return 0;
  }
  id v4 = objc_alloc_init((Class)AVCaptureMetadataOutput);
  id v5 = [(CBQRCodeScanner *)self captureSession];
  [v5 addOutput:v4];

  [v4 setMetadataObjectsDelegate:self queue:&_dispatch_main_q];
  id v6 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v4 availableMetadataObjectTypes];
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Available metadata object types: %@", buf, 0xCu);
  }
  uint64_t v8 = [v4 availableMetadataObjectTypes];
  unsigned __int8 v9 = [v8 containsObject:AVMetadataObjectTypeQRCode];

  if (v9)
  {
    AVMetadataObjectType v14 = AVMetadataObjectTypeQRCode;
    id v10 = +[NSArray arrayWithObjects:&v14 count:1];
    [v4 setMetadataObjectTypes:v10];

    objc_super v11 = [(CBQRCodeScanner *)self captureSession];
    [v11 commitConfiguration];

    v12 = [(CBQRCodeScanner *)self captureSession];
    [v12 startRunning];
  }
  else
  {
    v12 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000492B4();
    }
  }

  return v9;
}

- (void)stopScan
{
  [(CBQRCodeScanner *)self setScanCompleted:1];
  v3 = [(CBQRCodeScanner *)self captureSession];

  if (v3)
  {
    id v4 = [(CBQRCodeScanner *)self captureSession];
    [v4 stopRunning];
  }
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v6 = a4;
  if (![(CBQRCodeScanner *)self scanCompleted])
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v20 = v6;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (!v8) {
      goto LABEL_23;
    }
    id v9 = v8;
    uint64_t v10 = *(void *)v25;
    v21 = (void *)AVMetadataObjectTypeAppClipCode;
    while (1)
    {
      objc_super v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          uint64_t v14 = [v13 stringValue];
          if (v14)
          {
            uint64_t v15 = (void *)v14;
            v16 = [v13 type];

            if (v16 != v21)
            {
              int v17 = v15;
              goto LABEL_11;
            }
            id v18 = +[NSScanner scannerWithString:v15];
            unsigned int v23 = 0;
            [v18 scanHexInt:&v23];
            int v17 = +[NSString stringWithFormat:@"%6d", v23];

            if ([v17 length] == (id)6 && objc_msgSend(v17, "intValue"))
            {

              if (!v17) {
                goto LABEL_20;
              }
LABEL_11:
              [(CBQRCodeScanner *)self setScanCompleted:1];
              id v18 = [(CBQRCodeScanner *)self scanCompletion];
              ((void (**)(void, void *))v18)[2](v18, v17);
            }
            else
            {
              AVCaptureDeviceType v19 = CheckerBoardLogHandleForCategory();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found AppClip code is in an invalid format. Skipping", buf, 2u);
              }
            }
          }
LABEL_20:
        }
        objc_super v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v9)
      {
LABEL_23:

        id v6 = v20;
        break;
      }
    }
  }
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setCaptureSession:(id)a3
{
}

- (id)scanCompletion
{
  return self->_scanCompletion;
}

- (void)setScanCompletion:(id)a3
{
}

- (BOOL)scanCompleted
{
  return self->_scanCompleted;
}

- (void)setScanCompleted:(BOOL)a3
{
  self->_scanCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_scanCompletion, 0);

  objc_storeStrong((id *)&self->_captureSession, 0);
}

@end