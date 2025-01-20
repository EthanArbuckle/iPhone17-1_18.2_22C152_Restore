@interface AVCaptureEvent
+ (id)eventWithSource:(unint64_t)a3 phase:(unint64_t)a4;
+ (id)eventWithSource:(unint64_t)a3 physicalButton:(unint64_t)a4 phase:(unint64_t)a5;
- (id)description;
- (unint64_t)phase;
- (unint64_t)physicalButton;
- (unint64_t)source;
@end

@implementation AVCaptureEvent

- (unint64_t)phase
{
  return self->_phase;
}

- (id)description
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t source = self->_source;
  if (source)
  {
    if (source != 1)
    {
      v12 = _AVLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        unint64_t v14 = source;
        _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "Invalid AVCaptureEventSource %ld.", buf, 0xCu);
      }

      __assert_rtn("NSStringFromAVCaptureEventSource", "AVCaptureEvent.m", 150, "NO");
    }
    v4 = @"secondary";
  }
  else
  {
    v4 = @"primary";
  }
  v5 = v4;
  unint64_t phase = self->_phase;
  if (phase >= 3)
  {
    v11 = _AVLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v14 = phase;
      _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "Invalid AVCaptureEventPhase %ld.", buf, 0xCu);
    }

    __assert_rtn("NSStringFromAVCaptureEventPhase", "AVCaptureEvent.m", 133, "NO");
  }
  v7 = v5;
  v8 = off_1E5FC25D8[phase];
  v9 = [NSString stringWithFormat:@"{\n\tsource: %@\n\tphase: %@\n}", v7, v8];

  return v9;
}

- (unint64_t)physicalButton
{
  return self->_physicalButton;
}

- (unint64_t)source
{
  return self->_source;
}

+ (id)eventWithSource:(unint64_t)a3 physicalButton:(unint64_t)a4 phase:(unint64_t)a5
{
  id result = +[AVCaptureEvent eventWithSource:a3 phase:a5];
  *((void *)result + 2) = a4;
  return result;
}

+ (id)eventWithSource:(unint64_t)a3 phase:(unint64_t)a4
{
  v6 = objc_alloc_init(AVCaptureEvent);
  v6->_physicalButton = 0;
  v6->_unint64_t phase = a4;
  v6->_unint64_t source = a3;

  return v6;
}

@end