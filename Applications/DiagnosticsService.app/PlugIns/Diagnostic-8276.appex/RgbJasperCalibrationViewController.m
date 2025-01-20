@interface RgbJasperCalibrationViewController
- (BOOL)prefersStatusBarHidden;
- (UIView)previewView;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (void)cancel;
- (void)finishRun:(id)a3 reducedLog:(id)a4 result:(int)a5 prcl:(const Prcl *)a6 angles:;
- (void)setPreviewView:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation RgbJasperCalibrationViewController

- (void)finishRun:(id)a3 reducedLog:(id)a4 result:(int)a5 prcl:(const Prcl *)a6 angles:
{
  v7 = v6;
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v32 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RgbJasperCalibrationViewController finishRun", buf, 2u);
  }
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  v14 = [v32 componentsJoinedByString:@", "];
  [v13 setValue:v14 forKey:@"log"];
  v15 = +[NSBundle mainBundle];
  v16 = [v15 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = +[NSNull null];
  }
  v19 = v18;

  [v13 setValue:v19 forKey:@"pluginVersion"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RgbJasperCalibrationViewController finishRun added reduced log string", buf, 2u);
  }
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RgbJasperCalibrationViewController finishRun1", buf, 2u);
    }
    CFDataRef v30 = +[NSData dataWithBytes:a6 length:256];
    v31 = ConvertDataToHexString(v30);
    sub_10001DF00(buf, " ");
    v38[0] = @"x";
    std::to_string(&v35, *v7);
    if ((v35.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v20 = &v35;
    }
    else {
      v20 = (std::string *)v35.__r_.__value_.__r.__words[0];
    }
    v21 = +[NSString stringWithUTF8String:v20];
    v39[0] = v21;
    v38[1] = @"y";
    std::to_string(&v34, v7[1]);
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v22 = &v34;
    }
    else {
      v22 = (std::string *)v34.__r_.__value_.__r.__words[0];
    }
    v23 = +[NSString stringWithUTF8String:v22];
    v39[1] = v23;
    v38[2] = @"z";
    std::to_string(&v33, v7[2]);
    if ((v33.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v24 = &v33;
    }
    else {
      v24 = (std::string *)v33.__r_.__value_.__r.__words[0];
    }
    v25 = +[NSString stringWithUTF8String:v24];
    v39[2] = v25;
    v26 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];

    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v33.__r_.__value_.__l.__data_);
    }

    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v34.__r_.__value_.__l.__data_);
    }

    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v35.__r_.__value_.__l.__data_);
    }
    [v13 setValue:v26 forKey:@"rotationalAngle"];
    [v13 setValue:v31 forKey:@"PrCL"];

    if (v37 < 0) {
      operator delete(*(void **)buf);
    }
  }
  v27 = [(RgbJasperCalibrationViewController *)self result];
  [v27 setData:v13];

  v28 = +[NSNumber numberWithInt:v9];
  v29 = [(RgbJasperCalibrationViewController *)self result];
  [v29 setStatusCode:v28];

  [(RgbJasperCalibrationViewController *)self setFinished:1];
}

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  v5 = (RGBJDKDiagnosticInputs *)a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RgbJasperCalibrationViewController setup", v7, 2u);
  }
  inputs = self->_inputs;
  self->_inputs = v5;
}

- (void)start
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RgbJasperCalibrationViewController start new", v8, 2u);
  }
  v3 = objc_alloc_init(ViewController);
  mainAppViewController = self->_mainAppViewController;
  self->_mainAppViewController = v3;

  v5 = [(RgbJasperCalibrationViewController *)self view];
  [self->_mainAppViewController setStoryBoardView:v5];

  [self->_mainAppViewController setListener:self];
  inputs = self->_inputs;
  if (inputs)
  {
    if ([(RGBJDKDiagnosticInputs *)inputs sessionTimeOut]) {
      [self->_mainAppViewController setSessionMaxTimeOut:[(RGBJDKDiagnosticInputs *)self->_inputs sessionTimeOut]];
    }
    if ([(RGBJDKDiagnosticInputs *)self->_inputs sceneErrorTimeOut]) {
      [self->_mainAppViewController setConsecutiveSceneErrorLimit:[(RGBJDKDiagnosticInputs *)self->_inputs sceneErrorTimeOut]];
    }
    if ([(RGBJDKDiagnosticInputs *)self->_inputs userNotMovingTimeout]) {
      [self->_mainAppViewController setUserNotMovingTimeout:[(RGBJDKDiagnosticInputs *)self->_inputs userNotMovingTimeout]];
    }
    [(RGBJDKDiagnosticInputs *)self->_inputs noMovementAttitudeChangeMinThreshold];
    if (v7 != 0.0)
    {
      [(RGBJDKDiagnosticInputs *)self->_inputs noMovementAttitudeChangeMinThreshold];
      -[ViewController setNoMovementAttitudeChangeMinThreshold:](self->_mainAppViewController, "setNoMovementAttitudeChangeMinThreshold:");
    }
    if ([(RGBJDKDiagnosticInputs *)self->_inputs skipSummaryScreen]) {
      [self->_mainAppViewController setSkipSummaryScreen:[(RGBJDKDiagnosticInputs *)self->_inputs skipSummaryScreen]];
    }
  }
  [self->_mainAppViewController startUI];
}

- (void)cancel
{
  [self->_mainAppViewController cancel];
  v3 = +[NSNumber numberWithInt:[self->_mainAppViewController getCurrentResult]];
  v4 = [(RgbJasperCalibrationViewController *)self result];
  [v4 setStatusCode:v3];

  mainAppViewController = self->_mainAppViewController;
  self->_mainAppViewController = 0;

  [(RgbJasperCalibrationViewController *)self setFinished:1];
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (UIView)previewView
{
  return self->_previewView;
}

- (void)setPreviewView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_inputs, 0);

  objc_storeStrong((id *)&self->_mainAppViewController, 0);
}

@end