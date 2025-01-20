@interface AVCaptureEventAction
- (AVCaptureEventAction)initWithSource:(unint64_t)a3 eventHandler:(id)a4;
- (unint64_t)source;
- (void)sendPhaseUpdate:(unint64_t)a3 physicalButton:(unint64_t)a4;
@end

@implementation AVCaptureEventAction

- (AVCaptureEventAction)initWithSource:(unint64_t)a3 eventHandler:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVCaptureEventAction;
  v7 = [(AVCaptureEventAction *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_source = a3;
    uint64_t v9 = MEMORY[0x1B3E963E0](v6);
    id handler = v8->_handler;
    v8->_id handler = (id)v9;
  }
  return v8;
}

- (void).cxx_destruct
{
}

- (unint64_t)source
{
  return self->_source;
}

- (void)sendPhaseUpdate:(unint64_t)a3 physicalButton:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = +[AVCaptureEvent eventWithSource:self->_source physicalButton:a4 phase:a3];
  id v6 = _AVLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 description];
    int v8 = 136315394;
    uint64_t v9 = "-[AVCaptureEventAction sendPhaseUpdate:physicalButton:]";
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s Sending AVCaptureEvent: %@", (uint8_t *)&v8, 0x16u);
  }
  (*((void (**)(void))self->_handler + 2))();
}

@end