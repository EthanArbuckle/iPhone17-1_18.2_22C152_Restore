@interface _OSDH9Camera
- (BOOL)_enableMultiVideoOutput:(id)a3 error:(id *)a4;
- (BOOL)_setStreamHandlers:(id)a3 error:(id *)a4;
- (BOOL)enableAgileClocking:(BOOL)a3 error:(id *)a4;
- (BOOL)enableTestPatternPN9:(BOOL)a3 error:(id *)a4;
- (BOOL)getDeviceAndStreams:(id *)a3;
- (BOOL)setFormatIndex:(id)a3 error:(id *)a4;
- (BOOL)syncSlave:(id)a3 skipFrames:(BOOL)a4 enableOutput:(BOOL)a5 error:(id *)a6;
- (NSNumber)formatIndex;
- (OS_dispatch_queue)workQueue;
- (_OSDH9Camera)initWithCaptureDevice:(id)a3 cameraSource:(unint64_t)a4 error:(id *)a5;
- (id)errorCountForType:(unint64_t)a3 error:(id *)a4;
- (id)supportedFormats:(id *)a3;
- (id)useMaxAvailableDataRate:(id *)a3;
- (void)_processBuffer:(__CVBuffer *)a3;
- (void)_receivedEvent:(int)a3 timestamp:(id *)a4 info:(int64_t)a5;
- (void)_receivedPixelBuffer:(__CVBuffer *)a3 time:(id *)a4;
- (void)setFormatIndex:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation _OSDH9Camera

- (_OSDH9Camera)initWithCaptureDevice:(id)a3 cameraSource:(unint64_t)a4 error:(id *)a5
{
  v11.receiver = self;
  v11.super_class = (Class)_OSDH9Camera;
  v5 = [(_OSDHxCamera *)&v11 initWithCaptureDevice:a3 cameraSource:a4 error:a5];
  if (v5)
  {
    v6 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.DiagnosticsService.Diagnostic-4009.H9Camera.workQueue", v7);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v8;
  }
  return v5;
}

- (BOOL)getDeviceAndStreams:(id *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)_OSDH9Camera;
  if (!-[_OSDHxCamera getDeviceAndStreams:](&v10, "getDeviceAndStreams:")) {
    return 0;
  }
  v5 = [(_OSDHxCamera *)self captureStream];
  unsigned int v6 = [(_OSDH9Camera *)self _enableMultiVideoOutput:v5 error:a3];

  if (!v6) {
    return 0;
  }
  v7 = [(_OSDHxCamera *)self captureStream];
  BOOL v8 = [(_OSDH9Camera *)self _setStreamHandlers:v7 error:a3];

  return v8;
}

- (BOOL)_enableMultiVideoOutput:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 setProperty:kFigCaptureStreamProperty_MultipleOutputSupportEnabled BOOLean:1 error:a4])
  {
    uint64_t v9 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
    objc_super v10 = &__kCFBooleanTrue;
    unsigned int v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    unsigned __int8 v7 = [v5 setProperty:kFigCaptureStreamProperty_VideoOutputsEnabled value:v6 error:a4];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)_setStreamHandlers:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000098A8;
  v16[3] = &unk_1000105D8;
  objc_copyWeak(&v17, &location);
  unsigned __int8 v7 = objc_retainBlock(v16);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100009908;
  v14[3] = &unk_100010600;
  objc_copyWeak(&v15, &location);
  BOOL v8 = objc_retainBlock(v14);
  v21[0] = kFigCaptureStreamVideoOutputHandlerKey_PixelBufferHandler;
  uint64_t v9 = objc_retainBlock(v7);
  v22[0] = v9;
  v21[1] = kFigCaptureStreamVideoOutputHandlerKey_EventHandler;
  objc_super v10 = objc_retainBlock(v8);
  v22[1] = v10;
  objc_super v11 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:2];

  uint64_t v19 = kFigCaptureStreamVideoOutputID_PrimaryScaler;
  v20 = v11;
  v12 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  LOBYTE(a4) = [v6 setProperty:kFigCaptureStreamProperty_VideoOutputHandlers value:v12 error:a4];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return (char)a4;
}

- (BOOL)setFormatIndex:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(_OSDHxCamera *)self captureStream];
  unsigned int v8 = [v7 setProperty:kFigCaptureStreamProperty_FormatIndex number:v6 error:a4];

  if (v8) {
    [(_OSDH9Camera *)self setFormatIndex:v6];
  }

  return v8;
}

- (id)errorCountForType:(unint64_t)a3 error:(id *)a4
{
  switch(a3)
  {
    case 1uLL:
      v4 = (const __CFString **)&kFigCaptureStreamPropertyValue_MIPIErrorCount;
      goto LABEL_5;
    case 2uLL:
      v4 = (const __CFString **)&kFigCaptureStreamPropertyValue_I2CErrorCount;
LABEL_5:
      CFStringRef v6 = *v4;
      goto LABEL_9;
    case 3uLL:
      CFStringRef v6 = @"SIFErrorCount";
      goto LABEL_9;
    case 4uLL:
      CFStringRef v6 = @"UARTErrorCount";
      goto LABEL_9;
    case 5uLL:
      CFStringRef v6 = @"LPDPErrorCount";
LABEL_9:
      id v5 = [(_OSDHxCamera *)self _getStreamErrorFor:v6 error:a4];
      break;
    default:
      +[OSDError setError:a4, @"com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter", 1, @"%@ >> Camera has no error for type %lu", self, a3 withDomain withCode format];
      id v5 = 0;
      break;
  }

  return v5;
}

- (id)supportedFormats:(id *)a3
{
  v4 = [(_OSDHxCamera *)self captureStream];
  id v5 = [v4 copyProperty:kFigCaptureStreamProperty_SupportedFormatsArray error:a3];

  return v5;
}

- (BOOL)enableAgileClocking:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  CFStringRef v6 = [(_OSDHxCamera *)self captureDevice];
  LOBYTE(a4) = [v6 setProperty:@"SensorAgileClockingEnable" BOOLean:v5 error:a4];

  return (char)a4;
}

- (id)useMaxAvailableDataRate:(id *)a3
{
  BOOL v5 = [(_OSDHxCamera *)self captureStream];
  id v6 = [v5 copyProperty:@"SupportedLinkFrequencies" error:a3];

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v17 = 0;
  v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  unsigned __int8 v7 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [v6 count];
    *(_DWORD *)buf = 134218242;
    id v26 = v8;
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Found %lu available lane frequencies: %@", buf, 0x16u);
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100009E40;
  v16[3] = &unk_100010628;
  void v16[4] = &v17;
  v16[5] = &v21;
  [v6 enumerateObjectsUsingBlock:v16];
  uint64_t v9 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_super v10 = (void *)v22[3];
    *(_DWORD *)buf = 134217984;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Greatest index is %lu", buf, 0xCu);
  }

  objc_super v11 = [(_OSDHxCamera *)self captureStream];
  v12 = +[NSNumber numberWithUnsignedInteger:v22[3]];
  unsigned __int8 v13 = [v11 setProperty:@"LinkFrequencyIndex" number:v12 error:a3];

  if (v13)
  {
    v14 = +[NSNumber numberWithDouble:v18[3]];
  }
  else
  {
    v14 = 0;
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v14;
}

- (BOOL)syncSlave:(id)a3 skipFrames:(BOOL)a4 enableOutput:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  objc_super v11 = [(_OSDHxCamera *)self captureStream];
  v26[0] = [v11 streamRef];
  v12 = [v10 captureStream];
  v26[1] = [v12 streamRef];
  unsigned __int8 v13 = +[NSArray arrayWithObjects:v26 count:2];

  v14 = [(_OSDHxCamera *)self captureDevice];
  LODWORD(v12) = [v14 setProperty:kFigCaptureSynchronizedStreamsGroupProperty_ActiveStreams value:v13 error:a6];

  if (!v12) {
    goto LABEL_9;
  }
  id v15 = [(_OSDHxCamera *)self captureDevice];
  uint64_t v16 = kFigCaptureSynchronizedStreamsGroupProperty_MasterConfiguration;
  uint64_t v17 = [(_OSDHxCamera *)self captureStream];
  LODWORD(v16) = [v15 setProperty:v16 value:[v17 streamRef] error:a6];

  if (v16)
  {
    v18 = &__kCFBooleanFalse;
    v24[0] = kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_FrameSkippingEnabled;
    v24[1] = kFigCaptureStreamSynchronizedStreamsSlaveConfigurationKey_StreamingOutputsEnabled;
    if (v8) {
      uint64_t v19 = &__kCFBooleanTrue;
    }
    else {
      uint64_t v19 = &__kCFBooleanFalse;
    }
    if (v7) {
      v18 = &__kCFBooleanTrue;
    }
    v25[0] = v19;
    v25[1] = v18;
    uint64_t v20 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
    uint64_t v21 = [v10 captureStream];
    unsigned __int8 v22 = [v21 setProperty:kFigCaptureStreamProperty_SynchronizedStreamsSlaveConfiguration value:v20 error:a6];
  }
  else
  {
LABEL_9:
    unsigned __int8 v22 = 0;
  }

  return v22;
}

- (BOOL)enableTestPatternPN9:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v6 = [(_OSDHxCamera *)self captureStream];
  BOOL v7 = v6;
  if (v5) {
    CFStringRef v8 = @"TestPatternPN9";
  }
  else {
    CFStringRef v8 = @"TestPatternNone";
  }
  unsigned __int8 v9 = [v6 setProperty:@"TestPattern" value:v8 error:a4];

  return v9;
}

- (void)_receivedEvent:(int)a3 timestamp:(id *)a4 info:(int64_t)a5
{
  if ([(_OSDHxCamera *)self isStreaming])
  {
    id v6 = [(_OSDH9Camera *)self workQueue];
    dispatch_async(v6, &stru_100010648);
  }
}

- (void)_receivedPixelBuffer:(__CVBuffer *)a3 time:(id *)a4
{
  if ([(_OSDHxCamera *)self isStreaming])
  {
    CVPixelBufferRetain(a3);
    id v6 = [(_OSDH9Camera *)self workQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000A24C;
    v7[3] = &unk_100010670;
    v7[4] = self;
    v7[5] = a3;
    dispatch_async(v6, v7);
  }
}

- (void)_processBuffer:(__CVBuffer *)a3
{
  [(_OSDHxCamera *)self set_frameCounter:[(_OSDHxCamera *)self _frameCounter] + 1];
  BOOL v5 = [(_OSDHxCamera *)self previewLayer];

  if (v5) {
    [(_OSDHxCamera *)self _showFrameOnPreviewLayer:a3];
  }
  id v6 = [(_OSDHxCamera *)self frameHandler];

  if (v6)
  {
    id v9 = (id)CVBufferCopyAttachment(a3, kFigCaptureSampleBufferAttachmentKey_MetadataDictionary, 0);
    BOOL v7 = objc_opt_new();
    [v7 setBuffer:a3];
    [v7 setMetadata:v9];
    CFStringRef v8 = [(_OSDHxCamera *)self frameHandler];
    ((void (**)(void, void *))v8)[2](v8, v7);
  }
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSNumber)formatIndex
{
  return self->_formatIndex;
}

- (void)setFormatIndex:(id)a3
{
  self->_formatIndex = (NSNumber *)a3;
}

- (void).cxx_destruct
{
}

@end