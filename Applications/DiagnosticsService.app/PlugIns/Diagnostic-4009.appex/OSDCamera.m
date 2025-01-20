@interface OSDCamera
+ (BOOL)checkProtocol:(id)a3 obj:(id)a4 error:(id *)a5;
- (BOOL)_checkProtocol:(id)a3 error:(id *)a4;
- (BOOL)_checkProtocol:(id)a3 obj:(id)a4 error:(id *)a5;
- (BOOL)_checkSelector:(SEL)a3 error:(id *)a4;
- (BOOL)activate:(id *)a3;
- (BOOL)enableAgileClocking:(BOOL)a3 error:(id *)a4;
- (BOOL)enableTestPatternPN9:(BOOL)a3 error:(id *)a4;
- (BOOL)implementorActive:(id *)a3;
- (BOOL)isStreaming;
- (BOOL)setFormatIndex:(id)a3 error:(id *)a4;
- (BOOL)setFrameRate:(id)a3 error:(id *)a4;
- (BOOL)setMinimumFrameRate:(id)a3 error:(id *)a4;
- (BOOL)startStreamingWithOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)stopStreaming:(id *)a3;
- (OSDCamera)initWithCaptureDevice:(id)a3 cameraSource:(unint64_t)a4 error:(id *)a5;
- (_OSDCameraInterface)cameraImp;
- (id)errorCountForType:(unint64_t)a3 error:(id *)a4;
- (id)formatIndex:(id *)a3;
- (id)frameCount:(id *)a3;
- (id)name:(id *)a3;
- (id)supportedFormats:(id *)a3;
- (id)useMaxAvailableDataRate:(id *)a3;
- (unint64_t)streamingOptions:(id *)a3;
- (void)deactivate;
- (void)setCameraImp:(id)a3;
- (void)setFrameHandler:(id)a3;
- (void)setPreviewLayer:(id)a3;
@end

@implementation OSDCamera

+ (BOOL)checkProtocol:(id)a3 obj:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  unsigned __int8 v9 = [(id)objc_opt_class() conformsToProtocol:v8];

  if ((v9 & 1) == 0) {
    +[OSDError setError:a5, @"com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter", 1, @"%@ >> %@ does not provide this implementation.", objc_opt_class(), v7 withDomain withCode format];
  }

  return v9;
}

- (OSDCamera)initWithCaptureDevice:(id)a3 cameraSource:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)OSDCamera;
  unsigned __int8 v9 = [(OSDCamera *)&v15 init];
  if (v9)
  {
    v10 = +[OSDCaptureDevice ispVersion];
    int v11 = [v10 intValue];

    if (v11 >= 7)
    {
      v12 = [[_OSDH9Camera alloc] initWithCaptureDevice:v8 cameraSource:a4 error:a5];
      cameraImp = v9->_cameraImp;
      v9->_cameraImp = (_OSDCameraInterface *)v12;
    }
  }

  return v9;
}

- (BOOL)activate:(id *)a3
{
  v4 = [(OSDCamera *)self cameraImp];
  LOBYTE(a3) = [v4 getDeviceAndStreams:a3];

  return (char)a3;
}

- (void)setPreviewLayer:(id)a3
{
  id v4 = a3;
  id v5 = [(OSDCamera *)self cameraImp];
  [v5 setPreviewLayer:v4];
}

- (void)setFrameHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(OSDCamera *)self cameraImp];
  [v5 setFrameHandler:v4];
}

- (void)deactivate
{
  id v2 = [(OSDCamera *)self cameraImp];
  [v2 doneWithDeviceAndStreams];
}

- (id)name:(id *)a3
{
  if (-[OSDCamera implementorActive:](self, "implementorActive:"))
  {
    id v5 = [(OSDCamera *)self cameraImp];
    v6 = [v5 name:a3];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)startStreamingWithOptions:(unint64_t)a3 error:(id *)a4
{
  BOOL v7 = [(OSDCamera *)self implementorActive:a4];
  if (v7)
  {
    id v8 = [(OSDCamera *)self cameraImp];
    unsigned __int8 v9 = [v8 startStreamingWithOptions:a3 error:a4];

    LOBYTE(v7) = v9;
  }
  return v7;
}

- (BOOL)stopStreaming:(id *)a3
{
  BOOL v5 = -[OSDCamera implementorActive:](self, "implementorActive:");
  if (v5)
  {
    v6 = [(OSDCamera *)self cameraImp];
    unsigned __int8 v7 = [v6 stopStreaming:a3];

    LOBYTE(v5) = v7;
  }
  return v5;
}

- (BOOL)isStreaming
{
  id v2 = [(OSDCamera *)self cameraImp];
  unsigned __int8 v3 = [v2 isStreaming];

  return v3;
}

- (unint64_t)streamingOptions:(id *)a3
{
  if (![(OSDCamera *)self implementorActive:a3]) {
    return 0;
  }
  id v4 = [(OSDCamera *)self cameraImp];
  id v5 = [v4 streamingOptions];

  return (unint64_t)v5;
}

- (id)frameCount:(id *)a3
{
  if ([(OSDCamera *)self implementorActive:a3])
  {
    id v4 = [(OSDCamera *)self cameraImp];
    id v5 = [v4 frameCount];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)errorCountForType:(unint64_t)a3 error:(id *)a4
{
  if ([(OSDCamera *)self implementorActive:a4])
  {
    unsigned __int8 v7 = [(OSDCamera *)self cameraImp];
    id v8 = [v7 errorCountForType:a3 error:a4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)setFrameRate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(OSDCamera *)self implementorActive:a4])
  {
    unsigned __int8 v7 = [(OSDCamera *)self cameraImp];
    unsigned __int8 v8 = [v7 setFrameRate:v6 error:a4];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)setMinimumFrameRate:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(OSDCamera *)self implementorActive:a4])
  {
    unsigned __int8 v7 = [(OSDCamera *)self cameraImp];
    unsigned __int8 v8 = [v7 setMinimumFrameRate:v6 error:a4];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)setFormatIndex:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(OSDCamera *)self implementorActive:a4])
  {
    unsigned __int8 v7 = [(OSDCamera *)self cameraImp];
    unsigned __int8 v8 = [v7 setFormatIndex:v6 error:a4];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)formatIndex:(id *)a3
{
  if ([(OSDCamera *)self implementorActive:a3])
  {
    id v4 = [(OSDCamera *)self cameraImp];
    id v5 = [v4 formatIndex];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)supportedFormats:(id *)a3
{
  if (-[OSDCamera implementorActive:](self, "implementorActive:"))
  {
    id v5 = [(OSDCamera *)self cameraImp];
    id v6 = [v5 supportedFormats:a3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)enableTestPatternPN9:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  if (![(OSDCamera *)self implementorActive:a4]
    || ![(OSDCamera *)self _checkProtocol:&OBJC_PROTOCOL____OSDCameraTestInterface error:a4])
  {
    return 0;
  }
  unsigned __int8 v7 = [(OSDCamera *)self cameraImp];
  unsigned __int8 v8 = [v7 enableTestPatternPN9:v5 error:a4];

  return v8;
}

- (BOOL)enableAgileClocking:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  BOOL v7 = [(OSDCamera *)self implementorActive:a4];
  if (v7)
  {
    unsigned __int8 v8 = [(OSDCamera *)self cameraImp];
    unsigned __int8 v9 = [v8 enableAgileClocking:v5 error:a4];

    LOBYTE(v7) = v9;
  }
  return v7;
}

- (id)useMaxAvailableDataRate:(id *)a3
{
  if (-[OSDCamera implementorActive:](self, "implementorActive:"))
  {
    BOOL v5 = [(OSDCamera *)self cameraImp];
    id v6 = [v5 useMaxAvailableDataRate:a3];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)implementorActive:(id *)a3
{
  BOOL v5 = [(OSDCamera *)self cameraImp];
  objc_sync_enter(v5);
  id v6 = [(OSDCamera *)self cameraImp];
  unsigned __int8 v7 = [v6 isActive];

  if ((v7 & 1) == 0) {
    +[OSDError setError:a3, @"com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter", 1, @"%@ >> Camera is not active!", self withDomain withCode format];
  }
  objc_sync_exit(v5);

  return v7;
}

- (BOOL)_checkProtocol:(id)a3 obj:(id)a4 error:(id *)a5
{
  id v7 = a3;
  unsigned __int8 v8 = [(id)objc_opt_class() conformsToProtocol:v7];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = objc_opt_class();
    v10 = [(OSDCamera *)self cameraImp];
    +[OSDError setError:a5, @"com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter", 1, @"%@ >> %@ does not provide this implementation.", v9, v10 withDomain withCode format];
  }
  return v8;
}

- (BOOL)_checkProtocol:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(OSDCamera *)self cameraImp];
  LOBYTE(a4) = [(OSDCamera *)self _checkProtocol:v6 obj:v7 error:a4];

  return (char)a4;
}

- (BOOL)_checkSelector:(SEL)a3 error:(id *)a4
{
  id v7 = [(OSDCamera *)self cameraImp];
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = objc_opt_class();
    v10 = [(OSDCamera *)self cameraImp];
    int v11 = NSStringFromSelector(a3);
    +[OSDError setError:a4, @"com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter", 1, @"%@ >> %@ does not provide this implementation : '%@'.", v9, v10, v11 withDomain withCode format];
  }
  return v8 & 1;
}

- (_OSDCameraInterface)cameraImp
{
  return self->_cameraImp;
}

- (void)setCameraImp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end