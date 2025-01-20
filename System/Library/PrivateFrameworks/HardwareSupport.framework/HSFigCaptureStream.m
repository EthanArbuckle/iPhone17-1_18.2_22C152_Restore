@interface HSFigCaptureStream
+ (id)statusDescription:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStream:(id)a3;
- (BOOL)start:(id *)a3;
- (BOOL)stop:(id *)a3;
- (HSFigCaptureDevice)device;
- (HSFigCaptureStream)initWithCaptureStream:(OpaqueFigCaptureStream *)a3 fromDevice:(id)a4;
- (OpaqueFigCaptureStream)underlyingStream;
- (id)description;
- (id)valueForKey:(id)a3;
- (unint64_t)hash;
@end

@implementation HSFigCaptureStream

+ (id)statusDescription:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v5 = __HSDescribeFigStreamStatus(a3);
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    v10.receiver = a1;
    v10.super_class = (Class)&OBJC_METACLASS___HSFigCaptureStream;
    objc_msgSendSuper2(&v10, sel_statusDescription_, v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (HSFigCaptureStream)initWithCaptureStream:(OpaqueFigCaptureStream *)a3 fromDevice:(id)a4
{
  v6 = (HSFigCaptureDevice *)a4;
  uint64_t FigBaseObject = FigCaptureStreamGetFigBaseObject();
  v11.receiver = self;
  v11.super_class = (Class)HSFigCaptureStream;
  v8 = [(HSCMBaseObject *)&v11 initWithBaseObject:FigBaseObject];
  v8->_underlyingStream = a3;
  device = v8->_device;
  v8->_device = v6;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HSFigCaptureStream *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(HSFigCaptureStream *)self isEqualToStream:v4];
  }

  return v5;
}

- (BOOL)isEqualToStream:(id)a3
{
  v4 = (OpaqueFigCaptureStream *)[a3 underlyingStream];
  return v4 == [(HSFigCaptureStream *)self underlyingStream];
}

- (unint64_t)hash
{
  return CFHash(self->_underlyingStream);
}

- (id)description
{
  uint64_t v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)HSFigCaptureStream;
  v4 = [(HSFigCaptureStream *)&v10 description];
  underlyingStream = self->_underlyingStream;
  v6 = [(HSFigCaptureStream *)self device];
  id v7 = [v6 description];
  v8 = [v3 stringWithFormat:@"%@ [streamRef: %p, device: %@]", v4, underlyingStream, v7];

  return v8;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = NSStringFromSelector(sel_underlyingStream);
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = self->_underlyingStream;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HSFigCaptureStream;
    id v7 = [(HSFigCaptureStream *)&v10 valueForKey:v4];
  }
  v8 = v7;

  return v8;
}

- (BOOL)start:(id *)a3
{
  v31[1] = *MEMORY[0x263EF8340];
  BOOL v5 = HSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[HSFigCaptureStream start:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  underlyingStream = self->_underlyingStream;
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  v16 = *(uint64_t (**)(OpaqueFigCaptureStream *))(v15 + 8);
  if (v16)
  {
    uint64_t v17 = v16(underlyingStream);
    if (!v17) {
      return 1;
    }
  }
  else
  {
    uint64_t v17 = 4294954514;
  }
  v19 = HSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[HSFigCaptureStream start:]((uint64_t)self, v17);
  }

  if (a3)
  {
    v20 = NSString;
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    v23 = [(id)objc_opt_class() statusDescription:v17];
    v24 = [v20 stringWithFormat:@"%@ failed to start stream! %@", v22, v23];

    v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08410];
    uint64_t v30 = *MEMORY[0x263F08320];
    v31[0] = v24;
    v27 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v28 = [v25 errorWithDomain:v26 code:(int)v17 userInfo:v27];

    id v29 = v28;
    *a3 = v29;
  }
  return 0;
}

- (BOOL)stop:(id *)a3
{
  v31[1] = *MEMORY[0x263EF8340];
  BOOL v5 = HSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[HSFigCaptureStream stop:](v5, v6, v7, v8, v9, v10, v11, v12);
  }

  underlyingStream = self->_underlyingStream;
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  v16 = *(uint64_t (**)(OpaqueFigCaptureStream *))(v15 + 16);
  if (v16)
  {
    uint64_t v17 = v16(underlyingStream);
    if (!v17) {
      return 1;
    }
  }
  else
  {
    uint64_t v17 = 4294954514;
  }
  v19 = HSLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
    -[HSFigCaptureStream stop:]((uint64_t)self, v17);
  }

  if (a3)
  {
    v20 = NSString;
    v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    v23 = [(id)objc_opt_class() statusDescription:v17];
    v24 = [v20 stringWithFormat:@"%@ failed to stop stream! %@", v22, v23];

    v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v26 = *MEMORY[0x263F08410];
    uint64_t v30 = *MEMORY[0x263F08320];
    v31[0] = v24;
    v27 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v28 = [v25 errorWithDomain:v26 code:(int)v17 userInfo:v27];

    id v29 = v28;
    *a3 = v29;
  }
  return 0;
}

- (HSFigCaptureDevice)device
{
  return self->_device;
}

- (OpaqueFigCaptureStream)underlyingStream
{
  return self->_underlyingStream;
}

- (void).cxx_destruct
{
}

- (void)start:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  BOOL v5 = [(id)objc_opt_class() statusDescription:a2];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_2289F2000, v6, v7, "%@ failed to start stream! %@", v8, v9, v10, v11, v12);
}

- (void)start:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)stop:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  BOOL v5 = [(id)objc_opt_class() statusDescription:a2];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_2289F2000, v6, v7, "%@ failed to stop stream! %@", v8, v9, v10, v11, v12);
}

- (void)stop:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end