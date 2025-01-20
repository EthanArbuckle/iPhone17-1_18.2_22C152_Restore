@interface CAMURLConfigurationRequest
- (BOOL)_captureModeFromString:(id)a3 outCaptureMode:(int64_t *)a4;
- (BOOL)_initializeFromQueryDictionary:(id)a3;
- (BOOL)wantsQRCodeForSession;
- (CAMURLConfigurationRequest)initWithQueryDictionary:(id)a3;
- (int64_t)_captureDeviceFromString:(id)a3 outCaptureDevice:(int64_t *)a4;
- (int64_t)requestedCaptureDevice;
- (int64_t)requestedCaptureMode;
@end

@implementation CAMURLConfigurationRequest

- (CAMURLConfigurationRequest)initWithQueryDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CAMURLConfigurationRequest;
  v5 = [(CAMURLConfigurationRequest *)&v10 init];
  v6 = v5;
  if (v5)
  {
    if ([(CAMURLConfigurationRequest *)v5 _initializeFromQueryDictionary:v4]) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

- (BOOL)_initializeFromQueryDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"capturemode"];
  BOOL v6 = [(CAMURLConfigurationRequest *)self _captureModeFromString:v5 outCaptureMode:&self->_requestedCaptureMode];

  if (v6)
  {
    v7 = [v4 objectForKeyedSubscript:@"capturedevice"];
    BOOL v8 = [(CAMURLConfigurationRequest *)self _captureDeviceFromString:v7 outCaptureDevice:&self->_requestedCaptureDevice] != 0;
  }
  else
  {
    BOOL v8 = 0;
  }
  v9 = [v4 objectForKey:@"qrcodes"];

  if (v9)
  {
    objc_super v10 = [v4 objectForKeyedSubscript:@"qrcodes"];
    self->_wantsQRCodeForSession = [v10 isEqualToString:@"true"];
  }
  else
  {
    self->_wantsQRCodeForSession = 0;
  }

  return v8;
}

- (BOOL)_captureModeFromString:(id)a3 outCaptureMode:(int64_t *)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:@"photo"])
  {
    int64_t v6 = 0;
  }
  else if ([v5 isEqualToString:@"square"])
  {
    int64_t v6 = 4;
  }
  else if ([v5 isEqualToString:@"video"])
  {
    int64_t v6 = 1;
  }
  else if ([v5 isEqualToString:@"slomo"])
  {
    int64_t v6 = 2;
  }
  else if ([v5 isEqualToString:@"timelapse"])
  {
    int64_t v6 = 5;
  }
  else if ([v5 isEqualToString:@"panorama"])
  {
    int64_t v6 = 3;
  }
  else if ([v5 isEqualToString:@"portrait"])
  {
    int64_t v6 = 6;
  }
  else if ([v5 isEqualToString:@"cinematic"])
  {
    int64_t v6 = 7;
  }
  else if ([v5 isEqualToString:@"spatialVideo"])
  {
    int64_t v6 = 8;
  }
  else
  {
    if (![v5 isEqualToString:@"spatialPhoto"])
    {
      BOOL v7 = 0;
      goto LABEL_22;
    }
    int64_t v6 = 9;
  }
  *a4 = v6;
  BOOL v7 = 1;
LABEL_22:

  return v7;
}

- (int64_t)_captureDeviceFromString:(id)a3 outCaptureDevice:(int64_t *)a4
{
  id v5 = a3;
  if ([v5 isEqualToString:@"front"])
  {
    int64_t v6 = 1;
LABEL_4:
    *a4 = v6;
    int64_t v8 = 1;
    goto LABEL_5;
  }
  int v7 = [v5 isEqualToString:@"back"];
  int64_t v6 = 0;
  int64_t v8 = 0;
  if (v7) {
    goto LABEL_4;
  }
LABEL_5:

  return v8;
}

- (int64_t)requestedCaptureMode
{
  return self->_requestedCaptureMode;
}

- (int64_t)requestedCaptureDevice
{
  return self->_requestedCaptureDevice;
}

- (BOOL)wantsQRCodeForSession
{
  return self->_wantsQRCodeForSession;
}

@end