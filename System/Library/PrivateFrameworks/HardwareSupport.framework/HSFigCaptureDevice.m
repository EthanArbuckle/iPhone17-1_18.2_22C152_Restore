@interface HSFigCaptureDevice
+ (id)statusDescription:(int)a3;
- (BOOL)invalidate:(id *)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDevice:(id)a3;
- (BOOL)relinquishControlOfStreams:(id)a3 error:(id *)a4;
- (BOOL)requestControlOfStreams:(id)a3 error:(id *)a4;
- (BOOL)setValue:(id)a3 forProperty:(__CFString *)a4 error:(id *)a5;
- (HSFigCaptureDevice)initWithCaptureDevice:(OpaqueFigCaptureDevice *)a3;
- (OpaqueFigCaptureDevice)underlyingDevice;
- (id)description;
- (id)streams:(id *)a3;
- (id)synchronizedStreamsGroups:(id *)a3;
- (id)valueForKey:(id)a3;
- (id)valueForProperty:(__CFString *)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation HSFigCaptureDevice

+ (id)statusDescription:(int)a3
{
  if ((a3 + 12683) > 3)
  {
    v5.receiver = a1;
    v5.super_class = (Class)&OBJC_METACLASS___HSFigCaptureDevice;
    objc_msgSendSuper2(&v5, sel_statusDescription_);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_26484C9A8[a3 + 12683];
  }

  return v3;
}

- (HSFigCaptureDevice)initWithCaptureDevice:(OpaqueFigCaptureDevice *)a3
{
  uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
  v7.receiver = self;
  v7.super_class = (Class)HSFigCaptureDevice;
  result = [(HSCMBaseObject *)&v7 initWithBaseObject:FigBaseObject];
  result->_underlyingDevice = a3;
  return result;
}

- (void)dealloc
{
  underlyingDevice = self->_underlyingDevice;
  if (underlyingDevice) {
    CFRelease(underlyingDevice);
  }
  v4.receiver = self;
  v4.super_class = (Class)HSFigCaptureDevice;
  [(HSFigCaptureDevice *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (HSFigCaptureDevice *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(HSFigCaptureDevice *)self isEqualToDevice:v4];
  }

  return v5;
}

- (BOOL)isEqualToDevice:(id)a3
{
  objc_super v4 = (OpaqueFigCaptureDevice *)[a3 underlyingDevice];
  return v4 == [(HSFigCaptureDevice *)self underlyingDevice];
}

- (unint64_t)hash
{
  return CFHash(self->_underlyingDevice);
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)HSFigCaptureDevice;
  objc_super v4 = [(HSFigCaptureDevice *)&v7 description];
  BOOL v5 = [v3 stringWithFormat:@"%@ [deviceRef: %p]", v4, self->_underlyingDevice];

  return v5;
}

- (BOOL)invalidate:(id *)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  uint64_t FigBaseObject = FigCaptureDeviceGetFigBaseObject();
  if (FigBaseObject)
  {
    uint64_t v6 = FigBaseObject;
    uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v7) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    v10 = *(uint64_t (**)(uint64_t))(v8 + 24);
    if (v10)
    {
      uint64_t v9 = v10(v6);
      if (!v9) {
        return 1;
      }
    }
    else
    {
      uint64_t v9 = 4294954514;
    }
  }
  else
  {
    uint64_t v9 = 4294954516;
  }
  v12 = HSLogHandle();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    [(HSFigCaptureDevice *)(uint64_t)self invalidate:v12];
  }

  if (a3)
  {
    v13 = NSString;
    v14 = [(id)objc_opt_class() statusDescription:v9];
    v15 = [v13 stringWithFormat:@"Failed to invalidate device! %@", v14];

    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v17 = *MEMORY[0x263F08410];
    uint64_t v21 = *MEMORY[0x263F08320];
    v22[0] = v15;
    v18 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
    v19 = [v16 errorWithDomain:v17 code:(int)v9 userInfo:v18];

    id v20 = v19;
    *a3 = v20;
  }
  return 0;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = NSStringFromSelector(sel_underlyingDevice);
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    uint64_t v7 = self->_underlyingDevice;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HSFigCaptureDevice;
    uint64_t v7 = [(HSFigCaptureDevice *)&v10 valueForKey:v4];
  }
  uint64_t v8 = v7;

  return v8;
}

- (BOOL)setValue:(id)a3 forProperty:(__CFString *)a4 error:(id *)a5
{
  uint64_t v8 = _unwrapFigCaptureValue(a3);
  v10.receiver = self;
  v10.super_class = (Class)HSFigCaptureDevice;
  LOBYTE(a5) = [(HSCMBaseObject *)&v10 setValue:v8 forProperty:a4 error:a5];

  return (char)a5;
}

- (id)valueForProperty:(__CFString *)a3 error:(id *)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HSFigCaptureDevice;
  BOOL v5 = [(HSCMBaseObject *)&v8 valueForProperty:a3 error:a4];
  int v6 = _wrapFigCaptureValue(v5, self);

  return v6;
}

- (id)streams:(id *)a3
{
  return [(HSFigCaptureDevice *)self valueForProperty:*MEMORY[0x263F2C168] error:a3];
}

- (BOOL)requestControlOfStreams:(id)a3 error:(id *)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = HSLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[HSFigCaptureDevice requestControlOfStreams:error:](v6, v7, v8, v9, v10, v11, v12, v13);
  }

  v14 = NSString;
  v15 = NSStringFromSelector(sel_underlyingStream);
  uint64_t v16 = [v14 stringWithFormat:@"self.%@", v15];

  v38 = (void *)v16;
  v39 = [v5 valueForKeyPath:v16];
  int v17 = 0;
  do
  {
    underlyingDevice = self->_underlyingDevice;
    v19 = *(void **)(CMBaseObjectGetVTable() + 16);
    if (v19) {
      id v20 = v19;
    }
    else {
      id v20 = 0;
    }
    if (*v20 >= 2uLL && (uint64_t v21 = (uint64_t (*)(OpaqueFigCaptureDevice *, void *, void))v20[2]) != 0)
    {
      uint64_t v22 = v21(underlyingDevice, v39, 0);
      if (!v22)
      {
        char v33 = 1;
        v34 = v38;
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v22 = 4294954514;
    }
    v23 = HSLogHandle();
    ++v17;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v43 = v5;
      __int16 v44 = 1024;
      *(_DWORD *)v45 = v17;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = 6;
      _os_log_impl(&dword_2289F2000, v23, OS_LOG_TYPE_DEFAULT, "Trying to get control of the streams %@. Iteration %d/%d", buf, 0x18u);
    }

    usleep(0x7A120u);
  }
  while (v17 != 6);
  v24 = HSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v36 = [(id)objc_opt_class() statusDescription:v22];
    *(_DWORD *)buf = 138413058;
    id v43 = v5;
    __int16 v44 = 2112;
    *(void *)v45 = self;
    *(_WORD *)&v45[8] = 1024;
    int v46 = 6;
    __int16 v47 = 2112;
    v48 = v36;
    _os_log_error_impl(&dword_2289F2000, v24, OS_LOG_TYPE_ERROR, "Failed to request control of streams %@ from device %@ after %d attempts! %@", buf, 0x26u);
  }
  char v33 = (char)a4;
  v34 = v38;
  if (a4)
  {
    v25 = NSString;
    v26 = [(id)objc_opt_class() statusDescription:v22];
    v27 = [v25 stringWithFormat:@"Failed to request control of streams %@ from device %@ after %d attempts! %@", v5, self, 6, v26];

    v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08410];
    uint64_t v40 = *MEMORY[0x263F08320];
    v41 = v27;
    v30 = [NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    v31 = [v28 errorWithDomain:v29 code:(int)v22 userInfo:v30];

    id v32 = v31;
    *a4 = v32;

    char v33 = 0;
  }
LABEL_19:

  return v33;
}

- (BOOL)relinquishControlOfStreams:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = HSLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[HSFigCaptureDevice relinquishControlOfStreams:error:](v7, v8, v9, v10, v11, v12, v13, v14);
  }

  v15 = NSString;
  uint64_t v16 = NSStringFromSelector(sel_underlyingStream);
  int v17 = [v15 stringWithFormat:@"self.%@", v16];

  v18 = [v6 valueForKeyPath:v17];
  underlyingDevice = self->_underlyingDevice;
  id v20 = *(void **)(CMBaseObjectGetVTable() + 16);
  if (v20) {
    uint64_t v21 = v20;
  }
  else {
    uint64_t v21 = 0;
  }
  if (*v21 >= 2uLL && (uint64_t v22 = (uint64_t (*)(OpaqueFigCaptureDevice *, void *, void))v21[3]) != 0)
  {
    uint64_t v23 = v22(underlyingDevice, v18, 0);
    if (!v23)
    {
      LOBYTE(a4) = 1;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v23 = 4294954514;
  }
  v24 = HSLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v34 = [(id)objc_opt_class() statusDescription:v23];
    *(_DWORD *)buf = 138412802;
    id v38 = v6;
    __int16 v39 = 2112;
    uint64_t v40 = self;
    __int16 v41 = 2112;
    v42 = v34;
    _os_log_error_impl(&dword_2289F2000, v24, OS_LOG_TYPE_ERROR, "Failed to relinquish control of streams %@ from device %@! %@", buf, 0x20u);
  }
  if (a4)
  {
    v25 = NSString;
    v26 = [(id)objc_opt_class() statusDescription:v23];
    v27 = [v25 stringWithFormat:@"Failed to relinquish control of streams %@ from device %@! %@", v6, self, v26];

    v28 = (void *)MEMORY[0x263F087E8];
    uint64_t v29 = *MEMORY[0x263F08410];
    uint64_t v35 = *MEMORY[0x263F08320];
    v36 = v27;
    v30 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v31 = [v28 errorWithDomain:v29 code:(int)v23 userInfo:v30];

    id v32 = v31;
    *a4 = v32;

    LOBYTE(a4) = 0;
  }
LABEL_15:

  return (char)a4;
}

- (id)synchronizedStreamsGroups:(id *)a3
{
  return [(HSFigCaptureDevice *)self valueForProperty:*MEMORY[0x263F2C170] error:a3];
}

- (OpaqueFigCaptureDevice)underlyingDevice
{
  return self->_underlyingDevice;
}

- (void)invalidate:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = [(id)objc_opt_class() statusDescription:a2];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_2289F2000, a3, OS_LOG_TYPE_ERROR, "Failed to invalidate device! %@", (uint8_t *)&v5, 0xCu);
}

- (void)requestControlOfStreams:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)relinquishControlOfStreams:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end