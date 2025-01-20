@interface AUiPodEQViewController
- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5;
- (int64_t)numberOfComponentsInPickerView:(id)a3;
- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4;
- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5;
- (void)priv_eventListener:(void *)a3 event:(const AudioUnitEvent *)a4 value:(float)a5;
- (void)synchronizeUIWithParameterValues;
- (void)viewDidLoad;
@end

@implementation AUiPodEQViewController

- (void)viewDidLoad
{
  v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 loadNibNamed:@"AUiPodEQViewController" owner:self options:0];
  topLevelObjects = self->super.topLevelObjects;
  self->super.topLevelObjects = v4;

  v6.receiver = self;
  v6.super_class = (Class)AUiPodEQViewController;
  [(AUAppleViewControllerBase *)&v6 viewDidLoad];
}

- (void)synchronizeUIWithParameterValues
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  outData[0] = 0;
  outData[1] = 0;
  UInt32 ioDataSize = 16;
  if (!AudioUnitGetProperty(self->super.AU, 0x24u, 0, 0, outData, &ioDataSize)) {
    [(UIPickerView *)self->picker selectRow:SLODWORD(outData[0]) inComponent:0 animated:1];
  }
  if (self->super.AU && !self->super.eventListener)
  {
    Current = CFRunLoopGetCurrent();
    OSStatus v4 = AUEventListenerCreate((AUEventListenerProc)EventListenerDispatcher, self, Current, (CFStringRef)*MEMORY[0x263EFFE78], 0.05, 0.05, &self->super.eventListener);
    if (v4)
    {
      OSStatus v5 = v4;
      objc_super v6 = +[AUAppleViewControllerBase customViewLogger];
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

        return;
      }
      inEvent.mEventType = 67109120;
      *((_DWORD *)&inEvent.mEventType + 1) = v5;
      v7 = "Error creating event listener: %d, [AUiPodEQViewController synchronizeUIWIthParameterValues]";
      p_AudioUnitEvent inEvent = (uint8_t *)&inEvent;
    }
    else
    {
      memset(&inEvent, 0, sizeof(inEvent));
      AU = self->super.AU;
      inEvent.mEventType = kAudioUnitEvent_PropertyChange;
      inEvent.mArgument.mParameter.mAudioUnit = AU;
      inEvent.mArgument.mParameter.mParameterID = 36;
      inEvent.mArgument.mParameter.mElement = 0;
      if (!AUEventListenerAddEventType(self->super.eventListener, self, &inEvent)) {
        return;
      }
      objc_super v6 = +[AUAppleViewControllerBase customViewLogger];
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 67109120;
      int v13 = 0;
      v7 = "Error adding event listener for kAudioUnitProperty_PresentPreset: %d, [AUiPodEQViewController synchronizeUIWI"
           "thParameterValues]";
      p_AudioUnitEvent inEvent = buf;
    }
    _os_log_impl(&dword_21E523000, v6, OS_LOG_TYPE_ERROR, v7, p_inEvent, 8u);
    goto LABEL_12;
  }
}

- (void)priv_eventListener:(void *)a3 event:(const AudioUnitEvent *)a4 value:(float)a5
{
  if (a4->mEventType == kAudioUnitEvent_PropertyChange)
  {
    if (a4->mArgument.mParameter.mParameterID == 36)
    {
      long long outData = 0uLL;
      UInt32 ioDataSize = 16;
      if (!AudioUnitGetProperty(self->super.AU, 0x24u, 0, 0, &outData, &ioDataSize))
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __57__AUiPodEQViewController_priv_eventListener_event_value___block_invoke;
        block[3] = &unk_2644B0268;
        block[4] = self;
        long long v8 = outData;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AUiPodEQViewController;
    -[AUAppleViewControllerBase priv_eventListener:event:value:](&v6, sel_priv_eventListener_event_value_, a3);
  }
}

uint64_t __57__AUiPodEQViewController_priv_eventListener_event_value___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1032) selectRow:*(int *)(a1 + 40) inComponent:0 animated:1];
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return 23;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  OSStatus v5 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", a4, a5, a4);
  objc_super v6 = +[AUAppleViewControllerBase getLocalizedString:v5];

  return v6;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  CFArrayRef outData = 0;
  UInt32 ioDataSize = 8;
  if (AudioUnitGetProperty(self->super.AU, 0x18u, 0, 0, &outData, &ioDataSize)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = outData == 0;
  }
  if (!v7)
  {
    if (CFArrayGetCount(outData) > a4)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(outData, a4);
      if (ValueAtIndex)
      {
        OSStatus v9 = AudioUnitSetProperty(self->super.AU, 0x24u, 0, 0, ValueAtIndex, 0x10u);
        if (v9)
        {
          OSStatus v10 = v9;
          v11 = +[AUAppleViewControllerBase customViewLogger];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            int v15 = a4;
            __int16 v16 = 1024;
            OSStatus v17 = v10;
            _os_log_impl(&dword_21E523000, v11, OS_LOG_TYPE_ERROR, "Unable to set preset %d: %d, [AUiPodEQViewController pickerView:didSelectRow:inComponent:]", buf, 0xEu);
          }
        }
      }
    }
    CFRelease(outData);
  }
}

- (void).cxx_destruct
{
}

@end