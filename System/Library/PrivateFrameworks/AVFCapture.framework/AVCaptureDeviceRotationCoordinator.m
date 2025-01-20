@interface AVCaptureDeviceRotationCoordinator
+ (void)initialize;
- (AVCaptureDevice)device;
- (AVCaptureDeviceRotationCoordinator)initWithDevice:(AVCaptureDevice *)device previewLayer:(CALayer *)previewLayer;
- (BOOL)_isExternalDeviceType:(id)a3;
- (CALayer)previewLayer;
- (CGFloat)videoRotationAngleForHorizonLevelCapture;
- (CGFloat)videoRotationAngleForHorizonLevelPreview;
- (NSString)debugDescription;
- (NSString)description;
- (double)_systemReferenceAngleForDeviceOrientation:(int64_t)a3;
- (int64_t)_currentDeviceOrientation;
- (void)_calculateVideoRotationAngleForHorizonLevelCaptureWithDeviceOrientation:(int64_t)a3;
- (void)_calculateVideoRotationAngleForHorizonLevelPreviewWithSystemReferenceAngle:(double)a3;
- (void)_handleActiveInterfaceOrientationUpdate:(id)a3;
- (void)_handleSystemReferenceAngleDidChangeNotification:(id)a3;
- (void)_updateVideoRotationAngleForHorizonLevelCapture;
- (void)_updateVideoRotationAngleForHorizonLevelPreview;
- (void)dealloc;
- (void)handleVideoPreviewLayerDidBecomeVisibleNotification:(id)a3;
- (void)layer:(id)a3 didBecomeVisible:(BOOL)a4;
@end

@implementation AVCaptureDeviceRotationCoordinator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (AVCaptureDeviceRotationCoordinator)initWithDevice:(AVCaptureDevice *)device previewLayer:(CALayer *)previewLayer
{
  v29.receiver = self;
  v29.super_class = (Class)AVCaptureDeviceRotationCoordinator;
  v6 = [(AVCaptureDeviceRotationCoordinator *)&v29 init];
  if (v6)
  {
    v6->_coordinatorWeakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:v6];
    v6->_deviceWeakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:device];
    v6->_devicePosition = [(AVCaptureDevice *)device position];
    if (previewLayer) {
      v6->_previewLayerWeakReference = (AVWeakReference *)[objc_alloc(MEMORY[0x1E4F47DF0]) initWithReferencedObject:previewLayer];
    }
    v6->_videoRotationAngleForHorizonLevelPreview = 0.0;
    v6->_videoRotationAngleForHorizonLevelCapture = 0.0;
    uint64_t v7 = *MEMORY[0x1E4F47C68];
    AVAuthorizationStatus v8 = +[AVCaptureDevice authorizationStatusForMediaType:*MEMORY[0x1E4F47C68]];
    BOOL v10 = v8 == AVAuthorizationStatusAuthorized || v8 == AVAuthorizationStatusNotDetermined;
    v6->_monitorSystemReferenceAngle = v10;
    BOOL v11 = [(AVCaptureDevice *)device hasMediaType:v7];
    BOOL v12 = v6->_monitorSystemReferenceAngle && v11;
    if (!previewLayer) {
      BOOL v12 = 0;
    }
    v6->_monitorSystemReferenceAngle = v12;
    BOOL v13 = ![(AVCaptureDeviceRotationCoordinator *)v6 _isExternalDeviceType:[(AVCaptureDevice *)device deviceType]];
    if (!v6->_monitorSystemReferenceAngle) {
      BOOL v13 = 0;
    }
    v6->_monitorSystemReferenceAngle = v13;
    if (v13)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", v6, sel__handleSystemReferenceAngleDidChangeNotification_, getUISSystemReferenceAngleChangedNotification(), 0);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      v25 = __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke;
      v26 = &unk_1E5A72D70;
      v27 = v6;
      v28 = previewLayer;
      if ([MEMORY[0x1E4F29060] isMainThread]) {
        v25((uint64_t)block);
      }
      else {
        dispatch_async_and_wait(MEMORY[0x1E4F14428], block);
      }
    }
    v6->_monitorDeviceOrientation = v10;
    BOOL v14 = [(AVCaptureDevice *)device hasMediaType:v7];
    BOOL v15 = v6->_monitorDeviceOrientation && v14;
    v6->_monitorDeviceOrientation = v15;
    BOOL v16 = ![(AVCaptureDeviceRotationCoordinator *)v6 _isExternalDeviceType:[(AVCaptureDevice *)device deviceType]];
    if (!v6->_monitorDeviceOrientation) {
      BOOL v16 = 0;
    }
    v6->_monitorDeviceOrientation = v16;
    if (v16)
    {
      coordinatorWeakReference = v6->_coordinatorWeakReference;
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_4;
      handler[3] = &unk_1E5A72EA8;
      handler[4] = coordinatorWeakReference;
      notify_register_dispatch("com.apple.backboardd.rawOrientation", &v6->_deviceOrientationNotificationToken, MEMORY[0x1E4F14428], handler);
      v20 = __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_5;
      v21 = &unk_1E5A72ED0;
      v22 = v6;
      if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", MEMORY[0x1E4F143A8], 3221225472)) {
        v20((uint64_t)&v19);
      }
      else {
        dispatch_async_and_wait(MEMORY[0x1E4F14428], &v19);
      }
    }
  }
  return v6;
}

uint64_t __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(*(void *)(a1 + 32) + 80) = objc_alloc_init((Class)getFBSOrientationObserverClass());
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_2;
  v4[3] = &unk_1E5A72E80;
  v4[4] = v2;
  [*(id *)(*(void *)(a1 + 32) + 80) setHandler:v4];
  [*(id *)(a1 + 32) _updateVideoRotationAngleForHorizonLevelPreview];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "addObserver:selector:name:object:", *(void *)(a1 + 32), sel_handleVideoPreviewLayerDidBecomeVisibleNotification_, 0x1EF4DFA90, *(void *)(a1 + 40));
  }
  *(void *)(*(void *)(a1 + 32) + 40) = [[AVCaptureRotationHelperLayer alloc] initWithDelegate:*(void *)(a1 + 32)];
  return [*(id *)(a1 + 40) addSublayer:*(void *)(*(void *)(a1 + 32) + 40)];
}

void __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) referencedObject];
  if (v3)
  {
    v4 = (void *)v3;
    if ([MEMORY[0x1E4F29060] isMainThread])
    {
      [v4 _handleActiveInterfaceOrientationUpdate:a2];
    }
    else
    {
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_3;
      v5[3] = &unk_1E5A72D70;
      v5[4] = v4;
      v5[5] = a2;
      dispatch_async(MEMORY[0x1E4F14428], v5);
    }
  }
}

uint64_t __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleActiveInterfaceOrientationUpdate:*(void *)(a1 + 40)];
}

void *__66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_4(uint64_t a1)
{
  result = (void *)[*(id *)(a1 + 32) referencedObject];
  if (result)
  {
    return (void *)[result _updateVideoRotationAngleForHorizonLevelCapture];
  }
  return result;
}

uint64_t __66__AVCaptureDeviceRotationCoordinator_initWithDevice_previewLayer___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateVideoRotationAngleForHorizonLevelCapture];
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, 0x1EF4DFA90, 0);
  [(AVCaptureRotationHelperLayer *)self->_rotationHelperLayer removeFromSuperlayer];

  if (self->_monitorSystemReferenceAngle) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:name:object:", self, getUISSystemReferenceAngleChangedNotification(), 0);
  }
  [(FBSOrientationObserver *)self->_activeInterfaceOrientationObserver invalidate];

  if (self->_monitorDeviceOrientation) {
    notify_cancel(self->_deviceOrientationNotificationToken);
  }
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeviceRotationCoordinator;
  [(AVCaptureDeviceRotationCoordinator *)&v3 dealloc];
}

- (NSString)debugDescription
{
  return (NSString *)[NSString stringWithFormat:@"[%@][%@]", -[AVCaptureDevice localizedName](-[AVCaptureDeviceRotationCoordinator device](self, "device"), "localizedName"), -[AVCaptureDeviceRotationCoordinator previewLayer](self, "previewLayer")];
}

- (NSString)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)[v3 stringWithFormat:@"<%@: %p %@>", NSStringFromClass(v4), self, -[AVCaptureDeviceRotationCoordinator debugDescription](self, "debugDescription")];
}

- (AVCaptureDevice)device
{
  return (AVCaptureDevice *)[(AVWeakReference *)self->_deviceWeakReference referencedObject];
}

- (BOOL)_isExternalDeviceType:(id)a3
{
  if ([a3 isEqualToString:@"AVCaptureDeviceTypeExternal"]) {
    return 1;
  }

  return [a3 isEqualToString:@"AVCaptureDeviceTypeContinuityCamera"];
}

- (CALayer)previewLayer
{
  return (CALayer *)[(AVWeakReference *)self->_previewLayerWeakReference referencedObject];
}

- (void)handleVideoPreviewLayerDidBecomeVisibleNotification:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);

  [(AVCaptureDeviceRotationCoordinator *)self _updateVideoRotationAngleForHorizonLevelPreview];
}

- (void)layer:(id)a3 didBecomeVisible:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (v4)
  {
    [(AVCaptureDeviceRotationCoordinator *)self _updateVideoRotationAngleForHorizonLevelPreview];
  }
}

- (CGFloat)videoRotationAngleForHorizonLevelPreview
{
  return self->_videoRotationAngleForHorizonLevelPreview;
}

- (void)_updateVideoRotationAngleForHorizonLevelPreview
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CGFloat AVUISSystemReferenceAngleForContextID(uint32_t)"), @"AVCaptureDeviceRotationCoordinator.m", 47, @"%s", dlerror());
  __break(1u);
}

- (void)_calculateVideoRotationAngleForHorizonLevelPreviewWithSystemReferenceAngle:(double)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (!self->_monitorSystemReferenceAngle)
  {
    FigDebugAssert3();
    return;
  }
  uint64_t v5 = [(AVWeakReference *)self->_previewLayerWeakReference referencedObject];
  int v6 = FigCaptureCameraRequires180DegreesRotation();
  if (v5)
  {
    if (a3 == 0.0)
    {
      if (self->_devicePosition == 2) {
        int v7 = v6;
      }
      else {
        int v7 = 1;
      }
      BOOL v8 = v7 == 0;
      double v9 = 270.0;
      double v10 = 90.0;
    }
    else
    {
      double v9 = 90.0;
      if (a3 == 90.0)
      {
        if (v6) {
          double v11 = 180.0;
        }
        else {
          double v11 = 0.0;
        }
LABEL_15:
        double videoRotationAngleForHorizonLevelPreview = self->_videoRotationAngleForHorizonLevelPreview;
        if (v11 != videoRotationAngleForHorizonLevelPreview
          || !self->_isInitialVideoRotationAngleForHorizonLevelPreviewSet)
        {
          if (dword_1E9544D78)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          self->_isInitialVideoRotationAngleForHorizonLevelPreviewSet = 1;
          if (v11 != videoRotationAngleForHorizonLevelPreview)
          {
            [(AVCaptureDeviceRotationCoordinator *)self willChangeValueForKey:@"videoRotationAngleForHorizonLevelPreview"];
            self->_double videoRotationAngleForHorizonLevelPreview = v11;
            [(AVCaptureDeviceRotationCoordinator *)self didChangeValueForKey:@"videoRotationAngleForHorizonLevelPreview"];
          }
        }
        return;
      }
      if (a3 == -90.0)
      {
        BOOL v8 = v6 == 0;
        double v9 = 180.0;
        double v10 = 0.0;
      }
      else
      {
        if (a3 != 180.0)
        {
          double v11 = 0.0;
          goto LABEL_15;
        }
        if (self->_devicePosition == 2) {
          int v14 = v6;
        }
        else {
          int v14 = 1;
        }
        BOOL v8 = v14 == 0;
        double v10 = 270.0;
      }
    }
    if (v8) {
      double v11 = v9;
    }
    else {
      double v11 = v10;
    }
    goto LABEL_15;
  }
}

- (void)_handleSystemReferenceAngleDidChangeNotification:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = (void *)[(AVWeakReference *)self->_previewLayerWeakReference referencedObject];
  if (v5)
  {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "context"), "contextId");
    int v7 = (void *)[a3 userInfo];
    uint64_t v11 = 0;
    BOOL v12 = &v11;
    uint64_t v13 = 0x2020000000;
    BOOL v8 = (void *)getUISSystemReferenceAngleAffectedContextIDsKeySymbolLoc_ptr;
    uint64_t v14 = getUISSystemReferenceAngleAffectedContextIDsKeySymbolLoc_ptr;
    if (!getUISSystemReferenceAngleAffectedContextIDsKeySymbolLoc_ptr)
    {
      double v9 = (void *)UIKitServicesLibrary();
      v12[3] = (uint64_t)dlsym(v9, "UISSystemReferenceAngleAffectedContextIDsKey");
      getUISSystemReferenceAngleAffectedContextIDsKeySymbolLoc_ptr = v12[3];
      BOOL v8 = (void *)v12[3];
    }
    _Block_object_dispose(&v11, 8);
    if (!v8) {
      -[AVCaptureDeviceRotationCoordinator _handleSystemReferenceAngleDidChangeNotification:]();
    }
    double v10 = (void *)[v7 objectForKeyedSubscript:*v8];
    if (objc_msgSend(v10, "containsObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v6)))-[AVCaptureDeviceRotationCoordinator _updateVideoRotationAngleForHorizonLevelPreview](self, "_updateVideoRotationAngleForHorizonLevelPreview"); {
  }
    }
}

- (void)_handleActiveInterfaceOrientationUpdate:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);

  [(AVCaptureDeviceRotationCoordinator *)self _updateVideoRotationAngleForHorizonLevelPreview];
}

- (double)_systemReferenceAngleForDeviceOrientation:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 2) <= 2) {
    return dbl_1A1636258[a3 - 2];
  }
  return result;
}

- (CGFloat)videoRotationAngleForHorizonLevelCapture
{
  return self->_videoRotationAngleForHorizonLevelCapture;
}

- (void)_updateVideoRotationAngleForHorizonLevelCapture
{
  int64_t v3 = [(AVCaptureDeviceRotationCoordinator *)self _currentDeviceOrientation];

  [(AVCaptureDeviceRotationCoordinator *)self _calculateVideoRotationAngleForHorizonLevelCaptureWithDeviceOrientation:v3];
}

- (void)_calculateVideoRotationAngleForHorizonLevelCaptureWithDeviceOrientation:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if (self->_monitorDeviceOrientation)
  {
    int v5 = FigCaptureCameraRequires180DegreesRotation();
    if (!self->_isInitialVideoRotationAngleForHorizonLevelCaptureSet
      && (unint64_t)(a3 - 5) <= 1
      && !self->_previewLayerWeakReference)
    {
      id v6 = objc_alloc_init((Class)getFBSOrientationObserverClass());
      a3 = [v6 activeInterfaceOrientation];
      if (dword_1E9544D78)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      objc_msgSend(v6, "invalidate", v17, v18);
    }
    switch(a3)
    {
      case 1:
        if (self->_devicePosition == 2) {
          int v8 = v5;
        }
        else {
          int v8 = 1;
        }
        BOOL v9 = v8 == 0;
        double v10 = 270.0;
        double v11 = 90.0;
        goto LABEL_23;
      case 2:
        if (self->_devicePosition == 2) {
          int v13 = v5;
        }
        else {
          int v13 = 1;
        }
        BOOL v9 = v13 == 0;
        double v10 = 90.0;
        double v11 = 270.0;
        goto LABEL_23;
      case 3:
        if (v5) {
          double videoRotationAngleForHorizonLevelCapture = 180.0;
        }
        else {
          double videoRotationAngleForHorizonLevelCapture = 0.0;
        }
        break;
      case 4:
        BOOL v9 = v5 == 0;
        double v10 = 180.0;
        double v11 = 0.0;
LABEL_23:
        if (v9) {
          double videoRotationAngleForHorizonLevelCapture = v10;
        }
        else {
          double videoRotationAngleForHorizonLevelCapture = v11;
        }
        break;
      default:
        if (self->_isInitialVideoRotationAngleForHorizonLevelCaptureSet)
        {
          double videoRotationAngleForHorizonLevelCapture = self->_videoRotationAngleForHorizonLevelCapture;
        }
        else if (self->_previewLayerWeakReference)
        {
          double videoRotationAngleForHorizonLevelCapture = self->_videoRotationAngleForHorizonLevelPreview;
        }
        else
        {
          BOOL v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          double videoRotationAngleForHorizonLevelCapture = 0.0;
        }
        break;
    }
    double v14 = self->_videoRotationAngleForHorizonLevelCapture;
    if (videoRotationAngleForHorizonLevelCapture != v14 || !self->_isInitialVideoRotationAngleForHorizonLevelCaptureSet)
    {
      if (dword_1E9544D78)
      {
        BOOL v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      self->_isInitialVideoRotationAngleForHorizonLevelCaptureSet = 1;
      if (videoRotationAngleForHorizonLevelCapture != v14)
      {
        [(AVCaptureDeviceRotationCoordinator *)self willChangeValueForKey:@"videoRotationAngleForHorizonLevelCapture"];
        self->_double videoRotationAngleForHorizonLevelCapture = videoRotationAngleForHorizonLevelCapture;
        [(AVCaptureDeviceRotationCoordinator *)self didChangeValueForKey:@"videoRotationAngleForHorizonLevelCapture"];
      }
    }
    if (self->_monitorSystemReferenceAngle && self->_previewLayerSystemReferenceAngleMode == 1) {
      [(AVCaptureDeviceRotationCoordinator *)self _updateVideoRotationAngleForHorizonLevelPreview];
    }
  }
  else
  {
    FigDebugAssert3();
  }
}

- (int64_t)_currentDeviceOrientation
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t state64 = 0;
  notify_get_state(self->_deviceOrientationNotificationToken, &state64);
  return state64;
}

- (void)_handleSystemReferenceAngleDidChangeNotification:.cold.1()
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "NSString *getUISSystemReferenceAngleAffectedContextIDsKey(void)"), @"AVCaptureDeviceRotationCoordinator.m", 45, @"%s", dlerror());
  __break(1u);
}

@end