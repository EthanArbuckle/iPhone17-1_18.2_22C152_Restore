@interface AVCaptureEventInteraction
+ (id)_captureButtonsConfigurationSet;
- (AVCaptureEventInteraction)initWithEventHandler:(id)a3;
- (AVCaptureEventInteraction)initWithPrimaryEventHandler:(id)a3 secondaryEventHandler:(id)a4;
- (BOOL)isEnabled;
- (UIView)view;
- (id)_actionForPhysicalButton:(uint64_t)a1;
- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5;
- (void)_setUpPhysicalButtonInteractionIfNeeded;
- (void)_updatePhysicalButtonInteractionEnabled;
- (void)_updatePhysicalButtonInteractionViewIfNeeded;
- (void)didMoveToView:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation AVCaptureEventInteraction

uint64_t __60__AVCaptureEventInteraction__captureButtonsConfigurationSet__block_invoke()
{
  return [MEMORY[0x1E4FB2230] behaviorOptions];
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[AVCaptureEventInteraction _setUpPhysicalButtonInteractionIfNeeded]((uint64_t)self);
    [(AVCaptureEventInteraction *)self _updatePhysicalButtonInteractionEnabled];
  }
}

- (AVCaptureEventInteraction)initWithPrimaryEventHandler:(id)a3 secondaryEventHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AVCaptureEventInteraction;
  v8 = [(AVCaptureEventInteraction *)&v15 init];
  if (v8)
  {
    v9 = [[AVCaptureEventAction alloc] initWithSource:0 eventHandler:v6];
    v10 = [[AVCaptureEventAction alloc] initWithSource:1 eventHandler:v7];
    primaryAction = v8->_primaryAction;
    v8->_primaryAction = v9;
    v12 = v9;

    secondaryAction = v8->_secondaryAction;
    v8->_secondaryAction = v10;

    v8->_enabled = 1;
  }

  return v8;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (void)_setUpPhysicalButtonInteractionIfNeeded
{
  if (a1)
  {
    if (!*(void *)(a1 + 32))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
      if (WeakRetained)
      {
        int v3 = *(unsigned __int8 *)(a1 + 40);

        if (v3)
        {
          id v6 = +[AVCaptureEventInteraction _captureButtonsConfigurationSet];
          uint64_t v4 = [objc_alloc(MEMORY[0x1E4FB2240]) initWithConfigurations:v6 delegate:a1];
          v5 = *(void **)(a1 + 32);
          *(void *)(a1 + 32) = v4;

          [(id)a1 _updatePhysicalButtonInteractionEnabled];
          [(id)a1 _updatePhysicalButtonInteractionViewIfNeeded];
        }
      }
    }
  }
}

- (void)didMoveToView:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self)
  {
    id obj = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

    id v5 = obj;
    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)&self->_view, obj);
      -[AVCaptureEventInteraction _setUpPhysicalButtonInteractionIfNeeded]((uint64_t)self);
      id v4 = (id)[(AVCaptureEventInteraction *)self _updatePhysicalButtonInteractionViewIfNeeded];
      id v5 = obj;
    }
  }

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)_updatePhysicalButtonInteractionViewIfNeeded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = self->_physicalButtonInteraction;
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    id v5 = [(_UIPhysicalButtonInteraction *)v3 view];
    id v6 = v5;
    if (v5 != WeakRetained)
    {
      [v5 removeInteraction:v3];
      [WeakRetained addInteraction:v3];
      id v7 = _AVLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412802;
        v9 = v3;
        __int16 v10 = 2112;
        v11 = v6;
        __int16 v12 = 2112;
        id v13 = WeakRetained;
        _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "Updated view for interaction: %@\n\tfrom %@\n\tto: %@", (uint8_t *)&v8, 0x20u);
      }
    }
  }
}

- (void)_updatePhysicalButtonInteractionEnabled
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v3 = self->_physicalButtonInteraction;
  int enabled = self->_enabled;
  if (enabled != [(_UIPhysicalButtonInteraction *)v3 _isEnabled])
  {
    [(_UIPhysicalButtonInteraction *)v3 _setEnabled:enabled != 0];
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109378;
      v6[1] = enabled;
      __int16 v7 = 2112;
      int v8 = v3;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "Updated enablement state to %d for interaction: %@", (uint8_t *)v6, 0x12u);
    }
  }
}

+ (id)_captureButtonsConfigurationSet
{
  return (id)[MEMORY[0x1E4FB2238] _cameraShutterConfigurationsWithOptionsProvider:&__block_literal_global_19520];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalButtonInteraction, 0);
  objc_storeStrong((id *)&self->_secondaryAction, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);

  objc_destroyWeak((id *)&self->_view);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)_physicalButtonInteraction:(id)a3 handleAction:(id)a4 withActiveActions:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [v6 _button];
  id v8 = v6;
  id v20 = v8;
  if (v7 == 5)
  {
    if (self && self->_enabled)
    {
      uint64_t v9 = [v8 _stagePhase];
      if ((unint64_t)[v20 _numberOfStages] < 2)
      {
        int v12 = 0;
      }
      else
      {
        uint64_t v10 = [v20 _stage];
        BOOL v11 = v10 != [v20 _numberOfStages] - 1 || v9 == 1;
        int v12 = !v11;
      }
      uint64_t v15 = [v20 _state];
      uint64_t v16 = [v20 _numberOfStages];
      if (v12)
      {
        if (v9)
        {
          v17 = v20;
          if (v9 == 3)
          {
            uint64_t v9 = 2;
          }
          else
          {
            if (v9 != 2)
            {
              v19 = _AVLog();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v22 = v9;
                _os_log_impl(&dword_1B05B7000, v19, OS_LOG_TYPE_DEFAULT, "Invalid _UIPhysicalButtonStagePhase %ld. Cannot be converted to AVCaptureEventPhase.", buf, 0xCu);
              }

              __assert_rtn("AVCaptureEventPhaseFromPhysicalButtonStagePhase", "AVCaptureEvent.m", 110, "NO");
            }
            uint64_t v9 = 1;
          }
          goto LABEL_27;
        }
LABEL_25:
        v17 = v20;
LABEL_27:
        uint64_t v14 = [v17 _button];
        goto LABEL_28;
      }
      BOOL v11 = v16 == 1;
      id v8 = v20;
      if (v11 && v15 != 1)
      {
        uint64_t v9 = AVCaptureEventPhaseFromPhysicalButtonState(v15);
        goto LABEL_25;
      }
    }
  }
  else if (self)
  {
    uint64_t v13 = [v8 _state];
    id v8 = v20;
    if (self->_enabled && v13 != 1)
    {
      uint64_t v14 = [v20 _button];
      uint64_t v9 = AVCaptureEventPhaseFromPhysicalButtonState(v13);
LABEL_28:
      v18 = -[AVCaptureEventInteraction _actionForPhysicalButton:]((uint64_t)self, v14);
      [v18 sendPhaseUpdate:v9 physicalButton:v14];

      id v8 = v20;
    }
  }
}

- (id)_actionForPhysicalButton:(uint64_t)a1
{
  uint64_t v3 = a2 - 1;
  if (unint64_t)(a2 - 1) <= 4 && ((0x17u >> v3))
  {
    id v4 = *(id *)(a1 + qword_1B0721420[v3]);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (AVCaptureEventInteraction)initWithEventHandler:(id)a3
{
  return [(AVCaptureEventInteraction *)self initWithPrimaryEventHandler:a3 secondaryEventHandler:a3];
}

@end