@interface CAMMachineReadableCodeLoggingController
- (BOOL)_seenMachineReadableObjectInNonActiveState;
- (BOOL)_seenMachineReadableObjectOfAcceptableSize;
- (BOOL)_seenMachineReadableObjectOfUnacceptableSize;
- (CAMMachineReadableCodeLoggingController)init;
- (void)_setSeenMachineReadableObjectInNonActiveState:(BOOL)a3;
- (void)_setSeenMachineReadableObjectOfAcceptableSize:(BOOL)a3;
- (void)_setSeenMachineReadableObjectOfUnacceptableSize:(BOOL)a3;
- (void)logMachineReadableCodeResult:(id)a3 isOfSignificantSize:(BOOL)a4;
- (void)logMachineReadableCodeResultDuringInactiveAppState;
- (void)resetLoggingState;
@end

@implementation CAMMachineReadableCodeLoggingController

- (CAMMachineReadableCodeLoggingController)init
{
  v3.receiver = self;
  v3.super_class = (Class)CAMMachineReadableCodeLoggingController;
  result = [(CAMMachineReadableCodeLoggingController *)&v3 init];
  *(_WORD *)&result->__seenMachineReadableObjectOfAcceptableSize = 0;
  result->__seenMachineReadableObjectInNonActiveState = 0;
  return result;
}

- (void)logMachineReadableCodeResultDuringInactiveAppState
{
  if (![(CAMMachineReadableCodeLoggingController *)self _seenMachineReadableObjectInNonActiveState])
  {
    objc_super v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_2099F8000, v3, OS_LOG_TYPE_DEFAULT, "MRC detected during inactive application state.", v4, 2u);
    }

    [(CAMMachineReadableCodeLoggingController *)self _setSeenMachineReadableObjectInNonActiveState:1];
  }
}

- (void)logMachineReadableCodeResult:(id)a3 isOfSignificantSize:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  BOOL v7 = [(CAMMachineReadableCodeLoggingController *)self _seenMachineReadableObjectOfAcceptableSize];
  BOOL v8 = [(CAMMachineReadableCodeLoggingController *)self _seenMachineReadableObjectOfUnacceptableSize];
  if (v4 && !v7)
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_2099F8000, v9, OS_LOG_TYPE_DEFAULT, "MRC object handed off to BarcodeSupport", (uint8_t *)&v16, 2u);
    }

    [(CAMMachineReadableCodeLoggingController *)self _setSeenMachineReadableObjectOfAcceptableSize:1];
  }
  if (!v4 && !v8)
  {
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v6 underlyingMachineReadableCodeObject];
      [v11 bounds];
      uint64_t v13 = v12;
      v14 = [v6 underlyingMachineReadableCodeObject];
      [v14 bounds];
      int v16 = 134218240;
      uint64_t v17 = v13;
      __int16 v18 = 2048;
      uint64_t v19 = v15;
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "MRC object recognized, but was too small. Height:%f, Width:%f", (uint8_t *)&v16, 0x16u);
    }
    [(CAMMachineReadableCodeLoggingController *)self _setSeenMachineReadableObjectOfUnacceptableSize:1];
  }
}

- (void)resetLoggingState
{
  [(CAMMachineReadableCodeLoggingController *)self _setSeenMachineReadableObjectInNonActiveState:0];
  [(CAMMachineReadableCodeLoggingController *)self _setSeenMachineReadableObjectOfAcceptableSize:0];
  [(CAMMachineReadableCodeLoggingController *)self _setSeenMachineReadableObjectOfUnacceptableSize:0];
}

- (BOOL)_seenMachineReadableObjectOfAcceptableSize
{
  return self->__seenMachineReadableObjectOfAcceptableSize;
}

- (void)_setSeenMachineReadableObjectOfAcceptableSize:(BOOL)a3
{
  self->__seenMachineReadableObjectOfAcceptableSize = a3;
}

- (BOOL)_seenMachineReadableObjectOfUnacceptableSize
{
  return self->__seenMachineReadableObjectOfUnacceptableSize;
}

- (void)_setSeenMachineReadableObjectOfUnacceptableSize:(BOOL)a3
{
  self->__seenMachineReadableObjectOfUnacceptableSize = a3;
}

- (BOOL)_seenMachineReadableObjectInNonActiveState
{
  return self->__seenMachineReadableObjectInNonActiveState;
}

- (void)_setSeenMachineReadableObjectInNonActiveState:(BOOL)a3
{
  self->__seenMachineReadableObjectInNonActiveState = a3;
}

@end