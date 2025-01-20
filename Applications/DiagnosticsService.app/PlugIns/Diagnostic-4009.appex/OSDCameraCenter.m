@interface OSDCameraCenter
+ (BOOL)syncCameras:(id)a3 slave:(id)a4 skipSlaveFrames:(BOOL)a5 enableSlaveOutput:(BOOL)a6 error:(id *)a7;
+ (id)ispVersion;
+ (id)sharedCenter;
- (OSDCamera)backCamera;
- (OSDCamera)frontCamera;
- (OSDCamera)telephotoCamera;
- (OSDCaptureDevice)device;
- (id)_backCamera:(id *)a3;
- (id)_frontCameraWithDevice:(id)a3 error:(id *)a4;
- (id)_frontSuperWideCameraWithDevice:(id)a3 error:(id *)a4;
- (id)_rearSuperWideCameraWithDevice:(id)a3 error:(id *)a4;
- (id)_telephotoCameraWithDevice:(id)a3 error:(id *)a4;
- (id)cameraForSource:(unint64_t)a3 error:(id *)a4;
- (void)setBackCamera:(id)a3;
- (void)setDevice:(id)a3;
- (void)setFrontCamera:(id)a3;
- (void)setTelephotoCamera:(id)a3;
@end

@implementation OSDCameraCenter

+ (id)sharedCenter
{
  if (qword_1000163B0 != -1) {
    dispatch_once(&qword_1000163B0, &stru_1000105B0);
  }
  v2 = (void *)qword_1000163A8;

  return v2;
}

+ (id)ispVersion
{
  return +[OSDCaptureDevice ispVersion];
}

+ (BOOL)syncCameras:(id)a3 slave:(id)a4 skipSlaveFrames:(BOOL)a5 enableSlaveOutput:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  id v12 = a4;
  if ([v11 implementorActive:a7]
    && [v12 implementorActive:a7]
    && ([v11 cameraImp],
        v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = +[OSDCamera checkProtocol:&OBJC_PROTOCOL____OSDCameraSyncInterface obj:v13 error:a7], v13, v14))
  {
    v15 = [v11 cameraImp];
    v16 = [v12 cameraImp];
    unsigned int v17 = +[OSDCamera checkProtocol:&OBJC_PROTOCOL____OSDCameraSyncInterface obj:v16 error:a7];

    if (v17)
    {
      v18 = [v12 cameraImp];
      unsigned __int8 v19 = [v15 syncSlave:v18 skipFrames:v9 enableOutput:v8 error:a7];
    }
    else
    {
      unsigned __int8 v19 = 0;
    }
  }
  else
  {
    unsigned __int8 v19 = 0;
  }

  return v19;
}

- (id)cameraForSource:(unint64_t)a3 error:(id *)a4
{
  switch(a3)
  {
    case 1uLL:
      v6 = [(OSDCameraCenter *)self _backCamera:a4];
      break;
    case 2uLL:
      v7 = [(OSDCameraCenter *)self device];
      uint64_t v8 = [(OSDCameraCenter *)self _frontCameraWithDevice:v7 error:a4];
      goto LABEL_8;
    case 3uLL:
      v7 = [(OSDCameraCenter *)self device];
      uint64_t v8 = [(OSDCameraCenter *)self _telephotoCameraWithDevice:v7 error:a4];
      goto LABEL_8;
    case 4uLL:
      v7 = [(OSDCameraCenter *)self device];
      uint64_t v8 = [(OSDCameraCenter *)self _rearSuperWideCameraWithDevice:v7 error:a4];
      goto LABEL_8;
    case 5uLL:
      v7 = [(OSDCameraCenter *)self device];
      uint64_t v8 = [(OSDCameraCenter *)self _frontSuperWideCameraWithDevice:v7 error:a4];
LABEL_8:
      v6 = (void *)v8;

      break;
    default:
      +[OSDError setError:a4, @"com.apple.DiagnosticsService.Diagnostic-4009.OSDCameraCenter", 1, @"%@ >> No known camera for source %lu", self, a3 withDomain withCode format];
      v6 = 0;
      break;
  }

  return v6;
}

- (id)_backCamera:(id *)a3
{
  v5 = [(OSDCameraCenter *)self backCamera];

  if (!v5)
  {
    v6 = [OSDCamera alloc];
    v7 = [(OSDCameraCenter *)self device];
    uint64_t v8 = [(OSDCamera *)v6 initWithCaptureDevice:v7 cameraSource:1 error:a3];
    [(OSDCameraCenter *)self setBackCamera:v8];
  }

  return [(OSDCameraCenter *)self backCamera];
}

- (id)_frontCameraWithDevice:(id)a3 error:(id *)a4
{
  v6 = [(OSDCameraCenter *)self frontCamera];

  if (!v6)
  {
    v7 = [OSDCamera alloc];
    uint64_t v8 = [(OSDCameraCenter *)self device];
    BOOL v9 = [(OSDCamera *)v7 initWithCaptureDevice:v8 cameraSource:2 error:a4];
    [(OSDCameraCenter *)self setFrontCamera:v9];
  }

  return [(OSDCameraCenter *)self frontCamera];
}

- (id)_telephotoCameraWithDevice:(id)a3 error:(id *)a4
{
  v6 = [(OSDCameraCenter *)self telephotoCamera];

  if (!v6)
  {
    v7 = [OSDCamera alloc];
    uint64_t v8 = [(OSDCameraCenter *)self device];
    BOOL v9 = [(OSDCamera *)v7 initWithCaptureDevice:v8 cameraSource:3 error:a4];
    [(OSDCameraCenter *)self setTelephotoCamera:v9];
  }

  return [(OSDCameraCenter *)self telephotoCamera];
}

- (id)_rearSuperWideCameraWithDevice:(id)a3 error:(id *)a4
{
  v6 = [(OSDCameraCenter *)self telephotoCamera];

  if (!v6)
  {
    v7 = [OSDCamera alloc];
    uint64_t v8 = [(OSDCameraCenter *)self device];
    BOOL v9 = [(OSDCamera *)v7 initWithCaptureDevice:v8 cameraSource:4 error:a4];
    [(OSDCameraCenter *)self setTelephotoCamera:v9];
  }

  return [(OSDCameraCenter *)self telephotoCamera];
}

- (id)_frontSuperWideCameraWithDevice:(id)a3 error:(id *)a4
{
  v6 = [(OSDCameraCenter *)self telephotoCamera];

  if (!v6)
  {
    v7 = [OSDCamera alloc];
    uint64_t v8 = [(OSDCameraCenter *)self device];
    BOOL v9 = [(OSDCamera *)v7 initWithCaptureDevice:v8 cameraSource:5 error:a4];
    [(OSDCameraCenter *)self setTelephotoCamera:v9];
  }

  return [(OSDCameraCenter *)self telephotoCamera];
}

- (OSDCaptureDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (OSDCamera)backCamera
{
  return self->_backCamera;
}

- (void)setBackCamera:(id)a3
{
}

- (OSDCamera)frontCamera
{
  return self->_frontCamera;
}

- (void)setFrontCamera:(id)a3
{
}

- (OSDCamera)telephotoCamera
{
  return self->_telephotoCamera;
}

- (void)setTelephotoCamera:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephotoCamera, 0);
  objc_storeStrong((id *)&self->_frontCamera, 0);
  objc_storeStrong((id *)&self->_backCamera, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end