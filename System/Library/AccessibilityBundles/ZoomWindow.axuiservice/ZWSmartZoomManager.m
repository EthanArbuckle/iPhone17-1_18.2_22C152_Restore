@interface ZWSmartZoomManager
- (AVSpeechSynthesizer)synthesizer;
- (AXElement)focusElement;
- (BOOL)isEnabled;
- (BOOL)setNativeFocusOnBestElementNearRect:(CGRect)a3;
- (CGRect)focusRect;
- (ZWSmartZoomDelegate)delegate;
- (__AXObserver)accessibilityRuntimeObserver;
- (id)_accessibilityRuntimeNotifications;
- (id)_elementForFocus;
- (void)_accessibilitySystemServerDied;
- (void)_handleFirstResponderChangedNotification;
- (void)_handleNativeFocusItemChangedNotification:(void *)a3;
- (void)_handleUpdateElementVisualsNotification;
- (void)_initializeAccessibility;
- (void)_registerForAccessibilityRuntimeNotifications;
- (void)_speakFocusedElement;
- (void)_unregisterForAccessibilityRuntimeNotifications;
- (void)_updateApplicationAccessibility:(BOOL)a3;
- (void)dealloc;
- (void)disableSmartZoom;
- (void)enableSmartZoom;
- (void)setAccessibilityRuntimeObserver:(__AXObserver *)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFocusElement:(id)a3;
- (void)setSynthesizer:(id)a3;
- (void)speakContent;
@end

@implementation ZWSmartZoomManager

- (void)dealloc
{
  [(ZWSmartZoomManager *)self disableSmartZoom];
  if ([(ZWSmartZoomManager *)self accessibilityRuntimeObserver])
  {
    CFRelease([(ZWSmartZoomManager *)self accessibilityRuntimeObserver]);
    [(ZWSmartZoomManager *)self setAccessibilityRuntimeObserver:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)ZWSmartZoomManager;
  [(ZWSmartZoomManager *)&v3 dealloc];
}

- (void)enableSmartZoom
{
  if (![(ZWSmartZoomManager *)self isEnabled])
  {
    [(ZWSmartZoomManager *)self _initializeAccessibility];
    [(ZWSmartZoomManager *)self _registerForAccessibilityRuntimeNotifications];
    [(ZWSmartZoomManager *)self setEnabled:1];
  }
}

- (void)disableSmartZoom
{
  if ([(ZWSmartZoomManager *)self isEnabled])
  {
    [(ZWSmartZoomManager *)self _unregisterForAccessibilityRuntimeNotifications];
    [(ZWSmartZoomManager *)self _updateApplicationAccessibility:0];
    [(ZWSmartZoomManager *)self setEnabled:0];
  }
}

- (void)_speakFocusedElement
{
  AXOverrideRequestingClientType();
  objc_super v3 = [(ZWSmartZoomManager *)self synthesizer];
  unsigned int v4 = [v3 isSpeaking];

  if (v4)
  {
    v5 = [(ZWSmartZoomManager *)self synthesizer];
    [v5 stopSpeakingAtBoundary:1];
  }
  else
  {
    v6 = [(ZWSmartZoomManager *)self focusElement];
    v7 = [v6 application];

    v28 = v7;
    v8 = [v7 explorerElements];
    v9 = +[NSMutableOrderedSet orderedSet];
    v10 = [(ZWSmartZoomManager *)self focusElement];
    v11 = [v10 label];

    v12 = [(ZWSmartZoomManager *)self focusElement];
    v13 = [v12 value];

    if (v11) {
      [v9 addObject:v11];
    }
    if (v13) {
      [v9 addObject:v13];
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v14 = v8;
    id v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v30;
      do
      {
        v18 = 0;
        v19 = v13;
        v20 = v11;
        do
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v14);
          }
          v21 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v18);
          v11 = [v21 label];

          v13 = [v21 value];

          if (v11) {
            [v9 addObject:v11];
          }
          if (v13) {
            [v9 addObject:v13];
          }
          v18 = (char *)v18 + 1;
          v19 = v13;
          v20 = v11;
        }
        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v16);
    }

    v22 = [v9 array];
    v23 = [v22 componentsJoinedByString:@"\n\n"];

    if ([v23 length])
    {
      v24 = +[AVSpeechUtterance speechUtteranceWithString:v23];
      double v25 = AVSpeechUtteranceDefaultSpeechRate + 0.08;
      *(float *)&double v25 = v25;
      [v24 setRate:v25];
      LODWORD(v26) = 1061997773;
      [v24 setVolume:v26];
      v27 = [(ZWSmartZoomManager *)self synthesizer];
      [v27 speakUtterance:v24];
    }
  }
  AXOverrideRequestingClientType();
}

- (void)speakContent
{
  objc_super v3 = [(ZWSmartZoomManager *)self synthesizer];

  if (!v3)
  {
    id v4 = objc_alloc_init((Class)AVSpeechSynthesizer);
    [(ZWSmartZoomManager *)self setSynthesizer:v4];

    v5 = [(ZWSmartZoomManager *)self synthesizer];
    [v5 setDelegate:self];
  }

  [(ZWSmartZoomManager *)self _speakFocusedElement];
}

- (CGRect)focusRect
{
  AXOverrideRequestingClientType();
  objc_super v3 = [(ZWSmartZoomManager *)self focusElement];

  if (!v3)
  {
    id v4 = [(ZWSmartZoomManager *)self _elementForFocus];
    [(ZWSmartZoomManager *)self setFocusElement:v4];
  }
  v5 = [(ZWSmartZoomManager *)self focusElement];
  v6 = [v5 uiElement];
  [v6 rectWithAXAttribute:2149];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  AXOverrideRequestingClientType();
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)_elementForFocus
{
  v2 = +[AXElement systemWideElement];
  objc_super v3 = [v2 systemApplication];
  id v4 = [v3 currentApplications];
  v5 = [v4 firstObject];

  v6 = [v5 nativeFocusElement];

  return v6;
}

- (BOOL)setNativeFocusOnBestElementNearRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  AXOverrideRequestingClientType();
  double v7 = +[AXElement systemWideElement];
  double v8 = [v7 systemApplication];
  double v9 = [v8 currentApplications];
  double v10 = [v9 firstObject];

  [v10 visibleElements];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v37;
LABEL_3:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v37 != v14) {
        objc_enumerationMutation(v11);
      }
      double v16 = *(void **)(*((void *)&v36 + 1) + 8 * v15);
      [v16 frame];
      v44.origin.CGFloat x = v17;
      v44.origin.CGFloat y = v18;
      v44.size.CGFloat width = v19;
      v44.size.CGFloat height = v20;
      v42.origin.CGFloat x = x;
      v42.origin.CGFloat y = y;
      v42.size.CGFloat width = width;
      v42.size.CGFloat height = height;
      if (CGRectContainsRect(v42, v44)) {
        break;
      }
      if (v13 == (id)++v15)
      {
        id v13 = [v11 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v13) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v21 = v16;

    if (v21) {
      goto LABEL_22;
    }
  }
  else
  {
LABEL_9:
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v22 = v11;
  id v21 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v21)
  {
    uint64_t v23 = *(void *)v33;
    while (2)
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v22);
        }
        double v25 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        objc_msgSend(v25, "frame", (void)v32);
        v45.origin.CGFloat x = v26;
        v45.origin.CGFloat y = v27;
        v45.size.CGFloat width = v28;
        v45.size.CGFloat height = v29;
        v43.origin.CGFloat x = x;
        v43.origin.CGFloat y = y;
        v43.size.CGFloat width = width;
        v43.size.CGFloat height = height;
        if (CGRectIntersectsRect(v43, v45))
        {
          id v21 = v25;
          goto LABEL_21;
        }
      }
      id v21 = [v22 countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
LABEL_21:

LABEL_22:
  unsigned __int8 v30 = objc_msgSend(v21, "setNativeFocus", (void)v32);
  AXOverrideRequestingClientType();

  return v30;
}

- (void)_handleFirstResponderChangedNotification
{
  objc_super v3 = [(ZWSmartZoomManager *)self _elementForFocus];
  [(ZWSmartZoomManager *)self setFocusElement:v3];

  uint64_t v4 = [(ZWSmartZoomManager *)self focusElement];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(ZWSmartZoomManager *)self delegate];
    unsigned __int8 v7 = [v6 isZoomInStandByModeWithSmartZoom:self];

    if ((v7 & 1) == 0)
    {
      id v8 = [(ZWSmartZoomManager *)self delegate];
      [v8 updateFocusWithSmartZoom:self];
    }
  }
}

- (void)_handleNativeFocusItemChangedNotification:(void *)a3
{
  CFTypeID v5 = CFGetTypeID(a3);
  if (v5 == CFDictionaryGetTypeID())
  {
    v6 = [a3 objectForKeyedSubscript:kAXElementKey];
    unsigned __int8 v7 = v6;
    if (v6)
    {
      CFTypeID v8 = CFGetTypeID(v6);
      if (v8 == AXUIElementGetTypeID())
      {
        id v9 = [objc_alloc((Class)AXElement) initWithAXUIElement:v7];
        [(ZWSmartZoomManager *)self setFocusElement:v9];
      }
    }
  }
  double v10 = [(ZWSmartZoomManager *)self focusElement];

  if (!v10)
  {
    id v11 = [(ZWSmartZoomManager *)self _elementForFocus];
    [(ZWSmartZoomManager *)self setFocusElement:v11];
  }
  uint64_t v12 = [(ZWSmartZoomManager *)self focusElement];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = [(ZWSmartZoomManager *)self delegate];
    unsigned __int8 v15 = [v14 isZoomInStandByModeWithSmartZoom:self];

    if ((v15 & 1) == 0)
    {
      id v16 = [(ZWSmartZoomManager *)self delegate];
      [v16 updateFocusWithSmartZoom:self];
    }
  }
}

- (void)_handleUpdateElementVisualsNotification
{
  AXOverrideRequestingClientType();
  objc_super v3 = [(ZWSmartZoomManager *)self focusElement];
  uint64_t v4 = [v3 uiElement];
  [v4 updateCache:2149];

  AXOverrideRequestingClientType();
  uint64_t v5 = [(ZWSmartZoomManager *)self focusElement];
  if (v5)
  {
    v6 = (void *)v5;
    unsigned __int8 v7 = [(ZWSmartZoomManager *)self delegate];
    unsigned __int8 v8 = [v7 isZoomInStandByModeWithSmartZoom:self];

    if ((v8 & 1) == 0)
    {
      id v9 = [(ZWSmartZoomManager *)self delegate];
      [v9 updateFocusWithSmartZoom:self];
    }
  }
}

- (void)_updateApplicationAccessibility:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = _AXSApplicationAccessibilityEnabled();
  if (v3 && !v4 || !v3 && v4 && _AXSCanDisableApplicationAccessibility())
  {
    _AXSApplicationAccessibilitySetEnabled();
  }
}

- (void)_initializeAccessibility
{
  [(ZWSmartZoomManager *)self _updateApplicationAccessibility:1];
  AXUIElementRegisterSystemWideServerDeathCallback();
  BOOL v3 = +[AXElement systemWideElement];
  int v4 = [v3 uiElement];
  uint64_t v5 = (const __AXUIElement *)[v4 axElement];

  pid_t pid = 0;
  AXUIElementGetPid(v5, &pid);
  accessibilityRuntimeObserver = self->_accessibilityRuntimeObserver;
  if (!accessibilityRuntimeObserver)
  {
    if (AXObserverCreate(pid, (AXObserverCallback)_handleAccessibilityRuntimeEvent, &self->_accessibilityRuntimeObserver))
    {
      LOBYTE(v11) = 1;
      CFStringRef v12 = @"Failed to create an accessibility event observer: %ld";
      goto LABEL_7;
    }
    accessibilityRuntimeObserver = self->_accessibilityRuntimeObserver;
  }
  CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource(accessibilityRuntimeObserver);
  if (RunLoopSource)
  {
    unsigned __int8 v8 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v8, kCFRunLoopDefaultMode);
    return;
  }
  CFStringRef v12 = @"Failed to get the observer run loop source";
  LOBYTE(v11) = 1;
LABEL_7:
  _AXLogWithFacility();
  [(ZWSmartZoomManager *)self _accessibilitySystemServerDied];
}

- (id)_accessibilityRuntimeNotifications
{
  return &__NSArray0__struct;
}

- (void)_registerForAccessibilityRuntimeNotifications
{
  LOBYTE(v16) = 1;
  _AXLogWithFacility();
  BOOL v3 = +[AXElement systemWideElement];
  int v4 = [v3 uiElement];
  uint64_t v5 = (const __AXUIElement *)[v4 axElement];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v6 = [(ZWSmartZoomManager *)self _accessibilityRuntimeNotifications];
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    char v9 = 0;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v6);
        }
        CFStringRef v12 = (const __CFString *)objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "intValue", v17, v18, v19, v20);
        int v13 = (int)v12;
        AXError v14 = AXObserverAddNotification(self->_accessibilityRuntimeObserver, v5, v12, self);
        if (v14)
        {
          CFStringRef v18 = @"Zoom could not register for notification:%ld. Error:%ld";
          uint64_t v19 = v13;
          char v9 = 1;
          LOBYTE(v17) = 1;
          uint64_t v20 = v14;
        }
        else
        {
          CFStringRef v18 = @"Zoom did register for ax notification: %ld";
          uint64_t v19 = v13;
          LOBYTE(v17) = 1;
        }
        _AXLogWithFacility();
      }
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);

    if (v9)
    {
      dispatch_time_t v15 = dispatch_time(0, 1000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = __67__ZWSmartZoomManager__registerForAccessibilityRuntimeNotifications__block_invoke;
      block[3] = &unk_78CA8;
      block[4] = self;
      dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
  }
}

id __67__ZWSmartZoomManager__registerForAccessibilityRuntimeNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForAccessibilityRuntimeNotifications];
}

- (void)_unregisterForAccessibilityRuntimeNotifications
{
  LOBYTE(v16) = 1;
  _AXLogWithFacility();
  BOOL v3 = +[AXElement systemWideElement];
  int v4 = [v3 uiElement];
  uint64_t v5 = (const __AXUIElement *)[v4 axElement];

  v6 = +[AXElement systemWideElement];
  [v6 setPassivelyListeningForEvents:1];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = [(ZWSmartZoomManager *)self _accessibilityRuntimeNotifications];
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        CFStringRef v12 = (const __CFString *)objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * (void)v11), "intValue", v17, v18, v19, v20);
        uint64_t v13 = AXObserverRemoveNotification(self->_accessibilityRuntimeObserver, v5, v12);
        if (v13)
        {
          uint64_t v14 = v13;
          dispatch_time_t v15 = +[NSNumber numberWithInt:v12];
          +[NSNumber numberWithInt:v14];
          v20 = uint64_t v19 = v15;
          CFStringRef v18 = @"Zoom could not unregister for notification:%@. Error:%@";
          LOBYTE(v17) = 1;
          _AXLogWithFacility();
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }
}

- (void)_accessibilitySystemServerDied
{
  LOBYTE(v3) = 1;
  _AXLogWithFacility();
  if (self->_accessibilityRuntimeObserver)
  {
    [(ZWSmartZoomManager *)self _unregisterForAccessibilityRuntimeNotifications];
    CFRelease(self->_accessibilityRuntimeObserver);
    self->_accessibilityRuntimeObserver = 0;
  }
  AXPerformBlockOnMainThreadAfterDelay();
}

id __52__ZWSmartZoomManager__accessibilitySystemServerDied__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _initializeAccessibility];
}

- (ZWSmartZoomDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ZWSmartZoomDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (__AXObserver)accessibilityRuntimeObserver
{
  return self->_accessibilityRuntimeObserver;
}

- (void)setAccessibilityRuntimeObserver:(__AXObserver *)a3
{
  self->_accessibilityRuntimeObserver = a3;
}

- (AXElement)focusElement
{
  return self->_focusElement;
}

- (void)setFocusElement:(id)a3
{
}

- (AVSpeechSynthesizer)synthesizer
{
  return self->_synthesizer;
}

- (void)setSynthesizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synthesizer, 0);
  objc_storeStrong((id *)&self->_focusElement, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end