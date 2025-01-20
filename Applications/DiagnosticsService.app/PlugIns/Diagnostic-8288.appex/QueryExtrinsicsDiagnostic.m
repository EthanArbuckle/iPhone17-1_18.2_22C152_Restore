@interface QueryExtrinsicsDiagnostic
- (int)getCalibResults:(QueryExtrinsicsDiagnostic *)self focalPoint:(SEL)a2;
- (int)initDevice;
- (void)log:(const void *)a3;
- (void)start;
@end

@implementation QueryExtrinsicsDiagnostic

- (void)start
{
}

- (void)log:(const void *)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    if (*((char *)a3 + 23) >= 0) {
      v4 = a3;
    }
    else {
      v4 = *(const void **)a3;
    }
    int v5 = 136315138;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "QueryExtrinsicsDiagnostic %s", (uint8_t *)&v5, 0xCu);
  }
}

- (int)initDevice
{
  sub_1000126C4(__p, "initStreaming");
  [(QueryExtrinsicsDiagnostic *)self log:__p];
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  DeviceCMInterface::initAndActivateCaptureDeviceController(self->_diagnosticCMInterface);
}

- (int)getCalibResults:(QueryExtrinsicsDiagnostic *)self focalPoint:(SEL)a2
{
  uint64_t v4 = v3;
  int v5 = v2;
  sub_1000126C4(&__p, "getCalibResults");
  [(QueryExtrinsicsDiagnostic *)self log:&__p];
  if (SHIBYTE(v22) < 0) {
    operator delete(__p);
  }
  v28 = 0;
  if (DeviceCMInterface::getJasperCalib(self->_diagnosticCMInterface, &v28))
  {
    sub_1000126C4(v18, "unable to get JasperCalib");
    [(QueryExtrinsicsDiagnostic *)self log:v18];
    if (v19 < 0) {
      operator delete(v18[0]);
    }
    return 1;
  }
  else
  {
    if (self->_isJasper)
    {
      v8 = (const void *)JDJasperCalibCreateWithBinaryRepresentation();
      JDJasperCalibGetFactoryWideToJasperTransform();
    }
    else
    {
      v8 = (const void *)PDPeridotCalibCreateWithBinaryRepresentation();
      PDPeridotCalibGetOperationalWideToPeridotTransform();
    }
    int v21 = v10;
    int v23 = v12;
    int v25 = v14;
    __p = v9;
    uint64_t v22 = v11;
    int v27 = v16;
    uint64_t v24 = v13;
    uint64_t v26 = v15;
    if (v8) {
      CFRelease(v8);
    }
    uint64_t v17 = v26;
    *(_DWORD *)(v4 + 8) = v27;
    *(void *)uint64_t v4 = v17;
    CalcRotationAngleFromMatrix((uint64_t)&__p, v5);
    CFRelease(v28);
    return 0;
  }
}

@end