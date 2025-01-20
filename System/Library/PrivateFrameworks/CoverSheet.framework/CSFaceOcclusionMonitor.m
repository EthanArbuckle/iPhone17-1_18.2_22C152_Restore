@interface CSFaceOcclusionMonitor
- (BOOL)_handleBiometricEvent:(unint64_t)a3;
- (BOOL)handleEvent:(id)a3;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (CSFaceOcclusionMonitorDelegate)delegate;
- (unint64_t)faceOcclusionsSinceScreenOn;
- (void)setDelegate:(id)a3;
@end

@implementation CSFaceOcclusionMonitor

- (BOOL)_handleBiometricEvent:(unint64_t)a3
{
  if (a3 == 28)
  {
    v4 = SBLogDashBoard();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEFAULT, "Bottom of face occluded", v7, 2u);
    }
    uint64_t v5 = 1;
  }
  else
  {
    if (a3 != 21) {
      return 0;
    }
    v4 = SBLogDashBoard();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      uint64_t v5 = 2;
      _os_log_impl(&dword_1D839D000, v4, OS_LOG_TYPE_DEFAULT, "Face occluded", buf, 2u);
    }
    else
    {
      uint64_t v5 = 2;
    }
  }

  self->_faceOcclusionsSinceScreenOn |= v5;
  return 1;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == 25)
  {
    self->_faceOcclusionsSinceScreenOn = 0;
LABEL_6:
    char v8 = [v4 isConsumable];
    goto LABEL_7;
  }
  if (v5 == 15)
  {
    v6 = [v4 value];
    BOOL v7 = -[CSFaceOcclusionMonitor _handleBiometricEvent:](self, "_handleBiometricEvent:", [v6 unsignedIntegerValue]);

    if (v7) {
      goto LABEL_6;
    }
  }
  char v8 = 0;
LABEL_7:

  return v8;
}

- (unint64_t)faceOcclusionsSinceScreenOn
{
  return self->_faceOcclusionsSinceScreenOn;
}

- (CSFaceOcclusionMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSFaceOcclusionMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end