@interface AVCaptureMultiCamSession
+ (BOOL)isMultiCamSupported;
- (AVCaptureMultiCamSession)init;
- (BOOL)_addConnection:(id)a3 exceptionReason:(id *)a4;
- (BOOL)_canAddConnection:(id)a3 failureReason:(id *)a4;
- (BOOL)_canAddInput:(id)a3 failureReason:(id *)a4;
- (BOOL)_canAddOutput:(id)a3 failureReason:(id *)a4;
- (BOOL)canSetSessionPreset:(id)a3;
- (float)_computeISPHardwareCost;
- (float)hardwareCost;
- (float)systemPressureCost;
- (id)_physicalDevicePowerInfoSet;
- (void)_removeConnection:(id)a3;
- (void)_updateCosts;
- (void)_updateHardwareCost;
- (void)_updateSystemPressureCost;
- (void)dealloc;
- (void)handleVideoInputDevice:(id)a3 activeFormatChanged:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)startRunning;
@end

@implementation AVCaptureMultiCamSession

- (AVCaptureMultiCamSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureMultiCamSession;
  v2 = [(AVCaptureSession *)&v5 init];
  v3 = v2;
  if (v2) {
    [(AVCaptureSession *)v2 setSessionPreset:@"AVCaptureSessionPresetInputPriority"];
  }
  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AVCaptureMultiCamSession;
  [(AVCaptureSession *)&v2 dealloc];
}

+ (BOOL)isMultiCamSupported
{
  return AVGestaltGetBoolAnswer(@"AVGQCaptureSessionSupportsMultiCamCapture");
}

- (float)hardwareCost
{
  return self->_hardwareCost;
}

- (float)systemPressureCost
{
  return self->_systemPressureCost;
}

- (void)startRunning
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = [(AVCaptureSession *)self inputs];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = (void *)[*(id *)(*((void *)&v11 + 1) + 8 * v7) videoDevice];
        if (v8)
        {
          v9 = v8;
          if (!objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "isMultiCamSupported"))
          {
            uint64_t v15 = *MEMORY[0x1E4F47B70];
            v16 = v9;
            [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v16 forKeys:&v15 count:1];
            [(AVCaptureSession *)self _postRuntimeError:AVLocalizedError()];
            return;
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)AVCaptureMultiCamSession;
  [(AVCaptureSession *)&v10 startRunning];
}

- (BOOL)canSetSessionPreset:(id)a3
{
  return [a3 isEqual:@"AVCaptureSessionPresetInputPriority"];
}

- (BOOL)_canAddInput:(id)a3 failureReason:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x1A62348E0](self, a2);
  if (!a3)
  {
    v26 = @"Can't add a nil AVCaptureInput";
    goto LABEL_35;
  }
  if ((AVCaptureMultiCamSession *)[a3 session] == self) {
    goto LABEL_38;
  }
  if ([a3 session])
  {
    LOBYTE(a3) = 0;
    v26 = @"An AVCaptureInput instance may not be added to more than one session";
    goto LABEL_35;
  }
  if (([a3 isMemberOfClass:objc_opt_class()] & 1) == 0
    && ([a3 isMemberOfClass:objc_opt_class()] & 1) == 0)
  {
    v28 = NSString;
    v29 = (objc_class *)objc_opt_class();
    v26 = (__CFString *)[v28 stringWithFormat:@"<%@> is an unsupported AVCaptureInput type", NSStringFromClass(v29)];
    LOBYTE(a3) = 0;
    goto LABEL_35;
  }
  v8 = [(AVCaptureSession *)self inputs];
  if ([(NSArray *)v8 containsObject:a3])
  {
LABEL_38:
    LOBYTE(a3) = 0;
    v26 = @"An AVCaptureInput instance may not be added more than once to a session";
    goto LABEL_35;
  }
  context = v7;
  if ([a3 isMemberOfClass:objc_opt_class()])
  {
    uint64_t v9 = [a3 device];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    objc_super v10 = [(AVCaptureSession *)self inputs];
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v37;
      while (2)
      {
        long long v14 = a4;
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v37 != v13) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if ([v16 isMemberOfClass:objc_opt_class()]
            && [v16 device] == v9)
          {
            LOBYTE(a3) = 0;
            a4 = v14;
            uint64_t v7 = context;
            v26 = @"An AVCaptureDevice may only be associated with a session through a single AVCaptureDeviceInput";
            goto LABEL_35;
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v36 objects:v41 count:16];
        a4 = v14;
        if (v12) {
          continue;
        }
        break;
      }
    }
  }
  uint64_t v17 = [a3 videoDevice];
  if (!v17) {
    goto LABEL_45;
  }
  uint64_t v18 = (void *)[MEMORY[0x1E4F1CA80] setWithObject:v17];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v19 = [(NSArray *)v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v8);
        }
        uint64_t v23 = [*(id *)(*((void *)&v32 + 1) + 8 * j) videoDevice];
        if (v23) {
          [v18 addObject:v23];
        }
      }
      uint64_t v20 = [(NSArray *)v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v20);
  }
  if ((unint64_t)[v18 count] >= 2
    && (id v24 = +[AVCaptureDeviceDiscoverySession allVideoDeviceTypes](AVCaptureDeviceDiscoverySession, "allVideoDeviceTypes"), v25 = [+[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:v24 mediaType:*MEMORY[0x1E4F47C68] position:0] supportedMultiCamDeviceSets], v31[0] = MEMORY[0x1E4F143A8], v31[1] = 3221225472, v31[2] = __55__AVCaptureMultiCamSession__canAddInput_failureReason___block_invoke, v31[3] = &unk_1E5A73F68, v31[4] = v18, [(NSArray *)v25 indexOfObjectPassingTest:v31] == 0x7FFFFFFFFFFFFFFFLL))
  {
    LOBYTE(a3) = 0;
    v26 = @"These devices may not be used simultaneously. Use -[AVCaptureDeviceDiscoverySession supportedMultiCamDeviceSets]";
  }
  else
  {
LABEL_45:
    if ([a3 isMemberOfClass:objc_opt_class()]
      && [a3 multichannelAudioMode])
    {
      LOBYTE(a3) = 0;
      v26 = @"The input's multichannel audio mode is not supported by AVCaptureMultiCamSession";
    }
    else
    {
      v26 = 0;
      LOBYTE(a3) = 1;
    }
  }
  uint64_t v7 = context;
LABEL_35:
  if (a4) {
    *a4 = v26;
  }
  return (char)a3;
}

uint64_t __55__AVCaptureMultiCamSession__canAddInput_failureReason___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 isEqualToSet:*(void *)(a1 + 32)];
  if (result) {
    *a4 = 1;
  }
  return result;
}

- (BOOL)_canAddOutput:(id)a3 failureReason:(id *)a4
{
  if (a3)
  {
    if ([a3 session])
    {
      BOOL result = 0;
      v8 = @"An AVCaptureOutput instance may not be added to more than one session";
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL result = 0;
        v8 = @"The deprecated AVCaptureStillImageOutput class may not be used with AVCaptureMultiCamSession. Use AVCapturePhotoOutput instead";
      }
      else
      {
        BOOL v7 = [(NSArray *)[(AVCaptureSession *)self outputs] containsObject:a3];
        v8 = @"An AVCaptureOutput instance may not be added more than once to a session";
        if (!v7) {
          v8 = 0;
        }
        BOOL result = !v7;
      }
    }
  }
  else
  {
    BOOL result = 0;
    v8 = @"Can't add a nil AVCaptureOutput";
  }
  if (a4) {
    *a4 = v8;
  }
  return result;
}

- (BOOL)_canAddConnection:(id)a3 failureReason:(id *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  BOOL v7 = (void *)MEMORY[0x1A62348E0](self, a2);
  v49.receiver = self;
  v49.super_class = (Class)AVCaptureMultiCamSession;
  v50 = 0;
  if ([(AVCaptureSession *)&v49 _canAddConnection:a3 failureReason:&v50])
  {
    long long v32 = v7;
    long long v33 = a4;
    id v8 = +[AVCaptureOutput allOutputSubclasses];
    long long v35 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(a3, "inputPorts"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    obuint64_t j = [(AVCaptureSession *)self connections];
    uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v46;
      uint64_t v34 = *MEMORY[0x1E4F47C40];
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v46 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v14 = [v8 countByEnumeratingWithState:&v41 objects:v52 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v42;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v42 != v16) {
                  objc_enumerationMutation(v8);
                }
                [a3 output];
                if (objc_opt_isKindOfClass())
                {
                  [v13 output];
                  if (objc_opt_isKindOfClass())
                  {
                    int v18 = 1;
                    goto LABEL_18;
                  }
                }
              }
              uint64_t v15 = [v8 countByEnumeratingWithState:&v41 objects:v52 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
          int v18 = 0;
LABEL_18:
          if ([a3 videoPreviewLayer]) {
            BOOL v19 = [v13 videoPreviewLayer] != 0;
          }
          else {
            BOOL v19 = 0;
          }
          if ((v18 | v19) == 1)
          {
            if (objc_msgSend(v35, "intersectsSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", objc_msgSend(v13, "inputPorts"))))
            {
              if ([a3 mediaType] != v34
                || (uint64_t v20 = [a3 output], v20 == objc_msgSend(v13, "output")))
              {
                if (!AVGestaltGetBoolAnswer(@"AVGQCaptureMultipleVideoDataOutputsSupported")
                  || ([a3 output], objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  v27 = NSString;
                  v28 = (objc_class *)objc_opt_class();
                  BOOL v25 = 0;
                  v50 = (void *)[v27 stringWithFormat:@"<%@: %p> references an input port already in use for a video preview layer or output of the same type", NSStringFromClass(v28), a3];
                  goto LABEL_43;
                }
              }
            }
          }
        }
        uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v45 objects:v53 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    [a3 output];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v21 = (void *)[a3 inputPorts];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v51 count:16];
      a4 = v33;
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v38;
        BOOL v7 = v32;
        BOOL v25 = 1;
        while (2)
        {
          for (uint64_t k = 0; k != v23; ++k)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v21);
            }
            if ([*(id *)(*((void *)&v37 + 1) + 8 * k) sourcesFromConstituentDevice])
            {
              v30 = NSString;
              v31 = (objc_class *)objc_opt_class();
              BOOL v25 = 0;
              v50 = (void *)[v30 stringWithFormat:@"<%@: %p> references an input port from a constituent device to an AVCapturePhotoOutput instance", NSStringFromClass(v31), a3];
              goto LABEL_44;
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v51 count:16];
          if (v23) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v25 = 1;
        BOOL v7 = v32;
      }
    }
    else
    {
      BOOL v25 = 1;
LABEL_43:
      BOOL v7 = v32;
      a4 = v33;
    }
  }
  else
  {
    BOOL v25 = 0;
  }
LABEL_44:
  if (a4) {
    *a4 = v50;
  }
  return v25;
}

- (BOOL)_addConnection:(id)a3 exceptionReason:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v17.receiver = self;
  v17.super_class = (Class)AVCaptureMultiCamSession;
  BOOL v6 = [(AVCaptureSession *)&v17 _addConnection:a3 exceptionReason:a4];
  if (v6)
  {
    [a3 addObserver:self forKeyPath:@"enabled" options:3 context:AVCaptureMultiCamSessionConnectionEnabledChangedContext];
    [a3 addObserver:self forKeyPath:@"active" options:3 context:AVCaptureMultiCamSessionConnectionActiveChangedContext];
    [a3 addObserver:self forKeyPath:@"activeVideoStabilizationMode" options:3 context:AVCaptureMultiCamSessionConnectionActiveVideoStabilizationModeChangedContext];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    BOOL v7 = objc_msgSend(a3, "inputPorts", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v13 + 1) + 8 * v11++) addObserver:self forKeyPath:@"enabled" options:3 context:AVCaptureMultiCamSessionConnectedInputPortEnabledChangedContext];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v9);
    }
    [(AVCaptureMultiCamSession *)self _updateCosts];
  }
  return v6;
}

- (void)_removeConnection:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [a3 removeObserver:self forKeyPath:@"enabled" context:AVCaptureMultiCamSessionConnectionEnabledChangedContext];
  [a3 removeObserver:self forKeyPath:@"active" context:AVCaptureMultiCamSessionConnectionActiveChangedContext];
  [a3 removeObserver:self forKeyPath:@"activeVideoStabilizationMode" context:AVCaptureMultiCamSessionConnectionActiveVideoStabilizationModeChangedContext];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = (void *)[a3 inputPorts];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) removeObserver:self forKeyPath:@"enabled" context:AVCaptureMultiCamSessionConnectedInputPortEnabledChangedContext];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)AVCaptureMultiCamSession;
  [(AVCaptureSession *)&v10 _removeConnection:a3];
  [(AVCaptureMultiCamSession *)self _updateCosts];
}

- (void)handleVideoInputDevice:(id)a3 activeFormatChanged:(id)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)[a4 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
  if (-[AVCaptureSession isRunning](self, "isRunning") && ([v7 isMultiCamSupported] & 1) == 0)
  {
    [(AVCaptureSession *)self stopRunning];
    uint64_t v9 = *MEMORY[0x1E4F47B70];
    v10[0] = a3;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [(AVCaptureSession *)self _postRuntimeError:AVLocalizedError()];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVCaptureMultiCamSession;
    [(AVCaptureSession *)&v8 handleVideoInputDevice:a3 activeFormatChanged:a4];
  }
  [(AVCaptureMultiCamSession *)self _updateCosts];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)AVCaptureMultiCamSessionConnectionEnabledChangedContext == a6
    || AVCaptureMultiCamSessionConnectionActiveChangedContext == (void)a6
    || AVCaptureMultiCamSessionConnectedInputPortEnabledChangedContext == (void)a6
    || AVCaptureMultiCamSessionConnectionActiveVideoStabilizationModeChangedContext == (void)a6)
  {
    [(AVCaptureMultiCamSession *)self _updateCosts];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AVCaptureMultiCamSession;
    -[AVCaptureSession observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_updateCosts
{
  v3 = (void *)MEMORY[0x1A62348E0](self, a2);
  [(AVCaptureMultiCamSession *)self _updateHardwareCost];
  [(AVCaptureMultiCamSession *)self _updateSystemPressureCost];
}

- (void)_updateHardwareCost
{
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureMultiCamSession;
  [(AVCaptureSession *)&v6 _totalHardwareCost];
  float v4 = v3;
  [(AVCaptureMultiCamSession *)self _computeISPHardwareCost];
  if (v4 <= v5) {
    float v4 = v5;
  }
  if (v4 != self->_hardwareCost)
  {
    [(AVCaptureMultiCamSession *)self willChangeValueForKey:@"hardwareCost"];
    self->_hardwareCost = v4;
    [(AVCaptureMultiCamSession *)self didChangeValueForKey:@"hardwareCost"];
  }
}

- (float)_computeISPHardwareCost
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v56 = [(AVCaptureSession *)self _devicesProvidingDepthData];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  obuint64_t j = [(AVCaptureSession *)self _livePortSetsByDeviceInput];
  uint64_t v3 = [obj countByEnumeratingWithState:&v86 objects:v94 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int v5 = 0;
    char v6 = 0;
    uint64_t v7 = *(void *)v87;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v87 != v7) {
          objc_enumerationMutation(obj);
        }
        objc_super v9 = *(void **)(*((void *)&v86 + 1) + 8 * i);
        if (((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "device"), "deviceType"), "isEqualToString:", @"AVCaptureDeviceTypeBuiltInUltraWideCamera") & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "device"), "deviceType"), "isEqualToString:", @"AVCaptureDeviceTypeBuiltInDualWideCamera"))&& objc_msgSend((id)objc_msgSend(v9, "device"), "position") == 1)
        {
          int v5 = 1;
        }
        else if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "device"), "deviceType"), "isEqualToString:", @"AVCaptureDeviceTypeDeskViewCamera"))
        {
          v6 |= objc_msgSend((id)objc_msgSend(v9, "device"), "position") == 1;
        }
        if (v5 & 1) != 0 && (v6)
        {
          int v5 = 1;
          goto LABEL_19;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v86 objects:v94 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v5 = 0;
  }
LABEL_19:
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  uint64_t v10 = [obj countByEnumeratingWithState:&v82 objects:v93 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    int v12 = 0;
    int v13 = 0;
    uint64_t v14 = *(void *)v83;
    uint64_t v15 = *MEMORY[0x1E4F47C68];
    float v16 = 0.0;
    int v59 = v5;
    uint64_t v57 = *MEMORY[0x1E4F47C68];
    uint64_t v58 = *(void *)v83;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v83 != v14) {
          objc_enumerationMutation(obj);
        }
        int v18 = *(void **)(*((void *)&v82 + 1) + 8 * j);
        uint64_t v19 = (void *)[v18 device];
        if ([v19 hasMediaType:v15]
          && (v5 & objc_msgSend((id)objc_msgSend(v19, "deviceType"), "isEqualToString:", @"AVCaptureDeviceTypeDeskViewCamera") & 1) == 0)
        {
          int v20 = [v19 isVirtualDevice];
          if (v20) {
            v60 = (void *)[v19 constituentDevices];
          }
          else {
            v60 = 0;
          }
          uint64_t v79 = 0;
          uint64_t v80 = 0;
          uint64_t v81 = 0;
          uint64_t v21 = (void *)[v19 activeFormat];
          if (v21)
          {
            [v21 lowestSupportedVideoFrameDuration];
            int v22 = v80;
            uint64_t v23 = v79;
          }
          else
          {
            uint64_t v23 = 0;
            int v22 = 0;
            uint64_t v79 = 0;
            uint64_t v80 = 0;
            uint64_t v81 = 0;
          }
          float v24 = (float)v22 / (float)v23;
          int v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v19, "activeFormat"), "figCaptureSourceVideoFormat"), "isVideoHDRFusionSupported");
          objc_msgSend((id)objc_msgSend(v19, "activeFormat"), "hardwareCost");
          float v27 = v26;
          if (v25) {
            float v28 = 2.0;
          }
          else {
            float v28 = 1.0;
          }
          uint64_t v76 = 0;
          uint64_t v77 = 0;
          uint64_t v78 = 0;
          int v61 = v13;
          int v62 = v12;
          if (v18)
          {
            [v18 videoMinFrameDurationOverride];
            if ((v77 & 0x100000000) != 0) {
              float v24 = (float)(int)v77 / (float)v76;
            }
          }
          v29 = (void *)[MEMORY[0x1E4F1CA80] set];
          if (v20)
          {
            if ([v56 containsObject:v19])
            {
              if ((__CFString *)[v19 deviceType] != @"AVCaptureDeviceTypeBuiltInLiDARDepthCamera")
              {
                long long v74 = 0u;
                long long v75 = 0u;
                long long v72 = 0u;
                long long v73 = 0u;
                v30 = (void *)[v19 constituentDevices];
                uint64_t v31 = [v30 countByEnumeratingWithState:&v72 objects:v92 count:16];
                if (v31)
                {
                  uint64_t v32 = v31;
                  uint64_t v33 = *(void *)v73;
                  do
                  {
                    for (uint64_t k = 0; k != v32; ++k)
                    {
                      if (*(void *)v73 != v33) {
                        objc_enumerationMutation(v30);
                      }
                      objc_msgSend(v29, "addObject:", objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * k), "deviceType"));
                    }
                    uint64_t v32 = [v30 countByEnumeratingWithState:&v72 objects:v92 count:16];
                  }
                  while (v32);
                }
              }
            }
          }
          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          long long v35 = (void *)[obj objectForKeyedSubscript:v18];
          uint64_t v36 = [v35 countByEnumeratingWithState:&v68 objects:v91 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            uint64_t v38 = *(void *)v69;
            do
            {
              for (uint64_t m = 0; m != v37; ++m)
              {
                if (*(void *)v69 != v38) {
                  objc_enumerationMutation(v35);
                }
                long long v40 = *(void **)(*((void *)&v68 + 1) + 8 * m);
                if ((objc_msgSend(v29, "containsObject:", objc_msgSend(v40, "sourceDeviceType")) & 1) == 0) {
                  objc_msgSend(v29, "addObject:", objc_msgSend(v40, "sourceDeviceType"));
                }
              }
              uint64_t v37 = [v35 countByEnumeratingWithState:&v68 objects:v91 count:16];
            }
            while (v37);
          }
          float v41 = v28 * v27;
          unint64_t v42 = [v29 count];
          unint64_t v43 = v42;
          if (v20)
          {
            int v45 = v61;
            int v44 = v62;
            uint64_t v14 = v58;
            if (objc_msgSend(v29, "containsObject:", objc_msgSend(v19, "deviceType"))) {
              unint64_t v43 = (__PAIR128__(v43, [v60 count]) - v43) >> 64;
            }
            float v16 = v16 + (float)((float)(v41 * (float)v43) * v24);
            int v5 = v59;
            uint64_t v15 = v57;
            if (v43 < [v60 count]) {
              float v16 = v16 + (float)((float)(v41 * (float)([v60 count] - v43)) * 7.0);
            }
          }
          else
          {
            float v16 = v16 + (float)((float)(v41 * (float)v42) * v24);
            int v5 = v59;
            int v45 = v61;
            int v44 = v62;
            uint64_t v15 = v57;
            uint64_t v14 = v58;
          }
          if (CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend((id)objc_msgSend(v19, "activeFormat"), "formatDescription")).width <= 3839)int v46 = 0; {
          else
          }
            int v46 = v43;
          int v12 = v46 + v44;
          int v13 = v45 + v43;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v82 objects:v93 count:16];
    }
    while (v11);
  }
  else
  {
    int v12 = 0;
    int v13 = 0;
    float v16 = 0.0;
  }
  BOOL v47 = v13 <= 2 || v12 <= 1;
  long long v66 = 0u;
  long long v67 = 0u;
  if (v47) {
    float v48 = v16;
  }
  else {
    float v48 = v16 + 1.0;
  }
  long long v64 = 0uLL;
  long long v65 = 0uLL;
  uint64_t v49 = [v56 countByEnumeratingWithState:&v64 objects:v90 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    unint64_t v51 = 0;
    uint64_t v52 = *(void *)v65;
    do
    {
      for (uint64_t n = 0; n != v50; ++n)
      {
        if (*(void *)v65 != v52) {
          objc_enumerationMutation(v56);
        }
        v51 += [*(id *)(*((void *)&v64 + 1) + 8 * n) deviceType] != (void)@"AVCaptureDeviceTypeBuiltInLiDARDepthCamera";
      }
      uint64_t v50 = [v56 countByEnumeratingWithState:&v64 objects:v90 count:16];
    }
    while (v50);
    float v54 = (float)(v51 - 1);
    if (v51 <= 1) {
      float v54 = -0.0;
    }
    return v48 + v54;
  }
  return v48;
}

- (void)_updateSystemPressureCost
{
  v92 = self;
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  int v2 = FigCapturePlatformIdentifier();
  if (v2 >= 7) {
    int v3 = 350;
  }
  else {
    int v3 = 450;
  }
  if (v2 > 11) {
    return;
  }
  uint64_t v4 = (float *)((char *)&_updateSystemPressureCost_allEncoderModels + 8 * v2);
  float v5 = *v4;
  float v6 = v4[1];
  if ((float)(*v4 + v6) == 0.0) {
    return;
  }
  int v96 = v3;
  long long v128 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  obuint64_t j = [(AVCaptureMultiCamSession *)v92 _physicalDevicePowerInfoSet];
  uint64_t v7 = [obj countByEnumeratingWithState:&v128 objects:v136 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v129;
    uint64_t v11 = *MEMORY[0x1E4F47C68];
    uint64_t v98 = *MEMORY[0x1E4F47C40];
    uint64_t v100 = *MEMORY[0x1E4F47C68];
    uint64_t v12 = 125;
    uint64_t v102 = *(void *)v129;
    do
    {
      uint64_t v13 = 0;
      uint64_t v103 = v8;
      do
      {
        if (*(void *)v129 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v128 + 1) + 8 * v13);
        uint64_t v15 = objc_msgSend(v14, "objectForKeyedSubscript:", @"Device", v92);
        if ([v15 hasMediaType:v11])
        {
          uint64_t v16 = v12;
          int v17 = v9;
          int v18 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", @"VISEnabled"), "intValue");
          uint64_t v19 = (void *)[v14 objectForKeyedSubscript:@"ActiveFormat"];
          objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", @"MaxActiveFrameRate"), "floatValue");
          float v21 = v20;
          int v22 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", @"SIFREnabled"), "BOOLValue");
          int v23 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", @"ISPProcessingEnabled"), "BOOLValue");
          int v24 = [v19 baseSensorPowerConsumption];
          int v25 = [v19 variableSensorPowerConsumption];
          if (v22) {
            float v26 = 2.0;
          }
          else {
            float v26 = 1.0;
          }
          if (v23)
          {
            int v27 = objc_msgSend((id)objc_msgSend(v19, "figCaptureSourceVideoFormat"), "isVideoHDRFusionSupported");
            int v28 = [v19 ispPowerConsumption];
            if (v27) {
              float v29 = 2.0;
            }
            else {
              float v29 = 1.0;
            }
            uint64_t v12 = v16 + v21 + (int)(float)(v29 * (float)(v21 * (float)v28));
          }
          else
          {
            uint64_t v12 = v16;
          }
          int v9 = v17 + (int)(float)((float)v24 + (float)((float)(v21 * (float)v25) * v26));
          if (v21 <= 30.0) {
            unsigned int v30 = 3;
          }
          else {
            unsigned int v30 = 2;
          }
          if (v18) {
            uint64_t v31 = v30;
          }
          else {
            uint64_t v31 = 1;
          }
          int v32 = [v15 powerConsumptionAt30FPSForOISMode:v31];
          uint64_t v10 = v102;
          if (v32) {
            v9 += (int)(float)((float)((float)(v21 / 30.0) * v26) * (float)v32);
          }
          uint64_t v8 = v103;
          uint64_t v11 = v100;
        }
        else if ([v15 hasMediaType:v98])
        {
          uint64_t v12 = (v12 + 100);
        }
        else
        {
          uint64_t v12 = v12;
        }
        ++v13;
      }
      while (v8 != v13);
      uint64_t v8 = [obj countByEnumeratingWithState:&v128 objects:v136 count:16];
    }
    while (v8);
  }
  else
  {
    int v9 = 0;
    LODWORD(v12) = 125;
  }
  int v104 = v12;
  int obja = v9;
  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  uint64_t v33 = [(AVCaptureSession *)v92 connections];
  uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v124 objects:v135 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    long long v39 = 0;
    uint64_t v40 = *(void *)v125;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v125 != v40) {
          objc_enumerationMutation(v33);
        }
        unint64_t v42 = *(void **)(*((void *)&v124 + 1) + 8 * i);
        if ([v42 isLive])
        {
          unint64_t v43 = (void *)[v42 sourceDeviceInput];
          int v44 = (void *)[v43 device];
          if ([v44 isBackgroundBlurActive]
            && [v43 isBackgroundBlurAllowed])
          {
            if (!v36) {
              uint64_t v36 = (void *)[MEMORY[0x1E4F1CA80] set];
            }
            [v36 addObject:v44];
          }
          if ([v44 isCenterStageActive]
            && [v43 isCenterStageAllowed])
          {
            if (!v37) {
              uint64_t v37 = (void *)[MEMORY[0x1E4F1CA80] set];
            }
            [v37 addObject:v44];
          }
          if ([v44 isStudioLightActive]
            && [v43 isStudioLightingAllowed])
          {
            if (!v38) {
              uint64_t v38 = (void *)[MEMORY[0x1E4F1CA80] set];
            }
            [v38 addObject:v44];
          }
          if ([v44 canPerformReactionEffects]
            && [v43 reactionEffectsAllowed])
          {
            if (!v39) {
              long long v39 = (void *)[MEMORY[0x1E4F1CA80] set];
            }
            [v39 addObject:v44];
          }
        }
      }
      uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v124 objects:v135 count:16];
    }
    while (v35);
  }
  else
  {
    uint64_t v36 = 0;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    long long v39 = 0;
  }
  int v45 = [v36 count];
  int v46 = [v37 count];
  int v47 = [v38 count];
  int v48 = [v39 count];
  long long v120 = 0u;
  long long v121 = 0u;
  unsigned int v49 = v104 + 260 * v46 + 50 * v48 + (v47 + v45) * v96;
  long long v122 = 0u;
  long long v123 = 0u;
  id v94 = (id)[v93 connections];
  uint64_t v97 = [v94 countByEnumeratingWithState:&v120 objects:v134 count:16];
  if (!v97) {
    goto LABEL_121;
  }
  uint64_t v95 = *(void *)v121;
  uint64_t v50 = *MEMORY[0x1E4F47C48];
  uint64_t v51 = *MEMORY[0x1E4F47C68];
  do
  {
    uint64_t v52 = 0;
    do
    {
      if (*(void *)v121 != v95) {
        objc_enumerationMutation(v94);
      }
      v53 = *(void **)(*((void *)&v120 + 1) + 8 * v52);
      [v53 output];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v99 = v53;
        uint64_t v101 = v52;
        long long v118 = 0u;
        long long v119 = 0u;
        long long v116 = 0u;
        long long v117 = 0u;
        float v54 = (void *)[v53 inputPorts];
        uint64_t v55 = [v54 countByEnumeratingWithState:&v116 objects:v133 count:16];
        if (!v55) {
          goto LABEL_97;
        }
        uint64_t v56 = v55;
        uint64_t v57 = *(void *)v117;
        while (1)
        {
          for (uint64_t j = 0; j != v56; ++j)
          {
            if (*(void *)v117 != v57) {
              objc_enumerationMutation(v54);
            }
            int v59 = *(void **)(*((void *)&v116 + 1) + 8 * j);
            if (objc_msgSend((id)objc_msgSend(v59, "mediaType"), "isEqual:", v51))
            {
              v60 = (void *)[v59 input];
              int v61 = objc_msgSend((id)objc_msgSend(v60, "videoDevice"), "activeFormat");
              CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[v61 formatDescription]);
              long long v114 = 0uLL;
              uint64_t v115 = 0;
              if (v60)
              {
                [v60 videoMinFrameDurationOverride];
                if ((v112 & 0x100000000) != 0)
                {
                  [v60 videoMinFrameDurationOverride];
                  goto LABEL_86;
                }
              }
              else
              {
                uint64_t v111 = 0;
                uint64_t v112 = 0;
                uint64_t v113 = 0;
              }
              if (v61)
              {
                [v61 lowestSupportedVideoFrameDuration];
              }
              else
              {
                long long v114 = 0uLL;
                uint64_t v115 = 0;
              }
LABEL_86:
              int v63 = DWORD2(v114);
              uint64_t v64 = v114;
              objc_msgSend((id)objc_msgSend(v61, "figCaptureSourceVideoFormat"), "format");
              if (FigCapturePixelFormatIsTenBit()) {
                float v65 = 1.25;
              }
              else {
                float v65 = 1.0;
              }
              objc_msgSend((id)objc_msgSend(v61, "figCaptureSourceVideoFormat"), "format");
              if (FigCapturePixelFormatIs422()) {
                float v65 = (float)(v65 * 4.0) / 3.0;
              }
              v49 += (int)(float)(v5
                                + (float)((float)((float)((float)((float)v63 / (float)v64)
                                                        * (float)(Dimensions.height * Dimensions.width))
                                                * (float)(v6 * v65))
                                        / 1000000.0));
              continue;
            }
          }
          uint64_t v56 = [v54 countByEnumeratingWithState:&v116 objects:v133 count:16];
          if (!v56)
          {
LABEL_97:
            if ([v99 activeVideoStabilizationMode]) {
              v49 += 20;
            }
            uint64_t v52 = v101;
            goto LABEL_100;
          }
        }
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v99 = v53;
        uint64_t v101 = v52;
        goto LABEL_97;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v109 = 0u;
        long long v110 = 0u;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v66 = (void *)[v53 inputPorts];
        uint64_t v67 = [v66 countByEnumeratingWithState:&v107 objects:v132 count:16];
        if (v67)
        {
          uint64_t v68 = v67;
          uint64_t v69 = *(void *)v108;
          do
          {
            for (uint64_t k = 0; k != v68; ++k)
            {
              if (*(void *)v108 != v69) {
                objc_enumerationMutation(v66);
              }
              long long v71 = *(void **)(*((void *)&v107 + 1) + 8 * k);
              if (objc_msgSend((id)objc_msgSend(v71, "mediaType"), "isEqual:", v50))
              {
                long long v72 = (void *)[v71 input];
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v72, "videoDevice"), "deviceType"), "isEqualToString:", @"AVCaptureDeviceTypeBuiltInTrueDepthCamera"))
                {
                  long long v73 = (void *)[v72 device];
                  long long v114 = 0uLL;
                  uint64_t v115 = 0;
                  long long v74 = (void *)[v73 activeDepthDataFormat];
                  if (v74)
                  {
                    [v74 lowestSupportedVideoFrameDuration];
                  }
                  else
                  {
                    long long v114 = 0uLL;
                    uint64_t v115 = 0;
                  }
                  if (v72)
                  {
                    [v72 videoMinFrameDurationOverride];
                    if ((unsigned __int128)0 >> 96)
                    {
                      long long v114 = 0uLL;
                      uint64_t v115 = 0;
                    }
                  }
                  int obja = (int)(float)((float)((float)((float)SDWORD2(v114) / (float)(uint64_t)v114) * 22.467)
                                    + (float)obja);
                }
              }
            }
            uint64_t v68 = [v66 countByEnumeratingWithState:&v107 objects:v132 count:16];
          }
          while (v68);
        }
      }
LABEL_100:
      ++v52;
    }
    while (v52 != v97);
    uint64_t v75 = [v94 countByEnumeratingWithState:&v120 objects:v134 count:16];
    uint64_t v97 = v75;
  }
  while (v75);
LABEL_121:
  unsigned int v76 = (float)((float)v49 * 1.2);
  unsigned int v77 = (float)((float)obja * 1.25);
  unsigned int v78 = ((double)v76 / 0.835 * 0.165);
  unsigned int v79 = ((double)v77 * 0.25) + v76;
  if (avcmcs_computeSystemPressureCost_sSlopeIndicesOnce != -1) {
    dispatch_once(&avcmcs_computeSystemPressureCost_sSlopeIndicesOnce, &__block_literal_global_14);
  }
  unsigned int v80 = v79 + v78;
  uint64_t ModelSpecificName = FigCaptureGetModelSpecificName();
  uint64_t v82 = 0;
  while (![(id)avcmcs_computeSystemPressureCost_allSlopes[v82] containsObject:ModelSpecificName])
  {
    v82 += 4;
    if (v82 == 32)
    {
      float v83 = 0.0;
      goto LABEL_136;
    }
  }
  long long v84 = (float *)&avcmcs_computeSystemPressureCost_allSlopes[v82];
  float v85 = (float)v77;
  float v86 = *((float *)&avcmcs_computeSystemPressureCost_allSlopes[v82 + 1] + 1)
      + (float)(*(float *)&avcmcs_computeSystemPressureCost_allSlopes[v82 + 1] * (float)v77);
  float v87 = (float)v80;
  if (v86 >= (float)v80
    || (float v88 = v84[5] + (float)(v84[4] * v85), v89 = v84[7] + (float)(v84[6] * v85), v89 == 0.0) && v88 == 0.0)
  {
    float v83 = v87 / v86;
  }
  else
  {
    if (v88 >= v87 || v89 == 0.0)
    {
      float v90 = (float)(v87 - v86) / (float)(v88 - v86);
      float v91 = 1.0;
    }
    else
    {
      float v90 = (float)(v87 - v88) / (float)(v89 - v88);
      float v91 = 2.0;
    }
    float v83 = v90 + v91;
  }
LABEL_136:
  if (v83 != v93[5])
  {
    [v93 willChangeValueForKey:@"systemPressureCost"];
    v93[5] = v83;
    [v93 didChangeValueForKey:@"systemPressureCost"];
  }
}

- (id)_physicalDevicePowerInfoSet
{
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  v99 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  id v85 = (id)[MEMORY[0x1E4F1CA80] set];
  long long v136 = 0u;
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  obuint64_t j = [(AVCaptureSession *)self connections];
  uint64_t v72 = [(NSArray *)obj countByEnumeratingWithState:&v136 objects:v153 count:16];
  int v3 = 0;
  if (v72)
  {
    uint64_t v71 = *(void *)v137;
    uint64_t v4 = *MEMORY[0x1E4F47C68];
    id v78 = (id)*MEMORY[0x1E4F47C40];
    uint64_t v74 = *MEMORY[0x1E4F47C48];
    uint64_t v75 = *MEMORY[0x1E4F47C68];
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v137 != v71)
        {
          uint64_t v6 = v5;
          objc_enumerationMutation(obj);
          uint64_t v5 = v6;
        }
        uint64_t v73 = v5;
        uint64_t v7 = *(void **)(*((void *)&v136 + 1) + 8 * v5);
        [v7 output];
        id v92 = v7;
        if ([v7 isActive])
        {
          if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            || ([v7 isEnabled] & 1) != 0
            || [v7 isLive])
          {
            long long v134 = 0u;
            long long v135 = 0u;
            long long v132 = 0u;
            long long v133 = 0u;
            id v80 = (id)[v7 inputPorts];
            uint64_t v8 = [v80 countByEnumeratingWithState:&v132 objects:v152 count:16];
            if (v8)
            {
              uint64_t v9 = v8;
              uint64_t v10 = *(void *)v133;
              uint64_t v76 = *(void *)v133;
              do
              {
                uint64_t v11 = 0;
                uint64_t v77 = v9;
                do
                {
                  if (*(void *)v133 != v10) {
                    objc_enumerationMutation(v80);
                  }
                  uint64_t v12 = *(void **)(*((void *)&v132 + 1) + 8 * v11);
                  float v90 = (void *)[v12 input];
                  uint64_t v13 = (void *)[v90 videoDevice];
                  if ([v13 hasMediaType:v4])
                  {
                    if ([v13 isVirtualDevice]
                      && objc_msgSend((id)objc_msgSend(v12, "mediaType"), "isEqual:", v74))
                    {
                      uint64_t v14 = (void *)[v13 constituentDevices];
                    }
                    else
                    {
                      uint64_t v15 = [v12 sourceDeviceType];
                      uint64_t v16 = [v13 deviceType];
                      uint64_t v17 = (uint64_t)v13;
                      if (v15 != v16) {
                        uint64_t v17 = [v13 constituentDeviceWithDeviceType:v15];
                      }
                      uint64_t v151 = v17;
                      uint64_t v14 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v151 count:1];
                    }
                    long long v130 = 0u;
                    long long v131 = 0u;
                    long long v128 = 0u;
                    long long v129 = 0u;
                    id v88 = v14;
                    uint64_t v97 = [v14 countByEnumeratingWithState:&v128 objects:v150 count:16];
                    if (v97)
                    {
                      float v86 = v13;
                      float v83 = v3;
                      uint64_t v95 = *(void *)v129;
                      do
                      {
                        uint64_t v18 = 0;
                        do
                        {
                          if (*(void *)v129 != v95) {
                            objc_enumerationMutation(v88);
                          }
                          uint64_t v102 = v18;
                          uint64_t v19 = *(void **)(*((void *)&v128 + 1) + 8 * v18);
                          uint64_t v20 = [v19 deviceType];
                          uint64_t v21 = [v19 uniqueID];
                          int v22 = (void *)[v99 objectForKeyedSubscript:v21];
                          if (!v22)
                          {
                            int v22 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
                            [v99 setObject:v22 forKeyedSubscript:v21];
                            [v22 setObject:v86 forKeyedSubscript:@"VideoDevice"];
                            objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA80], "set"), @"SourceDeviceTypesInUse");
                            objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"), @"VISEnabledForSourceDeviceType");
                            long long v126 = 0uLL;
                            uint64_t v127 = 0;
                            int v23 = (void *)[v86 activeFormat];
                            if (v23)
                            {
                              [v23 lowestSupportedVideoFrameDuration];
                            }
                            else
                            {
                              long long v126 = 0uLL;
                              uint64_t v127 = 0;
                            }
                            long long v124 = 0uLL;
                            uint64_t v125 = 0;
                            if (v90)
                            {
                              [v90 videoMinFrameDurationOverride];
                              if (BYTE12(v124))
                              {
                                HIDWORD(v24) = DWORD1(v124);
                                long long v126 = v124;
                                uint64_t v127 = v125;
                              }
                            }
                            *(float *)&double v24 = (float)SDWORD2(v126) / (float)(uint64_t)v126;
                            objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v24), @"MaxActiveFrameRate");
                          }
                          objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", @"SourceDeviceTypesInUse"), "addObject:", v20);
                          if ([v92 activeVideoStabilizationMode])
                          {
                            if (objc_msgSend((id)objc_msgSend(v19, "constituentDevices"), "count"))
                            {
                              long long v122 = 0u;
                              long long v123 = 0u;
                              long long v120 = 0u;
                              long long v121 = 0u;
                              int v25 = (void *)[v19 constituentDevices];
                              uint64_t v26 = [v25 countByEnumeratingWithState:&v120 objects:v149 count:16];
                              if (v26)
                              {
                                uint64_t v27 = v26;
                                uint64_t v28 = *(void *)v121;
                                do
                                {
                                  for (uint64_t i = 0; i != v27; ++i)
                                  {
                                    if (*(void *)v121 != v28) {
                                      objc_enumerationMutation(v25);
                                    }
                                    objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", @"VISEnabledForSourceDeviceType"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", 1), objc_msgSend(*(id *)(*((void *)&v120 + 1) + 8 * i), "deviceType"));
                                  }
                                  uint64_t v27 = [v25 countByEnumeratingWithState:&v120 objects:v149 count:16];
                                }
                                while (v27);
                              }
                            }
                            else
                            {
                              objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", @"VISEnabledForSourceDeviceType"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", 1), v20);
                            }
                          }
                          uint64_t v18 = v102 + 1;
                        }
                        while (v102 + 1 != v97);
                        uint64_t v97 = [v88 countByEnumeratingWithState:&v128 objects:v150 count:16];
                      }
                      while (v97);
                      int v3 = v83;
                      uint64_t v4 = v75;
                      uint64_t v10 = v76;
                      uint64_t v9 = v77;
                    }
                  }
                  else if (([v13 hasMediaType:v78] & (v3 == 0)) != 0)
                  {
                    int v3 = v13;
                  }
                  ++v11;
                }
                while (v11 != v9);
                uint64_t v9 = [v80 countByEnumeratingWithState:&v132 objects:v152 count:16];
              }
              while (v9);
            }
          }
        }
        uint64_t v5 = v73 + 1;
      }
      while (v73 + 1 != v72);
      uint64_t v72 = [(NSArray *)obj countByEnumeratingWithState:&v136 objects:v153 count:16];
    }
    while (v72);
  }
  long long v84 = v3;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  id v79 = (id)[v99 allValues];
  uint64_t v82 = [v79 countByEnumeratingWithState:&v116 objects:v148 count:16];
  if (v82)
  {
    id v81 = *(id *)v117;
    do
    {
      uint64_t v30 = 0;
      do
      {
        if (*(id *)v117 != v81) {
          objc_enumerationMutation(v79);
        }
        float v91 = *(void **)(*((void *)&v116 + 1) + 8 * v30);
        uint64_t v31 = (void *)[v91 objectForKeyedSubscript:@"VideoDevice"];
        int v32 = (void *)[v31 activeFormat];
        long long v126 = 0uLL;
        uint64_t v127 = 0;
        uint64_t v98 = v32;
        if (v32)
        {
          [v32 lowestSupportedVideoFrameDuration];
          int v33 = DWORD2(v126);
          uint64_t v34 = v126;
        }
        else
        {
          uint64_t v34 = 0;
          int v33 = 0;
        }
        uint64_t v87 = v30;
        float v35 = (float)v33 / (float)v34;
        uint64_t v36 = (void *)[v91 objectForKeyedSubscript:@"MaxActiveFrameRate"];
        float v37 = v35;
        if (v36)
        {
          [v36 floatValue];
          float v37 = v38;
        }
        int v39 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v31, "activeFormat"), "figCaptureSourceVideoFormat"), "isVideoHDRFusionSupported");
        unsigned int v96 = [v31 isVideoHDREnabled] | v39;
        uint64_t v40 = (void *)[v91 objectForKeyedSubscript:@"SourceDeviceTypesInUse"];
        uint64_t v103 = v40;
        if (objc_msgSend((id)objc_msgSend(v31, "constituentDevices"), "count")
          && objc_msgSend(v40, "containsObject:", objc_msgSend(v31, "deviceType")))
        {
          unsigned int v41 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v91, "objectForKeyedSubscript:", @"VISEnabledForSourceDeviceType"), "objectForKeyedSubscript:", objc_msgSend(v31, "deviceType")), "BOOLValue");
          if (v35 <= 30.0) {
            int v42 = 3;
          }
          else {
            int v42 = 2;
          }
          long long v112 = 0u;
          long long v113 = 0u;
          unsigned int v89 = v41;
          if (!v41) {
            int v42 = 1;
          }
          unsigned int v100 = v42;
          long long v114 = 0uLL;
          long long v115 = 0uLL;
          id v93 = v31;
          unint64_t v43 = (void *)[v31 constituentDevices];
          uint64_t v44 = [v43 countByEnumeratingWithState:&v112 objects:v147 count:16];
          if (v44)
          {
            uint64_t v45 = v44;
            int v46 = 0;
            int v47 = 0;
            uint64_t v48 = *(void *)v113;
            if (v96) {
              float v49 = 2.0;
            }
            else {
              float v49 = 1.0;
            }
            do
            {
              for (uint64_t j = 0; j != v45; ++j)
              {
                if (*(void *)v113 != v48) {
                  objc_enumerationMutation(v43);
                }
                uint64_t v51 = *(void **)(*((void *)&v112 + 1) + 8 * j);
                if ((objc_msgSend(v40, "containsObject:", objc_msgSend(v51, "deviceType")) & 1) == 0)
                {
                  uint64_t v52 = avcmcs_constituentDeviceFormatFromVirtualDeviceFormat(v98, v51);
                  float v53 = (float)(int)[v52 baseSensorPowerConsumption];
                  LODWORD(v52) = (int)(float)(v53
                                            + (float)((float)(v37
                                                            * (float)(int)[v52 variableSensorPowerConsumption])* v49));
                  int v54 = v52
                      + (int)(float)((float)((float)(v37 / 30.0) * v49)
                                   * (float)(int)[v51 powerConsumptionAt30FPSForOISMode:v100]);
                  uint64_t v40 = v103;
                  if (v54 > v47)
                  {
                    int v46 = v51;
                    int v47 = v54;
                  }
                }
              }
              uint64_t v45 = [v43 countByEnumeratingWithState:&v112 objects:v147 count:16];
            }
            while (v45);
          }
          else
          {
            int v46 = 0;
          }
          uint64_t v31 = v93;
          objc_msgSend(v40, "removeObject:", objc_msgSend(v93, "deviceType"));
          if (v46)
          {
            objc_msgSend(v40, "addObject:", objc_msgSend(v46, "deviceType"));
            objc_msgSend((id)objc_msgSend(v91, "objectForKeyedSubscript:", @"VISEnabledForSourceDeviceType"), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", v89), objc_msgSend(v46, "deviceType"));
          }
        }
        uint64_t v55 = (void *)[v31 constituentDevices];
        if (![v55 count])
        {
          v146 = v31;
          uint64_t v55 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:&v146 count:1];
        }
        long long v110 = 0u;
        long long v111 = 0u;
        long long v108 = 0u;
        long long v109 = 0u;
        uint64_t v56 = [v55 countByEnumeratingWithState:&v108 objects:v145 count:16];
        if (v56)
        {
          uint64_t v57 = v56;
          uint64_t v101 = *(void *)v109;
          id v94 = v55;
          do
          {
            for (uint64_t k = 0; k != v57; ++k)
            {
              if (*(void *)v109 != v101) {
                objc_enumerationMutation(v94);
              }
              int v59 = *(void **)(*((void *)&v108 + 1) + 8 * k);
              uint64_t v60 = objc_msgSend(v40, "containsObject:", objc_msgSend(v59, "deviceType"));
              long long v104 = 0u;
              long long v105 = 0u;
              long long v106 = 0u;
              long long v107 = 0u;
              uint64_t v61 = [v85 countByEnumeratingWithState:&v104 objects:v144 count:16];
              if (v61)
              {
                uint64_t v62 = v61;
                uint64_t v63 = *(void *)v105;
LABEL_99:
                uint64_t v64 = 0;
                while (1)
                {
                  if (*(void *)v105 != v63) {
                    objc_enumerationMutation(v85);
                  }
                  float v65 = *(void **)(*((void *)&v104 + 1) + 8 * v64);
                  if ((void *)[v65 objectForKeyedSubscript:@"Device"] == v59) {
                    break;
                  }
                  if (v62 == ++v64)
                  {
                    uint64_t v62 = [v85 countByEnumeratingWithState:&v104 objects:v144 count:16];
                    if (v62) {
                      goto LABEL_99;
                    }
                    goto LABEL_109;
                  }
                }
                if (!v65) {
                  goto LABEL_109;
                }
                if (v60)
                {
                  [v85 removeObject:v65];
                  goto LABEL_110;
                }
              }
              else
              {
LABEL_109:
                if (v60)
                {
LABEL_110:
                  uint64_t v66 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v91, "objectForKeyedSubscript:", @"VISEnabledForSourceDeviceType"), "objectForKeyedSubscript:", objc_msgSend(v59, "deviceType")), "BOOLValue");
                  uint64_t v67 = (int)v37;
                }
                else
                {
                  uint64_t v66 = 0;
                  uint64_t v67 = 7;
                }
                uint64_t v68 = avcmcs_constituentDeviceFormatFromVirtualDeviceFormat(v98, v59);
                v143[0] = v59;
                v142[0] = @"Device";
                v142[1] = @"VISEnabled";
                v143[1] = [NSNumber numberWithBool:v66];
                v143[2] = v68;
                v142[2] = @"ActiveFormat";
                v142[3] = @"MaxActiveFrameRate";
                v143[3] = [NSNumber numberWithInt:v67];
                v142[4] = @"ISPProcessingEnabled";
                v143[4] = [NSNumber numberWithBool:v60];
                v142[5] = @"SIFREnabled";
                v143[5] = [NSNumber numberWithBool:v96];
                objc_msgSend(v85, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v143, v142, 6));
              }
              uint64_t v40 = v103;
            }
            uint64_t v57 = [v94 countByEnumeratingWithState:&v108 objects:v145 count:16];
          }
          while (v57);
        }
        uint64_t v30 = v87 + 1;
      }
      while (v87 + 1 != v82);
      uint64_t v82 = [v79 countByEnumeratingWithState:&v116 objects:v148 count:16];
    }
    while (v82);
  }
  if (v84)
  {
    v140 = @"Device";
    v141 = v84;
    objc_msgSend(v85, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1));
  }
  return v85;
}

@end