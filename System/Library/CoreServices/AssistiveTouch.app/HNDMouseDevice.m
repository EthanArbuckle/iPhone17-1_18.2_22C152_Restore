@interface HNDMouseDevice
- (AXCustomizableMouse)mouse;
- (BOOL)handleHIDEvent:(id)a3;
- (BOOL)load;
- (HNDMouseDevice)init;
- (id)actionOverrideForUsagePage:(unsigned int)a3 usage:(unsigned int)a4;
- (id)description;
- (void)_setupAXMouseListener;
- (void)_updateAXMouse;
- (void)_updateSensitivityMultiplier;
- (void)dealloc;
- (void)overrideCustomizableMouse:(id)a3;
- (void)updateMouseService:(__IOHIDServiceClient *)a3;
@end

@implementation HNDMouseDevice

- (HNDMouseDevice)init
{
  v16.receiver = self;
  v16.super_class = (Class)HNDMouseDevice;
  v2 = [(HNDMouseDevice *)&v16 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [v3 setWantsKeyboardEvents:1];
    [v3 setWantsMouseEvents:1];
    v4 = +[AXEventTapManager sharedManager];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000613B0;
    v14[3] = &unk_1001AAD28;
    v15 = v2;
    v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    v11 = sub_1000613BC;
    v12 = &unk_1001ACA88;
    v5 = v15;
    v13 = v5;
    id v6 = [v4 installEventTap:v14 identifier:@"HNDMouseDevice" type:1 skipDeviceMatching:0 filterEvents:v3 matchingServiceHandler:&v9];

    v7 = +[AXEventTapManager sharedManager];
    [v7 setEventTapPriority:@"HNDMouseDevice" priority:25];

    v5->_lastButtonMask = 0;
    if (_AXSInUnitTestMode()) {
      [(HNDMouseDevice *)v5 _updateSensitivityMultiplier];
    }
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[AXEventTapManager sharedManager];
  [v3 removeEventTap:@"HNDMouseDevice"];

  v4.receiver = self;
  v4.super_class = (Class)HNDMouseDevice;
  [(HNDDevice *)&v4 dealloc];
}

- (id)description
{
  if (self->super._hidDevice)
  {
    v8.receiver = self;
    v8.super_class = (Class)HNDMouseDevice;
    v3 = [(HNDDevice *)&v8 description];
    CFTypeRef Property = IOHIDDeviceGetProperty(self->super._hidDevice, @"UniqueID");
    v5 = +[NSString stringWithFormat:@"%@ - %@ - %@", v3, Property, IOHIDDeviceGetProperty(self->super._hidDevice, @"PhysicalDeviceUniqueID")];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HNDMouseDevice;
    v5 = [(HNDDevice *)&v7 description];
  }

  return v5;
}

- (void)_setupAXMouseListener
{
  [(HNDMouseDevice *)self _updateAXMouse];
  objc_initWeak(&location, self);
  v3 = +[AXSettings sharedInstance];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000616B8;
  v7[3] = &unk_1001AAA68;
  objc_copyWeak(&v8, &location);
  [v3 registerUpdateBlock:v7 forRetrieveSelector:"assistiveTouchMouseCustomizedClickActions" withListener:self];

  objc_destroyWeak(&v8);
  objc_super v4 = +[AXSettings sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000616F8;
  v5[3] = &unk_1001AAA68;
  objc_copyWeak(&v6, &location);
  [v4 registerUpdateBlock:v5 forRetrieveSelector:"assistiveTouchSpeed" withListener:self];

  objc_destroyWeak(&v6);
  [(HNDMouseDevice *)self _updateSensitivityMultiplier];
  objc_destroyWeak(&location);
}

- (BOOL)load
{
  BOOL isLoaded = self->super._isLoaded;
  v8.receiver = self;
  v8.super_class = (Class)HNDMouseDevice;
  unsigned int v4 = [(HNDDevice *)&v8 load];
  BOOL v5 = v4;
  if (!isLoaded && v4 != 0) {
    [(HNDMouseDevice *)self _setupAXMouseListener];
  }
  return v5;
}

- (void)_updateAXMouse
{
  v2 = self;
  if (self->super._hidDevice)
  {
    +[AXCustomizableMouse mouseForHIDDevice:](AXCustomizableMouse, "mouseForHIDDevice:");
    self = (HNDMouseDevice *)objc_claimAutoreleasedReturnValue();
    mouse = v2->_mouse;
    v2->_mouse = (AXCustomizableMouse *)self;
  }
  else
  {
    mouse = self->_mouse;
    self->_mouse = 0;
  }

  _objc_release_x1(self, mouse);
}

- (void)_updateSensitivityMultiplier
{
  id v4 = +[AXSettings sharedInstance];
  [v4 assistiveTouchSpeed];
  self->_sensitivityMultiplier = v3;
}

- (BOOL)handleHIDEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 senderID];
  if (v5 == (id)+[HNDVirtualHIDMouse eventServiceID]
    && !_AXSInUnitTestMode())
  {
    goto LABEL_10;
  }
  if ([v4 type] != 3200)
  {
    if ([v4 type] == 1100)
    {
      id v17 = [objc_allocWithZone((Class)HNDEvent) init];
      [v17 setType:4];
      objc_msgSend(v17, "setDeltaY:", (double)((uint64_t)objc_msgSend(v4, "scrollAmount") + (uint64_t)objc_msgSend(v4, "scrollAccelAmount")));
      if (v17) {
        goto LABEL_18;
      }
    }
    goto LABEL_10;
  }
  id v6 = [v4 pointerControllerInfo];
  objc_super v7 = v6;
  if (!v6)
  {
    id v17 = 0;
    goto LABEL_17;
  }
  [v6 pointerButtonMask];
  LODWORD(v8) = self->_lastButtonMask;
  if (v9 == (double)v8)
  {
    id v17 = [objc_allocWithZone((Class)HNDEvent) init];
    [v17 setType:3];
    [v7 pointerX];
    double v22 = v21;
    [v7 pointerAccelX];
    [v17 setDeltaX:(v22 + v23) * self->_sensitivityMultiplier];
    [v7 pointerY];
    double v25 = v24;
    [v7 pointerAccelY];
    [v17 setDeltaY:(v25 + v26) * self->_sensitivityMultiplier];
    goto LABEL_17;
  }
  unsigned int lastButtonMask = self->_lastButtonMask;
  [v7 pointerButtonMask];
  v13 = sub_1000423E0(lastButtonMask, v12);
  v14 = [v13 upButton];
  v15 = [v13 downButton];
  id v16 = [objc_allocWithZone((Class)HNDEvent) init];
  id v17 = v16;
  if (v14)
  {
    uint64_t v18 = 2;
    v19 = v14;
LABEL_15:
    [v16 setType:v18];
    objc_msgSend(v17, "setButtonNumber:", objc_msgSend(v19, "integerValue"));
    goto LABEL_16;
  }
  if (v15)
  {
    uint64_t v18 = 1;
    v19 = v15;
    goto LABEL_15;
  }
LABEL_16:
  v27 = -[HNDMouseDevice actionOverrideForUsagePage:usage:](self, "actionOverrideForUsagePage:usage:", 9, [v17 buttonNumber]);
  [v17 setActionOverride:v27];

  [v7 pointerButtonMask];
  self->_unsigned int lastButtonMask = v28;
LABEL_17:

  if (v17)
  {
LABEL_18:
    v29 = [(HNDDevice *)self delegate];
    [v29 device:self didPostEvent:v17];

    BOOL v20 = 1;
    goto LABEL_19;
  }
LABEL_10:
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (void)updateMouseService:(__IOHIDServiceClient *)a3
{
  if ((sub_100041014() & 1) == 0
    && (IOHIDServiceClientConformsTo(a3, 1u, 1u) || IOHIDServiceClientConformsTo(a3, 1u, 2u)))
  {
    IOHIDServiceClientSetProperty(a3, @"HIDMouseAcceleration", &off_1001BB1D0);
    IOHIDServiceClientSetProperty(a3, @"HIDMouseScrollAcceleration", &off_1001BB1D0);
  }
}

- (id)actionOverrideForUsagePage:(unsigned int)a3 usage:(unsigned int)a4
{
  if (a3 == 9)
  {
    uint64_t v4 = *(void *)&a4;
    uint64_t v6 = a4;
    objc_super v7 = [(HNDMouseDevice *)self mouse];
    unint64_t v8 = [v7 customActionForButtonNumber:v6];

    if (v8)
    {
      id v9 = v8;
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)HNDMouseDevice;
      id v9 = [(HNDDevice *)&v12 actionOverrideForUsagePage:9 usage:v4];
    }
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)overrideCustomizableMouse:(id)a3
{
}

- (AXCustomizableMouse)mouse
{
  return self->_mouse;
}

- (void).cxx_destruct
{
}

@end