@interface PeCoNetViewController
- (BOOL)convertPrcl:(const Prcl *)a3 toJlex:(jlex_v102 *)a4;
- (BOOL)getCurrentUUID:(unsigned __int8 *)(a3;
- (BOOL)prefersStatusBarHidden;
- (UIView)previewView;
- (id)serializePatchItemDict:(id)a3;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (unint64_t)supportedInterfaceOrientations;
- (void)cancel;
- (void)finishRun:(id)a3 reducedLog:(id)a4 result:(int)a5 prcl:(const Prcl *)a6 angles:;
- (void)setPreviewView:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation PeCoNetViewController

- (BOOL)getCurrentUUID:(unsigned __int8 *)(a3
{
  DeviceCMInterface::DeviceCMInterface(&v4);
  DeviceCMInterface::initAndActivateCaptureDeviceController(&v4);
}

- (BOOL)convertPrcl:(const Prcl *)a3 toJlex:(jlex_v102 *)a4
{
  v16[0] = 0;
  v16[1] = 0;
  BOOL v6 = [(PeCoNetViewController *)self getCurrentUUID:v16];
  if (v6)
  {
    id v7 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v16];
    for (i = +[NSUUID UUID];
    {
      uint64_t v9 = +[NSUUID UUID];
    }
    [i getUUIDBytes:a4->var1];
    uint64_t v10 = 0;
    wideRotMatrix = a3->wideRotMatrix;
    v12 = &a4->var1[16];
    do
    {
      uint64_t v13 = 0;
      double v14 = a3->wideFocalPoint[v10];
      do
      {
        *(double *)&v12[8 * v13] = (*wideRotMatrix)[v13];
        *(double *)((char *)&a4->var2[v10][2] + 4) = v14;
        ++v13;
      }
      while (v13 != 3);
      ++v10;
      ++wideRotMatrix;
      v12 += 32;
    }
    while (v10 != 3);
  }
  return v6;
}

- (id)serializePatchItemDict:(id)a3
{
  id v7 = 0;
  v3 = +[NSPropertyListSerialization dataWithPropertyList:a3 format:100 options:0 error:&v7];
  id v4 = v7;
  v5 = 0;
  if (!v4)
  {
    v5 = [v3 base64EncodedStringWithOptions:0];
  }

  return v5;
}

- (void)finishRun:(id)a3 reducedLog:(id)a4 result:(int)a5 prcl:(const Prcl *)a6 angles:
{
  id v7 = v6;
  uint64_t v9 = *(void *)&a5;
  id v43 = a3;
  id v12 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v56) = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PeCoNetViewController finishRun, result = %d", buf, 8u);
  }
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  double v14 = +[NSBundle mainBundle];
  v15 = [v14 objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
  v16 = v15;
  if (v15)
  {
    id v17 = v15;
  }
  else
  {
    id v17 = +[NSNull null];
  }
  v18 = v17;

  [v13 setValue:v18 forKey:@"pluginVersion"];
  if (!v9)
  {
    long long v62 = 0u;
    long long v61 = 0u;
    long long v60 = 0u;
    long long v59 = 0u;
    long long v58 = 0u;
    long long v57 = 0u;
    long long v56 = 0u;
    *(_DWORD *)buf = 102;
    if ([(PeCoNetViewController *)self convertPrcl:a6 toJlex:buf])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v45 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PeCoNetViewController finishRun1", v45, 2u);
      }
      sub_100009158(v45, " ");
      v53[0] = @"x";
      std::to_string(&v52, *v7);
      if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v19 = &v52;
      }
      else {
        v19 = (std::string *)v52.__r_.__value_.__r.__words[0];
      }
      v20 = +[NSString stringWithUTF8String:v19];
      v54[0] = v20;
      v53[1] = @"y";
      std::to_string(&v51, v7[1]);
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v21 = &v51;
      }
      else {
        v21 = (std::string *)v51.__r_.__value_.__r.__words[0];
      }
      v22 = +[NSString stringWithUTF8String:v21];
      v54[1] = v22;
      v53[2] = @"z";
      std::to_string(&v44, v7[2]);
      if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v23 = &v44;
      }
      else {
        v23 = (std::string *)v44.__r_.__value_.__r.__words[0];
      }
      v24 = +[NSString stringWithUTF8String:v23];
      v54[2] = v24;
      v42 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:3];

      if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v44.__r_.__value_.__l.__data_);
      }

      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v51.__r_.__value_.__l.__data_);
      }

      if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v52.__r_.__value_.__l.__data_);
      }
      [v13 setValue:v42 forKey:@"rotationalAngle"];
      uint64_t v25 = +[NSData dataWithBytes:buf length:116];
      CFStringRef v49 = @"jlex";
      uint64_t v50 = v25;
      v40 = (void *)v25;
      v41 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      v26 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a6->jasperSN, +[NSString defaultCStringEncoding]);
      v27 = +[NSString stringWithFormat:@"JpCl-%@", v26];
      v47 = v27;
      v48 = v41;
      v28 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      v29 = [(PeCoNetViewController *)self serializePatchItemDict:v28];
      if (v29)
      {
        [v13 setValue:v29 forKey:@"patchItem"];
        uint64_t v9 = 0;
      }
      else
      {
        sub_100009158(&v52, "Failed to serialize patch item dict");
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v33 = &v52;
          if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            v33 = (std::string *)v52.__r_.__value_.__r.__words[0];
          }
          LODWORD(v51.__r_.__value_.__l.__data_) = 136315138;
          *(std::string::size_type *)((char *)v51.__r_.__value_.__r.__words + 4) = (std::string::size_type)v33;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v51, 0xCu);
        }
        if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v34 = &v52;
        }
        else {
          v34 = (std::string *)v52.__r_.__value_.__r.__words[0];
        }
        v35 = +[NSString stringWithUTF8String:v34];
        [v12 addObject:v35];

        if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v52.__r_.__value_.__l.__data_);
        }
        uint64_t v9 = 4294967286;
      }

      if (v46 < 0) {
        operator delete(*(void **)v45);
      }
    }
    else
    {
      sub_100009158(v45, "Failed to create JlEx");
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v30 = v45;
        if (v46 < 0) {
          v30 = *(uint8_t **)v45;
        }
        LODWORD(v52.__r_.__value_.__l.__data_) = 136315138;
        *(std::string::size_type *)((char *)v52.__r_.__value_.__r.__words + 4) = (std::string::size_type)v30;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v52, 0xCu);
      }
      if (v46 >= 0) {
        v31 = v45;
      }
      else {
        v31 = *(uint8_t **)v45;
      }
      v32 = +[NSString stringWithUTF8String:v31];
      [v12 addObject:v32];

      if (v46 < 0) {
        operator delete(*(void **)v45);
      }
      uint64_t v9 = 2;
    }
  }
  v36 = [v12 componentsJoinedByString:@", "];
  [v13 setValue:v36 forKey:@"log"];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PeCoNetViewController finishRun added reduced log string", buf, 2u);
  }
  v37 = [(PeCoNetViewController *)self result];
  [v37 setData:v13];

  v38 = +[NSNumber numberWithInt:v9];
  v39 = [(PeCoNetViewController *)self result];
  [v39 setStatusCode:v38];

  [(PeCoNetViewController *)self setFinished:1];
}

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  v5 = (PeCoNetDKDiagnosticInputs *)a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PeCoNetViewController setup", v7, 2u);
  }
  inputs = self->_inputs;
  self->_inputs = v5;
}

- (void)start
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "PeCoNetViewController start new", v8, 2u);
  }
  v3 = objc_alloc_init(ViewController);
  mainAppViewController = self->_mainAppViewController;
  self->_mainAppViewController = v3;

  v5 = [(PeCoNetViewController *)self view];
  [self->_mainAppViewController setStoryBoardView:v5];

  [self->_mainAppViewController setListener:self];
  inputs = self->_inputs;
  if (inputs)
  {
    if ([(PeCoNetDKDiagnosticInputs *)inputs sessionTimeOut]) {
      [self->_mainAppViewController setSessionMaxTimeOut:[(PeCoNetDKDiagnosticInputs *)self->_inputs sessionTimeOut]];
    }
    if ([(PeCoNetDKDiagnosticInputs *)self->_inputs sceneErrorTimeOut]) {
      [self->_mainAppViewController setConsecutiveSceneErrorLimit:[(PeCoNetDKDiagnosticInputs *)self->_inputs sceneErrorTimeOut]];
    }
    if ([(PeCoNetDKDiagnosticInputs *)self->_inputs sceneErrorWarningThreshold]) {
      [self->_mainAppViewController setConsecutiveSceneErrorWarningLimit:[(PeCoNetDKDiagnosticInputs *)self->_inputs sceneErrorWarningThreshold]];
    }
    if ([(PeCoNetDKDiagnosticInputs *)self->_inputs userNotMovingTimeout]) {
      [self->_mainAppViewController setUserNotMovingTimeout:[(PeCoNetDKDiagnosticInputs *)self->_inputs userNotMovingTimeout]];
    }
    [(PeCoNetDKDiagnosticInputs *)self->_inputs noMovementAttitudeChangeMinThreshold];
    if (v7 != 0.0)
    {
      [(PeCoNetDKDiagnosticInputs *)self->_inputs noMovementAttitudeChangeMinThreshold];
      -[ViewController setNoMovementAttitudeChangeMinThreshold:](self->_mainAppViewController, "setNoMovementAttitudeChangeMinThreshold:");
    }
    if ([(PeCoNetDKDiagnosticInputs *)self->_inputs skipSummaryScreen]) {
      [self->_mainAppViewController setSkipSummaryScreen:[(PeCoNetDKDiagnosticInputs *)self->_inputs skipSummaryScreen]];
    }
  }
  [self->_mainAppViewController startUI];
}

- (void)cancel
{
  [self->_mainAppViewController cancel];
  v3 = +[NSNumber numberWithInt:[self->_mainAppViewController getCurrentResult]];
  id v4 = [(PeCoNetViewController *)self result];
  [v4 setStatusCode:v3];

  mainAppViewController = self->_mainAppViewController;
  self->_mainAppViewController = 0;

  [(PeCoNetViewController *)self setFinished:1];
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