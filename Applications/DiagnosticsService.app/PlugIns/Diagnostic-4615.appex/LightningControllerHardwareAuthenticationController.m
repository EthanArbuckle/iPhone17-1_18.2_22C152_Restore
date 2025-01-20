@interface LightningControllerHardwareAuthenticationController
- (LightningControllerHardwareAuthenticationInputs)inputs;
- (int64_t)base64EncodeData:(id)a3 result:(id *)a4;
- (void)setInputs:(id)a3;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
@end

@implementation LightningControllerHardwareAuthenticationController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
}

- (void)start
{
  if ([(LightningControllerHardwareAuthenticationController *)self isCancelled])
  {
    v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "The test is canceled", buf, 2u);
    }

    uint64_t v4 = -900;
  }
  else
  {
    v5 = [(LightningControllerHardwareAuthenticationController *)self inputs];
    v6 = [v5 challenge];

    uint64_t v28 = 0;
    v7 = [(LightningControllerHardwareAuthenticationController *)self inputs];
    unsigned int v8 = [v7 keyIndex];

    v9 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v30 = v6;
      __int16 v31 = 1024;
      v32[0] = v8;
      LOWORD(v32[1]) = 2048;
      *(void *)((char *)&v32[1] + 2) = 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Input parameters: challenge: %@, keyIndex :%i, option: %llu", buf, 0x1Cu);
    }

    if (v6)
    {
      MFAAComponentAuthCreateSignature();
      v18 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100002A68(v18, v19, v20, v21, v22, v23, v24, v25);
      }

      uint64_t v4 = -7;
    }
    else
    {
      v10 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000029F8(v10, v11, v12, v13, v14, v15, v16, v17);
      }

      uint64_t v4 = -1;
    }
  }
  v26 = +[NSNumber numberWithInteger:v4];
  v27 = [(LightningControllerHardwareAuthenticationController *)self result];
  [v27 setStatusCode:v26];

  [(LightningControllerHardwareAuthenticationController *)self setFinished:1];
}

- (int64_t)base64EncodeData:(id)a3 result:(id *)a4
{
  id v5 = [a3 base64EncodedStringWithOptions:0];
  *a4 = v5;
  if (v5) {
    return 0;
  }
  else {
    return -6;
  }
}

- (LightningControllerHardwareAuthenticationInputs)inputs
{
  return self->_inputs;
}

- (void)setInputs:(id)a3
{
}

- (void).cxx_destruct
{
}

@end